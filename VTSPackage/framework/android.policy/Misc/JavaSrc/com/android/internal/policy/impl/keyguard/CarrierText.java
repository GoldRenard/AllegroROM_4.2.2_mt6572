// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUpdateMonitor, KeyguardViewManager, KeyguardUpdateMonitorCallback

public class CarrierText extends TextView
{
    private static final class StatusMode extends Enum
    {

        private static final StatusMode $VALUES[];
        public static final StatusMode NetworkLocked;
        public static final StatusMode Normal;
        public static final StatusMode SimLocked;
        public static final StatusMode SimMissing;
        public static final StatusMode SimMissingLocked;
        public static final StatusMode SimNotReady;
        public static final StatusMode SimPermDisabled;
        public static final StatusMode SimPukLocked;

        public static StatusMode valueOf(String s)
        {
            return (StatusMode)Enum.valueOf(com/android/internal/policy/impl/keyguard/CarrierText$StatusMode, s);
        }

        public static StatusMode[] values()
        {
            return (StatusMode[])$VALUES.clone();
        }

        static 
        {
            Normal = new StatusMode("Normal", 0);
            NetworkLocked = new StatusMode("NetworkLocked", 1);
            SimMissing = new StatusMode("SimMissing", 2);
            SimMissingLocked = new StatusMode("SimMissingLocked", 3);
            SimPukLocked = new StatusMode("SimPukLocked", 4);
            SimLocked = new StatusMode("SimLocked", 5);
            SimPermDisabled = new StatusMode("SimPermDisabled", 6);
            SimNotReady = new StatusMode("SimNotReady", 7);
            StatusMode astatusmode[] = new StatusMode[8];
            astatusmode[0] = Normal;
            astatusmode[1] = NetworkLocked;
            astatusmode[2] = SimMissing;
            astatusmode[3] = SimMissingLocked;
            astatusmode[4] = SimPukLocked;
            astatusmode[5] = SimLocked;
            astatusmode[6] = SimPermDisabled;
            astatusmode[7] = SimNotReady;
            $VALUES = astatusmode;
        }

        private StatusMode(String s, int i)
        {
            super(s, i);
        }
    }


    private static CharSequence mSeparator;
    private KeyguardUpdateMonitorCallback mCallback = new KeyguardUpdateMonitorCallback() {

        private CharSequence mPlmn;
        private com.android.internal.telephony.IccCardConstants.State mSimState;
        private CharSequence mSpn;
        final CarrierText this$0;

        public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1)
        {
            mPlmn = charsequence;
            mSpn = charsequence1;
            updateCarrierText(mSimState, mPlmn, mSpn);
        }

        public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
        {
            mSimState = state;
            updateCarrierText(mSimState, mPlmn, mSpn);
        }

            
            {
                this$0 = CarrierText.this;
                super();
            }
    }
