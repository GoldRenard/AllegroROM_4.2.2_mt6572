// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.IBluetoothHeadsetPhone;
import android.content.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.media.AudioManager;
import android.net.Uri;
import android.os.*;
import android.preference.PreferenceManager;
import android.telephony.ServiceState;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;
import com.android.i18n.phonenumbers.PhoneNumberUtil;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.internal.telephony.gemini.MTKCallManager;
import com.android.server.sip.SipService;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.calloption.SimAssociateHandler;
import com.mediatek.phone.*;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.PhoneGlobalsBroadcastReceiverExtension;
import com.mediatek.phone.gemini.GeminiRegister;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.phone.provider.CallHistoryDatabaseHelper;
import com.mediatek.phone.vt.VTCallUtils;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.phone:
//            InCallScreen, PhoneUtils, NotificationMgr, CdmaPhoneCallState, 
//            Ringer, CallNotifier, OtaUtils, InCallUiState, 
//            Profiler, TelephonyDebugService, PhoneInterfaceManager, PhoneInterfaceManagerEx, 
//            BluetoothPhoneService, AccelerometerListener, CallController, CallerInfoCache, 
//            CallLogAsync, ClearMissedCallsService, EmergencyCallbackModeService

public class PhoneGlobals extends ContextWrapper
    implements AccelerometerListener.OrientationListener
{
    private class MediaButtonBroadcastReceiver extends BroadcastReceiver
    {

        final PhoneGlobals this$0;

        public void onReceive(Context context, Intent intent)
        {
            KeyEvent keyevent = (KeyEvent)intent.getParcelableExtra("android.intent.extra.KEY_EVENT");
            Log.d("PhoneGlobals", (new StringBuilder()).append("MediaButtonBroadcastReceiver.onReceive()...  event = ").append(keyevent).toString());
            if (keyevent != null && keyevent.getKeyCode() == 79 && keyevent.getAction() == 1)
                if (keyevent.getRepeatCount() == 0)
                {
                    Log.d("PhoneGlobals", "MediaButtonBroadcastReceiver: HEADSETHOOK down!");
                    boolean flag = PhoneUtils.handleHeadsetHook(phone, keyevent);
                    Log.d("PhoneGlobals", (new StringBuilder()).append("==> handleHeadsetHook(): consumed = ").append(flag).toString());
                    if (flag)
                    {
                        updateInCallScreen();
                        abortBroadcast();
                    }
                } else
                if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                {
                    Log.d("PhoneGlobals", "MediaButtonBroadcastReceiver: consumed");
                    abortBroadcast();
                    return;
                }
        }

        private MediaButtonBroadcastReceiver()
        {
            this$0 = PhoneGlobals.this;
            super();
        }

    }

    public static class NotificationBroadcastReceiver extends BroadcastReceiver
    {

        private void clearMissedCallNotification(Context context)
        {
            Intent intent = new Intent(context, com/android/phone/ClearMissedCallsService);
            intent.setAction("com.android.phone.intent.CLEAR_MISSED_CALLS");
            context.startService(intent);
        }

        private void closeSystemDialogs(Context context)
        {
            context.sendBroadcastAsUser(new Intent("android.intent.action.CLOSE_SYSTEM_DIALOGS"), UserHandle.ALL);
        }

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            Log.d("PhoneGlobals", (new StringBuilder()).append("Broadcast from Notification: ").append(s).toString());
            if (s.equals("com.android.phone.ACTION_HANG_UP_ONGOING_CALL"))
            {
                PhoneUtils.hangup(PhoneGlobals.getInstance().mCM);
                return;
            }
            if (s.equals("com.android.phone.ACTION_CALL_BACK_FROM_NOTIFICATION"))
            {
                closeSystemDialogs(context);
                clearMissedCallNotification(context);
                if (((KeyguardManager)context.getSystemService("keyguard")).isKeyguardLocked())
                {
                    Log.d("PhoneGlobals", "Disable keyguard!");
                    Intent intent2;
                    try
                    {
                        ActivityManagerNative.asInterface(ServiceManager.getService("activity")).dismissKeyguardOnNextActivity();
                    }
                    catch (RemoteException remoteexception)
                    {
                        Log.e("PhoneGlobals", "RemoteException happened in NotificationBroadcastReceiver.onReceive().");
                    }
                } else
                {
                    Log.d("PhoneGlobals", "Keyguard not enable!");
                }
                intent2 = new Intent("android.intent.action.CALL_PRIVILEGED", intent.getData());
                intent2.setFlags(0x10800000);
                context.startActivity(intent2);
                return;
            }
            if (s.equals("com.android.phone.ACTION_SEND_SMS_FROM_NOTIFICATION"))
            {
                closeSystemDialogs(context);
                clearMissedCallNotification(context);
                Intent intent1 = new Intent("android.intent.action.SENDTO", intent.getData());
                intent1.addFlags(0x10000000);
                try
                {
                    context.startActivity(intent1);
                    return;
                }
                catch (ActivityNotFoundException activitynotfoundexception)
                {
                    Log.w("PhoneGlobals", "start sms activity fail, sms is not available");
                }
                return;
            } else
            {
                Log.w("PhoneGlobals", "Received hang-up request from notification, but there's no call the system can hang up.");
                return;
            }
        }

    }

    private class PhoneGlobalsBroadcastReceiver extends BroadcastReceiver
    {

        final PhoneGlobals this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (!ExtensionManager.getInstance().getPhoneGlobalsBroadcastReceiverExtension().onReceive(context, intent)) goto _L2; else goto _L1
_L1:
            return;
_L2:
            String s;
            s = intent.getAction();
            Log.d("PhoneGlobals", (new StringBuilder()).append("PhoneGlobalsBroadcastReceiver -----action=").append(s).toString());
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                boolean flag4 = intent.getBooleanExtra("state", false);
                Log.d("PhoneGlobals", (new StringBuilder()).append("PhoneGlobalsBroadcastReceiver ------ AIRPLANEMODE enabled=").append(flag4).toString());
                if (flag4)
                    PhoneUtils.dismissMMIDialog();
                if (flag4)
                    try
                    {
                        if (mCM.getState() != com.android.internal.telephony.PhoneConstants.State.IDLE)
                        {
                            Log.d("PhoneGlobals", "Hangup all calls before turning on airplane mode");
                            mCM.hangupAllEx();
                        }
                    }
                    catch (CallStateException callstateexception)
                    {
                        Log.e("PhoneGlobals", "CallStateException when mCM.hangupAllEx() in PhoneGlobalsBroadcastReceiver.onReceive(...).");
                    }
                if (GeminiUtils.isGeminiSupport())
                    if (flag4)
                    {
                        ((GeminiPhone)phone).setRadioMode(-1);
                        return;
                    } else
                    {
                        ((GeminiPhone)phone).setRadioPowerOn();
                        return;
                    }
                if (flag4)
                {
                    phone.setRadioPower(false, true);
                    return;
                } else
                {
                    phone.setRadioPowerOn();
                    return;
                }
            }
            if (s.equals("android.intent.action.DUAL_SIM_MODE"))
            {
                int k1 = intent.getIntExtra("mode", 3);
                if (GeminiUtils.isGeminiSupport())
                {
                    ((GeminiPhone)phone).setRadioMode(k1);
                    return;
                }
                boolean flag3;
                if (k1 == 0)
                    flag3 = false;
                else
                    flag3 = true;
                phone.setRadioPower(flag3);
                return;
            }
            if (s.equals("android.intent.action.CONFIGURATION_CHANGED"))
                if (GeminiUtils.isGeminiSupport())
                {
                    ((GeminiPhone)phone).refreshSpnDisplay();
                    return;
                } else
                {
                    phone.refreshSpnDisplay();
                    return;
                }
            if (s.equals("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED"))
            {
                mBluetoothHeadsetState = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 0);
                Log.d("PhoneGlobals", "mReceiver: HEADSET_STATE_CHANGED_ACTION");
                Log.d("PhoneGlobals", (new StringBuilder()).append("==> new state: ").append(mBluetoothHeadsetState).toString());
                updateBluetoothIndication(true);
                return;
            }
            if (s.equals("android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED"))
            {
                mBluetoothHeadsetAudioState = intent.getIntExtra("android.bluetooth.profile.extra.STATE", 10);
                Log.d("PhoneGlobals", "mReceiver: HEADSET_AUDIO_STATE_CHANGED_ACTION");
                Log.d("PhoneGlobals", (new StringBuilder()).append("==> new state: ").append(mBluetoothHeadsetAudioState).toString());
                updateBluetoothIndication(true);
                return;
            }
            if (!s.equals("android.intent.action.ANY_DATA_STATE"))
                break; /* Loop/switch isn't completed */
            String s5 = intent.getStringExtra("state");
            String s6 = intent.getStringExtra("reason");
            Log.d("PhoneGlobals", (new StringBuilder()).append("mReceiver: ACTION_ANY_DATA_CONNECTION_STATE_CHANGED state:").append(s5).append(" reason:").append(s6).toString());
            if ("default".equals(intent.getStringExtra("apnType")))
            {
                Log.d("PhoneGlobals", "APN Type default.");
                boolean flag2;
                Handler handler;
                byte byte0;
                if ("DISCONNECTED".equals(s5) && "roamingOn".equals(s6) && !phone.getDataRoamingEnabled())
                    flag2 = true;
                else
                    flag2 = false;
                handler = mHandler;
                if (flag2)
                    byte0 = 10;
                else
                    byte0 = 11;
                handler.sendEmptyMessage(byte0);
                return;
            }
            if (true) goto _L1; else goto _L3
