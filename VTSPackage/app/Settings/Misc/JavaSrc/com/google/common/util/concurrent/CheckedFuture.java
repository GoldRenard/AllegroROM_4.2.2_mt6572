// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture

public interface CheckedFuture
    extends ListenableFuture
{

    public abstract Object checkedGet()
        throws Exception;

    public abstract Object checkedGet(long l, TimeUnit timeunit)
        throws TimeoutException, Exception;
}
