// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multiset

public interface Multimap
{

    public abstract Map asMap();

    public abstract void clear();

    public abstract boolean containsEntry(Object obj, Object obj1);

    public abstract boolean containsKey(Object obj);

    public abstract boolean containsValue(Object obj);

    public abstract Collection entries();

    public abstract boolean equals(Object obj);

    public abstract Collection get(Object obj);

    public abstract int hashCode();

    public abstract boolean isEmpty();

    public abstract Set keySet();

    public abstract Multiset keys();

    public abstract boolean put(Object obj, Object obj1);

    public abstract boolean putAll(Multimap multimap);

    public abstract boolean putAll(Object obj, Iterable iterable);

    public abstract boolean remove(Object obj, Object obj1);

    public abstract Collection removeAll(Object obj);

    public abstract Collection replaceValues(Object obj, Iterable iterable);

    public abstract int size();

    public abstract Collection values();
}
