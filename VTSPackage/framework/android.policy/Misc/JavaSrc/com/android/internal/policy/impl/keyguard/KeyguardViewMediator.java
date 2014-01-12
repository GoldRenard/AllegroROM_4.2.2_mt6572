// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.EventLog;
import android.util.Log;
import android.view.Window;
import android.view.WindowManager;
import com.android.internal.widget.LockPatternUtils;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardUpdateMonitor, KeyguardViewManager, KeyguardUtils, KeyguardUpdateMonitorCallback

public class KeyguardViewMediator
{
    class BrightnessObserver extends ContentObserver
    {

        final KeyguardViewMediator this$0;

        void observe()
        {
            mContext.getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("screen_brightness"), false, this);
        }

        public void onChange(boolean flag)
        {
            int j = android.provider.Settings.System.getInt(mContext.getContentResolver(), "screen_brightness");
            int i = j;
_L2:
            KeyguardViewMediator.mCurrentBrightnessValues = i;
            return;
            Exception exception;
            exception;
            i = 255;
            if (true) goto _L2; else goto _L1
_L1:
        }

        BrightnessObserver(Handler handler)
        {
            this$0 = KeyguardViewMediator.this;
            super(handler);
        }
    }

    private class InvalidDialogCallback
        implements KeyguardUpdateMonitor.DialogShowCallBack
    {

        final KeyguardViewMediator this$0;

        public void show()
        {
            String s = mContext.getString(0x20500a5);
            String s1 = mContext.getString(0x20500a6);
            createDialog(s, s1).show();
        }

        private InvalidDialogCallback()
        {
            this$0 = KeyguardViewMediator.this;
            super();
        }

    }

    private class MeLockedDialogCallback
        implements KeyguardUpdateMonitor.DialogShowCallBack
    {

        final KeyguardViewMediator this$0;

        public void show()
        {
            String s = mContext.getString(0x205007c);
            createDialog(null, s).show();
        }

        private MeLockedDialogCallback()
        {
            this$0 = KeyguardViewMediator.this;
            super();
        }

    }

    public static interface ViewMediatorCallback
    {

        public abstract void keyguardDone(boolean flag);

        public abstract void keyguardDoneDrawing();

        public abstract void keyguardDonePending();

        public abstract void onUserActivityTimeoutChanged();

        public abstract void setNeedsInput(boolean flag);

        public abstract void userActivity();

        public abstract void userActivity(long l);

        public abstract void wakeUp();
    }


    private static final int ALARM_BOOT = 115;
    protected static final int AWAKE_INTERVAL_DEFAULT_MS = 10000;
    private static final boolean DBG_MESSAGE = true;
    private static final boolean DBG_WAKE = true;
    static final boolean DEBUG = true;
    private static final String DELAYED_KEYGUARD_ACTION = "com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD";
    private static final boolean ENABLE_INSECURE_STATUS_BAR_EXPAND = true;
    private static final int HIDE = 3;
    public static final String IPO_DISABLE = "android.intent.action.ACTION_BOOT_IPO";
    private static final int KEYGUARD_DISPLAY_TIMEOUT_DELAY_DEFAULT = 30000;
    private static final int KEYGUARD_DONE = 9;
    private static final int KEYGUARD_DONE_AUTHENTICATING = 11;
    private static final int KEYGUARD_DONE_DRAWING = 10;
    private static final int KEYGUARD_DONE_DRAWING_TIMEOUT_MS = 2000;
    private static final int KEYGUARD_LOCK_AFTER_DELAY_DEFAULT = 5000;
    private static final int KEYGUARD_RELAYOUT = 1000;
    private static final int KEYGUARD_TIMEOUT = 13;
    private static final String LAUNCH_PWROFF_ALARM = "android.intent.action.LAUNCH_POWEROFF_ALARM";
    private static final int MAX_BRIGHTNESS_VALUES = 255;
    private static final int MSG_DM_KEYGUARD_UPDATE = 1001;
    private static final String NORMAL_BOOT_ACTION = "android.intent.action.normal.boot";
    private static final String NORMAL_BOOT_DONE_ACTION = "android.intent.action.normal.boot.done";
    private static final String NORMAL_SHUTDOWN_ACTION = "android.intent.action.normal.shutdown";
    private static final int NOTIFY_SCREEN_OFF = 6;
    private static final int NOTIFY_SCREEN_ON = 7;
    public static final String OMADM_LAWMO_LOCK = "com.mediatek.dm.LAWMO_LOCK";
    public static final String OMADM_LAWMO_UNLOCK = "com.mediatek.dm.LAWMO_UNLOCK";
    private static final String PRE_SHUTDOWN = "android.intent.action.ACTION_PRE_SHUTDOWN";
    static final String REMOVE_IPOWIN = "alarm.boot.remove.ipowin";
    private static final int RESET = 4;
    public static final String RESET_FOR_DM_LOCK = "dmlock_reset";
    private static final int RESHOW_ANYWHERE = 116;
    private static final int SET_HIDDEN = 12;
    private static final int SHOW = 2;
    private static final int SHOW_ASSISTANT = 14;
    private static final String TAG = "KeyguardViewMediator";
    private static final int VERIFY_UNLOCK = 5;
    private static final int WAKE_WHEN_READY = 8;
    private static int mCurrentBrightnessValues = 20;
    private static boolean mExternallyEnabled = true;
    private static boolean mHidden = false;
    public static boolean mHideNavBar = false;
    private static int mPhoneStateValues = 0;
    private static boolean mShowing = false;
    private static int sWakeMSGId = 0;
    private AlarmManager mAlarmManager;
    private AudioManager mAudioManager;
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final KeyguardViewMediator this$0;

        public void onReceive(Context context1, Intent intent)
        {
            String s2 = intent.getAction();
            if ("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD".equals(s2))
            {
                int j = intent.getIntExtra("seq", 0);
                KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("received DELAYED_KEYGUARD_ACTION with seq = ").append(j).append(", mDelayedShowingSequence = ").append(mDelayedShowingSequence).toString());
                synchronized (KeyguardViewMediator.this)
                {
                    if (mDelayedShowingSequence == j)
                    {
                        mSuppressNextLockSound = true;
                        doKeyguardLocked();
                    }
                }
                return;
            } else
            {
                if ("com.mediatek.dm.LAWMO_LOCK".equals(s2))
                {
                    KeyguardUpdateMonitor.getInstance(mContext).setDmLocked(true);
                    KeyguardUtils.xlogD("KeyguardViewMediator", "OMADM_LAWMO_LOCK received, KEYGUARD_DM_LOCKED");
                    Message message1 = mHandler.obtainMessage(1001);
                    message1.arg1 = 1;
                    message1.sendToTarget();
                    return;
                }
                if ("com.mediatek.dm.LAWMO_UNLOCK".equals(s2))
                {
                    KeyguardUpdateMonitor.getInstance(mContext).setDmLocked(false);
                    KeyguardUtils.xlogD("KeyguardViewMediator", "OMADM_LAWMO_UNLOCK received, KEYGUARD_DM_LOCKED");
                    Message message = mHandler.obtainMessage(1001);
                    message.arg1 = 0;
                    message.sendToTarget();
                    return;
                }
                if ("android.intent.action.ACTION_BOOT_IPO".equals(s2))
                {
                    KeyguardViewMediator.mHideNavBar = false;
                    mIsIPOBoot = true;
                    Log.w("KeyguardViewMediator", (new StringBuilder()).append("IPO_DISABLE: ").append(s2).append("  alarmBoot: ").append(KeyguardUpdateMonitor.isAlarmBoot()).toString());
                    if (KeyguardUpdateMonitor.isAlarmBoot())
                    {
                        hideLocked();
                        return;
                    }
                } else
                {
                    if ("android.intent.action.LAUNCH_POWEROFF_ALARM".equals(s2))
                    {
                        Log.w("KeyguardViewMediator", (new StringBuilder()).append("LAUNCH_PWROFF_ALARM: ").append(s2).toString());
                        mHandler.sendEmptyMessageDelayed(115, 1500L);
                        return;
                    }
                    if ("android.intent.action.normal.boot".equals(s2))
                    {
                        Log.w("KeyguardViewMediator", (new StringBuilder()).append("NORMAL_BOOT_ACTION: ").append(s2).toString());
                        mHandler.sendEmptyMessageDelayed(116, 1500L);
                        return;
                    }
                    if ("android.intent.action.normal.shutdown".equals(s2))
                    {
                        Log.w("KeyguardViewMediator", (new StringBuilder()).append("ACTION_SHUTDOWN: ").append(s2).toString());
                        if (KeyguardUpdateMonitor.isAlarmBoot())
                        {
                            SystemProperties.set("sys.boot.reason", "0");
                            mHandler.sendEmptyMessageDelayed(3, 1500L);
                        }
                        KeyguardViewMediator.mHideNavBar = true;
                        return;
                    }
                    if ("android.intent.action.ACTION_PRE_SHUTDOWN".equals(s2))
                    {
                        Log.w("KeyguardViewMediator", (new StringBuilder()).append("PRE_SHUTDOWN: ").append(s2).toString());
                        mSuppressNextLockSound = true;
                        return;
                    }
                    if ("android.intent.action.PHONE_STATE".equals(s2))
                    {
                        KeyguardViewMediator.mPhoneStateValues = ((TelephonyManager)context1.getSystemService("phone")).getCallState();
                        if (!TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState) && mScreenOn && KeyguardViewMediator.mExternallyEnabled)
                        {
                            setBrightness(KeyguardViewMediator.mCurrentBrightnessValues);
                            return;
                        }
                        if (TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState) && mScreenOn && KeyguardViewMediator.mExternallyEnabled)
                        {
                            KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                            int i;
                            if (KeyguardViewMediator.mShowing)
                                i = 255;
                            else
                                i = KeyguardViewMediator.mCurrentBrightnessValues;
                            keyguardviewmediator.setBrightness(i);
                            return;
                        }
                    }
                }
                return;
            }
            exception;
            keyguardviewmediator1;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$0 = KeyguardViewMediator.this;
                super();
            }
    }
