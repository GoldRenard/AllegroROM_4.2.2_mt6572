// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.google.common.collect:
//            Ordering, ImmutableMap

final class ExplicitOrdering extends Ordering
    implements Serializable
{

    private static final long serialVersionUID;
    final ImmutableMap rankMap;

    ExplicitOrdering(ImmutableMap immutablemap)
    {
        rankMap = immutablemap;
    }

    ExplicitOrdering(List list)
    {
        this(buildRankMap(list));
    }

    private static ImmutableMap buildRankMap(List list)
    {
        ImmutableMap.Builder builder = ImmutableMap.builder();
        int i = 0;
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            int j = i + 1;
            builder.put(obj, Integer.valueOf(i));
            i = j;
        }

        return builder.build();
    }

    private int rank(Object obj)
    {
        Integer integer = (Integer)rankMap.get(obj);
        if (integer == null)
            throw new Ordering.IncomparableValueException(obj);
        else
            return integer.intValue();
    }

    public int compare(Object obj, Object obj1)
    {
        return rank(obj) - rank(obj1);
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof ExplicitOrdering)
        {
            ExplicitOrdering explicitordering = (ExplicitOrdering)obj;
            return rankMap.equals(explicitordering.rankMap);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return rankMap.hashCode();
    }

    public String toString()
    {
        return (new StringBuilder()).append("Ordering.explicit(").append(rankMap.keySet()).append(")").toString();
    }
}
