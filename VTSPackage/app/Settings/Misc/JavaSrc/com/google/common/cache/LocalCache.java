// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.cache;

import com.google.common.base.*;
import com.google.common.collect.*;
import com.google.common.primitives.Ints;
import com.google.common.util.concurrent.*;
import java.io.*;
import java.lang.ref.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.cache:
//            CacheBuilder, CacheLoader, RemovalNotification, RemovalListener, 
//            Weigher, LoadingCache, ForwardingCache, Cache, 
//            CacheStats, RemovalCause

class LocalCache extends AbstractMap
    implements ConcurrentMap
{
    static abstract class AbstractReferenceEntry
        implements ReferenceEntry
    {

        public long getAccessTime()
        {
            throw new UnsupportedOperationException();
        }

        public int getHash()
        {
            throw new UnsupportedOperationException();
        }

        public Object getKey()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNext()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            throw new UnsupportedOperationException();
        }

        public long getWriteTime()
        {
            throw new UnsupportedOperationException();
        }

        public void setAccessTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            throw new UnsupportedOperationException();
        }

        public void setWriteTime(long l)
        {
            throw new UnsupportedOperationException();
        }

    }

    static final class AccessQueue extends AbstractQueue
    {

        final ReferenceEntry head = new _cls1();

        public void clear()
        {
            ReferenceEntry referenceentry1;
            for (ReferenceEntry referenceentry = head.getNextInAccessQueue(); referenceentry != head; referenceentry = referenceentry1)
            {
                referenceentry1 = referenceentry.getNextInAccessQueue();
                LocalCache.nullifyAccessOrder(referenceentry);
            }

            head.setNextInAccessQueue(head);
            head.setPreviousInAccessQueue(head);
        }

        public boolean contains(Object obj)
        {
            return ((ReferenceEntry)obj).getNextInAccessQueue() != NullEntry.INSTANCE;
        }

        public boolean isEmpty()
        {
            return head.getNextInAccessQueue() == head;
        }

        public Iterator iterator()
        {
            return new AbstractLinkedIterator(peek()) {

                final AccessQueue this$0;

                protected ReferenceEntry computeNext(ReferenceEntry referenceentry)
                {
                    ReferenceEntry referenceentry1 = referenceentry.getNextInAccessQueue();
                    if (referenceentry1 == head)
                        referenceentry1 = null;
                    return referenceentry1;
                }

                protected volatile Object computeNext(Object obj)
                {
                    return computeNext((ReferenceEntry)obj);
                }

            
            {
                this$0 = AccessQueue.this;
                super(referenceentry);
            }
            }
;
        }

        public boolean offer(ReferenceEntry referenceentry)
        {
            LocalCache.connectAccessOrder(referenceentry.getPreviousInAccessQueue(), referenceentry.getNextInAccessQueue());
            LocalCache.connectAccessOrder(head.getPreviousInAccessQueue(), referenceentry);
            LocalCache.connectAccessOrder(referenceentry, head);
            return true;
        }

        public volatile boolean offer(Object obj)
        {
            return offer((ReferenceEntry)obj);
        }

        public ReferenceEntry peek()
        {
            ReferenceEntry referenceentry = head.getNextInAccessQueue();
            if (referenceentry == head)
                referenceentry = null;
            return referenceentry;
        }

        public volatile Object peek()
        {
            return peek();
        }

        public ReferenceEntry poll()
        {
            ReferenceEntry referenceentry = head.getNextInAccessQueue();
            if (referenceentry == head)
            {
                return null;
            } else
            {
                remove(referenceentry);
                return referenceentry;
            }
        }

        public volatile Object poll()
        {
            return poll();
        }

        public boolean remove(Object obj)
        {
            ReferenceEntry referenceentry = (ReferenceEntry)obj;
            ReferenceEntry referenceentry1 = referenceentry.getPreviousInAccessQueue();
            ReferenceEntry referenceentry2 = referenceentry.getNextInAccessQueue();
            LocalCache.connectAccessOrder(referenceentry1, referenceentry2);
            LocalCache.nullifyAccessOrder(referenceentry);
            return referenceentry2 != NullEntry.INSTANCE;
        }

        public int size()
        {
            int i = 0;
            for (ReferenceEntry referenceentry = head.getNextInAccessQueue(); referenceentry != head; referenceentry = referenceentry.getNextInAccessQueue())
                i++;

            return i;
        }

    }

    static abstract class EntryFactory extends Enum
    {

        private static final EntryFactory $VALUES[];
        static final int ACCESS_MASK = 1;
        public static final EntryFactory STRONG;
        public static final EntryFactory STRONG_ACCESS;
        public static final EntryFactory STRONG_ACCESS_WRITE;
        public static final EntryFactory STRONG_WRITE;
        public static final EntryFactory WEAK;
        public static final EntryFactory WEAK_ACCESS;
        public static final EntryFactory WEAK_ACCESS_WRITE;
        static final int WEAK_MASK = 4;
        public static final EntryFactory WEAK_WRITE;
        static final int WRITE_MASK = 2;
        static final EntryFactory factories[];

        static EntryFactory getFactory(Strength strength, boolean flag, boolean flag1)
        {
            byte byte0;
            if (strength == Strength.WEAK)
                byte0 = 4;
            else
                byte0 = 0;
            boolean flag2;
            if (flag)
                flag2 = true;
            else
                flag2 = false;
            int i = flag2 | byte0;
            byte byte1 = 0;
            if (flag1)
                byte1 = 2;
            int j = i | byte1;
            return factories[j];
        }

        public static EntryFactory valueOf(String s)
        {
            return (EntryFactory)Enum.valueOf(com/google/common/cache/LocalCache$EntryFactory, s);
        }

        public static EntryFactory[] values()
        {
            return (EntryFactory[])$VALUES.clone();
        }

        void copyAccessEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            referenceentry1.setAccessTime(referenceentry.getAccessTime());
            LocalCache.connectAccessOrder(referenceentry.getPreviousInAccessQueue(), referenceentry1);
            LocalCache.connectAccessOrder(referenceentry1, referenceentry.getNextInAccessQueue());
            LocalCache.nullifyAccessOrder(referenceentry);
        }

        ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            return newEntry(segment, referenceentry.getKey(), referenceentry.getHash(), referenceentry1);
        }

        void copyWriteEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            referenceentry1.setWriteTime(referenceentry.getWriteTime());
            LocalCache.connectWriteOrder(referenceentry.getPreviousInWriteQueue(), referenceentry1);
            LocalCache.connectWriteOrder(referenceentry1, referenceentry.getNextInWriteQueue());
            LocalCache.nullifyWriteOrder(referenceentry);
        }

        abstract ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry);

        static 
        {
            STRONG = new EntryFactory("STRONG", 0) {

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongEntry(obj, i, referenceentry);
                }

            }
;
            STRONG_ACCESS = new EntryFactory("STRONG_ACCESS", 1) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyAccessEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongAccessEntry(obj, i, referenceentry);
                }

            }
;
            STRONG_WRITE = new EntryFactory("STRONG_WRITE", 2) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyWriteEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongWriteEntry(obj, i, referenceentry);
                }

            }
;
            STRONG_ACCESS_WRITE = new EntryFactory("STRONG_ACCESS_WRITE", 3) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyAccessEntry(referenceentry, referenceentry2);
                    copyWriteEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongAccessWriteEntry(obj, i, referenceentry);
                }

            }
