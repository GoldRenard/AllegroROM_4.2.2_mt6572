// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;

// Referenced classes of package com.google.common.collect:
//            Platform

public final class ObjectArrays
{

    private ObjectArrays()
    {
    }

    static Object[] arraysCopyOf(Object aobj[], int i)
    {
        Object aobj1[] = newArray(aobj, i);
        Platform.unsafeArrayCopy(aobj, 0, aobj1, 0, Math.min(aobj.length, i));
        return aobj1;
    }

    public static Object[] concat(Object obj, Object aobj[])
    {
        Object aobj1[] = newArray(aobj, 1 + aobj.length);
        aobj1[0] = obj;
        Platform.unsafeArrayCopy(aobj, 0, aobj1, 1, aobj.length);
        return aobj1;
    }

    public static Object[] concat(Object aobj[], Object obj)
    {
        Object aobj1[] = arraysCopyOf(aobj, 1 + aobj.length);
        aobj1[aobj.length] = obj;
        return aobj1;
    }

    public static Object[] concat(Object aobj[], Object aobj1[], Class class1)
    {
        Object aobj2[] = newArray(class1, aobj.length + aobj1.length);
        Platform.unsafeArrayCopy(aobj, 0, aobj2, 0, aobj.length);
        Platform.unsafeArrayCopy(aobj1, 0, aobj2, aobj.length, aobj1.length);
        return aobj2;
    }

    private static Object[] fillArray(Iterable iterable, Object aobj[])
    {
        int i = 0;
        for (Iterator iterator = iterable.iterator(); iterator.hasNext();)
        {
            Object obj = iterator.next();
            int j = i + 1;
            aobj[i] = obj;
            i = j;
        }

        return aobj;
    }

    public static Object[] newArray(Class class1, int i)
    {
        return Platform.newArray(class1, i);
    }

    public static Object[] newArray(Object aobj[], int i)
    {
        return Platform.newArray(aobj, i);
    }

    static void swap(Object aobj[], int i, int j)
    {
        Object obj = aobj[i];
        aobj[i] = aobj[j];
        aobj[j] = obj;
    }

    static Object[] toArrayImpl(Collection collection)
    {
        return fillArray(collection, new Object[collection.size()]);
    }

    static Object[] toArrayImpl(Collection collection, Object aobj[])
    {
        int i = collection.size();
        if (aobj.length < i)
            aobj = newArray(aobj, i);
        fillArray(collection, aobj);
        if (aobj.length > i)
            aobj[i] = null;
        return aobj;
    }
}
