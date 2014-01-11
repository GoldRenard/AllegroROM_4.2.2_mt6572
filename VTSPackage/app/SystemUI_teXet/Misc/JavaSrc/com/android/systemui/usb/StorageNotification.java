// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.os.storage.*;
import android.util.Slog;
import com.android.internal.app.ExternalMediaFormatActivity;
import com.mediatek.xlog.SXlog;
import java.util.HashSet;

// Referenced classes of package com.android.systemui.usb:
//            UsbStorageActivity

public class StorageNotification extends StorageEventListener
{

    private static final boolean POP_UMS_ACTIVITY_ON_CONNECT = true;
    private static final String TAG = "StorageNotification";
    private static int notifyid = 0;
    private boolean mAlarmBootOff;
    private Handler mAsyncEventHandler;
    private Context mContext;
    private final BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {

        final StorageNotification this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s4 = intent.getAction();
            if (s4.equals("android.intent.action.ACTION_SHUTDOWN_IPO"))
            {
                SXlog.d("StorageNotification", "onReceive [ACTION_SHUTDOWN_IPO] - [Clear mUsbNotifications]");
                mUsbNotifications.clear();
            }
            if (s4.equals("android.intent.action.normal.boot.done"))
            {
                boolean flag1 = mStorageManager.isUsbMassStorageConnected();
                SXlog.d("StorageNotification", (new StringBuilder()).append("onReceive [ACTION_NORMAL_BOOT] - connected: ").append(flag1).toString());
                mAlarmBootOff = true;
                onUsbMassStorageConnectionChanged(flag1);
            }
        }

            
            {
                this$0 = StorageNotification.this;
                super();
            }
    }
