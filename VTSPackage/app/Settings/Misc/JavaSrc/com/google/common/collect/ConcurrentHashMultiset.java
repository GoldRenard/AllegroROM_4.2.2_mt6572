// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import com.google.common.primitives.Ints;
import java.io.*;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package com.google.common.collect:
//            AbstractMultiset, GenericMapMaker, Iterables, Lists, 
//            Multisets, Iterators, Multiset, ForwardingSet, 
//            Serialization, AbstractIterator, ForwardingIterator

public final class ConcurrentHashMultiset extends AbstractMultiset
    implements Serializable
{
    private class EntrySet extends AbstractMultiset.EntrySet
    {

        final ConcurrentHashMultiset this$0;

        private List snapshot()
        {
            java.util.ArrayList arraylist = Lists.newArrayListWithExpectedSize(size());
            Iterators.addAll(arraylist, iterator());
            return arraylist;
        }

        ConcurrentHashMultiset multiset()
        {
            return ConcurrentHashMultiset.this;
        }

        volatile Multiset multiset()
        {
            return multiset();
        }

        public boolean remove(Object obj)
        {
            boolean flag = obj instanceof Multiset.Entry;
            boolean flag1 = false;
            if (flag)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                Object obj1 = entry.getElement();
                int i = entry.getCount();
                flag1 = false;
                if (i != 0)
                    flag1 = multiset().setCount(obj1, i, 0);
            }
            return flag1;
        }

        public Object[] toArray()
        {
            return snapshot().toArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return snapshot().toArray(aobj);
        }

        private EntrySet()
        {
            this$0 = ConcurrentHashMultiset.this;
            super(ConcurrentHashMultiset.this);
        }

    }

    private static class FieldSettersHolder
    {

        static final Serialization.FieldSetter COUNT_MAP_FIELD_SETTER = Serialization.getFieldSetter(com/google/common/collect/ConcurrentHashMultiset, "countMap");


        private FieldSettersHolder()
        {
        }
    }


    private static final long serialVersionUID = 1L;
    private final transient ConcurrentMap countMap;
    private transient EntrySet entrySet;

    ConcurrentHashMultiset(ConcurrentMap concurrentmap)
    {
        Preconditions.checkArgument(concurrentmap.isEmpty());
        countMap = concurrentmap;
    }

    public static ConcurrentHashMultiset create()
    {
        return new ConcurrentHashMultiset(new ConcurrentHashMap());
    }

    public static ConcurrentHashMultiset create(GenericMapMaker genericmapmaker)
    {
        return new ConcurrentHashMultiset(genericmapmaker.makeMap());
    }

    public static ConcurrentHashMultiset create(Iterable iterable)
    {
        ConcurrentHashMultiset concurrenthashmultiset = create();
        Iterables.addAll(concurrenthashmultiset, iterable);
        return concurrenthashmultiset;
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        ConcurrentMap concurrentmap = (ConcurrentMap)objectinputstream.readObject();
        FieldSettersHolder.COUNT_MAP_FIELD_SETTER.set(this, concurrentmap);
    }

    private AtomicInteger safeGet(Object obj)
    {
        AtomicInteger atomicinteger;
        try
        {
            atomicinteger = (AtomicInteger)countMap.get(obj);
        }
        catch (NullPointerException nullpointerexception)
        {
            return null;
        }
        catch (ClassCastException classcastexception)
        {
            return null;
        }
        return atomicinteger;
    }

    private List snapshot()
    {
        java.util.ArrayList arraylist = Lists.newArrayListWithExpectedSize(size());
        for (Iterator iterator1 = entrySet().iterator(); iterator1.hasNext();)
        {
            Multiset.Entry entry = (Multiset.Entry)iterator1.next();
            Object obj = entry.getElement();
            int i = entry.getCount();
            while (i > 0) 
            {
                arraylist.add(obj);
                i--;
            }
        }

        return arraylist;
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        objectoutputstream.writeObject(countMap);
    }

    public int add(Object obj, int i)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        int k = count(obj);
_L4:
        return k;
_L2:
        AtomicInteger atomicinteger;
        boolean flag;
        Object aobj[];
        boolean flag1;
        if (i > 0)
            flag = true;
        else
            flag = false;
        aobj = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "Invalid occurrences: %s", aobj);
_L6:
        atomicinteger = safeGet(obj);
        if (atomicinteger != null)
            break; /* Loop/switch isn't completed */
        atomicinteger = (AtomicInteger)countMap.putIfAbsent(obj, new AtomicInteger(i));
        k = 0;
        if (atomicinteger == null) goto _L4; else goto _L3
