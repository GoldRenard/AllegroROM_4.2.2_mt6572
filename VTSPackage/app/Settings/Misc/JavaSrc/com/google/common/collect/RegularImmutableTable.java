// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.lang.reflect.Array;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableTable, ImmutableSet, Lists, ImmutableCollection, 
//            Iterables, ImmutableList, ImmutableBiMap, ImmutableMap, 
//            Maps

abstract class RegularImmutableTable extends ImmutableTable
{
    static final class DenseImmutableTable extends RegularImmutableTable
    {

        private final ImmutableBiMap columnKeyToIndex;
        private volatile transient ImmutableMap columnMap;
        private final ImmutableBiMap rowKeyToIndex;
        private volatile transient ImmutableMap rowMap;
        private final Object values[][];

        private ImmutableMap makeColumnMap()
        {
            ImmutableMap.Builder builder = ImmutableMap.builder();
            for (int i = 0; i < columnKeyToIndex.size(); i++)
            {
                ImmutableMap.Builder builder1 = ImmutableMap.builder();
                for (int j = 0; j < rowKeyToIndex.size(); j++)
                {
                    Object obj = values[j][i];
                    if (obj != null)
                        builder1.put(rowKeyToIndex.inverse().get(Integer.valueOf(j)), obj);
                }

                builder.put(columnKeyToIndex.inverse().get(Integer.valueOf(i)), builder1.build());
            }

            return builder.build();
        }

        private static ImmutableBiMap makeIndex(ImmutableSet immutableset)
        {
            ImmutableBiMap.Builder builder = ImmutableBiMap.builder();
            int i = 0;
            for (Iterator iterator = immutableset.iterator(); iterator.hasNext();)
            {
                builder.put(iterator.next(), Integer.valueOf(i));
                i++;
            }

            return builder.build();
        }

        private ImmutableMap makeRowMap()
        {
            ImmutableMap.Builder builder = ImmutableMap.builder();
            for (int i = 0; i < values.length; i++)
            {
                Object aobj[] = values[i];
                ImmutableMap.Builder builder1 = ImmutableMap.builder();
                for (int j = 0; j < aobj.length; j++)
                {
                    Object obj = aobj[j];
                    if (obj != null)
                        builder1.put(columnKeyToIndex.inverse().get(Integer.valueOf(j)), obj);
                }

                builder.put(rowKeyToIndex.inverse().get(Integer.valueOf(i)), builder1.build());
            }

            return builder.build();
        }

        public volatile Set cellSet()
        {
            return cellSet();
        }

        public ImmutableMap column(Object obj)
        {
            Preconditions.checkNotNull(obj);
            Integer integer = (Integer)columnKeyToIndex.get(obj);
            if (integer == null)
                return ImmutableMap.of();
            int i = integer.intValue();
            ImmutableMap.Builder builder = ImmutableMap.builder();
            for (int j = 0; j < values.length; j++)
            {
                Object obj1 = values[j][i];
                if (obj1 != null)
                    builder.put(rowKeyToIndex.inverse().get(Integer.valueOf(j)), obj1);
            }

            return builder.build();
        }

        public volatile Map column(Object obj)
        {
            return column(obj);
        }

        public ImmutableSet columnKeySet()
        {
            return columnKeyToIndex.keySet();
        }

        public volatile Set columnKeySet()
        {
            return columnKeySet();
        }

        public ImmutableMap columnMap()
        {
            ImmutableMap immutablemap = columnMap;
            if (immutablemap == null)
            {
                immutablemap = makeColumnMap();
                columnMap = immutablemap;
            }
            return immutablemap;
        }

        public volatile Map columnMap()
        {
            return columnMap();
        }

        public boolean contains(Object obj, Object obj1)
        {
            return get(obj, obj1) != null;
        }

        public boolean containsColumn(Object obj)
        {
            return columnKeyToIndex.containsKey(obj);
        }

        public boolean containsRow(Object obj)
        {
            return rowKeyToIndex.containsKey(obj);
        }

        public Object get(Object obj, Object obj1)
        {
            Integer integer = (Integer)rowKeyToIndex.get(obj);
            Integer integer1 = (Integer)columnKeyToIndex.get(obj1);
            if (integer != null && integer1 != null)
                return values[integer.intValue()][integer1.intValue()];
            else
                return null;
        }

        public ImmutableMap row(Object obj)
        {
            Preconditions.checkNotNull(obj);
            Integer integer = (Integer)rowKeyToIndex.get(obj);
            if (integer == null)
                return ImmutableMap.of();
            ImmutableMap.Builder builder = ImmutableMap.builder();
            Object aobj[] = values[integer.intValue()];
            for (int i = 0; i < aobj.length; i++)
            {
                Object obj1 = aobj[i];
                if (obj1 != null)
                    builder.put(columnKeyToIndex.inverse().get(Integer.valueOf(i)), obj1);
            }

            return builder.build();
        }

