// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.app.Activity;
import android.content.*;
import android.hardware.usb.IUsbManager;
import android.os.Bundle;
import android.os.ServiceManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.CheckBox;
import com.android.internal.app.AlertActivity;

public class UsbDebuggingActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{
    private class UsbDisconnectedReceiver extends BroadcastReceiver
    {

        private final Activity mActivity;
        final UsbDebuggingActivity this$0;

        public void onReceive(Context context, Intent intent)
        {
            if ("android.hardware.usb.action.USB_STATE".equals(intent.getAction()) && !intent.getBooleanExtra("connected", false))
            {
                mActivity.finish();
                return;
            } else
            {
                return;
            }
        }

        public UsbDisconnectedReceiver(Activity activity)
        {
            this$0 = UsbDebuggingActivity.this;
            super();
            mActivity = activity;
        }
    }


    private static final String TAG = "UsbDebuggingActivity";
    private CheckBox mAlwaysAllow;
    private UsbDisconnectedReceiver mDisconnectedReceiver;
    private String mKey;


    public void onClick(DialogInterface dialoginterface, int i)
    {
        IUsbManager iusbmanager;
        boolean flag = true;
        boolean flag1;
        if (i == -1)
            flag1 = flag;
        else
            flag1 = false;
        if (!flag1 || !mAlwaysAllow.isChecked())
            flag = false;
        iusbmanager = android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb"));
        if (!flag1)
            break MISSING_BLOCK_LABEL_68;
        try
        {
            iusbmanager.allowUsbDebugging(flag, mKey);
        }
        catch (Exception exception)
        {
            Log.e("UsbDebuggingActivity", "Unable to notify Usb service", exception);
        }
        finish();
        return;
        iusbmanager.denyUsbDebugging();
        break MISSING_BLOCK_LABEL_52;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mDisconnectedReceiver = new UsbDisconnectedReceiver(this);
        Intent intent = getIntent();
        String s = intent.getStringExtra("fingerprints");
        mKey = intent.getStringExtra("key");
        if (s != null && mKey != null)
        {
            com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
            alertparams.mTitle = getString(0x7f0b00b3);
            alertparams.mIconId = 0x10802c8;
            alertparams.mMessage = getString(0x7f0b00b4, new Object[] {
                s
            });
            alertparams.mPositiveButtonText = getString(0x104000a);
            alertparams.mNegativeButtonText = getString(0x1040000);
            alertparams.mPositiveButtonListener = this;
            alertparams.mNegativeButtonListener = this;
            View view = LayoutInflater.from(alertparams.mContext).inflate(0x1090028, null);
            mAlwaysAllow = (CheckBox)view.findViewById(0x1020266);
            mAlwaysAllow.setText(getString(0x7f0b00b5));
            alertparams.mView = view;
            setupAlert();
            return;
        } else
        {
            finish();
            return;
        }
    }

    public void onStart()
    {
        super.onStart();
        IntentFilter intentfilter = new IntentFilter("android.hardware.usb.action.USB_STATE");
        registerReceiver(mDisconnectedReceiver, intentfilter);
    }

    protected void onStop()
    {
        if (mDisconnectedReceiver != null)
            unregisterReceiver(mDisconnectedReceiver);
        super.onStop();
    }
}
