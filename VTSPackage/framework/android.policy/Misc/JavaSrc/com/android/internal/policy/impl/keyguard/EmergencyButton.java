// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.PowerManager;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.policy.IKeyguardUtilExt;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUtils, KeyguardUpdateMonitor, KeyguardViewManager, KeyguardUpdateMonitorCallback

public class EmergencyButton extends Button
{

    private static final String ACTION_EMERGENCY_DIAL = "com.android.phone.EmergencyDialer.DIAL";
    private static final int EMERGENCY_CALL_TIMEOUT = 10000;
    private static final String TAG = "EmergencyButton";
    KeyguardUpdateMonitorCallback mInfoCallback = new KeyguardUpdateMonitorCallback() {

        final EmergencyButton this$0;

        void onPhoneStateChanged(int i)
        {
            com.android.internal.telephony.IccCardConstants.State state = KeyguardUpdateMonitor.getInstance(
// JavaClassFileOutputException: get_constant: invalid tag

        public void onRefreshCarrierInfo(CharSequence charsequence, CharSequence charsequence1)
        {
            KeyguardUtils.xlogD("EmergencyButton", (new StringBuilder()).append("onRefreshCarrierInfo plmn=").append(charsequence).append(", spn=").append(charsequence1).toString());
            int i = KeyguardUpdateMonitor.getInstance(
// JavaClassFileOutputException: get_constant: invalid tag

        public void onRefreshCarrierInfoGemini(CharSequence charsequence, CharSequence charsequence1, int i)
        {
            KeyguardUtils.xlogD("EmergencyButton", (new StringBuilder()).append("onRefreshCarrierInfoGemini plmn=").append(charsequence).append(", spn=").append(charsequence1).append(", simId=").append(i).toString());
            int j = KeyguardUpdateMonitor.getInstance(
// JavaClassFileOutputException: get_constant: invalid tag

        public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
        {
            int i = KeyguardUpdateMonitor.getInstance(
// JavaClassFileOutputException: get_constant: invalid tag

        public void onSimStateChangedGemini(com.android.internal.telephony.IccCardConstants.State state, int i)
        {
            int j = KeyguardUpdateMonitor.getInstance(
// JavaClassFileOutputException: get_constant: invalid tag

            
            {
                this$0 = EmergencyButton.this;
                super();
            }
    }
;
    private boolean mIsSecure;
    private IKeyguardUtilExt mKeyguardUtilExt;
    private LockPatternUtils mLockPatternUtils;
    private PowerManager mPowerManager;

    public EmergencyButton(Context context)
    {
        this(context, null);
    }

    public EmergencyButton(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        try
        {
            mKeyguardUtilExt = (IKeyguardUtilExt)MediatekClassFactory.createInstance(com/mediatek/common/policy/IKeyguardUtilExt, new Object[0]);
            return;
        }
        catch (Exception exception)
        {
            exception.printStackTrace();
        }
    }

    private boolean eccButtonShouldShow()
    {
        String s = getContext().getResources().getText(0x10402e6).toString();
        Log.i("EmergencyButton", (new StringBuilder()).append("plmnDefaultStr = ").append(s).toString());
        for (int i = 0; i <= KeyguardUtils.getMaxSimId();)
        {
            CharSequence charsequence = KeyguardUpdateMonitor.getInstance(getContext()).getTelephonyPlmn(i);
            CharSequence charsequence1 = KeyguardUpdateMonitor.getInstance(getContext()).getTelephonySpn(i);
            boolean flag;
            if (charsequence != null && !charsequence.toString().equals(s))
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (charsequence1 != null && !charsequence1.toString().equals(s))
                flag1 = true;
            else
                flag1 = false;
            if (!flag && !flag1)
                i++;
            else
                return true;
        }

        return false;
    }

    private void updateEmergencyCallButton(com.android.internal.telephony.IccCardConstants.State state, int i)
    {
        boolean flag1;
        if (i == 2)
        {
            flag1 = true;
        } else
        {
            boolean flag = mLockPatternUtils.isEmergencyCallCapable();
            flag1 = false;
            if (flag)
                if (KeyguardUpdateMonitor.getInstance(mContext).isSimLocked())
                    flag1 = mLockPatternUtils.isEmergencyCallEnabledWhileSimLocked();
                else
                    flag1 = mIsSecure;
        }
        boolean flag2 = KeyguardUpdateMonitor.getInstance(getContext()).dmIsLocked();
        boolean flag3 = mKeyguardUtilExt.shouldShowEmergencyBtnForVoiceOn();
        boolean flag4 = eccButtonShouldShow();
        boolean flag5;
        if ((flag1 || flag3 || flag2) && flag4)
            flag5 = true;
        else
            flag5 = false;
        Log.i("EmergencyButton", (new StringBuilder()).append("enabled= ").append(flag5).append(", dmLocked=").append(flag2).append(", keyguardUtilShowEcc=").append(flag3).append(", eccShouldShow=").append(flag4).toString());
        mLockPatternUtils.updateEmergencyCallButtonState(this, i, flag5, KeyguardViewManager.USE_UPPER_CASE, false);
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        KeyguardUpdateMonitor.getInstance(mContext).registerCallback(mInfoCallback);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        KeyguardUpdateMonitor.getInstance(mContext).removeCallback(mInfoCallback);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mLockPatternUtils = new LockPatternUtils(mContext);
        mPowerManager = (PowerManager)mContext.getSystemService("power");
        setOnClickListener(new android.view.View.OnClickListener() {

            final EmergencyButton this$0;

            public void onClick(View view)
            {
                takeEmergencyCallAction();
            }

            
            {
                this$0 = EmergencyButton.this;
                super();
            }
        }
);
        int i = KeyguardUpdateMonitor.getInstance(mContext).getPhoneState();
        com.android.internal.telephony.IccCardConstants.State state = KeyguardUpdateMonitor.getInstance(mContext).getSimState();
        mIsSecure = mLockPatternUtils.isSecure();
        updateEmergencyCallButton(state, i);
    }

    public void takeEmergencyCallAction()
    {
        mPowerManager.userActivity(SystemClock.uptimeMillis(), true);
        if (TelephonyManager.getDefault().getCallState() == 2)
        {
            mLockPatternUtils.resumeCall();
            return;
        } else
        {
            Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
            intent.setFlags(0x10800000);
            getContext().startActivity(intent);
            return;
        }
    }








}
