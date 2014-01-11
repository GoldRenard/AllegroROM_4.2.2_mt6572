// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.RoundingMode;

// Referenced classes of package com.google.common.math:
//            MathPreconditions, IntMath

public final class LongMath
{

    static final int BIGGEST_BINOMIALS[] = {
        0x7fffffff, 0x7fffffff, 0x7fffffff, 0x3a25db, 0x1dc79, 16175, 4337, 1733, 887, 534, 
        361, 265, 206, 169, 143, 125, 111, 101, 94, 88, 
        83, 79, 76, 74, 72, 70, 69, 68, 67, 67, 
        66, 66, 66, 66
    };
    static final int BIGGEST_SIMPLE_BINOMIALS[] = {
        0x7fffffff, 0x7fffffff, 0x7fffffff, 0x285146, 0x150eb, 11724, 3218, 1313, 684, 419, 
        287, 214, 169, 139, 119, 105, 95, 87, 81, 76, 
        73, 70, 68, 66, 64, 63, 62, 62, 61, 61, 
        61
    };
    static final long FACTORIALS[] = {
        1L, 1L, 2L, 6L, 24L, 120L, 720L, 5040L, 40320L, 0x58980L, 
        0x375f00L, 0x2611500L, 0x1c8cfc00L, 0x17328cc00L, 0x144c3b2800L, 0x13077775800L, 0x130777758000L, 0x1437eeecd8000L, 0x16beecca730000L, 0x1b02b9306890000L, 
        0x21c3677c82b40000L
    };
    static final long FLOOR_SQRT_MAX_LONG = 0xb504f333L;
    static final long HALF_POWERS_OF_10[] = {
        3L, 31L, 316L, 3162L, 31622L, 0x4d343L, 0x3040a5L, 0x1e28678L, 0x12d940b6L, 0xbc7c871cL, 
        0x75cdd4719L, 0x49a0a4c700L, 0x2e0466fc608L, 0x1cc2c05dbc53L, 0x11f9b83a95b45L, 0xb3c13249d90bbL, 0x7058bf6e27a751L, 0x463777a4d8c892dL, 0x2be2aac7077d5bc3L
    };
    static final long MAX_POWER_OF_SQRT2_UNSIGNED = 0xb504f333f9de6484L;
    static final long POWERS_OF_10[] = {
        1L, 10L, 100L, 1000L, 10000L, 0x186a0L, 0xf4240L, 0x989680L, 0x5f5e100L, 0x3b9aca00L, 
        0x2540be400L, 0x174876e800L, 0xe8d4a51000L, 0x9184e72a000L, 0x5af3107a4000L, 0x38d7ea4c68000L, 0x2386f26fc10000L, 0x16345785d8a0000L, 0xde0b6b3a7640000L
    };

    private LongMath()
    {
    }

