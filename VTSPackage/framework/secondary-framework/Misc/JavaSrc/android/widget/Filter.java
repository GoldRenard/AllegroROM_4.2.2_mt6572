// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.os.*;
import android.util.Log;

public abstract class Filter
{
    public static interface Delayer
    {

        public abstract long getPostingDelay(CharSequence charsequence);
    }

    public static interface FilterListener
    {

        public abstract void onFilterComplete(int i);
    }

    protected static class FilterResults
    {

        public int count;
        public Object values;

    }

    private static class RequestArguments
    {

        CharSequence constraint;
        FilterListener listener;
        FilterResults results;

        private RequestArguments()
        {
        }

    }

    private class RequestHandler extends Handler
    {

        final Filter this$0;

        public void handleMessage(Message message)
        {
            int i = message.what;
            i;
            JVM INSTR lookupswitch 2: default 32
        //                       -791613427: 33
        //                       -559038737: 225;
               goto _L1 _L2 _L3
_L1:
            return;
_L2:
            RequestArguments requestarguments = (RequestArguments)message.obj;
            requestarguments.results = performFiltering(requestarguments.constraint);
            Message message2;
            message2 = mResultHandler.obtainMessage(i);
            message2.obj = requestarguments;
_L5:
            message2.sendToTarget();
            synchronized (mLock)
            {
                if (mThreadHandler != null)
                {
                    Message message3 = mThreadHandler.obtainMessage(0xdeadbeef);
                    mThreadHandler.sendMessageDelayed(message3, 3000L);
                }
            }
            return;
            exception3;
            obj1;
            JVM INSTR monitorexit ;
            throw exception3;
            Exception exception2;
            exception2;
            requestarguments.results = new FilterResults();
            Log.w("Filter", "An exception occured during performFiltering()!", exception2);
            message2 = mResultHandler.obtainMessage(i);
            message2.obj = requestarguments;
            if (true) goto _L5; else goto _L4
_L4:
            Exception exception1;
            exception1;
            Message message1 = mResultHandler.obtainMessage(i);
            message1.obj = requestarguments;
            message1.sendToTarget();
            throw exception1;
_L3:
            synchronized (mLock)
            {
                if (mThreadHandler != null)
                {
                    mThreadHandler.getLooper().quit();
                    mThreadHandler = null;
                }
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public RequestHandler(Looper looper)
        {
            this$0 = Filter.this;
            super(looper);
        }
    }

    private class ResultsHandler extends Handler
    {

        final Filter this$0;

        public void handleMessage(Message message)
        {
            RequestArguments requestarguments = (RequestArguments)message.obj;
            publishResults(requestarguments.constraint, requestarguments.results);
            if (requestarguments.listener != null)
            {
                int i;
                if (requestarguments.results != null)
                    i = requestarguments.results.count;
                else
                    i = -1;
                requestarguments.listener.onFilterComplete(i);
            }
        }

        private ResultsHandler()
        {
            this$0 = Filter.this;
            super();
        }

    }


    private static final int FILTER_TOKEN = 0xd0d0f00d;
    private static final int FINISH_TOKEN = 0xdeadbeef;
    private static final String LOG_TAG = "Filter";
    private static final String THREAD_NAME = "Filter";
    private Delayer mDelayer;
    private final Object mLock = new Object();
    private Handler mResultHandler;
    private Handler mThreadHandler;

    public Filter()
    {
        mResultHandler = new ResultsHandler();
    }

    public CharSequence convertResultToString(Object obj)
    {
        if (obj == null)
            return "";
        else
            return obj.toString();
    }

    public final void filter(CharSequence charsequence)
    {
        filter(charsequence, null);
    }

    public final void filter(CharSequence charsequence, FilterListener filterlistener)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        if (mThreadHandler == null)
        {
            HandlerThread handlerthread = new HandlerThread("Filter", 10);
            handlerthread.start();
            mThreadHandler = new RequestHandler(handlerthread.getLooper());
        }
        if (mDelayer != null) goto _L2; else goto _L1
_L1:
        long l = 0L;
_L4:
        Message message;
        RequestArguments requestarguments;
        message = mThreadHandler.obtainMessage(0xd0d0f00d);
        requestarguments = new RequestArguments();
        String s;
        s = null;
        if (charsequence == null)
            break MISSING_BLOCK_LABEL_93;
        s = charsequence.toString();
        requestarguments.constraint = s;
        requestarguments.listener = filterlistener;
        message.obj = requestarguments;
        mThreadHandler.removeMessages(0xd0d0f00d);
        mThreadHandler.removeMessages(0xdeadbeef);
        mThreadHandler.sendMessageDelayed(message, l);
        obj;
        JVM INSTR monitorexit ;
        return;
_L2:
        l = mDelayer.getPostingDelay(charsequence);
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected abstract FilterResults performFiltering(CharSequence charsequence);

    protected abstract void publishResults(CharSequence charsequence, FilterResults filterresults);

    public void setDelayer(Delayer delayer)
    {
        synchronized (mLock)
        {
            mDelayer = delayer;
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }





/*
    static Handler access$402(Filter filter1, Handler handler)
    {
        filter1.mThreadHandler = handler;
        return handler;
    }

*/
}
