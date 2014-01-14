// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Collections2, Iterators, ImmutableList, Lists, 
//            Multiset, ObjectArrays, ImmutableCollection, UnmodifiableIterator, 
//            AbstractIterator

public final class Iterables
{
    private static class ConsumingQueueIterator extends AbstractIterator
    {

        private final Queue queue;

        public Object computeNext()
        {
            Object obj;
            try
            {
                obj = queue.remove();
            }
            catch (NoSuchElementException nosuchelementexception)
            {
                return endOfData();
            }
            return obj;
        }

        private ConsumingQueueIterator(Queue queue1)
        {
            queue = queue1;
        }

    }

    static abstract class IterableWithToString
        implements Iterable
    {

        public String toString()
        {
            return Iterables.toString(this);
        }

    }

    private static final class UnmodifiableIterable
        implements Iterable
    {

        private final Iterable iterable;

        public Iterator iterator()
        {
            return Iterators.unmodifiableIterator(iterable.iterator());
        }

        public String toString()
        {
            return iterable.toString();
        }

        private UnmodifiableIterable(Iterable iterable1)
        {
            iterable = iterable1;
        }

    }


    private Iterables()
    {
    }

    public static boolean addAll(Collection collection, Iterable iterable)
    {
        if (iterable instanceof Collection)
            return collection.addAll(Collections2.cast(iterable));
        else
            return Iterators.addAll(collection, iterable.iterator());
    }

    public static boolean all(Iterable iterable, Predicate predicate)
    {
        return Iterators.all(iterable.iterator(), predicate);
    }

    public static boolean any(Iterable iterable, Predicate predicate)
    {
        return Iterators.any(iterable.iterator(), predicate);
    }

    private static void checkNonnegativeIndex(int i)
    {
        if (i < 0)
            throw new IndexOutOfBoundsException((new StringBuilder()).append("position cannot be negative: ").append(i).toString());
        else
            return;
    }

    public static Iterable concat(Iterable iterable)
    {
        Preconditions.checkNotNull(iterable);
        return new IterableWithToString(iterable) {

            final Iterable val$inputs;

            public Iterator iterator()
            {
                return Iterators.concat(Iterables.iterators(inputs));
            }

            
            {
                inputs = iterable;
                super();
            }
        }
;
    }

    public static Iterable concat(Iterable iterable, Iterable iterable1)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(iterable1);
        return concat(((Iterable) (Arrays.asList(new Iterable[] {
            iterable, iterable1
        }))));
    }

    public static Iterable concat(Iterable iterable, Iterable iterable1, Iterable iterable2)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(iterable1);
        Preconditions.checkNotNull(iterable2);
        return concat(((Iterable) (Arrays.asList(new Iterable[] {
            iterable, iterable1, iterable2
        }))));
    }

    public static Iterable concat(Iterable iterable, Iterable iterable1, Iterable iterable2, Iterable iterable3)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(iterable1);
        Preconditions.checkNotNull(iterable2);
        Preconditions.checkNotNull(iterable3);
        return concat(((Iterable) (Arrays.asList(new Iterable[] {
            iterable, iterable1, iterable2, iterable3
        }))));
    }

    public static transient Iterable concat(Iterable aiterable[])
    {
        return concat(((Iterable) (ImmutableList.copyOf(aiterable))));
    }

    public static Iterable consumingIterable(Iterable iterable)
    {
        if (iterable instanceof Queue)
        {
            return new Iterable(iterable) {

                final Iterable val$iterable;

                public Iterator iterator()
                {
                    return new ConsumingQueueIterator((Queue)iterable);
                }

            
            {
                iterable = iterable1;
                super();
            }
            }
;
        } else
        {
            Preconditions.checkNotNull(iterable);
            return new Iterable(iterable) {

                final Iterable val$iterable;

                public Iterator iterator()
                {
                    return Iterators.consumingIterator(iterable.iterator());
                }

            
            {
                iterable = iterable1;
                super();
            }
            }
;
        }
    }

    public static boolean contains(Iterable iterable, Object obj)
    {
        if (iterable instanceof Collection)
        {
            Collection collection = (Collection)iterable;
            boolean flag;
            try
            {
                flag = collection.contains(obj);
            }
            catch (NullPointerException nullpointerexception)
            {
                return false;
            }
            catch (ClassCastException classcastexception)
            {
                return false;
            }
            return flag;
        } else
        {
            return Iterators.contains(iterable.iterator(), obj);
        }
    }

    public static Iterable cycle(Iterable iterable)
    {
        Preconditions.checkNotNull(iterable);
        return new Iterable(iterable) {

            final Iterable val$iterable;

            public Iterator iterator()
            {
                return Iterators.cycle(iterable);
            }

            public String toString()
            {
                return (new StringBuilder()).append(iterable.toString()).append(" (cycled)").toString();
            }

            
            {
                iterable = iterable1;
                super();
            }
        }
;
    }

    public static transient Iterable cycle(Object aobj[])
    {
        return cycle(((Iterable) (Lists.newArrayList(aobj))));
    }

    public static boolean elementsEqual(Iterable iterable, Iterable iterable1)
    {
        return Iterators.elementsEqual(iterable.iterator(), iterable1.iterator());
    }

    public static Iterable filter(Iterable iterable, Predicate predicate)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(predicate);
        return new IterableWithToString(iterable, predicate) {

            final Predicate val$predicate;
            final Iterable val$unfiltered;

            public Iterator iterator()
            {
                return Iterators.filter(unfiltered.iterator(), predicate);
            }

            
            {
                unfiltered = iterable;
                predicate = predicate1;
                super();
            }
        }
