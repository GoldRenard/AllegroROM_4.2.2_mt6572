// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import java.util.concurrent.*;

public class QueuedWork
{

    private static final ConcurrentLinkedQueue sPendingWorkFinishers = new ConcurrentLinkedQueue();
    private static ExecutorService sSingleThreadExecutor = null;


    public static void add(Runnable runnable)
    {
        sPendingWorkFinishers.add(runnable);
    }

    public static boolean hasPendingWork()
    {
        return !sPendingWorkFinishers.isEmpty();
    }

    public static void remove(Runnable runnable)
    {
        sPendingWorkFinishers.remove(runnable);
    }

    public static ExecutorService singleThreadExecutor()
    {
        android/app/QueuedWork;
        JVM INSTR monitorenter ;
        ExecutorService executorservice;
        if (sSingleThreadExecutor == null)
            sSingleThreadExecutor = Executors.newSingleThreadExecutor();
        executorservice = sSingleThreadExecutor;
        android/app/QueuedWork;
        JVM INSTR monitorexit ;
        return executorservice;
        Exception exception;
        exception;
        android/app/QueuedWork;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static void waitToFinish()
    {
        do
        {
            Runnable runnable = (Runnable)sPendingWorkFinishers.poll();
            if (runnable != null)
                runnable.run();
            else
                return;
        } while (true);
    }

}