;
    private LockPatternUtils mLockPatternUtils;

    public CarrierText(Context context)
    {
        this(context, null);
    }

    public CarrierText(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLockPatternUtils = new LockPatternUtils(mContext);
    }

    private static CharSequence concatenate(CharSequence charsequence, CharSequence charsequence1)
    {
        boolean flag;
        if (!TextUtils.isEmpty(charsequence))
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!TextUtils.isEmpty(charsequence1))
            flag1 = true;
        else
            flag1 = false;
        if (flag && flag1)
            charsequence = (new StringBuilder()).append(charsequence).append(mSeparator).append(charsequence1).toString();
        else
        if (!flag)
            if (flag1)
                return charsequence1;
            else
                return "";
        return charsequence;
    }

    private CharSequence getCarrierHelpTextForSimState(com.android.internal.telephony.IccCardConstants.State state, String s, String s1)
    {
        StatusMode statusmode = getStatusForIccState(state);
        static class _cls2
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[];
            static final int $SwitchMap$com$android$internal$telephony$IccCardConstants$State[];

            static 
            {
                $SwitchMap$com$android$internal$telephony$IccCardConstants$State = new int[com.android.internal.telephony.IccCardConstants.State.values().length];
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.ABSENT.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NOT_READY.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.READY.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror5) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror6) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.UNKNOWN.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror7) { }
                $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode = new int[StatusMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.Normal.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror8) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimNotReady.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror9) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.NetworkLocked.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror10) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimMissing.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror11) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimPermDisabled.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror12) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimMissingLocked.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror13) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimLocked.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror14) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$CarrierText$StatusMode[StatusMode.SimPukLocked.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror15)
                {
                    return;
                }
            }
        }

        int i = _cls2..SwitchMap.com.android.internal.policy.impl.keyguard.CarrierText.StatusMode[statusmode.ordinal()];
        int j = 0;
        switch (i)
        {
        case 6: // '\006'
            j = 0x10402f7;
            break;

        case 5: // '\005'
            j = 0x10402fa;
            break;

        case 4: // '\004'
            j = 0x10402f8;
            break;

        case 3: // '\003'
            j = 0x10402e9;
            break;
        }
        return mContext.getText(j);
    }

    private CharSequence getCarrierTextForSimState(com.android.internal.telephony.IccCardConstants.State state, CharSequence charsequence, CharSequence charsequence1)
    {
        StatusMode statusmode = getStatusForIccState(state);
        switch (_cls2..SwitchMap.com.android.internal.policy.impl.keyguard.CarrierText.StatusMode[statusmode.ordinal()])
        {
        case 8: // '\b'
            return makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040302), charsequence);

        case 7: // '\007'
            return makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040304), charsequence);

        case 6: // '\006'
            return makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), charsequence);

        case 5: // '\005'
            return getContext().getText(0x10402f9);

        case 4: // '\004'
            return makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), charsequence);

        case 3: // '\003'
            return makeCarrierStringOnEmergencyCapable(mContext.getText(0x1040301), charsequence);

        case 2: // '\002'
            return null;

        case 1: // '\001'
            return concatenate(charsequence, charsequence1);
        }
        return null;
    }

    private StatusMode getStatusForIccState(com.android.internal.telephony.IccCardConstants.State state)
    {
        if (state == null)
            return StatusMode.Normal;
        boolean flag;
        if (KeyguardUpdateMonitor.getInstance(mContext).isDeviceProvisioned() || state != com.android.internal.telephony.IccCardConstants.State.ABSENT && state != com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED)
            flag = false;
        else
            flag = true;
        if (flag)
            return StatusMode.SimMissingLocked;
        switch (_cls2..SwitchMap.com.android.internal.telephony.IccCardConstants.State[state.ordinal()])
        {
        case 8: // '\b'
            return StatusMode.SimMissing;

        case 7: // '\007'
            return StatusMode.SimPermDisabled;

        case 6: // '\006'
            return StatusMode.Normal;

        case 5: // '\005'
            return StatusMode.SimPukLocked;

        case 4: // '\004'
            return StatusMode.SimLocked;

        case 3: // '\003'
            return StatusMode.SimNotReady;

        case 2: // '\002'
            return StatusMode.NetworkLocked;

        case 1: // '\001'
            return StatusMode.SimMissing;
        }
        return StatusMode.SimMissing;
    }

    private CharSequence makeCarrierStringOnEmergencyCapable(CharSequence charsequence, CharSequence charsequence1)
    {
        if (mLockPatternUtils.isEmergencyCallCapable())
            charsequence = concatenate(charsequence, charsequence1);
        return charsequence;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mCallback);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mCallback);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mSeparator = getResources().getString(0x1040543);
        setSelected(true);
    }

    protected void updateCarrierText(com.android.internal.telephony.IccCardConstants.State state, CharSequence charsequence, CharSequence charsequence1)
    {
        CharSequence charsequence2 = getCarrierTextForSimState(state, charsequence, charsequence1);
        if (KeyguardViewManager.USE_UPPER_CASE)
        {
            String s;
            if (charsequence2 != null)
                s = charsequence2.toString().toUpperCase();
            else
                s = null;
            setText(s);
            return;
        } else
        {
            setText(charsequence2);
            return;
        }
    }
}
