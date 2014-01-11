// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;


public class ExecutionError extends Error
{

    private static final long serialVersionUID;


    public ExecutionError(Error error)
    {
        super(error);
    }

    protected ExecutionError(String s)
    {
        super(s);
    }

    public ExecutionError(String s, Error error)
    {
        super(s, error);
    }
}
