// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.app.Service;
import android.content.Intent;
import android.net.Uri;
import android.os.*;
import com.mediatek.bluetooth.opp.mmi.OppLog;
import com.mediatek.bluetooth.opp.mmi.Utils;
import com.mediatek.bluetooth.share.BluetoothShareTask;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            EventQueue, OppEvent, OppTaskHandler

public class OppServiceNative extends Service
{
    class MessageListener extends Thread
    {

        final OppServiceNative this$0;

        public void run()
        {
            OppLog.i("BtTask MessageListener thread starting...");
            Process.setThreadPriority(10);
            startListenNative();
            OppLog.i("BtTask MessageListener thread stopped.");
        }

        public void shutdown()
        {
            stopListenNative();
        }

        public void startup()
        {
            start();
        }

        public MessageListener()
        {
            this$0 = OppServiceNative.this;
            super("BtOppMessageListener");
        }
    }

    static final class TaskState extends Enum
    {

        private static final TaskState $VALUES[];
        public static final TaskState Aborted;
        public static final TaskState Aborting;
        public static final TaskState Idle;
        public static final TaskState Running;

        public static TaskState valueOf(String s)
        {
            return (TaskState)Enum.valueOf(com/mediatek/bluetooth/opp/adp/OppServiceNative$TaskState, s);
        }

        public static TaskState[] values()
        {
            return (TaskState[])$VALUES.clone();
        }

        static 
        {
            Running = new TaskState("Running", 0);
            Aborting = new TaskState("Aborting", 1);
            Aborted = new TaskState("Aborted", 2);
            Idle = new TaskState("Idle", 3);
            TaskState ataskstate[] = new TaskState[4];
            ataskstate[0] = Running;
            ataskstate[1] = Aborting;
            ataskstate[2] = Aborted;
            ataskstate[3] = Idle;
            $VALUES = ataskstate;
        }

        private TaskState(String s, int i)
        {
            super(s, i);
        }
    }


    private static final String NATIVE_LIB = "extopp_jni";
    private static MessageListener sMessageListener = null;
    boolean mIsAuthorized;
    boolean mIsListenDisconnect;
    protected boolean mIsServiceNativeEnabled;
    private int mNativeData;
    private Uri mOppcCurrentTask;
    private EventQueue mOppcEventQueue;
    private TaskState mOppcTaskState;
    private Uri mOppsCurrentTask;
    private EventQueue mOppsEventQueue;
    private TaskState mOppsTaskState;

    public OppServiceNative()
    {
        mOppcTaskState = TaskState.Idle;
        mOppcEventQueue = new EventQueue(20000, 4);
        mOppsTaskState = TaskState.Idle;
        mOppsEventQueue = new EventQueue(20000, 4);
        mIsServiceNativeEnabled = false;
        mIsAuthorized = false;
        mIsListenDisconnect = false;
    }

    private void checkQueue(EventQueue eventqueue)
    {
        if (eventqueue.size() != 0)
            OppLog.w((new StringBuilder()).append("queue size[").append(eventqueue.size()).append("]: ").append(eventqueue.getPrintableString()).toString());
    }

    protected static native void classInitNative();

    private void jniCallback(int i, String as[])
    {
        OppEvent oppevent = new OppEvent(i, as);
        OppLog.d((new StringBuilder()).append("jni cb event: ").append(oppevent.toString()).toString());
        if (i > 0 && i < 30)
        {
            mOppcEventQueue.notifyNewEvent(oppevent);
            return;
        }
        if (100 < i && i < 130)
        {
            mOppsEventQueue.notifyNewEvent(oppevent);
            return;
        } else
        {
            OppLog.e((new StringBuilder()).append("invalid jni cb event[").append(i).append("]").toString());
            return;
        }
    }