_L3:
            if (s.equals("android.intent.action.HEADSET_PLUG"))
            {
                Log.d("PhoneGlobals", "mReceiver: ACTION_HEADSET_PLUG");
                Log.d("PhoneGlobals", (new StringBuilder()).append("    state: ").append(intent.getIntExtra("state", 0)).toString());
                Log.d("PhoneGlobals", (new StringBuilder()).append("    name: ").append(intent.getStringExtra("name")).toString());
                PhoneGlobals phoneglobals = PhoneGlobals.this;
                boolean flag1;
                if (intent.getIntExtra("state", 0) == 1)
                    flag1 = true;
                else
                    flag1 = false;
                phoneglobals.mIsHeadsetPlugged = flag1;
                mHandler.sendMessage(mHandler.obtainMessage(7, Integer.valueOf(0)));
                return;
            }
            if (s.equals("android.intent.action.SIM_STATE_CHANGED"))
            {
                int j1 = intent.getIntExtra("simId", -1);
                String s4 = intent.getStringExtra("ss");
                Log.d("PhoneGlobals", (new StringBuilder()).append("[unlock SIM card NO switched. Now] ").append(j1).append(" is active.").toString());
                Log.d("PhoneGlobals", (new StringBuilder()).append("[unlockSIMStatus] : ").append(s4).toString());
                if (s4.equals("READY"))
                {
                    mHandler.sendMessageDelayed(mHandler.obtainMessage(8, "READY"), 2000);
                    return;
                } else
                {
                    Log.d("PhoneGlobals", (new StringBuilder()).append("[unlockSIMID : Other information]: ").append(s4).toString());
                    return;
                }
            }
            if (s.equals("android.intent.action.RADIO_TECHNOLOGY"))
            {
                String s3 = intent.getStringExtra("phoneName");
                Log.d("PhoneGlobals", (new StringBuilder()).append("Radio technology switched. Now ").append(s3).append(" is active.").toString());
                initForNewRadioTechnology();
                return;
            }
            if (s.equals("android.intent.action.SERVICE_STATE"))
            {
                handleServiceStateChanged(intent);
                return;
            }
            if (!s.equals("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED"))
                break; /* Loop/switch isn't completed */
            if (TelephonyCapabilities.supportsEcm(phone))
            {
                Log.d("PhoneGlobals", "Emergency Callback Mode arrived in PhoneGlobals.");
                if (intent.getBooleanExtra("phoneinECMState", false))
                {
                    Intent intent2 = new Intent(context, com/android/phone/EmergencyCallbackModeService);
                    context.startService(intent2);
                    return;
                }
            } else
            {
                Log.e("PhoneGlobals", (new StringBuilder()).append("Got ACTION_EMERGENCY_CALLBACK_MODE_CHANGED, but ECM isn't supported for phone: ").append(phone.getPhoneName()).toString());
                return;
            }
            if (true) goto _L1; else goto _L4
_L4:
            if (s.equals("android.intent.action.DOCK_EVENT"))
            {
                PhoneGlobals.mDockState = intent.getIntExtra("android.intent.extra.DOCK_STATE", 0);
                Log.d("PhoneGlobals", (new StringBuilder()).append("ACTION_DOCK_EVENT -> mDockState = ").append(PhoneGlobals.mDockState).toString());
                mHandler.sendMessage(mHandler.obtainMessage(13, Integer.valueOf(0)));
                return;
            }
            if (s.equals("com.android.internal.telephony.cdma.intent.action.TTY_PREFERRED_MODE_CHANGE"))
            {
                mPreferredTtyMode = intent.getIntExtra("ttyPreferredMode", 0);
                Log.d("PhoneGlobals", "mReceiver: TTY_PREFERRED_MODE_CHANGE_ACTION");
                Log.d("PhoneGlobals", (new StringBuilder()).append("    mode: ").append(mPreferredTtyMode).toString());
                mHandler.sendMessage(mHandler.obtainMessage(14, Integer.valueOf(0)));
                return;
            }
            if (!s.equals("android.media.RINGER_MODE_CHANGED"))
                break; /* Loop/switch isn't completed */
            if (intent.getIntExtra("android.media.EXTRA_RINGER_MODE", 2) == 0)
            {
                notifier.silenceRinger();
                return;
            }
            if (true) goto _L1; else goto _L5
_L5:
            if (s.equals("android.intent.action.ACTION_SHUTDOWN"))
            {
                Log.d("PhoneGlobals", "ACTION_SHUTDOWN received");
                addCallSync();
                notifier.unregisterCallNotifierRegistrations();
                return;
            }
            if (s.equals("com.android.stk.STKCALL_REGISTER_SPEECH_INFO"))
            {
                PhoneUtils.placeCallRegister(phone);
                mHandler.sendEmptyMessageDelayed(57, 160L);
                return;
            }
            if (s.equals("com.android.phone.MISSEDCALL_DELETE_INTENT"))
            {
                Log.d("PhoneGlobals", "MISSEDCALL_DELETE_INTENT");
                notificationMgr.resetMissedCallNumber();
                return;
            }
            if (s.equals("com.android.phone.NETWORK_MODE_CHANGE"))
            {
                int k = intent.getIntExtra("com.android.phone.NETWORK_MODE_CHANGE", 0);
                int l = intent.getIntExtra("simId", 0);
                int i1 = intent.getIntExtra("com.android.phone.OLD_NETWORK_MODE", -1);
                if (GeminiUtils.isGeminiSupport())
                {
                    ((GeminiPhone)phone).setPreferredNetworkTypeGemini(k, mHandler.obtainMessage(10011, i1, k), l);
                    return;
                } else
                {
                    phone.setPreferredNetworkType(k, mHandler.obtainMessage(10011, i1, k));
                    return;
                }
            }
            if (!s.equals("android.intent.action.ACTION_SHUTDOWN_IPO"))
                break; /* Loop/switch isn't completed */
            Log.d("PhoneGlobals", "ACTION_SHUTDOWN_IPO received");
            SystemProperties.set("gsm.ril.uicctype", "");
            SystemProperties.set("gsm.ril.uicctype.2", "");
            SystemProperties.set("ril.iccid.sim1", null);
            SystemProperties.set("ril.iccid.sim2", null);
            if ("1".equals(SystemProperties.get("sys.boot.reason")))
                Log.d("PhoneGlobals", "Alarm boot shutdown and not turn off radio again");
            else
                phone.setRadioPower(false, true);
            if (inCallUiState != null)
                inCallUiState.clearState();
            if (mInCallScreen != null)
                mInCallScreen.internalHangupAllCalls(mCM);
            if (notificationMgr != null)
            {
                Log.d("PhoneGlobals", "IPO Shutdown: call cancelMissedCallNotification()");
                notificationMgr.cancelMissedCallNotification();
                return;
            }
            if (true) goto _L1; else goto _L6
_L6:
            if (!s.equals("android.intent.action.ACTION_PREBOOT_IPO"))
                break; /* Loop/switch isn't completed */
            Log.d("PhoneGlobals", "ACTION_PREBOOT_IPO received");
            android.provider.Settings.System.putLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting", 0L);
            if ("1".equals(SystemProperties.get("sys.boot.reason")))
                Log.d("PhoneGlobals", "Alarm boot detected");
            else
                Log.d("PhoneGlobals", "IPO boot up detected");
            phone.setRadioPowerOn();
            if (inCallUiState != null)
                inCallUiState.clearState();
            if (notifier != null)
            {
                Log.d("PhoneGlobals", "IPO Reboot: call showMissedCallNotification()");
                notifier.showMissedCallNotification(null, 0L);
                return;
            }
            if (true) goto _L1; else goto _L7
