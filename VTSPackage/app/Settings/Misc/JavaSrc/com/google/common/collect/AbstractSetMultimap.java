// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractMultimap, SetMultimap

abstract class AbstractSetMultimap extends AbstractMultimap
    implements SetMultimap
{

    private static final long serialVersionUID = 0x67226fd4cd0928d8L;

    protected AbstractSetMultimap(Map map)
    {
        super(map);
    }

    public Map asMap()
    {
        return super.asMap();
    }

    volatile Collection createCollection()
    {
        return createCollection();
    }

    abstract Set createCollection();

    public volatile Collection entries()
    {
        return entries();
    }

    public Set entries()
    {
        return (Set)super.entries();
    }

    public boolean equals(Object obj)
    {
        return super.equals(obj);
    }

    public volatile Collection get(Object obj)
    {
        return get(obj);
    }

    public Set get(Object obj)
    {
        return (Set)super.get(obj);
    }

    public boolean put(Object obj, Object obj1)
    {
        return super.put(obj, obj1);
    }

    public volatile Collection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public Set removeAll(Object obj)
    {
        return (Set)super.removeAll(obj);
    }

    public volatile Collection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public Set replaceValues(Object obj, Iterable iterable)
    {
        return (Set)super.replaceValues(obj, iterable);
    }
}