    private boolean oppcFinalEvent(BluetoothShareTask bluetoothsharetask, boolean flag)
    {
        if (mOppcTaskState != TaskState.Running)
            bluetoothsharetask.setState(6);
        else
        if (!flag)
            bluetoothsharetask.setState(7);
        mOppcTaskState = TaskState.Idle;
        checkQueue(mOppcEventQueue);
        return flag;
    }

    private boolean oppsFinalEvent(BluetoothShareTask bluetoothsharetask, boolean flag)
    {
        if (bluetoothsharetask.getState() == 2)
            bluetoothsharetask.setState(5);
        else
        if (mOppsTaskState != TaskState.Running)
            bluetoothsharetask.setState(6);
        else
        if (!flag)
            bluetoothsharetask.setState(7);
        mOppsTaskState = TaskState.Idle;
        checkQueue(mOppsEventQueue);
        return flag;
    }

    protected native void disableServiceNative();

    protected native boolean enableServiceNative();

    protected native void objectDeinitNative();

    protected native void objectInitNative();

    public IBinder onBind(Intent intent)
    {
        OppLog.w("unsupported function: OppServiceNative.onBind()");
        return null;
    }

    public void onCreate()
    {
        super.onCreate();
        objectInitNative();
        mIsServiceNativeEnabled = enableServiceNative();
        if (mIsServiceNativeEnabled && sMessageListener == null)
        {
            sMessageListener = new MessageListener();
            sMessageListener.startup();
        }
    }

    public void onDestroy()
    {
        if (mIsServiceNativeEnabled)
        {
            mIsServiceNativeEnabled = false;
            disableServiceNative();
        }
        objectDeinitNative();
        super.onDestroy();
    }

    public boolean oppcAbort(Uri uri)
    {
        if (uri != null && uri.equals(mOppcCurrentTask))
        {
            if (mOppcTaskState != TaskState.Aborted)
                mOppcTaskState = TaskState.Aborting;
            return true;
        } else
        {
            return false;
        }
    }

    protected native boolean oppcAbortNative();

