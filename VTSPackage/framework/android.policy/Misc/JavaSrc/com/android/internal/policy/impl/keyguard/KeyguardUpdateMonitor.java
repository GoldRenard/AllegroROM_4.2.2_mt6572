// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.net.sip.SipManager;
import android.os.*;
import android.telephony.*;
import android.util.Log;
import android.view.*;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.ITelephonyRegistry;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.google.android.collect.Lists;
import com.mediatek.common.dm.DMAgent;
import com.mediatek.common.telephony.ITelephonyEx;
import com.mediatek.telephony.SimInfoManager;
import java.io.*;
import java.lang.ref.WeakReference;
import java.util.*;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUtils, KeyguardUpdateMonitorCallback

public class KeyguardUpdateMonitor
{
    static class BatteryStatus
    {

        public final int health;
        public final int level;
        public final int plugged;
        public final int status;

        public boolean isBatteryLow()
        {
            return level < 16;
        }

        public boolean isCharged()
        {
            return status == 5 || level >= 100;
        }

        boolean isPluggedIn()
        {
            return plugged == 1 || plugged == 2 || plugged == 4;
        }

        public BatteryStatus(int i, int j, int k, int l)
        {
            status = i;
            level = j;
            plugged = k;
            health = l;
        }
    }

    private class DialogSequenceManager
        implements SequenceDialog
    {

        private static final boolean CLASS_DEBUG = true;
        private static final String CLASS_TAG = "DialogSequenceManager";
        private ContentObserver mDialogSequenceObserver;
        private Queue mDialogShowCallbackQueue;
        private boolean mInnerDialogShowing;
        private boolean mLocked;
        private ContentObserver mOOBEObserver;
        final KeyguardUpdateMonitor this$0;

        private boolean enableShow()
        {
            StringBuilder stringbuilder = (new StringBuilder()).append("DialogSequenceManager --enableShow()-- !mDialogShowCallbackQueue.isEmpty() = ");
            boolean flag;
            if (!mDialogShowCallbackQueue.isEmpty())
                flag = true;
            else
                flag = false;
            StringBuilder stringbuilder1 = stringbuilder.append(flag).append(" !getInnerDialogShowing() = ");
            boolean flag1;
            if (!getInnerDialogShowing())
                flag1 = true;
            else
                flag1 = false;
            StringBuilder stringbuilder2 = stringbuilder1.append(flag1).append(" !isOtherModuleShowing() = ");
            boolean flag2;
            if (!isOtherModuleShowing())
                flag2 = true;
            else
                flag2 = false;
            StringBuilder stringbuilder3 = stringbuilder2.append(flag2).append("!isAlarmBoot() = ");
            boolean flag3;
            if (!KeyguardUpdateMonitor.isAlarmBoot())
                flag3 = true;
            else
                flag3 = false;
            StringBuilder stringbuilder4 = stringbuilder3.append(flag3).append(" !isGMSRunning() = ");
            boolean flag4;
            if (!isGMSRunning())
                flag4 = true;
            else
                flag4 = false;
            StringBuilder stringbuilder5 = stringbuilder4.append(flag4).append(" !isOOBEShowing() = ");
            boolean flag5;
            if (!isOOBEShowing())
                flag5 = true;
            else
                flag5 = false;
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", stringbuilder5.append(flag5).toString());
            return !mDialogShowCallbackQueue.isEmpty() && !getInnerDialogShowing() && !isOtherModuleShowing() && !KeyguardUpdateMonitor.isAlarmBoot() && !isGMSRunning() && !isOOBEShowing() && !isEncryptMode();
        }

        private boolean getInnerDialogShowing()
        {
            return mInnerDialogShowing;
        }

        private boolean getLocked()
        {
            return mLocked;
        }

        private boolean isOOBEShowing()
        {
            int i = queryOOBEDisplay();
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager OOBEObserver--isOOBEShowing()--oobe_display = ").append(i).toString());
            return i == 1;
        }

        private boolean isOtherModuleShowing()
        {
            boolean flag = true;
            int i = queryDialogSequenceSeetings();
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager --isOtherModuleShowing()--dialog_sequence_settings = ").append(i).toString());
            if (i == 0 || i == flag)
                flag = false;
            return flag;
        }

        private int queryDialogSequenceSeetings()
        {
            return android.provider.Settings.System.getInt(mContext.getContentResolver(), "dialog_sequence_settings", 0);
        }

        private int queryOOBEDisplay()
        {
            return android.provider.Settings.System.getInt(mContext.getContentResolver(), "oobe_display", 0);
        }

        private void setInnerDialogShowing(boolean flag)
        {
            mInnerDialogShowing = flag;
        }

        private void setLocked(boolean flag)
        {
            mLocked = flag;
        }

        public void handleShowDialog()
        {
label0:
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager --handleShowDialog()--enableShow() = ").append(enableShow()).toString());
                if (enableShow())
                {
                    setInnerDialogShowing(true);
                    if (!getLocked())
                        break label0;
                    DialogShowCallBack dialogshowcallback = (DialogShowCallBack)mDialogShowCallbackQueue.poll();
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager --handleShowDialog()--dialogCallBack = ").append(dialogshowcallback).toString());
                    if (dialogshowcallback != null)
                        dialogshowcallback.show();
                }
                return;
            }
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "DialogSequenceManager --handleShowDialog()--System.putInt( dialog_sequence_settings value = 1");
            android.provider.Settings.System.putInt(mContext.getContentResolver(), "dialog_sequence_settings", 1);
        }

        public void reportDialogClose()
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager --reportDialogClose()--mDialogShowCallbackQueue.isEmpty() = ").append(mDialogShowCallbackQueue.isEmpty()).toString());
            setInnerDialogShowing(false);
            if (mDialogShowCallbackQueue.isEmpty())
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "DialogSequenceManager --reportDialogClose()--System.putInt( dialog_sequence_settings value = 0 --setLocked(false)--");
                android.provider.Settings.System.putInt(mContext.getContentResolver(), "dialog_sequence_settings", 0);
                setLocked(false);
                return;
            } else
            {
                handleShowDialog();
                return;
            }
        }

        public void requestShowDialog(DialogShowCallBack dialogshowcallback)
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "DialogSequenceManager --requestShowDialog()");
            mDialogShowCallbackQueue.add(dialogshowcallback);
            handleShowDialog();
        }





        public DialogSequenceManager()
        {
            this$0 = KeyguardUpdateMonitor.this;
            super();
            mInnerDialogShowing = false;
            mLocked = false;
            mDialogSequenceObserver = new _cls1(new Handler());
            mOOBEObserver = new _cls2(new Handler());
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "DialogSequenceManager DialogSequenceManager()");
            mDialogShowCallbackQueue = new LinkedList();
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("dialog_sequence_settings"), false, mDialogSequenceObserver);
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("oobe_display"), false, mOOBEObserver);
        }
    }

    public static interface DialogShowCallBack
    {

        public abstract void show();
    }

    private class NewSimDialogCallback
        implements DialogShowCallBack
    {

        final KeyguardUpdateMonitor this$0;

        public void show()
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "NewSimDialogCallback--show()--");
            mHandler.sendMessage(mHandler.obtainMessage(1002));
        }

        private NewSimDialogCallback()
        {
            this$0 = KeyguardUpdateMonitor.this;
            super();
        }

    }

    static interface RadioStateCallback
    {

        public abstract void onRadioStateChanged(int i);
    }

    private class SIMStatus
    {

        private int mNewSimSlot;
        private int mSimCount;
        private String mSimDetectStatus;
        final KeyguardUpdateMonitor this$0;

        public int getNewSimSlot()
        {
            return mNewSimSlot;
        }

        public int getSIMCount()
        {
            return mSimCount;
        }

        public String getSimDetectStatus()
        {
            return mSimDetectStatus;
        }

        public SIMStatus(String s, int i, int j)
        {
            this$0 = KeyguardUpdateMonitor.this;
            super();
            mSimCount = 0;
            mSimDetectStatus = KeyguardUpdateMonitor.SIM_DETECT_NEW;
            mNewSimSlot = 0;
            mSimDetectStatus = s;
            mSimCount = i;
            mNewSimSlot = j;
        }
    }

    public static interface SequenceDialog
    {

        public abstract void reportDialogClose();

        public abstract void requestShowDialog(DialogShowCallBack dialogshowcallback);
    }

    private static class SimArgs
    {

        int simId;
        int simMECategory;
        public final com.android.internal.telephony.IccCardConstants.State simState;

        static SimArgs fromIntent(Intent intent)
        {
            byte byte0 = 0;
            if (!"android.intent.action.SIM_STATE_CHANGED".equals(intent.getAction()))
                throw new IllegalArgumentException("only handles intent ACTION_SIM_STATE_CHANGED");
            String s = intent.getStringExtra("ss");
            boolean flag = KeyguardUtils.isGemini();
            int i = 0;
            if (flag)
                i = intent.getIntExtra("simId", 0);
            com.android.internal.telephony.IccCardConstants.State state;
            if ("ABSENT".equals(s))
            {
                if ("PERM_DISABLED".equals(intent.getStringExtra("reason")))
                {
                    state = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                } else
                {
                    state = com.android.internal.telephony.IccCardConstants.State.ABSENT;
                    byte0 = 0;
                }
            } else
            if ("READY".equals(s))
            {
                state = com.android.internal.telephony.IccCardConstants.State.READY;
                byte0 = 0;
            } else
            if ("LOCKED".equals(s))
            {
                String s1 = intent.getStringExtra("reason");
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("INTENT_VALUE_ICC_LOCKED, lockedReason=").append(s1).toString());
                if ("PIN".equals(s1))
                {
                    state = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
                    byte0 = 0;
                } else
                if ("PUK".equals(s1))
                {
                    state = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
                    byte0 = 0;
                } else
                if ("NETWORK".equals(s1))
                {
                    state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                    byte0 = 0;
                } else
                if ("NETWORK_SUBSET".equals(s1))
                {
                    byte0 = 1;
                    state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                } else
                if ("SERVICE_PROVIDER".equals(s1))
                {
                    byte0 = 2;
                    state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                } else
                if ("CORPORATE".equals(s1))
                {
                    byte0 = 3;
                    state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                } else
                if ("SIM".equals(s1))
                {
                    byte0 = 4;
                    state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                } else
                {
                    state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
                    byte0 = 0;
                }
            } else
            if (!"LOADED".equals(s) && !"IMSI".equals(s))
            {
                if ("NOT_READY".equals(s))
                {
                    state = com.android.internal.telephony.IccCardConstants.State.NOT_READY;
                    byte0 = 0;
                } else
                {
                    state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
                    byte0 = 0;
                }
            } else
            {
                state = com.android.internal.telephony.IccCardConstants.State.READY;
                byte0 = 0;
            }
            return new SimArgs(state, i, byte0);
        }

        public String toString()
        {
            return simState.toString();
        }

        SimArgs(com.android.internal.telephony.IccCardConstants.State state)
        {
            simId = 0;
            simMECategory = 0;
            simState = state;
        }

        SimArgs(com.android.internal.telephony.IccCardConstants.State state, int i, int j)
        {
            simId = 0;
            simMECategory = 0;
            simState = state;
            simId = i;
            simMECategory = j;
        }
    }

    public static final class SimLockType extends Enum
    {

        private static final SimLockType $VALUES[];
        public static final SimLockType SIM_LOCK_ME;
        public static final SimLockType SIM_LOCK_PIN;
        public static final SimLockType SIM_LOCK_PUK;

        public static SimLockType valueOf(String s)
        {
            return (SimLockType)Enum.valueOf(com/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$SimLockType, s);
        }

        public static SimLockType[] values()
        {
            return (SimLockType[])$VALUES.clone();
        }

        static 
        {
            SIM_LOCK_PIN = new SimLockType("SIM_LOCK_PIN", 0);
            SIM_LOCK_PUK = new SimLockType("SIM_LOCK_PUK", 1);
            SIM_LOCK_ME = new SimLockType("SIM_LOCK_ME", 2);
            SimLockType asimlocktype[] = new SimLockType[3];
            asimlocktype[0] = SIM_LOCK_PIN;
            asimlocktype[1] = SIM_LOCK_PUK;
            asimlocktype[2] = SIM_LOCK_ME;
            $VALUES = asimlocktype;
        }

        private SimLockType(String s, int i)
        {
            super(s, i);
        }
    }

    private static class SpnUpdate
    {

        int simId;

        SpnUpdate()
        {
            simId = 0;
        }

        SpnUpdate(int i)
        {
            simId = simId;
        }
    }

    static interface SystemStateCallback
    {

        public abstract void onSysBootup();

        public abstract void onSysShutdown();
    }

    private class simMeStatusQueryThread extends Thread
    {

        SimArgs simArgs;
        final KeyguardUpdateMonitor this$0;

        public void run()
        {
            mSimMeCategory[simArgs.simId] = simArgs.simMECategory;
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("queryNetworkLock, SimId =").append(simArgs.simId).append(", simMECategory =").append(simArgs.simMECategory).toString());
            if (simArgs.simMECategory < 0)
                break MISSING_BLOCK_LABEL_253;
            if (simArgs.simMECategory > 5)
                return;
            Bundle bundle;
            boolean flag;
            try
            {
                bundle = com.mediatek.common.telephony.ITelephonyEx.Stub.asInterface(ServiceManager.checkService("phoneEx")).queryNetworkLock(simArgs.simMECategory, simArgs.simId);
                flag = bundle.getBoolean("com.android.phone.QUERY_SIMME_LOCK_RESULT", false);
                Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("queryNetworkLock, query_result =").append(flag).toString());
            }
            catch (Exception exception)
            {
                Log.e("KeyguardUpdateMonitor", (new StringBuilder()).append("queryIccNetworkLock got exception: ").append(exception.getMessage()).toString());
                return;
            }
            if (!flag)
                break MISSING_BLOCK_LABEL_242;
            mSimMeLeftRetryCount[simArgs.simId] = bundle.getInt("com.android.phone.SIMME_LOCK_LEFT_COUNT", 5);
