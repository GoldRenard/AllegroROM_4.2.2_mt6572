// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.math.BigInteger;

// Referenced classes of package com.google.common.primitives:
//            UnsignedLongs, Longs

public class UnsignedLong extends Number
    implements Comparable, Serializable
{

    public static final UnsignedLong MAX_VALUE = new UnsignedLong(-1L);
    public static final UnsignedLong ONE = new UnsignedLong(1L);
    private static final long UNSIGNED_MASK = 0x7fffffffffffffffL;
    public static final UnsignedLong ZERO = new UnsignedLong(0L);
    private final long value;

    protected UnsignedLong(long l)
    {
        value = l;
    }

    public static UnsignedLong asUnsigned(long l)
    {
        return new UnsignedLong(l);
    }

    public static UnsignedLong valueOf(String s)
    {
        return valueOf(s, 10);
    }

    public static UnsignedLong valueOf(String s, int i)
    {
        return asUnsigned(UnsignedLongs.parseUnsignedLong(s, i));
    }

    public static UnsignedLong valueOf(BigInteger biginteger)
    {
        Preconditions.checkNotNull(biginteger);
        boolean flag;
        if (biginteger.signum() >= 0 && biginteger.bitLength() <= 64)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "value (%s) is outside the range for an unsigned long value", new Object[] {
            biginteger
        });
        return asUnsigned(biginteger.longValue());
    }

    public UnsignedLong add(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return asUnsigned(value + unsignedlong.value);
    }

    public BigInteger bigIntegerValue()
    {
        BigInteger biginteger = BigInteger.valueOf(0x7fffffffffffffffL & value);
        if (value < 0L)
            biginteger = biginteger.setBit(63);
        return biginteger;
    }

    public int compareTo(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return UnsignedLongs.compare(value, unsignedlong.value);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((UnsignedLong)obj);
    }

    public UnsignedLong divide(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return asUnsigned(UnsignedLongs.divide(value, unsignedlong.value));
    }

    public double doubleValue()
    {
        double d = 0x7fffffffffffffffL & value;
        if (value < 0L)
            d += 9.2233720368547758E+018D;
        return d;
    }

    public boolean equals(Object obj)
    {
        boolean flag = obj instanceof UnsignedLong;
        boolean flag1 = false;
        if (flag)
        {
            UnsignedLong unsignedlong = (UnsignedLong)obj;
            int i = value != unsignedlong.value;
            flag1 = false;
            if (i == 0)
                flag1 = true;
        }
        return flag1;
    }

    public float floatValue()
    {
        float f = 0x7fffffffffffffffL & value;
        if (value < 0L)
            f += 9.223372E+018F;
        return f;
    }

    public int hashCode()
    {
        return Longs.hashCode(value);
    }

    public int intValue()
    {
        return (int)value;
    }

    public long longValue()
    {
        return value;
    }

    public UnsignedLong multiply(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return asUnsigned(value * unsignedlong.value);
    }

    public UnsignedLong remainder(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return asUnsigned(UnsignedLongs.remainder(value, unsignedlong.value));
    }

    public UnsignedLong subtract(UnsignedLong unsignedlong)
    {
        Preconditions.checkNotNull(unsignedlong);
        return asUnsigned(value - unsignedlong.value);
    }

    public String toString()
    {
        return UnsignedLongs.toString(value);
    }

    public String toString(int i)
    {
        return UnsignedLongs.toString(value, i);
    }

}
