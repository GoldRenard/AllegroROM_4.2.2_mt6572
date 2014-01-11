// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.eventbus;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.lang.reflect.Method;

// Referenced classes of package com.google.common.eventbus:
//            HandlerFindingStrategy, EventHandler, SynchronizedEventHandler, AllowConcurrentEvents, 
//            Subscribe

class AnnotatedHandlerFinder
    implements HandlerFindingStrategy
{


    private static EventHandler makeHandler(Object obj, Method method)
    {
        if (methodIsDeclaredThreadSafe(method))
            return new EventHandler(obj, method);
        else
            return new SynchronizedEventHandler(obj, method);
    }

    private static boolean methodIsDeclaredThreadSafe(Method method)
    {
        return method.getAnnotation(com/google/common/eventbus/AllowConcurrentEvents) != null;
    }

    public Multimap findAllHandlers(Object obj)
    {
        HashMultimap hashmultimap = HashMultimap.create();
        for (Class class1 = obj.getClass(); class1 != null; class1 = class1.getSuperclass())
        {
            Method amethod[] = class1.getMethods();
            int i = amethod.length;
            for (int j = 0; j < i; j++)
            {
                Method method = amethod[j];
                if ((Subscribe)method.getAnnotation(com/google/common/eventbus/Subscribe) == null)
                    continue;
                Class aclass[] = method.getParameterTypes();
                if (aclass.length != 1)
                    throw new IllegalArgumentException((new StringBuilder()).append("Method ").append(method).append(" has @Subscribe annotation, but requires ").append(aclass.length).append(" arguments.  Event handler methods ").append("must require a single argument.").toString());
                hashmultimap.put(aclass[0], makeHandler(obj, method));
            }

        }

        return hashmultimap;
    }
}
