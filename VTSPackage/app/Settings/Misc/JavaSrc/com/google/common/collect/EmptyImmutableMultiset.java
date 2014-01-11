// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Set;

// Referenced classes of package com.google.common.collect:
//            ImmutableMultiset, ImmutableSet, Iterators, UnmodifiableIterator

final class EmptyImmutableMultiset extends ImmutableMultiset
{

    static final EmptyImmutableMultiset INSTANCE = new EmptyImmutableMultiset();
    private static final long serialVersionUID;


    public int count(Object obj)
    {
        return 0;
    }

    ImmutableSet createEntrySet()
    {
        return ImmutableSet.of();
    }

    int distinctElements()
    {
        return 0;
    }

    public ImmutableSet elementSet()
    {
        return ImmutableSet.of();
    }

    public volatile Set elementSet()
    {
        return elementSet();
    }

    UnmodifiableIterator entryIterator()
    {
        return Iterators.emptyIterator();
    }

    boolean isPartialView()
    {
        return false;
    }

    public int size()
    {
        return 0;
    }

}
