// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.*;
import java.util.concurrent.locks.AbstractQueuedSynchronizer;

// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture, ExecutionList

public abstract class AbstractFuture
    implements ListenableFuture
{
    static final class Sync extends AbstractQueuedSynchronizer
    {

        static final int CANCELLED = 4;
        static final int COMPLETED = 2;
        static final int COMPLETING = 1;
        static final int RUNNING;
        private static final long serialVersionUID;
        private Throwable exception;
        private Object value;

        private boolean complete(Object obj, Throwable throwable, int i)
        {
            boolean flag = compareAndSetState(0, 1);
            if (flag)
            {
                value = obj;
                exception = throwable;
                releaseShared(i);
            } else
            if (getState() == 1)
            {
                acquireShared(-1);
                return flag;
            }
            return flag;
        }

        private Object getValue()
            throws CancellationException, ExecutionException
        {
            int i = getState();
            switch (i)
            {
            case 4: // '\004'
                throw new CancellationException("Task was cancelled.");

            case 2: // '\002'
                if (exception != null)
                    throw new ExecutionException(exception);
                else
                    return value;

            case 3: // '\003'
            default:
                throw new IllegalStateException((new StringBuilder()).append("Error, synchronizer in invalid state: ").append(i).toString());
            }
        }

        boolean cancel()
        {
            return complete(null, null, 4);
        }

        Object get()
            throws CancellationException, ExecutionException, InterruptedException
        {
            acquireSharedInterruptibly(-1);
            return getValue();
        }

        Object get(long l)
            throws TimeoutException, CancellationException, ExecutionException, InterruptedException
        {
            if (!tryAcquireSharedNanos(-1, l))
                throw new TimeoutException("Timeout waiting for task.");
            else
                return getValue();
        }

        boolean isCancelled()
        {
            return getState() == 4;
        }

        boolean isDone()
        {
            return (6 & getState()) != 0;
        }

        boolean set(Object obj)
        {
            return complete(obj, null, 2);
        }

        boolean setException(Throwable throwable)
        {
            return complete(null, throwable, 2);
        }

        protected int tryAcquireShared(int i)
        {
            return !isDone() ? -1 : 1;
        }

        protected boolean tryReleaseShared(int i)
        {
            setState(i);
            return true;
        }

    }


    private final ExecutionList executionList = new ExecutionList();
    private final Sync sync = new Sync();


    public void addListener(Runnable runnable, Executor executor)
    {
        executionList.add(runnable, executor);
    }

    public boolean cancel(boolean flag)
    {
        if (!sync.cancel())
            return false;
        executionList.execute();
        if (flag)
            interruptTask();
        return true;
    }

    public Object get()
        throws InterruptedException, ExecutionException
    {
        return sync.get();
    }

    public Object get(long l, TimeUnit timeunit)
        throws InterruptedException, TimeoutException, ExecutionException
    {
        return sync.get(timeunit.toNanos(l));
    }

    protected void interruptTask()
    {
    }

    public boolean isCancelled()
    {
        return sync.isCancelled();
    }

    public boolean isDone()
    {
        return sync.isDone();
    }

    protected boolean set(Object obj)
    {
        boolean flag = sync.set(obj);
        if (flag)
            executionList.execute();
        return flag;
    }

    protected boolean setException(Throwable throwable)
    {
        boolean flag = sync.setException((Throwable)Preconditions.checkNotNull(throwable));
        if (flag)
            executionList.execute();
        if (throwable instanceof Error)
            throw (Error)throwable;
        else
            return flag;
    }
}
