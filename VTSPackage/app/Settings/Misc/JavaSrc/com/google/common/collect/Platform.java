// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.lang.reflect.Array;

// Referenced classes of package com.google.common.collect:
//            MapMaker

class Platform
{

    private Platform()
    {
    }

    static Object[] clone(Object aobj[])
    {
        return (Object[])((Object []) (aobj)).clone();
    }

    static Object[] newArray(Class class1, int i)
    {
        return (Object[])(Object[])Array.newInstance(class1, i);
    }

    static Object[] newArray(Object aobj[], int i)
    {
        return (Object[])(Object[])Array.newInstance(((Object) (aobj)).getClass().getComponentType(), i);
    }

    static MapMaker tryWeakKeys(MapMaker mapmaker)
    {
        return mapmaker.weakKeys();
    }

    static void unsafeArrayCopy(Object aobj[], int i, Object aobj1[], int j, int k)
    {
        System.arraycopy(((Object) (aobj)), i, ((Object) (aobj1)), j, k);
    }
}
