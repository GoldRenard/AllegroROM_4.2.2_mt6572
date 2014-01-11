// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.hid;

import android.app.*;
import android.bluetooth.*;
import android.content.*;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.util.Log;
import android.widget.Toast;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.mediatek.bluetooth.hid:
//            BluetoothHidAlert, BluetoothHidActivity

public class BluetoothHidService extends Service
{
    private class ActionTimeoutThread extends Thread
    {

        public String mBTAddr;
        public String mState;
        private boolean mStoped;
        final BluetoothHidService this$0;

        private void actionTimeout(String s, String s1)
        {
            String s2;
            int i;
            s2 = getDeviceState(s);
            i = 0;
            if (s2 != null) goto _L2; else goto _L1
_L1:
            printLog((new StringBuilder()).append("ERROR: stateMap not contain ").append(s).toString(), 2);
_L6:
            return;
_L4:
            boolean flag;
            boolean flag1;
            boolean flag2;
            try
            {
                Thread.sleep(100L);
            }
            catch (InterruptedException interruptedexception)
            {
                printLog("Waiting for action was interrupted.", 2);
            }
            i += 100;
_L2:
            flag = s2.equals(s1);
            flag1 = false;
            if (flag)
                continue; /* Loop/switch isn't completed */
            flag2 = mStoped;
            flag1 = false;
            if (flag2)
                continue; /* Loop/switch isn't completed */
            if (i < 60000) goto _L4; else goto _L3
_L3:
            flag1 = true;
            if (!flag1) goto _L6; else goto _L5
_L5:
            printLog("Waiting action time-out. Force return.", 5);
            if (s1.equals("connected"))
            {
                serverDisconnectReqNative(s);
                sendServiceMsg(5, s);
                return;
            }
            if (s1.equals("disconnect"))
            {
                sendServiceMsg(7, s);
                return;
            }
            if (true) goto _L6; else goto _L7
_L7:
        }

        public void run()
        {
            actionTimeout(mBTAddr, mState);
        }

        public void shutdown()
        {
            mStoped = true;
        }

        private ActionTimeoutThread()
        {
            this$0 = BluetoothHidService.this;
            super();
            mStoped = false;
        }

    }

    private class SocketListenerThread extends Thread
    {

        public boolean mStopped;
        final BluetoothHidService this$0;

        public void run()
        {
            do
            {
                if (mStopped)
                    break;
                if (!listentoSocketNative())
                    mStopped = true;
            } while (true);
            printLog("SocketListener stopped.", 1);
        }

        public void shutdown()
        {
            mStopped = true;
            wakeupListenerNative();
        }

        private SocketListenerThread()
        {
            this$0 = BluetoothHidService.this;
            super();
        }

    }


