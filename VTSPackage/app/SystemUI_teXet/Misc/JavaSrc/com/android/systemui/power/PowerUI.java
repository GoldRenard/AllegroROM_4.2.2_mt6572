// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.power;

import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.media.*;
import android.net.Uri;
import android.os.*;
import android.util.Slog;
import android.view.View;
import android.view.Window;
import android.widget.TextView;
import com.android.systemui.SystemUI;
import com.android.systemui.media.NotificationPlayer;
import com.mediatek.xlog.Xlog;
import java.io.*;
import java.util.Arrays;

public class PowerUI extends SystemUI
{
    private class BatteryHandler extends Handler
    {

        final PowerUI this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 10: // '\n'
                AudioManager audiomanager = (AudioManager)mContext.getSystemService("audio");
                String s = findTestFile("battery");
                if (mNP == null)
                    mNP = new NotificationPlayer("StatusBarPolicy");
                if (s != null)
                {
                    mMediaPlayerInUse = true;
                    File file = new File((new StringBuilder()).append("/system/media/audio/ui/").append(s).toString());
                    if (audiomanager.getStreamVolume(1) != 0)
                    {
                        Xlog.d("PowerUI", (new StringBuilder()).append("handleMessage, soundFile=").append(file).toString());
                        mNP.play(mContext, Uri.fromFile(file), false, 1);
                        return;
                    }
                } else
                {
                    mMediaPlayerInUse = false;
                    if (mToneGenerator != null)
                    {
                        mToneGenerator.startTone(44);
                        return;
                    }
                }
                break;
            }
        }

        private BatteryHandler()
        {
            this$0 = PowerUI.this;
            super();
        }

    }


    static final boolean DEBUG = false;
    private static final int EVENT_LOW_BATTERY_WARN_SOUND = 10;
    private static final String SOUNDDIRECTORY = "/system/media/audio/ui/";
    static final String TAG = "PowerUI";
    int mBatteryLevel;
    TextView mBatteryLevelTextView;
    int mBatteryStatus;
    Handler mHandler;
    private boolean mHideLowBDialog;
    private boolean mInBatteryLow;
    private BroadcastReceiver mIntentReceiver;
    int mInvalidCharger;
    AlertDialog mInvalidChargerDialog;
    int mLowBatteryAlertCloseLevel;
    AlertDialog mLowBatteryDialog;
    int mLowBatteryReminderLevels[];
    private boolean mMediaPlayerInUse;
    private NotificationPlayer mNP;
    int mPlugType;
    private ToneGenerator mToneGenerator;

    public PowerUI()
    {
        mHandler = new BatteryHandler();
        mBatteryLevel = 100;
        mBatteryStatus = 1;
        mPlugType = 0;
        mInvalidCharger = 0;
        mLowBatteryReminderLevels = new int[2];
        mIntentReceiver = new BroadcastReceiver() {

            final PowerUI this$0;

            public void onReceive(Context context, Intent intent)
            {
label0:
                {
                    String s;
label1:
                    {
                        s = intent.getAction();
                        Xlog.d("PowerUI", (new StringBuilder()).append("action = ").append(s).toString());
                        if (s.equals("android.intent.action.BATTERY_CHANGED"))
                        {
                            String s2 = SystemProperties.get("sys.boot.reason");
                            boolean flag;
                            if (s2 != null && s2.equals("1"))
                                flag = true;
                            else
                                flag = false;
                            Xlog.d("PowerUI", (new StringBuilder()).append("Intent start() ret = ").append(flag).append(" mHideLowBDialog= ").append(mHideLowBDialog).toString());
                            if (!flag || !mHideLowBDialog)
                            {
                                int i = mBatteryLevel;
                                mBatteryLevel = intent.getIntExtra("level", 100);
                                Xlog.d("PowerUI", (new StringBuilder()).append("oldBatteryLevel = ").append(i).append("mBatteryLevel = ").append(mBatteryLevel).toString());
                                int _tmp = mBatteryStatus;
                                mBatteryStatus = intent.getIntExtra("status", 1);
                                int j = mPlugType;
                                mPlugType = intent.getIntExtra("plugged", 1);
                                int k = mInvalidCharger;
                                mInvalidCharger = intent.getIntExtra("invalid_charger", 0);
                                boolean flag1;
                                if (mPlugType != 0)
                                    flag1 = true;
                                else
                                    flag1 = false;
                                boolean flag2;
                                if (j != 0)
                                    flag2 = true;
                                else
                                    flag2 = false;
                                if (mInBatteryLow && mMediaPlayerInUse && flag1 && mNP != null)
                                    mNP.stop();
                                int l = findBatteryLevelBucket(i);
                                int i1 = findBatteryLevelBucket(mBatteryLevel);
                                if (k == 0 && mInvalidCharger != 0)
                                {
                                    Slog.d("PowerUI", "showing invalid charger warning");
                                    showInvalidChargerDialog();
                                    return;
                                }
                                if (k != 0 && mInvalidCharger == 0)
                                {
                                    Xlog.d("PowerUI", "dismissInvalidChargerDialog");
                                    dismissInvalidChargerDialog();
                                } else
                                if (mInvalidChargerDialog != null)
                                    return;
                                if (!flag1 && (i1 < l || flag2) && mBatteryStatus != 1 && i1 < 0)
                                {
                                    showLowBatteryWarning();
                                    if (i1 != l || flag2)
                                    {
                                        Xlog.d("PowerUI", "playLowBatterySound1");
                                        playLowBatterySound();
                                        return;
                                    }
                                } else
                                if (!flag1 && (i1 <= l || i1 <= 0))
                                {
                                    if (mBatteryLevelTextView != null)
                                    {
                                        showLowBatteryWarning();
                                        return;
                                    }
                                } else
                                {
                                    Xlog.d("PowerUI", "dismissLowBatteryWarning");
                                    dismissLowBatteryWarning();
                                    mNP.stop();
                                    return;
                                }
                            }
                        } else
                        {
                            if (s.equals("android.intent.action.BATTERY_LOW"))
                            {
                                mInBatteryLow = true;
                                return;
                            }
                            if (s.equals("android.intent.action.BATTERY_OKAY") || s.equals("android.intent.action.ACTION_POWER_CONNECTED"))
                                break label0;
                            if (!"android.intent.action.CONFIGURATION_CHANGED".equals(s))
                                break label1;
                            if (mLowBatteryDialog != null && mLowBatteryDialog.isShowing())
                            {
                                Context context1 = mContext;
                                Object aobj[] = new Object[1];
                                aobj[0] = Integer.valueOf(mBatteryLevel);
                                String s1 = context1.getString(0x7f0b0039, aobj);
                                if (mBatteryLevelTextView != null)
                                {
                                    mBatteryLevelTextView.setText(s1);
                                    return;
                                } else
                                {
                                    View view = View.inflate(mContext, 0x7f040001, null);
                                    mBatteryLevelTextView = (TextView)view.findViewById(0x7f08000a);
                                    mBatteryLevelTextView.setText(s1);
                                    return;
                                }
                            }
                        }
                        return;
                    }
                    if (s.equals("android.intent.action.normal.boot"))
                    {
                        Xlog.d("PowerUI", (new StringBuilder()).append("Intent android.intent.action.normal.boot mHideLowBDialog = ").append(mHideLowBDialog).toString());
                        mHideLowBDialog = false;
                        return;
                    }
                    if (s.equals("android.intent.action.ACTION_SHUTDOWN_IPO"))
                    {
                        Xlog.d("PowerUI", (new StringBuilder()).append("Intent android.intent.action.ACTION_SHUTDOWN_IPO mHideLowBDialog = ").append(mHideLowBDialog).toString());
                        mHideLowBDialog = true;
                        mBatteryLevel = 100;
                        dismissLowBatteryWarning();
                        return;
                    } else
                    {
                        Slog.w("PowerUI", (new StringBuilder()).append("unknown intent: ").append(intent).toString());
                        return;
                    }
                }
                mInBatteryLow = false;
            }

            
            {
                this$0 = PowerUI.this;
                super();
            }
        }
;
        mHideLowBDialog = true;
        mToneGenerator = new ToneGenerator(1, 100);
        mNP = new NotificationPlayer("StatusBarPolicy");
        mInBatteryLow = false;
        mMediaPlayerInUse = false;
    }

    private int findBatteryLevelBucket(int i)
    {
        int k;
        if (i >= mLowBatteryAlertCloseLevel)
        {
            k = 1;
        } else
        {
            int j = mLowBatteryReminderLevels[0];
            k = 0;
            if (i <= j)
            {
                for (int l = -1 + mLowBatteryReminderLevels.length; l >= 0; l--)
                    if (i <= mLowBatteryReminderLevels[l])
                        return -1 - l;

                throw new RuntimeException("not possible!");
            }
        }
        return k;
    }

    private String findTestFile(final String name)
    {
        Xlog.d("PowerUI", (new StringBuilder()).append("findTestFile, name=").append(name).toString());
        File afile[] = (new File("/system/media/audio/ui/")).listFiles(new FilenameFilter() {

            final PowerUI this$0;
            final String val$name;

            public boolean accept(File file1, String s)
            {
                return s.startsWith(name);
            }

            
            {
                this$0 = PowerUI.this;
                name = s;
                super();
            }
        }
);
        if (afile.length > 0)
        {
            File file = afile[0];
            for (int i = 1; i < afile.length; i++)
                if (afile[i].lastModified() < file.lastModified())
                    file = afile[i];

            return file.getName();
        } else
        {
            Xlog.d("PowerUI", "return = null");
            return null;
        }
    }

    void dismissInvalidChargerDialog()
    {
        if (mInvalidChargerDialog != null)
            mInvalidChargerDialog.dismiss();
    }

    void dismissLowBatteryWarning()
    {
        if (mLowBatteryDialog != null)
        {
            Slog.i("PowerUI", (new StringBuilder()).append("closing low battery warning: level=").append(mBatteryLevel).toString());
            mLowBatteryDialog.dismiss();
        }
    }

    public void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        printwriter.print("mLowBatteryAlertCloseLevel=");
        printwriter.println(mLowBatteryAlertCloseLevel);
        printwriter.print("mLowBatteryReminderLevels=");
        printwriter.println(Arrays.toString(mLowBatteryReminderLevels));
        printwriter.print("mInvalidChargerDialog=");
        String s;
        if (mInvalidChargerDialog == null)
            s = "null";
        else
            s = mInvalidChargerDialog.toString();
        printwriter.println(s);
        printwriter.print("mLowBatteryDialog=");
        String s1;
        if (mLowBatteryDialog == null)
            s1 = "null";
        else
            s1 = mLowBatteryDialog.toString();
        printwriter.println(s1);
        printwriter.print("mBatteryLevel=");
        printwriter.println(Integer.toString(mBatteryLevel));
        printwriter.print("mBatteryStatus=");
        printwriter.println(Integer.toString(mBatteryStatus));
        printwriter.print("mPlugType=");
        printwriter.println(Integer.toString(mPlugType));
        printwriter.print("mInvalidCharger=");
        printwriter.println(Integer.toString(mInvalidCharger));
        printwriter.print("bucket: ");
        printwriter.println(Integer.toString(findBatteryLevelBucket(mBatteryLevel)));
    }

    void playLowBatterySound()
    {
        Xlog.d("PowerUI", "playLowBatterySound");
        Message message = Message.obtain();
        message.what = 10;
        mHandler.sendMessage(message);
        android.content.ContentResolver contentresolver = super.mContext.getContentResolver();
        if (android.provider.Settings.Global.getInt(contentresolver, "power_sounds_enabled", 1) == 1)
        {
            String s = android.provider.Settings.Global.getString(contentresolver, "low_battery_sound");
            if (s != null)
            {
                Uri uri = Uri.parse((new StringBuilder()).append("file://").append(s).toString());
                if (uri != null)
                {
                    Ringtone ringtone = RingtoneManager.getRingtone(super.mContext, uri);
                    if (ringtone != null && mNP == null)
                    {
                        ringtone.setStreamType(1);
                        ringtone.play();
                    }
                }
            }
        }
    }

    void showInvalidChargerDialog()
    {
        Slog.d("PowerUI", "showing invalid charger dialog");
        dismissLowBatteryWarning();
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(super.mContext);
        builder.setCancelable(true);
        builder.setMessage(0x7f0b0053);
        builder.setIconAttribute(0x1010355);
        builder.setPositiveButton(0x104000a, null);
        AlertDialog alertdialog = builder.create();
        alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final PowerUI this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                mInvalidChargerDialog = null;
                mBatteryLevelTextView = null;
            }

            
            {
                this$0 = PowerUI.this;
                super();
            }
        }
);
        alertdialog.getWindow().setType(2003);
        alertdialog.show();
        mInvalidChargerDialog = alertdialog;
    }

    void showLowBatteryWarning()
    {
        StringBuilder stringbuilder = new StringBuilder();
        String s;
        if (mBatteryLevelTextView == null)
            s = "showing";
        else
            s = "updating";
        Slog.i("PowerUI", stringbuilder.append(s).append(" low battery warning: level=").append(mBatteryLevel).append(" [").append(findBatteryLevelBucket(mBatteryLevel)).append("]").toString());
        Context context = super.mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(mBatteryLevel);
        String s1 = context.getString(0x7f0b0039, aobj);
        if (mBatteryLevelTextView != null)
        {
            mBatteryLevelTextView.setText(s1);
            return;
        }
        View view = View.inflate(super.mContext, 0x7f040001, null);
        mBatteryLevelTextView = (TextView)view.findViewById(0x7f08000a);
        mBatteryLevelTextView.setText(s1);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(super.mContext);
        builder.setCancelable(true);
        builder.setTitle(0x7f0b0036);
        builder.setView(view);
        builder.setIconAttribute(0x1010355);
        builder.setPositiveButton(0x104000a, null);
        final Intent intent = new Intent("android.intent.action.POWER_USAGE_SUMMARY");
        intent.setFlags(0x58800000);
        if (intent.resolveActivity(super.mContext.getPackageManager()) != null)
            builder.setNegativeButton(0x7f0b0038, new android.content.DialogInterface.OnClickListener() {

                final PowerUI this$0;
                final Intent val$intent;

                public void onClick(DialogInterface dialoginterface, int i)
                {
                    mContext.startActivityAsUser(intent, UserHandle.CURRENT);
                    dismissLowBatteryWarning();
                }

            
            {
                this$0 = PowerUI.this;
                intent = intent1;
                super();
            }
            }
);
        AlertDialog alertdialog = builder.create();
        alertdialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final PowerUI this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                mLowBatteryDialog = null;
                mBatteryLevelTextView = null;
            }

            
            {
                this$0 = PowerUI.this;
                super();
            }
        }
);
        alertdialog.getWindow().setType(2003);
        android.view.WindowManager.LayoutParams layoutparams = alertdialog.getWindow().getAttributes();
        layoutparams.privateFlags = 0x10 | layoutparams.privateFlags;
        alertdialog.show();
        mLowBatteryDialog = alertdialog;
    }

    public void start()
    {
        mLowBatteryAlertCloseLevel = super.mContext.getResources().getInteger(0x10e001b);
        mLowBatteryReminderLevels[0] = super.mContext.getResources().getInteger(0x10e001a);
        mLowBatteryReminderLevels[1] = super.mContext.getResources().getInteger(0x10e0018);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        intentfilter.addAction("android.intent.action.ACTION_POWER_CONNECTED");
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.normal.boot");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        super.mContext.registerReceiver(mIntentReceiver, intentfilter, null, mHandler);
    }



/*
    static boolean access$102(PowerUI powerui, boolean flag)
    {
        powerui.mHideLowBDialog = flag;
        return flag;
    }

*/



/*
    static boolean access$202(PowerUI powerui, boolean flag)
    {
        powerui.mInBatteryLow = flag;
        return flag;
    }

*/



/*
    static boolean access$302(PowerUI powerui, boolean flag)
    {
        powerui.mMediaPlayerInUse = flag;
        return flag;
    }

*/



/*
    static NotificationPlayer access$402(PowerUI powerui, NotificationPlayer notificationplayer)
    {
        powerui.mNP = notificationplayer;
        return notificationplayer;
    }

*/



}
