// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUtils, KeyguardUpdateMonitor, KeyguardViewManager, KeyguardUpdateMonitorCallback

public class MediatekCarrierText extends LinearLayout
{
    private static final class StatusMode extends Enum
    {

        private static final StatusMode $VALUES[];
        public static final StatusMode NetworkLocked;
        public static final StatusMode NetworkSearching;
        public static final StatusMode Normal;
        public static final StatusMode SimLocked;
        public static final StatusMode SimMissing;
        public static final StatusMode SimMissingLocked;
        public static final StatusMode SimNotReady;
        public static final StatusMode SimPermDisabled;
        public static final StatusMode SimPukLocked;
        public static final StatusMode SimUnknown;

        public static StatusMode valueOf(String s)
        {
            return (StatusMode)Enum.valueOf(com/android/internal/policy/impl/keyguard/MediatekCarrierText$StatusMode, s);
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
            SimUnknown = new StatusMode("SimUnknown", 8);
            NetworkSearching = new StatusMode("NetworkSearching", 9);
            StatusMode astatusmode[] = new StatusMode[10];
            astatusmode[0] = Normal;
            astatusmode[1] = NetworkLocked;
            astatusmode[2] = SimMissing;
            astatusmode[3] = SimMissingLocked;
            astatusmode[4] = SimPukLocked;
            astatusmode[5] = SimLocked;
            astatusmode[6] = SimPermDisabled;
            astatusmode[7] = SimNotReady;
            astatusmode[8] = SimUnknown;
            astatusmode[9] = NetworkSearching;
            $VALUES = astatusmode;
        }

        private StatusMode(String s, int i)
        {
            super(s, i);
        }
    }


    private static final String TAG = "MediatekCarrierText";
    private static CharSequence mSeparator;
    private KeyguardUpdateMonitorCallback mCallback = new KeyguardUpdateMonitorCallback() {

        private static final int DEFAULT_SIM_ID;
        final MediatekCarrierText this$0;

        public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1)
        {
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("onRefreshCarrierInfo plmn=").append(charsequence).append(", spn=").append(charsequence1).toString());
            mPlmn[0] = charsequence;
            mSpn[0] = charsequence1;
            updateCarrierTextGemini(mSimState[0], mPlmn[0], mSpn[0], 0);
        }

        public void onRefreshCarrierInfoGemini(CharSequence charsequence, CharSequence charsequence1, int i)
        {
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("onRefreshCarrierInfoGemini plmn=").append(charsequence).append(", spn=").append(charsequence1).append(", simId=").append(i).toString());
            if (KeyguardUtils.isValidSimId(i))
            {
                mPlmn[i] = charsequence;
                mSpn[i] = charsequence1;
                updateCarrierTextGemini(mSimState[i], mPlmn[i], mSpn[i], i);
            }
        }

        public void onSearchNetworkUpdate(int i, boolean flag)
        {
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("onSearchNetworkUpdate simId=").append(i).append(", switchOn=").append(flag).toString());
            if (!KeyguardUtils.isValidSimId(i))
                i = 0;
            if (flag)
            {
                String s = getContext().getString(0x205009b);
                mStatusMode[i] = StatusMode.NetworkSearching;
                updateCarrierTextGeminiForSearchNetwork(s, i);
                return;
            } else
            {
                mStatusMode[i] = getStatusForIccState(mSimState[i]);
                updateCarrierTextGemini(mSimState[i], mPlmn[i], mSpn[i], i);
                return;
            }
        }

        public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
        {
            mSimState[0] = state;
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("onSimStateChanged mSimState=").append(state).toString());
            updateCarrierTextGemini(mSimState[0], mPlmn[0], mSpn[0], 0);
        }

        public void onSimStateChangedGemini(com.android.internal.telephony.IccCardConstants.State state, int i)
        {
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("onSimStateChangedGemini simId=").append(i).append(", mSimState=").append(state).toString());
            if (KeyguardUtils.isValidSimId(i))
            {
                mSimState[i] = state;
                updateCarrierTextGemini(mSimState[i], mPlmn[i], mSpn[i], i);
            }
        }

            
            {
                this$0 = MediatekCarrierText.this;
                super();
            }
    }
