// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Service;
import android.bluetooth.*;
import android.content.*;
import android.os.*;
import android.util.Log;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantLock;

// Referenced classes of package com.android.phone:
//            BluetoothHandsfree, PhoneGlobals

public class BluetoothHeadsetService extends Service
{
    private class BluetoothRemoteHeadset
    {

        private int mAudioState;
        private int mHeadsetType;
        private android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo mIncomingInfo;
        private int mState;
        final BluetoothHeadsetService this$0;



/*
        static int access$002(BluetoothRemoteHeadset bluetoothremoteheadset, int i)
        {
            bluetoothremoteheadset.mState = i;
            return i;
        }

*/



/*
        static android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo access$1202(BluetoothRemoteHeadset bluetoothremoteheadset, android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo incomingconnectioninfo)
        {
            bluetoothremoteheadset.mIncomingInfo = incomingconnectioninfo;
            return incomingconnectioninfo;
        }

*/



/*
        static int access$2302(BluetoothRemoteHeadset bluetoothremoteheadset, int i)
        {
            bluetoothremoteheadset.mAudioState = i;
            return i;
        }

*/



/*
        static int access$602(BluetoothRemoteHeadset bluetoothremoteheadset, int i)
        {
            bluetoothremoteheadset.mHeadsetType = i;
            return i;
        }

*/

        BluetoothRemoteHeadset()
        {
            this$0 = BluetoothHeadsetService.this;
            super();
            mState = 0;
            mHeadsetType = 0;
            mIncomingInfo = null;
            mAudioState = 10;
        }

        BluetoothRemoteHeadset(int i, android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo incomingconnectioninfo)
        {
            this$0 = BluetoothHeadsetService.this;
            super();
            mState = 0;
            mHeadsetType = i;
            mIncomingInfo = incomingconnectioninfo;
            mAudioState = 10;
        }
    }


