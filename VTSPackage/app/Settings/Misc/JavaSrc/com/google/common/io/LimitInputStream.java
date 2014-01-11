// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.*;

public final class LimitInputStream extends FilterInputStream
{

    private long left;
    private long mark;

    public LimitInputStream(InputStream inputstream, long l)
    {
        super(inputstream);
        mark = -1L;
        Preconditions.checkNotNull(inputstream);
        boolean flag;
        if (l >= 0L)
            flag = true;
        else
            flag = false;
        Preconditions.checkArgument(flag, "limit must be non-negative");
        left = l;
    }

    public int available()
        throws IOException
    {
        return (int)Math.min(in.available(), left);
    }

    public void mark(int i)
    {
        this;
        JVM INSTR monitorenter ;
        in.mark(i);
        mark = left;
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
        int i;
        if (left == 0L)
        {
            i = -1;
        } else
        {
            i = in.read();
            if (i != -1)
            {
                left = left - 1L;
                return i;
            }
        }
        return i;
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        int l;
        if (left == 0L)
        {
            l = -1;
        } else
        {
            int k = (int)Math.min(j, left);
            l = in.read(abyte0, i, k);
            if (l != -1)
            {
                left = left - (long)l;
                return l;
            }
        }
        return l;
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
        left = mark;
        this;
        JVM INSTR monitorexit ;
    }

    public long skip(long l)
        throws IOException
    {
        long l1 = Math.min(l, left);
        long l2 = in.skip(l1);
        left = left - l2;
        return l2;
    }
}
