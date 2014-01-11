// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;

public final class Atomics
{

    private Atomics()
    {
    }

    public static AtomicReference newReference()
    {
        return new AtomicReference();
    }

    public static AtomicReference newReference(Object obj)
    {
        return new AtomicReference(obj);
    }

    public static AtomicReferenceArray newReferenceArray(int i)
    {
        return new AtomicReferenceArray(i);
    }

    public static AtomicReferenceArray newReferenceArray(Object aobj[])
    {
        return new AtomicReferenceArray(aobj);
    }
}
