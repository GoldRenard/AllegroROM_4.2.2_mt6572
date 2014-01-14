// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import com.android.internal.app.AlertActivity;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, LocalBluetoothAdapter

public class RequestPermissionHelperActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    public static final String ACTION_INTERNAL_REQUEST_BT_ON = "com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON";
    public static final String ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE = "com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE";
    private static final String TAG = "RequestPermissionHelperActivity";
    private boolean mEnableOnly;
    private LocalBluetoothAdapter mLocalAdapter;
    private int mTimeout;


    private boolean parseIntent()
    {
label0:
        {
            Intent intent = getIntent();
            if (intent != null && intent.getAction().equals("com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON"))
            {
                mEnableOnly = true;
            } else
            {
                if (intent == null || !intent.getAction().equals("com.android.settings.bluetooth.ACTION_INTERNAL_REQUEST_BT_ON_AND_DISCOVERABLE"))
                    break label0;
                mEnableOnly = false;
                mTimeout = intent.getIntExtra("android.bluetooth.adapter.extra.DISCOVERABLE_DURATION", 120);
            }
            LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(this);
            if (localbluetoothmanager == null)
            {
                Log.e("RequestPermissionHelperActivity", "Error: there's a problem starting Bluetooth");
                setResult(0);
                return true;
            } else
            {
                mLocalAdapter = localbluetoothmanager.getBluetoothAdapter();
                return false;
            }
        }
        setResult(0);
        return true;
    }

    void createDialog()
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        if (mEnableOnly)
            alertparams.mMessage = getString(0x7f0b02e4);
        else
        if (mTimeout == 0)
        {
            alertparams.mMessage = getString(0x7f0b02e8);
        } else
        {
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(mTimeout);
            alertparams.mMessage = getString(0x7f0b02e7, aobj);
        }
        alertparams.mPositiveButtonText = getString(0x7f0b026a);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x7f0b026b);
        alertparams.mNegativeButtonListener = this;
        setupAlert();
    }

    public void onBackPressed()
    {
        setResult(0);
        super.onBackPressed();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        i;
        JVM INSTR tableswitch -2 -1: default 24
    //                   -2 101
    //                   -1 25;
           goto _L1 _L2 _L3
_L1:
        return;
_L3:
        int j;
        int k;
        j = 0;
        k = 30;
        do
        {
            j = mLocalAdapter.getBluetoothState();
            Thread.sleep(100L);
        } while (j == 13 && --k > 0);
_L7:
        char c;
        if (j == 11 || j == 12 || mLocalAdapter.enable())
            c = '\uFC18';
        else
            c = '\0';
_L5:
        setResult(c);
        return;
_L2:
        c = '\0';
        if (true) goto _L5; else goto _L4
_L4:
        InterruptedException interruptedexception;
        interruptedexception;
        if (true) goto _L7; else goto _L6
_L6:
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        if (parseIntent())
        {
            finish();
        } else
        {
            createDialog();
            if (getResources().getBoolean(0x7f090004))
            {
                onClick(null, -1);
                dismiss();
                return;
            }
        }
    }
}
