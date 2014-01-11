// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.Looper;
import android.os.MessageQueue;
import android.util.Log;
import dalvik.system.CloseGuard;

public abstract class DisplayEventReceiver
{

    private static final String TAG = "DisplayEventReceiver";
    private final CloseGuard mCloseGuard = CloseGuard.get();
    private MessageQueue mMessageQueue;
    private int mReceiverPtr;

    public DisplayEventReceiver(Looper looper)
    {
        if (looper == null)
        {
            throw new IllegalArgumentException("looper must not be null");
        } else
        {
            mMessageQueue = looper.getQueue();
            mReceiverPtr = nativeInit(this, mMessageQueue);
            mCloseGuard.open("dispose");
            return;
        }
    }

    private void dispatchHotplug(long l, int i, boolean flag)
    {
        onHotplug(l, i, flag);
    }

    private void dispatchVsync(long l, int i, int j)
    {
        onVsync(l, i, j);
    }

    private void dispose(boolean flag)
    {
        if (mCloseGuard != null)
        {
            if (flag)
                mCloseGuard.warnIfOpen();
            mCloseGuard.close();
        }
        if (mReceiverPtr != 0)
        {
            nativeDispose(mReceiverPtr);
            mReceiverPtr = 0;
        }
        mMessageQueue = null;
    }

    private static native void nativeDispose(int i);

    private static native int nativeInit(DisplayEventReceiver displayeventreceiver, MessageQueue messagequeue);

    private static native void nativeScheduleVsync(int i);

    public void dispose()
    {
        dispose(false);
    }

    protected void finalize()
        throws Throwable
    {
        dispose(true);
        super.finalize();
        return;
        Exception exception;
        exception;
        super.finalize();
        throw exception;
    }

    public void onHotplug(long l, int i, boolean flag)
    {
    }

    public void onVsync(long l, int i, int j)
    {
    }

    public void scheduleVsync()
    {
        if (mReceiverPtr == 0)
        {
            Log.w("DisplayEventReceiver", "Attempted to schedule a vertical sync pulse but the display event receiver has already been disposed.");
            return;
        } else
        {
            nativeScheduleVsync(mReceiverPtr);
            return;
        }
    }
}
