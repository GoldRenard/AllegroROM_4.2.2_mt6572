// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            StandardRowSortedTable, Ordering, StandardTable, Iterables, 
//            Iterators, Table, AbstractIterator

public class TreeBasedTable extends StandardRowSortedTable
{
    private static class Factory
        implements Supplier, Serializable
    {

        private static final long serialVersionUID;
        final Comparator comparator;

        public volatile Object get()
        {
            return get();
        }

        public TreeMap get()
        {
            return new TreeMap(comparator);
        }

        Factory(Comparator comparator1)
        {
            comparator = comparator1;
        }
    }

    private class TreeRow extends StandardTable.Row
        implements SortedMap
    {

        final Object lowerBound;
        final TreeBasedTable this$0;
        final Object upperBound;
        transient SortedMap wholeRow;

        volatile Map backingRowMap()
        {
            return backingRowMap();
        }

        SortedMap backingRowMap()
        {
            return (SortedMap)super.backingRowMap();
        }

        public Comparator comparator()
        {
            return columnComparator();
        }

        int compare(Object obj, Object obj1)
        {
            return comparator().compare(obj, obj1);
        }

        volatile Map computeBackingRowMap()
        {
            return computeBackingRowMap();
        }

        SortedMap computeBackingRowMap()
        {
            SortedMap sortedmap = wholeRow();
            if (sortedmap != null)
            {
                if (lowerBound != null)
                    sortedmap = sortedmap.tailMap(lowerBound);
                if (upperBound != null)
                    sortedmap = sortedmap.headMap(upperBound);
                return sortedmap;
            } else
            {
                return null;
            }
        }

        public boolean containsKey(Object obj)
        {
            return rangeContains(obj) && super.containsKey(obj);
        }

        public Object firstKey()
        {
            if (backingRowMap() == null)
                throw new NoSuchElementException();
            else
                return backingRowMap().firstKey();
        }

        public SortedMap headMap(Object obj)
        {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(obj)));
            return new TreeRow(super.rowKey, lowerBound, obj);
        }

        public Object lastKey()
        {
            if (backingRowMap() == null)
                throw new NoSuchElementException();
            else
                return backingRowMap().lastKey();
        }

        void maintainEmptyInvariant()
        {
            if (wholeRow() != null && wholeRow.isEmpty())
            {
                backingMap.remove(super.rowKey);
                wholeRow = null;
                super.backingRowMap = null;
            }
        }

        public Object put(Object obj, Object obj1)
        {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(obj)));
            return super.put(obj, obj1);
        }

        boolean rangeContains(Object obj)
        {
            return obj != null && (lowerBound == null || compare(lowerBound, obj) <= 0) && (upperBound == null || compare(upperBound, obj) > 0);
        }

        public SortedMap subMap(Object obj, Object obj1)
        {
            boolean flag;
            if (rangeContains(Preconditions.checkNotNull(obj)) && rangeContains(Preconditions.checkNotNull(obj1)))
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            return new TreeRow(super.rowKey, obj, obj1);
        }

        public SortedMap tailMap(Object obj)
        {
            Preconditions.checkArgument(rangeContains(Preconditions.checkNotNull(obj)));
            return new TreeRow(super.rowKey, obj, upperBound);
        }

        SortedMap wholeRow()
        {
            if (wholeRow == null || wholeRow.isEmpty() && backingMap.containsKey(super.rowKey))
                wholeRow = (SortedMap)backingMap.get(super.rowKey);
            return wholeRow;
        }

        TreeRow(Object obj)
        {
            this(obj, null, null);
        }

        TreeRow(Object obj, Object obj1, Object obj2)
        {
            this$0 = TreeBasedTable.this;
            super(TreeBasedTable.this, obj);
            lowerBound = obj1;
            upperBound = obj2;
            boolean flag;
            if (obj1 != null && obj2 != null && compare(obj1, obj2) > 0)
                flag = false;
            else
                flag = true;
            Preconditions.checkArgument(flag);
        }
    }


    private static final long serialVersionUID;
    private final Comparator columnComparator;

    TreeBasedTable(Comparator comparator, Comparator comparator1)
    {
        super(new TreeMap(comparator), new Factory(comparator1));
        columnComparator = comparator1;
    }

    public static TreeBasedTable create()
    {
        return new TreeBasedTable(Ordering.natural(), Ordering.natural());
    }

    public static TreeBasedTable create(TreeBasedTable treebasedtable)
    {
        TreeBasedTable treebasedtable1 = new TreeBasedTable(treebasedtable.rowComparator(), treebasedtable.columnComparator());
        treebasedtable1.putAll(treebasedtable);
        return treebasedtable1;
    }

    public static TreeBasedTable create(Comparator comparator, Comparator comparator1)
    {
        Preconditions.checkNotNull(comparator);
        Preconditions.checkNotNull(comparator1);
        return new TreeBasedTable(comparator, comparator1);
    }

    public volatile Set cellSet()
    {
        return super.cellSet();
    }

    public volatile void clear()
    {
        super.clear();
    }

    public volatile Map column(Object obj)
    {
        return super.column(obj);
    }

    public Comparator columnComparator()
    {
        return columnComparator;
    }

    public volatile Set columnKeySet()
    {
        return super.columnKeySet();
    }

    public volatile Map columnMap()
    {
        return super.columnMap();
    }

    public boolean contains(Object obj, Object obj1)
    {
        return super.contains(obj, obj1);
    }

    public boolean containsColumn(Object obj)
    {
        return super.containsColumn(obj);
    }

    public boolean containsRow(Object obj)
    {
        return super.containsRow(obj);
    }

    public boolean containsValue(Object obj)
    {
        return super.containsValue(obj);
    }

    Iterator createColumnKeyIterator()
    {
        Comparator comparator = columnComparator();
        return new AbstractIterator() {

            Object lastValue;
            final TreeBasedTable this$0;
            final Comparator val$comparator;
            final Iterator val$merged;

            protected Object computeNext()
            {
                while (merged.hasNext()) 
                {
                    Object obj = merged.next();
                    boolean flag;
                    if (lastValue != null && comparator.compare(obj, lastValue) == 0)
                        flag = true;
                    else
                        flag = false;
                    if (!flag)
                    {
                        lastValue = obj;
                        return lastValue;
                    }
                }
                lastValue = null;
                return endOfData();
            }

            
            {
                this$0 = TreeBasedTable.this;
                merged = iterator;
                comparator = comparator1;
                super();
            }
        }
;
    }

    public boolean equals(Object obj)
    {
        return super.equals(obj);
    }

    public Object get(Object obj, Object obj1)
    {
        return super.get(obj, obj1);
    }

    public volatile int hashCode()
    {
        return super.hashCode();
    }

    public volatile boolean isEmpty()
    {
        return super.isEmpty();
    }

    public volatile Object put(Object obj, Object obj1, Object obj2)
    {
        return super.put(obj, obj1, obj2);
    }

    public volatile void putAll(Table table)
    {
        super.putAll(table);
    }

    public Object remove(Object obj, Object obj1)
    {
        return super.remove(obj, obj1);
    }

    public volatile Map row(Object obj)
    {
        return row(obj);
    }

    public SortedMap row(Object obj)
    {
        return new TreeRow(obj);
    }

    public Comparator rowComparator()
    {
        return rowKeySet().comparator();
    }

    public volatile Set rowKeySet()
    {
        return rowKeySet();
    }

    public SortedSet rowKeySet()
    {
        return super.rowKeySet();
    }

    public volatile Map rowMap()
    {
        return rowMap();
    }

    public SortedMap rowMap()
    {
        return super.rowMap();
    }

    public volatile int size()
    {
        return super.size();
    }

    public volatile String toString()
    {
        return super.toString();
    }

    public volatile Collection values()
    {
        return super.values();
    }

    // Unreferenced inner class com/google/common/collect/TreeBasedTable$1

/* anonymous class */
    class _cls1
        implements Function
    {

        final TreeBasedTable this$0;

        public volatile Object apply(Object obj)
        {
            return apply((Map)obj);
        }

        public Iterator apply(Map map)
        {
            return map.keySet().iterator();
        }

            
            {
                this$0 = TreeBasedTable.this;
                super();
            }
    }

}
