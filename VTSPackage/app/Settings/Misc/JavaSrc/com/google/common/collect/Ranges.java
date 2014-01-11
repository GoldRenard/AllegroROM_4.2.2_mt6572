// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;

// Referenced classes of package com.google.common.collect:
//            Cut, Range, BoundType, ContiguousSet, 
//            Ordering

public final class Ranges
{

    private Ranges()
    {
    }

    public static Range all()
    {
        return create(Cut.belowAll(), Cut.aboveAll());
    }

    public static Range atLeast(Comparable comparable)
    {
        return create(Cut.belowValue(comparable), Cut.aboveAll());
    }

    public static Range atMost(Comparable comparable)
    {
        return create(Cut.belowAll(), Cut.aboveValue(comparable));
    }

    public static Range closed(Comparable comparable, Comparable comparable1)
    {
        return create(Cut.belowValue(comparable), Cut.aboveValue(comparable1));
    }

    public static Range closedOpen(Comparable comparable, Comparable comparable1)
    {
        return create(Cut.belowValue(comparable), Cut.belowValue(comparable1));
    }

    static Range create(Cut cut, Cut cut1)
    {
        return new Range(cut, cut1);
    }

    public static Range downTo(Comparable comparable, BoundType boundtype)
    {
        static class _cls1
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

        switch (_cls1..SwitchMap.com.google.common.collect.BoundType[boundtype.ordinal()])
        {
        case 2: // '\002'
            return atLeast(comparable);

        case 1: // '\001'
            return greaterThan(comparable);
        }
        throw new AssertionError();
    }

    public static Range encloseAll(Iterable iterable)
    {
        Preconditions.checkNotNull(iterable);
        if (iterable instanceof ContiguousSet)
            return ((ContiguousSet)iterable).range();
        Iterator iterator = iterable.iterator();
        Comparable comparable = (Comparable)Preconditions.checkNotNull(iterator.next());
        Comparable comparable1;
        Comparable comparable2;
        for (comparable1 = comparable; iterator.hasNext(); comparable1 = (Comparable)Ordering.natural().max(comparable1, comparable2))
        {
            comparable2 = (Comparable)Preconditions.checkNotNull(iterator.next());
            comparable = (Comparable)Ordering.natural().min(comparable, comparable2);
        }

        return closed(comparable, comparable1);
    }

    public static Range greaterThan(Comparable comparable)
    {
        return create(Cut.aboveValue(comparable), Cut.aboveAll());
    }

    public static Range lessThan(Comparable comparable)
    {
        return create(Cut.belowAll(), Cut.belowValue(comparable));
    }

    public static Range open(Comparable comparable, Comparable comparable1)
    {
        return create(Cut.aboveValue(comparable), Cut.belowValue(comparable1));
    }

    public static Range openClosed(Comparable comparable, Comparable comparable1)
    {
        return create(Cut.aboveValue(comparable), Cut.aboveValue(comparable1));
    }

    public static Range range(Comparable comparable, BoundType boundtype, Comparable comparable1, BoundType boundtype1)
    {
        Preconditions.checkNotNull(boundtype);
        Preconditions.checkNotNull(boundtype1);
        Cut cut;
        if (boundtype == BoundType.OPEN)
            cut = Cut.aboveValue(comparable);
        else
            cut = Cut.belowValue(comparable);
        Cut cut1;
        if (boundtype1 == BoundType.OPEN)
            cut1 = Cut.belowValue(comparable1);
        else
            cut1 = Cut.aboveValue(comparable1);
        return create(cut, cut1);
    }

    public static Range singleton(Comparable comparable)
    {
        return closed(comparable, comparable);
    }

    public static Range upTo(Comparable comparable, BoundType boundtype)
    {
        switch (_cls1..SwitchMap.com.google.common.collect.BoundType[boundtype.ordinal()])
        {
        case 2: // '\002'
            return atMost(comparable);

        case 1: // '\001'
            return lessThan(comparable);
        }
        throw new AssertionError();
    }
}
