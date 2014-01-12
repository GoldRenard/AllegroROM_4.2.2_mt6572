// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;


// Referenced classes of package com.google.common.base:
//            CharMatcher

final class Platform
{

    private static final ThreadLocal DEST_TL = new ThreadLocal() {

        protected volatile Object initialValue()
        {
            return initialValue();
        }

        protected char[] initialValue()
        {
            return new char[1024];
        }

    }
;

    private Platform()
    {
    }

    static char[] charBufferFromThreadLocal()
    {
        return (char[])DEST_TL.get();
    }

    static CharMatcher precomputeCharMatcher(CharMatcher charmatcher)
    {
        return charmatcher.precomputedInternal();
    }

    static long systemNanoTime()
    {
        return System.nanoTime();
    }

}
