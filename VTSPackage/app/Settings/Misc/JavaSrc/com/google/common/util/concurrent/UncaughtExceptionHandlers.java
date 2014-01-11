// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;

import java.util.logging.Level;
import java.util.logging.Logger;

public final class UncaughtExceptionHandlers
{
    static final class Exiter
        implements Thread.UncaughtExceptionHandler
    {

        private static final Logger logger = Logger.getLogger(com/google/common/util/concurrent/UncaughtExceptionHandlers$Exiter.getName());
        private final Runtime runtime;

        public void uncaughtException(Thread thread, Throwable throwable)
        {
            logger.log(Level.SEVERE, String.format("Caught an exception in %s.  Shutting down.", new Object[] {
                thread
            }), throwable);
            runtime.exit(1);
        }


        Exiter(Runtime runtime1)
        {
            runtime = runtime1;
        }
    }


    private UncaughtExceptionHandlers()
    {
    }

    public static Thread.UncaughtExceptionHandler systemExit()
    {
        return new Exiter(Runtime.getRuntime());
    }
}
