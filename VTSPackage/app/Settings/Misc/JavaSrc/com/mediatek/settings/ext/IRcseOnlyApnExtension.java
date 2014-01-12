// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;


public interface IRcseOnlyApnExtension
{
    public static interface OnRcseOnlyApnStateChangedListener
    {

        public abstract void onRcseOnlyApnStateChanged(boolean flag);
    }


    public abstract void addRcseOnlyApnStateChanged(OnRcseOnlyApnStateChangedListener onrcseonlyapnstatechangedlistener);

    public abstract boolean isRcseOnlyApnEnabled();

    public abstract void removeRcseOnlyApnStateChanged(OnRcseOnlyApnStateChangedListener onrcseonlyapnstatechangedlistener);
}
