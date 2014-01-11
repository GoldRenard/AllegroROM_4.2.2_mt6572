// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public final class Monitor
{
    public static abstract class Guard
    {

        final Condition condition;
        final Monitor monitor;
        int waiterCount;

        public final boolean equals(Object obj)
        {
            return this == obj;
        }

        public final int hashCode()
        {
            return super.hashCode();
        }

        public abstract boolean isSatisfied();

        protected Guard(Monitor monitor1)
        {
            waiterCount = 0;
            monitor = (Monitor)Preconditions.checkNotNull(monitor1, "monitor");
            condition = monitor1.lock.newCondition();
        }
    }


    private final ArrayList activeGuards;
    private final boolean fair;
    private final ReentrantLock lock;

    public Monitor()
    {
        this(false);
    }

    public Monitor(boolean flag)
    {
        activeGuards = Lists.newArrayListWithCapacity(1);
        fair = flag;
        lock = new ReentrantLock(flag);
    }

    private void decrementWaiters(Guard guard)
    {
        int i = -1 + guard.waiterCount;
        guard.waiterCount = i;
        if (i == 0)
            activeGuards.remove(guard);
    }

    private void incrementWaiters(Guard guard)
    {
        int i = guard.waiterCount;
        guard.waiterCount = i + 1;
        if (i == 0)
            activeGuards.add(guard);
    }

    private void signalConditionsOfSatisfiedGuards(Guard guard)
    {
        ArrayList arraylist;
        int i;
        int j;
        arraylist = activeGuards;
        i = arraylist.size();
        j = 0;
_L2:
        if (j >= i)
            break MISSING_BLOCK_LABEL_66;
        Guard guard1;
        try
        {
            guard1 = (Guard)arraylist.get(j);
        }
        catch (Throwable throwable)
        {
            for (int k = 0; k < i; k++)
                ((Guard)arraylist.get(k)).condition.signalAll();

            throw Throwables.propagate(throwable);
        }
        if (guard1 != guard)
            break MISSING_BLOCK_LABEL_48;
        if (guard1.waiterCount == 1)
            break MISSING_BLOCK_LABEL_107;
        if (!guard1.isSatisfied())
            break MISSING_BLOCK_LABEL_107;
        guard1.condition.signal();
        return;
        j++;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void waitInterruptibly(Guard guard, boolean flag)
        throws InterruptedException
    {
        if (guard.isSatisfied())
            break MISSING_BLOCK_LABEL_50;
        if (flag)
            signalConditionsOfSatisfiedGuards(null);
        incrementWaiters(guard);
        Condition condition = guard.condition;
_L2:
        condition.await();
        boolean flag1 = guard.isSatisfied();
        if (!flag1) goto _L2; else goto _L1
_L1:
        decrementWaiters(guard);
        return;
        InterruptedException interruptedexception;
        interruptedexception;
        signalConditionsOfSatisfiedGuards(guard);
        throw interruptedexception;
        Exception exception;
        exception;
        decrementWaiters(guard);
        throw exception;
        Throwable throwable;
        throwable;
        Thread.currentThread().interrupt();
        throw Throwables.propagate(throwable);
    }

    private boolean waitInterruptibly(Guard guard, long l, boolean flag)
        throws InterruptedException
    {
        if (guard.isSatisfied())
            break MISSING_BLOCK_LABEL_70;
        if (flag)
            signalConditionsOfSatisfiedGuards(null);
        incrementWaiters(guard);
        Condition condition = guard.condition;
_L2:
        if (l <= 0L)
        {
            decrementWaiters(guard);
            return false;
        }
        long l1 = condition.awaitNanos(l);
        l = l1;
        boolean flag1 = guard.isSatisfied();
        if (!flag1) goto _L2; else goto _L1
_L1:
        decrementWaiters(guard);
        return true;
        InterruptedException interruptedexception;
        interruptedexception;
        signalConditionsOfSatisfiedGuards(guard);
        throw interruptedexception;
        Exception exception;
        exception;
        decrementWaiters(guard);
        throw exception;
        Throwable throwable;
        throwable;
        Thread.currentThread().interrupt();
        throw Throwables.propagate(throwable);
    }

    private void waitUninterruptibly(Guard guard, boolean flag)
    {
        if (guard.isSatisfied())
            break MISSING_BLOCK_LABEL_50;
        if (flag)
            signalConditionsOfSatisfiedGuards(null);
        incrementWaiters(guard);
        Condition condition = guard.condition;
        boolean flag1;
        do
        {
            condition.awaitUninterruptibly();
            flag1 = guard.isSatisfied();
        } while (!flag1);
        decrementWaiters(guard);
        return;
        Exception exception;
        exception;
        decrementWaiters(guard);
        throw exception;
    }

    private boolean waitUninterruptibly(Guard guard, long l, boolean flag)
    {
        if (guard.isSatisfied()) goto _L2; else goto _L1
_L1:
        long l1;
        boolean flag1;
        l1 = System.nanoTime();
        if (flag)
            signalConditionsOfSatisfiedGuards(null);
        flag1 = false;
        incrementWaiters(guard);
        Condition condition = guard.condition;
        long l2 = l;
_L4:
        if (l2 > 0L)
            break MISSING_BLOCK_LABEL_64;
        decrementWaiters(guard);
        if (flag1)
            Thread.currentThread().interrupt();
        return false;
        long l3 = condition.awaitNanos(l2);
        l2 = l3;
_L5:
        boolean flag2 = guard.isSatisfied();
        if (!flag2) goto _L4; else goto _L3
_L3:
        decrementWaiters(guard);
        if (flag1)
            Thread.currentThread().interrupt();
_L2:
        return true;
        InterruptedException interruptedexception;
        interruptedexception;
        signalConditionsOfSatisfiedGuards(guard);
        flag1 = true;
        l2 = l - (System.nanoTime() - l1);
          goto _L5
        Throwable throwable;
        throwable;
        Thread.currentThread().interrupt();
        throw Throwables.propagate(throwable);
        Exception exception1;
        exception1;
        decrementWaiters(guard);
        throw exception1;
        Exception exception;
        exception;
        if (flag1)
            Thread.currentThread().interrupt();
        throw exception;
    }

    public void enter()
    {
        lock.lock();
    }

    public boolean enter(long l, TimeUnit timeunit)
    {
        ReentrantLock reentrantlock = lock;
        if (fair || !reentrantlock.tryLock()) goto _L2; else goto _L1
_L1:
        boolean flag2 = true;
_L5:
        return flag2;
_L2:
        long l1;
        long l2;
        long l3;
        boolean flag;
        l1 = System.nanoTime();
        l2 = timeunit.toNanos(l);
        l3 = l2;
        flag = false;
_L3:
        boolean flag1 = reentrantlock.tryLock(l3, TimeUnit.NANOSECONDS);
        flag2 = flag1;
        if (flag)
        {
            Thread.currentThread().interrupt();
            return flag2;
        }
        continue; /* Loop/switch isn't completed */
        InterruptedException interruptedexception;
        interruptedexception;
        flag = true;
        long l4 = System.nanoTime();
        l3 = l2 - (l4 - l1);
          goto _L3
        Exception exception;
        exception;
        if (flag)
            Thread.currentThread().interrupt();
        throw exception;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public boolean enterIf(Guard guard)
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        reentrantlock.lock();
        boolean flag = guard.isSatisfied();
        if (!flag)
            reentrantlock.unlock();
        return flag;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public boolean enterIf(Guard guard, long l, TimeUnit timeunit)
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        if (enter(l, timeunit)) goto _L2; else goto _L1
_L1:
        boolean flag1 = false;
_L4:
        return flag1;
_L2:
        boolean flag = guard.isSatisfied();
        flag1 = flag;
        if (flag1) goto _L4; else goto _L3
_L3:
        reentrantlock.unlock();
        return flag1;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public boolean enterIfInterruptibly(Guard guard)
        throws InterruptedException
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        reentrantlock.lockInterruptibly();
        boolean flag = guard.isSatisfied();
        if (!flag)
            reentrantlock.unlock();
        return flag;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public boolean enterIfInterruptibly(Guard guard, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        if (reentrantlock.tryLock(l, timeunit)) goto _L2; else goto _L1
_L1:
        boolean flag1 = false;
_L4:
        return flag1;
_L2:
        boolean flag = guard.isSatisfied();
        flag1 = flag;
        if (flag1) goto _L4; else goto _L3
_L3:
        reentrantlock.unlock();
        return flag1;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public void enterInterruptibly()
        throws InterruptedException
    {
        lock.lockInterruptibly();
    }

    public boolean enterInterruptibly(long l, TimeUnit timeunit)
        throws InterruptedException
    {
        return lock.tryLock(l, timeunit);
    }

    public void enterWhen(Guard guard)
        throws InterruptedException
    {
        ReentrantLock reentrantlock;
        boolean flag;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        flag = reentrantlock.isHeldByCurrentThread();
        reentrantlock.lockInterruptibly();
        waitInterruptibly(guard, flag);
        if (false)
            reentrantlock.unlock();
        return;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public boolean enterWhen(Guard guard, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        boolean flag = reentrantlock.isHeldByCurrentThread();
        long l2;
        boolean flag1;
        if (!fair && reentrantlock.tryLock())
        {
            l2 = timeunit.toNanos(l);
        } else
        {
            long l1 = System.nanoTime();
            if (!reentrantlock.tryLock(l, timeunit))
                return false;
            l2 = timeunit.toNanos(l) - (System.nanoTime() - l1);
        }
        flag1 = waitInterruptibly(guard, l2, flag);
        if (!flag1)
            reentrantlock.unlock();
        return flag1;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public void enterWhenUninterruptibly(Guard guard)
    {
        ReentrantLock reentrantlock;
        boolean flag;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        flag = reentrantlock.isHeldByCurrentThread();
        reentrantlock.lock();
        waitUninterruptibly(guard, flag);
        if (false)
            reentrantlock.unlock();
        return;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public boolean enterWhenUninterruptibly(Guard guard, long l, TimeUnit timeunit)
    {
        ReentrantLock reentrantlock;
        boolean flag;
        boolean flag1;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        flag = reentrantlock.isHeldByCurrentThread();
        flag1 = false;
        boolean flag2 = fair;
        flag1 = false;
        if (flag2) goto _L2; else goto _L1
_L1:
        if (!reentrantlock.tryLock()) goto _L2; else goto _L3
_L3:
        long l6 = timeunit.toNanos(l);
        long l5 = l6;
_L4:
        boolean flag5 = waitUninterruptibly(guard, l5, flag);
        boolean flag4;
        flag4 = flag5;
        if (flag4)
            break MISSING_BLOCK_LABEL_91;
        reentrantlock.unlock();
        if (flag1)
            Thread.currentThread().interrupt();
_L5:
        return flag4;
_L2:
        long l1;
        long l2;
        l1 = System.nanoTime();
        l2 = timeunit.toNanos(l);
        long l3 = l2;
_L6:
        boolean flag3 = reentrantlock.tryLock(l3, TimeUnit.NANOSECONDS);
        if (!flag3)
            break MISSING_BLOCK_LABEL_153;
        l5 = l2 - (System.nanoTime() - l1);
          goto _L4
        long l4 = System.nanoTime();
        l2 - (l4 - l1);
        flag4 = false;
        if (flag1)
        {
            Thread.currentThread().interrupt();
            return false;
        }
          goto _L5
        InterruptedException interruptedexception;
        interruptedexception;
        flag1 = true;
        l3 = l2 - (System.nanoTime() - l1);
          goto _L6
        Exception exception1;
        exception1;
        l2 - (System.nanoTime() - l1);
        throw exception1;
        Exception exception;
        exception;
        if (flag1)
            Thread.currentThread().interrupt();
        throw exception;
        Exception exception2;
        exception2;
        if (false)
            break MISSING_BLOCK_LABEL_244;
        reentrantlock.unlock();
        throw exception2;
          goto _L4
    }

    public int getOccupiedDepth()
    {
        return lock.getHoldCount();
    }

    public int getQueueLength()
    {
        return lock.getQueueLength();
    }

    public int getWaitQueueLength(Guard guard)
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        lock.lock();
        int i = guard.waiterCount;
        lock.unlock();
        return i;
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
    }

    public boolean hasQueuedThread(Thread thread)
    {
        return lock.hasQueuedThread(thread);
    }

    public boolean hasQueuedThreads()
    {
        return lock.hasQueuedThreads();
    }

    public boolean hasWaiters(Guard guard)
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        lock.lock();
        int i = guard.waiterCount;
        boolean flag;
        if (i > 0)
            flag = true;
        else
            flag = false;
        lock.unlock();
        return flag;
        Exception exception;
        exception;
        lock.unlock();
        throw exception;
    }

    public boolean isFair()
    {
        return lock.isFair();
    }

    public boolean isOccupied()
    {
        return lock.isLocked();
    }

    public boolean isOccupiedByCurrentThread()
    {
        return lock.isHeldByCurrentThread();
    }

    public void leave()
    {
        ReentrantLock reentrantlock;
        reentrantlock = lock;
        if (!reentrantlock.isHeldByCurrentThread())
            throw new IllegalMonitorStateException();
        signalConditionsOfSatisfiedGuards(null);
        reentrantlock.unlock();
        return;
        Exception exception;
        exception;
        reentrantlock.unlock();
        throw exception;
    }

    public boolean tryEnter()
    {
        return lock.tryLock();
    }

    public boolean tryEnterIf(Guard guard)
    {
        ReentrantLock reentrantlock;
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        reentrantlock = lock;
        if (reentrantlock.tryLock()) goto _L2; else goto _L1
_L1:
        boolean flag1 = false;
_L4:
        return flag1;
_L2:
        boolean flag = guard.isSatisfied();
        flag1 = flag;
        if (flag1) goto _L4; else goto _L3
_L3:
        reentrantlock.unlock();
        return flag1;
        Exception exception;
        exception;
        if (true)
            reentrantlock.unlock();
        throw exception;
    }

    public void waitFor(Guard guard)
        throws InterruptedException
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        if (!lock.isHeldByCurrentThread())
        {
            throw new IllegalMonitorStateException();
        } else
        {
            waitInterruptibly(guard, true);
            return;
        }
    }

    public boolean waitFor(Guard guard, long l, TimeUnit timeunit)
        throws InterruptedException
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        if (!lock.isHeldByCurrentThread())
            throw new IllegalMonitorStateException();
        else
            return waitInterruptibly(guard, timeunit.toNanos(l), true);
    }

    public void waitForUninterruptibly(Guard guard)
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        if (!lock.isHeldByCurrentThread())
        {
            throw new IllegalMonitorStateException();
        } else
        {
            waitUninterruptibly(guard, true);
            return;
        }
    }

    public boolean waitForUninterruptibly(Guard guard, long l, TimeUnit timeunit)
    {
        if (guard.monitor != this)
            throw new IllegalMonitorStateException();
        if (!lock.isHeldByCurrentThread())
            throw new IllegalMonitorStateException();
        else
            return waitUninterruptibly(guard, timeunit.toNanos(l), true);
    }

}