;
            WEAK = new EntryFactory("WEAK", 4) {

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_ACCESS = new EntryFactory("WEAK_ACCESS", 5) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyAccessEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakAccessEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_WRITE = new EntryFactory("WEAK_WRITE", 6) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyWriteEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakWriteEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_ACCESS_WRITE = new EntryFactory("WEAK_ACCESS_WRITE", 7) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyAccessEntry(referenceentry, referenceentry2);
                    copyWriteEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakAccessWriteEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            EntryFactory aentryfactory[] = new EntryFactory[8];
            aentryfactory[0] = STRONG;
            aentryfactory[1] = STRONG_ACCESS;
            aentryfactory[2] = STRONG_WRITE;
            aentryfactory[3] = STRONG_ACCESS_WRITE;
            aentryfactory[4] = WEAK;
            aentryfactory[5] = WEAK_ACCESS;
            aentryfactory[6] = WEAK_WRITE;
            aentryfactory[7] = WEAK_ACCESS_WRITE;
            $VALUES = aentryfactory;
            EntryFactory aentryfactory1[] = new EntryFactory[8];
            aentryfactory1[0] = STRONG;
            aentryfactory1[1] = STRONG_ACCESS;
            aentryfactory1[2] = STRONG_WRITE;
            aentryfactory1[3] = STRONG_ACCESS_WRITE;
            aentryfactory1[4] = WEAK;
            aentryfactory1[5] = WEAK_ACCESS;
            aentryfactory1[6] = WEAK_WRITE;
            aentryfactory1[7] = WEAK_ACCESS_WRITE;
            factories = aentryfactory1;
        }

        private EntryFactory(String s, int i)
        {
            super(s, i);
        }

    }

    final class EntryIterator extends HashIterator
        implements Iterator
    {

        final LocalCache this$0;

        public volatile Object next()
        {
            return next();
        }

        public java.util.Map.Entry next()
        {
            return nextEntry();
        }

        EntryIterator()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    final class EntrySet extends AbstractSet
    {

        final LocalCache this$0;

        public void clear()
        {
            LocalCache.this.clear();
        }

        public boolean contains(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Object obj1 = entry.getKey();
                if (obj1 != null)
                {
                    Object obj2 = get(obj1);
                    if (obj2 != null && valueEquivalence.equivalent(entry.getValue(), obj2))
                        return true;
                }
            }
            return false;
        }

        public boolean isEmpty()
        {
            return LocalCache.this.isEmpty();
        }

        public Iterator iterator()
        {
            return new EntryIterator();
        }

        public boolean remove(Object obj)
        {
            if (obj instanceof java.util.Map.Entry)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                Object obj1 = entry.getKey();
                if (obj1 != null && LocalCache.this.remove(obj1, entry.getValue()))
                    return true;
            }
            return false;
        }

        public int size()
        {
            return LocalCache.this.size();
        }

        EntrySet()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    abstract class HashIterator
    {

        Segment currentSegment;
        AtomicReferenceArray currentTable;
        WriteThroughEntry lastReturned;
        ReferenceEntry nextEntry;
        WriteThroughEntry nextExternal;
        int nextSegmentIndex;
        int nextTableIndex;
        final LocalCache this$0;

        final void advance()
        {
            nextExternal = null;
            if (!nextInChain() && !nextInTable())
                while (nextSegmentIndex >= 0) 
                {
                    Segment asegment[] = segments;
                    int i = nextSegmentIndex;
                    nextSegmentIndex = i - 1;
                    currentSegment = asegment[i];
                    if (currentSegment.count != 0)
                    {
                        currentTable = currentSegment.table;
                        nextTableIndex = -1 + currentTable.length();
                        if (nextInTable())
                            return;
                    }
                }
        }

        boolean advanceTo(ReferenceEntry referenceentry)
        {
            Object obj;
            Object obj1;
            long l = ticker.read();
            obj = referenceentry.getKey();
            obj1 = getLiveValue(referenceentry, l);
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_63;
            nextExternal = new WriteThroughEntry(obj, obj1);
            currentSegment.postReadCleanup();
            return true;
            currentSegment.postReadCleanup();
            return false;
            Exception exception;
            exception;
            currentSegment.postReadCleanup();
            throw exception;
        }

        public boolean hasNext()
        {
            return nextExternal != null;
        }

        WriteThroughEntry nextEntry()
        {
            if (nextExternal == null)
            {
                throw new NoSuchElementException();
            } else
            {
                lastReturned = nextExternal;
                advance();
                return lastReturned;
            }
        }

        boolean nextInChain()
        {
            if (nextEntry != null)
                for (nextEntry = nextEntry.getNext(); nextEntry != null; nextEntry = nextEntry.getNext())
                    if (advanceTo(nextEntry))
                        return true;

            return false;
        }

        boolean nextInTable()
        {
            while (nextTableIndex >= 0) 
            {
                AtomicReferenceArray atomicreferencearray = currentTable;
                int i = nextTableIndex;
                nextTableIndex = i - 1;
                ReferenceEntry referenceentry = (ReferenceEntry)atomicreferencearray.get(i);
                nextEntry = referenceentry;
                if (referenceentry != null && (advanceTo(nextEntry) || nextInChain()))
                    return true;
            }
            return false;
        }

        public void remove()
        {
            boolean flag;
            if (lastReturned != null)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag);
            LocalCache.this.remove(lastReturned.getKey());
            lastReturned = null;
        }

        HashIterator()
        {
            this$0 = LocalCache.this;
            super();
            nextSegmentIndex = -1 + segments.length;
            nextTableIndex = -1;
            advance();
        }
    }

    final class KeyIterator extends HashIterator
        implements Iterator
    {

        final LocalCache this$0;

        public Object next()
        {
            return nextEntry().getKey();
        }

        KeyIterator()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    final class KeySet extends AbstractSet
    {

        final LocalCache this$0;

        public void clear()
        {
            LocalCache.this.clear();
        }

        public boolean contains(Object obj)
        {
            return containsKey(obj);
        }

        public boolean isEmpty()
        {
            return LocalCache.this.isEmpty();
        }

        public Iterator iterator()
        {
            return new KeyIterator();
        }

        public boolean remove(Object obj)
        {
            return LocalCache.this.remove(obj) != null;
        }

        public int size()
        {
            return LocalCache.this.size();
        }

        KeySet()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    static final class LoadingSerializationProxy extends ManualSerializationProxy
        implements LoadingCache, Serializable
    {

        private static final long serialVersionUID = 1L;
        transient LoadingCache autoDelegate;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            autoDelegate = recreateCacheBuilder().build(super.loader);
        }

        private Object readResolve()
        {
            return autoDelegate;
        }

        public final Object apply(Object obj)
        {
            return autoDelegate.apply(obj);
        }

        public Object get(Object obj)
            throws ExecutionException
        {
            return autoDelegate.get(obj);
        }

        public ImmutableMap getAll(Iterable iterable)
            throws ExecutionException
        {
            return autoDelegate.getAll(iterable);
        }

        public Object getUnchecked(Object obj)
        {
            return autoDelegate.getUnchecked(obj);
        }

        public void refresh(Object obj)
        {
            autoDelegate.refresh(obj);
        }

        LoadingSerializationProxy(LocalCache localcache)
        {
            super(localcache);
        }
    }

    static class LoadingValueReference
        implements ValueReference
    {

        final SettableFuture futureValue;
        volatile ValueReference oldValue;
        final Stopwatch stopwatch;

        private ListenableFuture fullyFailedFuture(Throwable throwable)
        {
            SettableFuture settablefuture = SettableFuture.create();
            setException(settablefuture, throwable);
            return settablefuture;
        }

        private static boolean setException(SettableFuture settablefuture, Throwable throwable)
        {
            boolean flag;
            try
            {
                flag = settablefuture.setException(throwable);
            }
            catch (Error error)
            {
                return false;
            }
            return flag;
        }

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return this;
        }

        public long elapsedNanos()
        {
            return stopwatch.elapsedTime(TimeUnit.NANOSECONDS);
        }

        public Object get()
        {
            return oldValue.get();
        }

        public ReferenceEntry getEntry()
        {
            return null;
        }

        public ValueReference getOldValue()
        {
            return oldValue;
        }

        public int getWeight()
        {
            return oldValue.getWeight();
        }

        public boolean isActive()
        {
            return oldValue.isActive();
        }

        public boolean isLoading()
        {
            return true;
        }

        public ListenableFuture loadFuture(Object obj, CacheLoader cacheloader)
        {
            Object obj1;
            stopwatch.start();
            obj1 = oldValue.get();
            if (obj1 != null)
                break MISSING_BLOCK_LABEL_51;
            Object obj2 = cacheloader.load(obj);
            if (set(obj2))
                return futureValue;
            else
                return Futures.immediateFuture(obj2);
            ListenableFuture listenablefuture = cacheloader.reload(obj, obj1);
            if (listenablefuture == null)
            {
                ListenableFuture listenablefuture1;
                try
                {
                    listenablefuture1 = Futures.immediateFuture(null);
                }
                catch (Throwable throwable)
                {
                    if (setException(throwable))
                        return futureValue;
                    else
                        return fullyFailedFuture(throwable);
                }
                listenablefuture = listenablefuture1;
            }
            return listenablefuture;
        }

        public void notifyNewValue(Object obj)
        {
            if (obj != null)
            {
                set(obj);
                return;
            } else
            {
                oldValue = LocalCache.unset();
                return;
            }
        }

        public boolean set(Object obj)
        {
            return futureValue.set(obj);
        }

        public boolean setException(Throwable throwable)
        {
            return setException(futureValue, throwable);
        }

        public Object waitForValue()
            throws ExecutionException
        {
            return Uninterruptibles.getUninterruptibly(futureValue);
        }

        public LoadingValueReference()
        {
            this(LocalCache.unset());
        }

        public LoadingValueReference(ValueReference valuereference)
        {
            futureValue = SettableFuture.create();
            stopwatch = new Stopwatch();
            oldValue = valuereference;
        }
    }

    static class LocalLoadingCache extends LocalManualCache
        implements LoadingCache
    {

        private static final long serialVersionUID = 1L;

        public ImmutableMap getAll(Iterable iterable)
            throws ExecutionException
        {
            return super.localCache.getAll(iterable);
        }

        public void refresh(Object obj)
        {
            super.localCache.refresh(obj);
        }

        Object writeReplace()
        {
            return new LoadingSerializationProxy(super.localCache);
        }

        LocalLoadingCache(CacheBuilder cachebuilder, CacheLoader cacheloader)
        {
            super(cachebuilder, (CacheLoader)Preconditions.checkNotNull(cacheloader));
        }
    }

    static class LocalManualCache
        implements Cache, Serializable
    {

        private static final long serialVersionUID = 1L;
        final LocalCache localCache;

        public final Object apply(Object obj)
        {
            return getUnchecked(obj);
        }

        public ConcurrentMap asMap()
        {
            return localCache;
        }

        public void cleanUp()
        {
            localCache.cleanUp();
        }

        public Object get(Object obj)
            throws ExecutionException
        {
            return localCache.getOrLoad(obj);
        }

        public Object get(Object obj, Callable callable)
            throws ExecutionException
        {
            Preconditions.checkNotNull(callable);
            return localCache.get(obj, callable. new CacheLoader() {

                final LocalManualCache this$0;
                final Callable val$valueLoader;

                public Object load(Object obj)
                    throws Exception
                {
                    return valueLoader.call();
                }

            
            {
                this$0 = final_localmanualcache;
                valueLoader = Callable.this;
                super();
            }
            }
);
        }

        public ImmutableMap getAllPresent(Iterable iterable)
        {
            return localCache.getAllPresent(iterable);
        }

        public Object getIfPresent(Object obj)
        {
            return localCache.getIfPresent(obj);
        }

        public Object getUnchecked(Object obj)
        {
            Object obj1;
            try
            {
                obj1 = get(obj);
            }
            catch (ExecutionException executionexception)
            {
                throw new UncheckedExecutionException(executionexception.getCause());
            }
            return obj1;
        }

        public void invalidate(Object obj)
        {
            Preconditions.checkNotNull(obj);
            localCache.remove(obj);
        }

        public void invalidateAll()
        {
            localCache.clear();
        }

        public void invalidateAll(Iterable iterable)
        {
            localCache.invalidateAll(iterable);
        }

        public void put(Object obj, Object obj1)
        {
            localCache.put(obj, obj1);
        }

        public long size()
        {
            return localCache.longSize();
        }

        public CacheStats stats()
        {
            AbstractCache.SimpleStatsCounter simplestatscounter = new AbstractCache.SimpleStatsCounter();
            simplestatscounter.incrementBy(localCache.globalStatsCounter);
            Segment asegment[] = localCache.segments;
            int i = asegment.length;
            for (int j = 0; j < i; j++)
                simplestatscounter.incrementBy(asegment[j].statsCounter);

            return simplestatscounter.snapshot();
        }

        Object writeReplace()
        {
            return new ManualSerializationProxy(localCache);
        }

        LocalManualCache(CacheBuilder cachebuilder)
        {
            this(cachebuilder, null);
        }

        protected LocalManualCache(CacheBuilder cachebuilder, CacheLoader cacheloader)
        {
            localCache = new LocalCache(cachebuilder, cacheloader);
        }
    }

    static class ManualSerializationProxy extends ForwardingCache
        implements Serializable
    {

        private static final long serialVersionUID = 1L;
        final int concurrencyLevel;
        transient Cache _flddelegate;
        final long expireAfterAccessNanos;
        final long expireAfterWriteNanos;
        final Equivalence keyEquivalence;
        final Strength keyStrength;
        final CacheLoader loader;
        final long maxWeight;
        final RemovalListener removalListener;
        final Ticker ticker;
        final Equivalence valueEquivalence;
        final Strength valueStrength;
        final Weigher weigher;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            _flddelegate = recreateCacheBuilder().build();
        }

        private Object readResolve()
        {
            return _flddelegate;
        }

        protected Cache _mthdelegate()
        {
            return _flddelegate;
        }

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        CacheBuilder recreateCacheBuilder()
        {
            CacheBuilder cachebuilder = CacheBuilder.newBuilder().setKeyStrength(keyStrength).setValueStrength(valueStrength).keyEquivalence(keyEquivalence).valueEquivalence(valueEquivalence).concurrencyLevel(concurrencyLevel);
            cachebuilder.strictParsing = false;
            cachebuilder.removalListener(removalListener);
            if (expireAfterWriteNanos > 0L)
                cachebuilder.expireAfterWrite(expireAfterWriteNanos, TimeUnit.NANOSECONDS);
            if (expireAfterAccessNanos > 0L)
                cachebuilder.expireAfterAccess(expireAfterAccessNanos, TimeUnit.NANOSECONDS);
            if (weigher != CacheBuilder.OneWeigher.INSTANCE)
            {
                cachebuilder.weigher(weigher);
                if (maxWeight != -1L)
                    cachebuilder.maximumWeight(maxWeight);
            } else
            if (maxWeight != -1L)
                cachebuilder.maximumSize(maxWeight);
            if (ticker != null)
                cachebuilder.ticker(ticker);
            return cachebuilder;
        }

        private ManualSerializationProxy(Strength strength, Strength strength1, Equivalence equivalence, Equivalence equivalence1, long l, long l1, long l2, Weigher weigher1, int i, RemovalListener removallistener, Ticker ticker1, 
                CacheLoader cacheloader)
        {
label0:
            {
                super();
                keyStrength = strength;
                valueStrength = strength1;
                keyEquivalence = equivalence;
                valueEquivalence = equivalence1;
                expireAfterWriteNanos = l;
                expireAfterAccessNanos = l1;
                maxWeight = l2;
                weigher = weigher1;
                concurrencyLevel = i;
                removalListener = removallistener;
                Ticker ticker2 = Ticker.systemTicker();
                if (ticker1 != ticker2)
                {
                    Ticker ticker3 = CacheBuilder.NULL_TICKER;
                    if (ticker1 != ticker3)
                        break label0;
                }
                ticker1 = null;
            }
            ticker = ticker1;
            loader = cacheloader;
        }

        ManualSerializationProxy(LocalCache localcache)
        {
            this(localcache.keyStrength, localcache.valueStrength, localcache.keyEquivalence, localcache.valueEquivalence, localcache.expireAfterWriteNanos, localcache.expireAfterAccessNanos, localcache.maxWeight, localcache.weigher, localcache.concurrencyLevel, localcache.removalListener, localcache.ticker, localcache.defaultLoader);
        }
    }

    private static final class NullEntry extends Enum
        implements ReferenceEntry
    {

        private static final NullEntry $VALUES[];
        public static final NullEntry INSTANCE;

        public static NullEntry valueOf(String s)
        {
            return (NullEntry)Enum.valueOf(com/google/common/cache/LocalCache$NullEntry, s);
        }

        public static NullEntry[] values()
        {
            return (NullEntry[])$VALUES.clone();
        }

        public long getAccessTime()
        {
            return 0L;
        }

        public int getHash()
        {
            return 0;
        }

        public Object getKey()
        {
            return null;
        }

        public ReferenceEntry getNext()
        {
            return null;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return this;
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            return this;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return this;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return this;
        }

        public ValueReference getValueReference()
        {
            return null;
        }

        public long getWriteTime()
        {
            return 0L;
        }

        public void setAccessTime(long l)
        {
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
        }

        public void setValueReference(ValueReference valuereference)
        {
        }

        public void setWriteTime(long l)
        {
        }

        static 
        {
            INSTANCE = new NullEntry("INSTANCE", 0);
            NullEntry anullentry[] = new NullEntry[1];
            anullentry[0] = INSTANCE;
            $VALUES = anullentry;
        }

        private NullEntry(String s, int i)
        {
            super(s, i);
        }
    }

    static interface ReferenceEntry
    {

        public abstract long getAccessTime();

        public abstract int getHash();

        public abstract Object getKey();

        public abstract ReferenceEntry getNext();

        public abstract ReferenceEntry getNextInAccessQueue();

        public abstract ReferenceEntry getNextInWriteQueue();

        public abstract ReferenceEntry getPreviousInAccessQueue();

        public abstract ReferenceEntry getPreviousInWriteQueue();

        public abstract ValueReference getValueReference();

        public abstract long getWriteTime();

        public abstract void setAccessTime(long l);

        public abstract void setNextInAccessQueue(ReferenceEntry referenceentry);

        public abstract void setNextInWriteQueue(ReferenceEntry referenceentry);

        public abstract void setPreviousInAccessQueue(ReferenceEntry referenceentry);

        public abstract void setPreviousInWriteQueue(ReferenceEntry referenceentry);

        public abstract void setValueReference(ValueReference valuereference);

        public abstract void setWriteTime(long l);
    }

    static class Segment extends ReentrantLock
    {

        final Queue accessQueue;
        volatile int count;
        final ReferenceQueue keyReferenceQueue;
        final LocalCache map;
        final long maxSegmentWeight;
        int modCount;
        final AtomicInteger readCount = new AtomicInteger();
        final Queue recencyQueue;
        final AbstractCache.StatsCounter statsCounter;
        volatile AtomicReferenceArray table;
        int threshold;
        int totalWeight;
        final ReferenceQueue valueReferenceQueue;
        final Queue writeQueue;

        void cleanUp()
        {
            runLockedCleanup(map.ticker.read());
            runUnlockedCleanup();
        }

        void clear()
        {
            if (count == 0) goto _L2; else goto _L1
_L1:
            lock();
            AtomicReferenceArray atomicreferencearray = table;
            int i = 0;
_L7:
            ReferenceEntry referenceentry;
            if (i >= atomicreferencearray.length())
                break MISSING_BLOCK_LABEL_170;
            referenceentry = (ReferenceEntry)atomicreferencearray.get(i);
_L4:
            if (referenceentry == null)
                break; /* Loop/switch isn't completed */
            if (referenceentry.getValueReference().isActive())
                enqueueNotification(referenceentry, RemovalCause.EXPLICIT);
            referenceentry = referenceentry.getNext();
            if (true) goto _L4; else goto _L3
_L5:
            Exception exception;
            int j;
            for (; j >= atomicreferencearray.length(); j = 0)
                break MISSING_BLOCK_LABEL_99;

            atomicreferencearray.set(j, null);
            j++;
              goto _L5
            clearReferenceQueues();
            writeQueue.clear();
            accessQueue.clear();
            readCount.set(0);
            modCount = 1 + modCount;
            count = 0;
            unlock();
            postWriteCleanup();
_L2:
            return;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
_L3:
            i++;
            if (true) goto _L7; else goto _L6
_L6:
        }

        void clearKeyReferenceQueue()
        {
            while (keyReferenceQueue.poll() != null) ;
        }

        void clearReferenceQueues()
        {
            if (map.usesKeyReferences())
                clearKeyReferenceQueue();
            if (map.usesValueReferences())
                clearValueReferenceQueue();
        }

        void clearValueReferenceQueue()
        {
            while (valueReferenceQueue.poll() != null) ;
        }

        boolean containsKey(Object obj, int i)
        {
            ReferenceEntry referenceentry;
            if (count == 0)
                break MISSING_BLOCK_LABEL_68;
            referenceentry = getLiveEntry(obj, i, map.ticker.read());
            if (referenceentry == null)
            {
                postReadCleanup();
                return false;
            }
            Object obj1 = referenceentry.getValueReference().get();
            boolean flag = false;
            if (obj1 != null)
                flag = true;
            postReadCleanup();
            return flag;
            postReadCleanup();
            return false;
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
        }

        boolean containsValue(Object obj)
        {
            if (count == 0) goto _L2; else goto _L1
_L1:
            long l;
            AtomicReferenceArray atomicreferencearray;
            int i;
            l = map.ticker.read();
            atomicreferencearray = table;
            i = atomicreferencearray.length();
            int j = 0;
_L7:
            if (j >= i)
                break; /* Loop/switch isn't completed */
            ReferenceEntry referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
_L4:
            if (referenceentry == null)
                break MISSING_BLOCK_LABEL_110;
            Object obj1 = getLiveValue(referenceentry, l);
            if (obj1 != null)
                break; /* Loop/switch isn't completed */
_L6:
            referenceentry = referenceentry.getNext();
            boolean flag;
            if (true) goto _L4; else goto _L3
_L3:
            if (!(flag = map.valueEquivalence.equivalent(obj, obj1))) goto _L6; else goto _L5
_L5:
            postReadCleanup();
            return true;
            j++;
            if (true) goto _L7; else goto _L2
_L2:
            postReadCleanup();
            return false;
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
        }

        ReferenceEntry copyEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            ValueReference valuereference = referenceentry.getValueReference();
            ReferenceEntry referenceentry2 = map.entryFactory.copyEntry(this, referenceentry, referenceentry1);
            referenceentry2.setValueReference(valuereference.copyFor(valueReferenceQueue, referenceentry2));
            return referenceentry2;
        }

        void drainKeyReferenceQueue()
        {
            int i = 0;
            do
            {
                java.lang.ref.Reference reference = keyReferenceQueue.poll();
                if (reference == null)
                    break;
                ReferenceEntry referenceentry = (ReferenceEntry)reference;
                map.reclaimKey(referenceentry);
            } while (++i != 16);
        }

        void drainRecencyQueue()
        {
            do
            {
                ReferenceEntry referenceentry = (ReferenceEntry)recencyQueue.poll();
                if (referenceentry == null)
                    break;
                if (accessQueue.contains(referenceentry))
                    accessQueue.add(referenceentry);
            } while (true);
        }

        void drainReferenceQueues()
        {
            if (map.usesKeyReferences())
                drainKeyReferenceQueue();
            if (map.usesValueReferences())
                drainValueReferenceQueue();
        }

        void drainValueReferenceQueue()
        {
            int i = 0;
            do
            {
                java.lang.ref.Reference reference = valueReferenceQueue.poll();
                if (reference == null)
                    break;
                ValueReference valuereference = (ValueReference)reference;
                map.reclaimValue(valuereference);
            } while (++i != 16);
        }

        void enqueueNotification(ReferenceEntry referenceentry, RemovalCause removalcause)
        {
            enqueueNotification(referenceentry.getKey(), referenceentry.getHash(), referenceentry.getValueReference(), removalcause);
        }

        void enqueueNotification(Object obj, int i, ValueReference valuereference, RemovalCause removalcause)
        {
            totalWeight = totalWeight - valuereference.getWeight();
            if (removalcause.wasEvicted())
                statsCounter.recordEviction();
            if (map.removalNotificationQueue != LocalCache.DISCARDING_QUEUE)
            {
                RemovalNotification removalnotification = new RemovalNotification(obj, valuereference.get(), removalcause);
                map.removalNotificationQueue.offer(removalnotification);
            }
        }

        void evictEntries()
        {
label0:
            {
                if (!map.evictsBySize())
                    break label0;
                drainRecencyQueue();
                ReferenceEntry referenceentry;
                do
                {
                    if ((long)totalWeight <= maxSegmentWeight)
                        break label0;
                    referenceentry = getNextEvictable();
                } while (removeEntry(referenceentry, referenceentry.getHash(), RemovalCause.SIZE));
                throw new AssertionError();
            }
        }

        void expand()
        {
            AtomicReferenceArray atomicreferencearray = table;
            int i = atomicreferencearray.length();
            if (i >= 0x40000000)
                return;
            int j = count;
            AtomicReferenceArray atomicreferencearray1 = newEntryArray(i << 1);
            threshold = (3 * atomicreferencearray1.length()) / 4;
            int k = -1 + atomicreferencearray1.length();
            for (int l = 0; l < i; l++)
            {
                ReferenceEntry referenceentry = (ReferenceEntry)atomicreferencearray.get(l);
                if (referenceentry == null)
                    continue;
                ReferenceEntry referenceentry1 = referenceentry.getNext();
                int i1 = k & referenceentry.getHash();
                if (referenceentry1 == null)
                {
                    atomicreferencearray1.set(i1, referenceentry);
                    continue;
                }
                ReferenceEntry referenceentry2 = referenceentry;
                int j1 = i1;
                for (ReferenceEntry referenceentry3 = referenceentry1; referenceentry3 != null; referenceentry3 = referenceentry3.getNext())
                {
                    int l1 = k & referenceentry3.getHash();
                    if (l1 != j1)
                    {
                        j1 = l1;
                        referenceentry2 = referenceentry3;
                    }
                }

                atomicreferencearray1.set(j1, referenceentry2);
                for (ReferenceEntry referenceentry4 = referenceentry; referenceentry4 != referenceentry2; referenceentry4 = referenceentry4.getNext())
                    if (isCollected(referenceentry4))
                    {
                        removeCollectedEntry(referenceentry4);
                        j--;
                    } else
                    {
                        int k1 = k & referenceentry4.getHash();
                        atomicreferencearray1.set(k1, copyEntry(referenceentry4, (ReferenceEntry)atomicreferencearray1.get(k1)));
                    }

            }

            table = atomicreferencearray1;
            count = j;
        }

        void expireEntries(long l)
        {
            drainRecencyQueue();
            do
            {
                ReferenceEntry referenceentry = (ReferenceEntry)writeQueue.peek();
                if (referenceentry != null && map.isExpired(referenceentry, l))
                {
                    if (!removeEntry(referenceentry, referenceentry.getHash(), RemovalCause.EXPIRED))
                        throw new AssertionError();
                } else
                {
                    do
                    {
                        ReferenceEntry referenceentry1 = (ReferenceEntry)accessQueue.peek();
                        if (referenceentry1 != null && map.isExpired(referenceentry1, l))
                        {
                            if (!removeEntry(referenceentry1, referenceentry1.getHash(), RemovalCause.EXPIRED))
                                throw new AssertionError();
                        } else
                        {
                            return;
                        }
                    } while (true);
                }
            } while (true);
        }

        Object get(Object obj, int i)
        {
            long l;
            ReferenceEntry referenceentry;
            if (count == 0)
                break MISSING_BLOCK_LABEL_105;
            l = map.ticker.read();
            referenceentry = getLiveEntry(obj, i, l);
            if (referenceentry == null)
            {
                postReadCleanup();
                return null;
            }
            Object obj1 = referenceentry.getValueReference().get();
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_101;
            Object obj2;
            recordRead(referenceentry, l);
            obj2 = scheduleRefresh(referenceentry, referenceentry.getKey(), i, obj1, l, map.defaultLoader);
            postReadCleanup();
            return obj2;
            tryDrainReferenceQueues();
            postReadCleanup();
            return null;
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
        }

        Object get(Object obj, int i, CacheLoader cacheloader)
            throws ExecutionException
        {
            ReferenceEntry referenceentry;
            if (count == 0)
                break MISSING_BLOCK_LABEL_124;
            referenceentry = getEntry(obj, i);
            if (referenceentry == null)
                break MISSING_BLOCK_LABEL_124;
            long l;
            Object obj2;
            l = map.ticker.read();
            obj2 = getLiveValue(referenceentry, l);
            if (obj2 == null)
                break MISSING_BLOCK_LABEL_87;
            Object obj3;
            recordRead(referenceentry, l);
            statsCounter.recordHits(1);
            obj3 = scheduleRefresh(referenceentry, obj, i, obj2, l, cacheloader);
            postReadCleanup();
            return obj3;
            Object obj4;
            ValueReference valuereference = referenceentry.getValueReference();
            if (!valuereference.isLoading())
                break MISSING_BLOCK_LABEL_124;
            obj4 = waitForLoadingValue(referenceentry, obj, valuereference);
            postReadCleanup();
            return obj4;
            Object obj1 = lockedGetOrLoad(obj, i, cacheloader);
            postReadCleanup();
            return obj1;
            ExecutionException executionexception;
            executionexception;
            Throwable throwable;
            throwable = executionexception.getCause();
            if (throwable instanceof Error)
                throw new ExecutionError((Error)throwable);
            break MISSING_BLOCK_LABEL_179;
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
            if (throwable instanceof RuntimeException)
                throw new UncheckedExecutionException(throwable);
            else
                throw executionexception;
        }

        Object getAndRecordStats(Object obj, int i, LoadingValueReference loadingvaluereference, ListenableFuture listenablefuture)
            throws ExecutionException
        {
            Object obj1 = null;
            obj1 = Uninterruptibles.getUninterruptibly(listenablefuture);
            if (obj1 != null)
                break MISSING_BLOCK_LABEL_80;
            throw new CacheLoader.InvalidCacheLoadException((new StringBuilder()).append("CacheLoader returned null for key ").append(obj).append(".").toString());
            Exception exception;
            exception;
            if (obj1 == null)
            {
                statsCounter.recordLoadException(loadingvaluereference.elapsedNanos());
                removeLoadingValue(obj, i, loadingvaluereference);
            }
            throw exception;
            statsCounter.recordLoadSuccess(loadingvaluereference.elapsedNanos());
            storeLoadedValue(obj, i, loadingvaluereference, obj1);
            if (obj1 == null)
            {
                statsCounter.recordLoadException(loadingvaluereference.elapsedNanos());
                removeLoadingValue(obj, i, loadingvaluereference);
            }
            return obj1;
        }

        ReferenceEntry getEntry(Object obj, int i)
        {
            for (ReferenceEntry referenceentry = getFirst(i); referenceentry != null; referenceentry = referenceentry.getNext())
            {
                if (referenceentry.getHash() != i)
                    continue;
                Object obj1 = referenceentry.getKey();
                if (obj1 == null)
                {
                    tryDrainReferenceQueues();
                    continue;
                }
                if (map.keyEquivalence.equivalent(obj, obj1))
                    return referenceentry;
            }

            return null;
        }

        ReferenceEntry getFirst(int i)
        {
            AtomicReferenceArray atomicreferencearray = table;
            return (ReferenceEntry)atomicreferencearray.get(i & -1 + atomicreferencearray.length());
        }

        ReferenceEntry getLiveEntry(Object obj, int i, long l)
        {
            ReferenceEntry referenceentry = getEntry(obj, i);
            if (referenceentry == null)
                referenceentry = null;
            else
            if (map.isExpired(referenceentry, l))
            {
                tryExpireEntries(l);
                return null;
            }
            return referenceentry;
        }

        Object getLiveValue(ReferenceEntry referenceentry, long l)
        {
            Object obj;
            if (referenceentry.getKey() == null)
            {
                tryDrainReferenceQueues();
                obj = null;
            } else
            {
                obj = referenceentry.getValueReference().get();
                if (obj == null)
                {
                    tryDrainReferenceQueues();
                    return null;
                }
                if (map.isExpired(referenceentry, l))
                {
                    tryExpireEntries(l);
                    return null;
                }
            }
            return obj;
        }

        ReferenceEntry getNextEvictable()
        {
            for (Iterator iterator = accessQueue.iterator(); iterator.hasNext();)
            {
                ReferenceEntry referenceentry = (ReferenceEntry)iterator.next();
                if (referenceentry.getValueReference().getWeight() > 0)
                    return referenceentry;
            }

            throw new AssertionError();
        }

        void initTable(AtomicReferenceArray atomicreferencearray)
        {
            threshold = (3 * atomicreferencearray.length()) / 4;
            if (!map.customWeigher() && (long)threshold == maxSegmentWeight)
                threshold = 1 + threshold;
            table = atomicreferencearray;
        }

        LoadingValueReference insertLoadingValueReference(Object obj, int i)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup(map.ticker.read());
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L1:
            if (referenceentry1 == null)
                break MISSING_BLOCK_LABEL_183;
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null)
                break MISSING_BLOCK_LABEL_171;
            ValueReference valuereference;
            boolean flag;
            if (!map.keyEquivalence.equivalent(obj, obj1))
                break MISSING_BLOCK_LABEL_171;
            valuereference = referenceentry1.getValueReference();
            flag = valuereference.isLoading();
            if (flag)
            {
                unlock();
                postWriteCleanup();
                return null;
            }
            LoadingValueReference loadingvaluereference;
            modCount = 1 + modCount;
            loadingvaluereference = new LoadingValueReference(valuereference);
            referenceentry1.setValueReference(loadingvaluereference);
            unlock();
            postWriteCleanup();
            return loadingvaluereference;
            referenceentry1 = referenceentry1.getNext();
              goto _L1
            LoadingValueReference loadingvaluereference1;
            modCount = 1 + modCount;
            loadingvaluereference1 = new LoadingValueReference();
            ReferenceEntry referenceentry2 = newEntry(obj, i, referenceentry);
            referenceentry2.setValueReference(loadingvaluereference1);
            atomicreferencearray.set(j, referenceentry2);
            unlock();
            postWriteCleanup();
            return loadingvaluereference1;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        boolean isCollected(ReferenceEntry referenceentry)
        {
            if (referenceentry.getKey() != null)
            {
                ValueReference valuereference = referenceentry.getValueReference();
                if (valuereference.get() != null || !valuereference.isActive())
                    return false;
            }
            return true;
        }

        ListenableFuture loadAsync(final Object key, final int hash, final LoadingValueReference loadingValueReference, CacheLoader cacheloader)
        {
            ListenableFuture listenablefuture = loadingValueReference.loadFuture(key, cacheloader);
            listenablefuture.addListener(listenablefuture. new Runnable() {

                final Segment this$0;
                final int val$hash;
                final Object val$key;
                final ListenableFuture val$loadingFuture;
                final LoadingValueReference val$loadingValueReference;

                public void run()
                {
                    try
                    {
                        Object obj = getAndRecordStats(key, hash, loadingValueReference, loadingFuture);
                        loadingValueReference.set(obj);
                        return;
                    }
                    catch (Throwable throwable)
                    {
                        LocalCache.logger.log(Level.WARNING, "Exception thrown during refresh", throwable);
                        loadingValueReference.setException(throwable);
                        return;
                    }
                }

            
            {
                this$0 = final_segment;
                key = obj;
                hash = i;
                loadingValueReference = loadingvaluereference;
                loadingFuture = ListenableFuture.this;
                super();
            }
            }
, LocalCache.sameThreadExecutor);
            return listenablefuture;
        }

        Object loadSync(Object obj, int i, LoadingValueReference loadingvaluereference, CacheLoader cacheloader)
            throws ExecutionException
        {
            return getAndRecordStats(obj, i, loadingvaluereference, loadingvaluereference.loadFuture(obj, cacheloader));
        }

        Object lockedGetOrLoad(Object obj, int i, CacheLoader cacheloader)
            throws ExecutionException
        {
            boolean flag;
            flag = true;
            lock();
            long l;
            int j;
            AtomicReferenceArray atomicreferencearray;
            int k;
            ReferenceEntry referenceentry;
            l = map.ticker.read();
            preWriteCleanup(l);
            j = -1 + count;
            atomicreferencearray = table;
            k = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(k);
            ReferenceEntry referenceentry1 = referenceentry;
_L17:
            ValueReference valuereference = null;
            if (referenceentry1 == null) goto _L2; else goto _L1
_L1:
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null) goto _L4; else goto _L3
_L3:
            if (!map.keyEquivalence.equivalent(obj, obj1)) goto _L4; else goto _L5
