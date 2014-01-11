// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.Collection;
import java.util.List;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture

public interface ListeningExecutorService
    extends ExecutorService
{

    public abstract List invokeAll(Collection collection)
        throws InterruptedException;

    public abstract List invokeAll(Collection collection, long l, TimeUnit timeunit)
        throws InterruptedException;

    public abstract ListenableFuture submit(Runnable runnable);

    public abstract ListenableFuture submit(Runnable runnable, Object obj);

    public abstract ListenableFuture submit(Callable callable);
}