;
    private Context mContext;
    private int mDelayedShowingSequence;
    private android.view.WindowManagerPolicy.OnKeyguardExitResult mExitSecureCallback;
    private Handler mHandler;
    private boolean mIsIPOBoot;
    private boolean mKeyguardDonePending;
    private KeyguardViewManager mKeyguardViewManager;
    private LockPatternUtils mLockPatternUtils;
    private int mLockSoundId;
    private int mLockSoundStreamId;
    private final float mLockSoundVolume;
    private SoundPool mLockSounds;
    private int mMasterStreamType;
    private boolean mNeedToReshowWhenReenabled;
    private PowerManager mPM;
    private String mPhoneState;
    private boolean mScreenOn;
    private SearchManager mSearchManager;
    private android.os.PowerManager.WakeLock mShowKeyguardWakeLock;
    private boolean mShowLockIcon;
    private boolean mShowingLockIcon;
    private StatusBarManager mStatusBarManager;
    private boolean mSuppressNextLockSound;
    private boolean mSystemReady;
    private int mUnlockSoundId;
    KeyguardUpdateMonitorCallback mUpdateCallback;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private UserManager mUserManager;
    private Intent mUserPresentIntent;
    ViewMediatorCallback mViewMediatorCallback;
    private boolean mWaitingUntilKeyguardVisible;
    private android.os.PowerManager.WakeLock mWakeAndHandOff;

    public KeyguardViewMediator(Context context, LockPatternUtils lockpatternutils)
    {
        mIsIPOBoot = false;
        mSuppressNextLockSound = true;
        mNeedToReshowWhenReenabled = false;
        mPhoneState = TelephonyManager.EXTRA_STATE_IDLE;
        mWaitingUntilKeyguardVisible = false;
        mKeyguardDonePending = false;
        mUpdateCallback = new KeyguardUpdateMonitorCallback() {

            final KeyguardViewMediator this$0;

            public void onClockVisibilityChanged()
            {
                adjustStatusBarLocked();
            }

            public void onDeviceProvisioned()
            {
                sendUserPresentBroadcast();
            }

            void onPhoneStateChanged(int i)
            {
                KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                keyguardviewmediator;
                JVM INSTR monitorenter ;
                if (i != 0)
                    break MISSING_BLOCK_LABEL_42;
                if (!mScreenOn && KeyguardViewMediator.mExternallyEnabled)
                {
                    Log.d("KeyguardViewMediator", "screen is off and call ended, let's make sure the keyguard is showing");
                    doKeyguardLocked();
                }
                keyguardviewmediator;
                JVM INSTR monitorexit ;
                return;
                Exception exception;
                exception;
                keyguardviewmediator;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void onSimStateChanged(com.android.internal.telephony.IccCardConstants.State state)
            {
                boolean flag1;
label0:
                {
                    Log.d("KeyguardViewMediator", (new StringBuilder()).append("onSimStateChanged: ").append(state).toString());
                    com.android.internal.telephony.IccCardConstants.State state1 = mUpdateMonitor.getLastSimState(0);
                    if (state1 != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && state1 != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED)
                    {
                        com.android.internal.telephony.IccCardConstants.State state2 = com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED;
                        flag1 = false;
                        if (state1 != state2)
                            break label0;
                    }
                    flag1 = true;
                }
                static class _cls7
                {

                    static final int $SwitchMap$com$android$internal$telephony$IccCardConstants$State[];

                    static 
                    {
                        $SwitchMap$com$android$internal$telephony$IccCardConstants$State = new int[com.android.internal.telephony.IccCardConstants.State.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.ABSENT.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror3) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED.ordinal()] = 5;
                        }
                        catch (NoSuchFieldError nosuchfielderror4) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.READY.ordinal()] = 6;
                        }
                        catch (NoSuchFieldError nosuchfielderror5) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NOT_READY.ordinal()] = 7;
                        }
                        catch (NoSuchFieldError nosuchfielderror6)
                        {
                            return;
                        }
                    }
                }

                _cls7..SwitchMap.com.android.internal.telephony.IccCardConstants.State[state.ordinal()];
                JVM INSTR tableswitch 1 7: default 120
            //                           1 121
            //                           2 193
            //                           3 193
            //                           4 193
            //                           5 240
            //                           6 333
            //                           7 368;
                   goto _L1 _L2 _L3 _L3 _L3 _L4 _L5 _L6
_L1:
                return;
_L2:
                this;
                JVM INSTR monitorenter ;
                if (!mUpdateMonitor.isDeviceProvisioned()) goto _L8; else goto _L7
_L7:
                if (!flag1) goto _L10; else goto _L9
_L9:
                if (state != com.android.internal.telephony.IccCardConstants.State.ABSENT) goto _L10; else goto _L8
_L8:
                if (isShowing()) goto _L12; else goto _L11
_L11:
                KeyguardUtils.xlogD("KeyguardViewMediator", "ICC_ABSENT isn't showing, we need to show the keyguard since the device isn't provisioned yet.");
                doKeyguardLocked();
_L10:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception4;
                exception4;
                this;
                JVM INSTR monitorexit ;
                throw exception4;
_L12:
                resetStateLocked(null);
                  goto _L10
