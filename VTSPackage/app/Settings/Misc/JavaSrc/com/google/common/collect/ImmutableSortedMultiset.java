// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedMultisetFauxverideShim, SortedMultiset, Ordering, EmptyImmutableSortedMultiset, 
//            SortedIterables, ImmutableList, RegularImmutableSortedMultiset, Multisets, 
//            DescendingImmutableSortedMultiset, ImmutableSortedSet, UnmodifiableIterator, BoundType, 
//            TreeMultiset, ImmutableCollection, ImmutableMultiset

abstract class ImmutableSortedMultiset extends ImmutableSortedMultisetFauxverideShim
    implements SortedMultiset
{
    public static class Builder extends ImmutableMultiset.Builder
    {

        private final Comparator comparator;

        public volatile ImmutableCollection.Builder add(Object obj)
        {
            return add(obj);
        }

        public volatile ImmutableCollection.Builder add(Object aobj[])
        {
            return add(aobj);
        }

        public volatile ImmutableMultiset.Builder add(Object obj)
        {
            return add(obj);
        }

        public volatile ImmutableMultiset.Builder add(Object aobj[])
        {
            return add(aobj);
        }

        public Builder add(Object obj)
        {
            super.add(obj);
            return this;
        }

        public transient Builder add(Object aobj[])
        {
            super.add(aobj);
            return this;
        }

        public volatile ImmutableCollection.Builder addAll(Iterable iterable)
        {
            return addAll(iterable);
        }

        public volatile ImmutableCollection.Builder addAll(Iterator iterator)
        {
            return addAll(iterator);
        }

        public volatile ImmutableMultiset.Builder addAll(Iterable iterable)
        {
            return addAll(iterable);
        }

        public volatile ImmutableMultiset.Builder addAll(Iterator iterator)
        {
            return addAll(iterator);
        }

        public Builder addAll(Iterable iterable)
        {
            super.addAll(iterable);
            return this;
        }

        public Builder addAll(Iterator iterator)
        {
            super.addAll(iterator);
            return this;
        }

        public volatile ImmutableMultiset.Builder addCopies(Object obj, int i)
        {
            return addCopies(obj, i);
        }

        public Builder addCopies(Object obj, int i)
        {
            super.addCopies(obj, i);
            return this;
        }

        public volatile ImmutableCollection build()
        {
            return build();
        }

        public volatile ImmutableMultiset build()
        {
            return build();
        }

        public ImmutableSortedMultiset build()
        {
            return ImmutableSortedMultiset.copyOf(comparator, super.contents);
        }

        public volatile ImmutableMultiset.Builder setCount(Object obj, int i)
        {
            return setCount(obj, i);
        }

        public Builder setCount(Object obj, int i)
        {
            super.setCount(obj, i);
            return this;
        }

        public Builder(Comparator comparator1)
        {
            super(TreeMultiset.create(comparator1));
            comparator = (Comparator)Preconditions.checkNotNull(comparator1);
        }
    }

    private static final class SerializedForm
        implements Serializable
    {

        Comparator comparator;
        int counts[];
        Object elements[];

        Object readResolve()
        {
            int i = elements.length;
            Builder builder = ImmutableSortedMultiset.orderedBy(comparator);
            for (int j = 0; j < i; j++)
                builder.addCopies(elements[j], counts[j]);

            return builder.build();
        }

        SerializedForm(SortedMultiset sortedmultiset)
        {
            comparator = sortedmultiset.comparator();
            int i = sortedmultiset.entrySet().size();
            elements = new Object[i];
            counts = new int[i];
            int j = 0;
            for (Iterator iterator = sortedmultiset.entrySet().iterator(); iterator.hasNext();)
            {
                Multiset.Entry entry = (Multiset.Entry)iterator.next();
                elements[j] = entry.getElement();
                counts[j] = entry.getCount();
                j++;
            }

        }
    }


    private static final ImmutableSortedMultiset NATURAL_EMPTY_MULTISET;
    private static final Comparator NATURAL_ORDER;
    private final transient Comparator comparator;
    transient ImmutableSortedMultiset descendingMultiset;
    private transient ImmutableSortedSet elementSet;
    private transient Comparator reverseComparator;

    ImmutableSortedMultiset(Comparator comparator1)
    {
        comparator = (Comparator)Preconditions.checkNotNull(comparator1);
    }

    public static ImmutableSortedMultiset copyOf(Iterable iterable)
    {
        return copyOf(((Comparator) (Ordering.natural())), iterable);
    }

    public static ImmutableSortedMultiset copyOf(Comparator comparator1, Iterable iterable)
    {
        Preconditions.checkNotNull(comparator1);
        return copyOfInternal(comparator1, iterable);
    }

    public static ImmutableSortedMultiset copyOf(Comparator comparator1, Iterator iterator)
    {
        Preconditions.checkNotNull(comparator1);
        return copyOfInternal(comparator1, iterator);
    }

    public static ImmutableSortedMultiset copyOf(Iterator iterator)
    {
        return copyOfInternal(Ordering.natural(), iterator);
    }

    public static ImmutableSortedMultiset copyOf(Comparable acomparable[])
    {
        return copyOf(((Comparator) (Ordering.natural())), ((Iterable) (Arrays.asList(acomparable))));
    }

    private static ImmutableSortedMultiset copyOfInternal(Comparator comparator1, Iterable iterable)
    {
        if (SortedIterables.hasSameComparator(comparator1, iterable) && (iterable instanceof ImmutableSortedMultiset) && !((ImmutableSortedMultiset)iterable).isPartialView())
            return (ImmutableSortedMultiset)iterable;
        ImmutableList immutablelist = ImmutableList.copyOf(SortedIterables.sortedCounts(comparator1, iterable));
        if (immutablelist.isEmpty())
        {
            return emptyMultiset(comparator1);
        } else
        {
            verifyEntries(immutablelist);
            return RegularImmutableSortedMultiset.createFromSorted(comparator1, immutablelist);
        }
    }

    private static ImmutableSortedMultiset copyOfInternal(Comparator comparator1, Iterator iterator)
    {
        ImmutableList immutablelist = ImmutableList.copyOf(SortedIterables.sortedCounts(comparator1, iterator));
        if (immutablelist.isEmpty())
        {
            return emptyMultiset(comparator1);
        } else
        {
            verifyEntries(immutablelist);
            return RegularImmutableSortedMultiset.createFromSorted(comparator1, immutablelist);
        }
    }

    public static ImmutableSortedMultiset copyOfSorted(SortedMultiset sortedmultiset)
    {
        Comparator comparator1 = sortedmultiset.comparator();
        if (comparator1 == null)
            comparator1 = NATURAL_ORDER;
        return copyOfInternal(comparator1, sortedmultiset);
    }

    static ImmutableSortedMultiset emptyMultiset(Comparator comparator1)
    {
        if (NATURAL_ORDER.equals(comparator1))
            return NATURAL_EMPTY_MULTISET;
        else
            return new EmptyImmutableSortedMultiset(comparator1);
    }

    public static Builder naturalOrder()
    {
        return new Builder(Ordering.natural());
    }

    public static ImmutableSortedMultiset of()
    {
        return NATURAL_EMPTY_MULTISET;
    }

    public static ImmutableSortedMultiset of(Comparable comparable)
    {
        return RegularImmutableSortedMultiset.createFromSorted(NATURAL_ORDER, ImmutableList.of(Multisets.immutableEntry(Preconditions.checkNotNull(comparable), 1)));
    }

    public static ImmutableSortedMultiset of(Comparable comparable, Comparable comparable1)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1
        }));
    }

    public static ImmutableSortedMultiset of(Comparable comparable, Comparable comparable1, Comparable comparable2)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2
        }));
    }

    public static ImmutableSortedMultiset of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2, comparable3
        }));
    }

    public static ImmutableSortedMultiset of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3, Comparable comparable4)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2, comparable3, comparable4
        }));
    }

    public static transient ImmutableSortedMultiset of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3, Comparable comparable4, Comparable comparable5, Comparable acomparable[])
    {
        ArrayList arraylist = new ArrayList(6 + acomparable.length);
        Collections.addAll(arraylist, new Comparable[] {
            comparable, comparable1, comparable2, comparable3, comparable4, comparable5
        });
        Collections.addAll(arraylist, acomparable);
        return copyOf(Ordering.natural(), arraylist);
    }

    public static Builder orderedBy(Comparator comparator1)
    {
        return new Builder(comparator1);
    }

    public static Builder reverseOrder()
    {
        return new Builder(Ordering.natural().reverse());
    }

    private static void verifyEntries(Collection collection)
    {
        for (Iterator iterator = collection.iterator(); iterator.hasNext(); Preconditions.checkNotNull(((Multiset.Entry)iterator.next()).getElement()));
    }

    public Comparator comparator()
    {
        return comparator;
    }

    abstract ImmutableSortedSet createDescendingElementSet();

    abstract ImmutableSortedSet createElementSet();

    abstract UnmodifiableIterator descendingEntryIterator();

    public ImmutableSortedMultiset descendingMultiset()
    {
        Object obj = descendingMultiset;
        if (obj == null)
        {
            obj = new DescendingImmutableSortedMultiset(this);
            descendingMultiset = ((ImmutableSortedMultiset) (obj));
        }
        return ((ImmutableSortedMultiset) (obj));
    }

    public volatile SortedMultiset descendingMultiset()
    {
        return descendingMultiset();
    }

    public ImmutableSortedSet elementSet()
    {
        ImmutableSortedSet immutablesortedset = elementSet;
        if (immutablesortedset == null)
        {
            immutablesortedset = createElementSet();
            elementSet = immutablesortedset;
        }
        return immutablesortedset;
    }

    public volatile Set elementSet()
    {
        return elementSet();
    }

    public volatile SortedSet elementSet()
    {
        return elementSet();
    }

    public abstract ImmutableSortedMultiset headMultiset(Object obj, BoundType boundtype);

    public volatile SortedMultiset headMultiset(Object obj, BoundType boundtype)
    {
        return headMultiset(obj, boundtype);
    }

    public final Multiset.Entry pollFirstEntry()
    {
        throw new UnsupportedOperationException();
    }

    public Multiset.Entry pollLastEntry()
    {
        throw new UnsupportedOperationException();
    }

    Comparator reverseComparator()
    {
        Object obj = reverseComparator;
        if (obj == null)
        {
            obj = Ordering.from(comparator).reverse();
            reverseComparator = ((Comparator) (obj));
        }
        return ((Comparator) (obj));
    }

    public ImmutableSortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
    {
        return tailMultiset(obj, boundtype).headMultiset(obj1, boundtype1);
    }

    public volatile SortedMultiset subMultiset(Object obj, BoundType boundtype, Object obj1, BoundType boundtype1)
    {
        return subMultiset(obj, boundtype, obj1, boundtype1);
    }

    public abstract ImmutableSortedMultiset tailMultiset(Object obj, BoundType boundtype);

    public volatile SortedMultiset tailMultiset(Object obj, BoundType boundtype)
    {
        return tailMultiset(obj, boundtype);
    }

    Comparator unsafeComparator()
    {
        return comparator;
    }

    Object writeReplace()
    {
        return new SerializedForm(this);
    }

    static 
    {
        NATURAL_ORDER = Ordering.natural();
        NATURAL_EMPTY_MULTISET = new EmptyImmutableSortedMultiset(NATURAL_ORDER);
    }
}