_L5:
            valuereference = referenceentry1.getValueReference();
            if (!valuereference.isLoading()) goto _L7; else goto _L6
_L6:
            flag = false;
_L2:
            LoadingValueReference loadingvaluereference = null;
            if (!flag) goto _L9; else goto _L8
_L8:
            LoadingValueReference loadingvaluereference1 = new LoadingValueReference();
            if (referenceentry1 != null) goto _L11; else goto _L10
_L10:
            referenceentry1 = newEntry(obj, i, referenceentry);
            referenceentry1.setValueReference(loadingvaluereference1);
            atomicreferencearray.set(k, referenceentry1);
            loadingvaluereference = loadingvaluereference1;
_L9:
            unlock();
            postWriteCleanup();
            if (!flag) goto _L13; else goto _L12
_L12:
            referenceentry1;
            JVM INSTR monitorenter ;
            Object obj2 = loadSync(obj, i, loadingvaluereference, cacheloader);
            referenceentry1;
            JVM INSTR monitorexit ;
            statsCounter.recordMisses(1);
            return obj2;
_L7:
            Object obj3 = valuereference.get();
            if (obj3 != null) goto _L15; else goto _L14
_L14:
            RemovalCause removalcause = RemovalCause.COLLECTED;
            enqueueNotification(obj1, i, valuereference, removalcause);