    private static final String BLUETOOTH_ADMIN_PERM = "android.permission.BLUETOOTH_ADMIN";
    private static final String BLUETOOTH_PERM = "android.permission.BLUETOOTH";
    private static final int CONNECT_HEADSET_DELAYED = 1;
    private static final boolean DBG = true;
    private static final String HEADSET_SERVICE_PREF = "HeadsetServicePreference";
    private static final String HEADSET_SERVICE_PREF_DEVICE = "Device";
    private static final String HEADSET_SERVICE_PREF_STATE = "State";
    private static final int PHONE_STATE_CHANGED = 1;
    private static final String PREF_LAST_HEADSET = "lastHeadsetAddress";
    private static final String PREF_NAME = com/android/phone/BluetoothHeadsetService.getSimpleName();
    private static final int RFCOMM_CONNECTED = 1;
    private static final int RFCOMM_ERROR = 2;
    private static final String TAG = "Bluetooth HSHFP";
    private static boolean sHasStarted = false;
    private BluetoothAdapter mAdapter;
    private BluetoothAudioGateway mAg;
    private BluetoothDevice mAudioConnectedDevice;
    private final android.bluetooth.IBluetoothHeadset.Stub mBinder = new android.bluetooth.IBluetoothHeadset.Stub() {

        final BluetoothHeadsetService this$0;

        public boolean acceptIncomingConnect(BluetoothDevice bluetoothdevice)
        {
label0:
            {
                synchronized (BluetoothHeadsetService.this)
                {
                    if ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice) != null)
                        break label0;
                    Log.e("Bluetooth HSHFP", "Cached Headset is Null in acceptIncomingConnect");
                }
                return false;
            }
            if (mAg.acceptConnection() <= 0)
                break MISSING_BLOCK_LABEL_67;
            setState(bluetoothdevice, 1);
            BluetoothHeadsetService.log("Successfully used incoming connection");
            return true;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean cancelConnectThread()
        {
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            BluetoothDevice bluetoothdevice;
            mAg.disconnect();
            bluetoothdevice = getCurrentDevice();
            if (bluetoothdevice == null)
                break MISSING_BLOCK_LABEL_38;
            setState(bluetoothdevice, 0);
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return true;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void clccResponse(int i, int j, int k, int l, boolean flag, String s, int i1)
        {
            BluetoothHeadsetService.log("clccResponse() called. No effect.");
        }

        public boolean connect(BluetoothDevice bluetoothdevice)
        {
            BluetoothDevice bluetoothdevice1;
label0:
            {
                enforceCallingOrSelfPermission("android.permission.BLUETOOTH_ADMIN", "Need BLUETOOTH_ADMIN permission");
                synchronized (BluetoothHeadsetService.this)
                {
                    bluetoothdevice1 = getCurrentDevice();
                    BluetoothHeadsetService.log((new StringBuilder()).append("Connect(").append(bluetoothdevice).append(") : curr=").append(bluetoothdevice1).toString());
                    if (!bluetoothdevice.equals(bluetoothdevice1) && getPriority(bluetoothdevice) != 0)
                        break label0;
                    BluetoothHeadsetService.log("Connecting failed");
                }
                return false;
            }
            if (bluetoothdevice1 == null)
                break MISSING_BLOCK_LABEL_97;
            disconnect(bluetoothdevice1);
            boolean flag = mBluetoothService.connectHeadset(bluetoothdevice.getAddress());
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
            RemoteException remoteexception;
            remoteexception;
            Log.e("Bluetooth HSHFP", "connectHeadset");
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
        }

        public boolean connectAudio()
        {
            BluetoothHeadsetService.log("connectAudio()");
            if (mBtHandsfree == null)
            {
                return false;
            } else
            {
                mBtHandsfree.audioOn();
                return true;
            }
        }

        public boolean connectHeadsetInternal(BluetoothDevice bluetoothdevice)
        {
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            BluetoothDevice bluetoothdevice1;
            bluetoothdevice1 = getCurrentDevice();
            BluetoothHeadsetService.log((new StringBuilder()).append("connectHeadsetInternal(").append(bluetoothdevice).append(") : curr=").append(bluetoothdevice1).toString());
            if (bluetoothdevice1 != null)
                break MISSING_BLOCK_LABEL_216;
            BluetoothRemoteHeadset bluetoothremoteheadset = new BluetoothRemoteHeadset();
            mRemoteHeadsets.put(bluetoothdevice, bluetoothremoteheadset);
            setState(bluetoothdevice, 1);
            BluetoothHeadsetService.log((new StringBuilder()).append("mIsAgStarted==").append(String.valueOf(mIsAgStarted)).toString());
            if (bluetoothdevice.getUuids() != null && mIsAgStarted)
                break MISSING_BLOCK_LABEL_200;
            Message message = new Message();
            message.what = 1;
            message.obj = bluetoothdevice;
            BluetoothHeadsetService.log((new StringBuilder()).append("uuid not ready delay connect to device ").append(bluetoothdevice).toString());
            mHandler.sendMessageDelayed(message, 1500L);
_L1:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return true;
            getSdpRecordsAndConnect(bluetoothdevice);
              goto _L1
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
            Log.w("Bluetooth HSHFP", (new StringBuilder()).append("connectHeadset(").append(bluetoothdevice).append("): failed: already in state ").append(((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice1)).mState).append(" with headset ").append(bluetoothdevice1).toString());
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
        }

        public boolean createIncomingConnect(BluetoothDevice bluetoothdevice)
        {
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mIncomingInfo;
            if (mAg.acceptConnection() <= 0)
                break MISSING_BLOCK_LABEL_51;
            setState(bluetoothdevice, 1);
            return true;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean disconnect(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH_ADMIN", "Need BLUETOOTH_ADMIN permission");
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            BluetoothRemoteHeadset bluetoothremoteheadset;
            bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            BluetoothHeadsetService.log((new StringBuilder()).append("disconnect(").append(bluetoothdevice).append(")").toString());
            if (bluetoothremoteheadset == null)
                break MISSING_BLOCK_LABEL_83;
            if (bluetoothremoteheadset.mState != 0 && bluetoothremoteheadset.mState != 3)
                break MISSING_BLOCK_LABEL_87;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            boolean flag = mBluetoothService.disconnectHeadset(bluetoothdevice.getAddress());
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
            RemoteException remoteexception;
            remoteexception;
            Log.e("Bluetooth HSHFP", "disconnectHeadset");
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
        }

        public boolean disconnectAudio()
        {
            BluetoothHeadsetService.log("disconnectAudio()");
            if (mBtHandsfree == null)
            {
                return false;
            } else
            {
                mBtHandsfree.audioOff();
                return true;
            }
        }

        public boolean disconnectHeadsetInternal(BluetoothDevice bluetoothdevice)
        {
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            BluetoothRemoteHeadset bluetoothremoteheadset;
            bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            BluetoothHeadsetService.log((new StringBuilder()).append("disconnectHeadsetInternal : ").append(bluetoothdevice).toString());
            if (bluetoothremoteheadset != null)
                break MISSING_BLOCK_LABEL_54;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            BluetoothHeadsetService.log((new StringBuilder()).append("remoteHeadset.mState = ").append(bluetoothremoteheadset.mState).toString());
            if (bluetoothremoteheadset.mState != 2)
                break MISSING_BLOCK_LABEL_121;
            setState(bluetoothdevice, 3);
            mAg.disconnect();
            setState(bluetoothdevice, 0);
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return true;
            if (bluetoothremoteheadset.mState != 1)
                break MISSING_BLOCK_LABEL_143;
            setState(bluetoothdevice, 0);
            return true;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int getAudioState(BluetoothDevice bluetoothdevice)
        {
            BluetoothRemoteHeadset bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            if (bluetoothremoteheadset == null)
                return 10;
            else
                return bluetoothremoteheadset.mAudioState;
        }

        public int getBatteryUsageHint(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothHeadsetService.log("[BIND] getBatteryUsageHint");
            return BluetoothAudioGateway.getAtInputCount();
        }

        public List getConnectedDevices()
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            return getDevicesMatchingConnectionStates(new int[] {
                2
            });
        }

        public int getConnectionState(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothRemoteHeadset bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            if (bluetoothremoteheadset == null)
                return 0;
            else
                return bluetoothremoteheadset.mState;
        }

        public List getDevicesMatchingConnectionStates(int ai[])
        {
            this;
            JVM INSTR monitorenter ;
            ArrayList arraylist;
            Iterator iterator;
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            arraylist = new ArrayList();
            iterator = mRemoteHeadsets.keySet().iterator();
_L5:
            if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
            BluetoothDevice bluetoothdevice;
            int i;
            int j;
            bluetoothdevice = (BluetoothDevice)iterator.next();
            i = getConnectionState(bluetoothdevice);
            j = ai.length;
            int k = 0;
_L3:
            if (k >= j)
                continue; /* Loop/switch isn't completed */
            if (ai[k] == i)
            {
                arraylist.add(bluetoothdevice);
                continue; /* Loop/switch isn't completed */
            }
            break MISSING_BLOCK_LABEL_108;
            Exception exception;
            exception;
            throw exception;
            k++;
            if (true) goto _L3; else goto _L2
_L2:
            this;
            JVM INSTR monitorexit ;
            return arraylist;
            if (true) goto _L5; else goto _L4
_L4:
        }

        public int getPriority(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH_ADMIN", "Need BLUETOOTH_ADMIN permission");
            mPriorityLock.lock();
            int i;
            i = android.provider.Settings.Global.getInt(getContentResolver(), android.provider.Settings.Global.getBluetoothHeadsetPriorityKey(bluetoothdevice.getAddress()), -1);
            BluetoothHeadsetService.log((new StringBuilder()).append("Got priority: ").append(bluetoothdevice).append(" = ").append(i).toString());
            mPriorityLock.unlock();
            return i;
            Exception exception;
            exception;
            mPriorityLock.unlock();
            throw exception;
        }

        public boolean isAudioConnected(BluetoothDevice bluetoothdevice)
        {
            this;
            JVM INSTR monitorenter ;
            boolean flag;
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            flag = bluetoothdevice.equals(mAudioConnectedDevice);
            boolean flag1;
            if (flag)
                flag1 = true;
            else
                flag1 = false;
            this;
            JVM INSTR monitorexit ;
            return flag1;
            Exception exception;
            exception;
            throw exception;
        }

        public boolean isAudioOn()
        {
            BluetoothHeadsetService.log("isAudioOn()");
            if (mBtHandsfree == null)
                return false;
            else
                return mBtHandsfree.isAudioOn();
        }

        public void phoneStateChanged(int i, int j, int k, String s, int l)
        {
            BluetoothHeadsetService.log("phoneStateChanged() called. No effect.");
        }

        public boolean rejectIncomingConnect(BluetoothDevice bluetoothdevice)
        {
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            BluetoothRemoteHeadset bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            if (bluetoothremoteheadset == null)
                break MISSING_BLOCK_LABEL_48;
            android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo incomingconnectioninfo = bluetoothremoteheadset.mIncomingInfo;
            rejectIncomingConnection(incomingconnectioninfo);
_L1:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return true;
            Log.e("Bluetooth HSHFP", "Error no record of remote headset");
              goto _L1
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void roamChanged(boolean flag)
        {
            BluetoothHeadsetService.log("roamChanged() called. No effect.");
        }

        public boolean setAudioState(BluetoothDevice bluetoothdevice, int i)
        {
            int j = ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mAudioState;
            ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mAudioState = i;
            if (i == 12)
                mAudioConnectedDevice = bluetoothdevice;
            else
            if (i == 10)
                mAudioConnectedDevice = null;
            Intent intent = new Intent("android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED");
            intent.putExtra("android.bluetooth.profile.extra.STATE", i);
            intent.putExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", j);
            intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
            sendBroadcast(intent, "android.permission.BLUETOOTH");
            BluetoothHeadsetService.log((new StringBuilder()).append("AudioStateIntent: ").append(bluetoothdevice).append(" State: ").append(i).append(" PrevState: ").append(j).toString());
            return true;
        }

        public boolean setPriority(BluetoothDevice bluetoothdevice, int i)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH_ADMIN", "Need BLUETOOTH_ADMIN permission");
            mPriorityLock.lock();
            android.provider.Settings.Global.putInt(getContentResolver(), android.provider.Settings.Global.getBluetoothHeadsetPriorityKey(bluetoothdevice.getAddress()), i);
            BluetoothHeadsetService.log((new StringBuilder()).append("Saved priority ").append(bluetoothdevice).append(" = ").append(i).toString());
            mPriorityLock.unlock();
            return true;
            Exception exception;
            exception;
            mPriorityLock.unlock();
            throw exception;
        }

        public boolean startScoUsingVirtualVoiceCall(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            if (bluetoothdevice == null)
                break MISSING_BLOCK_LABEL_67;
            if (mRemoteHeadsets.get(bluetoothdevice) != null && ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState == 2 && getAudioState(bluetoothdevice) == 10)
                break MISSING_BLOCK_LABEL_71;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            boolean flag = mBtHandsfree.initiateScoUsingVirtualVoiceCall();
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean startVoiceRecognition(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            if (bluetoothdevice == null)
                break MISSING_BLOCK_LABEL_57;
            if (mRemoteHeadsets.get(bluetoothdevice) != null && ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState == 2)
                break MISSING_BLOCK_LABEL_61;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            boolean flag = mBtHandsfree.startVoiceRecognition();
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean stopScoUsingVirtualVoiceCall(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            if (bluetoothdevice == null)
                break MISSING_BLOCK_LABEL_67;
            if (mRemoteHeadsets.get(bluetoothdevice) != null && ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState == 2 && getAudioState(bluetoothdevice) != 10)
                break MISSING_BLOCK_LABEL_71;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            boolean flag = mBtHandsfree.terminateScoUsingVirtualVoiceCall();
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean stopVoiceRecognition(BluetoothDevice bluetoothdevice)
        {
            enforceCallingOrSelfPermission("android.permission.BLUETOOTH", "Need BLUETOOTH permission");
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            if (bluetoothdevice == null)
                break MISSING_BLOCK_LABEL_57;
            if (mRemoteHeadsets.get(bluetoothdevice) != null && ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState == 2)
                break MISSING_BLOCK_LABEL_61;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return false;
            boolean flag = mBtHandsfree.stopVoiceRecognition();
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return flag;
            Exception exception;
            exception;
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$0 = BluetoothHeadsetService.this;
                super();
            }
    }
;
    private final BroadcastReceiver mBluetoothReceiver = new BroadcastReceiver() {

        final BluetoothHeadsetService this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s;
            BluetoothDevice bluetoothdevice;
            BluetoothDevice bluetoothdevice1;
            int i;
            s = intent.getAction();
            bluetoothdevice = (BluetoothDevice)intent.getParcelableExtra("android.bluetooth.device.extra.DEVICE");
            bluetoothdevice1 = getCurrentDevice();
            i = 0;
            if (bluetoothdevice1 != null)
                i = ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice1)).mState;
            BluetoothHeadsetService.log((new StringBuilder()).append("[Intent] action=").append(s).append(", state=").append(String.valueOf(i)).toString());
            if (i != 2 && i != 1 || !s.equals("android.bluetooth.device.action.ACL_DISCONNECT_REQUESTED") || !bluetoothdevice.equals(bluetoothdevice1)) goto _L2; else goto _L1
_L1:
            mBinder.disconnect(bluetoothdevice1);
_L3:
            return;
_L2:
label0:
            {
                if (!s.equals("android.bluetooth.adapter.action.STATE_CHANGED"))
                    break label0;
                switch (intent.getIntExtra("android.bluetooth.adapter.extra.STATE", 0x80000000))
                {
                default:
                    return;

                case 12: // '\f'
                    broadcastHfpState(10);
                    mAg.start(mIncomingConnectionHandler);
                    mIsAgStarted = true;
                    mBtHandsfree.onBluetoothEnabled();
                    broadcastHfpState(11);
                    return;

                case 13: // '\r'
                    mBtHandsfree.onBluetoothDisabled();
                    break;
                }
                mAg.stop();
                mIsAgStarted = false;
                if (bluetoothdevice1 != null)
                    try
                    {
                        mBinder.disconnect(bluetoothdevice1);
                        return;
                    }
                    catch (RemoteException remoteexception)
                    {
                        return;
                    }
            }
              goto _L3
            if (!s.equals("android.media.VOLUME_CHANGED_ACTION"))
                continue; /* Loop/switch isn't completed */
            if (intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_TYPE", -1) != 6) goto _L3; else goto _L4
_L4:
            mBtHandsfree.sendScoGainUpdate(intent.getIntExtra("android.media.EXTRA_VOLUME_STREAM_VALUE", 0));
            return;
            if (!s.equals("android.bluetooth.device.action.UUID") || !bluetoothdevice.equals(mDeviceSdpQuery) || !bluetoothdevice.equals(bluetoothdevice1)) goto _L3; else goto _L5
_L5:
            getSdpRecordsAndConnect(bluetoothdevice);
            return;
            RemoteException remoteexception1;
            remoteexception1;
        }

            
            {
                this$0 = BluetoothHeadsetService.this;
                super();
            }
    }
;
    private IBluetooth mBluetoothService;
    private BluetoothHandsfree mBtHandsfree;
    private Context mContext;
    private BluetoothDevice mDeviceSdpQuery;
    private Handler mHandler;
    private final Handler mIncomingConnectionHandler = new Handler() {

        final BluetoothHeadsetService this$0;

        public void handleMessage(Message message)
        {
            BluetoothHeadsetService.log((new StringBuilder()).append("[API] handleMessage : ").append(String.valueOf(message.what)).toString());
            BluetoothHeadsetService bluetoothheadsetservice = BluetoothHeadsetService.this;
            bluetoothheadsetservice;
            JVM INSTR monitorenter ;
            if (message.what != 100) goto _L2; else goto _L1
_L1:
            int i = 1;
_L5:
            android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo incomingconnectioninfo;
            int j;
            incomingconnectioninfo = (android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo)message.obj;
            Log.i("Bluetooth HSHFP", (new StringBuilder()).append("Incoming rfcomm (").append(BluetoothHandsfree.typeToString(i)).append(") connection from ").append(incomingconnectioninfo.mRemoteDevice).append("on channel ").append(incomingconnectioninfo.mRfcommChan).toString());
            j = getPriority(incomingconnectioninfo.mRemoteDevice);
            if (j != 0) goto _L4; else goto _L3
_L3:
            BluetoothHeadsetService.logInfo((new StringBuilder()).append("Rejecting incoming connection because priority = ").append(j).toString());
            mAg.rejectConnection();
            mBluetoothService.notifyIncomingConnection(incomingconnectioninfo.mRemoteDevice.getAddress(), true);
_L29:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L2:
            if (message.what != 101)
                break MISSING_BLOCK_LABEL_203;
            i = 2;
              goto _L5
            message.what;
            JVM INSTR tableswitch 1 6: default 244
        //                       1 351
        //                       2 279
        //                       3 445
        //                       4 493
        //                       5 493
        //                       6 493;
               goto _L6 _L7 _L8 _L9 _L10 _L10 _L10
_L6:
            BluetoothHeadsetService.log((new StringBuilder()).append("[ERR] unknown msg=").append(String.valueOf(message.what)).toString());
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L41:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            Exception exception;
            throw exception;
_L8:
            BluetoothDevice bluetoothdevice3 = getCurrentDevice();
            if (bluetoothdevice3 != null) goto _L12; else goto _L11
_L11:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L12:
            BluetoothRemoteHeadset bluetoothremoteheadset5 = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice3);
            if (bluetoothremoteheadset5 != null) goto _L14; else goto _L13
_L13:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L14:
            if (bluetoothremoteheadset5.mState == 1) goto _L16; else goto _L15
_L15:
            BluetoothHeadsetService.log("RFCOMM_ERROR : mState != BluetoothHeadset.STATE_CONNECTING");
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L16:
            setState(bluetoothdevice3, 0);
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L7:
            BluetoothDevice bluetoothdevice2 = getCurrentDevice();
            if (bluetoothdevice2 != null) goto _L18; else goto _L17
_L17:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L18:
            BluetoothRemoteHeadset bluetoothremoteheadset4 = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice2);
            if (bluetoothremoteheadset4 != null) goto _L20; else goto _L19
_L19:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L20:
            if (bluetoothremoteheadset4.mState == 1) goto _L22; else goto _L21
_L21:
            BluetoothHeadsetService.log("RFCOMM_CONNECTED : mState != BluetoothHeadset.STATE_CONNECTING");
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L22:
            mBtHandsfree.connectHeadset(mAg, bluetoothremoteheadset4.mHeadsetType);
            setState(bluetoothdevice2, 2);
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L9:
            BluetoothDevice bluetoothdevice1;
            mBtHandsfree.resetAtState();
            mBtHandsfree.setVirtualCallInProgress(false);
            bluetoothdevice1 = getCurrentDevice();
            if (bluetoothdevice1 == null) goto _L24; else goto _L23
_L23:
            setState(bluetoothdevice1, 0);
_L24:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L10:
            if (message.obj != null) goto _L26; else goto _L25
_L25:
            BluetoothHeadsetService.logWarn("Remote Device is null when receive SCO msg");
            mBtHandsfree.handleSCOEvent(message.what, null);
_L28:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L26:
            mBtHandsfree.handleSCOEvent(message.what, (BluetoothDevice)message.obj);
            if (true) goto _L28; else goto _L27
_L27:
            RemoteException remoteexception;
            remoteexception;
            Log.e("Bluetooth HSHFP", "notifyIncomingConnection", remoteexception);
              goto _L29
_L4:
            BluetoothDevice bluetoothdevice = getCurrentDevice();
            BluetoothRemoteHeadset bluetoothremoteheadset = null;
            if (bluetoothdevice == null) goto _L31; else goto _L30
_L30:
            bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
            if (bluetoothremoteheadset == null) goto _L31; else goto _L32
_L32:
            int k = ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState;
            BluetoothRemoteHeadset bluetoothremoteheadset1 = bluetoothremoteheadset;
              goto _L33
_L34:
            bluetoothheadsetservice;
            JVM INSTR monitorexit ;
            return;
_L42:
            BluetoothRemoteHeadset bluetoothremoteheadset3 = new BluetoothRemoteHeadset(i, incomingconnectioninfo);
            mRemoteHeadsets.put(incomingconnectioninfo.mRemoteDevice, bluetoothremoteheadset3);
            mBluetoothService.notifyIncomingConnection(incomingconnectioninfo.mRemoteDevice.getAddress(), false);
              goto _L34
            RemoteException remoteexception2;
            remoteexception2;
            Log.e("Bluetooth HSHFP", "notifyIncomingConnection");
              goto _L34
_L43:
            if (incomingconnectioninfo.mRemoteDevice.equals(bluetoothdevice)) goto _L36; else goto _L35
_L35:
            BluetoothHeadsetService.logInfo((new StringBuilder()).append("Already attempting connect to ").append(bluetoothdevice).append(", disconnecting ").append(incomingconnectioninfo.mRemoteDevice).toString());
            mAg.rejectConnection();
            bluetoothremoteheadset1;
              goto _L34
_L36:
            BluetoothRemoteHeadset bluetoothremoteheadset2 = (BluetoothRemoteHeadset)mRemoteHeadsets.get(incomingconnectioninfo.mRemoteDevice);
            if (bluetoothremoteheadset2 == null) goto _L38; else goto _L37
_L37:
            bluetoothremoteheadset2.mHeadsetType = i;
            bluetoothremoteheadset2.mIncomingInfo = incomingconnectioninfo;
_L39:
            mBluetoothService.notifyIncomingConnection(incomingconnectioninfo.mRemoteDevice.getAddress(), false);
              goto _L34
            RemoteException remoteexception1;
            remoteexception1;
            Log.e("Bluetooth HSHFP", "notifyIncomingConnection");
              goto _L34
_L38:
            BluetoothHeadsetService.logWarn((new StringBuilder()).append("mRemoteHeadsets.get(").append(incomingconnectioninfo.mRemoteDevice).append(") returns null").toString());
              goto _L39
_L44:
            BluetoothHeadsetService.logInfo((new StringBuilder()).append("Already connected to ").append(bluetoothdevice).append(", disconnecting ").append(incomingconnectioninfo.mRemoteDevice).toString());
            rejectIncomingConnection(incomingconnectioninfo);
              goto _L40
            exception;
            bluetoothremoteheadset1;
              goto _L41
_L31:
            bluetoothremoteheadset1 = bluetoothremoteheadset;
            k = 0;
              goto _L33
            exception;
              goto _L41
_L33:
            k;
            JVM INSTR tableswitch 0 2: default 980
        //                       0 631
        //                       1 704
        //                       2 882;
               goto _L40 _L42 _L43 _L44
_L40:
            bluetoothremoteheadset1;
              goto _L34
        }

            
            {
                this$0 = BluetoothHeadsetService.this;
                super();
            }
    }
;
    private boolean mIsAgStarted;
    private PowerManager mPowerManager;
    private ReentrantLock mPriorityLock;
    private ConcurrentHashMap mRemoteHeadsets;
    private long mTimestamp;