_L1:
            mHandler.sendMessage(mHandler.obtainMessage(304, simArgs));
            return;
            Log.e("KeyguardUpdateMonitor", "queryIccNetworkLock result fail");
              goto _L1
        }

        simMeStatusQueryThread(SimArgs simargs)
        {
            this$0 = KeyguardUpdateMonitor.this;
            super();
            simArgs = simargs;
        }
    }


    private static final String CLEAR_NEW_EVENT_VIEW_INTENT = "android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS";
    private static boolean DEBUG = false;
    private static boolean DEBUG_SIM_STATES = false;
    private static final int FAILED_BIOMETRIC_UNLOCK_ATTEMPTS_BEFORE_BACKUP = 3;
    private static final int GET_SIM_RETRY_EMPTY = -1;
    private static final String GMS_SETUP_COMPONENT = "com.google.android.setupwizard.SetupWizardActivity";
    private static final String GMS_SETUP_PACKAGE = "com.google.android.setupwizard";
    public static final byte LIGHTE_OFF[] = {
        48
    };
    public static final byte LIGHTE_ON[] = {
        50, 53, 53
    };
    static final int LOW_BATTERY_THRESHOLD = 16;
    private static final int MSG_BATTERY_UPDATE = 302;
    private static final int MSG_BOOTUP_MODE_PICK = 1011;
    protected static final int MSG_BOOT_COMPLETED = 313;
    private static final int MSG_CARRIER_INFO_UPDATE = 303;
    private static final int MSG_CLOCK_VISIBILITY_CHANGED = 307;
    private static final int MSG_CLOSE_THE_BREATH_LIGHT = 1014;
    private static final int MSG_CONFIGURATION_CHANGED = 1005;
    private static final int MSG_DEVICE_PROVISIONED = 308;
    private static final int MSG_DOWNLOAD_CALIBRATION_DATA_UPDATE = 1013;
    private static final int MSG_DPM_STATE_CHANGED = 309;
    private static final int MSG_KEYGUARD_RESET_DISMISS = 1007;
    private static final int MSG_KEYGUARD_SIM_NAME_UPDATE = 1006;
    private static final int MSG_KEYGUARD_UPDATE_LAYOUT = 1008;
    private static final int MSG_KEYGUARD_VISIBILITY_CHANGED = 312;
    private static final int MSG_LONG_OPEN_THE_BREATH_LIGHT = 1016;
    private static final int MSG_MODEM_RESET = 1009;
    private static final int MSG_OPEN_THE_BREATH_LIGHT = 1015;
    private static final int MSG_PHONE_STATE_CHANGED = 306;
    private static final int MSG_PRE_3G_SWITCH = 1010;
    private static final int MSG_RINGER_MODE_CHANGED = 305;
    private static final int MSG_SIMINFO_CHANGED = 1004;
    private static final int MSG_SIM_DETECTED = 1002;
    private static final int MSG_SIM_STATE_CHANGE = 304;
    private static final int MSG_SYSTEM_STATE = 1012;
    private static final int MSG_TIME_UPDATE = 301;
    private static final int MSG_USER_REMOVED = 311;
    private static final int MSG_USER_SWITCHED = 310;
    private static final int PIN_PUK_ME_RESET = 0;
    private static final String QUERY_SIMME_LOCK_RESULT = "com.android.phone.QUERY_SIMME_LOCK_RESULT";
    private static final String SIMME_LOCK_LEFT_COUNT = "com.android.phone.SIMME_LOCK_LEFT_COUNT";
    private static final int SIM_1_ME_DISMISSED = 256;
    private static final int SIM_1_PIN_DISMISSED = 1;
    private static final int SIM_1_PIN_PUK_MASK = 5;
    private static final int SIM_1_PUK_DISMISSED = 4;
    private static final int SIM_2_ME_DISMISSED = 512;
    private static final int SIM_2_PIN_DISMISSED = 2;
    private static final int SIM_2_PIN_PUK_MASK = 10;
    private static final int SIM_2_PUK_DISMISSED = 8;
    private static final int SIM_3_ME_DISMISSED = 1024;
    private static final int SIM_3_PIN_DISMISSED = 16;
    private static final int SIM_3_PIN_PUK_MASK = 80;
    private static final int SIM_3_PUK_DISMISSED = 64;
    private static final int SIM_4_ME_DISMISSED = 2048;
    private static final int SIM_4_PIN_DISMISSED = 32;
    private static final int SIM_4_PIN_PUK_MASK = 160;
    private static final int SIM_4_PUK_DISMISSED = 128;
    private static String SIM_DETECT_NEW = "NEW";
    private static String SIM_DETECT_REMOVE = "REMOVE";
    private static String SIM_DETECT_SWAP = "SWAP";
    private static final String SMS_RECEIVED = "android.provider.Telephony.SMS_RECEIVED";
    private static final int SYSTEM_STATE_BOOTUP = 1;
    private static final int SYSTEM_STATE_SHUTDOWN = 0;
    private static final String SYS_BREATH_LIGHT = "sys/class/breath_led_class/breath_led_device/breath_light";
    private static final String SYS_LED_LIGHT = "sys/class/leds/button-backlight/brightness";
    private static final String TAG = "KeyguardUpdateMonitor";
    private static boolean clickcleanButton;
    private static boolean isCharging;
    private static boolean mIsInBatteryLow = false;
    public static int sDualSimSetting = -1;
    private static KeyguardUpdateMonitor sInstance;
    private boolean mAlternateUnlockEnabled;
    private BatteryStatus mBatteryStatus;
    private boolean mBootCompleted;
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final KeyguardUpdateMonitor this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if (KeyguardUpdateMonitor.DEBUG)
                Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("received broadcast ").append(s).toString());
            if (!"android.intent.action.TIME_TICK".equals(s) && !"android.intent.action.TIME_SET".equals(s) && !"android.intent.action.TIMEZONE_CHANGED".equals(s))
            {
                if ("android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s))
                {
                    SpnUpdate spnupdate = new SpnUpdate();
                    if (KeyguardUtils.isGemini())
                    {
                        int l3 = intent.getIntExtra("simId", 0);
                        mTelephonyPlmn[l3] = getTelephonyPlmnFrom(intent);
                        mTelephonySpn[l3] = getTelephonySpnFrom(intent);
                        spnupdate.simId = l3;
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("SPN_STRINGS_UPDATED_ACTION, update simId = ").append(l3).append(" , plmn=").append(mTelephonyPlmn[l3]).append(", spn=").append(mTelephonySpn[l3]).toString());
                    } else
                    {
                        mTelephonyPlmn[0] = getTelephonyPlmnFrom(intent);
                        mTelephonySpn[0] = getTelephonySpnFrom(intent);
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("SPN_STRINGS_UPDATED_ACTION, update sim, plmn=").append(mTelephonyPlmn[0]).append(", spn=").append(mTelephonySpn[0]).toString());
                    }
                    mHandler.sendMessage(mHandler.obtainMessage(303, spnupdate));
                    return;
                }
                if ("android.intent.action.BATTERY_CHANGED".equals(s))
                {
                    int l2 = intent.getIntExtra("status", 1);
                    int i3 = intent.getIntExtra("plugged", 0);
                    int j3 = intent.getIntExtra("level", 0);
                    int k3 = intent.getIntExtra("health", 1);
                    Log.e("KeyguardUpdateMonitor", (new StringBuilder()).append("status=").append(l2).append("plugged=").append(i3).append("level=").append(j3).append("health=").append(k3).toString());
                    if (l2 != 2 && i3 != 1 && i3 != 2)
                        setIsChargingstatus(false);
                    else
                        setIsChargingstatus(true);
                    Handler handler = mHandler;
                    BatteryStatus batterystatus = new BatteryStatus(l2, j3, i3, k3);
                    Message message3 = handler.obtainMessage(302, batterystatus);
                    mHandler.sendMessage(message3);
                    return;
                }
                if ("android.intent.action.SIM_STATE_CHANGED".equals(s))
                {
                    String s3 = intent.getStringExtra("ss");
                    SimArgs simargs1 = SimArgs.fromIntent(intent);
                    if (KeyguardUpdateMonitor.DEBUG_SIM_STATES)
                        Log.v("KeyguardUpdateMonitor", (new StringBuilder()).append("action ").append(s).append(" state").append(s3).toString());
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("ACTION_SIM_STATE_CHANGED, stateExtra=").append(s3).append(",simId=").append(simargs1.simId).toString());
                    if (com.android.internal.telephony.IccCardConstants.State.READY == simargs1.simState)
                    {
                        setPINDismiss(simargs1.simId, SimLockType.SIM_LOCK_PIN, false);
                        setPINDismiss(simargs1.simId, SimLockType.SIM_LOCK_PUK, false);
                        setPINDismiss(simargs1.simId, SimLockType.SIM_LOCK_ME, false);
                    }
                    if (com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == simargs1.simState)
                    {
                        simMeStatusQueryThread simmestatusquerythread1 = new simMeStatusQueryThread(simargs1);
                        simmestatusquerythread1.start();
                        return;
                    } else
                    {
                        mHandler.sendMessage(mHandler.obtainMessage(304, simargs1));
                        return;
                    }
                }
                if ("com.android.phone.ACTION_UNLOCK_SIM_LOCK".equals(s))
                {
                    int i2 = intent.getIntExtra("com.android.phone.EXTRA_SIM_SLOT", 0);
                    int j2 = intent.getIntExtra("com.android.phone.EXTRA_UNLOCK_TYPE", 501);
                    int k2 = 0;
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("ACTION_UNLOCK_SIM_LOCK, unlockType=").append(j2).append(",simId=").append(i2).toString());
                    com.android.internal.telephony.IccCardConstants.State state;
                    switch (j2)
                    {
                    case 503: 
                        state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                        k2 = intent.getIntExtra("com.android.phone.EXTRA_SIMME_LOCK_TYPE", 0);
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("VERIFY_TYPE_SIMMELOCK, meCategory=").append(k2).toString());
                        setPINDismiss(i2, SimLockType.SIM_LOCK_ME, false);
                        break;

                    case 502: 
                        state = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
                        setPINDismiss(i2, SimLockType.SIM_LOCK_PUK, false);
                        k2 = 0;
                        break;

                    case 501: 
                        state = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
                        setPINDismiss(i2, SimLockType.SIM_LOCK_PIN, false);
                        k2 = 0;
                        break;

                    default:
                        state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
                        break;
                    }
                    mSimState[i2] = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
                    SimArgs simargs = new SimArgs(state, i2, k2);
                    if (503 == j2)
                    {
                        simMeStatusQueryThread simmestatusquerythread = new simMeStatusQueryThread(simargs);
                        simmestatusquerythread.start();
                        return;
                    } else
                    {
                        mHandler.sendMessage(mHandler.obtainMessage(304, simargs));
                        return;
                    }
                }
                if ("android.media.RINGER_MODE_CHANGED".equals(s))
                {
                    if (KeyguardUpdateMonitor.DEBUG)
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", "RINGER_MODE_CHANGED_ACTION received");
                    mHandler.sendMessage(mHandler.obtainMessage(305, intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1), 0));
                    return;
                }
                if ("android.intent.action.PHONE_STATE".equals(s))
                {
                    String s2 = intent.getStringExtra("state");
                    mHandler.sendMessage(mHandler.obtainMessage(306, s2));
                    return;
                }
                if ("android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(309));
                    return;
                }
                if ("android.intent.action.USER_REMOVED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(311, intent.getIntExtra("android.intent.extra.user_handle", 0), 0));
                    return;
                }
                if ("android.intent.action.BOOT_COMPLETED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(313));
                    return;
                }
                if ("android.intent.action.ACTION_SHUTDOWN_IPO".equals(s))
                {
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", "received the IPO shutdown message");
                    mHandler.sendMessage(mHandler.obtainMessage(1007));
                    Message message2 = mHandler.obtainMessage(1012);
                    message2.arg1 = 0;
                    mHandler.sendMessage(message2);
                    return;
                }
                if ("android.intent.action.RADIO_OFF".equals(s))
                {
                    int l1 = intent.getIntExtra("slotId", 0);
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("received ACTION_RADIO_OFF message, slotId=").append(l1).toString());
                    mHandler.sendMessage(mHandler.obtainMessage(1009, l1, 0));
                    return;
                }
                if (GeminiPhone.EVENT_3G_SWITCH_START_MD_RESET.equals(s))
                {
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", "received GeminiPhone.EVENT_3G_START_MD_RESET message");
                    mSIMResetModem = true;
                    return;
                }
                if (GeminiPhone.EVENT_3G_SWITCH_DONE.equals(s))
                {
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("received GeminiPhone.EVENT_3G_SWITCH_DONE message, mSIMResetModem=").append(mSIMResetModem).toString());
                    if (mSIMResetModem)
                    {
                        mSIMResetModem = false;
                        mHandler.sendMessage(mHandler.obtainMessage(1010));
                        return;
                    }
                } else
                {
                    if ("android.intent.action.SIM_INSERTED_STATUS".equals(s))
                    {
                        int k1 = intent.getIntExtra("slotId", 0);
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("SIM_INSERTED_STATUS, slotId=").append(k1).toString());
                        mHandler.sendMessage(mHandler.obtainMessage(1008, k1, 0));
                        return;
                    }
                    if ("android.intent.action.SIM_NAME_UPDATE".equals(s))
                    {
                        int j1 = intent.getIntExtra("slotId", 0);
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("SIM_NAME_UPDATE, slotId=").append(j1).toString());
                        mHandler.sendMessage(mHandler.obtainMessage(1006, j1, 0));
                        return;
                    }
                    if ("android.intent.action.CONFIGURATION_CHANGED".equals(s))
                    {
                        mHandler.sendMessage(mHandler.obtainMessage(1005));
                        return;
                    }
                    if ("android.intent.action.ACTION_SIM_DETECTED".equals(s))
                    {
                        String s1 = intent.getStringExtra("simDetectStatus");
                        int l = intent.getIntExtra("simCount", 0);
                        int i1 = intent.getIntExtra("newSIMSlot", 0);
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("detectStatus=").append(s1).append(", simCount=").append(l).append(", newSimSlot=").append(i1).toString());
                        KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.this;
                        SIMStatus simstatus = new SIMStatus(s1, l, i1);
                        keyguardupdatemonitor.mSimChangedStatus = simstatus;
                        if (mSimCardChangedDialog != null)
                            mSimCardChangedDialog.dismiss();
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append(this).append("Receive ACTION_SIM_DETECTED--requestShowDialog(..)").toString());
                        requestShowDialog(new NewSimDialogCallback());
                        return;
                    }
                    if ("android.intent.action.normal.boot".equals(s))
                    {
                        Log.i("KeyguardUpdateMonitor", "received normal boot");
                        if (mSimChangedStatus != null)
                        {
                            mDialogSequenceManager.handleShowDialog();
                            return;
                        }
                    } else
                    {
                        if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                        {
                            int k = intent.getIntExtra("slotId", 0);
                            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("sim info update, slotId=").append(k).toString());
                            mHandler.sendMessage(mHandler.obtainMessage(1004, k, 0));
                            return;
                        }
                        if ("android.provider.Telephony.DUAL_SIM_MODE_SELECT".equals(s))
                        {
                            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "ACTION_DUAL_SIM_MODE_SELECT, received");
                            mHandler.sendMessage(mHandler.obtainMessage(1011));
                            return;
                        }
                        if ("android.intent.action.AIRPLANE_MODE".equals(s))
                        {
                            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "ACTION_AIRPLANE_MODE_CHANGED, received");
                            if (mCtaDialog != null && intent.getExtras().getBoolean("state"))
                            {
                                mCtaDialog.dismiss();
                                mCtaDialog = null;
                                return;
                            }
                        } else
                        {
                            if ("android.intent.action.ACTION_SHUTDOWN".equals(s))
                            {
                                Message message1 = mHandler.obtainMessage(1012);
                                message1.arg1 = 0;
                                mHandler.sendMessage(message1);
                                return;
                            }
                            if ("android.intent.action.ACTION_PREBOOT_IPO".equals(s))
                            {
                                Message message = mHandler.obtainMessage(1012);
                                message.arg1 = 1;
                                mHandler.sendMessage(message);
                                return;
                            }
                            if ("android.intent.action.DOWNLOAD_CALIBRATION_DATA".equals(s))
                            {
                                mCalibrationData = intent.getBooleanExtra("calibrationData", true);
                                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mCalibrationData = ").append(mCalibrationData).toString());
                                mHandler.sendMessage(mHandler.obtainMessage(1013));
                                return;
                            }
                            if ("android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS".equals(s))
                            {
                                mQueryBaseTime = System.currentTimeMillis();
                                setclickcleanButton(true);
                                Log.e("KeyguardUpdateMonitor", "----you click the clean button----");
                                mHandler.sendMessage(mHandler.obtainMessage(1014));
                                return;
                            }
                            if ("android.intent.action.SCREEN_OFF".equals(s))
                            {
                                if ((getMissedCallCount() > 0 || findNewSmsCount() > 0 || findNewMmsCount() > 0) && !getclickcleanButton())
                                {
                                    Log.e("KeyguardUpdateMonitor", "----check if go here----");
                                    if (SystemProperties.get("persist.sys.notifications", "false").equals("true"))
                                        mHandler.sendMessage(mHandler.obtainMessage(1015));
                                    else
                                        Log.e("KeyguardUpdateMonitor", "-----here go but it is false----");
                                }
                                if (getStatusValueLowBattery())
                                    if (SystemProperties.get("persist.sys.lowbattery", "false").equals("true"))
                                        mHandler.sendMessage(mHandler.obtainMessage(1015));
                                    else
                                        Log.e("KeyguardUpdateMonitor", "-----low battery but it is false----");
                                if (getIsChargingstatus())
                                {
                                    Log.e("KeyguardUpdateMonitor", "---you are charging---");
                                    if (SystemProperties.get("persist.sys.charging", "false").equals("true"))
                                    {
                                        mHandler.sendMessage(mHandler.obtainMessage(1016));
                                        return;
                                    } else
                                    {
                                        Log.e("KeyguardUpdateMonitor", "-----charging but it is false----");
                                        return;
                                    }
                                }
                            } else
                            {
                                if ("android.intent.action.SCREEN_ON".equals(s))
                                {
                                    mHandler.sendMessage(mHandler.obtainMessage(1014));
                                    return;
                                }
                                if ("android.provider.Telephony.SMS_RECEIVED".equals(s))
                                {
                                    setclickcleanButton(false);
                                    Bundle bundle = intent.getExtras();
                                    Log.e("KeyguardUpdateMonitor", "------has received new sms------");
                                    if (bundle != null)
                                    {
                                        Object aobj[] = (Object[])(Object[])bundle.get("pdus");
                                        SmsMessage asmsmessage[] = new SmsMessage[aobj.length];
                                        for (int j = 0; j < aobj.length; j++)
                                        {
                                            asmsmessage[j] = SmsMessage.createFromPdu((byte[])(byte[])aobj[j]);
                                            if (asmsmessage.length > -1)
                                                (new StringBuilder()).append("New SMS received from:").append(asmsmessage[0].getOriginatingAddress()).toString();
                                        }

                                    }
                                } else
                                {
                                    if ("android.intent.action.BATTERY_LOW".equals(s))
                                    {
                                        setStatusValueLowBattery(true);
                                        return;
                                    }
                                    if ("android.intent.action.BATTERY_OKAY".equals(s))
                                    {
                                        setStatusValueLowBattery(false);
                                        return;
                                    }
                                }
                            }
                        }
                    }
                }
            } else
            {
                mHandler.sendMessage(mHandler.obtainMessage(301));
            }
        }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
    }
