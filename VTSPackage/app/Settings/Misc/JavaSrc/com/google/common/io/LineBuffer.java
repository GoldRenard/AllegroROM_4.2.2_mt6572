// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.IOException;

abstract class LineBuffer
{

    private StringBuilder line;
    private boolean sawReturn;

    LineBuffer()
    {
        line = new StringBuilder();
    }

    private boolean finishLine(boolean flag)
        throws IOException
    {
        String s = line.toString();
        String s1;
        if (sawReturn)
        {
            if (flag)
                s1 = "\r\n";
            else
                s1 = "\r";
        } else
        if (flag)
            s1 = "\n";
        else
            s1 = "";
        handleLine(s, s1);
        line = new StringBuilder();
        sawReturn = false;
        return flag;
    }

    protected void add(char ac[], int i, int j)
        throws IOException
    {
        int k = i;
        if (sawReturn && j > 0)
        {
            boolean flag1;
            if (ac[k] == '\n')
                flag1 = true;
            else
                flag1 = false;
            if (finishLine(flag1))
                k++;
        }
        int l = k;
        for (int i1 = i + j; k < i1; k++)
            switch (ac[k])
            {
            case 11: // '\013'
            case 12: // '\f'
            default:
                break;

            case 10: // '\n'
                line.append(ac, l, k - l);
                finishLine(true);
                l = k + 1;
                break;

            case 13: // '\r'
                line.append(ac, l, k - l);
                sawReturn = true;
                if (k + 1 < i1)
                {
                    boolean flag;
                    if (ac[k + 1] == '\n')
                        flag = true;
                    else
                        flag = false;
                    if (finishLine(flag))
                        k++;
                }
                l = k + 1;
                break;
            }

        line.append(ac, l, (i + j) - l);
    }

    protected void finish()
        throws IOException
    {
        if (sawReturn || line.length() > 0)
            finishLine(false);
    }

    protected abstract void handleLine(String s, String s1)
        throws IOException;
}
