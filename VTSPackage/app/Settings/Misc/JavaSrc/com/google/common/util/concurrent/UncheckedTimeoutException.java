// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;


public class UncheckedTimeoutException extends RuntimeException
{

    private static final long serialVersionUID;


    public UncheckedTimeoutException(String s)
    {
        super(s);
    }

    public UncheckedTimeoutException(String s, Throwable throwable)
    {
        super(s, throwable);
    }

    public UncheckedTimeoutException(Throwable throwable)
    {
        super(throwable);
    }
}
