// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ForwardingMultiset, SortedMultiset, Ordering, Multisets, 
//            Multiset, BoundType

final class SortedMultisets
{
    static abstract class DescendingMultiset extends ForwardingMultiset
        implements SortedMultiset
    {

        private transient Comparator comparator;
        private transient SortedSet elementSet;
        private transient Set entrySet;

        public Comparator comparator()
        {
            Object obj = comparator;
            if (obj == null)
            {
                obj = Ordering.from(forwardMultiset().comparator()).reverse();
                comparator = ((Comparator) (obj));
            }
            return ((Comparator) (obj));
        }

        Set createEntrySet()
        {
            return new Multisets.EntrySet() {

                final DescendingMultiset this$0;

                public Iterator iterator()
                {
                    return entryIterator();
                }

                Multiset multiset()
                {
                    return DescendingMultiset.this;
                }

                public int size()
                {
                    return forwardMultiset().entrySet().size();
                }

            
            {
                this$0 = DescendingMultiset.this;
                super();
            }
            }
;
        }

        protected Multiset _mthdelegate()
        {
            return forwardMultiset();
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        public SortedMultiset descendingMultiset()
        {
            return forwardMultiset();
        }

        public volatile Set elementSet()
        {
            return elementSet();
        }

        public SortedSet elementSet()
        {
            Object obj = elementSet;
            if (obj == null)
            {
                obj = new ElementSet() {

                    final DescendingMultiset this$0;

                    volatile Multiset multiset()
                    {
                        return multiset();
                    }

                    SortedMultiset multiset()
                    {
                        return DescendingMultiset.this;
                    }

            
            {
                this$0 = DescendingMultiset.this;
                super();
            }
                }
;
                elementSet = ((SortedSet) (obj));
            }
            return ((SortedSet) (obj));
        }

        abstract Iterator entryIterator();

        public Set entrySet()
        {
            Set set = entrySet;
            if (set == null)
            {
                set = createEntrySet();
                entrySet = set;
            }
            return set;
        }

        public Multiset.Entry firstEntry()
        {
            return forwardMultiset().lastEntry();
        }

        abstract SortedMultiset forwardMultiset();

        public SortedMultiset headMultiset(Object obj, BoundType boundtype)
        {
            return forwardMultiset().tailMultiset(obj, boundtype).descendingMultiset();
        }

        public Iterator iterator()
        {
            return Multisets.iteratorImpl(this);
        }

        public Multiset.Entry lastEntry()
        {
            return forwardMultiset().firstEntry();
        }

        public Multiset.Entry pollFirstEntry()
        {
            return forwardMultiset().pollLastEntry();
        }

        public Multiset.Entry pollLastEntry()
        {
            return forwardMultiset().pollFirstEntry();
        }

        public SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
        {
            return forwardMultiset().subMultiset(obj1, boundtype1, obj, boundtype).descendingMultiset();
        }

        public SortedMultiset tailMultiset(Object obj, BoundType boundtype)
        {
            return forwardMultiset().headMultiset(obj, boundtype).descendingMultiset();
        }

        public Object[] toArray()
        {
            return standardToArray();
        }

        public Object[] toArray(Object aobj[])
        {
            return standardToArray(aobj);
        }

        public String toString()
        {
            return entrySet().toString();
        }

    }

    static abstract class ElementSet extends Multisets.ElementSet
        implements SortedSet
    {

        public Comparator comparator()
        {
            return multiset().comparator();
        }

        public Object first()
        {
            return SortedMultisets.getElementOrThrow(multiset().firstEntry());
        }

        public SortedSet headSet(Object obj)
        {
            return multiset().headMultiset(obj, BoundType.OPEN).elementSet();
        }

        public Object last()
        {
            return SortedMultisets.getElementOrThrow(multiset().lastEntry());
        }

        volatile Multiset multiset()
        {
            return multiset();
        }

        abstract SortedMultiset multiset();

        public SortedSet subSet(Object obj, Object obj1)
        {
            return multiset().subMultiset(obj, BoundType.CLOSED, obj1, BoundType.OPEN).elementSet();
        }

        public SortedSet tailSet(Object obj)
        {
            return multiset().tailMultiset(obj, BoundType.CLOSED).elementSet();
        }

    }


    private SortedMultisets()
    {
    }

    private static Object getElementOrThrow(Multiset.Entry entry)
    {
        if (entry == null)
            throw new NoSuchElementException();
        else
            return entry.getElement();
    }

}
