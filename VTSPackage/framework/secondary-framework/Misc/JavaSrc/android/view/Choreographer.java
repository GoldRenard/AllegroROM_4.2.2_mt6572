// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.hardware.display.DisplayManagerGlobal;
import android.os.*;
import android.util.Log;
import com.mediatek.xlog.Xlog;

// Referenced classes of package android.view:
//            DisplayInfo, DisplayEventReceiver

public final class Choreographer
{
    private final class CallbackQueue
    {

        private CallbackRecord mHead;
        final Choreographer this$0;

        public void addCallbackLocked(long l, Object obj, Object obj1)
        {
            CallbackRecord callbackrecord = obtainCallbackLocked(l, obj, obj1);
            CallbackRecord callbackrecord1 = mHead;
            if (callbackrecord1 == null)
            {
                mHead = callbackrecord;
                return;
            }
            if (l < callbackrecord1.dueTime)
            {
                callbackrecord.next = callbackrecord1;
                mHead = callbackrecord;
                return;
            }
            do
            {
label0:
                {
                    if (callbackrecord1.next != null)
                    {
                        if (l >= callbackrecord1.next.dueTime)
                            break label0;
                        callbackrecord.next = callbackrecord1.next;
                    }
                    callbackrecord1.next = callbackrecord;
                    return;
                }
                callbackrecord1 = callbackrecord1.next;
            } while (true);
        }

        public CallbackRecord extractDueCallbacksLocked(long l)
        {
            CallbackRecord callbackrecord = mHead;
            if (callbackrecord != null && callbackrecord.dueTime <= l)
            {
                CallbackRecord callbackrecord1 = callbackrecord;
                CallbackRecord callbackrecord2 = callbackrecord1.next;
                do
                {
label0:
                    {
                        if (callbackrecord2 != null)
                        {
                            if (callbackrecord2.dueTime <= l)
                                break label0;
                            callbackrecord1.next = null;
                        }
                        mHead = callbackrecord2;
                        return callbackrecord;
                    }
                    callbackrecord1 = callbackrecord2;
                    callbackrecord2 = callbackrecord2.next;
                } while (true);
            } else
            {
                return null;
            }
        }

        public boolean hasDueCallbacksLocked(long l)
        {
            return mHead != null && mHead.dueTime <= l;
        }

        public void removeCallbacksLocked(Object obj, Object obj1)
        {
            CallbackRecord callbackrecord = null;
            CallbackRecord callbackrecord2;
            for (CallbackRecord callbackrecord1 = mHead; callbackrecord1 != null; callbackrecord1 = callbackrecord2)
            {
                callbackrecord2 = callbackrecord1.next;
                if (obj != null && callbackrecord1.action != obj || obj1 != null && callbackrecord1.token != obj1)
                {
                    callbackrecord = callbackrecord1;
                    continue;
                }
                if (callbackrecord != null)
                    callbackrecord.next = callbackrecord2;
                else
                    mHead = callbackrecord2;
                recycleCallbackLocked(callbackrecord1);
            }

        }

        private CallbackQueue()
        {
            this$0 = Choreographer.this;
            super();
        }

    }

    private static final class CallbackRecord
    {

        public Object action;
        public long dueTime;
        public CallbackRecord next;
        public Object token;

        public void run(long l)
        {
            if (token == Choreographer.FRAME_CALLBACK_TOKEN)
            {
                ((FrameCallback)action).doFrame(l);
                return;
            } else
            {
                ((Runnable)action).run();
                return;
            }
        }

        private CallbackRecord()
        {
        }

    }

    public static interface FrameCallback
    {

        public abstract void doFrame(long l);
    }

