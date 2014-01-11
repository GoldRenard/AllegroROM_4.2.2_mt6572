// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUpdateMonitor, KeyguardUtils

public class KeyguardSecurityModel
{
    static final class SecurityMode extends Enum
    {

        private static final SecurityMode $VALUES[];
        public static final SecurityMode Account;
        public static final SecurityMode AlarmBoot;
        public static final SecurityMode Biometric;
        public static final SecurityMode Invalid;
        public static final SecurityMode None;
        public static final SecurityMode PIN;
        public static final SecurityMode Password;
        public static final SecurityMode Pattern;
        public static final SecurityMode SimPinPukMe1;
        public static final SecurityMode SimPinPukMe2;
        public static final SecurityMode SimPinPukMe3;
        public static final SecurityMode SimPinPukMe4;
        public static final SecurityMode Voice;

        public static SecurityMode valueOf(String s)
        {
            return (SecurityMode)Enum.valueOf(com/android/internal/policy/impl/keyguard/KeyguardSecurityModel$SecurityMode, s);
        }

        public static SecurityMode[] values()
        {
            return (SecurityMode[])$VALUES.clone();
        }

        static 
        {
            Invalid = new SecurityMode("Invalid", 0);
            None = new SecurityMode("None", 1);
            Pattern = new SecurityMode("Pattern", 2);
            Password = new SecurityMode("Password", 3);
            PIN = new SecurityMode("PIN", 4);
            Biometric = new SecurityMode("Biometric", 5);
            Account = new SecurityMode("Account", 6);
            AlarmBoot = new SecurityMode("AlarmBoot", 7);
            SimPinPukMe1 = new SecurityMode("SimPinPukMe1", 8);
            SimPinPukMe2 = new SecurityMode("SimPinPukMe2", 9);
            SimPinPukMe3 = new SecurityMode("SimPinPukMe3", 10);
            SimPinPukMe4 = new SecurityMode("SimPinPukMe4", 11);
            Voice = new SecurityMode("Voice", 12);
            SecurityMode asecuritymode[] = new SecurityMode[13];
            asecuritymode[0] = Invalid;
            asecuritymode[1] = None;
            asecuritymode[2] = Pattern;
            asecuritymode[3] = Password;
            asecuritymode[4] = PIN;
            asecuritymode[5] = Biometric;
            asecuritymode[6] = Account;
            asecuritymode[7] = AlarmBoot;
            asecuritymode[8] = SimPinPukMe1;
            asecuritymode[9] = SimPinPukMe2;
            asecuritymode[10] = SimPinPukMe3;
            asecuritymode[11] = SimPinPukMe4;
            asecuritymode[12] = Voice;
            $VALUES = asecuritymode;
        }

        private SecurityMode(String s, int i)
        {
            super(s, i);
        }
    }


    private Context mContext;
    private LockPatternUtils mLockPatternUtils;

    KeyguardSecurityModel(Context context)
    {
        mContext = context;
        mLockPatternUtils = new LockPatternUtils(context);
    }

    private boolean isBiometricUnlockSuppressed()
    {
        boolean flag1;
label0:
        {
            KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.getInstance(mContext);
            boolean flag;
            if (keyguardupdatemonitor.getFailedUnlockAttempts() >= 5)
                flag = true;
            else
                flag = false;
            if (!keyguardupdatemonitor.getMaxBiometricUnlockAttemptsReached() && !flag && keyguardupdatemonitor.isAlternateUnlockEnabled())
            {
                int i = keyguardupdatemonitor.getPhoneState();
                flag1 = false;
                if (i == 0)
                    break label0;
            }
            flag1 = true;
        }
        return flag1;
    }

