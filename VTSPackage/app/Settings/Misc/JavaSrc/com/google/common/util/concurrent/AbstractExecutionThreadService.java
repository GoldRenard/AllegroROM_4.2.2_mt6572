// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Throwables;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.util.concurrent:
//            Service, ListenableFuture, AbstractService

public abstract class AbstractExecutionThreadService
    implements Service
{

    private static final Logger logger = Logger.getLogger(com/google/common/util/concurrent/AbstractExecutionThreadService.getName());
    private final Service _flddelegate = new AbstractService() {

        final AbstractExecutionThreadService this$0;

        protected final void doStart()
        {
            executor().execute(new Runnable() {

                final _cls1 this$1;

                public void run()
                {
                    boolean flag;
                    Throwable throwable1;
                    try
                    {
                        startUp();
                        notifyStarted();
                        flag = isRunning();
                    }
                    catch (Throwable throwable)
                    {
                        notifyFailed(throwable);
                        throw Throwables.propagate(throwable);
                    }
                    if (!flag)
                        break MISSING_BLOCK_LABEL_39;
                    AbstractExecutionThreadService.this.run();
                    shutDown();
                    notifyStopped();
                    return;
                    throwable1;
                    shutDown();
_L1:
                    throw throwable1;
                    Exception exception;
                    exception;
                    AbstractExecutionThreadService.logger.log(Level.WARNING, "Error while attempting to shut down the service after failure.", exception);
                      goto _L1
                }

            
            {
                this$1 = _cls1.this;
                super();
            }
            }
);
        }

        protected void doStop()
        {
            triggerShutdown();
        }

            
            {
                this$0 = AbstractExecutionThreadService.this;
                super();
            }
    }
;


    protected Executor executor()
    {
        return new Executor() {

            final AbstractExecutionThreadService this$0;

            public void execute(Runnable runnable)
            {
                (new Thread(runnable, getServiceName())).start();
            }

            
            {
                this$0 = AbstractExecutionThreadService.this;
                super();
            }
        }
;
    }

    protected String getServiceName()
    {
        return getClass().getSimpleName();
    }

    public final boolean isRunning()
    {
        return _flddelegate.isRunning();
    }

    protected abstract void run()
        throws Exception;

    protected void shutDown()
        throws Exception
    {
    }

    public final ListenableFuture start()
    {
        return _flddelegate.start();
    }

    public final Service.State startAndWait()
    {
        return _flddelegate.startAndWait();
    }

    protected void startUp()
        throws Exception
    {
    }

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

    protected void triggerShutdown()
    {
    }


}
