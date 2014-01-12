// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.content.*;
import android.content.pm.*;
import android.hardware.usb.*;
import android.os.*;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.internal.app.AlertActivity;

// Referenced classes of package com.android.systemui.usb:
//            UsbDisconnectedReceiver

public class UsbConfirmActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener, android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "UsbConfirmActivity";
    private UsbAccessory mAccessory;
    private CheckBox mAlwaysUse;
    private TextView mClearDefaultHint;
    private UsbDevice mDevice;
    private UsbDisconnectedReceiver mDisconnectedReceiver;
    private boolean mPermissionGranted;
    private ResolveInfo mResolveInfo;


    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (mClearDefaultHint == null)
            return;
        if (flag)
        {
            mClearDefaultHint.setVisibility(0);
            return;
        } else
        {
            mClearDefaultHint.setVisibility(8);
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i != -1) goto _L2; else goto _L1
_L1:
        IUsbManager iusbmanager;
        int j;
        int k;
        boolean flag;
        iusbmanager = android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb"));
        j = mResolveInfo.activityInfo.applicationInfo.uid;
        k = UserHandle.myUserId();
        flag = mAlwaysUse.isChecked();
        if (mDevice == null) goto _L4; else goto _L3
_L3:
        Intent intent;
        intent = new Intent("android.hardware.usb.action.USB_DEVICE_ATTACHED");
        intent.putExtra("device", mDevice);
        iusbmanager.grantDevicePermission(mDevice, j);
        if (!flag) goto _L6; else goto _L5
_L5:
        iusbmanager.setDevicePackage(mDevice, mResolveInfo.activityInfo.packageName, k);
_L7:
        intent.addFlags(0x10000000);
        intent.setComponent(new ComponentName(mResolveInfo.activityInfo.packageName, mResolveInfo.activityInfo.name));
        startActivityAsUser(intent, new UserHandle(k));
_L2:
        finish();
        return;
_L6:
        iusbmanager.setDevicePackage(mDevice, null, k);
          goto _L7
        Exception exception;
        exception;
        Log.e("UsbConfirmActivity", "Unable to start activity", exception);
          goto _L2
_L4:
        UsbAccessory usbaccessory = mAccessory;
        intent = null;
        if (usbaccessory == null) goto _L7; else goto _L8
_L8:
        intent = new Intent("android.hardware.usb.action.USB_ACCESSORY_ATTACHED");
        intent.putExtra("accessory", mAccessory);
        iusbmanager.grantAccessoryPermission(mAccessory, j);
        if (!flag)
            break MISSING_BLOCK_LABEL_287;
        iusbmanager.setAccessoryPackage(mAccessory, mResolveInfo.activityInfo.packageName, k);
          goto _L7
        iusbmanager.setAccessoryPackage(mAccessory, null, k);
          goto _L7
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        mDevice = (UsbDevice)intent.getParcelableExtra("device");
        mAccessory = (UsbAccessory)intent.getParcelableExtra("accessory");
        mResolveInfo = (ResolveInfo)intent.getParcelableExtra("rinfo");
        android.content.pm.PackageManager packagemanager = getPackageManager();
        String s = mResolveInfo.loadLabel(packagemanager).toString();
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIcon = mResolveInfo.loadIcon(packagemanager);
        alertparams.mTitle = s;
        if (mDevice == null)
        {
            alertparams.mMessage = getString(0x7f0b0063, new Object[] {
                s
            });
            mDisconnectedReceiver = new UsbDisconnectedReceiver(this, mAccessory);
        } else
        {
            alertparams.mMessage = getString(0x7f0b0062, new Object[] {
                s
            });
            mDisconnectedReceiver = new UsbDisconnectedReceiver(this, mDevice);
        }
        alertparams.mPositiveButtonText = getString(0x104000a);
        alertparams.mNegativeButtonText = getString(0x1040000);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonListener = this;
        alertparams.mView = ((LayoutInflater)getSystemService("layout_inflater")).inflate(0x1090028, null);
        mAlwaysUse = (CheckBox)alertparams.mView.findViewById(0x1020266);
        if (mDevice == null)
            mAlwaysUse.setText(0x7f0b0068);
        else
            mAlwaysUse.setText(0x7f0b0067);
        mAlwaysUse.setOnCheckedChangeListener(this);
        mClearDefaultHint = (TextView)alertparams.mView.findViewById(0x1020267);
        mClearDefaultHint.setVisibility(8);
        setupAlert();
    }

    protected void onDestroy()
    {
        if (mDisconnectedReceiver != null)
            unregisterReceiver(mDisconnectedReceiver);
        super.onDestroy();
    }
}
