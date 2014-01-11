// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt;

import android.content.*;
import android.media.MediaScannerConnection;
import android.os.*;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.mediatek.storage.StorageManagerEx;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

// Referenced classes of package com.mediatek.vt:
//            VTSettings, VTelProvider

public class VTManager
{
    public static final class State extends Enum
    {

        private static final State $VALUES[];
        public static final State CLOSE;
        public static final State CONNECTED;
        public static final State OPEN;
        public static final State READY;

        public static State valueOf(String s)
        {
            return (State)Enum.valueOf(com/mediatek/vt/VTManager$State, s);
        }

        public static State[] values()
        {
            return (State[])$VALUES.clone();
        }

        static 
        {
            CLOSE = new State("CLOSE", 0);
            OPEN = new State("OPEN", 1);
            READY = new State("READY", 2);
            CONNECTED = new State("CONNECTED", 3);
            State astate[] = new State[4];
            astate[0] = CLOSE;
            astate[1] = OPEN;
            astate[2] = READY;
            astate[3] = CONNECTED;
            $VALUES = astate;
        }

        private State(String s, int i)
        {
            super(s, i);
        }
    }

    private class TelMsgHandler extends Handler
    {

        final VTManager this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR lookupswitch 3: default 40
        //                       6: 41
        //                       7: 40
        //                       134217728: 206;
               goto _L1 _L2 _L1 _L3
_L1:
            return;
_L2:
            Handler handler;
            boolean flag;
            AsyncResult asyncresult;
            if (message.arg1 == 0)
                flag = true;
            else
                flag = false;
            asyncresult = (AsyncResult)message.obj;
            if (asyncresult != null)
                if (((int[])(int[])asyncresult.result)[0] != 0)
                    flag = true;
                else
                    flag = false;
            if (flag)
                break; /* Loop/switch isn't completed */
            if (State.CLOSE != mState && (State.OPEN != mState || mStartVTSMALFail))
                continue; /* Loop/switch isn't completed */
            handler = mTelMsgHandler;
            handler;
            JVM INSTR monitorenter ;
            Log.i("VTManager", "wait for setVTReadyImpl");
            mTelMsgHandler.wait();
_L5:
            if (!mStartVTSMALFail)
            {
                onConnected();
                return;
            }
            break; /* Loop/switch isn't completed */
            InterruptedException interruptedexception;
            interruptedexception;
            Log.e("VTManager", "wait for setVTReadyImpl, wait error");
            interruptedexception.printStackTrace();
            if (true) goto _L5; else goto _L4
_L4:
            if (true) goto _L1; else goto _L6
_L6:
            Exception exception;
            exception;
            handler;
            JVM INSTR monitorexit ;
            throw exception;
_L3:
            Looper.myLooper().quit();
            return;
        }

