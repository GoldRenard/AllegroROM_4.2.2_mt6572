// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.io;

import java.io.Flushable;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class Flushables
{

    private static final Logger logger = Logger.getLogger(com/google/common/io/Flushables.getName());

    private Flushables()
    {
    }

    public static void flush(Flushable flushable, boolean flag)
        throws IOException
    {
        try
        {
            flushable.flush();
            return;
        }
        catch (IOException ioexception)
        {
            if (flag)
            {
                logger.log(Level.WARNING, "IOException thrown while flushing Flushable.", ioexception);
                return;
            } else
            {
                throw ioexception;
            }
        }
    }

    public static void flushQuietly(Flushable flushable)
    {
        try
        {
            flush(flushable, true);
            return;
        }
        catch (IOException ioexception)
        {
            logger.log(Level.SEVERE, "IOException should not have been thrown.", ioexception);
        }
    }

}
