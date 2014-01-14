// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.util.Comparator;

public final class SignedBytes
{
    private static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/SignedBytes$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
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
                int k = SignedBytes.compare(abyte0[j], abyte1[j]);
                if (k != 0)
                    return k;
            }

            return abyte0.length - abyte1.length;
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


    public static final byte MAX_POWER_OF_TWO = 64;

    private SignedBytes()
    {
    }

    public static byte checkedCast(long l)
    {
        byte byte0 = (byte)(int)l;
        boolean flag;
        if ((long)byte0 == l)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "Out of range: %s", aobj);
        return byte0;
    }

    public static int compare(byte byte0, byte byte1)
    {
        return byte0 - byte1;
    }

    public static transient String join(String s, byte abyte0[])
    {
        Preconditions.checkNotNull(s);
        if (abyte0.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(5 * abyte0.length);
        stringbuilder.append(abyte0[0]);
        for (int i = 1; i < abyte0.length; i++)
            stringbuilder.append(s).append(abyte0[i]);

        return stringbuilder.toString();
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient byte max(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        byte byte0 = abyte0[0];
        for (int i = 1; i < abyte0.length; i++)
            if (abyte0[i] > byte0)
                byte0 = abyte0[i];

        return byte0;
    }

    public static transient byte min(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        byte byte0 = abyte0[0];
        for (int i = 1; i < abyte0.length; i++)
            if (abyte0[i] < byte0)
                byte0 = abyte0[i];

        return byte0;
    }

    public static byte saturatedCast(long l)
    {
        if (l > 127L)
            return 127;
        if (l < -128L)
            return -128;
        else
            return (byte)(int)l;
    }
}
