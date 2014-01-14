// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multimap, ImmutableListMultimap, Synchronized, Maps, 
//            ListMultimap, ImmutableMultimap, SetMultimap, ImmutableSetMultimap, 
//            SortedSetMultimap, AbstractListMultimap, AbstractMultimap, AbstractSetMultimap, 
//            AbstractSortedSetMultimap, Sets, Collections2, Lists, 
//            Iterables, AbstractMultiset, Multiset, ForwardingMap, 
//            Multisets, Iterators, AbstractMapEntry, ForwardingSet, 
//            ForwardingIterator, ForwardingCollection, ForwardingMultimap

public final class Multimaps
{
    static abstract class AsMap extends Maps.ImprovedAbstractMap
    {

        public void clear()
        {
            multimap().clear();
        }

        public boolean containsKey(Object obj)
        {
            return multimap().containsKey(obj);
        }

        protected Set createEntrySet()
        {
            return new EntrySet();
        }

        abstract Iterator entryIterator();

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Collection get(Object obj)
        {
            if (containsKey(obj))
                return multimap().get(obj);
            else
                return null;
        }

        public boolean isEmpty()
        {
            return multimap().isEmpty();
        }

        public Set keySet()
        {
            return multimap().keySet();
        }

        abstract Multimap multimap();

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Collection remove(Object obj)
        {
            if (containsKey(obj))
                return multimap().removeAll(obj);
            else
                return null;
        }

        void removeValuesForKey(Object obj)
        {
            multimap().removeAll(obj);
        }

        public abstract int size();

    }

    class AsMap.EntrySet extends Maps.EntrySet
    {

        final AsMap this$0;

        public Iterator iterator()
        {
            return entryIterator();
        }

        Map map()
        {
            return AsMap.this;
        }

        public boolean remove(Object obj)
        {
            if (!contains(obj))
            {
                return false;
            } else
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                removeValuesForKey(entry.getKey());
                return true;
            }
        }

