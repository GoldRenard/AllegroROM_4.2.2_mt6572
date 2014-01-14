// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Shorts
{
    private static final class LexicographicalComparator extends Enum
        implements Comparator
    {

        private static final LexicographicalComparator $VALUES[];
        public static final LexicographicalComparator INSTANCE;

        public static LexicographicalComparator valueOf(String s)
        {
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Shorts$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((short[])obj, (short[])obj1);
        }

        public int compare(short aword0[], short aword1[])
        {
            int i = Math.min(aword0.length, aword1.length);
            for (int j = 0; j < i; j++)
            {
                int k = Shorts.compare(aword0[j], aword1[j]);
                if (k != 0)
                    return k;
            }

            return aword0.length - aword1.length;
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

    private static class ShortArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final short array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Short) && Shorts.indexOf(array, ((Short)obj).shortValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof ShortArrayAsList))
                        break label0;
                    ShortArrayAsList shortarrayaslist = (ShortArrayAsList)obj;
                    int i = size();
                    if (shortarrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != shortarrayaslist.array[j + shortarrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public Short get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Short.valueOf(array[i + start]);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Shorts.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Short)
            {
                int i = Shorts.indexOf(array, ((Short)obj).shortValue(), start, end);
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
            if (obj instanceof Short)
            {
                int i = Shorts.lastIndexOf(array, ((Short)obj).shortValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Short)obj);
        }

        public Short set(int i, Short short1)
        {
            Preconditions.checkElementIndex(i, size());
            short word0 = array[i + start];
            array[i + start] = ((Short)Preconditions.checkNotNull(short1)).shortValue();
            return Short.valueOf(word0);
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
                return new ShortArrayAsList(array, i + start, j + start);
        }

        short[] toShortArray()
        {
            int i = size();
            short aword0[] = new short[i];
            System.arraycopy(array, start, aword0, 0, i);
            return aword0;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(6 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        ShortArrayAsList(short aword0[])
        {
            this(aword0, 0, aword0.length);
        }

        ShortArrayAsList(short aword0[], int i, int j)
        {
            array = aword0;
            start = i;
            end = j;
        }
    }


    public static final int BYTES = 2;
    public static final short MAX_POWER_OF_TWO = 16384;

    private Shorts()
    {
    }

    public static transient List asList(short aword0[])
    {
        if (aword0.length == 0)
            return Collections.emptyList();
        else
            return new ShortArrayAsList(aword0);
    }

    public static short checkedCast(long l)
    {
        short word0 = (short)(int)l;
        boolean flag;
        if ((long)word0 == l)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "Out of range: %s", aobj);
        return word0;
    }

    public static int compare(short word0, short word1)
    {
        return word0 - word1;
    }

    public static transient short[] concat(short aword0[][])
    {
        int i = 0;
        int j = aword0.length;
        for (int k = 0; k < j; k++)
            i += aword0[k].length;

        short aword1[] = new short[i];
        int l = 0;
        int i1 = aword0.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            short aword2[] = aword0[j1];
            System.arraycopy(aword2, 0, aword1, l, aword2.length);
            l += aword2.length;
        }

        return aword1;
    }

    public static boolean contains(short aword0[], short word0)
    {
        int i = aword0.length;
        for (int j = 0; j < i; j++)
            if (aword0[j] == word0)
                return true;

        return false;
    }

    private static short[] copyOf(short aword0[], int i)
    {
        short aword1[] = new short[i];
        System.arraycopy(aword0, 0, aword1, 0, Math.min(aword0.length, i));
        return aword1;
    }

    public static short[] ensureCapacity(short aword0[], int i, int j)
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
        if (aword0.length < i)
            aword0 = copyOf(aword0, i + j);
        return aword0;
    }

    public static short fromByteArray(byte abyte0[])
    {
        boolean flag;
        if (abyte0.length >= 2)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(abyte0.length);
        aobj[1] = Integer.valueOf(2);
        Preconditions.checkArgument(flag, "array too small: %s < %s", aobj);
        return fromBytes(abyte0[0], abyte0[1]);
    }

    public static short fromBytes(byte byte0, byte byte1)
    {
        return (short)(byte0 << 8 | byte1 & 0xff);
    }

    public static int hashCode(short word0)
    {
        return word0;
    }

    public static int indexOf(short aword0[], short word0)
    {
        return indexOf(aword0, word0, 0, aword0.length);
    }

    private static int indexOf(short aword0[], short word0, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (aword0[k] == word0)
                return k;

        return -1;
    }

    public static int indexOf(short aword0[], short aword1[])
    {
        Preconditions.checkNotNull(aword0, "array");
        Preconditions.checkNotNull(aword1, "target");
        if (aword1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (aword0.length - aword1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= aword1.length)
                break;
            if (aword0[i + j] != aword1[j])
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

    public static transient String join(String s, short aword0[])
    {
        Preconditions.checkNotNull(s);
        if (aword0.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(6 * aword0.length);
        stringbuilder.append(aword0[0]);
        for (int i = 1; i < aword0.length; i++)
            stringbuilder.append(s).append(aword0[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(short aword0[], short word0)
    {
        return lastIndexOf(aword0, word0, 0, aword0.length);
    }

    private static int lastIndexOf(short aword0[], short word0, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (aword0[k] == word0)
                return k;

        return -1;
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient short max(short aword0[])
    {
        boolean flag;
        if (aword0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        short word0 = aword0[0];
        for (int i = 1; i < aword0.length; i++)
            if (aword0[i] > word0)
                word0 = aword0[i];

        return word0;
    }

    public static transient short min(short aword0[])
    {
        boolean flag;
        if (aword0.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        short word0 = aword0[0];
        for (int i = 1; i < aword0.length; i++)
            if (aword0[i] < word0)
                word0 = aword0[i];

        return word0;
    }

    public static short saturatedCast(long l)
    {
        if (l > 32767L)
            return 32767;
        if (l < -32768L)
            return -32768;
        else
            return (short)(int)l;
    }

    public static short[] toArray(Collection collection)
    {
        short aword0[];
        if (collection instanceof ShortArrayAsList)
        {
            aword0 = ((ShortArrayAsList)collection).toShortArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            aword0 = new short[i];
            for (int j = 0; j < i; j++)
                aword0[j] = ((Short)Preconditions.checkNotNull(aobj[j])).shortValue();

        }
        return aword0;
    }

    public static byte[] toByteArray(short word0)
    {
        byte abyte0[] = new byte[2];
        abyte0[0] = (byte)(word0 >> 8);
        abyte0[1] = (byte)word0;
        return abyte0;
    }


}
