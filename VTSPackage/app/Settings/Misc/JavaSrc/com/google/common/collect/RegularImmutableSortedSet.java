// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedSet, ImmutableList, SortedIterables, ImmutableSortedAsList, 
//            SortedLists, UnmodifiableIterator

final class RegularImmutableSortedSet extends ImmutableSortedSet
{

    private final transient ImmutableList elements;

    RegularImmutableSortedSet(ImmutableList immutablelist, Comparator comparator)
    {
        super(comparator);
        elements = immutablelist;
        boolean flag;
        if (!immutablelist.isEmpty())
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
    }

    private int binarySearch(Object obj)
    {
        Comparator comparator = super.comparator;
        return Collections.binarySearch(elements, obj, comparator);
    }

    private ImmutableSortedSet createSubset(int i, int j)
    {
        if (i == 0 && j == size())
            return this;
        if (i < j)
            return new RegularImmutableSortedSet(elements.subList(i, j), super.comparator);
        else
            return emptySet(super.comparator);
    }

    public boolean contains(Object obj)
    {
        if (obj != null)
        {
            int i;
            try
            {
                i = binarySearch(obj);
            }
            catch (ClassCastException classcastexception)
            {
                return false;
            }
            if (i >= 0)
                return true;
        }
        return false;
    }

    public boolean containsAll(Collection collection)
    {
        boolean flag = true;
        if (SortedIterables.hasSameComparator(comparator(), collection) && collection.size() > flag) goto _L2; else goto _L1
_L1:
        flag = super.containsAll(collection);
_L4:
        return flag;
_L2:
        UnmodifiableIterator unmodifiableiterator;
        Iterator iterator1;
        Object obj;
        unmodifiableiterator = iterator();
        iterator1 = collection.iterator();
        obj = iterator1.next();
_L5:
        int i;
        Object obj1;
        try
        {
            if (!unmodifiableiterator.hasNext())
                break MISSING_BLOCK_LABEL_122;
            i = unsafeCompare(unmodifiableiterator.next(), obj);
        }
        catch (NullPointerException nullpointerexception)
        {
            return false;
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        if (i != 0)
            continue; /* Loop/switch isn't completed */
        if (!iterator1.hasNext()) goto _L4; else goto _L3
_L3:
        obj1 = iterator1.next();
        obj = obj1;
          goto _L5
        if (i <= 0) goto _L5; else goto _L6
_L6:
        return false;
        return false;
    }

    ImmutableList createAsList()
    {
        return new ImmutableSortedAsList(this, elements);
    }

    public boolean equals(Object obj)
    {
        if (obj != this) goto _L2; else goto _L1
_L1:
        return true;
_L2:
        Set set;
        Iterator iterator1;
        if (!(obj instanceof Set))
            return false;
        set = (Set)obj;
        if (size() != set.size())
            return false;
        if (!SortedIterables.hasSameComparator(super.comparator, set))
            break MISSING_BLOCK_LABEL_117;
        iterator1 = set.iterator();
        UnmodifiableIterator unmodifiableiterator = iterator();
_L5:
        if (!unmodifiableiterator.hasNext()) goto _L1; else goto _L3
_L3:
        Object obj1;
        Object obj2;
        obj1 = unmodifiableiterator.next();
        obj2 = iterator1.next();
        if (obj2 == null)
            break; /* Loop/switch isn't completed */
        int i;
        try
        {
            i = unsafeCompare(obj1, obj2);
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        catch (NoSuchElementException nosuchelementexception)
        {
            return false;
        }
        if (i == 0) goto _L5; else goto _L4
_L4:
        return false;
        return containsAll(set);
    }

    public Object first()
    {
        return elements.get(0);
    }

    ImmutableSortedSet headSetImpl(Object obj, boolean flag)
    {
        int i;
        if (flag)
            i = SortedLists.binarySearch(elements, Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.FIRST_AFTER, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        else
            i = SortedLists.binarySearch(elements, Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.FIRST_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        return createSubset(0, i);
    }

    int indexOf(Object obj)
    {
        if (obj == null)
            return -1;
        int i;
        int j;
        try
        {
            i = SortedLists.binarySearch(elements, obj, comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.INVERTED_INSERTION_INDEX);
        }
        catch (ClassCastException classcastexception)
        {
            return -1;
        }
        j = i;
        if (j < 0 || !elements.get(j).equals(obj))
            j = -1;
        return j;
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return elements.isPartialView();
    }

    public UnmodifiableIterator iterator()
    {
        return elements.iterator();
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public Object last()
    {
        return elements.get(-1 + size());
    }

    public int size()
    {
        return elements.size();
    }

    ImmutableSortedSet subSetImpl(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        return tailSetImpl(obj, flag).headSetImpl(obj1, flag1);
    }

    ImmutableSortedSet tailSetImpl(Object obj, boolean flag)
    {
        int i;
        if (flag)
            i = SortedLists.binarySearch(elements, Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.FIRST_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        else
            i = SortedLists.binarySearch(elements, Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.FIRST_AFTER, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
        return createSubset(i, size());
    }

    public Object[] toArray()
    {
        return elements.toArray();
    }

    public Object[] toArray(Object aobj[])
    {
        return elements.toArray(aobj);
    }

    Comparator unsafeComparator()
    {
        return super.comparator;
    }
}
