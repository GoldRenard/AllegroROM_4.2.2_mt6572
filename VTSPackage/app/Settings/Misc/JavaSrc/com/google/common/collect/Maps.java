// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.Serializable;
import java.util.*;
import java.util.concurrent.ConcurrentMap;

// Referenced classes of package com.google.common.collect:
//            Collections2, ImmutableMap, Sets, ImmutableEntry, 
//            MapMaker, Ordering, Synchronized, MapDifference, 
//            SortedMapDifference, BiMap, Lists, UnmodifiableIterator, 
//            ForwardingSet, ForwardingMapEntry, AbstractMapEntry, Iterators, 
//            ForwardingMap, ForwardingCollection, ForwardingIterator

public final class Maps
{
    private static abstract class AbstractFilteredMap extends AbstractMap
    {

        final Predicate predicate;
        final Map unfiltered;
        Collection values;

        boolean apply(Object obj, Object obj1)
        {
            return predicate.apply(Maps.immutableEntry(obj, obj1));
        }

        public boolean containsKey(Object obj)
        {
            return unfiltered.containsKey(obj) && apply(obj, unfiltered.get(obj));
        }

        public Object get(Object obj)
        {
            Object obj1 = unfiltered.get(obj);
            if (obj1 != null && apply(obj, obj1))
                return obj1;
            else
                return null;
        }

        public boolean isEmpty()
        {
            return entrySet().isEmpty();
        }

        public Object put(Object obj, Object obj1)
        {
            Preconditions.checkArgument(apply(obj, obj1));
            return unfiltered.put(obj, obj1);
        }

        public void putAll(Map map)
        {
            java.util.Map.Entry entry;
            for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); Preconditions.checkArgument(apply(entry.getKey(), entry.getValue())))
                entry = (java.util.Map.Entry)iterator.next();