;
    }

    public static Iterable filter(Iterable iterable, Class class1)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(class1);
        return new IterableWithToString(iterable, class1) {

            final Class val$type;
            final Iterable val$unfiltered;

            public Iterator iterator()
            {
                return Iterators.filter(unfiltered.iterator(), type);
            }

            
            {
                unfiltered = iterable;
                type = class1;
                super();
            }
        }
;
    }

    public static Object find(Iterable iterable, Predicate predicate)
    {
        return Iterators.find(iterable.iterator(), predicate);
    }

    public static Object find(Iterable iterable, Predicate predicate, Object obj)
    {
        return Iterators.find(iterable.iterator(), predicate, obj);
    }

    public static int frequency(Iterable iterable, Object obj)
    {
        if (iterable instanceof Multiset)
            return ((Multiset)iterable).count(obj);
        if (iterable instanceof Set)
            return !((Set)iterable).contains(obj) ? 0 : 1;
        else
            return Iterators.frequency(iterable.iterator(), obj);
    }

    public static Object get(Iterable iterable, int i)
    {
        Preconditions.checkNotNull(iterable);
        if (iterable instanceof List)
            return ((List)iterable).get(i);
        if (iterable instanceof Collection)
            Preconditions.checkElementIndex(i, ((Collection)iterable).size());
        else
            checkNonnegativeIndex(i);
        return Iterators.get(iterable.iterator(), i);
    }

    public static Object get(Iterable iterable, int i, Object obj)
    {
        Preconditions.checkNotNull(iterable);
        checkNonnegativeIndex(i);
        Object obj1;
        try
        {
            obj1 = get(iterable, i);
        }
        catch (IndexOutOfBoundsException indexoutofboundsexception)
        {
            return obj;
        }
        return obj1;
    }

    public static Object getFirst(Iterable iterable, Object obj)
    {
        return Iterators.getNext(iterable.iterator(), obj);
    }

    public static Object getLast(Iterable iterable)
    {
        if (iterable instanceof List)
        {
            List list = (List)iterable;
            if (list.isEmpty())
                throw new NoSuchElementException();
            else
                return getLastInNonemptyList(list);
        }
        if (iterable instanceof SortedSet)
            return ((SortedSet)iterable).last();
        else
            return Iterators.getLast(iterable.iterator());
    }

    public static Object getLast(Iterable iterable, Object obj)
    {
        if ((iterable instanceof Collection) && ((Collection)iterable).isEmpty())
            return obj;
        if (iterable instanceof List)
            return getLastInNonemptyList((List)iterable);
        if (iterable instanceof SortedSet)
            return ((SortedSet)iterable).last();
        else
            return Iterators.getLast(iterable.iterator(), obj);
    }

    private static Object getLastInNonemptyList(List list)
    {
        return list.get(-1 + list.size());
    }

    public static Object getOnlyElement(Iterable iterable)
    {
        return Iterators.getOnlyElement(iterable.iterator());
    }

    public static Object getOnlyElement(Iterable iterable, Object obj)
    {
        return Iterators.getOnlyElement(iterable.iterator(), obj);
    }

    public static int indexOf(Iterable iterable, Predicate predicate)
    {
        return Iterators.indexOf(iterable.iterator(), predicate);
    }

    public static boolean isEmpty(Iterable iterable)
    {
        if (iterable instanceof Collection)
            return ((Collection)iterable).isEmpty();
        return !iterable.iterator().hasNext();
    }

    private static UnmodifiableIterator iterators(Iterable iterable)
    {
        return new UnmodifiableIterator(iterable.iterator()) {

            final Iterator val$iterableIterator;

            public boolean hasNext()
            {
                return iterableIterator.hasNext();
            }

            public volatile Object next()
            {
                return next();
            }

            public Iterator next()
            {
                return ((Iterable)iterableIterator.next()).iterator();
            }

            
            {
                iterableIterator = iterator;
                super();
            }
        }
;
    }

    public static Iterable limit(Iterable iterable, int i)
    {
        Preconditions.checkNotNull(iterable);
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "limit is negative");
        return new IterableWithToString(iterable, i) {

            final Iterable val$iterable;
            final int val$limitSize;

            public Iterator iterator()
            {
                return Iterators.limit(iterable.iterator(), limitSize);
            }

            
            {
                iterable = iterable1;
                limitSize = i;
                super();
            }
        }