        AsMap.EntrySet()
        {
            this$0 = AsMap.this;
            super();
        }
    }

    private static class CustomListMultimap extends AbstractListMultimap
    {

        private static final long serialVersionUID;
        transient Supplier factory;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            factory = (Supplier)objectinputstream.readObject();
            setMap((Map)objectinputstream.readObject());
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            objectoutputstream.writeObject(factory);
            objectoutputstream.writeObject(backingMap());
        }

        protected volatile Collection createCollection()
        {
            return createCollection();
        }

        protected List createCollection()
        {
            return (List)factory.get();
        }

        CustomListMultimap(Map map, Supplier supplier)
        {
            super(map);
            factory = (Supplier)Preconditions.checkNotNull(supplier);
        }
    }

    private static class CustomMultimap extends AbstractMultimap
    {

        private static final long serialVersionUID;
        transient Supplier factory;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            factory = (Supplier)objectinputstream.readObject();
            setMap((Map)objectinputstream.readObject());
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            objectoutputstream.writeObject(factory);
            objectoutputstream.writeObject(backingMap());
        }

        protected Collection createCollection()
        {
            return (Collection)factory.get();
        }

        CustomMultimap(Map map, Supplier supplier)
        {
            super(map);
            factory = (Supplier)Preconditions.checkNotNull(supplier);
        }
    }

    private static class CustomSetMultimap extends AbstractSetMultimap
    {

        private static final long serialVersionUID;
        transient Supplier factory;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            factory = (Supplier)objectinputstream.readObject();
            setMap((Map)objectinputstream.readObject());
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            objectoutputstream.writeObject(factory);
            objectoutputstream.writeObject(backingMap());
        }

        protected volatile Collection createCollection()
        {
            return createCollection();
        }

        protected Set createCollection()
        {
            return (Set)factory.get();
        }

        CustomSetMultimap(Map map, Supplier supplier)
        {
            super(map);
            factory = (Supplier)Preconditions.checkNotNull(supplier);
        }
    }

    private static class CustomSortedSetMultimap extends AbstractSortedSetMultimap
    {

        private static final long serialVersionUID;
        transient Supplier factory;
        transient Comparator valueComparator;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            factory = (Supplier)objectinputstream.readObject();
            valueComparator = ((SortedSet)factory.get()).comparator();
            setMap((Map)objectinputstream.readObject());
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            objectoutputstream.writeObject(factory);
            objectoutputstream.writeObject(backingMap());
        }

        protected volatile Collection createCollection()
        {
            return createCollection();
        }

        protected volatile Set createCollection()
        {
            return createCollection();
        }

        protected SortedSet createCollection()
        {
            return (SortedSet)factory.get();
        }

        public Comparator valueComparator()
        {
            return valueComparator;
        }

        CustomSortedSetMultimap(Map map, Supplier supplier)
        {
            super(map);
            factory = (Supplier)Preconditions.checkNotNull(supplier);
            valueComparator = ((SortedSet)supplier.get()).comparator();
        }
    }

    static abstract class Entries extends AbstractCollection
    {

        public void clear()
        {
            multimap().clear();
        }

        public boolean contains(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                return multimap().containsEntry(entry.getKey(), entry.getValue());
            } else
            {
                return false;
            }
        }

        abstract Multimap multimap();

        public boolean remove(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                return multimap().remove(entry.getKey(), entry.getValue());
            } else
            {
                return false;
            }
        }

        public int size()
        {
            return multimap().size();
        }

    }

    static abstract class EntrySet extends Entries
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

    }

    private static class FilteredMultimap
        implements Multimap
    {

        static final Predicate NOT_EMPTY = new Predicate() {

            public volatile boolean apply(Object obj)
            {
                return apply((Collection)obj);
            }

            public boolean apply(Collection collection)
            {
                return !collection.isEmpty();
            }

        }
;
        Map asMap;
        Collection entries;
        AbstractMultiset keys;
        final Predicate predicate;
        final Multimap unfiltered;
        Collection values;

        public Map asMap()
        {
            if (asMap == null)
            {
                Map map = createAsMap();
                asMap = map;
                return map;
            } else
            {
                return asMap;
            }
        }

        public void clear()
        {
            entries().clear();
        }

        public boolean containsEntry(Object obj, Object obj1)
        {
            return unfiltered.containsEntry(obj, obj1) && satisfiesPredicate(obj, obj1);
        }

        public boolean containsKey(Object obj)
        {
            return asMap().containsKey(obj);
        }

        public boolean containsValue(Object obj)
        {
            return values().contains(obj);
        }

        Map createAsMap()
        {
            Maps.EntryTransformer entrytransformer = new Maps.EntryTransformer() {

                final FilteredMultimap this$0;

                public volatile Object transformEntry(Object obj, Object obj1)
                {
                    return transformEntry(obj, (Collection)obj1);
                }

                public Collection transformEntry(Object obj, Collection collection)
                {
                    return filterCollection(collection, new FilteredMultimap.ValuePredicate(obj));
                }

            
            {
                this$0 = FilteredMultimap.this;
                super();
            }
            }
;
            return new AsMap(Maps.filterValues(Maps.transformEntries(unfiltered.asMap(), entrytransformer), NOT_EMPTY));
        }

        public Collection entries()
        {
            if (entries == null)
            {
                Collection collection = Collections2.filter(unfiltered.entries(), predicate);
                entries = collection;
                return collection;
            } else
            {
                return entries;
            }
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            if (obj instanceof Multimap)
            {
                Multimap multimap = (Multimap)obj;
                return asMap().equals(multimap.asMap());
            } else
            {
                return false;
            }
        }

        Collection filterCollection(Collection collection, Predicate predicate1)
        {
            if (collection instanceof Set)
                return Sets.filter((Set)collection, predicate1);
            else
                return Collections2.filter(collection, predicate1);
        }

        public Collection get(Object obj)
        {
            return filterCollection(unfiltered.get(obj), new ValuePredicate(obj));
        }

        public int hashCode()
        {
            return asMap().hashCode();
        }

        public boolean isEmpty()
        {
            return entries().isEmpty();
        }

        public Set keySet()
        {
            return asMap().keySet();
        }

        public Multiset keys()
        {
            if (keys == null)
            {
                Keys keys1 = new Keys();
                keys = keys1;
                return keys1;
            } else
            {
                return keys;
            }
        }

        public boolean put(Object obj, Object obj1)
        {
            Preconditions.checkArgument(satisfiesPredicate(obj, obj1));
            return unfiltered.put(obj, obj1);
        }

        public boolean putAll(Multimap multimap)
        {
            java.util.Map.Entry entry;
            for (Iterator iterator = multimap.entries().iterator(); iterator.hasNext(); Preconditions.checkArgument(satisfiesPredicate(entry.getKey(), entry.getValue())))
                entry = (java.util.Map.Entry)iterator.next();

            return unfiltered.putAll(multimap);
        }

        public boolean putAll(Object obj, Iterable iterable)
        {
            for (Iterator iterator = iterable.iterator(); iterator.hasNext(); Preconditions.checkArgument(satisfiesPredicate(obj, iterator.next())));
            return unfiltered.putAll(obj, iterable);
        }

        public boolean remove(Object obj, Object obj1)
        {
            if (containsEntry(obj, obj1))
                return unfiltered.remove(obj, obj1);
            else
                return false;
        }

        public Collection removeAll(Object obj)
        {
            java.util.ArrayList arraylist = Lists.newArrayList();
            Collection collection = (Collection)unfiltered.asMap().get(obj);
            if (collection != null)
            {
                Iterator iterator = collection.iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    Object obj1 = iterator.next();
                    if (satisfiesPredicate(obj, obj1))
                    {
                        arraylist.add(obj1);
                        iterator.remove();
                    }
                } while (true);
            }
            if (unfiltered instanceof SetMultimap)
                return Collections.unmodifiableSet(Sets.newLinkedHashSet(arraylist));
            else
                return Collections.unmodifiableList(arraylist);
        }

        boolean removeEntriesIf(Predicate predicate1)
        {
            Iterator iterator = unfiltered.asMap().entrySet().iterator();
            boolean flag = false;
            do
            {
                if (!iterator.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                Object obj = entry.getKey();
                Collection collection = (Collection)entry.getValue();
                ValuePredicate valuepredicate = new ValuePredicate(obj);
                Collection collection1 = filterCollection(collection, valuepredicate);
                if (predicate1.apply(Maps.immutableEntry(obj, collection1)) && !collection1.isEmpty())
                {
                    flag = true;
                    if (Iterables.all(collection, valuepredicate))
                        iterator.remove();
                    else
                        collection1.clear();
                }
            } while (true);
            return flag;
        }

        public Collection replaceValues(Object obj, Iterable iterable)
        {
            for (Iterator iterator = iterable.iterator(); iterator.hasNext(); Preconditions.checkArgument(satisfiesPredicate(obj, iterator.next())));
            Collection collection = removeAll(obj);
            unfiltered.putAll(obj, iterable);
            return collection;
        }

        boolean satisfiesPredicate(Object obj, Object obj1)
        {
            return predicate.apply(Maps.immutableEntry(obj, obj1));
        }

        public int size()
        {
            return entries().size();
        }

        public String toString()
        {
            return asMap().toString();
        }

        public Collection values()
        {
            if (values == null)
            {
                Values values1 = new Values();
                values = values1;
                return values1;
            } else
            {
                return values;
            }
        }


        FilteredMultimap(Multimap multimap, Predicate predicate1)
        {
            unfiltered = multimap;
            predicate = predicate1;
        }
    }

    class FilteredMultimap.AsMap extends ForwardingMap
    {

        Values asMapValues;
        final Map _flddelegate;
        EntrySet entrySet;
        Set keySet;
        final FilteredMultimap this$0;

        public void clear()
        {
            FilteredMultimap.this.clear();
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Map _mthdelegate()
        {
            return _flddelegate;
        }

        public Set entrySet()
        {
            if (entrySet == null)
            {
                EntrySet entryset = new EntrySet(super.entrySet());
                entrySet = entryset;
                return entryset;
            } else
            {
                return entrySet;
            }
        }

        public Set keySet()
        {
            if (keySet == null)
            {
                KeySet keyset = new KeySet();
                keySet = keyset;
                return keyset;
            } else
            {
                return keySet;
            }
        }

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Collection remove(Object obj)
        {
            Collection collection = removeAll(obj);
            if (collection.isEmpty())
                collection = null;
            return collection;
        }

        public Collection values()
        {
            if (asMapValues == null)
            {
                Values values1 = new Values();
                asMapValues = values1;
                return values1;
            } else
            {
                return asMapValues;
            }
        }

        FilteredMultimap.AsMap(Map map)
        {
            this$0 = FilteredMultimap.this;
            super();
            _flddelegate = map;
        }
    }

    class FilteredMultimap.AsMap.EntrySet extends Maps.EntrySet
    {

        Set delegateEntries;
        final FilteredMultimap.AsMap this$1;

        public Iterator iterator()
        {
            return delegateEntries.iterator();
        }

        Map map()
        {
            return FilteredMultimap.AsMap.this;
        }

        public boolean remove(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Collection collection = (Collection)_flddelegate.get(entry.getKey());
                if (collection != null && collection.equals(entry.getValue()))
                {
                    collection.clear();
                    return true;
                }
            }
            return false;
        }

        public boolean removeAll(Collection collection)
        {
            return Sets.removeAllImpl(this, collection);
        }

        public boolean retainAll(Collection collection)
        {
            Predicate predicate = collection. new Predicate() {

                final FilteredMultimap.AsMap.EntrySet this$2;
                final Collection val$c;

                public volatile boolean apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public boolean apply(java.util.Map.Entry entry)
                {
                    return !c.contains(entry);
                }

            
            {
                this$2 = final_entryset;
                c = Collection.this;
                super();
            }
            }
;
            return removeEntriesIf(predicate);
        }

        public FilteredMultimap.AsMap.EntrySet(Set set)
        {
            this$1 = FilteredMultimap.AsMap.this;
            super();
            delegateEntries = set;
        }
    }

    class FilteredMultimap.AsMap.KeySet extends Maps.KeySet
    {

        final FilteredMultimap.AsMap this$1;

        Map map()
        {
            return FilteredMultimap.AsMap.this;
        }

        public boolean remove(Object obj)
        {
            Collection collection = (Collection)_flddelegate.get(obj);
            if (collection == null)
            {
                return false;
            } else
            {
                collection.clear();
                return true;
            }
        }

        public boolean removeAll(Collection collection)
        {
            return Sets.removeAllImpl(this, collection);
        }

        public boolean retainAll(Collection collection)
        {
            Predicate predicate = collection. new Predicate() {

                final FilteredMultimap.AsMap.KeySet this$2;
                final Collection val$c;

                public volatile boolean apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public boolean apply(java.util.Map.Entry entry)
                {
                    return !c.contains(entry.getKey());
                }

            
            {
                this$2 = final_keyset;
                c = Collection.this;
                super();
            }
            }
;
            return removeEntriesIf(predicate);
        }

        FilteredMultimap.AsMap.KeySet()
        {
            this$1 = FilteredMultimap.AsMap.this;
            super();
        }
    }

    class FilteredMultimap.AsMap.Values extends Maps.Values
    {

        final FilteredMultimap.AsMap this$1;

        Map map()
        {
            return FilteredMultimap.AsMap.this;
        }

        public boolean remove(Object obj)
        {
            for (Iterator iterator = iterator(); iterator.hasNext();)
            {
                Collection collection = (Collection)iterator.next();
                if (collection.equals(obj))
                {
                    collection.clear();
                    return true;
                }
            }

            return false;
        }

        public boolean removeAll(Collection collection)
        {
            Predicate predicate = collection. new Predicate() {

                final FilteredMultimap.AsMap.Values this$2;
                final Collection val$c;

                public volatile boolean apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public boolean apply(java.util.Map.Entry entry)
                {
                    return c.contains(entry.getValue());
                }

            
            {
                this$2 = final_values;
                c = Collection.this;
                super();
            }
            }
;
            return removeEntriesIf(predicate);
        }

        public boolean retainAll(Collection collection)
        {
            Predicate predicate = collection. new Predicate() {

                final FilteredMultimap.AsMap.Values this$2;
                final Collection val$c;

                public volatile boolean apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public boolean apply(java.util.Map.Entry entry)
                {
                    return !c.contains(entry.getValue());
                }

            
            {
                this$2 = final_values;
                c = Collection.this;
                super();
            }
            }
;
            return removeEntriesIf(predicate);
        }

        FilteredMultimap.AsMap.Values()
        {
            this$1 = FilteredMultimap.AsMap.this;
            super();
        }
    }

    class FilteredMultimap.Keys extends Keys
    {

        final FilteredMultimap this$0;

        Set createEntrySet()
        {
            return new EntrySet();
        }

        Multimap multimap()
        {
            return FilteredMultimap.this;
        }

        public int remove(Object obj, int i)
        {
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            Collection collection = (Collection)unfiltered.asMap().get(obj);
            if (collection == null)
                return 0;
            int j = 0;
            int k = 0;
            Iterator iterator = collection.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                if (satisfiesPredicate(obj, iterator.next()))
                {
                    j++;
                    if (k < i)
                    {
                        iterator.remove();
                        k++;
                    }
                }
            } while (true);
            return j;
        }

        FilteredMultimap.Keys()
        {
            this$0 = FilteredMultimap.this;
            super();
        }
    }

    class FilteredMultimap.Keys.EntrySet extends Keys.KeysEntrySet
    {

        final FilteredMultimap.Keys this$1;

        public boolean removeAll(Collection collection)
        {
            return Sets.removeAllImpl(this, collection);
        }

        public boolean retainAll(Collection collection)
        {
            Predicate predicate = collection. new Predicate() {

                final FilteredMultimap.Keys.EntrySet this$2;
                final Collection val$c;

                public volatile boolean apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public boolean apply(java.util.Map.Entry entry)
                {
                    Multiset.Entry entry1 = Multisets.immutableEntry(entry.getKey(), ((Collection)entry.getValue()).size());
                    return !c.contains(entry1);
                }

            
            {
                this$2 = final_entryset;
                c = Collection.this;
                super();
            }
            }
;
            return removeEntriesIf(predicate);
        }

        FilteredMultimap.Keys.EntrySet()
        {
            this$1 = FilteredMultimap.Keys.this;
            super();
        }
    }

    class FilteredMultimap.ValuePredicate
        implements Predicate
    {

        final Object key;
        final FilteredMultimap this$0;

        public boolean apply(Object obj)
        {
            return satisfiesPredicate(key, obj);
        }

        FilteredMultimap.ValuePredicate(Object obj)
        {
            this$0 = FilteredMultimap.this;
            super();
            key = obj;
        }
    }

    class FilteredMultimap.Values extends Values
    {

        final FilteredMultimap this$0;

        public boolean contains(Object obj)
        {
            return Iterators.contains(iterator(), obj);
        }

        Multimap multimap()
        {
            return FilteredMultimap.this;
        }

        public boolean remove(Object obj)
        {
            for (Iterator iterator = unfiltered.entries().iterator(); iterator.hasNext();)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                if (Objects.equal(obj, entry.getValue()) && predicate.apply(entry))
                {
                    iterator.remove();
                    return true;
                }
            }

            return false;
        }

        public boolean removeAll(Collection collection)
        {
            boolean flag = false;
            Iterator iterator = unfiltered.entries().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                if (collection.contains(entry.getValue()) && predicate.apply(entry))
                {
                    iterator.remove();
                    flag = true;
                }
            } while (true);
            return flag;
        }

        public boolean retainAll(Collection collection)
        {
            boolean flag = false;
            Iterator iterator = unfiltered.entries().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                if (!collection.contains(entry.getValue()) && predicate.apply(entry))
                {
                    iterator.remove();
                    flag = true;
                }
            } while (true);
            return flag;
        }

        FilteredMultimap.Values()
        {
            this$0 = FilteredMultimap.this;
            super();
        }
    }

    static abstract class Keys extends AbstractMultiset
    {

        public void clear()
        {
            multimap().clear();
        }

        public boolean contains(Object obj)
        {
            return multimap().containsKey(obj);
        }

        public int count(Object obj)
        {
            Collection collection;
            if (!multimap().containsKey(obj))
                break MISSING_BLOCK_LABEL_56;
            collection = (Collection)multimap().asMap().get(obj);
            if (collection == null)
                return 0;
            int i = collection.size();
            return i;
            ClassCastException classcastexception;
            classcastexception;
            return 0;
            NullPointerException nullpointerexception;
            nullpointerexception;
            return 0;
        }

        Set createEntrySet()
        {
            return new KeysEntrySet();
        }

        int distinctElements()
        {
            return multimap().asMap().size();
        }

        public Set elementSet()
        {
            return multimap().keySet();
        }

        Iterator entryIterator()
        {
            return multimap().asMap().entrySet().iterator(). new Iterator() {

                final Keys this$0;
                final Iterator val$backingIterator;

                public boolean hasNext()
                {
                    return backingIterator.hasNext();
                }

                public Multiset.Entry next()
                {
                    return ((java.util.Map.Entry)backingIterator.next()). new Multisets.AbstractEntry() {

                        final Keys._cls1 this$1;
                        final java.util.Map.Entry val$backingEntry;

                        public int getCount()
                        {
                            return ((Collection)backingEntry.getValue()).size();
                        }

                        public Object getElement()
                        {
                            return backingEntry.getKey();
                        }

            
            {
                this$1 = final__pcls1;
                backingEntry = java.util.Map.Entry.this;
                super();
            }
                    }
;
                }

                public volatile Object next()
                {
                    return next();
                }

                public void remove()
                {
                    backingIterator.remove();
                }

            
            {
                this$0 = final_keys;
                backingIterator = Iterator.this;
                super();
            }
            }
;
        }

        public Iterator iterator()
        {
            return Iterators.transform(multimap().entries().iterator(), new Function() {

                final Keys this$0;

                public volatile Object apply(Object obj)
                {
                    return apply((java.util.Map.Entry)obj);
                }

                public Object apply(java.util.Map.Entry entry)
                {
                    return entry.getKey();
                }

            
            {
                this$0 = Keys.this;
                super();
            }
            }
);
        }

        abstract Multimap multimap();

        public int remove(Object obj, int i)
        {
            boolean flag;
            int j;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            if (i == 0)
            {
                j = count(obj);
            } else
            {
                Collection collection;
                try
                {
                    collection = (Collection)multimap().asMap().get(obj);
                }
                catch (ClassCastException classcastexception)
                {
                    return 0;
                }
                catch (NullPointerException nullpointerexception)
                {
                    return 0;
                }
                j = 0;
                if (collection != null)
                {
                    int k = collection.size();
                    if (i >= k)
                    {
                        collection.clear();
                    } else
                    {
                        Iterator iterator1 = collection.iterator();
                        int l = 0;
                        while (l < i) 
                        {
                            iterator1.next();
                            iterator1.remove();
                            l++;
                        }
                    }
                    return k;
                }
            }
            return j;
        }

    }

    class Keys.KeysEntrySet extends Multisets.EntrySet
    {

        final Keys this$0;

        public boolean contains(Object obj)
        {
            boolean flag = obj instanceof Multiset.Entry;
            boolean flag1 = false;
            if (flag)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                Collection collection = (Collection)multimap().asMap().get(entry.getElement());
                flag1 = false;
                if (collection != null)
                {
                    int i = collection.size();
                    int j = entry.getCount();
                    flag1 = false;
                    if (i == j)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public boolean isEmpty()
        {
            return multimap().isEmpty();
        }

        public Iterator iterator()
        {
            return entryIterator();
        }

        Multiset multiset()
        {
            return Keys.this;
        }

        public boolean remove(Object obj)
        {
            if (obj instanceof Multiset.Entry)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                Collection collection = (Collection)multimap().asMap().get(entry.getElement());
                if (collection != null && collection.size() == entry.getCount())
                {
                    collection.clear();
                    return true;
                }
            }
            return false;
        }

        public int size()
        {
            return distinctElements();
        }

        Keys.KeysEntrySet()
        {
            this$0 = Keys.this;
            super();
        }
    }

    private static class MapMultimap
        implements SetMultimap, Serializable
    {

        private static final com.google.common.base.Joiner.MapJoiner JOINER = Joiner.on("], ").withKeyValueSeparator("=[").useForNull("null");
        private static final long serialVersionUID = 0x6cdfd44a398c560fL;
        transient Map asMap;
        final Map map;

        public Map asMap()
        {
            Object obj = asMap;
            if (obj == null)
            {
                obj = new AsMap();
                asMap = ((Map) (obj));
            }
            return ((Map) (obj));
        }

        public void clear()
        {
            map.clear();
        }

        public boolean containsEntry(Object obj, Object obj1)
        {
            return map.entrySet().contains(Maps.immutableEntry(obj, obj1));
        }

        public boolean containsKey(Object obj)
        {
            return map.containsKey(obj);
        }

        public boolean containsValue(Object obj)
        {
            return map.containsValue(obj);
        }

        public volatile Collection entries()
        {
            return entries();
        }

        public Set entries()
        {
            return map.entrySet();
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof Multimap))
                        break label0;
                    Multimap multimap = (Multimap)obj;
                    if (size() != multimap.size() || !asMap().equals(multimap.asMap()))
                        return false;
                }
                return true;
            }
            return false;
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public Set get(Object obj)
        {
            return ((_cls1) (obj)). new AbstractSet() {

                final MapMultimap this$0;
                final Object val$key;

                public Iterator iterator()
                {
                    return new Iterator() {

                        int i;
                        final MapMultimap._cls1 this$1;

                        public boolean hasNext()
                        {
                            return i == 0 && map.containsKey(key);
                        }

                        public Object next()
                        {
                            if (!hasNext())
                            {
                                throw new NoSuchElementException();
                            } else
                            {
                                i = 1 + i;
                                return map.get(key);
                            }
                        }

                        public void remove()
                        {
                            boolean flag = true;
                            if (i != flag)
                                flag = false;
                            Preconditions.checkState(flag);
                            i = -1;
                            map.remove(key);
                        }

            
            {
                this$1 = MapMultimap._cls1.this;
                super();
            }
                    }
;
                }

                public int size()
                {
                    return !map.containsKey(key) ? 0 : 1;
                }

            
            {
                this$0 = final_mapmultimap;
                key = Object.this;
                super();
            }
            }
;
        }

        public int hashCode()
        {
            return map.hashCode();
        }

        public boolean isEmpty()
        {
            return map.isEmpty();
        }

        public Set keySet()
        {
            return map.keySet();
        }

        public Multiset keys()
        {
            return Multisets.forSet(map.keySet());
        }

        public boolean put(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Multimap multimap)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public boolean remove(Object obj, Object obj1)
        {
            return map.entrySet().remove(Maps.immutableEntry(obj, obj1));
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public Set removeAll(Object obj)
        {
            HashSet hashset = new HashSet(2);
            if (!map.containsKey(obj))
            {
                return hashset;
            } else
            {
                hashset.add(map.remove(obj));
                return hashset;
            }
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public Set replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public int size()
        {
            return map.size();
        }

        public String toString()
        {
            if (map.isEmpty())
            {
                return "{}";
            } else
            {
                StringBuilder stringbuilder = Collections2.newStringBuilderForCollection(map.size()).append('{');
                JOINER.appendTo(stringbuilder, map);
                return stringbuilder.append("]}").toString();
            }
        }

        public Collection values()
        {
            return map.values();
        }


        MapMultimap(Map map1)
        {
            map = (Map)Preconditions.checkNotNull(map1);
        }
    }

    class MapMultimap.AsMap extends Maps.ImprovedAbstractMap
    {

        final MapMultimap this$0;

        public boolean containsKey(Object obj)
        {
            return map.containsKey(obj);
        }

        protected Set createEntrySet()
        {
            return new MapMultimap.AsMapEntries();
        }

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Collection get(Object obj)
        {
            Set set = MapMultimap.this.get(obj);
            if (set.isEmpty())
                set = null;
            return set;
        }

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Collection remove(Object obj)
        {
            Set set = removeAll(obj);
            if (set.isEmpty())
                set = null;
            return set;
        }

        MapMultimap.AsMap()
        {
            this$0 = MapMultimap.this;
            super();
        }
    }

    class MapMultimap.AsMapEntries extends AbstractSet
    {

        final MapMultimap this$0;

        public boolean contains(Object obj)
        {
            boolean flag = true;
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                if (entry.getValue() instanceof Set)
                {
                    Set set = (Set)entry.getValue();
                    if (set.size() != flag || !containsEntry(entry.getKey(), set.iterator().next()))
                        flag = false;
                    return flag;
                }
            }
            return false;
        }

        public Iterator iterator()
        {
            return new Iterator() {

                final Iterator keys;
                final MapMultimap.AsMapEntries this$1;

                public boolean hasNext()
                {
                    return keys.hasNext();
                }

                public volatile Object next()
                {
                    return next();
                }

                public java.util.Map.Entry next()
                {
                    return ((_cls1) (keys.next())). new AbstractMapEntry() {

                        final MapMultimap.AsMapEntries._cls1 this$2;
                        final Object val$key;

                        public Object getKey()
                        {
                            return key;
                        }

                        public volatile Object getValue()
                        {
                            return getValue();
                        }

                        public Collection getValue()
                        {
                            return get(key);
                        }

            
            {
                this$2 = final__pcls1;
                key = Object.this;
                super();
            }
                    }
;
                }

                public void remove()
                {
                    keys.remove();
                }

            
            {
                this$1 = MapMultimap.AsMapEntries.this;
                super();
                keys = map.keySet().iterator();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            boolean flag = true;
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                if (entry.getValue() instanceof Set)
                {
                    Set set = (Set)entry.getValue();
                    if (set.size() != flag || !map.entrySet().remove(Maps.immutableEntry(entry.getKey(), set.iterator().next())))
                        flag = false;
                    return flag;
                }
            }
            return false;
        }

        public int size()
        {
            return map.size();
        }

        MapMultimap.AsMapEntries()
        {
            this$0 = MapMultimap.this;
            super();
        }
    }

    private static final class TransformedEntriesListMultimap extends TransformedEntriesMultimap
        implements ListMultimap
    {

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public List get(Object obj)
        {
            return transform(obj, super.fromMultimap.get(obj));
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public List removeAll(Object obj)
        {
            return transform(obj, super.fromMultimap.removeAll(obj));
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public List replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        volatile Collection transform(Object obj, Collection collection)
        {
            return transform(obj, collection);
        }

        List transform(Object obj, Collection collection)
        {
            return Lists.transform((List)collection, ((_cls1) (obj)). new Function() {

                final TransformedEntriesListMultimap this$0;
                final Object val$key;

                public Object apply(Object obj)
                {
                    return transformer.transformEntry(key, obj);
                }

            
            {
                this$0 = final_transformedentrieslistmultimap;
                key = Object.this;
                super();
            }
            }
);
        }

        TransformedEntriesListMultimap(ListMultimap listmultimap, Maps.EntryTransformer entrytransformer)
        {
            super(listmultimap, entrytransformer);
        }
    }

    private static class TransformedEntriesMultimap
        implements Multimap
    {

        private transient Map asMap;
        private transient Collection entries;
        final Multimap fromMultimap;
        final Maps.EntryTransformer transformer;
        private transient Collection values;

        public Map asMap()
        {
            if (asMap == null)
            {
                Map map = Maps.transformEntries(fromMultimap.asMap(), new Maps.EntryTransformer() {

                    final TransformedEntriesMultimap this$0;

                    public volatile Object transformEntry(Object obj, Object obj1)
                    {
                        return transformEntry(obj, (Collection)obj1);
                    }

                    public Collection transformEntry(Object obj, Collection collection)
                    {
                        return transform(obj, collection);
                    }

            
            {
                this$0 = TransformedEntriesMultimap.this;
                super();
            }
                }
);
                asMap = map;
                return map;
            } else
            {
                return asMap;
            }
        }

        public void clear()
        {
            fromMultimap.clear();
        }

        public boolean containsEntry(Object obj, Object obj1)
        {
            return get(obj).contains(obj1);
        }

        public boolean containsKey(Object obj)
        {
            return fromMultimap.containsKey(obj);
        }

        public boolean containsValue(Object obj)
        {
            return values().contains(obj);
        }

        public Collection entries()
        {
            if (entries == null)
            {
                TransformedEntries transformedentries = new TransformedEntries(transformer);
                entries = transformedentries;
                return transformedentries;
            } else
            {
                return entries;
            }
        }

        public boolean equals(Object obj)
        {
            if (obj instanceof Multimap)
            {
                Multimap multimap = (Multimap)obj;
                return asMap().equals(multimap.asMap());
            } else
            {
                return false;
            }
        }

        public Collection get(Object obj)
        {
            return transform(obj, fromMultimap.get(obj));
        }

        public int hashCode()
        {
            return asMap().hashCode();
        }

        public boolean isEmpty()
        {
            return fromMultimap.isEmpty();
        }

        public Set keySet()
        {
            return fromMultimap.keySet();
        }

        public Multiset keys()
        {
            return fromMultimap.keys();
        }

        public boolean put(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Multimap multimap)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public boolean remove(Object obj, Object obj1)
        {
            return get(obj).remove(obj1);
        }

        public Collection removeAll(Object obj)
        {
            return transform(obj, fromMultimap.removeAll(obj));
        }

        public Collection replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public int size()
        {
            return fromMultimap.size();
        }

        public String toString()
        {
            return asMap().toString();
        }

        Collection transform(Object obj, Collection collection)
        {
            return Collections2.transform(collection, ((_cls1) (obj)). new Function() {

                final TransformedEntriesMultimap this$0;
                final Object val$key;

                public Object apply(Object obj)
                {
                    return transformer.transformEntry(key, obj);
                }

            
            {
                this$0 = final_transformedentriesmultimap;
                key = Object.this;
                super();
            }
            }
);
        }

        public Collection values()
        {
            if (values == null)
            {
                Collection collection = Collections2.transform(fromMultimap.entries(), new Function() {

                    final TransformedEntriesMultimap this$0;

                    public volatile Object apply(Object obj)
                    {
                        return apply((java.util.Map.Entry)obj);
                    }

                    public Object apply(java.util.Map.Entry entry)
                    {
                        return transformer.transformEntry(entry.getKey(), entry.getValue());
                    }

            
            {
                this$0 = TransformedEntriesMultimap.this;
                super();
            }
                }
);
                values = collection;
                return collection;
            } else
            {
                return values;
            }
        }

        TransformedEntriesMultimap(Multimap multimap, Maps.EntryTransformer entrytransformer)
        {
            fromMultimap = (Multimap)Preconditions.checkNotNull(multimap);
            transformer = (Maps.EntryTransformer)Preconditions.checkNotNull(entrytransformer);
        }
    }

    private class TransformedEntriesMultimap.TransformedEntries extends Collections2.TransformedCollection
    {

        final TransformedEntriesMultimap this$0;

        public boolean contains(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                return containsEntry(entry.getKey(), entry.getValue());
            } else
            {
                return false;
            }
        }

        public boolean remove(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                return get(entry.getKey()).remove(entry.getValue());
            } else
            {
                return false;
            }
        }

        TransformedEntriesMultimap.TransformedEntries(final Maps.EntryTransformer transformer)
        {
            this.this$0 = TransformedEntriesMultimap.this;
            super(fromMultimap.entries(), new _cls1());
        }
    }

    static class UnmodifiableAsMapEntries extends ForwardingSet
    {

        private final Set _flddelegate;

        public boolean contains(Object obj)
        {
            return Maps.containsEntryImpl(_mthdelegate(), obj);
        }

        public boolean containsAll(Collection collection)
        {
            return standardContainsAll(collection);
        }

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
            return _flddelegate;
        }

        public boolean equals(Object obj)
        {
            return standardEquals(obj);
        }

        public Iterator iterator()
        {
            return _flddelegate.iterator(). new ForwardingIterator() {

                final UnmodifiableAsMapEntries this$0;
                final Iterator val$iterator;

                protected volatile Object _mthdelegate()
                {
                    return _mthdelegate();
                }

                protected Iterator _mthdelegate()
                {
                    return iterator;
                }

                public volatile Object next()
                {
                    return next();
                }

                public java.util.Map.Entry next()
                {
                    return Multimaps.unmodifiableAsMapEntry((java.util.Map.Entry)iterator.next());
                }

            
            {
                this$0 = final_unmodifiableasmapentries;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        public Object[] toArray()
        {
            return standardToArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return standardToArray(aobj);
        }

        UnmodifiableAsMapEntries(Set set)
        {
            _flddelegate = set;
        }
    }

    private static class UnmodifiableAsMapValues extends ForwardingCollection
    {

        final Collection _flddelegate;

        public boolean contains(Object obj)
        {
            return standardContains(obj);
        }

        public boolean containsAll(Collection collection)
        {
            return standardContainsAll(collection);
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Collection _mthdelegate()
        {
            return _flddelegate;
        }

        public Iterator iterator()
        {
            return _flddelegate.iterator(). new Iterator() {

                final UnmodifiableAsMapValues this$0;
                final Iterator val$iterator;

                public boolean hasNext()
                {
                    return iterator.hasNext();
                }

                public volatile Object next()
                {
                    return next();
                }

                public Collection next()
                {
                    return Multimaps.unmodifiableValueCollection((Collection)iterator.next());
                }

                public void remove()
                {
                    throw new UnsupportedOperationException();
                }

            
            {
                this$0 = final_unmodifiableasmapvalues;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        public Object[] toArray()
        {
            return standardToArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return standardToArray(aobj);
        }

        UnmodifiableAsMapValues(Collection collection)
        {
            _flddelegate = Collections.unmodifiableCollection(collection);
        }
    }

    private static class UnmodifiableListMultimap extends UnmodifiableMultimap
        implements ListMultimap
    {

        private static final long serialVersionUID;

        public ListMultimap _mthdelegate()
        {
            return (ListMultimap)super._mthdelegate();
        }

        public volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public List get(Object obj)
        {
            return Collections.unmodifiableList(_mthdelegate().get(obj));
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public List removeAll(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public List replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        UnmodifiableListMultimap(ListMultimap listmultimap)
        {
            super(listmultimap);
        }
    }

    private static class UnmodifiableMultimap extends ForwardingMultimap
        implements Serializable
    {

        private static final long serialVersionUID;
        final Multimap _flddelegate;
        transient Collection entries;
        transient Set keySet;
        transient Multiset keys;
        transient Map map;
        transient Collection values;

        public Map asMap()
        {
            Object obj = map;
            if (obj == null)
            {
                obj = Collections.unmodifiableMap(_flddelegate.asMap()). new ForwardingMap() {

                    Collection asMapValues;
                    Set entrySet;
                    final UnmodifiableMultimap this$0;
                    final Map val$unmodifiableMap;

                    public boolean containsValue(Object obj)
                    {
                        return values().contains(obj);
                    }

                    protected volatile Object _mthdelegate()
                    {
                        return _mthdelegate();
                    }

                    protected Map _mthdelegate()
                    {
                        return unmodifiableMap;
                    }

                    public Set entrySet()
                    {
                        Set set = entrySet;
                        if (set == null)
                        {
                            set = Multimaps.unmodifiableAsMapEntries(unmodifiableMap.entrySet());
                            entrySet = set;
                        }
                        return set;
                    }

                    public volatile Object get(Object obj)
                    {
                        return get(obj);
                    }

                    public Collection get(Object obj)
                    {
                        Collection collection = (Collection)unmodifiableMap.get(obj);
                        if (collection == null)
                            return null;
                        else
                            return Multimaps.unmodifiableValueCollection(collection);
                    }

                    public Collection values()
                    {
                        Object obj = asMapValues;
                        if (obj == null)
                        {
                            obj = new UnmodifiableAsMapValues(unmodifiableMap.values());
                            asMapValues = ((Collection) (obj));
                        }
                        return ((Collection) (obj));
                    }

            
            {
                this$0 = final_unmodifiablemultimap;
                unmodifiableMap = Map.this;
                super();
            }
                }
;
                map = ((Map) (obj));
            }
            return ((Map) (obj));
        }

        public void clear()
        {
            throw new UnsupportedOperationException();
        }

        protected Multimap _mthdelegate()
        {
            return _flddelegate;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public Collection entries()
        {
            Collection collection = entries;
            if (collection == null)
            {
                collection = Multimaps.unmodifiableEntries(_flddelegate.entries());
                entries = collection;
            }
            return collection;
        }

        public Collection get(Object obj)
        {
            return Multimaps.unmodifiableValueCollection(_flddelegate.get(obj));
        }

        public Set keySet()
        {
            Set set = keySet;
            if (set == null)
            {
                set = Collections.unmodifiableSet(_flddelegate.keySet());
                keySet = set;
            }
            return set;
        }

        public Multiset keys()
        {
            Multiset multiset = keys;
            if (multiset == null)
            {
                multiset = Multisets.unmodifiableMultiset(_flddelegate.keys());
                keys = multiset;
            }
            return multiset;
        }

        public boolean put(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Multimap multimap)
        {
            throw new UnsupportedOperationException();
        }

        public boolean putAll(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public boolean remove(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public Collection removeAll(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public Collection replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public Collection values()
        {
            Collection collection = values;
            if (collection == null)
            {
                collection = Collections.unmodifiableCollection(_flddelegate.values());
                values = collection;
            }
            return collection;
        }

        UnmodifiableMultimap(Multimap multimap)
        {
            _flddelegate = (Multimap)Preconditions.checkNotNull(multimap);
        }
    }

    private static class UnmodifiableSetMultimap extends UnmodifiableMultimap
        implements SetMultimap
    {

        private static final long serialVersionUID;

        public volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        public SetMultimap _mthdelegate()
        {
            return (SetMultimap)super._mthdelegate();
        }

        public volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Collection entries()
        {
            return entries();
        }

        public Set entries()
        {
            return Maps.unmodifiableEntrySet(_mthdelegate().entries());
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public Set get(Object obj)
        {
            return Collections.unmodifiableSet(_mthdelegate().get(obj));
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public Set removeAll(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public Set replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        UnmodifiableSetMultimap(SetMultimap setmultimap)
        {
            super(setmultimap);
        }
    }

    private static class UnmodifiableSortedSetMultimap extends UnmodifiableSetMultimap
        implements SortedSetMultimap
    {

        private static final long serialVersionUID;

        public volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile SetMultimap _mthdelegate()
        {
            return _mthdelegate();
        }

        public SortedSetMultimap _mthdelegate()
        {
            return (SortedSetMultimap)super._mthdelegate();
        }

        public volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public volatile Set get(Object obj)
        {
            return get(obj);
        }

        public SortedSet get(Object obj)
        {
            return Collections.unmodifiableSortedSet(_mthdelegate().get(obj));
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public volatile Set removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public SortedSet removeAll(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public volatile Set replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public SortedSet replaceValues(Object obj, Iterable iterable)
        {
            throw new UnsupportedOperationException();
        }

        public Comparator valueComparator()
        {
            return _mthdelegate().valueComparator();
        }

        UnmodifiableSortedSetMultimap(SortedSetMultimap sortedsetmultimap)
        {
            super(sortedsetmultimap);
        }
    }

    static abstract class Values extends AbstractCollection
    {

        public void clear()
        {
            multimap().clear();
        }

        public boolean contains(Object obj)
        {
            return multimap().containsValue(obj);
        }

        public Iterator iterator()
        {
            return multimap().entries().iterator(). new Iterator() {

                final Values this$0;
                final Iterator val$backingIterator;

                public boolean hasNext()
                {
                    return backingIterator.hasNext();
                }

                public Object next()
                {
                    return ((java.util.Map.Entry)backingIterator.next()).getValue();
                }

                public void remove()
                {
                    backingIterator.remove();
                }

            
            {
                this$0 = final_values;
                backingIterator = Iterator.this;
                super();
            }
            }
;
        }

        abstract Multimap multimap();

        public int size()
        {
            return multimap().size();
        }

    }


    private Multimaps()
    {
    }

    public static Multimap filterEntries(Multimap multimap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        if (multimap instanceof FilteredMultimap)
            return filterFiltered((FilteredMultimap)multimap, predicate);
        else
            return new FilteredMultimap((Multimap)Preconditions.checkNotNull(multimap), predicate);
    }

    private static Multimap filterFiltered(FilteredMultimap filteredmultimap, Predicate predicate)
    {
        Predicate predicate1 = Predicates.and(filteredmultimap.predicate, predicate);
        return new FilteredMultimap(filteredmultimap.unfiltered, predicate1);
    }

    public static Multimap filterKeys(Multimap multimap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        return filterEntries(multimap, new Predicate(predicate) {

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

    public static Multimap filterValues(Multimap multimap, Predicate predicate)
    {
        Preconditions.checkNotNull(predicate);
        return filterEntries(multimap, new Predicate(predicate) {

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

    public static SetMultimap forMap(Map map)
    {
        return new MapMultimap(map);
    }

    public static ImmutableListMultimap index(Iterable iterable, Function function)
    {
        return index(iterable.iterator(), function);
    }

    public static ImmutableListMultimap index(Object obj, Function function)
    {
        return index((Iterable)Preconditions.checkNotNull(obj), function);
    }

    public static ImmutableListMultimap index(Iterator iterator, Function function)
    {
        Preconditions.checkNotNull(function);
        ImmutableListMultimap.Builder builder = ImmutableListMultimap.builder();
        Object obj;
        for (; iterator.hasNext(); builder.put(function.apply(obj), obj))
        {
            obj = iterator.next();
            Preconditions.checkNotNull(obj, iterator);
        }

        return builder.build();
    }

    public static Multimap invertFrom(Multimap multimap, Multimap multimap1)
    {
        Preconditions.checkNotNull(multimap1);
        java.util.Map.Entry entry;
        for (Iterator iterator = multimap.entries().iterator(); iterator.hasNext(); multimap1.put(entry.getValue(), entry.getKey()))
            entry = (java.util.Map.Entry)iterator.next();

        return multimap1;
    }

    public static ListMultimap newListMultimap(Map map, Supplier supplier)
    {
        return new CustomListMultimap(map, supplier);
    }

    public static Multimap newMultimap(Map map, Supplier supplier)
    {
        return new CustomMultimap(map, supplier);
    }

    public static SetMultimap newSetMultimap(Map map, Supplier supplier)
    {
        return new CustomSetMultimap(map, supplier);
    }

    public static SortedSetMultimap newSortedSetMultimap(Map map, Supplier supplier)
    {
        return new CustomSortedSetMultimap(map, supplier);
    }

    public static ListMultimap synchronizedListMultimap(ListMultimap listmultimap)
    {
        return Synchronized.listMultimap(listmultimap, null);
    }

    public static Multimap synchronizedMultimap(Multimap multimap)
    {
        return Synchronized.multimap(multimap, null);
    }

    public static SetMultimap synchronizedSetMultimap(SetMultimap setmultimap)
    {
        return Synchronized.setMultimap(setmultimap, null);
    }

    public static SortedSetMultimap synchronizedSortedSetMultimap(SortedSetMultimap sortedsetmultimap)
    {
        return Synchronized.sortedSetMultimap(sortedsetmultimap, null);
    }

    public static ListMultimap transformEntries(ListMultimap listmultimap, Maps.EntryTransformer entrytransformer)
    {
        return new TransformedEntriesListMultimap(listmultimap, entrytransformer);
    }

    public static Multimap transformEntries(Multimap multimap, Maps.EntryTransformer entrytransformer)
    {
        return new TransformedEntriesMultimap(multimap, entrytransformer);
    }

    public static ListMultimap transformValues(ListMultimap listmultimap, Function function)
    {
        Preconditions.checkNotNull(function);
        return transformEntries(listmultimap, new Maps.EntryTransformer(function) {

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

    public static Multimap transformValues(Multimap multimap, Function function)
    {
        Preconditions.checkNotNull(function);
        return transformEntries(multimap, new Maps.EntryTransformer(function) {

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

    private static Set unmodifiableAsMapEntries(Set set)
    {
        return new UnmodifiableAsMapEntries(Collections.unmodifiableSet(set));
    }

    private static java.util.Map.Entry unmodifiableAsMapEntry(java.util.Map.Entry entry)
    {
        Preconditions.checkNotNull(entry);
        return new AbstractMapEntry(entry) {

            final java.util.Map.Entry val$entry;

            public Object getKey()
            {
                return entry.getKey();
            }

            public volatile Object getValue()
            {
                return getValue();
            }

            public Collection getValue()
            {
                return Multimaps.unmodifiableValueCollection((Collection)entry.getValue());
            }

            
            {
                entry = entry1;
                super();
            }
        }
;
    }

    private static Collection unmodifiableEntries(Collection collection)
    {
        if (collection instanceof Set)
            return Maps.unmodifiableEntrySet((Set)collection);
        else
            return new Maps.UnmodifiableEntries(Collections.unmodifiableCollection(collection));
    }

    public static ListMultimap unmodifiableListMultimap(ImmutableListMultimap immutablelistmultimap)
    {
        return (ListMultimap)Preconditions.checkNotNull(immutablelistmultimap);
    }

    public static ListMultimap unmodifiableListMultimap(ListMultimap listmultimap)
    {
        if (!(listmultimap instanceof UnmodifiableListMultimap) && !(listmultimap instanceof ImmutableListMultimap))
            return new UnmodifiableListMultimap(listmultimap);
        else
            return listmultimap;
    }

    public static Multimap unmodifiableMultimap(ImmutableMultimap immutablemultimap)
    {
        return (Multimap)Preconditions.checkNotNull(immutablemultimap);
    }

    public static Multimap unmodifiableMultimap(Multimap multimap)
    {
        if (!(multimap instanceof UnmodifiableMultimap) && !(multimap instanceof ImmutableMultimap))
            return new UnmodifiableMultimap(multimap);
        else
            return multimap;
    }

    public static SetMultimap unmodifiableSetMultimap(ImmutableSetMultimap immutablesetmultimap)
    {
        return (SetMultimap)Preconditions.checkNotNull(immutablesetmultimap);
    }

    public static SetMultimap unmodifiableSetMultimap(SetMultimap setmultimap)
    {
        if (!(setmultimap instanceof UnmodifiableSetMultimap) && !(setmultimap instanceof ImmutableSetMultimap))
            return new UnmodifiableSetMultimap(setmultimap);
        else
            return setmultimap;
    }

    public static SortedSetMultimap unmodifiableSortedSetMultimap(SortedSetMultimap sortedsetmultimap)
    {
        if (sortedsetmultimap instanceof UnmodifiableSortedSetMultimap)
            return sortedsetmultimap;
        else
            return new UnmodifiableSortedSetMultimap(sortedsetmultimap);
    }

    private static Collection unmodifiableValueCollection(Collection collection)
    {
        if (collection instanceof SortedSet)
            return Collections.unmodifiableSortedSet((SortedSet)collection);
        if (collection instanceof Set)
            return Collections.unmodifiableSet((Set)collection);
        if (collection instanceof List)
            return Collections.unmodifiableList((List)collection);
        else
            return Collections.unmodifiableCollection(collection);
    }





    // Unreferenced inner class com/google/common/collect/Multimaps$TransformedEntriesMultimap$TransformedEntries$1

/* anonymous class */
    class TransformedEntriesMultimap.TransformedEntries._cls1
        implements Function
    {

        final TransformedEntriesMultimap val$this$0;
        final Maps.EntryTransformer val$transformer;

        public volatile Object apply(Object obj)
        {
            return apply((java.util.Map.Entry)obj);
        }

        public java.util.Map.Entry apply(java.util.Map.Entry entry)
        {
            return entry. new AbstractMapEntry() {

                final TransformedEntriesMultimap.TransformedEntries._cls1 this$2;
                final java.util.Map.Entry val$entry;

                public Object getKey()
                {
                    return entry.getKey();
                }

                public Object getValue()
                {
    class TransformedEntriesMultimap.TransformedEntries._cls1
        implements Function
    {
                    return transformer.transformEntry(entry.getKey(), entry.getValue());
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
                this$0 = transformedentriesmultimap;
                transformer = entrytransformer;
                super();
            }
    }

}
