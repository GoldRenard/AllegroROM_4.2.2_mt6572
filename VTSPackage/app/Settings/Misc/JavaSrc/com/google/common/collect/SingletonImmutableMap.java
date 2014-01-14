// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableMap, Maps, ImmutableSet, ImmutableCollection, 
//            Iterators, UnmodifiableIterator

final class SingletonImmutableMap extends ImmutableMap
{
    private static class Values extends ImmutableCollection
    {

        final Object singleValue;

        public boolean contains(Object obj)
        {
            return singleValue.equals(obj);
        }

        public boolean isEmpty()
        {
            return false;
        }

        boolean isPartialView()
        {
            return true;
        }

        public UnmodifiableIterator iterator()
        {
            return Iterators.singletonIterator(singleValue);
        }

        public volatile Iterator iterator()
        {
            return iterator();
        }

        public int size()
        {
            return 1;
        }

        Values(Object obj)
        {
            singleValue = obj;
        }
    }


    private transient java.util.Map.Entry entry;
    private transient ImmutableSet entrySet;
    private transient ImmutableSet keySet;
    final transient Object singleKey;
    final transient Object singleValue;
    private transient ImmutableCollection values;

    SingletonImmutableMap(Object obj, Object obj1)
    {
        singleKey = obj;
        singleValue = obj1;
    }

    SingletonImmutableMap(java.util.Map.Entry entry1)
    {
        entry = entry1;
        singleKey = entry1.getKey();
        singleValue = entry1.getValue();
    }

    private java.util.Map.Entry entry()
    {
        java.util.Map.Entry entry1 = entry;
        if (entry1 == null)
        {
            entry1 = Maps.immutableEntry(singleKey, singleValue);
            entry = entry1;
        }
        return entry1;
    }

    public boolean containsKey(Object obj)
    {
        return singleKey.equals(obj);
    }

    public boolean containsValue(Object obj)
    {
        return singleValue.equals(obj);
    }

    public ImmutableSet entrySet()
    {
        ImmutableSet immutableset = entrySet;
        if (immutableset == null)
        {
            immutableset = ImmutableSet.of(entry());
            entrySet = immutableset;
        }
        return immutableset;
    }

    public volatile Set entrySet()
    {
        return entrySet();
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof Map))
                    break label0;
                Map map = (Map)obj;
                if (map.size() != 1)
                    return false;
                java.util.Map.Entry entry1 = (java.util.Map.Entry)map.entrySet().iterator().next();
                if (!singleKey.equals(entry1.getKey()) || !singleValue.equals(entry1.getValue()))
                    return false;
            }
            return true;
        }
        return false;
    }

    public Object get(Object obj)
    {
        if (singleKey.equals(obj))
            return singleValue;
        else
            return null;
    }

    public int hashCode()
    {
        return singleKey.hashCode() ^ singleValue.hashCode();
    }

    public boolean isEmpty()
    {
        return false;
    }

    boolean isPartialView()
    {
        return false;
    }

    public ImmutableSet keySet()
    {
        ImmutableSet immutableset = keySet;
        if (immutableset == null)
        {
            immutableset = ImmutableSet.of(singleKey);
            keySet = immutableset;
        }
        return immutableset;
    }

    public volatile Set keySet()
    {
        return keySet();
    }

    public int size()
    {
        return 1;
    }

    public String toString()
    {
        return (new StringBuilder()).append('{').append(singleKey.toString()).append('=').append(singleValue.toString()).append('}').toString();
    }

    public ImmutableCollection values()
    {
        Object obj = values;
        if (obj == null)
        {
            obj = new Values(singleValue);
            values = ((ImmutableCollection) (obj));
        }
        return ((ImmutableCollection) (obj));
    }

    public volatile Collection values()
    {
        return values();
    }
}
