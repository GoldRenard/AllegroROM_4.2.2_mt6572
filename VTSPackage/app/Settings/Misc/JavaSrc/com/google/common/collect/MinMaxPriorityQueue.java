// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.util.*;

// Referenced classes of package com.google.common.collect:
//            Ordering

public final class MinMaxPriorityQueue extends AbstractQueue
{
    public static final class Builder
    {

        private static final int UNSET_EXPECTED_SIZE = -1;
        private final Comparator comparator;
        private int expectedSize;
        private int maximumSize;

        private Ordering ordering()
        {
            return Ordering.from(comparator);
        }

        public MinMaxPriorityQueue create()
        {
            return create(((Iterable) (Collections.emptySet())));
        }

        public MinMaxPriorityQueue create(Iterable iterable)
        {
            MinMaxPriorityQueue minmaxpriorityqueue = new MinMaxPriorityQueue(this, MinMaxPriorityQueue.initialQueueSize(expectedSize, maximumSize, iterable));
            for (Iterator iterator1 = iterable.iterator(); iterator1.hasNext(); minmaxpriorityqueue.offer(iterator1.next()));
            return minmaxpriorityqueue;
        }

        public Builder expectedSize(int i)
        {
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            expectedSize = i;
            return this;
        }

        public Builder maximumSize(int i)
        {
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkArgument(flag);
            maximumSize = i;
            return this;
        }



        private Builder(Comparator comparator1)
        {
            expectedSize = -1;
            maximumSize = 0x7fffffff;
            comparator = (Comparator)Preconditions.checkNotNull(comparator1);
        }

    }

    private class Heap
    {

        final Ordering ordering;
        Heap otherHeap;
        final MinMaxPriorityQueue this$0;

        private int getGrandparentIndex(int i)
        {
            return getParentIndex(getParentIndex(i));
        }

        private int getLeftChildIndex(int i)
        {
            return 1 + i * 2;
        }

        private int getParentIndex(int i)
        {
            return (i - 1) / 2;
        }

        private int getRightChildIndex(int i)
        {
            return 2 + i * 2;
        }

        private boolean verifyIndex(int i)
        {
            return (getLeftChildIndex(i) >= size || compareElements(i, getLeftChildIndex(i)) <= 0) && (getRightChildIndex(i) >= size || compareElements(i, getRightChildIndex(i)) <= 0) && (i <= 0 || compareElements(i, getParentIndex(i)) <= 0) && (i <= 2 || compareElements(getGrandparentIndex(i), i) <= 0);
        }

        void bubbleUp(int i, Object obj)
        {
            int j = crossOverUp(i, obj);
            Heap heap;
            if (j == i)
            {
                heap = this;
            } else
            {
                i = j;
                heap = otherHeap;
            }
            heap.bubbleUpAlternatingLevels(i, obj);
        }

        int bubbleUpAlternatingLevels(int i, Object obj)
        {
            do
            {
                if (i <= 2)
                    break;
                int j = getGrandparentIndex(i);
                Object obj1 = elementData(j);
                if (ordering.compare(obj1, obj) <= 0)
                    break;
                queue[i] = obj1;
                i = j;
            } while (true);
            queue[i] = obj;
            return i;
        }

        int compareElements(int i, int j)
        {
            return ordering.compare(elementData(i), elementData(j));
        }

        int crossOver(int i, Object obj)
        {
            int j = findMinChild(i);
            if (j > 0 && ordering.compare(elementData(j), obj) < 0)
            {
                queue[i] = elementData(j);
                queue[j] = obj;
                return j;
            } else
            {
                return crossOverUp(i, obj);
            }
        }