    private final class FrameDisplayEventReceiver extends DisplayEventReceiver
        implements Runnable
    {

        private int mFrame;
        private boolean mHavePendingVsync;
        private long mTimestampNanos;
        final Choreographer this$0;

        public void onVsync(long l, int i, int j)
        {
            if (i != 0)
            {
                Log.d("Choreographer", "Received vsync from secondary display, but we don't support this case yet.  Choreographer needs a way to explicitly request vsync for a specific display to ensure it doesn't lose track of its scheduled vsync.");
                scheduleVsync();
                return;
            }
            long l1 = System.nanoTime();
            if (Choreographer.DEBUG)
                Xlog.d("Choreographer", (new StringBuilder()).append("onVsync: timestampNanos = ").append(l).append(",frame = ").append(j).append(",now = ").append(l1).append(",mHavePendingVsync = ").append(mHavePendingVsync).append(",this = ").append(Choreographer.this).toString());
            if (l > l1)
            {
                Log.w("Choreographer", (new StringBuilder()).append("Frame time is ").append(1E-006F * (float)(l - l1)).append(" ms in the future!  Check that graphics HAL is generating vsync ").append("timestamps using the correct timebase.").toString());
                l = l1;
            }
            if (mHavePendingVsync)
                Log.w("Choreographer", "Already have a pending vsync event.  There should only be one at a time.");
            else
                mHavePendingVsync = true;
            mTimestampNanos = l;
            mFrame = j;
            Message message = Message.obtain(mHandler, this);
            message.setAsynchronous(true);
            mHandler.sendMessageAtTime(message, l / 0xf4240L);
        }

        public void run()
        {
            mHavePendingVsync = false;
            doFrame(mTimestampNanos, mFrame);
        }

        public FrameDisplayEventReceiver(Looper looper)
        {
            this$0 = Choreographer.this;
            super(looper);
        }
    }

    private final class FrameHandler extends Handler
    {

        final Choreographer this$0;

        public void handleMessage(Message message)
        {
            if (Choreographer.DEBUG)
                Xlog.d("Choreographer", (new StringBuilder()).append("FrameHandler handleMessage: msg = ").append(message.what).append(",this = ").append(this).toString());
            switch (message.what)
            {
            case 2: // '\002'
                doScheduleCallback(message.arg1);
                return;

            case 1: // '\001'
                doScheduleVsync();
                return;

            case 0: // '\0'
                doFrame(System.nanoTime(), 0);
                return;
            }
        }

        public FrameHandler(Looper looper)
        {
            this$0 = Choreographer.this;
            super(looper);
        }
    }


    public static final int CALLBACK_ANIMATION = 1;
    public static final int CALLBACK_INPUT = 0;
    private static final int CALLBACK_LAST = 2;
    public static final int CALLBACK_TRAVERSAL = 2;
    private static final boolean DEBUG = SystemProperties.getBoolean("debug.vsync.enablelog", false);
    private static final long DEFAULT_FRAME_DELAY = 10L;
    private static final Object FRAME_CALLBACK_TOKEN = new Object() {

        public String toString()
        {
            return "FRAME_CALLBACK_TOKEN";
        }

    }
;
    private static final int MSG_DO_FRAME = 0;
    private static final int MSG_DO_SCHEDULE_CALLBACK = 2;
    private static final int MSG_DO_SCHEDULE_VSYNC = 1;
    private static final long NANOS_PER_MS = 0xf4240L;
    private static final int SKIPPED_FRAME_WARNING_LIMIT = SystemProperties.getInt("debug.choreographer.skipwarning", 30);
    private static final String TAG = "Choreographer";
    private static final boolean USE_FRAME_TIME = SystemProperties.getBoolean("debug.choreographer.frametime", true);
    private static final boolean USE_VSYNC = SystemProperties.getBoolean("debug.choreographer.vsync", true);
    private static volatile long sFrameDelay = 10L;
    private static final ThreadLocal sThreadInstance = new ThreadLocal() {

        protected Choreographer initialValue()
        {
            Looper looper = Looper.myLooper();
            if (looper == null)
                throw new IllegalStateException("The current thread must have a looper!");
            else
                return new Choreographer(looper);
        }

        protected volatile Object initialValue()
        {
            return initialValue();
        }

    }
;
    private CallbackRecord mCallbackPool;
    private final CallbackQueue mCallbackQueues[];
    private boolean mCallbacksRunning;
    private final FrameDisplayEventReceiver mDisplayEventReceiver;
    private long mFrameIntervalNanos;
    private boolean mFrameScheduled;
    private final FrameHandler mHandler;
    private long mLastFrameTimeNanos;
    private final Object mLock;
    private final Looper mLooper;

