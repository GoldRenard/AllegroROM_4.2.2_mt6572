// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.*;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.cache:
//            CacheStats, RemovalListener, Weigher, Cache, 
//            CacheLoader, LoadingCache, RemovalNotification

public final class CacheBuilder
{
    static final class NullListener extends Enum
        implements RemovalListener
    {

        private static final NullListener $VALUES[];
        public static final NullListener INSTANCE;

        public static NullListener valueOf(String s)
        {
            return (NullListener)Enum.valueOf(com/google/common/cache/CacheBuilder$NullListener, s);
        }

        public static NullListener[] values()
        {
            return (NullListener[])$VALUES.clone();
        }

        public void onRemoval(RemovalNotification removalnotification)
        {
        }

        static 
        {
            INSTANCE = new NullListener("INSTANCE", 0);
            NullListener anulllistener[] = new NullListener[1];
            anulllistener[0] = INSTANCE;
            $VALUES = anulllistener;
        }

        private NullListener(String s, int i)
        {
            super(s, i);
        }
    }

    static final class OneWeigher extends Enum
        implements Weigher
    {

        private static final OneWeigher $VALUES[];
        public static final OneWeigher INSTANCE;

        public static OneWeigher valueOf(String s)
        {
            return (OneWeigher)Enum.valueOf(com/google/common/cache/CacheBuilder$OneWeigher, s);
        }

        public static OneWeigher[] values()
        {
            return (OneWeigher[])$VALUES.clone();
        }

        public int weigh(Object obj, Object obj1)
        {
            return 1;
        }

        static 
        {
            INSTANCE = new OneWeigher("INSTANCE", 0);
            OneWeigher aoneweigher[] = new OneWeigher[1];
            aoneweigher[0] = INSTANCE;
            $VALUES = aoneweigher;
        }

        private OneWeigher(String s, int i)
        {
            super(s, i);
        }
    }


    static final Supplier CACHE_STATS_COUNTER = new Supplier() {

        public AbstractCache.SimpleStatsCounter get()
        {
            return new AbstractCache.SimpleStatsCounter();
        }

        public volatile Object get()
        {
            return get();
        }

    }
;
    private static final int DEFAULT_CONCURRENCY_LEVEL = 4;
    private static final int DEFAULT_EXPIRATION_NANOS = 0;
    private static final int DEFAULT_INITIAL_CAPACITY = 16;
    private static final int DEFAULT_REFRESH_NANOS = 0;
    static final CacheStats EMPTY_STATS = new CacheStats(0L, 0L, 0L, 0L, 0L, 0L);
    static final Supplier NULL_STATS_COUNTER = Suppliers.ofInstance(new AbstractCache.StatsCounter() {

        public void recordEviction()
        {
        }

        public void recordHits(int i)
        {
        }

        public void recordLoadException(long l)
        {
        }

        public void recordLoadSuccess(long l)
        {
        }

        public void recordMisses(int i)
        {
        }

        public CacheStats snapshot()
        {
            return CacheBuilder.EMPTY_STATS;
        }

    }
);
    static final Ticker NULL_TICKER = new Ticker() {

        public long read()
        {
            return 0L;
        }

    }
;
    static final int UNSET_INT = -1;
    private static final Logger logger = Logger.getLogger(com/google/common/cache/CacheBuilder.getName());
    int concurrencyLevel;
    long expireAfterAccessNanos;
    long expireAfterWriteNanos;
    int initialCapacity;
    Equivalence keyEquivalence;
    LocalCache.Strength keyStrength;
    long maximumSize;
    long maximumWeight;
    long refreshNanos;
    RemovalListener removalListener;
    Supplier statsCounterSupplier;
    boolean strictParsing;
    Ticker ticker;
    Equivalence valueEquivalence;
    LocalCache.Strength valueStrength;
    Weigher weigher;

    CacheBuilder()
    {
        strictParsing = true;
        initialCapacity = -1;
        concurrencyLevel = -1;
        maximumSize = -1L;
        maximumWeight = -1L;
        expireAfterWriteNanos = -1L;
        expireAfterAccessNanos = -1L;
        refreshNanos = -1L;
        statsCounterSupplier = CACHE_STATS_COUNTER;
    }

