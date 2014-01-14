// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.logging.Level;
import java.util.logging.Logger;

// Referenced classes of package com.google.common.base:
//            FinalizableReference

public class FinalizableReferenceQueue
{
    static class DecoupledLoader
        implements FinalizerLoader
    {

        private static final String LOADING_ERROR = "Could not load Finalizer in its own class loader.Loading Finalizer in the current class loader instead. As a result, you will not be ableto garbage collect this class loader. To support reclaiming this class loader, eitherresolve the underlying issue, or move Google Collections to your system class path.";

        URL getBaseUrl()
            throws IOException
        {
            String s = (new StringBuilder()).append("com.google.common.base.internal.Finalizer".replace('.', '/')).append(".class").toString();
            URL url = getClass().getClassLoader().getResource(s);
            if (url == null)
                throw new FileNotFoundException(s);
            String s1 = url.toString();
            if (!s1.endsWith(s))
                throw new IOException((new StringBuilder()).append("Unsupported path style: ").append(s1).toString());
            else
                return new URL(url, s1.substring(0, s1.length() - s.length()));
        }

        public Class loadFinalizer()
        {
            Class class1;
            try
            {
                class1 = newLoader(getBaseUrl()).loadClass("com.google.common.base.internal.Finalizer");
            }
            catch (Exception exception)
            {
                FinalizableReferenceQueue.logger.log(Level.WARNING, "Could not load Finalizer in its own class loader.Loading Finalizer in the current class loader instead. As a result, you will not be ableto garbage collect this class loader. To support reclaiming this class loader, eitherresolve the underlying issue, or move Google Collections to your system class path.", exception);
                return null;
            }
            return class1;
        }

        URLClassLoader newLoader(URL url)
        {
            return new URLClassLoader(new URL[] {
                url
            });
        }

    }

    static class DirectLoader
        implements FinalizerLoader
    {

        public Class loadFinalizer()
        {
            Class class1;
            try
            {
                class1 = Class.forName("com.google.common.base.internal.Finalizer");
            }
            catch (ClassNotFoundException classnotfoundexception)
            {
                throw new AssertionError(classnotfoundexception);
            }
            return class1;
        }

    }

    static interface FinalizerLoader
    {

        public abstract Class loadFinalizer();
    }

    static class SystemLoader
        implements FinalizerLoader
    {

        public Class loadFinalizer()
        {
            ClassLoader classloader;
            Class class1;
            try
            {
                classloader = ClassLoader.getSystemClassLoader();
            }
            catch (SecurityException securityexception)
            {
                FinalizableReferenceQueue.logger.info("Not allowed to access system class loader.");
                return null;
            }
            class1 = null;
            if (classloader != null)
            {
                Class class2;
                try
                {
                    class2 = classloader.loadClass("com.google.common.base.internal.Finalizer");
                }
                catch (ClassNotFoundException classnotfoundexception)
                {
                    return null;
                }
                class1 = class2;
            }
            return class1;
        }

    }


    private static final String FINALIZER_CLASS_NAME = "com.google.common.base.internal.Finalizer";
    private static final Logger logger = Logger.getLogger(com/google/common/base/FinalizableReferenceQueue.getName());
    private static final Method startFinalizer;
    final ReferenceQueue queue;
    final boolean threadStarted;

    public FinalizableReferenceQueue()
    {
        ReferenceQueue referencequeue = (ReferenceQueue)startFinalizer.invoke(null, new Object[] {
            com/google/common/base/FinalizableReference, this
        });
        boolean flag = true;
_L2:
        queue = referencequeue;
        threadStarted = flag;
        return;
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        throw new AssertionError(illegalaccessexception);
        Throwable throwable;
        throwable;
        logger.log(Level.INFO, "Failed to start reference finalizer thread. Reference cleanup will only occur when new references are created.", throwable);
        referencequeue = new ReferenceQueue();
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    static Method getStartFinalizer(Class class1)
    {
        Method method;
        try
        {
            method = class1.getMethod("startFinalizer", new Class[] {
                java/lang/Class, java/lang/Object
            });
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            throw new AssertionError(nosuchmethodexception);
        }
        return method;
    }

    private static transient Class loadFinalizer(FinalizerLoader afinalizerloader[])
    {
        int i = afinalizerloader.length;
        for (int j = 0; j < i; j++)
        {
            Class class1 = afinalizerloader[j].loadFinalizer();
            if (class1 != null)
                return class1;
        }

        throw new AssertionError();
    }

    void cleanUp()
    {
        Reference reference;
        if (!threadStarted)
            while ((reference = queue.poll()) != null) 
            {
                reference.clear();
                try
                {
                    ((FinalizableReference)reference).finalizeReferent();
                }
                catch (Throwable throwable)
                {
                    logger.log(Level.SEVERE, "Error cleaning up after reference.", throwable);
                }
            }
    }

    static 
    {
        FinalizerLoader afinalizerloader[] = new FinalizerLoader[3];
        afinalizerloader[0] = new SystemLoader();
        afinalizerloader[1] = new DecoupledLoader();
        afinalizerloader[2] = new DirectLoader();
        startFinalizer = getStartFinalizer(loadFinalizer(afinalizerloader));
    }

}