    private static final int BT_HID_DEBUG_LOG = 1;
    private static final int BT_HID_ERROR_LOG = 2;
    private static final int BT_HID_INFO_LOG = 3;
    private static final String BT_HID_NOT_FOUNT = "BT_HID_NOT_FOUNT";
    private static final String BT_HID_SETTING_INFO = "BT_HID_SETTING_INFO";
    private static final int BT_HID_VERB_LOG = 4;
    private static final int BT_HID_WARN_LOG = 5;
    private static final boolean DEBUG = true;
    public static final String FINISH_ACTION = "com.mediatek.bluetooth.hid.finish";
    private static final int HID_ID_START = 10;
    private static final String TAG = "[BT][HID][BluetoothHidService]";
    private static int sHidConnectNotify = 11;
    private static boolean sServiceDisable;
    private static BluetoothHidService sUtInstance;
    public static boolean sUtState = false;
    private IBluetooth mBluetoothService;
    private ActionTimeoutThread mConnectTimeout;
    Context mCx;
    private ActionTimeoutThread mDisconnectTimeout;
    private final android.bluetooth.IBluetoothHid.Stub mHid = new android.bluetooth.IBluetoothHid.Stub() {

        final BluetoothHidService this$0;

        public void connect(BluetoothDevice bluetoothdevice)
            throws RemoteException
        {
            String s = bluetoothdevice.getAddress();
            printLog("BluetoothHidServer Connect", 1);
            String s1 = getDeviceState(s);
            if (s1 != null)
            {
                if (!s1.equals("connected") && !s1.equals("connecting"))
                {
                    connectHidDevice(s);
                    return;
                } else
                {
                    printLog("already connected", 1);
                    return;
                }
            } else
            {
                connectHidDevice(s);
                return;
            }
        }

        public void disconnect(BluetoothDevice bluetoothdevice)
            throws RemoteException
        {
            printLog("BluetoothHidServer Disconnect", 1);
            String s = bluetoothdevice.getAddress();
            disconnectHidDevice(s);
        }

        public BluetoothDevice[] getCurrentDevices()
            throws RemoteException
        {
            printLog("getCurrentDevices", 1);
            HashSet hashset = new HashSet();
            Set set = BluetoothAdapter.getDefaultAdapter().getBondedDevices();
            if (set != null)
            {
                Iterator iterator = set.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)iterator.next();
                    if (mStateMap.containsKey(bluetoothdevice.getAddress()) && ((String)mStateMap.get(bluetoothdevice.getAddress())).equals("connected"))
                        hashset.add(bluetoothdevice);
                } while (true);
            }
            printLog((new StringBuilder()).append("getCurrentDevices:deviceList.size=").append(hashset.size()).toString(), 4);
            return (BluetoothDevice[])hashset.toArray(new BluetoothDevice[hashset.size()]);
        }

        public void getProtocolMode(BluetoothDevice bluetoothdevice)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer getProtocolMode", 1);
                String s = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s))
                {
                    if (!((String)mStateMap.get(s)).equals("connected"))
                        break label0;
                    serverGetProtocolReqNative(s);
                }
                return;
            }
            printLog("error state to getProtocolMode", 2);
        }

        public void getReport(BluetoothDevice bluetoothdevice, byte byte0, byte byte1, int i)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer getReport", 1);
                String s = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s))
                {
                    if (!((String)mStateMap.get(s)).equals("connected"))
                        break label0;
                    serverGetReportReqNative(s, byte0, byte1);
                }
                return;
            }
            printLog("error state to getReport", 2);
        }

        public int getState(BluetoothDevice bluetoothdevice)
            throws RemoteException
        {
label0:
            {
label1:
                {
                    if (mStateMap.isEmpty())
                        return 0;
                    if (mStateMap.containsKey(bluetoothdevice.getAddress()))
                    {
                        String s = ((String)mStateMap.get(bluetoothdevice.getAddress())).toString();
                        if (s.equals("connecting") || s.equals("authorize"))
                            break label0;
                        if (s.equals("connected"))
                            return 2;
                        if (s.equals("disconnect"))
                            return 0;
                        if (s.equals("disconnecting") || s.equals("unplug"))
                            break label1;
                    }
                    return 0;
                }
                return 3;
            }
            return 1;
        }

        public void sendData(BluetoothDevice bluetoothdevice, String s)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer sendData", 1);
                String s1 = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s1))
                {
                    if (!((String)mStateMap.get(s1)).equals("connected"))
                        break label0;
                    serverSendReportReqNative(s1, s);
                }
                return;
            }
            printLog("error state to sendData", 2);
        }

        public void setProtocolMode(BluetoothDevice bluetoothdevice, int i)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer setProtocolMode", 1);
                String s = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s))
                {
                    if (!((String)mStateMap.get(s)).equals("connected"))
                        break label0;
                    serverSetProtocolReqNative(s, i);
                }
                return;
            }
            printLog("error state to setProtocolMode", 2);
        }

        public void setReport(BluetoothDevice bluetoothdevice, byte byte0, String s)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer setReport", 1);
                String s1 = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s1))
                {
                    if (!((String)mStateMap.get(s1)).equals("connected"))
                        break label0;
                    serverSetReportReqNative(s1, byte0, s);
                }
                return;
            }
            printLog("error state to setReport", 2);
        }

        public void virtualUnplug(BluetoothDevice bluetoothdevice)
            throws RemoteException
        {
label0:
            {
                printLog("BluetoothHidServer virtualUnplug", 1);
                String s = bluetoothdevice.getAddress();
                if (mStateMap.containsKey(s))
                {
                    if (!((String)mStateMap.get(s)).equals("connected"))
                        break label0;
                    serverUnplugReqNative(s);
                }
                return;
            }
            printLog("error state to virtualUnplug", 2);
        }

            
            {
                this$0 = BluetoothHidService.this;
                super();
            }
    }
