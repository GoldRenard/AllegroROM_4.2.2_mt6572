// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.base;


public final class Preconditions
{

    private Preconditions()
    {
    }

    private static String badElementIndex(int i, int j, String s)
    {
        if (i < 0)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = s;
            aobj1[1] = Integer.valueOf(i);
            return format("%s (%s) must not be negative", aobj1);
        }
        if (j < 0)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("negative size: ").append(j).toString());
        } else
        {
            Object aobj[] = new Object[3];
            aobj[0] = s;
            aobj[1] = Integer.valueOf(i);
            aobj[2] = Integer.valueOf(j);
            return format("%s (%s) must be less than size (%s)", aobj);
        }
    }

    private static String badPositionIndex(int i, int j, String s)
    {
        if (i < 0)
        {
            Object aobj1[] = new Object[2];
            aobj1[0] = s;
            aobj1[1] = Integer.valueOf(i);
            return format("%s (%s) must not be negative", aobj1);
        }
        if (j < 0)
        {
            throw new IllegalArgumentException((new StringBuilder()).append("negative size: ").append(j).toString());
        } else
        {
            Object aobj[] = new Object[3];
            aobj[0] = s;
            aobj[1] = Integer.valueOf(i);
            aobj[2] = Integer.valueOf(j);
            return format("%s (%s) must not be greater than size (%s)", aobj);
        }
    }

    private static String badPositionIndexes(int i, int j, int k)
    {
        if (i >= 0 && i <= k)
        {
            if (j >= 0 && j <= k)
            {
                Object aobj[] = new Object[2];
                aobj[0] = Integer.valueOf(j);
                aobj[1] = Integer.valueOf(i);
                return format("end index (%s) must not be less than start index (%s)", aobj);
            } else
            {
                return badPositionIndex(j, k, "end index");
            }
        } else
        {
            return badPositionIndex(i, k, "start index");
        }
    }

    public static void checkArgument(boolean flag)
    {
        if (!flag)
            throw new IllegalArgumentException();
        else
            return;
    }

    public static void checkArgument(boolean flag, Object obj)
    {
        if (!flag)
            throw new IllegalArgumentException(String.valueOf(obj));
        else
            return;
    }

    public static transient void checkArgument(boolean flag, String s, Object aobj[])
    {
        if (!flag)
            throw new IllegalArgumentException(format(s, aobj));
        else
            return;
    }

    public static int checkElementIndex(int i, int j)
    {
        return checkElementIndex(i, j, "index");
    }

    public static int checkElementIndex(int i, int j, String s)
    {
        if (i >= 0 && i < j)
            return i;
        else
            throw new IndexOutOfBoundsException(badElementIndex(i, j, s));
    }

    public static Object checkNotNull(Object obj)
    {
        if (obj == null)
            throw new NullPointerException();
        else
            return obj;
    }

    public static Object checkNotNull(Object obj, Object obj1)
    {
        if (obj == null)
            throw new NullPointerException(String.valueOf(obj1));
        else
            return obj;
    }

    public static transient Object checkNotNull(Object obj, String s, Object aobj[])
    {
        if (obj == null)
            throw new NullPointerException(format(s, aobj));
        else
            return obj;
    }

    public static int checkPositionIndex(int i, int j)
    {
        return checkPositionIndex(i, j, "index");
    }

    public static int checkPositionIndex(int i, int j, String s)
    {
        if (i >= 0 && i <= j)
            return i;
        else
            throw new IndexOutOfBoundsException(badPositionIndex(i, j, s));
    }

    public static void checkPositionIndexes(int i, int j, int k)
    {
        if (i >= 0 && j >= i && j <= k)
            return;
        else
            throw new IndexOutOfBoundsException(badPositionIndexes(i, j, k));
    }

    public static void checkState(boolean flag)
    {
        if (!flag)
            throw new IllegalStateException();
        else
            return;
    }

    public static void checkState(boolean flag, Object obj)
    {
        if (!flag)
            throw new IllegalStateException(String.valueOf(obj));
        else
            return;
    }

    public static transient void checkState(boolean flag, String s, Object aobj[])
    {
        if (!flag)
            throw new IllegalStateException(format(s, aobj));
        else
            return;
    }

    static transient String format(String s, Object aobj[])
    {
        String s1 = String.valueOf(s);
        StringBuilder stringbuilder = new StringBuilder(s1.length() + 16 * aobj.length);
        int i = 0;
        int j = 0;
        do
        {
            if (j >= aobj.length)
                break;
            int j1 = s1.indexOf("%s", i);
            if (j1 == -1)
                break;
            stringbuilder.append(s1.substring(i, j1));
            int k1 = j + 1;
            stringbuilder.append(aobj[j]);
            i = j1 + 2;
            j = k1;
        } while (true);
        stringbuilder.append(s1.substring(i));
        if (j < aobj.length)
        {
            stringbuilder.append(" [");
            int k = j + 1;
            stringbuilder.append(aobj[j]);
            int i1;
            for (int l = k; l < aobj.length; l = i1)
            {
                stringbuilder.append(", ");
                i1 = l + 1;
                stringbuilder.append(aobj[l]);
            }

            stringbuilder.append(']');
        }
        return stringbuilder.toString();
    }
}
