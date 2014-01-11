// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.UserHandle;
import android.telephony.PhoneNumberUtils;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.telephony.*;
import com.mediatek.calloption.CallOptionHandler;
import com.mediatek.calloption.SimAssociateHandler;
import com.mediatek.phone.PhoneLog;
import com.mediatek.phone.calloption.PhoneCallOptionHandlerFactory;
import com.mediatek.phone.gemini.GeminiUtils;

// Referenced classes of package com.android.phone:
//            PhoneGlobals, PhoneUtils, CallController

public class OutgoingCallBroadcaster extends Activity
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnCancelListener, com.mediatek.calloption.CallOptionBaseHandler.ICallOptionResultHandle
{
    public class OutgoingCallReceiver extends BroadcastReceiver
    {

        private static final String TAG = "OutgoingCallReceiver";
        final OutgoingCallBroadcaster this$0;

        public void doReceive(Context context, Intent intent)
        {
            String s;
label0:
            {
                PhoneGlobals phoneglobals;
label1:
                {
label2:
                    {
label3:
                        {
                            boolean flag;
                            boolean flag1;
                            boolean flag2;
label4:
                            {
                                Log.v("OutgoingCallReceiver", (new StringBuilder()).append("doReceive: ").append(intent).toString());
                                if (intent.getBooleanExtra("android.phone.extra.ALREADY_CALLED", false))
                                {
                                    Log.v("OutgoingCallReceiver", "CALL already placed -- returning.");
                                    break label2;
                                }
                                s = getResultData();
                                Log.v("OutgoingCallReceiver", (new StringBuilder()).append("- got number from resultData: '").append(s).append("'").toString());
                                phoneglobals = PhoneGlobals.getInstance();
                                if (!TelephonyCapabilities.supportsOtasp(phoneglobals.phone))
                                    break label3;
                                if (phoneglobals.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_ACTIVATION)
                                    flag = true;
                                else
                                    flag = false;
                                if (phoneglobals.cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_SUCCESS_FAILURE_DLG)
                                    flag1 = true;
                                else
                                    flag1 = false;
                                if (phoneglobals.cdmaOtaScreenState.otaScreenState != OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_PROGRESS)
                                {
                                    OtaUtils.CdmaOtaScreenState.OtaScreenState otascreenstate = phoneglobals.cdmaOtaScreenState.otaScreenState;
                                    OtaUtils.CdmaOtaScreenState.OtaScreenState otascreenstate1 = OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_LISTENING;
                                    flag2 = false;
                                    if (otascreenstate != otascreenstate1)
                                        break label4;
                                }
                                flag2 = true;
                            }
                            if (!flag && !flag1)
                            {
                                if (flag2)
                                {
                                    Log.w("OutgoingCallReceiver", "OTASP call is active: disallowing a new outgoing call.");
                                    return;
                                }
                            } else
                            {
                                if (flag1)
                                    phoneglobals.dismissOtaDialogs();
                                phoneglobals.clearOtaState();
                                phoneglobals.clearInCallScreenMode();
                            }
                        }
                        String s1 = intent.getStringExtra("android.phone.extra.ORIGINAL_URI");
                        if (s != null)
                            break label1;
                        Log.v("OutgoingCallReceiver", "CALL cancelled (null number), returning...");
                        if (s1 != null && PhoneUtils.isVoicemailNumber(Uri.parse(s1)))
                            break label0;
                    }
                    return;
                }
                if (TelephonyCapabilities.supportsOtasp(phoneglobals.phone) && phoneglobals.phone.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE && phoneglobals.phone.isOtaSpNumber(s))
                {
                    Log.v("OutgoingCallReceiver", "Call is active, a 2nd OTA call cancelled -- returning.");
                    return;
                }
                if (PhoneNumberUtils.isEmergencyNumber(s))
                {
                    Log.w("OutgoingCallReceiver", (new StringBuilder()).append("Cannot modify outgoing call to emergency number ").append(s).append(".").toString());
                    return;
                }
            }
            String s2 = intent.getStringExtra("android.phone.extra.ORIGINAL_URI");
            if (s2 == null)
            {
                Log.e("OutgoingCallReceiver", "Intent is missing EXTRA_ORIGINAL_URI -- returning.");
                return;
            } else
            {
                Uri uri = Uri.parse(s2);
                String s3 = PhoneUtils.specialNumberTransfer(s);
                Log.v("OutgoingCallReceiver", "doReceive: proceeding with call...");
                Log.v("OutgoingCallReceiver", (new StringBuilder()).append("- uri: ").append(uri).toString());
                Log.v("OutgoingCallReceiver", (new StringBuilder()).append("- actual number to dial: '").append(s3).append("'").toString());
                startSipCallOptionHandler(context, intent, uri, s3);
                return;
            }
        }

        public void onReceive(Context context, Intent intent)
        {
            doReceive(context, intent);
            Log.v("OutgoingCallReceiver", "OutgoingCallReceiver is going to finish the Activity itself.");
            finish();
        }

        public OutgoingCallReceiver()
        {
            this$0 = OutgoingCallBroadcaster.this;
            super();
        }
    }


    public static final String ACTION_SIP_SELECT_PHONE = "com.android.phone.SIP_SELECT_PHONE";
    private static final boolean DBG = true;
    private static final int DIALOG_NOT_VOICE_CAPABLE = 1;
    public static final String EXTRA_ALREADY_CALLED = "android.phone.extra.ALREADY_CALLED";
    public static final String EXTRA_NEW_CALL_INTENT = "android.phone.extra.NEW_CALL_INTENT";
    public static final String EXTRA_ORIGINAL_URI = "android.phone.extra.ORIGINAL_URI";
    public static final String EXTRA_SEND_EMPTY_FLASH = "com.android.phone.extra.SEND_EMPTY_FLASH";
    public static final String EXTRA_SIP_PHONE_URI = "android.phone.extra.SIP_PHONE_URI";
    private static final String PERMISSION = "android.permission.PROCESS_OUTGOING_CALLS";
    private static final String TAG = "OutgoingCallBroadcaster";
    private static final boolean VDBG = true;
    private boolean mCallOptionHandled;
    private CallOptionHandler mCallOptionHandler;

    public OutgoingCallBroadcaster()
    {
        mCallOptionHandled = false;
    }

    private void doCallOptionHandle(Intent intent)
    {
        PhoneLog.d("OutgoingCallBroadcaster", (new StringBuilder()).append("doCallOptionHandle, intent is ").append(intent).toString());
        mCallOptionHandled = true;
        SimAssociateHandler.getInstance(PhoneGlobals.getInstance()).load();
        mCallOptionHandler = new CallOptionHandler(new PhoneCallOptionHandlerFactory());
        mCallOptionHandler.doCallOptionHandle(this, PhoneGlobals.getInstance(), intent, this, PhoneGlobals.getInstance().cellConnMgr, PhoneGlobals.getInstance().phoneMgr, GeminiUtils.isGeminiSupport(), false);
    }

    private void handleNonVoiceCapable(Intent intent)
    {
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("handleNonVoiceCapable: handling ").append(intent).append(" on non-voice-capable device...").toString());
        String s = intent.getAction();
        Uri uri = intent.getData();
        String s1 = uri.getScheme();
        if ("android.intent.action.CALL".equals(s) && "tel".equals(s1))
        {
            Intent intent1 = new Intent("android.intent.action.DIAL", uri);
            Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("- relaunching as a DIAL intent: ").append(intent1).toString());
            startActivity(intent1);
            finish();
            return;
        } else
        {
            showDialog(1);
            return;
        }
    }

    private void processIntent(Intent intent)
    {
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("processIntent() = ").append(intent).append(", thread: ").append(Thread.currentThread()).toString());
        getResources().getConfiguration();
        if (!PhoneGlobals.sVoiceCapable)
        {
            Log.i("OutgoingCallBroadcaster", "This device is detected as non-voice-capable device.");
            handleNonVoiceCapable(intent);
            return;
        }
        String s = intent.getAction();
        String s1 = PhoneNumberUtils.getNumberFromIntent(intent, this);
        boolean flag;
        boolean flag1;
        if (s1 != null)
        {
            if (!PhoneNumberUtils.isUriNumber(s1))
                s1 = PhoneUtils.specialNumberTransfer(s1);
        } else
        {
            Log.w("OutgoingCallBroadcaster", "The number obtained from Intent is null.");
        }
        if (getClass().getName().equals(intent.getComponent().getClassName()) && !"android.intent.action.CALL".equals(intent.getAction()))
        {
            Log.w("OutgoingCallBroadcaster", "Attempt to deliver non-CALL action; forcing to CALL");
            intent.setAction("android.intent.action.CALL");
        }
        flag = PhoneNumberUtils.isEmergencyNumber(s1);
        flag1 = "voicemail:".equals(intent.getData().toString());
        if ("android.intent.action.CALL_PRIVILEGED".equals(s))
        {
            Intent intent1;
            if (flag)
            {
                Log.i("OutgoingCallBroadcaster", "ACTION_CALL_PRIVILEGED is used while the number is a potential emergency number. Use ACTION_CALL_EMERGENCY as an action instead.");
                s = "android.intent.action.CALL_EMERGENCY";
            } else
            {
                s = "android.intent.action.CALL";
            }
            Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append(" - updating action from CALL_PRIVILEGED to ").append(s).toString());
            intent.setAction(s);
        }
        boolean flag2;
        if ("android.intent.action.CALL".equals(s))
        {
            if (flag)
            {
                Log.w("OutgoingCallBroadcaster", (new StringBuilder()).append("Cannot call potential emergency number '").append(s1).append("' with CALL Intent ").append(intent).append(".").toString());
                Log.i("OutgoingCallBroadcaster", "Launching default dialer instead...");
                intent1 = new Intent();
                intent1.setClassName("com.android.contacts", "com.android.contacts.DialtactsActivity");
                intent1.setAction("android.intent.action.DIAL");
                intent1.setData(intent.getData());
                Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("onCreate(): calling startActivity for Dialer: ").append(intent1).toString());
                try
                {
                    startActivity(intent1);
                }
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    Log.e("OutgoingCallBroadcaster", "Activity for DialtactsActivity isn't found.");
                }
                finish();
                return;
            }
            flag2 = false;
        } else
        if ("android.intent.action.CALL_EMERGENCY".equals(s))
        {
            if (!flag)
            {
                Log.w("OutgoingCallBroadcaster", (new StringBuilder()).append("Cannot call non-potential-emergency number ").append(s1).append(" with EMERGENCY_CALL Intent ").append(intent).append(".").append(" Finish the Activity immediately.").toString());
                finish();
                return;
            }
            flag2 = true;
        } else
        {
            Log.e("OutgoingCallBroadcaster", (new StringBuilder()).append("Unhandled Intent ").append(intent).append(". Finish the Activity immediately.").toString());
            finish();
            return;
        }
        PhoneGlobals.getInstance().wakeUpScreen();
        if (TextUtils.isEmpty(s1))
        {
            if (intent.getBooleanExtra("com.android.phone.extra.SEND_EMPTY_FLASH", false))
            {
                Log.i("OutgoingCallBroadcaster", "onCreate: SEND_EMPTY_FLASH...");
                PhoneUtils.sendEmptyFlash(PhoneGlobals.getPhone());
                finish();
                return;
            }
            Log.i("OutgoingCallBroadcaster", "onCreate: null or empty number, setting callNow=true...");
            if (!flag1)
                flag2 = true;
        }
        if (flag2)
        {
            Log.i("OutgoingCallBroadcaster", (new StringBuilder()).append("onCreate(): callNow case! Calling placeCall(): ").append(intent).toString());
            PhoneGlobals.getInstance().callController.placeCall(intent);
        }
        String s2 = intent.getStringExtra("com.android.phone.CALL_ORIGIN");
        if (s2 != null)
        {
            Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append(" - Call origin is passed (").append(s2).append(")").toString());
            PhoneGlobals.getInstance().setLatestActiveCallOrigin(s2);
        } else
        {
            Log.v("OutgoingCallBroadcaster", " - Call origin is not passed. Reset current one.");
            PhoneGlobals.getInstance().resetLatestActiveCallOrigin();
        }
        if (!flag2)
        {
            doCallOptionHandle(intent);
            return;
        } else
        {
            finish();
            return;
        }
    }

    public static void sendNewCallBroadcast(Context context, Intent intent, String s, boolean flag, BroadcastReceiver broadcastreceiver)
    {
        Intent intent1 = new Intent("android.intent.action.NEW_OUTGOING_CALL");
        if (s != null)
            intent1.putExtra("android.intent.extra.PHONE_NUMBER", s);
        PhoneUtils.checkAndCopyPhoneProviderExtras(intent, intent1);
        intent1.putExtra("android.phone.extra.ALREADY_CALLED", flag);
        intent1.putExtra("android.phone.extra.ORIGINAL_URI", intent.getData().toString());
        intent1.addFlags(0x10000000);
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append(" - Broadcasting intent: ").append(intent1).append(".").toString());
        PhoneUtils.checkAndCopyPrivateExtras(intent, intent1);
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("Broadcasting intent: ").append(intent1).append(".").toString());
        context.sendOrderedBroadcastAsUser(intent1, UserHandle.OWNER, "android.permission.PROCESS_OUTGOING_CALLS", broadcastreceiver, null, -1, s, null);
    }

    private void sendNewCallBroadcast(Intent intent, String s, boolean flag)
    {
        PhoneLog.d("OutgoingCallBroadcaster", (new StringBuilder()).append("sendNewCallBroadcast, intent is ").append(intent).append(", number is ").append(s).append(" callNow + ").append(flag).toString());
        sendNewCallBroadcast(((Context) (this)), intent, s, flag, ((BroadcastReceiver) (new OutgoingCallReceiver())));
    }

    private void startSipCallOptionHandler(Context context, Intent intent, Uri uri, String s)
    {
        Log.i("OutgoingCallBroadcaster", "startSipCallOptionHandler...");
        Log.i("OutgoingCallBroadcaster", (new StringBuilder()).append("- intent: ").append(intent).toString());
        Log.i("OutgoingCallBroadcaster", (new StringBuilder()).append("- uri: ").append(uri).toString());
        Log.i("OutgoingCallBroadcaster", (new StringBuilder()).append("- number: ").append(s).toString());
        Intent intent1 = new Intent("android.intent.action.CALL", uri);
        intent1.putExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL", s);
        PhoneUtils.checkAndCopyPhoneProviderExtras(intent, intent1);
        PhoneUtils.checkAndCopyPrivateExtras(intent, intent1);
        PhoneGlobals.getInstance().callController.placeCall(intent1);
        Log.i("OutgoingCallBroadcaster", "gemini NOT handled, so do nothing, please check MO process!!!");
    }

    public void onCancel(DialogInterface dialoginterface)
    {
        finish();
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        finish();
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("onConfigurationChanged: newConfig = ").append(configuration).toString());
    }

    public void onContinueCallProcess(Intent intent)
    {
        String s;
        if (intent.hasExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL"))
            s = intent.getStringExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL");
        else
            s = PhoneNumberUtils.getNumberFromIntent(intent, this);
        if (s != null && !PhoneNumberUtils.isUriNumber(s))
            s = PhoneUtils.specialNumberTransfer(s);
        sendNewCallBroadcast(intent, s, false);
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Intent intent = getIntent();
        Configuration configuration = getResources().getConfiguration();
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("onCreate: this = ").append(this).append(", icicle = ").append(bundle).toString());
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append(" - getIntent() = ").append(intent).toString());
        Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append(" - configuration = ").append(configuration).toString());
        if (bundle != null)
        {
            Log.i("OutgoingCallBroadcaster", "onCreate: non-null icicle!  Bailing out, not sending NEW_OUTGOING_CALL broadcast...");
            return;
        } else
        {
            processIntent(intent);
            Log.v("OutgoingCallBroadcaster", (new StringBuilder()).append("At the end of onCreate(). isFinishing(): ").append(isFinishing()).toString());
            return;
        }
    }

    protected Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 1: // '\001'
            return (new android.app.AlertDialog.Builder(this)).setTitle(0x7f0d0375).setIconAttribute(0x1010355).setPositiveButton(0x104000a, this).setOnCancelListener(this).create();
        }
        Log.w("OutgoingCallBroadcaster", (new StringBuilder()).append("onCreateDialog: unexpected ID ").append(i).toString());
        return null;
    }

    protected void onDestroy()
    {
        Log.d("OutgoingCallBroadcaster", (new StringBuilder()).append("onDestroy()...  this = ").append(this).toString());
        super.onDestroy();
    }

    public void onHandleCallOption(boolean flag, Intent intent)
    {
        PhoneLog.d("OutgoingCallBroadcaster", (new StringBuilder()).append("onHandleCallOption, continueOrFinish = ").append(flag).append(", intent is ").append(intent).toString());
        if (flag)
        {
            String s;
            if (intent.hasExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL"))
                s = intent.getStringExtra("android.phone.extra.ACTUAL_NUMBER_TO_DIAL");
            else
                s = PhoneNumberUtils.getNumberFromIntent(intent, this);
            if (s != null && !PhoneNumberUtils.isUriNumber(s))
                s = PhoneUtils.specialNumberTransfer(s);
            sendNewCallBroadcast(intent, s, false);
            return;
        } else
        {
            finish();
            return;
        }
    }

    public void onHandlingFinish()
    {
        finish();
    }

    protected void onNewIntent(Intent intent)
    {
        Log.d("OutgoingCallBroadcaster", (new StringBuilder()).append("onNewIntent: intent = ").append(intent).toString());
        if ("android.intent.action.CALL_EMERGENCY".equals(intent.getAction()) && PhoneGlobals.getInstance().mCM.getState() == com.android.internal.telephony.PhoneConstants.State.IDLE)
        {
            Log.d("OutgoingCallBroadcaster", "Got ACTION_CALL_EMERGENCY and phone idle, finish ourself and then restart!");
            finish();
            startActivity(intent);
        }
    }

    protected void onResume()
    {
        super.onResume();
        Log.d("OutgoingCallBroadcaster", "onResume of OutgoingCallBroadcaster!");
    }

    protected void onStop()
    {
        removeDialog(1);
        super.onStop();
        if (mCallOptionHandler != null)
            mCallOptionHandler.dismissDialogs();
    }

}
