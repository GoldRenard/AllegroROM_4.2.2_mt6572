// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.PriorityQueue;
import java.util.concurrent.*;

// Referenced classes of package com.google.common.collect:
//            Collections2, Iterables

public final class Queues
{

    private Queues()
    {
    }

    public static int drain(BlockingQueue blockingqueue, Collection collection, int i, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        Preconditions.checkNotNull(collection);
        long l1 = System.nanoTime() + timeunit.toNanos(l);
        int j = 0;
        do
        {
            if (j >= i)
                break;
            j += blockingqueue.drainTo(collection, i - j);
            if (j >= i)
                continue;
            Object obj = blockingqueue.poll(l1 - System.nanoTime(), TimeUnit.NANOSECONDS);
            if (obj == null)
                break;
            collection.add(obj);
            j++;
        } while (true);
        return j;
    }

    public static int drainUninterruptibly(BlockingQueue blockingqueue, Collection collection, int i, long l, TimeUnit timeunit)
    {
        long l1;
        int j;
        boolean flag;
        Preconditions.checkNotNull(collection);
        l1 = System.nanoTime() + timeunit.toNanos(l);
        j = 0;
        flag = false;
_L4:
        if (j >= i) goto _L2; else goto _L1
_L1:
        int k = i - j;
        int i1 = blockingqueue.drainTo(collection, k);
        j += i1;
        if (j >= i) goto _L4; else goto _L3
_L3:
        Object obj = blockingqueue.poll(l1 - System.nanoTime(), TimeUnit.NANOSECONDS);
        if (obj != null)
            break; /* Loop/switch isn't completed */
_L2:
        if (flag)
            Thread.currentThread().interrupt();
        return j;
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        if (true) goto _L3; else goto _L5
_L5:
        collection.add(obj);
        j++;
          goto _L4
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public static ArrayBlockingQueue newArrayBlockingQueue(int i)
    {
        return new ArrayBlockingQueue(i);
    }

    public static ConcurrentLinkedQueue newConcurrentLinkedQueue()
    {
        return new ConcurrentLinkedQueue();
    }

    public static ConcurrentLinkedQueue newConcurrentLinkedQueue(Iterable iterable)
    {
        if (iterable instanceof Collection)
        {
            return new ConcurrentLinkedQueue(Collections2.cast(iterable));
        } else
        {
            ConcurrentLinkedQueue concurrentlinkedqueue = new ConcurrentLinkedQueue();
            Iterables.addAll(concurrentlinkedqueue, iterable);
            return concurrentlinkedqueue;
        }
    }

    public static LinkedBlockingQueue newLinkedBlockingQueue()
    {
        return new LinkedBlockingQueue();
    }

    public static LinkedBlockingQueue newLinkedBlockingQueue(int i)
    {
        return new LinkedBlockingQueue(i);
    }

    public static LinkedBlockingQueue newLinkedBlockingQueue(Iterable iterable)
    {
        if (iterable instanceof Collection)
        {
            return new LinkedBlockingQueue(Collections2.cast(iterable));
        } else
        {
            LinkedBlockingQueue linkedblockingqueue = new LinkedBlockingQueue();
            Iterables.addAll(linkedblockingqueue, iterable);
            return linkedblockingqueue;
        }
    }

    public static PriorityBlockingQueue newPriorityBlockingQueue()
    {
        return new PriorityBlockingQueue();
    }

    public static PriorityBlockingQueue newPriorityBlockingQueue(Iterable iterable)
    {
        if (iterable instanceof Collection)
        {
            return new PriorityBlockingQueue(Collections2.cast(iterable));
        } else
        {
            PriorityBlockingQueue priorityblockingqueue = new PriorityBlockingQueue();
            Iterables.addAll(priorityblockingqueue, iterable);
            return priorityblockingqueue;
        }
    }

    public static PriorityQueue newPriorityQueue()
    {
        return new PriorityQueue();
    }

    public static PriorityQueue newPriorityQueue(Iterable iterable)
    {
        if (iterable instanceof Collection)
        {
            return new PriorityQueue(Collections2.cast(iterable));
        } else
        {
            PriorityQueue priorityqueue = new PriorityQueue();
            Iterables.addAll(priorityqueue, iterable);
            return priorityqueue;
        }
    }

    public static SynchronousQueue newSynchronousQueue()
    {
        return new SynchronousQueue();
    }
}
