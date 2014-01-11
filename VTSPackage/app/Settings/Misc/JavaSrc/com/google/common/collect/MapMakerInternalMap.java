// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import com.google.common.primitives.Ints;
import java.io.*;
import java.lang.ref.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.collect:
//            MapMaker, ForwardingConcurrentMap, AbstractLinkedIterator, AbstractMapEntry, 
//            Iterators

class MapMakerInternalMap extends AbstractMap
    implements ConcurrentMap, Serializable
{
    static abstract class AbstractReferenceEntry
        implements ReferenceEntry
    {

        public long getExpirationTime()
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

        public ReferenceEntry getNextEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            throw new UnsupportedOperationException();
        }

        public void setExpirationTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            throw new UnsupportedOperationException();
        }

    }

    static abstract class AbstractSerializationProxy extends ForwardingConcurrentMap
        implements Serializable
    {

        private static final long serialVersionUID = 3L;
        final int concurrencyLevel;
        transient ConcurrentMap _flddelegate;
        final long expireAfterAccessNanos;
        final long expireAfterWriteNanos;
        final Equivalence keyEquivalence;
        final Strength keyStrength;
        final int maximumSize;
        final MapMaker.RemovalListener removalListener;
        final Equivalence valueEquivalence;
        final Strength valueStrength;

        protected volatile Object _mthdelegate()
        {
            return _mthdelegate();
        }

        protected volatile Map _mthdelegate()
        {
            return _mthdelegate();
        }

        protected ConcurrentMap _mthdelegate()
        {
            return _flddelegate;
        }

        void readEntries(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            do
            {
                Object obj = objectinputstream.readObject();
                if (obj == null)
                    return;
                Object obj1 = objectinputstream.readObject();
                _flddelegate.put(obj, obj1);
            } while (true);
        }

        MapMaker readMapMaker(ObjectInputStream objectinputstream)
            throws IOException
        {
            int i = objectinputstream.readInt();
            MapMaker mapmaker = (new MapMaker()).initialCapacity(i).setKeyStrength(keyStrength).setValueStrength(valueStrength).keyEquivalence(keyEquivalence).valueEquivalence(valueEquivalence).concurrencyLevel(concurrencyLevel);
            mapmaker.removalListener(removalListener);
            if (expireAfterWriteNanos > 0L)
                mapmaker.expireAfterWrite(expireAfterWriteNanos, TimeUnit.NANOSECONDS);
            if (expireAfterAccessNanos > 0L)
                mapmaker.expireAfterAccess(expireAfterAccessNanos, TimeUnit.NANOSECONDS);
            if (maximumSize != -1)
                mapmaker.maximumSize(maximumSize);
            return mapmaker;
        }

        void writeMapTo(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.writeInt(_flddelegate.size());
            java.util.Map.Entry entry;
            for (Iterator iterator = _flddelegate.entrySet().iterator(); iterator.hasNext(); objectoutputstream.writeObject(entry.getValue()))
            {
                entry = (java.util.Map.Entry)iterator.next();
                objectoutputstream.writeObject(entry.getKey());
            }

            objectoutputstream.writeObject(null);
        }

        AbstractSerializationProxy(Strength strength, Strength strength1, Equivalence equivalence, Equivalence equivalence1, long l, long l1, int i, int j, MapMaker.RemovalListener removallistener, ConcurrentMap concurrentmap)
        {
            keyStrength = strength;
            valueStrength = strength1;
            keyEquivalence = equivalence;
            valueEquivalence = equivalence1;
            expireAfterWriteNanos = l;
            expireAfterAccessNanos = l1;
            maximumSize = i;
            concurrencyLevel = j;
            removalListener = removallistener;
            _flddelegate = concurrentmap;
        }
    }

    static final class CleanupMapTask
        implements Runnable
    {

        final WeakReference mapReference;

        public void run()
        {
            MapMakerInternalMap mapmakerinternalmap = (MapMakerInternalMap)mapReference.get();
            if (mapmakerinternalmap == null)
                throw new CancellationException();
            Segment asegment[] = mapmakerinternalmap.segments;
            int i = asegment.length;
            for (int j = 0; j < i; j++)
                asegment[j].runCleanup();

        }

        public CleanupMapTask(MapMakerInternalMap mapmakerinternalmap)
        {
            mapReference = new WeakReference(mapmakerinternalmap);
        }
    }

    static abstract class EntryFactory extends Enum
    {

        private static final EntryFactory $VALUES[];
        static final int EVICTABLE_MASK = 2;
        static final int EXPIRABLE_MASK = 1;
        public static final EntryFactory SOFT;
        public static final EntryFactory SOFT_EVICTABLE;
        public static final EntryFactory SOFT_EXPIRABLE;
        public static final EntryFactory SOFT_EXPIRABLE_EVICTABLE;
        public static final EntryFactory STRONG;
        public static final EntryFactory STRONG_EVICTABLE;
        public static final EntryFactory STRONG_EXPIRABLE;
        public static final EntryFactory STRONG_EXPIRABLE_EVICTABLE;
        public static final EntryFactory WEAK;
        public static final EntryFactory WEAK_EVICTABLE;
        public static final EntryFactory WEAK_EXPIRABLE;
        public static final EntryFactory WEAK_EXPIRABLE_EVICTABLE;
        static final EntryFactory factories[][];

        static EntryFactory getFactory(Strength strength, boolean flag, boolean flag1)
        {
            boolean flag2;
            if (flag)
                flag2 = true;
            else
                flag2 = false;
            byte byte0 = 0;
            if (flag1)
                byte0 = 2;
            int i = flag2 | byte0;
            return factories[strength.ordinal()][i];
        }

        public static EntryFactory valueOf(String s)
        {
            return (EntryFactory)Enum.valueOf(com/google/common/collect/MapMakerInternalMap$EntryFactory, s);
        }

        public static EntryFactory[] values()
        {
            return (EntryFactory[])$VALUES.clone();
        }

        ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            return newEntry(segment, referenceentry.getKey(), referenceentry.getHash(), referenceentry1);
        }

        void copyEvictableEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            MapMakerInternalMap.connectEvictables(referenceentry.getPreviousEvictable(), referenceentry1);
            MapMakerInternalMap.connectEvictables(referenceentry1, referenceentry.getNextEvictable());
            MapMakerInternalMap.nullifyEvictable(referenceentry);
        }

        void copyExpirableEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            referenceentry1.setExpirationTime(referenceentry.getExpirationTime());
            MapMakerInternalMap.connectExpirables(referenceentry.getPreviousExpirable(), referenceentry1);
            MapMakerInternalMap.connectExpirables(referenceentry1, referenceentry.getNextExpirable());
            MapMakerInternalMap.nullifyExpirable(referenceentry);
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
            STRONG_EXPIRABLE = new EntryFactory("STRONG_EXPIRABLE", 1) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongExpirableEntry(obj, i, referenceentry);
                }

            }
