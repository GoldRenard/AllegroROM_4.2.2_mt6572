// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.primitives;

import com.google.common.base.Preconditions;

final class AndroidInteger
{

    private AndroidInteger()
    {
    }

    static Integer tryParse(String s)
    {
        return tryParse(s, 10);
    }

    static Integer tryParse(String s, int i)
    {
        Preconditions.checkNotNull(s);
        boolean flag;
        if (i >= 2)
            flag = true;
        else
            flag = false;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(2);
        Preconditions.checkArgument(flag, "Invalid radix %s, min radix is %s", aobj);
        boolean flag1;
        if (i <= 36)
            flag1 = true;
        else
            flag1 = false;
        Object aobj1[] = new Object[2];
        aobj1[0] = Integer.valueOf(i);
        aobj1[1] = Integer.valueOf(36);
        Preconditions.checkArgument(flag1, "Invalid radix %s, max radix is %s", aobj1);
        int j = s.length();
        if (j == 0)
            return null;
        boolean flag2;
        if (s.charAt(0) == '-')
            flag2 = true;
        else
            flag2 = false;
        int k = 0;
        if (flag2)
        {
            k = 0 + 1;
            if (k == j)
                return null;
        }
        return tryParse(s, k, i, flag2);
    }

    private static Integer tryParse(String s, int i, int j, boolean flag)
    {
        int l;
        int j1;
label0:
        {
            int k = 0x80000000 / j;
            l = 0;
            int i1 = s.length();
            j1 = i;
            do
            {
                if (j1 >= i1)
                    break label0;
                int k1 = j1 + 1;
                int l1 = Character.digit(s.charAt(j1), j);
                if (l1 == -1 || k > l)
                    break;
                int i2 = l * j - l1;
                if (i2 > l)
                    break;
                l = i2;
                j1 = k1;
            } while (true);
            return null;
        }
        if (!flag)
        {
            l = -l;
            if (l < 0)
            {
                int _tmp = j1;
                return null;
            }
        }
        if (l <= 0x7fffffff && l >= 0x80000000)
        {
            Integer integer = Integer.valueOf(l);
            int _tmp1 = j1;
            return integer;
        } else
        {
            int _tmp2 = j1;
            return null;
        }
    }
}