_L7:
            if (s.equals(GeminiPhone.EVENT_3G_SWITCH_START_MD_RESET))
            {
                Log.d("PhoneGlobals", "EVENT_3G_SWITCH_START_MD_RESET");
                android.provider.Settings.System.putLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting", 0L);
                return;
            }
            if (s.equals("android.intent.action.RADIO_OFF"))
            {
                int j = intent.getIntExtra("slotId", 0);
                Log.d("PhoneGlobals", (new StringBuilder()).append("ACTION_RADIO_OFF slot = ").append(j).toString());
                clearSimSettingFlag(j);
                Log.i("PhoneGlobals", "[xp Test][MODEM RESET]");
                return;
            }
            if (s.equals("com.mtk.ACTION_MODEM_STATE"))
            {
                SystemService.start("md_minilog_util");
                return;
            }
            if (s.equals("TRIGGER_MAINTHREAD_LOOPER"))
            {
                Log.d("PhoneGlobals", "TRIGGER_MAINTHREAD_LOOPER received");
                mHandler.sendEmptyMessage(31);
                return;
            }
            if (!"android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s))
                break; /* Loop/switch isn't completed */
            if (intent.getBooleanExtra("showPlmn", false))
            {
                String s1 = intent.getStringExtra("plmn");
                int i = 0 + intent.getIntExtra("simId", 0);
                Log.d("PhoneGlobals", (new StringBuilder()).append("[SPN_STRINGS_UPDATED_ACTION]index = ").append(i).toString());
                Log.d("PhoneGlobals", (new StringBuilder()).append("[SPN_STRINGS_UPDATED_ACTION]plmn = ").append(s1).toString());
                if (i < 2)
                {
                    String s2 = getResources().getText(0x10402e6).toString();
                    boolean aflag[] = mIsNoService;
                    boolean flag;
                    if (s1 == null || s1.equals(s2))
                        flag = true;
                    else
                        flag = false;
                    aflag[i] = flag;
                    return;
                }
            }
            if (true) goto _L1; else goto _L8
_L8:
            if ("android.intent.action.normal.boot".equals(s))
            {
                Log.d("PhoneGlobals", "receive alarm normal boot");
                return;
            }
            if ("android.intent.action.CALL_SOS".equals(s))
            {
                Log.i("PhoneGlobals", "SOS call.....");
                Intent intent1 = new Intent("android.intent.action.CALL_PRIVILEGED");
                intent1.setData(Uri.fromParts("tel", "112", null));
                intent1.setFlags(0x10000000);
                startActivity(intent1);
                return;
            }
            if (true) goto _L1; else goto _L9
_L9:
        }

        private PhoneGlobalsBroadcastReceiver()
        {
            this$0 = PhoneGlobals.this;
            super();
        }

    }

    public static final class WakeState extends Enum
    {

        private static final WakeState $VALUES[];
        public static final WakeState FULL;
        public static final WakeState PARTIAL;
        public static final WakeState SLEEP;

        public static WakeState valueOf(String s)
        {
            return (WakeState)Enum.valueOf(com/android/phone/PhoneGlobals$WakeState, s);
        }

        public static WakeState[] values()
        {
            return (WakeState[])$VALUES.clone();
        }

        static 
        {
            SLEEP = new WakeState("SLEEP", 0);
            PARTIAL = new WakeState("PARTIAL", 1);
            FULL = new WakeState("FULL", 2);
            WakeState awakestate[] = new WakeState[3];
            awakestate[0] = SLEEP;
            awakestate[1] = PARTIAL;
            awakestate[2] = FULL;
            $VALUES = awakestate;
        }

        private WakeState(String s, int i)
        {
            super(s, i);
        }
    }


    public static final String ACTION_CALL_BACK_FROM_NOTIFICATION = "com.android.phone.ACTION_CALL_BACK_FROM_NOTIFICATION";
    public static final String ACTION_HANG_UP_ONGOING_CALL = "com.android.phone.ACTION_HANG_UP_ONGOING_CALL";
    private static final String ACTION_MODEM_STATE = "com.mtk.ACTION_MODEM_STATE";
    public static final String ACTION_SEND_SMS_FROM_NOTIFICATION = "com.android.phone.ACTION_SEND_SMS_FROM_NOTIFICATION";
    private static final String ALLOWED_EXTRA_CALL_ORIGIN = "com.android.contacts.activities.DialtactsActivity";
    private static final long CALL_ORIGIN_EXPIRATION_MILLIS = 30000L;
    private static final int CCCI_MD_BROADCAST_EXCEPTION = 1;
    private static final int CCCI_MD_BROADCAST_READY = 3;
    private static final int CCCI_MD_BROADCAST_RESET = 2;
    private static final boolean DBG = true;
    static final int DBG_LEVEL = 1;
    private static final String DEFAULT_CALL_ORIGIN_PACKAGE = "com.android.contacts";
    public static final int DELAY_SHOW_INCALL_SCREEN_FOR_STK_SETUP_CALL = 160;
    private static final int EVENT_DATA_ROAMING_DISCONNECTED = 10;
    private static final int EVENT_DATA_ROAMING_OK = 11;
    private static final int EVENT_DOCK_STATE_CHANGED = 13;
    public static final int EVENT_SHOW_INCALL_SCREEN_FOR_STK_SETUP_CALL = 57;
    private static final int EVENT_SIM_NETWORK_LOCKED2 = 103;
    private static final int EVENT_SIM_NETWORK_LOCKED3 = 203;
    private static final int EVENT_SIM_NETWORK_LOCKED4 = 303;
    private static final int EVENT_SIM_STATE_CHANGED = 8;
    private static final int EVENT_START_SIP_SERVICE = 17;
    private static final int EVENT_TIMEOUT = 18;
    private static final int EVENT_TOUCH_ANSWER_VT = 30;
    private static final int EVENT_TRIGGER_MAINTHREAD_LOOPER = 31;
    private static final int EVENT_TTY_MODE_GET = 15;
    private static final int EVENT_TTY_MODE_SET = 16;
    private static final int EVENT_TTY_PREFERRED_MODE_CHANGED = 14;
    private static final int EVENT_UNSOL_CDMA_INFO_RECORD = 12;
    private static final int EVENT_UPDATE_INCALL_NOTIFICATION = 9;
    private static final int EVENT_WIRED_HEADSET_PLUG = 7;
    public static final String EXTRA_CALL_ORIGIN = "com.android.phone.CALL_ORIGIN";
    public static final boolean IS_VIDEO_CALL_SUPPORT = true;
    static final String LOG_TAG = "PhoneGlobals";
    public static final int MESSAGE_SET_PREFERRED_NETWORK_TYPE = 10011;
    public static final String MISSEDCALL_DELETE_INTENT = "com.android.phone.MISSEDCALL_DELETE_INTENT";
    public static final int MMI_CANCEL = 53;
    public static final int MMI_CANCEL2 = 153;
    public static final int MMI_CANCEL3 = 253;
    public static final int MMI_CANCEL4 = 353;
    public static final int MMI_CANCEL_GEMINI[] = {
        53, 153, 253, 353
    };
    public static final int MMI_COMPLETE = 52;
    public static final int MMI_COMPLETE2 = 152;
    public static final int MMI_COMPLETE3 = 252;
    public static final int MMI_COMPLETE4 = 352;
    public static final int MMI_COMPLETE_GEMINI[] = {
        52, 152, 252, 352
    };
    public static final int MMI_INITIATE = 51;
    public static final int MMI_INITIATE2 = 151;
    public static final int MMI_INITIATE3 = 251;
    public static final int MMI_INITIATE4 = 351;
    public static final int MMI_INITIATE_GEMINI[] = {
        51, 151, 251, 351
    };
    public static final String NETWORK_MODE_CHANGE = "com.android.phone.NETWORK_MODE_CHANGE";
    public static final String NETWORK_MODE_CHANGE_RESPONSE = "com.android.phone.NETWORK_MODE_CHANGE_RESPONSE";
    public static final String OLD_NETWORK_MODE = "com.android.phone.OLD_NETWORK_MODE";
    private static final String PERMISSION = "android.permission.PROCESS_OUTGOING_CALLS";
    private static final String STKCALL_REGISTER_SPEECH_INFO = "com.android.stk.STKCALL_REGISTER_SPEECH_INFO";
    private static final int USE_CM = 1;
    private static final boolean VDBG = true;
    static int mDockState = 0;
    public static boolean sHasNavigationBar;
    private static PhoneGlobals sMe;
    static boolean sVoiceCapable = true;
    public CallController callController;
    public CallerInfoCache callerInfoCache;
    public OtaUtils.CdmaOtaConfigData cdmaOtaConfigData;
    public OtaUtils.CdmaOtaInCallScreenUiState cdmaOtaInCallScreenUiState;
    public OtaUtils.CdmaOtaProvisionData cdmaOtaProvisionData;
    public OtaUtils.CdmaOtaScreenState cdmaOtaScreenState;
    public CdmaPhoneCallState cdmaPhoneCallState;
    public CellConnMgr cellConnMgr;
    public InCallUiState inCallUiState;
    private AccelerometerListener mAccelerometerListener;
    AudioManager mAudioManager;
    private boolean mBeginningCall;
    int mBluetoothHeadsetAudioState;
    int mBluetoothHeadsetState;
    public IBluetoothHeadsetPhone mBluetoothPhone;
    private final ServiceConnection mBluetoothPhoneConnection = new ServiceConnection() {

        final PhoneGlobals this$0;

        public void onServiceConnected(ComponentName componentname, IBinder ibinder)
        {
            Log.i("PhoneGlobals", "Headset phone created, binding local service.");
            mBluetoothPhone = android.bluetooth.IBluetoothHeadsetPhone.Stub.asInterface(ibinder);
        }

        public void onServiceDisconnected(ComponentName componentname)
        {
            Log.i("PhoneGlobals", "Headset phone disconnected, cleaning local binding.");
            mBluetoothPhone = null;
        }

            
            {
                this$0 = PhoneGlobals.this;
                super();
            }
    }
