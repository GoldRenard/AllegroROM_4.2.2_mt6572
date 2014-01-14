// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.content.res.Configuration;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardViewCallback

public interface KeyguardScreenCallback
    extends KeyguardViewCallback
{

    public abstract boolean doesFallbackUnlockScreenExist();

    public abstract void forgotPattern(boolean flag);

    public abstract void goToLockScreen();

    public abstract void goToUnlockScreen();

    public abstract boolean isSecure();

    public abstract boolean isVerifyUnlockOnly();

    public abstract void recreateMe(Configuration configuration);

    public abstract void reportFailedUnlockAttempt();

    public abstract void reportSuccessfulUnlockAttempt();

    public abstract void takeEmergencyCallAction();
}