_L3:
                this;
                JVM INSTR monitorenter ;
                if (isShowing()) goto _L14; else goto _L13
_L13:
                KeyguardUtils.xlogD("KeyguardViewMediator", "INTENT_VALUE_ICC_LOCKED and keygaurd isn't showing; need to show keyguard so user can enter sim pin");
                doKeyguardLocked();
_L15:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception3;
                exception3;
                this;
                JVM INSTR monitorexit ;
                throw exception3;
_L14:
                resetStateLocked(null);
                  goto _L15
_L4:
                this;
                JVM INSTR monitorenter ;
                if (mUpdateMonitor.getRetryPukCount(0) != 0) goto _L17; else goto _L16
_L16:
                mUpdateMonitor.requestShowDialog(new InvalidDialogCallback());
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception2;
                exception2;
                this;
                JVM INSTR monitorexit ;
                throw exception2;
_L17:
                if (isShowing()) goto _L19; else goto _L18
_L18:
                KeyguardUtils.xlogD("KeyguardViewMediator", "PERM_DISABLED and keygaurd isn't showing.");
                doKeyguardLocked();
_L20:
                this;
                JVM INSTR monitorexit ;
                return;
_L19:
                KeyguardUtils.xlogD("KeyguardViewMediator", "PERM_DISABLED, resetStateLocked toshow permanently disabled message in lockscreen.");
                resetStateLocked(null);
                  goto _L20
_L5:
                this;
                JVM INSTR monitorenter ;
                if (!isShowing() || flag1) goto _L22; else goto _L21
_L21:
                resetStateLocked(null);
_L22:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception1;
                exception1;
                this;
                JVM INSTR monitorexit ;
                throw exception1;
_L6:
                this;
                JVM INSTR monitorenter ;
                if (!isShowing() || !flag1) goto _L24; else goto _L23
_L23:
                resetStateLocked(null);
_L24:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception;
                exception;
                this;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void onSimStateChangedGemini(com.android.internal.telephony.IccCardConstants.State state, int i)
            {
                KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("onSimStateChangedGemini: ").append(state).append(",simId = ").append(i).toString());
                com.android.internal.telephony.IccCardConstants.State state1 = mUpdateMonitor.getLastSimState(i);
                boolean flag1;
                if (state1 != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED && state1 != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED && state1 != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED)
                    flag1 = false;
                else
                    flag1 = true;
                switch (_cls7..SwitchMap.com.android.internal.telephony.IccCardConstants.State[state.ordinal()])
                {
                case 5: // '\005'
                default:
                    break;

                case 7: // '\007'
                    if (isShowing() && flag1)
                    {
                        resetStateLocked(null);
                        return;
                    }
                    break;

                case 6: // '\006'
                    if (isShowing() && !flag1)
                    {
                        resetStateLocked(null);
                        return;
                    }
                    break;

                case 2: // '\002'
                case 3: // '\003'
                case 4: // '\004'
                    if (mUpdateMonitor.getRetryPukCount(i) == 0)
                    {
                        mUpdateMonitor.requestShowDialog(new InvalidDialogCallback());
                        return;
                    }
                    if (com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == state && mUpdateMonitor.getSimMeLeftRetryCount(i) == 0)
                    {
                        KeyguardUtils.xlogD("KeyguardViewMediator", "SIM ME lock retrycount is 0 so SimME is not showing, only to show dialog");
                        mUpdateMonitor.requestShowDialog(new MeLockedDialogCallback());
                        return;
                    }
                    if (com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED == state && mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PIN) || com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED == state && mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PUK) || com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED == state && mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_ME))
                    {
                        KeyguardUtils.xlogD("KeyguardViewMediator", "We have dismissed locks, so, we should reset the dismiss flags");
                        mUpdateMonitor.setPINDismiss(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PIN, false);
                        mUpdateMonitor.setPINDismiss(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PUK, false);
                        mUpdateMonitor.setPINDismiss(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_ME, false);
                    }
                    if (!isShowing())
                    {
                        KeyguardUtils.xlogD("KeyguardViewMediator", "INTENT_VALUE_ICC_LOCKED and keygaurd isn't showing, we need to show the keyguard so the user can enter their sim pin");
                        doKeyguardLocked();
                        return;
                    } else
                    {
                        resetStateLocked(null);
                        return;
                    }

                case 1: // '\001'
                    if (mUpdateMonitor.isDeviceProvisioned() && (!flag1 || state != com.android.internal.telephony.IccCardConstants.State.ABSENT))
                        break;
                    if (!isShowing())
                    {
                        KeyguardUtils.xlogD("KeyguardViewMediator", "INTENT_VALUE_ICC_ABSENT and keygaurd isn't showing, we need to show the keyguard since the device isn't provisioned yet.");
                        doKeyguardLocked();
                        return;
                    } else
                    {
                        resetStateLocked(null);
                        return;
                    }
                }
            }

            public void onUserRemoved(int i)
            {
                mLockPatternUtils.removeUser(i);
            }

            public void onUserSwitched(int i)
            {
                synchronized (KeyguardViewMediator.this)
                {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean("showuserswitcher", true);
                    resetStateLocked(bundle);
                    adjustStatusBarLocked();
                    KeyguardUpdateMonitor.getInstance(mContext).setAlternateUnlockEnabled(false);
                }
                return;
                exception;
                keyguardviewmediator;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        }
