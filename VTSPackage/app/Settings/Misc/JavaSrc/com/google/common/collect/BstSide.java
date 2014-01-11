// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


abstract class BstSide extends Enum
{

    private static final BstSide $VALUES[];
    public static final BstSide LEFT;
    public static final BstSide RIGHT;

    private BstSide(String s, int i)
    {
        super(s, i);
    }


    public static BstSide valueOf(String s)
    {
        return (BstSide)Enum.valueOf(com/google/common/collect/BstSide, s);
    }

    public static BstSide[] values()
    {
        return (BstSide[])$VALUES.clone();
    }

    abstract BstSide other();

    static 
    {
        LEFT = new BstSide("LEFT", 0) {

            public BstSide other()
            {
                return RIGHT;
            }

        }
;
        RIGHT = new BstSide("RIGHT", 1) {

            public BstSide other()
            {
                return LEFT;
            }

        }
;
        BstSide abstside[] = new BstSide[2];
        abstside[0] = LEFT;
        abstside[1] = RIGHT;
        $VALUES = abstside;
    }
}
