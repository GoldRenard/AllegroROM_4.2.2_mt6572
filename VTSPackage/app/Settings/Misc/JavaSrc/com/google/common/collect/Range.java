// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Cut, DiscreteDomain, Ranges, EmptyContiguousSet, 
//            RegularContiguousSet, Iterables, Ordering, ContiguousSet, 
//            BoundType

public final class Range
    implements Predicate, Serializable
{

    private static final long serialVersionUID;
    final Cut lowerBound;
    final Cut upperBound;

    Range(Cut cut, Cut cut1)
    {
        if (cut.compareTo(cut1) > 0)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("Invalid range: ").append(toString(cut, cut1)).toString());
        } else
        {
            lowerBound = cut;
            upperBound = cut1;
            return;
        }
    }

    private static SortedSet cast(Iterable iterable)
    {
        return (SortedSet)iterable;
    }

    static int compareOrThrow(Comparable comparable, Comparable comparable1)
    {
        return comparable.compareTo(comparable1);
    }

    private static String toString(Cut cut, Cut cut1)
    {
        StringBuilder stringbuilder = new StringBuilder(16);
        cut.describeAsLowerBound(stringbuilder);
        stringbuilder.append('\u2025');
        cut1.describeAsUpperBound(stringbuilder);
        return stringbuilder.toString();
    }

    public boolean apply(Comparable comparable)
    {
        return contains(comparable);
    }

    public volatile boolean apply(Object obj)
    {
        return apply((Comparable)obj);
    }

    public ContiguousSet asSet(DiscreteDomain discretedomain)
    {
        Range range;
        boolean flag;
label0:
        {
            Preconditions.checkNotNull(discretedomain);
            range = this;
            Range range1;
            try
            {
                if (!hasLowerBound())
                    range = range.intersection(Ranges.atLeast(discretedomain.minValue()));
                if (hasUpperBound())
                    break label0;
                range1 = range.intersection(Ranges.atMost(discretedomain.maxValue()));
            }
            catch (NoSuchElementException nosuchelementexception)
            {
                throw new IllegalArgumentException(nosuchelementexception);
            }
            range = range1;
        }
        if (range.isEmpty() || compareOrThrow(lowerBound.leastValueAbove(discretedomain), upperBound.greatestValueBelow(discretedomain)) > 0)
            flag = true;
        else
            flag = false;
        if (flag)
            return new EmptyContiguousSet(discretedomain);
        else
            return new RegularContiguousSet(range, discretedomain);
    }

    public Range canonical(DiscreteDomain discretedomain)
    {
        Preconditions.checkNotNull(discretedomain);
        Cut cut = lowerBound.canonical(discretedomain);
        Cut cut1 = upperBound.canonical(discretedomain);
        if (cut == lowerBound && cut1 == upperBound)
            return this;
        else
            return Ranges.create(cut, cut1);
    }

    public boolean contains(Comparable comparable)
    {
        Preconditions.checkNotNull(comparable);
        return lowerBound.isLessThan(comparable) && !upperBound.isLessThan(comparable);
    }

    public boolean containsAll(Iterable iterable)
    {
        SortedSet sortedset;
label0:
        {
label1:
            {
                if (Iterables.isEmpty(iterable))
                    break label1;
                if (iterable instanceof SortedSet)
                {
                    sortedset = cast(iterable);
                    java.util.Comparator comparator = sortedset.comparator();
                    if (Ordering.natural().equals(comparator) || comparator == null)
                        break label0;
                }
                Iterator iterator = iterable.iterator();
                do
                    if (!iterator.hasNext())
                        break label1;
                while (contains((Comparable)iterator.next()));
                return false;
            }
            return true;
        }
        boolean flag;
        if (contains((Comparable)sortedset.first()) && contains((Comparable)sortedset.last()))
            flag = true;
        else
            flag = false;
        return flag;
    }

    public boolean encloses(Range range)
    {
        return lowerBound.compareTo(range.lowerBound) <= 0 && upperBound.compareTo(range.upperBound) >= 0;
    }

    public boolean equals(Object obj)
    {
        boolean flag = obj instanceof Range;
        boolean flag1 = false;
        if (flag)
        {
            Range range = (Range)obj;
            boolean flag2 = lowerBound.equals(range.lowerBound);
            flag1 = false;
            if (flag2)
            {
                boolean flag3 = upperBound.equals(range.upperBound);
                flag1 = false;
                if (flag3)
                    flag1 = true;
            }
        }
        return flag1;
    }

    public boolean hasLowerBound()
    {
        return lowerBound != Cut.belowAll();
    }

    public boolean hasUpperBound()
    {
        return upperBound != Cut.aboveAll();
    }

    public int hashCode()
    {
        return 31 * lowerBound.hashCode() + upperBound.hashCode();
    }

    public Range intersection(Range range)
    {
        return Ranges.create((Cut)Ordering.natural().max(lowerBound, range.lowerBound), (Cut)Ordering.natural().min(upperBound, range.upperBound));
    }

    public boolean isConnected(Range range)
    {
        return lowerBound.compareTo(range.upperBound) <= 0 && range.lowerBound.compareTo(upperBound) <= 0;
    }

    public boolean isEmpty()
    {
        return lowerBound.equals(upperBound);
    }

    public BoundType lowerBoundType()
    {
        return lowerBound.typeAsLowerBound();
    }

    public Comparable lowerEndpoint()
    {
        return lowerBound.endpoint();
    }

    public Range span(Range range)
    {
        return Ranges.create((Cut)Ordering.natural().min(lowerBound, range.lowerBound), (Cut)Ordering.natural().max(upperBound, range.upperBound));
    }

    public String toString()
    {
        return toString(lowerBound, upperBound);
    }

    public BoundType upperBoundType()
    {
        return upperBound.typeAsUpperBound();
    }

    public Comparable upperEndpoint()
    {
        return upperBound.endpoint();
    }
}
