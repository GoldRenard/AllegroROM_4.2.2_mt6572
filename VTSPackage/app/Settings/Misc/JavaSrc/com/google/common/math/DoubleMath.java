// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.math;

import com.google.common.base.Preconditions;
import java.math.BigInteger;
import java.math.RoundingMode;

// Referenced classes of package com.google.common.math:
//            MathPreconditions, DoubleUtils, LongMath

public final class DoubleMath
{

    static final double EVERY_SIXTEENTH_FACTORIAL[] = {
        1.0D, 20922789888000D, 2.6313083693369352E+035D, 1.2413915592536073E+061D, 1.2688693218588417E+089D, 7.1569457046263806E+118D, 9.9167793487094965E+149D, 1.974506857221074E+182D, 3.8562048236258041E+215D, 5.5502938327393044E+249D, 
        4.7147236359920616E+284D
    };
    private static final double LN_2 = Math.log(2D);
    static final int MAX_FACTORIAL = 170;
    private static final double MAX_INT_AS_DOUBLE = 2147483647D;
    private static final double MAX_LONG_AS_DOUBLE_PLUS_ONE = 9.2233720368547758E+018D;
    private static final double MIN_INT_AS_DOUBLE = -2147483648D;
    private static final double MIN_LONG_AS_DOUBLE = -9.2233720368547758E+018D;


    public static double factorial(int i)
    {
        MathPreconditions.checkNonNegative("n", i);
        if (i > 170)
            return (1.0D / 0.0D);
        double d = 1.0D;
        for (int j = 1 + (i & 0xfffffff0); j <= i; j++)
            d *= j;

        return d * EVERY_SIXTEENTH_FACTORIAL[i >> 4];
    }

    public static boolean isMathematicalInteger(double d)
    {
        return DoubleUtils.isFinite(d) && (d == 0.0D || 52 - Long.numberOfTrailingZeros(DoubleUtils.getSignificand(d)) <= DoubleUtils.getExponent(d));
    }

    public static boolean isPowerOfTwo(double d)
    {
        return d > 0.0D && DoubleUtils.isFinite(d) && LongMath.isPowerOfTwo(DoubleUtils.getSignificand(d));
    }

    public static double log2(double d)
    {
        return Math.log(d) / LN_2;
    }

