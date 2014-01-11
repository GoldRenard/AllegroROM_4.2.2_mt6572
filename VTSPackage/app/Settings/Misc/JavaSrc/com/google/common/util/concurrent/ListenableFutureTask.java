// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture, ExecutionList

public final class ListenableFutureTask extends FutureTask
    implements ListenableFuture
{

    private final ExecutionList executionList;

    private ListenableFutureTask(Runnable runnable, Object obj)
    {
        super(runnable, obj);
        executionList = new ExecutionList();
    }

    private ListenableFutureTask(Callable callable)
    {
        super(callable);
        executionList = new ExecutionList();
    }

    public static ListenableFutureTask create(Runnable runnable, Object obj)
    {
        return new ListenableFutureTask(runnable, obj);
    }

    public static ListenableFutureTask create(Callable callable)
    {
        return new ListenableFutureTask(callable);
    }

    public void addListener(Runnable runnable, Executor executor)
    {
        executionList.add(runnable, executor);
    }

    protected void done()
    {
        executionList.execute();
    }
}
