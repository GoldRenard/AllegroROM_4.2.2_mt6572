// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.*;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, LocalBluetoothAdapter, LocalBluetoothPreferences, BluetoothDiscoverableTimeoutReceiver, 
//            RequestPermissionHelperActivity

public class RequestPermissionActivity extends Activity
    implements android.content.DialogInterface.OnClickListener
{

    private static final int MAX_DISCOVERABLE_TIMEOUT = 3600;
    private static final int REQUEST_CODE_START_BT = 1;
    static final int RESULT_BT_STARTING_OR_STARTED = -1000;
    private static final String TAG = "RequestPermissionActivity";
    private static int mRequestCode = 1;
    private AlertDialog mDialog;
    private boolean mEnableOnly;
    private LocalBluetoothAdapter mLocalAdapter;
    private boolean mNeededToEnableBluetooth;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final RequestPermissionActivity this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent != null && mNeededToEnableBluetooth && "android.bluetooth.adapter.action.STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 12 && mUserConfirmed)
            {
                proceedAndFinish();
                return;
            } else
            {
                return;
            }
        }

            
            {
                this$0 = RequestPermissionActivity.this;
                super();
            }
    }
;
    private int mTimeout;
    private boolean mUserConfirmed;

    public RequestPermissionActivity()
    {
        mTimeout = 120;
    }

    private void createDialog()
    {
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(this);
        if (mNeededToEnableBluetooth)
        {
            builder.setMessage(getString(0x7f0b02e9));
            builder.setCancelable(false);
        } else
        {
            if (mTimeout == 0)
            {
                builder.setMessage(getString(0x7f0b02e6));
            } else
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(mTimeout);
                builder.setMessage(getString(0x7f0b02e5, aobj));
            }
            builder.setPositiveButton(getString(0x7f0b026a), this);
            builder.setNegativeButton(getString(0x7f0b026b), this);
        }
        mDialog = builder.create();
        mDialog.show();
        if (getResources().getBoolean(0x7f090004))
            onClick(null, -1);
    }

    private boolean parseIntent()
    {
label0:
        {
            Intent intent = getIntent();
            if (intent != null && intent.getAction().equals("android.bluetooth.adapter.action.REQUEST_ENABLE"))
            {
                mEnableOnly = true;
            } else
            {
                if (intent == null || !intent.getAction().equals("android.bluetooth.adapter.action.REQUEST_DISCOVERABLE"))
                    break label0;
                mTimeout = intent.getIntExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 120);
                Log.d("RequestPermissionActivity", (new StringBuilder()).append("Setting Bluetooth Discoverable Timeout = ").append(mTimeout).toString());
                if (mTimeout < 0 || mTimeout > 3600)
                    mTimeout = 120;
            }
            LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(this);
            if (localbluetoothmanager == null)
            {
                Log.e("RequestPermissionActivity", "Error: there's a problem starting Bluetooth");
                setResult(0);
                return true;
            } else
            {
                mLocalAdapter = localbluetoothmanager.getBluetoothAdapter();
                return false;
            }
        }
        Log.e("RequestPermissionActivity", "Error: this activity may be started only with intent android.bluetooth.adapter.action.REQUEST_ENABLE or android.bluetooth.adapter.action.REQUEST_DISCOVERABLE");
        setResult(0);
        return true;
    }

    private void proceedAndFinish()
    {
        int i;
        if (mEnableOnly)
            i = -1;
        else
        if (mLocalAdapter.setScanMode(23, mTimeout))
        {
            long l = System.currentTimeMillis() + 1000L * (long)mTimeout;
            LocalBluetoothPreferences.persistDiscoverableEndTimestamp(this, l);
            if (mTimeout > 0)
                BluetoothDiscoverableTimeoutReceiver.setDiscoverableAlarm(this, l);
            i = mTimeout;
            if (i < 1)
                i = 1;
        } else
        {
            i = 0;
        }
        if (mDialog != null)
            mDialog.dismiss();
        setResult(i);
        finish();
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        if (i != -1 + mRequestCode)
        {
            Log.e("RequestPermissionActivity", (new StringBuilder()).append("Unexpected onActivityResult ").append(i).append(' ').append(j).toString());
            setResult(0);
            finish();
            return;
        }
        if (j != -1000)
        {
            setResult(j);
            finish();
            return;
        }
        mUserConfirmed = true;
        if (mLocalAdapter.getBluetoothState() == 12)
        {
            proceedAndFinish();
            return;
        } else
        {
            createDialog();
            return;
        }
    }

    public void onBackPressed()
    {
        setResult(0);
        try
        {
            super.onBackPressed();
            return;
        }
        catch (IllegalStateException illegalstateexception)
        {
            Log.e("RequestPermissionActivity", illegalstateexception.getMessage());
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        switch (i)
        {
        case -2: 
            setResult(0);
            finish();
            return;

        case -1: 
            proceedAndFinish();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (parseIntent())
        {
            finish();
            return;
        }
        int i = mLocalAdapter.getState();
        switch (i)
        {
        case 12: // '\f'
            if (mEnableOnly)
            {
                proceedAndFinish();
                return;
            } else
            {
                createDialog();
                return;
            }

        case 10: // '\n'
        case 11: // '\013'
        case 13: // '\r'
            registerReceiver(mReceiver, new IntentFilter("android.bluetooth.adapter.action.STATE_CHANGED"));
            Intent intent = new Intent();
            intent.setClass(this, com/android/settings/bluetooth/RequestPermissionHelperActivity);
            intent.setFlags(0x4000000);
            if (mEnableOnly)
            {
                intent.setAction("com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON");
            } else
            {
                intent.setAction("com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE");
                intent.putExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", mTimeout);
            }
            startActivityForResult(intent, mRequestCode);
            mRequestCode = 1 + mRequestCode;
            mNeededToEnableBluetooth = true;
            return;
        }
        Log.e("RequestPermissionActivity", (new StringBuilder()).append("Unknown adapter state: ").append(i).toString());
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mNeededToEnableBluetooth)
            unregisterReceiver(mReceiver);
    }




}
