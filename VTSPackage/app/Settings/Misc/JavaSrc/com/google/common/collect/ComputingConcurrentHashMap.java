// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import com.google.common.base.*;
import java.io.*;
import java.lang.ref.ReferenceQueue;
import java.util.Queue;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.atomic.AtomicReferenceArray;

// Referenced classes of package com.google.common.collect:
//            MapMakerInternalMap, MapMaker, ComputationException

class ComputingConcurrentHashMap extends MapMakerInternalMap
{
    private static final class ComputationExceptionReference
        implements MapMakerInternalMap.ValueReference
    {

        final Throwable t;

        public void clear(MapMakerInternalMap.ValueReference valuereference)
        {
        }

        public MapMakerInternalMap.ValueReference copyFor(ReferenceQueue referencequeue, MapMakerInternalMap.ReferenceEntry referenceentry)
        {
            return this;
        }

        public Object get()
        {
            return null;
        }

        public MapMakerInternalMap.ReferenceEntry getEntry()
        {
            return null;
        }

        public boolean isComputingReference()
        {
            return false;
        }

        public Object waitForValue()
            throws ExecutionException
        {
            throw new ExecutionException(t);
        }

        ComputationExceptionReference(Throwable throwable)
        {
            t = throwable;
        }
    }

    private static final class ComputedReference
        implements MapMakerInternalMap.ValueReference
    {

        final Object value;

        public void clear(MapMakerInternalMap.ValueReference valuereference)
        {
        }

        public MapMakerInternalMap.ValueReference copyFor(ReferenceQueue referencequeue, MapMakerInternalMap.ReferenceEntry referenceentry)
        {
            return this;
        }

        public Object get()
        {
            return value;
        }

        public MapMakerInternalMap.ReferenceEntry getEntry()
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

        ComputedReference(Object obj)
        {
            value = obj;
        }
    }

    static final class ComputingMapAdapter extends ComputingConcurrentHashMap
        implements Serializable
    {

        private static final long serialVersionUID;

        public Object get(Object obj)
        {
            Object obj1;
            try
            {
                obj1 = getOrCompute(obj);
            }
            catch (ExecutionException executionexception)
            {
                Throwable throwable = executionexception.getCause();
                Throwables.propagateIfInstanceOf(throwable, com/google/common/collect/ComputationException);
                throw new ComputationException(throwable);
            }
            if (obj1 == null)
                throw new NullPointerException((new StringBuilder()).append(computingFunction).append(" returned null for key ").append(obj).append(".").toString());
            else
                return obj1;
        }

        volatile MapMakerInternalMap.Segment segmentFor(int i)
        {
            return segmentFor(i);
        }

        ComputingMapAdapter(MapMaker mapmaker, Function function)
        {
            super(mapmaker, function);
        }
    }

    static final class ComputingSegment extends MapMakerInternalMap.Segment
    {

        Object compute(Object obj, int i, MapMakerInternalMap.ReferenceEntry referenceentry, ComputingValueReference computingvaluereference)
            throws ExecutionException
        {
            Object obj1;
            obj1 = null;
            System.nanoTime();
            long l = 0L;
            referenceentry;
            JVM INSTR monitorenter ;
            obj1 = computingvaluereference.compute(obj, i);
            l = System.nanoTime();
            referenceentry;
            JVM INSTR monitorexit ;
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_56;
            if (put(obj, i, obj1, true) != null)
                enqueueNotification(obj, i, obj1, MapMaker.RemovalCause.REPLACED);
            if (l == 0L)
                System.nanoTime();
            if (obj1 == null)
                clearValue(obj, i, computingvaluereference);
            return obj1;
            Exception exception1;
            exception1;
            referenceentry;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            if (l == 0L)
                System.nanoTime();
            if (obj1 == null)
                clearValue(obj, i, computingvaluereference);
            throw exception;
        }

