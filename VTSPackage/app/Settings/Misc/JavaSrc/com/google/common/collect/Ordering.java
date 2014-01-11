// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

// Referenced classes of package com.google.common.collect:
//            CompoundOrdering, Lists, ExplicitOrdering, ComparatorOrdering, 
//            NaturalOrdering, ObjectArrays, UsingToStringOrdering, ImmutableList, 
//            Iterables, LexicographicalOrdering, NullsFirstOrdering, NullsLastOrdering, 
//            ByFunctionOrdering, ReverseOrdering, MapMaker, Platform

public abstract class Ordering
    implements Comparator
{
    static class ArbitraryOrdering extends Ordering
    {

        private Map uids;

        public int compare(Object obj, Object obj1)
        {
            if (obj == obj1)
                return 0;
            int i = identityHashCode(obj);
            int j = identityHashCode(obj1);
            if (i != j)
                return i >= j ? 1 : -1;
            int k = ((Integer)uids.get(obj)).compareTo((Integer)uids.get(obj1));
            if (k == 0)
                throw new AssertionError();
            else
                return k;
        }

        int identityHashCode(Object obj)
        {
            return System.identityHashCode(obj);
        }

        public String toString()
        {
            return "Ordering.arbitrary()";
        }

        ArbitraryOrdering()
        {
            uids = Platform.tryWeakKeys(new MapMaker()).makeComputingMap(new _cls1());
        }
    }

    private static class ArbitraryOrderingHolder
    {

        static final Ordering ARBITRARY_ORDERING = new ArbitraryOrdering();


        private ArbitraryOrderingHolder()
        {
        }
    }

    static class IncomparableValueException extends ClassCastException
    {

        private static final long serialVersionUID;
        final Object value;

        IncomparableValueException(Object obj)
        {
            super((new StringBuilder()).append("Cannot compare value: ").append(obj).toString());
            value = obj;
        }
    }


    static final int LEFT_IS_GREATER = 1;
    static final int RIGHT_IS_GREATER = -1;


    public static Ordering arbitrary()
    {
        return ArbitraryOrderingHolder.ARBITRARY_ORDERING;
    }

    public static Ordering compound(Iterable iterable)
    {
        return new CompoundOrdering(iterable);
    }

    public static transient Ordering explicit(Object obj, Object aobj[])
    {
        return explicit(Lists.asList(obj, aobj));
    }

    public static Ordering explicit(List list)
    {
        return new ExplicitOrdering(list);
    }

    public static Ordering from(Ordering ordering)
    {
        return (Ordering)Preconditions.checkNotNull(ordering);
    }

    public static Ordering from(Comparator comparator)
    {
        if (comparator instanceof Ordering)
            return (Ordering)comparator;
        else
            return new ComparatorOrdering(comparator);
    }

    public static Ordering natural()
    {
        return NaturalOrdering.INSTANCE;
    }

    private int partition(Object aobj[], int i, int j, int k)
    {
        Object obj = aobj[k];
        aobj[k] = aobj[j];
        aobj[j] = obj;
        int l = i;
        for (int i1 = i; i1 < j; i1++)
            if (compare(aobj[i1], obj) < 0)
            {
                ObjectArrays.swap(aobj, l, i1);
                l++;
            }

        ObjectArrays.swap(aobj, j, l);
        return l;
    }

    private void quicksortLeastK(Object aobj[], int i, int j, int k)
    {
        if (j > i)
        {
            int l = partition(aobj, i, j, i + j >>> 1);
            quicksortLeastK(aobj, i, l - 1, k);
            if (l < k)
                quicksortLeastK(aobj, l + 1, j, k);
        }
    }

    public static Ordering usingToString()
    {
        return UsingToStringOrdering.INSTANCE;
    }

    public int binarySearch(List list, Object obj)
    {
        return Collections.binarySearch(list, obj, this);
    }

    public abstract int compare(Object obj, Object obj1);

    public Ordering compound(Comparator comparator)
    {
        return new CompoundOrdering(this, (Comparator)Preconditions.checkNotNull(comparator));
    }

    public List greatestOf(Iterable iterable, int i)
    {
        return reverse().leastOf(iterable, i);
    }

    public ImmutableList immutableSortedCopy(Iterable iterable)
    {
        return ImmutableList.copyOf(sortedCopy(iterable));
    }

    public boolean isOrdered(Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        if (iterator.hasNext())
        {
            Object obj1;
            for (Object obj = iterator.next(); iterator.hasNext(); obj = obj1)
            {
                obj1 = iterator.next();
                if (compare(obj, obj1) > 0)
                    return false;
            }

        }
        return true;
    }

    public boolean isStrictlyOrdered(Iterable iterable)
    {
        Iterator iterator = iterable.iterator();
        if (iterator.hasNext())
        {
            Object obj1;
            for (Object obj = iterator.next(); iterator.hasNext(); obj = obj1)
            {
                obj1 = iterator.next();
                if (compare(obj, obj1) >= 0)
                    return false;
            }

        }
        return true;
    }

    public List leastOf(Iterable iterable, int i)
    {
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "%d is negative", aobj);
        Object aobj1[] = (Object[])Iterables.toArray(iterable);
        Object aobj2[];
        if (aobj1.length <= i)
        {
            Arrays.sort(aobj1, this);
            aobj2 = aobj1;
        } else
        {
            quicksortLeastK(aobj1, 0, -1 + aobj1.length, i);
            aobj2 = (Object[])new Object[i];
            System.arraycopy(((Object) (aobj1)), 0, ((Object) (aobj2)), 0, i);
        }
        return Collections.unmodifiableList(Arrays.asList(aobj2));
    }

    public Ordering lexicographical()
    {
        return new LexicographicalOrdering(this);
    }

    public Object max(Iterable iterable)
    {
        return max(iterable.iterator());
    }

    public Object max(Object obj, Object obj1)
    {
        if (compare(obj, obj1) >= 0)
            return obj;
        else
            return obj1;
    }

    public transient Object max(Object obj, Object obj1, Object obj2, Object aobj[])
    {
        Object obj3 = max(max(obj, obj1), obj2);
        int i = aobj.length;
        for (int j = 0; j < i; j++)
            obj3 = max(obj3, aobj[j]);

        return obj3;
    }

    public Object max(Iterator iterator)
    {
        Object obj;
        for (obj = iterator.next(); iterator.hasNext(); obj = max(obj, iterator.next()));
        return obj;
    }

    public Object min(Iterable iterable)
    {
        return min(iterable.iterator());
    }

    public Object min(Object obj, Object obj1)
    {
        if (compare(obj, obj1) <= 0)
            return obj;
        else
            return obj1;
    }

    public transient Object min(Object obj, Object obj1, Object obj2, Object aobj[])
    {
        Object obj3 = min(min(obj, obj1), obj2);
        int i = aobj.length;
        for (int j = 0; j < i; j++)
            obj3 = min(obj3, aobj[j]);

        return obj3;
    }

    public Object min(Iterator iterator)
    {
        Object obj;
        for (obj = iterator.next(); iterator.hasNext(); obj = min(obj, iterator.next()));
        return obj;
    }

    public Ordering nullsFirst()
    {
        return new NullsFirstOrdering(this);
    }

    public Ordering nullsLast()
    {
        return new NullsLastOrdering(this);
    }

    public Ordering onResultOf(Function function)
    {
        return new ByFunctionOrdering(function, this);
    }

    public Ordering reverse()
    {
        return new ReverseOrdering(this);
    }

    public List sortedCopy(Iterable iterable)
    {
        java.util.ArrayList arraylist = Lists.newArrayList(iterable);
        Collections.sort(arraylist, this);
        return arraylist;
    }

    // Unreferenced inner class com/google/common/collect/Ordering$ArbitraryOrdering$1

/* anonymous class */
    class ArbitraryOrdering._cls1
        implements Function
    {

        final AtomicInteger counter = new AtomicInteger(0);
        final ArbitraryOrdering this$0;

        public Integer apply(Object obj)
        {
            return Integer.valueOf(counter.getAndIncrement());
        }

        public volatile Object apply(Object obj)
        {
            return apply(obj);
        }

            
            {
                this$0 = ArbitraryOrdering.this;
                super();
            }
    }

}