_L16:
            writeQueue.remove(referenceentry1);
            accessQueue.remove(referenceentry1);
            count = j;
              goto _L2
            Exception exception;
            exception;
_L18:
            unlock();
            postWriteCleanup();
            throw exception;
_L15:
label0:
            {
                if (!map.isExpired(referenceentry1, l))
                    break label0;
                RemovalCause removalcause1 = RemovalCause.EXPIRED;
                enqueueNotification(obj1, i, valuereference, removalcause1);
            }
              goto _L16
            recordLockedRead(referenceentry1, l);
            statsCounter.recordHits(1);
            unlock();
            postWriteCleanup();
            return obj3;
_L4:
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
              goto _L17
_L11:
            referenceentry1.setValueReference(loadingvaluereference1);
            loadingvaluereference = loadingvaluereference1;
              goto _L9
            Exception exception2;
            exception2;
            referenceentry1;
            JVM INSTR monitorexit ;
            throw exception2;
            Exception exception1;
            exception1;
            statsCounter.recordMisses(1);
            throw exception1;
_L13:
            return waitForLoadingValue(referenceentry1, obj, valuereference);
            exception;
              goto _L18
        }

        ReferenceEntry newEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            return map.entryFactory.newEntry(this, obj, i, referenceentry);
        }

        AtomicReferenceArray newEntryArray(int i)
        {
            return new AtomicReferenceArray(i);
        }

        void postReadCleanup()
        {
            if ((0x3f & readCount.incrementAndGet()) == 0)
                cleanUp();
        }

        void postWriteCleanup()
        {
            runUnlockedCleanup();
        }

        void preWriteCleanup(long l)
        {
            runLockedCleanup(l);
        }

        Object put(Object obj, int i, Object obj1, boolean flag)
        {
            lock();
            long l;
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            l = map.ticker.read();
            preWriteCleanup(l);
            if (1 + count > threshold)
            {
                expand();
                1 + count;
            }
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break MISSING_BLOCK_LABEL_318;
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_306;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_306;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_236;
            int k;
            modCount = 1 + modCount;
            if (!valuereference.isActive())
                break MISSING_BLOCK_LABEL_215;
            enqueueNotification(obj, i, valuereference, RemovalCause.COLLECTED);
            setValue(referenceentry1, obj, obj1, l);
            k = count;
_L1:
            count = k;
            evictEntries();
            unlock();
            postWriteCleanup();
            return null;
            setValue(referenceentry1, obj, obj1, l);
            k = 1 + count;
              goto _L1
            if (!flag)
                break MISSING_BLOCK_LABEL_260;
            recordLockedRead(referenceentry1, l);
            unlock();
            postWriteCleanup();
            return obj3;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, valuereference, RemovalCause.REPLACED);
            setValue(referenceentry1, obj, obj1, l);
            evictEntries();
            unlock();
            postWriteCleanup();
            return obj3;
            referenceentry1 = referenceentry1.getNext();
              goto _L2
            modCount = 1 + modCount;
            ReferenceEntry referenceentry2 = newEntry(obj, i, referenceentry);
            setValue(referenceentry2, obj, obj1, l);
            atomicreferencearray.set(j, referenceentry2);
            count = 1 + count;
            evictEntries();
            unlock();
            postWriteCleanup();
            return null;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        boolean reclaimKey(ReferenceEntry referenceentry, int i)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry1;
            -1 + count;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry1 = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry2 = referenceentry1;
_L2:
            if (referenceentry2 == null)
                break; /* Loop/switch isn't completed */
            if (referenceentry2 != referenceentry)
                break MISSING_BLOCK_LABEL_126;
            modCount = 1 + modCount;
            ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry1, referenceentry2, referenceentry2.getKey(), i, referenceentry2.getValueReference(), RemovalCause.COLLECTED);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            unlock();
            postWriteCleanup();
            return true;
            ReferenceEntry referenceentry4 = referenceentry2.getNext();
            referenceentry2 = referenceentry4;
            if (true) goto _L2; else goto _L1
_L1:
            unlock();
            postWriteCleanup();
            return false;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        boolean reclaimValue(Object obj, int i, ValueReference valuereference)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            -1 + count;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L12:
            if (referenceentry1 == null) goto _L2; else goto _L1
_L1:
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null) goto _L4; else goto _L3
_L3:
            if (!map.keyEquivalence.equivalent(obj, obj1)) goto _L4; else goto _L5
_L5:
            if (referenceentry1.getValueReference() != valuereference) goto _L7; else goto _L6
_L6:
            modCount = 1 + modCount;
            ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry, referenceentry1, obj1, i, valuereference, RemovalCause.COLLECTED);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            boolean flag1;
            flag1 = true;
            unlock();
            if (!isHeldByCurrentThread())
                postWriteCleanup();
_L9:
            return flag1;
_L7:
            boolean flag;
            unlock();
            flag = isHeldByCurrentThread();
            flag1 = false;
            if (flag) goto _L9; else goto _L8
_L8:
            postWriteCleanup();
            return false;
_L4:
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            continue; /* Loop/switch isn't completed */
_L2:
            boolean flag2;
            unlock();
            flag2 = isHeldByCurrentThread();
            flag1 = false;
            if (flag2) goto _L9; else goto _L10
_L10:
            postWriteCleanup();
            return false;
            Exception exception;
            exception;
            unlock();
            if (!isHeldByCurrentThread())
                postWriteCleanup();
            throw exception;
            if (true) goto _L12; else goto _L11
_L11:
        }

        void recordLockedRead(ReferenceEntry referenceentry, long l)
        {
            if (map.recordsAccess())
                referenceentry.setAccessTime(l);
            accessQueue.add(referenceentry);
        }

        void recordRead(ReferenceEntry referenceentry, long l)
        {
            if (map.recordsAccess())
                referenceentry.setAccessTime(l);
            recencyQueue.add(referenceentry);
        }

        void recordWrite(ReferenceEntry referenceentry, int i, long l)
        {
            drainRecencyQueue();
            totalWeight = i + totalWeight;
            if (map.recordsAccess())
                referenceentry.setAccessTime(l);
            if (map.recordsWrite())
                referenceentry.setWriteTime(l);
            accessQueue.add(referenceentry);
            writeQueue.add(referenceentry);
        }

        Object refresh(Object obj, int i, CacheLoader cacheloader)
        {
            LoadingValueReference loadingvaluereference = insertLoadingValueReference(obj, i);
            ListenableFuture listenablefuture;
            if (loadingvaluereference != null)
                if ((listenablefuture = loadAsync(obj, i, loadingvaluereference, cacheloader)).isDone())
                {
                    Object obj1;
                    try
                    {
                        obj1 = listenablefuture.get();
                    }
                    catch (Throwable throwable)
                    {
                        return null;
                    }
                    return obj1;
                }
            return null;
        }

        Object remove(Object obj, int i)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup(map.ticker.read());
            -1 + count;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L3:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null)
                break MISSING_BLOCK_LABEL_221;
            ValueReference valuereference;
            Object obj2;
            if (!map.keyEquivalence.equivalent(obj, obj1))
                break MISSING_BLOCK_LABEL_221;
            valuereference = referenceentry1.getValueReference();
            obj2 = valuereference.get();
            if (obj2 == null)
                break MISSING_BLOCK_LABEL_193;
            RemovalCause removalcause = RemovalCause.EXPLICIT;
