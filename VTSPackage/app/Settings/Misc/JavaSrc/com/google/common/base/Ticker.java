// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;


// Referenced classes of package com.google.common.base:
//            Platform

public abstract class Ticker
{

    private static final Ticker SYSTEM_TICKER = new Ticker() {

        public long read()
        {
            return Platform.systemNanoTime();
        }

    }
;


    public static Ticker systemTicker()
    {
        return SYSTEM_TICKER;
    }

    public abstract long read();

}