        int crossOverUp(int i, Object obj)
        {
            if (i == 0)
            {
                queue[0] = obj;
                return 0;
            }
            int j = getParentIndex(i);
            Object obj1 = elementData(j);
            if (j != 0)
            {
                int k = getRightChildIndex(getParentIndex(j));
                if (k != j && getLeftChildIndex(k) >= size)
                {
                    Object obj2 = elementData(k);
                    if (ordering.compare(obj2, obj1) < 0)
                    {
                        j = k;
                        obj1 = obj2;
                    }
                }
            }
            if (ordering.compare(obj1, obj) < 0)
            {
                queue[i] = obj1;
                queue[j] = obj;
                return j;
            } else
            {
                queue[i] = obj;
                return i;
            }
        }

        int fillHoleAt(int i)
        {
            do
            {
                int j = findMinGrandChild(i);
                if (j > 0)
                {
                    queue[i] = elementData(j);
                    i = j;
                } else
                {
                    return i;
                }
            } while (true);
        }

        int findMin(int i, int j)
        {
            int l;
            if (i >= size)
            {
                l = -1;
            } else
            {
                boolean flag;
                if (i > 0)
                    flag = true;
                else
                    flag = false;
                Preconditions.checkState(flag);
                int k = j + Math.min(i, size - j);
                l = i;
                for (int i1 = i + 1; i1 < k; i1++)
                    if (compareElements(i1, l) < 0)
                        l = i1;

            }
            return l;
        }

        int findMinChild(int i)
        {
            return findMin(getLeftChildIndex(i), 2);
        }

        int findMinGrandChild(int i)
        {
            int j = getLeftChildIndex(i);
            if (j < 0)
                return -1;
            else
                return findMin(getLeftChildIndex(j), 4);
        }

        int getCorrectLastElement(Object obj)
        {
            int i = getParentIndex(size);
            if (i != 0)
            {
                int j = getRightChildIndex(getParentIndex(i));
                if (j != i && getLeftChildIndex(j) >= size)
                {
                    Object obj1 = elementData(j);
                    if (ordering.compare(obj1, obj) < 0)
                    {
                        queue[j] = obj;
                        queue[size] = obj1;
                        return j;
                    }
                }
            }
            return size;
        }

        MoveDesc tryCrossOverAndBubbleUp(int i, int j, Object obj)
        {
            int k = crossOver(j, obj);
            if (k != j)
            {
                Object obj1;
                if (k < i)
                    obj1 = elementData(i);
                else
                    obj1 = elementData(getParentIndex(i));
                if (otherHeap.bubbleUpAlternatingLevels(k, obj) < i)
                    return new MoveDesc(obj, obj1);
            }
            return null;
        }


        Heap(Ordering ordering1)
        {
            this$0 = MinMaxPriorityQueue.this;
            super();
            ordering = ordering1;
        }
    }

    static class MoveDesc
    {

        final Object replaced;
        final Object toTrickle;

        MoveDesc(Object obj, Object obj1)
        {
            toTrickle = obj;
            replaced = obj1;
        }
    }