;
    private final IBluetoothHidServerNotify.Stub mHidServerNotify = new IBluetoothHidServerNotify.Stub() {

        final BluetoothHidService this$0;

        public void activateReq()
        {
            printLog("BluetoothHidActivity Activate: ", 1);
            serverActivateReqNative();
        }

        public void authorizeReq(String s, boolean flag)
            throws RemoteException
        {
            printLog("BluetoothHidActivity authorizeReq", 1);
            serverAuthorizeReqNative(s, flag);
        }

        public void clearService()
            throws RemoteException
        {
            printLog("BluetoothHidActivity clearService", 1);
            localClearService();
        }

        public void connectReq(String s)
        {
            printLog("BluetoothHidActivity Connect", 1);
            String s1 = getDeviceState(s);
            if (s1 != null)
            {
                if (!s1.equals("connected") && !s1.equals("connecting"))
                {
                    connectHidDevice(s);
                    return;
                } else
                {
                    printLog("already connected", 1);
                    return;
                }
            } else
            {
                connectHidDevice(s);
                return;
            }
        }

        public void deactivateReq()
        {
            printLog("BluetoothHidActivity DeactivateReq", 1);
            serverDeactivateReqNative();
        }

        public void disconnectReq(String s)
        {
            printLog("BluetoothHidActivity Disconnect", 1);
            disconnectHidDevice(s);
        }

        public void finishActionReq()
            throws RemoteException
        {
            printLog("BluetoothHidActivity finishActionReq", 1);
            Intent intent = new Intent("com.mediatek.bluetooth.hid.finish");
            sendBroadcast(intent);
        }

        public void getIdleReq(String s)
        {
            printLog("BluetoothHidActivity getIdle", 1);
            serverGetIdleReqNative(s);
        }

        public void getProtocolReq(String s)
        {
            printLog("BluetoothHidActivity getProtocol", 1);
            serverGetProtocolReqNative(s);
        }

        public void getReportReq(String s)
        {
            printLog("BluetoothHidActivity getReport", 1);
            serverGetReportReqNative(s, 1, 1);
        }

        public String getStateByAddr(String s)
            throws RemoteException
        {
            return getDeviceState(s);
        }

        public void sendReportReq(String s, boolean flag)
        {
            printLog("BluetoothHidActivity sendReport", 1);
            if (flag)
            {
                serverSendReportReqNative(s, "BlueAngel HID PTS Test send report, the string should have a length larger then the MTU which is 48 in our solution");
                return;
            } else
            {
                serverSendReportReqNative(s, "BlueAngel");
                return;
            }
        }

        public void setIdleReq(String s)
        {
            printLog("BluetoothHidActivity setIdle", 1);
            serverSetIdleReqNative(s);
        }

        public void setProtocolReq(String s)
        {
            printLog("BluetoothHidActivity setProtocol", 1);
            serverSetProtocolReqNative(s, 0);
        }

        public void setReportReq(String s)
        {
            printLog("BluetoothHidActivity setReport", 1);
            serverSetReportReqNative(s, 2, "BlueAngel HID PTS Test set report");
        }

        public void unplugReq(String s)
        {
            printLog("BluetoothHidActivity unplug", 1);
            updateActivityUI(s, 0x7f05001f, false);
            updateSettingsState("disconnecting", getBluetoothDevice(s));
            serverUnplugReqNative(s);
        }

            
            {
                this$0 = BluetoothHidService.this;
                super();
            }
    }
