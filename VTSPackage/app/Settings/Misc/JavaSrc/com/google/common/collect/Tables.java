// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            StandardTable, Table, RowSortedTable, Maps, 
//            Collections2, Sets, ForwardingTable

public final class Tables
{
    static abstract class AbstractCell
        implements Table.Cell
    {

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof Table.Cell))
                        break label0;
                    Table.Cell cell = (Table.Cell)obj;
                    if (!Objects.equal(getRowKey(), cell.getRowKey()) || !Objects.equal(getColumnKey(), cell.getColumnKey()) || !Objects.equal(getValue(), cell.getValue()))
                        return false;
                }
                return true;
            }
            return false;
        }

        public int hashCode()
        {
            Object aobj[] = new Object[3];
            aobj[0] = getRowKey();
            aobj[1] = getColumnKey();
            aobj[2] = getValue();
            return Objects.hashCode(aobj);
        }

        public String toString()
        {
            return (new StringBuilder()).append("(").append(getRowKey()).append(",").append(getColumnKey()).append(")=").append(getValue()).toString();
        }

    }

    static final class ImmutableCell extends AbstractCell
        implements Serializable
    {

        private static final long serialVersionUID;
        private final Object columnKey;
        private final Object rowKey;
        private final Object value;

        public Object getColumnKey()
        {
            return columnKey;
        }

        public Object getRowKey()
        {
            return rowKey;
        }

        public Object getValue()
        {
            return value;
        }

        ImmutableCell(Object obj, Object obj1, Object obj2)
        {
            rowKey = obj;
            columnKey = obj1;
            value = obj2;
        }
    }

    private static class TransformedTable
        implements Table
    {

        CellSet cellSet;
        Map columnMap;
        final Table fromTable;
        final Function function;
        Map rowMap;
        Collection values;

        Function cellFunction()
        {
            return new Function() {

                final TransformedTable this$0;

                public Table.Cell apply(Table.Cell cell)
                {
                    return Tables.immutableCell(cell.getRowKey(), cell.getColumnKey(), function.apply(cell.getValue()));
                }

                public volatile Object apply(Object obj)
                {
                    return apply((Table.Cell)obj);
                }

            
            {
                this$0 = TransformedTable.this;
                super();
            }
            }
;
        }

        public Set cellSet()
        {
            if (cellSet == null)
            {
                CellSet cellset = new CellSet();
                cellSet = cellset;
                return cellset;
            } else
            {
                return cellSet;
            }
        }

        public void clear()
        {
            fromTable.clear();
        }

        public Map column(Object obj)
        {
            return Maps.transformValues(fromTable.column(obj), function);
        }

        public Set columnKeySet()
        {
            return fromTable.columnKeySet();
        }

        public Map columnMap()
        {
            if (columnMap == null)
            {
                Map map = createColumnMap();
                columnMap = map;
                return map;
            } else
            {
                return columnMap;
            }
        }

        public boolean contains(Object obj, Object obj1)
        {
            return fromTable.contains(obj, obj1);
        }

        public boolean containsColumn(Object obj)
        {
            return fromTable.containsColumn(obj);
        }

        public boolean containsRow(Object obj)
        {
            return fromTable.containsRow(obj);
        }

        public boolean containsValue(Object obj)
        {
            return values().contains(obj);
        }

        Map createColumnMap()
        {
            Function function1 = new Function() {

                final TransformedTable this$0;

                public volatile Object apply(Object obj)
                {
                    return apply((Map)obj);
                }

                public Map apply(Map map)
                {
                    return Maps.transformValues(map, function);
                }

            
            {
                this$0 = TransformedTable.this;
                super();
            }
            }
;
            return Maps.transformValues(fromTable.columnMap(), function1);
        }

        Map createRowMap()
        {
            Function function1 = new Function() {

                final TransformedTable this$0;

                public volatile Object apply(Object obj)
                {
                    return apply((Map)obj);
                }

                public Map apply(Map map)
                {
                    return Maps.transformValues(map, function);
                }

            
            {
                this$0 = TransformedTable.this;
                super();
            }
            }
;
            return Maps.transformValues(fromTable.rowMap(), function1);
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

        public Object get(Object obj, Object obj1)
        {
            if (contains(obj, obj1))
                return function.apply(fromTable.get(obj, obj1));
            else
                return null;
        }

        public int hashCode()
        {
            return cellSet().hashCode();
        }

        public boolean isEmpty()
        {
            return fromTable.isEmpty();
        }

        public Object put(Object obj, Object obj1, Object obj2)
        {
            throw new UnsupportedOperationException();
        }

        public void putAll(Table table)
        {
            throw new UnsupportedOperationException();
        }

        public Object remove(Object obj, Object obj1)
        {
            if (contains(obj, obj1))
                return function.apply(fromTable.remove(obj, obj1));
            else
                return null;
        }

        public Map row(Object obj)
        {
            return Maps.transformValues(fromTable.row(obj), function);
        }

        public Set rowKeySet()
        {
            return fromTable.rowKeySet();
        }

        public Map rowMap()
        {
            if (rowMap == null)
            {
                Map map = createRowMap();
                rowMap = map;
                return map;
            } else
            {
                return rowMap;
            }
        }

        public int size()
        {
            return fromTable.size();
        }

        public String toString()
        {
            return rowMap().toString();
        }

        public Collection values()
        {
            if (values == null)
            {
                Collection collection = Collections2.transform(fromTable.values(), function);
                values = collection;
                return collection;
            } else
            {
                return values;
            }
        }

        TransformedTable(Table table, Function function1)
        {
            fromTable = (Table)Preconditions.checkNotNull(table);
            function = (Function)Preconditions.checkNotNull(function1);
        }
    }

    class TransformedTable.CellSet extends Collections2.TransformedCollection
        implements Set
    {

        final TransformedTable this$0;

        public boolean contains(Object obj)
        {
            if (obj instanceof Table.Cell)
            {
                Table.Cell cell = (Table.Cell)obj;
                if (Objects.equal(cell.getValue(), get(cell.getRowKey(), cell.getColumnKey())) && (cell.getValue() != null || fromTable.contains(cell.getRowKey(), cell.getColumnKey())))
                    return true;
            }
            return false;
        }

        public boolean equals(Object obj)
        {
            return Sets.equalsImpl(this, obj);
        }

        public int hashCode()
        {
            return Sets.hashCodeImpl(this);
        }

        public boolean remove(Object obj)
        {
            if (contains(obj))
            {
                Table.Cell cell = (Table.Cell)obj;
                fromTable.remove(cell.getRowKey(), cell.getColumnKey());
                return true;
            } else
            {
                return false;
            }
        }

        TransformedTable.CellSet()
        {
            this$0 = TransformedTable.this;
            super(fromTable.cellSet(), cellFunction());
        }
    }

    private static class TransposeTable
        implements Table
    {

        private static final Function TRANSPOSE_CELL = new Function() {

            public Table.Cell apply(Table.Cell cell)
            {
                return Tables.immutableCell(cell.getColumnKey(), cell.getRowKey(), cell.getValue());
            }

            public volatile Object apply(Object obj)
            {
                return apply((Table.Cell)obj);
            }

        }
;
        CellSet cellSet;
        final Table original;

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
            original.clear();
        }

        public Map column(Object obj)
        {
            return original.row(obj);
        }

        public Set columnKeySet()
        {
            return original.rowKeySet();
        }

        public Map columnMap()
        {
            return original.rowMap();
        }

        public boolean contains(Object obj, Object obj1)
        {
            return original.contains(obj1, obj);
        }

        public boolean containsColumn(Object obj)
        {
            return original.containsRow(obj);
        }

        public boolean containsRow(Object obj)
        {
            return original.containsColumn(obj);
        }

        public boolean containsValue(Object obj)
        {
            return original.containsValue(obj);
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

        public Object get(Object obj, Object obj1)
        {
            return original.get(obj1, obj);
        }

        public int hashCode()
        {
            return cellSet().hashCode();
        }

        public boolean isEmpty()
        {
            return original.isEmpty();
        }

        public Object put(Object obj, Object obj1, Object obj2)
        {
            return original.put(obj1, obj, obj2);
        }

        public void putAll(Table table)
        {
            original.putAll(Tables.transpose(table));
        }

        public Object remove(Object obj, Object obj1)
        {
            return original.remove(obj1, obj);
        }

        public Map row(Object obj)
        {
            return original.column(obj);
        }

        public Set rowKeySet()
        {
            return original.columnKeySet();
        }

        public Map rowMap()
        {
            return original.columnMap();
        }

        public int size()
        {
            return original.size();
        }

        public String toString()
        {
            return rowMap().toString();
        }

        public Collection values()
        {
            return original.values();
        }



        TransposeTable(Table table)
        {
            original = (Table)Preconditions.checkNotNull(table);
        }
    }

    class TransposeTable.CellSet extends Collections2.TransformedCollection
        implements Set
    {

        final TransposeTable this$0;

        public boolean contains(Object obj)
        {
            if (obj instanceof Table.Cell)
            {
                Table.Cell cell = (Table.Cell)obj;
                return original.cellSet().contains(Tables.immutableCell(cell.getColumnKey(), cell.getRowKey(), cell.getValue()));
            } else
            {
                return false;
            }
        }

        public boolean equals(Object obj)
        {
            boolean flag1;
            if (obj == this)
            {
                flag1 = true;
            } else
            {
                boolean flag = obj instanceof Set;
                flag1 = false;
                if (flag)
                {
                    Set set = (Set)obj;
                    int i = set.size();
                    int j = size();
                    flag1 = false;
                    if (i == j)
                        return containsAll(set);
                }
            }
            return flag1;
        }

        public int hashCode()
        {
            return Sets.hashCodeImpl(this);
        }

        public boolean remove(Object obj)
        {
            if (obj instanceof Table.Cell)
            {
                Table.Cell cell = (Table.Cell)obj;
                return original.cellSet().remove(Tables.immutableCell(cell.getColumnKey(), cell.getRowKey(), cell.getValue()));
            } else
            {
                return false;
            }
        }

        TransposeTable.CellSet()
        {
            this$0 = TransposeTable.this;
            super(original.cellSet(), TransposeTable.TRANSPOSE_CELL);
        }
    }

    static final class UnmodifiableRowSortedMap extends UnmodifiableTable
        implements RowSortedTable
    {

        private static final long serialVersionUID;

        protected RowSortedTable _mthdelegate()
        {
            return (RowSortedTable)super._mthdelegate();
        }

        protected volatile Table _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public volatile Set rowKeySet()
        {
            return rowKeySet();
        }

        public SortedSet rowKeySet()
        {
            return Collections.unmodifiableSortedSet(_mthdelegate().rowKeySet());
        }

        public volatile Map rowMap()
        {
            return rowMap();
        }

        public SortedMap rowMap()
        {
            Function function = Tables.unmodifiableWrapper();
            return Collections.unmodifiableSortedMap(Maps.transformValues(_mthdelegate().rowMap(), function));
        }

        public UnmodifiableRowSortedMap(RowSortedTable rowsortedtable)
        {
            super(rowsortedtable);
        }
    }

    private static class UnmodifiableTable extends ForwardingTable
        implements Serializable
    {

        private static final long serialVersionUID;
        final Table _flddelegate;

        public Set cellSet()
        {
            return Collections.unmodifiableSet(super.cellSet());
        }

        public void clear()
        {
            throw new UnsupportedOperationException();
        }

        public Map column(Object obj)
        {
            return Collections.unmodifiableMap(super.column(obj));
        }

        public Set columnKeySet()
        {
            return Collections.unmodifiableSet(super.columnKeySet());
        }

        public Map columnMap()
        {
            Function function = Tables.unmodifiableWrapper();
            return Collections.unmodifiableMap(Maps.transformValues(super.columnMap(), function));
        }

        protected Table _mthdelegate()
        {
            return _flddelegate;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        public Object put(Object obj, Object obj1, Object obj2)
        {
            throw new UnsupportedOperationException();
        }

        public void putAll(Table table)
        {
            throw new UnsupportedOperationException();
        }

        public Object remove(Object obj, Object obj1)
        {
            throw new UnsupportedOperationException();
        }

        public Map row(Object obj)
        {
            return Collections.unmodifiableMap(super.row(obj));
        }

        public Set rowKeySet()
        {
            return Collections.unmodifiableSet(super.rowKeySet());
        }

        public Map rowMap()
        {
            Function function = Tables.unmodifiableWrapper();
            return Collections.unmodifiableMap(Maps.transformValues(super.rowMap(), function));
        }

        public Collection values()
        {
            return Collections.unmodifiableCollection(super.values());
        }

        UnmodifiableTable(Table table)
        {
            _flddelegate = (Table)Preconditions.checkNotNull(table);
        }
    }


    private static final Function UNMODIFIABLE_WRAPPER = new Function() {

        public volatile Object apply(Object obj)
        {
            return apply((Map)obj);
        }

        public Map apply(Map map)
        {
            return Collections.unmodifiableMap(map);
        }

    }
;

    private Tables()
    {
    }

    public static Table.Cell immutableCell(Object obj, Object obj1, Object obj2)
    {
        return new ImmutableCell(obj, obj1, obj2);
    }

    public static Table newCustomTable(Map map, Supplier supplier)
    {
        Preconditions.checkArgument(map.isEmpty());
        Preconditions.checkNotNull(supplier);
        return new StandardTable(map, supplier);
    }

    public static Table transformValues(Table table, Function function)
    {
        return new TransformedTable(table, function);
    }

    public static Table transpose(Table table)
    {
        if (table instanceof TransposeTable)
            return ((TransposeTable)table).original;
        else
            return new TransposeTable(table);
    }

    public static RowSortedTable unmodifiableRowSortedTable(RowSortedTable rowsortedtable)
    {
        return new UnmodifiableRowSortedMap(rowsortedtable);
    }

    public static Table unmodifiableTable(Table table)
    {
        return new UnmodifiableTable(table);
    }

    private static Function unmodifiableWrapper()
    {
        return UNMODIFIABLE_WRAPPER;
    }


}
