// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

public final class ThreadFactoryBuilder
{

    private ThreadFactory backingThreadFactory;
    private Boolean daemon;
    private String nameFormat;
    private Integer priority;
    private Thread.UncaughtExceptionHandler uncaughtExceptionHandler;

    public ThreadFactoryBuilder()
    {
        nameFormat = null;
        daemon = null;
        priority = null;
        uncaughtExceptionHandler = null;
        backingThreadFactory = null;
    }

    private static ThreadFactory build(ThreadFactoryBuilder threadfactorybuilder)
    {
        String s = threadfactorybuilder.nameFormat;
        Boolean boolean1 = threadfactorybuilder.daemon;
        Integer integer = threadfactorybuilder.priority;
        Thread.UncaughtExceptionHandler uncaughtexceptionhandler = threadfactorybuilder.uncaughtExceptionHandler;
        ThreadFactory threadfactory;
        if (threadfactorybuilder.backingThreadFactory != null)
            threadfactory = threadfactorybuilder.backingThreadFactory;
        else
            threadfactory = Executors.defaultThreadFactory();
        AtomicLong atomiclong;
        if (s != null)
            atomiclong = new AtomicLong(0L);
        else
            atomiclong = null;
        return new ThreadFactory(threadfactory, s, atomiclong, boolean1, integer, uncaughtexceptionhandler) {

            final ThreadFactory val$backingThreadFactory;
            final AtomicLong val$count;
            final Boolean val$daemon;
            final String val$nameFormat;
            final Integer val$priority;
            final Thread.UncaughtExceptionHandler val$uncaughtExceptionHandler;

            public Thread newThread(Runnable runnable)
            {
                Thread thread = backingThreadFactory.newThread(runnable);
                if (nameFormat != null)
                {
                    String s1 = nameFormat;
                    Object aobj[] = new Object[1];
                    aobj[0] = Long.valueOf(count.getAndIncrement());
                    thread.setName(String.format(s1, aobj));
                }
                if (daemon != null)
                    thread.setDaemon(daemon.booleanValue());
                if (priority != null)
                    thread.setPriority(priority.intValue());
                if (uncaughtExceptionHandler != null)
                    thread.setUncaughtExceptionHandler(uncaughtExceptionHandler);
                return thread;
            }

            
            {
                backingThreadFactory = threadfactory;
                nameFormat = s;
                count = atomiclong;
                daemon = boolean1;
                priority = integer;
                uncaughtExceptionHandler = uncaughtexceptionhandler;
                super();
            }
        }
;
    }

    public ThreadFactory build()
    {
        return build(this);
    }

    public ThreadFactoryBuilder setDaemon(boolean flag)
    {
        daemon = Boolean.valueOf(flag);
        return this;
    }

    public ThreadFactoryBuilder setNameFormat(String s)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(0);
        String.format(s, aobj);
        nameFormat = s;
        return this;
    }

    public ThreadFactoryBuilder setPriority(int i)
    {
        boolean flag;
        if (i >= 1)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(1);
        Preconditions.checkArgument(flag, "Thread priority (%s) must be >= %s", aobj);
        boolean flag1;
        if (i <= 10)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = Integer.valueOf(i);
        aobj1[1] = Integer.valueOf(10);
        Preconditions.checkArgument(flag1, "Thread priority (%s) must be <= %s", aobj1);
        priority = Integer.valueOf(i);
        return this;
    }

    public ThreadFactoryBuilder setThreadFactory(ThreadFactory threadfactory)
    {
        backingThreadFactory = (ThreadFactory)Preconditions.checkNotNull(threadfactory);
        return this;
    }

    public ThreadFactoryBuilder setUncaughtExceptionHandler(Thread.UncaughtExceptionHandler uncaughtexceptionhandler)
    {
        uncaughtExceptionHandler = (Thread.UncaughtExceptionHandler)Preconditions.checkNotNull(uncaughtexceptionhandler);
        return this;
    }
}
