// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.Serializable;
import java.util.*;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.collect:
//            GenericMapMaker, MapMakerInternalMap, ComputationException, ImmutableEntry

public final class MapMaker extends GenericMapMaker
{
    static final class NullComputingConcurrentMap extends NullConcurrentMap
    {

        private static final long serialVersionUID;
        final Function computingFunction;

        private Object compute(Object obj)
        {
            Preconditions.checkNotNull(obj);
            Object obj1;
            try
            {
                obj1 = computingFunction.apply(obj);
            }
            catch (ComputationException computationexception)
            {
                throw computationexception;
            }
            catch (Throwable throwable)
            {
                throw new ComputationException(throwable);
            }
            return obj1;
        }

        public Object get(Object obj)
        {
            Object obj1 = compute(obj);
            Preconditions.checkNotNull(obj1, (new StringBuilder()).append(computingFunction).append(" returned null for key ").append(obj).append(".").toString());
            notifyRemoval(obj, obj1);
            return obj1;
        }

        NullComputingConcurrentMap(MapMaker mapmaker, Function function)
        {
            super(mapmaker);
            computingFunction = (Function)Preconditions.checkNotNull(function);
        }
    }

    static class NullConcurrentMap extends AbstractMap
        implements ConcurrentMap, Serializable
    {

        private static final long serialVersionUID;
        private final RemovalCause removalCause;
        private final RemovalListener removalListener;

        public boolean containsKey(Object obj)
        {
            return false;
        }

        public boolean containsValue(Object obj)
        {
            return false;
        }

        public Set entrySet()
        {
            return Collections.emptySet();
        }

        public Object get(Object obj)
        {
            return null;
        }

        void notifyRemoval(Object obj, Object obj1)
        {
            RemovalNotification removalnotification = new RemovalNotification(obj, obj1, removalCause);
            removalListener.onRemoval(removalnotification);
        }

        public Object put(Object obj, Object obj1)
        {
            Preconditions.checkNotNull(obj);
            Preconditions.checkNotNull(obj1);
            notifyRemoval(obj, obj1);
            return null;
        }

        public Object putIfAbsent(Object obj, Object obj1)
        {
            return put(obj, obj1);
        }

        public Object remove(Object obj)
        {
            return null;
        }

        public boolean remove(Object obj, Object obj1)
        {
            return false;
        }

        public Object replace(Object obj, Object obj1)
        {
            Preconditions.checkNotNull(obj);
            Preconditions.checkNotNull(obj1);
            return null;
        }

        public boolean replace(Object obj, Object obj1, Object obj2)
        {
            Preconditions.checkNotNull(obj);
            Preconditions.checkNotNull(obj2);
            return false;
        }

        NullConcurrentMap(MapMaker mapmaker)
        {
            removalListener = mapmaker.getRemovalListener();
            removalCause = mapmaker.nullRemovalCause;
        }
    }

    static abstract class RemovalCause extends Enum
    {

        private static final RemovalCause $VALUES[];
        public static final RemovalCause COLLECTED;
        public static final RemovalCause EXPIRED;
        public static final RemovalCause EXPLICIT;
        public static final RemovalCause REPLACED;
        public static final RemovalCause SIZE;

        public static RemovalCause valueOf(String s)
        {
            return (RemovalCause)Enum.valueOf(com/google/common/collect/MapMaker$RemovalCause, s);
        }

        public static RemovalCause[] values()
        {
            return (RemovalCause[])$VALUES.clone();
        }

        abstract boolean wasEvicted();

        static 
        {
            EXPLICIT = new RemovalCause("EXPLICIT", 0) {

                boolean wasEvicted()
                {
                    return false;
                }

            }
;
            REPLACED = new RemovalCause("REPLACED", 1) {

                boolean wasEvicted()
                {
                    return false;
                }

            }
;
            COLLECTED = new RemovalCause("COLLECTED", 2) {

                boolean wasEvicted()
                {
                    return true;
                }

            }
;
            EXPIRED = new RemovalCause("EXPIRED", 3) {

                boolean wasEvicted()
                {
                    return true;
                }

            }
;
            SIZE = new RemovalCause("SIZE", 4) {

                boolean wasEvicted()
                {
                    return true;
                }

            }
;
            RemovalCause aremovalcause[] = new RemovalCause[5];
            aremovalcause[0] = EXPLICIT;
            aremovalcause[1] = REPLACED;
            aremovalcause[2] = COLLECTED;
            aremovalcause[3] = EXPIRED;
            aremovalcause[4] = SIZE;
            $VALUES = aremovalcause;
        }

        private RemovalCause(String s, int i)
        {
            super(s, i);
        }

    }

