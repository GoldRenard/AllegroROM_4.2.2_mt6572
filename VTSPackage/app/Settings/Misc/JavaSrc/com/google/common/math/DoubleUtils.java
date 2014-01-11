// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.BigInteger;

final class DoubleUtils
{

    static final int EXPONENT_BIAS = 1023;
    static final long EXPONENT_MASK = 0x7ff0000000000000L;
    static final long IMPLICIT_BIT = 0x10000000000000L;
    static final int MAX_DOUBLE_EXPONENT = 1023;
    static final int MIN_DOUBLE_EXPONENT = -1022;
    private static final long ONE_BITS = Double.doubleToRawLongBits(1.0D);
    static final int SIGNIFICAND_BITS = 52;
    static final long SIGNIFICAND_MASK = 0xfffffffffffffL;
    static final long SIGN_MASK = 0x8000000000000000L;

    private DoubleUtils()
    {
    }

    static double bigToDouble(BigInteger biginteger)
    {
        BigInteger biginteger1 = biginteger.abs();
        int i = -1 + biginteger1.bitLength();
        if (i < 63)
            return (double)biginteger.longValue();
        if (i > 1023)
            return (1.0D / 0.0D) * (double)biginteger.signum();
        int j = -1 + (i - 52);
        long l = biginteger1.shiftRight(j).longValue();
        long l1 = 0xfffffffffffffL & l >> 1;
        boolean flag;
        if ((1L & l) == 0L || (1L & l1) == 0L && biginteger1.getLowestSetBit() >= j)
            flag = false;
        else
            flag = true;
        long l2;
        if (flag)
            l2 = l1 + 1L;
        else
            l2 = l1;
        return Double.longBitsToDouble(l2 + ((long)(i + 1023) << 52) | 0x8000000000000000L & (long)biginteger.signum());
    }

    static int getExponent(double d)
    {
        return -1023 + (int)((0x7ff0000000000000L & Double.doubleToRawLongBits(d)) >> 52);
    }

    static long getSignificand(double d)
    {
        Preconditions.checkArgument(isFinite(d), "not a normal value");
        int i = getExponent(d);
        long l = 0xfffffffffffffL & Double.doubleToRawLongBits(d);
        if (i == -1023)
            return l << 1;
        else
            return 0x10000000000000L | l;
    }

    static boolean isFinite(double d)
    {
        return getExponent(d) <= 1023;
    }

    static boolean isNormal(double d)
    {
        return getExponent(d) >= -1022;
    }

    static double next(double d, boolean flag)
    {
        if (d == 0.0D)
            return !flag ? -4.9406564584124654E-324D : 4.9406564584124654E-324D;
        long l = Double.doubleToRawLongBits(d);
        boolean flag1;
        if (d < 0.0D)
            flag1 = true;
        else
            flag1 = false;
        long l1;
        if (flag1 == flag)
            l1 = l - 1L;
        else
            l1 = l + 1L;
        return Double.longBitsToDouble(l1);
    }

    static double scalb(double d, int i)
    {
        boolean flag;
        int j;
        flag = true;
        j = getExponent(d);
        j;
        JVM INSTR lookupswitch 2: default 47
    //                   -1023: 36
    //                   1024: 110;
           goto _L1 _L2 _L3
_L2:
        return d * StrictMath.pow(2D, i);
_L1:
        int k;
        boolean flag1;
        k = j + i;
        if (-1022 <= k)
            flag1 = flag;
        else
            flag1 = false;
        if (k > 1023)
            flag = false;
        if (!(flag & flag1)) goto _L5; else goto _L4
_L4:
        d = Double.longBitsToDouble(0x800fffffffffffffL & Double.doubleToRawLongBits(d) | (long)(k + 1023) << 52);
_L3:
        return d;
_L5:
        return d * StrictMath.pow(2D, i);
    }

    static double scaleNormalize(double d)
    {
        return Double.longBitsToDouble(0xfffffffffffffL & Double.doubleToRawLongBits(d) | ONE_BITS);
    }

}
