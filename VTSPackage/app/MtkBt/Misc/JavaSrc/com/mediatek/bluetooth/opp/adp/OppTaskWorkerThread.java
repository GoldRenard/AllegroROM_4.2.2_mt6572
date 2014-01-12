// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.opp.adp;

import android.os.Process;
import com.mediatek.bluetooth.opp.mmi.OppLog;

// Referenced classes of package com.mediatek.bluetooth.opp.adp:
//            OppTaskHandler

public class OppTaskWorkerThread extends Thread
{

    private OppTaskHandler mHandler;
    private boolean mHasMoreTask;

    public OppTaskWorkerThread(String s, OppTaskHandler opptaskhandler)
    {
        super((new StringBuilder()).append(s).append("WorkerThread").toString());
        mHasMoreTask = false;
        mHandler = opptaskhandler;
    }

    public void notifyNewTask()
    {
        this;
        JVM INSTR monitorenter ;
        OppLog.d((new StringBuilder()).append("notify new task for OppTaskWorkerThread[").append(getName()).append("]").toString());
        mHasMoreTask = true;
        notify();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void run()
    {
        OppLog.d((new StringBuilder()).append("OppTask worker thread start: thread name - ").append(getName()).toString());
        Process.setThreadPriority(7);
_L2:
        if (isInterrupted())
            break; /* Loop/switch isn't completed */
        OppLog.d((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("]: 1. beforeWait()").toString());
        if (mHandler.beforeWait())
        {
            OppLog.d((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("]: 2. waitNewTask()").toString());
            waitNewTask();
            OppLog.d((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("]: 3. afterWait()").toString());
            mHandler.afterWait();
            OppLog.d((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("]: 4. next loop").toString());
        }
        if (true) goto _L2; else goto _L1
        InterruptedException interruptedexception;
        interruptedexception;
        OppLog.i((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("] interrupted: ").append(interruptedexception.getMessage()).toString());
_L1:
        OppLog.d((new StringBuilder()).append("OppTaskWorkerThread[").append(getName()).append("] stopped.").toString());
        return;
    }

    public void waitNewTask()
        throws InterruptedException
    {
        this;
        JVM INSTR monitorenter ;
        if (!mHasMoreTask)
            wait();
        mHasMoreTask = false;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
