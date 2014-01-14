// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.os.Handler;
import android.os.Message;
import android.telephony.TelephonyManager;
import com.google.android.collect.Lists;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardUpdateMonitorCallback

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
            return level < 20;
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

    private static class SimArgs
    {

        public final com.android.internal.telephony.IccCardConstants.State simState;

        static SimArgs fromIntent(Intent intent)
        {
            if (!"android.intent.action.SIM_STATE_CHANGED".equals(intent.getAction()))
                throw new IllegalArgumentException("only handles intent ACTION_SIM_STATE_CHANGED");
            String s = intent.getStringExtra("ss");
            com.android.internal.telephony.IccCardConstants.State state;
            if ("ABSENT".equals(s))
            {
                if ("PERM_DISABLED".equals(intent.getStringExtra("reason")))
                    state = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                else
                    state = com.android.internal.telephony.IccCardConstants.State.ABSENT;
            } else
            if ("READY".equals(s))
                state = com.android.internal.telephony.IccCardConstants.State.READY;
            else
            if ("LOCKED".equals(s))
            {
                String s1 = intent.getStringExtra("reason");
                if ("PIN".equals(s1))
                    state = com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;
                else
                if ("PUK".equals(s1))
                    state = com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;
                else
                    state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            } else
            if ("NETWORK".equals(s))
                state = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
            else
                state = com.android.internal.telephony.IccCardConstants.State.UNKNOWN;
            return new SimArgs(state);
        }

        public String toString()
        {
            return simState.toString();
        }

        SimArgs(com.android.internal.telephony.IccCardConstants.State state)
        {
            simState = state;
        }
    }


    private static final boolean DEBUG = false;
    private static final boolean DEBUG_SIM_STATES = false;
    private static final int FAILED_BIOMETRIC_UNLOCK_ATTEMPTS_BEFORE_BACKUP = 3;
    private static final int LOW_BATTERY_THRESHOLD = 20;
    private static final int MSG_BATTERY_UPDATE = 302;
    private static final int MSG_CARRIER_INFO_UPDATE = 303;
    private static final int MSG_CLOCK_VISIBILITY_CHANGED = 307;
    private static final int MSG_DEVICE_PROVISIONED = 308;
    protected static final int MSG_DPM_STATE_CHANGED = 309;
    private static final int MSG_PHONE_STATE_CHANGED = 306;
    private static final int MSG_RINGER_MODE_CHANGED = 305;
    private static final int MSG_SIM_STATE_CHANGE = 304;
    private static final int MSG_TIME_UPDATE = 301;
    protected static final int MSG_USER_REMOVED = 311;
    protected static final int MSG_USER_SWITCHED = 310;
    private static final String TAG = "KeyguardUpdateMonitor";
    private BatteryStatus mBatteryStatus;
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final KeyguardUpdateMonitor this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s = intent.getAction();
            if (!"android.intent.action.TIME_TICK".equals(s) && !"android.intent.action.TIME_SET".equals(s) && !"android.intent.action.TIMEZONE_CHANGED".equals(s))
            {
                if ("android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s))
                {
                    mTelephonyPlmn = getTelephonyPlmnFrom(intent);
                    mTelephonySpn = getTelephonySpnFrom(intent);
                    mHandler.sendMessage(mHandler.obtainMessage(303));
                    return;
                }
                if ("android.intent.action.BATTERY_CHANGED".equals(s))
                {
                    int i = intent.getIntExtra("status", 1);
                    int j = intent.getIntExtra("plugged", 0);
                    int k = intent.getIntExtra("level", 0);
                    int l = intent.getIntExtra("health", 1);
                    Message message = mHandler.obtainMessage(302, new BatteryStatus(i, k, j, l));
                    mHandler.sendMessage(message);
                    return;
                }
                if ("android.intent.action.SIM_STATE_CHANGED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(304, SimArgs.fromIntent(intent)));
                    return;
                }
                if ("android.media.RINGER_MODE_CHANGED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(305, intent.getIntExtra("android.media.EXTRA_RINGER_MODE", -1), 0));
                    return;
                }
                if ("android.intent.action.PHONE_STATE".equals(s))
                {
                    String s1 = intent.getStringExtra("state");
                    mHandler.sendMessage(mHandler.obtainMessage(306, s1));
                    return;
                }
                if ("android.app.action.DEVICE_POLICY_MANAGER_STATE_CHANGED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(309));
                    return;
                }
                if ("android.intent.action.USER_SWITCHED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(310, intent.getIntExtra("android.intent.extra.user_handle", 0), 0));
                    return;
                }
                if ("android.intent.action.USER_REMOVED".equals(s))
                {
                    mHandler.sendMessage(mHandler.obtainMessage(311, intent.getIntExtra("android.intent.extra.user_handle", 0), 0));
                    return;
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
    private ArrayList mCallbacks;
    private boolean mClockVisible;
    private ContentObserver mContentObserver;
    private final Context mContext;
    private boolean mDeviceProvisioned;
    private int mFailedAttempts;
    private int mFailedBiometricUnlockAttempts;
    private final Handler mHandler = new Handler() {

        final KeyguardUpdateMonitor this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 311: 
                handleUserRemoved(message.arg1);
                return;

            case 310: 
                handleUserSwitched(message.arg1);
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
                handleCarrierInfoUpdate();
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
    private int mPhoneState;
    private int mRingMode;
    private com.android.internal.telephony.IccCardConstants.State mSimState;
    private CharSequence mTelephonyPlmn;
    private CharSequence mTelephonySpn;

    public KeyguardUpdateMonitor(Context context)
    {
        mSimState = com.android.internal.telephony.IccCardConstants.State.READY;
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
        mCallbacks = Lists.newArrayList();
        mContext = context;
        boolean flag;
        if (android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0) != 0)
            flag = true;
        else
            flag = false;
        mDeviceProvisioned = flag;
        if (!mDeviceProvisioned)
            watchForDeviceProvisioning();
        mSimState = com.android.internal.telephony.IccCardConstants.State.NOT_READY;
        mBatteryStatus = new BatteryStatus(1, 100, 0, 0);
        mTelephonyPlmn = getDefaultPlmn();
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
        intentfilter.addAction("android.intent.action.USER_SWITCHED");
        intentfilter.addAction("android.intent.action.USER_REMOVED");
        context.registerReceiver(mBroadcastReceiver, intentfilter);
    }

    private CharSequence getDefaultPlmn()
    {
        return mContext.getResources().getText(0x10402e6);
    }

    private CharSequence getTelephonyPlmnFrom(Intent intent)
    {
        if (intent.getBooleanExtra("showPlmn", false))
        {
            String s = intent.getStringExtra("plmn");
            if (s != null)
                return s;
            else
                return getDefaultPlmn();
        } else
        {
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

    private void handleBatteryUpdate(BatteryStatus batterystatus)
    {
        boolean flag = isBatteryUpdateInteresting(mBatteryStatus, batterystatus);
        mBatteryStatus = batterystatus;
        if (flag)
        {
            for (int i = 0; i < mCallbacks.size(); i++)
                ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onRefreshBatteryInfo(batterystatus);

        }
    }

    private void handleCarrierInfoUpdate()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onRefreshCarrierInfo(mTelephonyPlmn, mTelephonySpn);

    }

    private void handleClockVisibilityChanged()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onClockVisibilityChanged();

    }

    private void handleSimStateChange(SimArgs simargs)
    {
        com.android.internal.telephony.IccCardConstants.State state = simargs.simState;
        if (state != com.android.internal.telephony.IccCardConstants.State.UNKNOWN && state != mSimState)
        {
            mSimState = state;
            for (int i = 0; i < mCallbacks.size(); i++)
                ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onSimStateChanged(state);

        }
    }

    private void handleTimeUpdate()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onTimeChanged();

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
        return flag1 != flag || flag2 || flag && batterystatus.level != batterystatus1.level || !flag && batterystatus1.isBatteryLow() && batterystatus1.level != batterystatus.level;
    }

    private void watchForDeviceProvisioning()
    {
        mContentObserver = new ContentObserver(mHandler) {

            final KeyguardUpdateMonitor this$0;

            public void onChange(boolean flag1)
            {
                super.onChange(flag1);
                KeyguardUpdateMonitor keyguardupdatemonitor = KeyguardUpdateMonitor.this;
                int j = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0);
                boolean flag2 = false;
                if (j != 0)
                    flag2 = true;
                keyguardupdatemonitor.mDeviceProvisioned = flag2;
                if (mDeviceProvisioned)
                    mHandler.sendMessage(mHandler.obtainMessage(308));
            }

            
            {
                this$0 = KeyguardUpdateMonitor.this;
                super(handler);
            }
        }
;
        mContext.getContentResolver().registerContentObserver(android.provider.Settings.Global.getUriFor("device_provisioned"), false, mContentObserver);
        int i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "device_provisioned", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        if (flag != mDeviceProvisioned)
        {
            mDeviceProvisioned = flag;
            if (mDeviceProvisioned)
                mHandler.sendMessage(mHandler.obtainMessage(308));
        }
    }

    public void clearFailedAttempts()
    {
        mFailedAttempts = 0;
        mFailedBiometricUnlockAttempts = 0;
    }

    public int getFailedAttempts()
    {
        return mFailedAttempts;
    }

    public boolean getMaxBiometricUnlockAttemptsReached()
    {
        return mFailedBiometricUnlockAttempts >= 3;
    }

    public int getPhoneState()
    {
        return mPhoneState;
    }

    public com.android.internal.telephony.IccCardConstants.State getSimState()
    {
        return mSimState;
    }

    public CharSequence getTelephonyPlmn()
    {
        return mTelephonyPlmn;
    }

    public CharSequence getTelephonySpn()
    {
        return mTelephonySpn;
    }

    protected void handleDevicePolicyManagerStateChanged()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onDevicePolicyManagerStateChanged();

    }

    protected void handleDeviceProvisioned()
    {
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onDeviceProvisioned();

        if (mContentObserver != null)
        {
            mContext.getContentResolver().unregisterContentObserver(mContentObserver);
            mContentObserver = null;
        }
    }

    protected void handlePhoneStateChanged(String s)
    {
        if (TelephonyManager.EXTRA_STATE_IDLE.equals(s))
            mPhoneState = 0;
        else
        if (TelephonyManager.EXTRA_STATE_OFFHOOK.equals(s))
            mPhoneState = 2;
        else
        if (TelephonyManager.EXTRA_STATE_RINGING.equals(s))
            mPhoneState = 1;
        for (int i = 0; i < mCallbacks.size(); i++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(i)).onPhoneStateChanged(mPhoneState);

    }

    protected void handleRingerModeChange(int i)
    {
        mRingMode = i;
        for (int j = 0; j < mCallbacks.size(); j++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(j)).onRingerModeChanged(i);

    }

    protected void handleUserRemoved(int i)
    {
        for (int j = 0; j < mCallbacks.size(); j++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(j)).onUserRemoved(i);

    }

    protected void handleUserSwitched(int i)
    {
        for (int j = 0; j < mCallbacks.size(); j++)
            ((KeyguardUpdateMonitorCallback)mCallbacks.get(j)).onUserSwitched(i);

    }

    public boolean isClockVisible()
    {
        return mClockVisible;
    }

    public boolean isDeviceProvisioned()
    {
        return mDeviceProvisioned;
    }

    public boolean isSimLocked()
    {
        return mSimState == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || mSimState == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || mSimState == com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
    }

    public void registerCallback(KeyguardUpdateMonitorCallback keyguardupdatemonitorcallback)
    {
        if (!mCallbacks.contains(keyguardupdatemonitorcallback))
        {
            mCallbacks.add(keyguardupdatemonitorcallback);
            keyguardupdatemonitorcallback.onRefreshBatteryInfo(mBatteryStatus);
            keyguardupdatemonitorcallback.onTimeChanged();
            keyguardupdatemonitorcallback.onRingerModeChanged(mRingMode);
            keyguardupdatemonitorcallback.onPhoneStateChanged(mPhoneState);
            keyguardupdatemonitorcallback.onRefreshCarrierInfo(mTelephonyPlmn, mTelephonySpn);
            keyguardupdatemonitorcallback.onClockVisibilityChanged();
            keyguardupdatemonitorcallback.onSimStateChanged(mSimState);
        }
    }

    public void removeCallback(Object obj)
    {
        mCallbacks.remove(obj);
    }

    public void reportClockVisible(boolean flag)
    {
        mClockVisible = flag;
        mHandler.obtainMessage(307).sendToTarget();
    }

    public void reportFailedAttempt()
    {
        mFailedAttempts = 1 + mFailedAttempts;
    }

    public void reportFailedBiometricUnlockAttempt()
    {
        mFailedBiometricUnlockAttempts = 1 + mFailedBiometricUnlockAttempts;
    }

    public void reportSimUnlocked()
    {
        handleSimStateChange(new SimArgs(com.android.internal.telephony.IccCardConstants.State.READY));
    }





/*
    static boolean access$1002(KeyguardUpdateMonitor keyguardupdatemonitor, boolean flag)
    {
        keyguardupdatemonitor.mDeviceProvisioned = flag;
        return flag;
    }

*/







/*
    static CharSequence access$602(KeyguardUpdateMonitor keyguardupdatemonitor, CharSequence charsequence)
    {
        keyguardupdatemonitor.mTelephonyPlmn = charsequence;
        return charsequence;
    }

*/



/*
    static CharSequence access$802(KeyguardUpdateMonitor keyguardupdatemonitor, CharSequence charsequence)
    {
        keyguardupdatemonitor.mTelephonySpn = charsequence;
        return charsequence;
    }

*/

}