        Object getOrCompute(Object obj, int i, Function function)
            throws ExecutionException
        {
_L21:
            MapMakerInternalMap.ReferenceEntry referenceentry = getEntry(obj, i);
            if (referenceentry == null)
                break MISSING_BLOCK_LABEL_39;
            Object obj1 = getLiveValue(referenceentry);
            if (obj1 == null)
                break MISSING_BLOCK_LABEL_39;
            recordRead(referenceentry);
            postReadCleanup();
            return obj1;
            if (referenceentry == null) goto _L2; else goto _L1
_L1:
            if (referenceentry.getValueReference().isComputingReference()) goto _L3; else goto _L2
_L2:
            boolean flag = true;
            lock();
            int j;
            AtomicReferenceArray atomicreferencearray;
            int k;
            MapMakerInternalMap.ReferenceEntry referenceentry1;
            preWriteCleanup();
            j = -1 + count;
            atomicreferencearray = table;
            k = i & -1 + atomicreferencearray.length();
            referenceentry1 = (MapMakerInternalMap.ReferenceEntry)atomicreferencearray.get(k);
            referenceentry = referenceentry1;
_L19:
            if (referenceentry == null) goto _L5; else goto _L4
_L4:
            Object obj2 = referenceentry.getKey();
            if (referenceentry.getHash() != i || obj2 == null) goto _L7; else goto _L6
_L6:
            if (!super.map.keyEquivalence.equivalent(obj, obj2)) goto _L7; else goto _L8
_L8:
            if (!referenceentry.getValueReference().isComputingReference()) goto _L10; else goto _L9
_L9:
            flag = false;
_L5:
            ComputingValueReference computingvaluereference = null;
            if (!flag) goto _L12; else goto _L11
_L11:
            ComputingValueReference computingvaluereference1 = new ComputingValueReference(function);
            if (referenceentry != null) goto _L14; else goto _L13
_L13:
            referenceentry = newEntry(obj, i, referenceentry1);
            referenceentry.setValueReference(computingvaluereference1);
            atomicreferencearray.set(k, referenceentry);
            computingvaluereference = computingvaluereference1;
_L12:
            unlock();
            postWriteCleanup();
            if (!flag) goto _L3; else goto _L15
_L15:
            Object obj3 = compute(obj, i, referenceentry, computingvaluereference);
            postReadCleanup();
            return obj3;
_L10:
            Object obj5 = referenceentry.getValueReference().get();
            if (obj5 != null) goto _L17; else goto _L16
_L16:
            enqueueNotification(obj2, i, obj5, MapMaker.RemovalCause.COLLECTED);
_L18:
            super.evictionQueue.remove(referenceentry);
            super.expirationQueue.remove(referenceentry);
            count = j;
              goto _L5
            Exception exception1;
            exception1;
_L22:
            unlock();
            postWriteCleanup();
            throw exception1;
            Exception exception;
            exception;
            postReadCleanup();
            throw exception;
_L17:
label0:
            {
                if (!super.map.expires() || !super.map.isExpired(referenceentry))
                    break label0;
                enqueueNotification(obj2, i, obj5, MapMaker.RemovalCause.EXPIRED);
            }
              goto _L18
            recordLockedRead(referenceentry);
            unlock();
            postWriteCleanup();
            postReadCleanup();
            return obj5;
_L7:
            MapMakerInternalMap.ReferenceEntry referenceentry2 = referenceentry.getNext();
            referenceentry = referenceentry2;
              goto _L19
_L14:
            referenceentry.setValueReference(computingvaluereference1);
            computingvaluereference = computingvaluereference1;
              goto _L12
_L3:
            boolean flag1;
            Object obj4;
            if (!Thread.holdsLock(referenceentry))
                flag1 = true;
            else
                flag1 = false;
            Preconditions.checkState(flag1, "Recursive computation");
            obj4 = referenceentry.getValueReference().waitForValue();
            if (obj4 == null) goto _L21; else goto _L20
_L20:
            recordRead(referenceentry);
            postReadCleanup();
            return obj4;
            exception1;
              goto _L22
        }

        ComputingSegment(MapMakerInternalMap mapmakerinternalmap, int i, int j)
        {
            super(mapmakerinternalmap, i, j);
        }
    }

    static final class ComputingSerializationProxy extends MapMakerInternalMap.AbstractSerializationProxy
    {

        private static final long serialVersionUID = 4L;
        final Function computingFunction;

        private void readObject(ObjectInputStream objectinputstream)
            throws IOException, ClassNotFoundException
        {
            objectinputstream.defaultReadObject();
            super._flddelegate = readMapMaker(objectinputstream).makeComputingMap(computingFunction);
            readEntries(objectinputstream);
        }

        private void writeObject(ObjectOutputStream objectoutputstream)
            throws IOException
        {
            objectoutputstream.defaultWriteObject();
            writeMapTo(objectoutputstream);
        }