    public static long binomial(int i, int j)
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
        long l;
        if (j < BIGGEST_BINOMIALS.length && i <= BIGGEST_BINOMIALS[j])
        {
            l = 1L;
            if (j < BIGGEST_SIMPLE_BINOMIALS.length && i <= BIGGEST_SIMPLE_BINOMIALS[j])
            {
                for (int j1 = 0; j1 < j; j1++)
                    l = (l * (long)(i - j1)) / (long)(j1 + 1);

            } else
            {
                for (int k = 1; k <= j;)
                {
                    int i1 = IntMath.gcd(i, k);
                    l = (l / (long)(k / i1)) * (long)(i / i1);
                    k++;
                    i--;
                }

            }
        } else
        {
            l = 0x7fffffffffffffffL;
        }
        return l;
    }

    public static long checkedAdd(long l, long l1)
    {
        boolean flag = true;
        long l2 = l + l1;
        boolean flag1;
        if ((l ^ l1) < 0L)
            flag1 = flag;
        else
            flag1 = false;
        if ((l ^ l2) < 0L)
            flag = false;
        MathPreconditions.checkNoOverflow(flag | flag1);
        return l2;
    }

    public static long checkedMultiply(long l, long l1)
    {
        long l2;
        boolean flag3;
label0:
        {
            int i = Long.numberOfLeadingZeros(l) + Long.numberOfLeadingZeros(~l) + Long.numberOfLeadingZeros(l1) + Long.numberOfLeadingZeros(~l1);
            if (i > 65)
                return l * l1;
            boolean flag;
            if (i >= 64)
                flag = true;
            else
                flag = false;
            MathPreconditions.checkNoOverflow(flag);
            boolean flag1;
            if (l >= 0L)
                flag1 = true;
            else
                flag1 = false;
            boolean flag2;
            if (l1 != 0x8000000000000000L)
                flag2 = true;
            else
                flag2 = false;
            MathPreconditions.checkNoOverflow(flag2 | flag1);
            l2 = l * l1;
            if (l != 0L)
            {
                int j = l2 / l != l1;
                flag3 = false;
                if (j != 0)
                    break label0;
            }
            flag3 = true;
        }
        MathPreconditions.checkNoOverflow(flag3);
        return l2;
    }

    public static long checkedPow(long l, int i)
    {
        boolean flag;
label0:
        {
            flag = true;
            MathPreconditions.checkNonNegative("exponent", i);
            boolean flag1;
            if (l >= -2L)
                flag1 = flag;
            else
                flag1 = false;
            boolean flag2;
            if (l <= 2L)
                flag2 = flag;
            else
                flag2 = false;
            if (!(flag2 & flag1))
                break label0;
            switch ((int)l)
            {
            default:
                break label0;

            case -2: 
                if (i >= 64)
                    flag = false;
                MathPreconditions.checkNoOverflow(flag);
                if ((i & 1) == 0)
                    return 1L << i;
                else
                    return -1L << i;

            case 1: // '\001'
                break;

            case 2: // '\002'
                boolean flag4;
                if (i < 63)
                    flag4 = flag;
                else
                    flag4 = false;
                MathPreconditions.checkNoOverflow(flag4);
                return 1L << i;

            case -1: 
                if ((i & 1) != 0)
                    return -1L;
                break;

            case 0: // '\0'
                if (i != 0)
                    return 0L;
                break;
            }
            return 1L;
        }
        long l1 = 1L;
        do
        {
            do
            {
                switch (i)
                {
                case 1: // '\001'
                    return checkedMultiply(l1, l);

                case 0: // '\0'
                    return l1;
                }
                if ((i & 1) != 0)
                    l1 = checkedMultiply(l1, l);
                i >>= 1;
            } while (i <= 0);
            boolean flag3;
            if (l <= 0xb504f333L)
                flag3 = flag;
            else
                flag3 = false;
            MathPreconditions.checkNoOverflow(flag3);
            l *= l;
        } while (true);
    }

    public static long checkedSubtract(long l, long l1)
    {
        boolean flag = true;
        long l2 = l - l1;
        boolean flag1;
        if ((l ^ l1) >= 0L)
            flag1 = flag;
        else
            flag1 = false;
        if ((l ^ l2) < 0L)
            flag = false;
        MathPreconditions.checkNoOverflow(flag | flag1);
        return l2;
    }

    public static long divide(long l, long l1, RoundingMode roundingmode)
    {
label0:
        {
            Preconditions.checkNotNull(roundingmode);
            long l2 = l / l1;
            long l3 = l - l1 * l2;
            if (l3 != 0L)
            {
                int i = 1 | (int)((l ^ l1) >> 63);
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

                boolean flag;
                switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
                {
                default:
                    break label0;

                case 6: // '\006'
                case 7: // '\007'
                case 8: // '\b'
                    long l4 = Math.abs(l3);
                    long l5 = l4 - (Math.abs(l1) - l4);
                    if (l5 == 0L)
                    {
                        boolean flag2;
                        if (roundingmode == RoundingMode.HALF_UP)
                            flag2 = true;
                        else
                            flag2 = false;
                        boolean flag3;
                        if (roundingmode == RoundingMode.HALF_EVEN)
                            flag3 = true;
                        else
                            flag3 = false;
                        boolean flag4;
                        if ((1L & l2) != 0L)
                            flag4 = true;
                        else
                            flag4 = false;
                        flag = flag2 | flag4 & flag3;
                    } else
                    if (l5 > 0L)
                        flag = true;
                    else
                        flag = false;
                    break;

                case 3: // '\003'
                    if (i < 0)
                        flag = true;
                    else
                        flag = false;
                    break;

                case 5: // '\005'
                    if (i > 0)
                        flag = true;
                    else
                        flag = false;
                    break;

                case 4: // '\004'
                    flag = true;
                    break;

                case 1: // '\001'
                    boolean flag1;
                    if (l3 == 0L)
                        flag1 = true;
                    else
                        flag1 = false;
                    MathPreconditions.checkRoundingUnnecessary(flag1);
                    // fall through

                case 2: // '\002'
                    flag = false;
                    break;
                }
                if (flag)
                    return l2 + (long)i;
            }
            return l2;
        }
        throw new AssertionError();
    }

    public static long factorial(int i)
    {
        MathPreconditions.checkNonNegative("n", i);
        if (i < FACTORIALS.length)
            return FACTORIALS[i];
        else
            return 0x7fffffffffffffffL;
    }

    static boolean fitsInInt(long l)
    {
        return (long)(int)l == l;
    }

    public static long gcd(long l, long l1)
    {
        boolean flag = true;
        MathPreconditions.checkNonNegative("a", l);
        MathPreconditions.checkNonNegative("b", l1);
        boolean flag1;
        if (l == 0L)
            flag1 = flag;
        else
            flag1 = false;
        if (l1 != 0L)
            flag = false;
        if (flag | flag1)
            return l | l1;
        int i = Long.numberOfTrailingZeros(l);
        long l2 = l >> i;
        int j = Long.numberOfTrailingZeros(l1);
        long l4;
        for (long l3 = l1 >> j; l2 != l3; l2 = l4 >> Long.numberOfTrailingZeros(l4))
        {
            if (l2 < l3)
            {
                long l5 = l3;
                l3 = l2;
                l2 = l5;
            }
            l4 = l2 - l3;
        }

        return l2 << Math.min(i, j);
    }

    public static boolean isPowerOfTwo(long l)
    {
        boolean flag = true;
        boolean flag1;
        if (l > 0L)
            flag1 = flag;
        else
            flag1 = false;
        if ((l & l - 1L) != 0L)
            flag = false;
        return flag & flag1;
    }

    public static int log10(long l, RoundingMode roundingmode)
    {
label0:
        {
            int i;
            long l1;
label1:
            {
                MathPreconditions.checkPositive("x", l);
                if (fitsInInt(l))
                {
                    i = IntMath.log10((int)l, roundingmode);
                } else
                {
                    i = log10Floor(l);
                    l1 = POWERS_OF_10[i];
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
                        if (l > HALF_POWERS_OF_10[i])
                            return i + 1;
                        break;

                    case 4: // '\004'
                    case 5: // '\005'
                        if (l != l1)
                            return i + 1;
                        break;
                    }
                }
                return i;
            }
            boolean flag;
            if (l == l1)
                flag = true;
            else
                flag = false;
            MathPreconditions.checkRoundingUnnecessary(flag);
            return i;
        }
        throw new AssertionError();
    }

    static int log10Floor(long l)
    {
        for (int i = 1; i < POWERS_OF_10.length; i++)
            if (l < POWERS_OF_10[i])
                return i - 1;

        return -1 + POWERS_OF_10.length;
    }

    public static int log2(long l, RoundingMode roundingmode)
    {
label0:
        {
            MathPreconditions.checkPositive("x", l);
            int i;
            switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
            {
            default:
                break label0;

            case 6: // '\006'
            case 7: // '\007'
            case 8: // '\b'
                int j = Long.numberOfLeadingZeros(l);
                long l1 = 0xb504f333f9de6484L >>> j;
                i = 63 - j;
                if (l > l1)
                    return i + 1;
                break;

            case 4: // '\004'
            case 5: // '\005'
                return 64 - Long.numberOfLeadingZeros(l - 1L);

            case 1: // '\001'
                MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(l));
                // fall through

            case 2: // '\002'
            case 3: // '\003'
                i = 63 - Long.numberOfLeadingZeros(l);
                break;
            }
            return i;
        }
        throw new AssertionError("impossible");
    }

    public static int mod(long l, int i)
    {
        return (int)mod(l, i);
    }

    public static long mod(long l, long l1)
    {
        if (l1 <= 0L)
            throw new ArithmeticException((new StringBuilder()).append("Modulus ").append(l1).append(" must be > 0").toString());
        long l2 = l % l1;
        if (l2 >= 0L)
            return l2;
        else
            return l2 + l1;
    }

    public static long pow(long l, int i)
    {
label0:
        {
            long l1 = 0L;
            MathPreconditions.checkNonNegative("exponent", i);
            if (-2L > l || l > 2L)
                break label0;
            switch ((int)l)
            {
            default:
                break label0;

            case -2: 
                if (i < 64)
                {
                    if ((i & 1) == 0)
                        return 1L << i;
                    else
                        return -(1L << i);
                } else
                {
                    return l1;
                }

            case 1: // '\001'
                break;

            case 2: // '\002'
                if (i < 64)
                    l1 = 1L << i;
                return l1;

            case -1: 
                if ((i & 1) != 0)
                    return -1L;
                break;

            case 0: // '\0'
                if (i != 0)
                    return l1;
                break;
            }
            return 1L;
        }
        long l2 = 1L;
        do
        {
            switch (i)
            {
            case 1: // '\001'
                return l2 * l;

            case 0: // '\0'
                return l2;
            }
            long l3;
            if ((i & 1) == 0)
                l3 = 1L;
            else
                l3 = l;
            l2 *= l3;
            l *= l;
            i >>= 1;
        } while (true);
    }

    public static long sqrt(long l, RoundingMode roundingmode)
    {
label0:
        {
            boolean flag;
            long l1;
label1:
            {
                flag = true;
                MathPreconditions.checkNonNegative("x", l);
                if (fitsInInt(l))
                {
                    l1 = IntMath.sqrt((int)l, roundingmode);
                } else
                {
                    l1 = sqrtFloor(l);
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
                        long l2 = l1 + l1 * l1;
                        boolean flag1;
                        if (l2 >= l)
                            flag1 = flag;
                        else
                            flag1 = false;
                        if (l2 >= 0L)
                            flag = false;
                        if (!(flag | flag1))
                            return l1 + 1L;
                        break;

                    case 4: // '\004'
                    case 5: // '\005'
                        if (l1 * l1 != l)
                            return l1 + 1L;
                        break;
                    }
                }
                return l1;
            }
            if (l1 * l1 != l)
                flag = false;
            MathPreconditions.checkRoundingUnnecessary(flag);
            return l1;
        }
        throw new AssertionError();
    }

    private static long sqrtFloor(long l)
    {
        long l1 = (long)Math.sqrt(l);
        long l2 = l1 + l / l1 >> 1;
        if (l2 == l1)
            return l1;
        long l3;
        do
        {
            l3 = l2;
            l2 = l3 + l / l3 >> 1;
        } while (l2 < l3);
        return l3;
    }

}