;
    private boolean mCalibrationData;
    private final ArrayList mCallbacks = Lists.newArrayList();
    private boolean mClockVisible;
    private ComponentName mComponentName;
    private final Context mContext;
    private AlertDialog mCtaDialog;
    private boolean mDeviceProvisioned;
    private ContentObserver mDeviceProvisionedObserver;
    private DialogSequenceManager mDialogSequenceManager;
    private int mFailedAttempts;
    private int mFailedBiometricUnlockAttempts;
    private final Handler mHandler = new Handler() {

        final KeyguardUpdateMonitor this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1016: 
                LongOpenTheBreathLight();
                return;

            case 1014: 
                CloseTheBreathLight();
                return;

            case 1015: 
                OpenTheBreathLight();
                return;

            case 1013: 
                handleDownloadCalibrationDataUpdate();
                return;

            case 1012: 
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("MSG_SYSTEM_STATE, msg.arg1=").append(message.arg1).toString());
                handleSystemStateChanged(message.arg1);
                return;

            case 1010: 
                handle3GSwitchEvent();
                return;

            case 1009: 
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("MSG_MODEM_RESET, msg.arg1=").append(message.arg1).toString());
                handleRadioStateChanged(message.arg1);
                return;

            case 1006: 
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("MSG_KEYGUARD_SIM_NAME_UPDATE, msg.arg1=").append(message.arg1).toString());
                handleSIMNameUpdate(message.arg1);
                return;

            case 1008: 
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("MSG_KEYGUARD_UPDATE_LAYOUT, msg.arg1=").append(message.arg1).toString());
                handleLockScreenUpdateLayout(message.arg1);
                return;

            case 1002: 
                handleSIMCardChanged();
                return;

            case 1007: 
                mPinPukMeDismissFlag = 0;
                return;

            case 1004: 
                handleSIMInfoChanged(message.arg1);
                return;

            case 1011: 
                handleBootupModePick();
                return;

            case 1005: 
                updateResources();
                return;

            case 313: 
                handleBootCompleted();
                return;

            case 312: 
                handleKeyguardVisibilityChanged(message.arg1);
                return;

            case 311: 
                handleUserRemoved(message.arg1);
                return;

            case 310: 
                handleUserSwitched(message.arg1, (IRemoteCallback)message.obj);
                return;

            case 309: 
                handleDevicePolicyManagerStateChanged();
                return;

            case 308: 
                handleDeviceProvisioned();
                return;

            case 307: 
                handleClockVisibilityChanged();
                return;

            case 306: 
                handlePhoneStateChanged((String)message.obj);
                return;

            case 305: 
                handleRingerModeChange(message.arg1);
                return;

            case 304: 
                handleSimStateChange((SimArgs)message.obj);
                return;

            case 303: 
                handleCarrierInfoUpdate((SpnUpdate)message.obj);
                return;

            case 302: 
                handleBatteryUpdate((BatteryStatus)message.obj);
                return;

            case 301: 
                handleTimeUpdate();
                return;
            }
        }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
    }