    private class QueueIterator
        implements Iterator
    {

        private boolean canRemove;
        private int cursor;
        private int expectedModCount;
        private Queue forgetMeNot;
        private Object lastFromForgetMeNot;
        private List skipMe;
        final MinMaxPriorityQueue this$0;

        private boolean containsExact(Iterable iterable, Object obj)
        {
            for (Iterator iterator1 = iterable.iterator(); iterator1.hasNext();)
                if (iterator1.next() == obj)
                    return true;

            return false;
        }

        private int nextNotInSkipMe(int i)
        {
            if (skipMe != null)
                for (; i < size() && containsExact(skipMe, elementData(i)); i++);
            return i;
        }

        void checkModCount()
        {
            if (modCount != expectedModCount)
                throw new ConcurrentModificationException();
            else
                return;
        }

        public boolean hasNext()
        {
            checkModCount();
            return nextNotInSkipMe(1 + cursor) < size() || forgetMeNot != null && !forgetMeNot.isEmpty();
        }

        public Object next()
        {
            checkModCount();
            int i = nextNotInSkipMe(1 + cursor);
            if (i < size())
            {
                cursor = i;
                canRemove = true;
                return elementData(cursor);
            }
            if (forgetMeNot != null)
            {
                cursor = size();
                lastFromForgetMeNot = forgetMeNot.poll();
                if (lastFromForgetMeNot != null)
                {
                    canRemove = true;
                    return lastFromForgetMeNot;
                }
            }
            throw new NoSuchElementException("iterator moved past last element in queue.");
        }

        public void remove()
        {
            Preconditions.checkState(canRemove, "no calls to remove() since the last call to next()");
            checkModCount();
            canRemove = false;
            expectedModCount = 1 + expectedModCount;
            if (cursor < size())
            {
                MoveDesc movedesc = removeAt(cursor);
                if (movedesc != null)
                {
                    if (forgetMeNot == null)
                    {
                        forgetMeNot = new LinkedList();
                        skipMe = new ArrayList(3);
                    }
                    forgetMeNot.add(movedesc.toTrickle);
                    skipMe.add(movedesc.replaced);
                }
                cursor = -1 + cursor;
                return;
            } else
            {
                Preconditions.checkState(removeExact(lastFromForgetMeNot));
                lastFromForgetMeNot = null;
                return;
            }
        }

        boolean removeExact(Object obj)
        {
            for (int i = 0; i < size; i++)
                if (queue[i] == obj)
                {
                    removeAt(i);
                    return true;
                }

            return false;
        }

        private QueueIterator()
        {
            this$0 = MinMaxPriorityQueue.this;
            super();
            cursor = -1;
            expectedModCount = modCount;
        }

    }


    private static final int DEFAULT_CAPACITY = 11;
    private static final int EVEN_POWERS_OF_TWO = 0x55555555;
    private static final int ODD_POWERS_OF_TWO = 0xaaaaaaaa;
    private final Heap maxHeap;
    final int maximumSize;
    private final Heap minHeap;
    private int modCount;
    private Object queue[];
    private int size;

    private MinMaxPriorityQueue(Builder builder, int i)
    {
        Ordering ordering = builder.ordering();
        minHeap = new Heap(ordering);
        maxHeap = new Heap(ordering.reverse());
        minHeap.otherHeap = maxHeap;
        maxHeap.otherHeap = minHeap;
        maximumSize = builder.maximumSize;
        queue = new Object[i];
    }


    private int calculateNewCapacity()
    {
        int i = queue.length;
        int j;
        if (i < 64)
            j = 2 * (i + 1);
        else
            j = IntMath.checkedMultiply(i / 2, 3);
        return capAtMaximumSize(j, maximumSize);
    }

    private static int capAtMaximumSize(int i, int j)
    {
        return 1 + Math.min(i - 1, j);
    }

    public static MinMaxPriorityQueue create()
    {
        return (new Builder(Ordering.natural())).create();
    }

    public static MinMaxPriorityQueue create(Iterable iterable)
    {
        return (new Builder(Ordering.natural())).create(iterable);
    }

    public static Builder expectedSize(int i)
    {
        return (new Builder(Ordering.natural())).expectedSize(i);
    }

    private MoveDesc fillHole(int i, Object obj)
    {
        Heap heap = heapForIndex(i);
        int j = heap.fillHoleAt(i);
        int k = heap.bubbleUpAlternatingLevels(j, obj);
        if (k == j)
            return heap.tryCrossOverAndBubbleUp(i, j, obj);
        if (k < i)
            return new MoveDesc(obj, elementData(i));
        else
            return null;
    }

    private int getMaxElementIndex()
    {
        switch (size)
        {
        case 1: // '\001'
            return 0;

        default:
            if (maxHeap.compareElements(1, 2) > 0)
                return 2;
            // fall through

        case 2: // '\002'
            return 1;
        }
    }

    private void growIfNeeded()
    {
        if (size > queue.length)
        {
            Object aobj[] = new Object[calculateNewCapacity()];
            System.arraycopy(((Object) (queue)), 0, ((Object) (aobj)), 0, queue.length);
            queue = aobj;
        }
    }

