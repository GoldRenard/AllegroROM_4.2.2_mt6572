// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ForwardingSetMultimap, SortedSetMultimap, Multimap, SetMultimap

public abstract class ForwardingSortedSetMultimap extends ForwardingSetMultimap
    implements SortedSetMultimap
{


    protected volatile Multimap _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile SetMultimap _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract SortedSetMultimap _mthdelegate();

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    public volatile Collection get(Object obj)
    {
        return get(obj);
    }

    public volatile Set get(Object obj)
    {
        return get(obj);
    }

    public SortedSet get(Object obj)
    {
        return _mthdelegate().get(obj);
    }

    public volatile Collection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public volatile Set removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public SortedSet removeAll(Object obj)
    {
        return _mthdelegate().removeAll(obj);
    }

    public volatile Collection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public volatile Set replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public SortedSet replaceValues(Object obj, Iterable iterable)
    {
        return _mthdelegate().replaceValues(obj, iterable);
    }

    public Comparator valueComparator()
    {
        return _mthdelegate().valueComparator();
    }
}
