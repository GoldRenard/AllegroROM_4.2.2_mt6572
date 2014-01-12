// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.RoundingMode;

// Referenced classes of package com.google.common.math:
//            MathPreconditions

public final class IntMath
{

    static int BIGGEST_BINOMIALS[] = {
        0x7fffffff, 0x7fffffff, 0x10000, 2345, 477, 193, 110, 75, 58, 49, 
        43, 39, 37, 35, 34, 34, 33
    };
    static final int FACTORIALS[] = {
        1, 1, 2, 6, 24, 120, 720, 5040, 40320, 0x58980, 
        0x375f00, 0x2611500, 0x1c8cfc00
    };
    static final int FLOOR_SQRT_MAX_INT = 46340;
    static final int HALF_POWERS_OF_10[] = {
        3, 31, 316, 3162, 31622, 0x4d343, 0x3040a5, 0x1e28678, 0x12d940b6, 0x7fffffff
    };
    static final int MAX_POWER_OF_SQRT2_UNSIGNED = 0xb504f333;
    static final int POWERS_OF_10[] = {
        1, 10, 100, 1000, 10000, 0x186a0, 0xf4240, 0x989680, 0x5f5e100, 0x3b9aca00
    };

    private IntMath()
    {
    }

    public static int binomial(int i, int j)
    {
        int k = 1;
        MathPreconditions.checkNonNegative("n", i);
        MathPreconditions.checkNonNegative("k", j);
        boolean flag;
        if (j <= i)
            flag = k;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(j);
        aobj[k] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "k (%s) > n (%s)", aobj);
        if (j > i >> 1)
            j = i - j;
        if (j < BIGGEST_BINOMIALS.length && i <= BIGGEST_BINOMIALS[j])
            switch (j)
            {
            case 1: // '\001'
                return i;

            default:
                long l = 1L;
                for (int i1 = 0; i1 < j; i1++)
                    l = (l * (long)(i - i1)) / (long)(i1 + 1);

                return (int)l;

            case 0: // '\0'
                break;
            }
        else
            k = 0x7fffffff;
        return k;
    }

    public static int checkedAdd(int i, int j)
    {
        long l = (long)i + (long)j;
        boolean flag;
        if (l == (long)(int)l)
            flag = true;
        else
            flag = false;
        MathPreconditions.checkNoOverflow(flag);
        return (int)l;
    }

    public static int checkedMultiply(int i, int j)
    {
        long l = (long)i * (long)j;
        boolean flag;
        if (l == (long)(int)l)
            flag = true;
        else
            flag = false;
        MathPreconditions.checkNoOverflow(flag);
        return (int)l;
    }

    public static int checkedPow(int i, int j)
    {
label0:
        {
            MathPreconditions.checkNonNegative("exponent", j);
            switch (i)
            {
            default:
                break label0;

            case -2: 
                boolean flag3 = false;
                if (j < 32)
                    flag3 = true;
                MathPreconditions.checkNoOverflow(flag3);
                if ((j & 1) == 0)
                    return 1 << j;
                else
                    return -1 << j;

            case 1: // '\001'
                break;

            case 2: // '\002'
                boolean flag2 = false;
                if (j < 31)
                    flag2 = true;
                MathPreconditions.checkNoOverflow(flag2);
                return 1 << j;

            case -1: 
                if ((j & 1) != 0)
                    return -1;
                break;

            case 0: // '\0'
                if (j != 0)
                    return 0;
                break;
            }
            return 1;
        }
        int k = 1;
        do
        {
            do
            {
                switch (j)
                {
                case 1: // '\001'
                    return checkedMultiply(k, i);

                case 0: // '\0'
                    return k;
                }
                if ((j & 1) != 0)
                    k = checkedMultiply(k, i);
                j >>= 1;
            } while (j <= 0);
            boolean flag;
            if (-46340 <= i)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (i <= 46340)
                flag1 = true;
            else
                flag1 = false;
            MathPreconditions.checkNoOverflow(flag1 & flag);
            i *= i;
        } while (true);
    }

    public static int checkedSubtract(int i, int j)
    {
        long l = (long)i - (long)j;
        boolean flag;
        if (l == (long)(int)l)
            flag = true;
        else
            flag = false;
        MathPreconditions.checkNoOverflow(flag);
        return (int)l;
    }

    public static int divide(int i, int j, RoundingMode roundingmode)
    {
label0:
        {
            boolean flag = true;
            Preconditions.checkNotNull(roundingmode);
            if (j == 0)
                throw new ArithmeticException("/ by zero");
            int k = i / j;
            int l = i - j * k;
            if (l != 0)
            {
                int i1 = 1 | (i ^ j) >> 31;
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

                boolean flag1;
                switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
                {
                default:
                    break label0;

                case 6: // '\006'
                case 7: // '\007'
                case 8: // '\b'
                    int j1 = Math.abs(l);
                    int k1 = j1 - (Math.abs(j) - j1);
                    if (k1 == 0)
                    {
                        if (roundingmode != RoundingMode.HALF_UP)
                        {
                            boolean flag2;
                            if (roundingmode == RoundingMode.HALF_EVEN)
                                flag2 = flag;
                            else
                                flag2 = false;
                            boolean flag3;
                            if ((k & 1) != 0)
                                flag3 = flag;
                            else
                                flag3 = false;
                            if (!(flag3 & flag2))
                            {
                                flag1 = false;
                                break;
                            }
                        }
                        flag1 = flag;
                    } else
                    if (k1 > 0)
                        flag1 = flag;
                    else
                        flag1 = false;
                    break;

                case 3: // '\003'
                    if (i1 < 0)
                        flag1 = flag;
                    else
                        flag1 = false;
                    break;

                case 5: // '\005'
                    if (i1 > 0)
                        flag1 = flag;
                    else
                        flag1 = false;
                    break;

                case 4: // '\004'
                    flag1 = true;
                    break;

                case 1: // '\001'
                    if (l != 0)
                        flag = false;
                    MathPreconditions.checkRoundingUnnecessary(flag);
                    // fall through

                case 2: // '\002'
                    flag1 = false;
                    break;
                }
                if (flag1)
                    return k + i1;
            }
            return k;
        }
        throw new AssertionError();
    }

    public static int factorial(int i)
    {
        MathPreconditions.checkNonNegative("n", i);
        if (i < FACTORIALS.length)
            return FACTORIALS[i];
        else
            return 0x7fffffff;
    }

    public static int gcd(int i, int j)
    {
        MathPreconditions.checkNonNegative("a", i);
        MathPreconditions.checkNonNegative("b", j);
        while (j != 0) 
        {
            int k = j;
            j = i % j;
            i = k;
        }
        return i;
    }

    public static boolean isPowerOfTwo(int i)
    {
        boolean flag = true;
        boolean flag1;
        if (i > 0)
            flag1 = flag;
        else
            flag1 = false;
        if ((i & i - 1) != 0)
            flag = false;
        return flag & flag1;
    }

    public static int log10(int i, RoundingMode roundingmode)
    {
label0:
        {
            MathPreconditions.checkPositive("x", i);
            int j = log10Floor(i);
            int k = POWERS_OF_10[j];
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
                if (i > HALF_POWERS_OF_10[j])
                    return j + 1;
                break;

            case 4: // '\004'
            case 5: // '\005'
                if (i != k)
                    return j + 1;
                break;

            case 1: // '\001'
                boolean flag;
                if (i == k)
                    flag = true;
                else
                    flag = false;
                MathPreconditions.checkRoundingUnnecessary(flag);
                break;
            }
            return j;
        }
        throw new AssertionError();
    }

    private static int log10Floor(int i)
    {
        for (int j = 1; j < POWERS_OF_10.length; j++)
            if (i < POWERS_OF_10[j])
                return j - 1;

        return -1 + POWERS_OF_10.length;
    }

    public static int log2(int i, RoundingMode roundingmode)
    {
label0:
        {
            MathPreconditions.checkPositive("x", i);
            int j;
            switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
            {
            default:
                break label0;

            case 6: // '\006'
            case 7: // '\007'
            case 8: // '\b'
                int k = Integer.numberOfLeadingZeros(i);
                int l = 0xb504f333 >>> k;
                j = 31 - k;
                if (i > l)
                    return j + 1;
                break;

            case 4: // '\004'
            case 5: // '\005'
                return 32 - Integer.numberOfLeadingZeros(i - 1);

            case 1: // '\001'
                MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(i));
                // fall through

            case 2: // '\002'
            case 3: // '\003'
                j = 31 - Integer.numberOfLeadingZeros(i);
                break;
            }
            return j;
        }
        throw new AssertionError();
    }

    public static int mod(int i, int j)
    {
        if (j <= 0)
            throw new ArithmeticException((new StringBuilder()).append("Modulus ").append(j).append(" must be > 0").toString());
        int k = i % j;
        if (k >= 0)
            return k;
        else
            return k + j;
    }

    public static int pow(int i, int j)
    {
label0:
        {
            MathPreconditions.checkNonNegative("exponent", j);
            switch (i)
            {
            default:
                break label0;

            case -2: 
                if (j < 32)
                {
                    if ((j & 1) == 0)
                        return 1 << j;
                    else
                        return -(1 << j);
                } else
                {
                    return 0;
                }

            case 1: // '\001'
                break;

            case 2: // '\002'
                int i1 = 0;
                if (j < 32)
                    i1 = 1 << j;
                return i1;

            case -1: 
                if ((j & 1) != 0)
                    return -1;
                break;

            case 0: // '\0'
                if (j != 0)
                    return 0;
                break;
            }
            return 1;
        }
        int k = 1;
        do
        {
            switch (j)
            {
            case 1: // '\001'
                return i * k;

            case 0: // '\0'
                return k;
            }
            int l;
            if ((j & 1) == 0)
                l = 1;
            else
                l = i;
            k *= l;
            i *= i;
            j >>= 1;
        } while (true);
    }

    public static int sqrt(int i, RoundingMode roundingmode)
    {
label0:
        {
            boolean flag = true;
            MathPreconditions.checkNonNegative("x", i);
            int j = sqrtFloor(i);
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
                int k = j + j * j;
                boolean flag1;
                if (i <= k)
                    flag1 = flag;
                else
                    flag1 = false;
                if (k >= 0)
                    flag = false;
                if (!(flag | flag1))
                    return j + 1;
                break;

            case 4: // '\004'
            case 5: // '\005'
                if (j * j != i)
                    return j + 1;
                break;

            case 1: // '\001'
                if (j * j != i)
                    flag = false;
                MathPreconditions.checkRoundingUnnecessary(flag);
                break;
            }
            return j;
        }
        throw new AssertionError();
    }

    private static int sqrtFloor(int i)
    {
        return (int)Math.sqrt(i);
    }

}
