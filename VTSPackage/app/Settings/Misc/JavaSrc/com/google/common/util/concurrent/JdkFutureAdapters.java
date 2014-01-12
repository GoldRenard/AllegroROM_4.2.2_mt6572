// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;

// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture, ForwardingFuture, ThreadFactoryBuilder, ExecutionList

public final class JdkFutureAdapters
{
    private static class ListenableFutureAdapter extends ForwardingFuture
        implements ListenableFuture
    {

        private static final Executor defaultAdapterExecutor;
        private static final ThreadFactory threadFactory;
        private final Executor adapterExecutor;
        private final Future _flddelegate;
        private final ExecutionList executionList;
        private final AtomicBoolean hasListeners;

        public void addListener(Runnable runnable, Executor executor)
        {
label0:
            {
                executionList.add(runnable, executor);
                if (hasListeners.compareAndSet(false, true))
                {
                    if (!_flddelegate.isDone())
                        break label0;
                    executionList.execute();
                }
                return;
            }
            adapterExecutor.execute(new Runnable() {

                final ListenableFutureAdapter this$0;

                public void run()
                {
                    try
                    {
                        _flddelegate.get();
                    }
                    catch (Error error)
                    {
                        throw error;
                    }
                    catch (InterruptedException interruptedexception)
                    {
                        Thread.currentThread().interrupt();
                        throw new AssertionError(interruptedexception);
                    }
                    catch (Throwable throwable) { }
                    executionList.execute();
                }

            
            {
                this$0 = ListenableFutureAdapter.this;
                super();
            }
            }
);
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Future _mthdelegate()
        {
            return _flddelegate;
        }

        static 
        {
            threadFactory = (new ThreadFactoryBuilder()).setDaemon(true).setNameFormat("ListenableFutureAdapter-thread-%d").build();
            defaultAdapterExecutor = Executors.newCachedThreadPool(threadFactory);
        }



        ListenableFutureAdapter(Future future)
        {
            this(future, defaultAdapterExecutor);
        }

        ListenableFutureAdapter(Future future, Executor executor)
        {
            executionList = new ExecutionList();
            hasListeners = new AtomicBoolean(false);
            _flddelegate = (Future)Preconditions.checkNotNull(future);
            adapterExecutor = (Executor)Preconditions.checkNotNull(executor);
        }
    }


    private JdkFutureAdapters()
    {
    }

    public static ListenableFuture listenInPoolThread(Future future)
    {
        if (future instanceof ListenableFuture)
            return (ListenableFuture)future;
        else
            return new ListenableFutureAdapter(future);
    }

    static ListenableFuture listenInPoolThread(Future future, Executor executor)
    {
        Preconditions.checkNotNull(executor);
        if (future instanceof ListenableFuture)
            return (ListenableFuture)future;
        else
            return new ListenableFutureAdapter(future, executor);
    }
}
