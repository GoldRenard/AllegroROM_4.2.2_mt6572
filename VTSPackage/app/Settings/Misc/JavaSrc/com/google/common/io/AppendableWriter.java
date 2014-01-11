// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.*;

class AppendableWriter extends Writer
{

    private boolean closed;
    private final Appendable target;

    AppendableWriter(Appendable appendable)
    {
        target = appendable;
    }

    private void checkNotClosed()
        throws IOException
    {
        if (closed)
            throw new IOException("Cannot write to a closed writer.");
        else
            return;
    }

    public Writer append(char c)
        throws IOException
    {
        checkNotClosed();
        target.append(c);
        return this;
    }

    public Writer append(CharSequence charsequence)
        throws IOException
    {
        checkNotClosed();
        target.append(charsequence);
        return this;
    }

    public Writer append(CharSequence charsequence, int i, int j)
        throws IOException
    {
        checkNotClosed();
        target.append(charsequence, i, j);
        return this;
    }

    public volatile Appendable append(char c)
        throws IOException
    {
        return append(c);
    }

    public volatile Appendable append(CharSequence charsequence)
        throws IOException
    {
        return append(charsequence);
    }

    public volatile Appendable append(CharSequence charsequence, int i, int j)
        throws IOException
    {
        return append(charsequence, i, j);
    }

    public void close()
        throws IOException
    {
        closed = true;
        if (target instanceof Closeable)
            ((Closeable)target).close();
    }

    public void flush()
        throws IOException
    {
        checkNotClosed();
        if (target instanceof Flushable)
            ((Flushable)target).flush();
    }

    public void write(int i)
        throws IOException
    {
        checkNotClosed();
        target.append((char)i);
    }

    public void write(String s)
        throws IOException
    {
        checkNotClosed();
        target.append(s);
    }

    public void write(String s, int i, int j)
        throws IOException
    {
        checkNotClosed();
        target.append(s, i, i + j);
    }

    public void write(char ac[], int i, int j)
        throws IOException
    {
        checkNotClosed();
        target.append(new String(ac, i, j));
    }
}
