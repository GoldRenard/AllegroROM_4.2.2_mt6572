// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;


public interface KeyguardSecurityCallback
{

    public abstract void dismiss(boolean flag);

    public abstract int getFailedAttempts();

    public abstract boolean hasOnDismissAction();

    public abstract boolean isVerifyUnlockOnly();

    public abstract void reportFailedUnlockAttempt();

    public abstract void reportSuccessfulUnlockAttempt();

    public abstract void setOnDismissAction(KeyguardHostView.OnDismissAction ondismissaction);

    public abstract void showBackupSecurity();

    public abstract void updateClipChildren(boolean flag);

    public abstract void updateKeyguardLayerVisibility(boolean flag);

    public abstract void userActivity(long l);
}
