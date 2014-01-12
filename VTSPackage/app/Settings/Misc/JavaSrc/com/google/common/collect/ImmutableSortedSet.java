// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            ImmutableSortedSetFauxverideShim, SortedIterable, Ordering, EmptyImmutableSortedSet, 
//            SortedIterables, ImmutableList, RegularImmutableSortedSet, UnmodifiableIterator, 
//            ImmutableCollection, ImmutableSet

public abstract class ImmutableSortedSet extends ImmutableSortedSetFauxverideShim
    implements SortedSet, SortedIterable
{
    public static final class Builder extends ImmutableSet.Builder
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

        public volatile ImmutableSet.Builder add(Object obj)
        {
            return add(obj);
        }

        public volatile ImmutableSet.Builder add(Object aobj[])
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

        public volatile ImmutableCollection.Builder addAll(Iterator iterator1)
        {
            return addAll(iterator1);
        }

        public volatile ImmutableSet.Builder addAll(Iterable iterable)
        {
            return addAll(iterable);
        }

        public volatile ImmutableSet.Builder addAll(Iterator iterator1)
        {
            return addAll(iterator1);
        }

        public Builder addAll(Iterable iterable)
        {
            super.addAll(iterable);
            return this;
        }

        public Builder addAll(Iterator iterator1)
        {
            super.addAll(iterator1);
            return this;
        }

        public volatile ImmutableCollection build()
        {
            return build();
        }

        public volatile ImmutableSet build()
        {
            return build();
        }

        public ImmutableSortedSet build()
        {
            return ImmutableSortedSet.copyOfInternal(comparator, super.contents.iterator());
        }

        public Builder(Comparator comparator1)
        {
            comparator = (Comparator)Preconditions.checkNotNull(comparator1);
        }
    }

    private static class SerializedForm
        implements Serializable
    {

        private static final long serialVersionUID;
        final Comparator comparator;
        final Object elements[];

        Object readResolve()
        {
            return (new Builder(comparator)).add((Object[])elements).build();
        }

        public SerializedForm(Comparator comparator1, Object aobj[])
        {
            comparator = comparator1;
            elements = aobj;
        }
    }


    private static final ImmutableSortedSet NATURAL_EMPTY_SET;
    private static final Comparator NATURAL_ORDER;
    final transient Comparator comparator;

    ImmutableSortedSet(Comparator comparator1)
    {
        comparator = comparator1;
    }

    public static ImmutableSortedSet copyOf(Iterable iterable)
    {
        return copyOf(((Comparator) (Ordering.natural())), iterable);
    }

    public static ImmutableSortedSet copyOf(Collection collection)
    {
        return copyOf(((Comparator) (Ordering.natural())), collection);
    }

    public static ImmutableSortedSet copyOf(Comparator comparator1, Iterable iterable)
    {
        Preconditions.checkNotNull(comparator1);
        return copyOfInternal(comparator1, iterable);
    }

    public static ImmutableSortedSet copyOf(Comparator comparator1, Collection collection)
    {
        Preconditions.checkNotNull(comparator1);
        return copyOfInternal(comparator1, collection);
    }

    public static ImmutableSortedSet copyOf(Comparator comparator1, Iterator iterator1)
    {
        Preconditions.checkNotNull(comparator1);
        return copyOfInternal(comparator1, iterator1);
    }

    public static ImmutableSortedSet copyOf(Iterator iterator1)
    {
        return copyOfInternal(Ordering.natural(), iterator1);
    }

    public static ImmutableSortedSet copyOf(Comparable acomparable[])
    {
        return copyOf(((Comparator) (Ordering.natural())), ((Collection) (Arrays.asList(acomparable))));
    }

    private static ImmutableSortedSet copyOfInternal(Comparator comparator1, Iterable iterable)
    {
        if (SortedIterables.hasSameComparator(comparator1, iterable) && (iterable instanceof ImmutableSortedSet))
        {
            ImmutableSortedSet immutablesortedset = (ImmutableSortedSet)iterable;
            if (!immutablesortedset.isPartialView())
                return immutablesortedset;
        }
        ImmutableList immutablelist = ImmutableList.copyOf(SortedIterables.sortedUnique(comparator1, iterable));
        Object obj;
        if (immutablelist.isEmpty())
            obj = emptySet(comparator1);
        else
            obj = new RegularImmutableSortedSet(immutablelist, comparator1);
        return ((ImmutableSortedSet) (obj));
    }

    private static ImmutableSortedSet copyOfInternal(Comparator comparator1, Iterator iterator1)
    {
        ImmutableList immutablelist = ImmutableList.copyOf(SortedIterables.sortedUnique(comparator1, iterator1));
        if (immutablelist.isEmpty())
            return emptySet(comparator1);
        else
            return new RegularImmutableSortedSet(immutablelist, comparator1);
    }

    public static ImmutableSortedSet copyOfSorted(SortedSet sortedset)
    {
        Comparator comparator1 = sortedset.comparator();
        if (comparator1 == null)
            comparator1 = NATURAL_ORDER;
        return copyOfInternal(comparator1, sortedset);
    }

    private static ImmutableSortedSet emptySet()
    {
        return NATURAL_EMPTY_SET;
    }

    static ImmutableSortedSet emptySet(Comparator comparator1)
    {
        if (NATURAL_ORDER.equals(comparator1))
            return emptySet();
        else
            return new EmptyImmutableSortedSet(comparator1);
    }

    public static Builder naturalOrder()
    {
        return new Builder(Ordering.natural());
    }

    public static ImmutableSortedSet of()
    {
        return emptySet();
    }

    public static ImmutableSortedSet of(Comparable comparable)
    {
        return new RegularImmutableSortedSet(ImmutableList.of(comparable), Ordering.natural());
    }

    public static ImmutableSortedSet of(Comparable comparable, Comparable comparable1)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1
        }));
    }

    public static ImmutableSortedSet of(Comparable comparable, Comparable comparable1, Comparable comparable2)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2
        }));
    }

    public static ImmutableSortedSet of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2, comparable3
        }));
    }

    public static ImmutableSortedSet of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3, Comparable comparable4)
    {
        return copyOf(Ordering.natural(), Arrays.asList(new Comparable[] {
            comparable, comparable1, comparable2, comparable3, comparable4
        }));
    }

    public static transient ImmutableSortedSet of(Comparable comparable, Comparable comparable1, Comparable comparable2, Comparable comparable3, Comparable comparable4, Comparable comparable5, Comparable acomparable[])
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

    private void readObject(ObjectInputStream objectinputstream)
        throws InvalidObjectException
    {
        throw new InvalidObjectException("Use SerializedForm");
    }

    public static Builder reverseOrder()
    {
        return new Builder(Ordering.natural().reverse());
    }

    static int unsafeCompare(Comparator comparator1, Object obj, Object obj1)
    {
        return comparator1.compare(obj, obj1);
    }

    public Comparator comparator()
    {
        return comparator;
    }

    public ImmutableSortedSet headSet(Object obj)
    {
        return headSet(obj, false);
    }

    ImmutableSortedSet headSet(Object obj, boolean flag)
    {
        return headSetImpl(Preconditions.checkNotNull(obj), flag);
    }

    public volatile SortedSet headSet(Object obj)
    {
        return headSet(obj);
    }

    abstract ImmutableSortedSet headSetImpl(Object obj, boolean flag);

    abstract int indexOf(Object obj);

    public abstract UnmodifiableIterator iterator();

    public volatile Iterator iterator()
    {
        return iterator();
    }

    public ImmutableSortedSet subSet(Object obj, Object obj1)
    {
        return subSet(obj, true, obj1, false);
    }

    ImmutableSortedSet subSet(Object obj, boolean flag, Object obj1, boolean flag1)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        boolean flag2;
        if (comparator.compare(obj, obj1) <= 0)
            flag2 = true;
        else
            flag2 = false;
        Preconditions.checkArgument(flag2);
        return subSetImpl(obj, flag, obj1, flag1);
    }

    public volatile SortedSet subSet(Object obj, Object obj1)
    {
        return subSet(obj, obj1);
    }

    abstract ImmutableSortedSet subSetImpl(Object obj, boolean flag, Object obj1, boolean flag1);

    public ImmutableSortedSet tailSet(Object obj)
    {
        return tailSet(obj, true);
    }

    ImmutableSortedSet tailSet(Object obj, boolean flag)
    {
        return tailSetImpl(Preconditions.checkNotNull(obj), flag);
    }

    public volatile SortedSet tailSet(Object obj)
    {
        return tailSet(obj);
    }

    abstract ImmutableSortedSet tailSetImpl(Object obj, boolean flag);

    int unsafeCompare(Object obj, Object obj1)
    {
        return unsafeCompare(comparator, obj, obj1);
    }

    Object writeReplace()
    {
        return new SerializedForm(comparator, toArray());
    }

    static 
    {
        NATURAL_ORDER = Ordering.natural();
        NATURAL_EMPTY_SET = new EmptyImmutableSortedSet(NATURAL_ORDER);
    }

}
