// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.google.common.collect;


public abstract class ForwardingObject
{


    protected abstract Object _mthdelegate();

    public String toString()
    {
        return _mthdelegate().toString();
    }
}