;
        mViewMediatorCallback = new ViewMediatorCallback() {

            final KeyguardViewMediator this$0;

            public void keyguardDone(boolean flag1)
            {
                KeyguardViewMediator.this.keyguardDone(flag1, true);
            }

            public void keyguardDoneDrawing()
            {
                mHandler.sendEmptyMessage(10);
            }

            public void keyguardDonePending()
            {
                mKeyguardDonePending = true;
            }

            public void onUserActivityTimeoutChanged()
            {
                mKeyguardViewManager.updateUserActivityTimeout();
            }

            public void setNeedsInput(boolean flag1)
            {
                mKeyguardViewManager.setNeedsInput(flag1);
            }

            public void userActivity()
            {
                KeyguardViewMediator.this.userActivity();
            }

            public void userActivity(long l)
            {
                KeyguardViewMediator.this.userActivity(l);
            }

            public void wakeUp()
            {
                KeyguardViewMediator.this.wakeUp();
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        }
;
        mHandler = new Handler(Looper.myLooper(), null, true) {

            final KeyguardViewMediator this$0;

            private String getMessageString(Message message)
            {
                switch (message.what)
                {
                case 1001: 
                    return "MSG_DM_KEYGUARD_UPDATE";

                case 116: // 't'
                    return "RESHOW_ANYWHERE";

                case 115: // 's'
                    return "ALARM_BOOT";

                case 1000: 
                    return "KEYGUARD_RELAYOUT";

                case 14: // '\016'
                    return "SHOW_ASSISTANT";

                case 13: // '\r'
                    return "KEYGUARD_TIMEOUT";

                case 12: // '\f'
                    return "SET_HIDDEN";

                case 11: // '\013'
                    return "KEYGUARD_DONE_AUTHENTICATING";

                case 10: // '\n'
                    return "KEYGUARD_DONE_DRAWING";

                case 9: // '\t'
                    return "KEYGUARD_DONE";

                case 8: // '\b'
                    return "WAKE_WHEN_READY";

                case 7: // '\007'
                    return "NOTIFY_SCREEN_ON";

                case 6: // '\006'
                    return "NOTIFY_SCREEN_OFF";

                case 5: // '\005'
                    return "VERIFY_UNLOCK";

                case 4: // '\004'
                    return "RESET";

                case 3: // '\003'
                    return "HIDE";

                case 2: // '\002'
                    return "SHOW";
                }
                return null;
            }

            public void handleMessage(Message message)
            {
                boolean flag1;
                flag1 = true;
                KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("handleMessage enter msg name=").append(getMessageString(message)).toString());
                message.what;
                JVM INSTR lookupswitch 17: default 180
            //                           2: 209
            //                           3: 226
            //                           4: 236
            //                           5: 253
            //                           6: 263
            //                           7: 273
            //                           8: 290
            //                           9: 308
            //                           10: 335
            //                           11: 345
            //                           12: 357
            //                           13: 384
            //                           14: 428
            //                           115: 466
            //                           116: 476
            //                           1000: 438
            //                           1001: 554;
                   goto _L1 _L2 _L3 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13 _L14 _L15 _L16 _L17 _L18
_L1:
                KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("handleMessage exit msg name=").append(getMessageString(message)).toString());
                return;
_L2:
                handleShow((Bundle)message.obj);
                continue; /* Loop/switch isn't completed */
_L3:
                handleHide();
                continue; /* Loop/switch isn't completed */
_L4:
                handleReset((Bundle)message.obj);
                continue; /* Loop/switch isn't completed */
_L5:
                handleVerifyUnlock();
                continue; /* Loop/switch isn't completed */
_L6:
                handleNotifyScreenOff();
                continue; /* Loop/switch isn't completed */
_L7:
                handleNotifyScreenOn((KeyguardViewManager.ShowListener)message.obj);
                continue; /* Loop/switch isn't completed */
_L8:
                handleWakeWhenReady(message.arg1, message.arg2);
                continue; /* Loop/switch isn't completed */
_L9:
                KeyguardViewMediator keyguardviewmediator4 = KeyguardViewMediator.this;
                if (message.arg1 == 0)
                    flag1 = false;
                keyguardviewmediator4.handleKeyguardDone(flag1);
                continue; /* Loop/switch isn't completed */
_L10:
                handleKeyguardDoneDrawing();
                continue; /* Loop/switch isn't completed */
_L11:
                keyguardDone(flag1, flag1);
                continue; /* Loop/switch isn't completed */
_L12:
                KeyguardViewMediator keyguardviewmediator3 = KeyguardViewMediator.this;
                if (message.arg1 == 0)
                    flag1 = false;
                keyguardviewmediator3.handleSetHidden(flag1);
                continue; /* Loop/switch isn't completed */
_L13:
                synchronized (KeyguardViewMediator.this)
                {
                    KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguardLocked, because:KEYGUARD_TIMEOUT");
                    doKeyguardLocked((Bundle)message.obj);
                }
                continue; /* Loop/switch isn't completed */
                exception;
                keyguardviewmediator2;
                JVM INSTR monitorexit ;
                throw exception;
_L14:
                handleShowAssistant();
                continue; /* Loop/switch isn't completed */
_L17:
                KeyguardViewMediator keyguardviewmediator1 = KeyguardViewMediator.this;
                if (message.arg1 != flag1)
                    flag1 = false;
                keyguardviewmediator1.handleKeyguardReLayout(flag1);
                continue; /* Loop/switch isn't completed */
_L15:
                handleAlarmBoot();
                continue; /* Loop/switch isn't completed */
_L16:
                SystemProperties.set("sys.boot.reason", "0");
                boolean flag2 = mUpdateMonitor.dmIsLocked();
                mKeyguardViewManager.reLayoutScreen(flag2);
                handleHide();
                if (!mLockPatternUtils.isLockScreenDisabled())
                    handleShow(null);
                postDelayed(new Runnable() {

                    final _cls4 this$1;

                    public void run()
                    {
                        mContext.sendBroadcast(new Intent("android.intent.action.normal.boot.done"));
                    }

            
            {
                this$1 = _cls4.this;
                super();
            }
                }
, 4000L);
                continue; /* Loop/switch isn't completed */
_L18:
                KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                if (message.arg1 != flag1)
                    flag1 = false;
                keyguardviewmediator.handleDMKeyguardUpdate(flag1);
                if (true) goto _L1; else goto _L19
_L19:
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super(looper, callback, flag);
            }
        }
