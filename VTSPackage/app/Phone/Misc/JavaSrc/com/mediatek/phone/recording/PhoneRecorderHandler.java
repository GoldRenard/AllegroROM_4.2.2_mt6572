// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.recording;

import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.os.storage.StorageVolume;
import android.util.Log;
import android.widget.Toast;
import com.android.phone.PhoneGlobals;
import com.android.phone.PhoneUtils;
import com.mediatek.vt.VTManager;

// Referenced classes of package com.mediatek.phone.recording:
//            PhoneRecorderServices, PhoneRecorder, IPhoneRecorder, IPhoneRecordStateListener

public class PhoneRecorderHandler
{
    public static interface Listener
    {

        public abstract void onStorageFull();

        public abstract void requestUpdateRecordState(int i, int j);
    }


    private static final boolean DBG = true;
    private static final String LOG_TAG = "PhoneRecorderHandler";
    private static final boolean VDBG = true;
    private static PhoneRecorderHandler sInstance = new PhoneRecorderHandler();
    private BroadcastReceiver mBroadcastReceiver;
    private ServiceConnection mConnection;
    private int mCustomValue;
    private Handler mHandler;
    private Listener mListener;
    private IPhoneRecordStateListener mPhoneRecordStateListener;
    private IPhoneRecorder mPhoneRecorder;
    private int mPhoneRecorderState;
    private Runnable mRecordDiskCheck;
    private String mRecordStoragePath;
    private int mRecordType;
    private Intent mRecorderServiceIntent;

