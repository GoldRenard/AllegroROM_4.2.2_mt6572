// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.bluetooth.IBluetoothHeadsetPhone;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.media.AudioManager;
import android.net.Uri;
import android.net.sip.SipManager;
import android.os.*;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.telephony.PhoneNumberUtils;
import android.text.InputFilter;
import android.text.TextUtils;
import android.util.Log;
import android.view.*;
import android.widget.*;
import com.android.internal.telephony.*;
import com.android.internal.telephony.cdma.CdmaConnection;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.sip.SipPhone;
import com.mediatek.common.dm.DMAgent;
import com.mediatek.phone.*;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.vt.VTCallUtils;
import com.mediatek.storage.StorageManagerEx;
import java.io.File;
import java.util.*;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, CallNotifier, CdmaPhoneCallState, Ringer, 
//            InCallScreen, NotificationMgr

public class PhoneUtils
{
    public static class CallerInfoToken
    {

        public CallerInfoAsyncQuery asyncQuery;
        public CallerInfo currentInfo;
        public boolean isFinal;

    }

    private static class ConnectionHandler extends Handler
    {

        public void handleMessage(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            switch (message.what)
            {
            case -302: 
            case -202: 
            case -102: 
            case -2: 
                PhoneUtils.log((new StringBuilder()).append("ConnectionHandler: PHONE_SPEECH_INFO-").append(message.what).toString());
                PhoneUtils.setAudioMode();
                int i = GeminiRegister.getSlotIdByRegisterEvent(message.what, PhoneUtils.PHONE_SPEECH_INFO_GEMINI);
                GeminiRegister.unregisterForSpeechInfo(PhoneGlobals.getInstance().getCallManager(), PhoneUtils.mConnectionHandler, i);
                return;

            case -1: 
                PhoneUtils.log("ConnectionHandler: updating mute state for each connection");
                CallManager callmanager = (CallManager)asyncresult.userObj;
                ArrayList arraylist = new ArrayList();
                Iterator iterator = callmanager.getForegroundCalls().iterator();
                do
                {
                    if (!iterator.hasNext())
                        break;
                    Call call1 = (Call)iterator.next();
                    if (!call1.isIdle())
                        arraylist.addAll(call1.getConnections());
                } while (true);
                Iterator iterator1 = arraylist.iterator();
                do
                {
                    if (!iterator1.hasNext())
                        break;
                    Connection connection2 = (Connection)iterator1.next();
                    if (PhoneUtils.sConnectionMuteTable.get(connection2) == null)
                        PhoneUtils.sConnectionMuteTable.put(connection2, Boolean.FALSE);
                } while (true);
                ArrayList arraylist1 = new ArrayList();
                Iterator iterator2 = callmanager.getBackgroundCalls().iterator();
                do
                {
                    if (!iterator2.hasNext())
                        break;
                    Call call = (Call)iterator2.next();
                    if (!call.isIdle())
                        arraylist1.addAll(call.getConnections());
                } while (true);
                Iterator iterator3 = arraylist1.iterator();
                do
                {
                    if (!iterator3.hasNext())
                        break;
                    Connection connection1 = (Connection)iterator3.next();
                    if (PhoneUtils.sConnectionMuteTable.get(connection1) == null)
                        PhoneUtils.sConnectionMuteTable.put(connection1, Boolean.FALSE);
                } while (true);
                Iterator iterator4 = PhoneUtils.sConnectionMuteTable.keySet().iterator();
                do
                {
                    if (!iterator4.hasNext())
                        break;
                    Connection connection = (Connection)iterator4.next();
                    if (!arraylist.contains(connection) && !arraylist1.contains(connection))
                    {
                        PhoneUtils.log((new StringBuilder()).append("connection '").append(connection).append("' not accounted for, removing.").toString());
                        iterator4.remove();
                    }
                } while (true);
                if (callmanager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                {
                    PhoneUtils.restoreMuteState();
                    return;
                } else
                {
                    PhoneUtils.setMuteInternal(callmanager.getFgPhone(), false);
                    return;
                }
            }
        }

        private ConnectionHandler()
        {
        }

    }

    public static class VoiceMailNumberMissingException extends Exception
    {


        VoiceMailNumberMissingException(String s)
        {
            super(s);
        }
    }


    static final String ADD_CALL_MODE_KEY = "add_call_mode";
    public static final int AUDIO_IDLE = 0;
    public static final int AUDIO_OFFHOOK = 2;
    public static final int AUDIO_RINGING = 1;
    public static final int CALL_STATUS_DIALED = 0;
    public static final int CALL_STATUS_DIALED_MMI = 1;
    public static final int CALL_STATUS_FAILED = 2;
    private static final int CNAP_SPECIAL_CASE_NO = -1;
    private static final boolean DBG = true;
    private static final boolean DBG_SETAUDIOMODE_STACK = false;
    public static final String DUALMIC_MODE = "Enable_Dual_Mic_Setting";
    private static final String LOG_TAG = "PhoneUtils";
    private static final int MIN_LENGTH = 6;
    private static final int MIN_WIDTH = 270;
    public static final int PHONE_SPEECH_INFO = -2;
    public static final int PHONE_SPEECH_INFO2 = -102;
    public static final int PHONE_SPEECH_INFO3 = -202;
    public static final int PHONE_SPEECH_INFO4 = -302;
    public static final int PHONE_SPEECH_INFO_GEMINI[] = {
        -2, -102, -202, -302
    };
    private static final int PHONE_STATE_CHANGED = -1;
    private static final int QUERY_TOKEN = -1;
    private static ConnectionHandler mConnectionHandler;
    private static int sAudioBehaviourState = 0;
    static com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener sCallerInfoQueryListener = new com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener() {

        public void onQueryComplete(int i, Object obj, CallerInfo callerinfo)
        {
            PhoneUtils.log("query complete, updating connection.userdata");
            Connection connection = (Connection)obj;
            boolean flag1;
            if (connection.getCall().getPhone().getPhoneType() == 3)
                flag1 = true;
            else
                flag1 = false;
            PhoneUtils.log((new StringBuilder()).append("- onQueryComplete: CallerInfo:").append(callerinfo).toString());
            if (!callerinfo.contactExists && !callerinfo.isEmergencyNumber() && !callerinfo.isVoiceMailNumber())
            {
                CallerInfo callerinfo1 = PhoneUtils.getCallerInfo(null, connection);
                if (callerinfo1 != null)
                {
                    callerinfo1.phoneNumber = callerinfo.phoneNumber;
                    callerinfo1.geoDescription = callerinfo.geoDescription;
                    callerinfo = callerinfo1;
                }
            } else
            if (callerinfo.numberPresentation == 0)
                callerinfo.numberPresentation = connection.getNumberPresentation();
            if (flag1 && !callerinfo.contactExists && !callerinfo.isEmergencyNumber() && callerinfo.isVoiceMailNumber())
                callerinfo.phoneNumber = connection.getAddress();
            PhoneUtils.log((new StringBuilder()).append("==> Stashing CallerInfo ").append(callerinfo).append(" into the connection...").toString());
            connection.setUserData(callerinfo);
        }

    }
;
    private static Hashtable sConnectionMuteTable = new Hashtable();
    private static MmiCode sCurCode = null;
    private static Dialog sDialog = null;
    private static boolean sIsNoiseSuppressionEnabled;
    private static boolean sIsOpen = false;
    private static boolean sIsSpeakerEnabled = false;
    private static boolean sMmiFinished = false;
    private static boolean sPhoneSwapStatus = false;
    private static String sTtyMode = "tty_off";
    public static UssdAlertActivity sUssdActivity = null;
    private static boolean sVoipSupported = false;

    private PhoneUtils()
    {
    }

    private static boolean activateSpeakerIfDocked(Phone phone)
    {
        log("activateSpeakerIfDocked()...");
        int i = PhoneGlobals.mDockState;
        boolean flag = false;
        if (i != 0)
        {
            log("activateSpeakerIfDocked(): In a dock -> may need to turn on speaker.");
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            boolean flag1 = phoneglobals.isHeadsetPlugged();
            flag = false;
            if (!flag1)
            {
                boolean flag2 = phoneglobals.isBluetoothHeadsetAudioOn();
                flag = false;
                if (!flag2)
                {
                    turnOnSpeaker(phone.getContext(), true, true);
                    flag = true;
                }
            }
        }
        return flag;
    }

    static boolean answerAndEndActive(CallManager callmanager, Call call)
    {
        log("answerAndEndActive()...");
        Phone phone = callmanager.getActiveFgCall().getPhone();
        Phone phone1 = call.getPhone();
        if (!hangupActiveCall(callmanager.getActiveFgCall()))
        {
            Log.w("PhoneUtils", "end active call failed!");
            return false;
        }
        if (phone == phone1 && (phone != phone1 || !(phone instanceof SipPhone)))
            return true;
        else
            return answerCall(call);
    }

    static boolean answerAndEndHolding(CallManager callmanager, Call call)
    {
        log("end holding & answer waiting: 1");
        if (!hangupHoldingCall(callmanager.getFirstActiveBgCall()))
        {
            Log.e("PhoneUtils", "end holding failed!");
            return false;
        } else
        {
            log("end holding & answer waiting: 2");
            return answerCall(call);
        }
    }

