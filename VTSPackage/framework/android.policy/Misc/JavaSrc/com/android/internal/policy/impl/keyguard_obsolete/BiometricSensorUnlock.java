// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.view.View;

interface BiometricSensorUnlock
{

    public abstract void cleanUp();

    public abstract int getQuality();

    public abstract void hide();

    public abstract void initializeView(View view);

    public abstract boolean isRunning();

    public abstract void show(long l);

    public abstract boolean start();

    public abstract boolean stop();
}
