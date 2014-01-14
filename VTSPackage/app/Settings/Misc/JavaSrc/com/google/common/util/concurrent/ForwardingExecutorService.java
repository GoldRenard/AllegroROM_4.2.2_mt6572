// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.collect.ForwardingObject;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.*;

public abstract class ForwardingExecutorService extends ForwardingObject
    implements ExecutorService
{


    public boolean awaitTermination(long l, TimeUnit timeunit)
        throws InterruptedException
    {
        return _mthdelegate().awaitTermination(l, timeunit);
    }

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract ExecutorService _mthdelegate();

    public void execute(Runnable runnable)
    {
        _mthdelegate().execute(runnable);
    }

    public List invokeAll(Collection collection)
        throws InterruptedException
    {
        return _mthdelegate().invokeAll(collection);
    }

    public List invokeAll(Collection collection, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        return _mthdelegate().invokeAll(collection, l, timeunit);
    }

    public Object invokeAny(Collection collection)
        throws InterruptedException, ExecutionException
    {
        return _mthdelegate().invokeAny(collection);
    }

    public Object invokeAny(Collection collection, long l, TimeUnit timeunit)
        throws InterruptedException, ExecutionException, TimeoutException
    {
        return _mthdelegate().invokeAny(collection, l, timeunit);
    }

    public boolean isShutdown()
    {
        return _mthdelegate().isShutdown();
    }

    public boolean isTerminated()
    {
        return _mthdelegate().isTerminated();
    }

    public void shutdown()
    {
        _mthdelegate().shutdown();
    }

    public List shutdownNow()
    {
        return _mthdelegate().shutdownNow();
    }

    public Future submit(Runnable runnable)
    {
        return _mthdelegate().submit(runnable);
    }

    public Future submit(Runnable runnable, Object obj)
    {
        return _mthdelegate().submit(runnable, obj);
    }

    public Future submit(Callable callable)
    {
        return _mthdelegate().submit(callable);
    }
}