    public BluetoothHeadsetService()
    {
        mIsAgStarted = false;
        mHandler = new Handler() {

            final BluetoothHeadsetService this$0;

            public void handleMessage(Message message)
            {
                switch (message.what)
                {
                case 1: // '\001'
                    BluetoothDevice bluetoothdevice = (BluetoothDevice)message.obj;
                    BluetoothHeadsetService.log((new StringBuilder()).append("CONNECT_HEADSET_DELAYED : ").append(bluetoothdevice).toString());
                    getSdpRecordsAndConnect(bluetoothdevice);
                    return;
                }
            }

            
            {
                this$0 = BluetoothHeadsetService.this;
                super();
            }
        }
;
    }

    private void adjustOtherHeadsetPriorities(BluetoothDevice bluetoothdevice)
    {
        Iterator iterator = mAdapter.getBondedDevices().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            BluetoothDevice bluetoothdevice1 = (BluetoothDevice)iterator.next();
            if (getPriority(bluetoothdevice1) >= 1000 && !bluetoothdevice1.equals(bluetoothdevice))
                setPriority(bluetoothdevice1, 100);
        } while (true);
    }

    private void broadcastHfpState(int i)
    {
        Intent intent = new Intent("android.bluetooth.profilemanager.action.PROFILE_CHANGED");
        intent.putExtra("android.bluetooth.profilemanager.extra.PROFILE", android.bluetooth.BluetoothProfileManager.Profile.Bluetooth_HEADSET);
        intent.putExtra("android.bluetooth.profilemanager.extra.EXTRA_NEW_STATE", i);
        sendBroadcast(intent, "android.permission.BLUETOOTH");
    }

    private BluetoothDevice getCurrentDevice()
    {
        this;
        JVM INSTR monitorenter ;
        Iterator iterator = mRemoteHeadsets.keySet().iterator();
_L4:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        BluetoothDevice bluetoothdevice;
        int i;
        bluetoothdevice = (BluetoothDevice)iterator.next();
        i = ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState;
        if (i != 1 && i != 2) goto _L4; else goto _L3
_L3:
        this;
        JVM INSTR monitorexit ;
        return bluetoothdevice;
_L2:
        bluetoothdevice = null;
        if (true) goto _L3; else goto _L5
_L5:
        Exception exception;
        exception;
        throw exception;
    }

    private int getPriority(BluetoothDevice bluetoothdevice)
    {
        int i;
        try
        {
            i = mBinder.getPriority(bluetoothdevice);
        }
        catch (RemoteException remoteexception)
        {
            Log.e("Bluetooth HSHFP", (new StringBuilder()).append("Error while getting priority for: ").append(bluetoothdevice).toString());
            return -1;
        }
        return i;
    }

    private void getSdpRecordsAndConnect(BluetoothDevice bluetoothdevice)
    {
        this;
        JVM INSTR monitorenter ;
        log("[API] getSdpRecordsAndConnect");
        if (bluetoothdevice == null) goto _L2; else goto _L1
_L1:
        boolean flag = bluetoothdevice.equals(getCurrentDevice());
        if (flag) goto _L3; else goto _L2
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        BluetoothRemoteHeadset bluetoothremoteheadset;
        if (mRemoteHeadsets == null)
            break MISSING_BLOCK_LABEL_62;
        bluetoothremoteheadset = (BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice);
        if (bluetoothremoteheadset == null)
            break MISSING_BLOCK_LABEL_62;
        if (bluetoothremoteheadset.mState != 2)
            break MISSING_BLOCK_LABEL_76;
        logWarn("getSdpRecordsAndConnect failed");
          goto _L2
        Exception exception;
        exception;
        throw exception;
        android.os.ParcelUuid aparceluuid[];
        android.os.ParcelUuid aparceluuid1[];
        aparceluuid = bluetoothdevice.getUuids();
        aparceluuid1 = mAdapter.getUuids();
        if (aparceluuid == null)
            break MISSING_BLOCK_LABEL_340;
        if (!BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.Handsfree) || !BluetoothUuid.isUuidPresent(aparceluuid1, BluetoothUuid.Handsfree_AG))
            break MISSING_BLOCK_LABEL_218;
        log("SDP UUID: TYPE_HANDSFREE");
        ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mHeadsetType = 2;
        bluetoothdevice.getServiceChannel(BluetoothUuid.Handsfree);
        if (mAdapter.isDiscovering())
            mAdapter.cancelDiscovery();
        if (mAg.waitForAsyncConnect(bluetoothdevice, 20000, 2) <= 0)
            break MISSING_BLOCK_LABEL_203;
