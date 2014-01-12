// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Table, ImmutableList, ImmutableMap, ImmutableSet, 
//            AbstractIndexedListIterator, AbstractMapEntry, Maps

public final class ArrayTable
    implements Table, Serializable
{
    private class CellSet extends AbstractSet
    {

        final ArrayTable this$0;

        public boolean contains(Object obj)
        {
            boolean flag = obj instanceof Table.Cell;
            boolean flag1 = false;
            if (flag)
            {
                Table.Cell cell = (Table.Cell)obj;
                Integer integer = (Integer)rowKeyToIndex.get(cell.getRowKey());
                Integer integer1 = (Integer)columnKeyToIndex.get(cell.getColumnKey());
                flag1 = false;
                if (integer != null)
                {
                    flag1 = false;
                    if (integer1 != null)
                    {
                        boolean flag2 = Objects.equal(array[integer.intValue()][integer1.intValue()], cell.getValue());
                        flag1 = false;
                        if (flag2)
                            flag1 = true;
                    }
                }
            }
            return flag1;
        }

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final CellSet this$1;

                protected Table.Cell get(int i)
                {
                    return i. new Tables.AbstractCell() {

                        final int columnIndex;
                        final int rowIndex;
                        final CellSet._cls1 this$2;
                        final int val$index;

                        public Object getColumnKey()
                        {
                            return columnList.get(columnIndex);
                        }

                        public Object getRowKey()
                        {
                            return rowList.get(rowIndex);
                        }

                        public Object getValue()
                        {
                            return array[rowIndex][columnIndex];
                        }

            
            {
                this$2 = final__pcls1;
                index = I.this;
                super();
                rowIndex = index / columnList.size();
                columnIndex = index % columnList.size();
            }
                    }
;
                }

                protected volatile Object get(int i)
                {
                    return get(i);
                }

            
            {
                this$1 = CellSet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return ArrayTable.this.size();
        }

        private CellSet()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }

    private class Column extends AbstractMap
    {

        final int columnIndex;
        ColumnEntrySet entrySet;
        final ArrayTable this$0;

        public boolean containsKey(Object obj)
        {
            return rowKeyToIndex.containsKey(obj);
        }

        public Set entrySet()
        {
            ColumnEntrySet columnentryset = entrySet;
            if (columnentryset == null)
            {
                columnentryset = new ColumnEntrySet(columnIndex);
                entrySet = columnentryset;
            }
            return columnentryset;
        }

        public Object get(Object obj)
        {
            Integer integer = (Integer)rowKeyToIndex.get(obj);
            return getIndexed(integer, Integer.valueOf(columnIndex));
        }

        public Set keySet()
        {
            return rowKeySet();
        }

        public Object put(Object obj, Object obj1)
        {
            Preconditions.checkNotNull(obj);
            Integer integer = (Integer)rowKeyToIndex.get(obj);
            boolean flag;
            if (integer != null)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[2];
            aobj[0] = obj;
            aobj[1] = rowList;
            Preconditions.checkArgument(flag, "Row %s not in %s", aobj);
            return set(integer.intValue(), columnIndex, obj1);
        }

        Column(int i)
        {
            this$0 = ArrayTable.this;
            super();
            columnIndex = i;
        }
    }

    private class ColumnEntrySet extends AbstractSet
    {

        final int columnIndex;
        final ArrayTable this$0;

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final ColumnEntrySet this$1;

                protected volatile Object get(int i)
                {
                    return get(i);
                }

                protected java.util.Map.Entry get(int i)
                {
                    return i. new AbstractMapEntry() {

                        final ColumnEntrySet._cls1 this$2;
                        final int val$rowIndex;

                        public Object getKey()
                        {
                            return rowList.get(rowIndex);
                        }

                        public Object getValue()
                        {
                            return array[rowIndex][columnIndex];
                        }

                        public Object setValue(Object obj)
                        {
                            return set(rowIndex, columnIndex, obj);
                        }

            
            {
                this$2 = final__pcls1;
                rowIndex = I.this;
                super();
            }
                    }
;
                }

            
            {
                this$1 = ColumnEntrySet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return rowList.size();
        }

        ColumnEntrySet(int i)
        {
            this$0 = ArrayTable.this;
            super();
            columnIndex = i;
        }
    }

    private class ColumnMap extends AbstractMap
    {

        transient ColumnMapEntrySet entrySet;
        final ArrayTable this$0;

        public boolean containsKey(Object obj)
        {
            return containsColumn(obj);
        }

        public Set entrySet()
        {
            ColumnMapEntrySet columnmapentryset = entrySet;
            if (columnmapentryset == null)
            {
                columnmapentryset = new ColumnMapEntrySet();
                entrySet = columnmapentryset;
            }
            return columnmapentryset;
        }

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Map get(Object obj)
        {
            Integer integer = (Integer)columnKeyToIndex.get(obj);
            if (integer == null)
                return null;
            else
                return new Column(integer.intValue());
        }

        public Set keySet()
        {
            return columnKeySet();
        }

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Map remove(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        private ColumnMap()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }

    private class ColumnMapEntrySet extends AbstractSet
    {

        final ArrayTable this$0;

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final ColumnMapEntrySet this$1;

                protected volatile Object get(int i)
                {
                    return get(i);
                }

                protected java.util.Map.Entry get(int i)
                {
                    return Maps.immutableEntry(columnList.get(i), new Column(i));
                }

            
            {
                this$1 = ColumnMapEntrySet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return columnList.size();
        }

        private ColumnMapEntrySet()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }

    private class Row extends AbstractMap
    {

        RowEntrySet entrySet;
        final int rowIndex;
        final ArrayTable this$0;

        public boolean containsKey(Object obj)
        {
            return containsColumn(obj);
        }

        public Set entrySet()
        {
            RowEntrySet rowentryset = entrySet;
            if (rowentryset == null)
            {
                rowentryset = new RowEntrySet(rowIndex);
                entrySet = rowentryset;
            }
            return rowentryset;
        }

        public Object get(Object obj)
        {
            Integer integer = (Integer)columnKeyToIndex.get(obj);
            return getIndexed(Integer.valueOf(rowIndex), integer);
        }

        public Set keySet()
        {
            return columnKeySet();
        }

        public Object put(Object obj, Object obj1)
        {
            Preconditions.checkNotNull(obj);
            Integer integer = (Integer)columnKeyToIndex.get(obj);
            boolean flag;
            if (integer != null)
                flag = true;
            else
                flag = false;
            Object aobj[] = new Object[2];
            aobj[0] = obj;
            aobj[1] = columnList;
            Preconditions.checkArgument(flag, "Column %s not in %s", aobj);
            return set(rowIndex, integer.intValue(), obj1);
        }

        Row(int i)
        {
            this$0 = ArrayTable.this;
            super();
            rowIndex = i;
        }
    }

    private class RowEntrySet extends AbstractSet
    {

        final int rowIndex;
        final ArrayTable this$0;

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final RowEntrySet this$1;

                protected volatile Object get(int i)
                {
                    return get(i);
                }

                protected java.util.Map.Entry get(int i)
                {
                    return i. new AbstractMapEntry() {

                        final RowEntrySet._cls1 this$2;
                        final int val$columnIndex;

                        public Object getKey()
                        {
                            return columnList.get(columnIndex);
                        }

                        public Object getValue()
                        {
                            return array[rowIndex][columnIndex];
                        }

                        public Object setValue(Object obj)
                        {
                            return set(rowIndex, columnIndex, obj);
                        }

            
            {
                this$2 = final__pcls1;
                columnIndex = I.this;
                super();
            }
                    }
;
                }

            
            {
                this$1 = RowEntrySet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return columnList.size();
        }

        RowEntrySet(int i)
        {
            this$0 = ArrayTable.this;
            super();
            rowIndex = i;
        }
    }

    private class RowMap extends AbstractMap
    {

        transient RowMapEntrySet entrySet;
        final ArrayTable this$0;

        public boolean containsKey(Object obj)
        {
            return containsRow(obj);
        }

        public Set entrySet()
        {
            RowMapEntrySet rowmapentryset = entrySet;
            if (rowmapentryset == null)
            {
                rowmapentryset = new RowMapEntrySet();
                entrySet = rowmapentryset;
            }
            return rowmapentryset;
        }

        public volatile Object get(Object obj)
        {
            return get(obj);
        }

        public Map get(Object obj)
        {
            Integer integer = (Integer)rowKeyToIndex.get(obj);
            if (integer == null)
                return null;
            else
                return new Row(integer.intValue());
        }

        public Set keySet()
        {
            return rowKeySet();
        }

        public volatile Object remove(Object obj)
        {
            return remove(obj);
        }

        public Map remove(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        private RowMap()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }

    private class RowMapEntrySet extends AbstractSet
    {

        final ArrayTable this$0;

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final RowMapEntrySet this$1;

                protected volatile Object get(int i)
                {
                    return get(i);
                }

                protected java.util.Map.Entry get(int i)
                {
                    return Maps.immutableEntry(rowList.get(i), new Row(i));
                }

            
            {
                this$1 = RowMapEntrySet.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return rowList.size();
        }

        private RowMapEntrySet()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }

    private class Values extends AbstractCollection
    {

        final ArrayTable this$0;

        public boolean contains(Object obj)
        {
            return containsValue(obj);
        }

        public Iterator iterator()
        {
            return new AbstractIndexedListIterator(size()) {

                final Values this$1;

                protected Object get(int i)
                {
                    int j = i / columnList.size();
                    int k = i % columnList.size();
                    return array[j][k];
                }

            
            {
                this$1 = Values.this;
                super(i);
            }
            }
;
        }

        public int size()
        {
            return ArrayTable.this.size();
        }

        private Values()
        {
            this$0 = ArrayTable.this;
            super();
        }

    }


    private static final long serialVersionUID;
    private final Object array[][];
    private transient CellSet cellSet;
    private final ImmutableMap columnKeyToIndex;
    private final ImmutableList columnList;
    private transient ColumnMap columnMap;
    private final ImmutableMap rowKeyToIndex;
    private final ImmutableList rowList;
    private transient RowMap rowMap;
    private transient Collection values;

    private ArrayTable(ArrayTable arraytable)
    {
        rowList = arraytable.rowList;
        columnList = arraytable.columnList;
        rowKeyToIndex = arraytable.rowKeyToIndex;
        columnKeyToIndex = arraytable.columnKeyToIndex;
        Object aobj[][] = (Object[][])(Object[][])Array.newInstance(java/lang/Object, new int[] {
            rowList.size(), columnList.size()
        });
        array = aobj;
        for (int i = 0; i < rowList.size(); i++)
            System.arraycopy(((Object) (arraytable.array[i])), 0, ((Object) (aobj[i])), 0, arraytable.array[i].length);

    }

    private ArrayTable(Table table)
    {
        this(((Iterable) (table.rowKeySet())), ((Iterable) (table.columnKeySet())));
        putAll(table);
    }

    private ArrayTable(Iterable iterable, Iterable iterable1)
    {
        boolean flag = true;
        super();
        rowList = ImmutableList.copyOf(iterable);
        columnList = ImmutableList.copyOf(iterable1);
        boolean flag1;
        if (!rowList.isEmpty())
            flag1 = flag;
        else
            flag1 = false;
        Preconditions.checkArgument(flag1);
        if (columnList.isEmpty())
            flag = false;
        Preconditions.checkArgument(flag);
        ImmutableMap.Builder builder = ImmutableMap.builder();
        for (int i = 0; i < rowList.size(); i++)
            builder.put(rowList.get(i), Integer.valueOf(i));

        rowKeyToIndex = builder.build();
        ImmutableMap.Builder builder1 = ImmutableMap.builder();
        for (int j = 0; j < columnList.size(); j++)
            builder1.put(columnList.get(j), Integer.valueOf(j));

        columnKeyToIndex = builder1.build();
        array = (Object[][])(Object[][])Array.newInstance(java/lang/Object, new int[] {
            rowList.size(), columnList.size()
        });
    }

    public static ArrayTable create(ArrayTable arraytable)
    {
        return new ArrayTable(arraytable);
    }

    public static ArrayTable create(Table table)
    {
        return new ArrayTable(table);
    }

    public static ArrayTable create(Iterable iterable, Iterable iterable1)
    {
        return new ArrayTable(iterable, iterable1);
    }

    private Object getIndexed(Integer integer, Integer integer1)
    {
        if (integer != null && integer1 != null)
            return array[integer.intValue()][integer1.intValue()];
        else
            return null;
    }

    public Object at(int i, int j)
    {
        return array[i][j];
    }

    public Set cellSet()
    {
        CellSet cellset = cellSet;
        if (cellset == null)
        {
            cellset = new CellSet();
            cellSet = cellset;
        }
        return cellset;
    }

    public void clear()
    {
        throw new UnsupportedOperationException();
    }

    public Map column(Object obj)
    {
        Preconditions.checkNotNull(obj);
        Integer integer = (Integer)columnKeyToIndex.get(obj);
        if (integer == null)
            return ImmutableMap.of();
        else
            return new Column(integer.intValue());
    }

    public ImmutableList columnKeyList()
    {
        return columnList;
    }

    public ImmutableSet columnKeySet()
    {
        return columnKeyToIndex.keySet();
    }

    public volatile Set columnKeySet()
    {
        return columnKeySet();
    }

    public Map columnMap()
    {
        ColumnMap columnmap = columnMap;
        if (columnmap == null)
        {
            columnmap = new ColumnMap();
            columnMap = columnmap;
        }
        return columnmap;
    }

    public boolean contains(Object obj, Object obj1)
    {
        return containsRow(obj) && containsColumn(obj1);
    }

    public boolean containsColumn(Object obj)
    {
        return columnKeyToIndex.containsKey(obj);
    }

    public boolean containsRow(Object obj)
    {
        return rowKeyToIndex.containsKey(obj);
    }

    public boolean containsValue(Object obj)
    {
        Object aobj[][] = array;
        int i = aobj.length;
        for (int j = 0; j < i; j++)
        {
            Object aobj1[] = aobj[j];
            int k = aobj1.length;
            for (int l = 0; l < k; l++)
                if (Objects.equal(obj, aobj1[l]))
                    return true;

        }

        return false;
    }

    public boolean equals(Object obj)
    {
        if (obj instanceof Table)
        {
            Table table = (Table)obj;
            return cellSet().equals(table.cellSet());
        } else
        {
            return false;
        }
    }

    public Object erase(Object obj, Object obj1)
    {
        Integer integer = (Integer)rowKeyToIndex.get(obj);
        Integer integer1 = (Integer)columnKeyToIndex.get(obj1);
        if (integer != null && integer1 != null)
            return set(integer.intValue(), integer1.intValue(), null);
        else
            return null;
    }

    public void eraseAll()
    {
        Object aobj[][] = array;
        int i = aobj.length;
        for (int j = 0; j < i; j++)
            Arrays.fill(aobj[j], null);

    }

    public Object get(Object obj, Object obj1)
    {
        return getIndexed((Integer)rowKeyToIndex.get(obj), (Integer)columnKeyToIndex.get(obj1));
    }

    public int hashCode()
    {
        return cellSet().hashCode();
    }

    public boolean isEmpty()
    {
        return false;
    }

    public Object put(Object obj, Object obj1, Object obj2)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        Integer integer = (Integer)rowKeyToIndex.get(obj);
        boolean flag;
        if (integer != null)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = obj;
        aobj[1] = rowList;
        Preconditions.checkArgument(flag, "Row %s not in %s", aobj);
        Integer integer1 = (Integer)columnKeyToIndex.get(obj1);
        boolean flag1;
        if (integer1 != null)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = obj1;
        aobj1[1] = columnList;
        Preconditions.checkArgument(flag1, "Column %s not in %s", aobj1);
        return set(integer.intValue(), integer1.intValue(), obj2);
    }

    public void putAll(Table table)
    {
        Table.Cell cell;
        for (Iterator iterator = table.cellSet().iterator(); iterator.hasNext(); put(cell.getRowKey(), cell.getColumnKey(), cell.getValue()))
            cell = (Table.Cell)iterator.next();

    }

    public Object remove(Object obj, Object obj1)
    {
        throw new UnsupportedOperationException();
    }

    public Map row(Object obj)
    {
        Preconditions.checkNotNull(obj);
        Integer integer = (Integer)rowKeyToIndex.get(obj);
        if (integer == null)
            return ImmutableMap.of();
        else
            return new Row(integer.intValue());
    }

    public ImmutableList rowKeyList()
    {
        return rowList;
    }

    public ImmutableSet rowKeySet()
    {
        return rowKeyToIndex.keySet();
    }

    public volatile Set rowKeySet()
    {
        return rowKeySet();
    }

    public Map rowMap()
    {
        RowMap rowmap = rowMap;
        if (rowmap == null)
        {
            rowmap = new RowMap();
            rowMap = rowmap;
        }
        return rowmap;
    }

    public Object set(int i, int j, Object obj)
    {
        Object obj1 = array[i][j];
        array[i][j] = obj;
        return obj1;
    }

    public int size()
    {
        return rowList.size() * columnList.size();
    }

    public Object[][] toArray(Class class1)
    {
        int ai[] = new int[2];
        ai[0] = rowList.size();
        ai[1] = columnList.size();
        Object aobj[][] = (Object[][])(Object[][])Array.newInstance(class1, ai);
        for (int i = 0; i < rowList.size(); i++)
            System.arraycopy(((Object) (array[i])), 0, ((Object) (aobj[i])), 0, array[i].length);

        return aobj;
    }

    public String toString()
    {
        return rowMap().toString();
    }

    public Collection values()
    {
        Object obj = values;
        if (obj == null)
        {
            obj = new Values();
            values = ((Collection) (obj));
        }
        return ((Collection) (obj));
    }






}