    static boolean answerCall(Call call)
    {
        boolean flag = true;
        log((new StringBuilder()).append("answerCall(").append(call).append(")...").toString());
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        CallNotifier callnotifier = phoneglobals.notifier;
        callnotifier.silenceRinger();
        setAudioControlState(2);
        Phone phone = call.getPhone();
        boolean flag1;
        boolean flag2;
        IBluetoothHeadsetPhone ibluetoothheadsetphone;
        CallStateException callstateexception;
        RemoteException remoteexception;
        boolean flag3;
        boolean flag4;
        CdmaPhoneCallState.PhoneCallState phonecallstate;
        CdmaPhoneCallState.PhoneCallState phonecallstate1;
        IBluetoothHeadsetPhone ibluetoothheadsetphone1;
        RemoteException remoteexception1;
        if (phone.getPhoneType() != 2)
            flag = false;
        if (flag && call.getState() == com.android.internal.telephony.Call.State.WAITING)
            callnotifier.stopSignalInfoTone();
        flag1 = false;
        if (call == null)
            break MISSING_BLOCK_LABEL_399;
        flag2 = call.isRinging();
        flag1 = false;
        if (!flag2)
            break MISSING_BLOCK_LABEL_399;
        log((new StringBuilder()).append("answerCall: call state = ").append(call.getState()).toString());
        ibluetoothheadsetphone = null;
        if (!flag) goto _L2; else goto _L1
_L1:
        phonecallstate = phoneglobals.cdmaPhoneCallState.getCurrentCallState();
        phonecallstate1 = CdmaPhoneCallState.PhoneCallState.IDLE;
        flag1 = false;
        ibluetoothheadsetphone = null;
        if (phonecallstate != phonecallstate1) goto _L4; else goto _L3
_L3:
        phoneglobals.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.SINGLE_ACTIVE);
_L2:
        flag3 = isRealIncomingCall(call.getState());
        phoneglobals.mCM.acceptCall(call);
        flag1 = true;
        setAudioMode();
        flag4 = activateSpeakerIfDocked(phone);
        if (!flag3 || flag4)
            break MISSING_BLOCK_LABEL_399;
        if (!isSpeakerOn(phoneglobals) || phoneglobals.isBluetoothHeadsetAudioOn() || VTCallUtils.isVideoCall(call))
            break MISSING_BLOCK_LABEL_399;
        Log.i("PhoneUtils", "Forcing speaker off due to new incoming call...");
        turnOnSpeaker(phoneglobals, false, true);
        return flag1;
_L4:
        phoneglobals.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.CONF_CALL);
        phoneglobals.cdmaPhoneCallState.setAddCallMenuStateAfterCallWaiting(true);
        ibluetoothheadsetphone1 = phoneglobals.getBluetoothPhoneService();
        ibluetoothheadsetphone = ibluetoothheadsetphone1;
        if (ibluetoothheadsetphone == null) goto _L2; else goto _L5
_L5:
        ibluetoothheadsetphone.cdmaSetSecondCallState(true);
          goto _L2
        remoteexception1;
        Log.e("PhoneUtils", Log.getStackTraceString(new Throwable()));
          goto _L2
        callstateexception;
        Log.w("PhoneUtils", (new StringBuilder()).append("answerCall: caught ").append(callstateexception).toString(), callstateexception);
        if (!flag)
            break MISSING_BLOCK_LABEL_399;
        phoneglobals.cdmaPhoneCallState.setCurrentCallState(phoneglobals.cdmaPhoneCallState.getPreviousCallState());
        if (ibluetoothheadsetphone == null)
            break MISSING_BLOCK_LABEL_399;
        ibluetoothheadsetphone.cdmaSetSecondCallState(false);
        return flag1;
        remoteexception;
        Log.e("PhoneUtils", Log.getStackTraceString(new Throwable()));
        return flag1;
    }

    private static String audioModeToString(int i)
    {
        switch (i)
        {
        case 2: // '\002'
            return "MODE_IN_CALL";

        case 1: // '\001'
            return "MODE_RINGTONE";

        case 0: // '\0'
            return "MODE_NORMAL";

        case -1: 
            return "MODE_CURRENT";

        case -2: 
            return "MODE_INVALID";
        }
        return String.valueOf(i);
    }

    private static void autoUpdateUssdReponseUi(View view)
    {
        TextView textview = (TextView)view.findViewById(0x7f08003a);
        textview.setWidth(1);
        textview.setText(0x7f0d0084);
        textview.setFocusableInTouchMode(true);
    }

    static boolean cancelMmiCodeExt(Phone phone, int i)
    {
        log("cancelMmiCode....");
        List list = GeminiUtils.getPendingMmiCodes(phone, i);
        int j = list.size();
        log((new StringBuilder()).append("cancelMmiCode: num pending MMIs = ").append(j).toString());
        boolean flag = false;
        if (j > 0)
        {
            MmiCode mmicode = (MmiCode)list.get(0);
            boolean flag1 = mmicode.isCancelable();
            flag = false;
            if (flag1)
            {
                mmicode.cancel();
                flag = true;
            }
        }
        return flag;
    }

    public static void cancelUssdDialog()
    {
        if (sCurCode != null && sCurCode.isCancelable())
            sCurCode.cancel();
    }

    public static void checkAndCopyPhoneProviderExtras(Intent intent, Intent intent1)
    {
        if (!hasPhoneProviderExtras(intent))
        {
            Log.d("PhoneUtils", "checkAndCopyPhoneProviderExtras: some or all extras are missing.");
            return;
        } else
        {
            intent1.putExtra("com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE", intent.getStringExtra("com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE"));
            intent1.putExtra("com.android.phone.extra.GATEWAY_URI", intent.getStringExtra("com.android.phone.extra.GATEWAY_URI"));
            return;
        }
    }

    public static void checkAndCopyPrivateExtras(Intent intent, Intent intent1)
    {
        int i = intent.getIntExtra("com.android.phone.extra.slot", -1);
        if (-1 != i)
            intent1.putExtra("com.android.phone.extra.slot", i);
        long l = intent.getLongExtra("com.android.phone.extra.original", -5L);
        if (-1L != l)
            intent1.putExtra("com.android.phone.extra.original", l);
        boolean flag = intent.getBooleanExtra("com.android.phone.extra.ip", false);
        if (flag)
            intent1.putExtra("com.android.phone.extra.ip", flag);
        boolean flag1 = intent.getBooleanExtra("follow_sim_management", false);
        if (flag1)
            intent1.putExtra("follow_sim_management", flag1);
    }

    private static int checkCnapSpecialCases(String s)
    {
        if (!s.equals("PRIVATE") && !s.equals("P") && !s.equals("RES"))
        {
            if (!s.equals("UNAVAILABLE") && !s.equals("UNKNOWN") && !s.equals("UNA") && !s.equals("U"))
            {
                log((new StringBuilder()).append("checkCnapSpecialCases, normal str. number: ").append(s).toString());
                return -1;
            } else
            {
                log((new StringBuilder()).append("checkCnapSpecialCases, UNKNOWN string: ").append(s).toString());
                return PhoneConstants.PRESENTATION_UNKNOWN;
            }
        } else
        {
            log((new StringBuilder()).append("checkCnapSpecialCases, PRIVATE string: ").append(s).toString());
            return PhoneConstants.PRESENTATION_RESTRICTED;
        }
    }

    public static boolean diskSpaceAvailable(long l)
    {
        return getDiskAvailableSize() - l > 0L;
    }

    public static boolean diskSpaceAvailable(String s, long l)
    {
        File file;
        if (s == null)
            return diskSpaceAvailable(l);
        file = new File(s);
        StatFs statfs;
        if (!file.exists() || !file.isDirectory())
            break MISSING_BLOCK_LABEL_67;
        statfs = new StatFs(file.getPath());
        return (long)statfs.getBlockSize() * (long)statfs.getAvailableBlocks() - l > 0L;
        try
        {
            log("-----diskSpaceAvailable: sdCardDirectory is null----");
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            log("-----diskSpaceAvailable: IllegalArgumentException----");
            return false;
        }
        return false;
    }

    public static void dismissMMIDialog()
    {
        if (sDialog != null)
        {
            sDialog.cancel();
            sDialog = null;
        }
    }

    static void displayMMIComplete(Phone phone, Context context, MmiCode mmicode, Message message, AlertDialog alertdialog)
    {
        displayMMICompleteExt(phone, context, mmicode, message, alertdialog, 0);
    }

    static void displayMMICompleteExt(Phone phone, Context context, MmiCode mmicode, Message message, AlertDialog alertdialog, int i)
    {
        com.android.internal.telephony.MmiCode.State state;
label0:
        {
            CharSequence charsequence;
label1:
            {
                PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
                state = mmicode.getState();
                log((new StringBuilder()).append("displayMMIComplete: state=").append(state).toString());
                sCurCode = mmicode;
                static class _cls5
                {

                    static final int $SwitchMap$com$android$internal$telephony$MmiCode$State[];
                    static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$State[];

                    static 
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$State = new int[com.android.internal.telephony.PhoneConstants.State.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.RINGING.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.OFFHOOK.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        $SwitchMap$com$android$internal$telephony$MmiCode$State = new int[com.android.internal.telephony.MmiCode.State.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$MmiCode$State[com.android.internal.telephony.MmiCode.State.PENDING.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$MmiCode$State[com.android.internal.telephony.MmiCode.State.CANCELLED.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror3) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$MmiCode$State[com.android.internal.telephony.MmiCode.State.COMPLETE.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror4) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$MmiCode$State[com.android.internal.telephony.MmiCode.State.FAILED.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror5)
                        {
                            return;
                        }
                    }
                }

                switch (_cls5..SwitchMap.com.android.internal.telephony.MmiCode.State[state.ordinal()])
                {
                default:
                    break label0;

                case 3: // '\003'
                    sMmiFinished = true;
                    if (phoneglobals.getPUKEntryActivity() != null)
                    {
                        charsequence = context.getText(0x7f0d01a7);
                        break;
                    }
                    // fall through

                case 4: // '\004'
                    charsequence = mmicode.getMessage();
                    log((new StringBuilder()).append("- using text from MMI message: '").append(charsequence).append("'").toString());
                    if (sUssdActivity != null)
                        sUssdActivity.dismiss();
                    break;

                case 2: // '\002'
                    return;

                case 1: // '\001'
                    charsequence = mmicode.getMessage();
                    log((new StringBuilder()).append("- using text from PENDING MMI message: '").append(charsequence).append("'").toString());
                    break;
                }
                if (alertdialog != null)
                    alertdialog.dismiss();
                if (phoneglobals.getPUKEntryActivity() == null || state != com.android.internal.telephony.MmiCode.State.COMPLETE)
                {
                    if (phoneglobals.getPUKEntryActivity() != null)
                        phoneglobals.setPukEntryActivity(null);
                    if (state == com.android.internal.telephony.MmiCode.State.PENDING)
                        break label1;
                    log("MMI code has finished running.");
                    log((new StringBuilder()).append("Extended NW displayMMIInitiate (").append(charsequence).append(")").toString());
                    if (charsequence != null && charsequence.length() != 0)
                    {
                        View view1 = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(0x7f04000f, null);
                        ((TextView)view1.findViewById(0x7f080039)).setText(charsequence);
                        ((TextView)view1.findViewById(0x7f08003a)).setVisibility(8);
                        ((EditText)view1.findViewById(0x7f08003b)).setVisibility(8);
                        autoUpdateUssdReponseUi(view1);
                        displayMmiDialog(context, charsequence, 2, i);
                        return;
                    }
                }
                return;
            }
            log("USSD code has requested user input. Constructing input dialog.");
            View view = ((LayoutInflater)context.getSystemService("layout_inflater")).inflate(0x7f04000f, null);
            TextView textview = (TextView)view.findViewById(0x7f080039);
            textview.setText(charsequence);
            textview.setWidth(270);
            EditText edittext = (EditText)view.findViewById(0x7f08003b);
            edittext.setLongClickable(false);
            InputFilter ainputfilter[] = new InputFilter[1];
            ainputfilter[0] = new android.text.InputFilter.LengthFilter(182);
            edittext.setFilters(ainputfilter);
            new android.content.DialogInterface.OnClickListener(phone, edittext, i, mmicode) {

                final EditText val$inputText;
                final MmiCode val$mmiCode;
                final Phone val$phone;
                final int val$simId;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    switch (j)
                    {
                    case -2: 
                        if (mmiCode.isCancelable())
                            mmiCode.cancel();
                        PhoneUtils.sDialog = null;
                        PhoneUtils.sUssdActivity = null;
                        return;

                    case -1: 
                        GeminiUtils.sendUssdResponse(phone, inputText.getText().toString(), simId);
                        PhoneUtils.sDialog = null;
                        PhoneUtils.sUssdActivity = null;
                        return;
                    }
                }

            
            {
                phone = phone1;
                inputText = edittext;
                simId = i;
                mmiCode = mmicode;
                super();
            }
            }
;
            android.content.DialogInterface.OnCancelListener oncancellistener = new android.content.DialogInterface.OnCancelListener(mmicode) {

                final MmiCode val$mmiCode;

                public void onCancel(DialogInterface dialoginterface)
                {
                    if (mmiCode.isCancelable())
                        mmiCode.cancel();
                }

            
            {
                mmiCode = mmicode;
                super();
            }
            }
;
            android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(context);
            AlertDialog alertdialog1 = builder.setView(view).setPositiveButton(0x7f0d019e, null).setNegativeButton(0x7f0d0196, null).setCancelable(false).create();
            alertdialog1.setOnCancelListener(oncancellistener);
            edittext.setOnKeyListener(new android.view.View.OnKeyListener(phone, edittext, i, alertdialog1) {

                final EditText val$inputText;
                final AlertDialog val$newDialog;
                final Phone val$phone;
                final int val$simId;

                public boolean onKey(View view2, int j, KeyEvent keyevent)
                {
                    boolean flag = true;
                    switch (j)
                    {
                    case 66: // 'B'
                        if (keyevent.getAction() == flag)
                        {
                            GeminiUtils.sendUssdResponse(phone, inputText.getText().toString(), simId);
                            newDialog.dismiss();
                            return flag;
                        }
                        break;

                    default:
                        flag = false;
                        break;

                    case 5: // '\005'
                        break;
                    }
                    return flag;
                }

            
            {
                phone = phone1;
                inputText = edittext;
                simId = i;
                newDialog = alertdialog;
                super();
            }
            }
);
            edittext.requestFocus();
            alertdialog1.getWindow().setType(2008);
            alertdialog1.getWindow().addFlags(2);
            displayMmiDialog(context, charsequence, 1, i);
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unexpected MmiCode state: ").append(state).toString());
    }

    static Dialog displayMMIInitiate(Context context, MmiCode mmicode, Message message, Dialog dialog)
    {
        log((new StringBuilder()).append("displayMMIInitiate: ").append(mmicode).toString());
        if (dialog != null)
            dialog.dismiss();
        boolean flag;
        if (mmicode != null && mmicode.isCancelable())
            flag = true;
        else
            flag = false;
        if (!flag)
        {
            log("not a USSD code, displaying status toast.");
            Toast.makeText(context, context.getText(0x7f0d0193), 0).show();
            return null;
        } else
        {
            log("running USSD code, displaying indeterminate progress.");
            ProgressDialog progressdialog = new ProgressDialog(context);
            progressdialog.setMessage(context.getText(0x7f0d0194));
            progressdialog.setCancelable(false);
            progressdialog.setIndeterminate(true);
            progressdialog.getWindow().addFlags(2);
            progressdialog.show();
            return progressdialog;
        }
    }

    static void displayMmiDialog(Context context, CharSequence charsequence, int i, int j)
    {
        Intent intent = new Intent();
        intent.setClass(context, com/mediatek/phone/UssdAlertActivity);
        intent.setFlags(0x10000000);
        intent.putExtra("ussd_message", charsequence);
        intent.putExtra("ussd_type", i);
        intent.putExtra("slot_id", j);
        context.startActivity(intent);
    }

    static void dumpCallManager()
    {
        CallManager callmanager = PhoneGlobals.getInstance().mCM;
        StringBuilder stringbuilder = new StringBuilder(128);
        Log.d("PhoneUtils", "############### dumpCallManager() ##############");
        Log.d("PhoneUtils", (new StringBuilder()).append("CallManager: state = ").append(callmanager.getState()).toString());
        stringbuilder.setLength(0);
        Call call = callmanager.getActiveFgCall();
        StringBuilder stringbuilder1 = stringbuilder.append(" - FG call: ");
        String s;
        if (callmanager.hasActiveFgCall())
            s = "YES ";
        else
            s = "NO ";
        stringbuilder1.append(s);
        stringbuilder.append(call);
        stringbuilder.append("  State: ").append(callmanager.getActiveFgCallState());
        stringbuilder.append("  Conn: ").append(callmanager.getFgCallConnections());
        Log.d("PhoneUtils", stringbuilder.toString());
        stringbuilder.setLength(0);
        Call call1 = callmanager.getFirstActiveBgCall();
        StringBuilder stringbuilder2 = stringbuilder.append(" - BG call: ");
        String s1;
        if (callmanager.hasActiveBgCall())
            s1 = "YES ";
        else
            s1 = "NO ";
        stringbuilder2.append(s1);
        stringbuilder.append(call1);
        stringbuilder.append("  State: ").append(callmanager.getFirstActiveBgCall().getState());
        stringbuilder.append("  Conn: ").append(callmanager.getBgCallConnections());
        Log.d("PhoneUtils", stringbuilder.toString());
        stringbuilder.setLength(0);
        Call call2 = callmanager.getFirstActiveRingingCall();
        StringBuilder stringbuilder3 = stringbuilder.append(" - RINGING call: ");
        String s2;
        if (callmanager.hasActiveRingingCall())
            s2 = "YES ";
        else
            s2 = "NO ";
        stringbuilder3.append(s2);
        stringbuilder.append(call2);
        stringbuilder.append("  State: ").append(callmanager.getFirstActiveRingingCall().getState());
        Log.d("PhoneUtils", stringbuilder.toString());
        Iterator iterator = CallManager.getInstance().getAllPhones().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            Phone phone = (Phone)iterator.next();
            if (phone != null)
            {
                Log.d("PhoneUtils", (new StringBuilder()).append("Phone: ").append(phone).append(", name = ").append(phone.getPhoneName()).append(", state = ").append(phone.getState()).toString());
                stringbuilder.setLength(0);
                Call call3 = phone.getForegroundCall();
                stringbuilder.append(" - FG call: ").append(call3);
                stringbuilder.append("  State: ").append(call3.getState());
                stringbuilder.append("  Conn: ").append(call3.hasConnections());
                Log.d("PhoneUtils", stringbuilder.toString());
                stringbuilder.setLength(0);
                Call call4 = phone.getBackgroundCall();
                stringbuilder.append(" - BG call: ").append(call4);
                stringbuilder.append("  State: ").append(call4.getState());
                stringbuilder.append("  Conn: ").append(call4.hasConnections());
                Log.d("PhoneUtils", stringbuilder.toString());
                stringbuilder.setLength(0);
                Call call5 = phone.getRingingCall();
                stringbuilder.append(" - RINGING call: ").append(call5);
                stringbuilder.append("  State: ").append(call5.getState());
                stringbuilder.append("  Conn: ").append(call5.hasConnections());
                Log.d("PhoneUtils", stringbuilder.toString());
            }
        } while (true);
        Log.d("PhoneUtils", "############## END dumpCallManager() ###############");
    }

    static void dumpCallState(Phone phone)
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        Log.d("PhoneUtils", "dumpCallState():");
        Log.d("PhoneUtils", (new StringBuilder()).append("- Phone: ").append(phone).append(", name = ").append(phone.getPhoneName()).append(", state = ").append(phone.getState()).toString());
        if (GeminiUtils.isGeminiSupport())
        {
            int ai[] = GeminiUtils.getSlots();
            int i = ai.length;
            for (int j = 0; j < i; j++)
            {
                int k = ai[j];
                Log.d("PhoneUtils", (new StringBuilder()).append("- GeminiPhone slot=").append(k).append(", name=").append(phone.getPhoneName()).append(", state=").append(((GeminiPhone)phone).getStateGemini(k)).toString());
            }

        }
        StringBuilder stringbuilder = new StringBuilder(128);
        Call call = phone.getForegroundCall();
        stringbuilder.setLength(0);
        stringbuilder.append("  - FG call: ").append(call.getState());
        stringbuilder.append(" isAlive ").append(call.getState().isAlive());
        stringbuilder.append(" isRinging ").append(call.getState().isRinging());
        stringbuilder.append(" isDialing ").append(call.getState().isDialing());
        stringbuilder.append(" isIdle ").append(call.isIdle());
        stringbuilder.append(" hasConnections ").append(call.hasConnections());
        Log.d("PhoneUtils", stringbuilder.toString());
        Call call1 = phone.getBackgroundCall();
        stringbuilder.setLength(0);
        stringbuilder.append("  - BG call: ").append(call1.getState());
        stringbuilder.append(" isAlive ").append(call1.getState().isAlive());
        stringbuilder.append(" isRinging ").append(call1.getState().isRinging());
        stringbuilder.append(" isDialing ").append(call1.getState().isDialing());
        stringbuilder.append(" isIdle ").append(call1.isIdle());
        stringbuilder.append(" hasConnections ").append(call1.hasConnections());
        Log.d("PhoneUtils", stringbuilder.toString());
        Call call2 = phone.getRingingCall();
        stringbuilder.setLength(0);
        stringbuilder.append("  - RINGING call: ").append(call2.getState());
        stringbuilder.append(" isAlive ").append(call2.getState().isAlive());
        stringbuilder.append(" isRinging ").append(call2.getState().isRinging());
        stringbuilder.append(" isDialing ").append(call2.getState().isDialing());
        stringbuilder.append(" isIdle ").append(call2.isIdle());
        stringbuilder.append(" hasConnections ").append(call2.hasConnections());
        Log.d("PhoneUtils", stringbuilder.toString());
        boolean flag;
        if (!phone.getRingingCall().isIdle())
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!phone.getForegroundCall().isIdle())
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (!phone.getBackgroundCall().isIdle())
            flag2 = true;
        else
            flag2 = false;
        boolean flag3;
        if (flag1 && flag2)
            flag3 = true;
        else
            flag3 = false;
        stringbuilder.setLength(0);
        stringbuilder.append("  - hasRingingCall ").append(flag);
        stringbuilder.append(" hasActiveCall ").append(flag1);
        stringbuilder.append(" hasHoldingCall ").append(flag2);
        stringbuilder.append(" allLinesTaken ").append(flag3);
        Log.d("PhoneUtils", stringbuilder.toString());
        if (phone.getPhoneType() == 2)
            if (phoneglobals.cdmaPhoneCallState != null)
                Log.d("PhoneUtils", (new StringBuilder()).append("  - CDMA call state: ").append(phoneglobals.cdmaPhoneCallState.getCurrentCallState()).toString());
            else
                Log.d("PhoneUtils", "  - CDMA device, but null cdmaPhoneCallState!");
        boolean flag4 = phoneglobals.getRinger().isRinging();
        Log.d("PhoneUtils", (new StringBuilder()).append("  - Ringer state: ").append(flag4).toString());
    }

    static String formatProviderUri(Uri uri)
    {
        if (uri != null)
        {
            if ("tel".equals(uri.getScheme()))
                return PhoneNumberUtils.formatNumber(uri.getSchemeSpecificPart());
            else
                return uri.toString();
        } else
        {
            return null;
        }
    }

    public static android.provider.Telephony.SIMInfo getActiveSimInfo()
    {
        boolean flag = GeminiUtils.isGeminiSupport();
        android.provider.Telephony.SIMInfo siminfo = null;
        if (flag)
        {
            int i = GeminiUtils.getSlotNotIdle(PhoneGlobals.getInstance().phone);
            if (i == -1)
            {
                int ai[] = GeminiUtils.getSlots();
                int j = ai.length;
                int k = 0;
label0:
                do
                {
label1:
                    {
                        if (k < j)
                        {
                            int l = ai[k];
                            if (GeminiUtils.getPendingMmiCodes(PhoneGlobals.getInstance().phone, l).size() == 0)
                                break label1;
                            i = l;
                        }
                        log((new StringBuilder()).append("updateSimIndicator, running mmi, slot = ").append(i).toString());
                        break label0;
                    }
                    k++;
                } while (true);
            } else
            {
                siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(i);
                if (siminfo != null)
                {
                    log((new StringBuilder()).append("updateSimIndicator slot = ").append(i).append(" simInfo :").toString());
                    log((new StringBuilder()).append("displayName = ").append(siminfo.mDisplayName).toString());
                    log((new StringBuilder()).append("color       = ").append(siminfo.mColor).toString());
                    return siminfo;
                }
            }
        }
        return siminfo;
    }

    public static int getAudioControlState()
    {
        return sAudioBehaviourState;
    }

    public static CallerInfo getCallerInfo(Context context, Connection connection)
    {
        CallerInfo callerinfo = null;
        if (connection != null)
        {
            Object obj = connection.getUserData();
            if (obj instanceof Uri)
            {
                callerinfo = CallerInfo.getCallerInfo(context, (Uri)obj);
                if (callerinfo != null)
                    connection.setUserData(callerinfo);
            } else
            {
                if (obj instanceof CallerInfoToken)
                    callerinfo = ((CallerInfoToken)obj).currentInfo;
                else
                    callerinfo = (CallerInfo)obj;
                if (callerinfo == null)
                {
                    String s = connection.getAddress();
                    log((new StringBuilder()).append("getCallerInfo: number = ").append(s).toString());
                    if (!TextUtils.isEmpty(s))
                    {
                        int i = GeminiUtils.getSlotNotIdle(PhoneGlobals.getInstance().phone);
                        log((new StringBuilder()).append("simId=").append(i).toString());
                        callerinfo = GeminiUtils.getCallerInfo(context, s, i);
                        if (callerinfo != null)
                        {
                            connection.setUserData(callerinfo);
                            return callerinfo;
                        }
                    }
                }
            }
        }
        return callerinfo;
    }

    public static String getCompactNameFromCallerInfo(CallerInfo callerinfo, Context context)
    {
        log((new StringBuilder()).append("getCompactNameFromCallerInfo: info = ").append(callerinfo).toString());
        String s = null;
        if (callerinfo != null)
            if (TextUtils.isEmpty(callerinfo.name))
                s = modifyForSpecialCnapCases(context, callerinfo, callerinfo.phoneNumber, callerinfo.numberPresentation);
            else
                s = callerinfo.name;
        if (s == null || TextUtils.isEmpty(s))
            if (callerinfo != null && callerinfo.numberPresentation == PhoneConstants.PRESENTATION_RESTRICTED)
                s = context.getString(0x7f0d0177);
            else
            if (callerinfo != null && callerinfo.numberPresentation == PhoneConstants.PRESENTATION_PAYPHONE)
                s = context.getString(0x7f0d0178);
            else
                s = context.getString(0x7f0d0176);
        log((new StringBuilder()).append("getCompactNameFromCallerInfo: compactName=").append(s).toString());
        return s;
    }

    public static int getDefaultStorageType()
    {
        StorageManager storagemanager = (StorageManager)PhoneGlobals.getInstance().getSystemService("storage");
        if (storagemanager != null)
        {
            String s = StorageManagerEx.getDefaultPath();
            StorageVolume astoragevolume[] = storagemanager.getVolumeList();
            if (astoragevolume != null && storagemanager.getVolumeState(s).equals("mounted"))
            {
                log((new StringBuilder()).append("volumes.length:").append(astoragevolume.length).toString());
                for (int i = 0; i < astoragevolume.length; i++)
                    if (astoragevolume[i].getPath().equals(s))
                        return !astoragevolume[i].isRemovable() ? 0 : 1;

            }
        }
        return -1;
    }

    public static long getDiskAvailableSize()
    {
        File file = new File(StorageManagerEx.getDefaultPath());
        StatFs statfs;
        if (!file.exists() || !file.isDirectory())
            break MISSING_BLOCK_LABEL_49;
        statfs = new StatFs(file.getPath());
        return (long)statfs.getBlockSize() * (long)statfs.getAvailableBlocks();
        try
        {
            log("-----diskSpaceAvailable: sdCardDirectory is null----");
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            log("-----diskSpaceAvailable: IllegalArgumentException----");
            return -1L;
        }
        return -1L;
    }

    public static String getECMCardTitle(Context context, Phone phone)
    {
        String s = phone.getLine1Number();
        String s1;
        if (!TextUtils.isEmpty(s))
            s1 = PhoneNumberUtils.formatNumber(s);
        else
            s1 = context.getString(0x7f0d0176);
        return String.format(context.getString(0x7f0d02c2), new Object[] {
            s1
        });
    }

    static int getExpectedAudioMode()
    {
        CallManager callmanager = PhoneGlobals.getInstance().mCM;
        switch (_cls5..SwitchMap.com.android.internal.telephony.PhoneConstants.State[callmanager.getState().ordinal()])
        {
        case 2: // '\002'
            Phone phone = callmanager.getFgPhone();
            if (callmanager.getActiveFgCallState() != com.android.internal.telephony.Call.State.IDLE && callmanager.getActiveFgCallState() != com.android.internal.telephony.Call.State.DISCONNECTED && !(phone instanceof SipPhone))
                return 2;
            break;

        case 1: // '\001'
            return 1;

        default:
            log("cm.getState() is neither RINGING nor OFFHOOK in getExpectedAudioMode().");
            break;
        }
        return 0;
    }

    public static String getExternalStorageDefaultPath()
    {
        return StorageManagerEx.getDefaultPath();
    }

    public static String getInitialNumber(Intent intent)
        throws VoiceMailNumberMissingException
    {
        log((new StringBuilder()).append("getInitialNumber(): ").append(intent).toString());
        if (TextUtils.isEmpty(intent.getAction()))
            return null;
        if (intent.hasExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL"))
        {
            String s = intent.getStringExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL");
            log((new StringBuilder()).append("==> got EXTRA_ACTUAL_NUMBER_TO_DIAL; returning '").append(toLogSafePhoneNumber(s)).append("'").toString());
            return s;
        } else
        {
            return getNumberFromIntent(PhoneGlobals.getInstance(), intent);
        }
    }

    public static boolean getMmiFinished()
    {
        return sMmiFinished;
    }

    public static int getMountedStorageCount()
    {
        StorageManager storagemanager = (StorageManager)PhoneGlobals.getInstance().getSystemService("storage");
        if (storagemanager != null)
        {
            StorageManagerEx.getDefaultPath();
            StorageVolume astoragevolume[] = storagemanager.getVolumeList();
            if (astoragevolume != null)
            {
                log((new StringBuilder()).append("volumes.length:").append(astoragevolume.length).toString());
                int i = 0;
                for (int j = 0; j < astoragevolume.length; j++)
                    if (storagemanager.getVolumeState(astoragevolume[j].getPath()).equals("mounted"))
                        i++;

                log((new StringBuilder()).append("volumes count:").append(i).toString());
                return i;
            }
        }
        return 0;
    }

    public static boolean getMute()
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (phoneglobals.getResources().getBoolean(0x7f0a000a))
            return ((AudioManager)phoneglobals.getSystemService("audio")).isMicrophoneMute();
        else
            return phoneglobals.mCM.getMute();
    }

    static String getNumberFromIntent(Context context, Intent intent)
        throws VoiceMailNumberMissingException
    {
        Uri uri = intent.getData();
        String s = uri.getScheme();
        String s1;
        if ("sip".equals(s))
        {
            s1 = uri.getSchemeSpecificPart();
        } else
        {
            s1 = PhoneNumberUtils.getNumberFromIntent(intent, context);
            if ("voicemail".equals(s) && (s1 == null || TextUtils.isEmpty(s1)))
                throw new VoiceMailNumberMissingException();
        }
        return s1;
    }

    static boolean getPhoneSwapStatus()
    {
        return sPhoneSwapStatus;
    }

    public static String getPresentationString(Context context, int i)
    {
        String s = context.getString(0x7f0d0176);
        if (i == PhoneConstants.PRESENTATION_RESTRICTED)
            s = context.getString(0x7f0d0177);
        else
        if (i == PhoneConstants.PRESENTATION_PAYPHONE)
            return context.getString(0x7f0d0178);
        return s;
    }

    static Uri getProviderGatewayUri(Intent intent)
    {
        String s = intent.getStringExtra("com.android.phone.extra.GATEWAY_URI");
        if (TextUtils.isEmpty(s))
            return null;
        else
            return Uri.parse(s);
    }

    static Drawable getProviderIcon(Context context, Intent intent)
    {
        String s = intent.getStringExtra("com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE");
        PackageManager packagemanager = context.getPackageManager();
        Drawable drawable;
        try
        {
            drawable = packagemanager.getApplicationIcon(s);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return null;
        }
        return drawable;
    }

    static CharSequence getProviderLabel(Context context, Intent intent)
    {
        String s = intent.getStringExtra("com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE");
        PackageManager packagemanager = context.getPackageManager();
        CharSequence charsequence;
        try
        {
            charsequence = packagemanager.getApplicationLabel(packagemanager.getApplicationInfo(s, 0));
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            return null;
        }
        return charsequence;
    }

    public static boolean getShouldSendToVoiceMailFlag(Connection connection)
    {
        log("getShouldSendToVoiceMailFlag()");
        if (connection == null)
        {
            log("getShouldSendToVoiceMailFlag(), connection is null");
        } else
        {
            Object obj = connection.getUserData();
            if (obj instanceof CallerInfo)
            {
                CallerInfo callerinfo = (CallerInfo)obj;
                log((new StringBuilder()).append("instanceof CallerInfo, flag is ").append(callerinfo.shouldSendToVoicemail).toString());
                return callerinfo.shouldSendToVoicemail;
            }
        }
        return false;
    }

    public static android.provider.Telephony.SIMInfo getSimInfoByCall(Call call)
    {
        android.provider.Telephony.SIMInfo siminfo;
label0:
        {
            if (call != null && call.getPhone() != null)
            {
                Phone phone = call.getPhone();
                if (phone.getPhoneType() == 2)
                    return SIMInfoWrapper.getDefault().getSimInfoBySlot(GeminiUtils.getCDMASlot());
                String s = phone.getIccSerialNumber();
                int ai[] = GeminiUtils.getSlots();
                int i = ai.length;
                for (int j = 0; j < i; j++)
                {
                    int k = ai[j];
                    siminfo = SIMInfoWrapper.getDefault().getSimInfoBySlot(k);
                    if (siminfo != null && siminfo.mICCId != null && siminfo.mICCId.equals(s))
                        break label0;
                }

                return null;
            }
            siminfo = null;
        }
        return siminfo;
    }

    public static Phone getSipPhoneFromUri(CallManager callmanager, String s)
    {
        for (Iterator iterator = callmanager.getAllPhones().iterator(); iterator.hasNext();)
        {
            Phone phone = (Phone)iterator.next();
            if (phone.getPhoneType() == 3 && s.equals(((SipPhone)phone).getSipUri()))
            {
                log((new StringBuilder()).append("- pickPhoneBasedOnNumber:found SipPhone! obj = ").append(phone).append(", ").append(phone.getClass()).toString());
                return phone;
            }
        }

        return null;
    }

    static boolean handleHeadsetHook(Phone phone, KeyEvent keyevent)
    {
        log((new StringBuilder()).append("handleHeadsetHook()...").append(keyevent.getAction()).append(" ").append(keyevent.getRepeatCount()).toString());
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            return false;
        boolean flag;
        if (!phone.getRingingCall().isIdle())
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (!phone.getForegroundCall().isIdle())
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (!phone.getBackgroundCall().isIdle())
            flag2 = true;
        else
            flag2 = false;
        if (flag && keyevent.getRepeatCount() == 0 && keyevent.getAction() == 1)
        {
            int i = phone.getPhoneType();
            if (i == 2)
            {
                answerCall(phone.getRingingCall());
            } else
            {
                if (i != 1 && i != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                if (flag1 && flag2)
                {
                    log("handleHeadsetHook: ringing (both lines in use) ==> answer!");
                    answerAndEndActive(phoneglobals.mCM, phone.getRingingCall());
                } else
                {
                    log("handleHeadsetHook: ringing ==> answer!");
                    answerCall(phone.getRingingCall());
                }
            }
        } else
        if (keyevent.isLongPress())
        {
            log("handleHeadsetHook: longpress -> hangup");
            hangup(phoneglobals.mCM);
        } else
        if (keyevent.getAction() == 1 && keyevent.getRepeatCount() == 0)
        {
            Connection connection = phone.getForegroundCall().getLatestConnection();
            if (connection != null && !PhoneNumberUtils.isLocalEmergencyNumber(connection.getAddress(), PhoneGlobals.getInstance()))
                if (getMute())
                {
                    log("handleHeadsetHook: UNmuting...");
                    setMute(false);
                } else
                {
                    log("handleHeadsetHook: muting...");
                    setMute(true);
                }
        }
        return true;
    }

    static void hangup(Connection connection)
    {
        if (connection == null)
            break MISSING_BLOCK_LABEL_8;
        connection.hangup();
        return;
        CallStateException callstateexception;
        callstateexception;
        Log.w("PhoneUtils", (new StringBuilder()).append("Connection hangup: caught ").append(callstateexception).toString(), callstateexception);
        return;
    }

    static boolean hangup(Call call)
    {
        CallManager callmanager;
        callmanager = PhoneGlobals.getInstance().mCM;
        if (call.getState() != com.android.internal.telephony.Call.State.ACTIVE || !callmanager.hasActiveBgCall() || callmanager.hasActiveRingingCall())
            break MISSING_BLOCK_LABEL_113;
        log("- hangup(Call): hangupForegroundResumeBackground...");
        DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        if (!DualTalkUtils.isSupportDualTalk() || !dualtalkutils.isDualTalkMultipleHoldCase())
            break MISSING_BLOCK_LABEL_73;
        callmanager.hangupForegroundResumeBackground(dualtalkutils.getFirstActiveBgCall());
        return true;
        try
        {
            callmanager.hangupForegroundResumeBackground(callmanager.getFirstActiveBgCall());
        }
        catch (CallStateException callstateexception)
        {
            Log.e("PhoneUtils", (new StringBuilder()).append("Call hangup: caught ").append(callstateexception).toString(), callstateexception);
            return false;
        }
        return true;
        if (call.getState() != com.android.internal.telephony.Call.State.ACTIVE || !callmanager.hasActiveBgCall() || !callmanager.hasActiveRingingCall())
            break MISSING_BLOCK_LABEL_202;
        Call call1 = callmanager.getActiveFgCall();
        Call call2 = callmanager.getFirstActiveBgCall();
        if (call1.getPhone() != call2.getPhone() || call1.getPhone().getPhoneType() != 1 || callmanager.getRingingPhone().getPhoneType() != 3)
            break MISSING_BLOCK_LABEL_196;
        callmanager.hangupActiveCall(call);
        return true;
        call.hangup();
        return true;
        log("- hangup(Call): regular hangup()...");
        call.hangup();
        return true;
    }

    public static boolean hangup(CallManager callmanager)
    {
        Call call = null;
        boolean flag = DualTalkUtils.isSupportDualTalk();
        DualTalkUtils dualtalkutils = null;
        if (flag)
            dualtalkutils = DualTalkUtils.getInstance();
        if (DualTalkUtils.isSupportDualTalk() && dualtalkutils.hasMultipleRingingCall())
        {
            hangupForDualTalk(dualtalkutils.getFirstActiveRingingCall());
            return true;
        }
        Call call1;
        Call call2;
        if (DualTalkUtils.isSupportDualTalk() && dualtalkutils.hasDualHoldCallsOnly())
        {
            call2 = dualtalkutils.getFirstActiveBgCall();
            call1 = dualtalkutils.getFirstActiveRingingCall();
        } else
        if (DualTalkUtils.isSupportDualTalk() && dualtalkutils.isDualTalkMultipleHoldCase())
        {
            call2 = dualtalkutils.getActiveFgCall();
            call1 = dualtalkutils.getFirstActiveRingingCall();
            call = null;
        } else
        {
            call1 = callmanager.getFirstActiveRingingCall();
            call2 = callmanager.getActiveFgCall();
            call = callmanager.getFirstActiveBgCall();
        }
        boolean flag1;
        if (!call1.isIdle())
        {
            log("hangup(): hanging up ringing call");
            flag1 = hangupRingingCall(call1);
        } else
        if (call2.isIdle() && call2.state != com.android.internal.telephony.Call.State.DISCONNECTING)
        {
            if (call.isIdle() && call.state != com.android.internal.telephony.Call.State.DISCONNECTING)
            {
                log("hangup(): no active call to hang up");
                flag1 = false;
            } else
            {
                log("hangup(): hanging up background call");
                flag1 = hangup(call);
            }
        } else
        {
            log("hangup(): hanging up foreground call");
            flag1 = hangup(call2);
        }
        log((new StringBuilder()).append("==> hungup = ").append(flag1).toString());
        return flag1;
    }

    static boolean hangupActiveCall(Call call)
    {
        log("hangup active call");
        return hangup(call);
    }

    public static void hangupAllCalls()
    {
        hangupAllCalls(false, null);
    }

    public static void hangupAllCalls(boolean flag, Call call)
    {
        List list = PhoneGlobals.getInstance().mCM.getAllPhones();
        Iterator iterator = list.iterator();
_L10:
        if (!iterator.hasNext()) goto _L2; else goto _L1
_L1:
        Phone phone;
        Call call1;
        Call call2;
        Call call3;
        phone = (Phone)iterator.next();
        call1 = phone.getForegroundCall();
        call2 = phone.getBackgroundCall();
        call3 = phone.getRingingCall();
        if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
            break MISSING_BLOCK_LABEL_328;
        if (phone instanceof SipPhone) goto _L4; else goto _L3
_L3:
        log((new StringBuilder()).append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
        if (call1 == null) goto _L6; else goto _L5
_L5:
        if (!call1.getState().isAlive() || call2 == null) goto _L6; else goto _L7
_L7:
        if (!call2.getState().isAlive()) goto _L6; else goto _L8
_L8:
        phone.hangupAll();
_L14:
        if (!flag || call3 == null || call3 == call) goto _L10; else goto _L9
_L9:
        call3.hangup();
          goto _L10
        CallStateException callstateexception;
        callstateexception;
        log(callstateexception.toString());
_L2:
        return;
_L6:
        if (call1 == null) goto _L12; else goto _L11
_L11:
        if (!call1.getState().isAlive()) goto _L12; else goto _L13
_L13:
        call1.hangup();
          goto _L14
_L12:
        if (call2 == null) goto _L14; else goto _L15
_L15:
        if (!call2.getState().isAlive()) goto _L14; else goto _L16
_L16:
        call2.hangup();
          goto _L14
_L4:
        log((new StringBuilder()).append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
        if (call1 == null) goto _L18; else goto _L17
_L17:
        if (call1.getState().isAlive())
            call1.hangup();
_L18:
        if (call2 == null) goto _L14; else goto _L19
_L19:
        if (!call2.getState().isAlive()) goto _L14; else goto _L20
_L20:
        call2.hangup();
          goto _L14
        log((new StringBuilder()).append("Phone is idle  ").append(phone.toString()).append("   ").append(phone.getClass().toString()).toString());
          goto _L10
    }

    public static void hangupForDualTalk(Call call)
    {
        call.getPhone();
        try
        {
            call.hangup();
            return;
        }
        catch (CallStateException callstateexception)
        {
            Log.d("PhoneUtils", callstateexception.toString());
        }
    }

    static boolean hangupHoldingCall(Call call)
    {
        log("hangup holding call");
        return hangup(call);
    }

    static boolean hangupRingingAndActive(Phone phone)
    {
label0:
        {
            InCallScreen incallscreen;
label1:
            {
                if (DualTalkUtils.isSupportDualTalk())
                {
                    DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
                    incallscreen = PhoneGlobals.getInstance().getInCallScreenInstance();
                    if (dualtalkutils != null && incallscreen != null && (dualtalkutils.hasMultipleRingingCall() || dualtalkutils.isCdmaAndGsmActive() && PhoneGlobals.getInstance().mCM.hasActiveRingingCall()))
                        break label1;
                }
                Call call = phone.getRingingCall();
                Call call1 = phone.getForegroundCall();
                boolean flag = call.isIdle();
                boolean flag1 = false;
                if (!flag)
                {
                    log("hangupRingingAndActive: Hang up Ringing Call");
                    flag1 = hangupRingingCall(call);
                }
                boolean flag2 = call1.isIdle();
                boolean flag3 = false;
                if (!flag2)
                {
                    log("hangupRingingAndActive: Hang up Foreground Call");
                    flag3 = hangupActiveCall(call1);
                }
                if (!flag1 && !flag3)
                    return false;
                break label0;
            }
            incallscreen.hangupRingingCall();
        }
        return true;
    }

    static boolean hangupRingingCall(Call call)
    {
        log("hangup ringing call");
        int i = call.getPhone().getPhoneType();
        com.android.internal.telephony.Call.State state = call.getState();
        if (state == com.android.internal.telephony.Call.State.INCOMING)
        {
            log("hangupRingingCall(): regular incoming call: hangup()");
            return hangup(call);
        }
        if (state == com.android.internal.telephony.Call.State.WAITING)
        {
            if (i == 2)
            {
                log("hangupRingingCall(): CDMA-specific call-waiting hangup");
                PhoneGlobals.getInstance().notifier.sendCdmaCallWaitingReject();
                return true;
            } else
            {
                log("hangupRingingCall(): call-waiting call: hangup()");
                return hangup(call);
            }
        } else
        {
            Log.w("PhoneUtils", "hangupRingingCall: no INCOMING or WAITING call");
            return false;
        }
    }

    static boolean hasActivefgEccCall(Call call)
    {
        if (call != null)
        {
            Connection connection = call.getEarliestConnection();
            if ((call.getState() == com.android.internal.telephony.Call.State.DIALING || call.getState() == com.android.internal.telephony.Call.State.ALERTING) && connection != null && !TextUtils.isEmpty(connection.getAddress()) && PhoneNumberUtils.isEmergencyNumber(connection.getAddress()))
                return true;
        }
        return false;
    }

    public static boolean hasActivefgEccCall(CallManager callmanager)
    {
        return hasActivefgEccCall(callmanager.getActiveFgCall());
    }

    private static final boolean hasDisconnectedConnections(Call call)
    {
        for (Iterator iterator = call.getConnections().iterator(); iterator.hasNext();)
            if (!((Connection)iterator.next()).isAlive())
                return true;

        return false;
    }

    static boolean hasDisconnectedConnections(CallManager callmanager)
    {
        return hasDisconnectedConnections(callmanager.getActiveFgCall()) || hasDisconnectedConnections(callmanager.getFirstActiveBgCall()) || hasDisconnectedConnections(callmanager.getFirstActiveRingingCall());
    }

    public static boolean hasMultipleConnections(Call call)
    {
        boolean flag = true;
        if (call == null)
            return false;
        if (call.getConnections().size() <= flag)
            flag = false;
        return flag;
    }

    public static boolean hasMultiplePhoneActive()
    {
        CallManager callmanager = PhoneGlobals.getInstance().mCM;
        if (callmanager != null && callmanager.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            List list = callmanager.getAllPhones();
            log((new StringBuilder()).append("CallManager says in idle state!").append(list).toString());
            int i = 0;
            for (Iterator iterator = list.iterator(); iterator.hasNext();)
            {
                Phone phone = (Phone)iterator.next();
                if (phone.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                {
                    i++;
                    log((new StringBuilder()).append("non IDLE phone = ").append(phone.toString()).toString());
                    if (i > 1)
                    {
                        log("More than one phone active!");
                        return true;
                    }
                }
            }

            log("Strange! no phone active but we go here!");
            return false;
        } else
        {
            log("CallManager says in idle state!");
            return false;
        }
    }

    static boolean hasPhoneProviderExtras(Intent intent)
    {
        if (intent != null)
        {
            String s = intent.getStringExtra("com.android.phone.extra.GATEWAY_PROVIDER_PACKAGE");
            String s1 = intent.getStringExtra("com.android.phone.extra.GATEWAY_URI");
            if (!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s1))
                return true;
        }
        return false;
    }

    public static boolean holdAndActiveFromDifPhone(CallManager callmanager)
    {
        boolean flag2;
label0:
        {
            List list = callmanager.getAllPhones();
            boolean flag = false;
            Iterator iterator = list.iterator();
            do
            {
                do
                {
                    boolean flag1 = iterator.hasNext();
                    flag2 = false;
                    if (!flag1)
                        break label0;
                } while (((Phone)iterator.next()).getState() != com.android.internal.telephony.PhoneConstants.State.OFFHOOK);
                if (flag)
                    break;
                flag = true;
            } while (true);
            flag2 = true;
        }
        return flag2;
    }

    public static void initializeConnectionHandler(CallManager callmanager)
    {
        if (mConnectionHandler == null)
            mConnectionHandler = new ConnectionHandler();
        Object obj;
        if (GeminiUtils.isGeminiSupport())
            obj = PhoneGlobals.getInstance().mCMGemini;
        else
            obj = callmanager;
        GeminiRegister.registerForPreciseCallStateChanged(obj, mConnectionHandler, -1, callmanager);
    }

    static boolean isConferenceCall(Call call)
    {
label0:
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            int i = call.getPhone().getPhoneType();
            if (i == 2)
            {
                CdmaPhoneCallState.PhoneCallState phonecallstate = phoneglobals.cdmaPhoneCallState.getCurrentCallState();
                if (phonecallstate == CdmaPhoneCallState.PhoneCallState.CONF_CALL || phonecallstate == CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE && !phoneglobals.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                    break label0;
            } else
            {
                if (i == 1)
                    return call.isMultiparty();
                if (i == 3)
                {
                    if (com.android.internal.telephony.Call.State.INCOMING == call.getState())
                        call.getPhone().clearDisconnected();
                    List list = call.getConnections();
                    if (list != null && list.size() > 1)
                        break label0;
                }
            }
            return false;
        }
        return true;
    }

    public static boolean isDMLocked()
    {
        android.os.IBinder ibinder = ServiceManager.getService("DMAgent");
        DMAgent dmagent;
        dmagent = null;
        if (ibinder == null)
            break MISSING_BLOCK_LABEL_18;
        dmagent = com.mediatek.common.dm.DMAgent.Stub.asInterface(ibinder);
        boolean flag;
        flag = false;
        if (dmagent == null)
            break MISSING_BLOCK_LABEL_35;
        boolean flag1 = dmagent.isLockFlagSet();
        flag = flag1;
_L2:
        log((new StringBuilder()).append("isDMLocked(): locked = ").append(flag).toString());
        return flag;
        RemoteException remoteexception;
        remoteexception;
        remoteexception.printStackTrace();
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    static boolean isEccCall(Call call)
    {
        Connection connection = call.getEarliestConnection();
        return connection != null && !TextUtils.isEmpty(connection.getAddress()) && PhoneNumberUtils.isEmergencyNumber(connection.getAddress());
    }

    public static boolean isExternalStorageMounted()
    {
        StorageManager storagemanager = (StorageManager)PhoneGlobals.getInstance().getSystemService("storage");
        if (storagemanager == null)
            log("-----story manager is null----");
        else
        if (storagemanager.getVolumeState(StorageManagerEx.getDefaultPath()).equals("mounted"))
            return true;
        return false;
    }

    public static boolean isLandscape(Context context)
    {
        return context.getResources().getConfiguration().orientation == 2;
    }

    static boolean isNoiseSuppressionOn(Context context)
    {
        if (context.getResources().getBoolean(0x7f0a000b))
        {
            String s = ((AudioManager)context.getSystemService("audio")).getParameters("noise_suppression");
            log((new StringBuilder()).append("isNoiseSuppressionOn: ").append(s).toString());
            if (!s.contains("off"))
                return true;
        }
        return false;
    }

    public static boolean isPhoneInEcm(Phone phone)
    {
        if (phone != null && TelephonyCapabilities.supportsEcm(phone))
        {
            String s = SystemProperties.get("ril.cdma.inecmmode");
            if (s != null)
                return s.equals("true");
        }
        return false;
    }

    public static boolean isRealIncomingCall(com.android.internal.telephony.Call.State state)
    {
        return state == com.android.internal.telephony.Call.State.INCOMING && !PhoneGlobals.getInstance().mCM.hasActiveFgCall() && !PhoneGlobals.getInstance().mCM.hasActiveBgCall();
    }

    static boolean isRoutableViaGateway(String s)
    {
        if (!TextUtils.isEmpty(s))
        {
            String s1 = PhoneNumberUtils.stripSeparators(s);
            if (s1.equals(PhoneNumberUtils.convertKeypadLettersToDigits(s1)))
                return PhoneNumberUtils.isGlobalPhoneNumber(PhoneNumberUtils.extractNetworkPortion(s1));
        }
        return false;
    }

    public static boolean isShowUssdDialog()
    {
        return sUssdActivity != null;
    }

    static boolean isSpeakerOn(Context context)
    {
        return ((AudioManager)context.getSystemService("audio")).isSpeakerphoneOn();
    }

    public static boolean isSupportFeature(String s)
    {
        if (s != null)
        {
            if (s.equals("TTY"))
                return true;
            if (!s.equals("DUAL_MIC"))
            {
                if (s.equals("IP_DIAL"))
                    return true;
                if (!s.equals("3G_SWITCH"))
                {
                    if (s.equals("VT_VOICE_RECORDING"))
                        return true;
                    if (s.equals("VT_VIDEO_RECORDING"))
                        return true;
                    if (s.equals("PHONE_VOICE_RECORDING"))
                        return true;
                }
            }
        }
        return false;
    }

    public static boolean isVideoCall(Call call)
    {
        if (call != null)
        {
            Connection connection = call.getLatestConnection();
            if (connection != null)
                return connection.isVideo();
        }
        return false;
    }

    static boolean isVoicemailNumber(Uri uri)
    {
        return uri != null && "voicemail".equals(uri.getScheme().toString());
    }

    public static boolean isVoicemailNumber(String s, int i, Phone phone)
    {
        if (phone == null || !(phone instanceof SipPhone))
        {
            String s1 = GeminiUtils.getVoiceMailNumber(i);
            if (s1 != null && PhoneNumberUtils.compare(s1, s))
                return true;
        }
        return false;
    }

    public static boolean isVoipSupported()
    {
        return sVoipSupported;
    }

    private static void log(String s)
    {
        Log.d("PhoneUtils", s);
    }

    static void mergeCalls()
    {
        mergeCalls(PhoneGlobals.getInstance().mCM);
    }

    static void mergeCalls(CallManager callmanager)
    {
        int i;
        DualTalkUtils dualtalkutils;
        i = callmanager.getFgPhone().getPhoneType();
        dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        if (DualTalkUtils.isSupportDualTalk())
        {
            Call call1 = dualtalkutils.getActiveFgCall();
            if (call1 != null)
                i = call1.getPhone().getPhoneType();
        }
        if (i != 2) goto _L2; else goto _L1
_L1:
        PhoneGlobals phoneglobals;
        log("mergeCalls(): CDMA...");
        phoneglobals = PhoneGlobals.getInstance();
        if (phoneglobals.cdmaPhoneCallState.getCurrentCallState() != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE) goto _L4; else goto _L3
_L3:
        phoneglobals.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.CONF_CALL);
        log("- sending flash...");
        switchHoldingAndActive(callmanager.getFirstActiveBgCall());
_L6:
        return;
_L4:
        if (!DualTalkUtils.isSupportDualTalk()) goto _L6; else goto _L5
_L5:
        Call call = dualtalkutils.getActiveFgCall();
        log("For this case, we don't know how to do exactly, so just switch the cdma call");
        try
        {
            call.getPhone().switchHoldingAndActive();
            return;
        }
        catch (CallStateException callstateexception1)
        {
            log(callstateexception1.toString());
        }
        return;
_L2:
        try
        {
            log("mergeCalls(): calling cm.conference()...");
            if (DualTalkUtils.isSupportDualTalk() && dualtalkutils.isDualTalkMultipleHoldCase())
            {
                callmanager.conference(dualtalkutils.getFirstActiveBgCall());
                return;
            }
            break MISSING_BLOCK_LABEL_251;
        }
        catch (CallStateException callstateexception)
        {
            Log.w("PhoneUtils", (new StringBuilder()).append("mergeCalls: caught ").append(callstateexception).toString(), callstateexception);
        }
        if (i != 3 && !isLandscape(PhoneGlobals.getInstance().getInCallScreenInstance())) goto _L6; else goto _L7
_L7:
        InCallScreen incallscreen;
        AsyncResult asyncresult;
        incallscreen = PhoneGlobals.getInstance().getInCallScreenInstance();
        asyncresult = new AsyncResult(null, com.android.internal.telephony.Phone.SuppService.CONFERENCE, null);
        if (incallscreen == null) goto _L6; else goto _L8
_L8:
        incallscreen.onSuppServiceFailed(asyncresult);
        return;
        callmanager.conference(callmanager.getFirstActiveBgCall());
        return;
    }

    static String modifyForSpecialCnapCases(Context context, CallerInfo callerinfo, String s, int i)
    {
        if (callerinfo != null && s != null)
        {
            log((new StringBuilder()).append("modifyForSpecialCnapCases: initially, number=").append(s).append(", presentation=").append(i).append(" ci ").append(callerinfo).toString());
            if (Arrays.asList(context.getResources().getStringArray(0x7f07003a)).contains(s) && i == PhoneConstants.PRESENTATION_ALLOWED)
            {
                s = context.getString(0x7f0d0176);
                callerinfo.numberPresentation = PhoneConstants.PRESENTATION_UNKNOWN;
            }
            if (callerinfo.numberPresentation == PhoneConstants.PRESENTATION_ALLOWED || callerinfo.numberPresentation != i && i == PhoneConstants.PRESENTATION_ALLOWED)
            {
                int j = checkCnapSpecialCases(s);
                if (j != -1)
                {
                    if (j == PhoneConstants.PRESENTATION_RESTRICTED)
                        s = context.getString(0x7f0d0177);
                    else
                    if (j == PhoneConstants.PRESENTATION_UNKNOWN)
                        s = context.getString(0x7f0d0176);
                    log((new StringBuilder()).append("SpecialCnap: number=").append(toLogSafePhoneNumber(s)).append("; presentation now=").append(j).toString());
                    callerinfo.numberPresentation = j;
                }
            }
            log((new StringBuilder()).append("modifyForSpecialCnapCases: returning number string=").append(toLogSafePhoneNumber(s)).toString());
            return s;
        } else
        {
            return s;
        }
    }

    static boolean okToAddCall(CallManager callmanager)
    {
        boolean flag = true;
        Phone phone = callmanager.getActiveFgCall().getPhone();
        if (isPhoneInEcm(phone))
        {
            flag = false;
        } else
        {
            int i = phone.getPhoneType();
            com.android.internal.telephony.Call.State state = callmanager.getActiveFgCall().getState();
            if (i == 2)
            {
                PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
                if (state != com.android.internal.telephony.Call.State.ACTIVE || !phoneglobals.cdmaPhoneCallState.getAddCallMenuStateAfterCallWaiting())
                    return false;
            } else
            {
                if (i != flag && i != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                boolean flag1 = callmanager.hasActiveRingingCall();
                boolean flag2 = callmanager.hasActiveFgCall();
                boolean flag3 = callmanager.hasActiveBgCall();
                int j;
                if (flag2 && flag3)
                    j = ((flag) ? 1 : 0);
                else
                    j = 0;
                if (DualTalkUtils.isSupportDualTalk() && j != 0)
                    if (!PhoneGlobals.getInstance().notifier.mDualTalk.canAddCallForDualTalk())
                        j = ((flag) ? 1 : 0);
                    else
                        j = 0;
                if (flag1 || j != 0 || state != com.android.internal.telephony.Call.State.ACTIVE && state != com.android.internal.telephony.Call.State.IDLE && state != com.android.internal.telephony.Call.State.DISCONNECTED)
                    return false;
            }
        }
        return flag;
    }

    static boolean okToMergeCalls(CallManager callmanager)
    {
        int i = callmanager.getFgPhone().getPhoneType();
        DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        if (DualTalkUtils.isSupportDualTalk())
        {
            Call call = dualtalkutils.getActiveFgCall();
            if (call != null)
                i = call.getPhone().getPhoneType();
        }
        if (i == 2)
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            if (phoneglobals.cdmaPhoneCallState.getCurrentCallState() != CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE || phoneglobals.cdmaPhoneCallState.IsThreeWayCallOrigStateDialing())
                return false;
        } else
        if (callmanager.hasActiveRingingCall() || !callmanager.hasActiveFgCall() || callmanager.getActiveFgCall().getState() == com.android.internal.telephony.Call.State.DIALING || callmanager.getActiveFgCall().getState() == com.android.internal.telephony.Call.State.ALERTING || !callmanager.hasActiveBgCall() || !callmanager.canConference(callmanager.getFirstActiveBgCall()) && (!DualTalkUtils.isSupportDualTalk() || !PhoneGlobals.getInstance().notifier.mDualTalk.isDualTalkMultipleHoldCase()))
            return false;
        return true;
    }

    static boolean okToShowSwapButton(CallManager callmanager)
    {
        Call call = callmanager.getActiveFgCall();
        Call call1 = callmanager.getFirstActiveBgCall();
        DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        Call call2;
        if (dualtalkutils == null)
            call2 = null;
        else
            call2 = dualtalkutils.getActiveFgCall();
        return DualTalkUtils.isSupportDualTalk() && (dualtalkutils.isCdmaAndGsmActive() || call2 != null && call2.getPhone().getPhoneType() == 2 && hasMultipleConnections(call2)) || call.getState().isAlive() && call1.getState() == com.android.internal.telephony.Call.State.HOLDING || holdAndActiveFromDifPhone(callmanager);
    }

    static boolean okToSwapCalls(CallManager callmanager)
    {
        int i = callmanager.getDefaultPhone().getPhoneType();
        DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        if (DualTalkUtils.isSupportDualTalk())
        {
            Call call = dualtalkutils.getActiveFgCall();
            if (call != null)
                i = call.getPhone().getPhoneType();
        }
        if (!DualTalkUtils.isSupportDualTalk() || !dualtalkutils.isCdmaAndGsmActive())
            if (i == 2)
            {
                if (DualTalkUtils.isSupportDualTalk())
                    return false;
                if (PhoneGlobals.getInstance().cdmaPhoneCallState.getCurrentCallState() != CdmaPhoneCallState.PhoneCallState.CONF_CALL)
                    return false;
            } else
            {
                if (i != 1 && i != 3)
                    throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
                if (callmanager.hasActiveRingingCall() || callmanager.getActiveFgCall().getState() != com.android.internal.telephony.Call.State.ACTIVE && !hasActivefgEccCall(callmanager) || callmanager.getFirstActiveBgCall().getState() != com.android.internal.telephony.Call.State.HOLDING)
                    return false;
            }
        return true;
    }

    public static void openTTY()
    {
        if (PhoneGlobals.getInstance().isEnableTTY())
        {
            AudioManager audiomanager = (AudioManager)PhoneGlobals.getInstance().getSystemService("audio");
            if (!sTtyMode.equals("tty_off") && !sIsOpen)
            {
                audiomanager.setParameters((new StringBuilder()).append("tty_mode=").append(sTtyMode).toString());
                sIsOpen = true;
                return;
            }
        }
    }

    public static Phone pickPhoneBasedOnNumber(CallManager callmanager, String s, String s1, String s2)
    {
        StringBuilder stringbuilder = (new StringBuilder()).append("pickPhoneBasedOnNumber: scheme ").append(s).append(", number ").append(toLogSafePhoneNumber(s1)).append(", sipUri ");
        String s3;
        if (s2 != null)
            s3 = Uri.parse(s2).toSafeString();
        else
            s3 = "null";
        log(stringbuilder.append(s3).toString());
        if (s2 != null)
        {
            Phone phone = getSipPhoneFromUri(callmanager, s2);
            if (phone != null)
                return phone;
        }
        return GeminiUtils.getDefaultPhone();
    }

    public static int placeCall(Context context, Phone phone, String s, Uri uri, boolean flag, Uri uri1)
    {
        return placeCallGemini(context, phone, s, uri, flag, uri1, -1);
    }

    public static int placeCallGemini(Context context, Phone phone, String s, Uri uri, boolean flag, Uri uri1, int i)
    {
        log((new StringBuilder()).append("placeCall '").append(s).append("' GW:'").append(uri1).append("'").toString());
        if (PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            PhoneGlobals.getInstance().notifier.resetBeforeCall();
            setAudioMode();
        }
        byte byte0;
        if (!VTCallUtils.isVTIdle())
        {
            byte0 = 2;
        } else
        {
            PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
            boolean flag1 = false;
            if (uri1 != null)
            {
                flag1 = false;
                if (!flag)
                {
                    boolean flag8 = isRoutableViaGateway(s);
                    flag1 = false;
                    if (flag8)
                        flag1 = true;
                }
            }
            String s1;
            boolean flag2;
            boolean flag3;
            Object obj;
            Connection connection;
            int j;
            if (flag1)
            {
                if (uri1 == null || !"tel".equals(uri1.getScheme()))
                {
                    Log.e("PhoneUtils", (new StringBuilder()).append("Unsupported URL:").append(uri1).toString());
                    return 2;
                }
                s1 = uri1.getSchemeSpecificPart();
            } else
            {
                s1 = s;
            }
            if (phoneglobals.mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
                flag2 = true;
            else
                flag2 = false;
            if (phone.getPhoneType() == 3)
                flag3 = true;
            else
                flag3 = false;
            if (GeminiUtils.isGeminiSupport() && !flag3)
                obj = PhoneGlobals.getInstance().mCMGemini;
            else
                obj = PhoneGlobals.getInstance().mCM;
            try
            {
                connection = GeminiRegister.dial(obj, phone, s1, i);
            }
            catch (CallStateException callstateexception)
            {
                Log.w("PhoneUtils", "Exception from app.mCM.dial()", callstateexception);
                return 2;
            }
            j = GeminiUtils.getPhoneType(phone, i);
            if (connection == null)
                if (j == 1 && uri1 == null)
                {
                    log((new StringBuilder()).append("dialed MMI code: ").append(s).toString());
                    return 1;
                } else
                {
                    return 2;
                }
            if (j == 2)
            {
                updateCdmaCallStateOnNewOutgoingCall(phoneglobals);
                log("call updateCdmaCallStateOnNewOutgoingCall for cdma phone.");
            }
            if (j == 2)
                s = CdmaConnection.formatDialString(s);
            String s2 = PhoneNumberUtils.formatNumber(PhoneNumberUtils.convertKeypadLettersToDigits(PhoneNumberUtils.extractNetworkPortion(s)));
            if (uri1 == null)
            {
                context.getContentResolver();
                if (uri != null && uri.getScheme().equals("content"))
                {
                    Object obj1 = connection.getUserData();
                    boolean flag4;
                    boolean flag5;
                    boolean flag6;
                    if (obj1 == null)
                        connection.setUserData(uri);
                    else
                    if (obj1 instanceof CallerInfo)
                        ((CallerInfo)obj1).contactRefUri = uri;
                    else
                        ((CallerInfoToken)obj1).currentInfo.contactRefUri = uri;
                }
            } else
            {
                phone.getContext().getContentResolver();
                CallerInfo callerinfo = null;
                if (uri != null)
                {
                    boolean flag7 = uri.getScheme().equals("content");
                    callerinfo = null;
                    if (flag7)
                        callerinfo = CallerInfo.getCallerInfo(context, uri);
                }
                if (callerinfo == null)
                    callerinfo = GeminiUtils.getCallerInfo(context, s1, i);
                callerinfo.phoneNumber = s2;
                connection.setUserData(callerinfo);
            }
            log("about to activate speaker");
            flag4 = activateSpeakerIfDocked(phone);
            byte0 = 0;
            if (flag2)
            {
                byte0 = 0;
                if (!flag4)
                {
                    flag5 = isSpeakerOn(phoneglobals);
                    byte0 = 0;
                    if (flag5)
                    {
                        flag6 = phoneglobals.isBluetoothHeadsetAudioOn();
                        byte0 = 0;
                        if (!flag6)
                        {
                            Log.i("PhoneUtils", "Forcing speaker off when initiating a new outgoing call...");
                            turnOnSpeaker(phoneglobals, false, true);
                            return 0;
                        }
                    }
                }
            }
        }
        return byte0;
    }

    public static void placeCallRegister(Phone phone)
    {
        boolean flag;
        if (phone.getPhoneType() == 3)
            flag = true;
        else
            flag = false;
        log("placeCallRegister: ");
        Object obj;
        if (GeminiUtils.isGeminiSupport() && flag)
            obj = PhoneGlobals.getInstance().mCMGemini;
        else
            obj = PhoneGlobals.getInstance().mCM;
        GeminiRegister.registerForSpeechInfo(obj, mConnectionHandler, PHONE_SPEECH_INFO_GEMINI);
    }

    static Boolean restoreMuteState()
    {
label0:
        {
            Boolean boolean1;
label1:
            {
                Phone phone = PhoneGlobals.getInstance().mCM.getFgPhone();
                Connection connection;
                if (GeminiUtils.isGeminiSupport())
                    connection = PhoneGlobals.getInstance().mCM.getActiveFgCall().getEarliestConnection();
                else
                    connection = phone.getForegroundCall().getEarliestConnection();
                if (connection == null)
                    break label0;
                int i = phone.getPhoneType();
                if (i == 2)
                {
                    boolean1 = (Boolean)sConnectionMuteTable.get(phone.getForegroundCall().getLatestConnection());
                    break label1;
                }
                if (i != 1)
                {
                    boolean1 = null;
                    if (i != 3)
                        break label1;
                }
                boolean1 = (Boolean)sConnectionMuteTable.get(connection);
            }
            if (boolean1 == null)
            {
                log("problem retrieving mute value for this connection.");
                boolean1 = Boolean.FALSE;
            }
            setMute(boolean1.booleanValue());
            return boolean1;
        }
        return Boolean.valueOf(getMute());
    }

    static void restoreNoiseSuppression(Context context)
    {
        log((new StringBuilder()).append("restoreNoiseSuppression, restoring to: ").append(sIsNoiseSuppressionEnabled).toString());
        if (context.getResources().getBoolean(0x7f0a000b) && isNoiseSuppressionOn(context) != sIsNoiseSuppressionEnabled)
        {
            turnOnNoiseSuppression(context, sIsNoiseSuppressionEnabled, false);
            return;
        } else
        {
            return;
        }
    }

    static void restoreSpeakerMode(Context context)
    {
        log((new StringBuilder()).append("restoreSpeakerMode, restoring to: ").append(sIsSpeakerEnabled).toString());
        if (isSpeakerOn(context) != sIsSpeakerEnabled)
            turnOnSpeaker(context, sIsSpeakerEnabled, false);
    }

    static void sendEmptyFlash(Phone phone)
    {
        if (phone.getPhoneType() == 2 && phone.getForegroundCall().getState() == com.android.internal.telephony.Call.State.ACTIVE)
        {
            Log.d("PhoneUtils", "onReceive: (CDMA) sending empty flash to network");
            switchHoldingAndActive(phone.getBackgroundCall());
        }
    }

    public static void sendViewNotificationAsync(Context context, Uri uri)
    {
        Log.d("PhoneUtils", (new StringBuilder()).append("Send view notification to Contacts (uri: ").append(uri).append(")").toString());
        Intent intent = new Intent("com.android.contacts.VIEW_NOTIFICATION", uri);
        intent.setClassName("com.android.contacts", "com.android.contacts.ViewNotificationService");
        context.startService(intent);
    }

    static void separateCall(Connection connection)
    {
        try
        {
            log((new StringBuilder()).append("separateCall: ").append(toLogSafePhoneNumber(connection.getAddress())).toString());
            connection.separate();
            return;
        }
        catch (CallStateException callstateexception)
        {
            Log.w("PhoneUtils", (new StringBuilder()).append("separateCall: caught ").append(callstateexception).toString(), callstateexception);
        }
    }

    public static void setAudioControlState(int i)
    {
        sAudioBehaviourState = i;
    }

    static void setAudioMode()
    {
        setAudioMode(PhoneGlobals.getInstance().mCM);
    }

    static void setAudioMode(CallManager callmanager)
    {
        Log.d("PhoneUtils", (new StringBuilder()).append("setAudioMode()...").append(callmanager.getState()).toString());
        AudioManager audiomanager = (AudioManager)PhoneGlobals.getInstance().getSystemService("audio");
        int i = audiomanager.getMode();
        boolean flag;
        if (callmanager.getFgPhone().getPhoneType() == 3)
            flag = true;
        else
            flag = false;
        int j = getExpectedAudioMode();
        if (isSupportFeature("TTY") && !flag && j == 0 && !sTtyMode.equals("tty_off") && sIsOpen)
        {
            audiomanager.setParameters("tty_mode=tty_off");
            sIsOpen = false;
        }
        callmanager.setAudioMode();
        if (isSupportFeature("TTY") && !flag && j == 2 && !sTtyMode.equals("tty_off") && !sIsOpen)
        {
            audiomanager.setParameters((new StringBuilder()).append("tty_mode=").append(sTtyMode).toString());
            sIsOpen = true;
        }
        if (i != audiomanager.getMode())
        {
            return;
        } else
        {
            Log.d("PhoneUtils", (new StringBuilder()).append("setAudioMode() no change: ").append(audioModeToString(i)).toString());
            return;
        }
    }

    public static void setDualMicMode(String s)
    {
        Context context = PhoneGlobals.getInstance().getApplicationContext();
        if (context == null)
        {
            return;
        } else
        {
            ((AudioManager)context.getSystemService("audio")).setParameters((new StringBuilder()).append("Enable_Dual_Mic_Setting=").append(s).toString());
            return;
        }
    }

    public static void setMmiFinished(boolean flag)
    {
        sMmiFinished = flag;
    }

    static void setMute(boolean flag)
    {
        CallManager callmanager = PhoneGlobals.getInstance().mCM;
        setMuteInternal(callmanager.getFgPhone(), flag);
        Connection connection;
        for (Iterator iterator = callmanager.getActiveFgCall().getConnections().iterator(); iterator.hasNext(); sConnectionMuteTable.put(connection, Boolean.valueOf(flag)))
        {
            connection = (Connection)iterator.next();
            if (sConnectionMuteTable.get(connection) == null)
                log("problem retrieving mute value for this connection.");
        }

    }

    private static void setMuteInternal(Phone phone, boolean flag)
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (phone.getContext().getResources().getBoolean(0x7f0a000a))
        {
            AudioManager audiomanager = (AudioManager)phone.getContext().getSystemService("audio");
            log((new StringBuilder()).append("setMuteInternal: using setMicrophoneMute(").append(flag).append(")...").toString());
            audiomanager.setMicrophoneMute(flag);
        } else
        {
            log((new StringBuilder()).append("setMuteInternal: using phone.setMute(").append(flag).append(")...").toString());
            phone.setMute(flag);
        }
        phoneglobals.notificationMgr.updateMuteNotification();
    }

    static void setPhoneSwapStatus(boolean flag)
    {
        sPhoneSwapStatus = flag;
    }

    public static void setTtyMode(String s)
    {
        sTtyMode = s;
    }

    static void showIncomingCallUi()
    {
        log("showIncomingCallUi()...");
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        try
        {
            ActivityManagerNative.getDefault().closeSystemDialogs("call");
        }
        catch (RemoteException remoteexception)
        {
            log("RemoteException happened in showIncomingCallUi()...");
        }
        phoneglobals.requestWakeState(PhoneGlobals.WakeState.FULL);
        phoneglobals.displayCallScreen(true);
    }

    public static String specialNumberTransfer(String s)
    {
        if (s == null)
            return null;
        else
            return PhoneNumberUtils.stripSeparators(PhoneNumberUtils.convertKeypadLettersToDigits(s.replace('p', ',').replace('w', ';')));
    }

    public static CallerInfoToken startGetCallerInfo(Context context, Call call, com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener onquerycompletelistener, Object obj)
    {
        int i = call.getPhone().getPhoneType();
        Connection connection;
        if (i == 2)
        {
            connection = call.getLatestConnection();
        } else
        {
            if (i != 1 && i != 3)
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            connection = call.getEarliestConnection();
        }
        return startGetCallerInfo(context, connection, onquerycompletelistener, obj);
    }

    public static CallerInfoToken startGetCallerInfo(Context context, Call call, com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener onquerycompletelistener, Object obj, boolean flag)
    {
        int i = call.getPhone().getPhoneType();
        Connection connection;
        if (i == 2)
        {
            connection = call.getLatestConnection();
        } else
        {
            if (i != 1 && i != 3)
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
            connection = call.getEarliestConnection();
        }
        if (connection != null && flag)
            connection.clearUserData();
        return startGetCallerInfo(context, connection, onquerycompletelistener, obj);
    }

    public static CallerInfoToken startGetCallerInfo(Context context, Connection connection, com.android.internal.telephony.CallerInfoAsyncQuery.OnQueryCompleteListener onquerycompletelistener, Object obj)
    {
        if (connection == null)
        {
            CallerInfoToken callerinfotoken1 = new CallerInfoToken();
            callerinfotoken1.asyncQuery = null;
            return callerinfotoken1;
        }
        boolean flag;
        if (connection.getCall().getPhone().getPhoneType() == 3)
            flag = true;
        else
            flag = false;
        Object obj1 = connection.getUserData();
        int i = GeminiUtils.getSlotNotIdle(PhoneGlobals.getInstance().phone);
        log((new StringBuilder()).append("simId=").append(i).toString());
        CallerInfoToken callerinfotoken;
        if (obj1 instanceof Uri)
        {
            callerinfotoken = new CallerInfoToken();
            CallerInfo callerinfo3 = new CallerInfo();
            callerinfotoken.currentInfo = callerinfo3;
            CallerInfoAsyncQuery callerinfoasyncquery2 = CallerInfoAsyncQuery.startQuery(-1, context, (Uri)obj1, sCallerInfoQueryListener, connection);
            callerinfotoken.asyncQuery = callerinfoasyncquery2;
            callerinfotoken.asyncQuery.addQueryListener(-1, onquerycompletelistener, obj);
            callerinfotoken.isFinal = false;
            connection.setUserData(callerinfotoken);
            log((new StringBuilder()).append("startGetCallerInfo: query based on Uri: ").append(obj1).toString());
        } else
        if (obj1 == null)
        {
            String s2 = connection.getAddress();
            log("PhoneUtils.startGetCallerInfo: new query for phone number...");
            log((new StringBuilder()).append("- number (address): ").append(toLogSafePhoneNumber(s2)).toString());
            log((new StringBuilder()).append("- c: ").append(connection).toString());
            log((new StringBuilder()).append("- phone: ").append(connection.getCall().getPhone()).toString());
            int j = connection.getCall().getPhone().getPhoneType();
            log((new StringBuilder()).append("- phoneType: ").append(j).toString());
            switch (j)
            {
            case 3: // '\003'
                log("  ==> PHONE_TYPE_SIP");
                break;

            case 2: // '\002'
                log("  ==> PHONE_TYPE_CDMA");
                break;

            case 1: // '\001'
                log("  ==> PHONE_TYPE_GSM");
                break;

            case 0: // '\0'
                log("  ==> PHONE_TYPE_NONE");
                break;

            default:
                log("  ==> Unknown phone type");
                break;
            }
            callerinfotoken = new CallerInfoToken();
            CallerInfo callerinfo2 = new CallerInfo();
            callerinfotoken.currentInfo = callerinfo2;
            callerinfotoken.currentInfo.cnapName = connection.getCnapName();
            callerinfotoken.currentInfo.name = callerinfotoken.currentInfo.cnapName;
            callerinfotoken.currentInfo.numberPresentation = connection.getNumberPresentation();
            callerinfotoken.currentInfo.namePresentation = connection.getCnapNamePresentation();
            log((new StringBuilder()).append("startGetCallerInfo: number = ").append(s2).toString());
            log((new StringBuilder()).append("startGetCallerInfo: CNAP Info from FW(1): name=").append(callerinfotoken.currentInfo.cnapName).append(", Name/Number Pres=").append(callerinfotoken.currentInfo.numberPresentation).toString());
            if (!TextUtils.isEmpty(s2))
            {
                s2 = modifyForSpecialCnapCases(context, callerinfotoken.currentInfo, s2, callerinfotoken.currentInfo.numberPresentation);
                callerinfotoken.currentInfo.phoneNumber = s2;
                if (callerinfotoken.currentInfo.numberPresentation != PhoneConstants.PRESENTATION_ALLOWED)
                {
                    callerinfotoken.isFinal = true;
                } else
                {
                    log("==> Actually starting CallerInfoAsyncQuery.startQuery()...");
                    CallerInfoAsyncQuery callerinfoasyncquery1 = GeminiUtils.startQueryGemini(-1, context, s2, sCallerInfoQueryListener, connection, i, flag);
                    callerinfotoken.asyncQuery = callerinfoasyncquery1;
                    callerinfotoken.asyncQuery.addQueryListener(-1, onquerycompletelistener, obj);
                    callerinfotoken.isFinal = false;
                }
            } else
            {
                log("startGetCallerInfo: No query to start, send trivial reply.");
                callerinfotoken.isFinal = true;
            }
            connection.setUserData(callerinfotoken);
            log((new StringBuilder()).append("startGetCallerInfo: query based on number: ").append(toLogSafePhoneNumber(s2)).toString());
        } else
        if (obj1 instanceof CallerInfoToken)
        {
            callerinfotoken = (CallerInfoToken)obj1;
            if (callerinfotoken.asyncQuery != null)
            {
                callerinfotoken.asyncQuery.addQueryListener(-1, onquerycompletelistener, obj);
                log((new StringBuilder()).append("startGetCallerInfo: query already running, adding listener: ").append(onquerycompletelistener.getClass().toString()).toString());
            } else
            {
                String s = connection.getAddress();
                log((new StringBuilder()).append("startGetCallerInfo: updatedNumber initially = ").append(toLogSafePhoneNumber(s)).toString());
                if (!TextUtils.isEmpty(s))
                {
                    callerinfotoken.currentInfo.cnapName = connection.getCnapName();
                    callerinfotoken.currentInfo.name = callerinfotoken.currentInfo.cnapName;
                    callerinfotoken.currentInfo.numberPresentation = connection.getNumberPresentation();
                    callerinfotoken.currentInfo.namePresentation = connection.getCnapNamePresentation();
                    String s1 = modifyForSpecialCnapCases(context, callerinfotoken.currentInfo, s, callerinfotoken.currentInfo.numberPresentation);
                    callerinfotoken.currentInfo.phoneNumber = s1;
                    log((new StringBuilder()).append("startGetCallerInfo: updatedNumber=").append(toLogSafePhoneNumber(s1)).toString());
                    log((new StringBuilder()).append("startGetCallerInfo: CNAP Info from FW(2): name=").append(callerinfotoken.currentInfo.cnapName).append(", Name/Number Pres=").append(callerinfotoken.currentInfo.numberPresentation).toString());
                    if (callerinfotoken.currentInfo.numberPresentation != PhoneConstants.PRESENTATION_ALLOWED)
                    {
                        callerinfotoken.isFinal = true;
                    } else
                    {
                        CallerInfoAsyncQuery callerinfoasyncquery = GeminiUtils.startQueryGemini(-1, context, s1, sCallerInfoQueryListener, connection, i, flag);
                        callerinfotoken.asyncQuery = callerinfoasyncquery;
                        callerinfotoken.asyncQuery.addQueryListener(-1, onquerycompletelistener, obj);
                        callerinfotoken.isFinal = false;
                    }
                } else
                {
                    log("startGetCallerInfo: No query to attach to, send trivial reply.");
                    if (callerinfotoken.currentInfo == null)
                    {
                        CallerInfo callerinfo1 = new CallerInfo();
                        callerinfotoken.currentInfo = callerinfo1;
                    }
                    callerinfotoken.currentInfo.cnapName = connection.getCnapName();
                    callerinfotoken.currentInfo.name = callerinfotoken.currentInfo.cnapName;
                    callerinfotoken.currentInfo.numberPresentation = connection.getNumberPresentation();
                    callerinfotoken.currentInfo.namePresentation = connection.getCnapNamePresentation();
                    log((new StringBuilder()).append("startGetCallerInfo: CNAP Info from FW(3): name=").append(callerinfotoken.currentInfo.cnapName).append(", Name/Number Pres=").append(callerinfotoken.currentInfo.numberPresentation).toString());
                    callerinfotoken.isFinal = true;
                }
            }
        } else
        {
            callerinfotoken = new CallerInfoToken();
            CallerInfo callerinfo = (CallerInfo)obj1;
            callerinfotoken.currentInfo = callerinfo;
            callerinfotoken.asyncQuery = null;
            callerinfotoken.isFinal = true;
            log("startGetCallerInfo: query already done, returning CallerInfo");
            log((new StringBuilder()).append("==> cit.currentInfo = ").append(callerinfotoken.currentInfo).toString());
        }
        return callerinfotoken;
    }

    static boolean startNewCall(CallManager callmanager)
    {
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (!okToAddCall(callmanager))
        {
            Log.w("PhoneUtils", "startNewCall: can't add a new call in the current state");
            dumpCallManager();
            return false;
        }
        if (callmanager.hasActiveFgCall())
        {
            setMuteInternal(callmanager.getActiveFgCall().getPhone(), true);
            phoneglobals.setRestoreMuteOnInCallResume(true);
        }
        Intent intent = new Intent("android.intent.action.DIAL");
        intent.addFlags(0x10000000);
        intent.putExtra("add_call_mode", true);
        try
        {
            phoneglobals.startActivity(intent);
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Log.e("PhoneUtils", "Activity for adding calls isn't found.");
            return false;
        }
        return true;
    }

    static void switchHoldingAndActive(Call call)
    {
        log("switchHoldingAndActive()...");
        DualTalkUtils dualtalkutils = PhoneGlobals.getInstance().notifier.mDualTalk;
        if (DualTalkUtils.isSupportDualTalk() && dualtalkutils != null && dualtalkutils.isMultiplePhoneActive())
        {
            log("switchHoldingAndActive(), sPhoneSwapStatus set true!");
            sPhoneSwapStatus = true;
        }
        CallManager callmanager;
        callmanager = PhoneGlobals.getInstance().mCM;
        if (!call.isIdle())
            break MISSING_BLOCK_LABEL_79;
        callmanager.switchHoldingAndActive(callmanager.getFgPhone().getBackgroundCall());
_L1:
        setAudioMode(callmanager);
        return;
        try
        {
            callmanager.switchHoldingAndActive(call);
        }
        catch (CallStateException callstateexception)
        {
            Log.w("PhoneUtils", (new StringBuilder()).append("switchHoldingAndActive: caught ").append(callstateexception).toString(), callstateexception);
            return;
        }
          goto _L1
    }

    private static String toLogSafePhoneNumber(String s)
    {
        return s;
    }

    static void turnOnNoiseSuppression(Context context, boolean flag, boolean flag1)
    {
        log((new StringBuilder()).append("turnOnNoiseSuppression: ").append(flag).toString());
        AudioManager audiomanager = (AudioManager)context.getSystemService("audio");
        if (context.getResources().getBoolean(0x7f0a000b))
        {
            if (flag)
                audiomanager.setParameters("noise_suppression=auto");
            else
                audiomanager.setParameters("noise_suppression=off");
            if (flag1)
            {
                sIsNoiseSuppressionEnabled = flag;
                return;
            }
        }
    }

    public static void turnOnSpeaker(Context context, boolean flag, boolean flag1)
    {
        turnOnSpeaker(context, flag, flag1, true);
    }

    public static void turnOnSpeaker(Context context, boolean flag, boolean flag1, boolean flag2)
    {
        log((new StringBuilder()).append("turnOnSpeaker(flag=").append(flag).append(", store=").append(flag1).append(")...").toString());
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        ((AudioManager)context.getSystemService("audio")).setSpeakerphoneOn(flag);
        if (flag1)
            sIsSpeakerEnabled = flag;
        if (flag2)
            phoneglobals.notificationMgr.updateSpeakerNotification(flag);
        phoneglobals.updateWakeState();
        phoneglobals.updateProximitySensorMode(phoneglobals.mCM.getState());
        phoneglobals.mCM.setEchoSuppressionEnabled(flag);
    }

    private static void updateCdmaCallStateOnNewOutgoingCall(PhoneGlobals phoneglobals)
    {
        if (phoneglobals.cdmaPhoneCallState.getCurrentCallState() == CdmaPhoneCallState.PhoneCallState.IDLE)
        {
            phoneglobals.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.SINGLE_ACTIVE);
            return;
        } else
        {
            phoneglobals.cdmaPhoneCallState.setCurrentCallState(CdmaPhoneCallState.PhoneCallState.THRWAY_ACTIVE);
            return;
        }
    }

    public static boolean useShortDtmfTones(Phone phone, Context context)
    {
        int i = phone.getPhoneType();
        if (i != 1)
            if (i == 2)
            {
                if (android.provider.Settings.Global.getInt(context.getContentResolver(), "dtmf_tone_type", 0) == 0)
                    return true;
            } else
            if (i != 3)
                throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
        return false;
    }

    static 
    {
        boolean flag = true;
        sIsNoiseSuppressionEnabled = flag;
        PhoneGlobals phoneglobals = PhoneGlobals.getInstance();
        if (!SipManager.isVoipSupported(phoneglobals) || !phoneglobals.getResources().getBoolean(0x1110034) || !phoneglobals.getResources().getBoolean(0x1110030))
            flag = false;
        sVoipSupported = flag;
    }






/*
    static Dialog access$502(Dialog dialog)
    {
        sDialog = dialog;
        return dialog;
    }

*/
}
