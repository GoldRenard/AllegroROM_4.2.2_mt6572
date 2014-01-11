// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.*;

public final class Uninterruptibles
{

    private Uninterruptibles()
    {
    }

    public static void awaitUninterruptibly(CountDownLatch countdownlatch)
    {
        boolean flag = false;
_L2:
        countdownlatch.await();
        if (flag)
            Thread.currentThread().interrupt();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static boolean awaitUninterruptibly(CountDownLatch countdownlatch, long l, TimeUnit timeunit)
    {
        boolean flag = false;
        long l1;
        long l2;
        l1 = timeunit.toNanos(l);
        l2 = System.nanoTime();
        long l3 = l2 + l1;
_L1:
        boolean flag1 = countdownlatch.await(l1, TimeUnit.NANOSECONDS);
        if (flag)
            Thread.currentThread().interrupt();
        return flag1;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        long l4 = System.nanoTime();
        l1 = l3 - l4;
          goto _L1
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static Object getUninterruptibly(Future future)
        throws ExecutionException
    {
        boolean flag = false;
_L2:
        Object obj = future.get();
        if (flag)
            Thread.currentThread().interrupt();
        return obj;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static Object getUninterruptibly(Future future, long l, TimeUnit timeunit)
        throws ExecutionException, TimeoutException
    {
        boolean flag = false;
        long l1;
        long l2;
        l1 = timeunit.toNanos(l);
        l2 = System.nanoTime();
        long l3 = l2 + l1;
_L1:
        Object obj = future.get(l1, TimeUnit.NANOSECONDS);
        if (flag)
            Thread.currentThread().interrupt();
        return obj;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        long l4 = System.nanoTime();
        l1 = l3 - l4;
          goto _L1
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static void joinUninterruptibly(Thread thread)
    {
        boolean flag = false;
_L2:
        thread.join();
        if (flag)
            Thread.currentThread().interrupt();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static void joinUninterruptibly(Thread thread, long l, TimeUnit timeunit)
    {
        boolean flag;
        Preconditions.checkNotNull(thread);
        flag = false;
        long l1;
        long l2;
        l1 = timeunit.toNanos(l);
        l2 = System.nanoTime();
        long l3 = l2 + l1;
_L1:
        TimeUnit.NANOSECONDS.timedJoin(thread, l1);
        if (flag)
            Thread.currentThread().interrupt();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        long l4 = System.nanoTime();
        l1 = l3 - l4;
          goto _L1
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static void putUninterruptibly(BlockingQueue blockingqueue, Object obj)
    {
        boolean flag = false;
_L2:
        blockingqueue.put(obj);
        if (flag)
            Thread.currentThread().interrupt();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static void sleepUninterruptibly(long l, TimeUnit timeunit)
    {
        boolean flag = false;
        long l1;
        long l2;
        l1 = timeunit.toNanos(l);
        l2 = System.nanoTime();
        long l3 = l2 + l1;
_L1:
        TimeUnit.NANOSECONDS.sleep(l1);
        if (flag)
            Thread.currentThread().interrupt();
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        long l4 = System.nanoTime();
        l1 = l3 - l4;
          goto _L1
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static Object takeUninterruptibly(BlockingQueue blockingqueue)
    {
        boolean flag = false;
_L2:
        Object obj = blockingqueue.take();
        if (flag)
            Thread.currentThread().interrupt();
        return obj;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }
}
