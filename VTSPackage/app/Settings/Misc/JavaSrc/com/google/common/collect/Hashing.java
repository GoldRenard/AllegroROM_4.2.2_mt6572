// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


final class Hashing
{

    private Hashing()
    {
    }

    static int smear(int i)
    {
        int j = i ^ (i >>> 20 ^ i >>> 12);
        return j ^ j >>> 7 ^ j >>> 4;
    }
}
