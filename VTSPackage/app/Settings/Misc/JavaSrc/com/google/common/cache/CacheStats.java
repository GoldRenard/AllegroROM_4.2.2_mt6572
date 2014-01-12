// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;

public final class CacheStats
{

    private final long evictionCount;
    private final long hitCount;
    private final long loadExceptionCount;
    private final long loadSuccessCount;
    private final long missCount;
    private final long totalLoadTime;

    public CacheStats(long l, long l1, long l2, long l3, long l4, long l5)
    {
        boolean flag;
        if (l >= 0L)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        boolean flag1;
        if (l1 >= 0L)
            flag1 = true;
        else
            flag1 = false;
        Preconditions.checkArgument(flag1);
        boolean flag2;
        if (l2 >= 0L)
            flag2 = true;
        else
            flag2 = false;
        Preconditions.checkArgument(flag2);
        boolean flag3;
        if (l3 >= 0L)
            flag3 = true;
        else
            flag3 = false;
        Preconditions.checkArgument(flag3);
        boolean flag4;
        if (l4 >= 0L)
            flag4 = true;
        else
            flag4 = false;
        Preconditions.checkArgument(flag4);
        boolean flag5;
        if (l5 >= 0L)
            flag5 = true;
        else
            flag5 = false;
        Preconditions.checkArgument(flag5);
        hitCount = l;
        missCount = l1;
        loadSuccessCount = l2;
        loadExceptionCount = l3;
        totalLoadTime = l4;
        evictionCount = l5;
    }

    public double averageLoadPenalty()
    {
        long l = loadSuccessCount + loadExceptionCount;
        if (l == 0L)
            return 0.0D;
        else
            return (double)totalLoadTime / (double)l;
    }

    public boolean equals(Object obj)
    {
        boolean flag = obj instanceof CacheStats;
        boolean flag1 = false;
        if (flag)
        {
            CacheStats cachestats = (CacheStats)obj;
            int i = hitCount != cachestats.hitCount;
            flag1 = false;
            if (i == 0)
            {
                int j = missCount != cachestats.missCount;
                flag1 = false;
                if (j == 0)
                {
                    int k = loadSuccessCount != cachestats.loadSuccessCount;
                    flag1 = false;
                    if (k == 0)
                    {
                        int l = loadExceptionCount != cachestats.loadExceptionCount;
                        flag1 = false;
                        if (l == 0)
                        {
                            int i1 = totalLoadTime != cachestats.totalLoadTime;
                            flag1 = false;
                            if (i1 == 0)
                            {
                                int j1 = evictionCount != cachestats.evictionCount;
                                flag1 = false;
                                if (j1 == 0)
                                    flag1 = true;
                            }
                        }
                    }
                }
            }
        }
        return flag1;
    }

    public long evictionCount()
    {
        return evictionCount;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[6];
        aobj[0] = Long.valueOf(hitCount);
        aobj[1] = Long.valueOf(missCount);
        aobj[2] = Long.valueOf(loadSuccessCount);
        aobj[3] = Long.valueOf(loadExceptionCount);
        aobj[4] = Long.valueOf(totalLoadTime);
        aobj[5] = Long.valueOf(evictionCount);
        return Objects.hashCode(aobj);
    }

    public long hitCount()
    {
        return hitCount;
    }

    public double hitRate()
    {
        long l = requestCount();
        if (l == 0L)
            return 1.0D;
        else
            return (double)hitCount / (double)l;
    }

    public long loadCount()
    {
        return loadSuccessCount + loadExceptionCount;
    }

    public long loadExceptionCount()
    {
        return loadExceptionCount;
    }

    public double loadExceptionRate()
    {
        long l = loadSuccessCount + loadExceptionCount;
        if (l == 0L)
            return 0.0D;
        else
            return (double)loadExceptionCount / (double)l;
    }

    public long loadSuccessCount()
    {
        return loadSuccessCount;
    }

    public CacheStats minus(CacheStats cachestats)
    {
        return new CacheStats(Math.max(0L, hitCount - cachestats.hitCount), Math.max(0L, missCount - cachestats.missCount), Math.max(0L, loadSuccessCount - cachestats.loadSuccessCount), Math.max(0L, loadExceptionCount - cachestats.loadExceptionCount), Math.max(0L, totalLoadTime - cachestats.totalLoadTime), Math.max(0L, evictionCount - cachestats.evictionCount));
    }

    public long missCount()
    {
        return missCount;
    }

    public double missRate()
    {
        long l = requestCount();
        if (l == 0L)
            return 0.0D;
        else
            return (double)missCount / (double)l;
    }

    public CacheStats plus(CacheStats cachestats)
    {
        return new CacheStats(hitCount + cachestats.hitCount, missCount + cachestats.missCount, loadSuccessCount + cachestats.loadSuccessCount, loadExceptionCount + cachestats.loadExceptionCount, totalLoadTime + cachestats.totalLoadTime, evictionCount + cachestats.evictionCount);
    }

    public long requestCount()
    {
        return hitCount + missCount;
    }

    public String toString()
    {
        return Objects.toStringHelper(this).add("hitCount", hitCount).add("missCount", missCount).add("loadSuccessCount", loadSuccessCount).add("loadExceptionCount", loadExceptionCount).add("totalLoadTime", totalLoadTime).add("evictionCount", evictionCount).toString();
    }

    public long totalLoadTime()
    {
        return totalLoadTime;
    }
}