;
    private boolean mKeyguardDMLocked;
    private boolean mKeyguardIsVisible;
    boolean mNetSearching[];
    private int mPhoneState;
    private PhoneStateListener mPhoneStateListener;
    private int mPinPukMeDismissFlag;
    private PackageManager mPm;
    private View mPromptView;
    private long mQueryBaseTime;
    private RadioStateCallback mRadioStateCallback;
    private int mRingMode;
    private boolean mSIMResetModem;
    private AlertDialog mSimCardChangedDialog;
    private SIMStatus mSimChangedStatus;
    private com.android.internal.telephony.IccCardConstants.State mSimLastState[];
    public int mSimMeCategory[] = {
        0, 0, 0, 0
    };
    public int mSimMeLeftRetryCount[] = {
        5, 5, 5, 5
    };
    private com.android.internal.telephony.IccCardConstants.State mSimState[];
    private SystemStateCallback mSystemStateCallback;
    private CharSequence mTelephonyPlmn[];
    private CharSequence mTelephonySpn[];

    private KeyguardUpdateMonitor(Context context)
    {
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
        mKeyguardDMLocked = false;
        mCtaDialog = null;
        mSimCardChangedDialog = null;
        mPromptView = null;
        mPinPukMeDismissFlag = 0;
        mCalibrationData = true;
        mContext = context;
        initMembers();
        mDialogSequenceManager = new DialogSequenceManager();
        dmCheckLocked();
        initPhoneStateListener();
        mDeviceProvisioned = isDeviceProvisionedInSettingsDb();
        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mDeviceProvisioned is:").append(mDeviceProvisioned).toString());
        if (!mDeviceProvisioned)
            watchForDeviceProvisioning();
        mBatteryStatus = new BatteryStatus(1, 100, 0, 0);
        for (int i = 0; i <= KeyguardUtils.getMaxSimId(); i++)
            mTelephonyPlmn[i] = getDefaultPlmn();

        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.TIME_TICK");
        intentfilter.addAction("android.intent.action.TIME_SET");
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        intentfilter.addAction("android.intent.action.TIMEZONE_CHANGED");
        intentfilter.addAction("android.intent.action.SIM_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.PHONE_STATE");
        intentfilter.addAction("android.provider.Telephony.SPN_STRINGS_UPDATED");
        intentfilter.addAction("android.media.RINGER_MODE_CHANGED");
        intentfilter.addAction("android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED");
        intentfilter.addAction("android.intent.action.USER_REMOVED");
        intentfilter.addAction("com.android.phone.ACTION_UNLOCK_SIM_LOCK");
        intentfilter.addAction("android.intent.action.ACTION_SIM_DETECTED");
        intentfilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        intentfilter.addAction("android.intent.action.CONFIGURATION_CHANGED");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN_IPO");
        intentfilter.addAction("android.intent.action.SIM_INSERTED_STATUS");
        intentfilter.addAction("android.intent.action.SIM_NAME_UPDATE");
        intentfilter.addAction("android.intent.action.RADIO_OFF");
        intentfilter.addAction(GeminiPhone.EVENT_3G_SWITCH_START_MD_RESET);
        intentfilter.addAction(GeminiPhone.EVENT_3G_SWITCH_DONE);
        intentfilter.addAction("android.provider.Telephony.DUAL_SIM_MODE_SELECT");
        intentfilter.addAction("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.ACTION_SHUTDOWN");
        intentfilter.addAction("android.intent.action.ACTION_PREBOOT_IPO");
        intentfilter.addAction("android.intent.action.DOWNLOAD_CALIBRATION_DATA");
        intentfilter.addAction("android.intent.action.SCREEN_OFF");
        intentfilter.addAction("android.intent.action.SCREEN_ON");
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        intentfilter.addAction("android.provider.Telephony.SMS_RECEIVED");
        intentfilter.addAction("android.intent.action.BATTERY_LOW");
        intentfilter.addAction("android.intent.action.BATTERY_OKAY");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        IntentFilter intentfilter1 = new IntentFilter();
        intentfilter1.setPriority(1000);
        intentfilter1.addAction("android.intent.action.BOOT_COMPLETED");
        context.registerReceiver(mBroadcastReceiver, intentfilter1);
        intentfilter.addAction("android.intent.action.KEYGUARD_CLEAR_UREAD_TIPS");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
        try
        {
            ActivityManagerNative.getDefault().registerUserSwitchObserver(new android.app.IUserSwitchObserver.Stub() {

                final KeyguardUpdateMonitor this$0;

                public void onUserSwitchComplete(int j)
                    throws RemoteException
                {
                }

                public void onUserSwitching(int j, IRemoteCallback iremotecallback)
                {
                    mHandler.sendMessage(mHandler.obtainMessage(310, j, 0, iremotecallback));
                }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
            }
);
            return;
        }
        catch (RemoteException remoteexception)
        {
            remoteexception.printStackTrace();
        }
    }

    private void dmCheckLocked()
    {
        android.os.IBinder ibinder = ServiceManager.getService("DMAgent");
        if (ibinder != null)
        {
            try
            {
                boolean flag = com.mediatek.common.dm.DMAgent.Stub.asInterface(ibinder).isLockFlagSet();
                Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("dmCheckLocked, the lock flag is:").append(flag).toString());
                setDmLocked(flag);
                return;
            }
            catch (Exception exception)
            {
                Log.e("KeyguardUpdateMonitor", "get DM status failed!");
            }
            break MISSING_BLOCK_LABEL_76;
        }
        Log.i("KeyguardUpdateMonitor", "dmCheckLocked, DMAgent doesn't exit");
        return;
    }

    private CharSequence getDefaultPlmn()
    {
        return mContext.getResources().getText(0x10402e6);
    }

    public static KeyguardUpdateMonitor getInstance(Context context)
    {
        if (sInstance == null)
            sInstance = new KeyguardUpdateMonitor(context);
        return sInstance;
    }

    private int getSimNumber(int i)
    {
        int j = 0;
        for (; i != 0; i >>>= 1)
            if ((i & 1) != 0)
                j++;

        return j;
    }

    private CharSequence getTelephonyPlmnFrom(Intent intent)
    {
        if (intent.getBooleanExtra("showPlmn", false))
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "EXTRA_SHOW_PLMN =  TRUE ");
            String s = intent.getStringExtra("plmn");
            if (s != null)
                return s;
            else
                return getDefaultPlmn();
        } else
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "EXTRA_SHOW_PLMN = FALSE  ");
            return null;
        }
    }

    private CharSequence getTelephonySpnFrom(Intent intent)
    {
        if (intent.getBooleanExtra("showSpn", false))
        {
            String s = intent.getStringExtra("spn");
            if (s != null)
                return s;
        }
        return null;
    }

    private void handle3GSwitchEvent()
    {
        mPinPukMeDismissFlag = 0;
    }

    private void handleBatteryUpdate(BatteryStatus batterystatus)
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", "handleBatteryUpdate");
        boolean flag = isBatteryUpdateInteresting(mBatteryStatus, batterystatus);
        mBatteryStatus = batterystatus;
        if (flag)
        {
            for (int i = 0; i < mCallbacks.size(); i++)
            {
                KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
                if (keyguardupdatemonitorcallback != null)
                    keyguardupdatemonitorcallback.onRefreshBatteryInfo(batterystatus);
            }

        }
    }

    private void handleBootupModePick()
    {
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "handleBootupModePick");
        String as[] = new String[2];
        as[0] = getOptrNameBySlotForCTA(0);
        as[1] = getOptrNameBySlotForCTA(1);
        mCtaDialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(0x2050036).setCancelable(false).setItems(as, new android.content.DialogInterface.OnClickListener() {

            final KeyguardUpdateMonitor this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                if (mCtaDialog != null)
                {
                    mCtaDialog.dismiss();
                    mCtaDialog = null;
                }
                KeyguardUpdateMonitor.sDualSimSetting = 1;
                Intent intent = new Intent("android.intent.action.DUAL_SIM_MODE");
                switch (i)
                {
                case 3: // '\003'
                    if (KeyguardUpdateMonitor.DEBUG)
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", "handleBootupModePick, mode = don't remind me");
                    android.provider.Settings.System.putInt(mContext.getContentResolver(), "boot_up_select_mode", 0);
                    return;

                case 2: // '\002'
                    if (KeyguardUpdateMonitor.DEBUG)
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", "handleBootupModePick, mode = sim 2");
                    intent.putExtra("mode", 2);
                    mContext.sendBroadcast(intent);
                    android.provider.Settings.System.putInt(mContext.getContentResolver(), "dual_sim_mode_setting", 2);
                    return;

                case 1: // '\001'
                    if (KeyguardUpdateMonitor.DEBUG)
                        KeyguardUtils.xlogD("KeyguardUpdateMonitor", "handleBootupModePick, mode = sim 1");
                    intent.putExtra("mode", 1);
                    mContext.sendBroadcast(intent);
                    android.provider.Settings.System.putInt(mContext.getContentResolver(), "dual_sim_mode_setting", 1);
                    return;

                case 0: // '\0'
                    if (KeyguardUpdateMonitor.DEBUG)
                        Log.d("KeyguardUpdateMonitor", "handleBootupModePick, mode = dual sim");
                    intent.putExtra("mode", 3);
                    mContext.sendBroadcast(intent);
                    android.provider.Settings.System.putInt(mContext.getContentResolver(), "dual_sim_mode_setting", 3);
                    return;
                }
                if (KeyguardUpdateMonitor.DEBUG)
                    KeyguardUtils.xlogD("KeyguardUpdateMonitor", "handleBootupModePick, default, mode = dual sim");
                intent.putExtra("mode", 3);
                mContext.sendBroadcast(intent);
                android.provider.Settings.System.putInt(mContext.getContentResolver(), "dual_sim_mode_setting", 3);
            }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
        }
).create();
        mCtaDialog.getWindow().setType(2009);
        if (!mContext.getResources().getBoolean(0x111000f))
            mCtaDialog.getWindow().setFlags(4, 4);
        sDualSimSetting = 0;
        mCtaDialog.show();
    }

    private void handleCarrierInfoUpdate(SpnUpdate spnupdate)
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handleCarrierInfoUpdate: plmn = ").append(mTelephonyPlmn).append(", spn = ").append(mTelephonySpn).toString());
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback == null)
                continue;
            if (KeyguardUtils.isGemini())
            {
                if (KeyguardUtils.isValidSimId(spnupdate.simId))
                    keyguardupdatemonitorcallback.onRefreshCarrierInfoGemini(mTelephonyPlmn[spnupdate.simId], mTelephonySpn[spnupdate.simId], spnupdate.simId);
            } else
            {
                keyguardupdatemonitorcallback.onRefreshCarrierInfo(mTelephonyPlmn[0], mTelephonySpn[0]);
            }
        }

    }

    private void handleClockVisibilityChanged()
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", "handleClockVisibilityChanged()");
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onClockVisibilityChanged();
        }

    }

    private void handleDownloadCalibrationDataUpdate()
    {
        Log.d("KeyguardUpdateMonitor", "handleDownloadCalibrationDataUpdate");
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onDownloadCalibrationDataUpdate(mCalibrationData);
        }

    }

    private void handleKeyguardVisibilityChanged(int i)
    {
        boolean flag = true;
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handleKeyguardVisibilityChanged(").append(i).append(")").toString());
        if (i != flag)
            flag = false;
        mKeyguardIsVisible = flag;
        for (int j = 0; j < mCallbacks.size(); j++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onKeyguardVisibilityChanged(flag);
        }

    }

    private void handleRadioStateChanged(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("handleRadioStateChanged, slotId=").append(i).append(", + , mSimState=").append(mSimState[i]).toString());
            setPINDismiss(i, SimLockType.SIM_LOCK_PIN, false);
            setPINDismiss(i, SimLockType.SIM_LOCK_PUK, false);
            setPINDismiss(i, SimLockType.SIM_LOCK_ME, false);
            if ((com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED == mSimState[i] || com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED == mSimState[i] || com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == mSimState[i]) && mRadioStateCallback != null)
                mRadioStateCallback.onRadioStateChanged(i);
        }
    }

    private void handleSIMCardChanged()
    {
        LayoutInflater layoutinflater = LayoutInflater.from(mContext);
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(mContext);
        int i = mSimChangedStatus.getSIMCount();
        String s = mSimChangedStatus.getSimDetectStatus();
        if (SIM_DETECT_REMOVE.equals(s) && i == 0)
        {
            builder.setCancelable(false);
            builder.setTitle(0x1040014);
            builder.setIcon(0x1080027);
            builder.setMessage(0x2050080);
            builder.setPositiveButton(0x104000a, null);
            mPromptView = null;
        } else
        {
            builder.setCancelable(false);
            builder.setPositiveButton(0x205008e, new android.content.DialogInterface.OnClickListener() {

                final KeyguardUpdateMonitor this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    Intent intent = new Intent("android.settings.GEMINI_MANAGEMENT");
                    intent.setFlags(0x10000000);
                    mContext.startActivity(intent);
                }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
            }
);
            builder.setNegativeButton(0x205009d, null);
            builder.setTitle(0x2050089);
            mPromptView = layoutinflater.inflate(0x2070018, null);
            initSimChangedPrompt();
            initSimSettingsView();
            builder.setView(mPromptView);
        }
        mSimCardChangedDialog = builder.create();
        mSimCardChangedDialog.getWindow().setType(2008);
        mSimCardChangedDialog.setOnDismissListener(new android.content.DialogInterface.OnDismissListener() {

            final KeyguardUpdateMonitor this$0;

            public void onDismiss(DialogInterface dialoginterface)
            {
                reportDialogClose();
            }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
        }
);
        mSimCardChangedDialog.show();
    }

    private void handleSIMInfoChanged(int i)
    {
        if (KeyguardUtils.isGemini())
        {
            for (int j = 0; j < mCallbacks.size(); j++)
            {
                KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
                if (keyguardupdatemonitorcallback != null)
                    keyguardupdatemonitorcallback.onSIMInfoChanged(i);
            }

        }
    }

    private void handleSIMNameUpdate(int i)
    {
        if (KeyguardUtils.isGemini())
        {
            for (int j = 0; j < mCallbacks.size(); j++)
            {
                KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
                if (keyguardupdatemonitorcallback != null)
                    keyguardupdatemonitorcallback.onLockScreenUpdate(i);
            }

            updateResources();
        }
    }

    private void handleSimStateChange(SimArgs simargs)
    {
        com.android.internal.telephony.IccCardConstants.State state = simargs.simState;
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handleSimStateChange: intentValue = ").append(simargs).append(" ").append("state resolved to ").append(state.toString()).toString());
        if (!KeyguardUtils.isValidSimId(simargs.simId))
        {
            Log.d("KeyguardUpdateMonitor", "handleSimStateChange: !isValidSimId");
        } else
        {
            if (DEBUG)
                Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handleSimStateChange: intentValue = ").append(simargs).append(" ").append("state resolved to ").append(state.toString()).append(", oldssimtate=").append(mSimState[simargs.simId]).toString());
            com.android.internal.telephony.IccCardConstants.State state1 = mSimState[simargs.simId];
            mSimLastState[simargs.simId] = mSimState[simargs.simId];
            if (state != com.android.internal.telephony.IccCardConstants.State.UNKNOWN && (state == com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED || state != state1))
            {
                if (DEBUG_SIM_STATES)
                    Log.v("KeyguardUpdateMonitor", (new StringBuilder()).append("dispatching state: ").append(state).append(" to sim ").append(simargs.simId).toString());
                mSimState[simargs.simId] = state;
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("handleSimStateChange: mSimState = ").append(mSimState[simargs.simId]).toString());
                if (KeyguardUtils.isGemini())
                {
                    for (int j = 0; j < mCallbacks.size(); j++)
                    {
                        KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback1 = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
                        if (keyguardupdatemonitorcallback1 != null)
                            keyguardupdatemonitorcallback1.onSimStateChangedGemini(state, simargs.simId);
                    }

                } else
                {
                    for (int i = 0; i < mCallbacks.size(); i++)
                    {
                        KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
                        if (keyguardupdatemonitorcallback != null)
                            keyguardupdatemonitorcallback.onSimStateChanged(state);
                    }

                }
            }
        }
    }

    private void handleSystemStateChanged(int i)
    {
        if (mSystemStateCallback == null)
        {
            if (DEBUG)
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "mSystemStateCallback is null, skipped!");
        } else
        {
            switch (i)
            {
            case 0: // '\0'
                mSystemStateCallback.onSysShutdown();
                return;

            case 1: // '\001'
                mSystemStateCallback.onSysBootup();
                return;
            }
            if (DEBUG)
            {
                KeyguardUtils.xlogE("KeyguardUpdateMonitor", "received unknown system state change event");
                return;
            }
        }
    }

    private void handleTimeUpdate()
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", "handleTimeUpdate");
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onTimeChanged();
        }

    }

    private void initMembers()
    {
        mSimState = new com.android.internal.telephony.IccCardConstants.State[KeyguardUtils.getNumOfSim()];
        mSimLastState = new com.android.internal.telephony.IccCardConstants.State[KeyguardUtils.getNumOfSim()];
        mTelephonyPlmn = new CharSequence[KeyguardUtils.getNumOfSim()];
        mTelephonySpn = new CharSequence[KeyguardUtils.getNumOfSim()];
        mNetSearching = new boolean[KeyguardUtils.getNumOfSim()];
        for (int i = 0; i <= KeyguardUtils.getMaxSimId(); i++)
        {
            mSimState[i] = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            mSimLastState[i] = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            mNetSearching[i] = false;
        }

    }

    private void initPhoneStateListener()
    {
        mPhoneStateListener = new PhoneStateListener() {

            final KeyguardUpdateMonitor this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                if (servicestate != null)
                {
                    int i;
                    if (KeyguardUtils.isGemini())
                        i = servicestate.getMySimId();
                    else
                        i = 0;
                    if (KeyguardUtils.isValidSimId(i))
                    {
                        int j = servicestate.getRegState();
                        if (mNetSearching[i] && j != 2)
                        {
                            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "PhoneStateListener, sim1 searching finished");
                            mNetSearching[i] = false;
                        }
                        if (2 == j)
                        {
                            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "PhoneStateListener, sim1 searching begin");
                            mNetSearching[i] = true;
                        }
                        for (int k = 0; k < mCallbacks.size(); k++)
                        {
                            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(k)).get();
                            if (keyguardupdatemonitorcallback != null)
                                keyguardupdatemonitorcallback.onSearchNetworkUpdate(i, mNetSearching[i]);
                        }

                    }
                }
            }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super();
            }
        }