    static interface RemovalListener
    {

        public abstract void onRemoval(RemovalNotification removalnotification);
    }

    static final class RemovalNotification extends ImmutableEntry
    {

        private static final long serialVersionUID;
        private final RemovalCause cause;

        public RemovalCause getCause()
        {
            return cause;
        }

        public boolean wasEvicted()
        {
            return cause.wasEvicted();
        }

        RemovalNotification(Object obj, Object obj1, RemovalCause removalcause)
        {
            super(obj, obj1);
            cause = removalcause;
        }
    }


    private static final int DEFAULT_CONCURRENCY_LEVEL = 4;
    private static final int DEFAULT_EXPIRATION_NANOS = 0;
    private static final int DEFAULT_INITIAL_CAPACITY = 16;
    static final int UNSET_INT = -1;
    int concurrencyLevel;
    long expireAfterAccessNanos;
    long expireAfterWriteNanos;
    int initialCapacity;
    Equivalence keyEquivalence;
    MapMakerInternalMap.Strength keyStrength;
    int maximumSize;
    RemovalCause nullRemovalCause;
    Ticker ticker;
    boolean useCustomMap;
    Equivalence valueEquivalence;
    MapMakerInternalMap.Strength valueStrength;

    public MapMaker()
    {
        initialCapacity = -1;
        concurrencyLevel = -1;
        maximumSize = -1;
        expireAfterWriteNanos = -1L;
        expireAfterAccessNanos = -1L;
    }

