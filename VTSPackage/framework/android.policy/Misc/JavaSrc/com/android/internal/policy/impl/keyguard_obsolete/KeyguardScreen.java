// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;


public interface KeyguardScreen
{

    public abstract void cleanUp();

    public abstract boolean needsInput();

    public abstract void onPause();

    public abstract void onResume();
}
