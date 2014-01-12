// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.util.Comparator;

public final class UnsignedBytes
{
    static class LexicographicalComparatorHolder
    {

        static final Comparator BEST_COMPARATOR = UnsignedBytes.lexicographicalComparatorJavaImpl();
        static final String UNSAFE_COMPARATOR_NAME = (new StringBuilder()).append(com/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder.getName()).append("$UnsafeComparator").toString();


    }

    static final class LexicographicalComparatorHolder.PureJavaComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparatorHolder.PureJavaComparator $VALUES[];
        public static final LexicographicalComparatorHolder.PureJavaComparator INSTANCE;

        public static LexicographicalComparatorHolder.PureJavaComparator valueOf(String s)
        {
            return (LexicographicalComparatorHolder.PureJavaComparator)Enum.valueOf(com/google/common/primitives/UnsignedBytes$LexicographicalComparatorHolder$PureJavaComparator, s);
        }

        public static LexicographicalComparatorHolder.PureJavaComparator[] values()
        {
            return (LexicographicalComparatorHolder.PureJavaComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((byte[])obj, (byte[])obj1);
        }

        public int compare(byte abyte0[], byte abyte1[])
        {
            int i = Math.min(abyte0.length, abyte1.length);
            for (int j = 0; j < i; j++)
            {
                int k = UnsignedBytes.compare(abyte0[j], abyte1[j]);
                if (k != 0)
                    return k;
            }

            return abyte0.length - abyte1.length;
        }

        static 
        {
            INSTANCE = new LexicographicalComparatorHolder.PureJavaComparator("INSTANCE", 0);
            LexicographicalComparatorHolder.PureJavaComparator apurejavacomparator[] = new LexicographicalComparatorHolder.PureJavaComparator[1];
            apurejavacomparator[0] = INSTANCE;
            $VALUES = apurejavacomparator;
        }

        private LexicographicalComparatorHolder.PureJavaComparator(String s, int i)
        {
            super(s, i);
        }
    }


    public static final byte MAX_POWER_OF_TWO = -128;

    private UnsignedBytes()
    {
    }

    public static byte checkedCast(long l)
    {
        boolean flag;
        if (l >> 8 == 0L)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "out of range: %s", aobj);
        return (byte)(int)l;
    }

    public static int compare(byte byte0, byte byte1)
    {
        return toInt(byte0) - toInt(byte1);
    }

    public static transient String join(String s, byte abyte0[])
    {
        Preconditions.checkNotNull(s);
        if (abyte0.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(5 * abyte0.length);
        stringbuilder.append(toInt(abyte0[0]));
        for (int i = 1; i < abyte0.length; i++)
            stringbuilder.append(s).append(toInt(abyte0[i]));

        return stringbuilder.toString();
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparatorHolder.BEST_COMPARATOR;
    }

    static Comparator lexicographicalComparatorJavaImpl()
    {
        return LexicographicalComparatorHolder.PureJavaComparator.INSTANCE;
    }

    public static transient byte max(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        int i = toInt(abyte0[0]);
        for (int j = 1; j < abyte0.length; j++)
        {
            int k = toInt(abyte0[j]);
            if (k > i)
                i = k;
        }

        return (byte)i;
    }

    public static transient byte min(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        int i = toInt(abyte0[0]);
        for (int j = 1; j < abyte0.length; j++)
        {
            int k = toInt(abyte0[j]);
            if (k < i)
                i = k;
        }

        return (byte)i;
    }

    public static byte saturatedCast(long l)
    {
        if (l > 255L)
            return -1;
        if (l < 0L)
            return 0;
        else
            return (byte)(int)l;
    }

    public static int toInt(byte byte0)
    {
        return byte0 & 0xff;
    }
}
