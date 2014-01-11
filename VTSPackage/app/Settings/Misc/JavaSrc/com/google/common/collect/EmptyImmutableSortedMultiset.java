// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMultiset, ImmutableSortedSet, Iterators, UnmodifiableIterator, 
//            BoundType, SortedMultiset

final class EmptyImmutableSortedMultiset extends ImmutableSortedMultiset
{

    EmptyImmutableSortedMultiset(Comparator comparator)
    {
        super(comparator);
    }

    public int count(Object obj)
    {
        return 0;
    }

    ImmutableSortedSet createDescendingElementSet()
    {
        return ImmutableSortedSet.emptySet(reverseComparator());
    }

    ImmutableSortedSet createElementSet()
    {
        return ImmutableSortedSet.emptySet(comparator());
    }

    UnmodifiableIterator descendingEntryIterator()
    {
        return Iterators.emptyIterator();
    }

    int distinctElements()
    {
        return 0;
    }

    UnmodifiableIterator entryIterator()
    {
        return Iterators.emptyIterator();
    }

    public Multiset.Entry firstEntry()
    {
        return null;
    }

    public ImmutableSortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(boundtype);
        return this;
    }

    public volatile SortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        return headMultiset(obj, boundtype);
    }

    boolean isPartialView()
    {
        return false;
    }

    public Multiset.Entry lastEntry()
    {
        return null;
    }

    public int size()
    {
        return 0;
    }

    public ImmutableSortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(boundtype);
        return this;
    }

    public volatile SortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        return tailMultiset(obj, boundtype);
    }
}
