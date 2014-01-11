// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Comparator;

// Referenced classes of package com.google.common.collect:
//            BoundType, Range, Ordering

final class GeneralRange
    implements Serializable
{

    private final Comparator comparator;
    private final boolean hasLowerBound;
    private final boolean hasUpperBound;
    private final BoundType lowerBoundType;
    private final Object lowerEndpoint;
    private transient GeneralRange reverse;
    private final BoundType upperBoundType;
    private final Object upperEndpoint;

    private GeneralRange(Comparator comparator1, boolean flag, Object obj, BoundType boundtype, boolean flag1, Object obj1, BoundType boundtype1)
    {
        int i = 1;
        super();
        comparator = (Comparator)Preconditions.checkNotNull(comparator1);
        hasLowerBound = flag;
        hasUpperBound = flag1;
        lowerEndpoint = obj;
        lowerBoundType = (BoundType)Preconditions.checkNotNull(boundtype);
        upperEndpoint = obj1;
        upperBoundType = (BoundType)Preconditions.checkNotNull(boundtype1);
        if (flag)
            comparator1.compare(obj, obj);
        if (flag1)
            comparator1.compare(obj1, obj1);
        if (flag && flag1)
        {
            int j = comparator1.compare(obj, obj1);
            boolean flag2;
            if (j <= 0)
                flag2 = i;
            else
                flag2 = false;
            Object aobj[] = new Object[2];
            aobj[0] = obj;
            aobj[i] = obj1;
            Preconditions.checkArgument(flag2, "lowerEndpoint (%s) > upperEndpoint (%s)", aobj);
            if (j == 0)
            {
                int k;
                if (boundtype != BoundType.OPEN)
                    k = i;
                else
                    k = 0;
                if (boundtype1 == BoundType.OPEN)
                    i = 0;
                Preconditions.checkArgument(k | i);
            }
        }
    }

    static GeneralRange all(Comparator comparator1)
    {
        return new GeneralRange(comparator1, false, null, BoundType.OPEN, false, null, BoundType.OPEN);
    }

    static GeneralRange downTo(Comparator comparator1, Object obj, BoundType boundtype)
    {
        return new GeneralRange(comparator1, true, obj, boundtype, false, null, BoundType.OPEN);
    }

    static GeneralRange from(Range range1)
    {
        Comparable comparable;
        if (range1.hasLowerBound())
            comparable = range1.lowerEndpoint();
        else
            comparable = null;
        BoundType boundtype;
        if (range1.hasLowerBound())
            boundtype = range1.lowerBoundType();
        else
            boundtype = BoundType.OPEN;
        Comparable comparable1;
        if (range1.hasUpperBound())
            comparable1 = range1.upperEndpoint();
        else
            comparable1 = null;
        BoundType boundtype1;
        if (range1.hasUpperBound())
            boundtype1 = range1.upperBoundType();
        else
            boundtype1 = BoundType.OPEN;
        return new GeneralRange(Ordering.natural(), range1.hasLowerBound(), comparable, boundtype, range1.hasUpperBound(), comparable1, boundtype1);
    }

    static GeneralRange range(Comparator comparator1, Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
    {
        return new GeneralRange(comparator1, true, obj, boundtype, true, obj1, boundtype1);
    }

    static GeneralRange upTo(Comparator comparator1, Object obj, BoundType boundtype)
    {
        return new GeneralRange(comparator1, false, null, BoundType.OPEN, true, obj, boundtype);
    }

    Comparator comparator()
    {
        return comparator;
    }

    boolean contains(Object obj)
    {
        return !tooLow(obj) && !tooHigh(obj);
    }

    public boolean equals(Object obj)
    {
        boolean flag = obj instanceof GeneralRange;
        boolean flag1 = false;
        if (flag)
        {
            GeneralRange generalrange = (GeneralRange)obj;
            boolean flag2 = comparator.equals(generalrange.comparator);
            flag1 = false;
            if (flag2)
            {
                boolean flag3 = hasLowerBound;
                boolean flag4 = generalrange.hasLowerBound;
                flag1 = false;
                if (flag3 == flag4)
                {
                    boolean flag5 = hasUpperBound;
                    boolean flag6 = generalrange.hasUpperBound;
                    flag1 = false;
                    if (flag5 == flag6)
                    {
                        boolean flag7 = lowerBoundType.equals(generalrange.lowerBoundType);
                        flag1 = false;
                        if (flag7)
                        {
                            boolean flag8 = upperBoundType.equals(generalrange.upperBoundType);
                            flag1 = false;
                            if (flag8)
                            {
                                boolean flag9 = Objects.equal(lowerEndpoint, generalrange.lowerEndpoint);
                                flag1 = false;
                                if (flag9)
                                {
                                    boolean flag10 = Objects.equal(upperEndpoint, generalrange.upperEndpoint);
                                    flag1 = false;
                                    if (flag10)
                                        flag1 = true;
                                }
                            }
                        }
                    }
                }
            }
        }
        return flag1;
    }

    boolean hasLowerBound()
    {
        return hasLowerBound;
    }

    boolean hasUpperBound()
    {
        return hasUpperBound;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[5];
        aobj[0] = comparator;
        aobj[1] = lowerEndpoint;
        aobj[2] = lowerBoundType;
        aobj[3] = upperEndpoint;
        aobj[4] = upperBoundType;
        return Objects.hashCode(aobj);
    }

    GeneralRange intersect(GeneralRange generalrange)
    {
        Preconditions.checkNotNull(generalrange);
        Preconditions.checkArgument(comparator.equals(generalrange.comparator));
        boolean flag = hasLowerBound;
        Object obj = lowerEndpoint;
        BoundType boundtype = lowerBoundType;
        if (!hasLowerBound())
        {
            flag = generalrange.hasLowerBound;
            obj = generalrange.lowerEndpoint;
            boundtype = generalrange.lowerBoundType;
        } else
        if (generalrange.hasLowerBound())
        {
            int k = comparator.compare(lowerEndpoint, generalrange.lowerEndpoint);
            if (k < 0 || k == 0 && generalrange.lowerBoundType == BoundType.OPEN)
            {
                obj = generalrange.lowerEndpoint;
                boundtype = generalrange.lowerBoundType;
            }
        }
        boolean flag1 = hasUpperBound;
        Object obj1 = upperEndpoint;
        BoundType boundtype1 = upperBoundType;
        if (!hasUpperBound())
        {
            flag1 = generalrange.hasUpperBound;
            obj1 = generalrange.upperEndpoint;
            boundtype1 = generalrange.upperBoundType;
        } else
        if (generalrange.hasUpperBound())
        {
            int j = comparator.compare(upperEndpoint, generalrange.upperEndpoint);
            if (j > 0 || j == 0 && generalrange.upperBoundType == BoundType.OPEN)
            {
                obj1 = generalrange.upperEndpoint;
                boundtype1 = generalrange.upperBoundType;
            }
        }
        if (flag && flag1)
        {
            int i = comparator.compare(obj, obj1);
            if (i > 0 || i == 0 && boundtype == BoundType.OPEN && boundtype1 == BoundType.OPEN)
            {
                obj = obj1;
                boundtype = BoundType.OPEN;
                boundtype1 = BoundType.CLOSED;
            }
        }
        return new GeneralRange(comparator, flag, obj, boundtype, flag1, obj1, boundtype1);
    }

    boolean isEmpty()
    {
        return hasUpperBound() && tooLow(upperEndpoint) || hasLowerBound() && tooHigh(lowerEndpoint);
    }

    public GeneralRange reverse()
    {
        GeneralRange generalrange = reverse;
        if (generalrange == null)
        {
            GeneralRange generalrange1 = new GeneralRange(Ordering.from(comparator).reverse(), hasUpperBound, upperEndpoint, upperBoundType, hasLowerBound, lowerEndpoint, lowerBoundType);
            generalrange1.reverse = this;
            reverse = generalrange1;
            return generalrange1;
        } else
        {
            return generalrange;
        }
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        stringbuilder.append(comparator).append(":");
        static class _cls1
        {

            static final int $SwitchMap$com$google$common$collect$BoundType[];

            static 
            {
                $SwitchMap$com$google$common$collect$BoundType = new int[BoundType.values().length];
                try
                {
                    $SwitchMap$com$google$common$collect$BoundType[BoundType.CLOSED.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$google$common$collect$BoundType[BoundType.OPEN.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.com.google.common.collect.BoundType[lowerBoundType.ordinal()])
        {
        case 2: // '\002'
            stringbuilder.append('(');
            break;

        case 1: // '\001'
            stringbuilder.append('[');
            break;
        }
        if (hasLowerBound())
            stringbuilder.append(lowerEndpoint);
        else
            stringbuilder.append("-\u221E");
        stringbuilder.append(',');
        if (hasUpperBound())
            stringbuilder.append(upperEndpoint);
        else
            stringbuilder.append("\u221E");
        switch (_cls1..SwitchMap.com.google.common.collect.BoundType[upperBoundType.ordinal()])
        {
        case 2: // '\002'
            stringbuilder.append(')');
            break;

        case 1: // '\001'
            stringbuilder.append(']');
            break;
        }
        return stringbuilder.toString();
    }

    boolean tooHigh(Object obj)
    {
        boolean flag = true;
        if (!hasUpperBound())
            return false;
        Object obj1 = upperEndpoint;
        int i = comparator.compare(obj, obj1);
        boolean flag1;
        if (i > 0)
            flag1 = flag;
        else
            flag1 = false;
        boolean flag2;
        if (i == 0)
            flag2 = flag;
        else
            flag2 = false;
        if (upperBoundType != BoundType.OPEN)
            flag = false;
        return flag1 | flag2 & flag;
    }

    boolean tooLow(Object obj)
    {
        boolean flag = true;
        if (!hasLowerBound())
            return false;
        Object obj1 = lowerEndpoint;
        int i = comparator.compare(obj, obj1);
        boolean flag1;
        if (i < 0)
            flag1 = flag;
        else
            flag1 = false;
        boolean flag2;
        if (i == 0)
            flag2 = flag;
        else
            flag2 = false;
        if (lowerBoundType != BoundType.OPEN)
            flag = false;
        return flag1 | flag2 & flag;
    }
}
