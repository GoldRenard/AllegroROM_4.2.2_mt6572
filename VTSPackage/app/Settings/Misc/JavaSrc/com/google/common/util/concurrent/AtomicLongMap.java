// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.collect.Maps;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

public final class AtomicLongMap
{

    private transient Map asMap;
    private final ConcurrentHashMap map;

    private AtomicLongMap(ConcurrentHashMap concurrenthashmap)
    {
        map = (ConcurrentHashMap)Preconditions.checkNotNull(concurrenthashmap);
    }

    public static AtomicLongMap create()
    {
        return new AtomicLongMap(new ConcurrentHashMap());
    }

    public static AtomicLongMap create(Map map1)
    {
        AtomicLongMap atomiclongmap = create();
        atomiclongmap.putAll(map1);
        return atomiclongmap;
    }

    private Map createAsMap()
    {
        return Collections.unmodifiableMap(Maps.transformValues(map, new Function() {

            final AtomicLongMap this$0;

            public Long apply(AtomicLong atomiclong)
            {
                return Long.valueOf(atomiclong.get());
            }

            public volatile Object apply(Object obj)
            {
                return apply((AtomicLong)obj);
            }

            
            {
                this$0 = AtomicLongMap.this;
                super();
            }
        }
));
    }

    public long addAndGet(Object obj, long l)
    {
label0:
        do
        {
            AtomicLong atomiclong = (AtomicLong)map.get(obj);
            if (atomiclong == null)
            {
                atomiclong = (AtomicLong)map.putIfAbsent(obj, new AtomicLong(l));
                if (atomiclong == null)
                    return l;
            }
            long l1;
            long l2;
            do
            {
                l1 = atomiclong.get();
                if (l1 == 0L)
                {
                    if (map.replace(obj, atomiclong, new AtomicLong(l)))
                        return l;
                    continue label0;
                }
                l2 = l1 + l;
            } while (!atomiclong.compareAndSet(l1, l2));
            return l2;
        } while (true);
    }

    public Map asMap()
    {
        Map map1 = asMap;
        if (map1 == null)
        {
            map1 = createAsMap();
            asMap = map1;
        }
        return map1;
    }

    public void clear()
    {
        map.clear();
    }

    public boolean containsKey(Object obj)
    {
        return map.containsKey(obj);
    }

    public long decrementAndGet(Object obj)
    {
        return addAndGet(obj, -1L);
    }

    public long get(Object obj)
    {
        AtomicLong atomiclong = (AtomicLong)map.get(obj);
        if (atomiclong == null)
            return 0L;
        else
            return atomiclong.get();
    }

    public long getAndAdd(Object obj, long l)
    {
_L2:
        AtomicLong atomiclong;
        atomiclong = (AtomicLong)map.get(obj);
        if (atomiclong == null)
        {
            atomiclong = (AtomicLong)map.putIfAbsent(obj, new AtomicLong(l));
            if (atomiclong == null)
                return 0L;
        }
_L4:
        long l1;
        l1 = atomiclong.get();
        if (l1 != 0L)
            continue; /* Loop/switch isn't completed */
        if (!map.replace(obj, atomiclong, new AtomicLong(l))) goto _L2; else goto _L1
_L1:
        return 0L;
        if (!atomiclong.compareAndSet(l1, l1 + l)) goto _L4; else goto _L3
_L3:
        return l1;
    }

    public long getAndDecrement(Object obj)
    {
        return getAndAdd(obj, -1L);
    }

    public long getAndIncrement(Object obj)
    {
        return getAndAdd(obj, 1L);
    }

    public long incrementAndGet(Object obj)
    {
        return addAndGet(obj, 1L);
    }

    public boolean isEmpty()
    {
        return map.isEmpty();
    }

    public long put(Object obj, long l)
    {
_L2:
        AtomicLong atomiclong;
        atomiclong = (AtomicLong)map.get(obj);
        if (atomiclong == null)
        {
            atomiclong = (AtomicLong)map.putIfAbsent(obj, new AtomicLong(l));
            if (atomiclong == null)
                return 0L;
        }
_L4:
        long l1;
        l1 = atomiclong.get();
        if (l1 != 0L)
            continue; /* Loop/switch isn't completed */
        if (!map.replace(obj, atomiclong, new AtomicLong(l))) goto _L2; else goto _L1
_L1:
        return 0L;
        if (!atomiclong.compareAndSet(l1, l)) goto _L4; else goto _L3
_L3:
        return l1;
    }

    public void putAll(Map map1)
    {
        java.util.Map.Entry entry;
        for (Iterator iterator = map1.entrySet().iterator(); iterator.hasNext(); put(entry.getKey(), ((Long)entry.getValue()).longValue()))
            entry = (java.util.Map.Entry)iterator.next();

    }

    long putIfAbsent(Object obj, long l)
    {
        long l1;
        do
        {
            AtomicLong atomiclong = (AtomicLong)map.get(obj);
            if (atomiclong == null)
            {
                atomiclong = (AtomicLong)map.putIfAbsent(obj, new AtomicLong(l));
                if (atomiclong == null)
                {
                    l1 = 0L;
                    break;
                }
            }
            l1 = atomiclong.get();
            if (l1 != 0L)
                break;
            if (map.replace(obj, atomiclong, new AtomicLong(l)))
                return 0L;
        } while (true);
        return l1;
    }

    public long remove(Object obj)
    {
        AtomicLong atomiclong = (AtomicLong)map.get(obj);
        if (atomiclong == null)
            return 0L;
        long l;
        do
            l = atomiclong.get();
        while (l != 0L && !atomiclong.compareAndSet(l, 0L));
        map.remove(obj, atomiclong);
        return l;
    }

    boolean remove(Object obj, long l)
    {
        AtomicLong atomiclong = (AtomicLong)map.get(obj);
        if (atomiclong != null)
        {
            long l1 = atomiclong.get();
            if (l1 == l && (l1 == 0L || atomiclong.compareAndSet(l1, 0L)))
            {
                map.remove(obj, atomiclong);
                return true;
            }
        }
        return false;
    }

    public void removeAllZeros()
    {
        Iterator iterator = map.keySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Object obj = iterator.next();
            AtomicLong atomiclong = (AtomicLong)map.get(obj);
            if (atomiclong != null && atomiclong.get() == 0L)
                map.remove(obj, atomiclong);
        } while (true);
    }

    boolean replace(Object obj, long l, long l1)
    {
        boolean flag;
        if (l == 0L)
        {
            int i = putIfAbsent(obj, l1) != 0L;
            flag = false;
            if (i == 0)
                flag = true;
        } else
        {
            AtomicLong atomiclong = (AtomicLong)map.get(obj);
            flag = false;
            if (atomiclong != null)
                return atomiclong.compareAndSet(l, l1);
        }
        return flag;
    }

    public int size()
    {
        return map.size();
    }

    public long sum()
    {
        long l = 0L;
        for (Iterator iterator = map.values().iterator(); iterator.hasNext();)
            l += ((AtomicLong)iterator.next()).get();

        return l;
    }

    public String toString()
    {
        return map.toString();
    }
}