_L4:
        if (getPriority(bluetoothdevice) < 1000)
            setPriority(bluetoothdevice, 1000);
          goto _L2
        log("[ERR] waitForAsyncConnect failed");
        setState(bluetoothdevice, 0);
          goto _L4
        if (!BluetoothUuid.isUuidPresent(aparceluuid, BluetoothUuid.HSP) || !BluetoothUuid.isUuidPresent(aparceluuid1, BluetoothUuid.HSP_AG))
            break MISSING_BLOCK_LABEL_340;
        log("SDP UUID: TYPE_HEADSET");
        ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mHeadsetType = 1;
        bluetoothdevice.getServiceChannel(BluetoothUuid.HSP);
        if (mAdapter.isDiscovering())
            mAdapter.cancelDiscovery();
        if (mAg.waitForAsyncConnect(bluetoothdevice, 20000, 1) <= 0)
            break MISSING_BLOCK_LABEL_325;
_L5:
        if (getPriority(bluetoothdevice) < 1000)
            setPriority(bluetoothdevice, 1000);
          goto _L2
        log("[ERR] waitForAsyncConnect failed");
        setState(bluetoothdevice, 0);
          goto _L5
        log("SDP UUID: TYPE_UNKNOWN");
        ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mHeadsetType = 0;
        setState(bluetoothdevice, 0);
          goto _L2
    }

    private static void log(String s)
    {
        Log.d("Bluetooth HSHFP", (new StringBuilder()).append("[BT][HFG]").append(s).toString());
    }

    private static void logInfo(String s)
    {
        Log.i("Bluetooth HSHFP", (new StringBuilder()).append("[BT][HFG]").append(s).toString());
    }

    private static void logWarn(String s)
    {
        Log.w("Bluetooth HSHFP", (new StringBuilder()).append("[BT][HFG]").append(s).toString());
    }

    private void rejectIncomingConnection(android.bluetooth.BluetoothAudioGateway.IncomingConnectionInfo incomingconnectioninfo)
    {
        mAg.disconnect();
    }

    private void setPriority(BluetoothDevice bluetoothdevice, int i)
    {
        try
        {
            mBinder.setPriority(bluetoothdevice, i);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("Bluetooth HSHFP", (new StringBuilder()).append("Error while setting priority for: ").append(bluetoothdevice).toString());
        }
    }

    private void setState(BluetoothDevice bluetoothdevice, int i)
    {
        this;
        JVM INSTR monitorenter ;
        int j = ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState;
        if (i == j)
            break MISSING_BLOCK_LABEL_285;
        log((new StringBuilder()).append("Device: ").append(bluetoothdevice).append(" Headset  state").append(j).append(" -> ").append(i).toString());
        if (j != 2)
            break MISSING_BLOCK_LABEL_81;
        mBtHandsfree.disconnectHeadset();
        Intent intent;
        intent = new Intent("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED");
        intent.putExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", j);
        intent.putExtra("android.bluetooth.profile.extra.STATE", i);
        intent.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
        if (i != 0)
            break MISSING_BLOCK_LABEL_144;
        ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mHeadsetType = 0;
        ((BluetoothRemoteHeadset)mRemoteHeadsets.get(bluetoothdevice)).mState = i;
        android.content.SharedPreferences.Editor editor = mContext.getSharedPreferences("HeadsetServicePreference", 0).edit();
        log((new StringBuilder()).append("Pref : Push device(").append(bluetoothdevice.getAddress()).append("), with state is ").append(i).toString());
        editor.putString("Device", bluetoothdevice.getAddress());
        editor.putInt("State", i);
        editor.apply();
        sendBroadcast(intent, "android.permission.BLUETOOTH");
        if (i != 2)
            break MISSING_BLOCK_LABEL_271;
        setPriority(bluetoothdevice, 1000);
        adjustOtherHeadsetPriorities(bluetoothdevice);
        mBluetoothService.sendConnectionStateChange(bluetoothdevice, 1, i, j);
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        RemoteException remoteexception;
        remoteexception;
        Log.e("Bluetooth HSHFP", "sendConnectionStateChange: exception");
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    public IBinder onBind(Intent intent)
    {
        return mBinder;
    }

    public void onCreate()
    {
        log("[API] onCreate");
        super.onCreate();
        mAdapter = BluetoothAdapter.getDefaultAdapter();
        mPowerManager = (PowerManager)getSystemService("power");
        mContext = getApplicationContext();
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        mBtHandsfree = BluetoothHandsfree.init(phoneglobals, phoneglobals.mCM);
        mAg = new BluetoothAudioGateway(mPowerManager, mAdapter);
        IntentFilter intentfilter = new IntentFilter("android.bluetooth.device.action.ACL_DISCONNECT_REQUESTED");
        intentfilter.addAction("android.bluetooth.adapter.action.STATE_CHANGED");
        intentfilter.addAction("android.media.VOLUME_CHANGED_ACTION");
        intentfilter.addAction("android.bluetooth.device.action.UUID");
        registerReceiver(mBluetoothReceiver, intentfilter);
        IBinder ibinder = ServiceManager.getService("bluetooth");
        if (ibinder == null)
        {
            throw new RuntimeException("Bluetooth service not available");
        } else
        {
            mBluetoothService = android.bluetooth.IBluetooth.Stub.asInterface(ibinder);
            mRemoteHeadsets = new ConcurrentHashMap();
            mPriorityLock = new ReentrantLock();
            return;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("Stopping BluetoothHeadsetService");
        unregisterReceiver(mBluetoothReceiver);
        mBtHandsfree.onBluetoothDisabled();
        mAg.stop();
        mIsAgStarted = false;
        sHasStarted = false;
        BluetoothDevice bluetoothdevice = getCurrentDevice();
        if (bluetoothdevice != null)
            setState(bluetoothdevice, 0);
    }

    public void onStart(Intent intent, int i)
    {
        log("[API] onStart");
        if (mAdapter == null)
        {
            logWarn("Stopping BluetoothHeadsetService: device does not have BT");
            stopSelf();
        } else
        if (!sHasStarted)
        {
            log("Starting BluetoothHeadsetService");
            if (mAdapter.isEnabled())
            {
                mAg.start(mIncomingConnectionHandler);
                mIsAgStarted = true;
                mBtHandsfree.onBluetoothEnabled();
            }
            SharedPreferences sharedpreferences = mContext.getSharedPreferences("HeadsetServicePreference", 0);
            String s = sharedpreferences.getString("Device", "");
            log((new StringBuilder()).append("Pref : last saved address=").append(s).toString());
            if (!s.isEmpty())
            {
                int j = sharedpreferences.getInt("State", 0);
                log((new StringBuilder()).append("Pref : address=").append(s).append(", state=").append(j).toString());
                if (j != 0)
                {
                    BluetoothDevice bluetoothdevice = mAdapter.getRemoteDevice(s);
                    if (bluetoothdevice != null)
                    {
                        Intent intent1 = new Intent("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED");
                        intent1.putExtra("android.bluetooth.profile.extra.PREVIOUS_STATE", j);
                        intent1.putExtra("android.bluetooth.profile.extra.STATE", 0);
                        intent1.putExtra("android.bluetooth.device.extra.DEVICE", bluetoothdevice);
                        intent1.putExtra("sync", true);
                        sendBroadcast(intent1, "android.permission.BLUETOOTH");
                        try
                        {
                            mBluetoothService.sendConnectionStateChange(bluetoothdevice, 1, 0, j);
                        }
                        catch (RemoteException remoteexception)
                        {
                            Log.e("Bluetooth HSHFP", "sendConnectionStateChange: exception");
                        }
                    }
                }
            }
            sHasStarted = true;
            return;
        }
    }











/*
    static boolean access$1702(BluetoothHeadsetService bluetoothheadsetservice, boolean flag)
    {
        bluetoothheadsetservice.mIsAgStarted = flag;
        return flag;
    }

*/






/*
    static BluetoothDevice access$2002(BluetoothHeadsetService bluetoothheadsetservice, BluetoothDevice bluetoothdevice)
    {
        bluetoothheadsetservice.mAudioConnectedDevice = bluetoothdevice;
        return bluetoothdevice;
    }

*/








}
