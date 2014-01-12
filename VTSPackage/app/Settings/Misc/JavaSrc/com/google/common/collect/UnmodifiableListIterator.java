// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.ListIterator;

// Referenced classes of package com.google.common.collect:
//            UnmodifiableIterator

public abstract class UnmodifiableListIterator extends UnmodifiableIterator
    implements ListIterator
{


    public final void add(Object obj)
    {
        throw new UnsupportedOperationException();
    }

    public final void set(Object obj)
    {
        throw new UnsupportedOperationException();
    }
}
