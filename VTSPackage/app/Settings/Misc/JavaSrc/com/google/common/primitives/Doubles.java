// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Doubles
{
    private static class DoubleArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final double array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Double) && Doubles.indexOf(array, ((Double)obj).doubleValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof DoubleArrayAsList))
                        break label0;
                    DoubleArrayAsList doublearrayaslist = (DoubleArrayAsList)obj;
                    int i = size();
                    if (doublearrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != doublearrayaslist.array[j + doublearrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Double get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Double.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Doubles.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Double)
            {
                int i = Doubles.indexOf(array, ((Double)obj).doubleValue(), start, end);
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
            if (obj instanceof Double)
            {
                int i = Doubles.lastIndexOf(array, ((Double)obj).doubleValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Double set(int i, Double double1)
        {
            Preconditions.checkElementIndex(i, size());
            double d = array[i + start];
            array[i + start] = ((Double)Preconditions.checkNotNull(double1)).doubleValue();
            return Double.valueOf(d);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Double)obj);
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
                return new DoubleArrayAsList(array, i + start, j + start);
        }

        double[] toDoubleArray()
        {
            int i = size();
            double ad[] = new double[i];
            System.arraycopy(array, start, ad, 0, i);
            return ad;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(12 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        DoubleArrayAsList(double ad[])
        {
            this(ad, 0, ad.length);
        }

        DoubleArrayAsList(double ad[], int i, int j)
        {
            array = ad;
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
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Doubles$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((double[])obj, (double[])obj1);
        }

        public int compare(double ad[], double ad1[])
        {
            int i = Math.min(ad.length, ad1.length);
            for (int j = 0; j < i; j++)
            {
                int k = Doubles.compare(ad[j], ad1[j]);
                if (k != 0)
                    return k;
            }

            return ad.length - ad1.length;
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


    public static final int BYTES = 8;

    private Doubles()
    {
    }

    public static transient List asList(double ad[])
    {
        if (ad.length == 0)
            return Collections.emptyList();
        else
            return new DoubleArrayAsList(ad);
    }

    public static int compare(double d, double d1)
    {
        return Double.compare(d, d1);
    }

    public static transient double[] concat(double ad[][])
    {
        int i = 0;
        int j = ad.length;
        for (int k = 0; k < j; k++)
            i += ad[k].length;

        double ad1[] = new double[i];
        int l = 0;
        int i1 = ad.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            double ad2[] = ad[j1];
            System.arraycopy(ad2, 0, ad1, l, ad2.length);
            l += ad2.length;
        }

        return ad1;
    }

    public static boolean contains(double ad[], double d)
    {
        int i = ad.length;
        for (int j = 0; j < i; j++)
            if (ad[j] == d)
                return true;

        return false;
    }

    private static double[] copyOf(double ad[], int i)
    {
        double ad1[] = new double[i];
        System.arraycopy(ad, 0, ad1, 0, Math.min(ad.length, i));
        return ad1;
    }

    public static double[] ensureCapacity(double ad[], int i, int j)
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
        if (ad.length < i)
            ad = copyOf(ad, i + j);
        return ad;
    }

    public static int hashCode(double d)
    {
        return Double.valueOf(d).hashCode();
    }

    public static int indexOf(double ad[], double d)
    {
        return indexOf(ad, d, 0, ad.length);
    }

    private static int indexOf(double ad[], double d, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (ad[k] == d)
                return k;

        return -1;
    }

    public static int indexOf(double ad[], double ad1[])
    {
        Preconditions.checkNotNull(ad, "array");
        Preconditions.checkNotNull(ad1, "target");
        if (ad1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (ad.length - ad1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= ad1.length)
                break;
            if (ad[i + j] != ad1[j])
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

    public static boolean isFinite(double d)
    {
        boolean flag = true;
        boolean flag1;
        if ((-1.0D / 0.0D) < d)
            flag1 = flag;
        else
            flag1 = false;
        if (d >= (1.0D / 0.0D))
            flag = false;
        return flag & flag1;
    }

    public static transient String join(String s, double ad[])
    {
        Preconditions.checkNotNull(s);
        if (ad.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(12 * ad.length);
        stringbuilder.append(ad[0]);
        for (int i = 1; i < ad.length; i++)
            stringbuilder.append(s).append(ad[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(double ad[], double d)
    {
        return lastIndexOf(ad, d, 0, ad.length);
    }

    private static int lastIndexOf(double ad[], double d, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (ad[k] == d)
                return k;

        return -1;
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient double max(double ad[])
    {
        boolean flag;
        if (ad.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        double d = ad[0];
        for (int i = 1; i < ad.length; i++)
            d = Math.max(d, ad[i]);

        return d;
    }

    public static transient double min(double ad[])
    {
        boolean flag;
        if (ad.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        double d = ad[0];
        for (int i = 1; i < ad.length; i++)
            d = Math.min(d, ad[i]);

        return d;
    }

    public static double[] toArray(Collection collection)
    {
        double ad[];
        if (collection instanceof DoubleArrayAsList)
        {
            ad = ((DoubleArrayAsList)collection).toDoubleArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            ad = new double[i];
            for (int j = 0; j < i; j++)
                ad[j] = ((Double)Preconditions.checkNotNull(aobj[j])).doubleValue();

        }
        return ad;
    }


}
