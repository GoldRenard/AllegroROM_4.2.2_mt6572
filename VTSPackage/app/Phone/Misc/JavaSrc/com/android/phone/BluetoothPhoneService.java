// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Service;
import android.bluetooth.BluetoothAdapter;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, BluetoothHandsfree

public class BluetoothPhoneService extends Service
{

    private static final boolean DBG = true;
    private static final String MODIFY_PHONE_STATE = "android.permission.MODIFY_PHONE_STATE";
    private static final String TAG = "BluetoothPhoneService";
    private static final boolean VDBG = true;
    private BluetoothAdapter mAdapter;
    private final android.bluetooth.IBluetoothHeadsetPhone.Stub mBinder = new android.bluetooth.IBluetoothHeadsetPhone.Stub() {

        final BluetoothPhoneService this$0;

        public boolean answerCall()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public void cdmaSetSecondCallState(boolean flag)
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            Log.d("BluetoothPhoneService", (new StringBuilder()).append("cdmaSetSecondCallState(").append(flag).append(")").toString());
            mBtHandsfree.cdmaSetSecondCallState(flag);
        }

        public void cdmaSwapSecondCallState()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            Log.d("BluetoothPhoneService", "cdmaSwapSecondCallState()");
            mBtHandsfree.cdmaSwapSecondCallState();
        }

        public String getNetworkOperator()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return "";
        }

        public String getSubscriberNumber()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return "";
        }

        public boolean hangupCall()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public boolean listCurrentCalls()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public boolean processChld(int i)
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public boolean queryPhoneState()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public boolean sendDtmf(int i)
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            return false;
        }

        public void updateBtHandsfreeAfterRadioTechnologyChange()
        {
            enforceCallingOrSelfPermission("android.permission.MODIFY_PHONE_STATE", null);
            Log.d("BluetoothPhoneService", "updateBtHandsfreeAfterRadioTechnologyChange()");
            mBtHandsfree.updateBtHandsfreeAfterRadioTechnologyChange();
        }

            
            {
                this$0 = BluetoothPhoneService.this;
                super();
            }
    }
;
    private BluetoothHandsfree mBtHandsfree;


    private static void log(String s)
    {
        Log.d("BluetoothPhoneService", s);
    }

    public IBinder onBind(Intent intent)
    {
        return mBinder;
    }

    public void onCreate()
    {
        super.onCreate();
        mAdapter = BluetoothAdapter.getDefaultAdapter();
        if (mAdapter == null)
        {
            Log.d("BluetoothPhoneService", "mAdapter null");
            return;
        } else
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            mBtHandsfree = BluetoothHandsfree.init(phoneglobals, phoneglobals.mCM);
            return;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("Stopping Bluetooth BluetoothPhoneService Service");
    }

    public void onStart(Intent intent, int i)
    {
        if (mAdapter == null)
        {
            Log.w("BluetoothPhoneService", "Stopping Bluetooth BluetoothPhoneService Service: device does not have BT");
            stopSelf();
        }
        Log.d("BluetoothPhoneService", "BluetoothPhoneService started");
    }

}
