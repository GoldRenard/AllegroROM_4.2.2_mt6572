// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.Function;
import com.google.common.collect.ImmutableMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;

// Referenced classes of package com.google.common.cache:
//            Cache

public interface LoadingCache
    extends Cache, Function
{

    public abstract Object apply(Object obj);

    public abstract ConcurrentMap asMap();

    public abstract Object get(Object obj)
        throws ExecutionException;

    public abstract ImmutableMap getAll(Iterable iterable)
        throws ExecutionException;

    public abstract Object getUnchecked(Object obj);

    public abstract void refresh(Object obj);
}