;
    public CallManager mCM;
    public MTKCallManager mCMGemini;
    private String mCachedSimPin;
    Handler mHandler;
    private InCallScreen mInCallScreen;
    private boolean mIsHardKeyboardOpen;
    private boolean mIsHeadsetPlugged;
    private boolean mIsNoService[] = {
        1, 1
    };
    private boolean mIsSimPinEnabled;
    private KeyguardManager mKeyguardManager;
    private com.android.internal.telephony.PhoneConstants.State mLastPhoneState;
    private final BroadcastReceiver mMediaButtonReceiver = new MediaButtonBroadcastReceiver();
    private int mOrientation;
    private Activity mPUKEntryActivity;
    private ProgressDialog mPUKEntryProgressDialog;
    private android.os.PowerManager.WakeLock mPartialWakeLock;
    private PowerManager mPowerManager;
    private IPowerManager mPowerManagerService;
    private int mPreferredTtyMode;
    private android.os.PowerManager.WakeLock mProximityWakeLock;
    private final BroadcastReceiver mReceiver = new PhoneGlobalsBroadcastReceiver();
    private boolean mShouldRestoreMuteOnInCallResume;
    boolean mShowBluetoothIndication;
    private boolean mTtyEnabled;
    private UpdateLock mUpdateLock;
    private android.os.PowerManager.WakeLock mWakeLock;
    private android.os.PowerManager.WakeLock mWakeLockForDisconnect;
    private WakeState mWakeState;
    private int mWakelockSequence;
    public NotificationMgr notificationMgr;
    public CallNotifier notifier;
    public OtaUtils otaUtils;
    public Phone phone;
    public PhoneInterfaceManager phoneMgr;
    public PhoneInterfaceManagerEx phoneMgrEx;
    public Ringer ringer;

    public PhoneGlobals(Context context)
    {
        super(context);
        mBluetoothHeadsetState = 0;
        mBluetoothHeadsetAudioState = 10;
        mShowBluetoothIndication = false;
        mLastPhoneState = com.android.internal.telephony.PhoneConstants.State.IDLE;
        mWakeState = WakeState.SLEEP;
        mWakelockSequence = 0;
        mOrientation = 0;
        mAudioManager = null;
        mPreferredTtyMode = 0;
        mHandler = new Handler() {

            final PhoneGlobals this$0;

            public void handleMessage(Message message)
            {
                message.what;
                JVM INSTR lookupswitch 28: default 240
            //                           7: 415
            //                           8: 556
            //                           9: 252
            //                           10: 271
            //                           11: 286
            //                           12: 240
            //                           13: 627
            //                           14: 726
            //                           15: 761
            //                           16: 770
            //                           17: 241
            //                           18: 779
            //                           30: 879
            //                           31: 915
            //                           51: 297
            //                           52: 349
            //                           53: 389
            //                           57: 911
            //                           151: 297
            //                           152: 349
            //                           153: 389
            //                           251: 297
            //                           252: 349
            //                           253: 389
            //                           351: 297
            //                           352: 349
            //                           353: 389
            //                           10011: 791;
                   goto _L1 _L2 _L3 _L4 _L5 _L6 _L1 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18 _L15 _L16 _L17 _L15 _L16 _L17 _L15 _L16 _L17 _L19
_L9:
                break MISSING_BLOCK_LABEL_761;
_L10:
                break MISSING_BLOCK_LABEL_770;
_L12:
                break MISSING_BLOCK_LABEL_779;
_L19:
                break MISSING_BLOCK_LABEL_791;
_L13:
                break MISSING_BLOCK_LABEL_879;
_L18:
                break MISSING_BLOCK_LABEL_911;
_L1:
                break; /* Loop/switch isn't completed */
_L14:
                break MISSING_BLOCK_LABEL_915;
_L20:
                return;
_L11:
                SipService.start(getApplicationContext());
                return;
_L4:
                Log.d("PhoneGlobals", "- updating in-call notification from handler...");
                notificationMgr.updateInCallNotification();
                return;
_L5:
                notificationMgr.showDataDisconnectedRoaming(message.arg1);
                return;
_L6:
                notificationMgr.hideDataDisconnectedRoaming();
                return;
_L15:
                int i1 = GeminiRegister.getSlotIdByRegisterEvent(message.what, PhoneGlobals.MMI_INITIATE_GEMINI);
                if (mInCallScreen == null)
                {
                    inCallUiState.setPendingUssdMessage(Message.obtain(mHandler, i1, (AsyncResult)message.obj));
                    return;
                }
                continue; /* Loop/switch isn't completed */
_L16:
                inCallUiState.setPendingUssdMessage(null);
                int l = GeminiRegister.getSlotIdByRegisterEvent(message.what, PhoneGlobals.MMI_COMPLETE_GEMINI);
                onMMIComplete((AsyncResult)message.obj, l);
                return;
_L17:
                int k = GeminiRegister.getSlotIdByRegisterEvent(message.what, PhoneGlobals.MMI_CANCEL_GEMINI);
                PhoneUtils.cancelMmiCodeExt(phone, k);
                return;
_L2:
                com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
                if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && !isShowingCallScreen() && !isBluetoothHeadsetAudioOn())
                    if (!isHeadsetPlugged())
                    {
                        if (VTCallUtils.isVTActive() && VTCallUtils.isVTDialWithSpeakerOff())
                        {
                            PhoneUtils.turnOnSpeaker(getApplicationContext(), true, true);
                            VTCallUtils.setVTDialWithSpeakerOff(false);
                        } else
                        {
                            PhoneUtils.restoreSpeakerMode(getApplicationContext());
                        }
                    } else
                    {
                        PhoneUtils.turnOnSpeaker(getApplicationContext(), false, false);
                    }
                updateProximitySensorMode(state);
                if (mTtyEnabled)
                {
                    sendMessage(obtainMessage(14, Integer.valueOf(0)));
                    return;
                }
                continue; /* Loop/switch isn't completed */
_L3:
                if (message.obj.equals("READY"))
                {
                    if (mPUKEntryActivity != null)
                    {
                        mPUKEntryActivity.finish();
                        mPUKEntryActivity = null;
                    }
                    if (mPUKEntryProgressDialog != null)
                    {
                        mPUKEntryProgressDialog.dismiss();
                        mPUKEntryProgressDialog = null;
                        return;
                    }
                }
                if (true) goto _L20; else goto _L7
_L7:
                int j = PhoneGlobals.mDockState;
                boolean flag = false;
                if (j != 0)
                    flag = true;
                Log.d("PhoneGlobals", (new StringBuilder()).append("received EVENT_DOCK_STATE_CHANGED. Phone inDock = ").append(flag).toString());
                if (mCM.getState() == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && !isHeadsetPlugged() && !isBluetoothHeadsetAudioOn())
                {
                    PhoneUtils.turnOnSpeaker(getApplicationContext(), flag, true);
                    updateInCallScreen();
                    return;
                }
                if (true) goto _L20; else goto _L8
_L8:
                int i;
                if (isHeadsetPlugged())
                    i = mPreferredTtyMode;
                else
                    i = 0;
                setTTYMode(i);
                return;
                handleQueryTTYModeResponse(message);
                return;
                handleSetTTYModeResponse(message);
                return;
                handleTimeout(message.arg1);
                return;
                AsyncResult asyncresult = (AsyncResult)message.obj;
                Intent intent = new Intent("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE");
                if (asyncresult.exception == null)
                {
                    intent.putExtra("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE", true);
                    intent.putExtra("NEW_NETWORK_MODE", message.arg2);
                } else
                {
                    intent.putExtra("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE", false);
                    intent.putExtra("com.android.phone.OLD_NETWORK_MODE", message.arg1);
                }
                sendBroadcast(intent);
                return;
                Log.d("PhoneGlobals", "mHandler.handleMessage() : EVENT_TOUCH_ANSWER_VT");
                try
                {
                    getInCallScreenInstance().internalAnswerCall();
                    return;
                }
                catch (Exception exception)
                {
                    Log.d("PhoneGlobals", "mHandler.handleMessage() : the InCallScreen Instance is null , so cannot answer incoming VT call");
                }
                return;
                PhoneUtils.showIncomingCallUi();
                return;
                Log.d("PhoneGlobals", "handle EVENT_TRIGGER_MAINTHREAD_LOOPER");
                return;
            }

            
            {
                this$0 = PhoneGlobals.this;
                super();
            }
        }
