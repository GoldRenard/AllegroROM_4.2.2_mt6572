// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            ForwardingExecutorService, ListeningExecutorService, ListenableFuture

public abstract class ForwardingListeningExecutorService extends ForwardingExecutorService
    implements ListeningExecutorService
{


    protected abstract ListeningExecutorService _mthdelegate();

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile ExecutorService _mthdelegate()
    {
        return _mthdelegate();
    }

    public ListenableFuture submit(Runnable runnable)
    {
        return _mthdelegate().submit(runnable);
    }

    public ListenableFuture submit(Runnable runnable, Object obj)
    {
        return _mthdelegate().submit(runnable, obj);
    }

    public ListenableFuture submit(Callable callable)
    {
        return _mthdelegate().submit(callable);
    }

    public volatile Future submit(Runnable runnable)
    {
        return submit(runnable);
    }

    public volatile Future submit(Runnable runnable, Object obj)
    {
        return submit(runnable, obj);
    }

    public volatile Future submit(Callable callable)
    {
        return submit(callable);
    }
}
