// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.collect.ForwardingObject;

// Referenced classes of package com.google.common.util.concurrent:
//            Service, Futures, ListenableFuture

public abstract class ForwardingService extends ForwardingObject
    implements Service
{


    protected abstract Service _mthdelegate();

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    public boolean isRunning()
    {
        return _mthdelegate().isRunning();
    }

    protected Service.State standardStartAndWait()
    {
        return (Service.State)Futures.getUnchecked(start());
    }

    protected Service.State standardStopAndWait()
    {
        return (Service.State)Futures.getUnchecked(stop());
    }

    public ListenableFuture start()
    {
        return _mthdelegate().start();
    }

    public Service.State startAndWait()
    {
        return _mthdelegate().startAndWait();
    }

    public Service.State state()
    {
        return _mthdelegate().state();
    }

    public ListenableFuture stop()
    {
        return _mthdelegate().stop();
    }

    public Service.State stopAndWait()
    {
        return _mthdelegate().stopAndWait();
    }
}
