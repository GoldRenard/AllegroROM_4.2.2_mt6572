// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import com.google.common.primitives.Ints;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Multiset, Iterators, Ordering, ImmutableMultiset, 
//            SortedMultiset, ForwardingCollection, ForwardingSet, ForwardingMultiset, 
//            BoundType, AbstractMultiset, Sets, AbstractIterator

public final class Multisets
{
    static abstract class AbstractEntry
        implements Multiset.Entry
    {

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof Multiset.Entry;
            boolean flag1 = false;
            if (flag)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                int i = getCount();
                int j = entry.getCount();
                flag1 = false;
                if (i == j)
                {
                    boolean flag2 = Objects.equal(getElement(), entry.getElement());
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public int hashCode()
        {
            Object obj = getElement();
            int i;
            if (obj == null)
                i = 0;
            else
                i = obj.hashCode();
            return i ^ getCount();
        }

        public String toString()
        {
            String s = String.valueOf(getElement());
            int i = getCount();
            if (i == 1)
                return s;
            else
                return (new StringBuilder()).append(s).append(" x ").append(i).toString();
        }

    }

    static abstract class ElementSet extends AbstractSet
    {

        public void clear()
        {
            multiset().clear();
        }

        public boolean contains(Object obj)
        {
            return multiset().contains(obj);
        }

        public boolean containsAll(Collection collection)
        {
            return multiset().containsAll(collection);
        }

        public boolean isEmpty()
        {
            return multiset().isEmpty();
        }

        public Iterator iterator()
        {
            return Iterators.transform(multiset().entrySet().iterator(), new Function() {

                final ElementSet this$0;

                public Object apply(Multiset.Entry entry)
                {
                    return entry.getElement();
                }

                public volatile Object apply(Object obj)
                {
                    return apply((Multiset.Entry)obj);
                }

            
            {
                this$0 = ElementSet.this;
                super();
            }
            }
);
        }

        abstract Multiset multiset();

        public boolean remove(Object obj)
        {
            int i = multiset().count(obj);
            if (i > 0)
            {
                multiset().remove(obj, i);
                return true;
            } else
            {
                return false;
            }
        }

        public int size()
        {
            return multiset().entrySet().size();
        }

    }

    static abstract class EntrySet extends AbstractSet
    {

        public void clear()
        {
            multiset().clear();
        }

        public boolean contains(Object obj)
        {
            if (obj instanceof Multiset.Entry)
            {
                Multiset.Entry entry = (Multiset.Entry)obj;
                if (entry.getCount() > 0 && multiset().count(entry.getElement()) == entry.getCount())
                    return true;
            }
            return false;
        }

        abstract Multiset multiset();

        public boolean remove(Object obj)
        {
            return contains(obj) && multiset().elementSet().remove(((Multiset.Entry)obj).getElement());
        }

    }

    static final class ImmutableEntry extends AbstractEntry
        implements Serializable
    {

        private static final long serialVersionUID;
        final int count;
        final Object element;

        public int getCount()
        {
            return count;
        }

        public Object getElement()
        {
            return element;
        }

        ImmutableEntry(Object obj, int i)
        {
            element = obj;
            count = i;
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
        }
    }

    static final class MultisetIteratorImpl
        implements Iterator
    {

        private boolean canRemove;
        private Multiset.Entry currentEntry;
        private final Iterator entryIterator;
        private int laterCount;
        private final Multiset multiset;
        private int totalCount;

        public boolean hasNext()
        {
            return laterCount > 0 || entryIterator.hasNext();
        }

        public Object next()
        {
            if (!hasNext())
                throw new NoSuchElementException();
            if (laterCount == 0)
            {
                currentEntry = (Multiset.Entry)entryIterator.next();
                int i = currentEntry.getCount();
                laterCount = i;
                totalCount = i;
            }
            laterCount = -1 + laterCount;
            canRemove = true;
            return currentEntry.getElement();
        }

        public void remove()
        {
            Preconditions.checkState(canRemove, "no calls to next() since the last call to remove()");
            if (totalCount == 1)
                entryIterator.remove();
            else
                multiset.remove(currentEntry.getElement());
            totalCount = -1 + totalCount;
            canRemove = false;
        }

        MultisetIteratorImpl(Multiset multiset1, Iterator iterator)
        {
            multiset = multiset1;
            entryIterator = iterator;
        }
    }

    private static class SetMultiset extends ForwardingCollection
        implements Multiset, Serializable
    {

        private static final long serialVersionUID;
        final Set _flddelegate;
        transient Set elementSet;
        transient Set entrySet;

        public int add(Object obj, int i)
        {
            throw new UnsupportedOperationException();
        }

        public boolean add(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public int count(Object obj)
        {
            return !_flddelegate.contains(obj) ? 0 : 1;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Set _mthdelegate()
        {
            return _flddelegate;
        }

        public Set elementSet()
        {
            Object obj = elementSet;
            if (obj == null)
            {
                obj = new ElementSet();
                elementSet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public Set entrySet()
        {
            Object obj = entrySet;
            if (obj == null)
            {
                obj = new EntrySet() {

                    final SetMultiset this$0;

                    public Iterator iterator()
                    {
                        return Iterators.transform(_flddelegate.iterator(), new Function() {

                            final SetMultiset._cls1 this$1;

                            public Multiset.Entry apply(Object obj)
                            {
                                return Multisets.immutableEntry(obj, 1);
                            }

                            public volatile Object apply(Object obj)
                            {
                                return apply(obj);
                            }

            
            {
                this$1 = SetMultiset._cls1.this;
                super();
            }
                        }
);
                    }

                    Multiset multiset()
                    {
                        return SetMultiset.this;
                    }

                    public int size()
                    {
                        return _flddelegate.size();
                    }

            
            {
                this$0 = SetMultiset.this;
                super();
            }
                }
;
                entrySet = ((Set) (obj));
            }
            return ((Set) (obj));
        }

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof Multiset;
            boolean flag1 = false;
            if (flag)
            {
                Multiset multiset = (Multiset)obj;
                int i = size();
                int j = multiset.size();
                flag1 = false;
                if (i == j)
                {
                    boolean flag2 = _flddelegate.equals(multiset.elementSet());
                    flag1 = false;
                    if (flag2)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public int hashCode()
        {
            int i = 0;
            for (Iterator iterator = iterator(); iterator.hasNext();)
            {
                Object obj = iterator.next();
                int j;
                if (obj == null)
                    j = 0;
                else
                    j = obj.hashCode();
                i += j ^ 1;
            }

            return i;
        }

        public int remove(Object obj, int i)
        {
            int j = 1;
            if (i == 0)
            {
                j = count(obj);
            } else
            {
                boolean flag;
                if (i > 0)
                    flag = j;
                else
                    flag = false;
                Preconditions.checkArgument(flag);
                if (!_flddelegate.remove(obj))
                    return 0;
            }
            return j;
        }

        public int setCount(Object obj, int i)
        {
            Multisets.checkNonnegative(i, "count");
            if (i == count(obj))
                return i;
            if (i == 0)
            {
                remove(obj);
                return 1;
            } else
            {
                throw new UnsupportedOperationException();
            }
        }

        public boolean setCount(Object obj, int i, int j)
        {
            return Multisets.setCountImpl(this, obj, i, j);
        }

        SetMultiset(Set set)
        {
            _flddelegate = (Set)Preconditions.checkNotNull(set);
        }
    }

    class SetMultiset.ElementSet extends ForwardingSet
    {

        final SetMultiset this$0;

        public boolean add(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        protected Set _mthdelegate()
        {
            return _flddelegate;
        }

        SetMultiset.ElementSet()
        {
            this$0 = SetMultiset.this;
            super();
        }
    }

    static class UnmodifiableMultiset extends ForwardingMultiset
        implements Serializable
    {

        private static final long serialVersionUID;
        final Multiset _flddelegate;
        transient Set elementSet;
        transient Set entrySet;

        public int add(Object obj, int i)
        {
            throw new UnsupportedOperationException();
        }

        public boolean add(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public boolean addAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public void clear()
        {
            throw new UnsupportedOperationException();
        }

        Set createElementSet()
        {
            return Collections.unmodifiableSet(_flddelegate.elementSet());
        }

        protected Multiset _mthdelegate()
        {
            return _flddelegate;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Collection _mthdelegate()
        {
            return _mthdelegate();
        }

        public Set elementSet()
        {
            Set set = elementSet;
            if (set == null)
            {
                set = createElementSet();
                elementSet = set;
            }
            return set;
        }

        public Set entrySet()
        {
            Set set = entrySet;
            if (set == null)
            {
                set = Collections.unmodifiableSet(_flddelegate.entrySet());
                entrySet = set;
            }
            return set;
        }

        public Iterator iterator()
        {
            return Iterators.unmodifiableIterator(_flddelegate.iterator());
        }

        public int remove(Object obj, int i)
        {
            throw new UnsupportedOperationException();
        }

        public boolean remove(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public boolean removeAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public boolean retainAll(Collection collection)
        {
            throw new UnsupportedOperationException();
        }

        public int setCount(Object obj, int i)
        {
            throw new UnsupportedOperationException();
        }

        public boolean setCount(Object obj, int i, int j)
        {
            throw new UnsupportedOperationException();
        }

        UnmodifiableMultiset(Multiset multiset)
        {
            _flddelegate = multiset;
        }
    }

    private static final class UnmodifiableSortedMultiset extends UnmodifiableMultiset
        implements SortedMultiset
    {

        private static final long serialVersionUID;
        private transient UnmodifiableSortedMultiset descendingMultiset;

        public Comparator comparator()
        {
            return _mthdelegate().comparator();
        }

        volatile Set createElementSet()
        {
            return createElementSet();
        }

        SortedSet createElementSet()
        {
            return Collections.unmodifiableSortedSet(_mthdelegate().elementSet());
        }

        protected volatile Multiset _mthdelegate()
        {
            return _mthdelegate();
        }

        protected SortedMultiset _mthdelegate()
        {
            return (SortedMultiset)super._mthdelegate();
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
            UnmodifiableSortedMultiset unmodifiablesortedmultiset = descendingMultiset;
            if (unmodifiablesortedmultiset == null)
            {
                UnmodifiableSortedMultiset unmodifiablesortedmultiset1 = new UnmodifiableSortedMultiset(_mthdelegate().descendingMultiset());
                unmodifiablesortedmultiset1.descendingMultiset = this;
                descendingMultiset = unmodifiablesortedmultiset1;
                return unmodifiablesortedmultiset1;
            } else
            {
                return unmodifiablesortedmultiset;
            }
        }

        public volatile Set elementSet()
        {
            return elementSet();
        }

        public SortedSet elementSet()
        {
            return (SortedSet)super.elementSet();
        }

        public Multiset.Entry firstEntry()
        {
            return _mthdelegate().firstEntry();
        }

        public SortedMultiset headMultiset(Object obj, BoundType boundtype)
        {
            return Multisets.unmodifiableSortedMultiset(_mthdelegate().headMultiset(obj, boundtype));
        }

        public Multiset.Entry lastEntry()
        {
            return _mthdelegate().lastEntry();
        }

        public Multiset.Entry pollFirstEntry()
        {
            throw new UnsupportedOperationException();
        }

        public Multiset.Entry pollLastEntry()
        {
            throw new UnsupportedOperationException();
        }

        public SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
        {
            return Multisets.unmodifiableSortedMultiset(_mthdelegate().subMultiset(obj, boundtype, obj1, boundtype1));
        }

        public SortedMultiset tailMultiset(Object obj, BoundType boundtype)
        {
            return Multisets.unmodifiableSortedMultiset(_mthdelegate().tailMultiset(obj, boundtype));
        }

        private UnmodifiableSortedMultiset(SortedMultiset sortedmultiset)
        {
            super(sortedmultiset);
        }

    }


    private static final Ordering DECREASING_COUNT_ORDERING = new Ordering() {

        public int compare(Multiset.Entry entry, Multiset.Entry entry1)
        {
            return Ints.compare(entry1.getCount(), entry.getCount());
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((Multiset.Entry)obj, (Multiset.Entry)obj1);
        }

    }
;

    private Multisets()
    {
    }

    static boolean addAllImpl(Multiset multiset, Collection collection)
    {
        if (collection.isEmpty())
            return false;
        if (collection instanceof Multiset)
        {
            Multiset.Entry entry;
            for (Iterator iterator = cast(collection).entrySet().iterator(); iterator.hasNext(); multiset.add(entry.getElement(), entry.getCount()))
                entry = (Multiset.Entry)iterator.next();

        } else
        {
            Iterators.addAll(multiset, collection.iterator());
        }
        return true;
    }

    static Multiset cast(Iterable iterable)
    {
        return (Multiset)iterable;
    }

    static void checkNonnegative(int i, String s)
    {
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = s;
        aobj[1] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "%s cannot be negative: %s", aobj);
    }

    public static boolean containsOccurrences(Multiset multiset, Multiset multiset1)
    {
        Preconditions.checkNotNull(multiset);
        Preconditions.checkNotNull(multiset1);
        for (Iterator iterator = multiset1.entrySet().iterator(); iterator.hasNext();)
        {
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            if (multiset.count(entry.getElement()) < entry.getCount())
                return false;
        }

        return true;
    }

    public static ImmutableMultiset copyHighestCountFirst(Multiset multiset)
    {
        return ImmutableMultiset.copyFromEntries(DECREASING_COUNT_ORDERING.sortedCopy(multiset.entrySet()));
    }

    static boolean equalsImpl(Multiset multiset, Object obj)
    {
label0:
        {
label1:
            {
label2:
                {
                    if (obj == multiset)
                        break label2;
                    if (!(obj instanceof Multiset))
                        break label0;
                    Multiset multiset1 = (Multiset)obj;
                    if (multiset.size() != multiset1.size() || multiset.entrySet().size() != multiset1.entrySet().size())
                        break label1;
                    Iterator iterator = multiset1.entrySet().iterator();
                    Multiset.Entry entry;
                    do
                    {
                        if (!iterator.hasNext())
                            break label2;
                        entry = (Multiset.Entry)iterator.next();
                    } while (multiset.count(entry.getElement()) == entry.getCount());
                    return false;
                }
                return true;
            }
            return false;
        }
        return false;
    }

    static Multiset forSet(Set set)
    {
        return new SetMultiset(set);
    }

    public static Multiset.Entry immutableEntry(Object obj, int i)
    {
        return new ImmutableEntry(obj, i);
    }

    static int inferDistinctElements(Iterable iterable)
    {
        if (iterable instanceof Multiset)
            return ((Multiset)iterable).elementSet().size();
        else
            return 11;
    }

    public static Multiset intersection(Multiset multiset, Multiset multiset1)
    {
        Preconditions.checkNotNull(multiset);
        Preconditions.checkNotNull(multiset1);
        return new AbstractMultiset(multiset, multiset1) {

            final Multiset val$multiset1;
            final Multiset val$multiset2;

            public int count(Object obj)
            {
                int i = multiset1.count(obj);
                if (i == 0)
                    return 0;
                else
                    return Math.min(i, multiset2.count(obj));
            }

            Set createElementSet()
            {
                return Sets.intersection(multiset1.elementSet(), multiset2.elementSet());
            }

            int distinctElements()
            {
                return elementSet().size();
            }

            Iterator entryIterator()
            {
                return multiset1.entrySet().iterator(). new AbstractIterator() {

                    final _cls1 this$0;
                    final Iterator val$iterator1;

                    protected Multiset.Entry computeNext()
                    {
                        while (iterator1.hasNext()) 
                        {
                            Multiset.Entry entry = (Multiset.Entry)iterator1.next();
                            Object obj = entry.getElement();
                            int i = Math.min(entry.getCount(), multiset2.count(obj));
                            if (i > 0)
                                return Multisets.immutableEntry(obj, i);
                        }
                        return (Multiset.Entry)endOfData();
                    }

                    protected volatile Object computeNext()
                    {
                        return computeNext();
                    }

            
            {
                this$0 = final__pcls1;
                iterator1 = Iterator.this;
                super();
            }
                }
;
            }

            
            {
                multiset1 = multiset;
                multiset2 = multiset3;
                super();
            }
        }
;
    }

    static Iterator iteratorImpl(Multiset multiset)
    {
        return new MultisetIteratorImpl(multiset, multiset.entrySet().iterator());
    }

    static boolean removeAllImpl(Multiset multiset, Collection collection)
    {
        Object obj;
        if (collection instanceof Multiset)
            obj = ((Multiset)collection).elementSet();
        else
            obj = collection;
        return multiset.elementSet().removeAll(((Collection) (obj)));
    }

    public static boolean removeOccurrences(Multiset multiset, Multiset multiset1)
    {
        return removeOccurrencesImpl(multiset, multiset1);
    }

    private static boolean removeOccurrencesImpl(Multiset multiset, Multiset multiset1)
    {
        Preconditions.checkNotNull(multiset);
        Preconditions.checkNotNull(multiset1);
        boolean flag = false;
        Iterator iterator = multiset.entrySet().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            int i = multiset1.count(entry.getElement());
            if (i >= entry.getCount())
            {
                iterator.remove();
                flag = true;
            } else
            if (i > 0)
            {
                multiset.remove(entry.getElement(), i);
                flag = true;
            }
        } while (true);
        return flag;
    }

    static boolean retainAllImpl(Multiset multiset, Collection collection)
    {
        Object obj;
        if (collection instanceof Multiset)
            obj = ((Multiset)collection).elementSet();
        else
            obj = collection;
        return multiset.elementSet().retainAll(((Collection) (obj)));
    }

    public static boolean retainOccurrences(Multiset multiset, Multiset multiset1)
    {
        return retainOccurrencesImpl(multiset, multiset1);
    }

    private static boolean retainOccurrencesImpl(Multiset multiset, Multiset multiset1)
    {
        Preconditions.checkNotNull(multiset);
        Preconditions.checkNotNull(multiset1);
        Iterator iterator = multiset.entrySet().iterator();
        boolean flag = false;
        do
        {
            if (!iterator.hasNext())
                break;
            Multiset.Entry entry = (Multiset.Entry)iterator.next();
            int i = multiset1.count(entry.getElement());
            if (i == 0)
            {
                iterator.remove();
                flag = true;
            } else
            if (i < entry.getCount())
            {
                multiset.setCount(entry.getElement(), i);
                flag = true;
            }
        } while (true);
        return flag;
    }

    static int setCountImpl(Multiset multiset, Object obj, int i)
    {
        checkNonnegative(i, "count");
        int j = multiset.count(obj);
        int k = i - j;
        if (k > 0)
            multiset.add(obj, k);
        else
        if (k < 0)
        {
            multiset.remove(obj, -k);
            return j;
        }
        return j;
    }

    static boolean setCountImpl(Multiset multiset, Object obj, int i, int j)
    {
        checkNonnegative(i, "oldCount");
        checkNonnegative(j, "newCount");
        if (multiset.count(obj) == i)
        {
            multiset.setCount(obj, j);
            return true;
        } else
        {
            return false;
        }
    }

    static int sizeImpl(Multiset multiset)
    {
        long l = 0L;
        for (Iterator iterator = multiset.entrySet().iterator(); iterator.hasNext();)
            l += ((Multiset.Entry)iterator.next()).getCount();

        return Ints.saturatedCast(l);
    }

    public static Multiset unmodifiableMultiset(ImmutableMultiset immutablemultiset)
    {
        return (Multiset)Preconditions.checkNotNull(immutablemultiset);
    }

    public static Multiset unmodifiableMultiset(Multiset multiset)
    {
        if (!(multiset instanceof UnmodifiableMultiset) && !(multiset instanceof ImmutableMultiset))
            return new UnmodifiableMultiset((Multiset)Preconditions.checkNotNull(multiset));
        else
            return multiset;
    }

    public static SortedMultiset unmodifiableSortedMultiset(SortedMultiset sortedmultiset)
    {
        return new UnmodifiableSortedMultiset((SortedMultiset)Preconditions.checkNotNull(sortedmultiset));
    }

}