;
    private NotificationManager mNM;
    private int mNativeData;
    Map mNotifyMap;
    PreferenceCategory mPC;
    Preference mPreference;
    private BroadcastReceiver mReceiver;
    private int mServerState;
    private Handler mServiceHandler;
    private SocketListenerThread mSocketListener;
    Map mStateMap;
    Intent mUpdateStateIntent;

    public BluetoothHidService()
    {
        mCx = this;
        mNM = null;
        mStateMap = new HashMap();
        mNotifyMap = new HashMap();
        mPreference = null;
        mUpdateStateIntent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        mSocketListener = null;
        mConnectTimeout = null;
        mDisconnectTimeout = null;
        mServiceHandler = new Handler() {

            final BluetoothHidService this$0;

            public void handleMessage(Message message)
            {
                String s;
                String s1;
                super.handleMessage(message);
                printLog((new StringBuilder()).append("handleMessage(): ").append(message.what).toString(), 3);
                Bundle bundle = message.getData();
                if (bundle != null)
                    s = bundle.getString("device_addr");
                else
                    s = null;
                s1 = new String();
                if (s != null)
                {
                    mPC = BluetoothHidActivity.getDeviceList();
                    if (mPC != null)
                        mPreference = mPC.findPreference(s);
                    BluetoothDevice bluetoothdevice = getBluetoothDevice(s);
                    Intent intent;
                    if (bluetoothdevice != null)
                    {
                        s1 = bluetoothdevice.getName();
                        if (s1 == null)
                            s1 = getDeviceName(s);
                    } else
                    {
                        s1 = getDeviceName(s);
                        if (s1 == null && mPreference != null)
                            s1 = mPreference.getTitle().toString();
                    }
                }
                message.what;
                JVM INSTR lookupswitch 11: default 240
            //                           0: 361
            //                           1: 423
            //                           2: 455
            //                           3: 497
            //                           4: 529
            //                           5: 778
            //                           6: 1045
            //                           7: 1361
            //                           10: 1584
            //                           11: 1690
            //                           27: 1726;
                   goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12
_L1:
                if (4 == message.what || 5 == message.what || 6 == message.what || 7 == message.what || 10 == message.what || 11 == message.what)
                {
                    intent = new Intent("com.mediatek.bluetooth.hid.finish");
                    sendBroadcast(intent);
                }
                return;
_L2:
                mServerState = 100;
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 11);
                sendBroadcast(mUpdateStateIntent);
                Intent intent1 = new Intent("android.bluetooth.input.profile.action.ACTION_BIND_SERVICE");
                sendBroadcast(intent1);
                continue; /* Loop/switch isn't completed */
_L3:
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 14);
                sendBroadcast(mUpdateStateIntent);
                continue; /* Loop/switch isn't completed */
_L4:
                mServerState = 104;
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 13);
                sendBroadcast(mUpdateStateIntent);
                continue; /* Loop/switch isn't completed */
_L5:
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 14);
                sendBroadcast(mUpdateStateIntent);
                continue; /* Loop/switch isn't completed */
_L6:
                Toast.makeText(mCx, getString(0x7f050016, new Object[] {
                    s1
                }), 1).show();
                mServerState = 102;
                updateSettingsState("connected", getBluetoothDevice(s));
                updateDeviceState(s, "connected");
                updateActivityUI(s, 0x7f05000b, true);
                if (!mNotifyMap.containsKey(s))
                {
                    mNotifyMap.put(s, Integer.valueOf(BluetoothHidService.sHidConnectNotify));
                    int i = 
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$0 = BluetoothHidService.this;
                super();
            }
        }