;
        mContext = context;
        mPM = (PowerManager)context.getSystemService("power");
        mUserManager = (UserManager)mContext.getSystemService("user");
        mShowKeyguardWakeLock = mPM.newWakeLock(1, "show keyguard");
        mShowKeyguardWakeLock.setReferenceCounted(false);
        mWakeAndHandOff = mPM.newWakeLock(1, "keyguardWakeAndHandOff");
        mWakeAndHandOff.setReferenceCounted(false);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD");
        intentfilter.addAction("com.mediatek.dm.LAWMO_LOCK");
        intentfilter.addAction("com.mediatek.dm.LAWMO_UNLOCK");
        intentfilter.addAction("android.intent.action.PHONE_STATE");
        intentfilter.addAction("android.intent.action.ACTION_BOOT_IPO");
        intentfilter.addAction("android.intent.action.normal.shutdown");
        intentfilter.addAction("android.intent.action.LAUNCH_POWEROFF_ALARM");
        intentfilter.addAction("android.intent.action.normal.boot");
        intentfilter.addAction("android.intent.action.ACTION_PRE_SHUTDOWN");
        mContext.registerReceiver(mBroadcastReceiver, intentfilter);
        mAlarmManager = (AlarmManager)context.getSystemService("alarm");
        mUpdateMonitor = KeyguardUpdateMonitor.getInstance(context);
        if (lockpatternutils == null)
            lockpatternutils = new LockPatternUtils(mContext);
        mLockPatternUtils = lockpatternutils;
        mLockPatternUtils.setCurrentUser(0);
        mKeyguardViewManager = new KeyguardViewManager(context, (WindowManager)context.getSystemService("window"), mViewMediatorCallback, mLockPatternUtils);
        mUserPresentIntent = new Intent("android.intent.action.USER_PRESENT");
        mUserPresentIntent.addFlags(0x28000000);
        ContentResolver contentresolver = mContext.getContentResolver();
        boolean flag;
        if (android.provider.Settings.System.getInt(contentresolver, "show_status_bar_lock", 0) == 1)
            flag = true;
        else
            flag = false;
        mShowLockIcon = flag;
        mScreenOn = mPM.isScreenOn();
        mLockSounds = new SoundPool(1, 1, 0);
        String s = android.provider.Settings.Global.getString(contentresolver, "lock_sound");
        if (s != null)
            mLockSoundId = mLockSounds.load(s, 1);
        if (s == null || mLockSoundId == 0)
            Log.w("KeyguardViewMediator", (new StringBuilder()).append("failed to load lock sound from ").append(s).toString());
        String s1 = android.provider.Settings.Global.getString(contentresolver, "unlock_sound");
        if (s1 != null)
            mUnlockSoundId = mLockSounds.load(s1, 1);
        if (s1 == null || mUnlockSoundId == 0)
            Log.w("KeyguardViewMediator", (new StringBuilder()).append("failed to load unlock sound from ").append(s1).toString());
        mLockSoundVolume = (float)Math.pow(10D, (float)context.getResources().getInteger(0x10e0005) / 20F);
        mCurrentBrightnessValues = getBrightness(20);
        (new BrightnessObserver(mHandler)).observe();
    }

    private void adjustStatusBarLocked()
    {
        if (mStatusBarManager == null)
            mStatusBarManager = (StatusBarManager)mContext.getSystemService("statusbar");
        if (mStatusBarManager == null)
        {
            KeyguardUtils.xlogD("KeyguardViewMediator", "Could not get status bar manager");
        } else
        {
            boolean flag = isSecure();
            if (mShowLockIcon)
                if (mShowing && flag)
                {
                    if (!mShowingLockIcon)
                    {
                        String s = mContext.getString(0x1040508);
                        mStatusBarManager.setIcon("secure", 0x1080559, 0, s);
                        mShowingLockIcon = true;
                    }
                } else
                if (mShowingLockIcon)
                {
                    mStatusBarManager.removeIcon("secure");
                    mShowingLockIcon = false;
                }
            boolean flag1 = isShowingAndNotHidden();
            int i = 0;
            if (flag1)
            {
                i = 0 | 0x1000000;
                if (flag)
                    i |= 0x10000;
                if (flag)
                    i |= 0x80000;
                if (!isAssistantAvailable() || KeyguardUpdateMonitor.isAlarmBoot())
                    i |= 0x2000000;
            }
            Log.d("KeyguardViewMediator", (new StringBuilder()).append("adjustStatusBarLocked: mShowing=").append(mShowing).append(" mHidden=").append(mHidden).append(" isSecure=").append(flag).append(" --> flags=0x").append(Integer.toHexString(i)).toString());
            if (!(mContext instanceof Activity))
            {
                mStatusBarManager.disable(i);
                return;
            }
        }
    }

    private void cancelDoKeyguardLaterLocked()
    {
        mDelayedShowingSequence = 1 + mDelayedShowingSequence;
    }

    private AlertDialog createDialog(String s, String s1)
    {
        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(s).setIcon(0x1080027).setCancelable(false).setMessage(s1).setNegativeButton(0x104000a, new android.content.DialogInterface.OnClickListener() {

            final KeyguardViewMediator this$0;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                mUpdateMonitor.reportDialogClose();
                KeyguardUtils.xlogD("KeyguardViewMediator", "invalid sim card ,reportCloseDialog");
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        }
).create();
        alertdialog.getWindow().setType(2008);
        return alertdialog;
    }

    private void doKeyguardLaterLocked()
    {
        ContentResolver contentresolver = mContext.getContentResolver();
        long l = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 30000);
        long l1 = android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_lock_after_timeout", 5000);
        long l2 = mLockPatternUtils.getDevicePolicyManager().getMaximumTimeToLock(null, mLockPatternUtils.getCurrentUser());
        long l3;
        if (l2 > 0L)
        {
            l = Math.max(l, 0L);
            l3 = Math.min(l2 - l, l1);
        } else
        {
            l3 = l1;
        }
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("doKeyguardLaterLocked enter displayTimeout=").append(l).append(", lockAfterTimeout=").append(l1).append(", policyTimeout=").append(l2).append(", timeout=").append(l3).toString());
        if (l3 <= 0L)
        {
            mSuppressNextLockSound = true;
            doKeyguardLocked();
            return;
        } else
        {
            long l4 = l3 + SystemClock.elapsedRealtime();
            Intent intent = new Intent("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD");
            intent.putExtra("seq", mDelayedShowingSequence);
            PendingIntent pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0x10000000);
            mAlarmManager.set(2, l4, pendingintent);
            Log.d("KeyguardViewMediator", (new StringBuilder()).append("setting alarm to turn off keyguard, seq = ").append(mDelayedShowingSequence).toString());
            return;
        }
    }

    private void doKeyguardLocked()
    {
        doKeyguardLocked(null);
    }

    private void doKeyguardLocked(Bundle bundle)
    {
        if (mExternallyEnabled && !KeyguardUpdateMonitor.isAlarmBoot())
        {
            if (mKeyguardViewManager.isShowing())
            {
                KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: not showing because it is already showing");
                return;
            }
            KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: get keyguard.no_require_sim property before");
            boolean flag;
            if (!SystemProperties.getBoolean("keyguard.no_require_sim", false))
                flag = true;
            else
                flag = false;
            KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: get keyguard.no_require_sim property after");
            boolean flag1 = mUpdateMonitor.isDeviceProvisioned();
            mUpdateMonitor.getSimState();
            boolean flag2 = false;
            int i = 0;
            do
            {
                if (i > KeyguardUtils.getMaxSimId())
                    break;
                if (!flag2 && !isLockedOrMissingGemini(i, flag))
                    flag2 = false;
                else
                    flag2 = true;
                if (flag2)
                    break;
                i++;
            } while (true);
            KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: get sim state after");
            boolean flag4;
            if (true)
            {
                flag4 = mLockPatternUtils.isLockScreenDisabled();
            } else
            {
                String s = android.provider.Settings.Secure.getString(mContext.getContentResolver(), "lockscreen.disabled");
                boolean flag3 = false;
                if (s != null)
                    if (s.equals("1"))
                        flag3 = true;
                    else
                        flag3 = false;
                if (!mLockPatternUtils.isSecure() && flag3)
                    flag4 = true;
                else
                    flag4 = false;
            }
            KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: keyguardDisable query end");
            boolean flag5 = KeyguardUpdateMonitor.getInstance(mContext).dmIsLocked();
            KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("lockedOrMissing is ").append(flag2).append(", requireSim=").append(flag).append(", provisioned=").append(flag1).append(", keyguardisable=").append(flag4).append(", dmLocked=").append(flag5).toString());
            if (!flag2 && !flag1 && !flag5)
            {
                Log.d("KeyguardViewMediator", "doKeyguard: not showing because device isn't provisioned and the sim is not locked or missing");
                return;
            }
            if (mUserManager.getUsers(true).size() < 2 && flag4 && !flag2 && !KeyguardUpdateMonitor.getInstance(mContext).dmIsLocked())
            {
                Log.d("KeyguardViewMediator", "doKeyguard: not showing because lockscreen is off");
                return;
            } else
            {
                Log.d("KeyguardViewMediator", "doKeyguard: showing the lock screen");
                showLocked(bundle);
                return;
            }
        } else
        {
            KeyguardUtils.xlogD("KeyguardViewMediator", "doKeyguard: not showing because externally disabled");
            return;
        }
    }

    private void handleAlarmBoot()
    {
        if (mShowing)
            handleHide();
        if (mIsIPOBoot)
            mIsIPOBoot = false;
        showLocked(null);
    }

    private void handleDMKeyguardUpdate(boolean flag)
    {
        Log.d("KeyguardViewMediator", (new StringBuilder()).append("handleDMKeyguardUpdate lock=").append(flag).toString());
        if (!isShowing())
        {
            KeyguardUtils.xlogD("KeyguardViewMediator", "INTENT_VALUE_ICC_LOCKED and keygaurd isn't showing; need to show keyguard so user can enter sim pin");
            doKeyguardLocked();
        } else
        {
            Bundle bundle = new Bundle();
            bundle.putBoolean("dmlock_reset", true);
            resetStateLocked(bundle);
        }
        handleDisableSystemUIForDM(flag);
    }

    private void handleDisableSystemUIForDM(boolean flag)
    {
        Message message = mHandler.obtainMessage(1000);
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
    }

    private void handleHide()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleHide");
        if (!mWakeAndHandOff.isHeld())
            break MISSING_BLOCK_LABEL_31;
        KeyguardUtils.xlogD("KeyguardViewMediator", "attempt to hide the keyguard while waking, ignored");
        this;
        JVM INSTR monitorexit ;
        return;
        if (mShowing)
            break MISSING_BLOCK_LABEL_45;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState) && !KeyguardUpdateMonitor.isAlarmBoot() && mScreenOn)
            playSounds(false);
        mKeyguardViewManager.hide();
        mShowing = false;
        mKeyguardDonePending = false;
        updateActivityLockScreenState();
        adjustStatusBarLocked();
        setBrightness(mCurrentBrightnessValues);
        this;
        JVM INSTR monitorexit ;
    }

    private void handleKeyguardDone(boolean flag)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("handleKeyguardDone, wakeup=").append(flag).toString());
        handleHide();
        if (flag)
            wakeUp();
        sendUserPresentBroadcast();
    }

    private void handleKeyguardDoneDrawing()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleKeyguardDoneDrawing");
        if (!mWaitingUntilKeyguardVisible) goto _L2; else goto _L1
