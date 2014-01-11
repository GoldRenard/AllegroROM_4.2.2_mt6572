// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.util.concurrent.ConcurrentMap;

// Referenced classes of package com.google.common.collect:
//            Interner, MapMaker, GenericMapMaker, MapMakerInternalMap

public final class Interners
{
    private static class CustomInterner
        implements Interner
    {

        private final MapMakerInternalMap map;

        public Object intern(Object obj)
        {
            do
            {
                MapMakerInternalMap.ReferenceEntry referenceentry = map.getEntry(obj);
                if (referenceentry != null)
                {
                    Object obj1 = referenceentry.getKey();
                    if (obj1 != null)
                        return obj1;
                }
            } while ((Dummy)map.putIfAbsent(obj, Dummy.VALUE) != null);
            return obj;
        }

        CustomInterner(GenericMapMaker genericmapmaker)
        {
            map = genericmapmaker.strongValues().keyEquivalence(Equivalences.equals()).makeCustomMap();
        }
    }

    private static final class CustomInterner.Dummy extends Enum
    {

        private static final CustomInterner.Dummy $VALUES[];
        public static final CustomInterner.Dummy VALUE;

        public static CustomInterner.Dummy valueOf(String s)
        {
            return (CustomInterner.Dummy)Enum.valueOf(com/google/common/collect/Interners$CustomInterner$Dummy, s);
        }

        public static CustomInterner.Dummy[] values()
        {
            return (CustomInterner.Dummy[])$VALUES.clone();
        }

        static 
        {
            VALUE = new CustomInterner.Dummy("VALUE", 0);
            CustomInterner.Dummy adummy[] = new CustomInterner.Dummy[1];
            adummy[0] = VALUE;
            $VALUES = adummy;
        }

        private CustomInterner.Dummy(String s, int i)
        {
            super(s, i);
        }
    }

    private static class InternerFunction
        implements Function
    {

        private final Interner interner;

        public Object apply(Object obj)
        {
            return interner.intern(obj);
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof InternerFunction)
            {
                InternerFunction internerfunction = (InternerFunction)obj;
                return interner.equals(internerfunction.interner);
            } else
            {
                return false;
            }
        }

        public int hashCode()
        {
            return interner.hashCode();
        }

        public InternerFunction(Interner interner1)
        {
            interner = interner1;
        }
    }


    private Interners()
    {
    }

    public static Function asFunction(Interner interner)
    {
        return new InternerFunction((Interner)Preconditions.checkNotNull(interner));
    }

    public static Interner newStrongInterner()
    {
        return new Interner((new MapMaker()).makeMap()) {

            final ConcurrentMap val$map;

            public Object intern(Object obj)
            {
                Object obj1 = map.putIfAbsent(Preconditions.checkNotNull(obj), obj);
                if (obj1 == null)
                    return obj;
                else
                    return obj1;
            }

            
            {
                map = concurrentmap;
                super();
            }
        }
;
    }

    public static Interner newWeakInterner()
    {
        return new CustomInterner((new MapMaker()).weakKeys());
    }
}
