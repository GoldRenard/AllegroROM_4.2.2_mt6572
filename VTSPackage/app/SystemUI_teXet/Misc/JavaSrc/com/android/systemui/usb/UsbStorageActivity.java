// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.app.*;
import android.content.*;
import android.os.*;
import android.os.storage.*;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.*;
import com.mediatek.xlog.SXlog;
import java.io.File;
import java.util.List;

public class UsbStorageActivity extends Activity
    implements android.view.View.OnClickListener, android.content.DialogInterface.OnCancelListener
{

    private static final int DLG_CONFIRM_KILL_STORAGE_USERS = 1;
    private static final int DLG_ERROR_SHARING = 2;
    private static final String TAG = "UsbStorageActivity";
    static final boolean localLOGV = true;
    private static boolean mSettingUMS = false;
    private int mAllowedShareNum;
    private Handler mAsyncStorageHandler;
    private TextView mBanner;
    private boolean mDestroyed;
    private boolean mHasCheck;
    private ImageView mIcon;
    private TextView mMessage;
    private Button mMountButton;
    private ProgressBar mProgressBar;
    private int mSharedCount;
    private StorageEventListener mStorageListener;
    private StorageManager mStorageManager;
    private Handler mUIHandler;
    private Button mUnmountButton;
    private BroadcastReceiver mUsbStateReceiver;

    public UsbStorageActivity()
    {
        mStorageManager = null;
        mHasCheck = false;
        mAllowedShareNum = 0;
        mSharedCount = 0;
        mUsbStateReceiver = new BroadcastReceiver() {

            final UsbStorageActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.hardware.usb.action.USB_STATE"))
                    handleUsbStateChanged(intent);
            }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
        }
;
        mStorageListener = new StorageEventListener() {

            final UsbStorageActivity this$0;

            public void onStorageStateChanged(String s, String s1, String s2)
            {
label0:
                {
                    boolean flag = s2.equals("shared");
                    SXlog.d("UsbStorageActivity", (new StringBuilder()).append("onStorageStateChanged - on: ").append(flag).append(", mSettingUMS: ").append(UsbStorageActivity.mSettingUMS).append(", path: ").append(s).append(", oldState: ").append(s1).append(", newState: ").append(s2).toString());
                    if (UsbStorageActivity.mSettingUMS)
                    {
                        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
                        SXlog.d("UsbStorageActivity", (new StringBuilder()).append("onStorageStateChanged - [UMS Enabled] volumes.length: ").append(astoragevolume.length).append(", path: ").append(s).append(", volumes state: ").append(s2).append(", mAllowedShareNum: ").append(mAllowedShareNum).append(", mSharedCount: ").append(mSharedCount).toString());
                        if (!isSharable())
                        {
                            finish();
                            break label0;
                        }
                        int i = 0;
                        do
                        {
label1:
                            {
                                int j = astoragevolume.length;
                                boolean flag1 = false;
                                if (i < j)
                                {
                                    if (!"shared".equals(mStorageManager.getVolumeState(astoragevolume[i].getPath())))
                                        break label1;
                                    flag1 = true;
                                }
                                SXlog.d("UsbStorageActivity", (new StringBuilder()).append("onStorageStateChanged - haveShared: ").append(flag1).toString());
                                switchDisplay(flag1);
                                return;
                            }
                            i++;
                        } while (true);
                    }
                    SXlog.d("UsbStorageActivity", (new StringBuilder()).append("onStorageStateChanged - [UMS Disable] mSettingUMS: ").append(UsbStorageActivity.mSettingUMS).append(", on: ").append(flag).toString());
                    switchDisplay(flag);
                    if (!isSharable())
                    {
                        finish();
                        return;
                    }
                }
            }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
        }
;
    }

    private void checkStorageUsers()
    {
        mAsyncStorageHandler.post(new Runnable() {

            final UsbStorageActivity this$0;

            public void run()
            {
                checkStorageUsersAsync();
            }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
        }
);
    }

    private void checkStorageUsersAsync()
    {
        IMountService imountservice;
        String s;
        imountservice = getMountService();
        if (imountservice == null)
            scheduleShowDialog(2);
        s = Environment.getExternalStorageDirectory().toString();
        int ai[] = imountservice.getStorageUsers(s);
        if (ai == null) goto _L2; else goto _L1
_L1:
        SXlog.d("UsbStorageActivity", (new StringBuilder()).append("checkStorageUsersAsync - stUsers.length: ").append(ai.length).toString());
_L6:
        if (ai == null) goto _L4; else goto _L3
_L3:
        int i = ai.length;
        if (i <= 0) goto _L4; else goto _L5
_L5:
        boolean flag = true;
_L7:
        RemoteException remoteexception;
        List list;
        int j;
        if (flag)
        {
            SXlog.d("UsbStorageActivity", (new StringBuilder()).append("checkStorageUsersAsync - [SHOW DIALOG] showDialog: ").append(flag).toString());
            scheduleShowDialog(1);
            return;
        } else
        {
            SXlog.d("UsbStorageActivity", (new StringBuilder()).append("checkStorageUsersAsync - [NO DIALOG] showDialog: ").append(flag).toString());
            Log.i("UsbStorageActivity", "Enabling UMS");
            switchUsbMassStorage(true);
            return;
        }
_L2:
        SXlog.d("UsbStorageActivity", "checkStorageUsersAsync - [NO Storage Users]");
          goto _L6
        remoteexception;
        scheduleShowDialog(2);
        flag = false;
          goto _L7
_L4:
        list = ((ActivityManager)getSystemService("activity")).getRunningExternalApplications();
        if (list == null)
            break MISSING_BLOCK_LABEL_221;
        SXlog.d("UsbStorageActivity", (new StringBuilder()).append("checkStorageUsersAsync - infoList.size(): ").append(list.size()).toString());
_L9:
        flag = false;
        if (list == null) goto _L7; else goto _L8
_L8:
        j = list.size();
        flag = false;
        if (j > 0)
            flag = true;
          goto _L7
        SXlog.d("UsbStorageActivity", "checkStorageUsersAsync - [NO EXT RUNNING APPS]");
          goto _L9
    }

    private IMountService getMountService()
    {
        android.os.IBinder ibinder = ServiceManager.getService("mount");
        if (ibinder != null)
            return android.os.storage.IMountService.Stub.asInterface(ibinder);
        else
            return null;
    }

    private void handleUsbStateChanged(Intent intent)
    {
        boolean flag = intent.getExtras().getBoolean("connected");
        boolean flag1 = intent.getExtras().getBoolean("mass_storage");
        SXlog.d("UsbStorageActivity", (new StringBuilder()).append("handleUsbStateChanged - connected:  ").append(flag).append(", isUMSmode: ").append(flag1).toString());
        if (!flag || !flag1)
        {
            if (mSettingUMS)
            {
                mSettingUMS = false;
                SXlog.d("UsbStorageActivity", (new StringBuilder()).append("handleUsbStateChanged - [Unplug when UMS enabled] connected:  ").append(flag).toString());
            }
            finish();
        }
    }

    private boolean isSharable()
    {
        StorageVolume astoragevolume[] = mStorageManager.getVolumeList();
        int i = 0;
        if (astoragevolume != null)
        {
            SXlog.d("UsbStorageActivity", (new StringBuilder()).append("isSharable - length:").append(astoragevolume.length).toString());
            for (int j = 0; j < astoragevolume.length; j++)
            {
                if (!astoragevolume[j].allowMassStorage() || astoragevolume[j].isEmulated())
                    continue;
                String s = astoragevolume[j].getPath();
                String s1 = mStorageManager.getVolumeState(s);
                if (s1 == null)
                    continue;
                SXlog.d("UsbStorageActivity", (new StringBuilder()).append("isSharable - allowMassStorage:").append(astoragevolume[j].allowMassStorage()).append(", isEmulated:").append(astoragevolume[j].isEmulated()).toString());
                if (!s1.equals("unmountable") && !s1.equals("nofs") && !s1.equals("removed") && !s1.equals("bad_removal"))
                    i++;
            }

        }
        SXlog.d("UsbStorageActivity", (new StringBuilder()).append("isSharable - allowedShareNum:").append(i).toString());
        return i != 0;
    }

    private void scheduleShowDialog(final int id)
    {
        mUIHandler.post(new Runnable() {

            final UsbStorageActivity this$0;
            final int val$id;

            public void run()
            {
                if (!mDestroyed)
                {
                    removeDialog(id);
                    showDialog(id);
                }
            }

            
            {
                this$0 = UsbStorageActivity.this;
                id = i;
                super();
            }
        }
);
    }

    private void switchDisplay(final boolean usbStorageInUse)
    {
        mUIHandler.post(new Runnable() {

            final UsbStorageActivity this$0;
            final boolean val$usbStorageInUse;

            public void run()
            {
                switchDisplayAsync(usbStorageInUse);
            }

            
            {
                this$0 = UsbStorageActivity.this;
                usbStorageInUse = flag;
                super();
            }
        }
);
    }

    private void switchDisplayAsync(boolean flag)
    {
        if (flag)
        {
            SXlog.d("UsbStorageActivity", (new StringBuilder()).append("switchDisplayAsync - [Mount] usbStorageInUse:  ").append(flag).toString());
            mProgressBar.setVisibility(8);
            mUnmountButton.setVisibility(0);
            mMountButton.setVisibility(8);
            mIcon.setImageResource(0x108060b);
            mBanner.setText(0x1040440);
            mMessage.setText(0x1040441);
            return;
        } else
        {
            SXlog.d("UsbStorageActivity", (new StringBuilder()).append("switchDisplayAsync - [Unmount] usbStorageInUse:  ").append(flag).toString());
            mProgressBar.setVisibility(8);
            mUnmountButton.setVisibility(8);
            mMountButton.setVisibility(0);
            mIcon.setImageResource(0x108060a);
            mBanner.setText(0x1040438);
            mMessage.setText(0x1040439);
            return;
        }
    }

    private void switchUsbMassStorage(final boolean on)
    {
        mUIHandler.post(new Runnable() {

            final UsbStorageActivity this$0;

            public void run()
            {
                mUnmountButton.setVisibility(8);
                mMountButton.setVisibility(8);
                mProgressBar.setVisibility(0);
            }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
        }
);
        mAsyncStorageHandler.post(new Runnable() {

            final UsbStorageActivity this$0;
            final boolean val$on;

            public void run()
            {
                if (on)
                {
                    UsbStorageActivity.mSettingUMS = true;
                    mStorageManager.enableUsbMassStorage();
                    return;
                } else
                {
                    UsbStorageActivity.mSettingUMS = false;
                    mStorageManager.disableUsbMassStorage();
                    return;
                }
            }

            
            {
                this$0 = UsbStorageActivity.this;
                on = flag;
                super();
            }
        }
);
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        finish();
    }

    public void onClick(View view)
    {
        Log.i("UsbStorageActivity", (new StringBuilder()).append("onClickaa").append(mHasCheck).toString());
        if (view == mMountButton)
        {
            if (!mHasCheck)
            {
                Log.i("UsbStorageActivity", (new StringBuilder()).append("onClick").append(mHasCheck).toString());
                mHasCheck = true;
                checkStorageUsers();
            }
        } else
        if (view == mUnmountButton)
        {
            Log.i("UsbStorageActivity", "Disabling UMS");
            mHasCheck = false;
            switchUsbMassStorage(false);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (mStorageManager == null)
        {
            mStorageManager = (StorageManager)getSystemService("storage");
            if (mStorageManager == null)
                Log.w("UsbStorageActivity", "Failed to get StorageManager");
        }
        mSettingUMS |= mStorageManager.isUsbMassStorageEnabled();
        Log.w("UsbStorageActivity", (new StringBuilder()).append("mSettingUMS=").append(mSettingUMS).toString());
        mUIHandler = new Handler();
        HandlerThread handlerthread = new HandlerThread("SystemUI UsbStorageActivity");
        handlerthread.start();
        mAsyncStorageHandler = new Handler(handlerthread.getLooper());
        getWindow().addFlags(0x400000);
        if (Environment.isExternalStorageRemovable())
            getWindow().addFlags(0x80000);
        setContentView(0x10900e2);
        mIcon = (ImageView)findViewById(0x1020006);
        mBanner = (TextView)findViewById(0x10203ab);
        mMessage = (TextView)findViewById(0x102000b);
        mMountButton = (Button)findViewById(0x10203ac);
        mMountButton.setOnClickListener(this);
        mUnmountButton = (Button)findViewById(0x10203ad);
        mUnmountButton.setOnClickListener(this);
        mProgressBar = (ProgressBar)findViewById(0x102000d);
    }

    public Dialog onCreateDialog(int i, Bundle bundle)
    {
        Log.i("UsbStorageActivity", "onCreateDialoge");
        switch (i)
        {
        case 2: // '\002'
            return (new android.app.AlertDialog.Builder(this)).setTitle(0x1040446).setNeutralButton(0x1040447, null).setMessage(0x104043b).setOnCancelListener(this).create();

        case 1: // '\001'
            return (new android.app.AlertDialog.Builder(this)).setTitle(0x1040444).setPositiveButton(0x1040447, new android.content.DialogInterface.OnClickListener() {

                final UsbStorageActivity this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mHasCheck = false;
                    switchUsbMassStorage(true);
                }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
            }
).setNegativeButton(0x1040000, new android.content.DialogInterface.OnClickListener() {

                final UsbStorageActivity this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mHasCheck = false;
                }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
            }
).setMessage(0x1040445).setOnCancelListener(this).create();
        }
        return null;
    }

    protected void onDestroy()
    {
        super.onDestroy();
        mAsyncStorageHandler.getLooper().quit();
        mDestroyed = true;
    }

    protected void onPause()
    {
        super.onPause();
        unregisterReceiver(mUsbStateReceiver);
        if (mStorageManager != null && mStorageListener != null)
            mStorageManager.unregisterListener(mStorageListener);
    }

    protected void onResume()
    {
        super.onResume();
        mHasCheck = false;
        mStorageManager.registerListener(mStorageListener);
        registerReceiver(mUsbStateReceiver, new IntentFilter("android.hardware.usb.action.USB_STATE"));
        try
        {
            mAsyncStorageHandler.post(new Runnable() {

                final UsbStorageActivity this$0;

                public void run()
                {
                    switchDisplay(mStorageManager.isUsbMassStorageEnabled());
                }

            
            {
                this$0 = UsbStorageActivity.this;
                super();
            }
            }
);
            return;
        }
        catch (Exception exception)
        {
            Log.e("UsbStorageActivity", "Failed to read UMS enable state", exception);
        }
    }






/*
    static boolean access$102(boolean flag)
    {
        mSettingUMS = flag;
        return flag;
    }

*/












/*
    static boolean access$802(UsbStorageActivity usbstorageactivity, boolean flag)
    {
        usbstorageactivity.mHasCheck = flag;
        return flag;
    }

*/

}
