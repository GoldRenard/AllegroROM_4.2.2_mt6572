// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.math.BigInteger;

// Referenced classes of package com.google.common.primitives:
//            UnsignedInts

public final class UnsignedInteger extends Number
    implements Comparable
{

    public static final UnsignedInteger MAX_VALUE = asUnsigned(-1);
    public static final UnsignedInteger ONE = asUnsigned(1);
    public static final UnsignedInteger ZERO = asUnsigned(0);
    private final int value;

    private UnsignedInteger(int i)
    {
        value = i & -1;
    }

    public static UnsignedInteger asUnsigned(int i)
    {
        return new UnsignedInteger(i);
    }

    public static UnsignedInteger valueOf(long l)
    {
        boolean flag;
        if ((0xffffffffL & l) == l)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "value (%s) is outside the range for an unsigned integer value", aobj);
        return asUnsigned((int)l);
    }

    public static UnsignedInteger valueOf(String s)
    {
        return valueOf(s, 10);
    }

    public static UnsignedInteger valueOf(String s, int i)
    {
        return asUnsigned(UnsignedInts.parseUnsignedInt(s, i));
    }

    public static UnsignedInteger valueOf(BigInteger biginteger)
    {
        Preconditions.checkNotNull(biginteger);
        boolean flag;
        if (biginteger.signum() >= 0 && biginteger.bitLength() <= 32)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "value (%s) is outside the range for an unsigned integer value", new Object[] {
            biginteger
        });
        return asUnsigned(biginteger.intValue());
    }

    public UnsignedInteger add(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return asUnsigned(value + unsignedinteger.value);
    }

    public BigInteger bigIntegerValue()
    {
        return BigInteger.valueOf(longValue());
    }

    public int compareTo(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return UnsignedInts.compare(value, unsignedinteger.value);
    }

    public volatile int compareTo(Object obj)
    {
        return compareTo((UnsignedInteger)obj);
    }

    public UnsignedInteger divide(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return asUnsigned(UnsignedInts.divide(value, unsignedinteger.value));
    }

    public double doubleValue()
    {
        return (double)longValue();
    }

    public boolean equals(Object obj)
    {
        boolean flag = obj instanceof UnsignedInteger;
        boolean flag1 = false;
        if (flag)
        {
            UnsignedInteger unsignedinteger = (UnsignedInteger)obj;
            int i = value;
            int j = unsignedinteger.value;
            flag1 = false;
            if (i == j)
                flag1 = true;
        }
        return flag1;
    }

    public float floatValue()
    {
        return (float)longValue();
    }

    public int hashCode()
    {
        return value;
    }

    public int intValue()
    {
        return value;
    }

    public long longValue()
    {
        return UnsignedInts.toLong(value);
    }

    public UnsignedInteger multiply(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return asUnsigned(value * unsignedinteger.value);
    }

    public UnsignedInteger remainder(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return asUnsigned(UnsignedInts.remainder(value, unsignedinteger.value));
    }

    public UnsignedInteger subtract(UnsignedInteger unsignedinteger)
    {
        Preconditions.checkNotNull(unsignedinteger);
        return asUnsigned(value - unsignedinteger.value);
    }

    public String toString()
    {
        return toString(10);
    }

    public String toString(int i)
    {
        return UnsignedInts.toString(value, i);
    }

}
