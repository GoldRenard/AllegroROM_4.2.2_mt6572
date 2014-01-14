// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.res.Resources;
import android.media.AudioManager;
import android.media.SoundPool;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.EventLog;
import android.util.Log;
import android.view.WindowManager;
import com.android.internal.policy.impl.PhoneWindowManager;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardViewCallback, KeyguardUpdateMonitor, LockPatternKeyguardViewProperties, KeyguardViewManager, 
//            KeyguardViewProperties, KeyguardUpdateMonitorCallback

public class KeyguardViewMediator
    implements KeyguardViewCallback
{

    protected static final int AWAKE_INTERVAL_DEFAULT_MS = 10000;
    private static final boolean DBG_WAKE = false;
    private static final boolean DEBUG = false;
    private static final String DELAYED_KEYGUARD_ACTION = "com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD";
    private static final boolean ENABLE_INSECURE_STATUS_BAR_EXPAND = true;
    private static final int HIDE = 3;
    private static final int KEYGUARD_DISPLAY_TIMEOUT_DELAY_DEFAULT = 30000;
    private static final int KEYGUARD_DONE = 9;
    private static final int KEYGUARD_DONE_AUTHENTICATING = 11;
    private static final int KEYGUARD_DONE_DRAWING = 10;
    private static final int KEYGUARD_DONE_DRAWING_TIMEOUT_MS = 2000;
    private static final int KEYGUARD_LOCK_AFTER_DELAY_DEFAULT = 5000;
    private static final int KEYGUARD_TIMEOUT = 13;
    private static final int NOTIFY_SCREEN_OFF = 6;
    private static final int NOTIFY_SCREEN_ON = 7;
    private static final int RESET = 4;
    private static final int SET_HIDDEN = 12;
    private static final int SHOW = 2;
    private static final String TAG = "KeyguardViewMediator";
    private static final int TIMEOUT = 1;
    private static final int VERIFY_UNLOCK = 5;
    private static final int WAKE_WHEN_READY = 8;
    private AlarmManager mAlarmManager;
    private AudioManager mAudioManager;
    private final BroadcastReceiver mBroadcastReceiver = new BroadcastReceiver() {

        final KeyguardViewMediator this$0;

        public void onReceive(Context context1, Intent intent)
        {
            if ("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD".equals(intent.getAction()))
            {
                int i = intent.getIntExtra("seq", 0);
                synchronized (KeyguardViewMediator.this)
                {
                    if (mDelayedShowingSequence == i)
                    {
                        mSuppressNextLockSound = true;
                        doKeyguardLocked();
                    }
                }
                return;
            } else
            {
                return;
            }
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
    private PhoneWindowManager mCallback;
    private Context mContext;
    private int mDelayedShowingSequence;
    private android.view.WindowManagerPolicy.OnKeyguardExitResult mExitSecureCallback;
    private boolean mExternallyEnabled;
    private Handler mHandler;
    private boolean mHidden;
    private KeyguardViewManager mKeyguardViewManager;
    private KeyguardViewProperties mKeyguardViewProperties;
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
    private android.os.PowerManager.WakeLock mShowKeyguardWakeLock;
    private boolean mShowLockIcon;
    private boolean mShowing;
    private boolean mShowingLockIcon;
    private StatusBarManager mStatusBarManager;
    private boolean mSuppressNextLockSound;
    private boolean mSystemReady;
    private int mUnlockSoundId;
    KeyguardUpdateMonitorCallback mUpdateCallback;
    private KeyguardUpdateMonitor mUpdateMonitor;
    private Intent mUserPresentIntent;
    private boolean mWaitingUntilKeyguardVisible;
    private android.os.PowerManager.WakeLock mWakeAndHandOff;
    private android.os.PowerManager.WakeLock mWakeLock;
    private int mWakelockSequence;

    public KeyguardViewMediator(Context context, PhoneWindowManager phonewindowmanager)
    {
        mSuppressNextLockSound = true;
        mExternallyEnabled = true;
        mNeedToReshowWhenReenabled = false;
        mShowing = false;
        mHidden = false;
        mPhoneState = TelephonyManager.EXTRA_STATE_IDLE;
        mWaitingUntilKeyguardVisible = false;
        mUpdateCallback = new KeyguardUpdateMonitorCallback() {

            final KeyguardViewMediator this$0;

            public void onClockVisibilityChanged()
            {
                adjustStatusBarLocked();
            }

            public void onDeviceProvisioned()
            {
                mContext.sendBroadcastAsUser(mUserPresentIntent, UserHandle.ALL);
            }

            void onPhoneStateChanged(int i)
            {
                KeyguardViewMediator keyguardviewmediator = KeyguardViewMediator.this;
                keyguardviewmediator;
                JVM INSTR monitorenter ;
                if (i != 0)
                    break MISSING_BLOCK_LABEL_38;
                if (!mScreenOn && mExternallyEnabled)
                    doKeyguardLocked();
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
                static class _cls4
                {

                    static final int $SwitchMap$com$android$internal$telephony$IccCardConstants$State[];

                    static 
                    {
                        $SwitchMap$com$android$internal$telephony$IccCardConstants$State = new int[com.android.internal.telephony.IccCardConstants.State.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.NOT_READY.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.ABSENT.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$IccCardConstants$State[com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED.ordinal()] = 4;
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
                        catch (NoSuchFieldError nosuchfielderror5)
                        {
                            return;
                        }
                    }
                }

                _cls4..SwitchMap.com.android.internal.telephony.IccCardConstants.State[state.ordinal()];
                JVM INSTR tableswitch 1 6: default 48
            //                           1 49
            //                           2 49
            //                           3 101
            //                           4 101
            //                           5 140
            //                           6 177;
                   goto _L1 _L2 _L2 _L3 _L3 _L4 _L5
_L1:
                return;
_L2:
                this;
                JVM INSTR monitorenter ;
                if (mUpdateMonitor.isDeviceProvisioned()) goto _L7; else goto _L6
_L6:
                if (isShowing()) goto _L9; else goto _L8
_L8:
                doKeyguardLocked();
_L7:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception3;
                exception3;
                this;
                JVM INSTR monitorexit ;
                throw exception3;
_L9:
                resetStateLocked();
                  goto _L7
_L3:
                this;
                JVM INSTR monitorenter ;
                if (isShowing()) goto _L11; else goto _L10
_L10:
                doKeyguardLocked();
_L12:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception2;
                exception2;
                this;
                JVM INSTR monitorexit ;
                throw exception2;
_L11:
                resetStateLocked();
                  goto _L12
_L4:
                this;
                JVM INSTR monitorenter ;
                if (isShowing()) goto _L14; else goto _L13
_L13:
                doKeyguardLocked();
_L15:
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception1;
                exception1;
                this;
                JVM INSTR monitorexit ;
                throw exception1;
_L14:
                resetStateLocked();
                  goto _L15
_L5:
                this;
                JVM INSTR monitorenter ;
                if (isShowing())
                    resetStateLocked();
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception;
                exception;
                this;
                JVM INSTR monitorexit ;
                throw exception;
            }

            public void onUserRemoved(int i)
            {
                mLockPatternUtils.removeUser(i);
            }

            public void onUserSwitched(int i)
            {
                mLockPatternUtils.setCurrentUser(i);
                synchronized (KeyguardViewMediator.this)
                {
                    resetStateLocked();
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
        mHandler = new Handler(true) {

            final KeyguardViewMediator this$0;

            public void handleMessage(Message message)
            {
                KeyguardViewMediator keyguardviewmediator;
                boolean flag1 = true;
                switch (message.what)
                {
                default:
                    return;

                case 1: // '\001'
                    handleTimeout(message.arg1);
                    return;

                case 2: // '\002'
                    handleShow();
                    return;

                case 3: // '\003'
                    handleHide();
                    return;

                case 4: // '\004'
                    handleReset();
                    return;

                case 5: // '\005'
                    handleVerifyUnlock();
                    return;

                case 6: // '\006'
                    handleNotifyScreenOff();
                    return;

                case 7: // '\007'
                    handleNotifyScreenOn((KeyguardViewManager.ShowListener)message.obj);
                    return;

                case 8: // '\b'
                    handleWakeWhenReady(message.arg1);
                    return;

                case 9: // '\t'
                    KeyguardViewMediator keyguardviewmediator2 = KeyguardViewMediator.this;
                    if (message.arg1 == 0)
                        flag1 = false;
                    keyguardviewmediator2.handleKeyguardDone(flag1);
                    return;

                case 10: // '\n'
                    handleKeyguardDoneDrawing();
                    return;

                case 11: // '\013'
                    keyguardDone(flag1);
                    return;

                case 12: // '\f'
                    KeyguardViewMediator keyguardviewmediator1 = KeyguardViewMediator.this;
                    if (message.arg1 == 0)
                        flag1 = false;
                    keyguardviewmediator1.handleSetHidden(flag1);
                    return;

                case 13: // '\r'
                    keyguardviewmediator = KeyguardViewMediator.this;
                    break;
                }
                keyguardviewmediator;
                JVM INSTR monitorenter ;
                doKeyguardLocked();
                keyguardviewmediator;
                JVM INSTR monitorexit ;
                return;
                Exception exception;
                exception;
                keyguardviewmediator;
                JVM INSTR monitorexit ;
                throw exception;
            }

            
            {
                this$0 = KeyguardViewMediator.this;
                super(flag);
            }
        }
;
        mContext = context;
        mCallback = phonewindowmanager;
        mPM = (PowerManager)context.getSystemService("power");
        mWakeLock = mPM.newWakeLock(0x1000001a, "keyguard");
        mWakeLock.setReferenceCounted(false);
        mShowKeyguardWakeLock = mPM.newWakeLock(1, "show keyguard");
        mShowKeyguardWakeLock.setReferenceCounted(false);
        mWakeAndHandOff = mPM.newWakeLock(1, "keyguardWakeAndHandOff");
        mWakeAndHandOff.setReferenceCounted(false);
        mContext.registerReceiver(mBroadcastReceiver, new IntentFilter("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD"));
        mAlarmManager = (AlarmManager)context.getSystemService("alarm");
        mUpdateMonitor = new KeyguardUpdateMonitor(context);
        mLockPatternUtils = new LockPatternUtils(mContext);
        mKeyguardViewProperties = new LockPatternKeyguardViewProperties(mLockPatternUtils, mUpdateMonitor);
        mKeyguardViewManager = new KeyguardViewManager(context, (WindowManager)context.getSystemService("window"), this, mKeyguardViewProperties, mUpdateMonitor);
        mUserPresentIntent = new Intent("android.intent.action.USER_PRESENT");
        mUserPresentIntent.addFlags(0x28000000);
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
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
        if (s != null)
            if (mLockSoundId != 0);
        String s1 = android.provider.Settings.Global.getString(contentresolver, "unlock_sound");
        if (s1 != null)
            mUnlockSoundId = mLockSounds.load(s1, 1);
        if (s1 != null)
            if (mUnlockSoundId != 0);
        mLockSoundVolume = (float)Math.pow(10D, (float)context.getResources().getInteger(0x10e0005) / 20F);
    }

    private void adjustStatusBarLocked()
    {
        if (mStatusBarManager == null)
            mStatusBarManager = (StatusBarManager)mContext.getSystemService("statusbar");
        if (mStatusBarManager == null)
        {
            Log.w("KeyguardViewMediator", "Could not get status bar manager");
            return;
        }
        if (mShowLockIcon)
            if (mShowing && isSecure())
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
        boolean flag = mShowing;
        int i = 0;
        if (flag)
        {
            i = 0 | 0x1000000;
            if (isSecure())
                i |= 0x10000;
            if (isSecure())
                i |= 0x80000;
        }
        mStatusBarManager.disable(i);
    }

    private void adjustUserActivityLocked()
    {
        boolean flag;
        if (mShowing && !mHidden)
            flag = false;
        else
            flag = true;
        if (!flag && mScreenOn)
            pokeWakelock();
    }

    private void doKeyguardLocked()
    {
        if (mExternallyEnabled && !mKeyguardViewManager.isShowing())
        {
            boolean flag;
            if (!SystemProperties.getBoolean("keyguard.no_require_sim", false))
                flag = true;
            else
                flag = false;
            boolean flag1 = mUpdateMonitor.isDeviceProvisioned();
            com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState();
            boolean flag2;
            if (!state.isPinLocked() && (state != com.android.internal.telephony.IccCardConstants.State.ABSENT && state != com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED || !flag))
                flag2 = false;
            else
                flag2 = true;
            if ((flag2 || flag1) && (!mLockPatternUtils.isLockScreenDisabled() || flag2))
            {
                showLocked();
                return;
            }
        }
    }

    private void handleHide()
    {
        this;
        JVM INSTR monitorenter ;
        if (!mWakeAndHandOff.isHeld())
            break MISSING_BLOCK_LABEL_24;
        Log.w("KeyguardViewMediator", "attempt to hide the keyguard while waking, ignored");
        this;
        JVM INSTR monitorexit ;
        return;
        if (TelephonyManager.EXTRA_STATE_IDLE.equals(mPhoneState))
            playSounds(false);
        mKeyguardViewManager.hide();
        mShowing = false;
        updateActivityLockScreenState();
        adjustUserActivityLocked();
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

    private void handleKeyguardDone(boolean flag)
    {
        handleHide();
        if (flag)
            mPM.wakeUp(SystemClock.uptimeMillis());
        mWakeLock.release();
        UserHandle userhandle = new UserHandle(mLockPatternUtils.getCurrentUser());
        mContext.sendBroadcastAsUser(mUserPresentIntent, userhandle);
    }

    private void handleKeyguardDoneDrawing()
    {
        this;
        JVM INSTR monitorenter ;
        if (mWaitingUntilKeyguardVisible)
        {
            mWaitingUntilKeyguardVisible = false;
            notifyAll();
            mHandler.removeMessages(10);
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

    private void handleNotifyScreenOff()
    {
        this;
        JVM INSTR monitorenter ;
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

    private void handleReset()
    {
        this;
        JVM INSTR monitorenter ;
        mKeyguardViewManager.reset();
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
            adjustUserActivityLocked();
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

    private void handleShow()
    {
        this;
        JVM INSTR monitorenter ;
        if (mSystemReady)
            break MISSING_BLOCK_LABEL_12;
        this;
        JVM INSTR monitorexit ;
        return;
        mKeyguardViewManager.show();
        mShowing = true;
        updateActivityLockScreenState();
        adjustUserActivityLocked();
        adjustStatusBarLocked();
        Exception exception;
        try
        {
            ActivityManagerNative.getDefault().closeSystemDialogs("lock");
        }
        catch (RemoteException remoteexception) { }
        playSounds(true);
        mShowKeyguardWakeLock.release();
        this;
        JVM INSTR monitorexit ;
        return;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleTimeout(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (i == mWakelockSequence)
            mWakeLock.release();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void handleVerifyUnlock()
    {
        this;
        JVM INSTR monitorenter ;
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

    private void handleWakeWhenReady(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (!mKeyguardViewManager.wakeWhenReadyTq(i))
        {
            Log.w("KeyguardViewMediator", "mKeyguardViewManager.wakeWhenReadyTq did not poke wake lock, so poke it ourselves");
            pokeWakelock();
        }
        mWakeAndHandOff.release();
        if (!mWakeLock.isHeld())
            Log.w("KeyguardViewMediator", "mWakeLock not held in mKeyguardViewManager.wakeWhenReadyTq");
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
        Message message = mHandler.obtainMessage(3);
        mHandler.sendMessage(message);
    }

    private boolean isWakeKeyWhenKeyguardShowing(int i, boolean flag)
    {
        switch (i)
        {
        case 27: // '\033'
        case 79: // 'O'
        case 85: // 'U'
        case 86: // 'V'
        case 87: // 'W'
        case 88: // 'X'
        case 89: // 'Y'
        case 90: // 'Z'
        case 91: // '['
        case 126: // '~'
        case 127: // '\177'
        case 130: 
            return false;

        default:
            flag = true;
            // fall through

        case 24: // '\030'
        case 25: // '\031'
        case 164: 
            return flag;
        }
    }

    private void notifyScreenOffLocked()
    {
        mHandler.sendEmptyMessage(6);
    }

    private void notifyScreenOnLocked(KeyguardViewManager.ShowListener showlistener)
    {
        Message message = mHandler.obtainMessage(7, showlistener);
        mHandler.sendMessage(message);
    }

    private void playSounds(boolean flag)
    {
label0:
        {
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

    private void resetStateLocked()
    {
        Message message = mHandler.obtainMessage(4);
        mHandler.sendMessage(message);
    }

    private void showLocked()
    {
        mShowKeyguardWakeLock.acquire();
        Message message = mHandler.obtainMessage(2);
        mHandler.sendMessage(message);
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
        mHandler.sendEmptyMessage(5);
    }

    private void wakeWhenReadyLocked(int i)
    {
        mWakeAndHandOff.acquire();
        Message message = mHandler.obtainMessage(8, i, 0);
        mHandler.sendMessage(message);
    }

    public void doKeyguardTimeout()
    {
        mHandler.removeMessages(13);
        Message message = mHandler.obtainMessage(13);
        mHandler.sendMessage(message);
    }

    public boolean isInputRestricted()
    {
        return mShowing || mNeedToReshowWhenReenabled || !mUpdateMonitor.isDeviceProvisioned();
    }

    public boolean isSecure()
    {
        return mKeyguardViewProperties.isSecure();
    }

    public boolean isShowing()
    {
        return mShowing;
    }

    public boolean isShowingAndNotHidden()
    {
        return mShowing && !mHidden;
    }

    public void keyguardDone(boolean flag)
    {
        keyguardDone(flag, true);
    }

    public void keyguardDone(boolean flag, boolean flag1)
    {
        int i = 1;
        this;
        JVM INSTR monitorenter ;
        Message message;
        EventLog.writeEvent(0x11170, 2);
        message = mHandler.obtainMessage(9);
        Exception exception;
        if (!flag1)
            i = 0;
        message.arg1 = i;
        mHandler.sendMessage(message);
        if (!flag)
            break MISSING_BLOCK_LABEL_54;
        mUpdateMonitor.clearFailedAttempts();
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_90;
        mExitSecureCallback.onKeyguardExitResult(flag);
        mExitSecureCallback = null;
        if (!flag)
            break MISSING_BLOCK_LABEL_90;
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

    public void keyguardDoneDrawing()
    {
        mHandler.sendEmptyMessage(10);
    }

    public void onScreenTurnedOff(int i)
    {
        this;
        JVM INSTR monitorenter ;
        mScreenOn = false;
        Exception exception;
        boolean flag;
        long l;
        long l1;
        long l2;
        long l3;
        if (mLockPatternUtils.getPowerButtonInstantlyLocks() || !mLockPatternUtils.isSecure())
            flag = true;
        else
            flag = false;
        if (mExitSecureCallback == null) goto _L2; else goto _L1
_L1:
        mExitSecureCallback.onKeyguardExitResult(false);
        mExitSecureCallback = null;
        if (!mExternallyEnabled)
            hideLocked();
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!mShowing)
            break MISSING_BLOCK_LABEL_89;
        notifyScreenOffLocked();
        resetStateLocked();
          goto _L3
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        if (i != 3 && (i != 2 || flag)) goto _L5; else goto _L4
_L4:
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        l = android.provider.Settings.System.getInt(contentresolver, "screen_off_timeout", 30000);
        l1 = android.provider.Settings.Secure.getInt(contentresolver, "lock_screen_lock_after_timeout", 5000);
        l2 = mLockPatternUtils.getDevicePolicyManager().getMaximumTimeToLock(null);
        if (l2 <= 0L)
            break MISSING_BLOCK_LABEL_279;
        l3 = Math.min(l2 - Math.max(l, 0L), l1);
_L7:
        if (l3 > 0L)
            break MISSING_BLOCK_LABEL_195;
        mSuppressNextLockSound = true;
        doKeyguardLocked();
          goto _L3
        long l4 = l3 + SystemClock.elapsedRealtime();
        Intent intent = new Intent("com.android.internal.policy.impl.PhoneWindowManager.DELAYED_KEYGUARD");
        intent.putExtra("seq", mDelayedShowingSequence);
        PendingIntent pendingintent = PendingIntent.getBroadcast(mContext, 0, intent, 0x10000000);
        mAlarmManager.set(2, l4, pendingintent);
          goto _L3
_L5:
        if (i == 4) goto _L3; else goto _L6
_L6:
        doKeyguardLocked();
          goto _L3
        l3 = l1;
          goto _L7
    }

    public void onScreenTurnedOn(KeyguardViewManager.ShowListener showlistener)
    {
        this;
        JVM INSTR monitorenter ;
        mScreenOn = true;
        mDelayedShowingSequence = 1 + mDelayedShowingSequence;
        if (showlistener == null)
            break MISSING_BLOCK_LABEL_26;
        notifyScreenOnLocked(showlistener);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onSystemReady()
    {
        this;
        JVM INSTR monitorenter ;
        mSystemReady = true;
        mUpdateMonitor.registerCallback(mUpdateCallback);
        doKeyguardLocked();
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean onWakeKeyWhenKeyguardShowingTq(int i, boolean flag)
    {
        if (isWakeKeyWhenKeyguardShowing(i, flag))
        {
            wakeWhenReadyLocked(i);
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onWakeMotionWhenKeyguardShowingTq()
    {
        wakeWhenReadyLocked(0);
        return true;
    }

    public void pokeWakelock()
    {
        pokeWakelock(10000);
    }

    public void pokeWakelock(int i)
    {
        this;
        JVM INSTR monitorenter ;
        mWakeLock.acquire();
        mHandler.removeMessages(1);
        mWakelockSequence = 1 + mWakelockSequence;
        Message message = mHandler.obtainMessage(1, mWakelockSequence, 0);
        mHandler.sendMessageDelayed(message, i);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void setHidden(boolean flag)
    {
        mHandler.removeMessages(12);
        Handler handler = mHandler;
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        Message message = handler.obtainMessage(12, i, 0);
        mHandler.sendMessage(message);
    }

    public void setKeyguardEnabled(boolean flag)
    {
        this;
        JVM INSTR monitorenter ;
        mExternallyEnabled = flag;
        if (flag) goto _L2; else goto _L1
_L1:
        if (!mShowing) goto _L2; else goto _L3
_L3:
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_28;
        this;
        JVM INSTR monitorexit ;
        return;
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
        mNeedToReshowWhenReenabled = false;
        if (mExitSecureCallback == null)
            break MISSING_BLOCK_LABEL_90;
        mExitSecureCallback.onKeyguardExitResult(false);
        mExitSecureCallback = null;
        resetStateLocked();
          goto _L5
        showLocked();
        mWaitingUntilKeyguardVisible = true;
        mHandler.sendEmptyMessageDelayed(10, 2000L);
_L8:
        boolean flag1 = mWaitingUntilKeyguardVisible;
        if (!flag1) goto _L5; else goto _L7
_L7:
        wait();
          goto _L8
        InterruptedException interruptedexception;
        interruptedexception;
        Thread.currentThread().interrupt();
          goto _L8
    }

    public void verifyUnlock(android.view.WindowManagerPolicy.OnKeyguardExitResult onkeyguardexitresult)
    {
        this;
        JVM INSTR monitorenter ;
        if (mUpdateMonitor.isDeviceProvisioned()) goto _L2; else goto _L1
_L1:
        onkeyguardexitresult.onKeyguardExitResult(false);
_L3:
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        if (!mExternallyEnabled)
            break MISSING_BLOCK_LABEL_53;
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




/*
    static boolean access$1002(KeyguardViewMediator keyguardviewmediator, boolean flag)
    {
        keyguardviewmediator.mSuppressNextLockSound = flag;
        return flag;
    }

*/



















}
