// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;


public interface CallBarringInterface
{

    public abstract void doCallBarringRefresh(String s);

    public abstract void doCancelAllState();

    public abstract int getErrorState();

    public abstract void setErrorState(int i);
}
