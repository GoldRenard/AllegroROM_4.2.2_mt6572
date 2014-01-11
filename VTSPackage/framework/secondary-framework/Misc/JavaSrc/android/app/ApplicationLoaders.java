// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import dalvik.system.PathClassLoader;
import java.util.HashMap;
import java.util.Map;

class ApplicationLoaders
{

    private static final ApplicationLoaders gApplicationLoaders = new ApplicationLoaders();
    private final Map mLoaders = new HashMap();


    public static ApplicationLoaders getDefault()
    {
        return gApplicationLoaders;
    }

    public ClassLoader getClassLoader(String s, String s1, ClassLoader classloader)
    {
        ClassLoader classloader1 = ClassLoader.getSystemClassLoader().getParent();
        Map map = mLoaders;
        map;
        JVM INSTR monitorenter ;
        if (classloader == null)
            classloader = classloader1;
        if (classloader != classloader1)
            break MISSING_BLOCK_LABEL_87;
        ClassLoader classloader2 = (ClassLoader)mLoaders.get(s);
        if (classloader2 == null)
            break MISSING_BLOCK_LABEL_56;
        map;
        JVM INSTR monitorexit ;
        return classloader2;
        PathClassLoader pathclassloader1;
        pathclassloader1 = new PathClassLoader(s, s1, classloader);
        mLoaders.put(s, pathclassloader1);
        map;
        JVM INSTR monitorexit ;
        return pathclassloader1;
        PathClassLoader pathclassloader = new PathClassLoader(s, classloader);
        map;
        JVM INSTR monitorexit ;
        return pathclassloader;
        Exception exception;
        exception;
        map;
        JVM INSTR monitorexit ;
        throw exception;
    }

}
