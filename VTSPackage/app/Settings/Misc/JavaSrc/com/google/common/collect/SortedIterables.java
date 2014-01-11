// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Ordering, SortedIterable, Collections2, Multiset, 
//            Lists, Multisets, TreeMultiset, Iterables, 
//            Iterators, Sets, ObjectArrays

final class SortedIterables
{

    private SortedIterables()
    {
    }

    public static boolean hasSameComparator(Comparator comparator, Iterable iterable)
    {
        Preconditions.checkNotNull(comparator);
        Preconditions.checkNotNull(iterable);
        Object obj;
        if (iterable instanceof SortedSet)
        {
            obj = ((SortedSet)iterable).comparator();
            if (obj == null)
                obj = Ordering.natural();
        } else
        if (iterable instanceof SortedIterable)
            obj = ((SortedIterable)iterable).comparator();
        else
            obj = null;
        return comparator.equals(obj);
    }

    static Collection singletonEntries(Collection collection)
    {
        return Collections2.transform(collection, new Function() {

            public Multiset.Entry apply(Object obj)
            {
                return Multisets.immutableEntry(obj, 1);
            }

            public volatile Object apply(Object obj)
            {
                return apply(obj);
            }

        }
);
    }

    public static Collection sortedCounts(Comparator comparator, Iterable iterable)
    {
        if (iterable instanceof Multiset)
        {
            Multiset multiset = (Multiset)iterable;
            if (hasSameComparator(comparator, iterable))
            {
                return multiset.entrySet();
            } else
            {
                java.util.ArrayList arraylist2 = Lists.newArrayList(multiset.entrySet());
                Collections.sort(arraylist2, Ordering.from(comparator).onResultOf(new Function() {

                    public Object apply(Multiset.Entry entry)
                    {
                        return entry.getElement();
                    }

                    public volatile Object apply(Object obj3)
                    {
                        return apply((Multiset.Entry)obj3);
                    }

                }
));
                return arraylist2;
            }
        }
        if (iterable instanceof Set)
        {
            Object obj2;
            if (hasSameComparator(comparator, iterable))
            {
                obj2 = (Collection)iterable;
            } else
            {
                java.util.ArrayList arraylist1 = Lists.newArrayList(iterable);
                Collections.sort(arraylist1, comparator);
                obj2 = arraylist1;
            }
            return singletonEntries(((Collection) (obj2)));
        }
        if (hasSameComparator(comparator, iterable))
        {
            Object obj = null;
            int i = 0;
            java.util.ArrayList arraylist = Lists.newArrayList();
            for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
            {
                Object obj1 = iterator.next();
                if (i > 0)
                {
                    if (comparator.compare(obj, obj1) == 0)
                    {
                        i++;
                    } else
                    {
                        arraylist.add(Multisets.immutableEntry(obj, i));
                        obj = obj1;
                        i = 1;
                    }
                } else
                {
                    obj = obj1;
                    i = 1;
                }
            }

            if (i > 0)
                arraylist.add(Multisets.immutableEntry(obj, i));
            return arraylist;
        } else
        {
            TreeMultiset treemultiset = TreeMultiset.create(comparator);
            Iterables.addAll(treemultiset, iterable);
            return treemultiset.entrySet();
        }
    }

    public static Collection sortedCounts(Comparator comparator, Iterator iterator)
    {
        TreeMultiset treemultiset = TreeMultiset.create(comparator);
        Iterators.addAll(treemultiset, iterator);
        return treemultiset.entrySet();
    }

    public static Collection sortedUnique(Comparator comparator, Iterable iterable)
    {
        if (iterable instanceof Multiset)
            iterable = ((Multiset)iterable).elementSet();
        if (iterable instanceof Set)
            if (hasSameComparator(comparator, iterable))
            {
                return (Set)iterable;
            } else
            {
                java.util.ArrayList arraylist = Lists.newArrayList(iterable);
                Collections.sort(arraylist, comparator);
                return arraylist;
            }
        Object aobj[] = (Object[])Iterables.toArray(iterable);
        if (!hasSameComparator(comparator, iterable))
            Arrays.sort(aobj, comparator);
        return uniquifySortedArray(comparator, aobj);
    }

    public static Collection sortedUnique(Comparator comparator, Iterator iterator)
    {
        java.util.TreeSet treeset = Sets.newTreeSet(comparator);
        Iterators.addAll(treeset, iterator);
        return treeset;
    }

    private static Collection uniquifySortedArray(Comparator comparator, Object aobj[])
    {
        if (aobj.length == 0)
            return Collections.emptySet();
        int i = 1;
        for (int j = 1; j < aobj.length; j++)
            if (comparator.compare(aobj[j], aobj[i - 1]) != 0)
            {
                int k = i + 1;
                aobj[i] = aobj[j];
                i = k;
            }

        if (i < aobj.length)
            aobj = ObjectArrays.arraysCopyOf(aobj, i);
        return Arrays.asList(aobj);
    }
}