        public volatile Map row(Object obj)
        {
            return row(obj);
        }

        public ImmutableSet rowKeySet()
        {
            return rowKeyToIndex.keySet();
        }

        public volatile Set rowKeySet()
        {
            return rowKeySet();
        }

        public ImmutableMap rowMap()
        {
            ImmutableMap immutablemap = rowMap;
            if (immutablemap == null)
            {
                immutablemap = makeRowMap();
                rowMap = immutablemap;
            }
            return immutablemap;
        }

        public volatile Map rowMap()
        {
            return rowMap();
        }

        public volatile Collection values()
        {
            return values();
        }

        DenseImmutableTable(ImmutableSet immutableset, ImmutableSet immutableset1, ImmutableSet immutableset2)
        {
            super(immutableset, null);
            values = (Object[][])(Object[][])Array.newInstance(java/lang/Object, new int[] {
                immutableset1.size(), immutableset2.size()
            });
            rowKeyToIndex = makeIndex(immutableset1);
            columnKeyToIndex = makeIndex(immutableset2);
            for (Iterator iterator = immutableset.iterator(); iterator.hasNext();)
            {
                Table.Cell cell = (Table.Cell)iterator.next();
                Object obj = cell.getRowKey();
                Object obj1 = cell.getColumnKey();
                int i = ((Integer)rowKeyToIndex.get(obj)).intValue();
                int j = ((Integer)columnKeyToIndex.get(obj1)).intValue();
                boolean flag;
                if (values[i][j] == null)
                    flag = true;
                else
                    flag = false;
                Preconditions.checkArgument(flag, "duplicate key: (%s, %s)", new Object[] {
                    obj, obj1
                });
                values[i][j] = cell.getValue();
            }

        }
    }

    static final class SparseImmutableTable extends RegularImmutableTable
    {

        private final ImmutableMap columnMap;
        private final ImmutableMap rowMap;

        private static final ImmutableMap buildIndex(Map map)
        {
            return ImmutableMap.copyOf(Maps.transformValues(map, new Function() {

                public volatile Object apply(Object obj)
                {
                    return apply((ImmutableMap.Builder)obj);
                }

                public Map apply(ImmutableMap.Builder builder)
                {
                    return builder.build();
                }

            }
));
        }

        private static final Map makeIndexBuilder(ImmutableSet immutableset)
        {
            java.util.LinkedHashMap linkedhashmap = Maps.newLinkedHashMap();
            for (Iterator iterator = immutableset.iterator(); iterator.hasNext(); linkedhashmap.put(iterator.next(), ImmutableMap.builder()));
            return linkedhashmap;
        }

        public volatile Set cellSet()
        {
            return cellSet();
        }

        public ImmutableMap column(Object obj)
        {
            Preconditions.checkNotNull(obj);
            return (ImmutableMap)Objects.firstNonNull((ImmutableMap)columnMap.get(obj), ImmutableMap.of());
        }

        public volatile Map column(Object obj)
        {
            return column(obj);
        }

        public ImmutableSet columnKeySet()
        {
            return columnMap.keySet();
        }

        public volatile Set columnKeySet()
        {
            return columnKeySet();
        }

        public ImmutableMap columnMap()
        {
            return columnMap;
        }

        public volatile Map columnMap()
        {
            return columnMap();
        }

        public boolean contains(Object obj, Object obj1)
        {
            Map map = (Map)rowMap.get(obj);
            return map != null && map.containsKey(obj1);
        }

        public boolean containsColumn(Object obj)
        {
            return columnMap.containsKey(obj);
        }

        public boolean containsRow(Object obj)
        {
            return rowMap.containsKey(obj);
        }

        public Object get(Object obj, Object obj1)
        {
            Map map = (Map)rowMap.get(obj);
            if (map == null)
                return null;
            else
                return map.get(obj1);
        }

        public ImmutableMap row(Object obj)
        {
            Preconditions.checkNotNull(obj);
            return (ImmutableMap)Objects.firstNonNull((ImmutableMap)rowMap.get(obj), ImmutableMap.of());
        }

        public volatile Map row(Object obj)
        {
            return row(obj);
        }

        public ImmutableSet rowKeySet()
        {
            return rowMap.keySet();
        }

        public volatile Set rowKeySet()
        {
            return rowKeySet();
        }

        public ImmutableMap rowMap()
        {
            return rowMap;
        }

        public volatile Map rowMap()
        {
            return rowMap();
        }

        public volatile Collection values()
        {
            return values();
        }

