// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.*;
import java.util.concurrent.locks.ReentrantLock;

// Referenced classes of package com.google.common.util.concurrent:
//            Service, Futures, ListenableFuture, AbstractFuture

public abstract class AbstractService
    implements Service
{
    private class Transition extends AbstractFuture
    {

        final AbstractService this$0;

        public Service.State get(long l, TimeUnit timeunit)
            throws InterruptedException, TimeoutException, ExecutionException
        {
            Service.State state1;
            try
            {
                state1 = (Service.State)super.get(l, timeunit);
            }
            catch (TimeoutException timeoutexception)
            {
                throw new TimeoutException(toString());
            }
            return state1;
        }

        public volatile Object get(long l, TimeUnit timeunit)
            throws InterruptedException, TimeoutException, ExecutionException
        {
            return get(l, timeunit);
        }

        private Transition()
        {
            this$0 = AbstractService.this;
            super();
        }

    }


    private final ReentrantLock lock = new ReentrantLock();
    private final Transition shutdown = new Transition();
    private boolean shutdownWhenStartupFinishes;
    private final Transition startup = new Transition();
    private Service.State state;

    public AbstractService()
    {
        state = Service.State.NEW;
        shutdownWhenStartupFinishes = false;
    }

    protected abstract void doStart();

    protected abstract void doStop();

    public final boolean isRunning()
    {
        return state() == Service.State.RUNNING;
    }

    protected final void notifyFailed(Throwable throwable)
    {
        Preconditions.checkNotNull(throwable);
        lock.lock();
        if (state != Service.State.STARTING) goto _L2; else goto _L1
_L1:
        startup.setException(throwable);
        shutdown.setException(new Exception("Service failed to start.", throwable));
_L3:
        state = Service.State.FAILED;
        lock.unlock();
        return;
_L2:
        if (state != Service.State.STOPPING)
            break MISSING_BLOCK_LABEL_96;
        shutdown.setException(throwable);
          goto _L3
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
        if (state != Service.State.RUNNING)
            continue; /* Loop/switch isn't completed */
        shutdown.setException(new Exception("Service failed while running", throwable));
          goto _L3
        if (state != Service.State.NEW && state != Service.State.TERMINATED) goto _L3; else goto _L4
_L4:
        throw new IllegalStateException((new StringBuilder()).append("Failed while in state:").append(state).toString(), throwable);
    }

    protected final void notifyStarted()
    {
        lock.lock();
        if (state != Service.State.STARTING)
        {
            IllegalStateException illegalstateexception = new IllegalStateException((new StringBuilder()).append("Cannot notifyStarted() when the service is ").append(state).toString());
            notifyFailed(illegalstateexception);
            throw illegalstateexception;
        }
        break MISSING_BLOCK_LABEL_64;
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
        state = Service.State.RUNNING;
        if (!shutdownWhenStartupFinishes)
            break MISSING_BLOCK_LABEL_91;
        stop();
_L1:
        lock.unlock();
        return;
        startup.set(Service.State.RUNNING);
          goto _L1
    }

    protected final void notifyStopped()
    {
        lock.lock();
        if (state != Service.State.STOPPING && state != Service.State.RUNNING)
        {
            IllegalStateException illegalstateexception = new IllegalStateException((new StringBuilder()).append("Cannot notifyStopped() when the service is ").append(state).toString());
            notifyFailed(illegalstateexception);
            throw illegalstateexception;
        }
        break MISSING_BLOCK_LABEL_74;
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
        state = Service.State.TERMINATED;
        shutdown.set(Service.State.TERMINATED);
        lock.unlock();
        return;
    }

    public final ListenableFuture start()
    {
        lock.lock();
        if (state == Service.State.NEW)
        {
            state = Service.State.STARTING;
            doStart();
        }
        lock.unlock();
_L2:
        return startup;
        Throwable throwable;
        throwable;
        notifyFailed(throwable);
        lock.unlock();
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
    }

    public Service.State startAndWait()
    {
        return (Service.State)Futures.getUnchecked(start());
    }

    public final Service.State state()
    {
        lock.lock();
        Service.State state2;
        if (!shutdownWhenStartupFinishes || state != Service.State.STARTING)
            break MISSING_BLOCK_LABEL_37;
        state2 = Service.State.STOPPING;
        lock.unlock();
        return state2;
        Service.State state1 = state;
        lock.unlock();
        return state1;
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
    }

    public final ListenableFuture stop()
    {
        lock.lock();
        if (state != Service.State.NEW) goto _L2; else goto _L1
_L1:
        state = Service.State.TERMINATED;
        startup.set(Service.State.TERMINATED);
        shutdown.set(Service.State.TERMINATED);
_L5:
        lock.unlock();
_L6:
        return shutdown;
_L2:
        if (state != Service.State.STARTING) goto _L4; else goto _L3
_L3:
        shutdownWhenStartupFinishes = true;
        startup.set(Service.State.STOPPING);
          goto _L5
        Throwable throwable;
        throwable;
        notifyFailed(throwable);
        lock.unlock();
          goto _L6
_L4:
        if (state != Service.State.RUNNING) goto _L5; else goto _L7
_L7:
        state = Service.State.STOPPING;
        doStop();
          goto _L5
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
    }

    public Service.State stopAndWait()
    {
        return (Service.State)Futures.getUnchecked(stop());
    }

    public String toString()
    {
        return (new StringBuilder()).append(getClass().getSimpleName()).append(" [").append(state()).append("]").toString();
    }
}
