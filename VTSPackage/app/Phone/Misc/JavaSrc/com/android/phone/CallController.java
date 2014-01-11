// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Intent;
import android.net.Uri;
import android.os.*;
import android.telephony.PhoneNumberUtils;
import android.telephony.ServiceState;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.sip.SipPhone;
import com.mediatek.phone.DualTalkUtils;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.telephony.PhoneNumberUtilsEx;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, OtaUtils, CallNotifier, InCallUiState, 
//            PhoneUtils, EmergencyCallHelper, CdmaPhoneCallState

public class CallController extends Handler
{

    private static final boolean DBG = true;
    private static final int PHONE_STATE_CHANGED = 10;
    private static final int RESEND_ECC_CALL = 100;
    private static final String TAG = "CallController";
    private static final int THREEWAY_CALLERINFO_DISPLAY_DONE = 1;
    private static final int THREEWAY_CALLERINFO_DISPLAY_TIME = 3000;
    private static final boolean VDBG = true;
    private static CallController sInstance;
    private PhoneGlobals mApp;
    private CallManager mCM;
    private Intent mCallIntent;
    private EmergencyCallHelper mEmergencyCallHelper;

    private CallController(PhoneGlobals phoneglobals)
    {
        log((new StringBuilder()).append("CallController constructor: app = ").append(phoneglobals).toString());
        mApp = phoneglobals;
        mCM = phoneglobals.mCM;
    }

    private void checkForOtaspCall(Intent intent)
    {
        if (OtaUtils.isOtaspCallIntent(intent))
        {
            Log.i("CallController", (new StringBuilder()).append("checkForOtaspCall: handling OTASP intent! ").append(intent).toString());
            OtaUtils.setupOtaspCall(intent);
            return;
        } else
        {
            log("checkForOtaspCall: not an OTASP call.");
            return;
        }
    }

