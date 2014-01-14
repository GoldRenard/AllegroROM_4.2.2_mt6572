// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multimap, SetMultimap, Collections2, Multiset, 
//            Iterators, Maps

abstract class AbstractMultimap
    implements Multimap, Serializable
{
    private class AsMap extends AbstractMap
    {

        transient Set entrySet;
        final transient Map submap;
        final AbstractMultimap this$0;

        public void clear()
        {
            if (submap == map)
            {
                AbstractMultimap.this.clear();
                return;
            } else
            {
                Iterators.clear(new AsMapIterator());
                return;
            }
        }

        public boolean containsKey(Object obj)
        {
            return Maps.safeContainsKey(submap, obj);
        }

        public Set entrySet()
        {
            Object obj = entrySet;
            if (obj == null)
            {
                obj = new AsMapEntries();
                entrySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public boolean equals(Object obj)
        {
            return this == obj || submap.equals(obj);
        }

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Collection get(Object obj)
        {
            Collection collection = (Collection)Maps.safeGet(submap, obj);
            if (collection == null)
                return null;
            else
                return wrapCollection(obj, collection);
        }

        public int hashCode()
        {
            return submap.hashCode();
        }

        public Set keySet()
        {
            return AbstractMultimap.this.keySet();
        }

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Collection remove(Object obj)
        {
            Collection collection = (Collection)submap.remove(obj);
            if (collection == null)
            {
                return null;
            } else
            {
                Collection collection1 = createCollection();
                collection1.addAll(collection);
                int j = 
// JavaClassFileOutputException: get_constant: invalid tag

        public int size()
        {
            return submap.size();
        }

        public String toString()
        {
            return submap.toString();
        }

        AsMap(Map map1)
        {
            this$0 = AbstractMultimap.this;
            super();
            submap = map1;
        }
    }

    class AsMap.AsMapEntries extends Maps.EntrySet
    {

        final AsMap this$1;

        public boolean contains(Object obj)
        {
            return Collections2.safeContains(submap.entrySet(), obj);
        }

        public Iterator iterator()
        {
            return new AsMapIterator();
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

        AsMap.AsMapEntries()
        {
            this$1 = AsMap.this;
            super();
        }
    }

    class AsMap.AsMapIterator
        implements Iterator
    {

        Collection collection;
        final Iterator delegateIterator;
        final AsMap this$1;

        public boolean hasNext()
        {
            return delegateIterator.hasNext();
        }

        public volatile Object next()
        {
            return next();
        }

        public java.util.Map.Entry next()
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)delegateIterator.next();
            Object obj = entry.getKey();
            collection = (Collection)entry.getValue();
            return Maps.immutableEntry(obj, wrapCollection(obj, collection));
        }

        public void remove()
        {
            delegateIterator.remove();
            int j = 
// JavaClassFileOutputException: get_constant: invalid tag

        AsMap.AsMapIterator()
        {
            this$1 = AsMap.this;
            super();
            delegateIterator = submap.entrySet().iterator();
        }
    }

    private class EntryIterator
        implements Iterator
    {

        Collection collection;
        Object key;
        final Iterator keyIterator;
        final AbstractMultimap this$0;
        Iterator valueIterator;

        void findValueIteratorAndKey()
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)keyIterator.next();
            key = entry.getKey();
            collection = (Collection)entry.getValue();
            valueIterator = collection.iterator();
        }

        public boolean hasNext()
        {
            return keyIterator.hasNext() || valueIterator.hasNext();
        }

        public volatile Object next()
        {
            return next();
        }

        public java.util.Map.Entry next()
        {
            if (!valueIterator.hasNext())
                findValueIteratorAndKey();
            return Maps.immutableEntry(key, valueIterator.next());
        }

        public void remove()
        {
            valueIterator.remove();
            if (collection.isEmpty())
                keyIterator.remove();
            int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        EntryIterator()
        {
            this$0 = AbstractMultimap.this;
            super();
            keyIterator = map.entrySet().iterator();
            if (keyIterator.hasNext())
            {
                findValueIteratorAndKey();
                return;
            } else
            {
                valueIterator = Iterators.emptyModifiableIterator();
                return;
            }
        }
    }

    private class KeySet extends Maps.KeySet
    {

        final Map subMap;
        final AbstractMultimap this$0;

        public void clear()
        {
            Iterators.clear(iterator());
        }

        public boolean containsAll(Collection collection)
        {
            return subMap.keySet().containsAll(collection);
        }

        public boolean equals(Object obj)
        {
            return this == obj || subMap.keySet().equals(obj);
        }

        public int hashCode()
        {
            return subMap.keySet().hashCode();
        }

        public Iterator iterator()
        {
            return new Iterator() {

                java.util.Map.Entry entry;
                final Iterator entryIterator;
                final KeySet this$1;

                public boolean hasNext()
                {
                    return entryIterator.hasNext();
                }

                public Object next()
                {
                    entry = (java.util.Map.Entry)entryIterator.next();
                    return entry.getKey();
                }

                public void remove()
                {
                    boolean flag;
                    if (entry != null)
                        flag = true;
                    else
                        flag = false;
                    Preconditions.checkState(flag);
                    Collection collection = (Collection)entry.getValue();
                    entryIterator.remove();
                    int j = 
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$1 = KeySet.this;
                super();
                entryIterator = subMap.entrySet().iterator();
            }
            }
;
        }

        Map map()
        {
            return subMap;
        }

        public boolean remove(Object obj)
        {
            Collection collection = (Collection)subMap.remove(obj);
            int i = 0;
            if (collection != null)
            {
                i = collection.size();
                collection.clear();
                int j = ((remove) (this)).remove - obj;
            }
            return i > 0;
        }

        KeySet(Map map1)
        {
            this$0 = AbstractMultimap.this;
            super();
            subMap = map1;
        }
    }

    private class RandomAccessWrappedList extends WrappedList
        implements RandomAccess
    {

        final AbstractMultimap this$0;

        RandomAccessWrappedList(Object obj, List list, WrappedCollection wrappedcollection)
        {
            this$0 = AbstractMultimap.this;
            super(obj, list, wrappedcollection);
        }
    }

    private class SortedAsMap extends AsMap
        implements SortedMap
    {

        SortedSet sortedKeySet;
        final AbstractMultimap this$0;

        public Comparator comparator()
        {
            return sortedMap().comparator();
        }

        public Object firstKey()
        {
            return sortedMap().firstKey();
        }

        public SortedMap headMap(Object obj)
        {
            return new SortedAsMap(sortedMap().headMap(obj));
        }

        public volatile Set keySet()
        {
            return keySet();
        }

        public SortedSet keySet()
        {
            Object obj = sortedKeySet;
            if (obj == null)
            {
                obj = new SortedKeySet(sortedMap());
                sortedKeySet = ((SortedSet) (obj));
            }
            return ((SortedSet) (obj));
        }

        public Object lastKey()
        {
            return sortedMap().lastKey();
        }

        SortedMap sortedMap()
        {
            return (SortedMap)super.submap;
        }

        public SortedMap subMap(Object obj, Object obj1)
        {
            return new SortedAsMap(sortedMap().subMap(obj, obj1));
        }

        public SortedMap tailMap(Object obj)
        {
            return new SortedAsMap(sortedMap().tailMap(obj));
        }

        SortedAsMap(SortedMap sortedmap)
        {
            this$0 = AbstractMultimap.this;
            super(sortedmap);
        }
    }

    private class SortedKeySet extends KeySet
        implements SortedSet
    {

        final AbstractMultimap this$0;

        public Comparator comparator()
        {
            return sortedMap().comparator();
        }

        public Object first()
        {
            return sortedMap().firstKey();
        }

        public SortedSet headSet(Object obj)
        {
            return new SortedKeySet(sortedMap().headMap(obj));
        }

        public Object last()
        {
            return sortedMap().lastKey();
        }

        SortedMap sortedMap()
        {
            return (SortedMap)super.subMap;
        }

        public SortedSet subSet(Object obj, Object obj1)
        {
            return new SortedKeySet(sortedMap().subMap(obj, obj1));
        }

        public SortedSet tailSet(Object obj)
        {
            return new SortedKeySet(sortedMap().tailMap(obj));
        }

        SortedKeySet(SortedMap sortedmap)
        {
            this$0 = AbstractMultimap.this;
            super(sortedmap);
        }
    }

    private class WrappedCollection extends AbstractCollection
    {

        final WrappedCollection ancestor;
        final Collection ancestorDelegate;
        Collection _flddelegate;
        final Object key;
        final AbstractMultimap this$0;

        public boolean add(Object obj)
        {
            refreshIfEmpty();
            boolean flag = _flddelegate.isEmpty();
            boolean flag1 = _flddelegate.add(obj);
            if (flag1)
            {
                int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean addAll(Collection collection)
        {
            boolean flag;
            if (collection.isEmpty())
            {
                flag = false;
            } else
            {
                int i = size();
                flag = _flddelegate.addAll(collection);
                if (flag)
                {
                    int j = _flddelegate.size();
                    int j = collection + 
// JavaClassFileOutputException: get_constant: invalid tag

        void addToMap()
        {
            if (ancestor != null)
            {
                ancestor.addToMap();
                return;
            } else
            {
                map.put(key, _flddelegate);
                return;
            }
        }

        public void clear()
        {
            int i = size();
            if (i == 0)
            {
                return;
            } else
            {
                _flddelegate.clear();
                int j = 
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean contains(Object obj)
        {
            refreshIfEmpty();
            return _flddelegate.contains(obj);
        }

        public boolean containsAll(Collection collection)
        {
            refreshIfEmpty();
            return _flddelegate.containsAll(collection);
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
            {
                return true;
            } else
            {
                refreshIfEmpty();
                return _flddelegate.equals(obj);
            }
        }

        WrappedCollection getAncestor()
        {
            return ancestor;
        }

        Collection getDelegate()
        {
            return _flddelegate;
        }

        Object getKey()
        {
            return key;
        }

        public int hashCode()
        {
            refreshIfEmpty();
            return _flddelegate.hashCode();
        }

        public Iterator iterator()
        {
            refreshIfEmpty();
            return new WrappedIterator();
        }

        void refreshIfEmpty()
        {
            if (ancestor != null)
            {
                ancestor.refreshIfEmpty();
                if (ancestor.getDelegate() != ancestorDelegate)
                    throw new ConcurrentModificationException();
            } else
            if (_flddelegate.isEmpty())
            {
                Collection collection = (Collection)map.get(key);
                if (collection != null)
                    _flddelegate = collection;
            }
        }

        public boolean remove(Object obj)
        {
            refreshIfEmpty();
            boolean flag = _flddelegate.remove(obj);
            if (flag)
            {
                int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean removeAll(Collection collection)
        {
            boolean flag;
            if (collection.isEmpty())
            {
                flag = false;
            } else
            {
                int i = size();
                flag = _flddelegate.removeAll(collection);
                if (flag)
                {
                    int j = _flddelegate.size();
                    int j = collection + 
// JavaClassFileOutputException: get_constant: invalid tag

        void removeIfEmpty()
        {
            if (ancestor != null)
                ancestor.removeIfEmpty();
            else
            if (_flddelegate.isEmpty())
            {
                map.remove(key);
                return;
            }
        }

        public boolean retainAll(Collection collection)
        {
            Preconditions.checkNotNull(collection);
            int i = size();
            boolean flag = _flddelegate.retainAll(collection);
            if (flag)
            {
                int j = _flddelegate.size();
                int j = collection + 
// JavaClassFileOutputException: get_constant: invalid tag

        public int size()
        {
            refreshIfEmpty();
            return _flddelegate.size();
        }

        public String toString()
        {
            refreshIfEmpty();
            return _flddelegate.toString();
        }

        WrappedCollection(Object obj, Collection collection, WrappedCollection wrappedcollection)
        {
            this$0 = AbstractMultimap.this;
            super();
            key = obj;
            _flddelegate = collection;
            ancestor = wrappedcollection;
            Collection collection1;
            if (wrappedcollection == null)
                collection1 = null;
            else
                collection1 = wrappedcollection.getDelegate();
            ancestorDelegate = collection1;
        }
    }

    class WrappedCollection.WrappedIterator
        implements Iterator
    {

        final Iterator delegateIterator;
        final Collection originalDelegate;
        final WrappedCollection this$1;

        Iterator getDelegateIterator()
        {
            validateIterator();
            return delegateIterator;
        }

        public boolean hasNext()
        {
            validateIterator();
            return delegateIterator.hasNext();
        }

        public Object next()
        {
            validateIterator();
            return delegateIterator.next();
        }

        public void remove()
        {
            delegateIterator.remove();
            int i = this.access$210;
            removeIfEmpty();
        }

        void validateIterator()
        {
            refreshIfEmpty();
            if (_flddelegate != originalDelegate)
                throw new ConcurrentModificationException();
            else
                return;
        }

        WrappedCollection.WrappedIterator()
        {
            this$1 = WrappedCollection.this;
            super();
            originalDelegate = _flddelegate;
            delegateIterator = iteratorOrListIterator(_flddelegate);
        }

        WrappedCollection.WrappedIterator(Iterator iterator)
        {
            this$1 = WrappedCollection.this;
            super();
            originalDelegate = _flddelegate;
            delegateIterator = iterator;
        }
    }

    private class WrappedList extends WrappedCollection
        implements List
    {

        final AbstractMultimap this$0;

        public void add(int i, Object obj)
        {
            refreshIfEmpty();
            boolean flag = getDelegate().isEmpty();
            getListDelegate().add(i, obj);
            int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        public boolean addAll(int i, Collection collection)
        {
            boolean flag;
            if (collection.isEmpty())
            {
                flag = false;
            } else
            {
                int j = size();
                flag = getListDelegate().addAll(i, collection);
                if (flag)
                {
                    int k = getDelegate().size();
                    int j = i + 
// JavaClassFileOutputException: get_constant: invalid tag

        public Object get(int i)
        {
            refreshIfEmpty();
            return getListDelegate().get(i);
        }

        List getListDelegate()
        {
            return (List)getDelegate();
        }

        public int indexOf(Object obj)
        {
            refreshIfEmpty();
            return getListDelegate().indexOf(obj);
        }

        public int lastIndexOf(Object obj)
        {
            refreshIfEmpty();
            return getListDelegate().lastIndexOf(obj);
        }

        public ListIterator listIterator()
        {
            refreshIfEmpty();
            return new WrappedListIterator();
        }

        public ListIterator listIterator(int i)
        {
            refreshIfEmpty();
            return new WrappedListIterator(i);
        }

        public Object remove(int i)
        {
            refreshIfEmpty();
            Object obj = getListDelegate().remove(i);
            int i = 
// JavaClassFileOutputException: get_constant: invalid tag

        public Object set(int i, Object obj)
        {
            refreshIfEmpty();
            return getListDelegate().set(i, obj);
        }

        public List subList(int i, int j)
        {
            refreshIfEmpty();
            AbstractMultimap abstractmultimap = AbstractMultimap.this;
            Object obj = getKey();
            List list = getListDelegate().subList(i, j);
            if (getAncestor() != null)
                this = getAncestor();
            return abstractmultimap.wrapList(obj, list, this);
        }

        WrappedList(Object obj, List list, WrappedCollection wrappedcollection)
        {
            this$0 = AbstractMultimap.this;
            super(obj, list, wrappedcollection);
        }
    }

    private class WrappedList.WrappedListIterator extends WrappedCollection.WrappedIterator
        implements ListIterator
    {

        final WrappedList this$1;

        private ListIterator getDelegateListIterator()
        {
            return (ListIterator)getDelegateIterator();
        }

        public void add(Object obj)
        {
            boolean flag = isEmpty();
            getDelegateListIterator().add(obj);
            int i = ((WrappedList) (this)).addToMap;
            if (flag)
                addToMap();
        }

        public boolean hasPrevious()
        {
            return getDelegateListIterator().hasPrevious();
        }

        public int nextIndex()
        {
            return getDelegateListIterator().nextIndex();
        }

        public Object previous()
        {
            return getDelegateListIterator().previous();
        }

        public int previousIndex()
        {
            return getDelegateListIterator().previousIndex();
        }

        public void set(Object obj)
        {
            getDelegateListIterator().set(obj);
        }

        WrappedList.WrappedListIterator()
        {
            this$1 = WrappedList.this;
            super();
        }

        public WrappedList.WrappedListIterator(int i)
        {
            this$1 = WrappedList.this;
            super(getListDelegate().listIterator(i));
        }
    }

    private class WrappedSet extends WrappedCollection
        implements Set
    {

        final AbstractMultimap this$0;

        WrappedSet(Object obj, Set set)
        {
            this$0 = AbstractMultimap.this;
            super(obj, set, null);
        }
    }

    private class WrappedSortedSet extends WrappedCollection
        implements SortedSet
    {

        final AbstractMultimap this$0;

        public Comparator comparator()
        {
            return getSortedSetDelegate().comparator();
        }

        public Object first()
        {
            refreshIfEmpty();
            return getSortedSetDelegate().first();
        }

        SortedSet getSortedSetDelegate()
        {
            return (SortedSet)getDelegate();
        }

        public SortedSet headSet(Object obj)
        {
            refreshIfEmpty();
            AbstractMultimap abstractmultimap = AbstractMultimap.this;
            Object obj1 = getKey();
            SortedSet sortedset = getSortedSetDelegate().headSet(obj);
            if (getAncestor() != null)
                this = getAncestor();
            return abstractmultimap. new WrappedSortedSet(obj1, sortedset, this);
        }

        public Object last()
        {
            refreshIfEmpty();
            return getSortedSetDelegate().last();
        }

        public SortedSet subSet(Object obj, Object obj1)
        {
            refreshIfEmpty();
            AbstractMultimap abstractmultimap = AbstractMultimap.this;
            Object obj2 = getKey();
            SortedSet sortedset = getSortedSetDelegate().subSet(obj, obj1);
            if (getAncestor() != null)
                this = getAncestor();
            return abstractmultimap. new WrappedSortedSet(obj2, sortedset, this);
        }

        public SortedSet tailSet(Object obj)
        {
            refreshIfEmpty();
            AbstractMultimap abstractmultimap = AbstractMultimap.this;
            Object obj1 = getKey();
            SortedSet sortedset = getSortedSetDelegate().tailSet(obj);
            if (getAncestor() != null)
                this = getAncestor();
            return abstractmultimap. new WrappedSortedSet(obj1, sortedset, this);
        }

        WrappedSortedSet(Object obj, SortedSet sortedset, WrappedCollection wrappedcollection)
        {
            this$0 = AbstractMultimap.this;
            super(obj, sortedset, wrappedcollection);
        }
    }


    private static final long serialVersionUID = 0x21f766b1f568c81dL;
    private transient Map asMap;
    private transient Collection entries;
    private transient Set keySet;
    private transient Map map;
    private transient Multiset multiset;
    private transient int totalSize;
    private transient Collection valuesCollection;

    protected AbstractMultimap(Map map1)
    {
        Preconditions.checkArgument(map1.isEmpty());
        map = map1;
    }

    private Map createAsMap()
    {
        if (map instanceof SortedMap)
            return new SortedAsMap((SortedMap)map);
        else
            return new AsMap(map);
    }

    private Set createKeySet()
    {
        if (map instanceof SortedMap)
            return new SortedKeySet((SortedMap)map);
        else
            return new KeySet(map);
    }

    private Collection getOrCreateCollection(Object obj)
    {
        Collection collection = (Collection)map.get(obj);
        if (collection == null)
        {
            collection = createCollection(obj);
            map.put(obj, collection);
        }
        return collection;
    }

    private Iterator iteratorOrListIterator(Collection collection)
    {
        if (collection instanceof List)
            return ((List)collection).listIterator();
        else
            return collection.iterator();
    }

    private int removeValuesForKey(Object obj)
    {
        Collection collection;
        int i;
        try
        {
            collection = (Collection)map.remove(obj);
        }
        catch (NullPointerException nullpointerexception)
        {
            return 0;
        }
        catch (ClassCastException classcastexception)
        {
            return 0;
        }
        i = 0;
        if (collection != null)
        {
            i = collection.size();
            collection.clear();
            totalSize = totalSize - i;
        }
        return i;
    }

    private Collection unmodifiableCollectionSubclass(Collection collection)
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

    private Collection wrapCollection(Object obj, Collection collection)
    {
        if (collection instanceof SortedSet)
            return new WrappedSortedSet(obj, (SortedSet)collection, null);
        if (collection instanceof Set)
            return new WrappedSet(obj, (Set)collection);
        if (collection instanceof List)
            return wrapList(obj, (List)collection, null);
        else
            return new WrappedCollection(obj, collection, null);
    }

    private List wrapList(Object obj, List list, WrappedCollection wrappedcollection)
    {
        if (list instanceof RandomAccess)
            return new RandomAccessWrappedList(obj, list, wrappedcollection);
        else
            return new WrappedList(obj, list, wrappedcollection);
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

    Map backingMap()
    {
        return map;
    }

    public void clear()
    {
        for (Iterator iterator = map.values().iterator(); iterator.hasNext(); ((Collection)iterator.next()).clear());
        map.clear();
        totalSize = 0;
    }

    public boolean containsEntry(Object obj, Object obj1)
    {
        Collection collection = (Collection)map.get(obj);
        return collection != null && collection.contains(obj1);
    }

    public boolean containsKey(Object obj)
    {
        return map.containsKey(obj);
    }

    public boolean containsValue(Object obj)
    {
        for (Iterator iterator = map.values().iterator(); iterator.hasNext();)
            if (((Collection)iterator.next()).contains(obj))
                return true;

        return false;
    }

    abstract Collection createCollection();

    Collection createCollection(Object obj)
    {
        return createCollection();
    }

    Collection createEntries()
    {
        if (this instanceof SetMultimap)
            return new Multimaps.EntrySet() {

                final AbstractMultimap this$0;

                public Iterator iterator()
                {
                    return createEntryIterator();
                }

                Multimap multimap()
                {
                    return AbstractMultimap.this;
                }

            
            {
                this$0 = AbstractMultimap.this;
                super();
            }
            }
;
        else
            return new Multimaps.Entries() {

                final AbstractMultimap this$0;

                public Iterator iterator()
                {
                    return createEntryIterator();
                }

                Multimap multimap()
                {
                    return AbstractMultimap.this;
                }

            
            {
                this$0 = AbstractMultimap.this;
                super();
            }
            }
;
    }

    Iterator createEntryIterator()
    {
        return new EntryIterator();
    }

    public Collection entries()
    {
        Collection collection = entries;
        if (collection == null)
        {
            collection = createEntries();
            entries = collection;
        }
        return collection;
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof Multimap)
        {
            Multimap multimap = (Multimap)obj;
            return map.equals(multimap.asMap());
        } else
        {
            return false;
        }
    }

    public Collection get(Object obj)
    {
        Collection collection = (Collection)map.get(obj);
        if (collection == null)
            collection = createCollection(obj);
        return wrapCollection(obj, collection);
    }

    public int hashCode()
    {
        return map.hashCode();
    }

    public boolean isEmpty()
    {
        return totalSize == 0;
    }

    public Set keySet()
    {
        Set set = keySet;
        if (set == null)
        {
            set = createKeySet();
            keySet = set;
        }
        return set;
    }

    public Multiset keys()
    {
        Object obj = multiset;
        if (obj == null)
        {
            obj = new Multimaps.Keys() {

                final AbstractMultimap this$0;

                Multimap multimap()
                {
                    return AbstractMultimap.this;
                }

            
            {
                this$0 = AbstractMultimap.this;
                super();
            }
            }
;
            multiset = ((Multiset) (obj));
        }
        return ((Multiset) (obj));
    }

    public boolean put(Object obj, Object obj1)
    {
        if (getOrCreateCollection(obj).add(obj1))
        {
            totalSize = 1 + totalSize;
            return true;
        } else
        {
            return false;
        }
    }

    public boolean putAll(Multimap multimap)
    {
        boolean flag = false;
        for (Iterator iterator = multimap.entries().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            flag |= put(entry.getKey(), entry.getValue());
        }

        return flag;
    }

    public boolean putAll(Object obj, Iterable iterable)
    {
        if (!iterable.iterator().hasNext())
            return false;
        Collection collection = getOrCreateCollection(obj);
        int i = collection.size();
        boolean flag = false;
        if (iterable instanceof Collection)
        {
            flag = collection.addAll(Collections2.cast(iterable));
        } else
        {
            for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
                flag |= collection.add(iterator.next());

        }
        totalSize = totalSize + (collection.size() - i);
        return flag;
    }

    public boolean remove(Object obj, Object obj1)
    {
        Collection collection = (Collection)map.get(obj);
        boolean flag;
        if (collection == null)
        {
            flag = false;
        } else
        {
            flag = collection.remove(obj1);
            if (flag)
            {
                totalSize = -1 + totalSize;
                if (collection.isEmpty())
                {
                    map.remove(obj);
                    return flag;
                }
            }
        }
        return flag;
    }

    public Collection removeAll(Object obj)
    {
        Collection collection = (Collection)map.remove(obj);
        Collection collection1 = createCollection();
        if (collection != null)
        {
            collection1.addAll(collection);
            totalSize = totalSize - collection.size();
            collection.clear();
        }
        return unmodifiableCollectionSubclass(collection1);
    }

    public Collection replaceValues(Object obj, Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        if (!iterator.hasNext())
            return removeAll(obj);
        Collection collection = getOrCreateCollection(obj);
        Collection collection1 = createCollection();
        collection1.addAll(collection);
        totalSize = totalSize - collection.size();
        collection.clear();
        do
        {
            if (!iterator.hasNext())
                break;
            if (collection.add(iterator.next()))
                totalSize = 1 + totalSize;
        } while (true);
        return unmodifiableCollectionSubclass(collection1);
    }

    final void setMap(Map map1)
    {
        map = map1;
        totalSize = 0;
        for (Iterator iterator = map1.values().iterator(); iterator.hasNext();)
        {
            Collection collection = (Collection)iterator.next();
            boolean flag;
            if (!collection.isEmpty())
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            totalSize = totalSize + collection.size();
        }

    }

    public int size()
    {
        return totalSize;
    }

    public String toString()
    {
        return map.toString();
    }

    public Collection values()
    {
        Object obj = valuesCollection;
        if (obj == null)
        {
            obj = new Multimaps.Values() {

                final AbstractMultimap this$0;

                Multimap multimap()
                {
                    return AbstractMultimap.this;
                }

            
            {
                this$0 = AbstractMultimap.this;
                super();
            }
            }
;
            valuesCollection = ((Collection) (obj));
        }
        return ((Collection) (obj));
    }




/*
    static int access$208(AbstractMultimap abstractmultimap)
    {
        int i = abstractmultimap.totalSize;
        abstractmultimap.totalSize = i + 1;
        return i;
    }

*/


/*
    static int access$210(AbstractMultimap abstractmultimap)
    {
        int i = abstractmultimap.totalSize;
        abstractmultimap.totalSize = i - 1;
        return i;
    }

*/


/*
    static int access$212(AbstractMultimap abstractmultimap, int i)
    {
        int j = i + abstractmultimap.totalSize;
        abstractmultimap.totalSize = j;
        return j;
    }

*/


/*
    static int access$220(AbstractMultimap abstractmultimap, int i)
    {
        int j = abstractmultimap.totalSize - i;
        abstractmultimap.totalSize = j;
        return j;
    }

*/



}
