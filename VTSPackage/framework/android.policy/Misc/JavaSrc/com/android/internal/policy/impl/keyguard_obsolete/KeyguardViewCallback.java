// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;


public interface KeyguardViewCallback
{

    public abstract void keyguardDone(boolean flag);

    public abstract void keyguardDoneDrawing();

    public abstract void pokeWakelock();

    public abstract void pokeWakelock(int i);
}
