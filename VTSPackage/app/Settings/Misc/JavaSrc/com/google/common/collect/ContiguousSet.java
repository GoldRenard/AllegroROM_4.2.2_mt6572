// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.SortedSet;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedSet, Ordering, Range, DiscreteDomain, 
//            BoundType

public abstract class ContiguousSet extends ImmutableSortedSet
{

    final DiscreteDomain domain;

    ContiguousSet(DiscreteDomain discretedomain)
    {
        super(Ordering.natural());
        domain = discretedomain;
    }

    public ContiguousSet headSet(Comparable comparable)
    {
        return headSet((Comparable)Preconditions.checkNotNull(comparable), false);
    }

    ContiguousSet headSet(Comparable comparable, boolean flag)
    {
        return headSetImpl((Comparable)Preconditions.checkNotNull(comparable), flag);
    }

    public volatile ImmutableSortedSet headSet(Object obj)
    {
        return headSet((Comparable)obj);
    }

    volatile ImmutableSortedSet headSet(Object obj, boolean flag)
    {
        return headSet((Comparable)obj, flag);
    }

    public volatile SortedSet headSet(Object obj)
    {
        return headSet((Comparable)obj);
    }

    abstract ContiguousSet headSetImpl(Comparable comparable, boolean flag);

    volatile ImmutableSortedSet headSetImpl(Object obj, boolean flag)
    {
        return headSetImpl((Comparable)obj, flag);
    }

    public abstract ContiguousSet intersection(ContiguousSet contiguousset);

    public abstract Range range();

    public abstract Range range(BoundType boundtype, BoundType boundtype1);

    public ContiguousSet subSet(Comparable comparable, Comparable comparable1)
    {
        Preconditions.checkNotNull(comparable);
        Preconditions.checkNotNull(comparable1);
        boolean flag;
        if (comparator().compare(comparable, comparable1) <= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return subSet(comparable, true, comparable1, false);
    }

    ContiguousSet subSet(Comparable comparable, boolean flag, Comparable comparable1, boolean flag1)
    {
        Preconditions.checkNotNull(comparable);
        Preconditions.checkNotNull(comparable1);
        boolean flag2;
        if (comparator().compare(comparable, comparable1) <= 0)
            flag2 = true;
        else
            flag2 = false;
        Preconditions.checkArgument(flag2);
        return subSetImpl(comparable, flag, comparable1, flag1);
    }

    public volatile ImmutableSortedSet subSet(Object obj, Object obj1)
    {
        return subSet((Comparable)obj, (Comparable)obj1);
    }

    volatile ImmutableSortedSet subSet(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        return subSet((Comparable)obj, flag, (Comparable)obj1, flag1);
    }

    public volatile SortedSet subSet(Object obj, Object obj1)
    {
        return subSet((Comparable)obj, (Comparable)obj1);
    }

    abstract ContiguousSet subSetImpl(Comparable comparable, boolean flag, Comparable comparable1, boolean flag1);

    volatile ImmutableSortedSet subSetImpl(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        return subSetImpl((Comparable)obj, flag, (Comparable)obj1, flag1);
    }

    public ContiguousSet tailSet(Comparable comparable)
    {
        return tailSet((Comparable)Preconditions.checkNotNull(comparable), true);
    }

    ContiguousSet tailSet(Comparable comparable, boolean flag)
    {
        return tailSetImpl((Comparable)Preconditions.checkNotNull(comparable), flag);
    }

    public volatile ImmutableSortedSet tailSet(Object obj)
    {
        return tailSet((Comparable)obj);
    }

    volatile ImmutableSortedSet tailSet(Object obj, boolean flag)
    {
        return tailSet((Comparable)obj, flag);
    }

    public volatile SortedSet tailSet(Object obj)
    {
        return tailSet((Comparable)obj);
    }

    abstract ContiguousSet tailSetImpl(Comparable comparable, boolean flag);

    volatile ImmutableSortedSet tailSetImpl(Object obj, boolean flag)
    {
        return tailSetImpl((Comparable)obj, flag);
    }

    public String toString()
    {
        return range().toString();
    }
}