_L1:
            modCount = 1 + modCount;
            ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry, referenceentry1, obj1, i, valuereference, removalcause);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            unlock();
            postWriteCleanup();
            return obj2;
label0:
            {
                if (!valuereference.isActive())
                    break label0;
                removalcause = RemovalCause.COLLECTED;
            }
              goto _L1
            unlock();
            postWriteCleanup();
            return null;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L3; else goto _L2
_L2:
            unlock();
            postWriteCleanup();
            return null;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        boolean remove(Object obj, int i, Object obj1)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup(map.ticker.read());
            -1 + count;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L5:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_258;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_258;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (!map.valueEquivalence.equivalent(obj1, obj3)) goto _L2; else goto _L1
_L1:
            RemovalCause removalcause = RemovalCause.EXPLICIT;
_L3:
            RemovalCause removalcause1;
            modCount = 1 + modCount;
            ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry, referenceentry1, obj2, i, valuereference, removalcause);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            removalcause1 = RemovalCause.EXPLICIT;
            boolean flag;
            if (removalcause == removalcause1)
                flag = true;
            else
                flag = false;
            unlock();
            postWriteCleanup();
            return flag;
_L2:
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_242;
            if (!valuereference.isActive())
                break MISSING_BLOCK_LABEL_242;
            removalcause = RemovalCause.COLLECTED;
              goto _L3
            unlock();
            postWriteCleanup();
            return false;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L5; else goto _L4
_L4:
            unlock();
            postWriteCleanup();
            return false;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        void removeCollectedEntry(ReferenceEntry referenceentry)
        {
            enqueueNotification(referenceentry, RemovalCause.COLLECTED);
            writeQueue.remove(referenceentry);
            accessQueue.remove(referenceentry);
        }

        boolean removeEntry(ReferenceEntry referenceentry, int i, RemovalCause removalcause)
        {
            int _tmp = -1 + count;
            AtomicReferenceArray atomicreferencearray = table;
            int j = i & -1 + atomicreferencearray.length();
            ReferenceEntry referenceentry1 = (ReferenceEntry)atomicreferencearray.get(j);
            for (ReferenceEntry referenceentry2 = referenceentry1; referenceentry2 != null; referenceentry2 = referenceentry2.getNext())
                if (referenceentry2 == referenceentry)
                {
                    modCount = 1 + modCount;
                    ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry1, referenceentry2, referenceentry2.getKey(), i, referenceentry2.getValueReference(), removalcause);
                    int k = -1 + count;
                    atomicreferencearray.set(j, referenceentry3);
                    count = k;
                    return true;
                }

            return false;
        }

        ReferenceEntry removeEntryFromChain(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            int i = count;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            for (ReferenceEntry referenceentry3 = referenceentry; referenceentry3 != referenceentry1; referenceentry3 = referenceentry3.getNext())
                if (isCollected(referenceentry3))
                {
                    removeCollectedEntry(referenceentry3);
                    i--;
                } else
                {
                    referenceentry2 = copyEntry(referenceentry3, referenceentry2);
                }

            count = i;
            return referenceentry2;
        }

        boolean removeLoadingValue(Object obj, int i, LoadingValueReference loadingvaluereference)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L6:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null)
                break MISSING_BLOCK_LABEL_163;
            if (!map.keyEquivalence.equivalent(obj, obj1))
                break MISSING_BLOCK_LABEL_163;
            if (referenceentry1.getValueReference() != loadingvaluereference)
                break MISSING_BLOCK_LABEL_153;
            if (!loadingvaluereference.isActive()) goto _L2; else goto _L1
_L1:
            referenceentry1.setValueReference(loadingvaluereference.getOldValue());
_L4:
            unlock();
            postWriteCleanup();
            return true;
_L2:
            atomicreferencearray.set(j, removeEntryFromChain(referenceentry, referenceentry1));
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
            unlock();
            postWriteCleanup();
            return false;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L6; else goto _L5
_L5:
            unlock();
            postWriteCleanup();
            return false;
        }

        ReferenceEntry removeValueFromChain(ReferenceEntry referenceentry, ReferenceEntry referenceentry1, Object obj, int i, ValueReference valuereference, RemovalCause removalcause)
        {
            enqueueNotification(obj, i, valuereference, removalcause);
            writeQueue.remove(referenceentry1);
            accessQueue.remove(referenceentry1);
            if (valuereference.isLoading())
            {
                valuereference.notifyNewValue(null);
                return referenceentry;
            } else
            {
                return removeEntryFromChain(referenceentry, referenceentry1);
            }
        }

        Object replace(Object obj, int i, Object obj1)
        {
            lock();
            long l;
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            l = map.ticker.read();
            preWriteCleanup(l);
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_248;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_248;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_202;
            if (valuereference.isActive())
            {
                -1 + count;
                modCount = 1 + modCount;
                ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry, referenceentry1, obj2, i, valuereference, RemovalCause.COLLECTED);
                int k = -1 + count;
                atomicreferencearray.set(j, referenceentry3);
                count = k;
            }
            unlock();
            postWriteCleanup();
            return null;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, valuereference, RemovalCause.REPLACED);
            setValue(referenceentry1, obj, obj1, l);
            evictEntries();
            unlock();
            postWriteCleanup();
            return obj3;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L2; else goto _L1
_L1:
            unlock();
            postWriteCleanup();
            return null;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        boolean replace(Object obj, int i, Object obj1, Object obj2)
        {
            lock();
            long l;
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            l = map.ticker.read();
            preWriteCleanup(l);
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj3 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj3 == null)
                break MISSING_BLOCK_LABEL_282;
            ValueReference valuereference;
            Object obj4;
            if (!map.keyEquivalence.equivalent(obj, obj3))
                break MISSING_BLOCK_LABEL_282;
            valuereference = referenceentry1.getValueReference();
            obj4 = valuereference.get();
            if (obj4 != null)
                break MISSING_BLOCK_LABEL_202;
            if (valuereference.isActive())
            {
                -1 + count;
                modCount = 1 + modCount;
                ReferenceEntry referenceentry3 = removeValueFromChain(referenceentry, referenceentry1, obj3, i, valuereference, RemovalCause.COLLECTED);
                int k = -1 + count;
                atomicreferencearray.set(j, referenceentry3);
                count = k;
            }
            unlock();
            postWriteCleanup();
            return false;
            if (!map.valueEquivalence.equivalent(obj1, obj4))
                break MISSING_BLOCK_LABEL_264;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, valuereference, RemovalCause.REPLACED);
            setValue(referenceentry1, obj, obj2, l);
            evictEntries();
            unlock();
            postWriteCleanup();
            return true;
            recordLockedRead(referenceentry1, l);
            unlock();
            postWriteCleanup();
            return false;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L2; else goto _L1
_L1:
            unlock();
            postWriteCleanup();
            return false;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        void runLockedCleanup(long l)
        {
            if (!tryLock())
                break MISSING_BLOCK_LABEL_28;
            drainReferenceQueues();
            expireEntries(l);
            readCount.set(0);
            unlock();
            return;
            Exception exception;
            exception;
            unlock();
            throw exception;
        }

        void runUnlockedCleanup()
        {
            if (!isHeldByCurrentThread())
                map.processPendingNotifications();
        }

        Object scheduleRefresh(ReferenceEntry referenceentry, Object obj, int i, Object obj1, long l, CacheLoader cacheloader)
        {
            if (map.refreshes() && l - referenceentry.getWriteTime() > map.refreshNanos)
            {
                Object obj2 = refresh(obj, i, cacheloader);
                if (obj2 != null)
                    return obj2;
            }
            return obj1;
        }

        void setValue(ReferenceEntry referenceentry, Object obj, Object obj1, long l)
        {
            ValueReference valuereference = referenceentry.getValueReference();
            int i = map.weigher.weigh(obj, obj1);
            boolean flag;
            if (i >= 0)
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag, "Weights must be non-negative");
            referenceentry.setValueReference(map.valueStrength.referenceValue(this, referenceentry, obj1, i));
            recordWrite(referenceentry, i, l);
            valuereference.notifyNewValue(obj1);
        }

        boolean storeLoadedValue(Object obj, int i, LoadingValueReference loadingvaluereference, Object obj1)
        {
            lock();
            long l;
            int j;
            AtomicReferenceArray atomicreferencearray;
            int k;
            ReferenceEntry referenceentry;
            l = map.ticker.read();
            preWriteCleanup(l);
            j = 1 + count;
            atomicreferencearray = table;
            k = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(k);
            ReferenceEntry referenceentry1 = referenceentry;
_L4:
            if (referenceentry1 == null)
                break MISSING_BLOCK_LABEL_261;
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_249;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_249;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (obj3 != null && loadingvaluereference != valuereference)
                break MISSING_BLOCK_LABEL_216;
            modCount = 1 + modCount;
            if (!loadingvaluereference.isActive()) goto _L2; else goto _L1
_L1:
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_208;
            RemovalCause removalcause = RemovalCause.COLLECTED;
_L3:
            enqueueNotification(obj, i, loadingvaluereference, removalcause);
            j--;
_L2:
            setValue(referenceentry1, obj, obj1, l);
            count = j;
            evictEntries();
            unlock();
            postWriteCleanup();
            return true;
            removalcause = RemovalCause.REPLACED;
              goto _L3
            WeightedStrongValueReference weightedstrongvaluereference = new WeightedStrongValueReference(obj1, 0);
            enqueueNotification(obj, i, weightedstrongvaluereference, RemovalCause.REPLACED);
            unlock();
            postWriteCleanup();
            return false;
            referenceentry1 = referenceentry1.getNext();
              goto _L4
            modCount = 1 + modCount;
            ReferenceEntry referenceentry2 = newEntry(obj, i, referenceentry);
            setValue(referenceentry2, obj, obj1, l);
            atomicreferencearray.set(k, referenceentry2);
            count = j;
            evictEntries();
            unlock();
            postWriteCleanup();
            return true;
            Exception exception;
            exception;
            unlock();
            postWriteCleanup();
            throw exception;
        }

        void tryDrainReferenceQueues()
        {
            if (!tryLock())
                break MISSING_BLOCK_LABEL_15;
            drainReferenceQueues();
            unlock();
            return;
            Exception exception;
            exception;
            unlock();
            throw exception;
        }

        void tryExpireEntries(long l)
        {
            if (!tryLock())
                break MISSING_BLOCK_LABEL_16;
            expireEntries(l);
            unlock();
            return;
            Exception exception;
            exception;
            unlock();
            throw exception;
        }

        Object waitForLoadingValue(ReferenceEntry referenceentry, Object obj, ValueReference valuereference)
            throws ExecutionException
        {
            Object obj1;
            if (!valuereference.isLoading())
                throw new AssertionError();
            boolean flag;
            Exception exception;
            if (!Thread.holdsLock(referenceentry))
                flag = true;
            else
                flag = false;
            Preconditions.checkState(flag, "Recursive load");
            obj1 = valuereference.waitForValue();
            if (obj1 != null)
                break MISSING_BLOCK_LABEL_103;
            throw new CacheLoader.InvalidCacheLoadException((new StringBuilder()).append("CacheLoader returned null for key ").append(obj).append(".").toString());
            exception;
            statsCounter.recordMisses(1);
            throw exception;
            recordRead(referenceentry, map.ticker.read());
            statsCounter.recordMisses(1);
            return obj1;
        }

        Segment(LocalCache localcache, int i, long l, AbstractCache.StatsCounter statscounter)
        {
            map = localcache;
            maxSegmentWeight = l;
            statsCounter = statscounter;
            initTable(newEntryArray(i));
            ReferenceQueue referencequeue;
            if (localcache.usesKeyReferences())
                referencequeue = new ReferenceQueue();
            else
                referencequeue = null;
            keyReferenceQueue = referencequeue;
            boolean flag = localcache.usesValueReferences();
            ReferenceQueue referencequeue1 = null;
            if (flag)
                referencequeue1 = new ReferenceQueue();
            valueReferenceQueue = referencequeue1;
            Object obj;
            if (localcache.usesAccessQueue())
                obj = new ConcurrentLinkedQueue();
            else
                obj = LocalCache.discardingQueue();
            recencyQueue = ((Queue) (obj));
            Object obj1;
            if (localcache.usesWriteQueue())
                obj1 = new WriteQueue();
            else
                obj1 = LocalCache.discardingQueue();
            writeQueue = ((Queue) (obj1));
            Object obj2;
            if (localcache.usesAccessQueue())
                obj2 = new AccessQueue();
            else
                obj2 = LocalCache.discardingQueue();
            accessQueue = ((Queue) (obj2));
        }
    }

    static class SoftValueReference extends SoftReference
        implements ValueReference
    {

        final ReferenceEntry entry;

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new SoftValueReference(referencequeue, get(), referenceentry);
        }

        public ReferenceEntry getEntry()
        {
            return entry;
        }

        public int getWeight()
        {
            return 1;
        }

        public boolean isActive()
        {
            return true;
        }

        public boolean isLoading()
        {
            return false;
        }

        public void notifyNewValue(Object obj)
        {
        }

        public Object waitForValue()
        {
            return get();
        }

        SoftValueReference(ReferenceQueue referencequeue, Object obj, ReferenceEntry referenceentry)
        {
            super(obj, referencequeue);
            entry = referenceentry;
        }
    }

    static abstract class Strength extends Enum
    {

        private static final Strength $VALUES[];
        public static final Strength SOFT;
        public static final Strength STRONG;
        public static final Strength WEAK;

        public static Strength valueOf(String s)
        {
            return (Strength)Enum.valueOf(com/google/common/cache/LocalCache$Strength, s);
        }

        public static Strength[] values()
        {
            return (Strength[])$VALUES.clone();
        }

        abstract Equivalence defaultEquivalence();

        abstract ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj, int i);

        static 
        {
            STRONG = new Strength("STRONG", 0) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.equals();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj, int i)
                {
                    if (i == 1)
                        return new StrongValueReference(obj);
                    else
                        return new WeightedStrongValueReference(obj, i);
                }

            }
