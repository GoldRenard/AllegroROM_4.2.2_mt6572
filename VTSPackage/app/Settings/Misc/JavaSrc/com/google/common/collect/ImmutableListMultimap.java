// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableMultimap, ListMultimap, Multimap, ImmutableMap, 
//            ImmutableList, ImmutableCollection, EmptyImmutableListMultimap, Serialization

public class ImmutableListMultimap extends ImmutableMultimap
    implements ListMultimap
{
    public static final class Builder extends ImmutableMultimap.Builder
    {

        public ImmutableListMultimap build()
        {
            return (ImmutableListMultimap)super.build();
        }

        public volatile ImmutableMultimap build()
        {
            return build();
        }

        public Builder orderKeysBy(Comparator comparator)
        {
            super.orderKeysBy(comparator);
            return this;
        }

        public volatile ImmutableMultimap.Builder orderKeysBy(Comparator comparator)
        {
            return orderKeysBy(comparator);
        }

        public Builder orderValuesBy(Comparator comparator)
        {
            super.orderValuesBy(comparator);
            return this;
        }

        public volatile ImmutableMultimap.Builder orderValuesBy(Comparator comparator)
        {
            return orderValuesBy(comparator);
        }

        public Builder put(Object obj, Object obj1)
        {
            super.put(obj, obj1);
            return this;
        }

        public Builder put(java.util.Map.Entry entry)
        {
            super.put(entry);
            return this;
        }

        public volatile ImmutableMultimap.Builder put(Object obj, Object obj1)
        {
            return put(obj, obj1);
        }

        public volatile ImmutableMultimap.Builder put(java.util.Map.Entry entry)
        {
            return put(entry);
        }

        public Builder putAll(Multimap multimap)
        {
            super.putAll(multimap);
            return this;
        }

        public Builder putAll(Object obj, Iterable iterable)
        {
            super.putAll(obj, iterable);
            return this;
        }

        public transient Builder putAll(Object obj, Object aobj[])
        {
            super.putAll(obj, aobj);
            return this;
        }

        public volatile ImmutableMultimap.Builder putAll(Multimap multimap)
        {
            return putAll(multimap);
        }

        public volatile ImmutableMultimap.Builder putAll(Object obj, Iterable iterable)
        {
            return putAll(obj, iterable);
        }

        public volatile ImmutableMultimap.Builder putAll(Object obj, Object aobj[])
        {
            return putAll(obj, aobj);
        }

    }


    private static final long serialVersionUID;
    private transient ImmutableListMultimap inverse;

    ImmutableListMultimap(ImmutableMap immutablemap, int i)
    {
        super(immutablemap, i);
    }

    public static Builder builder()
    {
        return new Builder();
    }

    public static ImmutableListMultimap copyOf(Multimap multimap)
    {
        ImmutableListMultimap immutablelistmultimap;
label0:
        {
            if (multimap.isEmpty())
            {
                immutablelistmultimap = of();
                break label0;
            }
            if (multimap instanceof ImmutableListMultimap)
            {
                immutablelistmultimap = (ImmutableListMultimap)multimap;
                if (!immutablelistmultimap.isPartialView())
                    break label0;
            }
            ImmutableMap.Builder builder1 = ImmutableMap.builder();
            int i = 0;
            Iterator iterator = multimap.asMap().entrySet().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
                ImmutableList immutablelist = ImmutableList.copyOf((Collection)entry.getValue());
                if (!immutablelist.isEmpty())
                {
                    builder1.put(entry.getKey(), immutablelist);
                    i += immutablelist.size();
                }
            } while (true);
            return new ImmutableListMultimap(builder1.build(), i);
        }
        return immutablelistmultimap;
    }

    private ImmutableListMultimap invert()
    {
        Builder builder1 = builder();
        java.util.Map.Entry entry;
        for (Iterator iterator = entries().iterator(); iterator.hasNext(); builder1.put(entry.getValue(), entry.getKey()))
            entry = (java.util.Map.Entry)iterator.next();

        ImmutableListMultimap immutablelistmultimap = builder1.build();
        immutablelistmultimap.inverse = this;
        return immutablelistmultimap;
    }

    public static ImmutableListMultimap of()
    {
        return EmptyImmutableListMultimap.INSTANCE;
    }

    public static ImmutableListMultimap of(Object obj, Object obj1)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        return builder1.build();
    }

    public static ImmutableListMultimap of(Object obj, Object obj1, Object obj2, Object obj3)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        return builder1.build();
    }

    public static ImmutableListMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        builder1.put(obj4, obj5);
        return builder1.build();
    }

    public static ImmutableListMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        builder1.put(obj4, obj5);
        builder1.put(obj6, obj7);
        return builder1.build();
    }

    public static ImmutableListMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, 
            Object obj8, Object obj9)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        builder1.put(obj4, obj5);
        builder1.put(obj6, obj7);
        builder1.put(obj8, obj9);
        return builder1.build();
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        int i = objectinputstream.readInt();
        if (i < 0)
            throw new InvalidObjectException((new StringBuilder()).append("Invalid key count ").append(i).toString());
        ImmutableMap.Builder builder1 = ImmutableMap.builder();
        int j = 0;
        for (int k = 0; k < i; k++)
        {
            Object obj = objectinputstream.readObject();
            int l = objectinputstream.readInt();
            if (l <= 0)
                throw new InvalidObjectException((new StringBuilder()).append("Invalid value count ").append(l).toString());
            Object aobj[] = new Object[l];
            for (int i1 = 0; i1 < l; i1++)
                aobj[i1] = objectinputstream.readObject();

            builder1.put(obj, ImmutableList.copyOf(aobj));
            j += l;
        }

        ImmutableMap immutablemap;
        try
        {
            immutablemap = builder1.build();
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            throw (InvalidObjectException)(new InvalidObjectException(illegalargumentexception.getMessage())).initCause(illegalargumentexception);
        }
        ImmutableMultimap.FieldSettersHolder.MAP_FIELD_SETTER.set(this, immutablemap);
        ImmutableMultimap.FieldSettersHolder.SIZE_FIELD_SETTER.set(this, j);
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        Serialization.writeMultimap(this, objectoutputstream);
    }

    public volatile ImmutableCollection get(Object obj)
    {
        return get(obj);
    }

    public ImmutableList get(Object obj)
    {
        ImmutableList immutablelist = (ImmutableList)super.map.get(obj);
        if (immutablelist == null)
            immutablelist = ImmutableList.of();
        return immutablelist;
    }

    public volatile Collection get(Object obj)
    {
        return get(obj);
    }

    public volatile List get(Object obj)
    {
        return get(obj);
    }

    public ImmutableListMultimap inverse()
    {
        ImmutableListMultimap immutablelistmultimap = inverse;
        if (immutablelistmultimap == null)
        {
            immutablelistmultimap = invert();
            inverse = immutablelistmultimap;
        }
        return immutablelistmultimap;
    }

    public volatile ImmutableMultimap inverse()
    {
        return inverse();
    }

    public volatile ImmutableCollection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public ImmutableList removeAll(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public volatile Collection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public volatile List removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public volatile ImmutableCollection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public ImmutableList replaceValues(Object obj, Iterable iterable)
    {
        throw new UnsupportedOperationException();
    }

    public volatile Collection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public volatile List replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }
}
