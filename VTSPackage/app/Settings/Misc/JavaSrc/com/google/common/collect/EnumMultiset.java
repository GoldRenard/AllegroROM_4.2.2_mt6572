// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractMapBasedMultiset, WellBehavedMap, Iterables, Serialization

public final class EnumMultiset extends AbstractMapBasedMultiset
{

    private static final long serialVersionUID;
    private transient Class type;

    private EnumMultiset(Class class1)
    {
        super(WellBehavedMap.wrap(new EnumMap(class1)));
        type = class1;
    }

    public static EnumMultiset create(Class class1)
    {
        return new EnumMultiset(class1);
    }

    public static EnumMultiset create(Iterable iterable)
    {
        Iterator iterator1 = iterable.iterator();
        Preconditions.checkArgument(iterator1.hasNext(), "EnumMultiset constructor passed empty Iterable");
        EnumMultiset enummultiset = new EnumMultiset(((Enum)iterator1.next()).getDeclaringClass());
        Iterables.addAll(enummultiset, iterable);
        return enummultiset;
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        type = (Class)objectinputstream.readObject();
        setBackingMap(WellBehavedMap.wrap(new EnumMap(type)));
        Serialization.populateMultiset(this, objectinputstream);
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        objectoutputstream.writeObject(type);
        Serialization.writeMultiset(this, objectoutputstream);
    }

    public volatile boolean addAll(Collection collection)
    {
        return super.addAll(collection);
    }

    public volatile void clear()
    {
        super.clear();
    }

    public volatile boolean contains(Object obj)
    {
        return super.contains(obj);
    }

    public volatile int count(Object obj)
    {
        return super.count(obj);
    }

    public volatile Set elementSet()
    {
        return super.elementSet();
    }

    public volatile Set entrySet()
    {
        return super.entrySet();
    }

    public volatile boolean equals(Object obj)
    {
        return super.equals(obj);
    }

    public volatile int hashCode()
    {
        return super.hashCode();
    }

    public volatile boolean isEmpty()
    {
        return super.isEmpty();
    }

    public volatile Iterator iterator()
    {
        return super.iterator();
    }

    public volatile int remove(Object obj, int i)
    {
        return super.remove(obj, i);
    }

    public volatile boolean remove(Object obj)
    {
        return super.remove(obj);
    }

    public volatile boolean removeAll(Collection collection)
    {
        return super.removeAll(collection);
    }

    public volatile boolean retainAll(Collection collection)
    {
        return super.retainAll(collection);
    }

    public volatile int size()
    {
        return super.size();
    }

    public volatile String toString()
    {
        return super.toString();
    }
}