            unfiltered.putAll(map);
        }

        public Object remove(Object obj)
        {
            if (containsKey(obj))
                return unfiltered.remove(obj);
            else
                return null;
        }

        public Collection values()
        {
            Object obj = values;
            if (obj == null)
            {
                obj = new Values();
                values = ((Collection) (obj));
            }
            return ((Collection) (obj));
        }

        AbstractFilteredMap(Map map, Predicate predicate1)
        {
            unfiltered = map;
            predicate = predicate1;
        }
    }

    class AbstractFilteredMap.Values extends AbstractCollection
    {

        final AbstractFilteredMap this$0;

        public void clear()
        {
            entrySet().clear();
        }

        public boolean isEmpty()
        {
            return entrySet().isEmpty();
        }

        public Iterator iterator()
        {
            return entrySet().iterator(). new UnmodifiableIterator() {

                final AbstractFilteredMap.Values this$1;
                final Iterator val$entryIterator;

                public boolean hasNext()
                {
                    return entryIterator.hasNext();
                }

                public Object next()
                {
                    return ((java.util.Map.Entry)entryIterator.next()).getValue();
                }

            
            {
                this$1 = final_values;
                entryIterator = Iterator.this;
                super();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            for (Iterator iterator1 = unfiltered.entrySet().iterator(); iterator1.hasNext();)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                if (Objects.equal(obj, entry.getValue()) && predicate.apply(entry))
                {
                    iterator1.remove();
                    return true;
                }
            }

            return false;
        }

        public boolean removeAll(Collection collection)
        {
            Preconditions.checkNotNull(collection);
            boolean flag = false;
            Iterator iterator1 = unfiltered.entrySet().iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                if (collection.contains(entry.getValue()) && predicate.apply(entry))
                {
                    iterator1.remove();
                    flag = true;
                }
            } while (true);
            return flag;
        }

        public boolean retainAll(Collection collection)
        {
            Preconditions.checkNotNull(collection);
            boolean flag = false;
            Iterator iterator1 = unfiltered.entrySet().iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                if (!collection.contains(entry.getValue()) && predicate.apply(entry))
                {
                    iterator1.remove();
                    flag = true;
                }
            } while (true);
            return flag;
        }

        public int size()
        {
            return entrySet().size();
        }

        public Object[] toArray()
        {
            return Lists.newArrayList(iterator()).toArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return Lists.newArrayList(iterator()).toArray(aobj);
        }

        AbstractFilteredMap.Values()
        {
            this$0 = AbstractFilteredMap.this;
            super();
        }
    }

    static abstract class EntrySet extends AbstractSet
    {

        public void clear()
        {
            map().clear();
        }

        public boolean contains(Object obj)
        {
            boolean flag1;
label0:
            {
                boolean flag = obj instanceof java.util.Map.Entry;
                flag1 = false;
                if (!flag)
                    break label0;
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Object obj1 = entry.getKey();
                Object obj2 = map().get(obj1);
                boolean flag2 = Objects.equal(obj2, entry.getValue());
                flag1 = false;
                if (!flag2)
                    break label0;
                if (obj2 == null)
                {
                    boolean flag3 = map().containsKey(obj1);
                    flag1 = false;
                    if (!flag3)
                        break label0;
                }
                flag1 = true;
            }
            return flag1;
        }

        public boolean isEmpty()
        {
            return map().isEmpty();
        }

        abstract Map map();

        public boolean remove(Object obj)
        {
            if (contains(obj))
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                return map().keySet().remove(entry.getKey());
            } else
            {
                return false;
            }
        }

        public boolean removeAll(Collection collection)
        {
            boolean flag1 = super.removeAll((Collection)Preconditions.checkNotNull(collection));
            boolean flag = flag1;
_L2:
            return flag;
            UnsupportedOperationException unsupportedoperationexception;
            unsupportedoperationexception;
            flag = true;
            Iterator iterator = collection.iterator();
            while (iterator.hasNext()) 
                flag |= remove(iterator.next());
            if (true) goto _L2; else goto _L1
_L1:
        }

        public boolean retainAll(Collection collection)
        {
            boolean flag;
            try
            {
                flag = super.retainAll((Collection)Preconditions.checkNotNull(collection));
            }
            catch (UnsupportedOperationException unsupportedoperationexception)
            {
                java.util.HashSet hashset = Sets.newHashSetWithExpectedSize(collection.size());
                Iterator iterator = collection.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    Object obj = iterator.next();
                    if (contains(obj))
                        hashset.add(((java.util.Map.Entry)obj).getKey());
                } while (true);
                return map().keySet().retainAll(hashset);
            }
            return flag;
        }

        public int size()
        {
            return map().size();
        }

    }

    public static interface EntryTransformer
    {

        public abstract Object transformEntry(Object obj, Object obj1);
    }

    static class FilteredEntryMap extends AbstractFilteredMap
    {

        Set entrySet;
        final Set filteredEntrySet;
        Set keySet;

        public Set entrySet()
        {
            Object obj = entrySet;
            if (obj == null)
            {
                obj = new EntrySet();
                entrySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public Set keySet()
        {
            Object obj = keySet;
            if (obj == null)
            {
                obj = new KeySet();
                keySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        FilteredEntryMap(Map map, Predicate predicate)
        {
            super(map, predicate);
            filteredEntrySet = Sets.filter(map.entrySet(), super.predicate);
        }
    }

    private class FilteredEntryMap.EntrySet extends ForwardingSet
    {

        final FilteredEntryMap this$0;

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Set _mthdelegate()
        {
            return filteredEntrySet;
        }

        public Iterator iterator()
        {
            return filteredEntrySet.iterator(). new UnmodifiableIterator() {

                final FilteredEntryMap.EntrySet this$1;
                final Iterator val$iterator;

                public boolean hasNext()
                {
                    return iterator.hasNext();
                }

                public volatile Object next()
                {
                    return next();
                }

                public java.util.Map.Entry next()
                {
                    return ((java.util.Map.Entry)iterator.next()). new ForwardingMapEntry() {

                        final FilteredEntryMap.EntrySet._cls1 this$2;
                        final java.util.Map.Entry val$entry;

                        protected volatile Object _mthdelegate()
                        {
                            return _mthdelegate();
                        }

                        protected java.util.Map.Entry _mthdelegate()
                        {
                            return entry;
                        }

                        public Object setValue(Object obj)
                        {
                            Preconditions.checkArgument(apply(entry.getKey(), obj));
                            return super.setValue(obj);
                        }

            
            {
                this$2 = final__pcls1;
                entry = java.util.Map.Entry.this;
                super();
            }
                    }
;
                }

            
            {
                this$1 = final_entryset;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        private FilteredEntryMap.EntrySet()
        {
            this$0 = FilteredEntryMap.this;
            super();
        }

    }

    private class FilteredEntryMap.KeySet extends AbstractSet
    {

        final FilteredEntryMap this$0;

        public void clear()
        {
            filteredEntrySet.clear();
        }

        public boolean contains(Object obj)
        {
            return containsKey(obj);
        }

        public Iterator iterator()
        {
            return filteredEntrySet.iterator(). new UnmodifiableIterator() {

                final FilteredEntryMap.KeySet this$1;
                final Iterator val$iterator;

                public boolean hasNext()
                {
                    return iterator.hasNext();
                }

                public Object next()
                {
                    return ((java.util.Map.Entry)iterator.next()).getKey();
                }

            
            {
                this$1 = final_keyset;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            if (containsKey(obj))
            {
                unfiltered.remove(obj);
                return true;
            } else
            {
                return false;
            }
        }

        public boolean removeAll(Collection collection)
        {
            Preconditions.checkNotNull(collection);
            boolean flag = false;
            for (Iterator iterator1 = collection.iterator(); iterator1.hasNext();)
                flag |= remove(iterator1.next());

            return flag;
        }

        public boolean retainAll(Collection collection)
        {
            Preconditions.checkNotNull(collection);
            boolean flag = false;
            Iterator iterator1 = unfiltered.entrySet().iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                if (!collection.contains(entry.getKey()) && predicate.apply(entry))
                {
                    iterator1.remove();
                    flag = true;
                }
            } while (true);
            return flag;
        }

        public int size()
        {
            return filteredEntrySet.size();
        }

        public Object[] toArray()
        {
            return Lists.newArrayList(iterator()).toArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return Lists.newArrayList(iterator()).toArray(aobj);
        }

        private FilteredEntryMap.KeySet()
        {
            this$0 = FilteredEntryMap.this;
            super();
        }

    }

    private static class FilteredEntrySortedMap extends FilteredEntryMap
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
            return new FilteredEntrySortedMap(sortedMap().headMap(obj), super.predicate);
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
            return new FilteredEntrySortedMap(sortedMap().subMap(obj, obj1), super.predicate);
        }

        public SortedMap tailMap(Object obj)
        {
            return new FilteredEntrySortedMap(sortedMap().tailMap(obj), super.predicate);
        }

        FilteredEntrySortedMap(SortedMap sortedmap, Predicate predicate)
        {
            super(sortedmap, predicate);
        }
    }

    private static class FilteredKeyMap extends AbstractFilteredMap
    {

        Set entrySet;
        Predicate keyPredicate;
        Set keySet;

        public boolean containsKey(Object obj)
        {
            return super.unfiltered.containsKey(obj) && keyPredicate.apply(obj);
        }

        public Set entrySet()
        {
            Set set = entrySet;
            if (set == null)
            {
                set = Sets.filter(super.unfiltered.entrySet(), super.predicate);
                entrySet = set;
            }
            return set;
        }

        public Set keySet()
        {
            Set set = keySet;
            if (set == null)
            {
                set = Sets.filter(super.unfiltered.keySet(), keyPredicate);
                keySet = set;
            }
            return set;
        }

        FilteredKeyMap(Map map, Predicate predicate, Predicate predicate1)
        {
            super(map, predicate1);
            keyPredicate = predicate;
        }
    }

    static abstract class ImprovedAbstractMap extends AbstractMap
    {

        private Set entrySet;
        private Set keySet;
        private Collection values;

        protected abstract Set createEntrySet();

        public Set entrySet()
        {
            Set set = entrySet;
            if (set == null)
            {
                set = createEntrySet();
                entrySet = set;
            }
            return set;
        }

        public boolean isEmpty()
        {
            return entrySet().isEmpty();
        }

        public Set keySet()
        {
            Object obj = keySet;
            if (obj == null)
            {
                obj = new KeySet() {

                    final ImprovedAbstractMap this$0;

                    Map map()
                    {
                        return ImprovedAbstractMap.this;
                    }

            
            {
                this$0 = ImprovedAbstractMap.this;
                super();
            }
                }
;
                keySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public Collection values()
        {
            Object obj = values;
            if (obj == null)
            {
                obj = new Values() {

                    final ImprovedAbstractMap this$0;

                    Map map()
                    {
                        return ImprovedAbstractMap.this;
                    }

            
            {
                this$0 = ImprovedAbstractMap.this;
                super();
            }
                }
;
                values = ((Collection) (obj));
            }
            return ((Collection) (obj));
        }

    }

    static abstract class KeySet extends AbstractSet
    {

        public void clear()
        {
            map().clear();
        }

        public boolean contains(Object obj)
        {
            return map().containsKey(obj);
        }

        public boolean isEmpty()
        {
            return map().isEmpty();
        }

        public Iterator iterator()
        {
            return Iterators.transform(map().entrySet().iterator(), new Function() {

                final KeySet this$0;

                public volatile Object apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public Object apply(java.util.Map.Entry entry)
                {
                    return entry.getKey();
                }

            
            {
                this$0 = KeySet.this;
                super();
            }
            }
);
        }

        abstract Map map();

        public boolean remove(Object obj)
        {
            if (contains(obj))
            {
                map().remove(obj);
                return true;
            } else
            {
                return false;
            }
        }

        public boolean removeAll(Collection collection)
        {
            return super.removeAll((Collection)Preconditions.checkNotNull(collection));
        }

        public int size()
        {
            return map().size();
        }

    }

    static class MapDifferenceImpl
        implements MapDifference
    {

        final boolean areEqual;
        final Map differences;
        final Map onBoth;
        final Map onlyOnLeft;
        final Map onlyOnRight;

        public boolean areEqual()
        {
            return areEqual;
        }

        public Map entriesDiffering()
        {
            return differences;
        }

        public Map entriesInCommon()
        {
            return onBoth;
        }

        public Map entriesOnlyOnLeft()
        {
            return onlyOnLeft;
        }

        public Map entriesOnlyOnRight()
        {
            return onlyOnRight;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof MapDifference))
                        break label0;
                    MapDifference mapdifference = (MapDifference)obj;
                    if (!entriesOnlyOnLeft().equals(mapdifference.entriesOnlyOnLeft()) || !entriesOnlyOnRight().equals(mapdifference.entriesOnlyOnRight()) || !entriesInCommon().equals(mapdifference.entriesInCommon()) || !entriesDiffering().equals(mapdifference.entriesDiffering()))
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[4];
            aobj[0] = entriesOnlyOnLeft();
            aobj[1] = entriesOnlyOnRight();
            aobj[2] = entriesInCommon();
            aobj[3] = entriesDiffering();
            return Objects.hashCode(aobj);
        }

        public String toString()
        {
            if (areEqual)
                return "equal";
            StringBuilder stringbuilder = new StringBuilder("not equal");
            if (!onlyOnLeft.isEmpty())
                stringbuilder.append(": only on left=").append(onlyOnLeft);
            if (!onlyOnRight.isEmpty())
                stringbuilder.append(": only on right=").append(onlyOnRight);
            if (!differences.isEmpty())
                stringbuilder.append(": value differences=").append(differences);
            return stringbuilder.toString();
        }

        MapDifferenceImpl(boolean flag, Map map, Map map1, Map map2, Map map3)
        {
            areEqual = flag;
            onlyOnLeft = map;
            onlyOnRight = map1;
            onBoth = map2;
            differences = map3;
        }
    }

    static class SortedMapDifferenceImpl extends MapDifferenceImpl
        implements SortedMapDifference
    {

        public volatile Map entriesDiffering()
        {
            return entriesDiffering();
        }

        public SortedMap entriesDiffering()
        {
            return (SortedMap)super.entriesDiffering();
        }

        public volatile Map entriesInCommon()
        {
            return entriesInCommon();
        }

        public SortedMap entriesInCommon()
        {
            return (SortedMap)super.entriesInCommon();
        }

        public volatile Map entriesOnlyOnLeft()
        {
            return entriesOnlyOnLeft();
        }

        public SortedMap entriesOnlyOnLeft()
        {
            return (SortedMap)super.entriesOnlyOnLeft();
        }

        public volatile Map entriesOnlyOnRight()
        {
            return entriesOnlyOnRight();
        }

        public SortedMap entriesOnlyOnRight()
        {
            return (SortedMap)super.entriesOnlyOnRight();
        }

        SortedMapDifferenceImpl(boolean flag, SortedMap sortedmap, SortedMap sortedmap1, SortedMap sortedmap2, SortedMap sortedmap3)
        {
            super(flag, sortedmap, sortedmap1, sortedmap2, sortedmap3);
        }
    }

    static class TransformedEntriesMap extends AbstractMap
    {

        Set entrySet;
        final Map fromMap;
        final EntryTransformer transformer;
        Collection values;

        public void clear()
        {
            fromMap.clear();
        }

        public boolean containsKey(Object obj)
        {
            return fromMap.containsKey(obj);
        }

        public Set entrySet()
        {
            Object obj = entrySet;
            if (obj == null)
            {
                obj = new EntrySet() {

                    final TransformedEntriesMap this$0;

                    public Iterator iterator()
                    {
                        return Iterators.transform(fromMap.entrySet().iterator(), new Function() {

                            final TransformedEntriesMap._cls1 this$1;

                            public volatile Object apply(Object obj)
                            {
                                return apply((java.util.Map.Entry)obj);
                            }

                            public java.util.Map.Entry apply(java.util.Map.Entry entry)
                            {
                                return Maps.immutableEntry(entry.getKey(), transformer.transformEntry(entry.getKey(), entry.getValue()));
                            }

            
            {
                this$1 = TransformedEntriesMap._cls1.this;
                super();
            }
                        }
);
                    }

                    Map map()
                    {
                        return TransformedEntriesMap.this;
                    }

            
            {
                this$0 = TransformedEntriesMap.this;
                super();
            }
                }
;
                entrySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public Object get(Object obj)
        {
            Object obj1 = fromMap.get(obj);
            if (obj1 == null && !fromMap.containsKey(obj))
                return null;
            else
                return transformer.transformEntry(obj, obj1);
        }

        public Set keySet()
        {
            return fromMap.keySet();
        }

        public Object remove(Object obj)
        {
            if (fromMap.containsKey(obj))
                return transformer.transformEntry(obj, fromMap.remove(obj));
            else
                return null;
        }

        public int size()
        {
            return fromMap.size();
        }

        public Collection values()
        {
            Object obj = values;
            if (obj == null)
            {
                obj = new Values() {

                    final TransformedEntriesMap this$0;

                    Map map()
                    {
                        return TransformedEntriesMap.this;
                    }

            
            {
                this$0 = TransformedEntriesMap.this;
                super();
            }
                }
;
                values = ((Collection) (obj));
            }
            return ((Collection) (obj));
        }

        TransformedEntriesMap(Map map, EntryTransformer entrytransformer)
        {
            fromMap = (Map)Preconditions.checkNotNull(map);
            transformer = (EntryTransformer)Preconditions.checkNotNull(entrytransformer);
        }
    }

    static class TransformedEntriesSortedMap extends TransformedEntriesMap
        implements SortedMap
    {

        public Comparator comparator()
        {
            return fromMap().comparator();
        }

        public Object firstKey()
        {
            return fromMap().firstKey();
        }

        protected SortedMap fromMap()
        {
            return (SortedMap)super.fromMap;
        }

        public SortedMap headMap(Object obj)
        {
            return Maps.transformEntries(fromMap().headMap(obj), super.transformer);
        }

        public Object lastKey()
        {
            return fromMap().lastKey();
        }

        public SortedMap subMap(Object obj, Object obj1)
        {
            return Maps.transformEntries(fromMap().subMap(obj, obj1), super.transformer);
        }

        public SortedMap tailMap(Object obj)
        {
            return Maps.transformEntries(fromMap().tailMap(obj), super.transformer);
        }

        TransformedEntriesSortedMap(SortedMap sortedmap, EntryTransformer entrytransformer)
        {
            super(sortedmap, entrytransformer);
        }
    }

    private static class UnmodifiableBiMap extends ForwardingMap
        implements BiMap, Serializable
    {

        private static final long serialVersionUID;
        final BiMap _flddelegate;
        transient BiMap inverse;
        final Map unmodifiableMap;
        transient Set values;

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Map _mthdelegate()
        {
            return unmodifiableMap;
        }

        public Object forcePut(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public BiMap inverse()
        {
            Object obj = inverse;
            if (obj == null)
            {
                obj = new UnmodifiableBiMap(_flddelegate.inverse(), this);
                inverse = ((BiMap) (obj));
            }
            return ((BiMap) (obj));
        }

        public volatile Collection values()
        {
            return values();
        }

        public Set values()
        {
            Set set = values;
            if (set == null)
            {
                set = Collections.unmodifiableSet(_flddelegate.values());
                values = set;
            }
            return set;
        }

        UnmodifiableBiMap(BiMap bimap, BiMap bimap1)
        {
            unmodifiableMap = Collections.unmodifiableMap(bimap);
            _flddelegate = bimap;
            inverse = bimap1;
        }
    }

    static class UnmodifiableEntries extends ForwardingCollection
    {

        private final Collection entries;

        public volatile boolean add(Object obj)
        {
            return add((java.util.Map.Entry)obj);
        }

        public boolean add(java.util.Map.Entry entry)
        {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public void clear()
        {
            throw new UnsupportedOperationException();
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Collection _mthdelegate()
        {
            return entries;
        }

        public Iterator iterator()
        {
            return super.iterator(). new ForwardingIterator() {

                final UnmodifiableEntries this$0;
                final Iterator val$delegate;

                protected volatile Object _mthdelegate()
                {
                    return _mthdelegate();
                }

                protected Iterator _mthdelegate()
                {
                    return delegate;
                }

                public volatile Object next()
                {
                    return next();
                }

                public java.util.Map.Entry next()
                {
                    return Maps.unmodifiableEntry((java.util.Map.Entry)super.next());
                }

                public void remove()
                {
                    throw new UnsupportedOperationException();
                }

            
            {
                this$0 = final_unmodifiableentries;
                delegate = Iterator.this;
                super();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public boolean removeAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public boolean retainAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public Object[] toArray()
        {
            return standardToArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return standardToArray(aobj);
        }

        UnmodifiableEntries(Collection collection)
        {
            entries = collection;
        }
    }

    static class UnmodifiableEntrySet extends UnmodifiableEntries
        implements Set
    {

        public boolean equals(Object obj)
        {
            return Sets.equalsImpl(this, obj);
        }

        public int hashCode()
        {
            return Sets.hashCodeImpl(this);
        }

        UnmodifiableEntrySet(Set set)
        {
            super(set);
        }
    }

    static class ValueDifferenceImpl
        implements MapDifference.ValueDifference
    {

        private final Object left;
        private final Object right;

        static MapDifference.ValueDifference create(Object obj, Object obj1)
        {
            return new ValueDifferenceImpl(obj, obj1);
        }

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof MapDifference.ValueDifference;
            boolean flag1 = false;
            if (flag)
            {
                MapDifference.ValueDifference valuedifference = (MapDifference.ValueDifference)obj;
                boolean flag2 = Objects.equal(left, valuedifference.leftValue());
                flag1 = false;
                if (flag2)
                {
                    boolean flag3 = Objects.equal(right, valuedifference.rightValue());
                    flag1 = false;
                    if (flag3)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[2];
            aobj[0] = left;
            aobj[1] = right;
            return Objects.hashCode(aobj);
        }

        public Object leftValue()
        {
            return left;
        }

        public Object rightValue()
        {
            return right;
        }

        public String toString()
        {
            return (new StringBuilder()).append("(").append(left).append(", ").append(right).append(")").toString();
        }

        private ValueDifferenceImpl(Object obj, Object obj1)
        {
            left = obj;
            right = obj1;
        }
    }

    static abstract class Values extends AbstractCollection
    {

        public void clear()
        {
            map().clear();
        }

        public boolean contains(Object obj)
        {
            return map().containsValue(obj);
        }

        public boolean isEmpty()
        {
            return map().isEmpty();
        }

        public Iterator iterator()
        {
            return Iterators.transform(map().entrySet().iterator(), new Function() {

                final Values this$0;

                public volatile Object apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public Object apply(java.util.Map.Entry entry)
                {
                    return entry.getValue();
                }

            
            {
                this$0 = Values.this;
                super();
            }
            }
);
        }

        abstract Map map();

        public boolean remove(Object obj)
        {
            boolean flag;
            try
            {
                flag = super.remove(obj);
            }
            catch (UnsupportedOperationException unsupportedoperationexception)
            {
                for (Iterator iterator1 = map().entrySet().iterator(); iterator1.hasNext();)
                {
                    java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                    if (Objects.equal(obj, entry.getValue()))
                    {
                        map().remove(entry.getKey());
                        return true;
                    }
                }

                return false;
            }
            return flag;
        }

        public boolean removeAll(Collection collection)
        {
            boolean flag;
            try
            {
                flag = super.removeAll((Collection)Preconditions.checkNotNull(collection));
            }
            catch (UnsupportedOperationException unsupportedoperationexception)
            {
                java.util.HashSet hashset = Sets.newHashSet();
                Iterator iterator1 = map().entrySet().iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                    if (collection.contains(entry.getValue()))
                        hashset.add(entry.getKey());
                } while (true);
                return map().keySet().removeAll(hashset);
            }
            return flag;
        }

        public boolean retainAll(Collection collection)
        {
            boolean flag;
            try
            {
                flag = super.retainAll((Collection)Preconditions.checkNotNull(collection));
            }
            catch (UnsupportedOperationException unsupportedoperationexception)
            {
                java.util.HashSet hashset = Sets.newHashSet();
                Iterator iterator1 = map().entrySet().iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    java.util.Map.Entry entry = (java.util.Map.Entry)iterator1.next();
                    if (collection.contains(entry.getValue()))
                        hashset.add(entry.getKey());
                } while (true);
                return map().keySet().retainAll(hashset);
            }
            return flag;
        }

        public int size()
        {
            return map().size();
        }

    }


    static final com.google.common.base.Joiner.MapJoiner STANDARD_JOINER;

    private Maps()
    {
    }

    static int capacity(int i)
    {
        if (i < 3)
        {
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            return i + 1;
        }
        if (i < 0x40000000)
            return i + i / 3;
        else
            return 0x7fffffff;
    }

    static boolean containsEntryImpl(Collection collection, Object obj)
    {
        if (!(obj instanceof java.util.Map.Entry))
            return false;
        else
            return collection.contains(unmodifiableEntry((java.util.Map.Entry)obj));
    }

    static boolean containsKeyImpl(Map map, Object obj)
    {
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
            if (Objects.equal(((java.util.Map.Entry)iterator.next()).getKey(), obj))
                return true;

        return false;
    }

    static boolean containsValueImpl(Map map, Object obj)
    {
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
            if (Objects.equal(((java.util.Map.Entry)iterator.next()).getValue(), obj))
                return true;

        return false;
    }

    public static MapDifference difference(Map map, Map map1)
    {
        if (map instanceof SortedMap)
            return difference((SortedMap)map, map1);
        else
            return difference(map, map1, Equivalences.equals());
    }

    public static MapDifference difference(Map map, Map map1, Equivalence equivalence)
    {
        Preconditions.checkNotNull(equivalence);
        HashMap hashmap = newHashMap();
        HashMap hashmap1 = new HashMap(map1);
        HashMap hashmap2 = newHashMap();
        HashMap hashmap3 = newHashMap();
        boolean flag = true;
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            Object obj = entry.getKey();
            Object obj1 = entry.getValue();
            if (map1.containsKey(obj))
            {
                Object obj2 = hashmap1.remove(obj);
                if (equivalence.equivalent(obj1, obj2))
                {
                    hashmap2.put(obj, obj1);
                } else
                {
                    hashmap3.put(obj, ValueDifferenceImpl.create(obj1, obj2));
                    flag = false;
                }
            } else
            {
                hashmap.put(obj, obj1);
                flag = false;
            }
        }

        boolean flag1;
        if (flag && hashmap1.isEmpty())
            flag1 = true;
        else
            flag1 = false;
        return mapDifference(flag1, hashmap, hashmap1, hashmap2, hashmap3);
    }

    public static SortedMapDifference difference(SortedMap sortedmap, Map map)
    {
        Preconditions.checkNotNull(sortedmap);
        Preconditions.checkNotNull(map);
        Comparator comparator = orNaturalOrder(sortedmap.comparator());
        TreeMap treemap = newTreeMap(comparator);
        TreeMap treemap1 = newTreeMap(comparator);
        treemap1.putAll(map);
        TreeMap treemap2 = newTreeMap(comparator);
        TreeMap treemap3 = newTreeMap(comparator);
        boolean flag = true;
        for (Iterator iterator = sortedmap.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            Object obj = entry.getKey();
            Object obj1 = entry.getValue();
            if (map.containsKey(obj))
            {
                Object obj2 = treemap1.remove(obj);
                if (Objects.equal(obj1, obj2))
                {
                    treemap2.put(obj, obj1);
                } else
                {
                    treemap3.put(obj, ValueDifferenceImpl.create(obj1, obj2));
                    flag = false;
                }
            } else
            {
                treemap.put(obj, obj1);
                flag = false;
            }
        }

        boolean flag1;
        if (flag && treemap1.isEmpty())
            flag1 = true;
        else
            flag1 = false;
        return sortedMapDifference(flag1, treemap, treemap1, treemap2, treemap3);
    }

    static boolean equalsImpl(Map map, Object obj)
    {
        if (map == obj)
            return true;
        if (obj instanceof Map)
        {
            Map map1 = (Map)obj;
            return map.entrySet().equals(map1.entrySet());
        } else
        {
            return false;
        }
    }

    public static Map filterEntries(Map map, Predicate predicate)
    {
        if (map instanceof SortedMap)
            return filterEntries((SortedMap)map, predicate);
        Preconditions.checkNotNull(predicate);
        if (map instanceof AbstractFilteredMap)
            return filterFiltered((AbstractFilteredMap)map, predicate);
        else
            return new FilteredEntryMap((Map)Preconditions.checkNotNull(map), predicate);
    }

    public static SortedMap filterEntries(SortedMap sortedmap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        if (sortedmap instanceof FilteredEntrySortedMap)
            return filterFiltered((FilteredEntrySortedMap)sortedmap, predicate);
        else
            return new FilteredEntrySortedMap((SortedMap)Preconditions.checkNotNull(sortedmap), predicate);
    }

    private static Map filterFiltered(AbstractFilteredMap abstractfilteredmap, Predicate predicate)
    {
        Predicate predicate1 = Predicates.and(abstractfilteredmap.predicate, predicate);
        return new FilteredEntryMap(abstractfilteredmap.unfiltered, predicate1);
    }

    private static SortedMap filterFiltered(FilteredEntrySortedMap filteredentrysortedmap, Predicate predicate)
    {
        Predicate predicate1 = Predicates.and(((AbstractFilteredMap) (filteredentrysortedmap)).predicate, predicate);
        return new FilteredEntrySortedMap(filteredentrysortedmap.sortedMap(), predicate1);
    }

    public static Map filterKeys(Map map, Predicate predicate)
    {
        if (map instanceof SortedMap)
            return filterKeys((SortedMap)map, predicate);
        Preconditions.checkNotNull(predicate);
        Predicate predicate1 = new Predicate(predicate) {

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
;
        if (map instanceof AbstractFilteredMap)
            return filterFiltered((AbstractFilteredMap)map, predicate1);
        else
            return new FilteredKeyMap((Map)Preconditions.checkNotNull(map), predicate, predicate1);
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

    public static Map filterValues(Map map, Predicate predicate)
    {
        if (map instanceof SortedMap)
        {
            return filterValues((SortedMap)map, predicate);
        } else
        {
            Preconditions.checkNotNull(predicate);
            return filterEntries(map, new Predicate(predicate) {

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

    public static ImmutableMap fromProperties(Properties properties)
    {
        ImmutableMap.Builder builder = ImmutableMap.builder();
        String s;
        for (Enumeration enumeration = properties.propertyNames(); enumeration.hasMoreElements(); builder.put(s, properties.getProperty(s)))
            s = (String)enumeration.nextElement();

        return builder.build();
    }

    static int hashCodeImpl(Map map)
    {
        return Sets.hashCodeImpl(map.entrySet());
    }

    public static java.util.Map.Entry immutableEntry(Object obj, Object obj1)
    {
        return new ImmutableEntry(obj, obj1);
    }

    private static MapDifference mapDifference(boolean flag, Map map, Map map1, Map map2, Map map3)
    {
        return new MapDifferenceImpl(flag, Collections.unmodifiableMap(map), Collections.unmodifiableMap(map1), Collections.unmodifiableMap(map2), Collections.unmodifiableMap(map3));
    }

    public static ConcurrentMap newConcurrentMap()
    {
        return (new MapMaker()).makeMap();
    }

    public static EnumMap newEnumMap(Class class1)
    {
        return new EnumMap((Class)Preconditions.checkNotNull(class1));
    }

    public static EnumMap newEnumMap(Map map)
    {
        return new EnumMap(map);
    }

    public static HashMap newHashMap()
    {
        return new HashMap();
    }

    public static HashMap newHashMap(Map map)
    {
        return new HashMap(map);
    }

    public static HashMap newHashMapWithExpectedSize(int i)
    {
        return new HashMap(capacity(i));
    }

    public static IdentityHashMap newIdentityHashMap()
    {
        return new IdentityHashMap();
    }

    public static LinkedHashMap newLinkedHashMap()
    {
        return new LinkedHashMap();
    }

    public static LinkedHashMap newLinkedHashMap(Map map)
    {
        return new LinkedHashMap(map);
    }

    public static TreeMap newTreeMap()
    {
        return new TreeMap();
    }

    public static TreeMap newTreeMap(Comparator comparator)
    {
        return new TreeMap(comparator);
    }

    public static TreeMap newTreeMap(SortedMap sortedmap)
    {
        return new TreeMap(sortedmap);
    }

    static Comparator orNaturalOrder(Comparator comparator)
    {
        if (comparator != null)
            return comparator;
        else
            return Ordering.natural();
    }

    static void putAllImpl(Map map, Map map1)
    {
        java.util.Map.Entry entry;
        for (Iterator iterator = map1.entrySet().iterator(); iterator.hasNext(); map.put(entry.getKey(), entry.getValue()))
            entry = (java.util.Map.Entry)iterator.next();

    }

    static boolean removeEntryImpl(Collection collection, Object obj)
    {
        if (!(obj instanceof java.util.Map.Entry))
            return false;
        else
            return collection.remove(unmodifiableEntry((java.util.Map.Entry)obj));
    }

    static boolean safeContainsKey(Map map, Object obj)
    {
        boolean flag;
        try
        {
            flag = map.containsKey(obj);
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        return flag;
    }

    static Object safeGet(Map map, Object obj)
    {
        Object obj1;
        try
        {
            obj1 = map.get(obj);
        }
        catch (ClassCastException classcastexception)
        {
            return null;
        }
        return obj1;
    }

    private static SortedMapDifference sortedMapDifference(boolean flag, SortedMap sortedmap, SortedMap sortedmap1, SortedMap sortedmap2, SortedMap sortedmap3)
    {
        return new SortedMapDifferenceImpl(flag, Collections.unmodifiableSortedMap(sortedmap), Collections.unmodifiableSortedMap(sortedmap1), Collections.unmodifiableSortedMap(sortedmap2), Collections.unmodifiableSortedMap(sortedmap3));
    }

    public static BiMap synchronizedBiMap(BiMap bimap)
    {
        return Synchronized.biMap(bimap, null);
    }

    static String toStringImpl(Map map)
    {
        StringBuilder stringbuilder = Collections2.newStringBuilderForCollection(map.size()).append('{');
        STANDARD_JOINER.appendTo(stringbuilder, map);
        return stringbuilder.append('}').toString();
    }

    public static Map transformEntries(Map map, EntryTransformer entrytransformer)
    {
        if (map instanceof SortedMap)
            return transformEntries((SortedMap)map, entrytransformer);
        else
            return new TransformedEntriesMap(map, entrytransformer);
    }

    public static SortedMap transformEntries(SortedMap sortedmap, EntryTransformer entrytransformer)
    {
        return new TransformedEntriesSortedMap(sortedmap, entrytransformer);
    }

    public static Map transformValues(Map map, Function function)
    {
        Preconditions.checkNotNull(function);
        return transformEntries(map, new EntryTransformer(function) {

            final Function val$function;

            public Object transformEntry(Object obj, Object obj1)
            {
                return function.apply(obj1);
            }

            
            {
                function = function1;
                super();
            }
        }
);
    }

    public static SortedMap transformValues(SortedMap sortedmap, Function function)
    {
        Preconditions.checkNotNull(function);
        return transformEntries(sortedmap, new EntryTransformer(function) {

            final Function val$function;

            public Object transformEntry(Object obj, Object obj1)
            {
                return function.apply(obj1);
            }

            
            {
                function = function1;
                super();
            }
        }
);
    }

    public static ImmutableMap uniqueIndex(Iterable iterable, Function function)
    {
        return uniqueIndex(iterable.iterator(), function);
    }

    public static ImmutableMap uniqueIndex(Object obj, Function function)
    {
        return uniqueIndex((Iterable)Preconditions.checkNotNull(obj), function);
    }

    public static ImmutableMap uniqueIndex(Iterator iterator, Function function)
    {
        Preconditions.checkNotNull(function);
        ImmutableMap.Builder builder = ImmutableMap.builder();
        Object obj;
        for (; iterator.hasNext(); builder.put(function.apply(obj), obj))
            obj = iterator.next();

        return builder.build();
    }

    public static BiMap unmodifiableBiMap(BiMap bimap)
    {
        return new UnmodifiableBiMap(bimap, null);
    }

    static java.util.Map.Entry unmodifiableEntry(java.util.Map.Entry entry)
    {
        Preconditions.checkNotNull(entry);
        return new AbstractMapEntry(entry) {

            final java.util.Map.Entry val$entry;

            public Object getKey()
            {
                return entry.getKey();
            }

            public Object getValue()
            {
                return entry.getValue();
            }

            
            {
                entry = entry1;
                super();
            }
        }
;
    }

    static Set unmodifiableEntrySet(Set set)
    {
        return new UnmodifiableEntrySet(Collections.unmodifiableSet(set));
    }

    static 
    {
        STANDARD_JOINER = Collections2.STANDARD_JOINER.withKeyValueSeparator("=");
    }
}
