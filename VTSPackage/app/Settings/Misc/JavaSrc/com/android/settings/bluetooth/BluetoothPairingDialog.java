// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.Bundle;
import android.text.*;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.app.AlertActivity;
import com.android.internal.app.AlertController;

// Referenced classes of package com.android.settings.bluetooth:
//            CachedBluetoothDeviceManager, LocalBluetoothManager

public final class BluetoothPairingDialog extends AlertActivity
    implements android.widget.CompoundButton.OnCheckedChangeListener, android.content.DialogInterface.OnClickListener, TextWatcher
{

    private static final int BLUETOOTH_PASSKEY_MAX_LENGTH = 6;
    private static final int BLUETOOTH_PIN_MAX_LENGTH = 16;
    private static final String TAG = "BluetoothPairingDialog";
    private BluetoothDevice mDevice;
    private Button mOkButton;
    private String mPairingKey;
    private EditText mPairingView;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BluetoothPairingDialog this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if ("android.bluetooth.device.action.BOND_STATE_CHANGED".equals(s))
            {
                int i = intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", 0x80000000);
                if (i == 12 || i == 10)
                    dismiss();
            } else
            if ("android.bluetooth.device.action.PAIRING_CANCEL".equals(s))
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (bluetoothdevice == null || bluetoothdevice.equals(mDevice))
                {
                    dismiss();
                    return;
                }
            }
        }

            
            {
                this$0 = BluetoothPairingDialog.this;
                super();
            }
    }