    private void checkNonLoadingCache()
    {
        boolean flag;
        if (refreshNanos == -1L)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag, "refreshAfterWrite requires a LoadingCache");
    }

    private void checkWeightWithWeigher()
    {
        boolean flag = true;
        if (weigher == null)
        {
            if (maximumWeight != -1L)
                flag = false;
            Preconditions.checkState(flag, "maximumWeight requires weigher");
        } else
        {
            if (strictParsing)
            {
                if (maximumWeight == -1L)
                    flag = false;
                Preconditions.checkState(flag, "weigher requires maximumWeight");
                return;
            }
            if (maximumWeight == -1L)
            {
                logger.log(Level.WARNING, "ignoring weigher specified without maximumWeight");
                return;
            }
        }
    }

    public static CacheBuilder newBuilder()
    {
        return new CacheBuilder();
    }

    public Cache build()
    {
        checkWeightWithWeigher();
        checkNonLoadingCache();
        return new LocalCache.LocalManualCache(this);
    }

    public LoadingCache build(CacheLoader cacheloader)
    {
        checkWeightWithWeigher();
        return new LocalCache.LocalLoadingCache(this, cacheloader);
    }

    public CacheBuilder concurrencyLevel(int i)
    {
        boolean flag = true;
        boolean flag1;
        if (concurrencyLevel == -1)
            flag1 = flag;
        else
            flag1 = false;
        Object aobj[] = new Object[flag];
        aobj[0] = Integer.valueOf(concurrencyLevel);
        Preconditions.checkState(flag1, "concurrency level was already set to %s", aobj);
        if (i <= 0)
            flag = false;
        Preconditions.checkArgument(flag);
        concurrencyLevel = i;
        return this;
    }

    CacheBuilder disableStats()
    {
        boolean flag;
        if (statsCounterSupplier == CACHE_STATS_COUNTER)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        statsCounterSupplier = NULL_STATS_COUNTER;
        return this;
    }

    public CacheBuilder expireAfterAccess(long l, TimeUnit timeunit)
    {
        boolean flag;
        if (expireAfterAccessNanos == -1L)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(expireAfterAccessNanos);
        Preconditions.checkState(flag, "expireAfterAccess was already set to %s ns", aobj);
        boolean flag1;
        if (l >= 0L)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = Long.valueOf(l);
        aobj1[1] = timeunit;
        Preconditions.checkArgument(flag1, "duration cannot be negative: %s %s", aobj1);
        expireAfterAccessNanos = timeunit.toNanos(l);
        return this;
    }

    public CacheBuilder expireAfterWrite(long l, TimeUnit timeunit)
    {
        boolean flag;
        if (expireAfterWriteNanos == -1L)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(expireAfterWriteNanos);
        Preconditions.checkState(flag, "expireAfterWrite was already set to %s ns", aobj);
        boolean flag1;
        if (l >= 0L)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = Long.valueOf(l);
        aobj1[1] = timeunit;
        Preconditions.checkArgument(flag1, "duration cannot be negative: %s %s", aobj1);
        expireAfterWriteNanos = timeunit.toNanos(l);
        return this;
    }

    int getConcurrencyLevel()
    {
        if (concurrencyLevel == -1)
            return 4;
        else
            return concurrencyLevel;
    }

    long getExpireAfterAccessNanos()
    {
        if (expireAfterAccessNanos == -1L)
            return 0L;
        else
            return expireAfterAccessNanos;
    }

    long getExpireAfterWriteNanos()
    {
        if (expireAfterWriteNanos == -1L)
            return 0L;
        else
            return expireAfterWriteNanos;
    }

    int getInitialCapacity()
    {
        if (initialCapacity == -1)
            return 16;
        else
            return initialCapacity;
    }

    Equivalence getKeyEquivalence()
    {
        return (Equivalence)Objects.firstNonNull(keyEquivalence, getKeyStrength().defaultEquivalence());
    }

    LocalCache.Strength getKeyStrength()
    {
        return (LocalCache.Strength)Objects.firstNonNull(keyStrength, LocalCache.Strength.STRONG);
    }

    long getMaximumWeight()
    {
        if (expireAfterWriteNanos != 0L && expireAfterAccessNanos != 0L)
        {
            if (weigher == null)
                return maximumSize;
            else
                return maximumWeight;
        } else
        {
            return 0L;
        }
    }

    long getRefreshNanos()
    {
        if (refreshNanos == -1L)
            return 0L;
        else
            return refreshNanos;
    }

    RemovalListener getRemovalListener()
    {
        return (RemovalListener)Objects.firstNonNull(removalListener, NullListener.INSTANCE);
    }

    Supplier getStatsCounterSupplier()
    {
        return statsCounterSupplier;
    }

    Ticker getTicker(boolean flag)
    {
        if (ticker != null)
            return ticker;
        if (flag)
            return Ticker.systemTicker();
        else
            return NULL_TICKER;
    }

    Equivalence getValueEquivalence()
    {
        return (Equivalence)Objects.firstNonNull(valueEquivalence, getValueStrength().defaultEquivalence());
    }

    LocalCache.Strength getValueStrength()
    {
        return (LocalCache.Strength)Objects.firstNonNull(valueStrength, LocalCache.Strength.STRONG);
    }

    Weigher getWeigher()
    {
        return (Weigher)Objects.firstNonNull(weigher, OneWeigher.INSTANCE);
    }

    public CacheBuilder initialCapacity(int i)
    {
        boolean flag = true;
        boolean flag1;
        if (initialCapacity == -1)
            flag1 = flag;
        else
            flag1 = false;
        Object aobj[] = new Object[flag];
        aobj[0] = Integer.valueOf(initialCapacity);
        Preconditions.checkState(flag1, "initial capacity was already set to %s", aobj);
        if (i < 0)
            flag = false;
        Preconditions.checkArgument(flag);
        initialCapacity = i;
        return this;
    }

    CacheBuilder keyEquivalence(Equivalence equivalence)
    {
        boolean flag;
        if (keyEquivalence == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = keyEquivalence;
        Preconditions.checkState(flag, "key equivalence was already set to %s", aobj);
        keyEquivalence = (Equivalence)Preconditions.checkNotNull(equivalence);
        return this;
    }

    CacheBuilder lenientParsing()
    {
        strictParsing = false;
        return this;
    }

    public CacheBuilder maximumSize(long l)
    {
        boolean flag = true;
        boolean flag1;
        if (maximumSize == -1L)
            flag1 = flag;
        else
            flag1 = false;
        Object aobj[] = new Object[flag];
        aobj[0] = Long.valueOf(maximumSize);
        Preconditions.checkState(flag1, "maximum size was already set to %s", aobj);
        boolean flag2;
        if (maximumWeight == -1L)
            flag2 = flag;
        else
            flag2 = false;
        Object aobj1[] = new Object[flag];
        aobj1[0] = Long.valueOf(maximumWeight);
        Preconditions.checkState(flag2, "maximum weight was already set to %s", aobj1);
        boolean flag3;
        if (weigher == null)
            flag3 = flag;
        else
            flag3 = false;
        Preconditions.checkState(flag3, "maximum size can not be combined with weigher");
        if (l < 0L)
            flag = false;
        Preconditions.checkArgument(flag, "maximum size must not be negative");
        maximumSize = l;
        return this;
    }

    public CacheBuilder maximumWeight(long l)
    {
        boolean flag = true;
        boolean flag1;
        if (maximumWeight == -1L)
            flag1 = flag;
        else
            flag1 = false;
        Object aobj[] = new Object[flag];
        aobj[0] = Long.valueOf(maximumWeight);
        Preconditions.checkState(flag1, "maximum weight was already set to %s", aobj);
        boolean flag2;
        if (maximumSize == -1L)
            flag2 = flag;
        else
            flag2 = false;
        Object aobj1[] = new Object[flag];
        aobj1[0] = Long.valueOf(maximumSize);
        Preconditions.checkState(flag2, "maximum size was already set to %s", aobj1);
        maximumWeight = l;
        if (l < 0L)
            flag = false;
        Preconditions.checkArgument(flag, "maximum weight must not be negative");
        return this;
    }

    public CacheBuilder refreshAfterWrite(long l, TimeUnit timeunit)
    {
        Preconditions.checkNotNull(timeunit);
        boolean flag;
        if (refreshNanos == -1L)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(refreshNanos);
        Preconditions.checkState(flag, "refresh was already set to %s ns", aobj);
        boolean flag1;
        if (l > 0L)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = Long.valueOf(l);
        aobj1[1] = timeunit;
        Preconditions.checkArgument(flag1, "duration must be positive: %s %s", aobj1);
        refreshNanos = timeunit.toNanos(l);
        return this;
    }

    public CacheBuilder removalListener(RemovalListener removallistener)
    {
        boolean flag;
        if (removalListener == null)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        removalListener = (RemovalListener)Preconditions.checkNotNull(removallistener);
        return this;
    }

    CacheBuilder setKeyStrength(LocalCache.Strength strength)
    {
        boolean flag;
        if (keyStrength == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = keyStrength;
        Preconditions.checkState(flag, "Key strength was already set to %s", aobj);
        keyStrength = (LocalCache.Strength)Preconditions.checkNotNull(strength);
        return this;
    }

    CacheBuilder setValueStrength(LocalCache.Strength strength)
    {
        boolean flag;
        if (valueStrength == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = valueStrength;
        Preconditions.checkState(flag, "Value strength was already set to %s", aobj);
        valueStrength = (LocalCache.Strength)Preconditions.checkNotNull(strength);
        return this;
    }

    public CacheBuilder softValues()
    {
        return setValueStrength(LocalCache.Strength.SOFT);
    }

    CacheBuilder strongKeys()
    {
        return setKeyStrength(LocalCache.Strength.STRONG);
    }

    CacheBuilder strongValues()
    {
        return setValueStrength(LocalCache.Strength.STRONG);
    }

    public CacheBuilder ticker(Ticker ticker1)
    {
        boolean flag;
        if (ticker == null)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        ticker = (Ticker)Preconditions.checkNotNull(ticker1);
        return this;
    }

    public String toString()
    {
        com.google.common.base.Objects.ToStringHelper tostringhelper = Objects.toStringHelper(this);
        if (initialCapacity != -1)
            tostringhelper.add("initialCapacity", initialCapacity);
        if (concurrencyLevel != -1)
            tostringhelper.add("concurrencyLevel", concurrencyLevel);
        if (maximumWeight != -1L)
            if (weigher == null)
                tostringhelper.add("maximumSize", maximumWeight);
            else
                tostringhelper.add("maximumWeight", maximumWeight);
        if (expireAfterWriteNanos != -1L)
            tostringhelper.add("expireAfterWrite", (new StringBuilder()).append(expireAfterWriteNanos).append("ns").toString());
        if (expireAfterAccessNanos != -1L)
            tostringhelper.add("expireAfterAccess", (new StringBuilder()).append(expireAfterAccessNanos).append("ns").toString());
        if (keyStrength != null)
            tostringhelper.add("keyStrength", Ascii.toLowerCase(keyStrength.toString()));
        if (valueStrength != null)
            tostringhelper.add("valueStrength", Ascii.toLowerCase(valueStrength.toString()));
        if (keyEquivalence != null)
            tostringhelper.addValue("keyEquivalence");
        if (valueEquivalence != null)
            tostringhelper.addValue("valueEquivalence");
        if (removalListener != null)
            tostringhelper.addValue("removalListener");
        return tostringhelper.toString();
    }

    CacheBuilder valueEquivalence(Equivalence equivalence)
    {
        boolean flag;
        if (valueEquivalence == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = valueEquivalence;
        Preconditions.checkState(flag, "value equivalence was already set to %s", aobj);
        valueEquivalence = (Equivalence)Preconditions.checkNotNull(equivalence);
        return this;
    }

    public CacheBuilder weakKeys()
    {
        return setKeyStrength(LocalCache.Strength.WEAK);
    }

    public CacheBuilder weakValues()
    {
        return setValueStrength(LocalCache.Strength.WEAK);
    }

    public CacheBuilder weigher(Weigher weigher1)
    {
        boolean flag;
        if (weigher == null)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        if (strictParsing)
        {
            boolean flag1;
            if (maximumSize == -1L)
                flag1 = true;
            else
                flag1 = false;
            Object aobj[] = new Object[1];
            aobj[0] = Long.valueOf(maximumSize);
            Preconditions.checkState(flag1, "weigher can not be combined with maximum size", aobj);
        }
        weigher = (Weigher)Preconditions.checkNotNull(weigher1);
        return this;
    }

}
