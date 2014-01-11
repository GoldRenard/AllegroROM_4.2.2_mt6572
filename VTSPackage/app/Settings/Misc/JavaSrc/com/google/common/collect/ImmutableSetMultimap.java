// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableMultimap, SetMultimap, ImmutableSortedSet, Multimap, 
//            ImmutableMap, ImmutableSet, EmptyImmutableSetMultimap, Serialization, 
//            ImmutableCollection, AbstractMultimap, Sets

public class ImmutableSetMultimap extends ImmutableMultimap
    implements SetMultimap
{
    public static final class Builder extends ImmutableMultimap.Builder
    {

        public volatile ImmutableMultimap build()
        {
            return build();
        }

        public ImmutableSetMultimap build()
        {
            return ImmutableSetMultimap.copyOf(super.builderMultimap, super.valueComparator);
        }

        public volatile ImmutableMultimap.Builder orderKeysBy(Comparator comparator)
        {
            return orderKeysBy(comparator);
        }

        public Builder orderKeysBy(Comparator comparator)
        {
            super.builderMultimap = new SortedKeyBuilderMultimap((Comparator)Preconditions.checkNotNull(comparator), super.builderMultimap);
            return this;
        }

        public volatile ImmutableMultimap.Builder orderValuesBy(Comparator comparator)
        {
            return orderValuesBy(comparator);
        }

        public Builder orderValuesBy(Comparator comparator)
        {
            super.orderValuesBy(comparator);
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

        public Builder put(Object obj, Object obj1)
        {
            super.builderMultimap.put(Preconditions.checkNotNull(obj), Preconditions.checkNotNull(obj1));
            return this;
        }

        public Builder put(java.util.Map.Entry entry)
        {
            super.builderMultimap.put(Preconditions.checkNotNull(entry.getKey()), Preconditions.checkNotNull(entry.getValue()));
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

        public Builder putAll(Multimap multimap)
        {
            java.util.Map.Entry entry;
            for (Iterator iterator = multimap.asMap().entrySet().iterator(); iterator.hasNext(); putAll(entry.getKey(), (Iterable)entry.getValue()))
                entry = (java.util.Map.Entry)iterator.next();

            return this;
        }

        public Builder putAll(Object obj, Iterable iterable)
        {
            Collection collection = super.builderMultimap.get(Preconditions.checkNotNull(obj));
            for (Iterator iterator = iterable.iterator(); iterator.hasNext(); collection.add(Preconditions.checkNotNull(iterator.next())));
            return this;
        }

        public transient Builder putAll(Object obj, Object aobj[])
        {
            return putAll(obj, ((Iterable) (Arrays.asList(aobj))));
        }

        public Builder()
        {
            super.builderMultimap = new BuilderMultimap();
        }
    }

    private static class BuilderMultimap extends AbstractMultimap
    {

        private static final long serialVersionUID;

        Collection createCollection()
        {
            return Sets.newLinkedHashSet();
        }

        BuilderMultimap()
        {
            super(new LinkedHashMap());
        }
    }

    private static class SortedKeyBuilderMultimap extends AbstractMultimap
    {

        private static final long serialVersionUID;

        Collection createCollection()
        {
            return Sets.newLinkedHashSet();
        }

        SortedKeyBuilderMultimap(Comparator comparator, Multimap multimap)
        {
            super(new TreeMap(comparator));
            putAll(multimap);
        }
    }


    private static final long serialVersionUID;
    private final transient ImmutableSortedSet emptySet;
    private transient ImmutableSet entries;
    private transient ImmutableSetMultimap inverse;

    ImmutableSetMultimap(ImmutableMap immutablemap, int i, Comparator comparator)
    {
        super(immutablemap, i);
        ImmutableSortedSet immutablesortedset;
        if (comparator == null)
            immutablesortedset = null;
        else
            immutablesortedset = ImmutableSortedSet.emptySet(comparator);
        emptySet = immutablesortedset;
    }

    public static Builder builder()
    {
        return new Builder();
    }

    public static ImmutableSetMultimap copyOf(Multimap multimap)
    {
        return copyOf(multimap, null);
    }

    private static ImmutableSetMultimap copyOf(Multimap multimap, Comparator comparator)
    {
        ImmutableSetMultimap immutablesetmultimap;
label0:
        {
            Preconditions.checkNotNull(multimap);
            if (multimap.isEmpty() && comparator == null)
            {
                immutablesetmultimap = of();
                break label0;
            }
            if (multimap instanceof ImmutableSetMultimap)
            {
                immutablesetmultimap = (ImmutableSetMultimap)multimap;
                if (!immutablesetmultimap.isPartialView())
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
                Object obj = entry.getKey();
                Collection collection = (Collection)entry.getValue();
                Object obj1;
                if (comparator == null)
                    obj1 = ImmutableSet.copyOf(collection);
                else
                    obj1 = ImmutableSortedSet.copyOf(comparator, collection);
                if (!((ImmutableSet) (obj1)).isEmpty())
                {
                    builder1.put(obj, obj1);
                    i += ((ImmutableSet) (obj1)).size();
                }
            } while (true);
            return new ImmutableSetMultimap(builder1.build(), i, comparator);
        }
        return immutablesetmultimap;
    }

    private ImmutableSetMultimap invert()
    {
        Builder builder1 = builder();
        java.util.Map.Entry entry;
        for (Iterator iterator = entries().iterator(); iterator.hasNext(); builder1.put(entry.getValue(), entry.getKey()))
            entry = (java.util.Map.Entry)iterator.next();

        ImmutableSetMultimap immutablesetmultimap = builder1.build();
        immutablesetmultimap.inverse = this;
        return immutablesetmultimap;
    }

    public static ImmutableSetMultimap of()
    {
        return EmptyImmutableSetMultimap.INSTANCE;
    }

    public static ImmutableSetMultimap of(Object obj, Object obj1)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        return builder1.build();
    }

    public static ImmutableSetMultimap of(Object obj, Object obj1, Object obj2, Object obj3)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        return builder1.build();
    }

    public static ImmutableSetMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        builder1.put(obj4, obj5);
        return builder1.build();
    }

    public static ImmutableSetMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7)
    {
        Builder builder1 = builder();
        builder1.put(obj, obj1);
        builder1.put(obj2, obj3);
        builder1.put(obj4, obj5);
        builder1.put(obj6, obj7);
        return builder1.build();
    }

    public static ImmutableSetMultimap of(Object obj, Object obj1, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, 
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

            ImmutableSet immutableset = ImmutableSet.copyOf(aobj);
            if (immutableset.size() != aobj.length)
                throw new InvalidObjectException((new StringBuilder()).append("Duplicate key-value pairs exist for key ").append(obj).toString());
            builder1.put(obj, immutableset);
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

    public volatile ImmutableCollection entries()
    {
        return entries();
    }

    public ImmutableSet entries()
    {
        ImmutableSet immutableset = entries;
        if (immutableset == null)
        {
            immutableset = ImmutableSet.copyOf(super.entries());
            entries = immutableset;
        }
        return immutableset;
    }

    public volatile Collection entries()
    {
        return entries();
    }

    public volatile Set entries()
    {
        return entries();
    }

    public volatile ImmutableCollection get(Object obj)
    {
        return get(obj);
    }

    public ImmutableSet get(Object obj)
    {
        ImmutableSet immutableset = (ImmutableSet)super.map.get(obj);
        if (immutableset != null)
            return immutableset;
        if (emptySet != null)
            return emptySet;
        else
            return ImmutableSet.of();
    }

    public volatile Collection get(Object obj)
    {
        return get(obj);
    }

    public volatile Set get(Object obj)
    {
        return get(obj);
    }

    public volatile ImmutableMultimap inverse()
    {
        return inverse();
    }

    public ImmutableSetMultimap inverse()
    {
        ImmutableSetMultimap immutablesetmultimap = inverse;
        if (immutablesetmultimap == null)
        {
            immutablesetmultimap = invert();
            inverse = immutablesetmultimap;
        }
        return immutablesetmultimap;
    }

    public volatile ImmutableCollection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public ImmutableSet removeAll(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public volatile Collection removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public volatile Set removeAll(Object obj)
    {
        return removeAll(obj);
    }

    public volatile ImmutableCollection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public ImmutableSet replaceValues(Object obj, Iterable iterable)
    {
        throw new UnsupportedOperationException();
    }

    public volatile Collection replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

    public volatile Set replaceValues(Object obj, Iterable iterable)
    {
        return replaceValues(obj, iterable);
    }

}
