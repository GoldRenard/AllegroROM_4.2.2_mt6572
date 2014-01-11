// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.Function;
import com.google.common.collect.ImmutableMap;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.cache:
//            CacheStats

public interface Cache
    extends Function
{

    public abstract Object apply(Object obj);

    public abstract ConcurrentMap asMap();

    public abstract void cleanUp();

    public abstract Object get(Object obj)
        throws ExecutionException;

    public abstract Object get(Object obj, Callable callable)
        throws ExecutionException;

    public abstract ImmutableMap getAllPresent(Iterable iterable);

    public abstract Object getIfPresent(Object obj);

    public abstract Object getUnchecked(Object obj);

    public abstract void invalidate(Object obj);

    public abstract void invalidateAll();

    public abstract void invalidateAll(Iterable iterable);

    public abstract void put(Object obj, Object obj1);

    public abstract long size();

    public abstract CacheStats stats();
}