    private PhoneRecorderHandler()
    {
        mRecorderServiceIntent = new Intent(PhoneGlobals.getInstance(), com/mediatek/phone/recording/PhoneRecorderServices);
        mPhoneRecorderState = 0;
        mHandler = new Handler() {

            final PhoneRecorderHandler this$0;

            public void handleMessage(Message message)
            {
            }

            
            {
                this$0 = PhoneRecorderHandler.this;
                super();
            }
        }
;
        mRecordDiskCheck = new Runnable() {

            final PhoneRecorderHandler this$0;

            public void run()
            {
                checkRecordDisk();
            }

            
            {
                this$0 = PhoneRecorderHandler.this;
                super();
            }
        }
;
        mConnection = new ServiceConnection() {

            final PhoneRecorderHandler this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                mPhoneRecorder = IPhoneRecorder.Stub.asInterface(ibinder);
                try
                {
                    log("onServiceConnected");
                    if (mPhoneRecorder != null)
                    {
                        mPhoneRecorder.listen(mPhoneRecordStateListener);
                        mPhoneRecorder.startRecord();
                        mHandler.postDelayed(mRecordDiskCheck, 500L);
                    }
                    return;
                }
                catch (RemoteException remoteexception)
                {
                    Log.e("PhoneRecorderHandler", "onServiceConnected: couldn't register to record service", new IllegalStateException());
                }
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mPhoneRecorder = null;
            }

            
            {
                this$0 = PhoneRecorderHandler.this;
                super();
            }
        }
;
        mPhoneRecordStateListener = new IPhoneRecordStateListener.Stub() {

            final PhoneRecorderHandler this$0;

            public void onError(int i)
            {
                String s = null;
                switch (i)
                {
                case 2: // '\002'
                    s = PhoneGlobals.getInstance().getResources().getString(0x7f0d000a);
                    break;

                case 1: // '\001'
                    s = PhoneGlobals.getInstance().getResources().getString(0x7f0d000c);
                    break;
                }
                if (mPhoneRecorder != null)
                    Toast.makeText(PhoneGlobals.getInstance(), s, 1).show();
            }

            public void onStateChange(int i)
            {
                log((new StringBuilder()).append("onStateChange, state is ").append(i).toString());
                mPhoneRecorderState = i;
                if (mListener != null)
                    mListener.requestUpdateRecordState(i, mCustomValue);
            }

            
            {
                this$0 = PhoneRecorderHandler.this;
                super();
            }
        }
;
        mBroadcastReceiver = new BroadcastReceiver() {

            final PhoneRecorderHandler this$0;

            public void onReceive(Context context, Intent intent)
            {
label0:
                {
                    if ("android.intent.action.MEDIA_EJECT".equals(intent.getAction()) || "android.intent.action.MEDIA_UNMOUNTED".equals(intent.getAction()))
                    {
                        StorageVolume storagevolume = (StorageVolume)intent.getParcelableExtra("storage_volume");
                        if (storagevolume == null)
                        {
                            log("storageVolume is null");
                        } else
                        {
                            String s = storagevolume.getPath();
                            if (mRecordStoragePath == null || !s.equals(mRecordStoragePath))
                                break label0;
                            if (1 == mPhoneRecorderState)
                            {
                                if (2 == mRecordType)
                                {
                                    log("Current used sd card is ejected, stop voice record");
                                    stopVoiceRecord(false);
                                    return;
                                }
                                if (1 == mRecordType || 3 == mRecordType)
                                {
                                    log("Current used sd card is ejected, stop video record");
                                    stopVideoRecord();
                                    return;
                                }
                            }
                        }
                    }
                    return;
                }
                log("not current used storage unmount or eject");
            }

            
            {
                this$0 = PhoneRecorderHandler.this;
                super();
            }
        }
;
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.MEDIA_EJECT");
        intentfilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentfilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentfilter.addDataScheme("file");
        PhoneGlobals.getInstance().registerReceiver(mBroadcastReceiver, intentfilter);
    }

    private void checkRecordDisk()
    {
        if (!PhoneUtils.diskSpaceAvailable(mRecordStoragePath, 0x200000L))
        {
            Log.e("AN: ", "Checking result, disk is full, stop recording...");
            if (PhoneRecorder.isRecording() || isVTRecording())
            {
                if (PhoneRecorder.isRecording())
                    stopVoiceRecord();
                else
                if (isVTRecording())
                    stopVideoRecord();
                if (mListener != null)
                    mListener.onStorageFull();
            }
            return;
        } else
        {
            mHandler.postDelayed(mRecordDiskCheck, 50L);
            return;
        }
    }

    public static PhoneRecorderHandler getInstance()
    {
        com/mediatek/phone/recording/PhoneRecorderHandler;
        JVM INSTR monitorenter ;
        PhoneRecorderHandler phonerecorderhandler = sInstance;
        com/mediatek/phone/recording/PhoneRecorderHandler;
        JVM INSTR monitorexit ;
        return phonerecorderhandler;
        Exception exception;
        exception;
        throw exception;
    }

    private void log(String s)
    {
        Log.d("PhoneRecorderHandler", s);
    }

    private void stopVoiceRecord(boolean flag)
    {
        try
        {
            log("stopRecord");
            if (mPhoneRecorder != null)
            {
                mPhoneRecorder.stopRecord(flag);
                mPhoneRecorder.remove();
                if (mConnection != null)
                    PhoneGlobals.getInstance().unbindService(mConnection);
                mPhoneRecorder = null;
            }
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("PhoneRecorderHandler", "stopRecord: couldn't call to record service", new IllegalStateException());
        }
    }

    public void clearListener(Listener listener)
    {
        if (listener == mListener)
            mListener = null;
    }

    public int getCustomValue()
    {
        return mCustomValue;
    }

    public int getPhoneRecorderState()
    {
        return mPhoneRecorderState;
    }

    public int getRecordType()
    {
        return mRecordType;
    }

    public boolean isVTRecording()
    {
        return 1 == mCustomValue && 1 == mPhoneRecorderState;
    }

    public void setCustomValue(int i)
    {
        mCustomValue = i;
    }

    public void setListener(Listener listener)
    {
        mListener = listener;
    }

    public void setPhoneRecorderState(int i)
    {
        mPhoneRecorderState = i;
    }

    public void setRecordType(int i)
    {
        mRecordType = i;
    }

    public void startVideoRecord(int i, long l, int j)
    {
        mRecordType = i;
        mCustomValue = j;
        mRecordStoragePath = PhoneUtils.getExternalStorageDefaultPath();
        log((new StringBuilder()).append("- start call VTManager.startRecording() : type = ").append(i).append(" sd max size = ").append(l).toString());
        VTManager.getInstance().startRecording(i, l);
        log("- end call VTManager.startRecording()");
        mPhoneRecorderState = 1;
        if (mListener != null)
            mListener.requestUpdateRecordState(mPhoneRecorderState, mCustomValue);
        mHandler.postDelayed(mRecordDiskCheck, 500L);
    }

    public void startVoiceRecord(int i)
    {
        mCustomValue = i;
        mRecordType = 2;
        mRecordStoragePath = PhoneUtils.getExternalStorageDefaultPath();
        if (mRecorderServiceIntent != null && mPhoneRecorder == null)
            PhoneGlobals.getInstance().bindService(mRecorderServiceIntent, mConnection, 1);
        else
        if (mRecorderServiceIntent != null && mPhoneRecorder != null)
        {
            try
            {
                mPhoneRecorder.startRecord();
                mHandler.postDelayed(mRecordDiskCheck, 500L);
                return;
            }
            catch (RemoteException remoteexception)
            {
                Log.e("PhoneRecorderHandler", "start Record failed", new IllegalStateException());
            }
            return;
        }
    }

    public void stopVideoRecord()
    {
        log((new StringBuilder()).append("- start call VTManager.stopRecording() : ").append(mRecordType).toString());
        VTManager.getInstance().stopRecording(mRecordType);
        log((new StringBuilder()).append("- end call VTManager.stopRecording() : ").append(mRecordType).toString());
        mPhoneRecorderState = 0;
        if (mListener != null)
            mListener.requestUpdateRecordState(mPhoneRecorderState, mCustomValue);
    }

    public void stopVoiceRecord()
    {
        stopVoiceRecord(true);
    }






/*
    static IPhoneRecorder access$102(PhoneRecorderHandler phonerecorderhandler, IPhoneRecorder iphonerecorder)
    {
        phonerecorderhandler.mPhoneRecorder = iphonerecorder;
        return iphonerecorder;
    }

*/








/*
    static int access$602(PhoneRecorderHandler phonerecorderhandler, int i)
    {
        phonerecorderhandler.mPhoneRecorderState = i;
        return i;
    }

*/



}
