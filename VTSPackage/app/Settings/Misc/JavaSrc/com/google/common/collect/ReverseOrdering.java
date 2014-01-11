// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Iterator;

// Referenced classes of package com.google.common.collect:
//            Ordering

final class ReverseOrdering extends Ordering
    implements Serializable
{

    private static final long serialVersionUID;
    final Ordering forwardOrder;

    ReverseOrdering(Ordering ordering)
    {
        forwardOrder = (Ordering)Preconditions.checkNotNull(ordering);
    }

    public int compare(Object obj, Object obj1)
    {
        return forwardOrder.compare(obj1, obj);
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof ReverseOrdering)
        {
            ReverseOrdering reverseordering = (ReverseOrdering)obj;
            return forwardOrder.equals(reverseordering.forwardOrder);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return -forwardOrder.hashCode();
    }

    public Object max(Iterable iterable)
    {
        return forwardOrder.min(iterable);
    }

    public Object max(Object obj, Object obj1)
    {
        return forwardOrder.min(obj, obj1);
    }

    public transient Object max(Object obj, Object obj1, Object obj2, Object aobj[])
    {
        return forwardOrder.min(obj, obj1, obj2, aobj);
    }

    public Object max(Iterator iterator)
    {
        return forwardOrder.min(iterator);
    }

    public Object min(Iterable iterable)
    {
        return forwardOrder.max(iterable);
    }

    public Object min(Object obj, Object obj1)
    {
        return forwardOrder.max(obj, obj1);
    }

    public transient Object min(Object obj, Object obj1, Object obj2, Object aobj[])
    {
        return forwardOrder.max(obj, obj1, obj2, aobj);
    }

    public Object min(Iterator iterator)
    {
        return forwardOrder.max(iterator);
    }

    public Ordering reverse()
    {
        return forwardOrder;
    }

    public String toString()
    {
        return (new StringBuilder()).append(forwardOrder).append(".reverse()").toString();
    }
}
