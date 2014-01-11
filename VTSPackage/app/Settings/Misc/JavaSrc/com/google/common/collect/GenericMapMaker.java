// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.TimeUnit;

// Referenced classes of package com.google.common.collect:
//            MapMakerInternalMap

public abstract class GenericMapMaker
{
    static final class NullListener extends Enum
        implements MapMaker.RemovalListener
    {

        private static final NullListener $VALUES[];
        public static final NullListener INSTANCE;

        public static NullListener valueOf(String s)
        {
            return (NullListener)Enum.valueOf(com/google/common/collect/GenericMapMaker$NullListener, s);
        }

        public static NullListener[] values()
        {
            return (NullListener[])$VALUES.clone();
        }

        public void onRemoval(MapMaker.RemovalNotification removalnotification)
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


    MapMaker.RemovalListener removalListener;


    public abstract GenericMapMaker concurrencyLevel(int i);

    public abstract GenericMapMaker expiration(long l, TimeUnit timeunit);

    abstract GenericMapMaker expireAfterAccess(long l, TimeUnit timeunit);

    abstract GenericMapMaker expireAfterWrite(long l, TimeUnit timeunit);

    MapMaker.RemovalListener getRemovalListener()
    {
        return (MapMaker.RemovalListener)Objects.firstNonNull(removalListener, NullListener.INSTANCE);
    }

    public abstract GenericMapMaker initialCapacity(int i);

    abstract GenericMapMaker keyEquivalence(Equivalence equivalence);

    public abstract ConcurrentMap makeComputingMap(Function function);

    abstract MapMakerInternalMap makeCustomMap();

    public abstract ConcurrentMap makeMap();

    abstract GenericMapMaker maximumSize(int i);

    public abstract GenericMapMaker softKeys();

    public abstract GenericMapMaker softValues();

    abstract GenericMapMaker strongKeys();

    abstract GenericMapMaker strongValues();

    abstract GenericMapMaker valueEquivalence(Equivalence equivalence);

    public abstract GenericMapMaker weakKeys();

    public abstract GenericMapMaker weakValues();
}