;
        if (!KeyguardUtils.isGemini())
            break MISSING_BLOCK_LABEL_201;
        boolean flag;
        if (com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone")) != null)
            flag = true;
        else
            flag = false;
        try
        {
            Boolean boolean1 = Boolean.valueOf(flag);
            com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry")).listen("KeyguardUpdateMonitor", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
            com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry2")).listen("KeyguardUpdateMonitor", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
            if (KeyguardUtils.getNumOfSim() >= 3)
                com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry3")).listen("KeyguardUpdateMonitor", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
            if (KeyguardUtils.getNumOfSim() >= 4)
                com.android.internal.telephony.ITelephonyRegistry.Stub.asInterface(ServiceManager.getService("telephony.registry4")).listen("KeyguardUpdateMonitor", mPhoneStateListener.getCallback(), 1, boolean1.booleanValue());
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.e("KeyguardUpdateMonitor", "Fail to listen GEMINI state", remoteexception);
            return;
        }
        catch (NullPointerException nullpointerexception)
        {
            Log.e("KeyguardUpdateMonitor", "The registry is null", nullpointerexception);
        }
        return;
        ((TelephonyManager)mContext.getSystemService("phone")).listen(mPhoneStateListener, 1);
        return;
    }

    private void initSimChangedPrompt()
    {
        String s;
label0:
        {
            int i = mSimChangedStatus.getNewSimSlot();
            s = mSimChangedStatus.getSimDetectStatus();
            int j = getSimNumber(i);
            TextView atextview[] = new TextView[4];
            atextview[0] = (TextView)mPromptView.findViewById(0x2100065);
            atextview[1] = (TextView)mPromptView.findViewById(0x2100066);
            atextview[2] = (TextView)mPromptView.findViewById(0x2100067);
            atextview[3] = (TextView)mPromptView.findViewById(0x2100068);
            for (int k = 0; k < 4; k++)
                atextview[k].setVisibility(8);

            String s1;
            if (SIM_DETECT_NEW.equals(s))
            {
                if (j == 1)
                    s1 = mContext.getResources().getString(0x205008a);
                else
                    s1 = mContext.getResources().getString(0x205008b);
                int l = 0;
                int i1 = 0;
                for (; i != 0; i >>>= 1)
                {
                    l++;
                    if ((i & 1) != 0)
                    {
                        atextview[i1].setVisibility(0);
                        if (l == 1)
                            addOptrNameBySlot(atextview[i1], 0);
                        else
                        if (l == 2)
                            addOptrNameBySlot(atextview[i1], 1);
                        else
                        if (l == 3)
                            addOptrNameBySlot(atextview[i1], 2);
                        else
                        if (l == 4)
                            addOptrNameBySlot(atextview[i1], 3);
                        i1++;
                    }
                }

            } else
            if (SIM_DETECT_REMOVE.equals(s))
            {
                s1 = mContext.getResources().getString(0x205008c);
            } else
            {
                if (!SIM_DETECT_SWAP.equals(s))
                    break label0;
                s1 = mContext.getResources().getString(0x205008d);
            }
            ((TextView)mPromptView.findViewById(0x2100064)).setText(s1);
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unknown SIMCard Changed:").append(s).toString());
    }

    private void initSimSettingsView()
    {
        long l = android.provider.Settings.System.getLong(mContext.getContentResolver(), "voice_call_sim_setting", -5L);
        long l1 = android.provider.Settings.System.getLong(mContext.getContentResolver(), "sms_sim_setting", -5L);
        long l2 = android.provider.Settings.System.getLong(mContext.getContentResolver(), "gprs_connection_sim_setting", -5L);
        long l3 = android.provider.Settings.System.getLong(mContext.getContentResolver(), "video_call_sim_setting", -5L);
        TelephonyManager telephonymanager = (TelephonyManager)mContext.getSystemService("phone");
        boolean flag;
        if (telephonymanager != null && telephonymanager.isVoiceCapable())
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (telephonymanager != null && telephonymanager.isSmsCapable())
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (mSimChangedStatus.getSIMCount() >= 2)
            flag2 = true;
        else
            flag2 = false;
        if (DEBUG)
            Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("initSimSettingsView, isVoiceCapable=").append(flag).append(", isSmsCapabl=").append(flag1).append(", voiceCallSimIdx=").append(l).append(", smsSimIdx=").append(l1).append(", dataSimIdx=").append(l2).append(", videoCallSimIdx=").append(l3).append(", multiSim=").append(flag2).toString());
        ((TextView)mPromptView.findViewById(0x2100069)).setText(0x20500a2);
        TextView textview = (TextView)mPromptView.findViewById(0x210006b);
        TextView textview1 = (TextView)mPromptView.findViewById(0x210006c);
        View view = mPromptView.findViewById(0x210006a);
        if (shouldShowVoiceCall(flag, flag2))
        {
            textview.setText(0x205008f);
            addOptrNameByIdx(textview1, l);
        } else
        {
            view.setVisibility(8);
        }
        TextView textview2 = (TextView)mPromptView.findViewById(0x210006e);
        TextView textview3 = (TextView)mPromptView.findViewById(0x210006f);
        View view1 = mPromptView.findViewById(0x210006d);
        if (shouldShowVideoCall(flag, flag2))
        {
            textview2.setText(0x20500a3);
            addOptrNameByIdx(textview3, l3);
        } else
        {
            view1.setVisibility(8);
        }
        TextView textview4 = (TextView)mPromptView.findViewById(0x2100071);
        TextView textview5 = (TextView)mPromptView.findViewById(0x2100072);
        View view2 = mPromptView.findViewById(0x2100070);
        if (shouldShowSms(flag1, flag2))
        {
            textview4.setText(0x2050090);
            addOptrNameByIdx(textview5, l1);
        } else
        {
            view2.setVisibility(8);
        }
        TextView textview6 = (TextView)mPromptView.findViewById(0x2100073);
        TextView textview7 = (TextView)mPromptView.findViewById(0x2100074);
        textview6.setText(0x2050091);
        addOptrNameByIdx(textview7, l2);
    }

    private boolean internetCallIsOn()
    {
        boolean flag = SipManager.isVoipSupported(mContext);
        boolean flag1;
        if (android.provider.Settings.System.getInt(mContext.getContentResolver(), "enable_internet_call_value", 0) == 1)
            flag1 = true;
        else
            flag1 = false;
        if (DEBUG)
            Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("internetCallIsOn, isSupport = ").append(flag).append(", isOn = ").append(flag1).toString());
        return flag && flag1;
    }

    public static boolean isAlarmBoot()
    {
        String s = SystemProperties.get("sys.boot.reason");
        return s != null && s.equals("1");
    }

    private static boolean isBatteryUpdateInteresting(BatteryStatus batterystatus, BatteryStatus batterystatus1)
    {
        boolean flag = batterystatus1.isPluggedIn();
        boolean flag1 = batterystatus.isPluggedIn();
        boolean flag2;
        if (flag1 && flag && batterystatus.status != batterystatus1.status)
            flag2 = true;
        else
            flag2 = false;
        return flag1 != flag || flag2 || batterystatus.level != batterystatus1.level || !flag && batterystatus1.isBatteryLow() && batterystatus1.level != batterystatus.level;
    }

    private boolean isDeviceProvisionedInSettingsDb()
    {
        int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    public static boolean isSimLocked(com.android.internal.telephony.IccCardConstants.State state)
    {
        return state == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || state == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || state == com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED || state == com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
    }

    private boolean isSimPinSecure(com.android.internal.telephony.IccCardConstants.State state)
    {
        boolean flag;
label0:
        {
            if ((state != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || getPINDismissFlag(0, SimLockType.SIM_LOCK_PIN)) && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || getPINDismissFlag(0, SimLockType.SIM_LOCK_PUK)) && (state != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED || getPINDismissFlag(0, SimLockType.SIM_LOCK_ME)))
            {
                com.android.internal.telephony.IccCardConstants.State state1 = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                flag = false;
                if (state != state1)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    private boolean isSimPinSecureGemini(com.android.internal.telephony.IccCardConstants.State state, int i)
    {
        boolean flag;
label0:
        {
            if (KeyguardUtils.isValidSimId(i))
            {
                if ((state != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || getPINDismissFlag(i, SimLockType.SIM_LOCK_PIN)) && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || getPINDismissFlag(i, SimLockType.SIM_LOCK_PUK)) && (state != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED || getPINDismissFlag(i, SimLockType.SIM_LOCK_ME)))
                {
                    com.android.internal.telephony.IccCardConstants.State state2 = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                    flag = false;
                    if (state != state2)
                        break label0;
                }
                flag = true;
                break label0;
            }
            if ((state != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || getPINDismissFlag(i, SimLockType.SIM_LOCK_PIN)) && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || getPINDismissFlag(i, SimLockType.SIM_LOCK_PUK)) && (state != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED || getPINDismissFlag(i, SimLockType.SIM_LOCK_ME)))
            {
                com.android.internal.telephony.IccCardConstants.State state1 = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                flag = false;
                if (state != state1)
                    break label0;
            }
            return true;
        }
        return flag;
    }

    private void sendUpdates(KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback)
    {
        keyguardupdatemonitorcallback.onRefreshBatteryInfo(mBatteryStatus);
        keyguardupdatemonitorcallback.onTimeChanged();
        keyguardupdatemonitorcallback.onRingerModeChanged(mRingMode);
        keyguardupdatemonitorcallback.onPhoneStateChanged(mPhoneState);
        if (KeyguardUtils.isGemini())
        {
            for (int k = 0; k <= KeyguardUtils.getMaxSimId(); k++)
                keyguardupdatemonitorcallback.onRefreshCarrierInfoGemini(mTelephonyPlmn[k], mTelephonySpn[k], k);

        } else
        {
            keyguardupdatemonitorcallback.onRefreshCarrierInfo(mTelephonyPlmn[0], mTelephonySpn[0]);
        }
        keyguardupdatemonitorcallback.onClockVisibilityChanged();
        if (KeyguardUtils.isGemini())
        {
            for (int j = 0; j <= KeyguardUtils.getMaxSimId(); j++)
                keyguardupdatemonitorcallback.onSimStateChangedGemini(mSimState[j], j);

        } else
        {
            keyguardupdatemonitorcallback.onSimStateChanged(mSimState[0]);
        }
        keyguardupdatemonitorcallback.onDownloadCalibrationDataUpdate(mCalibrationData);
        for (int i = 0; i <= KeyguardUtils.getMaxSimId(); i++)
            keyguardupdatemonitorcallback.onSearchNetworkUpdate(i, mNetSearching[i]);

    }

    private boolean shouldShowSms(boolean flag, boolean flag1)
    {
        if (DEBUG)
            Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("shouldShowSms, smsCapable = ").append(flag).append(", multiSim = ").append(flag1).toString());
        return flag && flag1;
    }

    private boolean shouldShowVideoCall(boolean flag, boolean flag1)
    {
        ITelephony itelephony;
        int i;
        if (DEBUG)
            Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("shouldShowVideoCall, video_SUPPORT = ").append(KeyguardUtils.isMediatekVT3G324MSupport()).append(", 3G_SWITCH = ").append(KeyguardUtils.isMediatekGemini3GSwitchSupport()).append(", voiceCallCapable = ").append(flag).append("multiSim = ").append(flag1).toString());
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        i = -1;
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_95;
        int j = itelephony.get3GCapabilitySIM();
        i = j;
