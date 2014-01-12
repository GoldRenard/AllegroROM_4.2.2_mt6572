// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.pan;

import android.app.*;
import android.bluetooth.*;
import android.content.*;
import android.content.res.Resources;
import android.net.*;
import android.os.*;
import android.util.Log;
import android.widget.Toast;
import com.mediatek.bluetooth.BluetoothProfile;
import java.io.IOException;
import java.net.InetAddress;
import java.util.*;

// Referenced classes of package com.mediatek.bluetooth.pan:
//            BluetoothPanAlert

public class BluetoothPanService extends Service
{
    private class BluetoothPanDevice
    {

        private int mLocalRole;
        private int mState;
        final BluetoothPanService this$0;



/*
        static int access$702(BluetoothPanDevice bluetoothpandevice, int i)
        {
            bluetoothpandevice.mState = i;
            return i;
        }

*/



/*
        static int access$802(BluetoothPanDevice bluetoothpandevice, int i)
        {
            bluetoothpandevice.mLocalRole = i;
            return i;
        }

*/

        BluetoothPanDevice(int i, int j)
        {
            this$0 = BluetoothPanService.this;
            super();
            mState = i;
            mLocalRole = j;
        }
    }

    private class SocketListenerThread extends Thread
    {

        public boolean stopped;
        final BluetoothPanService this$0;

        public void run()
        {
            do
            {
                if (stopped)
                    break;
                if (!listentoSocketNative())
                    stopped = true;
            } while (true);
            Log.d("[BT][PAN][BluetoothPANService]", "SocketListener stopped.");
        }

        public void shutdown()
        {
            stopped = true;
            wakeupListenerNative();
        }

        private SocketListenerThread()
        {
            this$0 = BluetoothPanService.this;
            super();
        }

    }


    private static final String BLUETOOTH_IFACE_ADDR_START = "192.168.44.1";
    private static final String BLUETOOTH_PERM = "android.permission.BLUETOOTH";
    private static final int BLUETOOTH_PREFIX_LENGTH = 24;
    private static final boolean DEBUG = true;
    private static final String DHCP_DEFAULT_RANGE[] = {
        "192.168.44.2", "192.168.44.254", "192.168.45.2", "192.168.45.254"
    };
    private static final String DNS_DEFAULT_SERVER[] = {
        "8.8.8.8", "8.8.4.4"
    };
    private static final String MESSAGE_DISPLAY = "show toast";
    private static final int MESSAGE_DISPLAY_ID = 0;
    private static final int PAN_ID_START = 0;
    private static final String TAG = "[BT][PAN][BluetoothPANService]";
    private static int sPanAuthorizeNotify = 1 + PAN_ID_START;
    private static boolean sServerState = false;
    public static boolean sUtState = false;
    private BluetoothAdapter mAdapter;
    private IBluetooth mBluetoothService;
    private Context mContext;
    private String mDhcpRange[];
    private String mDnsServers[];
    private boolean mHasInitiated;
    private NotificationManager mNM;
    private int mNativeData;
    private INetworkManagementService mNetworkManagementService;
    private Notification mNoti;
    int mNotifyId;
    Map mNotifyMap;
    private final android.bluetooth.IBluetoothPan.Stub mPan = new android.bluetooth.IBluetoothPan.Stub() {

        final BluetoothPanService this$0;

        public void connect(BluetoothDevice bluetoothdevice)
        {
            String s = bluetoothdevice.getAddress();
            Log.d("[BT][PAN][BluetoothPANService]", "BluetoothPanServer Connect");
            connectPanDevice(s, 2);
        }

        public void disconnect(BluetoothDevice bluetoothdevice)
        {
            Log.d("[BT][PAN][BluetoothPANService]", "BluetoothPanServer Disconnect");
            String s = bluetoothdevice.getAddress();
            disconnectPanDevice(s);
        }

        public List getConnectedDevices()
        {
            ArrayList arraylist = new ArrayList();
            Iterator iterator = mPanDevices.keySet().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                BluetoothDevice bluetoothdevice = (BluetoothDevice)iterator.next();
                BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
                if (bluetoothpandevice == null)
                    break;
                if (bluetoothpandevice.mState == 2)
                    arraylist.add(bluetoothdevice);
            } while (true);
            return arraylist;
        }

