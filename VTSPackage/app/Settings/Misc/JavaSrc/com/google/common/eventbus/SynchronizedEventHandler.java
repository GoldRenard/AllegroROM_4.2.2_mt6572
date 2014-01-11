// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

// Referenced classes of package com.google.common.eventbus:
//            EventHandler

class SynchronizedEventHandler extends EventHandler
{

    public SynchronizedEventHandler(Object obj, Method method)
    {
        super(obj, method);
    }

    public void handleEvent(Object obj)
        throws InvocationTargetException
    {
        this;
        JVM INSTR monitorenter ;
        super.handleEvent(obj);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
