// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableTable, ImmutableSet, ImmutableMap, Table, 
//            ImmutableCollection

final class EmptyImmutableTable extends ImmutableTable
{

    static final EmptyImmutableTable INSTANCE = new EmptyImmutableTable();
    private static final long serialVersionUID;

    private EmptyImmutableTable()
    {
    }

    public ImmutableSet cellSet()
    {
        return ImmutableSet.of();
    }

    public volatile Set cellSet()
    {
        return cellSet();
    }

    public ImmutableMap column(Object obj)
    {
        Preconditions.checkNotNull(obj);
        return ImmutableMap.of();
    }

    public volatile Map column(Object obj)
    {
        return column(obj);
    }

    public ImmutableSet columnKeySet()
    {
        return ImmutableSet.of();
    }

    public volatile Set columnKeySet()
    {
        return columnKeySet();
    }

    public ImmutableMap columnMap()
    {
        return ImmutableMap.of();
    }

    public volatile Map columnMap()
    {
        return columnMap();
    }

    public boolean contains(Object obj, Object obj1)
    {
        return false;
    }

    public boolean containsColumn(Object obj)
    {
        return false;
    }

    public boolean containsRow(Object obj)
    {
        return false;
    }

    public boolean containsValue(Object obj)
    {
        return false;
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof Table)
            return ((Table)obj).isEmpty();
        else
            return false;
    }

    public Object get(Object obj, Object obj1)
    {
        return null;
    }

    public int hashCode()
    {
        return 0;
    }

    public boolean isEmpty()
    {
        return true;
    }

    Object readResolve()
    {
        return INSTANCE;
    }

    public ImmutableMap row(Object obj)
    {
        Preconditions.checkNotNull(obj);
        return ImmutableMap.of();
    }

    public volatile Map row(Object obj)
    {
        return row(obj);
    }

    public ImmutableSet rowKeySet()
    {
        return ImmutableSet.of();
    }

    public volatile Set rowKeySet()
    {
        return rowKeySet();
    }

    public ImmutableMap rowMap()
    {
        return ImmutableMap.of();
    }

    public volatile Map rowMap()
    {
        return rowMap();
    }

    public int size()
    {
        return 0;
    }

    public String toString()
    {
        return "{}";
    }

    public ImmutableCollection values()
    {
        return ImmutableSet.of();
    }

    public volatile Collection values()
    {
        return values();
    }

}