;
        mReceiver = new BroadcastReceiver() {

            final BluetoothHidService this$0;

            public void onReceive(Context context, Intent intent)
            {
                BluetoothDevice bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
                if (bluetoothdevice == null)
                {
                    printLog("ERROR: device null", 2);
                } else
                {
                    String s = bluetoothdevice.getAddress();
                    String s1 = bluetoothdevice.getName();
                    String s2 = getDeviceState(s);
                    boolean flag = mNotifyMap.containsKey(s);
                    String s3 = null;
                    if (flag)
                        s3 = mNotifyMap.get(s).toString();
                    if (s3 == null)
                    {
                        printLog("ERROR: notify_s null", 2);
                        return;
                    }
                    if ("android.bluetooth.device.action.BOND_STATE_CHANGED".equals(intent.getAction()) && intent.getIntExtra("android.bluetooth.device.extra.BOND_STATE", 0x80000000) == 10 && s != null)
                    {
                        mPC = BluetoothHidActivity.getDeviceList();
                        if (mPC != null)
                            mPreference = mPC.findPreference(s);
                        if (mPreference != null)
                            mPC.removePreference(mPreference);
                    }
                    if (s2 != null && "android.bluetooth.device.action.NAME_CHANGED".equals(intent.getAction()))
                    {
                        if (s2.equals("connected"))
                        {
                            int j = Integer.parseInt(s3);
                            Notification notification1 = genHidNotification(j, s1, s, "connected", false);
                            mNM.notify(j, notification1);
                            return;
                        }
                        if (s2.equals("authorize"))
                        {
                            int i = Integer.parseInt(s3);
                            Notification notification = genHidNotification(i, s1, s, "authorize", false);
                            mNM.notify(i, notification);
                            return;
                        }
                    }
                }
            }

            
            {
                this$0 = BluetoothHidService.this;
                super();
            }
        }
