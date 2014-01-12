// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Set;

// Referenced classes of package com.google.common.collect:
//            ImmutableSet, Iterators, ObjectArrays, UnmodifiableIterator

final class SingletonImmutableSet extends ImmutableSet
{

    private transient int cachedHashCode;
    final transient Object element;

    SingletonImmutableSet(Object obj)
    {
        element = Preconditions.checkNotNull(obj);
    }

    SingletonImmutableSet(Object obj, int i)
    {
        element = obj;
        cachedHashCode = i;
    }

    public boolean contains(Object obj)
    {
        return element.equals(obj);
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof Set))
                    break label0;
                Set set = (Set)obj;
                if (set.size() != 1 || !element.equals(set.iterator().next()))
                    return false;
            }
            return true;
        }
        return false;
    }

    public final int hashCode()
    {
        int i = cachedHashCode;
        if (i == 0)
        {
            i = element.hashCode();
            cachedHashCode = i;
        }
        return i;
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isHashCodeFast()
    {
        return cachedHashCode != 0;
    }

    boolean isPartialView()
    {
        return false;
    }

    public UnmodifiableIterator iterator()
    {
        return Iterators.singletonIterator(element);
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public int size()
    {
        return 1;
    }

    public Object[] toArray()
    {
        Object aobj[] = new Object[1];
        aobj[0] = element;
        return aobj;
    }

    public Object[] toArray(Object aobj[])
    {
        if (aobj.length == 0)
            aobj = ObjectArrays.newArray(aobj, 1);
        else
        if (aobj.length > 1)
            aobj[1] = null;
        aobj[0] = element;
        return aobj;
    }

    public String toString()
    {
        String s = element.toString();
        return (new StringBuilder(2 + s.length())).append('[').append(s).append(']').toString();
    }
}
