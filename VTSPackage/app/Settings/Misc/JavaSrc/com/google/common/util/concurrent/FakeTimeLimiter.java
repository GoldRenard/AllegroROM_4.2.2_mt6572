// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

// Referenced classes of package com.google.common.util.concurrent:
//            TimeLimiter

public final class FakeTimeLimiter
    implements TimeLimiter
{


    public Object callWithTimeout(Callable callable, long l, TimeUnit timeunit, boolean flag)
        throws Exception
    {
        return callable.call();
    }

    public Object newProxy(Object obj, Class class1, long l, TimeUnit timeunit)
    {
        return obj;
    }
}