;
    private TextView mCarrierDivider[];
    private TextView mCarrierView[];
    private LockPatternUtils mLockPatternUtils;
    private CharSequence mPlmn[];
    private com.android.internal.telephony.IccCardConstants.State mSimState[];
    private CharSequence mSpn[];
    private StatusMode mStatusMode[];

    public MediatekCarrierText(Context context)
    {
        this(context, null);
        initMembers();
    }

    public MediatekCarrierText(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        initMembers();
        LayoutInflater layoutinflater = (LayoutInflater)context.getSystemService("layout_inflater");
        if (KeyguardUtils.isGemini())
            layoutinflater.inflate(0x207000b, this, true);
        else
            layoutinflater.inflate(0x207000a, this, true);
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

    private CharSequence getCarrierTextForSimState(com.android.internal.telephony.IccCardConstants.State state, CharSequence charsequence, CharSequence charsequence1)
    {
        if (charsequence == null && charsequence1 == null)
            charsequence = getDefaultPlmn();
        StatusMode statusmode = getStatusForIccState(state);
        static class _cls2
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[];
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
                $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode = new int[StatusMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimUnknown.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror8) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.Normal.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror9) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimNotReady.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror10) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.NetworkLocked.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror11) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimMissing.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror12) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimPermDisabled.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror13) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimMissingLocked.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror14) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimLocked.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror15) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$MediatekCarrierText$StatusMode[StatusMode.SimPukLocked.ordinal()] = 9;
                }
                catch (NoSuchFieldError nosuchfielderror16)
                {
                    return;
                }
            }
        }

        int i = _cls2..SwitchMap.com.android.internal.policy.impl.keyguard.MediatekCarrierText.StatusMode[statusmode.ordinal()];
        CharSequence charsequence2 = null;
        switch (i)
        {
        case 9: // '\t'
            charsequence2 = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040302), charsequence);
            break;

        case 8: // '\b'
            charsequence2 = makeCarrierStringOnEmergencyCapable(getContext().getText(0x1040304), charsequence);
            break;

        case 7: // '\007'
            charsequence2 = makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), charsequence);
            break;

        case 6: // '\006'
            charsequence2 = getContext().getText(0x10402f9);
            break;

        case 5: // '\005'
            charsequence2 = makeCarrierStringOnEmergencyCapable(getContext().getText(0x10402f5), charsequence);
            break;

        case 4: // '\004'
            charsequence2 = makeCarrierStringOnEmergencyCapable(mContext.getText(0x1040301), charsequence);
            break;

        case 3: // '\003'
            charsequence2 = concatenate(charsequence, charsequence1);
            break;

        case 1: // '\001'
        case 2: // '\002'
            charsequence2 = concatenate(charsequence, charsequence1);
            break;
        }
        KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("getCarrierTextForSimState simState=").append(state).append(", PLMN=").append(charsequence).append(", SPN=").append(charsequence1).append(" carrierText=").append(charsequence2).toString());
        return charsequence2;
    }

    private CharSequence getDefaultPlmn()
    {
        return mContext.getResources().getText(0x10402e6);
    }

    private StatusMode getStatusForIccState(com.android.internal.telephony.IccCardConstants.State state)
    {
        if (state == null)
            return StatusMode.SimUnknown;
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
            return StatusMode.SimUnknown;

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

    private void initMembers()
    {
        mCarrierView = new TextView[4];
        mCarrierDivider = new TextView[3];
        mStatusMode = new StatusMode[KeyguardUtils.getNumOfSim()];
        mSimState = new com.android.internal.telephony.IccCardConstants.State[KeyguardUtils.getNumOfSim()];
        mPlmn = new CharSequence[KeyguardUtils.getNumOfSim()];
        mSpn = new CharSequence[KeyguardUtils.getNumOfSim()];
        for (int i = 0; i <= KeyguardUtils.getMaxSimId(); i++)
        {
            mStatusMode[i] = StatusMode.Normal;
            mSimState[i] = com.android.internal.telephony.IccCardConstants.State.READY;
            mPlmn[i] = null;
            mSpn[i] = null;
        }

    }

    private boolean isWifiOnlyDevice()
    {
        boolean flag = ((ConnectivityManager)getContext().getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    private CharSequence makeCarrierStringOnEmergencyCapable(CharSequence charsequence, CharSequence charsequence1)
    {
        if (mLockPatternUtils.isEmergencyCallCapable())
            charsequence = concatenate(charsequence, charsequence1);
        return charsequence;
    }

    private void showOrHideCarrier()
    {
        if (isWifiOnlyDevice())
        {
            for (int l = 0; l <= KeyguardUtils.getMaxSimId(); l++)
                if (mCarrierView[l] != null)
                    mCarrierView[l].setVisibility(8);

            for (int i1 = 0; i1 <= -1 + KeyguardUtils.getMaxSimId(); i1++)
                if (mCarrierDivider[i1] != null)
                    mCarrierDivider[i1].setVisibility(8);

        } else
        {
            int i = 0;
            TextView textview = null;
            TextView textview1 = null;
            for (int j = 0; j <= -1 + KeyguardUtils.getMaxSimId(); j++)
                if (mCarrierDivider[j] != null)
                    mCarrierDivider[j].setVisibility(8);

            for (int k = 0; k <= KeyguardUtils.getMaxSimId(); k++)
            {
                boolean flag;
                if (mStatusMode[k] != StatusMode.SimMissing && mStatusMode[k] != StatusMode.SimMissingLocked && mStatusMode[k] != StatusMode.SimUnknown && KeyguardUpdateMonitor.getInstance(mContext).isSIMInserted(k))
                    flag = false;
                else
                    flag = true;
                if (!flag)
                {
                    if (mCarrierView[k] != null)
                        mCarrierView[k].setVisibility(0);
                    if (++i == 1)
                        textview = mCarrierView[k];
                    else
                    if (i == 2)
                        textview1 = mCarrierView[k];
                    if (i >= 2 && k - 1 >= 0 && mCarrierDivider != null)
                    {
                        mCarrierDivider[k - 1].setVisibility(0);
                        mCarrierDivider[k - 1].setText("|");
                    }
                } else
                if (mCarrierView[k] != null)
                    mCarrierView[k].setVisibility(8);
                if (mCarrierView[k] != null)
                    mCarrierView[k].setGravity(17);
            }

            if (i == 2)
            {
                if (textview != null)
                    textview.setGravity(5);
                if (textview1 != null)
                    textview1.setGravity(3);
            } else
            if (i == 0)
            {
                if (mCarrierView[0] != null)
                    mCarrierView[0].setVisibility(0);
                KeyguardUtils.xlogD("MediatekCarrierText", "updateOperatorInfo, force the slotId 0 to visible.");
                return;
            }
        }
    }

    private void updateCarrierTextGeminiForSearchNetwork(String s, int i)
    {
        KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("updateCarrierTextGeminiForSearchNetwork carrierText=").append(s).append(", simId=").append(i).toString());
        if (isWifiOnlyDevice())
        {
            KeyguardUtils.xlogD("MediatekCarrierText", "updateCarrierTextGeminiForSearchNetwork WifiOnly");
            mCarrierView[0].setVisibility(8);
            return;
        } else
        {
            mCarrierView[i].setText(s);
            showOrHideCarrier();
            return;
        }
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
        if (KeyguardUtils.isGemini())
        {
            mCarrierView[0] = (TextView)findViewById(0x210001e);
            mCarrierView[1] = (TextView)findViewById(0x2100020);
            mCarrierView[2] = (TextView)findViewById(0x2100022);
            mCarrierView[3] = (TextView)findViewById(0x2100024);
            mCarrierDivider[0] = (TextView)findViewById(0x210001f);
            mCarrierDivider[1] = (TextView)findViewById(0x2100021);
            mCarrierDivider[2] = (TextView)findViewById(0x2100023);
            mCarrierView[0].setSelected(true);
            mCarrierView[1].setSelected(true);
            mCarrierView[2].setSelected(true);
            mCarrierView[3].setSelected(true);
            return;
        } else
        {
            mCarrierView[0] = (TextView)findViewById(0x210001e);
            mCarrierView[0].setSelected(true);
            return;
        }
    }

    protected void updateCarrierTextGemini(com.android.internal.telephony.IccCardConstants.State state, CharSequence charsequence, CharSequence charsequence1, int i)
    {
        KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("updateCarrierTextGemini, simState=").append(state).append(", plmn=").append(charsequence).append(", spn=").append(charsequence1).append(", simId=").append(i).toString());
        TextView textview = mCarrierView[i];
        if (StatusMode.NetworkSearching == mStatusMode[i])
        {
            KeyguardUtils.xlogD("MediatekCarrierText", (new StringBuilder()).append("updateCarrierTextGemini, searching network now, don't interrupt it, simState=").append(state).toString());
            return;
        }
        mStatusMode[i] = getStatusForIccState(state);
        if (isWifiOnlyDevice())
        {
            KeyguardUtils.xlogD("MediatekCarrierText", "updateCarrierText WifiOnly");
            mCarrierView[0].setVisibility(8);
            return;
        }
        showOrHideCarrier();
        CharSequence charsequence2 = getCarrierTextForSimState(state, charsequence, charsequence1);
        if (KeyguardViewManager.USE_UPPER_CASE)
        {
            String s;
            if (charsequence2 != null)
                s = charsequence2.toString().toUpperCase();
            else
                s = null;
            textview.setText(s);
            return;
        } else
        {
            textview.setText(charsequence2);
            return;
        }
    }






}