    private Heap heapForIndex(int i)
    {
        if (isEvenLevel(i))
            return minHeap;
        else
            return maxHeap;
    }

    static int initialQueueSize(int i, int j, Iterable iterable)
    {
        int k;
        if (i == -1)
            k = 11;
        else
            k = i;
        if (iterable instanceof Collection)
            k = Math.max(k, ((Collection)iterable).size());
        return capAtMaximumSize(k, j);
    }

    static boolean isEvenLevel(int i)
    {
        int j = i + 1;
        boolean flag;
        if (j > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkState(flag, "negative index");
        return (0x55555555 & j) > (0xaaaaaaaa & j);
    }

    public static Builder maximumSize(int i)
    {
        return (new Builder(Ordering.natural())).maximumSize(i);
    }

    public static Builder orderedBy(Comparator comparator1)
    {
        return new Builder(comparator1);
    }

    private Object removeAndGet(int i)
    {
        Object obj = elementData(i);
        removeAt(i);
        return obj;
    }

    public boolean add(Object obj)
    {
        offer(obj);
        return true;
    }

    public boolean addAll(Collection collection)
    {
        boolean flag = false;
        for (Iterator iterator1 = collection.iterator(); iterator1.hasNext();)
        {
            offer(iterator1.next());
            flag = true;
        }

        return flag;
    }

    int capacity()
    {
        return queue.length;
    }

    public void clear()
    {
        for (int i = 0; i < size; i++)
            queue[i] = null;

        size = 0;
    }

    public Comparator comparator()
    {
        return minHeap.ordering;
    }

    Object elementData(int i)
    {
        return queue[i];
    }

    boolean isIntact()
    {
        for (int i = 1; i < size; i++)
            if (!heapForIndex(i).verifyIndex(i))
                return false;

        return true;
    }

    public Iterator iterator()
    {
        return new QueueIterator();
    }

    public boolean offer(Object obj)
    {
        Preconditions.checkNotNull(obj);
        modCount = 1 + modCount;
        int i = size;
        size = i + 1;
        growIfNeeded();
        heapForIndex(i).bubbleUp(i, obj);
        return size <= maximumSize || pollLast() != obj;
    }

    public Object peek()
    {
        if (isEmpty())
            return null;
        else
            return elementData(0);
    }

    public Object peekFirst()
    {
        return peek();
    }

    public Object peekLast()
    {
        if (isEmpty())
            return null;
        else
            return elementData(getMaxElementIndex());
    }

    public Object poll()
    {
        if (isEmpty())
            return null;
        else
            return removeAndGet(0);
    }

    public Object pollFirst()
    {
        return poll();
    }

    public Object pollLast()
    {
        if (isEmpty())
            return null;
        else
            return removeAndGet(getMaxElementIndex());
    }

    MoveDesc removeAt(int i)
    {
        MoveDesc movedesc = null;
        Preconditions.checkPositionIndex(i, size);
        modCount = 1 + modCount;
        size = -1 + size;
        if (size == i)
        {
            queue[size] = null;
        } else
        {
            Object obj = elementData(size);
            int j = heapForIndex(size).getCorrectLastElement(obj);
            Object obj1 = elementData(size);
            queue[size] = null;
            movedesc = fillHole(i, obj1);
            if (j < i)
                if (movedesc == null)
                    return new MoveDesc(obj, obj1);
                else
                    return new MoveDesc(obj, movedesc.replaced);
        }
        return movedesc;
    }

    public Object removeFirst()
    {
        return remove();
    }

    public Object removeLast()
    {
        if (isEmpty())
            throw new NoSuchElementException();
        else
            return removeAndGet(getMaxElementIndex());
    }

    public int size()
    {
        return size;
    }

    public Object[] toArray()
    {
        Object aobj[] = new Object[size];
        System.arraycopy(((Object) (queue)), 0, ((Object) (aobj)), 0, size);
        return aobj;
    }



}
