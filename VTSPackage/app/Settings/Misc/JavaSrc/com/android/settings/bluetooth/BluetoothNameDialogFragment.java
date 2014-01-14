// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.bluetooth;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.text.*;
import android.util.Log;
import android.view.*;
import android.widget.*;

// Referenced classes of package com.android.settings.bluetooth:
//            LocalBluetoothManager, Utf8ByteLengthFilter, LocalBluetoothAdapter

public final class BluetoothNameDialogFragment extends DialogFragment
    implements TextWatcher
{

    private static final int BLUETOOTH_NAME_MAX_LENGTH_BYTES = 59;
    private static final String KEY_NAME = "device_name";
    private static final String KEY_NAME_EDITED = "device_name_edited";
    static final String TAG = "BluetoothNameDialogFragment";
    private AlertDialog mAlertDialog;
    private boolean mDeviceNameEdited;
    private boolean mDeviceNameUpdated;
    EditText mDeviceNameView;
    final LocalBluetoothAdapter mLocalAdapter = LocalBluetoothManager.getInstance(getActivity()).getBluetoothAdapter();
    private Button mOkButton;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final BluetoothNameDialogFragment this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED"))
                updateDeviceName();
            else
            if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED") && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 12)
            {
                updateDeviceName();
                return;
            }
        }

            
            {
                this$0 = BluetoothNameDialogFragment.this;
                super();
            }
    }
;


    private View createDialogView(String s)
    {
        View view = ((LayoutInflater)getActivity().getSystemService("layout_inflater")).inflate(0x7f040034, null);
        mDeviceNameView = (EditText)view.findViewById(0x7f08007d);
        EditText edittext = mDeviceNameView;
        InputFilter ainputfilter[] = new InputFilter[1];
        ainputfilter[0] = new Utf8ByteLengthFilter(59);
        edittext.setFilters(ainputfilter);
        mDeviceNameView.setText(s);
        mDeviceNameView.addTextChangedListener(this);
        mDeviceNameView.setOnEditorActionListener(new android.widget.TextView.OnEditorActionListener() {

            final BluetoothNameDialogFragment this$0;

            public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent)
            {
                if (i == 6)
                {
                    setDeviceName(textview.getText().toString());
                    mAlertDialog.dismiss();
                    return true;
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = BluetoothNameDialogFragment.this;
                super();
            }
        }
);
        return view;
    }

    private void setDeviceName(String s)
    {
        Log.d("BluetoothNameDialogFragment", (new StringBuilder()).append("Setting device name to ").append(s).toString());
        mLocalAdapter.setName(s);
    }

    public void afterTextChanged(Editable editable)
    {
        boolean flag = true;
        if (mDeviceNameUpdated)
        {
            mDeviceNameUpdated = false;
            mOkButton.setEnabled(false);
        } else
        {
            mDeviceNameEdited = flag;
            if (mOkButton != null)
            {
                Button button = mOkButton;
                if (editable.length() == 0)
                    flag = false;
                button.setEnabled(flag);
                return;
            }
        }
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public Dialog onCreateDialog(Bundle bundle)
    {
        String s = mLocalAdapter.getName();
        if (bundle != null)
        {
            s = bundle.getString("device_name", s);
            mDeviceNameEdited = bundle.getBoolean("device_name_edited", false);
        }
        mAlertDialog = (new android.app.AlertDialog.Builder(getActivity())).setIcon(0x108009b).setTitle(0x7f0b02cc).setView(createDialogView(s)).setPositiveButton(0x7f0b02cd, new android.content.DialogInterface.OnClickListener() {

            final BluetoothNameDialogFragment this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                String s1 = mDeviceNameView.getText().toString();
                setDeviceName(s1);
            }

            
            {
                this$0 = BluetoothNameDialogFragment.this;
                super();
            }
        }
).setNegativeButton(0x1040000, null).create();
        mAlertDialog.getWindow().setSoftInputMode(5);
        return mAlertDialog;
    }

    public void onDestroy()
    {
        super.onDestroy();
        mAlertDialog = null;
        mDeviceNameView = null;
        mOkButton = null;
    }

    public void onPause()
    {
        super.onPause();
        getActivity().unregisterReceiver(mReceiver);
    }

    public void onResume()
    {
        super.onResume();
        if (mOkButton == null)
        {
            mOkButton = mAlertDialog.getButton(-1);
            mOkButton.setEnabled(mDeviceNameEdited);
        }
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        intentfilter.addAction("android.bluetooth.adapter.action.LOCAL_NAME_CHANGED");
        getActivity().registerReceiver(mReceiver, intentfilter);
    }

    public void onSaveInstanceState(Bundle bundle)
    {
        bundle.putString("device_name", mDeviceNameView.getText().toString());
        bundle.putBoolean("device_name_edited", mDeviceNameEdited);
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    void updateDeviceName()
    {
        if (mLocalAdapter != null && mLocalAdapter.isEnabled())
        {
            mDeviceNameUpdated = true;
            mDeviceNameEdited = false;
            mDeviceNameView.setText(mLocalAdapter.getName());
        }
    }


}
