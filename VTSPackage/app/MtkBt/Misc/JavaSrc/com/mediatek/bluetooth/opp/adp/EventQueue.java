// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import com.mediatek.bluetooth.util.BtLog;
import java.util.Iterator;
import java.util.LinkedList;

public class EventQueue
{

    private boolean mIsCanceled;
    private LinkedList mQueue;
    private int mReturnCount;
    private int mReturnThreshold;
    private int mTimeout;

    public EventQueue(int i, int j)
    {
        mIsCanceled = false;
        mQueue = new LinkedList();
        mTimeout = i;
        mReturnThreshold = j;
    }

    public void cancelWaitNewEvent()
    {
        synchronized (mQueue)
        {
            mIsCanceled = true;
            BtLog.d((new StringBuilder()).append("EventQueue.cancelWaitNewEvent():").append(mQueue.size()).toString());
            mQueue.notify();
        }
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void clear()
    {
        synchronized (mQueue)
        {
            mQueue.clear();
        }
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean contains(Object obj)
    {
        return mQueue.contains(obj);
    }

    public String getPrintableString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        for (Iterator iterator = mQueue.iterator(); iterator.hasNext(); stringbuilder.append(iterator.next().toString()));
        return stringbuilder.toString();
    }

    public void notifyNewEvent(Object obj)
    {
        synchronized (mQueue)
        {
            mQueue.addLast(obj);
            BtLog.d((new StringBuilder()).append("EventQueue.notifyNewEvent() after insert queue size:").append(mQueue.size()).toString());
            mQueue.notify();
        }
        return;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int size()
    {
        return mQueue.size();
    }

    public Object waitNewEvent()
        throws InterruptedException
    {
        return waitNewEvent(mTimeout);
    }

    public Object waitNewEvent(int i)
        throws InterruptedException
    {
        mReturnCount = 0;
_L1:
label0:
        {
            Object obj;
            synchronized (mQueue)
            {
                BtLog.d((new StringBuilder()).append("EventQueue.waitNewEvent() before remove queue size:").append(mQueue.size()).toString());
                if (mQueue.isEmpty())
                    break label0;
                obj = mQueue.removeFirst();
            }
            return obj;
        }
        if (mReturnThreshold <= 0)
            break MISSING_BLOCK_LABEL_101;
        mReturnCount = 1 + mReturnCount;
        if (mReturnCount < mReturnThreshold)
            break MISSING_BLOCK_LABEL_101;
        linkedlist;
        JVM INSTR monitorexit ;
        return null;
        exception;
        linkedlist;
        JVM INSTR monitorexit ;
        throw exception;
        if (!mIsCanceled)
            break MISSING_BLOCK_LABEL_117;
        mIsCanceled = false;
        linkedlist;
        JVM INSTR monitorexit ;
        return null;
        mQueue.wait(i);
        if (!mIsCanceled)
            break MISSING_BLOCK_LABEL_259;
        mIsCanceled = false;
        linkedlist;
        JVM INSTR monitorexit ;
        return null;
        InterruptedException interruptedexception;
        interruptedexception;
        BtLog.i((new StringBuilder()).append("EventQueue.waitNewEvent() thread[").append(Thread.currentThread().getName()).append("] interrupted").toString());
        throw interruptedexception;
        IllegalMonitorStateException illegalmonitorstateexception;
        illegalmonitorstateexception;
        BtLog.e((new StringBuilder()).append("EventQueue.waitNewEvent() error: ").append(illegalmonitorstateexception.getMessage()).toString());
        throw new IllegalStateException("EventQueue.waitNewEvent() error.", illegalmonitorstateexception);
        IllegalArgumentException illegalargumentexception;
        illegalargumentexception;
        BtLog.e((new StringBuilder()).append("EventQueue.waitNewEvent() error: ").append(illegalargumentexception.getMessage()).toString());
        throw new IllegalStateException("EventQueue.waitNewEvent() error.", illegalargumentexception);
        linkedlist;
        JVM INSTR monitorexit ;
          goto _L1
    }
}
