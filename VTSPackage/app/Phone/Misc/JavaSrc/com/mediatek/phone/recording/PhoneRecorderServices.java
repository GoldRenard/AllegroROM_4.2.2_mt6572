// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;

// Referenced classes of package com.mediatek.phone.recording:
//            PhoneRecorder, IPhoneRecordStateListener

public class PhoneRecorderServices extends Service
{

    private static final String LOG_TAG = "RecorderServices";
    private static final String PHONE_VOICE_RECORD_STATE_CHANGE_MESSAGE = "com.android.phone.VoiceRecorder.STATE";
    private final IPhoneRecorder.Stub mBinder = new IPhoneRecorder.Stub() {

        final PhoneRecorderServices this$0;

        public void listen(IPhoneRecordStateListener iphonerecordstatelistener)
        {
            log("listen");
            if (iphonerecordstatelistener != null)
                mStateListener = iphonerecordstatelistener;
        }

        public void remove()
        {
            log("remove");
            mStateListener = null;
        }

        public void startRecord()
        {
            log("startRecord");
            if (mPhoneRecorder != null)
                mPhoneRecorder.startRecord();
        }

        public void stopRecord(boolean flag)
        {
            log("stopRecord");
            if (mPhoneRecorder != null)
                mPhoneRecorder.stopRecord(flag);
            mPhoneRecorder = null;
        }

            
            {
                this$0 = PhoneRecorderServices.this;
                super();
            }
    }
;
    private boolean mMount;
    private PhoneRecorder mPhoneRecorder;
    private Recorder.OnStateChangedListener mPhoneRecorderStateListener;
    private int mPhoneRecorderStatus;
    IPhoneRecordStateListener mStateListener;

    public PhoneRecorderServices()
    {
        mMount = true;
        mPhoneRecorderStatus = 0;
        mPhoneRecorderStateListener = new Recorder.OnStateChangedListener() {

            final PhoneRecorderServices this$0;

            public void onError(int i)
            {
                if (mStateListener == null)
                    break MISSING_BLOCK_LABEL_32;
                log("onError");
                mStateListener.onError(i);
                return;
                RemoteException remoteexception;
                remoteexception;
                Log.e("RecorderServices", "PhoneRecordService: call listener onError() failed", new IllegalStateException());
                return;
            }

            public void onStateChanged(int i)
            {
                int j = mPhoneRecorderStatus;
                mPhoneRecorderStatus = i;
                if (j == i)
                    break MISSING_BLOCK_LABEL_83;
                Intent intent = new Intent("com.android.phone.VoiceRecorder.STATE");
                intent.putExtra("state", i);
                sendBroadcast(intent);
                if (mStateListener == null)
                    break MISSING_BLOCK_LABEL_83;
                log("onStateChanged");
                mStateListener.onStateChange(i);
                return;
                RemoteException remoteexception;
                remoteexception;
                Log.e("RecorderServices", "PhoneRecordService: call listener onStateChange failed", new IllegalStateException());
                return;
            }

            
            {
                this$0 = PhoneRecorderServices.this;
                super();
            }
        }
;
    }

    public void log(String s)
    {
        Log.d("RecorderServices", s);
    }

    public IBinder onBind(Intent intent)
    {
        Log.d("RecorderServices", "onBind");
        return mBinder;
    }

    public void onCreate()
    {
        super.onCreate();
        log("onCreate");
        mPhoneRecorder = PhoneRecorder.getInstance(this);
        if (mPhoneRecorder != null)
            mPhoneRecorder.setOnStateChangedListener(mPhoneRecorderStateListener);
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("onDestroy");
        if (mPhoneRecorder != null)
        {
            mPhoneRecorder.stopRecord(mMount);
            mPhoneRecorder = null;
        }
    }

    public void onStart(Intent intent, int i)
    {
        super.onStart(intent, i);
        log("onStart");
        if (mPhoneRecorder != null)
            mPhoneRecorder.startRecord();
    }

    public boolean onUnbind(Intent intent)
    {
        Log.d("RecorderServices", "onUnbind");
        return super.onUnbind(intent);
    }



/*
    static int access$002(PhoneRecorderServices phonerecorderservices, int i)
    {
        phonerecorderservices.mPhoneRecorderStatus = i;
        return i;
    }

*/



/*
    static PhoneRecorder access$102(PhoneRecorderServices phonerecorderservices, PhoneRecorder phonerecorder)
    {
        phonerecorderservices.mPhoneRecorder = phonerecorder;
        return phonerecorder;
    }

*/
}
