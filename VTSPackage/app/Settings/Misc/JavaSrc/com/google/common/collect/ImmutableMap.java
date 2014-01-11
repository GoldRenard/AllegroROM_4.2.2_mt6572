// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMap, SingletonImmutableMap, RegularImmutableMap, Maps, 
//            EmptyImmutableMap, ImmutableSet, ImmutableCollection, Lists, 
//            Iterables, ImmutableEntry

public abstract class ImmutableMap
    implements Map, Serializable
{
    public static class Builder
    {

        final ArrayList entries = Lists.newArrayList();

        private static ImmutableMap fromEntryList(List list)
        {
            switch (list.size())
            {
            case 1: // '\001'
                return new SingletonImmutableMap((java.util.Map.Entry)Iterables.getOnlyElement(list));

            case 0: // '\0'
                return ImmutableMap.of();
            }
            return new RegularImmutableMap((java.util.Map.Entry[])list.toArray(new java.util.Map.Entry[list.size()]));
        }

        public ImmutableMap build()
        {
            return fromEntryList(entries);
        }

        public Builder put(Object obj, Object obj1)
        {
            entries.add(ImmutableMap.entryOf(obj, obj1));
            return this;
        }

        public Builder put(java.util.Map.Entry entry)
        {
            Object obj = entry.getKey();
            Object obj1 = entry.getValue();
            if (entry instanceof ImmutableEntry)
            {
                Preconditions.checkNotNull(obj);
                Preconditions.checkNotNull(obj1);
                entries.add(entry);
                return this;
            } else
            {
                entries.add(ImmutableMap.entryOf(obj, obj1));
                return this;
            }
        }

        public Builder putAll(Map map)
        {
            entries.ensureCapacity(entries.size() + map.size());
            java.util.Map.Entry entry;
            for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); put(entry.getKey(), entry.getValue()))
                entry = (java.util.Map.Entry)iterator.next();

            return this;
        }

    }

    static class SerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        private final Object keys[];
        private final Object values[];

        Object createMap(Builder builder1)
        {
            for (int i = 0; i < keys.length; i++)
                builder1.put(keys[i], values[i]);

            return builder1.build();
        }

        Object readResolve()
        {
            return createMap(new Builder());
        }

        SerializedForm(ImmutableMap immutablemap)
        {
            keys = new Object[immutablemap.size()];
            values = new Object[immutablemap.size()];
            int i = 0;
            for (Iterator iterator = immutablemap.entrySet().iterator(); iterator.hasNext();)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                keys[i] = entry.getKey();
                values[i] = entry.getValue();
                i++;
            }

        }
    }



    public static Builder builder()
    {
        return new Builder();
    }

    public static ImmutableMap copyOf(Map map)
    {
        if ((map instanceof ImmutableMap) && !(map instanceof ImmutableSortedMap))
        {
            ImmutableMap immutablemap = (ImmutableMap)map;
            if (!immutablemap.isPartialView())
                return immutablemap;
        }
        java.util.Map.Entry aentry[] = (java.util.Map.Entry[])map.entrySet().toArray(new java.util.Map.Entry[0]);
        int i;
        switch (aentry.length)
        {
        case 1: // '\001'
            return new SingletonImmutableMap(entryOf(aentry[0].getKey(), aentry[0].getValue()));

        case 0: // '\0'
            return of();

        default:
            i = 0;
            break;
        }
        for (; i < aentry.length; i++)
            aentry[i] = entryOf(aentry[i].getKey(), aentry[i].getValue());

        return new RegularImmutableMap(aentry);
    }

    static java.util.Map.Entry entryOf(Object obj, Object obj1)
    {
        return Maps.immutableEntry(Preconditions.checkNotNull(obj, "null key"), Preconditions.checkNotNull(obj1, "null value"));
    }

    public static ImmutableMap of()
    {
        return EmptyImmutableMap.INSTANCE;
    }

    public static ImmutableMap of(Object obj, Object obj1)
    {
        return new SingletonImmutableMap(Preconditions.checkNotNull(obj), Preconditions.checkNotNull(obj1));
    }

    public static ImmutableMap of(Object obj, Object obj1, Object obj2, Object obj3)
    {
        java.util.Map.Entry aentry[] = new java.util.Map.Entry[2];
        aentry[0] = entryOf(obj, obj1);
        aentry[1] = entryOf(obj2, obj3);
        return new RegularImmutableMap(aentry);
    }

    public static ImmutableMap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5)
    {
        java.util.Map.Entry aentry[] = new java.util.Map.Entry[3];
        aentry[0] = entryOf(obj, obj1);
        aentry[1] = entryOf(obj2, obj3);
        aentry[2] = entryOf(obj4, obj5);
        return new RegularImmutableMap(aentry);
    }

    public static ImmutableMap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7)
    {
        java.util.Map.Entry aentry[] = new java.util.Map.Entry[4];
        aentry[0] = entryOf(obj, obj1);
        aentry[1] = entryOf(obj2, obj3);
        aentry[2] = entryOf(obj4, obj5);
        aentry[3] = entryOf(obj6, obj7);
        return new RegularImmutableMap(aentry);
    }

    public static ImmutableMap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, 
            Object obj8, Object obj9)
    {
        java.util.Map.Entry aentry[] = new java.util.Map.Entry[5];
        aentry[0] = entryOf(obj, obj1);
        aentry[1] = entryOf(obj2, obj3);
        aentry[2] = entryOf(obj4, obj5);
        aentry[3] = entryOf(obj6, obj7);
        aentry[4] = entryOf(obj8, obj9);
        return new RegularImmutableMap(aentry);
    }

    public final void clear()
    {
        throw new UnsupportedOperationException();
    }

    public boolean containsKey(Object obj)
    {
        return get(obj) != null;
    }

    public abstract boolean containsValue(Object obj);

    public abstract ImmutableSet entrySet();

    public volatile Set entrySet()
    {
        return entrySet();
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof Map)
        {
            Map map = (Map)obj;
            return entrySet().equals(map.entrySet());
        } else
        {
            return false;
        }
    }

    public abstract Object get(Object obj);

    public int hashCode()
    {
        return entrySet().hashCode();
    }

    public boolean isEmpty()
    {
        return size() == 0;
    }

    abstract boolean isPartialView();

    public abstract ImmutableSet keySet();

    public volatile Set keySet()
    {
        return keySet();
    }

    public final Object put(Object obj, Object obj1)
    {
        throw new UnsupportedOperationException();
    }

    public final void putAll(Map map)
    {
        throw new UnsupportedOperationException();
    }

    public final Object remove(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public String toString()
    {
        return Maps.toStringImpl(this);
    }

    public abstract ImmutableCollection values();

    public volatile Collection values()
    {
        return values();
    }

    Object writeReplace()
    {
        return new SerializedForm(this);
    }
}
