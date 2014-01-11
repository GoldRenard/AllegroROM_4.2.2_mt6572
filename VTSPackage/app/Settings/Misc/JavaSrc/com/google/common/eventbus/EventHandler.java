// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

class EventHandler
{

    private final Method method;
    private final Object target;

    EventHandler(Object obj, Method method1)
    {
        Preconditions.checkNotNull(obj, "EventHandler target cannot be null.");
        Preconditions.checkNotNull(method1, "EventHandler method cannot be null.");
        target = obj;
        method = method1;
        method1.setAccessible(true);
    }

    public boolean equals(Object obj)
    {
        if (this != obj)
        {
            if (obj == null)
                return false;
            if (getClass() != obj.getClass())
                return false;
            EventHandler eventhandler = (EventHandler)obj;
            if (!method.equals(eventhandler.method) || target != eventhandler.target)
                return false;
        }
        return true;
    }

    public void handleEvent(Object obj)
        throws InvocationTargetException
    {
        try
        {
            method.invoke(target, new Object[] {
                obj
            });
            return;
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            throw new Error((new StringBuilder()).append("Method rejected target/argument: ").append(obj).toString(), illegalargumentexception);
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            throw new Error((new StringBuilder()).append("Method became inaccessible: ").append(obj).toString(), illegalaccessexception);
        }
        catch (InvocationTargetException invocationtargetexception)
        {
            if (invocationtargetexception.getCause() instanceof Error)
                throw (Error)invocationtargetexception.getCause();
            else
                throw invocationtargetexception;
        }
    }

    public int hashCode()
    {
        return 31 * (31 + method.hashCode()) + target.hashCode();
    }

    public String toString()
    {
        return (new StringBuilder()).append("[wrapper ").append(method).append("]").toString();
    }
}