_L3:
        AtomicInteger atomicinteger1;
        Object obj1;
        do
        {
            int j = atomicinteger.get();
            if (j == 0)
                break;
            try
            {
                flag1 = atomicinteger.compareAndSet(j, IntMath.checkedAdd(j, i));
            }
            catch (ArithmeticException arithmeticexception)
            {
                throw new IllegalArgumentException((new StringBuilder()).append("Overflow adding ").append(i).append(" occurrences to a count of ").append(j).toString());
            }
            if (flag1)
                return j;
        } while (true);
        atomicinteger1 = new AtomicInteger(i);
        obj1 = countMap.putIfAbsent(obj, atomicinteger1);
        k = 0;
        if (obj1 == null) goto _L4; else goto _L5
_L5:
        if (countMap.replace(obj, atomicinteger, atomicinteger1))
            return 0;
          goto _L6
    }

    public volatile boolean add(Object obj)
    {
        return super.add(obj);
    }

    public volatile boolean addAll(Collection collection)
    {
        return super.addAll(collection);
    }

    public void clear()
    {
        countMap.clear();
    }

    public volatile boolean contains(Object obj)
    {
        return super.contains(obj);
    }

    public int count(Object obj)
    {
        AtomicInteger atomicinteger = safeGet(obj);
        if (atomicinteger == null)
            return 0;
        else
            return atomicinteger.get();
    }

    Set createElementSet()
    {
        return new ForwardingSet() {

            final ConcurrentHashMultiset this$0;
            final Set val$delegate;

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
                return delegate;
            }

            public boolean remove(Object obj)
            {
                boolean flag;
                try
                {
                    flag = delegate.remove(obj);
                }
                catch (NullPointerException nullpointerexception)
                {
                    return false;
                }
                catch (ClassCastException classcastexception)
                {
                    return false;
                }
                return flag;
            }

            
            {
                this$0 = ConcurrentHashMultiset.this;
                delegate = set;
                super();
            }
        }
