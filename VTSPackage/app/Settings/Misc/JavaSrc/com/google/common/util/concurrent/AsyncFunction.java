// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;


// Referenced classes of package com.google.common.util.concurrent:
//            ListenableFuture

public interface AsyncFunction
{

    public abstract ListenableFuture apply(Object obj)
        throws Exception;
}
