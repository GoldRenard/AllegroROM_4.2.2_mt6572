// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMapFauxverideShim, Ordering, ImmutableList, ImmutableSet, 
//            ImmutableSortedSet, RegularImmutableSortedSet, SortedLists, Iterators, 
//            ImmutableCollection, UnmodifiableIterator, ImmutableMap, TransformedImmutableList

public class ImmutableSortedMap extends ImmutableSortedMapFauxverideShim
    implements SortedMap
{
    public static class Builder extends ImmutableMap.Builder
    {

        private final Comparator comparator;

        public volatile ImmutableMap build()
        {
            return build();
        }

        public ImmutableSortedMap build()
        {
            ImmutableSortedMap.sortEntries(super.entries, comparator);
            ImmutableSortedMap.validateEntries(super.entries, comparator);
            return new ImmutableSortedMap(ImmutableList.copyOf(super.entries), comparator);
        }

        public volatile ImmutableMap.Builder put(Object obj, Object obj1)
        {
            return put(obj, obj1);
        }

        public volatile ImmutableMap.Builder put(java.util.Map.Entry entry)
        {
            return put(entry);
        }

        public Builder put(Object obj, Object obj1)
        {
            super.entries.add(ImmutableMap.entryOf(obj, obj1));
            return this;
        }

        public Builder put(java.util.Map.Entry entry)
        {
            super.put(entry);
            return this;
        }

        public volatile ImmutableMap.Builder putAll(Map map)
        {
            return putAll(map);
        }

        public Builder putAll(Map map)
        {
            java.util.Map.Entry entry;
            for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); put(entry.getKey(), entry.getValue()))
                entry = (java.util.Map.Entry)iterator.next();

            return this;
        }

        public Builder(Comparator comparator1)
        {
            comparator = (Comparator)Preconditions.checkNotNull(comparator1);
        }
    }

    private static class EntrySet extends ImmutableSet
    {

        final transient ImmutableSortedMap map;

        public boolean contains(Object obj)
        {
            boolean flag = obj instanceof java.util.Map.Entry;
            boolean flag1 = false;
            if (flag)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Object obj1 = map.get(entry.getKey());
                flag1 = false;
                if (obj1 != null)
                {
                    boolean flag2 = obj1.equals(entry.getValue());
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
            }
            return flag1;
        }

        boolean isPartialView()
        {
            return map.isPartialView();
        }

        public UnmodifiableIterator iterator()
        {
            return map.entries.iterator();
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return map.size();
        }

        Object writeReplace()
        {
            return new EntrySetSerializedForm(map);
        }

        EntrySet(ImmutableSortedMap immutablesortedmap)
        {
            map = immutablesortedmap;
        }
    }

    private static class EntrySetSerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final ImmutableSortedMap map;

        Object readResolve()
        {
            return map.entrySet();
        }

        EntrySetSerializedForm(ImmutableSortedMap immutablesortedmap)
        {
            map = immutablesortedmap;
        }
    }

    private static class SerializedForm extends ImmutableMap.SerializedForm
    {

        private static final long serialVersionUID;
        private final Comparator comparator;

        Object readResolve()
        {
            return createMap(new Builder(comparator));
        }

        SerializedForm(ImmutableSortedMap immutablesortedmap)
        {
            super(immutablesortedmap);
            comparator = immutablesortedmap.comparator();
        }
    }

    private static class Values extends ImmutableCollection
    {

        private final ImmutableSortedMap map;

        public boolean contains(Object obj)
        {
            return map.containsValue(obj);
        }

        boolean isPartialView()
        {
            return true;
        }

        public UnmodifiableIterator iterator()
        {
            return map.valueIterator();
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return map.size();
        }

        Object writeReplace()
        {
            return new ValuesSerializedForm(map);
        }

        Values(ImmutableSortedMap immutablesortedmap)
        {
            map = immutablesortedmap;
        }
    }

    private static class ValuesSerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final ImmutableSortedMap map;

        Object readResolve()
        {
            return map.values();
        }

        ValuesSerializedForm(ImmutableSortedMap immutablesortedmap)
        {
            map = immutablesortedmap;
        }
    }


    private static final ImmutableSortedMap NATURAL_EMPTY_MAP;
    private static final Comparator NATURAL_ORDER;
    private static final long serialVersionUID;
    private final transient Comparator comparator;
    final transient ImmutableList entries;
    private transient ImmutableSet entrySet;
    private transient ImmutableSortedSet keySet;
    private transient ImmutableCollection values;

    ImmutableSortedMap(ImmutableList immutablelist, Comparator comparator1)
    {
        entries = immutablelist;
        comparator = comparator1;
    }

    public static ImmutableSortedMap copyOf(Map map)
    {
        return copyOfInternal(map, Ordering.natural());
    }

    public static ImmutableSortedMap copyOf(Map map, Comparator comparator1)
    {
        return copyOfInternal(map, (Comparator)Preconditions.checkNotNull(comparator1));
    }

    private static ImmutableSortedMap copyOfInternal(Map map, Comparator comparator1)
    {
        boolean flag = map instanceof SortedMap;
        boolean flag1 = false;
        if (flag)
        {
            Comparator comparator2 = ((SortedMap)map).comparator();
            if (comparator2 == null)
            {
                if (comparator1 == NATURAL_ORDER)
                    flag1 = true;
                else
                    flag1 = false;
            } else
            {
                flag1 = comparator1.equals(comparator2);
            }
        }
        if (flag1 && (map instanceof ImmutableSortedMap))
        {
            ImmutableSortedMap immutablesortedmap = (ImmutableSortedMap)map;
            if (!immutablesortedmap.isPartialView())
                return immutablesortedmap;
        }
        java.util.Map.Entry aentry[] = (java.util.Map.Entry[])map.entrySet().toArray(new java.util.Map.Entry[0]);
        for (int i = 0; i < aentry.length; i++)
        {
            java.util.Map.Entry entry = aentry[i];
            aentry[i] = entryOf(entry.getKey(), entry.getValue());
        }

        List list = Arrays.asList(aentry);
        if (!flag1)
        {
            sortEntries(list, comparator1);
            validateEntries(list, comparator1);
        }
        return new ImmutableSortedMap(ImmutableList.copyOf(list), comparator1);
    }

    public static ImmutableSortedMap copyOfSorted(SortedMap sortedmap)
    {
        Comparator comparator1 = sortedmap.comparator();
        if (comparator1 == null)
            comparator1 = NATURAL_ORDER;
        return copyOfInternal(sortedmap, comparator1);
    }

    private ImmutableSet createEntrySet()
    {
        if (isEmpty())
            return ImmutableSet.of();
        else
            return new EntrySet(this);
    }

    private ImmutableSortedSet createKeySet()
    {
        if (isEmpty())
            return ImmutableSortedSet.emptySet(comparator);
        else
            return new RegularImmutableSortedSet(new TransformedImmutableList(entries) {

                final ImmutableSortedMap this$0;

                volatile Object transform(Object obj)
                {
                    return transform((java.util.Map.Entry)obj);
                }

                Object transform(java.util.Map.Entry entry)
                {
                    return entry.getKey();
                }

            
            {
                this$0 = ImmutableSortedMap.this;
                super(immutablelist);
            }
            }
, comparator);
    }

    private ImmutableSortedMap createSubmap(int i, int j)
    {
        if (i < j)
            return new ImmutableSortedMap(entries.subList(i, j), comparator);
        else
            return emptyMap(comparator);
    }

    private static ImmutableSortedMap emptyMap(Comparator comparator1)
    {
        if (NATURAL_ORDER.equals(comparator1))
            return NATURAL_EMPTY_MAP;
        else
            return new ImmutableSortedMap(ImmutableList.of(), comparator1);
    }

    private int index(Object obj, SortedLists.KeyPresentBehavior keypresentbehavior, SortedLists.KeyAbsentBehavior keyabsentbehavior)
    {
        return SortedLists.binarySearch(keyList(), Preconditions.checkNotNull(obj), unsafeComparator(), keypresentbehavior, keyabsentbehavior);
    }

    private ImmutableList keyList()
    {
        return new TransformedImmutableList(entries) {

            final ImmutableSortedMap this$0;

            volatile Object transform(Object obj)
            {
                return transform((java.util.Map.Entry)obj);
            }

            Object transform(java.util.Map.Entry entry)
            {
                return entry.getKey();
            }

            
            {
                this$0 = ImmutableSortedMap.this;
                super(immutablelist);
            }
        }
;
    }

    public static Builder naturalOrder()
    {
        return new Builder(Ordering.natural());
    }

    public static ImmutableSortedMap of()
    {
        return NATURAL_EMPTY_MAP;
    }

    public static ImmutableSortedMap of(Comparable comparable, Object obj)
    {
        return new ImmutableSortedMap(ImmutableList.of(entryOf(comparable, obj)), Ordering.natural());
    }

    public static ImmutableSortedMap of(Comparable comparable, Object obj, Comparable comparable1, Object obj1)
    {
        return (new Builder(Ordering.natural())).put(comparable, obj).put(comparable1, obj1).build();
    }

    public static ImmutableSortedMap of(Comparable comparable, Object obj, Comparable comparable1, Object obj1, Comparable comparable2, Object obj2)
    {
        return (new Builder(Ordering.natural())).put(comparable, obj).put(comparable1, obj1).put(comparable2, obj2).build();
    }

    public static ImmutableSortedMap of(Comparable comparable, Object obj, Comparable comparable1, Object obj1, Comparable comparable2, Object obj2, Comparable comparable3, Object obj3)
    {
        return (new Builder(Ordering.natural())).put(comparable, obj).put(comparable1, obj1).put(comparable2, obj2).put(comparable3, obj3).build();
    }

    public static ImmutableSortedMap of(Comparable comparable, Object obj, Comparable comparable1, Object obj1, Comparable comparable2, Object obj2, Comparable comparable3, Object obj3, 
            Comparable comparable4, Object obj4)
    {
        return (new Builder(Ordering.natural())).put(comparable, obj).put(comparable1, obj1).put(comparable2, obj2).put(comparable3, obj3).put(comparable4, obj4).build();
    }

    public static Builder orderedBy(Comparator comparator1)
    {
        return new Builder(comparator1);
    }

    public static Builder reverseOrder()
    {
        return new Builder(Ordering.natural().reverse());
    }

    private static void sortEntries(List list, Comparator comparator1)
    {
        Collections.sort(list, new Comparator(comparator1) {

            final Comparator val$comparator;

            public volatile int compare(Object obj, Object obj1)
            {
                return compare((java.util.Map.Entry)obj, (java.util.Map.Entry)obj1);
            }

            public int compare(java.util.Map.Entry entry, java.util.Map.Entry entry1)
            {
                return comparator.compare(entry.getKey(), entry1.getKey());
            }

            
            {
                comparator = comparator1;
                super();
            }
        }
);
    }

    private static void validateEntries(List list, Comparator comparator1)
    {
        for (int i = 1; i < list.size(); i++)
            if (comparator1.compare(((java.util.Map.Entry)list.get(i - 1)).getKey(), ((java.util.Map.Entry)list.get(i)).getKey()) == 0)
                throw new IllegalArgumentException((new StringBuilder()).append("Duplicate keys in mappings ").append(list.get(i - 1)).append(" and ").append(list.get(i)).toString());

    }

    public Comparator comparator()
    {
        return comparator;
    }

    public boolean containsValue(Object obj)
    {
        if (obj == null)
            return false;
        else
            return Iterators.contains(valueIterator(), obj);
    }

    public ImmutableSet entrySet()
    {
        ImmutableSet immutableset = entrySet;
        if (immutableset == null)
        {
            immutableset = createEntrySet();
            entrySet = immutableset;
        }
        return immutableset;
    }

    public volatile Set entrySet()
    {
        return entrySet();
    }

    public Object firstKey()
    {
        if (isEmpty())
            throw new NoSuchElementException();
        else
            return ((java.util.Map.Entry)entries.get(0)).getKey();
    }

    public Object get(Object obj)
    {
        if (obj != null)
        {
            int i;
            try
            {
                i = index(obj, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.INVERTED_INSERTION_INDEX);
            }
            catch (ClassCastException classcastexception)
            {
                return null;
            }
            if (i >= 0)
                return ((java.util.Map.Entry)entries.get(i)).getValue();
        }
        return null;
    }

    public ImmutableSortedMap headMap(Object obj)
    {
        return headMap(obj, false);
    }

    ImmutableSortedMap headMap(Object obj, boolean flag)
    {
        int i;
        if (flag)
            i = 1 + index(obj, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
        else
            i = index(obj, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        return createSubmap(0, i);
    }

    public volatile SortedMap headMap(Object obj)
    {
        return headMap(obj);
    }

    boolean isPartialView()
    {
        return entries.isPartialView();
    }

    public volatile ImmutableSet keySet()
    {
        return keySet();
    }

    public ImmutableSortedSet keySet()
    {
        ImmutableSortedSet immutablesortedset = keySet;
        if (immutablesortedset == null)
        {
            immutablesortedset = createKeySet();
            keySet = immutablesortedset;
        }
        return immutablesortedset;
    }

    public volatile Set keySet()
    {
        return keySet();
    }

    public Object lastKey()
    {
        if (isEmpty())
            throw new NoSuchElementException();
        else
            return ((java.util.Map.Entry)entries.get(-1 + size())).getKey();
    }

    public int size()
    {
        return entries.size();
    }

    public ImmutableSortedMap subMap(Object obj, Object obj1)
    {
        return subMap(obj, true, obj1, false);
    }

    ImmutableSortedMap subMap(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        boolean flag2;
        if (comparator.compare(obj, obj1) <= 0)
            flag2 = true;
        else
            flag2 = false;
        Preconditions.checkArgument(flag2);
        return tailMap(obj, flag).headMap(obj1, flag1);
    }

    public volatile SortedMap subMap(Object obj, Object obj1)
    {
        return subMap(obj, obj1);
    }

    public ImmutableSortedMap tailMap(Object obj)
    {
        return tailMap(obj, true);
    }

    ImmutableSortedMap tailMap(Object obj, boolean flag)
    {
        int i;
        if (flag)
            i = index(obj, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        else
            i = 1 + index(obj, SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
        return createSubmap(i, size());
    }

    public volatile SortedMap tailMap(Object obj)
    {
        return tailMap(obj);
    }

    Comparator unsafeComparator()
    {
        return comparator;
    }

    UnmodifiableIterator valueIterator()
    {
        return new UnmodifiableIterator() {

            final ImmutableSortedMap this$0;
            final UnmodifiableIterator val$entryIterator;

            public boolean hasNext()
            {
                return entryIterator.hasNext();
            }

            public Object next()
            {
                return ((java.util.Map.Entry)entryIterator.next()).getValue();
            }

            
            {
                this$0 = ImmutableSortedMap.this;
                entryIterator = unmodifiableiterator;
                super();
            }
        }
;
    }

    public ImmutableCollection values()
    {
        Object obj = values;
        if (obj == null)
        {
            obj = new Values(this);
            values = ((ImmutableCollection) (obj));
        }
        return ((ImmutableCollection) (obj));
    }

    public volatile Collection values()
    {
        return values();
    }

    Object writeReplace()
    {
        return new SerializedForm(this);
    }

    static 
    {
        NATURAL_ORDER = Ordering.natural();
        NATURAL_EMPTY_MAP = new ImmutableSortedMap(ImmutableList.of(), NATURAL_ORDER);
    }


}
