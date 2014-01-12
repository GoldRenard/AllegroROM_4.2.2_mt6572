// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableBiMap, ImmutableListMultimap, ImmutableMultimap, ImmutableMultiset, 
//            ImmutableSetMultimap, BiMap, ListMultimap, Multimap, 
//            Multiset, SetMultimap, SortedSetMultimap, Maps, 
//            Collections2, Sets, Iterators, ObjectArrays, 
//            ForwardingIterator, ForwardingMapEntry

final class Synchronized
{
    private static class SynchronizedAsMap extends SynchronizedMap
    {

        private static final long serialVersionUID;
        transient Set asMapEntrySet;
        transient Collection asMapValues;

        public boolean containsValue(Object obj)
        {
            return values().contains(obj);
        }

        public Set entrySet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (asMapEntrySet == null)
                    asMapEntrySet = new SynchronizedAsMapEntries(_mthdelegate().entrySet(), super.mutex);
                set1 = asMapEntrySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Collection get(Object obj)
        {
            Object obj1 = super.mutex;
            obj1;
            JVM INSTR monitorenter ;
            Collection collection1 = (Collection)super.get(obj);
            if (collection1 != null) goto _L2; else goto _L1
_L1:
            Collection collection2 = null;
_L4:
            obj1;
            JVM INSTR monitorexit ;
            return collection2;
_L2:
            collection2 = Synchronized.typePreservingCollection(collection1, super.mutex);
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection values()
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                if (asMapValues == null)
                    asMapValues = new SynchronizedAsMapValues(_mthdelegate().values(), super.mutex);
                collection1 = asMapValues;
            }
            return collection1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedAsMap(Map map1, Object obj)
        {
            super(map1, obj);
        }
    }

    private static class SynchronizedAsMapEntries extends SynchronizedSet
    {

        private static final long serialVersionUID;

