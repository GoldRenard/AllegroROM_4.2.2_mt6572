// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.*;

public interface Multiset
    extends Collection
{
    public static interface Entry
    {

        public abstract boolean equals(Object obj);

        public abstract int getCount();

        public abstract Object getElement();

        public abstract int hashCode();

        public abstract String toString();
    }


    public abstract int add(Object obj, int i);

    public abstract boolean add(Object obj);

    public abstract boolean contains(Object obj);

    public abstract boolean containsAll(Collection collection);

    public abstract int count(Object obj);

    public abstract Set elementSet();

    public abstract Set entrySet();

    public abstract boolean equals(Object obj);

    public abstract int hashCode();

    public abstract Iterator iterator();

    public abstract int remove(Object obj, int i);

    public abstract boolean remove(Object obj);

    public abstract boolean removeAll(Collection collection);

    public abstract boolean retainAll(Collection collection);

    public abstract int setCount(Object obj, int i);

    public abstract boolean setCount(Object obj, int i, int j);

    public abstract String toString();
}
