// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.pan;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.TextView;
import android.widget.Toast;
import com.android.internal.app.AlertActivity;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.bluetooth.pan:
//            IBluetoothPanAction, BluetoothPanService

public class BluetoothPanAlert extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    private static final int BLUETOOTHNOTIFYALERT = 1;
    private static final boolean DEBUG = true;
    private static final String TAG = "[BT][PAN][BluetoothPanAlert]";
    private static boolean sOnlyOnce = true;
    String mAction;
    private TextView mContentView;
    String mDeviceAddr;
    String mDeviceName;
    private ServiceConnection mPanAction;
    private BroadcastReceiver mReceiver;
    private IBluetoothPanAction mServerNotify;

    public BluetoothPanAlert()
    {
        mDeviceName = new String();
        mDeviceAddr = new String();
        mAction = new String();
        mServerNotify = null;
        mPanAction = new ServiceConnection() {

            final BluetoothPanAlert this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                mServerNotify = IBluetoothPanAction.Stub.asInterface(ibinder);
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mServerNotify = null;
            }

            
            {
                this$0 = BluetoothPanAlert.this;
                super();
            }
        }
;
        mReceiver = new BroadcastReceiver() {

            final BluetoothPanAlert this$0;

            public void onReceive(Context context, Intent intent)
            {
                if (intent.getAction().equals("android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED") && intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0) == 0)
                    finish();
            }

            
            {
                this$0 = BluetoothPanAlert.this;
                super();
            }
        }
