// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.content.Context;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardViewProperties, KeyguardUpdateMonitor, LockPatternKeyguardView, KeyguardViewCallback, 
//            KeyguardWindowController, KeyguardViewBase

public class LockPatternKeyguardViewProperties
    implements KeyguardViewProperties
{

    private final LockPatternUtils mLockPatternUtils;
    private final KeyguardUpdateMonitor mUpdateMonitor;

    public LockPatternKeyguardViewProperties(LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor)
    {
        mLockPatternUtils = lockpatternutils;
        mUpdateMonitor = keyguardupdatemonitor;
    }

    private boolean isSimPinSecure()
    {
        com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState();
        return state == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || state == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || state == com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
    }

    public KeyguardViewBase createKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardWindowController keyguardwindowcontroller)
    {
        return new LockPatternKeyguardView(context, keyguardviewcallback, keyguardupdatemonitor, mLockPatternUtils, keyguardwindowcontroller);
    }

    public boolean isSecure()
    {
        return mLockPatternUtils.isSecure() || isSimPinSecure();
    }
}