        public boolean contains(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Maps.containsEntryImpl(_mthdelegate(), obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Collections2.containsAllImpl(_mthdelegate(), collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Sets.equalsImpl(_mthdelegate(), obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Iterator iterator()
        {
            return super.iterator(). new ForwardingIterator() {

                final SynchronizedAsMapEntries this$0;
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
                    return ((java.util.Map.Entry)iterator.next()). new ForwardingMapEntry() {

                        final SynchronizedAsMapEntries._cls1 this$1;
                        final java.util.Map.Entry val$entry;

                        protected volatile Object _mthdelegate()
                        {
                            return _mthdelegate();
                        }

                        protected java.util.Map.Entry _mthdelegate()
                        {
                            return entry;
                        }

                        public volatile Object getValue()
                        {
                            return getValue();
                        }

                        public Collection getValue()
                        {
                            return Synchronized.typePreservingCollection((Collection)entry.getValue(), mutex);
                        }

            
            {
                this$1 = final__pcls1;
                entry = java.util.Map.Entry.this;
                super();
            }
                    }
;
                }

            
            {
                this$0 = final_synchronizedasmapentries;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Maps.removeEntryImpl(_mthdelegate(), obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean removeAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Iterators.removeAll(_mthdelegate().iterator(), collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean retainAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = Iterators.retainAll(_mthdelegate().iterator(), collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object[] toArray()
        {
            Object aobj[];
            synchronized (super.mutex)
            {
                aobj = ObjectArrays.toArrayImpl(_mthdelegate());
            }
            return aobj;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object[] toArray(Object aobj[])
        {
            Object aobj1[];
            synchronized (super.mutex)
            {
                aobj1 = ObjectArrays.toArrayImpl(_mthdelegate(), aobj);
            }
            return aobj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedAsMapEntries(Set set1, Object obj)
        {
            super(set1, obj);
        }
    }

    private static class SynchronizedAsMapValues extends SynchronizedCollection
    {

        private static final long serialVersionUID;

        public Iterator iterator()
        {
            return super.iterator(). new ForwardingIterator() {

                final SynchronizedAsMapValues this$0;
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

                public Collection next()
                {
                    return Synchronized.typePreservingCollection((Collection)iterator.next(), mutex);
                }

            
            {
                this$0 = final_synchronizedasmapvalues;
                iterator = Iterator.this;
                super();
            }
            }
;
        }

        SynchronizedAsMapValues(Collection collection1, Object obj)
        {
            super(collection1, obj);
        }
    }

    static class SynchronizedBiMap extends SynchronizedMap
        implements BiMap, Serializable
    {

        private static final long serialVersionUID;
        private transient BiMap inverse;
        private transient Set valueSet;

        BiMap _mthdelegate()
        {
            return (BiMap)super._mthdelegate();
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Map _mthdelegate()
        {
            return _mthdelegate();
        }

        public Object forcePut(Object obj, Object obj1)
        {
            Object obj3;
            synchronized (super.mutex)
            {
                obj3 = _mthdelegate().forcePut(obj, obj1);
            }
            return obj3;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public BiMap inverse()
        {
            BiMap bimap;
            synchronized (super.mutex)
            {
                if (inverse == null)
                    inverse = new SynchronizedBiMap(_mthdelegate().inverse(), super.mutex, this);
                bimap = inverse;
            }
            return bimap;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection values()
        {
            return values();
        }

        public Set values()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (valueSet == null)
                    valueSet = Synchronized.set(_mthdelegate().values(), super.mutex);
                set1 = valueSet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private SynchronizedBiMap(BiMap bimap, Object obj, BiMap bimap1)
        {
            super(bimap, obj);
            inverse = bimap1;
        }

    }

    static class SynchronizedCollection extends SynchronizedObject
        implements Collection
    {

        private static final long serialVersionUID;

        public boolean add(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().add(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean addAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().addAll(collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void clear()
        {
            synchronized (super.mutex)
            {
                _mthdelegate().clear();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean contains(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().contains(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsAll(collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        Collection _mthdelegate()
        {
            return (Collection)super._mthdelegate();
        }

        public boolean isEmpty()
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().isEmpty();
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Iterator iterator()
        {
            return _mthdelegate().iterator();
        }

        public boolean remove(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().remove(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean removeAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().removeAll(collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean retainAll(Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().retainAll(collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int size()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().size();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object[] toArray()
        {
            Object aobj[];
            synchronized (super.mutex)
            {
                aobj = _mthdelegate().toArray();
            }
            return aobj;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object[] toArray(Object aobj[])
        {
            Object aobj1[];
            synchronized (super.mutex)
            {
                aobj1 = _mthdelegate().toArray(aobj);
            }
            return aobj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        private SynchronizedCollection(Collection collection1, Object obj)
        {
            super(collection1, obj);
        }

    }

    private static class SynchronizedList extends SynchronizedCollection
        implements List
    {

        private static final long serialVersionUID;

        public void add(int i, Object obj)
        {
            synchronized (super.mutex)
            {
                _mthdelegate().add(i, obj);
            }
            return;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean addAll(int i, Collection collection1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().addAll(i, collection1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        List _mthdelegate()
        {
            return (List)super._mthdelegate();
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().equals(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object get(int i)
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().get(i);
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int hashCode()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().hashCode();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int indexOf(Object obj)
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().indexOf(obj);
            }
            return i;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int lastIndexOf(Object obj)
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().lastIndexOf(obj);
            }
            return i;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public ListIterator listIterator()
        {
            return _mthdelegate().listIterator();
        }

        public ListIterator listIterator(int i)
        {
            return _mthdelegate().listIterator(i);
        }

        public Object remove(int i)
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().remove(i);
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object set(int i, Object obj)
        {
            Object obj2;
            synchronized (super.mutex)
            {
                obj2 = _mthdelegate().set(i, obj);
            }
            return obj2;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public List subList(int i, int j)
        {
            List list1;
            synchronized (super.mutex)
            {
                list1 = Synchronized.list(_mthdelegate().subList(i, j), super.mutex);
            }
            return list1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedList(List list1, Object obj)
        {
            super(list1, obj);
        }
    }

    private static class SynchronizedListMultimap extends SynchronizedMultimap
        implements ListMultimap
    {

        private static final long serialVersionUID;

        ListMultimap _mthdelegate()
        {
            return (ListMultimap)super._mthdelegate();
        }

        volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public List get(Object obj)
        {
            List list1;
            synchronized (super.mutex)
            {
                list1 = Synchronized.list(_mthdelegate().get(obj), super.mutex);
            }
            return list1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public List removeAll(Object obj)
        {
            List list1;
            synchronized (super.mutex)
            {
                list1 = _mthdelegate().removeAll(obj);
            }
            return list1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public List replaceValues(Object obj, Iterable iterable)
        {
            List list1;
            synchronized (super.mutex)
            {
                list1 = _mthdelegate().replaceValues(obj, iterable);
            }
            return list1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedListMultimap(ListMultimap listmultimap, Object obj)
        {
            super(listmultimap, obj);
        }
    }

    private static class SynchronizedMap extends SynchronizedObject
        implements Map
    {

        private static final long serialVersionUID;
        transient Set entrySet;
        transient Set keySet;
        transient Collection values;

        public void clear()
        {
            synchronized (super.mutex)
            {
                _mthdelegate().clear();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsKey(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsKey(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsValue(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsValue(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        Map _mthdelegate()
        {
            return (Map)super._mthdelegate();
        }

        public Set entrySet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (entrySet == null)
                    entrySet = Synchronized.set(_mthdelegate().entrySet(), super.mutex);
                set1 = entrySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().equals(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object get(Object obj)
        {
            Object obj2;
            synchronized (super.mutex)
            {
                obj2 = _mthdelegate().get(obj);
            }
            return obj2;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int hashCode()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().hashCode();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean isEmpty()
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().isEmpty();
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Set keySet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (keySet == null)
                    keySet = Synchronized.set(_mthdelegate().keySet(), super.mutex);
                set1 = keySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object put(Object obj, Object obj1)
        {
            Object obj3;
            synchronized (super.mutex)
            {
                obj3 = _mthdelegate().put(obj, obj1);
            }
            return obj3;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void putAll(Map map1)
        {
            synchronized (super.mutex)
            {
                _mthdelegate().putAll(map1);
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object remove(Object obj)
        {
            Object obj2;
            synchronized (super.mutex)
            {
                obj2 = _mthdelegate().remove(obj);
            }
            return obj2;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int size()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().size();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection values()
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                if (values == null)
                    values = Synchronized.collection(_mthdelegate().values(), super.mutex);
                collection1 = values;
            }
            return collection1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedMap(Map map1, Object obj)
        {
            super(map1, obj);
        }
    }

    private static class SynchronizedMultimap extends SynchronizedObject
        implements Multimap
    {

        private static final long serialVersionUID;
        transient Map asMap;
        transient Collection entries;
        transient Set keySet;
        transient Multiset keys;
        transient Collection valuesCollection;

        public Map asMap()
        {
            Map map1;
            synchronized (super.mutex)
            {
                if (asMap == null)
                    asMap = new SynchronizedAsMap(_mthdelegate().asMap(), super.mutex);
                map1 = asMap;
            }
            return map1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void clear()
        {
            synchronized (super.mutex)
            {
                _mthdelegate().clear();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsEntry(Object obj, Object obj1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsEntry(obj, obj1);
            }
            return flag;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsKey(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsKey(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean containsValue(Object obj)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().containsValue(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        Multimap _mthdelegate()
        {
            return (Multimap)super._mthdelegate();
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public Collection entries()
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                if (entries == null)
                    entries = Synchronized.typePreservingCollection(_mthdelegate().entries(), super.mutex);
                collection1 = entries;
            }
            return collection1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().equals(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection get(Object obj)
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                collection1 = Synchronized.typePreservingCollection(_mthdelegate().get(obj), super.mutex);
            }
            return collection1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int hashCode()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().hashCode();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean isEmpty()
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().isEmpty();
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Set keySet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (keySet == null)
                    keySet = Synchronized.typePreservingSet(_mthdelegate().keySet(), super.mutex);
                set1 = keySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Multiset keys()
        {
            Multiset multiset1;
            synchronized (super.mutex)
            {
                if (keys == null)
                    keys = Synchronized.multiset(_mthdelegate().keys(), super.mutex);
                multiset1 = keys;
            }
            return multiset1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean put(Object obj, Object obj1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().put(obj, obj1);
            }
            return flag;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean putAll(Multimap multimap1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().putAll(multimap1);
            }
            return flag;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean putAll(Object obj, Iterable iterable)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().putAll(obj, iterable);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean remove(Object obj, Object obj1)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().remove(obj, obj1);
            }
            return flag;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection removeAll(Object obj)
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                collection1 = _mthdelegate().removeAll(obj);
            }
            return collection1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection replaceValues(Object obj, Iterable iterable)
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                collection1 = _mthdelegate().replaceValues(obj, iterable);
            }
            return collection1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int size()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().size();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Collection values()
        {
            Collection collection1;
            synchronized (super.mutex)
            {
                if (valuesCollection == null)
                    valuesCollection = Synchronized.collection(_mthdelegate().values(), super.mutex);
                collection1 = valuesCollection;
            }
            return collection1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedMultimap(Multimap multimap1, Object obj)
        {
            super(multimap1, obj);
        }
    }

    private static class SynchronizedMultiset extends SynchronizedCollection
        implements Multiset
    {

        private static final long serialVersionUID;
        transient Set elementSet;
        transient Set entrySet;

        public int add(Object obj, int i)
        {
            int j;
            synchronized (super.mutex)
            {
                j = _mthdelegate().add(obj, i);
            }
            return j;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int count(Object obj)
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().count(obj);
            }
            return i;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        Multiset _mthdelegate()
        {
            return (Multiset)super._mthdelegate();
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        public Set elementSet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (elementSet == null)
                    elementSet = Synchronized.typePreservingSet(_mthdelegate().elementSet(), super.mutex);
                set1 = elementSet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Set entrySet()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (entrySet == null)
                    entrySet = Synchronized.typePreservingSet(_mthdelegate().entrySet(), super.mutex);
                set1 = entrySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().equals(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int hashCode()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().hashCode();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int remove(Object obj, int i)
        {
            int j;
            synchronized (super.mutex)
            {
                j = _mthdelegate().remove(obj, i);
            }
            return j;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int setCount(Object obj, int i)
        {
            int j;
            synchronized (super.mutex)
            {
                j = _mthdelegate().setCount(obj, i);
            }
            return j;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public boolean setCount(Object obj, int i, int j)
        {
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().setCount(obj, i, j);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedMultiset(Multiset multiset1, Object obj)
        {
            super(multiset1, obj);
        }
    }

    static class SynchronizedObject
        implements Serializable
    {

        private static final long serialVersionUID;
        final Object _flddelegate;
        final Object mutex;

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            synchronized (mutex)
            {
                objectoutputstream.defaultWriteObject();
            }
            return;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        Object _mthdelegate()
        {
            return _flddelegate;
        }

        public String toString()
        {
            String s;
            synchronized (mutex)
            {
                s = _flddelegate.toString();
            }
            return s;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedObject(Object obj, Object obj1)
        {
            _flddelegate = Preconditions.checkNotNull(obj);
            if (obj1 == null)
                obj1 = this;
            mutex = obj1;
        }
    }

    private static class SynchronizedRandomAccessList extends SynchronizedList
        implements RandomAccess
    {

        private static final long serialVersionUID;

        SynchronizedRandomAccessList(List list1, Object obj)
        {
            super(list1, obj);
        }
    }

    static class SynchronizedSet extends SynchronizedCollection
        implements Set
    {

        private static final long serialVersionUID;

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        Set _mthdelegate()
        {
            return (Set)super._mthdelegate();
        }

        public boolean equals(Object obj)
        {
            if (obj == this)
                return true;
            boolean flag;
            synchronized (super.mutex)
            {
                flag = _mthdelegate().equals(obj);
            }
            return flag;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public int hashCode()
        {
            int i;
            synchronized (super.mutex)
            {
                i = _mthdelegate().hashCode();
            }
            return i;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedSet(Set set1, Object obj)
        {
            super(set1, obj);
        }
    }

    private static class SynchronizedSetMultimap extends SynchronizedMultimap
        implements SetMultimap
    {

        private static final long serialVersionUID;
        transient Set entrySet;

        volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        SetMultimap _mthdelegate()
        {
            return (SetMultimap)super._mthdelegate();
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Collection entries()
        {
            return entries();
        }

        public Set entries()
        {
            Set set1;
            synchronized (super.mutex)
            {
                if (entrySet == null)
                    entrySet = Synchronized.set(_mthdelegate().entries(), super.mutex);
                set1 = entrySet;
            }
            return set1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection get(Object obj)
        {
            return get(obj);
        }

        public Set get(Object obj)
        {
            Set set1;
            synchronized (super.mutex)
            {
                set1 = Synchronized.set(_mthdelegate().get(obj), super.mutex);
            }
            return set1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection removeAll(Object obj)
        {
            return removeAll(obj);
        }

        public Set removeAll(Object obj)
        {
            Set set1;
            synchronized (super.mutex)
            {
                set1 = _mthdelegate().removeAll(obj);
            }
            return set1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public volatile Collection replaceValues(Object obj, Iterable iterable)
        {
            return replaceValues(obj, iterable);
        }

        public Set replaceValues(Object obj, Iterable iterable)
        {
            Set set1;
            synchronized (super.mutex)
            {
                set1 = _mthdelegate().replaceValues(obj, iterable);
            }
            return set1;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedSetMultimap(SetMultimap setmultimap, Object obj)
        {
            super(setmultimap, obj);
        }
    }

    static class SynchronizedSortedMap extends SynchronizedMap
        implements SortedMap
    {

        private static final long serialVersionUID;

        public Comparator comparator()
        {
            Comparator comparator1;
            synchronized (super.mutex)
            {
                comparator1 = _mthdelegate().comparator();
            }
            return comparator1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Map _mthdelegate()
        {
            return _mthdelegate();
        }

        SortedMap _mthdelegate()
        {
            return (SortedMap)super._mthdelegate();
        }

        public Object firstKey()
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().firstKey();
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedMap headMap(Object obj)
        {
            SortedMap sortedmap;
            synchronized (super.mutex)
            {
                sortedmap = Synchronized.sortedMap(_mthdelegate().headMap(obj), super.mutex);
            }
            return sortedmap;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object lastKey()
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().lastKey();
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedMap subMap(Object obj, Object obj1)
        {
            SortedMap sortedmap;
            synchronized (super.mutex)
            {
                sortedmap = Synchronized.sortedMap(_mthdelegate().subMap(obj, obj1), super.mutex);
            }
            return sortedmap;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedMap tailMap(Object obj)
        {
            SortedMap sortedmap;
            synchronized (super.mutex)
            {
                sortedmap = Synchronized.sortedMap(_mthdelegate().tailMap(obj), super.mutex);
            }
            return sortedmap;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedSortedMap(SortedMap sortedmap, Object obj)
        {
            super(sortedmap, obj);
        }
    }

    static class SynchronizedSortedSet extends SynchronizedSet
        implements SortedSet
    {

        private static final long serialVersionUID;

        public Comparator comparator()
        {
            Comparator comparator1;
            synchronized (super.mutex)
            {
                comparator1 = _mthdelegate().comparator();
            }
            return comparator1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile Set _mthdelegate()
        {
            return _mthdelegate();
        }

        SortedSet _mthdelegate()
        {
            return (SortedSet)super._mthdelegate();
        }

        public Object first()
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().first();
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedSet headSet(Object obj)
        {
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = Synchronized.sortedSet(_mthdelegate().headSet(obj), super.mutex);
            }
            return sortedset;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object last()
        {
            Object obj1;
            synchronized (super.mutex)
            {
                obj1 = _mthdelegate().last();
            }
            return obj1;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedSet subSet(Object obj, Object obj1)
        {
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = Synchronized.sortedSet(_mthdelegate().subSet(obj, obj1), super.mutex);
            }
            return sortedset;
            exception;
            obj2;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public SortedSet tailSet(Object obj)
        {
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = Synchronized.sortedSet(_mthdelegate().tailSet(obj), super.mutex);
            }
            return sortedset;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedSortedSet(SortedSet sortedset, Object obj)
        {
            super(sortedset, obj);
        }
    }

    private static class SynchronizedSortedSetMultimap extends SynchronizedSetMultimap
        implements SortedSetMultimap
    {

        private static final long serialVersionUID;

        volatile Multimap _mthdelegate()
        {
            return _mthdelegate();
        }

        volatile SetMultimap _mthdelegate()
        {
            return _mthdelegate();
        }

        SortedSetMultimap _mthdelegate()
        {
            return (SortedSetMultimap)super._mthdelegate();
        }

        volatile Object _mthdelegate()
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
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = Synchronized.sortedSet(_mthdelegate().get(obj), super.mutex);
            }
            return sortedset;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
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
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = _mthdelegate().removeAll(obj);
            }
            return sortedset;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
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
            SortedSet sortedset;
            synchronized (super.mutex)
            {
                sortedset = _mthdelegate().replaceValues(obj, iterable);
            }
            return sortedset;
            exception;
            obj1;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Comparator valueComparator()
        {
            Comparator comparator;
            synchronized (super.mutex)
            {
                comparator = _mthdelegate().valueComparator();
            }
            return comparator;
            exception;
            obj;
            JVM INSTR monitorexit ;
            throw exception;
        }

        SynchronizedSortedSetMultimap(SortedSetMultimap sortedsetmultimap, Object obj)
        {
            super(sortedsetmultimap, obj);
        }
    }


    private Synchronized()
    {
    }

    static BiMap biMap(BiMap bimap, Object obj)
    {
        if (!(bimap instanceof SynchronizedBiMap) && !(bimap instanceof ImmutableBiMap))
            return new SynchronizedBiMap(bimap, obj, null);
        else
            return bimap;
    }

    private static Collection collection(Collection collection1, Object obj)
    {
        return new SynchronizedCollection(collection1, obj);
    }

    private static List list(List list1, Object obj)
    {
        if (list1 instanceof RandomAccess)
            return new SynchronizedRandomAccessList(list1, obj);
        else
            return new SynchronizedList(list1, obj);
    }

    static ListMultimap listMultimap(ListMultimap listmultimap, Object obj)
    {
        if (!(listmultimap instanceof SynchronizedListMultimap) && !(listmultimap instanceof ImmutableListMultimap))
            return new SynchronizedListMultimap(listmultimap, obj);
        else
            return listmultimap;
    }

    static Map map(Map map1, Object obj)
    {
        return new SynchronizedMap(map1, obj);
    }

    static Multimap multimap(Multimap multimap1, Object obj)
    {
        if (!(multimap1 instanceof SynchronizedMultimap) && !(multimap1 instanceof ImmutableMultimap))
            return new SynchronizedMultimap(multimap1, obj);
        else
            return multimap1;
    }

    static Multiset multiset(Multiset multiset1, Object obj)
    {
        if (!(multiset1 instanceof SynchronizedMultiset) && !(multiset1 instanceof ImmutableMultiset))
            return new SynchronizedMultiset(multiset1, obj);
        else
            return multiset1;
    }

    static Set set(Set set1, Object obj)
    {
        return new SynchronizedSet(set1, obj);
    }

    static SetMultimap setMultimap(SetMultimap setmultimap, Object obj)
    {
        if (!(setmultimap instanceof SynchronizedSetMultimap) && !(setmultimap instanceof ImmutableSetMultimap))
            return new SynchronizedSetMultimap(setmultimap, obj);
        else
            return setmultimap;
    }

    static SortedMap sortedMap(SortedMap sortedmap, Object obj)
    {
        return new SynchronizedSortedMap(sortedmap, obj);
    }

    private static SortedSet sortedSet(SortedSet sortedset, Object obj)
    {
        return new SynchronizedSortedSet(sortedset, obj);
    }

    static SortedSetMultimap sortedSetMultimap(SortedSetMultimap sortedsetmultimap, Object obj)
    {
        if (sortedsetmultimap instanceof SynchronizedSortedSetMultimap)
            return sortedsetmultimap;
        else
            return new SynchronizedSortedSetMultimap(sortedsetmultimap, obj);
    }

    private static Collection typePreservingCollection(Collection collection1, Object obj)
    {
        if (collection1 instanceof SortedSet)
            return sortedSet((SortedSet)collection1, obj);
        if (collection1 instanceof Set)
            return set((Set)collection1, obj);
        if (collection1 instanceof List)
            return list((List)collection1, obj);
        else
            return collection(collection1, obj);
    }

    private static Set typePreservingSet(Set set1, Object obj)
    {
        if (set1 instanceof SortedSet)
            return sortedSet((SortedSet)set1, obj);
        else
            return set(set1, obj);
    }





}
