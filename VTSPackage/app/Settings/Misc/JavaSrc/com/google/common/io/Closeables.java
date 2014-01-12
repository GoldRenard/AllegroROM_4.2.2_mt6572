// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.Closeable;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class Closeables
{

    static final Logger logger = Logger.getLogger(com/google/common/io/Closeables.getName());

    private Closeables()
    {
    }

    public static void close(Closeable closeable, boolean flag)
        throws IOException
    {
        if (closeable == null)
            return;
        try
        {
            closeable.close();
            return;
        }
        catch (IOException ioexception)
        {
            if (flag)
            {
                logger.log(Level.WARNING, "IOException thrown while closing Closeable.", ioexception);
                return;
            } else
            {
                throw ioexception;
            }
        }
    }

    public static void closeQuietly(Closeable closeable)
    {
        try
        {
            close(closeable, true);
            return;
        }
        catch (IOException ioexception)
        {
            logger.log(Level.SEVERE, "IOException should not have been thrown.", ioexception);
        }
    }

}