        Object readResolve()
        {
            return super._flddelegate;
        }

        ComputingSerializationProxy(MapMakerInternalMap.Strength strength, MapMakerInternalMap.Strength strength1, Equivalence equivalence, Equivalence equivalence1, long l, long l1, int i, int j, MapMaker.RemovalListener removallistener, ConcurrentMap concurrentmap, Function function)
        {
            super(strength, strength1, equivalence, equivalence1, l, l1, i, j, removallistener, concurrentmap);
            computingFunction = function;
        }
    }

    private static final class ComputingValueReference
        implements MapMakerInternalMap.ValueReference
    {

        volatile MapMakerInternalMap.ValueReference computedReference;
        final Function computingFunction;

        public void clear(MapMakerInternalMap.ValueReference valuereference)
        {
            setValueReference(valuereference);
        }

        Object compute(Object obj, int i)
            throws ExecutionException
        {
            Object obj1;
            try
            {
                obj1 = computingFunction.apply(obj);
            }
            catch (Throwable throwable)
            {
                setValueReference(new ComputationExceptionReference(throwable));
                throw new ExecutionException(throwable);
            }
            setValueReference(new ComputedReference(obj1));
            return obj1;
        }

        public MapMakerInternalMap.ValueReference copyFor(ReferenceQueue referencequeue, MapMakerInternalMap.ReferenceEntry referenceentry)
        {
            return this;
        }

        public Object get()
        {
            return null;
        }

        public MapMakerInternalMap.ReferenceEntry getEntry()
        {
            return null;
        }

        public boolean isComputingReference()
        {
            return true;
        }

        void setValueReference(MapMakerInternalMap.ValueReference valuereference)
        {
            this;
            JVM INSTR monitorenter ;
            if (computedReference == MapMakerInternalMap.UNSET)
            {
                computedReference = valuereference;
                notifyAll();
            }
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public Object waitForValue()
            throws ExecutionException
        {
            if (computedReference != MapMakerInternalMap.UNSET)
                break MISSING_BLOCK_LABEL_58;
            boolean flag = false;
            this;
            JVM INSTR monitorenter ;
_L2:
            MapMakerInternalMap.ValueReference valuereference;
            MapMakerInternalMap.ValueReference valuereference1;
            valuereference = computedReference;
            valuereference1 = MapMakerInternalMap.UNSET;
            if (valuereference != valuereference1)
                break; /* Loop/switch isn't completed */
            try
            {
                wait();
            }
            catch (InterruptedException interruptedexception)
            {
                flag = true;
            }
            if (true) goto _L2; else goto _L1
_L1:
            this;
            JVM INSTR monitorexit ;
            if (flag)
                Thread.currentThread().interrupt();
            return computedReference.waitForValue();
            Exception exception1;
            exception1;
            this;
            JVM INSTR monitorexit ;
            throw exception1;
            Exception exception;
            exception;
            if (flag)
                Thread.currentThread().interrupt();
            throw exception;
        }

        public ComputingValueReference(Function function)
        {
            computedReference = MapMakerInternalMap.unset();
            computingFunction = function;
        }
    }


    private static final long serialVersionUID = 4L;
    final Function computingFunction;

    ComputingConcurrentHashMap(MapMaker mapmaker, Function function)
    {
        super(mapmaker);
        computingFunction = (Function)Preconditions.checkNotNull(function);
    }

    MapMakerInternalMap.Segment createSegment(int i, int j)
    {
        return new ComputingSegment(this, i, j);
    }

    Object getOrCompute(Object obj)
        throws ExecutionException
    {
        int i = hash(Preconditions.checkNotNull(obj));
        return segmentFor(i).getOrCompute(obj, i, computingFunction);
    }

    ComputingSegment segmentFor(int i)
    {
        return (ComputingSegment)super.segmentFor(i);
    }

    volatile MapMakerInternalMap.Segment segmentFor(int i)
    {
        return segmentFor(i);
    }

    Object writeReplace()
    {
        return new ComputingSerializationProxy(super.keyStrength, super.valueStrength, super.keyEquivalence, super.valueEquivalence, super.expireAfterWriteNanos, super.expireAfterAccessNanos, super.maximumSize, super.concurrencyLevel, super.removalListener, this, computingFunction);
    }
}
