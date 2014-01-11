// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Ordering, Lists

final class ComparatorOrdering extends Ordering
    implements Serializable
{

    private static final long serialVersionUID;
    final Comparator comparator;

    ComparatorOrdering(Comparator comparator1)
    {
        comparator = (Comparator)Preconditions.checkNotNull(comparator1);
    }

    public int binarySearch(List list, Object obj)
    {
        return Collections.binarySearch(list, obj, comparator);
    }

    public int compare(Object obj, Object obj1)
    {
        return comparator.compare(obj, obj1);
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof ComparatorOrdering)
        {
            ComparatorOrdering comparatorordering = (ComparatorOrdering)obj;
            return comparator.equals(comparatorordering.comparator);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return comparator.hashCode();
    }

    public List sortedCopy(Iterable iterable)
    {
        java.util.ArrayList arraylist = Lists.newArrayList(iterable);
        Collections.sort(arraylist, comparator);
        return arraylist;
    }

    public String toString()
    {
        return comparator.toString();
    }
}