    private Choreographer(Looper looper)
    {
        mLock = new Object();
        mLooper = looper;
        mHandler = new FrameHandler(looper);
        FrameDisplayEventReceiver framedisplayeventreceiver;
        if (USE_VSYNC)
            framedisplayeventreceiver = new FrameDisplayEventReceiver(looper);
        else
            framedisplayeventreceiver = null;
        mDisplayEventReceiver = framedisplayeventreceiver;
        mLastFrameTimeNanos = 0x8000000000000000L;
        mFrameIntervalNanos = (long)(1E+009F / getRefreshRate());
        mCallbackQueues = new CallbackQueue[3];
        for (int i = 0; i <= 2; i++)
            mCallbackQueues[i] = new CallbackQueue();

        if (DEBUG)
            Xlog.d("Choreographer", (new StringBuilder()).append("Choreographer: mDisplayEventReceiver = ").append(mDisplayEventReceiver).append(",USE_VSYNC = ").append(USE_VSYNC).append(",this = ").append(this).toString());
    }


    public static long getFrameDelay()
    {
        return sFrameDelay;
    }

    public static Choreographer getInstance()
    {
        return (Choreographer)sThreadInstance.get();
    }

    private static float getRefreshRate()
    {
        return DisplayManagerGlobal.getInstance().getDisplayInfo(0).refreshRate;
    }

    private boolean isRunningOnLooperThreadLocked()
    {
        return Looper.myLooper() == mLooper;
    }

    private CallbackRecord obtainCallbackLocked(long l, Object obj, Object obj1)
    {
        CallbackRecord callbackrecord = mCallbackPool;
        if (callbackrecord == null)
        {
            callbackrecord = new CallbackRecord();
        } else
        {
            mCallbackPool = callbackrecord.next;
            callbackrecord.next = null;
        }
        callbackrecord.dueTime = l;
        callbackrecord.action = obj;
        callbackrecord.token = obj1;
        return callbackrecord;
    }

