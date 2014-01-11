// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


public final class BoundType extends Enum
{

    private static final BoundType $VALUES[];
    public static final BoundType CLOSED;
    public static final BoundType OPEN;

    private BoundType(String s, int i)
    {
        super(s, i);
    }

    static BoundType forBoolean(boolean flag)
    {
        if (flag)
            return CLOSED;
        else
            return OPEN;
    }

    public static BoundType valueOf(String s)
    {
        return (BoundType)Enum.valueOf(com/google/common/collect/BoundType, s);
    }

    public static BoundType[] values()
    {
        return (BoundType[])$VALUES.clone();
    }

    static 
    {
        OPEN = new BoundType("OPEN", 0);
        CLOSED = new BoundType("CLOSED", 1);
        BoundType aboundtype[] = new BoundType[2];
        aboundtype[0] = OPEN;
        aboundtype[1] = CLOSED;
        $VALUES = aboundtype;
    }
}
