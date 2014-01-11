// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.*;
import android.os.*;
import android.util.Log;
import com.android.internal.telephony.Call;
import com.android.internal.telephony.Connection;
import java.io.File;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, CallNotifier

public class CallTime extends Handler
{
    class CallTimeHandler extends Handler
    {

        final CallTime this$0;

        public void handleMessage(Message message)
        {
        }

        public CallTimeHandler(Looper looper)
        {
            this$0 = CallTime.this;
            super(looper);
        }
    }

    class CallTimeReceiver extends BroadcastReceiver
    {

        final CallTime this$0;

        public void onReceive(Context context, Intent intent)
        {
            if ("calltime_minute_reminder".equals(intent.getAction()))
                updateRminder();
        }

        CallTimeReceiver()
        {
            this$0 = CallTime.this;
            super();
        }
    }

    static interface OnTickListener
    {

        public abstract void onTickForCallTimeElapsed(long l);
    }

    private class PeriodicTimerCallback
        implements Runnable
    {

        final CallTime this$0;

        public void run()
        {
            CallTime.log("PeriodicTimerCallback's run() is called");
            sendMessageAtFrontOfQueue(Message.obtain(CallTime.this, 111));
        }

        PeriodicTimerCallback()
        {
            this$0 = CallTime.this;
            super();
        }
    }


    private static final String ACTION_REMINDER = "calltime_minute_reminder";
    private static final int CALL_TIME_UPDATE = 111;
    private static final boolean DBG = true;
    private static final int INTERVAL_TIME = 50;
    private static final String LOG_TAG = "PHONE/CallTime";
    private static final int MILLISECOND_TO_SECOND = 1000;
    private static final int MINUTE_TIME = 60;
    private static final int MINUTE_TO_MS = 60000;
    static final boolean PROFILE = true;
    private static final int PROFILE_STATE_NONE = 0;
    private static final int PROFILE_STATE_READY = 1;
    private static final int PROFILE_STATE_RUNNING = 2;
    private static Looper sCallTimeHanderThreadLooper = null;
    private static int sProfileState = 0;
    private static SharedPreferences sSharePref = null;
    AlarmManager mAlarm;
    boolean mAlarmEnable;
    private Call mCall;
    Context mCtx;
    private long mInterval;
    private long mLastReportedTime;
    private OnTickListener mListener;
    CallTimeReceiver mReceiver;
    PendingIntent mReminderPendingIntent;
    private PeriodicTimerCallback mTimerCallback;
    private boolean mTimerRunning;
    private CallTimeHandler mTimerThreadHandler;

