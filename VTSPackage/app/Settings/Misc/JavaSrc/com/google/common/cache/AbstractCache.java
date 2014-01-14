// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicLong;

// Referenced classes of package com.google.common.cache:
//            Cache, CacheStats

public abstract class AbstractCache
    implements Cache
{
    public static class SimpleStatsCounter
        implements StatsCounter
    {

        private final AtomicLong evictionCount = new AtomicLong();
        private final AtomicLong hitCount = new AtomicLong();
        private final AtomicLong loadExceptionCount = new AtomicLong();
        private final AtomicLong loadSuccessCount = new AtomicLong();
        private final AtomicLong missCount = new AtomicLong();
        private final AtomicLong totalLoadTime = new AtomicLong();

        public void incrementBy(StatsCounter statscounter)
        {
            CacheStats cachestats = statscounter.snapshot();
            hitCount.addAndGet(cachestats.hitCount());
            missCount.addAndGet(cachestats.missCount());
            loadSuccessCount.addAndGet(cachestats.loadSuccessCount());
            loadExceptionCount.addAndGet(cachestats.loadExceptionCount());
            totalLoadTime.addAndGet(cachestats.totalLoadTime());
            evictionCount.addAndGet(cachestats.evictionCount());
        }

        public void recordEviction()
        {
            evictionCount.incrementAndGet();
        }

        public void recordHits(int i)
        {
            hitCount.addAndGet(i);
        }

        public void recordLoadException(long l)
        {
            loadExceptionCount.incrementAndGet();
            totalLoadTime.addAndGet(l);
        }

        public void recordLoadSuccess(long l)
        {
            loadSuccessCount.incrementAndGet();
            totalLoadTime.addAndGet(l);
        }

        public void recordMisses(int i)
        {
            missCount.addAndGet(i);
        }

        public CacheStats snapshot()
        {
            return new CacheStats(hitCount.get(), missCount.get(), loadSuccessCount.get(), loadExceptionCount.get(), totalLoadTime.get(), evictionCount.get());
        }

    }

    public static interface StatsCounter
    {

        public abstract void recordEviction();

        public abstract void recordHits(int i);

        public abstract void recordLoadException(long l);

        public abstract void recordLoadSuccess(long l);

        public abstract void recordMisses(int i);

        public abstract CacheStats snapshot();
    }



    public Object apply(Object obj)
    {
        return getUnchecked(obj);
    }

    public ConcurrentMap asMap()
    {
        throw new UnsupportedOperationException();
    }

    public void cleanUp()
    {
    }

    public Object get(Object obj, Callable callable)
        throws ExecutionException
    {
        throw new UnsupportedOperationException();
    }

    public ImmutableMap getAllPresent(Iterable iterable)
    {
        java.util.LinkedHashMap linkedhashmap = Maps.newLinkedHashMap();
        Iterator iterator = iterable.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Object obj = iterator.next();
            if (!linkedhashmap.containsKey(obj))
                linkedhashmap.put(obj, getIfPresent(obj));
        } while (true);
        return ImmutableMap.copyOf(linkedhashmap);
    }

    public Object getUnchecked(Object obj)
    {
        Object obj1;
        try
        {
            obj1 = get(obj);
        }
        catch (ExecutionException executionexception)
        {
            throw new UncheckedExecutionException(executionexception.getCause());
        }
        return obj1;
    }

    public void invalidate(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public void invalidateAll()
    {
        throw new UnsupportedOperationException();
    }

    public void invalidateAll(Iterable iterable)
    {
        for (Iterator iterator = iterable.iterator(); iterator.hasNext(); invalidate(iterator.next()));
    }

    public void put(Object obj, Object obj1)
    {
        throw new UnsupportedOperationException();
    }

    public long size()
    {
        throw new UnsupportedOperationException();
    }

    public CacheStats stats()
    {
        throw new UnsupportedOperationException();
    }
}
