// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Intent;
import android.os.*;
import android.telephony.ServiceState;
import android.util.Log;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.telephony.PhoneNumberUtilsEx;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, InCallUiState, PhoneUtils, PhoneInterfaceManager, 
//            CallController

public class EmergencyCallHelper extends Handler
{

    private static final boolean DBG = true;
    private static final int DISCONNECT = 3;
    private static final int DUAL_SIMS_MODE_ON = -1 + (1 << GeminiUtils.getSlotCount());
    public static final int MAX_NUM_RETRIES = 6;
    private static final int PHONE_STATE_CHANGED = 5;
    private static final int RETRY_TIMEOUT = 4;
    private static final int SEND_ECC_CALL = 6;
    private static final int SERVICE_STATE_CHANGED = 2;
    private static final int SERVICE_STATE_CHANGED2 = 102;
    private static final int SERVICE_STATE_CHANGED3 = 202;
    private static final int SERVICE_STATE_CHANGED4 = 302;
    private static final int SERVICE_STATE_CHANGED_GEMINI[] = {
        2, 102, 202, 302
    };
    private static final int START_SEQUENCE = 1;
    private static final String TAG = "EmergencyCallHelper";
    public static final long TIME_BETWEEN_RETRIES = 15000L;
    public static final long WAKE_LOCK_TIMEOUT = 0x493e0L;
    private PhoneGlobals mApp;
    private CallManager mCM;
    public MTKCallManager mCMGemini;
    private CallController mCallController;
    private int mNumRetriesSoFar;
    private String mNumber;
    private android.os.PowerManager.WakeLock mPartialWakeLock;
    private Phone mPhone;
    private int mServiceOnSlot;

    public EmergencyCallHelper(CallController callcontroller)
    {
        mCMGemini = null;
        log("EmergencyCallHelper constructor...");
        mCallController = callcontroller;
        mApp = PhoneGlobals.getInstance();
        mCM = mApp.mCM;
        mCMGemini = mApp.mCMGemini;
    }

    private void cancelRetryTimer()
    {
        removeMessages(4);
    }

    private void cleanup()
    {
        log("cleanup()...");
        mApp.inCallUiState.clearProgressIndication();
        GeminiRegister.unregisterForServiceStateChanged(mPhone, this, SERVICE_STATE_CHANGED_GEMINI);
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.unregisterForDisconnect(obj, this);
        cancelRetryTimer();
        if (mPartialWakeLock != null)
        {
            if (mPartialWakeLock.isHeld())
            {
                log("- releasing wake lock");
                mPartialWakeLock.release();
            }
            mPartialWakeLock = null;
        }
        mApp.updateInCallScreen();
    }

    private int getBestSlotForDualSimMode(int i)
    {
        int j = GeminiUtils.getDefaultSlot();
        int ai[] = GeminiUtils.getSlots();
        int k = ai.length;
        int l = 0;
        do
        {
label0:
            {
                if (l < k)
                {
                    int i1 = ai[l];
                    if ((i & 1 << i1) <= 0)
                        break label0;
                    j = i1;
                }
                log((new StringBuilder()).append("getBestSlotForDualSimMode, mode=").append(i).append(", bestSlot=").append(j).toString());
                return j;
            }
            l++;
        } while (true);
    }

    private int getProperDualSimMode(int i)
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(mApp);
        if (list == null || list.isEmpty()) goto _L2; else goto _L1
_L1:
        int j = 0;
        if (list == null) goto _L4; else goto _L3
_L3:
        int ai[];
        Iterator iterator;
        ai = GeminiUtils.getSlots();
        iterator = list.iterator();
_L6:
        if (iterator.hasNext())
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            int k = ai.length;
            int l = 0;
            do
            {
                if (l >= k)
                    continue; /* Loop/switch isn't completed */
                int i1 = ai[l];
                if (siminfo.mSlot == i1)
                {
                    j |= 1 << i1;
                    continue; /* Loop/switch isn't completed */
                }
                l++;
            } while (true);
        }
_L4:
        log((new StringBuilder()).append("getProperDualSimMode, mode=").append(j).toString());
        if ((j & i) != 0)
            j = i;
        return j;
_L2:
        log((new StringBuilder()).append("getProperDualSimMode, No sim inserted, return ").append(DUAL_SIMS_MODE_ON).toString());
        return DUAL_SIMS_MODE_ON;
        if (true) goto _L6; else goto _L5
