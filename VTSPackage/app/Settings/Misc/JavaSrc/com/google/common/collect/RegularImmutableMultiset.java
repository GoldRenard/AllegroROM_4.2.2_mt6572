// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;

// Referenced classes of package com.google.common.collect:
//            ImmutableMultiset, ImmutableMap, ImmutableSet, UnmodifiableIterator, 
//            Multisets

class RegularImmutableMultiset extends ImmutableMultiset
{

    private final transient ImmutableMap map;
    private final transient int size;

    RegularImmutableMultiset(ImmutableMap immutablemap, int i)
    {
        map = immutablemap;
        size = i;
    }

    public boolean contains(Object obj)
    {
        return map.containsKey(obj);
    }

    public int count(Object obj)
    {
        Integer integer = (Integer)map.get(obj);
        if (integer == null)
            return 0;
        else
            return integer.intValue();
    }

    int distinctElements()
    {
        return map.size();
    }

    public ImmutableSet elementSet()
    {
        return map.keySet();
    }

    public volatile Set elementSet()
    {
        return elementSet();
    }

    UnmodifiableIterator entryIterator()
    {
        return new UnmodifiableIterator() {

            final RegularImmutableMultiset this$0;
            final Iterator val$mapIterator;

            public boolean hasNext()
            {
                return mapIterator.hasNext();
            }

            public Multiset.Entry next()
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)mapIterator.next();
                return Multisets.immutableEntry(entry.getKey(), ((Integer)entry.getValue()).intValue());
            }

            public volatile Object next()
            {
                return next();
            }

            
            {
                this$0 = RegularImmutableMultiset.this;
                mapIterator = iterator;
                super();
            }
        }
;
    }

    public int hashCode()
    {
        return map.hashCode();
    }

    boolean isPartialView()
    {
        return map.isPartialView();
    }

    public int size()
    {
        return size;
    }
}
