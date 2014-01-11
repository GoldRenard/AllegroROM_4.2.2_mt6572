// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.usb;

import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.hardware.usb.*;
import android.os.*;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.internal.app.AlertActivity;

// Referenced classes of package com.android.systemui.usb:
//            UsbDisconnectedReceiver

public class UsbPermissionActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener, android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final String TAG = "UsbPermissionActivity";
    private UsbAccessory mAccessory;
    private CheckBox mAlwaysUse;
    private TextView mClearDefaultHint;
    private UsbDevice mDevice;
    private UsbDisconnectedReceiver mDisconnectedReceiver;
    private String mPackageName;
    private PendingIntent mPendingIntent;
    private boolean mPermissionGranted;
    private int mUid;


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
        if (i == -1)
            mPermissionGranted = true;
        finish();
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        mDevice = (UsbDevice)intent.getParcelableExtra("device");
        mAccessory = (UsbAccessory)intent.getParcelableExtra("accessory");
        mPendingIntent = (PendingIntent)intent.getParcelableExtra("android.intent.extra.INTENT");
        mUid = intent.getIntExtra("android.intent.extra.UID", -1);
        mPackageName = intent.getStringExtra("package");
        PackageManager packagemanager = getPackageManager();
        ApplicationInfo applicationinfo;
        String s;
        com.android.internal.app.AlertController.AlertParams alertparams;
        try
        {
            applicationinfo = packagemanager.getApplicationInfo(mPackageName, 0);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            Log.e("UsbPermissionActivity", "unable to look up package name", namenotfoundexception);
            finish();
            return;
        }
        s = applicationinfo.loadLabel(packagemanager).toString();
        alertparams = mAlertParams;
        alertparams.mIcon = applicationinfo.loadIcon(packagemanager);
        alertparams.mTitle = s;
        if (mDevice == null)
        {
            alertparams.mMessage = getString(0x7f0b0060, new Object[] {
                s
            });
            mDisconnectedReceiver = new UsbDisconnectedReceiver(this, mAccessory);
        } else
        {
            alertparams.mMessage = getString(0x7f0b005f, new Object[] {
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
            mAlwaysUse.setText(0x7f0b0067);
        else
            mAlwaysUse.setText(0x7f0b0066);
        mAlwaysUse.setOnCheckedChangeListener(this);
        mClearDefaultHint = (TextView)alertparams.mView.findViewById(0x1020267);
        mClearDefaultHint.setVisibility(8);
        setupAlert();
    }

    public void onDestroy()
    {
        IUsbManager iusbmanager = android.hardware.usb.IUsbManager.Stub.asInterface(ServiceManager.getService("usb"));
        Intent intent = new Intent();
        try
        {
            if (mDevice != null)
            {
                intent.putExtra("device", mDevice);
                if (mPermissionGranted)
                {
                    iusbmanager.grantDevicePermission(mDevice, mUid);
                    if (mAlwaysUse.isChecked())
                    {
                        int j = UserHandle.getUserId(mUid);
                        iusbmanager.setDevicePackage(mDevice, mPackageName, j);
                    }
                }
            }
            if (mAccessory != null)
            {
                intent.putExtra("accessory", mAccessory);
                if (mPermissionGranted)
                {
                    iusbmanager.grantAccessoryPermission(mAccessory, mUid);
                    if (mAlwaysUse.isChecked())
                    {
                        int i = UserHandle.getUserId(mUid);
                        iusbmanager.setAccessoryPackage(mAccessory, mPackageName, i);
                    }
                }
            }
            intent.putExtra("permission", mPermissionGranted);
            mPendingIntent.send(this, 0, intent);
        }
        catch (android.app.PendingIntent.CanceledException canceledexception)
        {
            Log.w("UsbPermissionActivity", "PendingIntent was cancelled");
        }
        catch (RemoteException remoteexception)
        {
            Log.e("UsbPermissionActivity", "IUsbService connection failed", remoteexception);
        }
        if (mDisconnectedReceiver != null)
            unregisterReceiver(mDisconnectedReceiver);
        super.onDestroy();
    }
}