_L1:
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleKeyguardDoneDrawing: notifying mWaitingUntilKeyguardVisible");
        mWaitingUntilKeyguardVisible = false;
        notifyAll();
        mHandler.removeMessages(10);
_L4:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (mContext != null && ActivityManagerNative.isSystemReady())
            mContext.sendBroadcast(new Intent("android.intent.action.SEND"), "com.android.internal.policy.impl.KeyguardViewMediator.DONE_DRAW");
        if (true) goto _L4; else goto _L3
_L3:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleKeyguardReLayout(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("handleKeyguardReLayout dmLock=").append(flag).toString());
        mKeyguardViewManager.reLayoutScreen(flag);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleNotifyScreenOff()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleNotifyScreenOff");
        mKeyguardViewManager.onScreenTurnedOff();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleNotifyScreenOn(KeyguardViewManager.ShowListener showlistener)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleNotifyScreenOn");
        mKeyguardViewManager.onScreenTurnedOn(showlistener);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleReset(Bundle bundle)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleReset");
        mKeyguardViewManager.reset(bundle);
        adjustStatusBarLocked();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleSetHidden(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        if (mHidden != flag)
        {
            mHidden = flag;
            updateActivityLockScreenState();
            adjustStatusBarLocked();
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

    private void handleShow(Bundle bundle)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleShow enter");
        if (mSystemReady)
            break MISSING_BLOCK_LABEL_20;
        this;
        JVM INSTR monitorexit ;
        return;
        if (!mShowing)
            break MISSING_BLOCK_LABEL_34;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mKeyguardViewManager.show(bundle);
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleShow mKeyguardViewManager Show exit");
        mShowing = true;
        mKeyguardDonePending = false;
        updateActivityLockScreenState();
        adjustStatusBarLocked();
        userActivity();
        try
        {
            ActivityManagerNative.getDefault().closeSystemDialogs("lock");
        }
        catch (RemoteException remoteexception) { }
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleShow query AlarmBoot before");
        if (KeyguardUpdateMonitor.isAlarmBoot())
            break MISSING_BLOCK_LABEL_119;
        playSounds(true);
_L2:
        mShowKeyguardWakeLock.release();
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleShow exit");
        this;
        JVM INSTR monitorexit ;
        return;
        (new Handler()).postDelayed(new Runnable() {

            final KeyguardViewMediator this$0;

            public void run()
            {
                sendRemoveIPOWinBroadcast();
                startAlarm();
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super();
            }
        }
, 250L);
        if (true) goto _L2; else goto _L1
_L1:
    }

    private void handleVerifyUnlock()
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", "handleVerifyUnlock");
        mKeyguardViewManager.verifyUnlock();
        mShowing = true;
        updateActivityLockScreenState();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleWakeWhenReady(int i, int j)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append(">>>handleWakeWhenReady(").append(i).append(") Before--synchronized (KeyguardViewMediator.this) wakeMSGId = ").append(j).toString());
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("handleWakeWhenReady(").append(i).append(") wakeMSGId = ").append(j).toString());
        if (!mKeyguardViewManager.wakeWhenReadyTq(i))
        {
            KeyguardUtils.xlogD("KeyguardViewMediator", "mKeyguardViewManager.wakeWhenReadyTq did not poke wake lock, so poke it ourselves");
            userActivity();
        }
        mWakeAndHandOff.release();
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("<<<handleWakeWhenReady(").append(i).append(") wakeMSGId = ").append(j).toString());
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void hideLocked()
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", "hideLocked");
        Message message = mHandler.obtainMessage(3);
        mHandler.sendMessage(message);
    }

    private boolean isAssistantAvailable()
    {
        return mSearchManager != null && mSearchManager.getAssistIntent(mContext, -2) != null;
    }

    public static boolean isKeyguardEnabled()
    {
        return mExternallyEnabled;
    }

    public static boolean isKeyguardNotShowing()
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append(" mExternallyEnabled=").append(mExternallyEnabled).append(" mShowing=").append(mShowing).toString());
        return mExternallyEnabled && !mShowing;
    }

    public static boolean isKeyguardShowingAndNotHidden()
    {
        return mShowing && !mHidden;
    }

    private boolean isLockedOrMissingGemini(int i, boolean flag)
    {
        boolean flag1;
label0:
        {
            KeyguardUpdateMonitor keyguardupdatemonitor = mUpdateMonitor;
            flag1 = false;
            if (keyguardupdatemonitor == null)
                break label0;
            boolean flag2 = KeyguardUtils.isValidSimId(i);
            flag1 = false;
            if (!flag2)
                break label0;
            com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState(i);
            if ((state != com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED || mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PIN)) && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_PUK)) && (state != com.android.internal.telephony.IccCardConstants.State.NETWORK_LOCKED || mUpdateMonitor.getPINDismissFlag(i, KeyguardUpdateMonitor.SimLockType.SIM_LOCK_ME)))
            {
                com.android.internal.telephony.IccCardConstants.State state1 = com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED;
                flag1 = false;
                if (state != state1)
                    break label0;
                flag1 = false;
                if (!flag)
                    break label0;
            }
            flag1 = true;
        }
        return flag1;
    }

    private void maybeSendUserPresentBroadcast()
    {
        if (mSystemReady && mLockPatternUtils.isLockScreenDisabled() && mUserManager.getUsers(true).size() == 1)
            sendUserPresentBroadcast();
    }

    private void notifyScreenOffLocked()
    {
        Log.d("KeyguardViewMediator", "notifyScreenOffLocked");
        mHandler.sendEmptyMessage(6);
    }

    private void notifyScreenOnLocked(KeyguardViewManager.ShowListener showlistener)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", "notifyScreenOnLocked");
        Message message = mHandler.obtainMessage(7, showlistener);
        mHandler.sendMessage(message);
    }

    private void playSounds(boolean flag)
    {
label0:
        {
            Log.d("KeyguardViewMediator", (new StringBuilder()).append("playSounds mSuppressNextLockSound =").append(mSuppressNextLockSound).toString());
            if (mSuppressNextLockSound)
            {
                mSuppressNextLockSound = false;
                break label0;
            }
            if (android.provider.Settings.System.getInt(mContext.getContentResolver(), "lockscreen_sounds_enabled", 1) != 1)
                break label0;
            int i;
            if (flag)
                i = mLockSoundId;
            else
                i = mUnlockSoundId;
            mLockSounds.stop(mLockSoundStreamId);
            if (mAudioManager == null)
            {
                mAudioManager = (AudioManager)mContext.getSystemService("audio");
                if (mAudioManager == null)
                    break label0;
                mMasterStreamType = mAudioManager.getMasterStreamType();
            }
            if (!mAudioManager.isStreamMute(mMasterStreamType))
            {
                mLockSoundStreamId = mLockSounds.play(i, mLockSoundVolume, mLockSoundVolume, 1, 0, 1.0F);
                return;
            }
        }
    }

    private void resetStateLocked(Bundle bundle)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", "resetStateLocked");
        Message message = mHandler.obtainMessage(4, bundle);
        mHandler.sendMessage(message);
    }

    private void sendRemoveIPOWinBroadcast()
    {
        Log.w("KeyguardViewMediator", "sendRemoveIPOWinBroadcast ... ");
        Intent intent = new Intent("alarm.boot.remove.ipowin");
        mContext.sendBroadcast(intent);
    }

    private void sendUserPresentBroadcast()
    {
        if (!(mContext instanceof Activity) && ActivityManagerNative.isSystemReady())
        {
            UserHandle userhandle = new UserHandle(mLockPatternUtils.getCurrentUser());
            mContext.sendBroadcastAsUser(mUserPresentIntent, userhandle);
        }
    }

    private void showLocked(Bundle bundle)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", "showLocked");
        mShowKeyguardWakeLock.acquire();
        Message message = mHandler.obtainMessage(2, bundle);
        mHandler.sendMessage(message);
    }

    private void startAlarm()
    {
        Intent intent = new Intent("com.android.deskclock.ALARM_ALERT");
        intent.putExtra("isAlarmBoot", true);
        mContext.startService(intent);
    }

    private void updateActivityLockScreenState()
    {
        IActivityManager iactivitymanager = ActivityManagerNative.getDefault();
        boolean flag;
        if (mShowing && !mHidden)
            flag = true;
        else
            flag = false;
        try
        {
            iactivitymanager.setLockScreenShown(flag);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    private void verifyUnlockLocked()
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", "verifyUnlockLocked");
        mHandler.sendEmptyMessage(5);
    }

    private void wakeWhenReady(int i)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("wakeWhenReady(").append(i).append(")").toString());
        mWakeAndHandOff.acquire();
        sWakeMSGId = 1 + sWakeMSGId;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("<<<wakeWhenReadyLocked(").append(i).append(") Before--Send Message WAKE_WHEN_READY sWakeMSGId = ").append(sWakeMSGId).toString());
        Message message = mHandler.obtainMessage(8, i, sWakeMSGId);
        mHandler.sendMessage(message);
    }

    public void dismiss()
    {
        if (mShowing && !mHidden)
            mKeyguardViewManager.dismiss();
    }

    public boolean dmCheckLocked()
    {
        return mUpdateMonitor.dmIsLocked();
    }

    public void doKeyguardTimeout(Bundle bundle)
    {
        mHandler.removeMessages(13);
        Message message = mHandler.obtainMessage(13, bundle);
        mHandler.sendMessage(message);
    }

    public int getBrightness(int i)
    {
        int j;
        try
        {
            j = android.provider.Settings.System.getInt(mContext.getContentResolver(), "screen_brightness");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            Log.d("KeyguardViewMediator", "SettingNotFoundException");
            return i;
        }
        return j;
    }

    public void handleShowAssistant()
    {
        mKeyguardViewManager.showAssistant();
    }

    public boolean isAlarmUnlockScreen()
    {
        return mKeyguardViewManager.isAlarmUnlockScreen();
    }

    public boolean isDismissable()
    {
        return mKeyguardDonePending || !isSecure();
    }

    public boolean isInputRestricted()
    {
        return mShowing || mNeedToReshowWhenReenabled || !mUpdateMonitor.isDeviceProvisioned();
    }

    public boolean isSecure()
    {
        return mLockPatternUtils.isSecure() || KeyguardUpdateMonitor.getInstance(mContext).isSimPinSecure();
    }

    public boolean isShowing()
    {
        return mShowing;
    }

    public boolean isShowingAndNotHidden()
    {
        return mShowing && !mHidden;
    }

    public void keyguardDone(boolean flag, boolean flag1)
    {
        int i = 1;
        mKeyguardDonePending = false;
        this;
        JVM INSTR monitorenter ;
        Message message;
        EventLog.writeEvent(0x11170, 2);
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("keyguardDone(").append(flag).append(")").toString());
        message = mHandler.obtainMessage(9);
        Exception exception;
        if (!flag1)
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
        if (!flag)
            break MISSING_BLOCK_LABEL_90;
        mUpdateMonitor.clearFailedUnlockAttempts();
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_125;
        mExitSecureCallback.onKeyguardExitResult(flag);
        mExitSecureCallback = null;
        if (!flag)
            break MISSING_BLOCK_LABEL_125;
        mExternallyEnabled = true;
        mNeedToReshowWhenReenabled = false;
        this;
        JVM INSTR monitorexit ;
        return;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onDreamingStarted()
    {
        this;
        JVM INSTR monitorenter ;
        if (mScreenOn && mLockPatternUtils.isSecure())
            doKeyguardLaterLocked();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onDreamingStopped()
    {
        this;
        JVM INSTR monitorenter ;
        if (mScreenOn)
            cancelDoKeyguardLaterLocked();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onScreenTurnedOff(int i)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append(">>>onScreenTurnedOff(").append(i).append(") ---ScreenOff Before--synchronized (this)").toString());
        this;
        JVM INSTR monitorenter ;
        mScreenOn = false;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("onScreenTurnedOff(").append(i).append(") ---ScreenOff mScreenOn = false; Before--boolean lockImmediately").toString());
        mKeyguardDonePending = false;
        if (mLockPatternUtils.getPowerButtonInstantlyLocks()) goto _L2; else goto _L1