;
    private boolean mIsLastVisible;
    private boolean mLastConnected;
    private String mLastState;
    private Notification mMediaStorageNotification;
    private Notification mMediaStorageNotificationForExtStorage;
    private Notification mMediaStorageNotificationForExtUsbOtg;
    private StorageManager mStorageManager;
    private boolean mUmsAvailable;
    private HashSet mUsbNotifications;
    private Notification mUsbStorageNotification;

    public StorageNotification(Context context)
    {
        mAlarmBootOff = false;
        mIsLastVisible = false;
        mContext = context;
        mStorageManager = (StorageManager)context.getSystemService("storage");
        boolean flag = mStorageManager.isUsbMassStorageConnected();
        String s = "";
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        for (int i = 0; i < astoragevolume.length; i++)
            if (astoragevolume[i].allowMassStorage() && !astoragevolume[i].isEmulated())
            {
                String s3 = astoragevolume[i].getPath();
                s = mStorageManager.getVolumeState(s3);
            }

        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.normal.boot.done");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        mContext.registerReceiver(mIntentReceiver, intentfilter);
        Object aobj[] = new Object[2];
        aobj[0] = Boolean.valueOf(mUmsAvailable);
        aobj[1] = s;
        Slog.d("StorageNotification", String.format("Startup with UMS connection %s (media state %s)", aobj));
        HandlerThread handlerthread = new HandlerThread("SystemUI StorageNotification");
        handlerthread.start();
        mAsyncEventHandler = new Handler(handlerthread.getLooper());
        mUsbNotifications = new HashSet();
        mLastState = "mounted";
        mLastConnected = false;
        onUsbMassStorageConnectionChanged(flag);
        for (int j = 0; j < astoragevolume.length; j++)
        {
            String s1 = astoragevolume[j].getPath();
            String s2 = mStorageManager.getVolumeState(s1);
            Slog.d("StorageNotification", (new StringBuilder()).append("onStorageStateChanged - sharePath: ").append(s1).append(" shareState: ").append(s2).toString());
            if (s2.equals("unmountable"))
                onStorageStateChanged(s1, s2, s2);
        }

    }

    private static boolean containsFunction(String s, String s1)
    {
        int i = s.indexOf(s1);
        if (i >= 0 && (i <= 0 || s.charAt(i - 1) == ','))
        {
            int j = i + s1.length();
            if (j >= s.length() || s.charAt(j) == ',')
                return true;
        }
        return false;
    }

    private boolean getMediaStorageNotificationDismissable()
    {
        this;
        JVM INSTR monitorenter ;
        if (mMediaStorageNotification == null) goto _L2; else goto _L1
_L1:
        int i = mMediaStorageNotification.flags;
        if ((i & 0x10) != 16) goto _L2; else goto _L3
_L3:
        boolean flag = true;
_L5:
        this;
        JVM INSTR monitorexit ;
        return flag;
_L2:
        flag = false;
        if (true) goto _L5; else goto _L4
_L4:
        Exception exception;
        exception;
        throw exception;
    }

    private void onStorageStateChangedAsync(String s, String s1, String s2)
    {
        Slog.i("StorageNotification", String.format("Media {%s} state changed from {%s} -> {%s}", new Object[] {
            s, s1, s2
        }));
        mLastState = s2;
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        int i = 0;
        do
        {
label0:
            {
                int j = astoragevolume.length;
                int k = i;
                StorageVolume storagevolume = null;
                if (k < j)
                {
                    if (!astoragevolume[i].getPath().equals(s))
                        break label0;
                    storagevolume = astoragevolume[i];
                }
                if (storagevolume == null)
                {
                    Slog.e("StorageNotification", String.format("Can NOT find volume by name {%s}", new Object[] {
                        s
                    }));
                    return;
                }
                if (s2.equals("shared"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_SHARED]");
                    Intent intent2 = new Intent();
                    intent2.setClass(mContext, com/android/systemui/usb/UsbStorageActivity);
                    setUsbStorageNotification(0x104043e, 0x104043f, 0x108008a, false, true, PendingIntent.getActivity(mContext, 0, intent2, 0));
                    return;
                }
                if (s2.equals("checking"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_CHECKING]");
                    Resources resources10 = Resources.getSystem();
                    Object aobj10[] = new Object[1];
                    Context context12 = mContext;
                    aobj10[0] = storagevolume.getDescription(context12);
                    setMediaStorageNotification(s, resources10.getString(0x104045c, aobj10), Resources.getSystem().getString(0x104045d), 0x10800ab, true, false, false, null);
                    return;
                }
                if (s2.equals("mounted"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_MOUNTED]");
                    setMediaStorageNotification(s, 0, 0, 0, false, false, false, null);
                    updateUsbMassStorageNotification(mUmsAvailable);
                    return;
                }
                if (s2.equals("unmounted"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]");
                    if (!mStorageManager.isUsbMassStorageEnabled())
                    {
                        SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !mStorageManager.isUsbMassStorageEnabled()");
                        if ("shared".equals(s1))
                        {
                            SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  MEDIA_SHARED");
                            setMediaStorageNotification(s, 0, 0, 0, false, false, false, null);
                            return;
                        }
                        if (Environment.isExternalStorageRemovable())
                        {
                            Resources resources8 = Resources.getSystem();
                            Object aobj8[] = new Object[1];
                            Context context10 = mContext;
                            aobj8[0] = storagevolume.getDescription(context10);
                            String s7 = resources8.getString(0x1040464, aobj8);
                            Resources resources9 = Resources.getSystem();
                            Object aobj9[] = new Object[1];
                            Context context11 = mContext;
                            aobj9[0] = storagevolume.getDescription(context11);
                            setMediaStorageNotification(s, s7, resources9.getString(0x1040465, aobj9), 0x108007a, true, false, true, null);
                        } else
                        {
                            SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !isExternalStorageRemovable");
                            setMediaStorageNotification(s, 0, 0, 0, false, false, false, null);
                        }
                        SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  !MEDIA_SHARED");
                        return;
                    } else
                    {
                        SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTED]  mStorageManager.isUsbMassStorageEnabled()");
                        setMediaStorageNotification(s, 0, 0, 0, false, false, false, null);
                        return;
                    }
                }
                if (s2.equals("nofs"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_NOFS]");
                    Intent intent1 = new Intent();
                    intent1.setClass(mContext, com/android/internal/app/ExternalMediaFormatActivity);
                    intent1.putExtra("PATH", s);
                    Context context7 = mContext;
                    int i1 = notifyid;
                    notifyid = i1 + 1;
                    PendingIntent pendingintent1 = PendingIntent.getActivity(context7, i1, intent1, 0);
                    Resources resources6 = Resources.getSystem();
                    Object aobj6[] = new Object[1];
                    Context context8 = mContext;
                    aobj6[0] = storagevolume.getDescription(context8);
                    String s6 = resources6.getString(0x104045e, aobj6);
                    Resources resources7 = Resources.getSystem();
                    Object aobj7[] = new Object[1];
                    Context context9 = mContext;
                    aobj7[0] = storagevolume.getDescription(context9);
                    setMediaStorageNotification(s, s6, resources7.getString(0x104045f, aobj7), 0x108007b, true, false, false, pendingintent1);
                    updateUsbMassStorageNotification(mUmsAvailable);
                    return;
                }
                if (s2.equals("unmountable"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_UNMOUNTABLE]");
                    Intent intent = new Intent();
                    intent.setClass(mContext, com/android/internal/app/ExternalMediaFormatActivity);
                    intent.putExtra("PATH", s);
                    Context context4 = mContext;
                    int l = notifyid;
                    notifyid = l + 1;
                    PendingIntent pendingintent = PendingIntent.getActivity(context4, l, intent, 0);
                    boolean flag = "/mnt/usbotg".equals(s);
                    boolean flag1 = false;
                    if (flag)
                    {
                        pendingintent = null;
                        flag1 = true;
                    }
                    Resources resources4 = Resources.getSystem();
                    Object aobj4[] = new Object[1];
                    Context context5 = mContext;
                    aobj4[0] = storagevolume.getDescription(context5);
                    String s5 = resources4.getString(0x1040460, aobj4);
                    Resources resources5 = Resources.getSystem();
                    Object aobj5[] = new Object[1];
                    Context context6 = mContext;
                    aobj5[0] = storagevolume.getDescription(context6);
                    setMediaStorageNotification(s, s5, resources5.getString(0x1040461, aobj5), 0x108007b, true, false, flag1, pendingintent);
                    updateUsbMassStorageNotification(mUmsAvailable);
                    return;
                }
                if (s2.equals("removed"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_REMOVED]");
                    Resources resources2 = Resources.getSystem();
                    Object aobj2[] = new Object[1];
                    Context context2 = mContext;
                    aobj2[0] = storagevolume.getDescription(context2);
                    String s4 = resources2.getString(0x1040466, aobj2);
                    Resources resources3 = Resources.getSystem();
                    Object aobj3[] = new Object[1];
                    Context context3 = mContext;
                    aobj3[0] = storagevolume.getDescription(context3);
                    setMediaStorageNotification(s, s4, resources3.getString(0x1040467, aobj3), 0x108007b, true, false, true, null);
                    updateUsbMassStorageNotification(false);
                    return;
                }
                if (s2.equals("bad_removal"))
                {
                    SXlog.d("StorageNotification", "onStorageStateChangedAsync - [MEDIA_BAD_REMOVAL]");
                    Resources resources = Resources.getSystem();
                    Object aobj[] = new Object[1];
                    Context context = mContext;
                    aobj[0] = storagevolume.getDescription(context);
                    String s3 = resources.getString(0x1040462, aobj);
                    Resources resources1 = Resources.getSystem();
                    Object aobj1[] = new Object[1];
                    Context context1 = mContext;
                    aobj1[0] = storagevolume.getDescription(context1);
                    setMediaStorageNotification(s, s3, resources1.getString(0x1040463, aobj1), 0x108008a, true, true, true, null);
                    updateUsbMassStorageNotification(false);
                    return;
                } else
                {
                    Slog.w("StorageNotification", String.format("Ignoring unknown state {%s}", new Object[] {
                        s2
                    }));
                    return;
                }
            }
            i++;
        } while (true);
    }

    private void onUsbMassStorageConnectionChangedAsync(boolean flag)
    {
        mUmsAvailable = flag;
        String s = "";
        String s1 = "";
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        int i = 0;
        do
        {
label0:
            {
                if (i < astoragevolume.length)
                {
                    if (!astoragevolume[i].allowMassStorage() || astoragevolume[i].isEmulated())
                        break label0;
                    s1 = astoragevolume[i].getPath();
                    s = mStorageManager.getVolumeState(s1);
                }
                Object aobj[] = new Object[3];
                aobj[0] = Boolean.valueOf(flag);
                aobj[1] = s;
                aobj[2] = s1;
                Slog.i("StorageNotification", String.format("UMS connection changed to %s (media state %s), (path %s)", aobj));
                if (flag && (s.equals("removed") || s.equals("checking") || s.equals("bad_removal")))
                    flag = false;
                SXlog.d("StorageNotification", (new StringBuilder()).append("onUsbMassStorageConnectionChangedAsync - mLastState: ").append(mLastState).append(", st: ").append(s).append(", mLastConnected: ").append(mLastConnected).append(", connected: ").append(flag).toString());
                if (!flag)
                {
                    mUsbNotifications.clear();
                    updateUsbMassStorageNotification(flag);
                    SXlog.d("StorageNotification", "onUsbMassStorageConnectionChangedAsync - Disconnect");
                } else
                if (containsFunction(SystemProperties.get("sys.usb.config", "none"), "mass_storage"))
                {
                    SXlog.d("StorageNotification", "onUsbMassStorageConnectionChangedAsync - Connect - UMS");
                    if (mLastState.equals(s) && mLastConnected == flag && !mAlarmBootOff)
                    {
                        SXlog.d("StorageNotification", "onUsbMassStorageConnectionChangedAsync - Connect - UMS - Ignore");
                        return;
                    }
                    updateUsbMassStorageNotification(flag);
                } else
                {
                    SXlog.d("StorageNotification", "onUsbMassStorageConnectionChangedAsync - Connect - MTP");
                    updateUsbMassStorageNotification(false);
                }
                mLastConnected = flag;
                SXlog.d("StorageNotification", (new StringBuilder()).append("onUsbMassStorageConnectionChangedAsync - mLastConnected: ").append(mLastConnected).toString());
                return;
            }
            i++;
        } while (true);
    }

    private void setMediaStorageNotification(String s, int i, int j, int k, boolean flag, boolean flag1, boolean flag2, 
            PendingIntent pendingintent)
    {
        this;
        JVM INSTR monitorenter ;
        Resources resources = Resources.getSystem();
        CharSequence charsequence;
        CharSequence charsequence1;
        charsequence = null;
        charsequence1 = null;
        if (!flag)
            break MISSING_BLOCK_LABEL_34;
        charsequence = resources.getText(i);
        charsequence1 = resources.getText(j);
        setMediaStorageNotification(s, charsequence, charsequence1, k, flag, flag1, flag2, pendingintent);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private void setMediaStorageNotification(String s, CharSequence charsequence, CharSequence charsequence1, int i, boolean flag, boolean flag1, boolean flag2, 
            PendingIntent pendingintent)
    {
        this;
        JVM INSTR monitorenter ;
        SXlog.d("StorageNotification", String.format("setMediaStorageNotification path:%s", new Object[] {
            s
        }));
        if (!"/storage/sdcard0".equals(s) && !"/storage/emulated/0".equals(s)) goto _L2; else goto _L1
_L1:
        Notification notification;
        if (mMediaStorageNotification == null)
        {
            mMediaStorageNotification = new Notification();
            mMediaStorageNotification.when = 0L;
        }
        notification = mMediaStorageNotification;
_L6:
        if (flag) goto _L4; else goto _L3
_L3:
        int j = notification.icon;
        if (j != 0) goto _L4; else goto _L5
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
label0:
        {
            if (!"/storage/sdcard1".equals(s))
                break label0;
            if (mMediaStorageNotificationForExtStorage == null)
            {
                mMediaStorageNotificationForExtStorage = new Notification();
                mMediaStorageNotificationForExtStorage.when = 0L;
            }
            notification = mMediaStorageNotificationForExtStorage;
        }
          goto _L6
        if (mMediaStorageNotificationForExtUsbOtg == null)
        {
            mMediaStorageNotificationForExtUsbOtg = new Notification();
            mMediaStorageNotificationForExtUsbOtg.when = 0L;
        }
        notification = mMediaStorageNotificationForExtUsbOtg;
          goto _L6
_L4:
        NotificationManager notificationmanager = (NotificationManager)mContext.getSystemService("notification");
        if (notificationmanager == null) goto _L5; else goto _L7
_L7:
        if (notification == null || !flag)
            break MISSING_BLOCK_LABEL_214;
        notificationmanager.cancel(notification.icon);
        if (!flag) goto _L9; else goto _L8
_L8:
        if (notification != null)
            break MISSING_BLOCK_LABEL_239;
        notification = new Notification();
        notification.when = 0L;
        if (!flag1) goto _L11; else goto _L10
_L10:
        notification.defaults = 1 | notification.defaults;
_L12:
        if (!flag2)
            break MISSING_BLOCK_LABEL_375;
        notification.flags = 16;
_L13:
        notification.tickerText = charsequence;
        if (pendingintent != null)
            break MISSING_BLOCK_LABEL_304;
        Intent intent = new Intent();
        pendingintent = PendingIntent.getBroadcastAsUser(mContext, 0, intent, 0, UserHandle.CURRENT);
        notification.icon = i;
        notification.setLatestEventInfo(mContext, charsequence, charsequence1, pendingintent);
_L9:
        int k = notification.icon;
        if (!flag)
            break MISSING_BLOCK_LABEL_384;
        notificationmanager.notifyAsUser(null, k, notification, UserHandle.ALL);
          goto _L5
        Exception exception;
        exception;
        throw exception;
_L11:
        notification.defaults = -2 & notification.defaults;
          goto _L12
        notification.flags = 2;
          goto _L13
        notificationmanager.cancelAsUser(null, k, UserHandle.ALL);
          goto _L5
    }

    private void setUsbStorageNotification(int i, int j, int k, boolean flag, boolean flag1, PendingIntent pendingintent)
    {
        this;
        JVM INSTR monitorenter ;
        Object aobj[] = new Object[1];
        aobj[0] = Boolean.valueOf(flag1);
        SXlog.d("StorageNotification", String.format("setUsbStorageNotification - visible: {%s}", aobj));
        SXlog.d("StorageNotification", (new StringBuilder()).append("setUsbStorageNotification - mIsLastVisible: ").append(mIsLastVisible).toString());
        if (flag1) goto _L2; else goto _L1
_L1:
        Notification notification = mUsbStorageNotification;
        if (notification != null) goto _L2; else goto _L3
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        NotificationManager notificationmanager = (NotificationManager)mContext.getSystemService("notification");
        if (notificationmanager == null) goto _L3; else goto _L4
_L4:
        if (!flag1) goto _L6; else goto _L5
_L5:
        CharSequence charsequence;
        CharSequence charsequence1;
        Resources resources = Resources.getSystem();
        charsequence = resources.getText(i);
        charsequence1 = resources.getText(j);
        if (mUsbStorageNotification == null)
        {
            mUsbStorageNotification = new Notification();
            mUsbStorageNotification.icon = k;
            mUsbStorageNotification.when = 0L;
            mUsbStorageNotification;
        }
        if (!flag) goto _L8; else goto _L7
_L7:
        Notification notification1 = mUsbStorageNotification;
        notification1.defaults = 1 | notification1.defaults;
_L11:
        String s;
        mUsbStorageNotification.flags = 2;
        mUsbStorageNotification.tickerText = charsequence;
        s = SystemProperties.get("sys.boot.reason");
        if (s == null)
            break MISSING_BLOCK_LABEL_634;
        if (!s.equals("1"))
            break MISSING_BLOCK_LABEL_634;
        boolean flag2 = true;
_L22:
        SXlog.d("StorageNotification", (new StringBuilder()).append("setUsbStorageNotification - alarmBoot: ").append(flag2).toString());
        if (!flag2) goto _L10; else goto _L9
_L9:
        SXlog.d("StorageNotification", "setUsbStorageNotification - [Show Notification After AlarmBoot]");
          goto _L3
        Exception exception;
        exception;
        throw exception;
_L8:
        Notification notification2 = mUsbStorageNotification;
        notification2.defaults = -2 & notification2.defaults;
          goto _L11
_L10:
        SXlog.d("StorageNotification", (new StringBuilder()).append("setUsbStorageNotification - count of mUsbNotifications: ").append(mUsbNotifications.size()).toString());
        if (mUsbNotifications.contains(charsequence.toString())) goto _L13; else goto _L12
_L12:
        mUsbNotifications.clear();
        mUsbNotifications.add(charsequence.toString());
        Object aobj2[] = new Object[1];
        aobj2[0] = charsequence.toString();
        SXlog.d("StorageNotification", String.format("setUsbStorageNotification - [Add] title: {%s} to HashSet", aobj2));
_L21:
        if (pendingintent != null)
            break MISSING_BLOCK_LABEL_430;
        Intent intent = new Intent();
        pendingintent = PendingIntent.getBroadcastAsUser(mContext, 0, intent, 0, UserHandle.CURRENT);
        mUsbStorageNotification.setLatestEventInfo(mContext, charsequence, charsequence1, pendingintent);
        boolean flag3;
        int l;
        if (1 == android.provider.Settings.Global.getInt(mContext.getContentResolver(), "adb_enabled", 0))
            flag3 = true;
        else
            flag3 = false;
        if (flag3) goto _L15; else goto _L14
_L14:
        if (android.provider.Settings.Secure.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0) goto _L17; else goto _L16
_L16:
        SXlog.d("StorageNotification", "Device not provisioned, skipping showing full screen UsbStorageActivity");
        mUsbStorageNotification.fullScreenIntent = null;
_L6:
        l = mUsbStorageNotification.icon;
        if (!flag1) goto _L19; else goto _L18
_L18:
        notificationmanager.notifyAsUser(null, l, mUsbStorageNotification, UserHandle.ALL);
        mIsLastVisible = true;
          goto _L3
_L13:
        Object aobj1[] = new Object[1];
        aobj1[0] = Boolean.valueOf(flag1);
        SXlog.d("StorageNotification", String.format("setUsbStorageNotification - [Hashset contains] visible: {%s}", aobj1));
        if (!mIsLastVisible) goto _L21; else goto _L20
_L20:
        SXlog.d("StorageNotification", "setUsbStorageNotification - same and visible, return");
          goto _L3
_L17:
        mUsbStorageNotification.fullScreenIntent = pendingintent;
          goto _L6
_L15:
        mUsbStorageNotification.fullScreenIntent = null;
          goto _L6
_L19:
        notificationmanager.cancelAsUser(null, l, UserHandle.ALL);
        mIsLastVisible = false;
          goto _L3
        flag2 = false;
          goto _L22
    }

    boolean isAbleToShare()
    {
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        SXlog.d("StorageNotification", (new StringBuilder()).append("isAbleToShare - length:").append(astoragevolume.length).toString());
        int i = 0;
        if (astoragevolume != null)
        {
            for (int j = 0; j < astoragevolume.length; j++)
            {
                SXlog.d("StorageNotification", (new StringBuilder()).append("isAbleToShare - allowMassStorage:").append(astoragevolume[j].allowMassStorage()).append("isEmulated:").append(astoragevolume[j].isEmulated()).toString());
                if (!astoragevolume[j].allowMassStorage() || astoragevolume[j].isEmulated())
                    continue;
                String s = astoragevolume[j].getPath();
                String s1 = mStorageManager.getVolumeState(s);
                if (s1 == null)
                    continue;
                SXlog.d("StorageNotification", String.format("isAbleToShare - %s @ %s", new Object[] {
                    s, s1
                }));
                if (!s1.equals("unmountable") && !s1.equals("nofs") && !s1.equals("removed") && !s1.equals("bad_removal"))
                    i++;
            }

        }
        SXlog.d("StorageNotification", (new StringBuilder()).append("isAbleToShare - allowedShareNum:").append(i).toString());
        return i != 0;
    }

    public void onStorageStateChanged(final String path, final String oldState, final String newState)
    {
        mAsyncEventHandler.post(new Runnable() {

            final StorageNotification this$0;
            final String val$newState;
            final String val$oldState;
            final String val$path;

            public void run()
            {
                onStorageStateChangedAsync(path, oldState, newState);
            }

            
            {
                this$0 = StorageNotification.this;
                path = s;
                oldState = s1;
                newState = s2;
                super();
            }
        }
);
    }

    public void onUsbMassStorageConnectionChanged(final boolean connected)
    {
        mAsyncEventHandler.post(new Runnable() {

            final StorageNotification this$0;
            final boolean val$connected;

            public void run()
            {
                onUsbMassStorageConnectionChangedAsync(connected);
            }

            
            {
                this$0 = StorageNotification.this;
                connected = flag;
                super();
            }
        }
);
    }

    void updateUsbMassStorageNotification(boolean flag)
    {
        boolean flag1 = isAbleToShare();
        SXlog.d("StorageNotification", (new StringBuilder()).append("updateUsbMassStorageNotification - isStorageCanShared=").append(flag1).append(",available=").append(flag).toString());
        if (!mStorageManager.isUsbMassStorageEnabled())
        {
            if (flag && flag1)
            {
                SXlog.d("StorageNotification", "updateUsbMassStorageNotification - [true]");
                Intent intent = new Intent();
                intent.setClass(mContext, com/android/systemui/usb/UsbStorageActivity);
                intent.setFlags(0x10000000);
                setUsbStorageNotification(0x104043c, 0x104043d, 0x1080544, false, true, PendingIntent.getActivity(mContext, 0, intent, 0));
            } else
            if ((flag || flag1) && mUmsAvailable)
            {
                SXlog.d("StorageNotification", "updateUsbMassStorageNotification - Cannot as your wish!");
            } else
            {
                SXlog.d("StorageNotification", "updateUsbMassStorageNotification - [false]");
                setUsbStorageNotification(0, 0, 0, false, false, null);
            }
            mLastConnected = flag;
            return;
        } else
        {
            SXlog.d("StorageNotification", "updateUsbMassStorageNotification - UMS Enabled");
            return;
        }
    }





/*
    static boolean access$202(StorageNotification storagenotification, boolean flag)
    {
        storagenotification.mAlarmBootOff = flag;
        return flag;
    }

*/


}