;
    }

    public static Iterable mergeSorted(Iterable iterable, Comparator comparator)
    {
        Preconditions.checkNotNull(iterable, "iterables");
        Preconditions.checkNotNull(comparator, "comparator");
        return new UnmodifiableIterable(new Iterable(iterable, comparator) {

            final Comparator val$comparator;
            final Iterable val$iterables;

            public Iterator iterator()
            {
                return Iterators.mergeSorted(Iterables.transform(iterables, Iterables.toIterator()), comparator);
            }

            
            {
                iterables = iterable;
                comparator = comparator1;
                super();
            }
        }
);
    }

    public static Iterable paddedPartition(Iterable iterable, int i)
    {
        Preconditions.checkNotNull(iterable);
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return new IterableWithToString(iterable, i) {

            final Iterable val$iterable;
            final int val$size;

            public Iterator iterator()
            {
                return Iterators.paddedPartition(iterable.iterator(), size);
            }

            
            {
                iterable = iterable1;
                size = i;
                super();
            }
        }
;
    }

    public static Iterable partition(Iterable iterable, int i)
    {
        Preconditions.checkNotNull(iterable);
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        return new IterableWithToString(iterable, i) {

            final Iterable val$iterable;
            final int val$size;

            public Iterator iterator()
            {
                return Iterators.partition(iterable.iterator(), size);
            }

            
            {
                iterable = iterable1;
                size = i;
                super();
            }
        }
;
    }

    static boolean remove(Iterable iterable, Object obj)
    {
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
            if (Objects.equal(iterator.next(), obj))
            {
                iterator.remove();
                return true;
            }

        return false;
    }

    public static boolean removeAll(Iterable iterable, Collection collection)
    {
        if (iterable instanceof Collection)
            return ((Collection)iterable).removeAll((Collection)Preconditions.checkNotNull(collection));
        else
            return Iterators.removeAll(iterable.iterator(), collection);
    }

    public static boolean removeIf(Iterable iterable, Predicate predicate)
    {
        if ((iterable instanceof RandomAccess) && (iterable instanceof List))
            return removeIfFromRandomAccessList((List)iterable, (Predicate)Preconditions.checkNotNull(predicate));
        else
            return Iterators.removeIf(iterable.iterator(), predicate);
    }

    private static boolean removeIfFromRandomAccessList(List list, Predicate predicate)
    {
        int i;
        int j;
        i = 0;
        j = 0;
_L2:
        Object obj;
        if (i >= list.size())
            break; /* Loop/switch isn't completed */
        obj = list.get(i);
        if (predicate.apply(obj))
            break MISSING_BLOCK_LABEL_52;
        if (i <= j)
            break MISSING_BLOCK_LABEL_49;
        list.set(j, obj);
        j++;
        i++;
        if (true) goto _L2; else goto _L1
        UnsupportedOperationException unsupportedoperationexception;
        unsupportedoperationexception;
        slowRemoveIfForRemainingElements(list, predicate, j, i);
_L4:
        return true;
_L1:
        list.subList(j, list.size()).clear();
        if (i == j)
            return false;
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static boolean retainAll(Iterable iterable, Collection collection)
    {
        if (iterable instanceof Collection)
            return ((Collection)iterable).retainAll((Collection)Preconditions.checkNotNull(collection));
        else
            return Iterators.retainAll(iterable.iterator(), collection);
    }

    public static Iterable reverse(List list)
    {
        return Lists.reverse(list);
    }

    public static int size(Iterable iterable)
    {
        if (iterable instanceof Collection)
            return ((Collection)iterable).size();
        else
            return Iterators.size(iterable.iterator());
    }

    public static Iterable skip(Iterable iterable, int i)
    {
        Preconditions.checkNotNull(iterable);
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "number to skip cannot be negative");
        if (iterable instanceof List)
            return new IterableWithToString(i, (List)iterable) {

                final List val$list;
                final int val$numberToSkip;

                public Iterator iterator()
                {
                    if (numberToSkip >= list.size())
                        return Iterators.emptyIterator();
                    else
                        return list.subList(numberToSkip, list.size()).iterator();
                }

            
            {
                numberToSkip = i;
                list = list1;
                super();
            }
            }
;
        else
            return new IterableWithToString(iterable, i) {

                final Iterable val$iterable;
                final int val$numberToSkip;

                public Iterator iterator()
                {
                    Iterator iterator1 = iterable.iterator();
                    Iterators.skip(iterator1, numberToSkip);
                    return iterator1. new Iterator() {

                        boolean atStart;
                        final _cls10 this$0;
                        final Iterator val$iterator;

                        public boolean hasNext()
                        {
                            return iterator.hasNext();
                        }

                        public Object next()
                        {
                            if (!hasNext())
                                throw new NoSuchElementException();
                            Object obj = iterator.next();
                            atStart = false;
                            return obj;
                            Exception exception;
                            exception;
                            atStart = false;
                            throw exception;
                        }

                        public void remove()
                        {
                            if (atStart)
                            {
                                throw new IllegalStateException();
                            } else
                            {
                                iterator.remove();
                                return;
                            }
                        }

            
            {
                this$0 = final__pcls10;
                iterator = Iterator.this;
                super();
                atStart = true;
            }
                    }
;
                }

            
            {
                iterable = iterable1;
                numberToSkip = i;
                super();
            }
            }
;
    }

    private static void slowRemoveIfForRemainingElements(List list, Predicate predicate, int i, int j)
    {
        for (int k = -1 + list.size(); k > j; k--)
            if (predicate.apply(list.get(k)))
                list.remove(k);

        for (int l = j - 1; l >= i; l--)
            list.remove(l);

    }

    static Object[] toArray(Iterable iterable)
    {
        return toCollection(iterable).toArray();
    }

    public static Object[] toArray(Iterable iterable, Class class1)
    {
        Collection collection = toCollection(iterable);
        return collection.toArray(ObjectArrays.newArray(class1, collection.size()));
    }

    private static Collection toCollection(Iterable iterable)
    {
        if (iterable instanceof Collection)
            return (Collection)iterable;
        else
            return Lists.newArrayList(iterable.iterator());
    }

    private static Function toIterator()
    {
        return new Function() {

            public volatile Object apply(Object obj)
            {
                return apply((Iterable)obj);
            }

            public Iterator apply(Iterable iterable)
            {
                return iterable.iterator();
            }

        }
;
    }

    public static String toString(Iterable iterable)
    {
        return Iterators.toString(iterable.iterator());
    }

    public static Iterable transform(Iterable iterable, Function function)
    {
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(function);
        return new IterableWithToString(iterable, function) {

            final Iterable val$fromIterable;
            final Function val$function;

            public Iterator iterator()
            {
                return Iterators.transform(fromIterable.iterator(), function);
            }

            
            {
                fromIterable = iterable;
                function = function1;
                super();
            }
        }
;
    }

    public static Optional tryFind(Iterable iterable, Predicate predicate)
    {
        return Iterators.tryFind(iterable.iterator(), predicate);
    }

    public static Iterable unmodifiableIterable(ImmutableCollection immutablecollection)
    {
        return (Iterable)Preconditions.checkNotNull(immutablecollection);
    }

    public static Iterable unmodifiableIterable(Iterable iterable)
    {
        Preconditions.checkNotNull(iterable);
        if (!(iterable instanceof UnmodifiableIterable) && !(iterable instanceof ImmutableCollection))
            return new UnmodifiableIterable(iterable);
        else
            return iterable;
    }


}
