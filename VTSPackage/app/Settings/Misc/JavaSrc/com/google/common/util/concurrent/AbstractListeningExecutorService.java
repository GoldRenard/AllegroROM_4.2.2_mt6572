// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.*;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            ListeningExecutorService, ListenableFutureTask, ListenableFuture

abstract class AbstractListeningExecutorService
    implements ListeningExecutorService
{


    private Object doInvokeAny(Collection collection, boolean flag, long l)
        throws InterruptedException, ExecutionException, TimeoutException
    {
        ArrayList arraylist;
        ExecutorCompletionService executorcompletionservice;
        long l1;
        int k;
        ExecutionException executionexception;
        Future future;
        Object obj;
        int i = collection.size();
        boolean flag1;
        Iterator iterator1;
        int j;
        Iterator iterator2;
        if (i > 0)
            flag1 = true;
        else
            flag1 = false;
        Preconditions.checkArgument(flag1);
        arraylist = new ArrayList(i);
        executorcompletionservice = new ExecutorCompletionService(this);
        if (!flag) goto _L2; else goto _L1
_L1:
        l1 = System.nanoTime();
_L9:
        iterator1 = collection.iterator();
        arraylist.add(executorcompletionservice.submit((Callable)iterator1.next()));
        j = i - 1;
        k = 1;
        executionexception = null;
_L16:
        future = executorcompletionservice.poll();
        if (future != null) goto _L4; else goto _L3
_L3:
        if (j <= 0) goto _L6; else goto _L5
_L5:
        j--;
        arraylist.add(executorcompletionservice.submit((Callable)iterator1.next()));
        k++;
_L4:
        if (future == null) goto _L8; else goto _L7
_L7:
        k--;
        obj = future.get();
        break MISSING_BLOCK_LABEL_157;
_L2:
        l1 = 0L;
          goto _L9
_L6:
        if (k != 0) goto _L11; else goto _L10
_L10:
        if (executionexception != null) goto _L13; else goto _L12
_L12:
        ExecutionException executionexception3 = new ExecutionException(null);
_L14:
        throw executionexception3;
        Exception exception;
        exception;
        break MISSING_BLOCK_LABEL_233;
_L11:
        if (!flag)
            break MISSING_BLOCK_LABEL_324;
        TimeUnit timeunit = TimeUnit.NANOSECONDS;
        future = executorcompletionservice.poll(l, timeunit);
        if (future != null)
            break MISSING_BLOCK_LABEL_304;
        throw new TimeoutException();
        l2 = System.nanoTime();
        l -= l2 - l1;
        l1 = l2;
          goto _L4
        future = executorcompletionservice.take();
          goto _L4
        runtimeexception;
        ExecutionException executionexception1;
        executionexception1 = new ExecutionException(runtimeexception);
        break MISSING_BLOCK_LABEL_384;
_L15:
        RuntimeException runtimeexception;
        long l2;
        for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); ((Future)iterator.next()).cancel(true));
        throw exception;
        for (iterator2 = arraylist.iterator(); iterator2.hasNext(); ((Future)iterator2.next()).cancel(true));
        return obj;
_L13:
        executionexception3 = executionexception;
          goto _L14
_L8:
        executionexception1 = executionexception;
        break MISSING_BLOCK_LABEL_384;
        exception;
        executionexception;
          goto _L15
        ExecutionException executionexception2;
        executionexception2;
        executionexception1 = executionexception2;
        executionexception = executionexception1;
          goto _L16
    }

    public List invokeAll(Collection collection)
        throws InterruptedException
    {
        ArrayList arraylist;
        if (collection == null)
            throw new NullPointerException();
        arraylist = new ArrayList(collection.size());
        ListenableFutureTask listenablefuturetask;
        for (Iterator iterator1 = collection.iterator(); iterator1.hasNext(); execute(listenablefuturetask))
        {
            listenablefuturetask = ListenableFutureTask.create((Callable)iterator1.next());
            arraylist.add(listenablefuturetask);
        }

        break MISSING_BLOCK_LABEL_120;
        Exception exception;
        exception;
        if (true)
        {
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); ((Future)iterator.next()).cancel(true));
        }
        break MISSING_BLOCK_LABEL_222;
        Iterator iterator2 = arraylist.iterator();
_L2:
        Future future;
        boolean flag;
        do
        {
            if (!iterator2.hasNext())
                break MISSING_BLOCK_LABEL_180;
            future = (Future)iterator2.next();
            flag = future.isDone();
        } while (flag);
        try
        {
            future.get();
        }
        catch (CancellationException cancellationexception) { }
        catch (ExecutionException executionexception) { }
        if (true) goto _L2; else goto _L1
