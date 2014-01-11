// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMultiset, ImmutableList, Lists, SortedLists, 
//            RegularImmutableSortedSet, BoundType, ImmutableSortedSet, UnmodifiableIterator, 
//            SortedMultiset, TransformedImmutableList

final class RegularImmutableSortedMultiset extends ImmutableSortedMultiset
{
    private static final class CumulativeCountEntry extends Multisets.AbstractEntry
    {

        final int count;
        final long cumulativeCount;
        final Object element;

        public int getCount()
        {
            return count;
        }

        public Object getElement()
        {
            return element;
        }

        CumulativeCountEntry(Object obj, int i, CumulativeCountEntry cumulativecountentry)
        {
            element = obj;
            count = i;
            long l = i;
            long l1;
            if (cumulativecountentry == null)
                l1 = 0L;
            else
                l1 = cumulativecountentry.cumulativeCount;
            cumulativeCount = l1 + l;
        }
    }


    static final boolean $assertionsDisabled;
    final transient ImmutableList entries;

    RegularImmutableSortedMultiset(Comparator comparator, ImmutableList immutablelist)
    {
        super(comparator);
        entries = immutablelist;
        if (!$assertionsDisabled && immutablelist.isEmpty())
            throw new AssertionError();
        else
            return;
    }

    static RegularImmutableSortedMultiset createFromSorted(Comparator comparator, List list)
    {
        java.util.ArrayList arraylist = Lists.newArrayListWithCapacity(list.size());
        CumulativeCountEntry cumulativecountentry = null;
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
        {
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            CumulativeCountEntry cumulativecountentry1 = new CumulativeCountEntry(entry.getElement(), entry.getCount(), cumulativecountentry);
            arraylist.add(cumulativecountentry1);
            cumulativecountentry = cumulativecountentry1;
        }

        return new RegularImmutableSortedMultiset(comparator, ImmutableList.copyOf(arraylist));
    }

    private ImmutableSortedMultiset createSubMultiset(int i, int j)
    {
        if (i == 0 && j == entries.size())
            return this;
        if (i >= j)
            return emptyMultiset(comparator());
        else
            return new RegularImmutableSortedMultiset(comparator(), entries.subList(i, j));
    }

    public int count(Object obj)
    {
        if (obj == null)
            return 0;
        int i;
        int j;
        int k;
        try
        {
            i = SortedLists.binarySearch(elementList(), obj, comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.INVERTED_INSERTION_INDEX);
        }
        catch (ClassCastException classcastexception)
        {
            return 0;
        }
        if (i < 0) goto _L2; else goto _L1
_L1:
        j = ((CumulativeCountEntry)entries.get(i)).getCount();
        k = j;
_L4:
        return k;
_L2:
        k = 0;
        if (true) goto _L4; else goto _L3
_L3:
    }

    ImmutableSortedSet createDescendingElementSet()
    {
        return new RegularImmutableSortedSet(elementList().reverse(), reverseComparator());
    }

    ImmutableSortedSet createElementSet()
    {
        return new RegularImmutableSortedSet(elementList(), comparator());
    }

    UnmodifiableIterator descendingEntryIterator()
    {
        return entries.reverse().iterator();
    }

    int distinctElements()
    {
        return entries.size();
    }

    ImmutableList elementList()
    {
        return new TransformedImmutableList(entries) {

            final RegularImmutableSortedMultiset this$0;

            Object transform(CumulativeCountEntry cumulativecountentry)
            {
                return cumulativecountentry.getElement();
            }

            volatile Object transform(Object obj)
            {
                return transform((CumulativeCountEntry)obj);
            }

            
            {
                this$0 = RegularImmutableSortedMultiset.this;
                super(immutablelist);
            }
        }
;
    }

    UnmodifiableIterator entryIterator()
    {
        return entries.iterator();
    }

    public volatile Multiset.Entry firstEntry()
    {
        return firstEntry();
    }

    public CumulativeCountEntry firstEntry()
    {
        return (CumulativeCountEntry)entries.get(0);
    }

    public ImmutableSortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
label0:
        {
            static class _cls2
            {

                static final int $SwitchMap$com$google$common$collect$BoundType[];

                static 
                {
                    $SwitchMap$com$google$common$collect$BoundType = new int[BoundType.values().length];
                    try
                    {
                        $SwitchMap$com$google$common$collect$BoundType[BoundType.OPEN.ordinal()] = 1;
                    }
                    catch (NoSuchFieldError nosuchfielderror) { }
                    try
                    {
                        $SwitchMap$com$google$common$collect$BoundType[BoundType.CLOSED.ordinal()] = 2;
                    }
                    catch (NoSuchFieldError nosuchfielderror1)
                    {
                        return;
                    }
                }
            }

            int i;
            switch (_cls2..SwitchMap.com.google.common.collect.BoundType[boundtype.ordinal()])
            {
            default:
                break label0;

            case 2: // '\002'
                i = 1 + SortedLists.binarySearch(elementList(), Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
                break;

            case 1: // '\001'
                i = SortedLists.binarySearch(elementList(), Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
                break;
            }
            return createSubMultiset(0, i);
        }
        throw new AssertionError();
    }

    public volatile SortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        return headMultiset(obj, boundtype);
    }

    boolean isPartialView()
    {
        return entries.isPartialView();
    }

    public volatile Multiset.Entry lastEntry()
    {
        return lastEntry();
    }

    public CumulativeCountEntry lastEntry()
    {
        return (CumulativeCountEntry)entries.get(-1 + entries.size());
    }

    public int size()
    {
        CumulativeCountEntry cumulativecountentry = firstEntry();
        return Ints.saturatedCast((lastEntry().cumulativeCount - cumulativecountentry.cumulativeCount) + (long)cumulativecountentry.count);
    }

    public ImmutableSortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
label0:
        {
            int i;
            switch (_cls2..SwitchMap.com.google.common.collect.BoundType[boundtype.ordinal()])
            {
            default:
                break label0;

            case 2: // '\002'
                i = SortedLists.binarySearch(elementList(), Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_HIGHER);
                break;

            case 1: // '\001'
                i = 1 + SortedLists.binarySearch(elementList(), Preconditions.checkNotNull(obj), comparator(), SortedLists.KeyPresentBehavior.ANY_PRESENT, SortedLists.KeyAbsentBehavior.NEXT_LOWER);
                break;
            }
            return createSubMultiset(i, distinctElements());
        }
        throw new AssertionError();
    }

    public volatile SortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        return tailMultiset(obj, boundtype);
    }

    static 
    {
        boolean flag;
        if (!com/google/common/collect/RegularImmutableSortedMultiset.desiredAssertionStatus())
            flag = true;
        else
            flag = false;
        $assertionsDisabled = flag;
    }
}
