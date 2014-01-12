// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.*;
import java.util.ArrayList;
import java.util.List;

// Referenced classes of package com.google.common.math:
//            MathPreconditions, LongMath, IntMath, DoubleUtils, 
//            DoubleMath

public final class BigIntegerMath
{

    static final BigInteger SQRT2_PRECOMPUTED_BITS = new BigInteger("16a09e667f3bcc908b2fb1366ea957d3e3adec17512775099da2f590b0667322a", 16);
    static final int SQRT2_PRECOMPUTE_THRESHOLD = 256;

    private BigIntegerMath()
    {
    }

    public static BigInteger binomial(int i, int j)
    {
        MathPreconditions.checkNonNegative("n", i);
        MathPreconditions.checkNonNegative("k", j);
        boolean flag;
        if (j <= i)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(j);
        aobj[1] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "k (%s) > n (%s)", aobj);
        if (j > i >> 1)
            j = i - j;
        BigInteger biginteger;
        if (j < LongMath.BIGGEST_BINOMIALS.length && i <= LongMath.BIGGEST_BINOMIALS[j])
        {
            biginteger = BigInteger.valueOf(LongMath.binomial(i, j));
        } else
        {
            biginteger = BigInteger.ONE;
            for (int k = 0; k < j; k++)
                biginteger = biginteger.multiply(BigInteger.valueOf(i - k)).divide(BigInteger.valueOf(k + 1));

        }
        return biginteger;
    }

    public static BigInteger divide(BigInteger biginteger, BigInteger biginteger1, RoundingMode roundingmode)
    {
        return (new BigDecimal(biginteger)).divide(new BigDecimal(biginteger1), 0, roundingmode).toBigIntegerExact();
    }

    public static BigInteger factorial(int i)
    {
        MathPreconditions.checkNonNegative("n", i);
        if (i < LongMath.FACTORIALS.length)
            return BigInteger.valueOf(LongMath.FACTORIALS[i]);
        ArrayList arraylist = new ArrayList(IntMath.divide(i * IntMath.log2(i, RoundingMode.CEILING), 64, RoundingMode.CEILING));
        int j = LongMath.FACTORIALS.length;
        long l = LongMath.FACTORIALS[j - 1];
        int k = Long.numberOfTrailingZeros(l);
        long l1 = l >> k;
        int i1 = 1 + LongMath.log2(l1, RoundingMode.FLOOR);
        int j1 = 1 + LongMath.log2(j, RoundingMode.FLOOR);
        int k1 = 1 << j1 - 1;
        for (long l2 = j; l2 <= (long)i; l2++)
        {
            if ((l2 & (long)k1) != 0L)
            {
                k1 <<= 1;
                j1++;
            }
            int i2 = Long.numberOfTrailingZeros(l2);
            long l3 = l2 >> i2;
            k += i2;
            if (i1 + (j1 - i2) >= 64)
            {
                arraylist.add(BigInteger.valueOf(l1));
                l1 = 1L;
            }
            l1 *= l3;
            i1 = 1 + LongMath.log2(l1, RoundingMode.FLOOR);
        }

        if (l1 > 1L)
            arraylist.add(BigInteger.valueOf(l1));
        return listProduct(arraylist).shiftLeft(k);
    }

    static boolean fitsInLong(BigInteger biginteger)
    {
        return biginteger.bitLength() <= 63;
    }

    public static boolean isPowerOfTwo(BigInteger biginteger)
    {
        Preconditions.checkNotNull(biginteger);
        return biginteger.signum() > 0 && biginteger.getLowestSetBit() == -1 + biginteger.bitLength();
    }

    static BigInteger listProduct(List list)
    {
        return listProduct(list, 0, list.size());
    }

    static BigInteger listProduct(List list, int i, int j)
    {
        switch (j - i)
        {
        case 3: // '\003'
            return ((BigInteger)list.get(i)).multiply((BigInteger)list.get(i + 1)).multiply((BigInteger)list.get(i + 2));

        case 2: // '\002'
            return ((BigInteger)list.get(i)).multiply((BigInteger)list.get(i + 1));

        case 1: // '\001'
            return (BigInteger)list.get(i);

        case 0: // '\0'
            return BigInteger.ONE;
        }
        int k = j + i >>> 1;
        return listProduct(list, i, k).multiply(listProduct(list, k, j));
    }

    public static int log10(BigInteger biginteger, RoundingMode roundingmode)
    {
label0:
        {
            BigInteger biginteger2;
            int i;
label1:
            {
                MathPreconditions.checkPositive("x", biginteger);
                if (fitsInLong(biginteger))
                {
                    i = LongMath.log10(biginteger.longValue(), roundingmode);
                } else
                {
                    ArrayList arraylist = new ArrayList(10);
                    for (BigInteger biginteger1 = BigInteger.TEN; biginteger.compareTo(biginteger1) >= 0; biginteger1 = biginteger1.pow(2))
                        arraylist.add(biginteger1);

                    biginteger2 = BigInteger.ONE;
                    i = 0;
                    for (int j = -1 + arraylist.size(); j >= 0; j--)
                    {
                        BigInteger biginteger3 = (BigInteger)arraylist.get(j);
                        i *= 2;
                        BigInteger biginteger4 = biginteger3.multiply(biginteger2);
                        if (biginteger.compareTo(biginteger4) >= 0)
                        {
                            biginteger2 = biginteger4;
                            i++;
                        }
                    }

                    static class _cls1
                    {

                        static final int $SwitchMap$java$math$RoundingMode[];

                        static 
                        {
                            $SwitchMap$java$math$RoundingMode = new int[RoundingMode.values().length];
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.UNNECESSARY.ordinal()] = 1;
                            }
                            catch (NoSuchFieldError nosuchfielderror) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.DOWN.ordinal()] = 2;
                            }
                            catch (NoSuchFieldError nosuchfielderror1) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.FLOOR.ordinal()] = 3;
                            }
                            catch (NoSuchFieldError nosuchfielderror2) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.UP.ordinal()] = 4;
                            }
                            catch (NoSuchFieldError nosuchfielderror3) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.CEILING.ordinal()] = 5;
                            }
                            catch (NoSuchFieldError nosuchfielderror4) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_DOWN.ordinal()] = 6;
                            }
                            catch (NoSuchFieldError nosuchfielderror5) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_UP.ordinal()] = 7;
                            }
                            catch (NoSuchFieldError nosuchfielderror6) { }
                            try
                            {
                                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_EVEN.ordinal()] = 8;
                            }
                            catch (NoSuchFieldError nosuchfielderror7)
                            {
                                return;
                            }
                        }
                    }

                    switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
                    {
                    default:
                        break label0;

                    case 1: // '\001'
                        break label1;

                    case 2: // '\002'
                    case 3: // '\003'
                        break;

                    case 6: // '\006'
                    case 7: // '\007'
                    case 8: // '\b'
                        if (biginteger.pow(2).compareTo(biginteger2.pow(2).multiply(BigInteger.TEN)) > 0)
                            return i + 1;
                        break;

                    case 4: // '\004'
                    case 5: // '\005'
                        if (!biginteger2.equals(biginteger))
                            return i + 1;
                        break;
                    }
                }
                return i;
            }
            MathPreconditions.checkRoundingUnnecessary(biginteger2.equals(biginteger));
            return i;
        }
        throw new AssertionError();
    }

    public static int log2(BigInteger biginteger, RoundingMode roundingmode)
    {
label0:
        {
            MathPreconditions.checkPositive("x", (BigInteger)Preconditions.checkNotNull(biginteger));
            int i = -1 + biginteger.bitLength();
            switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
            {
            default:
                break label0;

            case 2: // '\002'
            case 3: // '\003'
                break;

            case 6: // '\006'
            case 7: // '\007'
            case 8: // '\b'
                if (i < 256)
                {
                    if (biginteger.compareTo(SQRT2_PRECOMPUTED_BITS.shiftRight(256 - i)) > 0)
                        return i + 1;
                    break;
                }
                if (-1 + biginteger.pow(2).bitLength() >= 1 + i * 2)
                    return i + 1;
                break;

            case 4: // '\004'
            case 5: // '\005'
                if (!isPowerOfTwo(biginteger))
                    return i + 1;
                break;

            case 1: // '\001'
                MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(biginteger));
                break;
            }
            return i;
        }
        throw new AssertionError();
    }

    public static BigInteger sqrt(BigInteger biginteger, RoundingMode roundingmode)
    {
label0:
        {
            BigInteger biginteger1;
label1:
            {
                MathPreconditions.checkNonNegative("x", biginteger);
                if (fitsInLong(biginteger))
                {
                    biginteger1 = BigInteger.valueOf(LongMath.sqrt(biginteger.longValue(), roundingmode));
                } else
                {
                    biginteger1 = sqrtFloor(biginteger);
                    switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
                    {
                    default:
                        break label0;

                    case 1: // '\001'
                        break label1;

                    case 2: // '\002'
                    case 3: // '\003'
                        break;

                    case 6: // '\006'
                    case 7: // '\007'
                    case 8: // '\b'
                        if (biginteger1.pow(2).add(biginteger1).compareTo(biginteger) < 0)
                            return biginteger1.add(BigInteger.ONE);
                        break;

                    case 4: // '\004'
                    case 5: // '\005'
                        if (!biginteger1.pow(2).equals(biginteger))
                            return biginteger1.add(BigInteger.ONE);
                        break;
                    }
                }
                return biginteger1;
            }
            MathPreconditions.checkRoundingUnnecessary(biginteger1.pow(2).equals(biginteger));
            return biginteger1;
        }
        throw new AssertionError();
    }

    private static BigInteger sqrtApproxWithDoubles(BigInteger biginteger)
    {
        return DoubleMath.roundToBigInteger(Math.sqrt(DoubleUtils.bigToDouble(biginteger)), RoundingMode.HALF_EVEN);
    }

    private static BigInteger sqrtFloor(BigInteger biginteger)
    {
        int i = log2(biginteger, RoundingMode.FLOOR);
        BigInteger biginteger1;
        if (i < 1023)
        {
            biginteger1 = sqrtApproxWithDoubles(biginteger);
        } else
        {
            int j = -2 & i - 52;
            biginteger1 = sqrtApproxWithDoubles(biginteger.shiftRight(j)).shiftLeft(j >> 1);
        }
        BigInteger biginteger2 = biginteger1.add(biginteger.divide(biginteger1)).shiftRight(1);
        if (biginteger1.equals(biginteger2))
            return biginteger1;
        BigInteger biginteger3;
        do
        {
            biginteger3 = biginteger2;
            biginteger2 = biginteger3.add(biginteger.divide(biginteger3)).shiftRight(1);
        } while (biginteger2.compareTo(biginteger3) < 0);
        return biginteger3;
    }

}
