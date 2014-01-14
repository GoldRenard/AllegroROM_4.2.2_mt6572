// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.support.v4.util;

import java.io.PrintWriter;

public class TimeUtils
{

    public static final int HUNDRED_DAY_FIELD_LEN = 19;
    private static final int SECONDS_PER_DAY = 0x15180;
    private static final int SECONDS_PER_HOUR = 3600;
    private static final int SECONDS_PER_MINUTE = 60;
    private static char sFormatStr[] = new char[24];
    private static final Object sFormatSync = new Object();


    private static int accumField(int i, int j, boolean flag, int k)
    {
        if (i <= 99 && (!flag || k < 3))
        {
            if (i <= 9 && (!flag || k < 2))
            {
                if (!flag && i <= 0)
                    return 0;
                else
                    return j + 1;
            } else
            {
                return j + 2;
            }
        } else
        {
            return j + 3;
        }
    }

    public static void formatDuration(long l, long l1, PrintWriter printwriter)
    {
        if (l == 0L)
        {
            printwriter.print("--");
            return;
        } else
        {
            formatDuration(l - l1, printwriter, 0);
            return;
        }
    }

    public static void formatDuration(long l, PrintWriter printwriter)
    {
        formatDuration(l, printwriter, 0);
    }

    public static void formatDuration(long l, PrintWriter printwriter, int i)
    {
        synchronized (sFormatSync)
        {
            int j = formatDurationLocked(l, i);
            printwriter.print(new String(sFormatStr, 0, j));
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static void formatDuration(long l, StringBuilder stringbuilder)
    {
        synchronized (sFormatSync)
        {
            int i = formatDurationLocked(l, 0);
            stringbuilder.append(sFormatStr, 0, i);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static int formatDurationLocked(long l, int i)
    {
        if (sFormatStr.length < i)
            sFormatStr = new char[i];
        char ac[] = sFormatStr;
        if (l == 0L)
        {
            for (int k5 = i - 1; k5 < 0;)
                ac[0] = ' ';

            ac[0] = '0';
            return 1;
        }
        char c;
        if (l > 0L)
        {
            c = '+';
        } else
        {
            c = '-';
            l = -l;
        }
        int j = (int)(l % 1000L);
        int k = (int)Math.floor(l / 1000L);
        int i1 = k;
        int j1 = 0;
        if (i1 > 0x15180)
        {
            j1 = k / 0x15180;
            k -= 0x15180 * j1;
        }
        int k1 = k;
        int l1 = 0;
        if (k1 > 3600)
        {
            l1 = k / 3600;
            k -= l1 * 3600;
        }
        int i2 = k;
        int j2 = 0;
        if (i2 > 60)
        {
            j2 = k / 60;
            k -= j2 * 60;
        }
        int k2 = 0;
        if (i != 0)
        {
            int j4 = accumField(j1, 1, false, 0);
            boolean flag4;
            if (j4 > 0)
                flag4 = true;
            else
                flag4 = false;
            int k4 = j4 + accumField(l1, 1, flag4, 2);
            boolean flag5;
            if (k4 > 0)
                flag5 = true;
            else
                flag5 = false;
            int l4 = k4 + accumField(j2, 1, flag5, 2);
            boolean flag6;
            if (l4 > 0)
                flag6 = true;
            else
                flag6 = false;
            int i5 = l4 + accumField(k, 1, flag6, 2);
            byte byte4;
            if (i5 > 0)
                byte4 = 3;
            else
                byte4 = 0;
            for (int j5 = i5 + (1 + accumField(j, 2, true, byte4)); j5 < i; j5++)
            {
                ac[k2] = ' ';
                k2++;
            }

        }
        ac[k2] = c;
        int l2 = k2 + 1;
        boolean flag;
        if (i != 0)
            flag = true;
        else
            flag = false;
        int i3 = printField(ac, j1, 'd', l2, false, 0);
        boolean flag1;
        if (i3 != l2)
            flag1 = true;
        else
            flag1 = false;
        byte byte0;
        if (flag)
            byte0 = 2;
        else
            byte0 = 0;
        int j3 = printField(ac, l1, 'h', i3, flag1, byte0);
        boolean flag2;
        if (j3 != l2)
            flag2 = true;
        else
            flag2 = false;
        byte byte1;
        if (flag)
            byte1 = 2;
        else
            byte1 = 0;
        int k3 = printField(ac, j2, 'm', j3, flag2, byte1);
        boolean flag3;
        if (k3 != l2)
            flag3 = true;
        else
            flag3 = false;
        byte byte2;
        if (flag)
            byte2 = 2;
        else
            byte2 = 0;
        int l3 = printField(ac, k, 's', k3, flag3, byte2);
        byte byte3;
        if (flag && l3 != l2)
            byte3 = 3;
        else
            byte3 = 0;
        int i4 = printField(ac, j, 'm', l3, true, byte3);
        ac[i4] = 's';
        return i4 + 1;
    }

    private static int printField(char ac[], int i, char c, int j, boolean flag, int k)
    {
        if (flag || i > 0)
        {
            int l = j;
            if (flag && k >= 3 || i > 99)
            {
                int k1 = i / 100;
                ac[j] = (char)(k1 + 48);
                j++;
                i -= k1 * 100;
            }
            if (flag && k >= 2 || i > 9 || l != j)
            {
                int i1 = i / 10;
                ac[j] = (char)(i1 + 48);
                j++;
                i -= i1 * 10;
            }
            ac[j] = (char)(i + 48);
            int j1 = j + 1;
            ac[j1] = c;
            j = j1 + 1;
        }
        return j;
    }

}
