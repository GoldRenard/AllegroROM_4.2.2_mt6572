// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;


public interface SecurityMessageDisplay
{

    public abstract void hideBouncer(int i);

    public abstract void setMessage(int i, boolean flag);

    public transient abstract void setMessage(int i, boolean flag, Object aobj[]);

    public abstract void setMessage(CharSequence charsequence, boolean flag);

    public abstract void setTimeout(int i);

    public abstract void showBouncer(int i);
}