_L5:
    }

    private int getSysDualSimMode()
    {
        boolean flag = GeminiUtils.isGeminiSupport();
        int i = 0;
        if (flag)
            i = android.provider.Settings.Global.getInt(mApp.getContentResolver(), "dual_sim_mode_setting", 3);
        return i;
    }

    private boolean hangupAllCallsWhenEcc()
    {
        log("hangupAllCallsWhenEcc()...");
        if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            break MISSING_BLOCK_LABEL_239;
        Call call = mCM.getActiveFgCall();
        Connection connection = call.getEarliestConnection();
        String s;
        Call call1;
        Connection connection1;
        String s1;
        Call call2;
        Object obj;
        if (connection != null)
            s = connection.getAddress();
        else
            s = null;
        call1 = mCM.getFirstActiveBgCall();
        connection1 = call1.getEarliestConnection();
        if (connection1 != null)
            s1 = connection1.getAddress();
        else
            s1 = null;
        call2 = mCM.getFirstActiveRingingCall();
        if ((call == null || !call.getState().isAlive() || PhoneUtils.isEccCall(call) && !PhoneNumberUtilsEx.isSpecialEmergencyNumber(s)) && (call1 == null || !call1.getState().isAlive() || PhoneUtils.isEccCall(call1) && !PhoneNumberUtilsEx.isSpecialEmergencyNumber(s1)) && (call2 == null || !call2.getState().isAlive()))
            break MISSING_BLOCK_LABEL_239;
        if (GeminiUtils.isGeminiSupport())
            obj = PhoneGlobals.getInstance().mCMGemini;
        else
            obj = mCM;
        GeminiRegister.registerForDisconnect(obj, this, 5);
        mCM.hangupAllEx();
        log("Waiting for disconnect exist calls.");
        return true;
        CallStateException callstateexception;
        callstateexception;
        log((new StringBuilder()).append("catch exception = ").append(callstateexception).toString());
        return false;
    }

    private boolean isSlotPowerOff(int i)
    {
        if (GeminiUtils.isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)mPhone;
            if (GeminiUtils.isValidSlot(i))
            {
                if (geminiphone.getServiceStateGemini(i).getState() != 3)
                    return false;
            } else
            {
                int ai[] = GeminiUtils.getSlots();
                int j = ai.length;
                for (int k = 0; k < j; k++)
                    if (geminiphone.getServiceStateGemini(ai[k]).getState() != 3)
                        return false;

            }
        } else
        if (mPhone.getServiceState().getState() != 3)
            return false;
        return true;
    }

    private void log(String s)
    {
        Log.d("EmergencyCallHelper", s);
    }

    private boolean needSetDualSimMode(int i)
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(mApp);
        if (list == null || list.size() == 0)
        {
            boolean flag = false;
            int ai[] = GeminiUtils.getSlots();
            int j = ai.length;
            for (int k = 0; k < j; k++)
            {
                int l = ai[k];
                if (!flag && !PhoneGlobals.getInstance().phoneMgr.isSimInsert(l))
                    flag = false;
                else
                    flag = true;
            }

            if (!flag)
            {
                log("needSetDualSimMode, false, no sim inserted");
                return false;
            }
        }
        for (Iterator iterator = list.iterator(); iterator.hasNext();)
            if ((i & 1 << ((android.provider.Telephony.SIMInfo)iterator.next()).mSlot) > 0)
            {
                log("needSetDualSimMode, false, follow settings mode");
                return false;
            }

        log("needSetDualSimMode, true");
        return true;
    }

    private void onDisconnect(Message message)
    {
        Connection connection = (Connection)((AsyncResult)message.obj).result;
        com.android.internal.telephony.Connection.DisconnectCause disconnectcause = connection.getDisconnectCause();
        log((new StringBuilder()).append("onDisconnect: connection '").append(connection).append("', addr '").append(connection.getAddress()).append("', cause = ").append(disconnectcause).toString());
        if (disconnectcause == com.android.internal.telephony.Connection.DisconnectCause.OUT_OF_SERVICE)
        {
            log("- onDisconnect: OUT_OF_SERVICE, need to retry...");
            cleanup();
            return;
        } else
        {
            log("==> Disconnect event; clean up...");
            cleanup();
            return;
        }
    }

    private void onRetryTimeout(Message message)
    {
        com.android.internal.telephony.PhoneConstants.State state = com.android.internal.telephony.PhoneConstants.State.IDLE;
        int i = message.arg1;
        boolean flag = isSlotPowerOff(message.arg1);
        log((new StringBuilder()).append("onRetryTimeout():  phone state ").append(state).append(", service state(PowerOff)=").append(flag).append(", mNumRetriesSoFar = ").append(mNumRetriesSoFar).toString());
        if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
        {
            log("- onRetryTimeout: Call is active!  Cleaning up...");
            cleanup();
            return;
        }
        if (!flag)
        {
            GeminiRegister.unregisterForServiceStateChanged(mPhone, this, SERVICE_STATE_CHANGED_GEMINI);
            mApp.inCallUiState.clearProgressIndication();
            placeEmergencyCall(i);
        } else
        {
            log("- Trying (again) to turn on the radio...");
            powerOnRadio();
            scheduleRetryOrBailOut();
        }
        mApp.displayCallScreen(true);
    }

    private void onServiceStateChanged(Message message)
    {
        ServiceState servicestate = (ServiceState)((AsyncResult)message.obj).result;
        log((new StringBuilder()).append("onServiceStateChanged()...  new state = ").append(servicestate).toString());
        boolean flag;
        if (servicestate.getState() != 3)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            log("onServiceStateChanged: ok to call!");
            GeminiRegister.unregisterForServiceStateChanged(mPhone, this, SERVICE_STATE_CHANGED_GEMINI);
            mServiceOnSlot = GeminiRegister.getSlotIdByRegisterEvent(message.what, SERVICE_STATE_CHANGED_GEMINI);
            log((new StringBuilder()).append("onServiceStateChanged slotId=").append(mServiceOnSlot).toString());
            if (hangupAllCallsWhenEcc())
            {
                return;
            } else
            {
                mApp.inCallUiState.clearProgressIndication();
                cancelRetryTimer();
                placeEmergencyCall(mServiceOnSlot);
                mApp.displayCallScreen(true);
                return;
            }
        } else
        {
            log("onServiceStateChanged: not ready to call yet, keep waiting...");
            return;
        }
    }

    private void placeEmergencyCall(int i)
    {
        log("placeEmergencyCall()...");
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = mCMGemini;
        else
            obj = mCM;
        GeminiRegister.registerForDisconnect(obj, this, 3);
        log((new StringBuilder()).append("- placing call to '").append(mNumber).append("'...").append(" simId = ").append(i).toString());
        int j;
        if (GeminiUtils.isGeminiSupport())
        {
            j = PhoneUtils.placeCallGemini(mApp, mPhone, mNumber, null, true, null, i);
            log((new StringBuilder()).append("- PhoneUtils.placeCallGemini() returned status = ").append(j).toString());
        } else
        {
            j = PhoneUtils.placeCall(mApp, mPhone, mNumber, null, true, null);
            log((new StringBuilder()).append("- PhoneUtils.placeCall() returned status = ").append(j).toString());
        }
        boolean flag;
        switch (j)
        {
        case 0: // '\0'
            flag = true;
            break;

        default:
            Log.w("EmergencyCallHelper", (new StringBuilder()).append("placeEmergencyCall(): placeCall() failed: callStatus = ").append(j).toString());
            flag = false;
            break;
        }
        if (flag)
        {
            log("==> Success from PhoneUtils.placeCall()!");
            return;
        } else
        {
            log("==> Failure.");
            scheduleRetryOrBailOut();
            return;
        }
    }

    private void powerOnRadio()
    {
        log("- powerOnRadio()...");
        GeminiRegister.registerForServiceStateChanged(mPhone, this, SERVICE_STATE_CHANGED_GEMINI);
        int i = getSysDualSimMode();
        Log.d("EmergencyCallHelper", (new StringBuilder()).append("dualSimMode = ").append(i).toString());
        boolean flag1;
        if (android.provider.Settings.Global.getInt(mApp.getContentResolver(), "airplane_mode_on", 0) > 0)
        {
            log("==> Turning off airplane mode...");
            android.provider.Settings.Global.putInt(mApp.getContentResolver(), "airplane_mode_on", 0);
            Intent intent1 = new Intent("android.intent.action.AIRPLANE_MODE");
            intent1.putExtra("state", false);
            mApp.sendBroadcastAsUser(intent1, UserHandle.ALL);
            flag1 = true;
        } else
        {
            boolean flag = GeminiUtils.isGeminiSupport();
            flag1 = false;
            if (!flag)
            {
                log("==> (Apparently) not in airplane mode; manually powering radio on...");
                mPhone.setRadioPower(true);
                flag1 = false;
            }
        }
        int j = getProperDualSimMode(i);
        if (!GeminiUtils.isGeminiSupport() || flag1 && (!flag1 || j == i))
        {
            log("do nothing.");
            return;
        } else
        {
            log((new StringBuilder()).append("Send broadcast to turn on radio with mode = ").append(j).toString());
            android.provider.Settings.Global.putInt(mApp.getContentResolver(), "dual_sim_mode_setting", j);
            Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
            intent.putExtra("mode", j);
            mApp.sendBroadcastAsUser(intent, UserHandle.ALL);
            return;
        }
    }

    private void scheduleRetryOrBailOut()
    {
        mNumRetriesSoFar = 1 + mNumRetriesSoFar;
        log((new StringBuilder()).append("scheduleRetryOrBailOut()...  mNumRetriesSoFar is now ").append(mNumRetriesSoFar).toString());
        if (mNumRetriesSoFar > 6)
        {
            Log.w("EmergencyCallHelper", "scheduleRetryOrBailOut: hit MAX_NUM_RETRIES; giving up...");
            cleanup();
            mApp.inCallUiState.setPendingCallStatusCode(Constants.CallStatusCode.CALL_FAILED);
            return;
        } else
        {
            log("- Scheduling another retry...");
            startRetryTimer();
            mApp.inCallUiState.setProgressIndication(InCallUiState.ProgressIndicationType.RETRYING);
            return;
        }
    }

    private void startRetryTimer()
    {
        removeMessages(4);
        if (GeminiUtils.isGeminiSupport())
        {
            sendMessageDelayed(obtainMessage(4, getBestSlotForDualSimMode(getSysDualSimMode()), 0), 15000L);
            return;
        } else
        {
            sendEmptyMessageDelayed(4, 15000L);
            return;
        }
    }

    private void startSequenceInternal(Message message)
    {
        log((new StringBuilder()).append("startSequenceInternal(): msg = ").append(message).toString());
        cleanup();
        mNumber = (String)message.obj;
        log((new StringBuilder()).append("- startSequenceInternal: Got mNumber: '").append(mNumber).append("'").toString());
        mNumRetriesSoFar = 0;
        mPhone = mApp.phone;
        mPartialWakeLock = ((PowerManager)mApp.getSystemService("power")).newWakeLock(1, "EmergencyCallHelper");
        log("- startSequenceInternal: acquiring wake lock");
        mPartialWakeLock.acquire(0x493e0L);
        powerOnRadio();
        startRetryTimer();
        mApp.inCallUiState.setProgressIndication(InCallUiState.ProgressIndicationType.TURNING_ON_RADIO);
    }

    public void handleMessage(Message message)
    {
        switch (message.what)
        {
        case 6: // '\006'
            log("send the ecc call!");
            mApp.inCallUiState.clearProgressIndication();
            cancelRetryTimer();
            placeEmergencyCall(mServiceOnSlot);
            return;

        case 5: // '\005'
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
                sendMessageDelayed(obtainMessage(6), 200L);
                return;
            } else
            {
                log("handleMessage: PHONE_STATE_CHANGED continue waiting...");
                return;
            }

        case 4: // '\004'
            onRetryTimeout(message);
            return;

        case 3: // '\003'
            onDisconnect(message);
            return;

        case 2: // '\002'
        case 102: // 'f'
        case 202: 
        case 302: 
            onServiceStateChanged(message);
            return;

        case 1: // '\001'
            startSequenceInternal(message);
            return;
        }
        Log.wtf("EmergencyCallHelper", (new StringBuilder()).append("handleMessage: unexpected message: ").append(message).toString());
    }

    public void startEmergencyCallFromAirplaneModeSequence(String s)
    {
        log((new StringBuilder()).append("startEmergencyCallFromAirplaneModeSequence('").append(s).append("')...").toString());
        sendMessage(obtainMessage(1, s));
    }

}
