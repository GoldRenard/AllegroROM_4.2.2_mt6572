// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Iterator;

public interface PeekingIterator
    extends Iterator
{

    public abstract Object next();

    public abstract Object peek();

    public abstract void remove();
}
