// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;

import java.io.Serializable;

// Referenced classes of package com.google.common.collect:
//            Ordering

final class UsingToStringOrdering extends Ordering
    implements Serializable
{

    static final UsingToStringOrdering INSTANCE = new UsingToStringOrdering();
    private static final long serialVersionUID;

    private UsingToStringOrdering()
    {
    }

    private Object readResolve()
    {
        return INSTANCE;
    }

    public int compare(Object obj, Object obj1)
    {
        return obj.toString().compareTo(obj1.toString());
    }

    public String toString()
    {
        return "Ordering.usingToString()";
    }

}