;
        mCMGemini = null;
        sMe = this;
    }

    public static boolean bNeedUnlockSIMLock(int i)
    {
        GeminiPhone geminiphone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        if (geminiphone.getIccCardGemini(i).getState() != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && geminiphone.getIccCardGemini(i).getState() != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED && geminiphone.getIccCardGemini(i).getState() != com.android.internal.telephony.IccCardConstants.State.NOT_READY)
        {
            return true;
        } else
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("[bNeedUnlockSIMLock][NO Card/PIN/PUK]: ").append(i).toString());
            return false;
        }
    }

    private void clearSimSettingFlag(int i)
    {
        Long long1 = Long.valueOf(3L << i * 2);
        Long.valueOf(0L);
        try
        {
            Long long2 = Long.valueOf(Long.valueOf(android.provider.Settings.System.getLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting")).longValue() & (-1L ^ long1.longValue()));
            android.provider.Settings.System.putLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting", long2.longValue());
            return;
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            Log.e("PhoneGlobals", "clearSimSettingFlag exception");
            settingnotfoundexception.printStackTrace();
            return;
        }
    }

    private int convertTTYmodeToRadio(int i)
    {
        switch (i)
        {
        case 1: // '\001'
        case 2: // '\002'
        case 3: // '\003'
            return 1;
        }
        return 0;
    }

    static Intent createCallLogIntent()
    {
        Intent intent = new Intent("android.intent.action.VIEW", null);
        intent.setType("vnd.android.cursor.dir/calls");
        return intent;
    }

    static PendingIntent createHangUpOngoingCallPendingIntent(Context context)
    {
        return PendingIntent.getBroadcast(context, 0, new Intent("com.android.phone.ACTION_HANG_UP_ONGOING_CALL", null, context, com/android/phone/PhoneGlobals$NotificationBroadcastReceiver), 0);
    }

    static Intent createInCallIntent()
    {
        Intent intent = new Intent("android.intent.action.MAIN", null);
        intent.setFlags(0x10850000);
        intent.setClassName("com.android.phone", getCallScreenClassName());
        return intent;
    }

    static Intent createInCallIntent(boolean flag)
    {
        Intent intent = createInCallIntent();
        intent.putExtra("com.android.phone.ShowDialpad", flag);
        return intent;
    }

    static Intent createVTInCallIntent()
    {
        Intent intent = createInCallIntent();
        intent.putExtra("com.android.phone.extra.video", true);
        return intent;
    }

    static PendingIntent getCallBackPendingIntent(Context context, String s)
    {
        return PendingIntent.getBroadcast(context, 0, new Intent("com.android.phone.ACTION_CALL_BACK_FROM_NOTIFICATION", Uri.fromParts("tel", s, null), context, com/android/phone/PhoneGlobals$NotificationBroadcastReceiver), 0);
    }

    static String getCallScreenClassName()
    {
        return com/android/phone/InCallScreen.getName();
    }

    public static PhoneGlobals getInstance()
    {
        if (sMe == null)
            throw new IllegalStateException("No PhoneGlobals here!");
        else
            return sMe;
    }

    static PhoneGlobals getInstanceIfPrimary()
    {
        return sMe;
    }

    public static Phone getPhone()
    {
        return getInstance().phone;
    }

    static PendingIntent getSendSmsFromNotificationPendingIntent(Context context, String s)
    {
        return PendingIntent.getBroadcast(context, 0, new Intent("com.android.phone.ACTION_SEND_SMS_FROM_NOTIFICATION", Uri.fromParts("smsto", s, null), context, com/android/phone/PhoneGlobals$NotificationBroadcastReceiver), 0);
    }

    private void handleQueryTTYModeResponse(Message message)
    {
        if (((AsyncResult)message.obj).exception != null)
        {
            Log.d("PhoneGlobals", "handleQueryTTYModeResponse: Error getting TTY state.");
            return;
        }
        Log.d("PhoneGlobals", "handleQueryTTYModeResponse: TTY enable state successfully queried.");
        boolean flag = isHeadsetPlugged();
        int i = 0;
        if (flag)
            i = mPreferredTtyMode;
        Log.d("PhoneGlobals", (new StringBuilder()).append("handleQueryTTYModeResponse:ttymode=").append(i).toString());
        Intent intent = new Intent("com.android.internal.telephony.cdma.intent.action.TTY_ENABLED_CHANGE");
        boolean flag1;
        if (i != 0)
            flag1 = true;
        else
            flag1 = false;
        intent.putExtra("ttyEnabled", flag1);
        sendBroadcastAsUser(intent, UserHandle.ALL);
        String s;
        switch (i)
        {
        case 2: // '\002'
            s = "tty_hco";
            break;

        case 3: // '\003'
            s = "tty_vco";
            break;

        case 1: // '\001'
            s = "tty_full";
            break;

        default:
            s = "tty_off";
            break;
        }
        ((AudioManager)getSystemService("audio")).setParameters((new StringBuilder()).append("tty_mode=").append(s).toString());
        PhoneUtils.setTtyMode(s);
    }

    private void handleServiceStateChanged(Intent intent)
    {
        ServiceState servicestate = ServiceState.newFromBundle(intent.getExtras());
        if (servicestate != null)
        {
            int i = servicestate.getState();
            notificationMgr.updateNetworkSelection(i, servicestate.getMySimId());
        }
    }

    private void handleSetTTYModeResponse(Message message)
    {
        AsyncResult asyncresult = (AsyncResult)message.obj;
        if (asyncresult.exception != null)
            Log.d("PhoneGlobals", (new StringBuilder()).append("handleSetTTYModeResponse: Error setting TTY mode, ar.exception").append(asyncresult.exception).toString());
        Message message1 = mHandler.obtainMessage(15);
        message1.obj = new AsyncResult(null, null, null);
        message1.sendToTarget();
    }

    private void initForNewRadioTechnology()
    {
        Log.d("PhoneGlobals", "initForNewRadioTechnology...");
        if (phone.getPhoneType() == 2)
        {
            cdmaPhoneCallState = new CdmaPhoneCallState();
            cdmaPhoneCallState.CdmaPhoneCallStateInit();
        }
        if (TelephonyCapabilities.supportsOtasp(phone))
        {
            if (cdmaOtaProvisionData == null)
                cdmaOtaProvisionData = new OtaUtils.CdmaOtaProvisionData();
            if (cdmaOtaConfigData == null)
                cdmaOtaConfigData = new OtaUtils.CdmaOtaConfigData();
            if (cdmaOtaScreenState == null)
                cdmaOtaScreenState = new OtaUtils.CdmaOtaScreenState();
            if (cdmaOtaInCallScreenUiState == null)
                cdmaOtaInCallScreenUiState = new OtaUtils.CdmaOtaInCallScreenUiState();
        } else
        {
            clearOtaState();
        }
        ringer.updateRingerContextAfterRadioTechnologyChange(phone);
        notifier.updateCallNotifierRegistrationsAfterRadioTechnologyChange();
        if (mBluetoothPhone != null)
            try
            {
                mBluetoothPhone.updateBtHandsfreeAfterRadioTechnologyChange();
            }
            catch (RemoteException remoteexception)
            {
                Log.e("PhoneGlobals", Log.getStackTraceString(new Throwable()));
            }
        if (mInCallScreen != null)
            mInCallScreen.updateAfterRadioTechnologyChange();
    }

    private void onMMIComplete(AsyncResult asyncresult, int i)
    {
        Log.d("PhoneGlobals", "onMMIComplete()...");
        MmiCode mmicode = (MmiCode)asyncresult.result;
        if (mmicode == null)
            return;
        com.android.internal.telephony.MmiCode.State state = mmicode.getState();
        if (GeminiUtils.isGeminiSupport() && state != com.android.internal.telephony.MmiCode.State.PENDING)
        {
            Intent intent = new Intent();
            intent.setAction("com.android.phone.mmi");
            sendBroadcast(intent);
        }
        PhoneUtils.displayMMICompleteExt(phone, getApplicationContext(), mmicode, null, null, i);
    }

    private void registerPhone()
    {
        mCM = CallManager.getInstance();
        if (GeminiUtils.isGeminiSupport())
        {
            mCMGemini = MTKCallManager.getInstance();
            mCMGemini.registerPhoneGemini(phone);
            return;
        } else
        {
            mCM.registerPhone(phone);
            return;
        }
    }

    private void setTTYMode(int i)
    {
        if (GeminiUtils.isGeminiSupport())
        {
            GeminiPhone geminiphone = (GeminiPhone)phone;
            int ai[] = GeminiUtils.getSlots();
            int j = ai.length;
            for (int k = 0; k < j; k++)
            {
                int l = ai[k];
                geminiphone.setTTYModeGemini(convertTTYmodeToRadio(i), mHandler.obtainMessage(16), l);
            }

        } else
        {
            phone.setTTYMode(convertTTYmodeToRadio(i), mHandler.obtainMessage(16));
        }
    }

    private static boolean shouldShowBluetoothIndication(int i, int j, CallManager callmanager)
    {
        boolean flag = true;
        static class _cls3
        {

            static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$State[];
            static final int $SwitchMap$com$android$phone$PhoneGlobals$WakeState[];

            static 
            {
                $SwitchMap$com$android$internal$telephony$PhoneConstants$State = new int[com.android.internal.telephony.PhoneConstants.State.values().length];
                try
                {
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.OFFHOOK.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$telephony$PhoneConstants$State[com.android.internal.telephony.PhoneConstants.State.RINGING.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                $SwitchMap$com$android$phone$PhoneGlobals$WakeState = new int[WakeState.values().length];
                try
                {
                    $SwitchMap$com$android$phone$PhoneGlobals$WakeState[WakeState.PARTIAL.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$phone$PhoneGlobals$WakeState[WakeState.FULL.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$phone$PhoneGlobals$WakeState[WakeState.SLEEP.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror4)
                {
                    return;
                }
            }
        }

        switch (_cls3..SwitchMap.com.android.internal.telephony.PhoneConstants.State[callmanager.getState().ordinal()])
        {
        case 2: // '\002'
            if (i != 2)
                return false;
            break;

        case 1: // '\001'
            if (i != 2 || j != 12)
                return false;
            break;

        default:
            flag = false;
            break;
        }
        return flag;
    }

    void addCallSync()
    {
        Call call = mCM.getActiveFgCall();
        Call call1 = mCM.getFirstActiveBgCall();
        byte byte0 = 2;
        int i = GeminiUtils.getDefaultSlot();
        if (GeminiUtils.isGeminiSupport())
        {
            i = GeminiUtils.getSlotNotIdle(phone);
            if (mInCallScreen != null)
            {
                android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(mInCallScreen, i);
                if (siminfo != null)
                    i = (int)siminfo.mSimId;
            } else
            {
                i = GeminiUtils.getDefaultSlot();
            }
        }
        if (call.getState() != com.android.internal.telephony.Call.State.IDLE)
        {
            Iterator iterator1 = call.getConnections().iterator();
            do
            {
                if (!iterator1.hasNext())
                    break;
                Connection connection1 = (Connection)iterator1.next();
                if (connection1.isAlive())
                {
                    com.android.internal.telephony.CallerInfo callerinfo1 = notifier.getCallerInfoFromConnection(connection1);
                    if (connection1.isIncoming())
                        byte0 = 1;
                    int k;
                    if (connection1.isVideo())
                        k = 1;
                    else
                        k = 0;
                    android.provider.CallLog.Calls.addCall(callerinfo1, mInCallScreen, connection1.getAddress(), notifier.getPresentation(connection1, callerinfo1), byte0, connection1.getCreateTime(), (int)(connection1.getDurationMillis() / 1000L), i, k);
                }
            } while (true);
        }
        if (call1.getState() != com.android.internal.telephony.Call.State.IDLE)
        {
            Iterator iterator = call1.getConnections().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                Connection connection = (Connection)iterator.next();
                if (connection.isAlive())
                {
                    com.android.internal.telephony.CallerInfo callerinfo = notifier.getCallerInfoFromConnection(connection);
                    if (connection.isIncoming())
                        byte0 = 1;
                    int j;
                    if (connection.isVideo())
                        j = 1;
                    else
                        j = 0;
                    android.provider.CallLog.Calls.addCall(callerinfo, mInCallScreen, connection.getAddress(), notifier.getPresentation(connection, callerinfo), byte0, connection.getCreateTime(), (int)(connection.getDurationMillis() / 1000L), i, j);
                }
            } while (true);
        }
    }

    boolean authenticateAgainstCachedSimPin(String s)
    {
        return mCachedSimPin != null && mCachedSimPin.equals(s);
    }

    void clearInCallScreenInstance(InCallScreen incallscreen)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("clearInCallScreenInstance(), inCallScreen = ").append(incallscreen).toString());
        if (mInCallScreen == incallscreen)
        {
            Log.d("PhoneGlobals", "same InCallScreen instance");
            mInCallScreen = null;
        }
    }

    public void clearInCallScreenMode()
    {
        Log.d("PhoneGlobals", "- clearInCallScreenMode ...");
        if (mInCallScreen != null)
            mInCallScreen.resetInCallScreenMode();
    }

    public void clearOtaState()
    {
        Log.d("PhoneGlobals", "- clearOtaState ...");
        if (mInCallScreen != null && otaUtils != null)
        {
            otaUtils.cleanOtaScreen(true);
            Log.d("PhoneGlobals", "  - clearOtaState clears OTA screen");
        }
    }

    public Intent createPhoneEndIntent()
    {
        if (TextUtils.equals(inCallUiState.latestActiveCallOrigin, "com.android.contacts.activities.DialtactsActivity"))
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("Valid latestActiveCallOrigin(").append(inCallUiState.latestActiveCallOrigin).append(") was found. ").append("Go back to the previous screen.").toString());
            Intent intent = new Intent();
            intent.setClassName("com.android.contacts", inCallUiState.latestActiveCallOrigin);
            return intent;
        } else
        {
            return null;
        }
    }

    public Intent createPhoneEndIntentUsingCallOrigin()
    {
        if (TextUtils.equals(inCallUiState.latestActiveCallOrigin, "com.android.contacts.activities.DialtactsActivity"))
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("Valid latestActiveCallOrigin(").append(inCallUiState.latestActiveCallOrigin).append(") was found. ").append("Go back to the previous screen.").toString());
            Intent intent = new Intent();
            intent.setClassName("com.android.contacts", inCallUiState.latestActiveCallOrigin);
            return intent;
        } else
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("Current latestActiveCallOrigin (").append(inCallUiState.latestActiveCallOrigin).append(") is not valid. ").append("Just use CallLog as a default destination.").toString());
            return createCallLogIntent();
        }
    }

    void dismissCallScreen()
    {
        if (mInCallScreen != null)
        {
            if (!TelephonyCapabilities.supportsOtasp(phone) || !mInCallScreen.isOtaCallInActiveState() && !mInCallScreen.isOtaCallInEndState() && (cdmaOtaScreenState == null || cdmaOtaScreenState.otaScreenState == OtaUtils.CdmaOtaScreenState.OtaScreenState.OTA_STATUS_UNDEFINED))
            {
                mInCallScreen.finish();
                return;
            } else
            {
                wakeUpScreen();
                displayCallScreen(true);
                mInCallScreen.handleOtaCallEnd();
                return;
            }
        } else
        {
            InCallUiState.sLastInCallScreenStatus = 1;
            return;
        }
    }

    public void dismissOtaDialogs()
    {
        Log.d("PhoneGlobals", "- dismissOtaDialogs ...");
        if (mInCallScreen != null && otaUtils != null)
        {
            otaUtils.dismissAllOtaDialogs();
            Log.d("PhoneGlobals", "  - dismissOtaDialogs clears OTA dialogs");
        }
    }

    public void displayCallScreen(boolean flag)
    {
        displayCallScreen(flag, false);
    }

    public void displayCallScreen(boolean flag, boolean flag1)
    {
        Log.d("PhoneGlobals", "displayCallScreen()...");
        if (!sVoiceCapable)
        {
            Log.w("PhoneGlobals", "displayCallScreen() not allowed: non-voice-capable device", new Throwable("stack dump"));
            return;
        }
        if (!flag) goto _L2; else goto _L1
_L1:
        Intent intent1 = createInCallIntent();
_L3:
        if (!flag1)
            break MISSING_BLOCK_LABEL_58;
        intent1.putExtra("isForPlaceCall", true);
        startActivity(intent1);
_L4:
        Profiler.callScreenRequested();
        return;
_L2:
        Intent intent = createVTInCallIntent();
        intent1 = intent;
          goto _L3
        ActivityNotFoundException activitynotfoundexception;
        activitynotfoundexception;
        Log.w("PhoneGlobals", (new StringBuilder()).append("displayCallScreen: transition to InCallScreen failed: ").append(activitynotfoundexception).toString());
          goto _L4
    }

    IBluetoothHeadsetPhone getBluetoothPhoneService()
    {
        return mBluetoothPhone;
    }

    public Object getCallManager()
    {
        if (GeminiUtils.isGeminiSupport())
            return mCMGemini;
        else
            return mCM;
    }

    public InCallScreen getInCallScreenInstance()
    {
        return mInCallScreen;
    }

    KeyguardManager getKeyguardManager()
    {
        return mKeyguardManager;
    }

    Activity getPUKEntryActivity()
    {
        return mPUKEntryActivity;
    }

    ProgressDialog getPUKEntryProgressDialog()
    {
        return mPUKEntryProgressDialog;
    }

    com.android.internal.telephony.PhoneConstants.State getPhoneState()
    {
        return mLastPhoneState;
    }

    boolean getRestoreMuteOnInCallResume()
    {
        return mShouldRestoreMuteOnInCallResume;
    }

    Ringer getRinger()
    {
        return ringer;
    }

    UpdateLock getUpdateLock()
    {
        return mUpdateLock;
    }

    void handleOtaspDisconnect()
    {
        Log.d("PhoneGlobals", "handleOtaspDisconnect()...");
        if (otaUtils == null)
        {
            Log.w("PhoneGlobals", "handleOtaspDisconnect: otaUtils is null!");
            return;
        } else
        {
            otaUtils.onOtaspDisconnect();
            return;
        }
    }

    void handleOtaspEvent(Message message)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("handleOtaspEvent(message ").append(message).append(")...").toString());
        if (otaUtils == null)
        {
            Log.w("PhoneGlobals", (new StringBuilder()).append("handleOtaEvents: got an event but otaUtils is null! message = ").append(message).toString());
            return;
        } else
        {
            otaUtils.onOtaProvisionStatusChanged((AsyncResult)message.obj);
            return;
        }
    }

    void handleTimeout(int i)
    {
        this;
        JVM INSTR monitorenter ;
        Log.d("PhoneGlobals", "handleTimeout");
        if (i == mWakelockSequence)
            mWakeLockForDisconnect.release();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    boolean isBluetoothHeadsetAudioOn()
    {
        return mBluetoothHeadsetAudioState != 10;
    }

    public boolean isCurrentlyNoService()
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("[isCurrentlyNoService]mIsNoService[0] = ").append(mIsNoService[0]).toString());
        Log.d("PhoneGlobals", (new StringBuilder()).append("[isCurrentlyNoService]mIsNoService[1] = ").append(mIsNoService[1]).toString());
        return mIsNoService[0] && mIsNoService[1];
    }

    public boolean isEnableTTY()
    {
        return mTtyEnabled;
    }

    public boolean isHeadsetPlugged()
    {
        return mIsHeadsetPlugged;
    }

    public boolean isOtaCallInActiveState()
    {
        InCallScreen incallscreen = mInCallScreen;
        boolean flag = false;
        if (incallscreen != null)
            flag = mInCallScreen.isOtaCallInActiveState();
        Log.d("PhoneGlobals", (new StringBuilder()).append("- isOtaCallInActiveState ").append(flag).toString());
        return flag;
    }

    public boolean isOtaCallInEndState()
    {
        InCallScreen incallscreen = mInCallScreen;
        boolean flag = false;
        if (incallscreen != null)
            flag = mInCallScreen.isOtaCallInEndState();
        Log.d("PhoneGlobals", (new StringBuilder()).append("- isOtaCallInEndState ").append(flag).toString());
        return flag;
    }

    public boolean isQVGA()
    {
        boolean flag;
label0:
        {
            DisplayMetrics displaymetrics = new DisplayMetrics();
            ((WindowManager)getSystemService("window")).getDefaultDisplay().getMetrics(displaymetrics);
            if (displaymetrics.widthPixels != 320 || displaymetrics.heightPixels != 240)
            {
                int i = displaymetrics.widthPixels;
                flag = false;
                if (i != 240)
                    break label0;
                int j = displaymetrics.heightPixels;
                flag = false;
                if (j != 320)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    boolean isShowingCallScreen()
    {
        if (mInCallScreen == null)
            return false;
        else
            return mInCallScreen.isForegroundActivity();
    }

    boolean isShowingCallScreenForProximity()
    {
        if (mInCallScreen == null)
            return false;
        else
            return mInCallScreen.isForegroundActivityForProximity();
    }

    boolean isSimPinEnabled()
    {
        return mIsSimPinEnabled;
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        if (configuration.hardKeyboardHidden == 1)
            mIsHardKeyboardOpen = true;
        else
            mIsHardKeyboardOpen = false;
        updateProximitySensorMode(mCM.getState());
    }

    public void onCreate()
    {
        Log.v("PhoneGlobals", "onCreate()...");
        String s = SystemProperties.get("vold.decrypt");
        if (!SystemProperties.getBoolean("gsm.phone.created", false) && ("".equals(s) || "trigger_restart_framework".equals(s)))
        {
            Log.d("PhoneGlobals", "set System Property gsm.phone.created = true");
            SystemProperties.set("gsm.phone.created", "true");
            android.provider.Settings.System.putLong(getApplicationContext().getContentResolver(), "sim_lock_state_setting", 0L);
        }
        ContentResolver contentresolver = getContentResolver();
        sVoiceCapable = getResources().getBoolean(0x1110030);
        if (phone == null)
        {
            Log.v("PhoneGlobals", "onCreate(), start to make default phone");
            PhoneFactory.makeDefaultPhones(this);
            Log.v("PhoneGlobals", "onCreate(), make default phone complete");
            phone = PhoneFactory.getDefaultPhone();
            startService(new Intent(this, com/android/phone/TelephonyDebugService));
            registerPhone();
            notificationMgr = NotificationMgr.init(this);
            Log.v("PhoneGlobals", "onCreate(), start to new phone interface");
            phoneMgr = PhoneInterfaceManager.init(this, phone);
            phoneMgrEx = PhoneInterfaceManagerEx.init(this, phone);
            mHandler.sendEmptyMessage(17);
            int j = phone.getPhoneType();
            if (j == 2)
            {
                cdmaPhoneCallState = new CdmaPhoneCallState();
                cdmaPhoneCallState.CdmaPhoneCallStateInit();
            }
            Log.v("PhoneGlobals", "onCreate(), start to get BT default adapter");
            int i;
            AudioManager audiomanager;
            IntentFilter intentfilter;
            IntentFilter intentfilter1;
            if (BluetoothAdapter.getDefaultAdapter() != null)
            {
                startService(new Intent(this, com/android/phone/BluetoothPhoneService));
                bindService(new Intent(this, com/android/phone/BluetoothPhoneService), mBluetoothPhoneConnection, 0);
            } else
            {
                mBluetoothPhone = null;
            }
            ringer = Ringer.init(this);
            mPowerManager = (PowerManager)getSystemService("power");
            mWakeLock = mPowerManager.newWakeLock(0x3000001a, "PhoneGlobals");
            mWakeLockForDisconnect = mPowerManager.newWakeLock(0x2000001a, "PhoneGlobals");
            Log.v("PhoneGlobals", "onCreate(), new partial wakelock");
            mPartialWakeLock = mPowerManager.newWakeLock(0x20000001, "PhoneGlobals");
            if (mPowerManager.isWakeLockLevelSupported(32))
                mProximityWakeLock = mPowerManager.newWakeLock(32, "PhoneGlobals");
            Log.d("PhoneGlobals", (new StringBuilder()).append("onCreate: mProximityWakeLock: ").append(mProximityWakeLock).toString());
            if (proximitySensorModeEnabled())
                mAccelerometerListener = new AccelerometerListener(this, this);
            mKeyguardManager = (KeyguardManager)getSystemService("keyguard");
            mPowerManagerService = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
            mUpdateLock = new UpdateLock("phone");
            Log.d("PhoneGlobals", (new StringBuilder()).append("onCreate: mUpdateLock: ").append(mUpdateLock).toString());
            callController = CallController.init(this);
            inCallUiState = InCallUiState.init(this);
            callerInfoCache = CallerInfoCache.init(this);
            Log.v("PhoneGlobals", "onCreate(), new callnotifier");
            notifier = CallNotifier.init(this, phone, ringer, new CallLogAsync());
            if (j == 1)
            {
                Object obj = getCallManager();
                GeminiRegister.registerForMmiComplete(obj, mHandler, MMI_COMPLETE_GEMINI);
                GeminiRegister.registerForMmiInitiate(obj, mHandler, MMI_INITIATE_GEMINI);
            }
            Log.v("PhoneGlobals", "onCreate(), initialize connection handler");
            PhoneUtils.initializeConnectionHandler(mCM);
            if (PhoneUtils.isSupportFeature("TTY"))
                mTtyEnabled = getResources().getBoolean(0x7f0a0004);
            else
                mTtyEnabled = false;
            Log.v("PhoneGlobals", "onCreate(), new intentfilter");
            intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
            intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
            intentfilter.addAction("android.bluetooth.headset.profile.action.CONNECTION_STATE_CHANGED");
            intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
            intentfilter.addAction("android.bluetooth.headset.profile.action.AUDIO_STATE_CHANGED");
            intentfilter.addAction("android.intent.action.ANY_DATA_STATE");
            intentfilter.addAction("android.intent.action.HEADSET_PLUG");
            intentfilter.addAction("android.intent.action.DOCK_EVENT");
            intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
            intentfilter.addAction("android.intent.action.RADIO_TECHNOLOGY");
            intentfilter.addAction("android.intent.action.SERVICE_STATE");
            intentfilter.addAction("android.intent.action.EMERGENCY_CALLBACK_MODE_CHANGED");
            if (mTtyEnabled)
                intentfilter.addAction("com.android.internal.telephony.cdma.intent.action.TTY_PREFERRED_MODE_CHANGE");
            intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
            intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN");
            intentfilter.addAction("com.android.stk.STKCALL_REGISTER_SPEECH_INFO");
            intentfilter.addAction("com.android.phone.MISSEDCALL_DELETE_INTENT");
            intentfilter.addAction("out_going_call_to_phone_app");
            intentfilter.addAction("com.android.phone.NETWORK_MODE_CHANGE");
            intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
            intentfilter.addAction("android.intent.action.ACTION_PREBOOT_IPO");
            intentfilter.addAction(GeminiPhone.EVENT_3G_SWITCH_START_MD_RESET);
            intentfilter.addAction("android.intent.action.RADIO_OFF");
            intentfilter.addAction("com.mtk.ACTION_MODEM_STATE");
            intentfilter.addAction("TRIGGER_MAINTHREAD_LOOPER");
            intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
            intentfilter.addAction("android.intent.action.normal.boot");
            intentfilter.addAction("android.intent.action.CALL_SOS");
            registerReceiver(mReceiver, intentfilter);
            intentfilter1 = new IntentFilter("android.intent.action.MEDIA_BUTTON");
            intentfilter1.setPriority(1);
            registerReceiver(mMediaButtonReceiver, intentfilter1);
            ((AudioManager)getSystemService("audio")).registerMediaButtonEventReceiverForCalls(new ComponentName(getPackageName(), com/android/phone/PhoneGlobals$MediaButtonBroadcastReceiver.getName()));
            PreferenceManager.setDefaultValues(this, 0x7f060016, false);
            PreferenceManager.setDefaultValues(this, 0x7f060001, false);
            PhoneUtils.setAudioMode(mCM);
        }
        if (TelephonyCapabilities.supportsOtasp(phone))
        {
            cdmaOtaProvisionData = new OtaUtils.CdmaOtaProvisionData();
            cdmaOtaConfigData = new OtaUtils.CdmaOtaConfigData();
            cdmaOtaScreenState = new OtaUtils.CdmaOtaScreenState();
            cdmaOtaInCallScreenUiState = new OtaUtils.CdmaOtaInCallScreenUiState();
        }
        contentresolver.getType(Uri.parse("content://icc/adn"));
        mShouldRestoreMuteOnInCallResume = false;
        if (mTtyEnabled)
        {
            mPreferredTtyMode = android.provider.Settings.Secure.getInt(phone.getContext().getContentResolver(), "preferred_tty_mode", 0);
            mHandler.sendMessage(mHandler.obtainMessage(14, Integer.valueOf(0)));
        }
        if (getResources().getBoolean(0x7f0a0005))
        {
            i = android.provider.Settings.System.getInt(phone.getContext().getContentResolver(), "hearing_aid", 0);
            audiomanager = (AudioManager)getSystemService("audio");
            String s1;
            if (i != 0)
                s1 = "ON";
            else
                s1 = "OFF";
            audiomanager.setParameter("HACSetting", s1);
        }
        SimAssociateHandler.getInstance(this).prepair();
        SimAssociateHandler.getInstance(this).load();
        cellConnMgr = new CellConnMgr();
        cellConnMgr.register(getApplicationContext());
        SIMInfoWrapper.getDefault().init(this);
        CallHistoryDatabaseHelper.getInstance(this).initDatabase();
        PhoneNumberUtil.getInstance();
        HyphonManager.getInstance().init(this);
        try
        {
            sHasNavigationBar = WindowManagerGlobal.getWindowManagerService().hasNavigationBar();
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
        Log.v("PhoneGlobals", "onCreate(), exit.");
    }

    public void orientationChanged(int i)
    {
        mOrientation = i;
        updateProximitySensorMode(mCM.getState());
    }

    void pokeUserActivity()
    {
        Log.d("PhoneGlobals", "pokeUserActivity()...");
        mPowerManager.userActivity(SystemClock.uptimeMillis(), false);
    }

    boolean proximitySensorModeEnabled()
    {
        return mProximityWakeLock != null;
    }

    public void requestWakeState(WakeState wakestate)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("requestWakeState(").append(wakestate).append(")...").toString());
        this;
        JVM INSTR monitorenter ;
        if (mWakeState == wakestate) goto _L2; else goto _L1
_L1:
        _cls3..SwitchMap.com.android.phone.PhoneGlobals.WakeState[wakestate.ordinal()];
        JVM INSTR tableswitch 1 2: default 72
    //                   1 114
    //                   2 146;
           goto _L3 _L4 _L5
_L5:
        break MISSING_BLOCK_LABEL_146;
_L3:
        if (mWakeLock.isHeld())
            mWakeLock.release();
        if (mPartialWakeLock.isHeld())
            mPartialWakeLock.release();
_L6:
        mWakeState = wakestate;
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
_L4:
        mPartialWakeLock.acquire();
        if (mWakeLock.isHeld())
            mWakeLock.release();
          goto _L6
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mWakeLock.acquire();
        if (mPartialWakeLock.isHeld())
            mPartialWakeLock.release();
          goto _L6
    }

    public void resetLatestActiveCallOrigin()
    {
        long l = inCallUiState.latestActiveCallOriginTimeStamp;
        long l1 = SystemClock.elapsedRealtime();
        Log.d("PhoneGlobals", (new StringBuilder()).append("currentTimeMillis: ").append(l1).append(", saved timestamp for call origin: ").append(l).toString());
        if (inCallUiState.latestActiveCallOriginTimeStamp > 0L && l1 - l < 30000L)
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("Resume previous call origin (").append(inCallUiState.latestActiveCallOrigin).append(")").toString());
            inCallUiState.latestActiveCallOriginTimeStamp = l1;
            return;
        } else
        {
            Log.d("PhoneGlobals", "Drop previous call origin and set the current one to null");
            setLatestActiveCallOrigin(null);
            return;
        }
    }

    void setBeginningCall(boolean flag)
    {
        mBeginningCall = flag;
        updateProximitySensorMode(mCM.getState());
    }

    void setCachedSimPin(String s)
    {
        mCachedSimPin = s;
    }

    void setInCallScreenInstance(InCallScreen incallscreen)
    {
        mInCallScreen = incallscreen;
    }

    public void setLatestActiveCallOrigin(String s)
    {
        inCallUiState.latestActiveCallOrigin = s;
        if (s != null)
        {
            inCallUiState.latestActiveCallOriginTimeStamp = SystemClock.elapsedRealtime();
            return;
        } else
        {
            inCallUiState.latestActiveCallOriginTimeStamp = 0L;
            return;
        }
    }

    void setPukEntryActivity(Activity activity)
    {
        mPUKEntryActivity = activity;
    }

    void setPukEntryProgressDialog(ProgressDialog progressdialog)
    {
        mPUKEntryProgressDialog = progressdialog;
    }

    void setRestoreMuteOnInCallResume(boolean flag)
    {
        PhoneLog.d("PhoneGlobals", (new StringBuilder()).append("setRestoreMuteOnInCallResume, mode = ").append(flag).toString());
        mShouldRestoreMuteOnInCallResume = flag;
    }

    boolean showBluetoothIndication()
    {
        return mShowBluetoothIndication;
    }

    public void touchAnswerVTCall()
    {
        Log.d("PhoneGlobals", "touchAnswerVTCall()");
        if (getInCallScreenInstance() == null)
        {
            Log.d("PhoneGlobals", "touchAnswerVTCall() : the InCallScreen Instance is null , so cannot answer incoming VT call");
            return;
        }
        if (!VTCallUtils.isVTRinging())
        {
            Log.d("PhoneGlobals", "touchAnswerVTCall() : there is no Ringing VT call , so return");
            return;
        } else
        {
            mHandler.sendMessage(Message.obtain(mHandler, 30));
            return;
        }
    }

    void updateBluetoothIndication(boolean flag)
    {
        mShowBluetoothIndication = shouldShowBluetoothIndication(mBluetoothHeadsetState, mBluetoothHeadsetAudioState, mCM);
        if (flag)
        {
            if (isShowingCallScreen())
                mInCallScreen.requestUpdateBluetoothIndication(mBluetoothHeadsetAudioState);
            Log.d("PhoneGlobals", "- updating in-call notification for BT state change...");
            mHandler.sendEmptyMessage(9);
        }
        updateProximitySensorMode(mCM.getState());
    }

    void updateInCallScreen()
    {
        Log.d("PhoneGlobals", "- updateInCallScreen()...");
        if (mInCallScreen != null)
            mInCallScreen.requestUpdateScreen();
    }

    void updatePhoneState(com.android.internal.telephony.PhoneConstants.State state)
    {
        boolean flag = true;
        if (state != mLastPhoneState)
        {
            mLastPhoneState = state;
            if (state == com.android.internal.telephony.PhoneConstants.State.IDLE)
                getInstance().pokeUserActivity();
            updateProximitySensorMode(state);
            if (state != com.android.internal.telephony.PhoneConstants.State.IDLE)
            {
                if (!mUpdateLock.isHeld())
                    mUpdateLock.acquire();
            } else
            if (!isShowingCallScreen() && !mUpdateLock.isHeld())
                mUpdateLock.release();
            if (mAccelerometerListener != null)
            {
                mOrientation = 0;
                AccelerometerListener accelerometerlistener = mAccelerometerListener;
                boolean flag1;
                if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                    flag1 = flag;
                else
                    flag1 = false;
                accelerometerlistener.enable(flag1);
            }
            mBeginningCall = false;
            if (mInCallScreen != null)
            {
                Log.d("PhoneGlobals", (new StringBuilder()).append("updatePhoneState: state = ").append(state).toString());
                if (!PhoneUtils.isDMLocked())
                {
                    InCallScreen incallscreen = mInCallScreen;
                    if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK)
                        flag = false;
                    incallscreen.updateKeyguardPolicy(flag);
                }
            }
        }
    }

    void updateProximitySensorMode(com.android.internal.telephony.PhoneConstants.State state)
    {
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateProximitySensorMode: state = ").append(state).toString());
        if (!proximitySensorModeEnabled())
            break MISSING_BLOCK_LABEL_322;
        android.os.PowerManager.WakeLock wakelock = mProximityWakeLock;
        wakelock;
        JVM INSTR monitorenter ;
        Exception exception;
        boolean flag;
        boolean flag1;
        if (isHeadsetPlugged() || PhoneUtils.isSpeakerOn(this) || isBluetoothHeadsetAudioOn() || mIsHardKeyboardOpen)
            flag = true;
        else
            flag = false;
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateProximitySensorMode: mBeginningCall = ").append(mBeginningCall).toString());
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateProximitySensorMode: screenOnImmediately = ").append(flag).toString());
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING && mCM.getActiveFgCallState() == com.android.internal.telephony.Call.State.ACTIVE && mCM.getFirstActiveRingingCall().getState() == com.android.internal.telephony.Call.State.WAITING)
            flag1 = true;
        else
            flag1 = false;
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateProximitySensorMode: isRingingWhenActive = ").append(flag1).toString());
        if (state != com.android.internal.telephony.PhoneConstants.State.OFFHOOK && !mBeginningCall && !flag1 || flag) goto _L2; else goto _L1