        SparseImmutableTable(ImmutableSet immutableset, ImmutableSet immutableset1, ImmutableSet immutableset2)
        {
            super(immutableset, null);
            Map map = makeIndexBuilder(immutableset1);
            Map map1 = makeIndexBuilder(immutableset2);
            Object obj;
            Object obj1;
            Object obj2;
            for (Iterator iterator = immutableset.iterator(); iterator.hasNext(); ((ImmutableMap.Builder)map1.get(obj1)).put(obj, obj2))
            {
                Table.Cell cell = (Table.Cell)iterator.next();
                obj = cell.getRowKey();
                obj1 = cell.getColumnKey();
                obj2 = cell.getValue();
                ((ImmutableMap.Builder)map.get(obj)).put(obj1, obj2);
            }

            rowMap = buildIndex(map);
            columnMap = buildIndex(map1);
        }
    }


    private static final Function GET_VALUE_FUNCTION = new Function() {

        public Object apply(Table.Cell cell)
        {
            return cell.getValue();
        }

        public volatile Object apply(Object obj)
        {
            return apply((Table.Cell)obj);
        }

    }
;
    private final ImmutableSet cellSet;
    private volatile transient ImmutableList valueList;

    private RegularImmutableTable(ImmutableSet immutableset)
    {
        cellSet = immutableset;
    }


    static final RegularImmutableTable forCells(Iterable iterable)
    {
        return forCellsInternal(iterable, null, null);
    }

    static final RegularImmutableTable forCells(List list, Comparator comparator, Comparator comparator1)
    {
        Preconditions.checkNotNull(list);
        if (comparator != null || comparator1 != null)
            Collections.sort(list, new Comparator(comparator, comparator1) {

                final Comparator val$columnComparator;
                final Comparator val$rowComparator;

                public int compare(Table.Cell cell, Table.Cell cell1)
                {
                    int i;
                    if (rowComparator == null)
                        i = 0;
                    else
                        i = rowComparator.compare(cell.getRowKey(), cell1.getRowKey());
                    if (i != 0)
                        return i;
                    Comparator comparator2 = columnComparator;
                    int j = 0;
                    if (comparator2 != null)
                        j = columnComparator.compare(cell.getColumnKey(), cell1.getColumnKey());
                    return j;
                }

                public volatile int compare(Object obj, Object obj1)
                {
                    return compare((Table.Cell)obj, (Table.Cell)obj1);
                }

            
            {
                rowComparator = comparator;
                columnComparator = comparator1;
                super();
            }
            }
);
        return forCellsInternal(list, comparator, comparator1);
    }

    private static final RegularImmutableTable forCellsInternal(Iterable iterable, Comparator comparator, Comparator comparator1)
    {
        ImmutableSet.Builder builder = ImmutableSet.builder();
        ImmutableSet.Builder builder1 = ImmutableSet.builder();
        ImmutableSet.Builder builder2 = ImmutableSet.builder();
        Table.Cell cell;
        for (Iterator iterator = iterable.iterator(); iterator.hasNext(); builder2.add(cell.getColumnKey()))
        {
            cell = (Table.Cell)iterator.next();
            builder.add(cell);
            builder1.add(cell.getRowKey());
        }

        ImmutableSet immutableset = builder.build();
        ImmutableSet immutableset1 = builder1.build();
        if (comparator != null)
        {
            java.util.ArrayList arraylist1 = Lists.newArrayList(immutableset1);
            Collections.sort(arraylist1, comparator);
            immutableset1 = ImmutableSet.copyOf(arraylist1);
        }
        ImmutableSet immutableset2 = builder2.build();
        if (comparator1 != null)
        {
            java.util.ArrayList arraylist = Lists.newArrayList(immutableset2);
            Collections.sort(arraylist, comparator1);
            immutableset2 = ImmutableSet.copyOf(arraylist);
        }
        if (immutableset.size() > (immutableset1.size() * immutableset2.size()) / 2)
            return new DenseImmutableTable(immutableset, immutableset1, immutableset2);
        else
            return new SparseImmutableTable(immutableset, immutableset1, immutableset2);
    }

    private Function getValueFunction()
    {
        return GET_VALUE_FUNCTION;
    }

    public final ImmutableSet cellSet()
    {
        return cellSet;
    }

    public volatile Set cellSet()
    {
        return cellSet();
    }

    public final boolean containsValue(Object obj)
    {
        return values().contains(obj);
    }

    public final boolean isEmpty()
    {
        return false;
    }

    public final int size()
    {
        return cellSet().size();
    }

    public final ImmutableCollection values()
    {
        ImmutableList immutablelist = valueList;
        if (immutablelist == null)
        {
            immutablelist = ImmutableList.copyOf(Iterables.transform(cellSet(), getValueFunction()));
            valueList = immutablelist;
        }
        return immutablelist;
    }

    public volatile Collection values()
    {
        return values();
    }

}