;
            SOFT = new Strength("SOFT", 1) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.identity();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj, int i)
                {
                    if (i == 1)
                        return new SoftValueReference(segment.valueReferenceQueue, obj, referenceentry);
                    else
                        return new WeightedSoftValueReference(segment.valueReferenceQueue, obj, referenceentry, i);
                }

            }
;
            WEAK = new Strength("WEAK", 2) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.identity();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj, int i)
                {
                    if (i == 1)
                        return new WeakValueReference(segment.valueReferenceQueue, obj, referenceentry);
                    else
                        return new WeightedWeakValueReference(segment.valueReferenceQueue, obj, referenceentry, i);
                }

            }
;
            Strength astrength[] = new Strength[3];
            astrength[0] = STRONG;
            astrength[1] = SOFT;
            astrength[2] = WEAK;
            $VALUES = astrength;
        }

        private Strength(String s, int i)
        {
            super(s, i);
        }

    }

    static final class StrongAccessEntry extends StrongEntry
        implements ReferenceEntry
    {

        volatile long accessTime;
        ReferenceEntry nextAccess;
        ReferenceEntry previousAccess;

        public long getAccessTime()
        {
            return accessTime;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return nextAccess;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return previousAccess;
        }

        public void setAccessTime(long l)
        {
            accessTime = l;
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            nextAccess = referenceentry;
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            previousAccess = referenceentry;
        }

        StrongAccessEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            accessTime = 0x7fffffffffffffffL;
            nextAccess = LocalCache.nullEntry();
            previousAccess = LocalCache.nullEntry();
        }
    }

    static final class StrongAccessWriteEntry extends StrongEntry
        implements ReferenceEntry
    {

        volatile long accessTime;
        ReferenceEntry nextAccess;
        ReferenceEntry nextWrite;
        ReferenceEntry previousAccess;
        ReferenceEntry previousWrite;
        volatile long writeTime;

        public long getAccessTime()
        {
            return accessTime;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return nextAccess;
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            return nextWrite;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return previousAccess;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return previousWrite;
        }

        public long getWriteTime()
        {
            return writeTime;
        }

        public void setAccessTime(long l)
        {
            accessTime = l;
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            nextAccess = referenceentry;
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            nextWrite = referenceentry;
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            previousAccess = referenceentry;
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            previousWrite = referenceentry;
        }

        public void setWriteTime(long l)
        {
            writeTime = l;
        }

        StrongAccessWriteEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            accessTime = 0x7fffffffffffffffL;
            nextAccess = LocalCache.nullEntry();
            previousAccess = LocalCache.nullEntry();
            writeTime = 0x7fffffffffffffffL;
            nextWrite = LocalCache.nullEntry();
            previousWrite = LocalCache.nullEntry();
        }
    }

    static class StrongEntry
        implements ReferenceEntry
    {

        final int hash;
        final Object key;
        final ReferenceEntry next;
        volatile ValueReference valueReference;

        public long getAccessTime()
        {
            throw new UnsupportedOperationException();
        }

        public int getHash()
        {
            return hash;
        }

        public Object getKey()
        {
            return key;
        }

        public ReferenceEntry getNext()
        {
            return next;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            return valueReference;
        }

        public long getWriteTime()
        {
            throw new UnsupportedOperationException();
        }

        public void setAccessTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            valueReference = valuereference;
        }

        public void setWriteTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        StrongEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            valueReference = LocalCache.unset();
            key = obj;
            hash = i;
            next = referenceentry;
        }
    }

    static class StrongValueReference
        implements ValueReference
    {

        final Object referent;

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return this;
        }

        public Object get()
        {
            return referent;
        }

        public ReferenceEntry getEntry()
        {
            return null;
        }

        public int getWeight()
        {
            return 1;
        }

        public boolean isActive()
        {
            return true;
        }

        public boolean isLoading()
        {
            return false;
        }

        public void notifyNewValue(Object obj)
        {
        }

        public Object waitForValue()
        {
            return get();
        }

        StrongValueReference(Object obj)
        {
            referent = obj;
        }
    }

    static final class StrongWriteEntry extends StrongEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextWrite;
        ReferenceEntry previousWrite;
        volatile long writeTime;

        public ReferenceEntry getNextInWriteQueue()
        {
            return nextWrite;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return previousWrite;
        }

        public long getWriteTime()
        {
            return writeTime;
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            nextWrite = referenceentry;
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            previousWrite = referenceentry;
        }

        public void setWriteTime(long l)
        {
            writeTime = l;
        }

        StrongWriteEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            writeTime = 0x7fffffffffffffffL;
            nextWrite = LocalCache.nullEntry();
            previousWrite = LocalCache.nullEntry();
        }
    }

    final class ValueIterator extends HashIterator
        implements Iterator
    {

        final LocalCache this$0;

        public Object next()
        {
            return nextEntry().getValue();
        }

        ValueIterator()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    static interface ValueReference
    {

        public abstract ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry);

        public abstract Object get();

        public abstract ReferenceEntry getEntry();

        public abstract int getWeight();

        public abstract boolean isActive();

        public abstract boolean isLoading();

        public abstract void notifyNewValue(Object obj);

        public abstract Object waitForValue()
            throws ExecutionException;
    }

    final class Values extends AbstractCollection
    {

        final LocalCache this$0;

        public void clear()
        {
            LocalCache.this.clear();
        }

        public boolean contains(Object obj)
        {
            return containsValue(obj);
        }

        public boolean isEmpty()
        {
            return LocalCache.this.isEmpty();
        }

        public Iterator iterator()
        {
            return new ValueIterator();
        }

        public int size()
        {
            return LocalCache.this.size();
        }

        Values()
        {
            this$0 = LocalCache.this;
            super();
        }
    }

    static final class WeakAccessEntry extends WeakEntry
        implements ReferenceEntry
    {

        volatile long accessTime;
        ReferenceEntry nextAccess;
        ReferenceEntry previousAccess;

        public long getAccessTime()
        {
            return accessTime;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return nextAccess;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return previousAccess;
        }

        public void setAccessTime(long l)
        {
            accessTime = l;
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            nextAccess = referenceentry;
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            previousAccess = referenceentry;
        }

        WeakAccessEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            accessTime = 0x7fffffffffffffffL;
            nextAccess = LocalCache.nullEntry();
            previousAccess = LocalCache.nullEntry();
        }
    }

    static final class WeakAccessWriteEntry extends WeakEntry
        implements ReferenceEntry
    {

        volatile long accessTime;
        ReferenceEntry nextAccess;
        ReferenceEntry nextWrite;
        ReferenceEntry previousAccess;
        ReferenceEntry previousWrite;
        volatile long writeTime;

        public long getAccessTime()
        {
            return accessTime;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return nextAccess;
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            return nextWrite;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return previousAccess;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return previousWrite;
        }

        public long getWriteTime()
        {
            return writeTime;
        }

        public void setAccessTime(long l)
        {
            accessTime = l;
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            nextAccess = referenceentry;
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            nextWrite = referenceentry;
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            previousAccess = referenceentry;
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            previousWrite = referenceentry;
        }

        public void setWriteTime(long l)
        {
            writeTime = l;
        }

        WeakAccessWriteEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            accessTime = 0x7fffffffffffffffL;
            nextAccess = LocalCache.nullEntry();
            previousAccess = LocalCache.nullEntry();
            writeTime = 0x7fffffffffffffffL;
            nextWrite = LocalCache.nullEntry();
            previousWrite = LocalCache.nullEntry();
        }
    }

    static class WeakEntry extends WeakReference
        implements ReferenceEntry
    {

        final int hash;
        final ReferenceEntry next;
        volatile ValueReference valueReference;

        public long getAccessTime()
        {
            throw new UnsupportedOperationException();
        }

        public int getHash()
        {
            return hash;
        }

        public Object getKey()
        {
            return get();
        }

        public ReferenceEntry getNext()
        {
            return next;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            return valueReference;
        }

        public long getWriteTime()
        {
            throw new UnsupportedOperationException();
        }

        public void setAccessTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            valueReference = valuereference;
        }

        public void setWriteTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        WeakEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, referencequeue);
            valueReference = LocalCache.unset();
            hash = i;
            next = referenceentry;
        }
    }

    static class WeakValueReference extends WeakReference
        implements ValueReference
    {

        final ReferenceEntry entry;

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new WeakValueReference(referencequeue, get(), referenceentry);
        }

        public ReferenceEntry getEntry()
        {
            return entry;
        }

        public int getWeight()
        {
            return 1;
        }

        public boolean isActive()
        {
            return true;
        }

        public boolean isLoading()
        {
            return false;
        }

        public void notifyNewValue(Object obj)
        {
        }

        public Object waitForValue()
        {
            return get();
        }

        WeakValueReference(ReferenceQueue referencequeue, Object obj, ReferenceEntry referenceentry)
        {
            super(obj, referencequeue);
            entry = referenceentry;
        }
    }

    static final class WeakWriteEntry extends WeakEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextWrite;
        ReferenceEntry previousWrite;
        volatile long writeTime;

        public ReferenceEntry getNextInWriteQueue()
        {
            return nextWrite;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return previousWrite;
        }

        public long getWriteTime()
        {
            return writeTime;
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            nextWrite = referenceentry;
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            previousWrite = referenceentry;
        }

        public void setWriteTime(long l)
        {
            writeTime = l;
        }

        WeakWriteEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            writeTime = 0x7fffffffffffffffL;
            nextWrite = LocalCache.nullEntry();
            previousWrite = LocalCache.nullEntry();
        }
    }

    static final class WeightedSoftValueReference extends SoftValueReference
    {

        final int weight;

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new WeightedSoftValueReference(referencequeue, get(), referenceentry, weight);
        }

        public int getWeight()
        {
            return weight;
        }

        WeightedSoftValueReference(ReferenceQueue referencequeue, Object obj, ReferenceEntry referenceentry, int i)
        {
            super(referencequeue, obj, referenceentry);
            weight = i;
        }
    }

    static final class WeightedStrongValueReference extends StrongValueReference
    {

        final int weight;

        public int getWeight()
        {
            return weight;
        }

        WeightedStrongValueReference(Object obj, int i)
        {
            super(obj);
            weight = i;
        }
    }

    static final class WeightedWeakValueReference extends WeakValueReference
    {

        final int weight;

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new WeightedWeakValueReference(referencequeue, get(), referenceentry, weight);
        }

        public int getWeight()
        {
            return weight;
        }

        WeightedWeakValueReference(ReferenceQueue referencequeue, Object obj, ReferenceEntry referenceentry, int i)
        {
            super(referencequeue, obj, referenceentry);
            weight = i;
        }
    }

    static final class WriteQueue extends AbstractQueue
    {

        final ReferenceEntry head = new _cls1();

        public void clear()
        {
            ReferenceEntry referenceentry1;
            for (ReferenceEntry referenceentry = head.getNextInWriteQueue(); referenceentry != head; referenceentry = referenceentry1)
            {
                referenceentry1 = referenceentry.getNextInWriteQueue();
                LocalCache.nullifyWriteOrder(referenceentry);
            }

            head.setNextInWriteQueue(head);
            head.setPreviousInWriteQueue(head);
        }

        public boolean contains(Object obj)
        {
            return ((ReferenceEntry)obj).getNextInWriteQueue() != NullEntry.INSTANCE;
        }

        public boolean isEmpty()
        {
            return head.getNextInWriteQueue() == head;
        }

        public Iterator iterator()
        {
            return new AbstractLinkedIterator(peek()) {

                final WriteQueue this$0;

                protected ReferenceEntry computeNext(ReferenceEntry referenceentry)
                {
                    ReferenceEntry referenceentry1 = referenceentry.getNextInWriteQueue();
                    if (referenceentry1 == head)
                        referenceentry1 = null;
                    return referenceentry1;
                }

                protected volatile Object computeNext(Object obj)
                {
                    return computeNext((ReferenceEntry)obj);
                }

            
            {
                this$0 = WriteQueue.this;
                super(referenceentry);
            }
            }
;
        }

        public boolean offer(ReferenceEntry referenceentry)
        {
            LocalCache.connectWriteOrder(referenceentry.getPreviousInWriteQueue(), referenceentry.getNextInWriteQueue());
            LocalCache.connectWriteOrder(head.getPreviousInWriteQueue(), referenceentry);
            LocalCache.connectWriteOrder(referenceentry, head);
            return true;
        }

        public volatile boolean offer(Object obj)
        {
            return offer((ReferenceEntry)obj);
        }

        public ReferenceEntry peek()
        {
            ReferenceEntry referenceentry = head.getNextInWriteQueue();
            if (referenceentry == head)
                referenceentry = null;
            return referenceentry;
        }

        public volatile Object peek()
        {
            return peek();
        }

        public ReferenceEntry poll()
        {
            ReferenceEntry referenceentry = head.getNextInWriteQueue();
            if (referenceentry == head)
            {
                return null;
            } else
            {
                remove(referenceentry);
                return referenceentry;
            }
        }

        public volatile Object poll()
        {
            return poll();
        }

        public boolean remove(Object obj)
        {
            ReferenceEntry referenceentry = (ReferenceEntry)obj;
            ReferenceEntry referenceentry1 = referenceentry.getPreviousInWriteQueue();
            ReferenceEntry referenceentry2 = referenceentry.getNextInWriteQueue();
            LocalCache.connectWriteOrder(referenceentry1, referenceentry2);
            LocalCache.nullifyWriteOrder(referenceentry);
            return referenceentry2 != NullEntry.INSTANCE;
        }

        public int size()
        {
            int i = 0;
            for (ReferenceEntry referenceentry = head.getNextInWriteQueue(); referenceentry != head; referenceentry = referenceentry.getNextInWriteQueue())
                i++;

            return i;
        }

    }

    final class WriteThroughEntry
        implements java.util.Map.Entry
    {

        final Object key;
        final LocalCache this$0;
        Object value;

        public boolean equals(Object obj)
        {
            boolean flag = obj instanceof java.util.Map.Entry;
            boolean flag1 = false;
            if (flag)
            {
                java.util.Map.Entry entry = (java.util.Map.Entry)obj;
                boolean flag2 = key.equals(entry.getKey());
                flag1 = false;
                if (flag2)
                {
                    boolean flag3 = value.equals(entry.getValue());
                    flag1 = false;
                    if (flag3)
                        flag1 = true;
                }
            }
            return flag1;
        }

        public Object getKey()
        {
            return key;
        }

        public Object getValue()
        {
            return value;
        }

        public int hashCode()
        {
            return key.hashCode() ^ value.hashCode();
        }

        public Object setValue(Object obj)
        {
            throw new UnsupportedOperationException();
        }

        public String toString()
        {
            return (new StringBuilder()).append(getKey()).append("=").append(getValue()).toString();
        }

        WriteThroughEntry(Object obj, Object obj1)
        {
            this$0 = LocalCache.this;
            super();
            key = obj;
            value = obj1;
        }
    }


    static final int CONTAINS_VALUE_RETRIES = 3;
    static final Queue DISCARDING_QUEUE = new AbstractQueue() {

        public Iterator iterator()
        {
            return Iterators.emptyIterator();
        }

        public boolean offer(Object obj)
        {
            return true;
        }

        public Object peek()
        {
            return null;
        }

        public Object poll()
        {
            return null;
        }

        public int size()
        {
            return 0;
        }

    }
