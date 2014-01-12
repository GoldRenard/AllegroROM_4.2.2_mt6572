// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.Lists;
import java.util.Queue;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class ExecutionList
{
    private static class RunnableExecutorPair
    {

        final Executor executor;
        final Runnable runnable;

        void execute()
        {
            try
            {
                executor.execute(runnable);
                return;
            }
            catch (RuntimeException runtimeexception)
            {
                ExecutionList.log.log(Level.SEVERE, (new StringBuilder()).append("RuntimeException while executing runnable ").append(runnable).append(" with executor ").append(executor).toString(), runtimeexception);
            }
        }

        RunnableExecutorPair(Runnable runnable1, Executor executor1)
        {
            runnable = runnable1;
            executor = executor1;
        }
    }


    private static final Logger log = Logger.getLogger(com/google/common/util/concurrent/ExecutionList.getName());
    private boolean executed;
    private final Queue runnables = Lists.newLinkedList();

    public ExecutionList()
    {
        executed = false;
    }

    public void add(Runnable runnable, Executor executor)
    {
        boolean flag;
        Preconditions.checkNotNull(runnable, "Runnable was null.");
        Preconditions.checkNotNull(executor, "Executor was null.");
        flag = false;
        Queue queue = runnables;
        queue;
        JVM INSTR monitorenter ;
        if (executed)
            break MISSING_BLOCK_LABEL_73;
        runnables.add(new RunnableExecutorPair(runnable, executor));
_L2:
        if (flag)
            (new RunnableExecutorPair(runnable, executor)).execute();
        return;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        queue;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void execute()
    {
label0:
        {
            synchronized (runnables)
            {
                if (!executed)
                    break label0;
            }
            return;
        }
        executed = true;
        queue;
        JVM INSTR monitorexit ;
        for (; !runnables.isEmpty(); ((RunnableExecutorPair)runnables.poll()).execute());
        break MISSING_BLOCK_LABEL_59;
        exception;
        queue;
        JVM INSTR monitorexit ;
        throw exception;
    }


}