_L1:
        boolean flag2 = mLockPatternUtils.isSecure();
        boolean flag = false;
        if (flag2) goto _L3; else goto _L2
_L3:
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("onScreenTurnedOff(").append(i).append(") ---ScreenOff mScreenOn = false; After--boolean lockImmediately=").append(flag).append(", mExitSecureCallback=").append(mExitSecureCallback).append(", mShowing=").append(mShowing).toString());
        if (mExitSecureCallback == null) goto _L5; else goto _L4
_L4:
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("onScreenTurnedOff(").append(i).append(") ---ScreenOff pending exit secure callback cancelled ---ScreenOff").toString());
        mExitSecureCallback.onKeyguardExitResult(false);
        mExitSecureCallback = null;
        if (!mExternallyEnabled)
            hideLocked();
_L6:
        this;
        JVM INSTR monitorexit ;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("<<<onScreenTurnedOff(").append(i).append(") ---ScreenOff After--synchronized (this)").toString());
        return;
_L5:
        boolean flag1;
        if (!mShowing)
            break MISSING_BLOCK_LABEL_339;
        flag1 = ActivityManagerNative.isSystemReady();
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("on screen turned off, we should show keyguard immediately, because it doesn't destroyed, isReady=").append(flag1).toString());
        if (!flag1)
            break MISSING_BLOCK_LABEL_322;
        mContext.sendBroadcast(new Intent("android.intent.action.SEND"), "com.android.internal.policy.impl.KeyguardViewMediator.DONE_DRAW");
        notifyScreenOffLocked();
        resetStateLocked(null);
          goto _L6
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (i != 3 && (i != 2 || flag)) goto _L8; else goto _L7
_L7:
        doKeyguardLaterLocked();
          goto _L6
_L8:
        if (i == 4) goto _L6; else goto _L9
_L9:
        doKeyguardLocked();
          goto _L6
_L2:
        flag = true;
        if (true) goto _L3; else goto _L10
_L10:
    }

    public void onScreenTurnedOn(KeyguardViewManager.ShowListener showlistener)
    {
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append(">>>onScreenTurnedOn, ---ScreenOn seq = ").append(mDelayedShowingSequence).append("seq will be change in synchronized Before--synchronized (this)").toString());
        this;
        JVM INSTR monitorenter ;
        mScreenOn = true;
        Log.d("KeyguardViewMediator", (new StringBuilder()).append("onScreenTurnedOn mShowing=").append(mShowing).append(" mPhoneStateValues=").append(mPhoneStateValues).toString());
        if (!mShowing) goto _L2; else goto _L1
_L1:
        if (mPhoneStateValues != 0) goto _L4; else goto _L3
_L3:
        setBrightness(255);
