// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.hid;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.content.*;
import android.os.*;
import android.view.*;
import android.widget.TextView;
import android.widget.Toast;
import com.android.internal.app.AlertActivity;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.bluetooth.hid:
//            IBluetoothHidServerNotify, BluetoothHidService

public class BluetoothHidAlert extends AlertActivity
    implements android.content.DialogInterface.OnClickListener
{

    private static final boolean DEBUG = true;
    private static final String TAG = "[BT][HID][BluetoothHidAlert]";
    private static boolean sBindService = false;
    private static boolean sOnlyOnce = true;
    String mAction;
    private TextView mContentView;
    String mDeviceAddr;
    String mDeviceName;
    private ServiceConnection mHidServerNotifyConn;
    private BroadcastReceiver mReceiver;
    private IBluetoothHidServerNotify mServerNotify;

    public BluetoothHidAlert()
    {
        mServerNotify = null;
        mDeviceName = new String();
        mDeviceAddr = new String();
        mAction = new String();
        mHidServerNotifyConn = new ServiceConnection() {

            final BluetoothHidAlert this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                mServerNotify = IBluetoothHidServerNotify.Stub.asInterface(ibinder);
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mServerNotify = null;
            }

            
            {
                this$0 = BluetoothHidAlert.this;
                super();
            }
        }
;
        mReceiver = new BroadcastReceiver() {

            final BluetoothHidAlert this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("com.mediatek.bluetooth.hid.finish".equals(intent.getAction()))
                {
                    Xlog.i("[BT][HID][BluetoothHidAlert]", "onReceive");
                    BluetoothHidAlert.sOnlyOnce = true;
                    finish();
                }
            }

            
            {
                this$0 = BluetoothHidAlert.this;
                super();
            }
        }
;
    }

    private View createView()
    {
        View view = getLayoutInflater().inflate(0x7f030006, null);
        String s = new String();
        mContentView = (TextView)view.findViewById(0x7f08000d);
        if (mContentView != null)
        {
            if (mAction.equals("disconnect"))
            {
                Object aobj2[] = new Object[1];
                aobj2[0] = mDeviceName;
                s = getString(0x7f05001c, aobj2);
            } else
            if (mAction.equals("unplug"))
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = mDeviceName;
                s = getString(0x7f05001d, aobj1);
            } else
            if (mAction.equals("authorize"))
            {
                Object aobj[] = new Object[1];
                aobj[0] = mDeviceName;
                s = getString(0x7f05001e, aobj);
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
    //                   -2 112
    //                   -1 25;
           goto _L1 _L2 _L3
_L1:
        return;
_L3:
        try
        {
            if (mAction.equals("disconnect"))
            {
                mServerNotify.disconnectReq(mDeviceAddr);
                return;
            }
        }
        catch (RemoteException remoteexception1)
        {
            remoteexception1.printStackTrace();
            return;
        }
        if (mAction.equals("unplug"))
        {
            mServerNotify.unplugReq(mDeviceAddr);
            return;
        }
        if (!mAction.equals("authorize")) goto _L1; else goto _L4
_L4:
        mServerNotify.authorizeReq(mDeviceAddr, true);
        return;
_L2:
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onClick:BUTTON_NEGATIVE");
        try
        {
            if (mAction.equals("authorize"))
                mServerNotify.authorizeReq(mDeviceAddr, false);
            mServerNotify.finishActionReq();
            return;
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
        return;
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onCreate");
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
            Xlog.i("[BT][HID][BluetoothHidAlert]", (new StringBuilder()).append("bluetoothHidAlert ").append(mDeviceAddr).toString());
            if (mDeviceAddr != null)
                mDeviceName = getDeviceName(mDeviceAddr);
            com.android.internal.app.AlertController.AlertParams alertparams = mAlertParams;
            alertparams.mIconId = 0x108009b;
            if (mAction != null)
            {
                if (mAction.equals("disconnect"))
                    alertparams.mTitle = getString(0x7f050008);
                else
                if (mAction.equals("unplug"))
                    alertparams.mTitle = getString(0x7f050009);
                else
                if (mAction.equals("authorize"))
                    alertparams.mTitle = getString(0x7f05000a);
                alertparams.mView = createView();
            }
            alertparams.mPositiveButtonText = getString(0x7f05000e);
            alertparams.mPositiveButtonListener = this;
            alertparams.mNegativeButtonText = getString(0x7f05000f);
            alertparams.mNegativeButtonListener = this;
            sOnlyOnce = false;
            setupAlert();
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
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onDestroy");
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4 || i == 3)
        {
            try
            {
                if (mAction.equals("authorize"))
                    mServerNotify.authorizeReq(mDeviceAddr, false);
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
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onPause");
    }

    protected void onStart()
    {
        super.onStart();
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onStart");
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothadapter == null)
        {
            Toast.makeText(this, "Bluetooth is not available", 1).show();
            finish();
            return;
        }
        if (bluetoothadapter.getState() != 13)
        {
            if (bindService(new Intent(this, com/mediatek/bluetooth/hid/BluetoothHidService), mHidServerNotifyConn, 1))
                sBindService = true;
        } else
        {
            finish();
        }
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("com.mediatek.bluetooth.hid.finish");
        registerReceiver(mReceiver, intentfilter);
    }

    protected void onStop()
    {
        super.onStop();
        Xlog.i("[BT][HID][BluetoothHidAlert]", "onStop:unbind hid service");
        sOnlyOnce = true;
        if (sBindService)
            unbindService(mHidServerNotifyConn);
        sBindService = false;
        unregisterReceiver(mReceiver);
    }



/*
    static IBluetoothHidServerNotify access$002(BluetoothHidAlert bluetoothhidalert, IBluetoothHidServerNotify ibluetoothhidservernotify)
    {
        bluetoothhidalert.mServerNotify = ibluetoothhidservernotify;
        return ibluetoothhidservernotify;
    }

*/


/*
    static boolean access$102(boolean flag)
    {
        sOnlyOnce = flag;
        return flag;
    }

*/
}