;
    private int mType;


    private void createConfirmationDialog(CachedBluetoothDeviceManager cachedbluetoothdevicemanager)
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b03cd);
        alertparams.mView = createView(cachedbluetoothdevicemanager);
        alertparams.mPositiveButtonText = getString(0x7f0b03d7);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x7f0b03d8);
        alertparams.mNegativeButtonListener = this;
        setupAlert();
    }

    private void createConsentDialog(CachedBluetoothDeviceManager cachedbluetoothdevicemanager)
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b03cd);
        alertparams.mView = createView(cachedbluetoothdevicemanager);
        alertparams.mPositiveButtonText = getString(0x7f0b03d7);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x7f0b03d8);
        alertparams.mNegativeButtonListener = this;
        setupAlert();
    }

    private void createDisplayPasskeyOrPinDialog(CachedBluetoothDeviceManager cachedbluetoothdevicemanager)
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b03cd);
        alertparams.mView = createView(cachedbluetoothdevicemanager);
        alertparams.mNegativeButtonText = getString(0x1040000);
        alertparams.mNegativeButtonListener = this;
        setupAlert();
        if (mType == 4)
            mDevice.setPairingConfirmation(true);
        else
        if (mType == 5)
        {
            byte abyte0[] = BluetoothDevice.convertPinToBytes(mPairingKey);
            mDevice.setPin(abyte0);
            return;
        }
    }

    private View createPinEntryView(String s)
    {
label0:
        {
            View view = getLayoutInflater().inflate(0x7f040014, null);
            TextView textview = (TextView)view.findViewById(0x7f08001c);
            TextView textview1 = (TextView)view.findViewById(0x7f080022);
            CheckBox checkbox = (CheckBox)view.findViewById(0x7f080021);
            mPairingView = (EditText)view.findViewById(0x7f08001f);
            mPairingView.addTextChangedListener(this);
            checkbox.setOnCheckedChangeListener(this);
            int i;
            int j;
            byte byte0;
            switch (mType)
            {
            default:
                break label0;

            case 1: // '\001'
                i = 0x7f0b03cf;
                j = 0x7f0b03d3;
                byte0 = 6;
                checkbox.setVisibility(8);
                break;

            case 0: // '\0'
                i = 0x7f0b03ce;
                j = 0x7f0b03d2;
                byte0 = 16;
                break;
            }
            textview.setText(Html.fromHtml(getString(i, new Object[] {
                s
            })));
            textview1.setText(j);
            mPairingView.setInputType(2);
            EditText edittext = mPairingView;
            InputFilter ainputfilter[] = new InputFilter[1];
            ainputfilter[0] = new android.text.InputFilter.LengthFilter(byte0);
            edittext.setFilters(ainputfilter);
            return view;
        }
        Log.e("BluetoothPairingDialog", (new StringBuilder()).append("Incorrect pairing type for createPinEntryView: ").append(mType).toString());
        return null;
    }

    private void createUserEntryDialog(CachedBluetoothDeviceManager cachedbluetoothdevicemanager)
    {
        com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
        alertparams.mIconId = 0x108009b;
        alertparams.mTitle = getString(0x7f0b03cd);
        alertparams.mView = createPinEntryView(cachedbluetoothdevicemanager.getName(mDevice));
        alertparams.mPositiveButtonText = getString(0x104000a);
        alertparams.mPositiveButtonListener = this;
        alertparams.mNegativeButtonText = getString(0x1040000);
        alertparams.mNegativeButtonListener = this;
        setupAlert();
        mOkButton = mAlert.getButton(-1);
        mOkButton.setEnabled(false);
    }

    private View createView(CachedBluetoothDeviceManager cachedbluetoothdevicemanager)
    {
label0:
        {
            View view = getLayoutInflater().inflate(0x7f040013, null);
            String s = cachedbluetoothdevicemanager.getName(mDevice);
            TextView textview = (TextView)view.findViewById(0x7f08001c);
            String s1;
            switch (mType)
            {
            default:
                break label0;

            case 4: // '\004'
            case 5: // '\005'
                Object aobj1[] = new Object[2];
                aobj1[0] = s;
                aobj1[1] = mPairingKey;
                s1 = getString(0x7f0b03d6, aobj1);
                break;

            case 3: // '\003'
            case 6: // '\006'
                s1 = getString(0x7f0b03d5, new Object[] {
                    s
                });
                break;

            case 2: // '\002'
                Object aobj[] = new Object[2];
                aobj[0] = s;
                aobj[1] = mPairingKey;
                s1 = getString(0x7f0b03d4, aobj);
                break;
            }
            textview.setText(Html.fromHtml(s1));
            return view;
        }
        Log.e("BluetoothPairingDialog", "Incorrect pairing type received, not creating view");
        return null;
    }

    private void onCancel()
    {
        if (mType != 4 && mType != 5)
        {
            mDevice.cancelPairingUserInput();
            return;
        } else
        {
            mDevice.cancelBondProcess();
            return;
        }
    }

    private void onPair(String s)
    {
        switch (mType)
        {
        case 6: // '\006'
            mDevice.setRemoteOutOfBandData();
            return;

        case 2: // '\002'
        case 3: // '\003'
            mDevice.setPairingConfirmation(true);
            return;

        case 1: // '\001'
            int i = Integer.parseInt(s);
            mDevice.setPasskey(i);
            return;

        case 0: // '\0'
            byte abyte0[] = BluetoothDevice.convertPinToBytes(s);
            if (abyte0 != null)
            {
                mDevice.setPin(abyte0);
                return;
            }
            break;

        default:
            Log.e("BluetoothPairingDialog", "Incorrect pairing type received");
            break;

        case 4: // '\004'
        case 5: // '\005'
            break;
        }
    }

    public void afterTextChanged(Editable editable)
    {
        if (mOkButton != null)
        {
            Button button = mOkButton;
            boolean flag;
            if (editable.length() > 0)
                flag = true;
            else
                flag = false;
            button.setEnabled(flag);
        }
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void onBackPressed()
    {
        try
        {
            super.onBackPressed();
            return;
        }
        catch (IllegalStateException illegalstateexception)
        {
            Log.e("BluetoothPairingDialog", illegalstateexception.getMessage());
        }
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        if (flag)
        {
            mPairingView.setInputType(1);
            return;
        } else
        {
            mPairingView.setInputType(2);
            return;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        switch (i)
        {
        case -1: 
            if (mPairingView != null)
            {
                onPair(mPairingView.getText().toString());
                return;
            } else
            {
                onPair(null);
                return;
            }
        }
        onCancel();
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (!intent.getAction().equals("android.bluetooth.device.action.PAIRING_REQUEST"))
        {
            Log.e("BluetoothPairingDialog", "Error: this activity may be started only with intent android.bluetooth.device.action.PAIRING_REQUEST");
            finish();
            return;
        }
        LocalBluetoothManager localbluetoothmanager = LocalBluetoothManager.getInstance(this);
        if (localbluetoothmanager == null)
        {
            Log.e("BluetoothPairingDialog", "Error: BluetoothAdapter not supported by system");
            finish();
            return;
        }
        CachedBluetoothDeviceManager cachedbluetoothdevicemanager = localbluetoothmanager.getCachedDeviceManager();
        mDevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
        mType = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_VARIANT", 0x80000000);
        switch (mType)
        {
        case 4: // '\004'
        case 5: // '\005'
            int j = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", 0x80000000);
            if (j == 0x80000000)
            {
                Log.e("BluetoothPairingDialog", "Invalid Confirmation Passkey or PIN received, not showing any dialog");
                return;
            }
            if (mType == 4)
            {
                Object aobj2[] = new Object[1];
                aobj2[0] = Integer.valueOf(j);
                mPairingKey = String.format("%06d", aobj2);
            } else
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = Integer.valueOf(j);
                mPairingKey = String.format("%04d", aobj1);
            }
            createDisplayPasskeyOrPinDialog(cachedbluetoothdevicemanager);
            break;

        case 3: // '\003'
        case 6: // '\006'
            createConsentDialog(cachedbluetoothdevicemanager);
            break;

        case 2: // '\002'
            int i = intent.getIntExtra("android.bluetooth.device.extra.PAIRING_KEY", 0x80000000);
            if (i == 0x80000000)
            {
                Log.e("BluetoothPairingDialog", "Invalid Confirmation Passkey received, not showing any dialog");
                return;
            }
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            mPairingKey = String.format("%06d", aobj);
            createConfirmationDialog(cachedbluetoothdevicemanager);
            break;

        case 0: // '\0'
        case 1: // '\001'
            createUserEntryDialog(cachedbluetoothdevicemanager);
            break;

        default:
            Log.e("BluetoothPairingDialog", "Incorrect pairing type received, not showing any dialog");
            break;
        }
        registerReceiver(mReceiver, new IntentFilter("android.bluetooth.device.action.PAIRING_CANCEL"));
        registerReceiver(mReceiver, new IntentFilter("android.bluetooth.device.action.BOND_STATE_CHANGED"));
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
            onCancel();
        return super.onKeyDown(i, keyevent);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

}
