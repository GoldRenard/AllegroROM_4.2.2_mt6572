// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.Preconditions;
import com.google.common.collect.ForwardingObject;
import com.google.common.collect.ImmutableMap;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.cache:
//            Cache, CacheStats

public abstract class ForwardingCache extends ForwardingObject
    implements Cache
{
    public static abstract class SimpleForwardingCache extends ForwardingCache
    {

        private final Cache _flddelegate;

        protected final Cache _mthdelegate()
        {
            return _flddelegate;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected SimpleForwardingCache(Cache cache)
        {
            _flddelegate = (Cache)Preconditions.checkNotNull(cache);
        }
    }



    public Object apply(Object obj)
    {
        return _mthdelegate().apply(obj);
    }

    public ConcurrentMap asMap()
    {
        return _mthdelegate().asMap();
    }

    public void cleanUp()
    {
        _mthdelegate().cleanUp();
    }

    protected abstract Cache _mthdelegate();

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    public Object get(Object obj)
        throws ExecutionException
    {
        return _mthdelegate().get(obj);
    }

    public Object get(Object obj, Callable callable)
        throws ExecutionException
    {
        return _mthdelegate().get(obj, callable);
    }

    public ImmutableMap getAllPresent(Iterable iterable)
    {
        return _mthdelegate().getAllPresent(iterable);
    }

    public Object getIfPresent(Object obj)
    {
        return _mthdelegate().getIfPresent(obj);
    }

    public Object getUnchecked(Object obj)
    {
        return _mthdelegate().getUnchecked(obj);
    }

    public void invalidate(Object obj)
    {
        _mthdelegate().invalidate(obj);
    }

    public void invalidateAll()
    {
        _mthdelegate().invalidateAll();
    }

    public void invalidateAll(Iterable iterable)
    {
        _mthdelegate().invalidateAll(iterable);
    }

    public void put(Object obj, Object obj1)
    {
        _mthdelegate().put(obj, obj1);
    }

    public long size()
    {
        return _mthdelegate().size();
    }

    public CacheStats stats()
    {
        return _mthdelegate().stats();
    }
}