_L1:
        if (false)
        {
            for (Iterator iterator3 = arraylist.iterator(); iterator3.hasNext(); ((Future)iterator3.next()).cancel(true));
        }
        break MISSING_BLOCK_LABEL_229;
        throw exception;
        return arraylist;
    }

    public List invokeAll(Collection collection, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        long l1;
        ArrayList arraylist;
        if (collection == null || timeunit == null)
            throw new NullPointerException();
        l1 = timeunit.toNanos(l);
        arraylist = new ArrayList(collection.size());
        for (Iterator iterator1 = collection.iterator(); iterator1.hasNext(); arraylist.add(ListenableFutureTask.create((Callable)iterator1.next())));
        break MISSING_BLOCK_LABEL_127;
        Exception exception;
        exception;
        break MISSING_BLOCK_LABEL_84;
        l2 = System.nanoTime();
        iterator2 = arraylist.iterator();
_L4:
        if (!iterator2.hasNext()) goto _L2; else goto _L1
_L1:
        execute((Runnable)(Runnable)iterator2.next());
        l4 = System.nanoTime();
        l1 -= l4 - l2;
        l2 = l4;
        if (l1 > 0L) goto _L4; else goto _L3
_L3:
        if (true)
        {
            for (Iterator iterator7 = arraylist.iterator(); iterator7.hasNext(); ((Future)iterator7.next()).cancel(true));
        }
          goto _L5
_L2:
        iterator3 = arraylist.iterator();
_L9:
        if (!iterator3.hasNext()) goto _L7; else goto _L6
_L6:
        future = (Future)iterator3.next();
        flag = future.isDone();
        if (flag) goto _L9; else goto _L8
_L8:
        if (l1 > 0L) goto _L11; else goto _L10
_L10:
        if (true)
        {
            for (Iterator iterator6 = arraylist.iterator(); iterator6.hasNext(); ((Future)iterator6.next()).cancel(true));
        }
          goto _L5
_L11:
        future.get(l1, TimeUnit.NANOSECONDS);
_L12:
        l3 = System.nanoTime();
        l1 -= l3 - l2;
        l2 = l3;
          goto _L9
        timeoutexception;
        if (true)
        {
            for (Iterator iterator5 = arraylist.iterator(); iterator5.hasNext(); ((Future)iterator5.next()).cancel(true));
        }
          goto _L5
_L7:
        if (false)
        {
            for (Iterator iterator4 = arraylist.iterator(); iterator4.hasNext(); ((Future)iterator4.next()).cancel(true));
        }
          goto _L5
        long l2;
        Iterator iterator2;
        Iterator iterator3;
        Future future;
        boolean flag;
        long l3;
        TimeoutException timeoutexception;
        long l4;
        if (true)
        {
            for (Iterator iterator = arraylist.iterator(); iterator.hasNext(); ((Future)iterator.next()).cancel(true));
        }
        throw exception;
_L5:
        return arraylist;
        ExecutionException executionexception;
        executionexception;
          goto _L12
        CancellationException cancellationexception;
        cancellationexception;
          goto _L12
    }

    public Object invokeAny(Collection collection)
        throws InterruptedException, ExecutionException
    {
        Object obj;
        try
        {
            obj = doInvokeAny(collection, false, 0L);
        }
        catch (TimeoutException timeoutexception)
        {
            throw new AssertionError();
        }
        return obj;
    }

    public Object invokeAny(Collection collection, long l, TimeUnit timeunit)
        throws InterruptedException, ExecutionException, TimeoutException
    {
        return doInvokeAny(collection, true, timeunit.toNanos(l));
    }

    public ListenableFuture submit(Runnable runnable)
    {
        ListenableFutureTask listenablefuturetask = ListenableFutureTask.create(runnable, null);
        execute(listenablefuturetask);
        return listenablefuturetask;
    }

    public ListenableFuture submit(Runnable runnable, Object obj)
    {
        ListenableFutureTask listenablefuturetask = ListenableFutureTask.create(runnable, obj);
        execute(listenablefuturetask);
        return listenablefuturetask;
    }

    public ListenableFuture submit(Callable callable)
    {
        ListenableFutureTask listenablefuturetask = ListenableFutureTask.create(callable);
        execute(listenablefuturetask);
        return listenablefuturetask;
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
