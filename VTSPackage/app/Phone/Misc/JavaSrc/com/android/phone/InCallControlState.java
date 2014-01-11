// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.telephony.PhoneNumberUtils;
import android.util.Log;
import com.android.internal.telephony.*;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.phone.ext.IInCallControlState;

// Referenced classes of package com.android.phone:
//            PhoneUtils, InCallScreen

public class InCallControlState
    implements IInCallControlState
{

    private static final boolean DBG = true;
    private static final String LOG_TAG = "InCallControlState";
    public boolean bluetoothEnabled;
    public boolean bluetoothIndicatorOn;
    public boolean canAddCall;
    public boolean canEndCall;
    public boolean canHold;
    public boolean canMerge;
    public boolean canMute;
    public boolean canShowSwap;
    public boolean canSwap;
    public boolean contactsEnabled;
    public boolean dialpadEnabled;
    public boolean dialpadVisible;
    private CallManager mCM;
    private InCallScreen mInCallScreen;
    public boolean manageConferenceEnabled;
    public boolean manageConferenceVisible;
    public boolean muteIndicatorOn;
    public boolean onHold;
    public boolean speakerEnabled;
    public boolean speakerOn;
    public boolean supportsHold;

    public InCallControlState(InCallScreen incallscreen, CallManager callmanager)
    {
        log("InCallControlState constructor...");
        mInCallScreen = incallscreen;
        mCM = callmanager;
    }

    private void log(String s)
    {
        Log.d("InCallControlState", s);
    }

    public boolean canAddCall()
    {
        return canAddCall;
    }

    public boolean canEndCall()
    {
        return canEndCall;
    }

    public boolean canHold()
    {
        return canHold;
    }

    public boolean canMerge()
    {
        return canMerge;
    }

    public boolean canMute()
    {
        return canMute;
    }

    public boolean canShowSwap()
    {
        return canShowSwap;
    }

    public boolean canSwap()
    {
        return canSwap;
    }

    public void dumpState()
    {
        log("InCallControlState:");
        log((new StringBuilder()).append("  manageConferenceVisible: ").append(manageConferenceVisible).toString());
        log((new StringBuilder()).append("  manageConferenceEnabled: ").append(manageConferenceEnabled).toString());
        log((new StringBuilder()).append("  canAddCall: ").append(canAddCall).toString());
        log((new StringBuilder()).append("  canEndCall: ").append(canEndCall).toString());
        log((new StringBuilder()).append("  canSwap: ").append(canSwap).toString());
        log((new StringBuilder()).append("  canShowSwap: ").append(canShowSwap).toString());
        log((new StringBuilder()).append("  canMerge: ").append(canMerge).toString());
        log((new StringBuilder()).append("  bluetoothEnabled: ").append(bluetoothEnabled).toString());
        log((new StringBuilder()).append("  bluetoothIndicatorOn: ").append(bluetoothIndicatorOn).toString());
        log((new StringBuilder()).append("  speakerEnabled: ").append(speakerEnabled).toString());
        log((new StringBuilder()).append("  speakerOn: ").append(speakerOn).toString());
        log((new StringBuilder()).append("  canMute: ").append(canMute).toString());
        log((new StringBuilder()).append("  muteIndicatorOn: ").append(muteIndicatorOn).toString());
        log((new StringBuilder()).append("  dialpadEnabled: ").append(dialpadEnabled).toString());
        log((new StringBuilder()).append("  dialpadVisible: ").append(dialpadVisible).toString());
        log((new StringBuilder()).append("  onHold: ").append(onHold).toString());
        log((new StringBuilder()).append("  canHold: ").append(canHold).toString());
    }

    public boolean isBluetoothEnabled()
    {
        return bluetoothEnabled;
    }

    public boolean isBluetoothIndicatorOn()
    {
        return bluetoothIndicatorOn;
    }

    public boolean isContactsEnabled()
    {
        return contactsEnabled;
    }

    public boolean isDialpadEnabled()
    {
        return dialpadEnabled;
    }

    public boolean isDialpadVisible()
    {
        return dialpadVisible;
    }

    public boolean isManageConferenceEnabled()
    {
        return manageConferenceEnabled;
    }

    public boolean isManageConferenceVisible()
    {
        return manageConferenceVisible;
    }

    public boolean isMuteIndicatorOn()
    {
        return muteIndicatorOn;
    }

    public boolean isSpeakerEnabled()
    {
        return speakerEnabled;
    }

    public boolean isSpeakerOn()
    {
        return speakerOn;
    }

    public boolean onHold()
    {
        return onHold;
    }

    public boolean supportsHold()
    {
        return supportsHold;
    }

    public void update()
    {
label0:
        {
            boolean flag;
            com.android.internal.telephony.Call.State state1;
label1:
            {
                boolean flag9;
label2:
                {
                    com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
                    Call call = mCM.getActiveFgCall();
                    flag = mCM.hasActiveBgCall();
                    boolean flag1;
                    if (call != null)
                    {
                        state1 = call.getState();
                        if (state1 == com.android.internal.telephony.Call.State.ACTIVE)
                            flag1 = true;
                        else
                            flag1 = false;
                    } else
                    {
                        state1 = com.android.internal.telephony.Call.State.IDLE;
                        flag1 = false;
                    }
                    if (state1 != com.android.internal.telephony.Call.State.DIALING && state1 != com.android.internal.telephony.Call.State.ALERTING)
                        contactsEnabled = true;
                    else
                        contactsEnabled = false;
                    if (com.android.internal.telephony.Call.State.IDLE != call.getState() && TelephonyCapabilities.supportsConferenceCallManagement(call.getPhone()))
                    {
                        manageConferenceVisible = PhoneUtils.isConferenceCall(call);
                        boolean flag11;
                        if (manageConferenceVisible && !mInCallScreen.isManageConferenceMode())
                            flag11 = true;
                        else
                            flag11 = false;
                        manageConferenceEnabled = flag11;
                    } else
                    if (flag && TelephonyCapabilities.supportsConferenceCallManagement(mCM.getBgPhone()))
                    {
                        manageConferenceVisible = false;
                        boolean flag10;
                        if (manageConferenceVisible && !mInCallScreen.isManageConferenceMode())
                            flag10 = true;
                        else
                            flag10 = false;
                        manageConferenceEnabled = flag10;
                    } else
                    {
                        manageConferenceVisible = false;
                        manageConferenceEnabled = false;
                    }
                    canAddCall = PhoneUtils.okToAddCall(mCM);
                    boolean flag2;
                    if (!mCM.hasActiveFgCall() && !mCM.hasActiveRingingCall() && !mCM.hasActiveBgCall())
                        flag2 = false;
                    else
                        flag2 = true;
                    canEndCall = flag2;
                    canShowSwap = PhoneUtils.okToShowSwapButton(mCM);
                    canSwap = PhoneUtils.okToSwapCalls(mCM);
                    if (DualTalkUtils.isSupportDualTalk() && DualTalkUtils.getInstance().hasDualHoldCallsOnly())
                        canSwap = true;
                    canMerge = PhoneUtils.okToMergeCalls(mCM);
                    if (mInCallScreen.isBluetoothAvailable())
                    {
                        bluetoothEnabled = true;
                        bluetoothIndicatorOn = mInCallScreen.isBluetoothAudioConnectedOrPending();
                    } else
                    {
                        bluetoothEnabled = false;
                        bluetoothIndicatorOn = false;
                    }
                    boolean flag3;
                    if (state != com.android.internal.telephony.PhoneConstants.State.IDLE)
                        flag3 = true;
                    else
                        flag3 = false;
                    speakerEnabled = flag3;
                    speakerOn = PhoneUtils.isSpeakerOn(mInCallScreen);
                    Connection connection;
                    if (call != null)
                        connection = call.getLatestConnection();
                    else
                        connection = null;
                    boolean flag4 = false;
                    if (connection != null)
                        flag4 = PhoneNumberUtils.isEmergencyNumber(connection.getAddress());
                    boolean flag5 = PhoneUtils.isPhoneInEcm(call.getPhone());
                    if (!flag4 && !flag5)
                    {
                        canMute = flag1;
                        muteIndicatorOn = PhoneUtils.getMute();
                    } else
                    {
                        canMute = false;
                        muteIndicatorOn = false;
                    }
                    dialpadEnabled = mInCallScreen.okToShowDialpad();
                    dialpadVisible = mInCallScreen.isDialerOpened();
                    if (DualTalkUtils.isSupportDualTalk() && DualTalkUtils.getInstance().isCdmaAndGsmActive())
                    {
                        canHold = false;
                        break label0;
                    }
                    if (call == null || !TelephonyCapabilities.supportsHoldAndUnhold(call.getPhone()))
                        break label1;
                    supportsHold = true;
                    boolean flag6;
                    if (flag && state1 == com.android.internal.telephony.Call.State.IDLE && !PhoneUtils.holdAndActiveFromDifPhone(mCM))
                        flag6 = true;
                    else
                        flag6 = false;
                    onHold = flag6;
                    boolean flag7;
                    if (flag1 && !flag)
                        flag7 = true;
                    else
                        flag7 = false;
                    boolean flag8 = onHold;
                    if (!flag7)
                    {
                        flag9 = false;
                        if (!flag8)
                            break label2;
                    }
                    flag9 = true;
                }
                canHold = flag9;
                break label0;
            }
            if (flag && state1 == com.android.internal.telephony.Call.State.IDLE)
            {
                Call call1 = mCM.getFirstActiveBgCall();
                if (call1 != null && TelephonyCapabilities.supportsHoldAndUnhold(call1.getPhone()))
                {
                    supportsHold = true;
                    onHold = true;
                    canHold = true;
                }
            } else
            {
                supportsHold = false;
                onHold = false;
                canHold = false;
            }
        }
        dumpState();
    }
}
