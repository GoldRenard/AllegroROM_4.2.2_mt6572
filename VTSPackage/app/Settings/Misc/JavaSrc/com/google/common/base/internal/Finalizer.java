// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base.internal;

import java.lang.ref.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Finalizer extends Thread
{
    private static class ShutDown extends Exception
    {

        private ShutDown()
        {
        }

    }


    private static final String FINALIZABLE_REFERENCE = "com.google.common.base.FinalizableReference";
    private static final Field inheritableThreadLocals = getInheritableThreadLocalsField();
    private static final Logger logger = Logger.getLogger(com/google/common/base/internal/Finalizer.getName());
    private final WeakReference finalizableReferenceClassReference;
    private final PhantomReference frqReference;
    private final ReferenceQueue queue = new ReferenceQueue();

    private Finalizer(Class class1, Object obj)
    {
        super(com/google/common/base/internal/Finalizer.getName());
        finalizableReferenceClassReference = new WeakReference(class1);
        frqReference = new PhantomReference(obj, queue);
        setDaemon(true);
        try
        {
            if (inheritableThreadLocals != null)
                inheritableThreadLocals.set(this, null);
            return;
        }
        catch (Throwable throwable)
        {
            logger.log(Level.INFO, "Failed to clear thread local values inherited by reference finalizer thread.", throwable);
        }
    }

    private void cleanUp(Reference reference)
        throws ShutDown
    {
        Method method = getFinalizeReferentMethod();
        do
        {
            reference.clear();
            if (reference == frqReference)
                throw new ShutDown();
            try
            {
                method.invoke(reference, new Object[0]);
            }
            catch (Throwable throwable)
            {
                logger.log(Level.SEVERE, "Error cleaning up after reference.", throwable);
            }
            reference = queue.poll();
        } while (reference != null);
    }

    private Method getFinalizeReferentMethod()
        throws ShutDown
    {
        Class class1 = (Class)finalizableReferenceClassReference.get();
        if (class1 == null)
            throw new ShutDown();
        Method method;
        try
        {
            method = class1.getMethod("finalizeReferent", new Class[0]);
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            throw new AssertionError(nosuchmethodexception);
        }
        return method;
    }

    public static Field getInheritableThreadLocalsField()
    {
        Field field;
        try
        {
            field = java/lang/Thread.getDeclaredField("inheritableThreadLocals");
            field.setAccessible(true);
        }
        catch (Throwable throwable)
        {
            logger.log(Level.INFO, "Couldn't access Thread.inheritableThreadLocals. Reference finalizer threads will inherit thread local values.");
            return null;
        }
        return field;
    }

    public static ReferenceQueue startFinalizer(Class class1, Object obj)
    {
        if (!class1.getName().equals("com.google.common.base.FinalizableReference"))
        {
            throw new IllegalArgumentException("Expected com.google.common.base.FinalizableReference.");
        } else
        {
            Finalizer finalizer = new Finalizer(class1, obj);
            finalizer.start();
            return finalizer.queue;
        }
    }

    public void run()
    {
        do
            try
            {
                cleanUp(queue.remove());
            }
            catch (InterruptedException interruptedexception) { }
            catch (ShutDown shutdown)
            {
                return;
            }
        while (true);
    }

}
