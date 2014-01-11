// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.*;

// Referenced classes of package com.google.common.util.concurrent:
//            CheckedFuture, ListenableFuture

public abstract class AbstractCheckedFuture extends ForwardingListenableFuture.SimpleForwardingListenableFuture
    implements CheckedFuture
{

    protected AbstractCheckedFuture(ListenableFuture listenablefuture)
    {
        super(listenablefuture);
    }

    public Object checkedGet()
        throws Exception
    {
        Object obj;
        try
        {
            obj = get();
        }
        catch (InterruptedException interruptedexception)
        {
            Thread.currentThread().interrupt();
            throw mapException(interruptedexception);
        }
        catch (CancellationException cancellationexception)
        {
            throw mapException(cancellationexception);
        }
        catch (ExecutionException executionexception)
        {
            throw mapException(executionexception);
        }
        return obj;
    }

    public Object checkedGet(long l, TimeUnit timeunit)
        throws TimeoutException, Exception
    {
        Object obj;
        try
        {
            obj = get(l, timeunit);
        }
        catch (InterruptedException interruptedexception)
        {
            Thread.currentThread().interrupt();
            throw mapException(interruptedexception);
        }
        catch (CancellationException cancellationexception)
        {
            throw mapException(cancellationexception);
        }
        catch (ExecutionException executionexception)
        {
            throw mapException(executionexception);
        }
        return obj;
    }

    protected abstract Exception mapException(Exception exception);
}
