// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.*;
import java.util.concurrent.locks.*;

// Referenced classes of package com.google.common.util.concurrent:
//            ThreadFactoryBuilder, ListeningExecutorService, ListeningScheduledExecutorService, AbstractListeningExecutorService

public final class MoreExecutors
{
    private static class ListeningDecorator extends AbstractListeningExecutorService
    {

        final ExecutorService _flddelegate;

        public boolean awaitTermination(long l, TimeUnit timeunit)
            throws InterruptedException
        {
            return _flddelegate.awaitTermination(l, timeunit);
        }

        public void execute(Runnable runnable)
        {
            _flddelegate.execute(runnable);
        }

        public boolean isShutdown()
        {
            return _flddelegate.isShutdown();
        }

        public boolean isTerminated()
        {
            return _flddelegate.isTerminated();
        }

        public void shutdown()
        {
            _flddelegate.shutdown();
        }

        public List shutdownNow()
        {
            return _flddelegate.shutdownNow();
        }

        ListeningDecorator(ExecutorService executorservice)
        {
            _flddelegate = (ExecutorService)Preconditions.checkNotNull(executorservice);
        }
    }

    private static class SameThreadExecutorService extends AbstractListeningExecutorService
    {

        private final Lock lock;
        private int runningTasks;
        private boolean shutdown;
        private final Condition termination;

        private void endTask()
        {
            lock.lock();
            runningTasks = -1 + runningTasks;
            if (isTerminated())
                termination.signalAll();
            lock.unlock();
            return;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        private void startTask()
        {
            lock.lock();
            if (isShutdown())
                throw new RejectedExecutionException("Executor already shutdown");
            break MISSING_BLOCK_LABEL_38;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
            runningTasks = 1 + runningTasks;
            lock.unlock();
            return;
        }

        public boolean awaitTermination(long l, TimeUnit timeunit)
            throws InterruptedException
        {
            long l1;
            l1 = timeunit.toNanos(l);
            lock.lock();
_L1:
            boolean flag = isTerminated();
            if (flag)
            {
                lock.unlock();
                return true;
            }
            if (l1 <= 0L)
            {
                lock.unlock();
                return false;
            }
            long l2 = termination.awaitNanos(l1);
            l1 = l2;
              goto _L1
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        public void execute(Runnable runnable)
        {
            startTask();
            runnable.run();
            endTask();
            return;
            Exception exception;
            exception;
            endTask();
            throw exception;
        }

        public boolean isShutdown()
        {
            lock.lock();
            boolean flag = shutdown;
            lock.unlock();
            return flag;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        public boolean isTerminated()
        {
            lock.lock();
            if (!shutdown) goto _L2; else goto _L1
_L1:
            int i = runningTasks;
            if (i != 0) goto _L2; else goto _L3
_L3:
            boolean flag = true;
_L5:
            lock.unlock();
            return flag;
_L2:
            flag = false;
            if (true) goto _L5; else goto _L4
_L4:
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        public void shutdown()
        {
            lock.lock();
            shutdown = true;
            lock.unlock();
            return;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        public List shutdownNow()
        {
            shutdown();
            return Collections.emptyList();
        }

        private SameThreadExecutorService()
        {
            lock = new ReentrantLock();
            termination = lock.newCondition();
            runningTasks = 0;
            shutdown = false;
        }

    }

    private static class ScheduledListeningDecorator extends ListeningDecorator
        implements ListeningScheduledExecutorService
    {

        final ScheduledExecutorService _flddelegate;

        public ScheduledFuture schedule(Runnable runnable, long l, TimeUnit timeunit)
        {
            return _flddelegate.schedule(runnable, l, timeunit);
        }

        public ScheduledFuture schedule(Callable callable, long l, TimeUnit timeunit)
        {
            return _flddelegate.schedule(callable, l, timeunit);
        }

        public ScheduledFuture scheduleAtFixedRate(Runnable runnable, long l, long l1, TimeUnit timeunit)
        {
            return _flddelegate.scheduleAtFixedRate(runnable, l, l1, timeunit);
        }

        public ScheduledFuture scheduleWithFixedDelay(Runnable runnable, long l, long l1, TimeUnit timeunit)
        {
            return _flddelegate.scheduleWithFixedDelay(runnable, l, l1, timeunit);
        }

        ScheduledListeningDecorator(ScheduledExecutorService scheduledexecutorservice)
        {
            super(scheduledexecutorservice);
            _flddelegate = (ScheduledExecutorService)Preconditions.checkNotNull(scheduledexecutorservice);
        }
    }


    private MoreExecutors()
    {
    }

    public static void addDelayedShutdownHook(ExecutorService executorservice, long l, TimeUnit timeunit)
    {
        Runtime.getRuntime().addShutdownHook(new Thread(new Runnable(executorservice, l, timeunit) {

            final ExecutorService val$service;
            final long val$terminationTimeout;
            final TimeUnit val$timeUnit;

            public void run()
            {
                try
                {
                    service.shutdown();
                    service.awaitTermination(terminationTimeout, timeUnit);
                    return;
                }
                catch (InterruptedException interruptedexception)
                {
                    return;
                }
            }

            
            {
                service = executorservice;
                terminationTimeout = l;
                timeUnit = timeunit;
                super();
            }
        }
));
    }

    public static ExecutorService getExitingExecutorService(ThreadPoolExecutor threadpoolexecutor)
    {
        return getExitingExecutorService(threadpoolexecutor, 120L, TimeUnit.SECONDS);
    }

    public static ExecutorService getExitingExecutorService(ThreadPoolExecutor threadpoolexecutor, long l, TimeUnit timeunit)
    {
        threadpoolexecutor.setThreadFactory((new ThreadFactoryBuilder()).setDaemon(true).setThreadFactory(threadpoolexecutor.getThreadFactory()).build());
        ExecutorService executorservice = Executors.unconfigurableExecutorService(threadpoolexecutor);
        addDelayedShutdownHook(executorservice, l, timeunit);
        return executorservice;
    }

    public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor scheduledthreadpoolexecutor)
    {
        return getExitingScheduledExecutorService(scheduledthreadpoolexecutor, 120L, TimeUnit.SECONDS);
    }

    public static ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor scheduledthreadpoolexecutor, long l, TimeUnit timeunit)
    {
        scheduledthreadpoolexecutor.setThreadFactory((new ThreadFactoryBuilder()).setDaemon(true).setThreadFactory(scheduledthreadpoolexecutor.getThreadFactory()).build());
        ScheduledExecutorService scheduledexecutorservice = Executors.unconfigurableScheduledExecutorService(scheduledthreadpoolexecutor);
        addDelayedShutdownHook(scheduledexecutorservice, l, timeunit);
        return scheduledexecutorservice;
    }

    public static ListeningExecutorService listeningDecorator(ExecutorService executorservice)
    {
        if (executorservice instanceof ListeningExecutorService)
            return (ListeningExecutorService)executorservice;
        if (executorservice instanceof ScheduledExecutorService)
            return new ScheduledListeningDecorator((ScheduledExecutorService)executorservice);
        else
            return new ListeningDecorator(executorservice);
    }

    public static ListeningScheduledExecutorService listeningDecorator(ScheduledExecutorService scheduledexecutorservice)
    {
        if (scheduledexecutorservice instanceof ListeningScheduledExecutorService)
            return (ListeningScheduledExecutorService)scheduledexecutorservice;
        else
            return new ScheduledListeningDecorator(scheduledexecutorservice);
    }

    public static ListeningExecutorService sameThreadExecutor()
    {
        return new SameThreadExecutorService();
    }
}