    public static int log2(double d, RoundingMode roundingmode)
    {
label0:
        {
            boolean flag = true;
            boolean flag1;
            if (d > 0.0D && DoubleUtils.isFinite(d))
                flag1 = flag;
            else
                flag1 = false;
            Preconditions.checkArgument(flag1, "x must be positive and finite");
            int i = DoubleUtils.getExponent(d);
            if (!DoubleUtils.isNormal(d))
            {
                i = -52 + log2(4503599627370496D * d, roundingmode);
            } else
            {
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
                            $SwitchMap$java$math$RoundingMode[RoundingMode.FLOOR.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.CEILING.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.DOWN.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror3) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.UP.ordinal()] = 5;
                        }
                        catch (NoSuchFieldError nosuchfielderror4) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_EVEN.ordinal()] = 6;
                        }
                        catch (NoSuchFieldError nosuchfielderror5) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_UP.ordinal()] = 7;
                        }
                        catch (NoSuchFieldError nosuchfielderror6) { }
                        try
                        {
                            $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_DOWN.ordinal()] = 8;
                        }
                        catch (NoSuchFieldError nosuchfielderror7)
                        {
                            return;
                        }
                    }
                }

                boolean flag2;
                switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
                {
                default:
                    break label0;

                case 6: // '\006'
                case 7: // '\007'
                case 8: // '\b'
                    double d1 = DoubleUtils.scaleNormalize(d);
                    if (d1 * d1 > 2D)
                        flag2 = flag;
                    else
                        flag2 = false;
                    break;

                case 5: // '\005'
                    boolean flag4;
                    if (i >= 0)
                        flag4 = flag;
                    else
                        flag4 = false;
                    if (isPowerOfTwo(d))
                        flag = false;
                    flag2 = flag4 & flag;
                    break;

                case 4: // '\004'
                    boolean flag3;
                    if (i < 0)
                        flag3 = flag;
                    else
                        flag3 = false;
                    if (isPowerOfTwo(d))
                        flag = false;
                    flag2 = flag3 & flag;
                    break;

                case 3: // '\003'
                    if (!isPowerOfTwo(d))
                        flag2 = flag;
                    else
                        flag2 = false;
                    break;

                case 1: // '\001'
                    MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(d));
                    // fall through

                case 2: // '\002'
                    flag2 = false;
                    break;
                }
                if (flag2)
                    return i + 1;
            }
            return i;
        }
        throw new AssertionError();
    }

    static double roundIntermediate(double d, RoundingMode roundingmode)
    {
label0:
        {
            if (!DoubleUtils.isFinite(d))
                throw new ArithmeticException("input is infinite or NaN");
            switch (_cls1..SwitchMap.java.math.RoundingMode[roundingmode.ordinal()])
            {
            default:
                break label0;

            case 4: // '\004'
                break;

            case 8: // '\b'
                if (isMathematicalInteger(d))
                    break;
                if (d >= 0.0D)
                {
                    double d4 = d + 0.5D;
                    if (d4 != d)
                        return DoubleUtils.next(d4, false);
                    break;
                }
                double d3 = d - 0.5D;
                if (d3 != d)
                    return DoubleUtils.next(d3, true);
                break;

            case 7: // '\007'
                if (isMathematicalInteger(d))
                    break;
                double d2;
                if (d >= 0.0D)
                    d2 = d + 0.5D;
                else
                    d2 = d - 0.5D;
                return d2;

            case 6: // '\006'
                return Math.rint(d);

            case 5: // '\005'
                double d1;
                if (d >= 0.0D)
                    d1 = Math.ceil(d);
                else
                    d1 = Math.floor(d);
                return d1;

            case 3: // '\003'
                if (d >= 0.0D)
                    return Math.ceil(d);
                break;

            case 2: // '\002'
                if (d < 0.0D)
                    return Math.floor(d);
                break;

            case 1: // '\001'
                MathPreconditions.checkRoundingUnnecessary(isMathematicalInteger(d));
                break;
            }
            return d;
        }
        throw new AssertionError();
    }

    public static BigInteger roundToBigInteger(double d, RoundingMode roundingmode)
    {
        boolean flag = true;
        double d1 = roundIntermediate(d, roundingmode);
        boolean flag1;
        if (-9.2233720368547758E+018D - d1 < 1.0D)
            flag1 = flag;
        else
            flag1 = false;
        if (d1 >= 9.2233720368547758E+018D)
            flag = false;
        BigInteger biginteger;
        if (flag & flag1)
        {
            biginteger = BigInteger.valueOf((long)d1);
        } else
        {
            int i = DoubleUtils.getExponent(d1);
            if (i < 0)
                return BigInteger.ZERO;
            biginteger = BigInteger.valueOf(DoubleUtils.getSignificand(d1)).shiftLeft(i - 52);
            if (d1 < 0.0D)
                return biginteger.negate();
        }
        return biginteger;
    }

    public static int roundToInt(double d, RoundingMode roundingmode)
    {
        boolean flag = true;
        double d1 = roundIntermediate(d, roundingmode);
        boolean flag1;
        if (d1 > -2147483649D)
            flag1 = flag;
        else
            flag1 = false;
        if (d1 >= 2147483648D)
            flag = false;
        MathPreconditions.checkInRange(flag & flag1);
        return (int)d1;
    }

    public static long roundToLong(double d, RoundingMode roundingmode)
    {
        boolean flag = true;
        double d1 = roundIntermediate(d, roundingmode);
        boolean flag1;
        if (-9.2233720368547758E+018D - d1 < 1.0D)
            flag1 = flag;
        else
            flag1 = false;
        if (d1 >= 9.2233720368547758E+018D)
            flag = false;
        MathPreconditions.checkInRange(flag & flag1);
        return (long)d1;
    }

}