;
    }

    int distinctElements()
    {
        return countMap.size();
    }

    public volatile Set elementSet()
    {
        return super.elementSet();
    }

    Iterator entryIterator()
    {
        return new ForwardingIterator() {

            private Multiset.Entry last;
            final ConcurrentHashMultiset this$0;
            final Iterator val$readOnlyIterator;

            protected volatile Object _mthdelegate()
            {
                return _mthdelegate();
            }

            protected Iterator _mthdelegate()
            {
                return readOnlyIterator;
            }

            public Multiset.Entry next()
            {
                last = (Multiset.Entry)super.next();
                return last;
            }

            public volatile Object next()
            {
                return next();
            }

            public void remove()
            {
                boolean flag;
                if (last != null)
                    flag = true;
                else
                    flag = false;
                Preconditions.checkState(flag);
                setCount(last.getElement(), 0);
                last = null;
            }

            
            {
                this$0 = ConcurrentHashMultiset.this;
                readOnlyIterator = iterator1;
                super();
            }
        }
;
    }

    public Set entrySet()
    {
        EntrySet entryset = entrySet;
        if (entryset == null)
        {
            entryset = new EntrySet();
            entrySet = entryset;
        }
        return entryset;
    }

    public volatile boolean equals(Object obj)
    {
        return super.equals(obj);
    }

    public volatile int hashCode()
    {
        return super.hashCode();
    }

    public boolean isEmpty()
    {
        return countMap.isEmpty();
    }

    public volatile Iterator iterator()
    {
        return super.iterator();
    }

    public int remove(Object obj, int i)
    {
        int j;
label0:
        {
            if (i == 0)
            {
                j = count(obj);
                break label0;
            }
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            Preconditions.checkArgument(flag, "Invalid occurrences: %s", aobj);
            AtomicInteger atomicinteger = safeGet(obj);
            j = 0;
            if (atomicinteger == null)
                break label0;
            int k;
            int l;
            do
            {
                k = atomicinteger.get();
                j = 0;
                if (k == 0)
                    break label0;
                l = Math.max(0, k - i);
            } while (!atomicinteger.compareAndSet(k, l));
            if (l == 0)
                countMap.remove(obj, atomicinteger);
            return k;
        }
        return j;
    }

    public volatile boolean remove(Object obj)
    {
        return super.remove(obj);
    }

    public volatile boolean removeAll(Collection collection)
    {
        return super.removeAll(collection);
    }

    public boolean removeExactly(Object obj, int i)
    {
        if (i != 0)
        {
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[1];
            aobj[0] = Integer.valueOf(i);
            Preconditions.checkArgument(flag, "Invalid occurrences: %s", aobj);
            AtomicInteger atomicinteger = safeGet(obj);
            if (atomicinteger == null)
                return false;
            int j;
            int k;
            do
            {
                j = atomicinteger.get();
                if (j < i)
                    return false;
                k = j - i;
            } while (!atomicinteger.compareAndSet(j, k));
            if (k == 0)
            {
                countMap.remove(obj, atomicinteger);
                return true;
            }
        }
        return true;
    }

    public volatile boolean retainAll(Collection collection)
    {
        return super.retainAll(collection);
    }

    public int setCount(Object obj, int i)
    {
        Multisets.checkNonnegative(i, "count");
_L2:
        AtomicInteger atomicinteger;
        int j;
        atomicinteger = safeGet(obj);
        if (atomicinteger == null)
        {
            if (i == 0)
            {
                j = 0;
                break MISSING_BLOCK_LABEL_144;
            }
            atomicinteger = (AtomicInteger)countMap.putIfAbsent(obj, new AtomicInteger(i));
            if (atomicinteger == null)
                return 0;
        }
_L4:
        AtomicInteger atomicinteger1;
        j = atomicinteger.get();
        if (j != 0)
            continue; /* Loop/switch isn't completed */
        if (i == 0)
            return 0;
        atomicinteger1 = new AtomicInteger(i);
        if (countMap.putIfAbsent(obj, atomicinteger1) != null && !countMap.replace(obj, atomicinteger, atomicinteger1)) goto _L2; else goto _L1
_L1:
        return 0;
        if (!atomicinteger.compareAndSet(j, i)) goto _L4; else goto _L3
_L3:
        if (i == 0)
        {
            countMap.remove(obj, atomicinteger);
            return j;
        }
        return j;
    }

    public boolean setCount(Object obj, int i, int j)
    {
label0:
        {
            boolean flag;
label1:
            {
                AtomicInteger atomicinteger;
                int k;
label2:
                {
                    boolean flag1;
label3:
                    {
                        flag = true;
                        Multisets.checkNonnegative(i, "oldCount");
                        Multisets.checkNonnegative(j, "newCount");
                        atomicinteger = safeGet(obj);
                        if (atomicinteger == null)
                        {
                            if (i != 0)
                                flag = false;
                            else
                            if (j != 0 && countMap.putIfAbsent(obj, new AtomicInteger(j)) != null)
                                return false;
                            break label1;
                        }
                        k = atomicinteger.get();
                        if (k != i)
                            break label0;
                        if (k != 0)
                            break label2;
                        if (j == 0)
                        {
                            countMap.remove(obj, atomicinteger);
                            return flag;
                        }
                        AtomicInteger atomicinteger1 = new AtomicInteger(j);
                        if (countMap.putIfAbsent(obj, atomicinteger1) != null)
                        {
                            boolean flag2 = countMap.replace(obj, atomicinteger, atomicinteger1);
                            flag1 = false;
                            if (!flag2)
                                break label3;
                        }
                        flag1 = flag;
                    }
                    return flag1;
                }
                if (!atomicinteger.compareAndSet(k, j))
                    break label0;
                if (j == 0)
                {
                    countMap.remove(obj, atomicinteger);
                    return flag;
                }
            }
            return flag;
        }
        return false;
    }

    public int size()
    {
        long l = 0L;
        for (Iterator iterator1 = countMap.values().iterator(); iterator1.hasNext();)
            l += ((AtomicInteger)iterator1.next()).get();

        return Ints.saturatedCast(l);
    }

    public Object[] toArray()
    {
        return snapshot().toArray();
    }

    public Object[] toArray(Object aobj[])
    {
        return snapshot().toArray(aobj);
    }

    public volatile String toString()
    {
        return super.toString();
    }


    // Unreferenced inner class com/google/common/collect/ConcurrentHashMultiset$2

/* anonymous class */
    class _cls2 extends AbstractIterator
    {

        private Iterator mapEntries;
        final ConcurrentHashMultiset this$0;

        protected Multiset.Entry computeNext()
        {
            java.util.Map.Entry entry;
            int i;
            do
            {
                if (!mapEntries.hasNext())
                    return (Multiset.Entry)endOfData();
                entry = (java.util.Map.Entry)mapEntries.next();
                i = ((AtomicInteger)entry.getValue()).get();
            } while (i == 0);
            return Multisets.immutableEntry(entry.getKey(), i);
        }

        protected volatile Object computeNext()
        {
            return computeNext();
        }

            
            {
                this$0 = ConcurrentHashMultiset.this;
                super();
                mapEntries = countMap.entrySet().iterator();
            }
    }

}
