// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.Bundle;
import android.preference.Preference;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.*;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, CachedBluetoothDeviceManager, CachedBluetoothDevice

public class BluetoothPermissionActivity extends AlertActivity
    implements android.content.DialogInterface.OnClickListener, android.preference.Preference.OnPreferenceChangeListener
{

    private static final boolean DEBUG = true;
    private static final String TAG = "BluetoothPermissionActivity";
    private BluetoothDevice mDevice;
    private Button mOkButton;
    private BroadcastReceiver mReceiver;
    private boolean mReceiverRegistered;
    private CheckBox mRememberChoice;
    private boolean mRememberChoiceValue;
    private String mReturnClass;
    private String mReturnPackage;
    private View mView;
    private TextView messageView;

    public BluetoothPermissionActivity()
    {
        mReturnPackage = null;
        mReturnClass = null;
        mRememberChoiceValue = false;
        mReceiver = new BroadcastReceiver() {

            final BluetoothPermissionActivity this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL"))
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (mDevice.equals(bluetoothdevice))
                        dismissDialog();
                }
            }

            
            {
                this$0 = BluetoothPermissionActivity.this;
                super();
            }
        }
;
        mReceiverRegistered = false;
    }

    private View createConnectionDialogView()
    {
        mView = getLayoutInflater().inflate(0x7f040010, null);
        messageView = (TextView)mView.findViewById(0x7f08001c);
        messageView.setText(createConnectionDisplayText());
        return mView;
    }

    private String createConnectionDisplayText()
    {
        String s;
        if (mDevice != null)
            s = mDevice.getAliasName();
        else
            s = null;
        if (s == null)
            s = getString(0x7f0b0653);
        return getString(0x7f0b02ee, new Object[] {
            s
        });
    }

    private View createPhonebookDialogView()
    {
        mView = getLayoutInflater().inflate(0x7f040012, null);
        messageView = (TextView)mView.findViewById(0x7f08001c);
        messageView.setText(createPhonebookDisplayText());
        mRememberChoice = (CheckBox)mView.findViewById(0x7f08001e);
        mRememberChoice.setChecked(false);
        mRememberChoice.setOnCheckedChangeListener(new android.widget.CompoundButton.OnCheckedChangeListener() {

            final BluetoothPermissionActivity this$0;

            public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
            {
                if (flag)
                {
                    mRememberChoiceValue = true;
                    return;
                } else
                {
                    mRememberChoiceValue = false;
                    return;
                }
            }

            
            {
                this$0 = BluetoothPermissionActivity.this;
                super();
            }
        }
);
        return mView;
    }

    private String createPhonebookDisplayText()
    {
        String s;
        if (mDevice != null)
            s = mDevice.getAliasName();
        else
            s = null;
        if (s == null)
            s = getString(0x7f0b0653);
        return getString(0x7f0b02f0, new Object[] {
            s, s
        });
    }

    private void dismissDialog()
    {
        dismiss();
    }

    private void onNegative()
    {
        Log.d("BluetoothPermissionActivity", (new StringBuilder()).append("onNegative mRememberChoiceValue: ").append(mRememberChoiceValue).toString());
        if (mRememberChoiceValue)
            savePhonebookPermissionChoice(2);
        sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", false, null, false);
        finish();
    }

    private void onPositive()
    {
        Log.d("BluetoothPermissionActivity", (new StringBuilder()).append("onPositive mRememberChoiceValue: ").append(mRememberChoiceValue).toString());
        if (mRememberChoiceValue)
            savePhonebookPermissionChoice(1);
        sendIntentToReceiver("android.bluetooth.device.action.CONNECTION_ACCESS_REPLY", true, "android.bluetooth.device.extra.ALWAYS_ALLOWED", mRememberChoiceValue);
        finish();
    }

    private void savePhonebookPermissionChoice(int i)
    {
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(this);
        CachedBluetoothDeviceManager cachedbluetoothdevicemanager = localbluetoothmanager.getCachedDeviceManager();
        CachedBluetoothDevice cachedbluetoothdevice = cachedbluetoothdevicemanager.findDevice(mDevice);
        if (cachedbluetoothdevice != null)
        {
            cachedbluetoothdevice.setPhonebookPermissionChoice(i);
            return;
        } else
        {
            cachedbluetoothdevicemanager.addDevice(localbluetoothmanager.getBluetoothAdapter(), localbluetoothmanager.getProfileManager(), mDevice).setPhonebookPermissionChoice(i);
            return;
        }
    }

    private void sendIntentToReceiver(String s, boolean flag, String s1, boolean flag1)
    {
        Intent intent = new Intent(s);
        if (mReturnPackage != null && mReturnClass != null)
            intent.setClassName(mReturnPackage, mReturnClass);
        byte byte0;
        if (flag)
            byte0 = 1;
        else
            byte0 = 2;
        intent.putExtra("android.bluetooth.device.extra.CONNECTION_ACCESS_RESULT", byte0);
        if (s1 != null)
            intent.putExtra(s1, flag1);
        intent.putExtra("android.bluetooth.device.extra.DEVICE", mDevice);
        sendBroadcast(intent, "android.permission.BLUETOOTH_ADMIN");
    }

    private void showConnectionDialog()
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b02ec);
        alertparams.mView = createConnectionDialogView();
        alertparams.mPositiveButtonText = getString(0x7f0b0267);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x7f0b0268);
        alertparams.mNegativeButtonListener = this;
        mOkButton = mAlert.getButton(-1);
        setupAlert();
    }

    private void showPhonebookDialog()
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b02ef);
        alertparams.mView = createPhonebookDialogView();
        alertparams.mPositiveButtonText = getString(0x1040013);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x1040009);
        alertparams.mNegativeButtonListener = this;
        mOkButton = mAlert.getButton(-1);
        setupAlert();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        switch (i)
        {
        case -2: 
            onNegative();
            return;

        case -1: 
            onPositive();
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        int i;
label0:
        {
            super.onCreate(bundle);
            Intent intent = getIntent();
            if (!intent.getAction().equals("android.bluetooth.device.action.CONNECTION_ACCESS_REQUEST"))
            {
                Log.e("BluetoothPermissionActivity", "Error: this activity may be started only with intent ACTION_CONNECTION_ACCESS_REQUEST");
                finish();
                return;
            }
            mDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            mReturnPackage = intent.getStringExtra("android.bluetooth.device.extra.PACKAGE_NAME");
            mReturnClass = intent.getStringExtra("android.bluetooth.device.extra.CLASS_NAME");
            i = intent.getIntExtra("android.bluetooth.device.extra.ACCESS_REQUEST_TYPE", 2);
            if (i == 1)
            {
                showConnectionDialog();
            } else
            {
                if (i != 2)
                    break label0;
                showPhonebookDialog();
            }
            registerReceiver(mReceiver, new IntentFilter("android.bluetooth.device.action.CONNECTION_ACCESS_CANCEL"));
            mReceiverRegistered = true;
            return;
        }
        Log.e("BluetoothPermissionActivity", (new StringBuilder()).append("Error: bad request type: ").append(i).toString());
        finish();
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mReceiverRegistered)
        {
            unregisterReceiver(mReceiver);
            mReceiverRegistered = false;
        }
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        return true;
    }




/*
    static boolean access$202(BluetoothPermissionActivity bluetoothpermissionactivity, boolean flag)
    {
        bluetoothpermissionactivity.mRememberChoiceValue = flag;
        return flag;
    }

*/
}
