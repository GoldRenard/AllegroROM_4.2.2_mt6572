// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableTable, Tables, ImmutableSet, ImmutableMap, 
//            Table, ImmutableCollection

final class SingletonImmutableTable extends ImmutableTable
{

    private final Object singleColumnKey;
    private final Object singleRowKey;
    private final Object singleValue;

    SingletonImmutableTable(Table.Cell cell)
    {
        this(cell.getRowKey(), cell.getColumnKey(), cell.getValue());
    }

    SingletonImmutableTable(Object obj, Object obj1, Object obj2)
    {
        singleRowKey = Preconditions.checkNotNull(obj);
        singleColumnKey = Preconditions.checkNotNull(obj1);
        singleValue = Preconditions.checkNotNull(obj2);
    }

    public ImmutableSet cellSet()
    {
        return ImmutableSet.of(Tables.immutableCell(singleRowKey, singleColumnKey, singleValue));
    }

    public volatile Set cellSet()
    {
        return cellSet();
    }

    public ImmutableMap column(Object obj)
    {
        Preconditions.checkNotNull(obj);
        if (containsColumn(obj))
            return ImmutableMap.of(singleRowKey, singleValue);
        else
            return ImmutableMap.of();
    }

    public volatile Map column(Object obj)
    {
        return column(obj);
    }

    public ImmutableSet columnKeySet()
    {
        return ImmutableSet.of(singleColumnKey);
    }

    public volatile Set columnKeySet()
    {
        return columnKeySet();
    }

    public ImmutableMap columnMap()
    {
        return ImmutableMap.of(singleColumnKey, ImmutableMap.of(singleRowKey, singleValue));
    }

    public volatile Map columnMap()
    {
        return columnMap();
    }

    public boolean contains(Object obj, Object obj1)
    {
        return containsRow(obj) && containsColumn(obj1);
    }

    public boolean containsColumn(Object obj)
    {
        return Objects.equal(singleColumnKey, obj);
    }

    public boolean containsRow(Object obj)
    {
        return Objects.equal(singleRowKey, obj);
    }

    public boolean containsValue(Object obj)
    {
        return Objects.equal(singleValue, obj);
    }

    public boolean equals(Object obj)
    {
label0:
        {
            if (obj != this)
            {
                if (!(obj instanceof Table))
                    break label0;
                Table table = (Table)obj;
                if (table.size() != 1)
                    break label0;
                Table.Cell cell = (Table.Cell)table.cellSet().iterator().next();
                if (!Objects.equal(singleRowKey, cell.getRowKey()) || !Objects.equal(singleColumnKey, cell.getColumnKey()) || !Objects.equal(singleValue, cell.getValue()))
                    return false;
            }
            return true;
        }
        return false;
    }

    public Object get(Object obj, Object obj1)
    {
        if (contains(obj, obj1))
            return singleValue;
        else
            return null;
    }

    public int hashCode()
    {
        Object aobj[] = new Object[3];
        aobj[0] = singleRowKey;
        aobj[1] = singleColumnKey;
        aobj[2] = singleValue;
        return Objects.hashCode(aobj);
    }

    public boolean isEmpty()
    {
        return false;
    }

    public ImmutableMap row(Object obj)
    {
        Preconditions.checkNotNull(obj);
        if (containsRow(obj))
            return ImmutableMap.of(singleColumnKey, singleValue);
        else
            return ImmutableMap.of();
    }

    public volatile Map row(Object obj)
    {
        return row(obj);
    }

    public ImmutableSet rowKeySet()
    {
        return ImmutableSet.of(singleRowKey);
    }

    public volatile Set rowKeySet()
    {
        return rowKeySet();
    }

    public ImmutableMap rowMap()
    {
        return ImmutableMap.of(singleRowKey, ImmutableMap.of(singleColumnKey, singleValue));
    }

    public volatile Map rowMap()
    {
        return rowMap();
    }

    public int size()
    {
        return 1;
    }

    public String toString()
    {
        return (new StringBuilder()).append('{').append(singleRowKey).append("={").append(singleColumnKey).append('=').append(singleValue).append("}}").toString();
    }

    public ImmutableCollection values()
    {
        return ImmutableSet.of(singleValue);
    }

    public volatile Collection values()
    {
        return values();
    }
}