    public CallTime(OnTickListener onticklistener)
    {
        mAlarm = null;
        mCtx = null;
        mAlarmEnable = false;
        mListener = onticklistener;
        mTimerCallback = new PeriodicTimerCallback();
        mCtx = PhoneGlobals.getInstance().getApplicationContext();
        mAlarm = (AlarmManager)mCtx.getSystemService("alarm");
        mReminderPendingIntent = PendingIntent.getBroadcast(mCtx, 0, new Intent("calltime_minute_reminder"), 0);
        mReceiver = new CallTimeReceiver();
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("calltime_minute_reminder");
        mCtx.registerReceiver(mReceiver, intentfilter);
        com/android/phone/CallTime;
        JVM INSTR monitorenter ;
        if (sCallTimeHanderThreadLooper == null)
        {
            HandlerThread handlerthread = new HandlerThread("CallTimeHandlerThread");
            handlerthread.start();
            sCallTimeHanderThreadLooper = handlerthread.getLooper();
        }
        com/android/phone/CallTime;
        JVM INSTR monitorexit ;
        mTimerThreadHandler = new CallTimeHandler(sCallTimeHanderThreadLooper);
        return;
        Exception exception;
        exception;
        com/android/phone/CallTime;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static long getCallDuration(Call call)
    {
        long l = 0L;
        List list = call.getConnections();
        int i = list.size();
        if (i == 1)
        {
            l = ((Connection)list.get(0)).getDurationMillis();
        } else
        {
            for (int j = 0; j < i; j++)
            {
                long l1 = ((Connection)list.get(j)).getDurationMillis();
                if (l1 > l)
                    l = l1;
            }

        }
        log((new StringBuilder()).append("updateElapsedTime, count=").append(i).append(", duration=").append(l).toString());
        return l;
    }

    private static void log(String s)
    {
        Log.d("PHONE/CallTime", (new StringBuilder()).append("[CallTime] ").append(s).toString());
    }

    static void setTraceReady()
    {
        if (sProfileState == 0)
        {
            sProfileState = 1;
            log("trace ready...");
            return;
        } else
        {
            log((new StringBuilder()).append("current trace state = ").append(sProfileState).toString());
            return;
        }
    }

    private void updateElapsedTime(Call call)
    {
        if (mListener != null)
        {
            long l = getCallDuration(call);
            mListener.onTickForCallTimeElapsed(l / 1000L);
        }
    }

    void cancelTimer()
    {
        log("cancelTimer()...");
        mTimerThreadHandler.removeCallbacks(mTimerCallback);
        removeMessages(111);
        mTimerRunning = false;
        stopReminder();
    }

    public void handleMessage(Message message)
    {
        switch (message.what)
        {
        case 111: // 'o'
            log("receive CALL_TIME_UPDATE message");
            if (isTraceRunning())
                stopTrace();
            mTimerRunning = false;
            periodicUpdateTimer();
            return;
        }
    }

    boolean isTraceReady()
    {
        return sProfileState == 1;
    }

    boolean isTraceRunning()
    {
        return sProfileState == 2;
    }

    void periodicUpdateTimer()
    {
        if (!mTimerRunning)
        {
            mTimerRunning = true;
            long l = SystemClock.uptimeMillis();
            long l1;
            for (l1 = mLastReportedTime + mInterval; l >= l1; l1 += mInterval);
            log((new StringBuilder()).append("periodicUpdateTimer() @ ").append(l1).toString());
            mTimerThreadHandler.postAtTime(mTimerCallback, l1);
            mLastReportedTime = l1;
            if (mCall != null && mCall.getState() == com.android.internal.telephony.Call.State.ACTIVE)
                updateElapsedTime(mCall);
            if (isTraceReady())
                startTrace();
            return;
        } else
        {
            log("periodicUpdateTimer: timer already running, bail");
            return;
        }
    }

    void reset()
    {
        log("reset()...");
        mLastReportedTime = SystemClock.uptimeMillis() - mInterval;
    }

    void setActiveCallMode(Call call)
    {
        log((new StringBuilder()).append("setActiveCallMode(").append(call).append(")...").toString());
        mCall = call;
        mInterval = 1000L;
        sSharePref = PhoneGlobals.getInstance().getApplicationContext().getSharedPreferences("com.android.phone_preferences", 0);
        if (sSharePref == null)
            log("setActiveCallMode: can not find 'com.android.phone_preferences'...");
        startReminder(getCallDuration(call));
    }

    public void setCallTimeListener(OnTickListener onticklistener)
    {
        mListener = onticklistener;
    }

    void startReminder(long l)
    {
        if (sSharePref != null)
        {
            mAlarm.cancel(mReminderPendingIntent);
            mAlarmEnable = true;
            long l1 = l % 60000L;
            long l2;
            if (l1 < 50000L)
                l2 = 50000L - l1;
            else
                l2 = 50000L + (60000L - l1);
            if (sSharePref.getBoolean("minute_reminder_key", false))
            {
                mAlarm.set(2, l2 + SystemClock.elapsedRealtime(), mReminderPendingIntent);
                return;
            }
        }
    }

    void startTrace()
    {
        int i = 1;
        if (sProfileState != i)
            i = 0;
        if ((i & 1) != 0)
        {
            File file = PhoneGlobals.getInstance().getDir("phoneTrace", 0);
            if (!file.exists())
                file.mkdirs();
            String s = (new StringBuilder()).append(file.getPath()).append(File.separator).append("callstate").toString();
            String s1 = (new StringBuilder()).append(s).append(".data").toString();
            String s2 = (new StringBuilder()).append(s).append(".key").toString();
            File file1 = new File(s1);
            if (file1.exists())
                file1.delete();
            File file2 = new File(s2);
            if (file2.exists())
                file2.delete();
            sProfileState = 2;
            log("startTrace");
            Debug.startMethodTracing(s, 0x800000);
        }
    }

    void stopReminder()
    {
        mAlarmEnable = false;
        mAlarm.cancel(mReminderPendingIntent);
    }

    void stopTrace()
    {
        if (sProfileState == 2)
        {
            sProfileState = 0;
            log("stopTrace");
            Debug.stopMethodTracing();
        }
    }

    void updateRminder()
    {
        if (mCall != null && mCall.getState() == com.android.internal.telephony.Call.State.ACTIVE)
        {
            PhoneGlobals.getInstance().notifier.onTimeToReminder();
            mAlarm.set(2, 60000L + SystemClock.elapsedRealtime(), mReminderPendingIntent);
        }
    }


}