;
    static final int DRAIN_MAX = 16;
    static final int DRAIN_THRESHOLD = 63;
    static final int MAXIMUM_CAPACITY = 0x40000000;
    static final int MAX_SEGMENTS = 0x10000;
    static final ValueReference UNSET = new ValueReference() {

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return this;
        }

        public Object get()
        {
            return null;
        }

        public ReferenceEntry getEntry()
        {
            return null;
        }

        public int getWeight()
        {
            return 0;
        }

        public boolean isActive()
        {
            return false;
        }

        public boolean isLoading()
        {
            return false;
        }

        public void notifyNewValue(Object obj)
        {
        }

        public Object waitForValue()
        {
            return null;
        }

    }
;
    static final Logger logger = Logger.getLogger(com/google/common/cache/LocalCache.getName());
    static final ListeningExecutorService sameThreadExecutor = MoreExecutors.sameThreadExecutor();
    final int concurrencyLevel;
    final CacheLoader defaultLoader;
    final EntryFactory entryFactory;
    Set entrySet;
    final long expireAfterAccessNanos;
    final long expireAfterWriteNanos;
    final AbstractCache.StatsCounter globalStatsCounter;
    final Equivalence keyEquivalence;
    Set keySet;
    final Strength keyStrength;
    final long maxWeight;
    final long refreshNanos;
    final RemovalListener removalListener;
    final Queue removalNotificationQueue;
    final int segmentMask;
    final int segmentShift;
    final Segment segments[];
    final Ticker ticker;
    final Equivalence valueEquivalence;
    final Strength valueStrength;
    Collection values;
    final Weigher weigher;

    LocalCache(CacheBuilder cachebuilder, CacheLoader cacheloader)
    {
        concurrencyLevel = Math.min(cachebuilder.getConcurrencyLevel(), 0x10000);
        keyStrength = cachebuilder.getKeyStrength();
        valueStrength = cachebuilder.getValueStrength();
        keyEquivalence = cachebuilder.getKeyEquivalence();
        valueEquivalence = cachebuilder.getValueEquivalence();
        maxWeight = cachebuilder.getMaximumWeight();
        weigher = cachebuilder.getWeigher();
        expireAfterAccessNanos = cachebuilder.getExpireAfterAccessNanos();
        expireAfterWriteNanos = cachebuilder.getExpireAfterWriteNanos();
        refreshNanos = cachebuilder.getRefreshNanos();
        removalListener = cachebuilder.getRemovalListener();
        Object obj;
        if (removalListener == CacheBuilder.NullListener.INSTANCE)
            obj = discardingQueue();
        else
            obj = new ConcurrentLinkedQueue();
        removalNotificationQueue = ((Queue) (obj));
        ticker = cachebuilder.getTicker(recordsTime());
        entryFactory = EntryFactory.getFactory(keyStrength, usesAccessEntries(), usesWriteEntries());
        globalStatsCounter = (AbstractCache.StatsCounter)cachebuilder.getStatsCounterSupplier().get();
        defaultLoader = cacheloader;
        int i = Math.min(cachebuilder.getInitialCapacity(), 0x40000000);
        if (evictsBySize() && !customWeigher())
            i = Math.min(i, (int)maxWeight);
        int j = 0;
        int k = 1;
        do
        {
            if (k >= concurrencyLevel || evictsBySize() && !customWeigher() && (long)(k * 2) > maxWeight)
            {
                segmentShift = 32 - j;
                segmentMask = k - 1;
                segments = newSegmentArray(k);
                int l = i / k;
                if (l * k < i)
                    l++;
                int i1;
                for (i1 = 1; i1 < l; i1 <<= 1);
                if (evictsBySize())
                {
                    long l1 = 1L + maxWeight / (long)k;
                    long l2 = maxWeight % (long)k;
                    for (int k1 = 0; k1 < segments.length; k1++)
                    {
                        if ((long)k1 == l2)
                            l1--;
                        segments[k1] = createSegment(i1, l1, (AbstractCache.StatsCounter)cachebuilder.getStatsCounterSupplier().get());
                    }

                } else
                {
                    for (int j1 = 0; j1 < segments.length; j1++)
                        segments[j1] = createSegment(i1, -1L, (AbstractCache.StatsCounter)cachebuilder.getStatsCounterSupplier().get());

                }
                return;
            }
            j++;
            k <<= 1;
        } while (true);
    }

    static void connectAccessOrder(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        referenceentry.setNextInAccessQueue(referenceentry1);
        referenceentry1.setPreviousInAccessQueue(referenceentry);
    }

    static void connectWriteOrder(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        referenceentry.setNextInWriteQueue(referenceentry1);
        referenceentry1.setPreviousInWriteQueue(referenceentry);
    }

    static Queue discardingQueue()
    {
        return DISCARDING_QUEUE;
    }

    static ReferenceEntry nullEntry()
    {
        return NullEntry.INSTANCE;
    }

    static void nullifyAccessOrder(ReferenceEntry referenceentry)
    {
        ReferenceEntry referenceentry1 = nullEntry();
        referenceentry.setNextInAccessQueue(referenceentry1);
        referenceentry.setPreviousInAccessQueue(referenceentry1);
    }

    static void nullifyWriteOrder(ReferenceEntry referenceentry)
    {
        ReferenceEntry referenceentry1 = nullEntry();
        referenceentry.setNextInWriteQueue(referenceentry1);
        referenceentry.setPreviousInWriteQueue(referenceentry1);
    }

    static int rehash(int i)
    {
        int j = i + (0xffffcd7d ^ i << 15);
        int k = j ^ j >>> 10;
        int l = k + (k << 3);
        int i1 = l ^ l >>> 6;
        int j1 = i1 + ((i1 << 2) + (i1 << 14));
        return j1 ^ j1 >>> 16;
    }

    static ValueReference unset()
    {
        return UNSET;
    }

    public void cleanUp()
    {
        Segment asegment[] = segments;
        int i = asegment.length;
        for (int j = 0; j < i; j++)
            asegment[j].cleanUp();

    }

    public void clear()
    {
        Segment asegment[] = segments;
        int i = asegment.length;
        for (int j = 0; j < i; j++)
            asegment[j].clear();

    }

    public boolean containsKey(Object obj)
    {
        if (obj == null)
        {
            return false;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).containsKey(obj, i);
        }
    }

    public boolean containsValue(Object obj)
    {
        if (obj == null)
            return false;
        long l = ticker.read();
        Segment asegment[] = segments;
        long l1 = -1L;
        int i = 0;
        do
        {
            if (i >= 3)
                break;
            long l2 = 0L;
            int j = asegment.length;
            for (int k = 0; k < j; k++)
            {
                Segment segment = asegment[k];
                int _tmp = segment.count;
                AtomicReferenceArray atomicreferencearray = segment.table;
                for (int i1 = 0; i1 < atomicreferencearray.length(); i1++)
                {
                    for (ReferenceEntry referenceentry = (ReferenceEntry)atomicreferencearray.get(i1); referenceentry != null; referenceentry = referenceentry.getNext())
                    {
                        Object obj1 = segment.getLiveValue(referenceentry, l);
                        if (obj1 != null && valueEquivalence.equivalent(obj, obj1))
                            return true;
                    }

                }

                l2 += segment.modCount;
            }

            if (l2 == l1)
                break;
            l1 = l2;
            i++;
        } while (true);
        return false;
    }

    ReferenceEntry copyEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        return segmentFor(referenceentry.getHash()).copyEntry(referenceentry, referenceentry1);
    }

    Segment createSegment(int i, long l, AbstractCache.StatsCounter statscounter)
    {
        return new Segment(this, i, l, statscounter);
    }

    boolean customWeigher()
    {
        return weigher != CacheBuilder.OneWeigher.INSTANCE;
    }

    public Set entrySet()
    {
        Set set = entrySet;
        if (set != null)
        {
            return set;
        } else
        {
            EntrySet entryset = new EntrySet();
            entrySet = entryset;
            return entryset;
        }
    }

    boolean evictsBySize()
    {
        return maxWeight >= 0L;
    }

    boolean expires()
    {
        return expiresAfterWrite() || expiresAfterAccess();
    }

    boolean expiresAfterAccess()
    {
        return expireAfterAccessNanos > 0L;
    }

    boolean expiresAfterWrite()
    {
        return expireAfterWriteNanos > 0L;
    }

    public Object get(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).get(obj, i);
        }
    }

    Object get(Object obj, CacheLoader cacheloader)
        throws ExecutionException
    {
        int i = hash(Preconditions.checkNotNull(obj));
        return segmentFor(i).get(obj, i, cacheloader);
    }

    ImmutableMap getAll(Iterable iterable)
        throws ExecutionException
    {
        int i;
        int j;
        java.util.LinkedHashMap linkedhashmap;
        java.util.LinkedHashSet linkedhashset;
        i = 0;
        j = 0;
        linkedhashmap = Maps.newLinkedHashMap();
        linkedhashset = Sets.newLinkedHashSet();
        Iterator iterator = iterable.iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Object obj3 = iterator.next();
            Object obj4 = get(obj3);
            if (!linkedhashmap.containsKey(obj3))
            {
                linkedhashmap.put(obj3, obj4);
                if (obj4 == null)
                {
                    j++;
                    linkedhashset.add(obj3);
                } else
                {
                    i++;
                }
            }
        } while (true);
        boolean flag = linkedhashset.isEmpty();
        if (flag)
            break MISSING_BLOCK_LABEL_295;
        Map map;
        Iterator iterator2;
        map = loadAll(linkedhashset, defaultLoader);
        iterator2 = linkedhashset.iterator();
