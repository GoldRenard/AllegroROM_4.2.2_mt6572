// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.Serializable;
import java.util.Iterator;

// Referenced classes of package com.google.common.collect:
//            Ordering

final class LexicographicalOrdering extends Ordering
    implements Serializable
{

    private static final long serialVersionUID;
    final Ordering elementOrder;

    LexicographicalOrdering(Ordering ordering)
    {
        elementOrder = ordering;
    }

    public int compare(Iterable iterable, Iterable iterable1)
    {
        Iterator iterator = iterable.iterator();
        Iterator iterator1 = iterable1.iterator();
        while (iterator.hasNext()) 
        {
            if (!iterator1.hasNext())
                return 1;
            int i = elementOrder.compare(iterator.next(), iterator1.next());
            if (i != 0)
                return i;
        }
        return !iterator1.hasNext() ? 0 : -1;
    }

    public volatile int compare(Object obj, Object obj1)
    {
        return compare((Iterable)obj, (Iterable)obj1);
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof LexicographicalOrdering)
        {
            LexicographicalOrdering lexicographicalordering = (LexicographicalOrdering)obj;
            return elementOrder.equals(lexicographicalordering.elementOrder);
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return 0x7bb78cf5 ^ elementOrder.hashCode();
    }

    public String toString()
    {
        return (new StringBuilder()).append(elementOrder).append(".lexicographical()").toString();
    }
}
