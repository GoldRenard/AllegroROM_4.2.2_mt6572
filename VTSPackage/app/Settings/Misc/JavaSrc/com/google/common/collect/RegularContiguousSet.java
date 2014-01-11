// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;

// Referenced classes of package com.google.common.collect:
//            ContiguousSet, Range, Cut, Sets, 
//            BoundType, Ranges, DiscreteDomain, Ordering, 
//            EmptyContiguousSet, ObjectArrays, ImmutableSortedSet, UnmodifiableIterator, 
//            AbstractLinkedIterator

final class RegularContiguousSet extends ContiguousSet
{
    private static final class SerializedForm
        implements Serializable
    {

        final DiscreteDomain domain;
        final Range range;

        private Object readResolve()
        {
            return new RegularContiguousSet(range, domain);
        }

        private SerializedForm(Range range1, DiscreteDomain discretedomain)
        {
            range = range1;
            domain = discretedomain;
        }

    }


    private static final long serialVersionUID;
    private final Range range;

    RegularContiguousSet(Range range1, DiscreteDomain discretedomain)
    {
        super(discretedomain);
        range = range1;
    }

    private static boolean equalsOrThrow(Comparable comparable, Comparable comparable1)
    {
        return comparable1 != null && Range.compareOrThrow(comparable, comparable1) == 0;
    }

    public boolean contains(Object obj)
    {
        boolean flag;
        try
        {
            flag = range.contains((Comparable)obj);
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        return flag;
    }

    public boolean containsAll(Collection collection)
    {
        boolean flag;
        try
        {
            flag = range.containsAll(collection);
        }
        catch (ClassCastException classcastexception)
        {
            return false;
        }
        return flag;
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof RegularContiguousSet))
                    break label0;
                RegularContiguousSet regularcontiguousset = (RegularContiguousSet)obj;
                if (!super.domain.equals(((ContiguousSet) (regularcontiguousset)).domain))
                    break label0;
                if (!first().equals(regularcontiguousset.first()) || !last().equals(regularcontiguousset.last()))
                    return false;
            }
            return true;
        }
        return super.equals(obj);
    }

    public Comparable first()
    {
        return range.lowerBound.leastValueAbove(super.domain);
    }

    public volatile Object first()
    {
        return first();
    }

    public int hashCode()
    {
        return Sets.hashCodeImpl(this);
    }

    ContiguousSet headSetImpl(Comparable comparable, boolean flag)
    {
        return range.intersection(Ranges.upTo(comparable, BoundType.forBoolean(flag))).asSet(super.domain);
    }

    volatile ImmutableSortedSet headSetImpl(Object obj, boolean flag)
    {
        return headSetImpl((Comparable)obj, flag);
    }

    int indexOf(Object obj)
    {
        if (contains(obj))
            return (int)super.domain.distance(first(), (Comparable)obj);
        else
            return -1;
    }

    public ContiguousSet intersection(ContiguousSet contiguousset)
    {
        Preconditions.checkNotNull(contiguousset);
        Preconditions.checkArgument(super.domain.equals(contiguousset.domain));
        if (contiguousset.isEmpty())
            return contiguousset;
        Comparable comparable = (Comparable)Ordering.natural().max(first(), contiguousset.first());
        Comparable comparable1 = (Comparable)Ordering.natural().min(last(), contiguousset.last());
        Object obj;
        if (comparable.compareTo(comparable1) < 0)
            obj = Ranges.closed(comparable, comparable1).asSet(super.domain);
        else
            obj = new EmptyContiguousSet(super.domain);
        return ((ContiguousSet) (obj));
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return false;
    }

    public UnmodifiableIterator iterator()
    {
        return new AbstractLinkedIterator(first()) {

            final Comparable last;
            final RegularContiguousSet this$0;

            protected Comparable computeNext(Comparable comparable)
            {
                if (RegularContiguousSet.equalsOrThrow(comparable, last))
                    return null;
                else
                    return domain.next(comparable);
            }

            protected volatile Object computeNext(Object obj)
            {
                return computeNext((Comparable)obj);
            }

            
            {
                this$0 = RegularContiguousSet.this;
                super(comparable);
                last = RegularContiguousSet.this.last();
            }
        }
;
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public Comparable last()
    {
        return range.upperBound.greatestValueBelow(super.domain);
    }

    public volatile Object last()
    {
        return last();
    }

    public Range range()
    {
        return range(BoundType.CLOSED, BoundType.CLOSED);
    }

    public Range range(BoundType boundtype, BoundType boundtype1)
    {
        return Ranges.create(range.lowerBound.withLowerBoundType(boundtype, super.domain), range.upperBound.withUpperBoundType(boundtype1, super.domain));
    }

    public int size()
    {
        long l = super.domain.distance(first(), last());
        if (l >= 0x7fffffffL)
            return 0x7fffffff;
        else
            return 1 + (int)l;
    }

    ContiguousSet subSetImpl(Comparable comparable, boolean flag, Comparable comparable1, boolean flag1)
    {
        return range.intersection(Ranges.range(comparable, BoundType.forBoolean(flag), comparable1, BoundType.forBoolean(flag1))).asSet(super.domain);
    }

    volatile ImmutableSortedSet subSetImpl(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        return subSetImpl((Comparable)obj, flag, (Comparable)obj1, flag1);
    }

    ContiguousSet tailSetImpl(Comparable comparable, boolean flag)
    {
        return range.intersection(Ranges.downTo(comparable, BoundType.forBoolean(flag))).asSet(super.domain);
    }

    volatile ImmutableSortedSet tailSetImpl(Object obj, boolean flag)
    {
        return tailSetImpl((Comparable)obj, flag);
    }

    public Object[] toArray()
    {
        return ObjectArrays.toArrayImpl(this);
    }

    public Object[] toArray(Object aobj[])
    {
        return ObjectArrays.toArrayImpl(this, aobj);
    }

    Object writeReplace()
    {
        return new SerializedForm(range, super.domain);
    }

}
