// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.util.concurrent.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.util.concurrent:
//            Service, AbstractService, ListenableFuture, ForwardingFuture

public abstract class AbstractScheduledService
    implements Service
{
    public static abstract class CustomScheduler extends Scheduler
    {

        protected abstract Schedule getNextSchedule()
            throws Exception;

        final Future schedule(AbstractService abstractservice, ScheduledExecutorService scheduledexecutorservice, Runnable runnable)
        {
            ReschedulableCallable reschedulablecallable = new ReschedulableCallable(abstractservice, scheduledexecutorservice, runnable);
            reschedulablecallable.reschedule();
            return reschedulablecallable;
        }

    }

    private class CustomScheduler.ReschedulableCallable extends ForwardingFuture
        implements Callable
    {

        private Future currentFuture;
        private final ScheduledExecutorService executor;
        private final ReentrantLock lock = new ReentrantLock();
        private final AbstractService service;
        final CustomScheduler this$0;
        private final Runnable wrappedRunnable;

        public volatile Object call()
            throws Exception
        {
            return call();
        }

        public Void call()
            throws Exception
        {
            wrappedRunnable.run();
            reschedule();
            return null;
        }

        public boolean cancel(boolean flag)
        {
            lock.lock();
            boolean flag1 = currentFuture.cancel(flag);
            lock.unlock();
            return flag1;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Future _mthdelegate()
        {
            throw new UnsupportedOperationException("Only cancel is supported by this future");
        }

        public void reschedule()
        {
            lock.lock();
            if (currentFuture == null || !currentFuture.isCancelled())
            {
                CustomScheduler.Schedule schedule = getNextSchedule();
                currentFuture = executor.schedule(this, schedule.delay, schedule.unit);
            }
            lock.unlock();
            return;
            Throwable throwable;
            throwable;
            service.notifyFailed(throwable);
            lock.unlock();
            return;
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
        }

        CustomScheduler.ReschedulableCallable(AbstractService abstractservice, ScheduledExecutorService scheduledexecutorservice, Runnable runnable)
        {
            this$0 = CustomScheduler.this;
            super();
            wrappedRunnable = runnable;
            executor = scheduledexecutorservice;
            service = abstractservice;
        }
    }

    protected static final class CustomScheduler.Schedule
    {

        private final long delay;
        private final TimeUnit unit;



        public CustomScheduler.Schedule(long l, TimeUnit timeunit)
        {
            delay = l;
            unit = (TimeUnit)Preconditions.checkNotNull(timeunit);
        }
    }

    public static abstract class Scheduler
    {

        public static Scheduler newFixedDelaySchedule(long l, long l1, TimeUnit timeunit)
        {
            return new Scheduler(l, l1, timeunit) {

                final long val$delay;
                final long val$initialDelay;
                final TimeUnit val$unit;

                public Future schedule(AbstractService abstractservice, ScheduledExecutorService scheduledexecutorservice, Runnable runnable)
                {
                    return scheduledexecutorservice.scheduleWithFixedDelay(runnable, initialDelay, delay, unit);
                }

            
            {
                initialDelay = l;
                delay = l1;
                unit = timeunit;
                super();
            }
            }
;
        }

        public static Scheduler newFixedRateSchedule(long l, long l1, TimeUnit timeunit)
        {
            return new Scheduler(l, l1, timeunit) {

                final long val$initialDelay;
                final long val$period;
                final TimeUnit val$unit;

                public Future schedule(AbstractService abstractservice, ScheduledExecutorService scheduledexecutorservice, Runnable runnable)
                {
                    return scheduledexecutorservice.scheduleAtFixedRate(runnable, initialDelay, period, unit);
                }

            
            {
                initialDelay = l;
                period = l1;
                unit = timeunit;
                super();
            }
            }
;
        }

        abstract Future schedule(AbstractService abstractservice, ScheduledExecutorService scheduledexecutorservice, Runnable runnable);

        private Scheduler()
        {
        }

    }


    private static final Logger logger = Logger.getLogger(com/google/common/util/concurrent/AbstractScheduledService.getName());
    private final AbstractService _flddelegate = new AbstractService() {

        private volatile ScheduledExecutorService executorService;
        private final ReentrantLock lock = new ReentrantLock();
        private volatile Future runningTask;
        private final Runnable task = new _cls1();
        final AbstractScheduledService this$0;

        protected final void doStart()
        {
            executorService = executor();
            executorService.execute(new Runnable() {

                final _cls1 this$1;

                public void run()
                {
                    lock.lock();
                    startUp();
                    runningTask = scheduler().schedule(_flddelegate, executorService, task);
                    notifyStarted();
                    lock.unlock();
                    return;
                    Throwable throwable;
                    throwable;
                    notifyFailed(throwable);
                    throw Throwables.propagate(throwable);
                    Exception exception;
                    exception;
                    lock.unlock();
                    throw exception;
                }

            
            {
                this$1 = _cls1.this;
                super();
            }
            }
);
        }

        protected final void doStop()
        {
            runningTask.cancel(false);
            executorService.execute(new Runnable() {

                final _cls1 this$1;

                public void run()
                {
                    Service.State state1;
                    Service.State state2;
                    try
                    {
                        lock.lock();
                    }
                    catch (Throwable throwable)
                    {
                        notifyFailed(throwable);
                        throw Throwables.propagate(throwable);
                    }
                    state1 = state();
                    state2 = Service.State.STOPPING;
                    if (state1 == state2)
                        break MISSING_BLOCK_LABEL_40;
                    lock.unlock();
                    return;
                    shutDown();
                    lock.unlock();
                    notifyStopped();
                    return;
                    Exception exception;
                    exception;
                    lock.unlock();
                    throw exception;
                }

            
            {
                this$1 = _cls1.this;
                super();
            }
            }
);
        }



/*
            static Future access$302(_cls1 _pcls1, Future future)
            {
                _pcls1.runningTask = future;
                return future;
            }

*/



            
            {
                this$0 = AbstractScheduledService.this;
                super();
            }
    }
;


    protected ScheduledExecutorService executor()
    {
        return Executors.newSingleThreadScheduledExecutor();
    }

    public final boolean isRunning()
    {
        return _flddelegate.isRunning();
    }

    protected abstract void runOneIteration()
        throws Exception;

    protected abstract Scheduler scheduler();

    protected abstract void shutDown()
        throws Exception;

    public final ListenableFuture start()
    {
        return _flddelegate.start();
    }

    public final Service.State startAndWait()
    {
        return _flddelegate.startAndWait();
    }

    protected abstract void startUp()
        throws Exception;

    public final Service.State state()
    {
        return _flddelegate.state();
    }

    public final ListenableFuture stop()
    {
        return _flddelegate.stop();
    }

    public final Service.State stopAndWait()
    {
        return _flddelegate.stopAndWait();
    }

    public String toString()
    {
        return (new StringBuilder()).append(getClass().getSimpleName()).append(" [").append(state()).append("]").toString();
    }




    // Unreferenced inner class com/google/common/util/concurrent/AbstractScheduledService$1$1

/* anonymous class */
    class _cls1
        implements Runnable
    {

        final _cls1 this$1;

        public void run()
        {
            lock.lock();
            runOneIteration();
            lock.unlock();
            return;
            Throwable throwable;
            throwable;
            shutDown();
_L1:
            notifyFailed(throwable);
            throw Throwables.propagate(throwable);
            Exception exception;
            exception;
            lock.unlock();
            throw exception;
            Exception exception1;
            exception1;
            AbstractScheduledService.logger.log(Level.WARNING, "Error while attempting to shut down the service after failure.", exception1);
              goto _L1
        }

            
            {
                this$1 = _cls1.this;
                super();
            }
    }

}
