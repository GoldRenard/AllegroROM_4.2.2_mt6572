// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.math.BigInteger;
import java.util.Comparator;

// Referenced classes of package com.google.common.primitives:
//            Longs

public final class UnsignedLongs
{
    static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/UnsignedLongs$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((long[])obj, (long[])obj1);
        }

        public int compare(long al[], long al1[])
        {
            int i = Math.min(al.length, al1.length);
            for (int j = 0; j < i; j++)
                if (al[j] != al1[j])
                    return UnsignedLongs.compare(al[j], al1[j]);

            return al.length - al1.length;
        }

        static 
        {
            INSTANCE = new LexicographicalComparator("INSTANCE", 0);
            LexicographicalComparator alexicographicalcomparator[] = new LexicographicalComparator[1];
            alexicographicalcomparator[0] = INSTANCE;
            $VALUES = alexicographicalcomparator;
        }

        private LexicographicalComparator(String s, int i)
        {
            super(s, i);
        }
    }


    public static final long MAX_VALUE = -1L;
    private static final int maxSafeDigits[];
    private static final long maxValueDivs[];
    private static final int maxValueMods[];

    private UnsignedLongs()
    {
    }

    public static int compare(long l, long l1)
    {
        return Longs.compare(flip(l), flip(l1));
    }

    public static long divide(long l, long l1)
    {
        int i = 1;
        if (l1 < 0L)
            return compare(l, l1) >= 0 ? 1L : 0L;
        if (l >= 0L)
            return l / l1;
        long l2 = (l >>> i) / l1 << i;
        if (compare(l - l2 * l1, l1) < 0)
            i = 0;
        return l2 + (long)i;
    }

    private static long flip(long l)
    {
        return 0x8000000000000000L ^ l;
    }

    public static transient String join(String s, long al[])
    {
        Preconditions.checkNotNull(s);
        if (al.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(5 * al.length);
        stringbuilder.append(al[0]);
        for (int i = 1; i < al.length; i++)
            stringbuilder.append(s).append(toString(al[i]));

        return stringbuilder.toString();
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient long max(long al[])
    {
        boolean flag;
        if (al.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        long l = flip(al[0]);
        for (int i = 1; i < al.length; i++)
        {
            long l1 = flip(al[i]);
            if (l1 > l)
                l = l1;
        }

        return flip(l);
    }

    public static transient long min(long al[])
    {
        boolean flag;
        if (al.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        long l = flip(al[0]);
        for (int i = 1; i < al.length; i++)
        {
            long l1 = flip(al[i]);
            if (l1 < l)
                l = l1;
        }

        return flip(l);
    }

    private static boolean overflowInParse(long l, int i, int j)
    {
        boolean flag = true;
        if (l >= 0L)
            if (l < maxValueDivs[j])
                flag = false;
            else
            if (l <= maxValueDivs[j] && i <= maxValueMods[j])
                return false;
        return flag;
    }

    public static long parseUnsignedLong(String s)
    {
        return parseUnsignedLong(s, 10);
    }

    public static long parseUnsignedLong(String s, int i)
    {
        Preconditions.checkNotNull(s);
        if (s.length() == 0)
            throw new NumberFormatException("empty string");
        if (i >= 2 && i <= 36)
        {
            int j = -1 + maxSafeDigits[i];
            long l = 0L;
            for (int k = 0; k < s.length(); k++)
            {
                int i1 = Character.digit(s.charAt(k), i);
                if (i1 == -1)
                    throw new NumberFormatException(s);
                if (k > j && overflowInParse(l, i1, i))
                    throw new NumberFormatException((new StringBuilder()).append("Too large for unsigned long: ").append(s).toString());
                l = l * (long)i + (long)i1;
            }

            return l;
        } else
        {
            throw new NumberFormatException((new StringBuilder()).append("illegal radix:").append(i).toString());
        }
    }

    public static long remainder(long l, long l1)
    {
        if (l1 < 0L)
            if (compare(l, l1) < 0)
                return l;
            else
                return l - l1;
        if (l >= 0L)
            return l % l1;
        long l2 = l - l1 * ((l >>> 1) / l1 << 1);
        if (compare(l2, l1) < 0)
            l1 = 0L;
        return l2 - l1;
    }

    public static String toString(long l)
    {
        return toString(l, 10);
    }

    public static String toString(long l, int i)
    {
        boolean flag;
        if (i >= 2 && i <= 36)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "radix (%s) must be between Character.MIN_RADIX and Character.MAX_RADIX", aobj);
        if (l == 0L)
            return "0";
        char ac[] = new char[64];
        int j = ac.length;
        if (l < 0L)
        {
            long l1 = l >>> 32;
            long l2 = (0xffffffffL & l) + (l1 % (long)i << 32);
            for (long l3 = l1 / (long)i; l2 > 0L || l3 > 0L; l3 /= i)
            {
                j--;
                ac[j] = Character.forDigit((int)(l2 % (long)i), i);
                l2 = l2 / (long)i + (l3 % (long)i << 32);
            }

        } else
        {
            for (; l > 0L; l /= i)
            {
                j--;
                ac[j] = Character.forDigit((int)(l % (long)i), i);
            }

        }
        return new String(ac, j, ac.length - j);
    }

    static 
    {
        maxValueDivs = new long[37];
        maxValueMods = new int[37];
        maxSafeDigits = new int[37];
        BigInteger biginteger = new BigInteger("10000000000000000", 16);
        for (int i = 2; i <= 36; i++)
        {
            maxValueDivs[i] = divide(-1L, i);
            maxValueMods[i] = (int)remainder(-1L, i);
            maxSafeDigits[i] = -1 + biginteger.toString(i).length();
        }

    }
}
