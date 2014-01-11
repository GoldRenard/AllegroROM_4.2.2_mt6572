// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.database.Cursor;
import android.os.*;
import android.util.Log;

public final class Worker extends HandlerThread
{
    class MyHandler extends Handler
    {

        final Worker this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 100: // 'd'
                getLooper().quit();
                break;
            }
            Log.d("Worker", "handleMessage");
        }

        public MyHandler(Looper looper)
        {
            this$0 = Worker.this;
            super(looper);
        }
    }

    public static class WrapperCloseCursor
        implements Runnable
    {

        Cursor mCursor;

        public void run()
        {
            Log.d("Worker", (new StringBuilder()).append("current thread = ").append(Thread.currentThread()).toString());
            if (mCursor != null)
            {
                Log.d("Worker", (new StringBuilder()).append("try to close cursor = ").append(mCursor).toString());
                mCursor.close();
                Log.d("Worker", (new StringBuilder()).append("finished to close cursor = ").append(mCursor).toString());
            }
        }

        public WrapperCloseCursor(Cursor cursor)
        {
            mCursor = cursor;
        }
    }


    private static final Worker INSTANCE = new Worker();
    private static final int MSG_QUIT = 100;
    private static final String TAG = "Worker";
    private Handler mHandler;
    private Looper mLooper;

    private Worker()
    {
        super("Worker_Thread");
    }

    public static Worker getWorkerInstance()
    {
        return INSTANCE;
    }

    public void postJob(Runnable runnable)
    {
        if (mHandler != null)
        {
            mHandler.post(runnable);
            return;
        } else
        {
            Log.d("Worker", "mHandler == null!");
            return;
        }
    }

    public void prepair()
    {
        if (mLooper == null)
        {
            INSTANCE.start();
            mLooper = getLooper();
            mHandler = new MyHandler(mLooper);
            return;
        } else
        {
            Log.d("Worker", "donothing!");
            return;
        }
    }

    public void release()
    {
        if (mHandler != null)
            mHandler.sendEmptyMessage(100);
    }

}
