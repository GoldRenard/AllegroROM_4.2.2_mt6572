// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.BigInteger;

final class MathPreconditions
{

    private MathPreconditions()
    {
    }

    static void checkInRange(boolean flag)
    {
        if (!flag)
            throw new ArithmeticException("not in range");
        else
            return;
    }

    static void checkNoOverflow(boolean flag)
    {
        if (!flag)
            throw new ArithmeticException("overflow");
        else
            return;
    }

    static int checkNonNegative(String s, int i)
    {
        if (i < 0)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(i).append(") must be >= 0").toString());
        else
            return i;
    }

    static long checkNonNegative(String s, long l)
    {
        if (l < 0L)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(l).append(") must be >= 0").toString());
        else
            return l;
    }

    static BigInteger checkNonNegative(String s, BigInteger biginteger)
    {
        if (((BigInteger)Preconditions.checkNotNull(biginteger)).signum() < 0)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(biginteger).append(") must be >= 0").toString());
        else
            return biginteger;
    }

    static int checkPositive(String s, int i)
    {
        if (i <= 0)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(i).append(") must be > 0").toString());
        else
            return i;
    }

    static long checkPositive(String s, long l)
    {
        if (l <= 0L)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(l).append(") must be > 0").toString());
        else
            return l;
    }

    static BigInteger checkPositive(String s, BigInteger biginteger)
    {
        if (biginteger.signum() <= 0)
            throw new IllegalArgumentException((new StringBuilder()).append(s).append(" (").append(biginteger).append(") must be > 0").toString());
        else
            return biginteger;
    }

    static void checkRoundingUnnecessary(boolean flag)
    {
        if (!flag)
            throw new ArithmeticException("mode was UNNECESSARY, but rounding was necessary");
        else
            return;
    }
}
