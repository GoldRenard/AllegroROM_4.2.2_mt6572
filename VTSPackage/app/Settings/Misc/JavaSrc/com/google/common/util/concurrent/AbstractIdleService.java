// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Throwables;
import java.util.concurrent.Executor;

// Referenced classes of package com.google.common.util.concurrent:
//            Service, ListenableFuture, AbstractService

public abstract class AbstractIdleService
    implements Service
{

    private final Service _flddelegate = new AbstractService() {

        final AbstractIdleService this$0;

        protected final void doStart()
        {
            executor(Service.State.STARTING).execute(new Runnable() {

                final _cls1 this$1;

                public void run()
                {
                    try
                    {
                        startUp();
                        notifyStarted();
                        return;
                    }
                    catch (Throwable throwable)
                    {
                        notifyFailed(throwable);
                        throw Throwables.propagate(throwable);
                    }
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
            executor(Service.State.STOPPING).execute(new Runnable() {

                final _cls1 this$1;

                public void run()
                {
                    try
                    {
                        shutDown();
                        notifyStopped();
                        return;
                    }
                    catch (Throwable throwable)
                    {
                        notifyFailed(throwable);
                        throw Throwables.propagate(throwable);
                    }
                }

            
            {
                this$1 = _cls1.this;
                super();
            }
            }
);
        }

            
            {
                this$0 = AbstractIdleService.this;
                super();
            }
    }
;


    private String getServiceName()
    {
        return getClass().getSimpleName();
    }

    protected Executor executor(final Service.State state)
    {
        return new Executor() {

            final AbstractIdleService this$0;
            final Service.State val$state;

            public void execute(Runnable runnable)
            {
                (new Thread(runnable, (new StringBuilder()).append(getServiceName()).append(" ").append(state).toString())).start();
            }

            
            {
                this$0 = AbstractIdleService.this;
                state = state1;
                super();
            }
        }
;
    }

    public final boolean isRunning()
    {
        return _flddelegate.isRunning();
    }

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
        return (new StringBuilder()).append(getServiceName()).append(" [").append(state()).append("]").toString();
    }

}