_L1:
        RemoteException remoteexception;
        return flag && KeyguardUtils.isMediatekVT3G324MSupport() && KeyguardUtils.isMediatekGemini3GSwitchSupport() && i != -1;
        remoteexception;
        Log.e("KeyguardUpdateMonitor", "get3GCapabilitySIM exception");
          goto _L1
    }

    private boolean shouldShowVoiceCall(boolean flag, boolean flag1)
    {
        if (DEBUG)
            Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("shouldShowVoiceCall, voiceCallCapable = ").append(flag).append(", multiSim = ").append(flag1).toString());
        return flag && (flag1 || internetCallIsOn());
    }

    private void watchForDeviceProvisioning()
    {
        mDeviceProvisionedObserver = new ContentObserver(mHandler) {

            final KeyguardUpdateMonitor this$0;

            public void onChange(boolean flag1)
            {
                super.onChange(flag1);
                mDeviceProvisioned = isDeviceProvisionedInSettingsDb();
                if (mDeviceProvisioned)
                    mHandler.sendMessage(mHandler.obtainMessage(308));
                if (KeyguardUpdateMonitor.DEBUG)
                    Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("DEVICE_PROVISIONED state = ").append(mDeviceProvisioned).toString());
            }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super(handler);
            }
        }
;
        mContext.getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor("device_provisioned"), false, mDeviceProvisionedObserver);
        boolean flag = isDeviceProvisionedInSettingsDb();
        if (flag != mDeviceProvisioned)
        {
            mDeviceProvisioned = flag;
            if (mDeviceProvisioned)
                mHandler.sendMessage(mHandler.obtainMessage(308));
        }
    }

    public void CloseTheBreathLight()
    {
        Log.e("KeyguardUpdateMonitor", "------LightorClosebreathlight--close------");
        File file = new File("sys/class/breath_led_class/breath_led_device/breath_light");
        try
        {
            file.createNewFile();
            if (file.exists() && file.canWrite())
            {
                FileWriter filewriter = new FileWriter(file);
                filewriter.write("off");
                filewriter.close();
            }
            return;
        }
        catch (Exception exception)
        {
            return;
        }
    }

    public void CloseTheLEDLight()
    {
        try
        {
            FileOutputStream fileoutputstream = new FileOutputStream("sys/class/leds/button-backlight/brightness");
            Log.e("KeyguardUpdateMonitor", "-----write0:  to the file");
            fileoutputstream.write(LIGHTE_OFF);
            fileoutputstream.close();
            return;
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            Log.d("KeyguardUpdateMonitor", filenotfoundexception.toString());
            return;
        }
        catch (IOException ioexception)
        {
            ioexception.printStackTrace();
        }
    }

    public void LongOpenTheBreathLight()
    {
        Log.e("KeyguardUpdateMonitor", "------LightorClosebreathlight--longopen------");
        File file = new File("sys/class/breath_led_class/breath_led_device/breath_light");
        try
        {
            file.createNewFile();
            if (file.exists() && file.canWrite())
            {
                FileWriter filewriter = new FileWriter(file);
                filewriter.write("on");
                filewriter.close();
            }
            return;
        }
        catch (Exception exception)
        {
            return;
        }
    }

    public void OpenTheBreathLight()
    {
        Log.e("KeyguardUpdateMonitor", "------LightorClosebreathlight--open------");
        File file = new File("sys/class/breath_led_class/breath_led_device/breath_light");
        try
        {
            file.createNewFile();
            if (file.exists() && file.canWrite())
            {
                FileWriter filewriter = new FileWriter(file);
                filewriter.write("flicker");
                filewriter.close();
            }
            return;
        }
        catch (Exception exception)
        {
            return;
        }
    }

    public void OpenTheLEDLight()
    {
        try
        {
            FileOutputStream fileoutputstream = new FileOutputStream("sys/class/leds/button-backlight/brightness");
            Log.e("KeyguardUpdateMonitor", "-----write255:  to the file");
            fileoutputstream.write(LIGHTE_ON);
            fileoutputstream.close();
            return;
        }
        catch (FileNotFoundException filenotfoundexception)
        {
            Log.d("KeyguardUpdateMonitor", filenotfoundexception.toString());
            return;
        }
        catch (IOException ioexception)
        {
            ioexception.printStackTrace();
        }
    }

    public void addOptrNameByIdx(TextView textview, long l)
    {
        textview.setBackground(getOptrDrawableByIdx(l));
        int i = mContext.getResources().getDimensionPixelSize(0x20d001b);
        textview.setPadding(i, 0, i, 0);
        String s = getOptrNameByIdx(l);
        if (s == null)
        {
            textview.setText(0x205009c);
            return;
        } else
        {
            textview.setText(s);
            return;
        }
    }

    public void addOptrNameBySlot(TextView textview, int i)
    {
        textview.setBackground(getOptrDrawableBySlot(i));
        int j = mContext.getResources().getDimensionPixelSize(0x20d001b);
        textview.setPadding(j, 0, j, 0);
        String s = getOptrNameBySlot(i);
        if (s == null)
        {
            textview.setText(0x205009c);
            return;
        } else
        {
            textview.setText(s);
            return;
        }
    }

    public void clearFailedUnlockAttempts()
    {
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
    }

    public boolean dmIsLocked()
    {
        return mKeyguardDMLocked;
    }

    public int findNewMmsCount()
    {
        Cursor cursor1 = mContext.getContentResolver().query(Uri.parse("content://mms/inbox"), null, "read = 0", null, null);
        Cursor cursor = cursor1;
_L2:
        int i = 0;
        if (cursor != null)
        {
            i = cursor.getCount();
            cursor.close();
        }
        Log.e("KeyguardUpdateMonitor", (new StringBuilder()).append("newMmsCount=").append(i).toString());
        return i;
        Exception exception1;
        exception1;
        exception1.printStackTrace();
        cursor = null;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    public int findNewSmsCount()
    {
        Cursor cursor1 = mContext.getContentResolver().query(Uri.parse("content://sms"), null, "type = 1 and read = 0", null, null);
        Cursor cursor = cursor1;
_L2:
        int i = 0;
        if (cursor != null)
        {
            i = cursor.getCount();
            cursor.close();
        }
        Log.e("KeyguardUpdateMonitor", (new StringBuilder()).append("newSmsCount=").append(i).toString());
        return i;
        Exception exception1;
        exception1;
        exception1.printStackTrace();
        cursor = null;
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        throw exception;
    }

    public int getFailedUnlockAttempts()
    {
        return mFailedAttempts;
    }

    public boolean getIsChargingstatus()
    {
        return isCharging;
    }

    public com.android.internal.telephony.IccCardConstants.State getLastSimState(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mSimLastState = ").append(mSimLastState[i]).append(" for simId = ").append(i).toString());
            return mSimLastState[i];
        } else
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mSimLastState = ").append(mSimLastState[0]).append(" for default sim").toString());
            return mSimLastState[0];
        }
    }

    public boolean getMaxBiometricUnlockAttemptsReached()
    {
        return mFailedBiometricUnlockAttempts >= 3;
    }

    public int getMissedCallCount()
    {
        Cursor cursor;
        int i;
        cursor = mContext.getContentResolver().query(android.provider.CallLog.Calls.CONTENT_URI, new String[] {
            "number", "type", "new"
        }, null, null, "date DESC");
        i = 0;
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (!cursor.moveToNext())
            break; /* Loop/switch isn't completed */
        cursor.getInt(cursor.getColumnIndex("type"));
        JVM INSTR tableswitch 3 3: default 113
    //                   3 88;
           goto _L3 _L4
_L3:
        continue; /* Loop/switch isn't completed */
_L4:
        if (cursor.getInt(cursor.getColumnIndex("new")) == 1)
            i++;
        if (true) goto _L1; else goto _L2
_L2:
        cursor.close();
        Log.e("KeyguardUpdateMonitor", (new StringBuilder()).append("missedCallCount=").append(i).toString());
        return i;
    }

    public Drawable getOptrDrawableByIdx(long l)
    {
        com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord;
label0:
        {
            if (l > 0L)
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("getOptrDrawableByIdx, xxsimIdx=").append(l).toString());
                siminforecord = SimInfoManager.getSimInfoById(mContext, l);
                if (siminforecord != null)
                    break label0;
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "getOptrDrawableBySlotId, return null");
            }
            return null;
        }
        return mContext.getResources().getDrawable(siminforecord.mSimBackgroundDarkRes);
    }

    public Drawable getOptrDrawableBySlot(int i)
    {
        if (i >= 0)
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("getOptrDrawableBySlot, xxslot=").append(i).toString());
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SimInfoManager.getSimInfoBySlot(mContext, i);
            if (siminforecord == null)
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "getOptrDrawableBySlotId, return null");
                return null;
            } else
            {
                return mContext.getResources().getDrawable(siminforecord.mSimBackgroundDarkRes);
            }
        } else
        {
            throw new IndexOutOfBoundsException();
        }
    }

    public String getOptrNameByIdx(long l)
    {
        if (l > 0L)
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("getOptrNameByIdx, xxsimId=").append(l).toString());
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SimInfoManager.getSimInfoById(mContext, l);
            if (siminforecord == null)
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "getOptrNameByIdx, return null");
                return null;
            } else
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("info=").append(siminforecord.mDisplayName).toString());
                return siminforecord.mDisplayName;
            }
        }
        if (-1L == l)
            return mContext.getResources().getString(0x2050092);
        if (-2L == l)
            return mContext.getResources().getString(0x2050099);
        if (0L == l)
            return mContext.getResources().getString(0x2050093);
        else
            return mContext.getResources().getString(0x205009a);
    }

    public String getOptrNameBySlot(int i)
    {
        if (i >= 0)
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("getOptrNameBySlot, xxSlot=").append(i).toString());
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SimInfoManager.getSimInfoBySlot(mContext, i);
            if (siminforecord == null)
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", "getOptrNameBySlot, return null");
                return null;
            } else
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("info=").append(siminforecord.mDisplayName).toString());
                return siminforecord.mDisplayName;
            }
        } else
        {
            throw new IndexOutOfBoundsException();
        }
    }

    public String getOptrNameBySlotForCTA(int i)
    {
        if (i >= 0)
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("getOptrNameBySlot, xxSlot=").append(i).toString());
            com.mediatek.telephony.SimInfoManager.SimInfoRecord siminforecord = SimInfoManager.getSimInfoBySlot(mContext, i);
            if (siminforecord != null && siminforecord.mDisplayName != null)
            {
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("info=").append(siminforecord.mDisplayName).toString());
                return siminforecord.mDisplayName;
            }
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "getOptrNameBySlotId, return null");
            if (1 == i)
                return (new StringBuilder()).append(mContext.getResources().getString(0x2050086)).append(" 02").toString();
            if (2 == i)
                return (new StringBuilder()).append(mContext.getResources().getString(0x2050086)).append(" 03").toString();
            if (3 == i)
                return (new StringBuilder()).append(mContext.getResources().getString(0x2050086)).append(" 04").toString();
            else
                return (new StringBuilder()).append(mContext.getResources().getString(0x2050086)).append(" 01").toString();
        } else
        {
            return mContext.getResources().getString(0x205009a);
        }
    }

    public boolean getPINDismissFlag(int i, SimLockType simlocktype)
    {
        Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("getPINDismissFlag, simId=").append(i).append(", lockType=").append(simlocktype).append(", mPinPukMeDismissFlag=").append(mPinPukMeDismissFlag).toString());
        byte byte0;
        char c;
        char c1;
        if (i == 0)
        {
            byte0 = 1;
            c = '\004';
            c1 = '\u0100';
        } else
        if (i == 1)
        {
            byte0 = 2;
            c = '\b';
            c1 = '\u0200';
        } else
        if (i == 2)
        {
            byte0 = 16;
            c = '@';
            c1 = '\u0400';
        } else
        {
            byte0 = 32;
            c = '\200';
            c1 = '\u0800';
        }
        static class _cls9
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType = new int[SimLockType.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType[SimLockType.SIM_LOCK_PIN.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType[SimLockType.SIM_LOCK_PUK.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardUpdateMonitor$SimLockType[SimLockType.SIM_LOCK_ME.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        int j = _cls9..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardUpdateMonitor.SimLockType[simlocktype.ordinal()];
        char c2 = '\0';
        switch (j)
        {
        case 3: // '\003'
            c2 = c1;
            break;

        case 2: // '\002'
            c2 = c;
            break;

        case 1: // '\001'
            c2 = byte0;
            break;
        }
        return (c2 & mPinPukMeDismissFlag) == c2;
    }

    public int getPhoneState()
    {
        return mPhoneState;
    }

    public long getQueryBaseTime()
    {
        return mQueryBaseTime;
    }

    int getRetryPukCount(int i)
    {
        if (i == 3)
            return SystemProperties.getInt("gsm.sim.retry.puk1.4", -1);
        if (i == 2)
            return SystemProperties.getInt("gsm.sim.retry.puk1.3", -1);
        if (i == 1)
            return SystemProperties.getInt("gsm.sim.retry.puk1.2", -1);
        else
            return SystemProperties.getInt("gsm.sim.retry.puk1", -1);
    }

    public boolean getSearchingFlag(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
            return mNetSearching[i];
        else
            return mNetSearching[0];
    }

    public int getSimMeCategory(int i)
    {
        return mSimMeCategory[i];
    }

    public int getSimMeLeftRetryCount(int i)
    {
        return mSimMeLeftRetryCount[i];
    }

    public com.android.internal.telephony.IccCardConstants.State getSimState()
    {
        return mSimState[0];
    }

    public com.android.internal.telephony.IccCardConstants.State getSimState(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mSimState = ").append(mSimState[i]).append(" for simId = ").append(i).toString());
            return mSimState[i];
        } else
        {
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("mSimState = ").append(mSimState[0]).append(" for default sim").toString());
            return mSimState[0];
        }
    }

    public boolean getStatusValueLowBattery()
    {
        return mIsInBatteryLow;
    }

    public CharSequence getTelephonyPlmn()
    {
        return mTelephonyPlmn[0];
    }

    public CharSequence getTelephonyPlmn(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
            return mTelephonyPlmn[i];
        else
            return mTelephonyPlmn[0];
    }

    public CharSequence getTelephonySpn()
    {
        return mTelephonySpn[0];
    }

    public CharSequence getTelephonySpn(int i)
    {
        if (KeyguardUtils.isValidSimId(i))
            return mTelephonySpn[i];
        else
            return mTelephonySpn[0];
    }

    public boolean getclickcleanButton()
    {
        return clickcleanButton;
    }

    protected void handleBootCompleted()
    {
        mBootCompleted = true;
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onBootCompleted();
        }

    }

    protected void handleDevicePolicyManagerStateChanged()
    {
        for (int i = -1 + mCallbacks.size(); i >= 0; i--)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onDevicePolicyManagerStateChanged();
        }

    }

    protected void handleDeviceProvisioned()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onDeviceProvisioned();
        }

        mDialogSequenceManager.handleShowDialog();
        if (mDeviceProvisionedObserver != null)
        {
            mContext.getContentResolver().unregisterContentObserver(mDeviceProvisionedObserver);
            mDeviceProvisionedObserver = null;
        }
    }

    protected void handleLockScreenUpdateLayout(int i)
    {
        for (int j = 0; j < mCallbacks.size(); j++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onLockScreenUpdate(i);
        }

    }

    protected void handlePhoneStateChanged(String s)
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handlePhoneStateChanged(").append(s).append(")").toString());
        if (mSimCardChangedDialog != null)
            mSimCardChangedDialog.dismiss();
        if (TelephonyManager.EXTRA_STATE_IDLE.equals(s))
            mPhoneState = 0;
        else
        if (TelephonyManager.EXTRA_STATE_OFFHOOK.equals(s))
            mPhoneState = 2;
        else
        if (TelephonyManager.EXTRA_STATE_RINGING.equals(s))
            mPhoneState = 1;
        for (int i = 0; i < mCallbacks.size(); i++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(i)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onPhoneStateChanged(mPhoneState);
        }

    }

    protected void handleRingerModeChange(int i)
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("handleRingerModeChange(").append(i).append(")").toString());
        mRingMode = i;
        for (int j = 0; j < mCallbacks.size(); j++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onRingerModeChanged(i);
        }

    }

    protected void handleUserRemoved(int i)
    {
        for (int j = 0; j < mCallbacks.size(); j++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onUserRemoved(i);
        }

    }

    protected void handleUserSwitched(int i, IRemoteCallback iremotecallback)
    {
        for (int j = 0; j < mCallbacks.size(); j++)
        {
            KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback = (KeyguardUpdateMonitorCallback)((WeakReference)mCallbacks.get(j)).get();
            if (keyguardupdatemonitorcallback != null)
                keyguardupdatemonitorcallback.onUserSwitched(i);
        }

        setAlternateUnlockEnabled(false);
        try
        {
            iremotecallback.sendResult(null);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public boolean hasBootCompleted()
    {
        return mBootCompleted;
    }

    public boolean isAlternateUnlockEnabled()
    {
        return mAlternateUnlockEnabled;
    }

    public boolean isClockVisible()
    {
        return mClockVisible;
    }

    public boolean isDeviceCharging()
    {
        return mBatteryStatus.status != 3 && mBatteryStatus.status != 4;
    }

    public boolean isDeviceProvisioned()
    {
        return mDeviceProvisioned;
    }

    public boolean isEncryptMode()
    {
        String s = SystemProperties.get("vold.decrypt");
        return !"".equals(s) && !"trigger_restart_framework".equals(s);
    }

    boolean isGMSRunning()
    {
label0:
        {
            boolean flag = true;
            mPm = mContext.getPackageManager();
            mComponentName = new ComponentName("com.google.android.setupwizard", "com.google.android.setupwizard.SetupWizardActivity");
            boolean flag1;
            try
            {
                mPm.getInstallerPackageName("com.google.android.setupwizard");
            }
            catch (IllegalArgumentException illegalargumentexception)
            {
                flag = false;
            }
            flag1 = false;
            if (!flag)
                break label0;
            if (1 != mPm.getComponentEnabledSetting(mComponentName))
            {
                int i = mPm.getComponentEnabledSetting(mComponentName);
                flag1 = false;
                if (i != 0)
                    break label0;
            }
            flag1 = true;
        }
        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("isGMSRunning, isGMSExist = ").append(flag).append(", running = ").append(flag1).toString());
        return flag1;
    }

    public boolean isKeyguardVisible()
    {
        return mKeyguardIsVisible;
    }

    public boolean isPhoneAppReady()
    {
        List list = ((ActivityManager)mContext.getSystemService("activity")).getRunningAppProcesses();
        if (list == null)
        {
            Log.i("KeyguardUpdateMonitor", "runningAppInfo == null");
            return false;
        }
        Iterator iterator = list.iterator();
        boolean flag1;
        do
        {
            boolean flag = iterator.hasNext();
            flag1 = false;
            if (!flag)
                break;
            if (!((android.app.ActivityManager.RunningAppProcessInfo)iterator.next()).processName.equals("com.android.phone"))
                continue;
            flag1 = true;
            break;
        } while (true);
        return flag1;
    }

    public boolean isSIMInserted(int i)
    {
        ITelephony itelephony;
        boolean flag;
        try
        {
            itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone"));
        }
        catch (RemoteException remoteexception)
        {
            KeyguardUtils.xlogE("KeyguardUpdateMonitor", "Get sim insert status failure!");
            return false;
        }
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_41;
        flag = itelephony.isSimInsert(i);
        if (!flag)
            return false;
        return true;
    }

    public boolean isSimLocked()
    {
        boolean flag = false;
        int i = 0;
        do
        {
            if (i > KeyguardUtils.getMaxSimId())
                break;
            if (!flag && !isSimLockedGemini(i))
                flag = false;
            else
                flag = true;
            if (flag)
                break;
            i++;
        } while (true);
        return flag;
    }

    public boolean isSimLockedGemini(int i)
    {
        boolean flag;
label0:
        {
            if (KeyguardUtils.isValidSimId(i))
            {
                if (mSimState[i] != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && mSimState[i] != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED && mSimState[i] != com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED)
                {
                    com.android.internal.telephony.IccCardConstants.State state2 = mSimState[i];
                    com.android.internal.telephony.IccCardConstants.State state3 = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                    flag = false;
                    if (state2 != state3)
                        break label0;
                }
                flag = true;
                break label0;
            }
            if (mSimState[0] != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && mSimState[0] != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED && mSimState[0] != com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED)
            {
                com.android.internal.telephony.IccCardConstants.State state = mSimState[0];
                com.android.internal.telephony.IccCardConstants.State state1 = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                flag = false;
                if (state != state1)
                    break label0;
            }
            return true;
        }
        return flag;
    }

    public boolean isSimPinSecure()
    {
        boolean flag = false;
        int i = 0;
        do
        {
            if (i > KeyguardUtils.getMaxSimId())
                break;
            if (!flag && !isSimPinSecureGemini(getSimState(i), i))
                flag = false;
            else
                flag = true;
            if (flag)
                break;
            i++;
        } while (true);
        return flag;
    }

    public void minusSimMeLeftRetryCount(int i)
    {
        if (mSimMeLeftRetryCount[i] > 0)
        {
            int ai[] = mSimMeLeftRetryCount;
            ai[i] = -1 + ai[i];
        }
    }

    public void registerCallback(KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback)
    {
        if (DEBUG)
            Log.v("KeyguardUpdateMonitor", (new StringBuilder()).append("*** register callback for ").append(keyguardupdatemonitorcallback).toString());
        for (int i = 0; i < mCallbacks.size(); i++)
            if (((WeakReference)mCallbacks.get(i)).get() == keyguardupdatemonitorcallback)
            {
                if (DEBUG)
                    Log.e("KeyguardUpdateMonitor", "Object tried to add another callback", new Exception("Called by"));
                return;
            }

        mCallbacks.add(new WeakReference(keyguardupdatemonitorcallback));
        removeCallback(null);
        sendUpdates(keyguardupdatemonitorcallback);
    }

    public void registerRadioStateCallback(RadioStateCallback radiostatecallback)
    {
        mRadioStateCallback = radiostatecallback;
    }

    public void registerSystemStateCallback(SystemStateCallback systemstatecallback)
    {
        mSystemStateCallback = systemstatecallback;
    }

    public void removeCallback(KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback)
    {
        if (DEBUG)
            Log.v("KeyguardUpdateMonitor", (new StringBuilder()).append("*** unregister callback for ").append(keyguardupdatemonitorcallback).toString());
        for (int i = -1 + mCallbacks.size(); i >= 0; i--)
            if (((WeakReference)mCallbacks.get(i)).get() == keyguardupdatemonitorcallback)
                mCallbacks.remove(i);

    }

    public void reportClockVisible(boolean flag)
    {
        mClockVisible = flag;
        mHandler.obtainMessage(307).sendToTarget();
    }

    public void reportDialogClose()
    {
        mDialogSequenceManager.reportDialogClose();
    }

    public void reportFailedBiometricUnlockAttempt()
    {
        mFailedBiometricUnlockAttempts = 1 + mFailedBiometricUnlockAttempts;
    }

    public void reportFailedUnlockAttempt()
    {
        mFailedAttempts = 1 + mFailedAttempts;
    }

    public void reportSimUnlocked()
    {
    }

    public void reportSimUnlocked(int i)
    {
        if (DEBUG)
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", "reportSimUnlocked");
        handleSimStateChange(new SimArgs(com.android.internal.telephony.IccCardConstants.State.READY, i, 0));
    }

    public void requestShowDialog(DialogShowCallBack dialogshowcallback)
    {
        mDialogSequenceManager.requestShowDialog(dialogshowcallback);
    }

    public void sendKeyguardVisibilityChanged(boolean flag)
    {
        if (DEBUG)
            Log.d("KeyguardUpdateMonitor", (new StringBuilder()).append("sendKeyguardVisibilityChanged(").append(flag).append(")").toString());
        Message message = mHandler.obtainMessage(312);
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        message.arg1 = i;
        message.sendToTarget();
    }

    public void sendVerifyResult(int i, boolean flag)
    {
        KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("sendVerifyResult verifyType = ").append(i).append(" bRet = ").append(flag).toString());
        Intent intent = (new Intent("android.intent.action.CELLCONNSERVICE")).putExtra("start_type", "response");
        if (intent == null)
        {
            KeyguardUtils.xlogE("KeyguardUpdateMonitor", "sendVerifyResult new retIntent failed");
            return;
        } else
        {
            intent.putExtra("verfiy_type", i);
            intent.putExtra("verfiy_result", flag);
            mContext.startService(intent);
            return;
        }
    }

    public void setAlternateUnlockEnabled(boolean flag)
    {
        mAlternateUnlockEnabled = flag;
    }

    public void setDebugFilterStatus(boolean flag)
    {
        DEBUG = flag;
    }

    public void setDmLocked(boolean flag)
    {
        mKeyguardDMLocked = flag;
    }

    public void setIsChargingstatus(boolean flag)
    {
        isCharging = flag;
    }

    public void setPINDismiss(int i, SimLockType simlocktype, boolean flag)
    {
        Log.i("KeyguardUpdateMonitor", (new StringBuilder()).append("setPINDismiss, simId=").append(i).append(", lockType=").append(simlocktype).append(", dismiss=").append(flag).append(", mPinPukMeDismissFlag=").append(mPinPukMeDismissFlag).toString());
        byte byte0;
        char c;
        char c1;
        if (i == 0)
        {
            byte0 = 1;
            c = '\004';
            c1 = '\u0100';
        } else
        if (i == 1)
        {
            byte0 = 2;
            c = '\b';
            c1 = '\u0200';
        } else
        if (i == 2)
        {
            byte0 = 16;
            c = '@';
            c1 = '\u0400';
        } else
        {
            byte0 = 32;
            c = '\200';
            c1 = '\u0800';
        }
        int j = _cls9..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardUpdateMonitor.SimLockType[simlocktype.ordinal()];
        char c2 = '\0';
        switch (j)
        {
        case 3: // '\003'
            c2 = c1;
            break;

        case 2: // '\002'
            c2 = c;
            break;

        case 1: // '\001'
            c2 = byte0;
            break;
        }
        if (flag)
        {
            mPinPukMeDismissFlag = c2 | mPinPukMeDismissFlag;
            return;
        } else
        {
            mPinPukMeDismissFlag = mPinPukMeDismissFlag & ~c2;
            return;
        }
    }

    public void setQueryBaseTime()
    {
        mQueryBaseTime = System.currentTimeMillis();
    }

    public void setStatusValueLowBattery(boolean flag)
    {
        mIsInBatteryLow = flag;
    }

    public void setclickcleanButton(boolean flag)
    {
        clickcleanButton = flag;
    }

    public void unRegisterRadioStateCallback()
    {
        mRadioStateCallback = null;
    }

    void updateResources()
    {
        if (mSimCardChangedDialog != null && mPromptView != null && mSimCardChangedDialog.isShowing())
        {
            mSimCardChangedDialog.setTitle(0x2050089);
            Button button = mSimCardChangedDialog.getButton(-2);
            if (button != null)
                button.setText(0x205009d);
            Button button1 = mSimCardChangedDialog.getButton(-1);
            if (button1 != null)
                button1.setText(0x205008e);
            initSimChangedPrompt();
            initSimSettingsView();
        }
    }

    static 
    {
        DEBUG = true;
        boolean flag;
        if (!DEBUG)
            flag = false;
        else
            flag = true;
        DEBUG_SIM_STATES = flag;
    }



















