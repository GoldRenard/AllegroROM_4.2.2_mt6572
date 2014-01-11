// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.Serializable;

// Referenced classes of package com.google.common.collect:
//            AbstractMapEntry

class ImmutableEntry extends AbstractMapEntry
    implements Serializable
{

    private static final long serialVersionUID;
    private final Object key;
    private final Object value;

    ImmutableEntry(Object obj, Object obj1)
    {
        key = obj;
        value = obj1;
    }

    public Object getKey()
    {
        return key;
    }

    public Object getValue()
    {
        return value;
    }

    public final Object setValue(Object obj)
    {
        throw new UnsupportedOperationException();
    }
}