_L1:
        if (mProximityWakeLock.isHeld()) goto _L4; else goto _L3
_L3:
        Log.d("PhoneGlobals", "updateProximitySensorMode: acquiring...");
        mProximityWakeLock.acquire();
_L5:
        wakelock;
        JVM INSTR monitorexit ;
        return;
_L4:
        Log.d("PhoneGlobals", "updateProximitySensorMode: lock already held.");
          goto _L5
        exception;
        wakelock;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (!mProximityWakeLock.isHeld())
            break MISSING_BLOCK_LABEL_304;
        Log.d("PhoneGlobals", "updateProximitySensorMode: releasing...");
        int i = 0;
        if (!flag)
            i = 1;
        mProximityWakeLock.release(i);
          goto _L5
        Log.d("PhoneGlobals", "updateProximitySensorMode: lock already released.");
          goto _L5
    }

    void updateWakeState()
    {
        com.android.internal.telephony.PhoneConstants.State state = mCM.getState();
        boolean flag = isShowingCallScreen();
        boolean flag1;
        if (mInCallScreen != null && mInCallScreen.isDialerOpened())
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (state == com.android.internal.telephony.PhoneConstants.State.OFFHOOK && PhoneUtils.isSpeakerOn(this))
            flag2 = true;
        else
            flag2 = false;
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateWakeState: callscreen ").append(flag).append(", dialer ").append(flag1).append(", speaker ").append(flag2).append("...").toString());
        boolean flag3;
        if (state == com.android.internal.telephony.PhoneConstants.State.RINGING)
            flag3 = true;
        else
            flag3 = false;
        boolean flag4 = GeminiUtils.isDialing(phone);
        boolean flag5;
        if (mInCallScreen != null && mInCallScreen.isQuickResponseDialogShowing())
            flag5 = true;
        else
            flag5 = false;
        boolean flag6;
        if (PhoneUtils.hasDisconnectedConnections(mCM) && flag)
            flag6 = true;
        else
            flag6 = false;
        boolean flag7;
        if (!flag3 && !flag4 && (!flag6 || flag5))
            flag7 = false;
        else
            flag7 = true;
        Log.d("PhoneGlobals", (new StringBuilder()).append("updateWakeState: keepScreenOn = ").append(flag7).append(" (isRinging ").append(flag3).append(", isDialing ").append(flag4).append(", showingQuickResponse ").append(flag5).append(", showingDisc ").append(flag6).append(")").toString());
        WakeState wakestate;
        if (flag7)
            wakestate = WakeState.FULL;
        else
            wakestate = WakeState.SLEEP;
        requestWakeState(wakestate);
    }

    void wakeUpScreen()
    {
        this;
        JVM INSTR monitorenter ;
        if (mWakeState == WakeState.SLEEP)
        {
            Log.d("PhoneGlobals", "pulse screen lock");
            mPowerManager.wakeUp(SystemClock.uptimeMillis());
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    void wakeUpScreenForDisconnect(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mWakeState == WakeState.SLEEP && !mPowerManager.isScreenOn())
        {
            Log.d("PhoneGlobals", (new StringBuilder()).append("wakeUpScreenForDisconnect(").append(i).append(")").toString());
            mWakeLockForDisconnect.acquire();
            mHandler.removeMessages(18);
            mWakelockSequence = 1 + mWakelockSequence;
            Message message = mHandler.obtainMessage(18, mWakelockSequence, 0);
            mHandler.sendMessageDelayed(message, i);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }




/*
    static boolean access$1102(PhoneGlobals phoneglobals, boolean flag)
    {
        phoneglobals.mIsHeadsetPlugged = flag;
        return flag;
    }

*/










/*
    static Activity access$502(PhoneGlobals phoneglobals, Activity activity)
    {
        phoneglobals.mPUKEntryActivity = activity;
        return activity;
    }

*/



/*
    static ProgressDialog access$602(PhoneGlobals phoneglobals, ProgressDialog progressdialog)
    {
        phoneglobals.mPUKEntryProgressDialog = progressdialog;
        return progressdialog;
    }

*/



/*
    static int access$702(PhoneGlobals phoneglobals, int i)
    {
        phoneglobals.mPreferredTtyMode = i;
        return i;
    }

*/


}
