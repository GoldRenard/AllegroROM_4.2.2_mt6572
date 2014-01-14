// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Bytes
{
    private static class ByteArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final byte array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Byte) && Bytes.indexOf(array, ((Byte)obj).byteValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof ByteArrayAsList))
                        break label0;
                    ByteArrayAsList bytearrayaslist = (ByteArrayAsList)obj;
                    int i = size();
                    if (bytearrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != bytearrayaslist.array[j + bytearrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Byte get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Byte.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Bytes.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Byte)
            {
                int i = Bytes.indexOf(array, ((Byte)obj).byteValue(), start, end);
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
            if (obj instanceof Byte)
            {
                int i = Bytes.lastIndexOf(array, ((Byte)obj).byteValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Byte set(int i, Byte byte1)
        {
            Preconditions.checkElementIndex(i, size());
            byte byte0 = array[i + start];
            array[i + start] = ((Byte)Preconditions.checkNotNull(byte1)).byteValue();
            return Byte.valueOf(byte0);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Byte)obj);
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
                return new ByteArrayAsList(array, i + start, j + start);
        }

        byte[] toByteArray()
        {
            int i = size();
            byte abyte0[] = new byte[i];
            System.arraycopy(array, start, abyte0, 0, i);
            return abyte0;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(5 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        ByteArrayAsList(byte abyte0[])
        {
            this(abyte0, 0, abyte0.length);
        }

        ByteArrayAsList(byte abyte0[], int i, int j)
        {
            array = abyte0;
            start = i;
            end = j;
        }
    }


    private Bytes()
    {
    }

    public static transient List asList(byte abyte0[])
    {
        if (abyte0.length == 0)
            return Collections.emptyList();
        else
            return new ByteArrayAsList(abyte0);
    }

    public static transient byte[] concat(byte abyte0[][])
    {
        int i = 0;
        int j = abyte0.length;
        for (int k = 0; k < j; k++)
            i += abyte0[k].length;

        byte abyte1[] = new byte[i];
        int l = 0;
        int i1 = abyte0.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            byte abyte2[] = abyte0[j1];
            System.arraycopy(abyte2, 0, abyte1, l, abyte2.length);
            l += abyte2.length;
        }

        return abyte1;
    }

    public static boolean contains(byte abyte0[], byte byte0)
    {
        int i = abyte0.length;
        for (int j = 0; j < i; j++)
            if (abyte0[j] == byte0)
                return true;

        return false;
    }

    private static byte[] copyOf(byte abyte0[], int i)
    {
        byte abyte1[] = new byte[i];
        System.arraycopy(abyte0, 0, abyte1, 0, Math.min(abyte0.length, i));
        return abyte1;
    }

    public static byte[] ensureCapacity(byte abyte0[], int i, int j)
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
        if (abyte0.length < i)
            abyte0 = copyOf(abyte0, i + j);
        return abyte0;
    }

    public static int hashCode(byte byte0)
    {
        return byte0;
    }

    public static int indexOf(byte abyte0[], byte byte0)
    {
        return indexOf(abyte0, byte0, 0, abyte0.length);
    }

    private static int indexOf(byte abyte0[], byte byte0, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (abyte0[k] == byte0)
                return k;

        return -1;
    }

    public static int indexOf(byte abyte0[], byte abyte1[])
    {
        Preconditions.checkNotNull(abyte0, "array");
        Preconditions.checkNotNull(abyte1, "target");
        if (abyte1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (abyte0.length - abyte1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= abyte1.length)
                break;
            if (abyte0[i + j] != abyte1[j])
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

    public static int lastIndexOf(byte abyte0[], byte byte0)
    {
        return lastIndexOf(abyte0, byte0, 0, abyte0.length);
    }

    private static int lastIndexOf(byte abyte0[], byte byte0, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (abyte0[k] == byte0)
                return k;

        return -1;
    }

    public static byte[] toArray(Collection collection)
    {
        byte abyte0[];
        if (collection instanceof ByteArrayAsList)
        {
            abyte0 = ((ByteArrayAsList)collection).toByteArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            abyte0 = new byte[i];
            for (int j = 0; j < i; j++)
                abyte0[j] = ((Byte)Preconditions.checkNotNull(aobj[j])).byteValue();

        }
        return abyte0;
    }


}
