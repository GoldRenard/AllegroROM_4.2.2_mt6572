// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMultiset, ImmutableSortedSet, UnmodifiableIterator, SortedMultiset, 
//            BoundType

final class DescendingImmutableSortedMultiset extends ImmutableSortedMultiset
{

    private final transient ImmutableSortedMultiset forward;

    DescendingImmutableSortedMultiset(ImmutableSortedMultiset immutablesortedmultiset)
    {
        super(immutablesortedmultiset.reverseComparator());
        forward = immutablesortedmultiset;
    }

    public int count(Object obj)
    {
        return forward.count(obj);
    }

    ImmutableSortedSet createDescendingElementSet()
    {
        return forward.elementSet();
    }

    ImmutableSortedSet createElementSet()
    {
        return forward.createDescendingElementSet();
    }

    UnmodifiableIterator descendingEntryIterator()
    {
        return forward.entryIterator();
    }

    public ImmutableSortedMultiset descendingMultiset()
    {
        return forward;
    }

    public volatile SortedMultiset descendingMultiset()
    {
        return descendingMultiset();
    }

    int distinctElements()
    {
        return forward.distinctElements();
    }

    UnmodifiableIterator entryIterator()
    {
        return forward.descendingEntryIterator();
    }

    public Multiset.Entry firstEntry()
    {
        return forward.lastEntry();
    }

    public ImmutableSortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        return forward.tailMultiset(obj, boundtype).descendingMultiset();
    }

    public volatile SortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        return headMultiset(obj, boundtype);
    }

    boolean isPartialView()
    {
        return forward.isPartialView();
    }

    public Multiset.Entry lastEntry()
    {
        return forward.firstEntry();
    }

    public int size()
    {
        return forward.size();
    }

    public ImmutableSortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        return forward.headMultiset(obj, boundtype).descendingMultiset();
    }

    public volatile SortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        return tailMultiset(obj, boundtype);
    }
}