/*
    static boolean access$2302(KeyguardUpdateMonitor keyguardupdatemonitor, boolean flag)
    {
        keyguardupdatemonitor.mSIMResetModem = flag;
        return flag;
    }

*/



/*
    static SIMStatus access$2402(KeyguardUpdateMonitor keyguardupdatemonitor, SIMStatus simstatus)
    {
        keyguardupdatemonitor.mSimChangedStatus = simstatus;
        return simstatus;
    }

*/





/*
    static AlertDialog access$2802(KeyguardUpdateMonitor keyguardupdatemonitor, AlertDialog alertdialog)
    {
        keyguardupdatemonitor.mCtaDialog = alertdialog;
        return alertdialog;
    }

*/



/*
    static boolean access$2902(KeyguardUpdateMonitor keyguardupdatemonitor, boolean flag)
    {
        keyguardupdatemonitor.mCalibrationData = flag;
        return flag;
    }

*/



/*
    static long access$3002(KeyguardUpdateMonitor keyguardupdatemonitor, long l)
    {
        keyguardupdatemonitor.mQueryBaseTime = l;
        return l;
    }

*/



/*
    static boolean access$3102(KeyguardUpdateMonitor keyguardupdatemonitor, boolean flag)
    {
        keyguardupdatemonitor.mDeviceProvisioned = flag;
        return flag;
    }

*/