        private TelMsgHandler()
        {
            this$0 = VTManager.this;
            super();
        }

    }

    private class VTHanlder extends Handler
    {

        final VTManager this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 134217728: 
                Looper.myLooper().quit();
                return;

            case 2: // '\002'
                setVTReadyImpl();
                return;

            case 1: // '\001'
                setVTOpenImpl();
                return;

            case 0: // '\0'
                setVTCloseImpl();
                return;
            }
        }

        private VTHanlder()
        {
            this$0 = VTManager.this;
            super();
        }

    }


    public static final int QUIT_THREAD = 0x8000000;
    public static final int RECORD_TYPE_AUDIO_ONLY = 2;
    public static final int RECORD_TYPE_VIDEO_AUDIO = 1;
    public static final int RECORD_TYPE_VIDEO_ONLY = 3;
    public static final int SET_VT_CLOSE = 0;
    public static final int SET_VT_OPEN = 1;
    public static final int SET_VT_READY = 2;
    static final String TAG = "VTManager";
    private static final int VIDEO_TYPE_CAMERA = 0;
    private static final int VIDEO_TYPE_IMAGE = 1;
    private static final int VIDEO_TYPE_LAST_SHOT = 2;
    public static final int VT_ERROR_CALL_DISCONNECT = 32769;
    public static final int VT_ERROR_CAMERA = 32771;
    public static final int VT_ERROR_MEDIA_RECORDER_COMPLETE = 32775;
    public static final int VT_ERROR_MEDIA_RECORDER_EVENT_ERROR = 32774;
    public static final int VT_ERROR_MEDIA_RECORDER_EVENT_INFO = 32773;
    public static final int VT_ERROR_MEDIA_SERVER_DIED = 32772;
    public static final int VT_ERROR_START_VTS_FAIL = 32770;
    public static final int VT_MSG_CAM_BEGIN = 4096;
    public static final int VT_MSG_CLOSE = 1;
    public static final int VT_MSG_CONNECTED = 4;
    public static final int VT_MSG_DISCONNECTED = 5;
    public static final int VT_MSG_EM_INDICATION = 6;
    public static final int VT_MSG_OPEN = 2;
    public static final int VT_MSG_PEER_CAMERA_CLOSE = 16;
    public static final int VT_MSG_PEER_CAMERA_OPEN = 9;
    public static final int VT_MSG_READY = 3;
    public static final int VT_MSG_RECEIVE_FIRSTFRAME = 8;
    public static final int VT_MSG_RING = 7;
    public static final int VT_MSG_START_COUNTER = 7;
    public static final int VT_MSG_VTSTATUS = 6;
    public static final int VT_NORMAL_END_SESSION_COMMAND = 33025;
    public static final int VT_RET_FROM_JNI_FALSE = 1;
    public static final int VT_RET_FROM_JNI_TRUE = 0;
    public static final int VT_VQ_NORMAL = 1;
    public static final int VT_VQ_SHARP = 0;
    public static final int VT_VQ_SMOOTH = 2;
    private static VTManager sVTManager = new VTManager();
    Object mCallManager;
    private boolean mClosingVTService;
    Context mContext;
    private long mDateTakenRecording;
    private int mEnableReplacePeerVideo;
    private Integer mEndCallLock;
    private boolean mInvokeHideMeBeforeOpen;
    private boolean mInvokeLockPeerVideoBeforeOpen;
    private String mRecordedFileName;
    private String mRecordedFilePath;
    private String mReplacePeerVideoPicturePath;
    VTSettings mSettings;
    private int mSimId;
    private boolean mStartVTSMALFail;
    State mState;
    Handler mTelMsgHandler;
    Thread mTelMsgThread;
    Handler mVTListener;
    private Integer mVTListenerLock;
    Thread mVTThread;
    Handler mVtHandler;
    private int simSN[];

    private VTManager()
    {
        mState = State.CLOSE;
        mVTListener = null;
        mVtHandler = null;
        mTelMsgHandler = null;
        mVTListenerLock = new Integer(0);
        mEndCallLock = new Integer(0);
        mInvokeHideMeBeforeOpen = false;
        mInvokeLockPeerVideoBeforeOpen = false;
        mClosingVTService = false;
        mStartVTSMALFail = false;
        mRecordedFilePath = null;
        mRecordedFileName = null;
        mDateTakenRecording = 0L;
        mSimId = -1;
        mState = State.CLOSE;
        mSettings = new VTSettings();
        simSN = new int[PhoneConstants.GEMINI_SIM_NUM];
        for (int i = 0; i < PhoneConstants.GEMINI_SIM_NUM; i++)
            simSN[i] = i + 0;

    }

    public static VTManager getInstance()
    {
        return sVTManager;
    }

    public static void setEM(int i, int j, int k)
    {
        VTelProvider.setEM(i, j, k);
    }

    private void setInvokeHideMeBeforeOpen(boolean flag)
    {
        mInvokeHideMeBeforeOpen = flag;
    }

    private void setInvokeLockPeerVideoBeforeOpen(boolean flag)
    {
        mInvokeLockPeerVideoBeforeOpen = flag;
    }

    private void setVTCloseImpl()
    {
        this;
        JVM INSTR monitorenter ;
        Log.w("VTManager", "=>setVTCloseImpl");
_L1:
        State state;
        State state1;
        state = mState;
        state1 = State.CONNECTED;
        if (state != state1)
            break MISSING_BLOCK_LABEL_48;
        wait();
          goto _L1
        InterruptedException interruptedexception;
        interruptedexception;
        Log.e("VTManager", "createThreads, wait error");
        interruptedexception.printStackTrace();
        postEventToMMI(1, 0, 0, null);
        mClosingVTService = true;
        Integer integer = mEndCallLock;
        integer;
        JVM INSTR monitorenter ;
        if (VTelProvider.closeVTService() == 0) goto _L3; else goto _L2
_L2:
        Log.e("VTManager", "setVTCloseImpl, error");
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
        mState = State.CLOSE;
        mStartVTSMALFail = false;
        mSimId = -1;
        Log.i("VTManager", mState.toString());
        integer;
        JVM INSTR monitorexit ;
        Log.w("VTManager", (new StringBuilder()).append("<=setVTCloseImpl, mState = ").append(mState.toString()).toString());
          goto _L4
        Exception exception;
        exception;
        throw exception;
        Exception exception1;
        exception1;
        integer;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    private void setVTOpenImpl()
    {
        this;
        JVM INSTR monitorenter ;
        if (VTelProvider.openVTService(mSimId) == 0)
            break MISSING_BLOCK_LABEL_23;
        Log.e("VTManager", "setVTOpenImpl, error");
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        mState = State.OPEN;
        notify();
        Log.i("VTManager", mState.toString());
        Log.i("VTManager", (new StringBuilder()).append("").append(mInvokeHideMeBeforeOpen).toString());
        if (mInvokeHideMeBeforeOpen)
            setLocalVideoType(mSettings.getVideoType(), mSettings.getImagePath());
        postEventToMMI(2, 0, 0, null);
          goto _L1
        Exception exception;
        exception;
        throw exception;
    }

    private void setVTReadyImpl()
    {
        this;
        JVM INSTR monitorenter ;
        Log.i("VTManager", (new StringBuilder()).append("setVTReadyImpl, mTelMsgHandler = ").append(mTelMsgHandler).toString());
        if (!mSettings.getIsSwitch()) goto _L2; else goto _L1
_L1:
        int j = VTelProvider.initVTService(mSettings.getPeerSurface().getSurface(), mSettings.getLocalSurface().getSurface());
_L7:
        if (mTelMsgHandler != null) goto _L4; else goto _L3
_L3:
        Thread thread = mTelMsgThread;
        thread;
        JVM INSTR monitorenter ;
        Log.i("VTManager", "setVTReadyImpl mTelMsgThread wait ");
        mTelMsgThread.wait();
_L4:
        if (j == 0) goto _L6; else goto _L5
_L5:
        mStartVTSMALFail = true;
        Log.e("VTManager", "setVTReadyImpl, error");
        synchronized (mTelMsgHandler)
        {
            mTelMsgHandler.notify();
        }
_L8:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        int i = VTelProvider.initVTService(mSettings.getLocalSurface().getSurface(), mSettings.getPeerSurface().getSurface());
        j = i;
          goto _L7
        InterruptedException interruptedexception;
        interruptedexception;
        Log.e("VTManager", "setVTReadyImpl, wait error");
        interruptedexception.printStackTrace();
          goto _L4
        Exception exception3;
        exception3;
        thread;
        JVM INSTR monitorexit ;
        throw exception3;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        exception2;
        handler1;
        JVM INSTR monitorexit ;
        throw exception2;
_L6:
        mState = State.READY;
        Log.i("VTManager", mState.toString());
        mSettings.getCameraSettings();
        postEventToMMI(3, 0, 0, null);
        synchronized (mTelMsgHandler)
        {
            mTelMsgHandler.notify();
        }
          goto _L8
        exception1;
        handler;
        JVM INSTR monitorexit ;
        throw exception1;
          goto _L7
    }

    public boolean canDecBrightness()
    {
        return mSettings.canDecBrightness();
    }

    public boolean canDecContrast()
    {
        return mSettings.canDecContrast();
    }

    public boolean canDecZoom()
    {
        return mSettings.canDecZoom();
    }

    public boolean canIncBrightness()
    {
        return mSettings.canIncBrightness();
    }

    public boolean canIncContrast()
    {
        return mSettings.canIncContrast();
    }

    public boolean canIncZoom()
    {
        return mSettings.canIncZoom();
    }

    void createThreads()
    {
        if (mVtHandler != null || mTelMsgHandler != null)
        {
            Log.e("VTManager", "init error");
            return;
        }
        mVTThread = new Thread() {

            final VTManager this$0;

            public void run()
            {
                Log.i("VTManager", "run(), mVTThread");
                Looper.prepare();
                synchronized (mVTThread)
                {
                    mVtHandler = new VTHanlder();
                    Log.i("VTManager", "mVTThread.notify()");
                    mVTThread.notify();
                }
                Looper.loop();
                return;
                exception1;
                thread1;
                JVM INSTR monitorexit ;
                throw exception1;
            }

            
            {
                this$0 = VTManager.this;
                super();
            }
        }
;
        mVTThread.start();
        mTelMsgThread = new Thread() {

            final VTManager this$0;

            public void run()
            {
                Looper.prepare();
                this;
                JVM INSTR monitorenter ;
                mTelMsgHandler = new TelMsgHandler();
                notify();
                this;
                JVM INSTR monitorexit ;
                Log.i("VTManager", "register TelMsg, notify--sync");
                for (int i = 0; i < PhoneConstants.GEMINI_SIM_NUM; i++)
                {
                    ((MTKCallManager)mCallManager).registerForVtStatusInfoGemini(mTelMsgHandler, 6, null, simSN[i]);
                    ((MTKCallManager)mCallManager).registerForVtRingInfoGemini(mTelMsgHandler, 7, null, simSN[i]);
                }

                break MISSING_BLOCK_LABEL_122;
                Exception exception1;
                exception1;
                this;
                JVM INSTR monitorexit ;
                throw exception1;
                Looper.loop();
                return;
            }

            
            {
                this$0 = VTManager.this;
                super();
            }
        }
;
        Thread thread = mVTThread;
        thread;
        JVM INSTR monitorenter ;
        Handler handler = mVtHandler;
        if (handler != null)
            break MISSING_BLOCK_LABEL_80;
        mVTThread.wait();
_L1:
        thread;
        JVM INSTR monitorexit ;
        Log.i("VTManager", "mVtHandler.sendEmptyMessage()");
        mVtHandler.sendEmptyMessage(1);
        mTelMsgThread.start();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        Log.e("VTManager", "createThreads, wait error");
        interruptedexception.printStackTrace();
          goto _L1
        Exception exception;
        exception;
        thread;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean decBrightness()
    {
        boolean flag = mSettings.decBrightness();
        if (flag)
            setParameters();
        return flag;
    }

    public boolean decContrast()
    {
        boolean flag = mSettings.decContrast();
        if (flag)
            setParameters();
        return flag;
    }

    public boolean decZoom()
    {
        boolean flag = mSettings.decZoom();
        if (flag)
            setParameters();
        return flag;
    }

    public void deinit()
    {
        joinThreads();
        mSettings.deinit();
        mContext = null;
        mCallManager = null;
    }

    public void enableAlwaysAskSettings(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("enableAlwaysAskSettings in VTManager.java, flag=").append(i).toString());
        VTelProvider.enableAlwaysAskSettings(i);
    }

    public void enableHideMe(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("enableHideMe in VTManager.java, flag=").append(i).toString());
        VTelProvider.enableHideMe(i);
    }

    public void enableHideYou(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("enableHideYou in VTManager.java, flag=").append(i).toString());
        VTelProvider.enableHideYou(i);
    }

    public void enlargeDisplaySurface(boolean flag)
    {
    }

    public int getCameraSensorCount()
    {
label0:
        {
            synchronized (mEndCallLock)
            {
                if (State.CLOSE != mState)
                    break label0;
            }
            return 0;
        }
        int i = VTelProvider.getCameraSensorCount();
        integer;
        JVM INSTR monitorexit ;
        return i;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String getColorEffect()
    {
        return mSettings.getColorEffect();
    }

    public boolean getMute(Phone phone)
    {
        return VTelProvider.isMicrophoneOn() == 0;
    }

    public boolean getNightMode()
    {
        return mSettings.getNightMode();
    }

    void getParameters()
    {
        mSettings.mCameraParamters = VTelProvider.getParameters();
    }

    public int getSimId()
    {
        return mSimId;
    }

    public State getState()
    {
        return mState;
    }

    public List getSupportedColorEffects()
    {
        return mSettings.getSupportedColorEffects();
    }

    public int getVideoQuality()
    {
        return mSettings.getVideoQuality();
    }

    public Handler getmVTListener()
    {
        return mVTListener;
    }

    public boolean incBrightness()
    {
        boolean flag = mSettings.incBrightness();
        if (flag)
            setParameters();
        return flag;
    }

    public boolean incContrast()
    {
        boolean flag = mSettings.incContrast();
        if (flag)
            setParameters();
        return flag;
    }

    public boolean incZoom()
    {
        boolean flag = mSettings.incZoom();
        if (flag)
            setParameters();
        return flag;
    }

    public void incomingVTCall(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("incomingVTCall in VTManager.java, flag=").append(i).toString());
        VTelProvider.incomingVTCall(i);
    }

    public void incomingVideoDispaly(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("incomingVideoDispaly in VTManager.java, flag=").append(i).toString());
        VTelProvider.incomingVideoDispaly(i);
    }

    public void init(Context context, Object obj)
    {
        mContext = context;
        mCallManager = obj;
        mSettings.init(context);
        createThreads();
    }

    public boolean isInvokeHideMeBeforeOpen()
    {
        return mInvokeHideMeBeforeOpen;
    }

    public boolean isInvokeLockPeerVideoBeforeOpenn()
    {
        return mInvokeLockPeerVideoBeforeOpen;
    }

    public boolean isSpeakerOn(Context context)
    {
label0:
        {
            synchronized (mEndCallLock)
            {
                if (State.CLOSE != mState)
                    break label0;
            }
            return false;
        }
        boolean flag;
        if (VTelProvider.isSpeakerOn() == 0)
            flag = false;
        else
            flag = true;
        integer;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isSupportNightMode()
    {
        return mSettings.isSupportNightMode();
    }

    void joinThreads()
    {
        Handler handler;
        for (int i = 0; i < PhoneConstants.GEMINI_SIM_NUM; i++)
        {
            ((MTKCallManager)mCallManager).unregisterForVtStatusInfoGemini(mTelMsgHandler, simSN[i]);
            ((MTKCallManager)mCallManager).unregisterForVtRingInfoGemini(mTelMsgHandler, simSN[i]);
        }

        mVtHandler.sendEmptyMessage(0x8000000);
        if (mTelMsgHandler == null)
        {
            Log.i("VTManager", "null == mTelMsgHandler in joinThreads()");
        } else
        {
            Log.i("VTManager", "null != mTelMsgHandler in joinThreads()");
            mTelMsgHandler.sendEmptyMessage(0x8000000);
        }
        handler = mTelMsgHandler;
        handler;
        JVM INSTR monitorenter ;
        Log.i("VTManager", "mTelMsgHandler notify in joinThreads()");
        mTelMsgHandler.notify();
_L1:
        Exception exception;
        IllegalMonitorStateException illegalmonitorstateexception;
        try
        {
            mVTThread.join();
            mTelMsgThread.join();
        }
        catch (InterruptedException interruptedexception)
        {
            Log.e("VTManager", "joinThreads error");
            interruptedexception.printStackTrace();
        }
        mVTThread = null;
        mVtHandler = null;
        mTelMsgThread = null;
        mTelMsgHandler = null;
        return;
        illegalmonitorstateexception;
        Log.e("VTManager", "mTelMsgHandler notify in joinThreads(), wait error");
        illegalmonitorstateexception.printStackTrace();
          goto _L1
        exception;
        handler;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void lockPeerVideo()
    {
        if (State.CLOSE == mState)
        {
            Log.e("VTManager", "lockPeerVideo, vtmanager state error");
            setInvokeLockPeerVideoBeforeOpen(true);
            VTelProvider.setInvokeLockPeerVideoBeforeOpen(1);
            return;
        } else
        {
            VTelProvider.lockPeerVideo();
            return;
        }
    }

    public void onConnected()
    {
        this;
        JVM INSTR monitorenter ;
        com.android.internal.telephony.PhoneConstants.State state;
        Log.w("VTManager", "=>onConnected");
        state = CallManager.getInstance().getState();
        Log.w("VTManager", (new StringBuilder()).append("after received connected callback PhoneState=").append(state).toString());
        if (state != com.android.internal.telephony.PhoneConstants.State.IDLE) goto _L2; else goto _L1
_L1:
        Log.e("VTManager", "onConnected:State error, receive onConnected while phone state is IDLE");
        Log.e("VTManager", (new StringBuilder()).append("PhoneState = ").append(state).toString());
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (State.CONNECTED == mState) goto _L4; else goto _L3
_L3:
        if (State.CLOSE != mState)
            break MISSING_BLOCK_LABEL_126;
        Log.e("VTManager", "onConnected, error");
          goto _L4
        Exception exception;
        exception;
        throw exception;
label0:
        {
            if (VTelProvider.startVTService() == 0)
                break label0;
            Log.e("VTManager", "onConnected, error");
        }
          goto _L4
        mState = State.CONNECTED;
        Log.i("VTManager", mState.toString());
        postEventToMMI(4, 0, 0, null);
        Log.w("VTManager", "<=onConnected");
          goto _L4
    }

    public void onDisconnected()
    {
        Log.w("VTManager", "pre-onDisconnected");
        VTelProvider.setEndCallFlag();
        onDisconnectedActual();
    }

    public void onDisconnectedActual()
    {
        this;
        JVM INSTR monitorenter ;
        Log.i("VTManager", "onDisconnected");
        if (State.CONNECTED == mState) goto _L2; else goto _L1
_L1:
        Log.e("VTManager", "onDisconnected, VT Manager state error");
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (VTelProvider.stopVTService() == 0)
            break MISSING_BLOCK_LABEL_56;
        Log.e("VTManager", "onDisconnected, error");
          goto _L3
        Exception exception;
        exception;
        throw exception;
        notify();
        mState = State.READY;
        Log.i("VTManager", mState.toString());
        postEventToMMI(5, 0, 0, null);
          goto _L3
    }

    public void onUserInput(String s)
    {
        if (State.CLOSE == mState)
        {
            Log.e("VTManager", "onUserInput, vtmanager state error");
            return;
        } else
        {
            VTelProvider.onUserInput(s);
            return;
        }
    }

    void postEventFromNative(int i, int j, int k, Object obj)
    {
        Log.i("VTManager", (new StringBuilder()).append("postEventFromNative [").append(i).append("]").toString());
        postEventToMMI(i, j, k, obj);
    }

    void postEventToMMI(int i, int j, int k, Object obj)
    {
        if (mClosingVTService && 32769 == i)
            return;
        Integer integer = mVTListenerLock;
        integer;
        JVM INSTR monitorenter ;
        Log.w("VTManager", (new StringBuilder()).append("postEventToMMI [").append(i).append("]").toString());
        if (mVTListener != null)
            break MISSING_BLOCK_LABEL_83;
        Log.e("VTManager", "error postEventToMMI");
_L1:
        return;
        Exception exception;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
        mVTListener.sendMessage(mVTListener.obtainMessage(i, j, k, obj));
          goto _L1
    }

    public void registerVTListener(Handler handler)
    {
        synchronized (mVTListenerLock)
        {
            mVTListener = handler;
        }
        return;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void replacePeerVideoSettings(int i, String s)
    {
        Log.w("VTManager", "replacePeerVideoSettings");
        mEnableReplacePeerVideo = i;
        mReplacePeerVideoPicturePath = s;
        VTelProvider.replacePeerVideoSettings(i, s);
    }

    public boolean savePeerPhoto()
    {
        long l = System.currentTimeMillis();
        String s = (new SimpleDateFormat("yyyy-MM-dd kk.mm.ss.SSS")).format(Long.valueOf(l)).toString();
        String s1 = (new StringBuilder()).append(s).append(".png").toString();
        String s2 = Environment.getExternalStorageDirectory().toString();
        String s3 = (new StringBuilder()).append(s2).append("/DCIM/Camera/IMG_").append(s1).toString();
        (new File((new StringBuilder()).append(s2).append("/DCIM/Camera/").toString())).mkdirs();
        if (VTelProvider.snapshot(0, s3) != 0)
        {
            Log.e("VTManager", "***snapshot() fail in Manager layer***");
            return false;
        }
        ContentResolver contentresolver = mContext.getContentResolver();
        ContentValues contentvalues = new ContentValues();
        contentvalues.put("title", s1);
        contentvalues.put("_display_name", s1);
        contentvalues.put("datetaken", Long.valueOf(l));
        contentvalues.put("mime_type", "image/png");
        contentvalues.put("orientation", Integer.valueOf(0));
        File file = new File(s3);
        if (!file.exists())
        {
            Log.e("VTManager", "***image_File does not exist in Manager layer***");
            return false;
        }
        contentvalues.put("_size", Long.valueOf(file.length()));
        contentvalues.put("_data", s3);
        Log.i("VTManager", contentvalues.toString());
        try
        {
            contentresolver.insert(android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentvalues);
        }
        catch (Exception exception)
        {
            Log.e("VTManager", "insert fail in savePeerPhoto()");
            return false;
        }
        return true;
    }

    public void setColorEffect(String s)
    {
        mSettings.setColorEffect(s);
        setParameters();
    }

    public void setDisplay(SurfaceHolder surfaceholder, SurfaceHolder surfaceholder1)
    {
        Log.i("VTManager", (new StringBuilder()).append("setDisplay ").append(surfaceholder).append(", ").append(surfaceholder1).toString());
        mSettings.setLocalSurface(surfaceholder);
        mSettings.setPeerSurface(surfaceholder1);
    }

    public void setLocalVideoType(int i, String s)
    {
label0:
        {
            Log.w("VTManager", (new StringBuilder()).append("setLocalVideoType, closingVTService = ").append(mClosingVTService).append(" mState = ").append(mState).append(" videoType = ").append(i).append(" path = ").append(s).toString());
            if (s == null)
                Log.i("VTManager", "setLocalVideoType, path is null");
            if (!mClosingVTService)
                break MISSING_BLOCK_LABEL_143;
            synchronized (mEndCallLock)
            {
                mSettings.setVideoType(i);
                mSettings.setImagePath(s);
                if (State.CLOSE != mState)
                    break label0;
                setInvokeHideMeBeforeOpen(true);
            }
            return;
        }
        VTelProvider.setLocalVideoType(i, s);
        integer;
        JVM INSTR monitorexit ;
        return;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
        mSettings.setVideoType(i);
        mSettings.setImagePath(s);
        if (State.CLOSE == mState)
        {
            setInvokeHideMeBeforeOpen(true);
            return;
        } else
        {
            VTelProvider.setLocalVideoType(i, s);
            return;
        }
    }

    public void setMute(Phone phone, boolean flag)
    {
        int i;
        if (flag)
            i = 0;
        else
            i = 1;
        VTelProvider.turnOnMicrophone(i);
    }

    public void setNightMode(boolean flag)
    {
        mSettings.setNightMode(flag);
        setParameters();
    }

    void setParameters()
    {
        VTelProvider.setParameters(mSettings.mCameraParamters);
        VTelProvider.updateParameters(mSettings.mCameraParamters);
    }

    public void setVTClose()
    {
        Log.w("VTManager", "setVTClose");
        if (State.CLOSE == mState)
        {
            Log.e("VTManager", "setVTCloseImpl, error");
            return;
        } else
        {
            mVtHandler.sendEmptyMessage(0);
            deinit();
            return;
        }
    }

    public void setVTDisconnect()
    {
        this;
        JVM INSTR monitorenter ;
        Message message = new Message();
        message.what = 6;
        message.obj = null;
        message.arg1 = 0;
        message.arg2 = 0;
        mTelMsgHandler.sendMessage(message);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setVTOpen(Context context, Object obj)
    {
        Log.e("VTManager", "setVTOpen failed, old interface used");
    }

    public void setVTOpen(Context context, Object obj, int i)
    {
        Log.w("VTManager", "setVTOpen");
        if (mState != State.CLOSE)
        {
            Log.e("VTManager", "setVTOpen, mState != State.CLOSE");
            return;
        } else
        {
            mSimId = i;
            Log.i("VTManager", (new StringBuilder()).append("simID = ").append(mSimId).toString());
            init(context, obj);
            mClosingVTService = false;
            return;
        }
    }

    public void setVTReady()
    {
        this;
        JVM INSTR monitorenter ;
        Log.w("VTManager", (new StringBuilder()).append("setVTReady, mVtHandler = ").append(mVtHandler).toString());
        if (State.OPEN == mState || State.CLOSE == mState) goto _L2; else goto _L1
_L1:
        Log.e("VTManager", "setVTReadyImpl, error");
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (mVtHandler == null) goto _L4; else goto _L3
_L3:
        mVtHandler.sendEmptyMessage(2);
          goto _L4
        Exception exception;
        exception;
        throw exception;
    }

    public void setVTVisible(boolean flag)
    {
        if (State.CLOSE == mState)
            return;
        if (!flag)
        {
            VTelProvider.setVTVisible(0, (Surface)null, (Surface)null);
            return;
        }
        if (mSettings == null)
        {
            Log.e("VTManager", "error setVTVisible, null == mSettings");
            return;
        }
        if (mSettings.getPeerSurface() == null)
        {
            Log.e("VTManager", "error setVTVisible, null == getPeerSurface");
            return;
        }
        if (mSettings.getPeerSurface().getSurface() == null)
        {
            Log.e("VTManager", "error setVTVisible, null == getSurface");
            return;
        }
        if (mSettings.getIsSwitch())
        {
            VTelProvider.setVTVisible(1, mSettings.getPeerSurface().getSurface(), mSettings.getLocalSurface().getSurface());
            return;
        } else
        {
            VTelProvider.setVTVisible(1, mSettings.getLocalSurface().getSurface(), mSettings.getPeerSurface().getSurface());
            return;
        }
    }

    public void setVideoQuality(int i)
    {
        mSettings.setVideoQuality(i);
        VTelProvider.setPeerVideo(i);
    }

    public int startRecording(int i, long l)
    {
label0:
        {
            Log.w("VTManager", (new StringBuilder()).append("startRecording() in VTManager.java, type is: ").append(i).append("maxSize = ").append(l).toString());
            if (State.CLOSE == mState)
            {
                Log.e("VTManager", "startRecording() in VTManager.java, State=CLOSE");
                return 0;
            }
            String s = Environment.getExternalStorageDirectory().toString();
            Log.i("VTManager", (new StringBuilder()).append("cameraImageBucketName is: ").append(s).toString());
            mDateTakenRecording = System.currentTimeMillis();
            String s1 = (new SimpleDateFormat("yyyy-MM-dd_kk.mm.ss.SSS")).format(Long.valueOf(mDateTakenRecording)).toString();
            if (1 == i)
            {
                mRecordedFileName = (new StringBuilder()).append("Video_and_Audio_").append(s1).toString();
            } else
            {
                if (2 == i)
                {
                    Log.i("VTManager", "type is wrong in startRecording() in VTManager.java");
                    return 0;
                }
                if (3 != i)
                    break label0;
                mRecordedFileName = (new StringBuilder()).append("Only_Peer_Video_").append(s1).toString();
            }
            File file = new File(StorageManagerEx.getDefaultPath());
            if (!file.canWrite())
            {
                Log.i("VTManager", "----- file can't write!! ---");
                mRecordedFilePath = (new StringBuilder()).append(s).append("/PhoneRecord/").append(mRecordedFileName).append(".3gp").toString();
                Log.i("VTManager", (new StringBuilder()).append("recordedFileName is: ").append(mRecordedFilePath).toString());
                (new File((new StringBuilder()).append(s).append("/PhoneRecord/").toString())).mkdirs();
            } else
            {
                File file1 = new File((new StringBuilder()).append(file.getAbsolutePath()).append("/PhoneRecord").toString());
                if (!file1.exists())
                    file1.mkdirs();
                mRecordedFilePath = (new StringBuilder()).append(file1.getAbsolutePath()).append("/").append(mRecordedFileName).append(".3gp").toString();
                Log.i("VTManager", (new StringBuilder()).append("recordedFileName is: ").append(mRecordedFilePath).toString());
            }
            int j = VTelProvider.startRecording(i, mRecordedFilePath, l);
            if (1 == j)
            {
                Log.e("VTManager", "VT_RET_FROM_JNI_FALSE == ret in startRecording() in VTManager.java");
                return j;
            } else
            {
                return j;
            }
        }
        Log.i("VTManager", "type is wrong in startRecording() in VTManager.java");
        return 0;
    }

    public int stopRecording(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("stopRecording() in VTManager.java, type is: ").append(i).toString());
        if (State.CLOSE == mState)
        {
            Log.e("VTManager", "stopRecording() in VTManager.java, State=CLOSE");
            return 0;
        }
        if (1 != i && 3 != i)
        {
            Log.e("VTManager", "stopRecording() in VTManager.java, type is wrong");
            return 0;
        }
        int j = VTelProvider.stopRecording(i);
        if (1 == j)
        {
            Log.e("VTManager", "VT_RET_FROM_JNI_FALSE == ret in stopRecording() in VTManager.java");
            return j;
        }
        if (mRecordedFilePath == null)
        {
            Log.e("VTManager", "null == recordedFilePath in stopRecording() in VTManager.java");
            return j;
        }
        File file = new File(mRecordedFilePath);
        if (!file.exists())
            Log.i("VTManager", "***video_File does not exist in stopRecording()***");
        ContentValues contentvalues = new ContentValues();
        long l = file.length();
        contentvalues.put("title", mRecordedFileName);
        contentvalues.put("_display_name", mRecordedFileName);
        contentvalues.put("datetaken", Long.valueOf(mDateTakenRecording));
        contentvalues.put("mime_type", "video/3gpp");
        contentvalues.put("_size", Long.valueOf(l));
        contentvalues.put("_data", mRecordedFilePath);
        ContentResolver contentresolver = mContext.getContentResolver();
        try
        {
            contentresolver.insert(android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI, contentvalues);
            Context context = mContext;
            String as[] = new String[1];
            as[0] = file.toString();
            MediaScannerConnection.scanFile(context, as, null, null);
        }
        catch (Exception exception)
        {
            Log.e("VTManager", "insert fail in stopRecording()");
        }
        return j;
    }

    public boolean switchCamera()
    {
label0:
        {
            synchronized (mEndCallLock)
            {
                if (State.CLOSE != mState)
                    break label0;
            }
            return false;
        }
        int i;
        i = VTelProvider.switchCamera();
        mSettings.getCameraSettings();
        integer;
        JVM INSTR monitorexit ;
        return i != 0;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void switchDisplaySurface()
    {
        if (State.READY != mState)
        {
            Log.e("VTManager", "switchDisplaySurface, error");
            return;
        }
        VTSettings vtsettings = mSettings;
        boolean flag;
        if (!mSettings.getIsSwitch())
            flag = true;
        else
            flag = false;
        vtsettings.setIsSwitch(flag);
    }

    public void turnOnSpeaker(boolean flag)
    {
        Integer integer = mEndCallLock;
        integer;
        JVM INSTR monitorenter ;
        if (State.CLOSE == mState)
            return;
          goto _L1
_L3:
        int i;
        VTelProvider.turnOnSpeaker(i);
        return;
        Exception exception;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
_L1:
        while (!flag) 
        {
            i = 0;
            continue; /* Loop/switch isn't completed */
        }
        i = 1;
        if (true) goto _L3; else goto _L2
_L2:
    }

    public void unlockPeerVideo()
    {
        if (State.CLOSE == mState)
        {
            Log.e("VTManager", "unlockPeerVideo, vtmanager state error");
            return;
        } else
        {
            VTelProvider.unlockPeerVideo();
            return;
        }
    }

    public void unregisterVTListener()
    {
        synchronized (mVTListenerLock)
        {
            mVTListener = null;
        }
        return;
        exception;
        integer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void userSelectYes(int i)
    {
        Log.w("VTManager", (new StringBuilder()).append("userSelectYes in VTManager.java, flag=").append(i).toString());
        VTelProvider.userSelectYes(i);
    }






}
