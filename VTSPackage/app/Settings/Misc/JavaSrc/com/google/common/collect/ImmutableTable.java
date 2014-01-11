// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Table, Tables, Iterables, ImmutableSet, 
//            RegularImmutableTable, EmptyImmutableTable, SingletonImmutableTable, ImmutableMap, 
//            Lists

public abstract class ImmutableTable
    implements Table
{
    public static final class Builder
    {

        private final List cells = Lists.newArrayList();
        private Comparator columnComparator;
        private Comparator rowComparator;

        public ImmutableTable build()
        {
            switch (cells.size())
            {
            case 1: // '\001'
                return new SingletonImmutableTable((Table.Cell)Iterables.getOnlyElement(cells));

            case 0: // '\0'
                return ImmutableTable.of();
            }
            return RegularImmutableTable.forCells(cells, rowComparator, columnComparator);
        }

        public Builder orderColumnsBy(Comparator comparator)
        {
            columnComparator = (Comparator)Preconditions.checkNotNull(comparator);
            return this;
        }

        public Builder orderRowsBy(Comparator comparator)
        {
            rowComparator = (Comparator)Preconditions.checkNotNull(comparator);
            return this;
        }

        public Builder put(Table.Cell cell)
        {
            if (cell instanceof Tables.ImmutableCell)
            {
                Preconditions.checkNotNull(cell.getRowKey());
                Preconditions.checkNotNull(cell.getColumnKey());
                Preconditions.checkNotNull(cell.getValue());
                cells.add(cell);
                return this;
            } else
            {
                put(cell.getRowKey(), cell.getColumnKey(), cell.getValue());
                return this;
            }
        }

        public Builder put(Object obj, Object obj1, Object obj2)
        {
            cells.add(ImmutableTable.cellOf(obj, obj1, obj2));
            return this;
        }

        public Builder putAll(Table table)
        {
            for (Iterator iterator = table.cellSet().iterator(); iterator.hasNext(); put((Table.Cell)iterator.next()));
            return this;
        }

    }



    public static final Builder builder()
    {
        return new Builder();
    }

    static Table.Cell cellOf(Object obj, Object obj1, Object obj2)
    {
        return Tables.immutableCell(Preconditions.checkNotNull(obj), Preconditions.checkNotNull(obj1), Preconditions.checkNotNull(obj2));
    }

    public static final ImmutableTable copyOf(Table table)
    {
        if (table instanceof ImmutableTable)
            return (ImmutableTable)table;
        switch (table.size())
        {
        case 1: // '\001'
            Table.Cell cell1 = (Table.Cell)Iterables.getOnlyElement(table.cellSet());
            return of(cell1.getRowKey(), cell1.getColumnKey(), cell1.getValue());

        case 0: // '\0'
            return of();
        }
        ImmutableSet.Builder builder1 = ImmutableSet.builder();
        Table.Cell cell;
        for (Iterator iterator = table.cellSet().iterator(); iterator.hasNext(); builder1.add(cellOf(cell.getRowKey(), cell.getColumnKey(), cell.getValue())))
            cell = (Table.Cell)iterator.next();

        return RegularImmutableTable.forCells(builder1.build());
    }

    public static final ImmutableTable of()
    {
        return EmptyImmutableTable.INSTANCE;
    }

    public static final ImmutableTable of(Object obj, Object obj1, Object obj2)
    {
        return new SingletonImmutableTable(obj, obj1, obj2);
    }

    public abstract ImmutableSet cellSet();

    public volatile Set cellSet()
    {
        return cellSet();
    }

    public final void clear()
    {
        throw new UnsupportedOperationException();
    }

    public abstract ImmutableMap column(Object obj);

    public volatile Map column(Object obj)
    {
        return column(obj);
    }

    public abstract ImmutableSet columnKeySet();

    public volatile Set columnKeySet()
    {
        return columnKeySet();
    }

    public abstract ImmutableMap columnMap();

    public volatile Map columnMap()
    {
        return columnMap();
    }

    public boolean equals(Object obj)
    {
        if (obj == this)
            return true;
        if (obj instanceof Table)
        {
            Table table = (Table)obj;
            return cellSet().equals(table.cellSet());
        } else
        {
            return false;
        }
    }

    public int hashCode()
    {
        return cellSet().hashCode();
    }

    public final Object put(Object obj, Object obj1, Object obj2)
    {
        throw new UnsupportedOperationException();
    }

    public final void putAll(Table table)
    {
        throw new UnsupportedOperationException();
    }

    public final Object remove(Object obj, Object obj1)
    {
        throw new UnsupportedOperationException();
    }

    public abstract ImmutableMap row(Object obj);

    public volatile Map row(Object obj)
    {
        return row(obj);
    }

    public abstract ImmutableSet rowKeySet();

    public volatile Set rowKeySet()
    {
        return rowKeySet();
    }

    public abstract ImmutableMap rowMap();

    public volatile Map rowMap()
    {
        return rowMap();
    }

    public String toString()
    {
        return rowMap().toString();
    }
}
