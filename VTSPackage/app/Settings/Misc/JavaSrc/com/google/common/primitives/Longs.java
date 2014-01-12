// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Longs
{
    private static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Longs$LexicographicalComparator, s);
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
            {
                int k = Longs.compare(al[j], al1[j]);
                if (k != 0)
                    return k;
            }

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

    private static class LongArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final long array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Long) && Longs.indexOf(array, ((Long)obj).longValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof LongArrayAsList))
                        break label0;
                    LongArrayAsList longarrayaslist = (LongArrayAsList)obj;
                    int i = size();
                    if (longarrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != longarrayaslist.array[j + longarrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Long get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Long.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Longs.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Long)
            {
                int i = Longs.indexOf(array, ((Long)obj).longValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public boolean isEmpty()
        {
            return false;
        }

        public int lastIndexOf(Object obj)
        {
            if (obj instanceof Long)
            {
                int i = Longs.lastIndexOf(array, ((Long)obj).longValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Long set(int i, Long long1)
        {
            Preconditions.checkElementIndex(i, size());
            long l = array[i + start];
            array[i + start] = ((Long)Preconditions.checkNotNull(long1)).longValue();
            return Long.valueOf(l);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Long)obj);
        }

        public int size()
        {
            return end - start;
        }

        public List subList(int i, int j)
        {
            Preconditions.checkPositionIndexes(i, j, size());
            if (i == j)
                return Collections.emptyList();
            else
                return new LongArrayAsList(array, i + start, j + start);
        }

        long[] toLongArray()
        {
            int i = size();
            long al[] = new long[i];
            System.arraycopy(array, start, al, 0, i);
            return al;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(10 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        LongArrayAsList(long al[])
        {
            this(al, 0, al.length);
        }

        LongArrayAsList(long al[], int i, int j)
        {
            array = al;
            start = i;
            end = j;
        }
    }


    public static final int BYTES = 8;
    public static final long MAX_POWER_OF_TWO = 0x4000000000000000L;

    private Longs()
    {
    }

    public static transient List asList(long al[])
    {
        if (al.length == 0)
            return Collections.emptyList();
        else
            return new LongArrayAsList(al);
    }

    public static int compare(long l, long l1)
    {
        if (l < l1)
            return -1;
        return l <= l1 ? 0 : 1;
    }

    public static transient long[] concat(long al[][])
    {
        int i = 0;
        int j = al.length;
        for (int k = 0; k < j; k++)
            i += al[k].length;

        long al1[] = new long[i];
        int l = 0;
        int i1 = al.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            long al2[] = al[j1];
            System.arraycopy(al2, 0, al1, l, al2.length);
            l += al2.length;
        }

        return al1;
    }

    public static boolean contains(long al[], long l)
    {
        int i = al.length;
        for (int j = 0; j < i; j++)
            if (al[j] == l)
                return true;

        return false;
    }

    private static long[] copyOf(long al[], int i)
    {
        long al1[] = new long[i];
        System.arraycopy(al, 0, al1, 0, Math.min(al.length, i));
        return al1;
    }

    public static long[] ensureCapacity(long al[], int i, int j)
    {
        boolean flag;
        if (i >= 0)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        Preconditions.checkArgument(flag, "Invalid minLength: %s", aobj);
        boolean flag1;
        if (j >= 0)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[1];
        aobj1[0] = Integer.valueOf(j);
        Preconditions.checkArgument(flag1, "Invalid padding: %s", aobj1);
        if (al.length < i)
            al = copyOf(al, i + j);
        return al;
    }

    public static long fromByteArray(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length >= 8)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(abyte0.length);
        aobj[1] = Integer.valueOf(8);
        Preconditions.checkArgument(flag, "array too small: %s < %s", aobj);
        return fromBytes(abyte0[0], abyte0[1], abyte0[2], abyte0[3], abyte0[4], abyte0[5], abyte0[6], abyte0[7]);
    }

    public static long fromBytes(byte byte0, byte byte1, byte byte2, byte byte3, byte byte4, byte byte5, byte byte6, byte byte7)
    {
        return (255L & (long)byte0) << 56 | (255L & (long)byte1) << 48 | (255L & (long)byte2) << 40 | (255L & (long)byte3) << 32 | (255L & (long)byte4) << 24 | (255L & (long)byte5) << 16 | (255L & (long)byte6) << 8 | 255L & (long)byte7;
    }

    public static int hashCode(long l)
    {
        return (int)(l ^ l >>> 32);
    }

    public static int indexOf(long al[], long l)
    {
        return indexOf(al, l, 0, al.length);
    }

    private static int indexOf(long al[], long l, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (al[k] == l)
                return k;

        return -1;
    }

    public static int indexOf(long al[], long al1[])
    {
        Preconditions.checkNotNull(al, "array");
        Preconditions.checkNotNull(al1, "target");
        if (al1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (al.length - al1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= al1.length)
                break;
            if (al[i + j] != al1[j])
            {
                i++;
                continue; /* Loop/switch isn't completed */
            }
            j++;
        } while (true);
_L3:
        return i;
_L5:
        return -1;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public static transient String join(String s, long al[])
    {
        Preconditions.checkNotNull(s);
        if (al.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(10 * al.length);
        stringbuilder.append(al[0]);
        for (int i = 1; i < al.length; i++)
            stringbuilder.append(s).append(al[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(long al[], long l)
    {
        return lastIndexOf(al, l, 0, al.length);
    }

    private static int lastIndexOf(long al[], long l, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (al[k] == l)
                return k;

        return -1;
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
        long l = al[0];
        for (int i = 1; i < al.length; i++)
            if (al[i] > l)
                l = al[i];

        return l;
    }

    public static transient long min(long al[])
    {
        boolean flag;
        if (al.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        long l = al[0];
        for (int i = 1; i < al.length; i++)
            if (al[i] < l)
                l = al[i];

        return l;
    }

    public static long[] toArray(Collection collection)
    {
        long al[];
        if (collection instanceof LongArrayAsList)
        {
            al = ((LongArrayAsList)collection).toLongArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            al = new long[i];
            for (int j = 0; j < i; j++)
                al[j] = ((Long)Preconditions.checkNotNull(aobj[j])).longValue();

        }
        return al;
    }

    public static byte[] toByteArray(long l)
    {
        byte abyte0[] = new byte[8];
        abyte0[0] = (byte)(int)(l >> 56);
        abyte0[1] = (byte)(int)(l >> 48);
        abyte0[2] = (byte)(int)(l >> 40);
        abyte0[3] = (byte)(int)(l >> 32);
        abyte0[4] = (byte)(int)(l >> 24);
        abyte0[5] = (byte)(int)(l >> 16);
        abyte0[6] = (byte)(int)(l >> 8);
        abyte0[7] = (byte)(int)l;
        return abyte0;
    }


}
