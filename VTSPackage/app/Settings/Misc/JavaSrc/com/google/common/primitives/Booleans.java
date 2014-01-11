// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Booleans
{
    private static class BooleanArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final boolean array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Boolean) && Booleans.indexOf(array, ((Boolean)obj).booleanValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof BooleanArrayAsList))
                        break label0;
                    BooleanArrayAsList booleanarrayaslist = (BooleanArrayAsList)obj;
                    int i = size();
                    if (booleanarrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != booleanarrayaslist.array[j + booleanarrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Boolean get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Boolean.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Booleans.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Boolean)
            {
                int i = Booleans.indexOf(array, ((Boolean)obj).booleanValue(), start, end);
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
            if (obj instanceof Boolean)
            {
                int i = Booleans.lastIndexOf(array, ((Boolean)obj).booleanValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Boolean set(int i, Boolean boolean1)
        {
            Preconditions.checkElementIndex(i, size());
            boolean flag = array[i + start];
            array[i + start] = ((Boolean)Preconditions.checkNotNull(boolean1)).booleanValue();
            return Boolean.valueOf(flag);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Boolean)obj);
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
                return new BooleanArrayAsList(array, i + start, j + start);
        }

        boolean[] toBooleanArray()
        {
            int i = size();
            boolean aflag[] = new boolean[i];
            System.arraycopy(array, start, aflag, 0, i);
            return aflag;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(7 * size());
            String s;
            if (array[start])
                s = "[true";
            else
                s = "[false";
            stringbuilder.append(s);
            for (int i = 1 + start; i < end; i++)
            {
                String s1;
                if (array[i])
                    s1 = ", true";
                else
                    s1 = ", false";
                stringbuilder.append(s1);
            }

            return stringbuilder.append(']').toString();
        }

        BooleanArrayAsList(boolean aflag[])
        {
            this(aflag, 0, aflag.length);
        }

        BooleanArrayAsList(boolean aflag[], int i, int j)
        {
            array = aflag;
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
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Booleans$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((boolean[])obj, (boolean[])obj1);
        }

        public int compare(boolean aflag[], boolean aflag1[])
        {
            int i = Math.min(aflag.length, aflag1.length);
            for (int j = 0; j < i; j++)
            {
                int k = Booleans.compare(aflag[j], aflag1[j]);
                if (k != 0)
                    return k;
            }

            return aflag.length - aflag1.length;
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


    private Booleans()
    {
    }

    public static transient List asList(boolean aflag[])
    {
        if (aflag.length == 0)
            return Collections.emptyList();
        else
            return new BooleanArrayAsList(aflag);
    }

    public static int compare(boolean flag, boolean flag1)
    {
        if (flag == flag1)
            return 0;
        return !flag ? -1 : 1;
    }

    public static transient boolean[] concat(boolean aflag[][])
    {
        int i = 0;
        int j = aflag.length;
        for (int k = 0; k < j; k++)
            i += aflag[k].length;

        boolean aflag1[] = new boolean[i];
        int l = 0;
        int i1 = aflag.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            boolean aflag2[] = aflag[j1];
            System.arraycopy(aflag2, 0, aflag1, l, aflag2.length);
            l += aflag2.length;
        }

        return aflag1;
    }

    public static boolean contains(boolean aflag[], boolean flag)
    {
        int i = aflag.length;
        for (int j = 0; j < i; j++)
            if (aflag[j] == flag)
                return true;

        return false;
    }

    private static boolean[] copyOf(boolean aflag[], int i)
    {
        boolean aflag1[] = new boolean[i];
        System.arraycopy(aflag, 0, aflag1, 0, Math.min(aflag.length, i));
        return aflag1;
    }

    public static boolean[] ensureCapacity(boolean aflag[], int i, int j)
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
        if (aflag.length < i)
            aflag = copyOf(aflag, i + j);
        return aflag;
    }

    public static int hashCode(boolean flag)
    {
        return !flag ? 1237 : 1231;
    }

    public static int indexOf(boolean aflag[], boolean flag)
    {
        return indexOf(aflag, flag, 0, aflag.length);
    }

    private static int indexOf(boolean aflag[], boolean flag, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (aflag[k] == flag)
                return k;

        return -1;
    }

    public static int indexOf(boolean aflag[], boolean aflag1[])
    {
        Preconditions.checkNotNull(aflag, "array");
        Preconditions.checkNotNull(aflag1, "target");
        if (aflag1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (aflag.length - aflag1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= aflag1.length)
                break;
            if (aflag[i + j] != aflag1[j])
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

    public static transient String join(String s, boolean aflag[])
    {
        Preconditions.checkNotNull(s);
        if (aflag.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(7 * aflag.length);
        stringbuilder.append(aflag[0]);
        for (int i = 1; i < aflag.length; i++)
            stringbuilder.append(s).append(aflag[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(boolean aflag[], boolean flag)
    {
        return lastIndexOf(aflag, flag, 0, aflag.length);
    }

    private static int lastIndexOf(boolean aflag[], boolean flag, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (aflag[k] == flag)
                return k;

        return -1;
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static boolean[] toArray(Collection collection)
    {
        boolean aflag[];
        if (collection instanceof BooleanArrayAsList)
        {
            aflag = ((BooleanArrayAsList)collection).toBooleanArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            aflag = new boolean[i];
            for (int j = 0; j < i; j++)
                aflag[j] = ((Boolean)Preconditions.checkNotNull(aobj[j])).booleanValue();

        }
        return aflag;
    }


}
