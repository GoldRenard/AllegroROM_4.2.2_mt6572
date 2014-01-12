// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractMultiset, Count, Multisets, ForwardingSet, 
//            Iterators

abstract class AbstractMapBasedMultiset extends AbstractMultiset
    implements Serializable
{
    class MapBasedElementSet extends ForwardingSet
    {

        private final Set _flddelegate;
        private final Map map;
        final AbstractMapBasedMultiset this$0;

        public void clear()
        {
            if (map == backingMap)
            {
                AbstractMapBasedMultiset.this.clear();
            } else
            {
                for (Iterator iterator1 = iterator(); iterator1.hasNext(); iterator1.remove())
                    iterator1.next();

            }
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

        public Map getMap()
        {
            return map;
        }

        public Iterator iterator()
        {
            return map.entrySet().iterator(). new Iterator() {

                final MapBasedElementSet this$1;
                java.util.Map.Entry toRemove;
                final Iterator val$entries;

                public boolean hasNext()
                {
                    return entries.hasNext();
                }

                public Object next()
                {
                    toRemove = (java.util.Map.Entry)entries.next();
                    return toRemove.getKey();
                }

                public void remove()
                {
                    boolean flag;
                    if (toRemove != null)
                        flag = true;
                    else
                        flag = false;
                    Preconditions.checkState(flag, "no calls to next() since the last call to remove()");
                    long l1 = 
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$1 = final_mapbasedelementset;
                entries = Iterator.this;
                super();
            }
            }
;
        }

        public boolean remove(Object obj)
        {
            return removeAllOccurrences(obj, map) != 0;
        }

        public boolean removeAll(Collection collection)
        {
            return Iterators.removeAll(iterator(), collection);
        }

        public boolean retainAll(Collection collection)
        {
            return Iterators.retainAll(iterator(), collection);
        }

        MapBasedElementSet(Map map1)
        {
            this$0 = AbstractMapBasedMultiset.this;
            super();
            map = map1;
            _flddelegate = map1.keySet();
        }
    }

    private class MapBasedMultisetIterator
        implements Iterator
    {

        boolean canRemove;
        java.util.Map.Entry currentEntry;
        final Iterator entryIterator;
        int occurrencesLeft;
        final AbstractMapBasedMultiset this$0;

        public boolean hasNext()
        {
            return occurrencesLeft > 0 || entryIterator.hasNext();
        }

        public Object next()
        {
            if (occurrencesLeft == 0)
            {
                currentEntry = (java.util.Map.Entry)entryIterator.next();
                occurrencesLeft = ((Count)currentEntry.getValue()).get();
            }
            occurrencesLeft = -1 + occurrencesLeft;
            canRemove = true;
            return currentEntry.getKey();
        }

        public void remove()
        {
            Preconditions.checkState(canRemove, "no calls to next() since the last call to remove()");
            if (((Count)currentEntry.getValue()).get() <= 0)
                throw new ConcurrentModificationException();
            if (((Count)currentEntry.getValue()).addAndGet(-1) == 0)
                entryIterator.remove();
            long l = 
// JavaClassFileOutputException: get_constant: invalid tag

        MapBasedMultisetIterator()
        {
            this$0 = AbstractMapBasedMultiset.this;
            super();
            entryIterator = backingMap.entrySet().iterator();
        }
    }


    private static final long serialVersionUID = 0xe0c3ab9b328ff63aL;
    private transient Map backingMap;
    private transient long size;

    protected AbstractMapBasedMultiset(Map map)
    {
        backingMap = (Map)Preconditions.checkNotNull(map);
        size = size();
    }

    private static int getAndSet(Count count1, int i)
    {
        if (count1 == null)
            return 0;
        else
            return count1.getAndSet(i);
    }

    private void readObjectNoData()
        throws ObjectStreamException
    {
        throw new InvalidObjectException("Stream data required");
    }

    private int removeAllOccurrences(Object obj, Map map)
    {
        Count count1 = (Count)map.remove(obj);
        if (count1 == null)
        {
            return 0;
        } else
        {
            int i = count1.getAndSet(0);
            size = size - (long)i;
            return i;
        }
    }

    public int add(Object obj, int i)
    {
        if (i == 0)
            return count(obj);
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "occurrences cannot be negative: %s", aobj);
        Count count1 = (Count)backingMap.get(obj);
        int j;
        if (count1 == null)
        {
            j = 0;
            backingMap.put(obj, new Count(i));
        } else
        {
            j = count1.get();
            long l = (long)j + (long)i;
            boolean flag1;
            if (l <= 0x7fffffffL)
                flag1 = true;
            else
                flag1 = false;
            Object aobj1[] = new Object[1];
            aobj1[0] = Long.valueOf(l);
            Preconditions.checkArgument(flag1, "too many occurrences: %s", aobj1);
            count1.getAndAdd(i);
        }
        size = size + (long)i;
        return j;
    }

    Map backingMap()
    {
        return backingMap;
    }

    public void clear()
    {
        for (Iterator iterator1 = backingMap.values().iterator(); iterator1.hasNext(); ((Count)iterator1.next()).set(0));
        backingMap.clear();
        size = 0L;
    }

    public int count(Object obj)
    {
        Count count1;
        int i;
        try
        {
            count1 = (Count)backingMap.get(obj);
        }
        catch (NullPointerException nullpointerexception)
        {
            return 0;
        }
        catch (ClassCastException classcastexception)
        {
            return 0;
        }
        if (count1 == null)
            return 0;
        i = count1.get();
        return i;
    }

    Set createElementSet()
    {
        return new MapBasedElementSet(backingMap);
    }

    int distinctElements()
    {
        return backingMap.size();
    }

    Iterator entryIterator()
    {
        return new Iterator() {

            final AbstractMapBasedMultiset this$0;
            java.util.Map.Entry toRemove;
            final Iterator val$backingEntries;

            public boolean hasNext()
            {
                return backingEntries.hasNext();
            }

            public Multiset.Entry next()
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)backingEntries.next();
                toRemove = entry;
                return entry. new Multisets.AbstractEntry() {

                    final _cls1 this$1;
                    final java.util.Map.Entry val$mapEntry;

                    public int getCount()
                    {
                        int i = ((Count)mapEntry.getValue()).get();
                        if (i == 0)
                        {
                            Count count1 = (Count)backingMap.get(getElement());
                            if (count1 != null)
                                i = count1.get();
                        }
                        return i;
                    }

                    public Object getElement()
                    {
                        return mapEntry.getKey();
                    }

            
            {
                this$1 = final__pcls1;
                mapEntry = java.util.Map.Entry.this;
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
                boolean flag;
                if (toRemove != null)
                    flag = true;
                else
                    flag = false;
                Preconditions.checkState(flag, "no calls to next() since the last call to remove()");
                long l1 = ((_cls1) (this)).toRemove - <no variable>;
                backingEntries.remove();
                toRemove = null;
            }

            
            {
                this$0 = AbstractMapBasedMultiset.this;
                backingEntries = iterator1;
                super();
            }
        }
;
    }

    public Set entrySet()
    {
        return super.entrySet();
    }

    public Iterator iterator()
    {
        return new MapBasedMultisetIterator();
    }

    public int remove(Object obj, int i)
    {
        int j;
        if (i == 0)
        {
            j = count(obj);
        } else
        {
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            Preconditions.checkArgument(flag, "occurrences cannot be negative: %s", aobj);
            Count count1 = (Count)backingMap.get(obj);
            j = 0;
            if (count1 != null)
            {
                int k = count1.get();
                int l;
                if (k > i)
                {
                    l = i;
                } else
                {
                    l = k;
                    backingMap.remove(obj);
                }
                count1.addAndGet(-l);
                size = size - (long)l;
                return k;
            }
        }
        return j;
    }

    void setBackingMap(Map map)
    {
        backingMap = map;
    }

    public int setCount(Object obj, int i)
    {
        Multisets.checkNonnegative(i, "count");
        int j;
        if (i == 0)
        {
            j = getAndSet((Count)backingMap.remove(obj), i);
        } else
        {
            Count count1 = (Count)backingMap.get(obj);
            j = getAndSet(count1, i);
            if (count1 == null)
                backingMap.put(obj, new Count(i));
        }
        size = size + (long)(i - j);
        return j;
    }

    public int size()
    {
        return Ints.saturatedCast(size);
    }



/*
    static long access$110(AbstractMapBasedMultiset abstractmapbasedmultiset)
    {
        long l = abstractmapbasedmultiset.size;
        abstractmapbasedmultiset.size = l - 1L;
        return l;
    }

*/


/*
    static long access$122(AbstractMapBasedMultiset abstractmapbasedmultiset, long l)
    {
        long l1 = abstractmapbasedmultiset.size - l;
        abstractmapbasedmultiset.size = l1;
        return l1;
    }

*/

}
