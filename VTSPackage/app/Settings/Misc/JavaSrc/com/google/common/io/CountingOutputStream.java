// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.*;

public final class CountingOutputStream extends FilterOutputStream
{

    private long count;

    public CountingOutputStream(OutputStream outputstream)
    {
        super(outputstream);
    }

    public long getCount()
    {
        return count;
    }

    public void write(int i)
        throws IOException
    {
        out.write(i);
        count = 1L + count;
    }

    public void write(byte abyte0[], int i, int j)
        throws IOException
    {
        out.write(abyte0, i, j);
        count = count + (long)j;
    }
}
