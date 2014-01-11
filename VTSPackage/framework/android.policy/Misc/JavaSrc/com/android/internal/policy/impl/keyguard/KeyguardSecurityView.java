// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityCallback

public interface KeyguardSecurityView
{

    public static final int SCREEN_ON = 1;
    public static final int VIEW_REVEALED = 2;

    public abstract KeyguardSecurityCallback getCallback();

    public abstract void hideBouncer(int i);

    public abstract boolean needsInput();

    public abstract void onPause();

    public abstract void onResume(int i);

    public abstract void reset();

    public abstract void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback);

    public abstract void setLockPatternUtils(LockPatternUtils lockpatternutils);

    public abstract void showBouncer(int i);

    public abstract void showUsabilityHint();
}
