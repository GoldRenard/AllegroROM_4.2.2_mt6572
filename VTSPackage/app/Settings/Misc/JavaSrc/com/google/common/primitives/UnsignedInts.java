// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.util.Comparator;

// Referenced classes of package com.google.common.primitives:
//            Ints

public final class UnsignedInts
{
    static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/UnsignedInts$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((int[])obj, (int[])obj1);
        }

        public int compare(int ai[], int ai1[])
        {
            int i = Math.min(ai.length, ai1.length);
            for (int j = 0; j < i; j++)
                if (ai[j] != ai1[j])
                    return UnsignedInts.compare(ai[j], ai1[j]);

            return ai.length - ai1.length;
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


    static final long INT_MASK = 0xffffffffL;

    private UnsignedInts()
    {
    }

    public static int compare(int i, int j)
    {
        return Ints.compare(flip(i), flip(j));
    }

    public static int divide(int i, int j)
    {
        return (int)(toLong(i) / toLong(j));
    }

    static int flip(int i)
    {
        return 0x80000000 ^ i;
    }

    public static transient String join(String s, int ai[])
    {
        Preconditions.checkNotNull(s);
        if (ai.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(5 * ai.length);
        stringbuilder.append(ai[0]);
        for (int i = 1; i < ai.length; i++)
            stringbuilder.append(s).append(toString(ai[i]));

        return stringbuilder.toString();
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient int max(int ai[])
    {
        boolean flag;
        if (ai.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        int i = flip(ai[0]);
        for (int j = 1; j < ai.length; j++)
        {
            int k = flip(ai[j]);
            if (k > i)
                i = k;
        }

        return flip(i);
    }

    public static transient int min(int ai[])
    {
        boolean flag;
        if (ai.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        int i = flip(ai[0]);
        for (int j = 1; j < ai.length; j++)
        {
            int k = flip(ai[j]);
            if (k < i)
                i = k;
        }

        return flip(i);
    }

    public static int parseUnsignedInt(String s)
    {
        return parseUnsignedInt(s, 10);
    }

    public static int parseUnsignedInt(String s, int i)
    {
        Preconditions.checkNotNull(s);
        long l = Long.parseLong(s, i);
        if ((0xffffffffL & l) != l)
            throw new NumberFormatException((new StringBuilder()).append("Input ").append(s).append(" in base ").append(i).append(" is not in the range of an unsigned integer").toString());
        else
            return (int)l;
    }

    public static int remainder(int i, int j)
    {
        return (int)(toLong(i) % toLong(j));
    }

    public static long toLong(int i)
    {
        return 0xffffffffL & (long)i;
    }

    public static String toString(int i)
    {
        return toString(i, 10);
    }

    public static String toString(int i, int j)
    {
        return Long.toString(0xffffffffL & (long)i, j);
    }
}
