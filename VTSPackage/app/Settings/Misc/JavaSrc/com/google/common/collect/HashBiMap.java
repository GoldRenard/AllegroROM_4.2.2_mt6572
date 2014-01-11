// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            AbstractBiMap, Maps, Serialization, BiMap

public final class HashBiMap extends AbstractBiMap
{

    private static final long serialVersionUID;

    private HashBiMap()
    {
        super(new HashMap(), new HashMap());
    }

    private HashBiMap(int i)
    {
        super(Maps.newHashMapWithExpectedSize(i), Maps.newHashMapWithExpectedSize(i));
    }

    public static HashBiMap create()
    {
        return new HashBiMap();
    }

    public static HashBiMap create(int i)
    {
        return new HashBiMap(i);
    }

    public static HashBiMap create(Map map)
    {
        HashBiMap hashbimap = create(map.size());
        hashbimap.putAll(map);
        return hashbimap;
    }

    private void readObject(ObjectInputStream objectinputstream)
        throws IOException, ClassNotFoundException
    {
        objectinputstream.defaultReadObject();
        int i = Serialization.readCount(objectinputstream);
        setDelegates(Maps.newHashMapWithExpectedSize(i), Maps.newHashMapWithExpectedSize(i));
        Serialization.populateMap(this, objectinputstream, i);
    }

    private void writeObject(ObjectOutputStream objectoutputstream)
        throws IOException
    {
        objectoutputstream.defaultWriteObject();
        Serialization.writeMap(this, objectoutputstream);
    }

    public volatile void clear()
    {
        super.clear();
    }

    public volatile boolean containsValue(Object obj)
    {
        return super.containsValue(obj);
    }

    public volatile Set entrySet()
    {
        return super.entrySet();
    }

    public Object forcePut(Object obj, Object obj1)
    {
        return super.forcePut(obj, obj1);
    }

    public volatile BiMap inverse()
    {
        return super.inverse();
    }

    public volatile Set keySet()
    {
        return super.keySet();
    }

    public Object put(Object obj, Object obj1)
    {
        return super.put(obj, obj1);
    }

    public volatile void putAll(Map map)
    {
        super.putAll(map);
    }

    public volatile Object remove(Object obj)
    {
        return super.remove(obj);
    }

    public volatile Set values()
    {
        return super.values();
    }
}