/*
    static int access$802(KeyguardUpdateMonitor keyguardupdatemonitor, int i)
    {
        keyguardupdatemonitor.mPinPukMeDismissFlag = i;
        return i;
    }

*/


    // Unreferenced inner class com/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$DialogSequenceManager$1

/* anonymous class */
    class DialogSequenceManager._cls1 extends ContentObserver
    {

        final DialogSequenceManager this$1;

        public void onChange(boolean flag)
        {
            int i = queryDialogSequenceSeetings();
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager DialogSequenceObserver--onChange()--dialog_sequence_settings = ").append(i).toString());
            if (i == 0)
                handleShowDialog();
            else
            if (i == 1)
            {
                DialogShowCallBack dialogshowcallback = (DialogShowCallBack)mDialogShowCallbackQueue.poll();
                KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager DialogSequenceObserver--onChange()--dialogCallBack = ").append(dialogshowcallback).append(" --setLocked(true)--").toString());
                if (dialogshowcallback != null)
                    dialogshowcallback.show();
                setLocked(true);
                return;
            }
        }

            
            {
                this$1 = DialogSequenceManager.this;
                super(handler);
            }
    }


    // Unreferenced inner class com/android/internal/policy/impl/keyguard/KeyguardUpdateMonitor$DialogSequenceManager$2

/* anonymous class */
    class DialogSequenceManager._cls2 extends ContentObserver
    {

        final DialogSequenceManager this$1;

        public void onChange(boolean flag)
        {
            int i = queryOOBEDisplay();
            KeyguardUtils.xlogD("KeyguardUpdateMonitor", (new StringBuilder()).append("DialogSequenceManager OOBEObserver--onChange()--oobe_display = ").append(i).toString());
            if (i != 1)
                handleShowDialog();
        }

            
            {
                this$1 = DialogSequenceManager.this;
                super(handler);
            }
    }

}
