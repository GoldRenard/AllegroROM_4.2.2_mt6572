// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Maps, Ordering, SortedMapDifference

public final class SortedMaps
{
    private static class FilteredSortedMap extends Maps.FilteredEntryMap
        implements SortedMap
    {

        public Comparator comparator()
        {
            return sortedMap().comparator();
        }

        public Object firstKey()
        {
            return keySet().iterator().next();
        }

        public SortedMap headMap(Object obj)
        {
            return new FilteredSortedMap(sortedMap().headMap(obj), super.predicate);
        }

        public Object lastKey()
        {
            SortedMap sortedmap = sortedMap();
            do
            {
                Object obj = sortedmap.lastKey();
                if (apply(obj, super.unfiltered.get(obj)))
                    return obj;
                sortedmap = sortedMap().headMap(obj);
            } while (true);
        }

        SortedMap sortedMap()
        {
            return (SortedMap)super.unfiltered;
        }

        public SortedMap subMap(Object obj, Object obj1)
        {
            return new FilteredSortedMap(sortedMap().subMap(obj, obj1), super.predicate);
        }

        public SortedMap tailMap(Object obj)
        {
            return new FilteredSortedMap(sortedMap().tailMap(obj), super.predicate);
        }

        FilteredSortedMap(SortedMap sortedmap, Predicate predicate)
        {
            super(sortedmap, predicate);
        }
    }


    private SortedMaps()
    {
    }

    public static SortedMapDifference difference(SortedMap sortedmap, Map map)
    {
        return Maps.difference(sortedmap, map);
    }

    public static SortedMap filterEntries(SortedMap sortedmap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        if (sortedmap instanceof FilteredSortedMap)
            return filterFiltered((FilteredSortedMap)sortedmap, predicate);
        else
            return new FilteredSortedMap((SortedMap)Preconditions.checkNotNull(sortedmap), predicate);
    }

    private static SortedMap filterFiltered(FilteredSortedMap filteredsortedmap, Predicate predicate)
    {
        Predicate predicate1 = Predicates.and(((Maps.AbstractFilteredMap) (filteredsortedmap)).predicate, predicate);
        return new FilteredSortedMap(filteredsortedmap.sortedMap(), predicate1);
    }

    public static SortedMap filterKeys(SortedMap sortedmap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        return filterEntries(sortedmap, new Predicate(predicate) {

            final Predicate val$keyPredicate;

            public volatile boolean apply(Object obj)
            {
                return apply((java.util.Map.Entry)obj);
            }

            public boolean apply(java.util.Map.Entry entry)
            {
                return keyPredicate.apply(entry.getKey());
            }

            
            {
                keyPredicate = predicate;
                super();
            }
        }
);
    }

    public static SortedMap filterValues(SortedMap sortedmap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        return filterEntries(sortedmap, new Predicate(predicate) {

            final Predicate val$valuePredicate;

            public volatile boolean apply(Object obj)
            {
                return apply((java.util.Map.Entry)obj);
            }

            public boolean apply(java.util.Map.Entry entry)
            {
                return valuePredicate.apply(entry.getValue());
            }

            
            {
                valuePredicate = predicate;
                super();
            }
        }
);
    }

    static Comparator orNaturalOrder(Comparator comparator)
    {
        if (comparator != null)
            return comparator;
        else
            return Ordering.natural();
    }

    public static SortedMap transformEntries(SortedMap sortedmap, Maps.EntryTransformer entrytransformer)
    {
        return Maps.transformEntries(sortedmap, entrytransformer);
    }

    public static SortedMap transformValues(SortedMap sortedmap, Function function)
    {
        return Maps.transformValues(sortedmap, function);
    }
}