    private boolean isPinPukOrMeRequired(int i)
    {
        boolean flag;
label0:
        {
            KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.getInstance(mContext);
            flag = false;
            if (keyguardupdatemonitor == null)
                break label0;
            boolean flag1 = KeyguardUtils.isValidSimId(i);
            flag = false;
            if (!flag1)
                break label0;
            com.android.internal.telephony.IccCardConstants.State state = keyguardupdatemonitor.getSimState(i);
            if ((state != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || keyguardupdatemonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PIN)) && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || keyguardupdatemonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PUK) || keyguardupdatemonitor.getRetryPukCount(i) == 0))
            {
                com.android.internal.telephony.IccCardConstants.State state1 = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                flag = false;
                if (state != state1)
                    break label0;
                boolean flag2 = keyguardupdatemonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_ME);
                flag = false;
                if (flag2)
                    break label0;
                int j = keyguardupdatemonitor.getSimMeLeftRetryCount(i);
                flag = false;
                if (j == 0)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    SecurityMode getAlternateFor(SecurityMode securitymode)
    {
        if (!isBiometricUnlockSuppressed() && (securitymode == SecurityMode.Password || securitymode == SecurityMode.PIN || securitymode == SecurityMode.Pattern))
            if (isBiometricUnlockEnabled())
                securitymode = SecurityMode.Biometric;
            else
            if (isVoiceUnlockEnabled())
                return SecurityMode.Voice;
        return securitymode;
    }

    SecurityMode getBackupSecurityMode(SecurityMode securitymode)
    {
        static class _cls1
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode = new int[SecurityMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[SecurityMode.Biometric.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[SecurityMode.Voice.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardSecurityModel$SecurityMode[SecurityMode.Pattern.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardSecurityModel.SecurityMode[securitymode.ordinal()])
        {
        case 3: // '\003'
            return SecurityMode.Account;

        case 1: // '\001'
        case 2: // '\002'
            return getSecurityMode();
        }
        return securitymode;
    }

    SecurityMode getSecurityMode()
    {
        SecurityMode securitymode;
label0:
        {
label1:
            {
label2:
                {
                    if (KeyguardUpdateMonitor.getInstance(mContext).dmIsLocked())
                    {
                        securitymode = SecurityMode.None;
                    } else
                    {
                        securitymode = SecurityMode.None;
                        if (isPinPukOrMeRequired(0))
                            return SecurityMode.SimPinPukMe1;
                        if (isPinPukOrMeRequired(1))
                            return SecurityMode.SimPinPukMe2;
                        if (isPinPukOrMeRequired(2))
                            return SecurityMode.SimPinPukMe3;
                        if (isPinPukOrMeRequired(3))
                            return SecurityMode.SimPinPukMe4;
                        if (KeyguardUpdateMonitor.isAlarmBoot())
                            return SecurityMode.AlarmBoot;
                        switch (mLockPatternUtils.getKeyguardStoredPasswordQuality())
                        {
                        default:
                            break label0;

                        case 0: // '\0'
                        case 65536: 
                            if (mLockPatternUtils.isLockPatternEnabled())
                                if (mLockPatternUtils.isPermanentlyLocked())
                                    return SecurityMode.Account;
                                else
                                    return SecurityMode.Pattern;
                            break;

                        case 131072: 
                            break label1;

                        case 262144: 
                        case 327680: 
                        case 393216: 
                            break label2;
                        }
                    }
                    return securitymode;
                }
                if (mLockPatternUtils.isLockPasswordEnabled())
                    return SecurityMode.Password;
                else
                    return SecurityMode.None;
            }
            if (mLockPatternUtils.isLockPasswordEnabled())
                return SecurityMode.PIN;
            else
                return SecurityMode.None;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unknown unlock mode:").append(securitymode).toString());
    }

    boolean isBiometricUnlockEnabled()
    {
        return mLockPatternUtils.usingBiometricWeak() && mLockPatternUtils.isBiometricWeakInstalled();
    }

    boolean isVoiceUnlockEnabled()
    {
        return mLockPatternUtils.usingVoiceWeak();
    }

    void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }
}