        public List getDevicesMatchingConnectionStates(int ai[])
        {
            ArrayList arraylist = new ArrayList();
            Iterator iterator = mPanDevices.keySet().iterator();
label0:
            do
            {
                if (iterator.hasNext())
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)iterator.next();
                    BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
                    if (bluetoothpandevice != null)
                    {
                        int i = ai.length;
                        int j = 0;
                        do
                        {
                            if (j >= i)
                                continue label0;
                            if (ai[j] == bluetoothpandevice.mState)
                            {
                                arraylist.add(bluetoothdevice);
                                continue label0;
                            }
                            j++;
                        } while (true);
                    }
                }
                return arraylist;
            } while (true);
        }

        public int getState(BluetoothDevice bluetoothdevice)
        {
            BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
            if (bluetoothpandevice == null)
                return 0;
            else
                return bluetoothpandevice.mState;
        }

        public boolean isTetheringOn()
        {
            return mTetheringOn;
        }

        public void setBluetoothTethering(boolean flag)
        {
            if (!flag)
                disconnectPanServerDevices();
            if (mAdapter.getState() != 12 && flag)
            {
                IntentFilter intentfilter = new IntentFilter();
                intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
                mTetheringReceiver = new BroadcastReceiver() {

                    final _cls3 this$1;

                    public void onReceive(Context context, Intent intent)
                    {
                        if (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 10) == 12)
                        {
                            mTetheringOn = true;
                            mContext.unregisterReceiver(mTetheringReceiver);
                        }
                    }

            
            {
                this$1 = _cls3.this;
                super();
            }
                }
;
                mContext.registerReceiver(mTetheringReceiver, intentfilter);
                return;
            } else
            {
                mTetheringOn = flag;
                return;
            }
        }

            
            {
                this$0 = BluetoothPanService.this;
                super();
            }
    }
;
    private final IBluetoothPanAction.Stub mPanAction = new IBluetoothPanAction.Stub() {

        final BluetoothPanService this$0;

        public void authorizeRspAction(String s, boolean flag)
        {
            Log.d("[BT][PAN][BluetoothPANService]", "authorizeRspAction");
            authorizeRsp(s, flag);
        }

        public void disconnectPanDeviceAction(String s)
        {
            Log.d("[BT][PAN][BluetoothPANService]", "disconnectPanDeviceAction: ");
            disconnectPanDevice(s);
        }

            
            {
                this$0 = BluetoothPanService.this;
                super();
            }
    }
;
    private HashMap mPanDevices;
    private BroadcastReceiver mReceiver;
    private Handler mServiceHandler;
    private SocketListenerThread mSocketListener;
    private boolean mTetheringOn;
    private BroadcastReceiver mTetheringReceiver;
    private Intent mUpdateGNStateIntent;
    private Intent mUpdateNAPStateIntent;

    public BluetoothPanService()
    {
        mUpdateGNStateIntent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        mUpdateNAPStateIntent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        mSocketListener = null;
        mNotifyMap = new HashMap();
        mNM = null;
        mNoti = null;
        mNotifyId = 0;
        mTetheringReceiver = null;
        mHasInitiated = false;
        mReceiver = new BroadcastReceiver() {

            final BluetoothPanService this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if (s.equals("android.bluetooth.device.action.NAME_CHANGED"))
                {
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                    if (bluetoothdevice == null)
                        Log.e("[BT][PAN][BluetoothPANService]", "ERROR: device null");
                    else
                    if ((BluetoothPanDevice)mPanDevices.get(bluetoothdevice) != null)
                    {
                        String s1 = bluetoothdevice.getAddress();
                        boolean flag = mNotifyMap.containsKey(s1);
                        String s2 = null;
                        if (flag)
                            s2 = mNotifyMap.get(s1).toString();
                        if (s2 == null)
                        {
                            Log.e("[BT][PAN][BluetoothPANService]", "ERROR: notify_s null");
                            return;
                        } else
                        {
                            int i = Integer.parseInt(s2);
                            Notification notification = genPanNotification(i, bluetoothdevice, false);
                            mNM.notify(i, notification);
                            return;
                        }
                    }
                } else
                if (s.equals("android.bluetooth.adapter.action.STATE_CHANGED") && intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000) == 13 && mHasInitiated)
                {
                    unregisterReceiver(mReceiver);
                    localClearService();
                    mHasInitiated = false;
                    return;
                }
            }

            
            {
                this$0 = BluetoothPanService.this;
                super();
            }
        }
