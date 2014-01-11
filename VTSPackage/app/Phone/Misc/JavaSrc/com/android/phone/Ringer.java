// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.*;
import android.media.*;
import android.net.Uri;
import android.os.*;
import android.util.Log;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils

public class Ringer
{
    private class VbirtStateChangeReceiver extends BroadcastReceiver
    {

        final Ringer this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("vbirtchange"))
            {
                Log.i("VbirtStateChangeReceiver", "onReceive");
                if (mVibratorThread != null)
                {
                    mContinueVibrating = false;
                    mVibratorThread = null;
                }
            }
        }

        private VbirtStateChangeReceiver()
        {
            this$0 = Ringer.this;
            super();
        }

    }

    private class VibratorThread extends Thread
    {

        boolean mStop;
        final Ringer this$0;

        public void run()
        {
            while (mContinueVibrating && !mStop) 
            {
                mVibrator.vibrate(1000L);
                SystemClock.sleep(2000L);
            }
        }

        private VibratorThread()
        {
            this$0 = Ringer.this;
            super();
            mStop = false;
        }

    }

    private class Worker
        implements Runnable
    {

        private final Object mLock;
        private Looper mLooper;
        final Ringer this$0;

        public Looper getLooper()
        {
            return mLooper;
        }

        public void quit()
        {
            mLooper.quit();
        }

        public void run()
        {
            synchronized (mLock)
            {
                Log.d("Ringer", "Worker's run enter:");
                Looper.prepare();
                mLooper = Looper.myLooper();
                Log.d("Ringer", "Worker has got the looper, notify");
                mLock.notifyAll();
            }
            Looper.loop();
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        Worker(String s)
        {
            this$0 = Ringer.this;
            super();
            mLock = new Object();
            (new Thread(null, this, s)).start();
            Object obj = mLock;
            obj;
            JVM INSTR monitorenter ;
            Log.d("Ringer", "Worker's constructor enter:");
_L1:
            if (mLooper != null)
                break MISSING_BLOCK_LABEL_81;
            Log.d("Ringer", "Worker waiting for looper ready!");
            try
            {
                mLock.wait(5000L);
            }
            catch (InterruptedException interruptedexception) { }
              goto _L1
            Log.d("Ringer", (new StringBuilder()).append("Worker's run exit with looper = ").append(mLooper).toString());
            obj;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }
    }


    private static final boolean DBG = true;
    private static final String LOG_TAG = "Ringer";
    private static final int PAUSE_LENGTH = 1000;
    private static final int PLAY_RING_ONCE = 1;
    private static final int STOP_RING = 3;
    public static final String VBIRT_MODE_CHANGE_ACTION = "vbirtchange";
    private static final int VIBRATE_LENGTH = 1000;
    private static Ringer sInstance;
    private static boolean sIsRingingAndVolumnZero = false;
    Context mContext;
    volatile boolean mContinueVibrating;
    Uri mCustomRingtoneUri;
    private long mFirstRingEventTime;
    private long mFirstRingStartTime;
    private boolean mMute;
    IPowerManager mPowerManager;
    private Handler mRingHandler;
    private Worker mRingThread;
    Ringtone mRingtone;
    private VbirtStateChangeReceiver mVbirtStateChangeReceiver;
    Vibrator mVibrator;
    VibratorThread mVibratorThread;

    private Ringer(Context context)
    {
        mCustomRingtoneUri = android.provider.Settings.System.DEFAULT_RINGTONE_URI;
        mFirstRingEventTime = -1L;
        mFirstRingStartTime = -1L;
        mMute = false;
        mVbirtStateChangeReceiver = new VbirtStateChangeReceiver();
        mContext = context;
        mPowerManager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("vbirtchange");
        mVibrator = new SystemVibrator();
        mContext.registerReceiver(mVbirtStateChangeReceiver, intentfilter);
    }

    static Ringer init(Context context)
    {
        com/android/phone/Ringer;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_29;
        sInstance = new Ringer(context);
_L1:
        Ringer ringer = sInstance;
        com/android/phone/Ringer;
        JVM INSTR monitorexit ;
        return ringer;
        Log.wtf("Ringer", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/Ringer;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean isRingtonePlaying()
    {
        boolean flag = true;
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        if ((mRingtone == null || !mRingtone.isPlaying()) && (mRingHandler == null || !mRingHandler.hasMessages(1)))
            flag = false;
        this;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private boolean isVibrating()
    {
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if (mVibratorThread != null)
            flag = true;
        else
            flag = false;
        this;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static void log(String s)
    {
        Log.d("Ringer", s);
    }

    private void makeLooper()
    {
        if (mRingThread == null)
        {
            mRingThread = new Worker("ringer");
            if (mRingThread.getLooper() != null)
            {
                mRingHandler = new Handler(mRingThread.getLooper()) {

                    final Ringer this$0;

                    public void handleMessage(Message message)
                    {
                        message.what;
                        JVM INSTR tableswitch 1 3: default 32
                    //                                   1 33
                    //                                   2 32
                    //                                   3 223;
                           goto _L1 _L2 _L1 _L3
_L1:
                        return;
_L2:
                        Ringtone ringtone1;
                        Ringer.log("mRingHandler: PLAY_RING_ONCE...");
                        if (mRingtone == null && !hasMessages(3))
                        {
                            Ringer.log((new StringBuilder()).append("creating ringtone: ").append(mCustomRingtoneUri).toString());
                            Ringtone ringtone2 = RingtoneManager.getRingtone(mContext, mCustomRingtoneUri);
                            synchronized (Ringer.this)
                            {
                                if (!hasMessages(3))
                                    mRingtone = ringtone2;
                            }
                        }
                        ringtone1 = mRingtone;
                        if (ringtone1 == null || hasMessages(3) || ringtone1.isPlaying()) goto _L1; else goto _L4
_L4:
                        Ringer.log("play ringtone... ");
                        PhoneUtils.setAudioMode();
                        ringtone1.play();
                        synchronized (Ringer.this)
                        {
                            if (mFirstRingStartTime < 0L)
                                mFirstRingStartTime = SystemClock.elapsedRealtime();
                        }
                        return;
                        exception;
                        ringer;
                        JVM INSTR monitorexit ;
                        throw exception;
                        exception1;
                        ringer1;
                        JVM INSTR monitorexit ;
                        throw exception1;
_L3:
                        Ringer.log("mRingHandler: STOP_RING...");
                        Ringtone ringtone = (Ringtone)message.obj;
                        if (ringtone != null)
                            ringtone.stop();
                        else
                            Ringer.log((new StringBuilder()).append("- STOP_RING with null ringtone!  msg = ").append(message).toString());
                        getLooper().quit();
                        return;
                    }

            
            {
                this$0 = Ringer.this;
                super(looper);
            }
                }
;
                return;
            }
        }
    }

    protected void finalize()
    {
        try
        {
            mContext.unregisterReceiver(mVbirtStateChangeReceiver);
            return;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            log("IllegalArgumentException happened in finalized().");
        }
    }

    Uri getCustomRingToneUri()
    {
        return mCustomRingtoneUri;
    }

    public boolean isRinging()
    {
        this;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        if (isRingtonePlaying() || isVibrating())
            flag = true;
        else
            flag = false;
        this;
        JVM INSTR monitorexit ;
        return flag;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void ring()
    {
        log("ring()...");
        if (mCustomRingtoneUri == null)
            log("ring()... with null uri");
        if (mMute)
        {
            log("mute, bail out...");
            return;
        }
        this;
        JVM INSTR monitorenter ;
        if (!PhoneGlobals.getInstance().showBluetoothIndication())
            break MISSING_BLOCK_LABEL_69;
        mPowerManager.setAttentionLight(true, 255);
_L1:
        if (PhoneUtils.getAudioControlState() != 2)
            break MISSING_BLOCK_LABEL_88;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        try
        {
            mPowerManager.setAttentionLight(true, 0xffffff);
        }
        catch (RemoteException remoteexception) { }
          goto _L1
        if (shouldVibrate() && mVibratorThread == null)
        {
            mContinueVibrating = true;
            mVibratorThread = new VibratorThread();
            log("- starting vibrator...");
            mVibratorThread.start();
        }
        if (((AudioManager)mContext.getSystemService("audio")).getStreamVolume(2) != 0)
            break MISSING_BLOCK_LABEL_167;
        log("skipping ring because volume is zero");
        PhoneUtils.setAudioMode();
        sIsRingingAndVolumnZero = true;
        this;
        JVM INSTR monitorexit ;
        return;
        makeLooper();
        if (mFirstRingEventTime >= 0L) goto _L3; else goto _L2
_L2:
        mFirstRingEventTime = SystemClock.elapsedRealtime();
        if (mRingHandler != null)
            mRingHandler.sendEmptyMessage(1);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L3:
label0:
        {
            if (mFirstRingStartTime <= 0L)
                break label0;
            log((new StringBuilder()).append("delaying ring by ").append(mFirstRingStartTime - mFirstRingEventTime).toString());
            if (mRingHandler != null)
                mRingHandler.sendEmptyMessageDelayed(1, mFirstRingStartTime - mFirstRingEventTime);
        }
          goto _L4
        mFirstRingEventTime = SystemClock.elapsedRealtime();
          goto _L4
    }

    void setCustomRingtoneUri(Uri uri)
    {
        if (RingtoneManager.isRingtoneExist(mContext, uri))
        {
            mCustomRingtoneUri = uri;
            log((new StringBuilder()).append("setCustomRingtoneUri = ").append(uri).toString());
            return;
        } else
        {
            mCustomRingtoneUri = android.provider.Settings.System.DEFAULT_RINGTONE_URI;
            log((new StringBuilder()).append("CustomRingtoneUri = ").append(uri).append(", not available, use default ringtone!").toString());
            return;
        }
    }

    void setMute(boolean flag)
    {
        mMute = flag;
    }

    boolean shouldVibrate()
    {
        return ((AudioManager)mContext.getSystemService("audio")).shouldVibrate(0);
    }

    void stopRing()
    {
        this;
        JVM INSTR monitorenter ;
        log("stopRing()...");
        Exception exception;
        try
        {
            mPowerManager.setAttentionLight(false, 0);
        }
        catch (RemoteException remoteexception) { }
        if (mRingHandler == null) goto _L2; else goto _L1
_L1:
        mRingHandler.removeCallbacksAndMessages(null);
        Message message = mRingHandler.obtainMessage(3);
        message.obj = mRingtone;
        mRingHandler.sendMessage(message);
        PhoneUtils.setAudioMode();
        mRingThread = null;
        mRingHandler = null;
        mRingtone = null;
        mFirstRingEventTime = -1L;
        mFirstRingStartTime = -1L;
_L5:
        if (mVibratorThread == null) goto _L4; else goto _L3
_L3:
        log("- stopRing: cleaning up vibrator thread...");
        mContinueVibrating = false;
        mVibratorThread.mStop = true;
        mVibratorThread = null;
_L7:
        mVibrator.cancel();
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (mRingThread != null)
            mRingThread = null;
        log("- stopRing: null mRingHandler!");
          goto _L5
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        if (!sIsRingingAndVolumnZero) goto _L7; else goto _L6
_L6:
        sIsRingingAndVolumnZero = false;
        PhoneUtils.setAudioMode();
          goto _L7
    }

    void updateRingerContextAfterRadioTechnologyChange(Phone phone)
    {
        Log.d("Ringer", "updateRingerContextAfterRadioTechnologyChange...");
        mContext = phone.getContext();
    }





/*
    static long access$302(Ringer ringer, long l)
    {
        ringer.mFirstRingStartTime = l;
        return l;
    }

*/
}
