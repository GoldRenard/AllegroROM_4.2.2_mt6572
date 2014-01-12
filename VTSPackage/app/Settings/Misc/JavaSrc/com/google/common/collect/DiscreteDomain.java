// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.NoSuchElementException;

public abstract class DiscreteDomain
{


    public abstract long distance(Comparable comparable, Comparable comparable1);

    public Comparable maxValue()
    {
        throw new NoSuchElementException();
    }

    public Comparable minValue()
    {
        throw new NoSuchElementException();
    }

    public abstract Comparable next(Comparable comparable);

    public abstract Comparable previous(Comparable comparable);
}
