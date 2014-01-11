// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractMultiset, SortedMultiset, Ordering, Multisets, 
//            BoundType, Multiset

abstract class AbstractSortedMultiset extends AbstractMultiset
    implements SortedMultiset
{

    final Comparator comparator;
    private transient SortedMultiset descendingMultiset;

    AbstractSortedMultiset()
    {
        this(((Comparator) (Ordering.natural())));
    }

    AbstractSortedMultiset(Comparator comparator1)
    {
        comparator = (Comparator)Preconditions.checkNotNull(comparator1);
    }

    public Comparator comparator()
    {
        return comparator;
    }

    SortedMultiset createDescendingMultiset()
    {
        return new SortedMultisets.DescendingMultiset() {

            final AbstractSortedMultiset this$0;

            Iterator entryIterator()
            {
                return descendingEntryIterator();
            }

            SortedMultiset forwardMultiset()
            {
                return AbstractSortedMultiset.this;
            }

            public Iterator iterator()
            {
                return descendingIterator();
            }

            
            {
                this$0 = AbstractSortedMultiset.this;
                super();
            }
        }
;
    }

    volatile Set createElementSet()
    {
        return createElementSet();
    }

    SortedSet createElementSet()
    {
        return new SortedMultisets.ElementSet() {

            final AbstractSortedMultiset this$0;

            volatile Multiset multiset()
            {
                return multiset();
            }

            SortedMultiset multiset()
            {
                return AbstractSortedMultiset.this;
            }

            
            {
                this$0 = AbstractSortedMultiset.this;
                super();
            }
        }
;
    }

    abstract Iterator descendingEntryIterator();

    Iterator descendingIterator()
    {
        return Multisets.iteratorImpl(descendingMultiset());
    }

    public SortedMultiset descendingMultiset()
    {
        SortedMultiset sortedmultiset = descendingMultiset;
        if (sortedmultiset == null)
        {
            sortedmultiset = createDescendingMultiset();
            descendingMultiset = sortedmultiset;
        }
        return sortedmultiset;
    }

    public volatile Set elementSet()
    {
        return elementSet();
    }

    public SortedSet elementSet()
    {
        return (SortedSet)super.elementSet();
    }

    public Multiset.Entry firstEntry()
    {
        Iterator iterator = entryIterator();
        if (iterator.hasNext())
            return (Multiset.Entry)iterator.next();
        else
            return null;
    }

    public Multiset.Entry lastEntry()
    {
        Iterator iterator = descendingEntryIterator();
        if (iterator.hasNext())
            return (Multiset.Entry)iterator.next();
        else
            return null;
    }

    public Multiset.Entry pollFirstEntry()
    {
        Iterator iterator = entryIterator();
        if (iterator.hasNext())
        {
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            Multiset.Entry entry1 = Multisets.immutableEntry(entry.getElement(), entry.getCount());
            iterator.remove();
            return entry1;
        } else
        {
            return null;
        }
    }

    public Multiset.Entry pollLastEntry()
    {
        Iterator iterator = descendingEntryIterator();
        if (iterator.hasNext())
        {
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            Multiset.Entry entry1 = Multisets.immutableEntry(entry.getElement(), entry.getCount());
            iterator.remove();
            return entry1;
        } else
        {
            return null;
        }
    }

    public SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
    {
        return tailMultiset(obj, boundtype).headMultiset(obj1, boundtype1);
    }
}