;
            STRONG_EVICTABLE = new EntryFactory("STRONG_EVICTABLE", 2) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongEvictableEntry(obj, i, referenceentry);
                }

            }
;
            STRONG_EXPIRABLE_EVICTABLE = new EntryFactory("STRONG_EXPIRABLE_EVICTABLE", 3) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new StrongExpirableEvictableEntry(obj, i, referenceentry);
                }

            }
;
            SOFT = new EntryFactory("SOFT", 4) {

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new SoftEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            SOFT_EXPIRABLE = new EntryFactory("SOFT_EXPIRABLE", 5) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new SoftExpirableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            SOFT_EVICTABLE = new EntryFactory("SOFT_EVICTABLE", 6) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new SoftEvictableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            SOFT_EXPIRABLE_EVICTABLE = new EntryFactory("SOFT_EXPIRABLE_EVICTABLE", 7) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new SoftExpirableEvictableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK = new EntryFactory("WEAK", 8) {

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_EXPIRABLE = new EntryFactory("WEAK_EXPIRABLE", 9) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakExpirableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_EVICTABLE = new EntryFactory("WEAK_EVICTABLE", 10) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakEvictableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            WEAK_EXPIRABLE_EVICTABLE = new EntryFactory("WEAK_EXPIRABLE_EVICTABLE", 11) {

                ReferenceEntry copyEntry(Segment segment, ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
                {
                    ReferenceEntry referenceentry2 = super.copyEntry(segment, referenceentry, referenceentry1);
                    copyExpirableEntry(referenceentry, referenceentry2);
                    copyEvictableEntry(referenceentry, referenceentry2);
                    return referenceentry2;
                }

                ReferenceEntry newEntry(Segment segment, Object obj, int i, ReferenceEntry referenceentry)
                {
                    return new WeakExpirableEvictableEntry(segment.keyReferenceQueue, obj, i, referenceentry);
                }

            }
;
            EntryFactory aentryfactory[] = new EntryFactory[12];
            aentryfactory[0] = STRONG;
            aentryfactory[1] = STRONG_EXPIRABLE;
            aentryfactory[2] = STRONG_EVICTABLE;
            aentryfactory[3] = STRONG_EXPIRABLE_EVICTABLE;
            aentryfactory[4] = SOFT;
            aentryfactory[5] = SOFT_EXPIRABLE;
            aentryfactory[6] = SOFT_EVICTABLE;
            aentryfactory[7] = SOFT_EXPIRABLE_EVICTABLE;
            aentryfactory[8] = WEAK;
            aentryfactory[9] = WEAK_EXPIRABLE;
            aentryfactory[10] = WEAK_EVICTABLE;
            aentryfactory[11] = WEAK_EXPIRABLE_EVICTABLE;
            $VALUES = aentryfactory;
            EntryFactory aentryfactory1[][] = new EntryFactory[3][];
            EntryFactory aentryfactory2[] = new EntryFactory[4];
            aentryfactory2[0] = STRONG;
            aentryfactory2[1] = STRONG_EXPIRABLE;
            aentryfactory2[2] = STRONG_EVICTABLE;
            aentryfactory2[3] = STRONG_EXPIRABLE_EVICTABLE;
            aentryfactory1[0] = aentryfactory2;
            EntryFactory aentryfactory3[] = new EntryFactory[4];
            aentryfactory3[0] = SOFT;
            aentryfactory3[1] = SOFT_EXPIRABLE;
            aentryfactory3[2] = SOFT_EVICTABLE;
            aentryfactory3[3] = SOFT_EXPIRABLE_EVICTABLE;
            aentryfactory1[1] = aentryfactory3;
            EntryFactory aentryfactory4[] = new EntryFactory[4];
            aentryfactory4[0] = WEAK;
            aentryfactory4[1] = WEAK_EXPIRABLE;
            aentryfactory4[2] = WEAK_EVICTABLE;
            aentryfactory4[3] = WEAK_EXPIRABLE_EVICTABLE;
            aentryfactory1[2] = aentryfactory4;
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

        final MapMakerInternalMap this$0;

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
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    final class EntrySet extends AbstractSet
    {

        final MapMakerInternalMap this$0;

        public void clear()
        {
            MapMakerInternalMap.this.clear();
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
            return MapMakerInternalMap.this.isEmpty();
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
                if (obj1 != null && MapMakerInternalMap.this.remove(obj1, entry.getValue()))
                    return true;
            }
            return false;
        }

        public int size()
        {
            return MapMakerInternalMap.this.size();
        }

        EntrySet()
        {
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    static final class EvictionQueue extends AbstractQueue
    {

        final ReferenceEntry head = new _cls1();

        public void clear()
        {
            ReferenceEntry referenceentry1;
            for (ReferenceEntry referenceentry = head.getNextEvictable(); referenceentry != head; referenceentry = referenceentry1)
            {
                referenceentry1 = referenceentry.getNextEvictable();
                MapMakerInternalMap.nullifyEvictable(referenceentry);
            }

            head.setNextEvictable(head);
            head.setPreviousEvictable(head);
        }

        public boolean contains(Object obj)
        {
            return ((ReferenceEntry)obj).getNextEvictable() != NullEntry.INSTANCE;
        }

        public boolean isEmpty()
        {
            return head.getNextEvictable() == head;
        }

        public Iterator iterator()
        {
            return new AbstractLinkedIterator(peek()) {

                final EvictionQueue this$0;

                protected ReferenceEntry computeNext(ReferenceEntry referenceentry)
                {
                    ReferenceEntry referenceentry1 = referenceentry.getNextEvictable();
                    if (referenceentry1 == head)
                        referenceentry1 = null;
                    return referenceentry1;
                }

                protected volatile Object computeNext(Object obj)
                {
                    return computeNext((ReferenceEntry)obj);
                }

            
            {
                this$0 = EvictionQueue.this;
                super(referenceentry);
            }
            }
;
        }

        public boolean offer(ReferenceEntry referenceentry)
        {
            MapMakerInternalMap.connectEvictables(referenceentry.getPreviousEvictable(), referenceentry.getNextEvictable());
            MapMakerInternalMap.connectEvictables(head.getPreviousEvictable(), referenceentry);
            MapMakerInternalMap.connectEvictables(referenceentry, head);
            return true;
        }

        public volatile boolean offer(Object obj)
        {
            return offer((ReferenceEntry)obj);
        }

        public ReferenceEntry peek()
        {
            ReferenceEntry referenceentry = head.getNextEvictable();
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
            ReferenceEntry referenceentry = head.getNextEvictable();
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
            ReferenceEntry referenceentry1 = referenceentry.getPreviousEvictable();
            ReferenceEntry referenceentry2 = referenceentry.getNextEvictable();
            MapMakerInternalMap.connectEvictables(referenceentry1, referenceentry2);
            MapMakerInternalMap.nullifyEvictable(referenceentry);
            return referenceentry2 != NullEntry.INSTANCE;
        }

        public int size()
        {
            int i = 0;
            for (ReferenceEntry referenceentry = head.getNextEvictable(); referenceentry != head; referenceentry = referenceentry.getNextEvictable())
                i++;

            return i;
        }

    }

    static final class ExpirationQueue extends AbstractQueue
    {

        final ReferenceEntry head = new _cls1();

        public void clear()
        {
            ReferenceEntry referenceentry1;
            for (ReferenceEntry referenceentry = head.getNextExpirable(); referenceentry != head; referenceentry = referenceentry1)
            {
                referenceentry1 = referenceentry.getNextExpirable();
                MapMakerInternalMap.nullifyExpirable(referenceentry);
            }

            head.setNextExpirable(head);
            head.setPreviousExpirable(head);
        }

        public boolean contains(Object obj)
        {
            return ((ReferenceEntry)obj).getNextExpirable() != NullEntry.INSTANCE;
        }

        public boolean isEmpty()
        {
            return head.getNextExpirable() == head;
        }

        public Iterator iterator()
        {
            return new AbstractLinkedIterator(peek()) {

                final ExpirationQueue this$0;

                protected ReferenceEntry computeNext(ReferenceEntry referenceentry)
                {
                    ReferenceEntry referenceentry1 = referenceentry.getNextExpirable();
                    if (referenceentry1 == head)
                        referenceentry1 = null;
                    return referenceentry1;
                }

                protected volatile Object computeNext(Object obj)
                {
                    return computeNext((ReferenceEntry)obj);
                }

            
            {
                this$0 = ExpirationQueue.this;
                super(referenceentry);
            }
            }
;
        }

        public boolean offer(ReferenceEntry referenceentry)
        {
            MapMakerInternalMap.connectExpirables(referenceentry.getPreviousExpirable(), referenceentry.getNextExpirable());
            MapMakerInternalMap.connectExpirables(head.getPreviousExpirable(), referenceentry);
            MapMakerInternalMap.connectExpirables(referenceentry, head);
            return true;
        }

        public volatile boolean offer(Object obj)
        {
            return offer((ReferenceEntry)obj);
        }

        public ReferenceEntry peek()
        {
            ReferenceEntry referenceentry = head.getNextExpirable();
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
            ReferenceEntry referenceentry = head.getNextExpirable();
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
            ReferenceEntry referenceentry1 = referenceentry.getPreviousExpirable();
            ReferenceEntry referenceentry2 = referenceentry.getNextExpirable();
            MapMakerInternalMap.connectExpirables(referenceentry1, referenceentry2);
            MapMakerInternalMap.nullifyExpirable(referenceentry);
            return referenceentry2 != NullEntry.INSTANCE;
        }

        public int size()
        {
            int i = 0;
            for (ReferenceEntry referenceentry = head.getNextExpirable(); referenceentry != head; referenceentry = referenceentry.getNextExpirable())
                i++;

            return i;
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
        final MapMakerInternalMap this$0;

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
            obj = referenceentry.getKey();
            obj1 = getLiveValue(referenceentry);
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_49;
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
            MapMakerInternalMap.this.remove(lastReturned.getKey());
            lastReturned = null;
        }

        HashIterator()
        {
            this$0 = MapMakerInternalMap.this;
            super();
            nextSegmentIndex = -1 + segments.length;
            nextTableIndex = -1;
            advance();
        }
    }

    final class KeyIterator extends HashIterator
        implements Iterator
    {

        final MapMakerInternalMap this$0;

        public Object next()
        {
            return nextEntry().getKey();
        }

        KeyIterator()
        {
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    final class KeySet extends AbstractSet
    {

        final MapMakerInternalMap this$0;

        public void clear()
        {
            MapMakerInternalMap.this.clear();
        }

        public boolean contains(Object obj)
        {
            return containsKey(obj);
        }

        public boolean isEmpty()
        {
            return MapMakerInternalMap.this.isEmpty();
        }

        public Iterator iterator()
        {
            return new KeyIterator();
        }

        public boolean remove(Object obj)
        {
            return MapMakerInternalMap.this.remove(obj) != null;
        }

        public int size()
        {
            return MapMakerInternalMap.this.size();
        }

        KeySet()
        {
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    private static final class NullEntry extends Enum
        implements ReferenceEntry
    {

        private static final NullEntry $VALUES[];
        public static final NullEntry INSTANCE;

        public static NullEntry valueOf(String s)
        {
            return (NullEntry)Enum.valueOf(com/google/common/collect/MapMakerInternalMap$NullEntry, s);
        }

        public static NullEntry[] values()
        {
            return (NullEntry[])$VALUES.clone();
        }

        public long getExpirationTime()
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

        public ReferenceEntry getNextEvictable()
        {
            return this;
        }

        public ReferenceEntry getNextExpirable()
        {
            return this;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return this;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return this;
        }

        public ValueReference getValueReference()
        {
            return null;
        }

        public void setExpirationTime(long l)
        {
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
        }

        public void setValueReference(ValueReference valuereference)
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

        public abstract long getExpirationTime();

        public abstract int getHash();

        public abstract Object getKey();

        public abstract ReferenceEntry getNext();

        public abstract ReferenceEntry getNextEvictable();

        public abstract ReferenceEntry getNextExpirable();

        public abstract ReferenceEntry getPreviousEvictable();

        public abstract ReferenceEntry getPreviousExpirable();

        public abstract ValueReference getValueReference();

        public abstract void setExpirationTime(long l);

        public abstract void setNextEvictable(ReferenceEntry referenceentry);

        public abstract void setNextExpirable(ReferenceEntry referenceentry);

        public abstract void setPreviousEvictable(ReferenceEntry referenceentry);

        public abstract void setPreviousExpirable(ReferenceEntry referenceentry);

        public abstract void setValueReference(ValueReference valuereference);
    }

    static class Segment extends ReentrantLock
    {

        volatile int count;
        final Queue evictionQueue;
        final Queue expirationQueue;
        final ReferenceQueue keyReferenceQueue;
        final MapMakerInternalMap map;
        final int maxSegmentSize;
        int modCount;
        final AtomicInteger readCount = new AtomicInteger();
        final Queue recencyQueue;
        volatile AtomicReferenceArray table;
        int threshold;
        final ReferenceQueue valueReferenceQueue;

        void clear()
        {
            if (count == 0) goto _L2; else goto _L1
_L1:
            lock();
            AtomicReferenceArray atomicreferencearray;
            atomicreferencearray = table;
            if (map.removalNotificationQueue == MapMakerInternalMap.DISCARDING_QUEUE)
                break MISSING_BLOCK_LABEL_183;
            int i = 0;
_L7:
            ReferenceEntry referenceentry;
            if (i >= atomicreferencearray.length())
                break MISSING_BLOCK_LABEL_183;
            referenceentry = (ReferenceEntry)atomicreferencearray.get(i);
_L4:
            if (referenceentry == null)
                break; /* Loop/switch isn't completed */
            if (!referenceentry.getValueReference().isComputingReference())
                enqueueNotification(referenceentry, MapMaker.RemovalCause.EXPLICIT);
            referenceentry = referenceentry.getNext();
            if (true) goto _L4; else goto _L3
_L5:
            Exception exception;
            int j;
            for (; j >= atomicreferencearray.length(); j = 0)
                break MISSING_BLOCK_LABEL_112;

            atomicreferencearray.set(j, null);
            j++;
              goto _L5
            clearReferenceQueues();
            evictionQueue.clear();
            expirationQueue.clear();
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

        boolean clearValue(Object obj, int i, ValueReference valuereference)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj1 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj1 == null)
                break MISSING_BLOCK_LABEL_129;
            if (!map.keyEquivalence.equivalent(obj, obj1))
                break MISSING_BLOCK_LABEL_129;
            if (referenceentry1.getValueReference() != valuereference)
                break MISSING_BLOCK_LABEL_119;
            atomicreferencearray.set(j, removeFromChain(referenceentry, referenceentry1));
            unlock();
            postWriteCleanup();
            return true;
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

        void clearValueReferenceQueue()
        {
            while (valueReferenceQueue.poll() != null) ;
        }

        boolean containsKey(Object obj, int i)
        {
            ReferenceEntry referenceentry;
            if (count == 0)
                break MISSING_BLOCK_LABEL_58;
            referenceentry = getLiveEntry(obj, i);
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
            AtomicReferenceArray atomicreferencearray;
            int i;
            atomicreferencearray = table;
            i = atomicreferencearray.length();
            int j = 0;
_L7:
            if (j >= i)
                break; /* Loop/switch isn't completed */
            ReferenceEntry referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
_L4:
            if (referenceentry == null)
                break MISSING_BLOCK_LABEL_95;
            Object obj1 = getLiveValue(referenceentry);
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
                if (evictionQueue.contains(referenceentry))
                    evictionQueue.add(referenceentry);
                if (map.expiresAfterAccess() && expirationQueue.contains(referenceentry))
                    expirationQueue.add(referenceentry);
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

        void enqueueNotification(ReferenceEntry referenceentry, MapMaker.RemovalCause removalcause)
        {
            enqueueNotification(referenceentry.getKey(), referenceentry.getHash(), referenceentry.getValueReference().get(), removalcause);
        }

        void enqueueNotification(Object obj, int i, Object obj1, MapMaker.RemovalCause removalcause)
        {
            if (map.removalNotificationQueue != MapMakerInternalMap.DISCARDING_QUEUE)
            {
                MapMaker.RemovalNotification removalnotification = new MapMaker.RemovalNotification(obj, obj1, removalcause);
                map.removalNotificationQueue.offer(removalnotification);
            }
        }

        boolean evictEntries()
        {
            if (map.evictsBySize() && count >= maxSegmentSize)
            {
                drainRecencyQueue();
                ReferenceEntry referenceentry = (ReferenceEntry)evictionQueue.remove();
                if (!removeEntry(referenceentry, referenceentry.getHash(), MapMaker.RemovalCause.SIZE))
                    throw new AssertionError();
                else
                    return true;
            } else
            {
                return false;
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

        void expireEntries()
        {
label0:
            {
                drainRecencyQueue();
                if (expirationQueue.isEmpty())
                    break label0;
                long l = map.ticker.read();
                ReferenceEntry referenceentry;
                do
                {
                    referenceentry = (ReferenceEntry)expirationQueue.peek();
                    if (referenceentry == null || !map.isExpired(referenceentry, l))
                        break label0;
                } while (removeEntry(referenceentry, referenceentry.getHash(), MapMaker.RemovalCause.EXPIRED));
                throw new AssertionError();
            }
        }

        Object get(Object obj, int i)
        {
            ReferenceEntry referenceentry = getLiveEntry(obj, i);
            if (referenceentry == null)
            {
                postReadCleanup();
                return null;
            }
            Object obj1 = referenceentry.getValueReference().get();
            if (obj1 == null) goto _L2; else goto _L1
_L1:
            recordRead(referenceentry);
_L4:
            postReadCleanup();
            return obj1;
_L2:
            tryDrainReferenceQueues();
            if (true) goto _L4; else goto _L3
_L3:
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
        }

        ReferenceEntry getEntry(Object obj, int i)
        {
            if (count != 0)
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

            }
            return null;
        }

        ReferenceEntry getFirst(int i)
        {
            AtomicReferenceArray atomicreferencearray = table;
            return (ReferenceEntry)atomicreferencearray.get(i & -1 + atomicreferencearray.length());
        }

        ReferenceEntry getLiveEntry(Object obj, int i)
        {
            ReferenceEntry referenceentry = getEntry(obj, i);
            if (referenceentry == null)
                referenceentry = null;
            else
            if (map.expires() && map.isExpired(referenceentry))
            {
                tryExpireEntries();
                return null;
            }
            return referenceentry;
        }

        Object getLiveValue(ReferenceEntry referenceentry)
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
                if (map.expires() && map.isExpired(referenceentry))
                {
                    tryExpireEntries();
                    return null;
                }
            }
            return obj;
        }

        void initTable(AtomicReferenceArray atomicreferencearray)
        {
            threshold = (3 * atomicreferencearray.length()) / 4;
            if (threshold == maxSegmentSize)
                threshold = 1 + threshold;
            table = atomicreferencearray;
        }

        boolean isCollected(ReferenceEntry referenceentry)
        {
            if (referenceentry.getKey() == null)
                return true;
            else
                return isCollected(referenceentry.getValueReference());
        }

        boolean isCollected(ValueReference valuereference)
        {
            return !valuereference.isComputingReference() && valuereference.get() == null;
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
                runCleanup();
        }

        void postWriteCleanup()
        {
            runUnlockedCleanup();
        }

        void preWriteCleanup()
        {
            runLockedCleanup();
        }

        Object put(Object obj, int i, Object obj1, boolean flag)
        {
            lock();
            int j;
            AtomicReferenceArray atomicreferencearray;
            int k;
            ReferenceEntry referenceentry;
            preWriteCleanup();
            j = 1 + count;
            if (j > threshold)
            {
                expand();
                j = 1 + count;
            }
            atomicreferencearray = table;
            k = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(k);
            ReferenceEntry referenceentry1 = referenceentry;
_L5:
            if (referenceentry1 == null)
                break MISSING_BLOCK_LABEL_290;
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_278;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_278;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_217;
            modCount = 1 + modCount;
            setValue(referenceentry1, obj1);
            if (valuereference.isComputingReference()) goto _L2; else goto _L1
_L1:
            enqueueNotification(obj, i, obj3, MapMaker.RemovalCause.COLLECTED);
            j = count;
_L4:
            count = j;
            unlock();
            postWriteCleanup();
            return null;
_L2:
            if (!evictEntries()) goto _L4; else goto _L3
_L3:
            j = 1 + count;
              goto _L4
            if (!flag)
                break MISSING_BLOCK_LABEL_239;
            recordLockedRead(referenceentry1);
            unlock();
            postWriteCleanup();
            return obj3;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, obj3, MapMaker.RemovalCause.REPLACED);
            setValue(referenceentry1, obj1);
            unlock();
            postWriteCleanup();
            return obj3;
            referenceentry1 = referenceentry1.getNext();
              goto _L5
            modCount = 1 + modCount;
            ReferenceEntry referenceentry2 = newEntry(obj, i, referenceentry);
            setValue(referenceentry2, obj1);
            atomicreferencearray.set(k, referenceentry2);
            if (evictEntries())
                j = 1 + count;
            count = j;
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
                break MISSING_BLOCK_LABEL_135;
            modCount = 1 + modCount;
            enqueueNotification(referenceentry2.getKey(), i, referenceentry2.getValueReference().get(), MapMaker.RemovalCause.COLLECTED);
            ReferenceEntry referenceentry3 = removeFromChain(referenceentry1, referenceentry2);
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
            enqueueNotification(obj, i, valuereference.get(), MapMaker.RemovalCause.COLLECTED);
            ReferenceEntry referenceentry3 = removeFromChain(referenceentry, referenceentry1);
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

        void recordExpirationTime(ReferenceEntry referenceentry, long l)
        {
            referenceentry.setExpirationTime(l + map.ticker.read());
        }

        void recordLockedRead(ReferenceEntry referenceentry)
        {
            evictionQueue.add(referenceentry);
            if (map.expiresAfterAccess())
            {
                recordExpirationTime(referenceentry, map.expireAfterAccessNanos);
                expirationQueue.add(referenceentry);
            }
        }

        void recordRead(ReferenceEntry referenceentry)
        {
            if (map.expiresAfterAccess())
                recordExpirationTime(referenceentry, map.expireAfterAccessNanos);
            recencyQueue.add(referenceentry);
        }

        void recordWrite(ReferenceEntry referenceentry)
        {
            drainRecencyQueue();
            evictionQueue.add(referenceentry);
            if (map.expires())
            {
                long l;
                if (map.expiresAfterAccess())
                    l = map.expireAfterAccessNanos;
                else
                    l = map.expireAfterWriteNanos;
                recordExpirationTime(referenceentry, l);
                expirationQueue.add(referenceentry);
            }
        }

        Object remove(Object obj, int i)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup();
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
                break MISSING_BLOCK_LABEL_214;
            ValueReference valuereference;
            Object obj2;
            if (!map.keyEquivalence.equivalent(obj, obj1))
                break MISSING_BLOCK_LABEL_214;
            valuereference = referenceentry1.getValueReference();
            obj2 = valuereference.get();
            if (obj2 == null)
                break MISSING_BLOCK_LABEL_187;
            MapMaker.RemovalCause removalcause = MapMaker.RemovalCause.EXPLICIT;
_L1:
            modCount = 1 + modCount;
            enqueueNotification(obj1, i, obj2, removalcause);
            ReferenceEntry referenceentry3 = removeFromChain(referenceentry, referenceentry1);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            unlock();
            postWriteCleanup();
            return obj2;
label0:
            {
                if (!isCollected(valuereference))
                    break label0;
                removalcause = MapMaker.RemovalCause.COLLECTED;
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
            preWriteCleanup();
            -1 + count;
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L3:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_243;
            ValueReference valuereference;
            Object obj3;
            MapMaker.RemovalCause removalcause;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_243;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (!map.valueEquivalence.equivalent(obj1, obj3))
                break MISSING_BLOCK_LABEL_216;
            removalcause = MapMaker.RemovalCause.EXPLICIT;
_L1:
            MapMaker.RemovalCause removalcause1;
            modCount = 1 + modCount;
            enqueueNotification(obj2, i, obj3, removalcause);
            ReferenceEntry referenceentry3 = removeFromChain(referenceentry, referenceentry1);
            int k = -1 + count;
            atomicreferencearray.set(j, referenceentry3);
            count = k;
            removalcause1 = MapMaker.RemovalCause.EXPLICIT;
            boolean flag = false;
            if (removalcause == removalcause1)
                flag = true;
            unlock();
            postWriteCleanup();
            return flag;
label0:
            {
                if (!isCollected(valuereference))
                    break label0;
                removalcause = MapMaker.RemovalCause.COLLECTED;
            }
              goto _L1
            unlock();
            postWriteCleanup();
            return false;
            ReferenceEntry referenceentry2 = referenceentry1.getNext();
            referenceentry1 = referenceentry2;
            if (true) goto _L3; else goto _L2
_L2:
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
            enqueueNotification(referenceentry, MapMaker.RemovalCause.COLLECTED);
            evictionQueue.remove(referenceentry);
            expirationQueue.remove(referenceentry);
        }

        boolean removeEntry(ReferenceEntry referenceentry, int i, MapMaker.RemovalCause removalcause)
        {
            int _tmp = -1 + count;
            AtomicReferenceArray atomicreferencearray = table;
            int j = i & -1 + atomicreferencearray.length();
            ReferenceEntry referenceentry1 = (ReferenceEntry)atomicreferencearray.get(j);
            for (ReferenceEntry referenceentry2 = referenceentry1; referenceentry2 != null; referenceentry2 = referenceentry2.getNext())
                if (referenceentry2 == referenceentry)
                {
                    modCount = 1 + modCount;
                    enqueueNotification(referenceentry2.getKey(), i, referenceentry2.getValueReference().get(), removalcause);
                    ReferenceEntry referenceentry3 = removeFromChain(referenceentry1, referenceentry2);
                    int k = -1 + count;
                    atomicreferencearray.set(j, referenceentry3);
                    count = k;
                    return true;
                }

            return false;
        }

        ReferenceEntry removeFromChain(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
        {
            evictionQueue.remove(referenceentry1);
            expirationQueue.remove(referenceentry1);
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

        Object replace(Object obj, int i, Object obj1)
        {
            lock();
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup();
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj2 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj2 == null)
                break MISSING_BLOCK_LABEL_230;
            ValueReference valuereference;
            Object obj3;
            if (!map.keyEquivalence.equivalent(obj, obj2))
                break MISSING_BLOCK_LABEL_230;
            valuereference = referenceentry1.getValueReference();
            obj3 = valuereference.get();
            if (obj3 != null)
                break MISSING_BLOCK_LABEL_191;
            if (isCollected(valuereference))
            {
                -1 + count;
                modCount = 1 + modCount;
                enqueueNotification(obj2, i, obj3, MapMaker.RemovalCause.COLLECTED);
                ReferenceEntry referenceentry3 = removeFromChain(referenceentry, referenceentry1);
                int k = -1 + count;
                atomicreferencearray.set(j, referenceentry3);
                count = k;
            }
            unlock();
            postWriteCleanup();
            return null;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, obj3, MapMaker.RemovalCause.REPLACED);
            setValue(referenceentry1, obj1);
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
            AtomicReferenceArray atomicreferencearray;
            int j;
            ReferenceEntry referenceentry;
            preWriteCleanup();
            atomicreferencearray = table;
            j = i & -1 + atomicreferencearray.length();
            referenceentry = (ReferenceEntry)atomicreferencearray.get(j);
            ReferenceEntry referenceentry1 = referenceentry;
_L2:
            if (referenceentry1 == null)
                break; /* Loop/switch isn't completed */
            Object obj3 = referenceentry1.getKey();
            if (referenceentry1.getHash() != i || obj3 == null)
                break MISSING_BLOCK_LABEL_262;
            ValueReference valuereference;
            Object obj4;
            if (!map.keyEquivalence.equivalent(obj, obj3))
                break MISSING_BLOCK_LABEL_262;
            valuereference = referenceentry1.getValueReference();
            obj4 = valuereference.get();
            if (obj4 != null)
                break MISSING_BLOCK_LABEL_191;
            if (isCollected(valuereference))
            {
                -1 + count;
                modCount = 1 + modCount;
                enqueueNotification(obj3, i, obj4, MapMaker.RemovalCause.COLLECTED);
                ReferenceEntry referenceentry3 = removeFromChain(referenceentry, referenceentry1);
                int k = -1 + count;
                atomicreferencearray.set(j, referenceentry3);
                count = k;
            }
            unlock();
            postWriteCleanup();
            return false;
            if (!map.valueEquivalence.equivalent(obj1, obj4))
                break MISSING_BLOCK_LABEL_246;
            modCount = 1 + modCount;
            enqueueNotification(obj, i, obj4, MapMaker.RemovalCause.REPLACED);
            setValue(referenceentry1, obj2);
            unlock();
            postWriteCleanup();
            return true;
            recordLockedRead(referenceentry1);
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

        void runCleanup()
        {
            runLockedCleanup();
            runUnlockedCleanup();
        }

        void runLockedCleanup()
        {
            if (!tryLock())
                break MISSING_BLOCK_LABEL_27;
            drainReferenceQueues();
            expireEntries();
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

        void setValue(ReferenceEntry referenceentry, Object obj)
        {
            referenceentry.setValueReference(map.valueStrength.referenceValue(this, referenceentry, obj));
            recordWrite(referenceentry);
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

        void tryExpireEntries()
        {
            if (!tryLock())
                break MISSING_BLOCK_LABEL_15;
            expireEntries();
            unlock();
            return;
            Exception exception;
            exception;
            unlock();
            throw exception;
        }

        Segment(MapMakerInternalMap mapmakerinternalmap, int i, int j)
        {
            map = mapmakerinternalmap;
            maxSegmentSize = j;
            initTable(newEntryArray(i));
            ReferenceQueue referencequeue;
            if (mapmakerinternalmap.usesKeyReferences())
                referencequeue = new ReferenceQueue();
            else
                referencequeue = null;
            keyReferenceQueue = referencequeue;
            boolean flag = mapmakerinternalmap.usesValueReferences();
            ReferenceQueue referencequeue1 = null;
            if (flag)
                referencequeue1 = new ReferenceQueue();
            valueReferenceQueue = referencequeue1;
            Object obj;
            if (!mapmakerinternalmap.evictsBySize() && !mapmakerinternalmap.expiresAfterAccess())
                obj = MapMakerInternalMap.discardingQueue();
            else
                obj = new ConcurrentLinkedQueue();
            recencyQueue = ((Queue) (obj));
            Object obj1;
            if (mapmakerinternalmap.evictsBySize())
                obj1 = new EvictionQueue();
            else
                obj1 = MapMakerInternalMap.discardingQueue();
            evictionQueue = ((Queue) (obj1));
            Object obj2;
            if (mapmakerinternalmap.expires())
                obj2 = new ExpirationQueue();
            else
                obj2 = MapMakerInternalMap.discardingQueue();
            expirationQueue = ((Queue) (obj2));
        }
    }

    private static final class SerializationProxy extends AbstractSerializationProxy
    {

        private static final long serialVersionUID = 3L;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            super._flddelegate = readMapMaker(objectinputstream).makeMap();
            readEntries(objectinputstream);
        }

        private Object readResolve()
        {
            return super._flddelegate;
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            writeMapTo(objectoutputstream);
        }

        SerializationProxy(Strength strength, Strength strength1, Equivalence equivalence, Equivalence equivalence1, long l, long l1, int i, int j, MapMaker.RemovalListener removallistener, ConcurrentMap concurrentmap)
        {
            super(strength, strength1, equivalence, equivalence1, l, l1, i, j, removallistener, concurrentmap);
        }
    }

    static class SoftEntry extends SoftReference
        implements ReferenceEntry
    {

        final int hash;
        final ReferenceEntry next;
        volatile ValueReference valueReference;

        public long getExpirationTime()
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

        public ReferenceEntry getNextEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            return valueReference;
        }

        public void setExpirationTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            ValueReference valuereference1 = valueReference;
            valueReference = valuereference;
            valuereference1.clear(valuereference);
        }

        SoftEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, referencequeue);
            valueReference = MapMakerInternalMap.unset();
            hash = i;
            next = referenceentry;
        }
    }

    static final class SoftEvictableEntry extends SoftEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry previousEvictable;

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        SoftEvictableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class SoftExpirableEntry extends SoftEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextExpirable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        SoftExpirableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class SoftExpirableEvictableEntry extends SoftEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry nextExpirable;
        ReferenceEntry previousEvictable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        SoftExpirableEvictableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class SoftValueReference extends SoftReference
        implements ValueReference
    {

        final ReferenceEntry entry;

        public void clear(ValueReference valuereference)
        {
            clear();
        }

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new SoftValueReference(referencequeue, get(), referenceentry);
        }

        public ReferenceEntry getEntry()
        {
            return entry;
        }

        public boolean isComputingReference()
        {
            return false;
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
            return (Strength)Enum.valueOf(com/google/common/collect/MapMakerInternalMap$Strength, s);
        }

        public static Strength[] values()
        {
            return (Strength[])$VALUES.clone();
        }

        abstract Equivalence defaultEquivalence();

        abstract ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj);

        static 
        {
            STRONG = new Strength("STRONG", 0) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.equals();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj)
                {
                    return new StrongValueReference(obj);
                }

            }
;
            SOFT = new Strength("SOFT", 1) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.identity();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj)
                {
                    return new SoftValueReference(segment.valueReferenceQueue, obj, referenceentry);
                }

            }
;
            WEAK = new Strength("WEAK", 2) {

                Equivalence defaultEquivalence()
                {
                    return Equivalences.identity();
                }

                ValueReference referenceValue(Segment segment, ReferenceEntry referenceentry, Object obj)
                {
                    return new WeakValueReference(segment.valueReferenceQueue, obj, referenceentry);
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

    static class StrongEntry
        implements ReferenceEntry
    {

        final int hash;
        final Object key;
        final ReferenceEntry next;
        volatile ValueReference valueReference;

        public long getExpirationTime()
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

        public ReferenceEntry getNextEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            return valueReference;
        }

        public void setExpirationTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            ValueReference valuereference1 = valueReference;
            valueReference = valuereference;
            valuereference1.clear(valuereference);
        }

        StrongEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            valueReference = MapMakerInternalMap.unset();
            key = obj;
            hash = i;
            next = referenceentry;
        }
    }

    static final class StrongEvictableEntry extends StrongEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry previousEvictable;

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        StrongEvictableEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class StrongExpirableEntry extends StrongEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextExpirable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        StrongExpirableEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class StrongExpirableEvictableEntry extends StrongEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry nextExpirable;
        ReferenceEntry previousEvictable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        StrongExpirableEvictableEntry(Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class StrongValueReference
        implements ValueReference
    {

        final Object referent;

        public void clear(ValueReference valuereference)
        {
        }

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

        public boolean isComputingReference()
        {
            return false;
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

    final class ValueIterator extends HashIterator
        implements Iterator
    {

        final MapMakerInternalMap this$0;

        public Object next()
        {
            return nextEntry().getValue();
        }

        ValueIterator()
        {
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    static interface ValueReference
    {

        public abstract void clear(ValueReference valuereference);

        public abstract ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry);

        public abstract Object get();

        public abstract ReferenceEntry getEntry();

        public abstract boolean isComputingReference();

        public abstract Object waitForValue()
            throws ExecutionException;
    }

    final class Values extends AbstractCollection
    {

        final MapMakerInternalMap this$0;

        public void clear()
        {
            MapMakerInternalMap.this.clear();
        }

        public boolean contains(Object obj)
        {
            return containsValue(obj);
        }

        public boolean isEmpty()
        {
            return MapMakerInternalMap.this.isEmpty();
        }

        public Iterator iterator()
        {
            return new ValueIterator();
        }

        public int size()
        {
            return MapMakerInternalMap.this.size();
        }

        Values()
        {
            this$0 = MapMakerInternalMap.this;
            super();
        }
    }

    static class WeakEntry extends WeakReference
        implements ReferenceEntry
    {

        final int hash;
        final ReferenceEntry next;
        volatile ValueReference valueReference;

        public long getExpirationTime()
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

        public ReferenceEntry getNextEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getNextExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousEvictable()
        {
            throw new UnsupportedOperationException();
        }

        public ReferenceEntry getPreviousExpirable()
        {
            throw new UnsupportedOperationException();
        }

        public ValueReference getValueReference()
        {
            return valueReference;
        }

        public void setExpirationTime(long l)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            throw new UnsupportedOperationException();
        }

        public void setValueReference(ValueReference valuereference)
        {
            ValueReference valuereference1 = valueReference;
            valueReference = valuereference;
            valuereference1.clear(valuereference);
        }

        WeakEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(obj, referencequeue);
            valueReference = MapMakerInternalMap.unset();
            hash = i;
            next = referenceentry;
        }
    }

    static final class WeakEvictableEntry extends WeakEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry previousEvictable;

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        WeakEvictableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class WeakExpirableEntry extends WeakEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextExpirable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        WeakExpirableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class WeakExpirableEvictableEntry extends WeakEntry
        implements ReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry nextExpirable;
        ReferenceEntry previousEvictable;
        ReferenceEntry previousExpirable;
        volatile long time;

        public long getExpirationTime()
        {
            return time;
        }

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
            time = l;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

        WeakExpirableEvictableEntry(ReferenceQueue referencequeue, Object obj, int i, ReferenceEntry referenceentry)
        {
            super(referencequeue, obj, i, referenceentry);
            time = 0x7fffffffffffffffL;
            nextExpirable = MapMakerInternalMap.nullEntry();
            previousExpirable = MapMakerInternalMap.nullEntry();
            nextEvictable = MapMakerInternalMap.nullEntry();
            previousEvictable = MapMakerInternalMap.nullEntry();
        }
    }

    static final class WeakValueReference extends WeakReference
        implements ValueReference
    {

        final ReferenceEntry entry;

        public void clear(ValueReference valuereference)
        {
            clear();
        }

        public ValueReference copyFor(ReferenceQueue referencequeue, ReferenceEntry referenceentry)
        {
            return new WeakValueReference(referencequeue, get(), referenceentry);
        }

        public ReferenceEntry getEntry()
        {
            return entry;
        }

        public boolean isComputingReference()
        {
            return false;
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

    final class WriteThroughEntry extends AbstractMapEntry
    {

        final Object key;
        final MapMakerInternalMap this$0;
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
            Object obj1 = put(key, obj);
            value = obj;
            return obj1;
        }

        WriteThroughEntry(Object obj, Object obj1)
        {
            this$0 = MapMakerInternalMap.this;
            super();
            key = obj;
            value = obj1;
        }
    }


    static final long CLEANUP_EXECUTOR_DELAY_SECS = 60L;
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

        public void clear(ValueReference valuereference)
        {
        }

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

        public boolean isComputingReference()
        {
            return false;
        }

        public Object waitForValue()
        {
            return null;
        }

    }
;
    private static final Logger logger = Logger.getLogger(com/google/common/collect/MapMakerInternalMap.getName());
    private static final long serialVersionUID = 5L;
    final int concurrencyLevel;
    final transient EntryFactory entryFactory;
    Set entrySet;
    final long expireAfterAccessNanos;
    final long expireAfterWriteNanos;
    final Equivalence keyEquivalence;
    Set keySet;
    final Strength keyStrength;
    final int maximumSize;
    final MapMaker.RemovalListener removalListener;
    final Queue removalNotificationQueue;
    final transient int segmentMask;
    final transient int segmentShift;
    final transient Segment segments[];
    final Ticker ticker;
    final Equivalence valueEquivalence;
    final Strength valueStrength;
    Collection values;

    MapMakerInternalMap(MapMaker mapmaker)
    {
        concurrencyLevel = Math.min(mapmaker.getConcurrencyLevel(), 0x10000);
        keyStrength = mapmaker.getKeyStrength();
        valueStrength = mapmaker.getValueStrength();
        keyEquivalence = mapmaker.getKeyEquivalence();
        valueEquivalence = mapmaker.getValueEquivalence();
        maximumSize = mapmaker.maximumSize;
        expireAfterAccessNanos = mapmaker.getExpireAfterAccessNanos();
        expireAfterWriteNanos = mapmaker.getExpireAfterWriteNanos();
        entryFactory = EntryFactory.getFactory(keyStrength, expires(), evictsBySize());
        ticker = mapmaker.getTicker();
        removalListener = mapmaker.getRemovalListener();
        Object obj;
        if (removalListener == GenericMapMaker.NullListener.INSTANCE)
            obj = discardingQueue();
        else
            obj = new ConcurrentLinkedQueue();
        removalNotificationQueue = ((Queue) (obj));
        int i = Math.min(mapmaker.getInitialCapacity(), 0x40000000);
        if (evictsBySize())
            i = Math.min(i, maximumSize);
        int j = 0;
        int k = 1;
        do
        {
            if (k >= concurrencyLevel || evictsBySize() && k * 2 > maximumSize)
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
                    int k1 = 1 + maximumSize / k;
                    int l1 = maximumSize % k;
                    for (int i2 = 0; i2 < segments.length; i2++)
                    {
                        if (i2 == l1)
                            k1--;
                        segments[i2] = createSegment(i1, k1);
                    }

                } else
                {
                    for (int j1 = 0; j1 < segments.length; j1++)
                        segments[j1] = createSegment(i1, -1);

                }
                return;
            }
            j++;
            k <<= 1;
        } while (true);
    }

    static void connectEvictables(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        referenceentry.setNextEvictable(referenceentry1);
        referenceentry1.setPreviousEvictable(referenceentry);
    }

    static void connectExpirables(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        referenceentry.setNextExpirable(referenceentry1);
        referenceentry1.setPreviousExpirable(referenceentry);
    }

    static Queue discardingQueue()
    {
        return DISCARDING_QUEUE;
    }

    static ReferenceEntry nullEntry()
    {
        return NullEntry.INSTANCE;
    }

    static void nullifyEvictable(ReferenceEntry referenceentry)
    {
        ReferenceEntry referenceentry1 = nullEntry();
        referenceentry.setNextEvictable(referenceentry1);
        referenceentry.setPreviousEvictable(referenceentry1);
    }

    static void nullifyExpirable(ReferenceEntry referenceentry)
    {
        ReferenceEntry referenceentry1 = nullEntry();
        referenceentry.setNextExpirable(referenceentry1);
        referenceentry.setPreviousExpirable(referenceentry1);
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
        Segment asegment[] = segments;
        long l = -1L;
        int i = 0;
        do
        {
            if (i >= 3)
                break;
            long l1 = 0L;
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
                        Object obj1 = segment.getLiveValue(referenceentry);
                        if (obj1 != null && valueEquivalence.equivalent(obj, obj1))
                            return true;
                    }

                }

                l1 += segment.modCount;
            }

            if (l1 == l)
                break;
            l = l1;
            i++;
        } while (true);
        return false;
    }

    ReferenceEntry copyEntry(ReferenceEntry referenceentry, ReferenceEntry referenceentry1)
    {
        return segmentFor(referenceentry.getHash()).copyEntry(referenceentry, referenceentry1);
    }

    Segment createSegment(int i, int j)
    {
        return new Segment(this, i, j);
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
        return maximumSize != -1;
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

    ReferenceEntry getLiveEntry(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            int i = hash(obj);
            return segmentFor(i).getLiveEntry(obj, i);
        }
    }

    Object getLiveValue(ReferenceEntry referenceentry)
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
            if (expires() && isExpired(referenceentry))
                return null;
        }
        return obj;
    }

    int hash(Object obj)
    {
        return rehash(keyEquivalence.hash(obj));
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

    boolean isExpired(ReferenceEntry referenceentry)
    {
        return isExpired(referenceentry, ticker.read());
    }

    boolean isExpired(ReferenceEntry referenceentry, long l)
    {
        return l - referenceentry.getExpirationTime() > 0L;
    }

    boolean isLive(ReferenceEntry referenceentry)
    {
        return segmentFor(referenceentry.getHash()).getLiveValue(referenceentry) != null;
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

    ReferenceEntry newEntry(Object obj, int i, ReferenceEntry referenceentry)
    {
        return segmentFor(i).newEntry(obj, i, referenceentry);
    }

    final Segment[] newSegmentArray(int i)
    {
        return new Segment[i];
    }

    ValueReference newValueReference(ReferenceEntry referenceentry, Object obj)
    {
        int i = referenceentry.getHash();
        return valueStrength.referenceValue(segmentFor(i), referenceentry, obj);
    }

    void processPendingNotifications()
    {
        do
        {
            MapMaker.RemovalNotification removalnotification = (MapMaker.RemovalNotification)removalNotificationQueue.poll();
            if (removalnotification != null)
                try
                {
                    removalListener.onRemoval(removalnotification);
                }
                catch (Exception exception)
                {
                    logger.log(Level.WARNING, "Exception thrown by removal listener", exception);
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
        Segment asegment[] = segments;
        long l = 0L;
        for (int i = 0; i < asegment.length; i++)
            l += asegment[i].count;

        return Ints.saturatedCast(l);
    }

    boolean usesKeyReferences()
    {
        return keyStrength != Strength.STRONG;
    }

    boolean usesValueReferences()
    {
        return valueStrength != Strength.STRONG;
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

    Object writeReplace()
    {
        return new SerializationProxy(keyStrength, valueStrength, keyEquivalence, valueEquivalence, expireAfterWriteNanos, expireAfterAccessNanos, maximumSize, concurrencyLevel, removalListener, this);
    }


    // Unreferenced inner class com/google/common/collect/MapMakerInternalMap$EvictionQueue$1

/* anonymous class */
    class EvictionQueue._cls1 extends AbstractReferenceEntry
    {

        ReferenceEntry nextEvictable;
        ReferenceEntry previousEvictable;
        final EvictionQueue this$0;

        public ReferenceEntry getNextEvictable()
        {
            return nextEvictable;
        }

        public ReferenceEntry getPreviousEvictable()
        {
            return previousEvictable;
        }

        public void setNextEvictable(ReferenceEntry referenceentry)
        {
            nextEvictable = referenceentry;
        }

        public void setPreviousEvictable(ReferenceEntry referenceentry)
        {
            previousEvictable = referenceentry;
        }

            
            {
                this$0 = EvictionQueue.this;
                super();
                nextEvictable = this;
                previousEvictable = this;
            }
    }


    // Unreferenced inner class com/google/common/collect/MapMakerInternalMap$ExpirationQueue$1

/* anonymous class */
    class ExpirationQueue._cls1 extends AbstractReferenceEntry
    {

        ReferenceEntry nextExpirable;
        ReferenceEntry previousExpirable;
        final ExpirationQueue this$0;

        public long getExpirationTime()
        {
            return 0x7fffffffffffffffL;
        }

        public ReferenceEntry getNextExpirable()
        {
            return nextExpirable;
        }

        public ReferenceEntry getPreviousExpirable()
        {
            return previousExpirable;
        }

        public void setExpirationTime(long l)
        {
        }

        public void setNextExpirable(ReferenceEntry referenceentry)
        {
            nextExpirable = referenceentry;
        }

        public void setPreviousExpirable(ReferenceEntry referenceentry)
        {
            previousExpirable = referenceentry;
        }

            
            {
                this$0 = ExpirationQueue.this;
                super();
                nextExpirable = this;
                previousExpirable = this;
            }
    }

}