;
    }

    private native void cleanServiceNative();

    private void connectHidDevice(String s)
    {
        if (mConnectTimeout == null)
            mConnectTimeout = new ActionTimeoutThread();
        mConnectTimeout.setName("hidConnectTimeoutThread");
        mConnectTimeout.mBTAddr = s;
        mConnectTimeout.mState = "connected";
        mServerState = 105;
        printLog("connectHidDevice::updateActivityUI:hid_summary_connecting", 3);
        updateActivityUI(s, 0x7f05000c, false);
        updateSettingsState("connecting", getBluetoothDevice(s));
        updateDeviceState(s, "connecting");
        serverConnectReqNative(s);
        if (!mConnectTimeout.isAlive())
            mConnectTimeout.start();
    }

    private int convertStatusToInt(String s)
    {
label0:
        {
            if (s != null)
            {
                if (s.equals("connected"))
                    return 2;
                if (s.equals("connecting") || s.equals("authorize"))
                    break label0;
                if (!s.equals("disconnect") && (s.equals("disconnecting") || s.equals("unplug")))
                    return 3;
            }
            return 0;
        }
        return 1;
    }

    private void disconnectHidDevice(String s)
    {
label0:
        {
            if (mStateMap.containsKey(s))
            {
                if (!((String)mStateMap.get(s)).equals("connected"))
                    break label0;
                if (mDisconnectTimeout == null)
                    mDisconnectTimeout = new ActionTimeoutThread();
                mDisconnectTimeout.setName("hidDisconnectTimeoutThread");
                mDisconnectTimeout.mBTAddr = s;
                mDisconnectTimeout.mState = "disconnect";
                mServerState = 106;
                updateActivityUI(s, 0x7f05001f, false);
                updateSettingsState("disconnecting", getBluetoothDevice(s));
                updateDeviceState(s, "disconnecting");
                serverDisconnectReqNative(s);
                if (!mDisconnectTimeout.isAlive())
                    mDisconnectTimeout.start();
            }
            return;
        }
        printLog("error state to disconnect", 2);
    }

    private native void forceClearServerNative();

    private Notification genHidNotification(int i, String s, String s1, String s2, boolean flag)
    {
        Context context = getApplicationContext();
        Intent intent = new Intent();
        printLog((new StringBuilder()).append("genHidNotification ").append(s1).toString(), 3);
        String s3 = com/mediatek/bluetooth/hid/BluetoothHidAlert.getName();
        intent.setClassName(getPackageName(), s3).putExtra("device_addr", s1);
        Notification notification;
        if (s2.equals("connected"))
        {
            String s6 = getString(0x7f050010);
            String s7 = getString(0x7f050011);
            notification = new Notification(0x7f02000e, s6, System.currentTimeMillis());
            notification.flags = 2;
            intent.putExtra("action", "disconnect");
            PendingIntent pendingintent1 = PendingIntent.getActivity(getApplicationContext(), i, intent, 0x10000000);
            notification.setLatestEventInfo(context, s7, getString(0x7f050014, new Object[] {
                s
            }), pendingintent1);
        } else
        {
            boolean flag1 = s2.equals("authorize");
            notification = null;
            if (flag1)
            {
                String s4 = getString(0x7f050012);
                String s5 = getString(0x7f050013);
                Notification notification1 = new Notification(0x7f02000e, s4, System.currentTimeMillis());
                notification1.flags = 8;
                if (flag)
                {
                    notification1.defaults = 1 | notification1.defaults;
                    notification1.defaults = 2 | notification1.defaults;
                }
                intent.putExtra("action", "authorize");
                PendingIntent pendingintent = PendingIntent.getActivity(getApplicationContext(), i, intent, 0x10000000);
                notification1.setLatestEventInfo(context, s5, getString(0x7f050015, new Object[] {
                    s
                }), pendingintent);
                return notification1;
            }
        }
        return notification;
    }

    private BluetoothDevice getBluetoothDevice(String s)
    {
        return BluetoothAdapter.getDefaultAdapter().getRemoteDevice(s);
    }

    private String getDeviceName(String s)
    {
        SharedPreferences sharedpreferences = getSharedPreferences("BT_HID_SETTING_INFO", 0);
        int i = sharedpreferences.getInt("preferenceCount", 0);
        for (int j = 0; j < i; j++)
            if (sharedpreferences.getString((new StringBuilder()).append("deviceAddr").append(Integer.toString(j)).toString(), "BT_HID_NOT_FOUNT").equals(s))
                return sharedpreferences.getString((new StringBuilder()).append("deviceName").append(Integer.toString(j)).toString(), "BT_HID_NOT_FOUNT");

        return null;
    }

    private String getDeviceState(String s)
    {
        if (!mStateMap.isEmpty() && mStateMap.containsKey(s))
            return ((String)mStateMap.get(s)).toString();
        else
            return null;
    }

    public static BluetoothHidService getHidServiceUtInstance()
    {
        com/mediatek/bluetooth/hid/BluetoothHidService;
        JVM INSTR monitorenter ;
        BluetoothHidService bluetoothhidservice = sUtInstance;
        com/mediatek/bluetooth/hid/BluetoothHidService;
        JVM INSTR monitorexit ;
        return bluetoothhidservice;
        Exception exception;
        exception;
        throw exception;
    }

    private native boolean initServiceNative();

    private native boolean listentoSocketNative();

    private void printLog(String s, int i)
    {
        switch (i)
        {
        case 5: // '\005'
            Xlog.w("[BT][HID][BluetoothHidService]", s);
            return;

        case 4: // '\004'
            Xlog.v("[BT][HID][BluetoothHidService]", s);
            return;

        case 3: // '\003'
            Xlog.i("[BT][HID][BluetoothHidService]", s);
            return;

        case 2: // '\002'
            Xlog.e("[BT][HID][BluetoothHidService]", s);
            return;

        case 1: // '\001'
            Xlog.d("[BT][HID][BluetoothHidService]", s);
            return;
        }
    }

    private void sendServiceMsg(int i, String s)
    {
        Message message = Message.obtain();
        printLog((new StringBuilder()).append("sendServiceMsg status=").append(i).append("address=").append(s).toString(), 3);
        if (i == 2 || i == 3)
            mServerState = 104;
        if (i == 0)
            mServerState = 100;
        message.what = i;
        Bundle bundle = new Bundle();
        bundle.putString("device_addr", s);
        message.setData(bundle);
        mServiceHandler.sendMessage(message);
    }

    private native void serverActivateReqNative();

    private native void serverAuthorizeReqNative(String s, boolean flag);

    private native void serverConnectReqNative(String s);

    private native void serverDeactivateReqNative();

    private native void serverDisconnectReqNative(String s);

    private native void serverGetIdleReqNative(String s);

    private native void serverGetProtocolReqNative(String s);

    private native void serverGetReportReqNative(String s, int i, int j);

    private native void serverSendReportReqNative(String s, String s1);

    private native void serverSetIdleReqNative(String s);

    private native void serverSetProtocolReqNative(String s, int i);

    private native void serverSetReportReqNative(String s, int i, String s1);

    private native void serverUnplugReqNative(String s);

    private native void stopListentoSocketNative();

    private void updateActivityUI(String s, int i, boolean flag)
    {
        printLog("updateActivityUI", 4);
        Intent intent = new Intent("com.mediatek.bluetooth.BluetoothHidActivity.ACTION_SUMMARY_CHANGED");
        intent.putExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_DEVICE", s);
        intent.putExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_SUMMARY", i);
        intent.putExtra("com.mediatek.bluetooth.BluetoothHidActivity.extra.EXTRA_ENABLE", flag);
        printLog("updateActivityUI:sendBroadcast ", 3);
        sendBroadcast(intent);
    }

    private void updateDeviceState(String s, String s1)
    {
        mStateMap.put(s, s1);
    }

    private void updateSettingsState(String s, BluetoothDevice bluetoothdevice)
    {
        int i = convertStatusToInt((String)mStateMap.get(bluetoothdevice.getAddress()));
        int j = convertStatusToInt(s);
        Intent intent = new Intent("android.bluetooth.input.profile.action.CONNECTION_STATE_CHANGED");
        intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        intent.putExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", i);
        intent.putExtra("android.bluetooth.profile.extra.STATE", j);
        try
        {
            mBluetoothService.sendConnectionStateChange(bluetoothdevice, 4, j, i);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("[BT][HID][BluetoothHidService]", (new StringBuilder()).append("sendConnectionStateChange Exception: ").append(remoteexception).toString());
        }
        sendBroadcast(intent);
        printLog("updateSettingsState", 4);
    }

    private native void wakeupListenerNative();

    void localClearService()
    {
        int i;
        int j;
        boolean flag;
        i = 0;
        j = mServerState;
        flag = false;
        if (j == 104) goto _L2; else goto _L1
_L1:
        sServiceDisable = true;
        serverDeactivateReqNative();
_L7:
        int k;
        k = mServerState;
        flag = false;
        if (k == 104) goto _L2; else goto _L3
_L3:
        if (i < 5000) goto _L5; else goto _L4
_L4:
        flag = true;
_L2:
        if (flag)
        {
            printLog("Waiting DEREGISTER_SERVER_CNF time-out. Force clear server context.", 5);
            mServerState = 104;
            forceClearServerNative();
            sendServiceMsg(3, null);
        }
        InterruptedException interruptedexception3;
        if (mSocketListener != null)
            try
            {
                printLog("mSocketListener close.", 1);
                mSocketListener.shutdown();
                mSocketListener.join();
                mSocketListener = null;
                printLog("mSocketListener close OK.", 1);
            }
            catch (InterruptedException interruptedexception2)
            {
                printLog("mSocketListener close error.", 2);
            }
        if (mConnectTimeout != null)
            try
            {
                printLog("mConnectTimeout close.", 3);
                mConnectTimeout.shutdown();
                mConnectTimeout.join();
                mConnectTimeout = null;
                printLog("mConnectTimeout close OK.", 3);
            }
            catch (InterruptedException interruptedexception1)
            {
                printLog("mConnectTimeout close error.", 2);
            }
        if (mDisconnectTimeout != null)
            try
            {
                printLog("mDisconnectTimeout close.", 3);
                mDisconnectTimeout.shutdown();
                mDisconnectTimeout.join();
                mDisconnectTimeout = null;
                printLog("mDisconnectTimeout close OK.", 3);
            }
            catch (InterruptedException interruptedexception)
            {
                printLog("mDisconnectTimeout close error.", 2);
            }
        stopListentoSocketNative();
        cleanServiceNative();
        return;
_L5:
        try
        {
            Thread.sleep(100L);
        }
        // Misplaced declaration of an exception variable
        catch (InterruptedException interruptedexception3)
        {
            printLog("Waiting for server deregister-cnf was interrupted.", 2);
        }
        i += 100;
        if (true) goto _L7; else goto _L6
_L6:
    }

    void localCreateService()
    {
label0:
        {
            if (mServerState != 100)
            {
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_HID);
                mUpdateStateIntent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", 10);
                sendBroadcast(mUpdateStateIntent);
                if (!initServiceNative())
                    break label0;
                printLog("Succeed to init BluetoothHidService.", 1);
                if (mSocketListener == null)
                {
                    mSocketListener = new SocketListenerThread();
                    mSocketListener.setName("BTHidSocketListener");
                    mSocketListener.mStopped = false;
                    mSocketListener.start();
                    printLog("SocketListener started.", 1);
                }
                sServiceDisable = false;
                mServerState = 104;
                serverActivateReqNative();
                printLog("Pre-enable HID Server", 1);
            }
            return;
        }
        printLog("Failed to init BluetoothHidService.", 1);
    }

    public IBinder onBind(Intent intent)
    {
        String s = intent.getAction();
        printLog((new StringBuilder()).append("Enter onBind(): ").append(s).toString(), 3);
        if (android/bluetooth/IBluetoothHid.getName().equals(s))
            return mHid;
        else
            return mHidServerNotify;
    }

    public void onCreate()
    {
        printLog("Enter onCreate()", 1);
        mNM = (NotificationManager)getSystemService("notification");
        if (!sUtState)
            System.loadLibrary("exthid_jni");
        else
            System.loadLibrary("exthid_ut");
        if (mNM == null)
        {
            printLog("Get Notification-Manager failed. Stop HID service.", 1);
            stopSelf();
        }
        sUtInstance = this;
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.bluetooth.device.action.NAME_CHANGED");
        intentfilter.addAction("android.bluetooth.device.action.BOND_STATE_CHANGED");
        registerReceiver(mReceiver, intentfilter);
        localCreateService();
        IBinder ibinder = ServiceManager.getService("bluetooth");
        if (ibinder == null)
        {
            throw new RuntimeException("Bluetooth service not available");
        } else
        {
            mBluetoothService = android.bluetooth.IBluetooth.Stub.asInterface(ibinder);
            super.onCreate();
            return;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        printLog("onDestroy()", 1);
        unregisterReceiver(mReceiver);
        localClearService();
    }




















/*
    static int access$2502(BluetoothHidService bluetoothhidservice, int i)
    {
        bluetoothhidservice.mServerState = i;
        return i;
    }

*/




/*
    static int access$2708()
    {
        int i = sHidConnectNotify;
        sHidConnectNotify = i + 1;
        return i;
    }

*/






/*
    static ActionTimeoutThread access$3002(BluetoothHidService bluetoothhidservice, ActionTimeoutThread actiontimeoutthread)
    {
        bluetoothhidservice.mConnectTimeout = actiontimeoutthread;
        return actiontimeoutthread;
    }

*/




/*
    static ActionTimeoutThread access$3202(BluetoothHidService bluetoothhidservice, ActionTimeoutThread actiontimeoutthread)
    {
        bluetoothhidservice.mDisconnectTimeout = actiontimeoutthread;
        return actiontimeoutthread;
    }

*/





}