    private void postCallbackDelayedInternal(int i, Object obj, Object obj1, long l)
    {
        if (DEBUG)
            Xlog.d("Choreographer", (new StringBuilder()).append("PostCallback: type=").append(i).append(", action=").append(obj).append(", token=").append(obj1).append(", delayMillis=").append(l).append(",this = ").append(this).toString());
        Object obj2 = mLock;
        obj2;
        JVM INSTR monitorenter ;
        long l1 = SystemClock.uptimeMillis();
        long l2 = l1 + l;
        mCallbackQueues[i].addCallbackLocked(l2, obj, obj1);
        if (l2 > l1)
            break MISSING_BLOCK_LABEL_120;
        scheduleFrameLocked(l1);
_L2:
        obj2;
        JVM INSTR monitorexit ;
        return;
        Message message = mHandler.obtainMessage(2, obj);
        message.arg1 = i;
        message.setAsynchronous(true);
        mHandler.sendMessageAtTime(message, l2);
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        obj2;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void recycleCallbackLocked(CallbackRecord callbackrecord)
    {
        callbackrecord.action = null;
        callbackrecord.token = null;
        callbackrecord.next = mCallbackPool;
        mCallbackPool = callbackrecord;
    }

    private void removeCallbacksInternal(int i, Object obj, Object obj1)
    {
        if (DEBUG)
            Xlog.d("Choreographer", (new StringBuilder()).append("RemoveCallbacks: type=").append(i).append(", action=").append(obj).append(", token=").append(obj1).append(",this = ").append(this).toString());
        Object obj2 = mLock;
        obj2;
        JVM INSTR monitorenter ;
        mCallbackQueues[i].removeCallbacksLocked(obj, obj1);
        if (obj == null || obj1 != null)
            break MISSING_BLOCK_LABEL_96;
        mHandler.removeMessages(2, obj);
        obj2;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        obj2;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void scheduleFrameLocked(long l)
    {
label0:
        {
            if (!mFrameScheduled)
            {
                mFrameScheduled = true;
                if (!USE_VSYNC)
                    break label0;
                if (isRunningOnLooperThreadLocked())
                {
                    if (DEBUG)
                        Xlog.d("Choreographer", (new StringBuilder()).append("Scheduling next frame on vsync case 1, this = ").append(this).toString());
                    scheduleVsyncLocked();
                } else
                {
                    Message message1 = mHandler.obtainMessage(1);
                    message1.setAsynchronous(true);
                    mHandler.sendMessageAtFrontOfQueue(message1);
                    if (DEBUG)
                    {
                        Xlog.d("Choreographer", (new StringBuilder()).append("Scheduling next frame on vsync case 2, this = ").append(this).toString());
                        return;
                    }
                }
            }
            return;
        }
        long l1 = Math.max(mLastFrameTimeNanos / 0xf4240L + sFrameDelay, l);
        if (DEBUG)
            Xlog.d("Choreographer", (new StringBuilder()).append("Scheduling next frame in ").append(l1 - l).append(" ms, this = ").append(this).toString());
        Message message = mHandler.obtainMessage(0);
        message.setAsynchronous(true);
        mHandler.sendMessageAtTime(message, l1);
    }

    private void scheduleVsyncLocked()
    {
        mDisplayEventReceiver.scheduleVsync();
    }

    public static void setFrameDelay(long l)
    {
        sFrameDelay = l;
    }

    public static long subtractFrameDelay(long l)
    {
        long l1 = sFrameDelay;
        if (l <= l1)
            return 0L;
        else
            return l - l1;
    }

    void doCallbacks(int i, long l)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        CallbackRecord callbackrecord;
        long l1 = SystemClock.uptimeMillis();
        callbackrecord = mCallbackQueues[i].extractDueCallbacksLocked(l1);
        if (callbackrecord != null)
            break MISSING_BLOCK_LABEL_36;
        obj;
        JVM INSTR monitorexit ;
        return;
        mCallbacksRunning = true;
        obj;
        JVM INSTR monitorexit ;
        CallbackRecord callbackrecord1 = callbackrecord;
_L2:
        if (callbackrecord1 == null)
            break; /* Loop/switch isn't completed */
        if (DEBUG)
            Xlog.d("Choreographer", (new StringBuilder()).append("RunCallback: type=").append(i).append(", action=").append(callbackrecord1.action).append(", token=").append(callbackrecord1.token).append(", latencyMillis=").append(SystemClock.uptimeMillis() - callbackrecord1.dueTime).append(",this = ").append(this).toString());
        callbackrecord1.run(l);
        callbackrecord1 = callbackrecord1.next;
        if (true) goto _L2; else goto _L1
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        Exception exception2;
        exception2;
        Object obj2 = mLock;
        obj2;
        JVM INSTR monitorenter ;
        mCallbacksRunning = false;
_L4:
        CallbackRecord callbackrecord3;
        callbackrecord3 = callbackrecord.next;
        recycleCallbackLocked(callbackrecord);
        callbackrecord = callbackrecord3;
        if (callbackrecord != null) goto _L4; else goto _L3
_L3:
        obj2;
        JVM INSTR monitorexit ;
        throw exception2;
        Exception exception3;
        exception3;
        obj2;
        JVM INSTR monitorexit ;
        throw exception3;
_L1:
        Object obj1 = mLock;
        obj1;
        JVM INSTR monitorenter ;
        mCallbacksRunning = false;
_L6:
        CallbackRecord callbackrecord2;
        callbackrecord2 = callbackrecord.next;
        recycleCallbackLocked(callbackrecord);
        callbackrecord = callbackrecord2;
        if (callbackrecord != null) goto _L6; else goto _L5
_L5:
        obj1;
        JVM INSTR monitorexit ;
        return;
        Exception exception1;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
    }

    void doFrame(long l, int i)
    {
label0:
        {
            synchronized (mLock)
            {
                if (DEBUG)
                    Xlog.d("Choreographer", (new StringBuilder()).append("doFrame:  frameTimeNanos = ").append(l).append(",frame = ").append(i).append(",mFrameScheduled = ").append(mFrameScheduled).append(",this = ").append(this).toString());
                if (mFrameScheduled)
                    break label0;
            }
            return;
        }
        long l1 = System.nanoTime();
        long l2 = l1 - l;
        if (l2 < mFrameIntervalNanos) goto _L2; else goto _L1
_L1:
        long l5;
        long l4 = l2 / mFrameIntervalNanos;
        if (l4 >= (long)SKIPPED_FRAME_WARNING_LIMIT)
            Log.i("Choreographer", (new StringBuilder()).append("Skipped ").append(l4).append(" frames!  ").append("The application may be doing too much work on its main thread.").toString());
        l5 = l2 % mFrameIntervalNanos;
        if (DEBUG)
            Log.d("Choreographer", (new StringBuilder()).append("Missed vsync by ").append(1E-006F * (float)l2).append(" ms ").append("which is more than the frame interval of ").append(1E-006F * (float)mFrameIntervalNanos).append(" ms!  ").append("Skipping ").append(l4).append(" frames and setting frame ").append("time to ").append(1E-006F * (float)l5).append(" ms in the past.").toString());
          goto _L3
_L2:
        if (l >= mLastFrameTimeNanos)
            break MISSING_BLOCK_LABEL_322;
        if (DEBUG)
            Log.d("Choreographer", "Frame time appears to be going backwards.  May be due to a previously skipped frame.  Waiting for next vsync.");
        scheduleVsyncLocked();
        obj;
        JVM INSTR monitorexit ;
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        mFrameScheduled = false;
        mLastFrameTimeNanos = l;
        obj;
        JVM INSTR monitorexit ;
        doCallbacks(0, l);
        doCallbacks(1, l);
        doCallbacks(2, l);
        if (DEBUG)
        {
            long l3 = System.nanoTime();
            Log.d("Choreographer", (new StringBuilder()).append("Frame ").append(i).append(": Finished, took ").append(1E-006F * (float)(l3 - l1)).append(" ms, latency ").append(1E-006F * (float)(l1 - l)).append(" ms, this = ").append(this).toString());
        }
        return;
_L3:
        l = l1 - l5;
        if (true) goto _L2; else goto _L4
_L4:
    }

    void doScheduleCallback(int i)
    {
        synchronized (mLock)
        {
            if (!mFrameScheduled)
            {
                long l = SystemClock.uptimeMillis();
                if (mCallbackQueues[i].hasDueCallbacksLocked(l))
                    scheduleFrameLocked(l);
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void doScheduleVsync()
    {
        synchronized (mLock)
        {
            if (mFrameScheduled)
                scheduleVsyncLocked();
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public long getFrameTime()
    {
        return getFrameTimeNanos() / 0xf4240L;
    }

    public long getFrameTimeNanos()
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (!mCallbacksRunning)
            throw new IllegalStateException("This method must only be called as part of a callback while a frame is in progress.");
        break MISSING_BLOCK_LABEL_30;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        if (!USE_FRAME_TIME) goto _L2; else goto _L1
_L1:
        long l1 = mLastFrameTimeNanos;
_L3:
        obj;
        JVM INSTR monitorexit ;
        return l1;
_L2:
        long l = System.nanoTime();
        l1 = l;
          goto _L3
    }

    public void postCallback(int i, Runnable runnable, Object obj)
    {
        postCallbackDelayed(i, runnable, obj, 0L);
    }

    public void postCallbackDelayed(int i, Runnable runnable, Object obj, long l)
    {
        if (runnable == null)
            throw new IllegalArgumentException("action must not be null");
        if (i >= 0 && i <= 2)
        {
            postCallbackDelayedInternal(i, runnable, obj, l);
            return;
        } else
        {
            throw new IllegalArgumentException("callbackType is invalid");
        }
    }

    public void postFrameCallback(FrameCallback framecallback)
    {
        postFrameCallbackDelayed(framecallback, 0L);
    }

    public void postFrameCallbackDelayed(FrameCallback framecallback, long l)
    {
        if (framecallback == null)
        {
            throw new IllegalArgumentException("callback must not be null");
        } else
        {
            postCallbackDelayedInternal(1, framecallback, FRAME_CALLBACK_TOKEN, l);
            return;
        }
    }

    public void removeCallbacks(int i, Runnable runnable, Object obj)
    {
        if (i >= 0 && i <= 2)
        {
            removeCallbacksInternal(i, runnable, obj);
            return;
        } else
        {
            throw new IllegalArgumentException("callbackType is invalid");
        }
    }

    public void removeFrameCallback(FrameCallback framecallback)
    {
        if (framecallback == null)
        {
            throw new IllegalArgumentException("callback must not be null");
        } else
        {
            removeCallbacksInternal(1, framecallback, FRAME_CALLBACK_TOKEN);
            return;
        }
    }






}
