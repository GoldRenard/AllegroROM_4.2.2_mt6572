// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.os.Looper;
import android.os.MessageQueue;
import android.util.Log;
import android.util.SparseIntArray;
import dalvik.system.CloseGuard;

// Referenced classes of package android.view:
//            InputEvent, InputChannel

public abstract class InputEventReceiver
{
    public static interface Factory
    {

        public abstract InputEventReceiver createInputEventReceiver(InputChannel inputchannel, Looper looper);
    }


    private static final String TAG = "InputEventReceiver";
    private final CloseGuard mCloseGuard = CloseGuard.get();
    private InputChannel mInputChannel;
    private MessageQueue mMessageQueue;
    private int mReceiverPtr;
    private final SparseIntArray mSeqMap = new SparseIntArray();

    public InputEventReceiver(InputChannel inputchannel, Looper looper)
    {
        if (inputchannel == null)
            throw new IllegalArgumentException("inputChannel must not be null");
        if (looper == null)
        {
            throw new IllegalArgumentException("looper must not be null");
        } else
        {
            mInputChannel = inputchannel;
            mMessageQueue = looper.getQueue();
            mReceiverPtr = nativeInit(this, inputchannel, mMessageQueue);
            mCloseGuard.open("dispose");
            return;
        }
    }

    private void dispatchBatchedInputEventPending()
    {
        onBatchedInputEventPending();
    }

    private void dispatchInputEvent(int i, InputEvent inputevent)
    {
        mSeqMap.put(inputevent.getSequenceNumber(), i);
        onInputEvent(inputevent);
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
        mInputChannel = null;
        mMessageQueue = null;
    }

    private static native void nativeConsumeBatchedInputEvents(int i, long l);

    private static native void nativeDispose(int i);

    private static native void nativeFinishInputEvent(int i, int j, boolean flag);

    private static native int nativeInit(InputEventReceiver inputeventreceiver, InputChannel inputchannel, MessageQueue messagequeue);

    public final void consumeBatchedInputEvents(long l)
    {
        if (mReceiverPtr == 0)
        {
            Log.w("InputEventReceiver", "Attempted to consume batched input events but the input event receiver has already been disposed.");
            return;
        } else
        {
            nativeConsumeBatchedInputEvents(mReceiverPtr, l);
            return;
        }
    }

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

    public final void finishInputEvent(InputEvent inputevent, boolean flag)
    {
        if (inputevent == null)
            throw new IllegalArgumentException("event must not be null");
        if (mReceiverPtr == 0)
        {
            Log.w("InputEventReceiver", "Attempted to finish an input event but the input event receiver has already been disposed.");
        } else
        {
            int i = mSeqMap.indexOfKey(inputevent.getSequenceNumber());
            if (i < 0)
            {
                Log.w("InputEventReceiver", "Attempted to finish an input event that is not in progress.");
            } else
            {
                int j = mSeqMap.valueAt(i);
                mSeqMap.removeAt(i);
                nativeFinishInputEvent(mReceiverPtr, j, flag);
            }
        }
        inputevent.recycleIfNeededAfterDispatch();
    }

    public void onBatchedInputEventPending()
    {
        consumeBatchedInputEvents(-1L);
    }

    public void onInputEvent(InputEvent inputevent)
    {
        finishInputEvent(inputevent, false);
    }
}
