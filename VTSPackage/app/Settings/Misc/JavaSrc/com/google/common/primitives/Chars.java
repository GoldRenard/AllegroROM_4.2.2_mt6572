// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Chars
{
    private static class CharArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final char array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Character) && Chars.indexOf(array, ((Character)obj).charValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof CharArrayAsList))
                        break label0;
                    CharArrayAsList chararrayaslist = (CharArrayAsList)obj;
                    int i = size();
                    if (chararrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != chararrayaslist.array[j + chararrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Character get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Character.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Chars.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Character)
            {
                int i = Chars.indexOf(array, ((Character)obj).charValue(), start, end);
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
            if (obj instanceof Character)
            {
                int i = Chars.lastIndexOf(array, ((Character)obj).charValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Character set(int i, Character character)
        {
            Preconditions.checkElementIndex(i, size());
            char c = array[i + start];
            array[i + start] = ((Character)Preconditions.checkNotNull(character)).charValue();
            return Character.valueOf(c);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Character)obj);
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
                return new CharArrayAsList(array, i + start, j + start);
        }

        char[] toCharArray()
        {
            int i = size();
            char ac[] = new char[i];
            System.arraycopy(array, start, ac, 0, i);
            return ac;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(3 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        CharArrayAsList(char ac[])
        {
            this(ac, 0, ac.length);
        }

        CharArrayAsList(char ac[], int i, int j)
        {
            array = ac;
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
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Chars$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((char[])obj, (char[])obj1);
        }

        public int compare(char ac[], char ac1[])
        {
            int i = Math.min(ac.length, ac1.length);
            for (int j = 0; j < i; j++)
            {
                int k = Chars.compare(ac[j], ac1[j]);
                if (k != 0)
                    return k;
            }

            return ac.length - ac1.length;
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


    public static final int BYTES = 2;

    private Chars()
    {
    }

    public static transient List asList(char ac[])
    {
        if (ac.length == 0)
            return Collections.emptyList();
        else
            return new CharArrayAsList(ac);
    }

    public static char checkedCast(long l)
    {
        char c = (char)(int)l;
        boolean flag;
        if ((long)c == l)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[1];
        aobj[0] = Long.valueOf(l);
        Preconditions.checkArgument(flag, "Out of range: %s", aobj);
        return c;
    }

    public static int compare(char c, char c1)
    {
        return c - c1;
    }

    public static transient char[] concat(char ac[][])
    {
        int i = 0;
        int j = ac.length;
        for (int k = 0; k < j; k++)
            i += ac[k].length;

        char ac1[] = new char[i];
        int l = 0;
        int i1 = ac.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            char ac2[] = ac[j1];
            System.arraycopy(ac2, 0, ac1, l, ac2.length);
            l += ac2.length;
        }

        return ac1;
    }

    public static boolean contains(char ac[], char c)
    {
        int i = ac.length;
        for (int j = 0; j < i; j++)
            if (ac[j] == c)
                return true;

        return false;
    }

    private static char[] copyOf(char ac[], int i)
    {
        char ac1[] = new char[i];
        System.arraycopy(ac, 0, ac1, 0, Math.min(ac.length, i));
        return ac1;
    }

    public static char[] ensureCapacity(char ac[], int i, int j)
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
        if (ac.length < i)
            ac = copyOf(ac, i + j);
        return ac;
    }

    public static char fromByteArray(byte abyte0[])
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

    public static char fromBytes(byte byte0, byte byte1)
    {
        return (char)(byte0 << 8 | byte1 & 0xff);
    }

    public static int hashCode(char c)
    {
        return c;
    }

    public static int indexOf(char ac[], char c)
    {
        return indexOf(ac, c, 0, ac.length);
    }

    private static int indexOf(char ac[], char c, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (ac[k] == c)
                return k;

        return -1;
    }

    public static int indexOf(char ac[], char ac1[])
    {
        Preconditions.checkNotNull(ac, "array");
        Preconditions.checkNotNull(ac1, "target");
        if (ac1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (ac.length - ac1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= ac1.length)
                break;
            if (ac[i + j] != ac1[j])
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

    public static transient String join(String s, char ac[])
    {
        Preconditions.checkNotNull(s);
        int i = ac.length;
        if (i == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(i + s.length() * (i - 1));
        stringbuilder.append(ac[0]);
        for (int j = 1; j < i; j++)
            stringbuilder.append(s).append(ac[j]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(char ac[], char c)
    {
        return lastIndexOf(ac, c, 0, ac.length);
    }

    private static int lastIndexOf(char ac[], char c, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (ac[k] == c)
                return k;

        return -1;
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient char max(char ac[])
    {
        boolean flag;
        if (ac.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        char c = ac[0];
        for (int i = 1; i < ac.length; i++)
            if (ac[i] > c)
                c = ac[i];

        return c;
    }

    public static transient char min(char ac[])
    {
        boolean flag;
        if (ac.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        char c = ac[0];
        for (int i = 1; i < ac.length; i++)
            if (ac[i] < c)
                c = ac[i];

        return c;
    }

    public static char saturatedCast(long l)
    {
        if (l > 65535L)
            return '\uFFFF';
        if (l < 0L)
            return '\0';
        else
            return (char)(int)l;
    }

    public static char[] toArray(Collection collection)
    {
        char ac[];
        if (collection instanceof CharArrayAsList)
        {
            ac = ((CharArrayAsList)collection).toCharArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            ac = new char[i];
            for (int j = 0; j < i; j++)
                ac[j] = ((Character)Preconditions.checkNotNull(aobj[j])).charValue();

        }
        return ac;
    }

    public static byte[] toByteArray(char c)
    {
        byte abyte0[] = new byte[2];
        abyte0[0] = (byte)(c >> 8);
        abyte0[1] = (byte)c;
        return abyte0;
    }


}
