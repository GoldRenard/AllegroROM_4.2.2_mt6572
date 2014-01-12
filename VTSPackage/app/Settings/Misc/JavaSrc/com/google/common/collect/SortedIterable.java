// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Comparator;
import java.util.Iterator;

interface SortedIterable
    extends Iterable
{

    public abstract Comparator comparator();

    public abstract Iterator iterator();
}
