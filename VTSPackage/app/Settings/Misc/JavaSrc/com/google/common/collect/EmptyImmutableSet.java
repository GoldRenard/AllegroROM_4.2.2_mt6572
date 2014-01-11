// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSet, Iterators, UnmodifiableIterator

final class EmptyImmutableSet extends ImmutableSet
{

    private static final Object EMPTY_ARRAY[] = new Object[0];
    static final EmptyImmutableSet INSTANCE = new EmptyImmutableSet();
    private static final long serialVersionUID;

    private EmptyImmutableSet()
    {
    }

    public boolean contains(Object obj)
    {
        return false;
    }

    public boolean containsAll(Collection collection)
    {
        return collection.isEmpty();
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof Set)
            return ((Set)obj).isEmpty();
        else
            return false;
    }

    public final int hashCode()
    {
        return 0;
    }

    public boolean isEmpty()
    {
        return true;
    }

    boolean isHashCodeFast()
    {
        return true;
    }

    boolean isPartialView()
    {
        return false;
    }

    public UnmodifiableIterator iterator()
    {
        return Iterators.emptyIterator();
    }

    public volatile Iterator iterator()
    {
        return iterator();
    }

    Object readResolve()
    {
        return INSTANCE;
    }

    public int size()
    {
        return 0;
    }

    public Object[] toArray()
    {
        return EMPTY_ARRAY;
    }

    public Object[] toArray(Object aobj[])
    {
        if (aobj.length > 0)
            aobj[0] = null;
        return aobj;
    }

    public String toString()
    {
        return "[]";
    }

}
