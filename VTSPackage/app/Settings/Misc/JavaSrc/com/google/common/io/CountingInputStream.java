// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.*;

public final class CountingInputStream extends FilterInputStream
{

    private long count;
    private long mark;

    public CountingInputStream(InputStream inputstream)
    {
        super(inputstream);
        mark = -1L;
    }

    public long getCount()
    {
        return count;
    }

    public void mark(int i)
    {
        this;
        JVM INSTR monitorenter ;
        in.mark(i);
        mark = count;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public int read()
        throws IOException
    {
        int i = in.read();
        if (i != -1)
            count = 1L + count;
        return i;
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        int k = in.read(abyte0, i, j);
        if (k != -1)
            count = count + (long)k;
        return k;
    }

    public void reset()
        throws IOException
    {
        this;
        JVM INSTR monitorenter ;
        if (!in.markSupported())
            throw new IOException("Mark not supported");
        break MISSING_BLOCK_LABEL_27;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (mark == -1L)
            throw new IOException("Mark not set");
        in.reset();
        count = mark;
        this;
        JVM INSTR monitorexit ;
    }

    public long skip(long l)
        throws IOException
    {
        long l1 = in.skip(l);
        count = l1 + count;
        return l1;
    }
}