_L2:
        Object obj1;
        Object obj2;
        if (!iterator2.hasNext())
            break MISSING_BLOCK_LABEL_295;
        obj1 = iterator2.next();
        obj2 = map.get(obj1);
        if (obj2 != null)
            break MISSING_BLOCK_LABEL_280;
        try
        {
            throw new CacheLoader.InvalidCacheLoadException((new StringBuilder()).append("loadAll failed to return a value for ").append(obj1).toString());
        }
        catch (CacheLoader.UnsupportedLoadingOperationException unsupportedloadingoperationexception) { }
        Iterator iterator1 = linkedhashset.iterator();
_L1:
        Object obj;
        if (!iterator1.hasNext())
            break MISSING_BLOCK_LABEL_295;
        obj = iterator1.next();
        j--;
        linkedhashmap.put(obj, get(obj, defaultLoader));
          goto _L1
        Exception exception;
        exception;
        globalStatsCounter.recordHits(i);
        globalStatsCounter.recordMisses(j);
        throw exception;
        linkedhashmap.put(obj1, obj2);
          goto _L2
        ImmutableMap immutablemap = ImmutableMap.copyOf(linkedhashmap);
        globalStatsCounter.recordHits(i);
        globalStatsCounter.recordMisses(j);
        return immutablemap;
    }

    ImmutableMap getAllPresent(Iterable iterable)
    {
        int i = 0;
        int j = 0;
        java.util.LinkedHashMap linkedhashmap = Maps.newLinkedHashMap();
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            Object obj1 = get(obj);
            if (obj1 == null)
            {
                j++;
            } else
            {
                linkedhashmap.put(obj, obj1);
                i++;
            }
        }

        globalStatsCounter.recordHits(i);
        globalStatsCounter.recordMisses(j);
        return ImmutableMap.copyOf(linkedhashmap);
    }

    ReferenceEntry getEntry(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).getEntry(obj, i);
        }
    }

    public Object getIfPresent(Object obj)
    {
        int i = hash(Preconditions.checkNotNull(obj));
        Object obj1 = segmentFor(i).get(obj, i);
        if (obj1 == null)
        {
            globalStatsCounter.recordMisses(1);
            return obj1;
        } else
        {
            globalStatsCounter.recordHits(1);
            return obj1;
        }
    }

    ReferenceEntry getLiveEntry(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).getLiveEntry(obj, i, ticker.read());
        }
    }

    Object getLiveValue(ReferenceEntry referenceentry, long l)
    {
        Object obj;
        if (referenceentry.getKey() == null)
        {
            obj = null;
        } else
        {
            obj = referenceentry.getValueReference().get();
            if (obj == null)
                return null;
            if (isExpired(referenceentry, l))
                return null;
        }
        return obj;
    }

    Object getOrLoad(Object obj)
        throws ExecutionException
    {
        return get(obj, defaultLoader);
    }

    int hash(Object obj)
    {
        return rehash(keyEquivalence.hash(obj));
    }

    void invalidateAll(Iterable iterable)
    {
        for (Iterator iterator = iterable.iterator(); iterator.hasNext(); remove(iterator.next()));
    }

    public boolean isEmpty()
    {
label0:
        {
            long l = 0L;
            Segment asegment[] = segments;
            for (int i = 0; i < asegment.length; i++)
            {
                if (asegment[i].count != 0)
                    break label0;
                l += asegment[i].modCount;
            }

            if (l != 0L)
            {
                for (int j = 0; j < asegment.length; j++)
                {
                    if (asegment[j].count != 0)
                        break label0;
                    l -= asegment[j].modCount;
                }

                if (l != 0L)
                    break label0;
            }
            return true;
        }
        return false;
    }

    boolean isExpired(ReferenceEntry referenceentry, long l)
    {
        return expiresAfterAccess() && l - referenceentry.getAccessTime() > expireAfterAccessNanos || expiresAfterWrite() && l - referenceentry.getWriteTime() > expireAfterWriteNanos;
    }

    boolean isLive(ReferenceEntry referenceentry, long l)
    {
        return segmentFor(referenceentry.getHash()).getLiveValue(referenceentry, l) != null;
    }

    public Set keySet()
    {
        Set set = keySet;
        if (set != null)
        {
            return set;
        } else
        {
            KeySet keyset = new KeySet();
            keySet = keyset;
            return keyset;
        }
    }

    Map loadAll(Set set, CacheLoader cacheloader)
        throws ExecutionException
    {
        Stopwatch stopwatch;
        boolean flag;
        stopwatch = (new Stopwatch()).start();
        flag = false;
        Map map = cacheloader.loadAll(set);
        if (false)
            globalStatsCounter.recordLoadException(stopwatch.elapsedTime(TimeUnit.NANOSECONDS));
        if (map == null)
        {
            globalStatsCounter.recordLoadException(stopwatch.elapsedTime(TimeUnit.NANOSECONDS));
            throw new CacheLoader.InvalidCacheLoadException((new StringBuilder()).append(cacheloader).append(" returned null map from loadAll").toString());
        }
        break MISSING_BLOCK_LABEL_160;
        CacheLoader.UnsupportedLoadingOperationException unsupportedloadingoperationexception;
        unsupportedloadingoperationexception;
        flag = true;
        throw unsupportedloadingoperationexception;
        Exception exception;
        exception;
        if (!flag)
            globalStatsCounter.recordLoadException(stopwatch.elapsedTime(TimeUnit.NANOSECONDS));
        throw exception;
        RuntimeException runtimeexception;
        runtimeexception;
        throw new UncheckedExecutionException(runtimeexception);
        Exception exception1;
        exception1;
        throw new ExecutionException(exception1);
        Error error;
        error;
        throw new ExecutionError(error);
        stopwatch.stop();
        boolean flag1 = false;
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext();)
        {
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            Object obj = entry.getKey();
            Object obj1 = entry.getValue();
            if (obj == null || obj1 == null)
                flag1 = true;
            else
                put(obj, obj1);
        }

        if (flag1)
        {
            globalStatsCounter.recordLoadException(stopwatch.elapsedTime(TimeUnit.NANOSECONDS));
            throw new CacheLoader.InvalidCacheLoadException((new StringBuilder()).append(cacheloader).append(" returned null keys or values from loadAll").toString());
        } else
        {
            globalStatsCounter.recordLoadSuccess(stopwatch.elapsedTime(TimeUnit.NANOSECONDS));
            return map;
        }
    }

    long longSize()
    {
        Segment asegment[] = segments;
        long l = 0L;
        for (int i = 0; i < asegment.length; i++)
            l += asegment[i].count;

        return l;
    }

    ReferenceEntry newEntry(Object obj, int i, ReferenceEntry referenceentry)
    {
        return segmentFor(i).newEntry(obj, i, referenceentry);
    }

    final Segment[] newSegmentArray(int i)
    {
        return new Segment[i];
    }

    ValueReference newValueReference(ReferenceEntry referenceentry, Object obj, int i)
    {
        int j = referenceentry.getHash();
        return valueStrength.referenceValue(segmentFor(j), referenceentry, obj, i);
    }

    void processPendingNotifications()
    {
        do
        {
            RemovalNotification removalnotification = (RemovalNotification)removalNotificationQueue.poll();
            if (removalnotification != null)
                try
                {
                    removalListener.onRemoval(removalnotification);
                }
                catch (Throwable throwable)
                {
                    logger.log(Level.WARNING, "Exception thrown by removal listener", throwable);
                }
            else
                return;
        } while (true);
    }

    public Object put(Object obj, Object obj1)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        int i = hash(obj);
        return segmentFor(i).put(obj, i, obj1, false);
    }

    public void putAll(Map map)
    {
        java.util.Map.Entry entry;
        for (Iterator iterator = map.entrySet().iterator(); iterator.hasNext(); put(entry.getKey(), entry.getValue()))
            entry = (java.util.Map.Entry)iterator.next();

    }

    public Object putIfAbsent(Object obj, Object obj1)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        int i = hash(obj);
        return segmentFor(i).put(obj, i, obj1, true);
    }

    void reclaimKey(ReferenceEntry referenceentry)
    {
        int i = referenceentry.getHash();
        segmentFor(i).reclaimKey(referenceentry, i);
    }

    void reclaimValue(ValueReference valuereference)
    {
        ReferenceEntry referenceentry = valuereference.getEntry();
        int i = referenceentry.getHash();
        segmentFor(i).reclaimValue(referenceentry.getKey(), i, valuereference);
    }

    boolean recordsAccess()
    {
        return expiresAfterAccess();
    }

    boolean recordsTime()
    {
        return recordsWrite() || recordsAccess();
    }

    boolean recordsWrite()
    {
        return expiresAfterWrite() || refreshes();
    }

    void refresh(Object obj)
    {
        int i = hash(Preconditions.checkNotNull(obj));
        segmentFor(i).refresh(obj, i, defaultLoader);
    }

    boolean refreshes()
    {
        return refreshNanos > 0L;
    }

    public Object remove(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).remove(obj, i);
        }
    }

    public boolean remove(Object obj, Object obj1)
    {
        if (obj != null && obj1 != null)
        {
            int i = hash(obj);
            return segmentFor(i).remove(obj, i, obj1);
        } else
        {
            return false;
        }
    }

    public Object replace(Object obj, Object obj1)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj1);
        int i = hash(obj);
        return segmentFor(i).replace(obj, i, obj1);
    }

    public boolean replace(Object obj, Object obj1, Object obj2)
    {
        Preconditions.checkNotNull(obj);
        Preconditions.checkNotNull(obj2);
        if (obj1 == null)
        {
            return false;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).replace(obj, i, obj1, obj2);
        }
    }

    Segment segmentFor(int i)
    {
        return segments[i >>> segmentShift & segmentMask];
    }

    public int size()
    {
        return Ints.saturatedCast(longSize());
    }

    boolean usesAccessEntries()
    {
        return usesAccessQueue() || recordsAccess();
    }

    boolean usesAccessQueue()
    {
        return expiresAfterAccess() || evictsBySize();
    }

    boolean usesKeyReferences()
    {
        return keyStrength != Strength.STRONG;
    }

    boolean usesValueReferences()
    {
        return valueStrength != Strength.STRONG;
    }

    boolean usesWriteEntries()
    {
        return usesWriteQueue() || recordsWrite();
    }

    boolean usesWriteQueue()
    {
        return expiresAfterWrite();
    }

    public Collection values()
    {
        Collection collection = values;
        if (collection != null)
        {
            return collection;
        } else
        {
            Values values1 = new Values();
            values = values1;
            return values1;
        }
    }


    // Unreferenced inner class com/google/common/cache/LocalCache$AccessQueue$1

/* anonymous class */
    class AccessQueue._cls1 extends AbstractReferenceEntry
    {

        ReferenceEntry nextAccess;
        ReferenceEntry previousAccess;
        final AccessQueue this$0;

        public long getAccessTime()
        {
            return 0x7fffffffffffffffL;
        }

        public ReferenceEntry getNextInAccessQueue()
        {
            return nextAccess;
        }

        public ReferenceEntry getPreviousInAccessQueue()
        {
            return previousAccess;
        }

        public void setAccessTime(long l)
        {
        }

        public void setNextInAccessQueue(ReferenceEntry referenceentry)
        {
            nextAccess = referenceentry;
        }

        public void setPreviousInAccessQueue(ReferenceEntry referenceentry)
        {
            previousAccess = referenceentry;
        }

            
            {
                this$0 = AccessQueue.this;
                super();
                nextAccess = this;
                previousAccess = this;
            }
    }


    // Unreferenced inner class com/google/common/cache/LocalCache$WriteQueue$1

/* anonymous class */
    class WriteQueue._cls1 extends AbstractReferenceEntry
    {

        ReferenceEntry nextWrite;
        ReferenceEntry previousWrite;
        final WriteQueue this$0;

        public ReferenceEntry getNextInWriteQueue()
        {
            return nextWrite;
        }

        public ReferenceEntry getPreviousInWriteQueue()
        {
            return previousWrite;
        }

        public long getWriteTime()
        {
            return 0x7fffffffffffffffL;
        }

        public void setNextInWriteQueue(ReferenceEntry referenceentry)
        {
            nextWrite = referenceentry;
        }

        public void setPreviousInWriteQueue(ReferenceEntry referenceentry)
        {
            previousWrite = referenceentry;
        }

        public void setWriteTime(long l)
        {
        }

            
            {
                this$0 = WriteQueue.this;
                super();
                nextWrite = this;
                previousWrite = this;
            }
    }

}
