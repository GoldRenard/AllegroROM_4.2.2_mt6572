// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.util.concurrent;


public interface FutureCallback
{

    public abstract void onFailure(Throwable throwable);

    public abstract void onSuccess(Object obj);
}