_L2:
        cancelDoKeyguardLaterLocked();
        Log.d("KeyguardViewMediator", (new StringBuilder()).append("onScreenTurnedOn, seq = ").append(mDelayedShowingSequence).toString());
        if (showlistener == null)
            break MISSING_BLOCK_LABEL_142;
        notifyScreenOnLocked(showlistener);
        this;
        JVM INSTR monitorexit ;
        maybeSendUserPresentBroadcast();
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("<<<onScreenTurnedOn, ---ScreenOn seq = ").append(mDelayedShowingSequence).toString());
        return;
_L4:
        if (mPhoneStateValues != 1 && mPhoneStateValues != 2) goto _L2; else goto _L5
_L5:
        setBrightness(mCurrentBrightnessValues);
          goto _L2
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onSystemReady()
    {
        mSearchManager = (SearchManager)mContext.getSystemService("search");
        this;
        JVM INSTR monitorenter ;
        Log.d("KeyguardViewMediator", "onSystemReady");
        mSystemReady = true;
        mUpdateMonitor.registerCallback(mUpdateCallback);
        if ((!mLockPatternUtils.usingBiometricWeak() || !mLockPatternUtils.isBiometricWeakInstalled()) && !mLockPatternUtils.usingVoiceWeak())
            break MISSING_BLOCK_LABEL_108;
        Log.d("KeyguardViewMediator", "suppressing biometric unlock during boot");
        mUpdateMonitor.setAlternateUnlockEnabled(false);
_L1:
        if (!KeyguardUpdateMonitor.isAlarmBoot())
            doKeyguardLocked();
        this;
        JVM INSTR monitorexit ;
        maybeSendUserPresentBroadcast();
        return;
        mUpdateMonitor.setAlternateUnlockEnabled(true);
          goto _L1
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onWakeKeyWhenKeyguardShowingTq(int i)
    {
        Log.d("KeyguardViewMediator", (new StringBuilder()).append("onWakeKeyWhenKeyguardShowing(").append(i).append(")").toString());
        wakeWhenReady(i);
    }

    public void onWakeMotionWhenKeyguardShowingTq()
    {
        Log.d("KeyguardViewMediator", "onWakeMotionWhenKeyguardShowing()");
        wakeWhenReady(0);
    }

    public void setBrightness(int i)
    {
        IPowerManager ipowermanager = android.os.IPowerManager.Stub.asInterface(ServiceManager.getService("power"));
        if (ipowermanager == null)
            break MISSING_BLOCK_LABEL_39;
        if (ipowermanager.isScreenOn())
        {
            ipowermanager.setTemporaryScreenBrightnessSettingOverride(i);
            return;
        }
        try
        {
            ipowermanager.setTemporaryScreenBrightnessSettingOverride(-1);
            return;
        }
        catch (RemoteException remoteexception) { }
    }

    public void setCurrentUser(int i)
    {
        mLockPatternUtils.setCurrentUser(i);
    }

    public void setDebugFilterStatus(boolean flag)
    {
    }

    public void setHidden(boolean flag)
    {
        int i = 1;
        Log.d("KeyguardViewMediator", (new StringBuilder()).append("setHidden ").append(flag).toString());
        KeyguardUpdateMonitor keyguardupdatemonitor = mUpdateMonitor;
        boolean flag1;
        if (!flag)
            flag1 = i;
        else
            flag1 = false;
        keyguardupdatemonitor.sendKeyguardVisibilityChanged(flag1);
        mHandler.removeMessages(12);
        Handler handler = mHandler;
        if (!flag)
            i = 0;
        Message message = handler.obtainMessage(12, i, 0);
        mHandler.sendMessage(message);
    }

    public void setKeyguardEnabled(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        KeyguardUtils.xlogD("KeyguardViewMediator", (new StringBuilder()).append("setKeyguardEnabled(").append(flag).append(")").toString());
        mExternallyEnabled = flag;
        if (flag) goto _L2; else goto _L1
_L1:
        if (!mShowing) goto _L2; else goto _L3
_L3:
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_66;
        Log.d("KeyguardViewMediator", "in process of verifyUnlock request, ignoring");
        this;
        JVM INSTR monitorexit ;
        return;
        Log.d("KeyguardViewMediator", "remembering to reshow, hiding keyguard, disabling status bar expansion");
        mNeedToReshowWhenReenabled = true;
        hideLocked();
_L5:
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
_L2:
        if (!flag) goto _L5; else goto _L4
_L4:
        if (!mNeedToReshowWhenReenabled) goto _L5; else goto _L6
_L6:
        Log.d("KeyguardViewMediator", "previously hidden, reshowing, reenabling status bar expansion");
        mNeedToReshowWhenReenabled = false;
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_156;
        Log.d("KeyguardViewMediator", "onKeyguardExitResult(false), resetting");
        mExitSecureCallback.onKeyguardExitResult(false);
        mExitSecureCallback = null;
        resetStateLocked(null);
          goto _L5
        showLocked(null);
        mWaitingUntilKeyguardVisible = true;
        mHandler.sendEmptyMessageDelayed(10, 2000L);
        Log.d("KeyguardViewMediator", "waiting until mWaitingUntilKeyguardVisible is false");
_L7:
        boolean flag1 = mWaitingUntilKeyguardVisible;
        if (!flag1)
            break MISSING_BLOCK_LABEL_217;
        wait();
          goto _L7
        InterruptedException interruptedexception;
        interruptedexception;
        Thread.currentThread().interrupt();
          goto _L7
        Log.d("KeyguardViewMediator", "done waiting for mWaitingUntilKeyguardVisible");
          goto _L5
    }

    public void showAssistant()
    {
        Message message = mHandler.obtainMessage(14);
        mHandler.sendMessage(message);
    }

    public void userActivity()
    {
        userActivity(10000L);
    }

    public void userActivity(long l)
    {
        mPM.userActivity(SystemClock.uptimeMillis(), false);
    }

    public void verifyUnlock(android.view.WindowManagerPolicy.OnKeyguardExitResult onkeyguardexitresult)
    {
        this;
        JVM INSTR monitorenter ;
        Log.d("KeyguardViewMediator", "verifyUnlock");
        if (mUpdateMonitor.isDeviceProvisioned()) goto _L2; else goto _L1
_L1:
        Log.d("KeyguardViewMediator", "ignoring because device isn't provisioned");
        onkeyguardexitresult.onKeyguardExitResult(false);
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!mExternallyEnabled)
            break MISSING_BLOCK_LABEL_70;
        Log.w("KeyguardViewMediator", "verifyUnlock called when not externally disabled");
        onkeyguardexitresult.onKeyguardExitResult(false);
          goto _L3
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
label0:
        {
            if (mExitSecureCallback == null)
                break label0;
            onkeyguardexitresult.onKeyguardExitResult(false);
        }
          goto _L3
        mExitSecureCallback = onkeyguardexitresult;
        verifyUnlockLocked();
          goto _L3
    }

    public void wakeUp()
    {
        mPM.wakeUp(SystemClock.uptimeMillis());
    }







/*
    static boolean access$1302(KeyguardViewMediator keyguardviewmediator, boolean flag)
    {
        keyguardviewmediator.mKeyguardDonePending = flag;
        return flag;
    }

*/



/*
    static boolean access$1502(KeyguardViewMediator keyguardviewmediator, boolean flag)
    {
        keyguardviewmediator.mSuppressNextLockSound = flag;
        return flag;
    }

*/


/*
    static boolean access$1602(KeyguardViewMediator keyguardviewmediator, boolean flag)
    {
        keyguardviewmediator.mIsIPOBoot = flag;
        return flag;
    }

*/



/*
    static int access$1802(int i)
    {
        mPhoneStateValues = i;
        return i;
    }

*/





/*
    static int access$2002(int i)
    {
        mCurrentBrightnessValues = i;
        return i;
    }

*/
























}
