// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone;

import android.util.Log;
import com.android.internal.telephony.*;
import com.android.phone.*;

// Referenced classes of package com.mediatek.phone:
//            DualTalkUtils

public class InCallMenuState
{

    private static final String TAG = "InCallMenuState";
    public boolean canECT;
    public boolean canHangupActiveAndAnswerWaiting;
    public boolean canHangupAll;
    public boolean canHangupHolding;
    public boolean canMuteRinger;
    public boolean canVTVoiceAnswer;
    protected CallManager mCM;
    protected InCallScreen mInCallScreen;

    public InCallMenuState(InCallScreen incallscreen, CallManager callmanager)
    {
        mInCallScreen = incallscreen;
        mCM = callmanager;
    }

    public static boolean canECT(CallManager callmanager)
    {
        boolean flag = callmanager.hasActiveFgCall();
        boolean flag1 = callmanager.hasActiveBgCall();
        boolean flag2 = callmanager.hasActiveRingingCall();
        DualTalkUtils dualtalkutils = DualTalkUtils.getInstance();
        Call call;
        Call call1;
        if (DualTalkUtils.isSupportDualTalk() && dualtalkutils != null && dualtalkutils.isDualTalkMultipleHoldCase())
        {
            call = dualtalkutils.getActiveFgCall();
            call1 = dualtalkutils.getFirstActiveBgCall();
        } else
        {
            call = callmanager.getActiveFgCall();
            call1 = callmanager.getFirstActiveBgCall();
        }
        if (flag2)
            return false;
        boolean flag3 = false;
        if (flag)
        {
            flag3 = false;
            if (flag1)
            {
                boolean flag4;
                if (call.getPhone().getPhoneType() == 3)
                    flag4 = true;
                else
                    flag4 = false;
                boolean flag5;
                if (call1.getPhone().getPhoneType() == 3)
                    flag5 = true;
                else
                    flag5 = false;
                flag3 = false;
                if (!flag4)
                {
                    flag3 = false;
                    if (!flag5)
                    {
                        Phone phone = call.getPhone();
                        Phone phone1 = call1.getPhone();
                        flag3 = false;
                        if (phone == phone1)
                            flag3 = true;
                    }
                }
            }
        }
        return flag3;
    }

    public static boolean canHangupActiveAndAnswerWaiting(CallManager callmanager)
    {
        Call call = callmanager.getActiveFgCall();
        Call call1 = callmanager.getFirstActiveBgCall();
        Call call2 = callmanager.getFirstActiveRingingCall();
        boolean flag;
        if (call.getState() == com.android.internal.telephony.Call.State.ACTIVE)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (call1.getState() == com.android.internal.telephony.Call.State.IDLE)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (call2.getState() == com.android.internal.telephony.Call.State.WAITING)
            flag2 = true;
        else
            flag2 = false;
        boolean flag3 = false;
        if (flag)
        {
            flag3 = false;
            if (flag1)
            {
                flag3 = false;
                if (flag2)
                {
                    Phone phone = call.getPhone();
                    Phone phone1 = call2.getPhone();
                    flag3 = false;
                    if (phone == phone1)
                    {
                        boolean flag4 = call2.getLatestConnection().isVideo();
                        flag3 = false;
                        if (!flag4)
                            flag3 = true;
                    }
                }
            }
        }
        return flag3;
    }

    public static boolean canHangupAll(CallManager callmanager)
    {
        Call call = callmanager.getActiveFgCall();
        Call call1 = callmanager.getFirstActiveBgCall();
        Call call2 = callmanager.getFirstActiveRingingCall();
        boolean flag = false;
        if (call1 != null)
        {
            com.android.internal.telephony.Call.State state = call1.getState();
            com.android.internal.telephony.Call.State state1 = com.android.internal.telephony.Call.State.HOLDING;
            flag = false;
            if (state == state1)
                if (call != null && call.getState() == com.android.internal.telephony.Call.State.ACTIVE)
                {
                    flag = true;
                } else
                {
                    boolean flag1 = PhoneUtils.hasActivefgEccCall(callmanager);
                    flag = false;
                    if (flag1)
                        flag = true;
                }
        }
        if ((call2.getState() == com.android.internal.telephony.Call.State.INCOMING || call2.getState() == com.android.internal.telephony.Call.State.WAITING) && (call1.getState() == com.android.internal.telephony.Call.State.HOLDING || call.getState() == com.android.internal.telephony.Call.State.ACTIVE))
            flag = true;
        if (!flag && PhoneUtils.hasMultiplePhoneActive())
            flag = true;
        log((new StringBuilder()).append("canHangupAll = ").append(flag).toString());
        return flag;
    }

    public static boolean canHangupHolding(CallManager callmanager)
    {
        return callmanager.getFirstActiveBgCall().getState() != com.android.internal.telephony.Call.State.IDLE;
    }

    public static boolean canIncomingMenuShow(CallManager callmanager)
    {
        return canHangupActiveAndAnswerWaiting(callmanager) || canVTVoiceAnswer();
    }

    public static boolean canMuteRinger()
    {
        return PhoneGlobals.getInstance().ringer.isRinging();
    }

    public static boolean canVTVoiceAnswer()
    {
        return false;
    }

    private static void log(String s)
    {
        Log.d("InCallMenuState", s);
    }

    public void update()
    {
        canHangupAll = canHangupAll(mCM);
        canHangupHolding = canHangupHolding(mCM);
        canHangupActiveAndAnswerWaiting = canHangupActiveAndAnswerWaiting(mCM);
        canECT = canECT(mCM);
        canVTVoiceAnswer = canVTVoiceAnswer();
        canMuteRinger = canMuteRinger();
    }
}
