// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

// Referenced classes of package com.google.common.primitives:
//            AndroidInteger

public final class Ints
{
    private static class IntArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final int array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Integer) && Ints.indexOf(array, ((Integer)obj).intValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof IntArrayAsList))
                        break label0;
                    IntArrayAsList intarrayaslist = (IntArrayAsList)obj;
                    int i = size();
                    if (intarrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != intarrayaslist.array[j + intarrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Integer get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Integer.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Ints.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Integer)
            {
                int i = Ints.indexOf(array, ((Integer)obj).intValue(), start, end);
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
            if (obj instanceof Integer)
            {
                int i = Ints.lastIndexOf(array, ((Integer)obj).intValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Integer set(int i, Integer integer)
        {
            Preconditions.checkElementIndex(i, size());
            int j = array[i + start];
            array[i + start] = ((Integer)Preconditions.checkNotNull(integer)).intValue();
            return Integer.valueOf(j);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Integer)obj);
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
                return new IntArrayAsList(array, i + start, j + start);
        }

        int[] toIntArray()
        {
            int i = size();
            int ai[] = new int[i];
            System.arraycopy(array, start, ai, 0, i);
            return ai;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(5 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        IntArrayAsList(int ai[])
        {
            this(ai, 0, ai.length);
        }

        IntArrayAsList(int ai[], int i, int j)
        {
            array = ai;
            start = i;
            end = j;
        }
    }

    private static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Ints$LexicographicalComparator, s);
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
            {
                int k = Ints.compare(ai[j], ai1[j]);
                if (k != 0)
                    return k;
            }

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


    public static final int BYTES = 4;
    public static final int MAX_POWER_OF_TWO = 0x40000000;

    private Ints()
    {
    }

    public static transient List asList(int ai[])
    {
        if (ai.length == 0)
            return Collections.emptyList();
        else
            return new IntArrayAsList(ai);
    }

    public static int checkedCast(long l)
    {
        int i = (int)l;
        boolean flag;
        if ((long)i == l)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "Out of range: %s", aobj);
        return i;
    }

    public static int compare(int i, int j)
    {
        if (i < j)
            return -1;
        return i <= j ? 0 : 1;
    }

    public static transient int[] concat(int ai[][])
    {
        int i = 0;
        int j = ai.length;
        for (int k = 0; k < j; k++)
            i += ai[k].length;

        int ai1[] = new int[i];
        int l = 0;
        int i1 = ai.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            int ai2[] = ai[j1];
            System.arraycopy(ai2, 0, ai1, l, ai2.length);
            l += ai2.length;
        }

        return ai1;
    }

    public static boolean contains(int ai[], int i)
    {
        int j = ai.length;
        for (int k = 0; k < j; k++)
            if (ai[k] == i)
                return true;

        return false;
    }

    private static int[] copyOf(int ai[], int i)
    {
        int ai1[] = new int[i];
        System.arraycopy(ai, 0, ai1, 0, Math.min(ai.length, i));
        return ai1;
    }

    public static int[] ensureCapacity(int ai[], int i, int j)
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
        if (ai.length < i)
            ai = copyOf(ai, i + j);
        return ai;
    }

    public static int fromByteArray(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length >= 4)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(abyte0.length);
        aobj[1] = Integer.valueOf(4);
        Preconditions.checkArgument(flag, "array too small: %s < %s", aobj);
        return fromBytes(abyte0[0], abyte0[1], abyte0[2], abyte0[3]);
    }

    public static int fromBytes(byte byte0, byte byte1, byte byte2, byte byte3)
    {
        return byte0 << 24 | (byte1 & 0xff) << 16 | (byte2 & 0xff) << 8 | byte3 & 0xff;
    }

    public static int hashCode(int i)
    {
        return i;
    }

    public static int indexOf(int ai[], int i)
    {
        return indexOf(ai, i, 0, ai.length);
    }

    private static int indexOf(int ai[], int i, int j, int k)
    {
        for (int l = j; l < k; l++)
            if (ai[l] == i)
                return l;

        return -1;
    }

    public static int indexOf(int ai[], int ai1[])
    {
        Preconditions.checkNotNull(ai, "array");
        Preconditions.checkNotNull(ai1, "target");
        if (ai1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (ai.length - ai1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= ai1.length)
                break;
            if (ai[i + j] != ai1[j])
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

    public static transient String join(String s, int ai[])
    {
        Preconditions.checkNotNull(s);
        if (ai.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(5 * ai.length);
        stringbuilder.append(ai[0]);
        for (int i = 1; i < ai.length; i++)
            stringbuilder.append(s).append(ai[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(int ai[], int i)
    {
        return lastIndexOf(ai, i, 0, ai.length);
    }

    private static int lastIndexOf(int ai[], int i, int j, int k)
    {
        for (int l = k - 1; l >= j; l--)
            if (ai[l] == i)
                return l;

        return -1;
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
        int i = ai[0];
        for (int j = 1; j < ai.length; j++)
            if (ai[j] > i)
                i = ai[j];

        return i;
    }

    public static transient int min(int ai[])
    {
        boolean flag;
        if (ai.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        int i = ai[0];
        for (int j = 1; j < ai.length; j++)
            if (ai[j] < i)
                i = ai[j];

        return i;
    }

    public static int saturatedCast(long l)
    {
        if (l > 0x7fffffffL)
            return 0x7fffffff;
        if (l < 0xffffffff80000000L)
            return 0x80000000;
        else
            return (int)l;
    }

    public static int[] toArray(Collection collection)
    {
        int ai[];
        if (collection instanceof IntArrayAsList)
        {
            ai = ((IntArrayAsList)collection).toIntArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            ai = new int[i];
            for (int j = 0; j < i; j++)
                ai[j] = ((Integer)Preconditions.checkNotNull(aobj[j])).intValue();

        }
        return ai;
    }

    public static byte[] toByteArray(int i)
    {
        byte abyte0[] = new byte[4];
        abyte0[0] = (byte)(i >> 24);
        abyte0[1] = (byte)(i >> 16);
        abyte0[2] = (byte)(i >> 8);
        abyte0[3] = (byte)i;
        return abyte0;
    }

    public static Integer tryParse(String s)
    {
        return AndroidInteger.tryParse(s, 10);
    }


}
