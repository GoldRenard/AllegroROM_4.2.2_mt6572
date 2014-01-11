// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.*;

public final class Floats
{
    private static class FloatArrayAsList extends AbstractList
        implements RandomAccess, Serializable
    {

        private static final long serialVersionUID;
        final float array[];
        final int end;
        final int start;

        public boolean contains(Object obj)
        {
            return (obj instanceof Float) && Floats.indexOf(array, ((Float)obj).floatValue(), start, end) != -1;
        }

        public boolean equals(Object obj)
        {
label0:
            {
                if (obj != this)
                {
                    if (!(obj instanceof FloatArrayAsList))
                        break label0;
                    FloatArrayAsList floatarrayaslist = (FloatArrayAsList)obj;
                    int i = size();
                    if (floatarrayaslist.size() != i)
                        return false;
                    for (int j = 0; j < i; j++)
                        if (array[j + start] != floatarrayaslist.array[j + floatarrayaslist.start])
                            return false;

                }
                return true;
            }
            return super.equals(obj);
        }

        public Float get(int i)
        {
            Preconditions.checkElementIndex(i, size());
            return Float.valueOf(array[i + start]);
        }

        public volatile Object get(int i)
        {
            return get(i);
        }

        public int hashCode()
        {
            int i = 1;
            for (int j = start; j < end; j++)
                i = i * 31 + Floats.hashCode(array[j]);

            return i;
        }

        public int indexOf(Object obj)
        {
            if (obj instanceof Float)
            {
                int i = Floats.indexOf(array, ((Float)obj).floatValue(), start, end);
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
            if (obj instanceof Float)
            {
                int i = Floats.lastIndexOf(array, ((Float)obj).floatValue(), start, end);
                if (i >= 0)
                    return i - start;
            }
            return -1;
        }

        public Float set(int i, Float float1)
        {
            Preconditions.checkElementIndex(i, size());
            float f = array[i + start];
            array[i + start] = ((Float)Preconditions.checkNotNull(float1)).floatValue();
            return Float.valueOf(f);
        }

        public volatile Object set(int i, Object obj)
        {
            return set(i, (Float)obj);
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
                return new FloatArrayAsList(array, i + start, j + start);
        }

        float[] toFloatArray()
        {
            int i = size();
            float af[] = new float[i];
            System.arraycopy(array, start, af, 0, i);
            return af;
        }

        public String toString()
        {
            StringBuilder stringbuilder = new StringBuilder(12 * size());
            stringbuilder.append('[').append(array[start]);
            for (int i = 1 + start; i < end; i++)
                stringbuilder.append(", ").append(array[i]);

            return stringbuilder.append(']').toString();
        }

        FloatArrayAsList(float af[])
        {
            this(af, 0, af.length);
        }

        FloatArrayAsList(float af[], int i, int j)
        {
            array = af;
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
            return (LexicographicalComparator)Enum.valueOf(com/google/common/primitives/Floats$LexicographicalComparator, s);
        }

        public static LexicographicalComparator[] values()
        {
            return (LexicographicalComparator[])$VALUES.clone();
        }

        public volatile int compare(Object obj, Object obj1)
        {
            return compare((float[])obj, (float[])obj1);
        }

        public int compare(float af[], float af1[])
        {
            int i = Math.min(af.length, af1.length);
            for (int j = 0; j < i; j++)
            {
                int k = Floats.compare(af[j], af1[j]);
                if (k != 0)
                    return k;
            }

            return af.length - af1.length;
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

    private Floats()
    {
    }

    public static transient List asList(float af[])
    {
        if (af.length == 0)
            return Collections.emptyList();
        else
            return new FloatArrayAsList(af);
    }

    public static int compare(float f, float f1)
    {
        return Float.compare(f, f1);
    }

    public static transient float[] concat(float af[][])
    {
        int i = 0;
        int j = af.length;
        for (int k = 0; k < j; k++)
            i += af[k].length;

        float af1[] = new float[i];
        int l = 0;
        int i1 = af.length;
        for (int j1 = 0; j1 < i1; j1++)
        {
            float af2[] = af[j1];
            System.arraycopy(af2, 0, af1, l, af2.length);
            l += af2.length;
        }

        return af1;
    }

    public static boolean contains(float af[], float f)
    {
        int i = af.length;
        for (int j = 0; j < i; j++)
            if (af[j] == f)
                return true;

        return false;
    }

    private static float[] copyOf(float af[], int i)
    {
        float af1[] = new float[i];
        System.arraycopy(af, 0, af1, 0, Math.min(af.length, i));
        return af1;
    }

    public static float[] ensureCapacity(float af[], int i, int j)
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
        if (af.length < i)
            af = copyOf(af, i + j);
        return af;
    }

    public static int hashCode(float f)
    {
        return Float.valueOf(f).hashCode();
    }

    public static int indexOf(float af[], float f)
    {
        return indexOf(af, f, 0, af.length);
    }

    private static int indexOf(float af[], float f, int i, int j)
    {
        for (int k = i; k < j; k++)
            if (af[k] == f)
                return k;

        return -1;
    }

    public static int indexOf(float af[], float af1[])
    {
        Preconditions.checkNotNull(af, "array");
        Preconditions.checkNotNull(af1, "target");
        if (af1.length != 0) goto _L2; else goto _L1
_L1:
        int i = 0;
          goto _L3
_L2:
        i = 0;
_L7:
        if (i >= 1 + (af.length - af1.length)) goto _L5; else goto _L4
_L4:
        int j = 0;
        do
        {
            if (j >= af1.length)
                break;
            if (af[i + j] != af1[j])
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

    public static boolean isFinite(float f)
    {
        boolean flag = true;
        boolean flag1;
        if ((-1.0F / 0.0F) < f)
            flag1 = flag;
        else
            flag1 = false;
        if (f >= (1.0F / 0.0F))
            flag = false;
        return flag & flag1;
    }

    public static transient String join(String s, float af[])
    {
        Preconditions.checkNotNull(s);
        if (af.length == 0)
            return "";
        StringBuilder stringbuilder = new StringBuilder(12 * af.length);
        stringbuilder.append(af[0]);
        for (int i = 1; i < af.length; i++)
            stringbuilder.append(s).append(af[i]);

        return stringbuilder.toString();
    }

    public static int lastIndexOf(float af[], float f)
    {
        return lastIndexOf(af, f, 0, af.length);
    }

    private static int lastIndexOf(float af[], float f, int i, int j)
    {
        for (int k = j - 1; k >= i; k--)
            if (af[k] == f)
                return k;

        return -1;
    }

    public static Comparator lexicographicalComparator()
    {
        return LexicographicalComparator.INSTANCE;
    }

    public static transient float max(float af[])
    {
        boolean flag;
        if (af.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        float f = af[0];
        for (int i = 1; i < af.length; i++)
            f = Math.max(f, af[i]);

        return f;
    }

    public static transient float min(float af[])
    {
        boolean flag;
        if (af.length > 0)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag);
        float f = af[0];
        for (int i = 1; i < af.length; i++)
            f = Math.min(f, af[i]);

        return f;
    }

    public static float[] toArray(Collection collection)
    {
        float af[];
        if (collection instanceof FloatArrayAsList)
        {
            af = ((FloatArrayAsList)collection).toFloatArray();
        } else
        {
            Object aobj[] = collection.toArray();
            int i = aobj.length;
            af = new float[i];
            for (int j = 0; j < i; j++)
                af[j] = ((Float)Preconditions.checkNotNull(aobj[j])).floatValue();

        }
        return af;
    }


}
