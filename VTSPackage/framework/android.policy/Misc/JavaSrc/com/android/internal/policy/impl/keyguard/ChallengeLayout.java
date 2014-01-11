// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;


public interface ChallengeLayout
{
    public static interface OnBouncerStateChangedListener
    {

        public abstract void onBouncerStateChanged(boolean flag);
    }


    public abstract int getBouncerAnimationDuration();

    public abstract void hideBouncer();

    public abstract boolean isBouncing();

    public abstract boolean isChallengeOverlapping();

    public abstract boolean isChallengeShowing();

    public abstract void setOnBouncerStateChangedListener(OnBouncerStateChangedListener onbouncerstatechangedlistener);

    public abstract void showBouncer();

    public abstract void showChallenge(boolean flag);
}
