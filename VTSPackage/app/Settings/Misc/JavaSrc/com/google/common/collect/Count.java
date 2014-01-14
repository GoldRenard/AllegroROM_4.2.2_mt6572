// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.Serializable;

final class Count
    implements Serializable
{

    private int value;

    Count()
    {
        this(0);
    }

    Count(int i)
    {
        value = i;
    }

    public int addAndGet(int i)
    {
        int j = i + value;
        value = j;
        return j;
    }

    public boolean equals(Object obj)
    {
        return (obj instanceof Count) && ((Count)obj).value == value;
    }

    public int get()
    {
        return value;
    }

    public int getAndAdd(int i)
    {
        int j = value;
        value = j + i;
        return j;
    }

    public int getAndSet(int i)
    {
        int j = value;
        value = i;
        return j;
    }

    public int hashCode()
    {
        return value;
    }

    public void set(int i)
    {
        value = i;
    }

    public String toString()
    {
        return Integer.toString(value);
    }
}