;
        mServiceHandler = new Handler() {

            final BluetoothPanService this$0;

            public void handleMessage(Message message)
            {
                super.handleMessage(message);
                Log.i("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("handleMessage(): ").append(message.what).toString());
                Bundle bundle = message.getData();
                String s;
                if (bundle != null)
                    s = bundle.getString("show toast");
                else
                    s = null;
                switch (message.what)
                {
                case 0: // '\0'
                    Toast.makeText(mContext, s, 1).show();
                    return;
                }
            }

            
            {
                this$0 = BluetoothPanService.this;
                super();
            }
        }
;
    }

    private void callback_pan_handle_activate_cnf(boolean flag)
    {
        if (flag)
        {
            sServerState = true;
            updateProfileState(11);
            return;
        } else
        {
            updateProfileState(14);
            return;
        }
    }

    private void callback_pan_handle_connect_cnf(boolean flag, String s, int i)
    {
        String s1 = new String();
        BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
        BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
        String s2 = bluetoothdevice.getName();
        if (bluetoothpandevice == null)
        {
            Log.e("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("unknow device when callback_pan_handle_connect_cnf:").append(s).toString());
            return;
        }
        int j = bluetoothpandevice.mState;
        if (flag)
        {
            if (bluetoothpandevice.mLocalRole == 0)
                s1 = getString(0x7f05005a, new Object[] {
                    s2
                });
            else
            if (bluetoothpandevice.mLocalRole == 1)
                s1 = getString(0x7f050058, new Object[] {
                    s2
                });
            try
            {
                enableTethering(i, bluetoothpandevice.mLocalRole);
            }
            catch (IOException ioexception)
            {
                Log.e("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("Error enableTethering :").append(ioexception).toString());
                return;
            }
            bluetoothpandevice.mState = 2;
            if (!mNotifyMap.containsKey(s))
            {
                mNotifyMap.put(s, Integer.valueOf(sPanAuthorizeNotify));
                sPanAuthorizeNotify = 1 + sPanAuthorizeNotify;
            }
            mNotifyId = Integer.parseInt(mNotifyMap.get(s).toString());
            mNoti = genPanNotification(mNotifyId, bluetoothdevice, false);
            mNM.notify(mNotifyId, mNoti);
        } else
        {
            if (bluetoothpandevice.mLocalRole == 0)
                s1 = getString(0x7f05005b, new Object[] {
                    s2
                });
            else
                s1 = getString(0x7f050059, new Object[] {
                    s2
                });
            bluetoothpandevice.mState = 0;
            if (mNotifyMap.containsKey(s))
            {
                mNotifyId = Integer.parseInt(mNotifyMap.get(s).toString());
                mNM.cancel(mNotifyId);
            }
        }
        sendServiceMsg(0, s1);
        updateSettingsState(j, bluetoothpandevice.mState, bluetoothdevice, bluetoothpandevice.mLocalRole);
    }

    private void callback_pan_handle_connect_ind(int i, String s, int j)
    {
        if (i == 0 && !mTetheringOn)
        {
            disconnectPanDevice(s);
            return;
        }
        int k = 0;
        BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
        BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
        if (bluetoothpandevice == null)
        {
            BluetoothPanDevice bluetoothpandevice1 = new BluetoothPanDevice(2, i);
            mPanDevices.put(bluetoothdevice, bluetoothpandevice1);
        } else
        {
            k = bluetoothpandevice.mState;
            bluetoothpandevice.mState = 2;
            bluetoothpandevice.mLocalRole = i;
        }
        try
        {
            enableTethering(j, i);
        }
        catch (IOException ioexception)
        {
            Log.e("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("Error enableTethering :").append(ioexception).toString());
            return;
        }
        updateSettingsState(k, 2, bluetoothdevice, i);
        if (!mNotifyMap.containsKey(s))
        {
            mNotifyMap.put(s, Integer.valueOf(sPanAuthorizeNotify));
            sPanAuthorizeNotify = 1 + sPanAuthorizeNotify;
        }
        mNotifyId = Integer.parseInt(mNotifyMap.get(s).toString());
        mNoti = genPanNotification(mNotifyId, bluetoothdevice, false);
        mNM.notify(mNotifyId, mNoti);
    }

    private void callback_pan_handle_connection_authorize_ind(int i, String s)
    {
        if (i == 0 && !mTetheringOn)
        {
            Object aobj[] = new Object[1];
            aobj[0] = mAdapter.getRemoteDevice(s).getName();
            sendServiceMsg(0, getString(0x7f05005c, aobj));
            authorizeRsp(s, false);
            return;
        }
        BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
        BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
        if (bluetoothpandevice == null)
        {
            BluetoothPanDevice bluetoothpandevice1 = new BluetoothPanDevice(1, i);
            mPanDevices.put(bluetoothdevice, bluetoothpandevice1);
        } else
        if (bluetoothpandevice.mState != 0)
        {
            authorizeRsp(s, false);
            return;
        }
        updateSettingsState(0, 1, bluetoothdevice, i);
        if (!mNotifyMap.containsKey(s))
        {
            mNotifyMap.put(s, Integer.valueOf(sPanAuthorizeNotify));
            sPanAuthorizeNotify = 1 + sPanAuthorizeNotify;
        }
        mNotifyId = Integer.parseInt(mNotifyMap.get(s).toString());
        mNoti = genPanNotification(mNotifyId, bluetoothdevice, true);
        mNM.notify(mNotifyId, mNoti);
    }

    private void callback_pan_handle_deactivate_cnf(boolean flag)
    {
        sServerState = false;
        if (flag)
        {
            updateProfileState(13);
            return;
        } else
        {
            updateProfileState(14);
            return;
        }
    }

    private void callback_pan_handle_disconnect_cnf(boolean flag, String s)
    {
        String s1 = new String();
        BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
        BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
        String s2 = bluetoothdevice.getName();
        if (bluetoothpandevice == null)
        {
            Log.e("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("unknow device when callback_pan_handle_disconnect_cnf:").append(s).toString());
            return;
        }
        int i = bluetoothpandevice.mState;
        int j;
        if (flag)
        {
            if (bluetoothpandevice.mLocalRole == 0)
                s1 = getString(0x7f05005f, new Object[] {
                    s2
                });
            else
            if (bluetoothpandevice.mLocalRole == 1)
            {
                s1 = getString(0x7f05005d, new Object[] {
                    s2
                });
                stopNetworkConfig();
            }
            mPanDevices.remove(bluetoothdevice);
            boolean flag1 = mNotifyMap.containsKey(s);
            j = 0;
            if (flag1)
            {
                mNotifyId = Integer.parseInt(mNotifyMap.get(s).toString());
                mNM.cancel(mNotifyId);
            }
        } else
        {
            if (bluetoothpandevice.mLocalRole == 0)
                s1 = getString(0x7f05005e, new Object[] {
                    s2
                });
            else
            if (bluetoothpandevice.mLocalRole == 1)
                s1 = getString(0x7f050060, new Object[] {
                    s2
                });
            bluetoothpandevice.mState = 2;
            j = bluetoothpandevice.mState;
        }
        sendServiceMsg(0, s1);
        updateSettingsState(i, j, bluetoothdevice, bluetoothpandevice.mLocalRole);
    }

    private void callback_pan_handle_disconnect_ind(String s)
    {
        String s1 = new String();
        BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
        BluetoothPanDevice bluetoothpandevice = (BluetoothPanDevice)mPanDevices.get(bluetoothdevice);
        String s2 = bluetoothdevice.getName();
        if (bluetoothpandevice == null)
        {
            Log.e("[BT][PAN][BluetoothPANService]", (new StringBuilder()).append("unknow device when callback_pan_handle_disconnect_ind:").append(s).toString());
            return;
        }
        if (bluetoothpandevice.mLocalRole == 0)
            s1 = getString(0x7f050062, new Object