;
    }

    private View createView()
    {
        View view = getLayoutInflater().inflate(0x7f030007, null);
        String s = new String();
        mContentView = (TextView)view.findViewById(0x7f08000d);
        if (mContentView != null)
        {
            if (mAction.equals("bt_pan_GN_device_authorize"))
            {
                Object aobj3[] = new Object[1];
                aobj3[0] = mDeviceName;
                s = getString(0x7f050044, aobj3);
            } else
            if (mAction.equals("bt_pan_NAP_device_authorize"))
            {
                Object aobj2[] = new Object[1];
                aobj2[0] = mDeviceName;
                s = getString(0x7f050045, aobj2);
            } else
            if (mAction.equals("bt_pan_GN_device_connected"))
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = mDeviceName;
                s = getString(0x7f050048, aobj1);
            } else
            if (mAction.equals("bt_pan_NAP_device_connected"))
            {
                Object aobj[] = new Object[1];
                aobj[0] = mDeviceName;
                s = getString(0x7f050049, aobj);
            }
            mContentView.setText(s);
        }
        return view;
    }

    private String getDeviceName(String s)
    {
        BluetoothDevice bluetoothdevice = BluetoothAdapter.getDefaultAdapter().getRemoteDevice(s);
        if (bluetoothdevice != null)
            return bluetoothdevice.getName();
        else
            return null;
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        i;
        JVM INSTR tableswitch -2 -1: default 24
    //                   -2 124
    //                   -1 33;
           goto _L1 _L2 _L3
_L1:
        sOnlyOnce = true;
        finish();
        return;
_L3:
        RemoteException remoteexception;
        if (mAction.equals("bt_pan_GN_device_authorize") || mAction.equals("bt_pan_NAP_device_authorize"))
        {
            mServerNotify.authorizeRspAction(mDeviceAddr, true);
            continue; /* Loop/switch isn't completed */
        }
        if (mAction.equals("bt_pan_GN_device_connected") || mAction.equals("bt_pan_NAP_device_connected"))
            mServerNotify.disconnectPanDeviceAction(mDeviceAddr);
        continue; /* Loop/switch isn't completed */
_L2:
        try
        {
            Xlog.i("[BT][PAN][BluetoothPanAlert]", "onClick:BUTTON_NEGATIVE");
            if (mAction.equals("bt_pan_GN_device_authorize") || mAction.equals("bt_pan_NAP_device_authorize"))
                mServerNotify.authorizeRspAction(mDeviceAddr, false);
        }
        // Misplaced declaration of an exception variable
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
        if (true) goto _L1; else goto _L4
_L4:
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.i("[BT][PAN][BluetoothPanAlert]", "onCreate");
        if (sOnlyOnce)
        {
            Bundle bundle1 = getIntent().getExtras();
            String s;
            if (bundle1 != null)
                s = bundle1.getString("device_addr");
            else
                s = null;
            mDeviceAddr = s;
            String s1 = null;
            if (bundle1 != null)
                s1 = bundle1.getString("action");
            mAction = s1;
            Xlog.i("[BT][PAN][BluetoothPanAlert]", (new StringBuilder()).append("bluetoothPanAlert ").append(mDeviceAddr).toString());
            if (mDeviceAddr != null)
                mDeviceName = getDeviceName(mDeviceAddr);
            com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
            alertparams.mIconId = 0x108009b;
            if (mAction != null)
            {
                if (mAction.equals("bt_pan_GN_device_authorize"))
                    alertparams.mTitle = getString(0x7f050042);
                else
                if (mAction.equals("bt_pan_NAP_device_authorize"))
                    alertparams.mTitle = getString(0x7f050043);
                else
                if (mAction.equals("bt_pan_GN_device_connected"))
                    alertparams.mTitle = getString(0x7f050046);
                else
                if (mAction.equals("bt_pan_NAP_device_connected"))
                    alertparams.mTitle = getString(0x7f050047);
                alertparams.mView = createView();
            }
            alertparams.mPositiveButtonText = getString(0x7f05004a);
            alertparams.mPositiveButtonListener = this;
            alertparams.mNegativeButtonText = getString(0x7f05004b);
            alertparams.mNegativeButtonListener = this;
            sOnlyOnce = false;
            setupAlert();
            registerReceiver(mReceiver, new IntentFilter("android.bluetooth.pan.profile.action.CONNECTION_STATE_CHANGED"));
            return;
        } else
        {
            dismiss();
            cancel();
            return;
        }
    }

    protected void onDestroy()
    {
        super.onDestroy();
        Xlog.i("[BT][PAN][BluetoothPanAlert]", "onDestroy");
        unregisterReceiver(mReceiver);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4 || i == 3)
        {
            if (mAction.equals("bt_pan_GN_device_authorize") || mAction.equals("bt_pan_NAP_device_authorize"))
                try
                {
                    mServerNotify.authorizeRspAction(mDeviceAddr, false);
                }
                catch (RemoteException remoteexception)
                {
                    remoteexception.printStackTrace();
                }
            sOnlyOnce = true;
            finish();
        }
        return super.onKeyDown(i, keyevent);
    }

    protected void onPause()
    {
        super.onPause();
        Xlog.i("[BT][PAN][BluetoothPanAlert]", "onPause");
    }

    protected void onStart()
    {
        super.onStart();
        Xlog.i("[BT][PAN][BluetoothPanAlert]", "onStart");
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter == null)
        {
            Toast.makeText(this, "Bluetooth is not available", 1).show();
            finish();
            return;
        }
        if (bluetoothadapter.getState() != 13)
        {
            bindService(new Intent(this, com/mediatek/bluetooth/pan/BluetoothPanService), mPanAction, 1);
            return;
        } else
        {
            finish();
            return;
        }
    }

    protected void onStop()
    {
        super.onStop();
        Xlog.i("[BT][PAN][BluetoothPanAlert]", "onStop:unbind pan service");
        sOnlyOnce = true;
        unbindService(mPanAction);
    }



/*
    static IBluetoothPanAction access$002(BluetoothPanAlert bluetoothpanalert, IBluetoothPanAction ibluetoothpanaction)
    {
        bluetoothpanalert.mServerNotify = ibluetoothpanaction;
        return ibluetoothpanaction;
    }

*/
}
