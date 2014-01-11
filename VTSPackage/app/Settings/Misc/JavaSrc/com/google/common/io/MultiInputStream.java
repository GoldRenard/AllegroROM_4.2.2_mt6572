// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

// Referenced classes of package com.google.common.io:
//            InputSupplier

final class MultiInputStream extends InputStream
{

    private InputStream in;
    private Iterator it;

    public MultiInputStream(Iterator iterator)
        throws IOException
    {
        it = iterator;
        advance();
    }

    private void advance()
        throws IOException
    {
        close();
        if (it.hasNext())
            in = (InputStream)((InputSupplier)it.next()).getInput();
    }

    public int available()
        throws IOException
    {
        if (in == null)
            return 0;
        else
            return in.available();
    }

    public void close()
        throws IOException
    {
        if (in == null)
            break MISSING_BLOCK_LABEL_19;
        in.close();
        in = null;
        return;
        Exception exception;
        exception;
        in = null;
        throw exception;
    }

    public boolean markSupported()
    {
        return false;
    }

    public int read()
        throws IOException
    {
        int i;
        if (in == null)
        {
            i = -1;
        } else
        {
            i = in.read();
            if (i == -1)
            {
                advance();
                return read();
            }
        }
        return i;
    }

    public int read(byte abyte0[], int i, int j)
        throws IOException
    {
        int k;
        if (in == null)
        {
            k = -1;
        } else
        {
            k = in.read(abyte0, i, j);
            if (k == -1)
            {
                advance();
                return read(abyte0, i, j);
            }
        }
        return k;
    }

    public long skip(long l)
        throws IOException
    {
        long l1;
        if (in != null && l > 0L)
        {
            l1 = in.skip(l);
            if (l1 == 0L)
                if (read() == -1)
                    return 0L;
                else
                    return 1L + in.skip(l - 1L);
        } else
        {
            l1 = 0L;
        }
        return l1;
    }
}