    public boolean oppcConnect(String s)
    {
        checkQueue(mOppcEventQueue);
        mOppcEventQueue.clear();
        oppcConnectNative(s);
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppcConnect thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_45;
        OppLog.e("oppcConnect get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 5)
            break MISSING_BLOCK_LABEL_64;
        checkQueue(mOppcEventQueue);
        return true;
        if (oppevent.event != 16)
            break MISSING_BLOCK_LABEL_92;
        checkQueue(mOppcEventQueue);
        return false;
        OppLog.e((new StringBuilder()).append("invalid oppcConnect event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppcConnectNative(String s);

    public boolean oppcDisable()
    {
        checkQueue(mOppcEventQueue);
        mOppcEventQueue.clear();
        oppcDisableNative();
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppcDisable thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_42;
        OppLog.e("oppcDisable get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 3)
            break MISSING_BLOCK_LABEL_60;
        checkQueue(mOppcEventQueue);
        return true;
        if (oppevent.event != 4)
            break MISSING_BLOCK_LABEL_86;
        checkQueue(mOppcEventQueue);
        return false;
        OppLog.e((new StringBuilder()).append("invalid oppcDisable event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppcDisableNative();

    public boolean oppcDisconnect()
    {
        checkQueue(mOppcEventQueue);
        mOppcEventQueue.clear();
        oppcDisconnectNative();
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppcDisconnect thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_42;
        OppLog.e("oppcDisconnect get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 16)
            break MISSING_BLOCK_LABEL_61;
        checkQueue(mOppcEventQueue);
        return true;
        OppLog.e((new StringBuilder()).append("invalid oppcDisconnect event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppcDisconnectNative();

    public boolean oppcEnable()
    {
        checkQueue(mOppcEventQueue);
        mOppcEventQueue.clear();
        oppcEnableNative();
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppcEnable thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_42;
        OppLog.e("oppcEnable get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 1)
            break MISSING_BLOCK_LABEL_60;
        checkQueue(mOppcEventQueue);
        return true;
        if (oppevent.event != 2)
            break MISSING_BLOCK_LABEL_86;
        checkQueue(mOppcEventQueue);
        return false;
        OppLog.e((new StringBuilder()).append("invalid oppcEnable event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppcEnableNative();

    protected native boolean oppcExchangeObjectNative(String s, String s1, String s2, String s3);

    public Uri oppcGetCurrentTask()
    {
        return mOppcCurrentTask;
    }

    protected native boolean oppcPullObjectNative();

    public boolean oppcPush(BluetoothShareTask bluetoothsharetask, OppTaskHandler opptaskhandler)
        throws InterruptedException
    {
        checkQueue(mOppcEventQueue);
        OppLog.d((new StringBuilder()).append("oppc push object: ").append(bluetoothsharetask.getPrintableString()).toString());
        mOppcEventQueue.clear();
        if (mOppcTaskState == TaskState.Idle)
            mOppcTaskState = TaskState.Running;
        oppcPushNative(bluetoothsharetask.getMimeType(), bluetoothsharetask.getObjectName(), bluetoothsharetask.getData());
        int i = 0;
        long l = 0L;
        do
        {
            if (mOppcTaskState == TaskState.Aborting)
            {
                mOppcTaskState = TaskState.Aborted;
                oppcAbortNative();
            }
            OppEvent oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
            if (oppevent == null)
            {
                OppLog.w("oppcPush get NULL event (no available event and return-threshold is reach)");
                oppcDisconnectNative();
            } else
            {
                switch (oppevent.event)
                {
                case 16: // '\020'
                    mOppcTaskState = TaskState.Idle;
                    bluetoothsharetask.setState(7);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return false;

                case 9: // '\t'
                    mOppcTaskState = TaskState.Idle;
                    String as1[] = oppevent.parameters;
                    bluetoothsharetask.setState(7);
                    OppLog.w((new StringBuilder()).append("oppcPushObject - push response: GOEP RSP[").append(Utils.getGoepResponseCodeString(as1[0])).append("]").toString());
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return true;

                case 5: // '\005'
                    mOppcTaskState = TaskState.Idle;
                    bluetoothsharetask.setState(6);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return true;

                case 8: // '\b'
                    mOppcTaskState = TaskState.Idle;
                    bluetoothsharetask.setState(8);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return true;

                case 7: // '\007'
                    if (mOppcTaskState == TaskState.Running)
                    {
                        bluetoothsharetask.setState(4);
                        bluetoothsharetask.setDoneBytes(0L);
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 6: // '\006'
                    if (mOppcTaskState != TaskState.Running)
                        break;
                    long l1 = SystemClock.uptimeMillis();
                    if (l1 - l <= 800L)
                        break;
                    l = l1;
                    String as[] = oppevent.parameters;
                    bluetoothsharetask.setState(4);
                    bluetoothsharetask.setDoneBytes(Long.parseLong(as[0]));
                    bluetoothsharetask.setTotalBytes(Long.parseLong(as[1]));
                    int j = (int)((100L * bluetoothsharetask.getDoneBytes()) / bluetoothsharetask.getTotalBytes());
                    if (i < j)
                    {
                        i = j;
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 10: // '\n'
                case 11: // '\013'
                case 12: // '\f'
                case 13: // '\r'
                case 14: // '\016'
                case 15: // '\017'
                default:
                    OppLog.e((new StringBuilder()).append("oppcPushObject invalid event: [").append(oppevent.event).append("]").toString());
                    break;
                }
            }
        } while (true);
    }

    protected native boolean oppcPushNative(String s, String s1, String s2);

    public boolean oppcPushObject(BluetoothShareTask bluetoothsharetask, OppTaskHandler opptaskhandler)
        throws InterruptedException
    {
        checkQueue(mOppcEventQueue);
        OppLog.d((new StringBuilder()).append("oppc push object: ").append(bluetoothsharetask.getPrintableString()).toString());
        mOppcEventQueue.clear();
        if (mOppcTaskState == TaskState.Idle)
            mOppcTaskState = TaskState.Running;
        oppcPushObjectNative(bluetoothsharetask.getPeerAddr(), bluetoothsharetask.getMimeType(), bluetoothsharetask.getObjectName(), bluetoothsharetask.getData());
        int i = 0;
        long l = 0L;
        boolean flag = false;
        do
        {
            if (mOppcTaskState == TaskState.Aborting)
            {
                mOppcTaskState = TaskState.Aborted;
                if (!mOppcEventQueue.contains(new OppEvent(16, null)))
                    oppcDisconnectNative();
            }
            OppEvent oppevent = (OppEvent)mOppcEventQueue.waitNewEvent();
            if (oppevent == null)
            {
                OppLog.w("oppcPushObject get NULL event (no available event and return-threshold is reach)");
                oppcDisconnectNative();
            } else
            {
                switch (oppevent.event)
                {
                case 16: // '\020'
                    boolean flag1 = oppcFinalEvent(bluetoothsharetask, flag);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return flag1;

                case 9: // '\t'
                    if (mOppcTaskState == TaskState.Running)
                    {
                        String as1[] = oppevent.parameters;
                        bluetoothsharetask.setState(7);
                        OppLog.w((new StringBuilder()).append("oppcPushObject - push response: GOEP RSP[").append(Utils.getGoepResponseCodeString(as1[0])).append("]").toString());
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                        flag = false;
                    }
                    break;

                case 8: // '\b'
                    mOppcTaskState = TaskState.Running;
                    bluetoothsharetask.setState(8);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    flag = true;
                    break;

                case 7: // '\007'
                    if (mOppcTaskState == TaskState.Running)
                    {
                        bluetoothsharetask.setState(4);
                        bluetoothsharetask.setDoneBytes(0L);
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 6: // '\006'
                    if (mOppcTaskState != TaskState.Running)
                        break;
                    long l1 = SystemClock.uptimeMillis();
                    if (l1 - l <= 800L)
                        break;
                    l = l1;
                    String as[] = oppevent.parameters;
                    bluetoothsharetask.setState(4);
                    bluetoothsharetask.setDoneBytes(Long.parseLong(as[0]));
                    bluetoothsharetask.setTotalBytes(Long.parseLong(as[1]));
                    int j = (int)((100L * bluetoothsharetask.getDoneBytes()) / bluetoothsharetask.getTotalBytes());
                    if (i < j)
                    {
                        i = j;
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 10: // '\n'
                case 11: // '\013'
                case 12: // '\f'
                case 13: // '\r'
                case 14: // '\016'
                case 15: // '\017'
                default:
                    OppLog.e((new StringBuilder()).append("oppcPushObject invalid event: [").append(oppevent.event).append("]").toString());
                    break;
                }
            }
        } while (true);
    }

    protected native boolean oppcPushObjectNative(String s, String s1, String s2, String s3);

    public void oppcSetCurrentTask(Uri uri)
    {
        mOppcCurrentTask = uri;
    }

    public boolean oppsAbort(Uri uri)
    {
        if (uri != null && uri.equals(mOppsCurrentTask))
        {
            if (mOppsTaskState != TaskState.Aborted)
            {
                mOppsTaskState = TaskState.Aborting;
                mOppsEventQueue.cancelWaitNewEvent();
            }
            return true;
        } else
        {
            return false;
        }
    }

    public boolean oppsAccessResponse(BluetoothShareTask bluetoothsharetask, OppTaskHandler opptaskhandler)
        throws InterruptedException
    {
        byte byte0;
        if (bluetoothsharetask.getState() == 1)
            byte0 = 0;
        else
            byte0 = 67;
        String s = bluetoothsharetask.getData();
        if (s == null)
            s = "";
        String as[] = new String[2];
        as[0] = Long.toString(bluetoothsharetask.getTotalBytes());
        as[1] = s;
        OppLog.d((new StringBuilder()).append("oppsAccessResponse: goep[").append(byte0).append("], size[").append(as[0]).append("], file[").append(as[1]).append("]").toString());
        oppsAccessResponseNative(byte0, as);
        if (byte0 != 0)
        {
            mOppsTaskState = TaskState.Idle;
            bluetoothsharetask.setState(5);
            opptaskhandler.onObjectChange(bluetoothsharetask);
            return true;
        }
        mIsAuthorized = true;
        int i = 0;
        long l = 0L;
        do
        {
            if (mOppsTaskState == TaskState.Aborting)
            {
                mOppsTaskState = TaskState.Aborted;
                if (!mOppsEventQueue.contains(new OppEvent(112, null)))
                    oppsDisconnectNative();
            }
            OppEvent oppevent = (OppEvent)mOppsEventQueue.waitNewEvent();
            if (oppevent == null)
            {
                OppLog.w("oppsAccessResponse get NULL event (be canceled or no available event => return-threshold is reach)");
                oppsDisconnectNative();
            } else
            {
                switch (oppevent.event)
                {
                case 112: // 'p'
                    OppLog.d((new StringBuilder()).append("oppsAccessResponse push disconnect - state[").append(bluetoothsharetask.getState()).append("]").toString());
                    mIsAuthorized = false;
                    boolean flag2 = oppsFinalEvent(bluetoothsharetask, false);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return flag2;

                case 108: // 'l'
                    String as2[] = oppevent.parameters;
                    bluetoothsharetask.setState(7);
                    OppLog.w((new StringBuilder()).append("oppsAccessResponse get fail response :GOEP RSP[").append(Utils.getGoepResponseCodeString(as2[0])).append("]").toString());
                    boolean flag1 = oppsFinalEvent(bluetoothsharetask, false);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return flag1;

                case 107: // 'k'
                    mOppsTaskState = TaskState.Running;
                    bluetoothsharetask.setState(8);
                    boolean flag = oppsFinalEvent(bluetoothsharetask, true);
                    opptaskhandler.onObjectChange(bluetoothsharetask);
                    return flag;

                case 106: // 'j'
                    if (mOppsTaskState == TaskState.Running && bluetoothsharetask.getState() == 1)
                    {
                        bluetoothsharetask.setState(4);
                        bluetoothsharetask.setDoneBytes(0L);
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 105: // 'i'
                    if (mOppsTaskState != TaskState.Running)
                        break;
                    long l1 = SystemClock.uptimeMillis();
                    if (l1 - l <= 800L)
                        break;
                    l = l1;
                    String as1[] = oppevent.parameters;
                    bluetoothsharetask.setState(4);
                    bluetoothsharetask.setDoneBytes(Long.parseLong(as1[0]));
                    long l2 = bluetoothsharetask.getTotalBytes();
                    if (bluetoothsharetask.getDoneBytes() > l2)
                        l2 = bluetoothsharetask.getDoneBytes();
                    int j = 100;
                    if (l2 > 0L)
                        j = (int)((100L * bluetoothsharetask.getDoneBytes()) / l2);
                    if (i < j)
                    {
                        i = j;
                        opptaskhandler.onObjectChange(bluetoothsharetask);
                    }
                    break;

                case 109: // 'm'
                case 110: // 'n'
                case 111: // 'o'
                default:
                    OppLog.e((new StringBuilder()).append("invalid oppsAccessResponse event: [").append(oppevent.event).append("]").toString());
                    break;
                }
            }
        } while (true);
    }

    protected native boolean oppsAccessResponseNative(int i, String as[]);

    public boolean oppsDisable()
    {
        checkQueue(mOppsEventQueue);
        mOppsEventQueue.clear();
        oppsDisableNative();
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppsEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppsDisable thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_43;
        OppLog.e("oppsDisable get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 103)
            break MISSING_BLOCK_LABEL_62;
        checkQueue(mOppsEventQueue);
        return true;
        if (oppevent.event != 104)
            break MISSING_BLOCK_LABEL_90;
        checkQueue(mOppsEventQueue);
        return false;
        OppLog.e((new StringBuilder()).append("invalid oppsDisable event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppsDisableNative();

    protected native boolean oppsDisconnectNative();

    public boolean oppsEnable()
    {
        checkQueue(mOppsEventQueue);
        mIsAuthorized = false;
        mOppsEventQueue.clear();
        oppsEnableNative();
_L1:
        OppEvent oppevent;
        try
        {
            oppevent = (OppEvent)mOppsEventQueue.waitNewEvent();
        }
        catch (InterruptedException interruptedexception)
        {
            OppLog.w("oppsEnable thread interrupted");
            return false;
        }
        if (oppevent != null)
            break MISSING_BLOCK_LABEL_48;
        OppLog.e("oppsEnable get NULL event (no available event and return-threshold is reach)");
        return false;
        if (oppevent.event != 101)
            break MISSING_BLOCK_LABEL_67;
        checkQueue(mOppsEventQueue);
        return true;
        if (oppevent.event != 102)
            break MISSING_BLOCK_LABEL_95;
        checkQueue(mOppsEventQueue);
        return false;
label0:
        {
            if (oppevent.event != 103)
                break label0;
            OppLog.d("oppsEnable,event is BT_OPPS_DISABLE_SUCCESS");
        }
          goto _L1
        OppLog.e((new StringBuilder()).append("invalid oppsEnable event: [").append(oppevent.event).append("]").toString());
          goto _L1
    }

    protected native boolean oppsEnableNative();

    public Uri oppsGetCurrentTask()
    {
        return mOppsCurrentTask;
    }

    public boolean oppsIsAuthorized()
    {
        return mIsAuthorized;
    }

    public boolean oppsListenDisconnect()
        throws InterruptedException
    {
        mIsListenDisconnect = true;
        OppEvent oppevent = (OppEvent)mOppsEventQueue.waitNewEvent(0);
        mIsListenDisconnect = false;
        if (oppevent != null && oppevent.event == 112)
        {
            OppLog.d("oppsListenDisconnect(): disconnect event happened!");
            mIsAuthorized = false;
            return true;
        }
        if (oppevent != null)
            OppLog.w((new StringBuilder()).append("oppsListenDisconnect() - unexpected event:").append(oppevent).toString());
        return false;
    }

    public void oppsSetCurrentTask(Uri uri)
    {
        mOppsCurrentTask = uri;
    }

    public void oppsStopListenDisconnect()
    {
        OppLog.d((new StringBuilder()).append("oppsStopListenDisconnect(): is listening=[").append(mIsListenDisconnect).append("]").toString());
        if (mIsListenDisconnect)
            mOppsEventQueue.cancelWaitNewEvent();
    }

    public OppEvent oppsWaitForAccessRequest()
        throws InterruptedException
    {
        do
        {
            OppEvent oppevent;
            do
                oppevent = (OppEvent)mOppsEventQueue.waitNewEvent(0);
            while (oppevent == null);
            switch (oppevent.event)
            {
            case 112: // 'p'
                mIsAuthorized = false;
                break;

            case 113: // 'q'
            case 114: // 'r'
                if (mOppsTaskState == TaskState.Idle)
                    mOppsTaskState = TaskState.Running;
                return oppevent;

            default:
                OppLog.e((new StringBuilder()).append("invalid oppsWaitForAccessRequest event: [").append(oppevent.event).append("]").toString());
                break;
            }
        } while (true);
    }

    protected native void startListenNative();

    protected native void stopListenNative();

    protected native boolean testJNI(int i, String as[]);

    static 
    {
        System.loadLibrary("extopp_jni");
        classInitNative();
    }
}