    private Constants.CallStatusCode checkIfOkToInitiateOutgoingCall(int i)
    {
        log((new StringBuilder()).append("checkIfOkToInitiateOutgoingCall: ServiceState = ").append(i).toString());
        switch (i)
        {
        case 1: // '\001'
            return Constants.CallStatusCode.OUT_OF_SERVICE;

        case 2: // '\002'
            return Constants.CallStatusCode.EMERGENCY_ONLY;

        case 3: // '\003'
            return Constants.CallStatusCode.POWER_OFF;

        case 0: // '\0'
            return Constants.CallStatusCode.SUCCESS;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unexpected ServiceState: ").append(i).toString());
    }

    private Constants.CallStatusCode checkIfOkToInitiateOutgoingCall(int i, int j)
    {
        log((new StringBuilder()).append("checkIfOkToInitiateOutgoingCall, state = ").append(i).append(" slot = ").append(j).toString());
        if (GeminiUtils.isGeminiSupport() && GeminiUtils.isValidSlot(j))
        {
            GeminiPhone geminiphone = (GeminiPhone)PhoneGlobals.getInstance().phone;
            if (!DualTalkUtils.isSupportDualTalk())
            {
                int ai[] = GeminiUtils.getSlots();
                int l = ai.length;
                for (int i1 = 0; i1 < l; i1++)
                {
                    int j1 = ai[i1];
                    if (j1 != j && geminiphone.getStateGemini(j1) != com.android.internal.telephony.PhoneConstants.State.IDLE)
                        return Constants.CallStatusCode.CALL_FAILED;
                }

            }
            if (DualTalkUtils.isSupportDualTalk())
            {
                if (mApp.notifier.mDualTalk == null)
                    mApp.notifier.mDualTalk = DualTalkUtils.getInstance();
                if (!mApp.notifier.mDualTalk.isPhoneCallAllowed(j))
                    return Constants.CallStatusCode.CALL_FAILED;
            }
            int k = geminiphone.getServiceStateGemini(j).getState();
            log((new StringBuilder()).append("realState = ").append(k).toString());
            return checkIfOkToInitiateOutgoingCall(k);
        } else
        {
            return checkIfOkToInitiateOutgoingCall(i);
        }
    }

    private void handleOutgoingCallError(Constants.CallStatusCode callstatuscode)
    {
        log((new StringBuilder()).append("handleOutgoingCallError(): status = ").append(callstatuscode).toString());
        InCallUiState incalluistate = mApp.inCallUiState;
        static class _cls1
        {

            static final int $SwitchMap$com$android$phone$Constants$CallStatusCode[];

            static 
            {
                $SwitchMap$com$android$phone$Constants$CallStatusCode = new int[Constants.CallStatusCode.values().length];
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.SUCCESS.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.EXITED_ECM.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.DROP_VOICECALL.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.VOICEMAIL_NUMBER_MISSING.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.POWER_OFF.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.EMERGENCY_ONLY.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror5) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.OUT_OF_SERVICE.ordinal()] = 7;
                }
                catch (NoSuchFieldError nosuchfielderror6) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.NO_PHONE_NUMBER_SUPPLIED.ordinal()] = 8;
                }
                catch (NoSuchFieldError nosuchfielderror7) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.DIALED_MMI.ordinal()] = 9;
                }
                catch (NoSuchFieldError nosuchfielderror8) { }
                try
                {
                    $SwitchMap$com$android$phone$Constants$CallStatusCode[Constants.CallStatusCode.CALL_FAILED.ordinal()] = 10;
                }
                catch (NoSuchFieldError nosuchfielderror9)
                {
                    return;
                }
            }
        }

        switch (_cls1..SwitchMap.com.android.phone.Constants.CallStatusCode[callstatuscode.ordinal()])
        {
        case 10: // '\n'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.CALL_FAILED);
            return;

        case 9: // '\t'
            if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
            {
                Toast.makeText(mApp, 0x7f0d02d9, 0).show();
                return;
            }
            break;

        case 8: // '\b'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.NO_PHONE_NUMBER_SUPPLIED);
            return;

        case 7: // '\007'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.OUT_OF_SERVICE);
            return;

        case 6: // '\006'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.EMERGENCY_ONLY);
            return;

        case 5: // '\005'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.POWER_OFF);
            return;

        case 4: // '\004'
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.VOICEMAIL_NUMBER_MISSING);
            return;

        case 1: // '\001'
            Log.wtf("CallController", "handleOutgoingCallError: SUCCESS isn't an error");
            return;

        case 2: // '\002'
        case 3: // '\003'
        default:
            Log.wtf("CallController", (new StringBuilder()).append("handleOutgoingCallError: unexpected status code ").append(callstatuscode).toString());
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.CALL_FAILED);
            break;
        }
    }

    static CallController init(PhoneGlobals phoneglobals)
    {
        com/android/phone/CallController;
        JVM INSTR monitorenter ;
        if (sInstance != null)
            break MISSING_BLOCK_LABEL_29;
        sInstance = new CallController(phoneglobals);
_L1:
        CallController callcontroller = sInstance;
        com/android/phone/CallController;
        JVM INSTR monitorexit ;
        return callcontroller;
        Log.wtf("CallController", (new StringBuilder()).append("init() called multiple times!  sInstance = ").append(sInstance).toString());
          goto _L1
        Exception exception;
        exception;
        com/android/phone/CallController;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private static void log(String s)
    {
        Log.d("CallController", s);
    }

    private Constants.CallStatusCode placeCallInternal(Intent intent)
    {
        InCallUiState incalluistate;
        int i;
        String s1;
        Phone phone;
        boolean flag;
        boolean flag1;
        Constants.CallStatusCode callstatuscode1;
label0:
        {
            log((new StringBuilder()).append("placeCallInternal()...  intent = ").append(intent).toString());
            incalluistate = mApp.inCallUiState;
            Uri uri = intent.getData();
            String s;
            Constants.CallStatusCode callstatuscode;
            if (uri != null)
                s = uri.getScheme();
            else
                s = null;
            i = intent.getIntExtra("com.android.phone.extra.slot", 0);
            log((new StringBuilder()).append("placeCallInternal()...  slot = ").append(i).toString());
            callstatuscode = checkIfOkToInitiateOutgoingCall(mCM.getServiceState());
            try
            {
                s1 = PhoneUtils.getInitialNumber(intent);
                log((new StringBuilder()).append("- actual number to dial: '").append(s1).append("'").toString());
                String s2 = intent.getStringExtra("android.phone.extra.SIP_PHONE_URI");
                phone = PhoneUtils.pickPhoneBasedOnNumber(mCM, s, s1, s2);
                log((new StringBuilder()).append("- got Phone instance: ").append(phone).append(", class = ").append(phone.getClass()).toString());
            }
            catch (PhoneUtils.VoiceMailNumberMissingException voicemailnumbermissingexception)
            {
                if (callstatuscode != Constants.CallStatusCode.SUCCESS)
                {
                    log("Voicemail number not reachable in current SIM card state.");
                    return callstatuscode;
                } else
                {
                    log("VoiceMailNumberMissingException from getInitialNumber()");
                    return Constants.CallStatusCode.VOICEMAIL_NUMBER_MISSING;
                }
            }
            if (s1 == null)
            {
                Log.w("CallController", (new StringBuilder()).append("placeCall: couldn't get a phone number from Intent ").append(intent).toString());
                return Constants.CallStatusCode.NO_PHONE_NUMBER_SUPPLIED;
            }
            flag = PhoneNumberUtils.isEmergencyNumber(s1);
            flag1 = "android.intent.action.CALL_EMERGENCY".equals(intent.getAction());
            if (flag && false)
                intent.putExtra("com.android.phone.extra.video", false);
            if (!flag && flag1)
            {
                Log.e("CallController", (new StringBuilder()).append("Received CALL_EMERGENCY Intent ").append(intent).append(" with non-potential-emergency number ").append(s1).append(" -- failing call.").toString());
                return Constants.CallStatusCode.CALL_FAILED;
            }
            if (GeminiUtils.isGeminiSupport() && flag)
                i = GeminiRegister.pickBestSlotForEmergencyCall(PhoneGlobals.getPhone(), s1);
            Constants.CallStatusCode callstatuscode2;
            Constants.CallStatusCode callstatuscode3;
            Constants.CallStatusCode callstatuscode4;
            if (phone instanceof SipPhone)
            {
                callstatuscode1 = checkIfOkToInitiateOutgoingCall(phone.getServiceState().getState());
                if (DualTalkUtils.isSupportDualTalk())
                {
                    if (mApp.notifier.mDualTalk == null)
                        mApp.notifier.mDualTalk = DualTalkUtils.getInstance();
                    if (!mApp.notifier.mDualTalk.isPhoneCallAllowed(phone))
                        callstatuscode1 = Constants.CallStatusCode.CALL_FAILED;
                }
            } else
            {
                callstatuscode1 = checkIfOkToInitiateOutgoingCall(phone.getServiceState().getState(), i);
            }
            if (!flag)
                break label0;
            callstatuscode4 = Constants.CallStatusCode.EMERGENCY_ONLY;
            if (callstatuscode1 != callstatuscode4)
            {
                Constants.CallStatusCode callstatuscode5 = Constants.CallStatusCode.OUT_OF_SERVICE;
                if (callstatuscode1 != callstatuscode5)
                    break label0;
            }
            log((new StringBuilder()).append("placeCall: Emergency number detected with status = ").append(callstatuscode1).toString());
            callstatuscode1 = Constants.CallStatusCode.SUCCESS;
            log((new StringBuilder()).append("==> UPDATING status to: ").append(callstatuscode1).toString());
        }
        callstatuscode2 = Constants.CallStatusCode.SUCCESS;
        if (callstatuscode1 == callstatuscode2)
            break MISSING_BLOCK_LABEL_666;
        if (!flag)
            break MISSING_BLOCK_LABEL_639;
        callstatuscode3 = Constants.CallStatusCode.POWER_OFF;
        if (callstatuscode1 != callstatuscode3)
            break MISSING_BLOCK_LABEL_639;
        Log.i("CallController", "placeCall: Trying to make emergency call while POWER_OFF!");
        this;
        JVM INSTR monitorenter ;
        if (mEmergencyCallHelper == null)
            mEmergencyCallHelper = new EmergencyCallHelper(this);
        this;
        JVM INSTR monitorexit ;
        mEmergencyCallHelper.startEmergencyCallFromAirplaneModeSequence(s1);
        return Constants.CallStatusCode.SUCCESS;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        log((new StringBuilder()).append("==> placeCallInternal(): non-success status: ").append(callstatuscode1).toString());
        return callstatuscode1;
        incalluistate.needToShowCallLostDialog = false;
        incalluistate.clearProgressIndication();
        Uri uri1 = intent.getData();
        int j;
        if (GeminiUtils.isGeminiSupport())
        {
            PhoneGlobals phoneglobals1 = mApp;
            boolean flag6;
            if (flag || flag1)
                flag6 = true;
            else
                flag6 = false;
            j = PhoneUtils.placeCallGemini(phoneglobals1, phone, s1, uri1, flag6, incalluistate.providerGatewayUri, i);
        } else
        {
            PhoneGlobals phoneglobals = mApp;
            boolean flag2;
            if (flag || flag1)
                flag2 = true;
            else
                flag2 = false;
            j = PhoneUtils.placeCall(phoneglobals, phone, s1, uri1, flag2, incalluistate.providerGatewayUri);
        }
        switch (j)
        {
        default:
            Log.wtf("CallController", (new StringBuilder()).append("placeCall: unknown callStatus ").append(j).append(" from PhoneUtils.placeCall() for number '").append(s1).append("'.").toString());
            return Constants.CallStatusCode.SUCCESS;

        case 0: // '\0'
            log((new StringBuilder()).append("placeCall: PhoneUtils.placeCall() succeeded for regular call '").append(s1).append("'.").toString());
            log((new StringBuilder()).append("- inCallUiState.inCallScreenMode = ").append(incalluistate.inCallScreenMode).toString());
            if (incalluistate.inCallScreenMode == InCallUiState.InCallScreenMode.OTA_NORMAL)
            {
                log("==>  OTA_NORMAL note: switching to OTA_STATUS_LISTENING.");
                mApp.cdmaOtaScreenState.otaScreenState = OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_LISTENING;
            }
            boolean flag3 = PhoneUtils.isVoicemailNumber(s1, i, phone);
            incalluistate.showDialpad = flag3;
            String s3;
            boolean flag4;
            boolean flag5;
            if (flag3)
                s3 = phone.getVoiceMailAlphaTag();
            else
                s3 = "";
            incalluistate.dialpadContextText = s3;
            incalluistate.dialpadDigits = null;
            flag4 = PhoneUtils.isPhoneInEcm(phone);
            flag5 = false;
            if (flag4)
            {
                flag5 = false;
                if (!flag)
                {
                    Log.i("CallController", "About to exit ECM because of an outgoing non-emergency call");
                    flag5 = true;
                }
            }
            if (phone.getPhoneType() == 2 && mApp.cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE)
            {
                PhoneUtils.setMute(false);
                mApp.cdmaPhoneCallState.setThreeWayCallOrigState(true);
                sendEmptyMessageDelayed(1, 3000L);
            }
            if (flag5)
                return Constants.CallStatusCode.EXITED_ECM;
            else
                return Constants.CallStatusCode.SUCCESS;

        case 1: // '\001'
            log((new StringBuilder()).append("placeCall: specified number was an MMI code: '").append(s1).append("'.").toString());
            PhoneUtils.restoreMuteState();
            return Constants.CallStatusCode.DIALED_MMI;

        case 2: // '\002'
            Log.w("CallController", (new StringBuilder()).append("placeCall: PhoneUtils.placeCall() FAILED for number '").append(s1).append("'.").toString());
            return Constants.CallStatusCode.CALL_FAILED;

        case 3: // '\003'
            Log.w("CallController", (new StringBuilder()).append("DROP_VOICECALL:").append(s1).toString());
            return Constants.CallStatusCode.DROP_VOICECALL;
        }
    }

    public void handleMessage(Message message)
    {
        log((new StringBuilder()).append("handleMessage: ").append(message).toString());
        switch (message.what)
        {
        case 100: // 'd'
            log("real re-send the ecc call!");
            placeCall(mCallIntent);
            return;

        case 10: // '\n'
            com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
            log((new StringBuilder()).append("handleMessage: PHONE_STATE_CHANGED with state = ").append(state).toString());
            if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                Object obj;
                if (GeminiUtils.isGeminiSupport())
                    obj = PhoneGlobals.getInstance().mCMGemini;
                else
                    obj = mCM;
                GeminiRegister.unregisterForDisconnect(obj, this);
                log("re-send the ecc call!");
                sendMessageDelayed(obtainMessage(100), 200L);
                return;
            } else
            {
                log("handleMessage: PHONE_STATE_CHANGED continue waiting...");
                return;
            }

        case 1: // '\001'
            log("THREEWAY_CALLERINFO_DISPLAY_DONE...");
            if (mApp.cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE)
            {
                mApp.cdmaPhoneCallState.setThreeWayCallOrigState(false);
                mApp.updateInCallScreen();
                return;
            }
            break;

        default:
            Log.wtf("CallController", (new StringBuilder()).append("handleMessage: unexpected code: ").append(message).toString());
            break;
        }
    }

    public void placeCall(Intent intent)
    {
        InCallUiState incalluistate;
        boolean flag;
        String s2;
        Constants.CallStatusCode callstatuscode;
        log((new StringBuilder()).append("placeCall()...  intent = ").append(intent).toString());
        log((new StringBuilder()).append("                extras = ").append(intent.getExtras()).toString());
        incalluistate = mApp.inCallUiState;
        flag = false;
        if (intent == null)
        {
            Log.wtf("CallController", "placeCall: called with null intent");
            throw new IllegalArgumentException("placeCall: called with null intent");
        }
        String s = intent.getAction();
        Uri uri = intent.getData();
        if (uri == null)
        {
            Log.wtf("CallController", "placeCall: intent had no data");
            throw new IllegalArgumentException("placeCall: intent had no data");
        }
        String s1 = uri.getScheme();
        s2 = PhoneNumberUtils.getNumberFromIntent(intent, mApp);
        log((new StringBuilder()).append("- action: ").append(s).toString());
        log((new StringBuilder()).append("- uri: ").append(uri).toString());
        log((new StringBuilder()).append("- scheme: ").append(s1).toString());
        log((new StringBuilder()).append("- number: ").append(s2).toString());
        boolean flag1;
        com.android.internal.telephony.PhoneConstants.State state;
        if (PhoneNumberUtils.isEmergencyNumber(s2) && !PhoneNumberUtilsEx.isSpecialEmergencyNumber(s2))
            flag1 = true;
        else
            flag1 = false;
        state = mCM.getState();
        if (flag1 && state != com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            Call call = mCM.getActiveFgCall();
            Connection connection = call.getEarliestConnection();
            String s5;
            Call call1;
            Connection connection1;
            String s6;
            if (connection != null)
                s5 = connection.getAddress();
            else
                s5 = null;
            call1 = mCM.getFirstActiveBgCall();
            connection1 = call1.getEarliestConnection();
            if (connection1 != null)
                s6 = connection1.getAddress();
            else
                s6 = null;
            if (call != null && call.getState().isAlive() && (!PhoneUtils.isEccCall(call) || PhoneNumberUtilsEx.isSpecialEmergencyNumber(s5)) || call1 != null && call1.getState().isAlive() && (!PhoneUtils.isEccCall(call1) || PhoneNumberUtilsEx.isSpecialEmergencyNumber(s6)))
            {
                Object obj;
                if (GeminiUtils.isGeminiSupport())
                    obj = PhoneGlobals.getInstance().mCMGemini;
                else
                    obj = mCM;
                GeminiRegister.registerForDisconnect(obj, this, 10);
                mCallIntent = intent;
                try
                {
                    mCM.hangupAllEx();
                    log("Waiting for disconnect exist calls.");
                    return;
                }
                catch (CallStateException callstateexception)
                {
                    log((new StringBuilder()).append("catch exception = ").append(callstateexception).toString());
                }
            } else
            {
                log("Let's FW reject the call request.");
            }
        }
        if (!"android.intent.action.CALL".equals(s) && !"android.intent.action.CALL_EMERGENCY".equals(s) && !"android.intent.action.CALL_PRIVILEGED".equals(s))
        {
            Log.wtf("CallController", (new StringBuilder()).append("placeCall: unexpected intent action ").append(s).toString());
            throw new IllegalArgumentException((new StringBuilder()).append("Unexpected action: ").append(s).toString());
        }
        if (TelephonyCapabilities.supportsOtasp(mApp.mCM.getDefaultPhone()))
            checkForOtaspCall(intent);
        mApp.setRestoreMuteOnInCallResume(false);
        PhoneGlobals phoneglobals;
        if (PhoneUtils.hasPhoneProviderExtras(intent))
            incalluistate.setProviderInfo(intent);
        else
            incalluistate.clearProviderInfo();
        callstatuscode = placeCallInternal(intent);
        _cls1..SwitchMap.com.android.phone.Constants.CallStatusCode[callstatuscode.ordinal()];
        JVM INSTR tableswitch 1 3: default 672
    //                   1 748
    //                   2 748
    //                   3 807;
           goto _L1 _L2 _L2 _L3
_L1:
        log((new StringBuilder()).append("==> placeCall(): failure code from placeCallInternal(): ").append(callstatuscode).toString());
        handleOutgoingCallError(callstatuscode);
_L4:
        incalluistate.latestDisconnectCall = null;
        incalluistate.delayFinished = false;
        phoneglobals = mApp;
        int i;
        Exception exception;
        String s3;
        boolean flag2;
        String s4;
        if (!intent.getBooleanExtra("com.android.phone.extra.video", false))
            flag2 = true;
        else
            flag2 = false;
        phoneglobals.displayCallScreen(flag2, flag);
        return;
_L2:
        log((new StringBuilder()).append("==> placeCall(): success from placeCallInternal(): ").append(callstatuscode).toString());
        if (callstatuscode == Constants.CallStatusCode.EXITED_ECM)
        {
            incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.EXITED_ECM);
        } else
        {
            incalluistate.clearPendingCallStatusCode();
            flag = true;
        }
        mApp.setBeginningCall(true);
          goto _L4
_L3:
        incalluistate.setPendingCallStatusCode(Constants.CallStatusCode.DROP_VOICECALL);
        i = intent.getExtras().getInt("com.android.phone.extra.slot");
        s4 = PhoneUtils.getInitialNumber(intent);
        s3 = s4;
_L5:
        if (s3 == null)
            s3 = s2;
        incalluistate.setNumberSlot(i, s3);
        flag = false;
          goto _L4
        exception;
        s3 = null;
          goto _L5
    }
}