    private void checkExpiration(long l, TimeUnit timeunit)
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
        if (expireAfterAccessNanos == -1L)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[1];
        aobj1[0] = Long.valueOf(expireAfterAccessNanos);
        Preconditions.checkState(flag1, "expireAfterAccess was already set to %s ns", aobj1);
        boolean flag2;
        if (l >= 0L)
            flag2 = true;
        else
            flag2 = false;
        Object aobj2[] = new Object[2];
        aobj2[0] = Long.valueOf(l);
        aobj2[1] = timeunit;
        Preconditions.checkArgument(flag2, "duration cannot be negative: %s %s", aobj2);
    }

    private boolean useNullMap()
    {
        return nullRemovalCause == null;
    }

    public volatile GenericMapMaker concurrencyLevel(int i)
    {
        return concurrencyLevel(i);
    }

    public MapMaker concurrencyLevel(int i)
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

    public volatile GenericMapMaker expiration(long l, TimeUnit timeunit)
    {
        return expiration(l, timeunit);
    }

    public MapMaker expiration(long l, TimeUnit timeunit)
    {
        return expireAfterWrite(l, timeunit);
    }

    volatile GenericMapMaker expireAfterAccess(long l, TimeUnit timeunit)
    {
        return expireAfterAccess(l, timeunit);
    }

    MapMaker expireAfterAccess(long l, TimeUnit timeunit)
    {
        checkExpiration(l, timeunit);
        expireAfterAccessNanos = timeunit.toNanos(l);
        if (l == 0L && nullRemovalCause == null)
            nullRemovalCause = RemovalCause.EXPIRED;
        useCustomMap = true;
        return this;
    }

    volatile GenericMapMaker expireAfterWrite(long l, TimeUnit timeunit)
    {
        return expireAfterWrite(l, timeunit);
    }

    MapMaker expireAfterWrite(long l, TimeUnit timeunit)
    {
        checkExpiration(l, timeunit);
        expireAfterWriteNanos = timeunit.toNanos(l);
        if (l == 0L && nullRemovalCause == null)
            nullRemovalCause = RemovalCause.EXPIRED;
        useCustomMap = true;
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

    MapMakerInternalMap.Strength getKeyStrength()
    {
        return (MapMakerInternalMap.Strength)Objects.firstNonNull(keyStrength, MapMakerInternalMap.Strength.STRONG);
    }

    Ticker getTicker()
    {
        return (Ticker)Objects.firstNonNull(ticker, Ticker.systemTicker());
    }

    Equivalence getValueEquivalence()
    {
        return (Equivalence)Objects.firstNonNull(valueEquivalence, getValueStrength().defaultEquivalence());
    }

    MapMakerInternalMap.Strength getValueStrength()
    {
        return (MapMakerInternalMap.Strength)Objects.firstNonNull(valueStrength, MapMakerInternalMap.Strength.STRONG);
    }

    public volatile GenericMapMaker initialCapacity(int i)
    {
        return initialCapacity(i);
    }

    public MapMaker initialCapacity(int i)
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

    volatile GenericMapMaker keyEquivalence(Equivalence equivalence)
    {
        return keyEquivalence(equivalence);
    }

    MapMaker keyEquivalence(Equivalence equivalence)
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
        useCustomMap = true;
        return this;
    }

    public ConcurrentMap makeComputingMap(Function function)
    {
        if (useNullMap())
            return new ComputingConcurrentHashMap.ComputingMapAdapter(this, function);
        else
            return new NullComputingConcurrentMap(this, function);
    }

    MapMakerInternalMap makeCustomMap()
    {
        return new MapMakerInternalMap(this);
    }

    public ConcurrentMap makeMap()
    {
        if (!useCustomMap)
            return new ConcurrentHashMap(getInitialCapacity(), 0.75F, getConcurrencyLevel());
        if (nullRemovalCause == null)
            return new MapMakerInternalMap(this);
        else
            return new NullConcurrentMap(this);
    }

    volatile GenericMapMaker maximumSize(int i)
    {
        return maximumSize(i);
    }

    MapMaker maximumSize(int i)
    {
        boolean flag;
        if (maximumSize == -1)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(maximumSize);
        Preconditions.checkState(flag, "maximum size was already set to %s", aobj);
        boolean flag1 = false;
        if (i >= 0)
            flag1 = true;
        Preconditions.checkArgument(flag1, "maximum size must not be negative");
        maximumSize = i;
        useCustomMap = true;
        if (maximumSize == 0)
            nullRemovalCause = RemovalCause.SIZE;
        return this;
    }

    GenericMapMaker removalListener(RemovalListener removallistener)
    {
        boolean flag;
        if (super.removalListener == null)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag);
        super.removalListener = (RemovalListener)Preconditions.checkNotNull(removallistener);
        useCustomMap = true;
        return this;
    }

    MapMaker setKeyStrength(MapMakerInternalMap.Strength strength)
    {
        boolean flag;
        if (keyStrength == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = keyStrength;
        Preconditions.checkState(flag, "Key strength was already set to %s", aobj);
        keyStrength = (MapMakerInternalMap.Strength)Preconditions.checkNotNull(strength);
        if (strength != MapMakerInternalMap.Strength.STRONG)
            useCustomMap = true;
        return this;
    }

    MapMaker setValueStrength(MapMakerInternalMap.Strength strength)
    {
        boolean flag;
        if (valueStrength == null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = valueStrength;
        Preconditions.checkState(flag, "Value strength was already set to %s", aobj);
        valueStrength = (MapMakerInternalMap.Strength)Preconditions.checkNotNull(strength);
        if (strength != MapMakerInternalMap.Strength.STRONG)
            useCustomMap = true;
        return this;
    }

    public volatile GenericMapMaker softKeys()
    {
        return softKeys();
    }

    public MapMaker softKeys()
    {
        return setKeyStrength(MapMakerInternalMap.Strength.SOFT);
    }

    public volatile GenericMapMaker softValues()
    {
        return softValues();
    }

    public MapMaker softValues()
    {
        return setValueStrength(MapMakerInternalMap.Strength.SOFT);
    }

    volatile GenericMapMaker strongKeys()
    {
        return strongKeys();
    }

    MapMaker strongKeys()
    {
        return setKeyStrength(MapMakerInternalMap.Strength.STRONG);
    }

    volatile GenericMapMaker strongValues()
    {
        return strongValues();
    }

    MapMaker strongValues()
    {
        return setValueStrength(MapMakerInternalMap.Strength.STRONG);
    }

    public String toString()
    {
        com.google.common.base.Objects.ToStringHelper tostringhelper = Objects.toStringHelper(this);
        if (initialCapacity != -1)
            tostringhelper.add("initialCapacity", initialCapacity);
        if (concurrencyLevel != -1)
            tostringhelper.add("concurrencyLevel", concurrencyLevel);
        if (maximumSize != -1)
            tostringhelper.add("maximumSize", maximumSize);
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
        if (super.removalListener != null)
            tostringhelper.addValue("removalListener");
        return tostringhelper.toString();
    }

    volatile GenericMapMaker valueEquivalence(Equivalence equivalence)
    {
        return valueEquivalence(equivalence);
    }

    MapMaker valueEquivalence(Equivalence equivalence)
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
        useCustomMap = true;
        return this;
    }

    public volatile GenericMapMaker weakKeys()
    {
        return weakKeys();
    }

    public MapMaker weakKeys()
    {
        return setKeyStrength(MapMakerInternalMap.Strength.WEAK);
    }

    public volatile GenericMapMaker weakValues()
    {
        return weakValues();
    }

    public MapMaker weakValues()
    {
        return setValueStrength(MapMakerInternalMap.Strength.WEAK);
    }
}
