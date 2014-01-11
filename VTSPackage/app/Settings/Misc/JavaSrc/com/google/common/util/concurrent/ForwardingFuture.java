// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.ForwardingObject;
import java.util.concurrent.*;

public abstract class ForwardingFuture extends ForwardingObject
    implements Future
{
    public static abstract class SimpleForwardingFuture extends ForwardingFuture
    {

        private final Future _flddelegate;

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected final Future _mthdelegate()
        {
            return _flddelegate;
        }

        protected SimpleForwardingFuture(Future future)
        {
            _flddelegate = (Future)Preconditions.checkNotNull(future);
        }
    }



    public boolean cancel(boolean flag)
    {
        return _mthdelegate().cancel(flag);
    }

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract Future _mthdelegate();

    public Object get()
        throws InterruptedException, ExecutionException
    {
        return _mthdelegate().get();
    }

    public Object get(long l, TimeUnit timeunit)
        throws InterruptedException, ExecutionException, TimeoutException
    {
        return _mthdelegate().get(l, timeunit);
    }

    public boolean isCancelled()
    {
        return _mthdelegate().isCancelled();
    }

    public boolean isDone()
    {
        return _mthdelegate().isDone();
    }
}
