// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Iterator;
import java.util.ListIterator;

// Referenced classes of package com.google.common.collect:
//            ForwardingIterator

public abstract class ForwardingListIterator extends ForwardingIterator
    implements ListIterator
{


    public void add(Object obj)
    {
        _mthdelegate().add(obj);
    }

    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile Iterator _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract ListIterator _mthdelegate();

    public boolean hasPrevious()
    {
        return _mthdelegate().hasPrevious();
    }

    public int nextIndex()
    {
        return _mthdelegate().nextIndex();
    }

    public Object previous()
    {
        return _mthdelegate().previous();
    }

    public int previousIndex()
    {
        return _mthdelegate().previousIndex();
    }

    public void set(Object obj)
    {
        _mthdelegate().set(obj);
    }
}
