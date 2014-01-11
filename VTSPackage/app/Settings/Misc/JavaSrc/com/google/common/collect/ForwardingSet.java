// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.util.Collection;
import java.util.Set;

// Referenced classes of package com.google.common.collect:
//            ForwardingCollection, Sets

public abstract class ForwardingSet extends ForwardingCollection
    implements Set
{


    protected volatile Object _mthdelegate()
    {
        return _mthdelegate();
    }

    protected volatile Collection _mthdelegate()
    {
        return _mthdelegate();
    }

    protected abstract Set _mthdelegate();

    public boolean equals(Object obj)
    {
        return obj == this || _mthdelegate().equals(obj);
    }

    public int hashCode()
    {
        return _mthdelegate().hashCode();
    }

    protected boolean standardEquals(Object obj)
    {
        return Sets.equalsImpl(this, obj);
    }

    protected int standardHashCode()
    {
        return Sets.hashCodeImpl(this);
    }
}
