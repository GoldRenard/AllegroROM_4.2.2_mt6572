// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.accounts.*;
import android.app.AlertDialog;
import android.app.admin.DevicePolicyManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.util.Slog;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import com.android.internal.widget.*;
import java.io.IOException;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardViewBase, KeyguardUpdateMonitor, BiometricSensorUnlock, FaceUnlock, 
//            KeyguardScreen, KeyguardWindowController, LockScreen, PatternUnlockScreen, 
//            SimPukUnlockScreen, SimUnlockScreen, AccountUnlockScreen, PasswordUnlockScreen, 
//            KeyguardViewCallback, KeyguardUpdateMonitorCallback, KeyguardScreenCallback

public class LockPatternKeyguardView extends KeyguardViewBase
{
    private class AccountAnalyzer
        implements AccountManagerCallback
    {

        private int mAccountIndex;
        private final AccountManager mAccountManager;
        private final Account mAccounts[];
        final LockPatternKeyguardView this$0;

        private void next()
        {
            if (!mEnableFallback && mAccountIndex < mAccounts.length)
            {
                mAccountManager.confirmCredentials(mAccounts[mAccountIndex], null, null, this, null);
                return;
            }
            if (mUnlockScreen != null && (mUnlockScreen instanceof PatternUnlockScreen))
            {
                ((PatternUnlockScreen)mUnlockScreen).setEnableFallback(mEnableFallback);
                return;
            } else
            {
                return;
            }
        }

        public void run(AccountManagerFuture accountmanagerfuture)
        {
            try
            {
                if (((Bundle)accountmanagerfuture.getResult()).getParcelable("intent") != null)
                    mEnableFallback = true;
            }
            catch (OperationCanceledException operationcanceledexception)
            {
                mAccountIndex = 1 + mAccountIndex;
                next();
                return;
            }
            catch (IOException ioexception)
            {
                mAccountIndex = 1 + mAccountIndex;
                next();
                return;
            }
            catch (AuthenticatorException authenticatorexception)
            {
                mAccountIndex = 1 + mAccountIndex;
                next();
                return;
            }
            mAccountIndex = 1 + mAccountIndex;
            next();
            return;
            Exception exception;
            exception;
            mAccountIndex = 1 + mAccountIndex;
            next();
            throw exception;
        }

        public void start()
        {
            mEnableFallback = false;
            mAccountIndex = 0;
            next();
        }

        private AccountAnalyzer(AccountManager accountmanager)
        {
            this$0 = LockPatternKeyguardView.this;
            super();
            mAccountManager = accountmanager;
            mAccounts = accountmanager.getAccountsByType("com.google");
        }

    }

    private static class FastBitmapDrawable extends Drawable
    {

        private Bitmap mBitmap;
        private int mOpacity;

        public void draw(Canvas canvas)
        {
            canvas.drawBitmap(mBitmap, (getBounds().width() - mBitmap.getWidth()) / 2, getBounds().height() - mBitmap.getHeight(), null);
        }

        public int getIntrinsicHeight()
        {
            return mBitmap.getHeight();
        }

        public int getIntrinsicWidth()
        {
            return mBitmap.getWidth();
        }

        public int getMinimumHeight()
        {
            return mBitmap.getHeight();
        }

        public int getMinimumWidth()
        {
            return mBitmap.getWidth();
        }

        public int getOpacity()
        {
            return mOpacity;
        }

        public void setAlpha(int i)
        {
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
        }

        private FastBitmapDrawable(Bitmap bitmap)
        {
            mBitmap = bitmap;
            int i;
            if (mBitmap.hasAlpha())
                i = -3;
            else
                i = -1;
            mOpacity = i;
        }
    }

    static final class Mode extends Enum
    {

        private static final Mode $VALUES[];
        public static final Mode LockScreen;
        public static final Mode UnlockScreen;

        public static Mode valueOf(String s)
        {
            return (Mode)Enum.valueOf(com/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$Mode, s);
        }

        public static Mode[] values()
        {
            return (Mode[])$VALUES.clone();
        }

        static 
        {
            LockScreen = new Mode("LockScreen", 0);
            UnlockScreen = new Mode("UnlockScreen", 1);
            Mode amode[] = new Mode[2];
            amode[0] = LockScreen;
            amode[1] = UnlockScreen;
            $VALUES = amode;
        }

        private Mode(String s, int i)
        {
            super(s, i);
        }
    }

    static final class UnlockMode extends Enum
    {

        private static final UnlockMode $VALUES[];
        public static final UnlockMode Account;
        public static final UnlockMode Password;
        public static final UnlockMode Pattern;
        public static final UnlockMode SimPin;
        public static final UnlockMode SimPuk;
        public static final UnlockMode Unknown;

        public static UnlockMode valueOf(String s)
        {
            return (UnlockMode)Enum.valueOf(com/android/internal/policy/impl/keyguard_obsolete/LockPatternKeyguardView$UnlockMode, s);
        }

        public static UnlockMode[] values()
        {
            return (UnlockMode[])$VALUES.clone();
        }

        static 
        {
            Pattern = new UnlockMode("Pattern", 0);
            SimPin = new UnlockMode("SimPin", 1);
            SimPuk = new UnlockMode("SimPuk", 2);
            Account = new UnlockMode("Account", 3);
            Password = new UnlockMode("Password", 4);
            Unknown = new UnlockMode("Unknown", 5);
            UnlockMode aunlockmode[] = new UnlockMode[6];
            aunlockmode[0] = Pattern;
            aunlockmode[1] = SimPin;
            aunlockmode[2] = SimPuk;
            aunlockmode[3] = Account;
            aunlockmode[4] = Password;
            aunlockmode[5] = Unknown;
            $VALUES = aunlockmode;
        }

        private UnlockMode(String s, int i)
        {
            super(s, i);
        }
    }


    static final String ACTION_EMERGENCY_DIAL = "com.android.phone.EmergencyDialer.DIAL";
    private static final boolean DEBUG = false;
    static final boolean DEBUG_CONFIGURATION = false;
    private static final int EMERGENCY_CALL_TIMEOUT = 10000;
    private static final String TAG = "LockPatternKeyguardView";
    private static final int TRANSPORT_USERACTIVITY_TIMEOUT = 10000;
    private static boolean sIsFirstAppearanceAfterBoot = true;
    private final int BIOMETRIC_AREA_EMERGENCY_DIALER_TIMEOUT = 1000;
    private BiometricSensorUnlock mBiometricUnlock;
    private final Object mBiometricUnlockStartupLock = new Object();
    private Configuration mConfiguration;
    private boolean mEnableFallback;
    private boolean mForgotPattern;
    private boolean mHasDialog;
    KeyguardUpdateMonitorCallback mInfoCallback;
    private boolean mIsVerifyUnlockOnly;
    KeyguardScreenCallback mKeyguardScreenCallback;
    private final LockPatternUtils mLockPatternUtils;
    private View mLockScreen;
    private Mode mMode;
    private boolean mPluggedIn;
    private Runnable mRecreateRunnable;
    private boolean mRequiresSim;
    private Parcelable mSavedState;
    private boolean mScreenOn;
    private boolean mShowLockBeforeUnlock;
    private boolean mSuppressBiometricUnlock;
    private TransportControlView mTransportControlView;
    private View mUnlockScreen;
    private UnlockMode mUnlockScreenMode;
    private final KeyguardUpdateMonitor mUpdateMonitor;
    private LockScreenWidgetCallback mWidgetCallback;
    private final KeyguardWindowController mWindowController;
    private boolean mWindowFocused;

    public LockPatternKeyguardView(Context context, KeyguardViewCallback keyguardviewcallback, KeyguardUpdateMonitor keyguardupdatemonitor, LockPatternUtils lockpatternutils, KeyguardWindowController keyguardwindowcontroller)
    {
        super(context, keyguardviewcallback);
        mWindowFocused = false;
        mEnableFallback = false;
        mShowLockBeforeUnlock = false;
        mHasDialog = false;
        mMode = Mode.LockScreen;
        mUnlockScreenMode = UnlockMode.Unknown;
        mIsVerifyUnlockOnly = false;
        mRecreateRunnable = new Runnable() {

            final LockPatternKeyguardView this$0;

            public void run()
            {
                Mode mode = mMode;
                Mode mode1 = Mode.UnlockScreen;
                boolean flag = false;
                if (mode == mode1)
                {
                    UnlockMode unlockmode = getUnlockMode();
                    UnlockMode unlockmode1 = UnlockMode.Unknown;
                    flag = false;
                    if (unlockmode == unlockmode1)
                    {
                        mode = Mode.LockScreen;
                        flag = true;
                    }
                }
                updateScreen(mode, true);
                restoreWidgetState();
                if (flag)
                    mKeyguardScreenCallback.keyguardDone(false);
            }

            
            {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        }
;
        mWidgetCallback = new LockScreenWidgetCallback() {

            final LockPatternKeyguardView this$0;

            public boolean isVisible(View view)
            {
                return view.getVisibility() == 0;
            }

            public void requestHide(View view)
            {
                view.setVisibility(8);
                mUpdateMonitor.reportClockVisible(true);
                resetBackground();
            }

            public void requestShow(View view)
            {
                view.setVisibility(0);
                mUpdateMonitor.reportClockVisible(false);
                if (findViewById(0x10202ed) == null)
                {
                    setBackgroundColor(0xff000000);
                    return;
                } else
                {
                    resetBackground();
                    return;
                }
            }

            public void userActivity(View view)
            {
                mKeyguardScreenCallback.pokeWakelock(10000);
            }

            
            {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        }
;
        mKeyguardScreenCallback = new KeyguardScreenCallback() {

            final LockPatternKeyguardView this$0;

            public boolean doesFallbackUnlockScreenExist()
            {
                return mEnableFallback;
            }

            public void forgotPattern(boolean flag)
            {
                if (mEnableFallback)
                {
                    mForgotPattern = flag;
                    updateScreen(Mode.UnlockScreen, false);
                }
            }

            public void goToLockScreen()
            {
                mForgotPattern = false;
                if (mIsVerifyUnlockOnly)
                {
                    mIsVerifyUnlockOnly = false;
                    getCallback().keyguardDone(false);
                    return;
                } else
                {
                    updateScreen(Mode.LockScreen, false);
                    return;
                }
            }

            public void goToUnlockScreen()
            {
                com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState();
                if (!stuckOnLockScreenBecauseSimMissing() && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || mLockPatternUtils.isPukUnlockScreenEnable()))
                {
                    if (!isSecure())
                    {
                        getCallback().keyguardDone(true);
                        return;
                    } else
                    {
                        updateScreen(Mode.UnlockScreen, false);
                        return;
                    }
                } else
                {
                    return;
                }
            }

            public boolean isSecure()
            {
                return LockPatternKeyguardView.this.isSecure();
            }

            public boolean isVerifyUnlockOnly()
            {
                return mIsVerifyUnlockOnly;
            }

            public void keyguardDone(boolean flag)
            {
                getCallback().keyguardDone(flag);
                mSavedState = null;
            }

            public void keyguardDoneDrawing()
            {
            }

            public void pokeWakelock()
            {
                getCallback().pokeWakelock();
            }

            public void pokeWakelock(int i)
            {
                getCallback().pokeWakelock(i);
            }

            public void recreateMe(Configuration configuration)
            {
                removeCallbacks(mRecreateRunnable);
                post(mRecreateRunnable);
            }

            public void reportFailedUnlockAttempt()
            {
                mUpdateMonitor.reportFailedAttempt();
                int i = mUpdateMonitor.getFailedAttempts();
                boolean flag;
                if (mLockPatternUtils.getKeyguardStoredPasswordQuality() == 0x10000)
                    flag = true;
                else
                    flag = false;
                int j = mLockPatternUtils.getDevicePolicyManager().getMaximumFailedPasswordsForWipe(null);
                int k;
                if (j > 0)
                    k = j - i;
                else
                    k = 0x7fffffff;
                if (k < 5)
                {
                    if (k > 0)
                    {
                        showAlmostAtWipeDialog(i, k);
                    } else
                    {
                        Slog.i("LockPatternKeyguardView", "Too many unlock attempts; device will be wiped!");
                        showWipeDialog(i);
                    }
                } else
                {
                    boolean flag1;
                    if (i % 5 == 0)
                        flag1 = true;
                    else
                        flag1 = false;
                    if (flag && mEnableFallback)
                        if (i == 15)
                        {
                            showAlmostAtAccountLoginDialog();
                            flag1 = false;
                        } else
                        if (i >= 20)
                        {
                            mLockPatternUtils.setPermanentlyLocked(true);
                            updateScreen(mMode, false);
                            flag1 = false;
                        }
                    if (flag1)
                        showTimeoutDialog();
                }
                mLockPatternUtils.reportFailedPasswordAttempt();
            }

            public void reportSuccessfulUnlockAttempt()
            {
                mLockPatternUtils.reportSuccessfulPasswordAttempt();
            }

            public void takeEmergencyCallAction()
            {
                mSuppressBiometricUnlock = true;
                if (mBiometricUnlock != null)
                {
                    if (mBiometricUnlock.isRunning())
                        mBiometricUnlock.show(1000L);
                    mBiometricUnlock.stop();
                }
                pokeWakelock(10000);
                if (TelephonyManager.getDefault().getCallState() == 2)
                {
                    mLockPatternUtils.resumeCall();
                    return;
                } else
                {
                    Intent intent = new Intent("com.android.phone.EmergencyDialer.DIAL");
                    intent.setFlags(0x10800000);
                    getContext().startActivity(intent);
                    return;
                }
            }

            
            {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        }
;
        mInfoCallback = new KeyguardUpdateMonitorCallback() {

            final LockPatternKeyguardView this$0;

            public void onClockVisibilityChanged()
            {
                int i = 0xff7fffff & getSystemUiVisibility();
                int j;
                if (mUpdateMonitor.isClockVisible())
                    j = 0x800000;
                else
                    j = 0;
                int k = i | j;
                Log.v("LockPatternKeyguardView", (new StringBuilder()).append("Set visibility on ").append(this).append(" to ").append(k).toString());
                setSystemUiVisibility(k);
            }

            public void onPhoneStateChanged(int i)
            {
                if (mBiometricUnlock != null && i == 1)
                {
                    mSuppressBiometricUnlock = true;
                    mBiometricUnlock.stop();
                    mBiometricUnlock.hide();
                }
            }

            public void onRefreshBatteryInfo(KeyguardUpdateMonitor.BatteryStatus batterystatus)
            {
                boolean flag = batterystatus.isPluggedIn();
                if (mBiometricUnlock != null && mPluggedIn != flag && !mBiometricUnlock.isRunning())
                {
                    mBiometricUnlock.stop();
                    mBiometricUnlock.hide();
                    mSuppressBiometricUnlock = true;
                }
                mPluggedIn = flag;
            }

            public void onUserSwitched(int i)
            {
                if (mBiometricUnlock != null)
                    mBiometricUnlock.stop();
                mLockPatternUtils.setCurrentUser(i);
                updateScreen(getInitialMode(), true);
            }

            
            {
                this$0 = LockPatternKeyguardView.this;
                super();
            }
        }
;
        mConfiguration = context.getResources().getConfiguration();
        mEnableFallback = false;
        mRequiresSim = TextUtils.isEmpty(SystemProperties.get("keyguard.no_require_sim"));
        mUpdateMonitor = keyguardupdatemonitor;
        mLockPatternUtils = lockpatternutils;
        mWindowController = keyguardwindowcontroller;
        mSuppressBiometricUnlock = sIsFirstAppearanceAfterBoot;
        sIsFirstAppearanceAfterBoot = false;
        mScreenOn = ((PowerManager)context.getSystemService("power")).isScreenOn();
        mUpdateMonitor.registerCallback(mInfoCallback);
        setFocusableInTouchMode(true);
        setDescendantFocusability(0x40000);
        updateScreen(getInitialMode(), false);
        maybeEnableFallback(context);
    }

    private Mode getInitialMode()
    {
        com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState();
        if (!stuckOnLockScreenBecauseSimMissing() && (state != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED || mLockPatternUtils.isPukUnlockScreenEnable()))
        {
            if (isSecure() && !mShowLockBeforeUnlock)
                return Mode.UnlockScreen;
            else
                return Mode.LockScreen;
        } else
        {
            return Mode.LockScreen;
        }
    }

    private UnlockMode getUnlockMode()
    {
        com.android.internal.telephony.IccCardConstants.State state = mUpdateMonitor.getSimState();
        if (state == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED)
            return UnlockMode.SimPin;
        if (state == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED)
            return UnlockMode.SimPuk;
        int i = mLockPatternUtils.getKeyguardStoredPasswordQuality();
        switch (i)
        {
        case 0: // '\0'
        case 65536: 
            if (mLockPatternUtils.isLockPatternEnabled())
            {
                if (!mForgotPattern && !mLockPatternUtils.isPermanentlyLocked())
                    return UnlockMode.Pattern;
                else
                    return com.android.internal.policy.impl.keyguard_obsolete.UnlockMode.Account;
            } else
            {
                return UnlockMode.Unknown;
            }

        case 131072: 
        case 262144: 
        case 327680: 
        case 393216: 
            return UnlockMode.Password;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unknown unlock mode:").append(i).toString());
    }

    private void initializeBiometricUnlockView(View view)
    {
        BiometricSensorUnlock biometricsensorunlock = mBiometricUnlock;
        boolean flag = false;
        if (biometricsensorunlock != null)
            flag = mBiometricUnlock.stop();
        if (!mScreenOn)
        {
            boolean flag1;
            if (mUpdateMonitor.getPhoneState() == 0 && !mHasDialog)
                flag1 = false;
            else
                flag1 = true;
            mSuppressBiometricUnlock = flag1;
        }
        mBiometricUnlock = null;
        if (useBiometricUnlock())
        {
            View view1 = view.findViewById(0x10202ae);
            if (view1 != null)
            {
                mBiometricUnlock = new FaceUnlock(mContext, mUpdateMonitor, mLockPatternUtils, mKeyguardScreenCallback);
                mBiometricUnlock.initializeView(view1);
                if (!mScreenOn)
                    mBiometricUnlock.show(0L);
            } else
            {
                Log.w("LockPatternKeyguardView", "Couldn't find biometric unlock view");
            }
        }
        if (mBiometricUnlock != null && flag)
            maybeStartBiometricUnlock();
    }

    private void initializeTransportControlView(View view)
    {
        mTransportControlView = (TransportControlView)view.findViewById(0x10202eb);
        if (mTransportControlView == null)
        {
            return;
        } else
        {
            mUpdateMonitor.reportClockVisible(true);
            mTransportControlView.setVisibility(8);
            mTransportControlView.setCallback(mWidgetCallback);
            return;
        }
    }

    private boolean isSecure()
    {
        UnlockMode unlockmode = getUnlockMode();
        static class _cls5
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode = new int[UnlockMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[UnlockMode.Pattern.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[UnlockMode.SimPin.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[UnlockMode.SimPuk.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[com.android.internal.policy.impl.keyguard_obsolete.UnlockMode.Account.ordinal()] = 4;
                }
                catch (NoSuchFieldError nosuchfielderror3) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[UnlockMode.Password.ordinal()] = 5;
                }
                catch (NoSuchFieldError nosuchfielderror4) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard_obsolete$LockPatternKeyguardView$UnlockMode[UnlockMode.Unknown.ordinal()] = 6;
                }
                catch (NoSuchFieldError nosuchfielderror5)
                {
                    return;
                }
            }
        }

        int i = _cls5..SwitchMap.com.android.internal.policy.impl.keyguard_obsolete.LockPatternKeyguardView.UnlockMode[unlockmode.ordinal()];
        boolean flag = false;
        switch (i)
        {
        case 5: // '\005'
            return mLockPatternUtils.isLockPasswordEnabled();

        case 4: // '\004'
            return true;

        case 3: // '\003'
            return mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED;

        case 2: // '\002'
            return mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.PIN_REQUIRED;

        case 1: // '\001'
            flag = mLockPatternUtils.isLockPatternEnabled();
            // fall through

        case 6: // '\006'
            return flag;

        default:
            throw new IllegalStateException((new StringBuilder()).append("unknown unlock mode ").append(unlockmode).toString());
        }
    }

    private void maybeEnableFallback(Context context)
    {
        (new AccountAnalyzer(AccountManager.get(context))).start();
    }

    private void maybeStartBiometricUnlock()
    {
label0:
        {
            if (mBiometricUnlock != null)
            {
                boolean flag;
                if (mUpdateMonitor.getFailedAttempts() >= 5)
                    flag = true;
                else
                    flag = false;
                if (mSuppressBiometricUnlock || mUpdateMonitor.getPhoneState() != 0 || mUpdateMonitor.getMaxBiometricUnlockAttemptsReached() || flag)
                    break label0;
                mBiometricUnlock.start();
            }
            return;
        }
        mBiometricUnlock.hide();
    }

    private void recreateLockScreen()
    {
        if (mLockScreen != null)
        {
            ((KeyguardScreen)mLockScreen).onPause();
            ((KeyguardScreen)mLockScreen).cleanUp();
            removeView(mLockScreen);
        }
        mLockScreen = createLockScreen();
        mLockScreen.setVisibility(4);
        addView(mLockScreen);
    }

    private void recreateUnlockScreen(UnlockMode unlockmode)
    {
        if (mUnlockScreen != null)
        {
            ((KeyguardScreen)mUnlockScreen).onPause();
            ((KeyguardScreen)mUnlockScreen).cleanUp();
            removeView(mUnlockScreen);
        }
        mUnlockScreen = createUnlockScreenFor(unlockmode);
        mUnlockScreen.setVisibility(4);
        addView(mUnlockScreen);
    }

    private void restoreWidgetState()
    {
        if (mTransportControlView != null && mSavedState != null)
            mTransportControlView.onRestoreInstanceState(mSavedState);
    }

    private void saveWidgetState()
    {
        if (mTransportControlView != null)
            mSavedState = mTransportControlView.onSaveInstanceState();
    }

    private void showAlmostAtAccountLoginDialog()
    {
        Context context = mContext;
        Object aobj[] = new Object[3];
        aobj[0] = Integer.valueOf(15);
        aobj[1] = Integer.valueOf(5);
        aobj[2] = Integer.valueOf(30);
        showDialog(null, context.getString(0x1040309, aobj));
    }

    private void showAlmostAtWipeDialog(int i, int j)
    {
        Context context = mContext;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(i);
        aobj[1] = Integer.valueOf(j);
        showDialog(null, context.getString(0x104030a, aobj));
    }

    private void showDialog(String s, String s1)
    {
        mHasDialog = true;
        AlertDialog alertdialog = (new android.app.AlertDialog.Builder(mContext)).setTitle(s).setMessage(s1).setNeutralButton(0x104000a, null).create();
        alertdialog.getWindow().setType(2009);
        alertdialog.show();
    }

    private void showTimeoutDialog()
    {
        int i = 0x1040306;
        if (getUnlockMode() == UnlockMode.Password)
            if (mLockPatternUtils.getKeyguardStoredPasswordQuality() == 0x20000)
                i = 0x1040308;
            else
                i = 0x1040307;
        Context context = mContext;
        Object aobj[] = new Object[2];
        aobj[0] = Integer.valueOf(mUpdateMonitor.getFailedAttempts());
        aobj[1] = Integer.valueOf(30);
        showDialog(null, context.getString(i, aobj));
    }

    private void showWipeDialog(int i)
    {
        Context context = mContext;
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        showDialog(null, context.getString(0x104030b, aobj));
    }

    private boolean stuckOnLockScreenBecauseSimMissing()
    {
        return mRequiresSim && !mUpdateMonitor.isDeviceProvisioned() && (mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.ABSENT || mUpdateMonitor.getSimState() == com.android.internal.telephony.IccCardConstants.State.PERM_DISABLED);
    }

    private void updateScreen(Mode mode, boolean flag)
    {
        mMode = mode;
        if ((mode == Mode.LockScreen || mShowLockBeforeUnlock) && (flag || mLockScreen == null))
            recreateLockScreen();
        UnlockMode unlockmode = getUnlockMode();
        if (mode == Mode.UnlockScreen && unlockmode != UnlockMode.Unknown && (flag || mUnlockScreen == null || unlockmode != mUnlockScreenMode))
            recreateUnlockScreen(unlockmode);
        View view;
        if (mode == Mode.LockScreen)
            view = mUnlockScreen;
        else
            view = mLockScreen;
        View view1;
        if (mode == Mode.LockScreen)
            view1 = mLockScreen;
        else
            view1 = mUnlockScreen;
        mWindowController.setNeedsInput(((KeyguardScreen)view1).needsInput());
        if (mScreenOn)
        {
            if (view != null && view.getVisibility() == 0)
                ((KeyguardScreen)view).onPause();
            if (view1.getVisibility() != 0)
                ((KeyguardScreen)view1).onResume();
        }
        if (view != null)
            view.setVisibility(8);
        view1.setVisibility(0);
        requestLayout();
        if (!view1.requestFocus())
            throw new IllegalStateException((new StringBuilder()).append("keyguard screen must be able to take focus when shown ").append(view1.getClass().getCanonicalName()).toString());
        else
            return;
    }

    private boolean useBiometricUnlock()
    {
        UnlockMode unlockmode = getUnlockMode();
        boolean flag;
        if (mUpdateMonitor.getFailedAttempts() >= 5)
            flag = true;
        else
            flag = false;
        return mLockPatternUtils.usingBiometricWeak() && mLockPatternUtils.isBiometricWeakInstalled() && !mUpdateMonitor.getMaxBiometricUnlockAttemptsReached() && !flag && (unlockmode == UnlockMode.Pattern || unlockmode == UnlockMode.Password);
    }

    public void cleanUp()
    {
        if (mLockScreen != null)
        {
            ((KeyguardScreen)mLockScreen).onPause();
            ((KeyguardScreen)mLockScreen).cleanUp();
            removeView(mLockScreen);
            mLockScreen = null;
        }
        if (mUnlockScreen != null)
        {
            ((KeyguardScreen)mUnlockScreen).onPause();
            ((KeyguardScreen)mUnlockScreen).cleanUp();
            removeView(mUnlockScreen);
            mUnlockScreen = null;
        }
        mUpdateMonitor.removeCallback(this);
        if (mBiometricUnlock != null)
            mBiometricUnlock.cleanUp();
    }

    View createLockScreen()
    {
        LockScreen lockscreen = new LockScreen(mContext, mConfiguration, mLockPatternUtils, mUpdateMonitor, mKeyguardScreenCallback);
        initializeTransportControlView(lockscreen);
        return lockscreen;
    }

    View createUnlockScreenFor(UnlockMode unlockmode)
    {
        Object obj;
        if (unlockmode == UnlockMode.Pattern)
        {
            PatternUnlockScreen patternunlockscreen = new PatternUnlockScreen(mContext, mConfiguration, mLockPatternUtils, mUpdateMonitor, mKeyguardScreenCallback, mUpdateMonitor.getFailedAttempts());
            patternunlockscreen.setEnableFallback(mEnableFallback);
            obj = patternunlockscreen;
        } else
        if (unlockmode == UnlockMode.SimPuk)
            obj = new SimPukUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
        else
        if (unlockmode == UnlockMode.SimPin)
            obj = new SimUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
        else
        if (unlockmode == com.android.internal.policy.impl.keyguard_obsolete.UnlockMode.Account)
        {
            AccountUnlockScreen accountunlockscreen;
            try
            {
                accountunlockscreen = new AccountUnlockScreen(mContext, mConfiguration, mUpdateMonitor, mKeyguardScreenCallback, mLockPatternUtils);
            }
            catch (IllegalStateException illegalstateexception)
            {
                Log.i("LockPatternKeyguardView", "Couldn't instantiate AccountUnlockScreen (IAccountsService isn't available)");
                return createUnlockScreenFor(UnlockMode.Pattern);
            }
            obj = accountunlockscreen;
        } else
        if (unlockmode == UnlockMode.Password)
        {
            Context context = mContext;
            Configuration configuration = mConfiguration;
            LockPatternUtils lockpatternutils = mLockPatternUtils;
            KeyguardUpdateMonitor keyguardupdatemonitor = mUpdateMonitor;
            KeyguardScreenCallback keyguardscreencallback = mKeyguardScreenCallback;
            obj = new PasswordUnlockScreen(context, configuration, lockpatternutils, keyguardupdatemonitor, keyguardscreencallback);
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("unknown unlock mode ").append(unlockmode).toString());
        }
        initializeTransportControlView(((View) (obj)));
        initializeBiometricUnlockView(((View) (obj)));
        mUnlockScreenMode = unlockmode;
        return ((View) (obj));
    }

    protected void dispatchDraw(Canvas canvas)
    {
        super.dispatchDraw(canvas);
    }

    protected boolean dispatchHoverEvent(MotionEvent motionevent)
    {
        AccessibilityManager accessibilitymanager = AccessibilityManager.getInstance(mContext);
        if (accessibilitymanager.isEnabled() && accessibilitymanager.isTouchExplorationEnabled())
            getCallback().pokeWakelock();
        return super.dispatchHoverEvent(motionevent);
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        mShowLockBeforeUnlock = getResources().getBoolean(0x1110026);
        mConfiguration = configuration;
        saveWidgetState();
        removeCallbacks(mRecreateRunnable);
        post(mRecreateRunnable);
    }

    protected void onDetachedFromWindow()
    {
        mUpdateMonitor.removeCallback(mInfoCallback);
        removeCallbacks(mRecreateRunnable);
        if (mBiometricUnlock != null)
            mBiometricUnlock.stop();
        super.onDetachedFromWindow();
    }

    public void onScreenTurnedOff()
    {
        mScreenOn = false;
        mForgotPattern = false;
        if (mLockScreen != null)
            ((KeyguardScreen)mLockScreen).onPause();
        if (mUnlockScreen != null)
            ((KeyguardScreen)mUnlockScreen).onPause();
        saveWidgetState();
        if (mBiometricUnlock != null)
            mBiometricUnlock.stop();
    }

    public void onScreenTurnedOn()
    {
        boolean flag;
        synchronized (mBiometricUnlockStartupLock)
        {
            mScreenOn = true;
            flag = mWindowFocused;
        }
        show();
        restoreWidgetState();
        if (mBiometricUnlock != null && flag)
            maybeStartBiometricUnlock();
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void onWindowFocusChanged(boolean flag)
    {
        Object obj = mBiometricUnlockStartupLock;
        obj;
        JVM INSTR monitorenter ;
        boolean flag1 = mScreenOn;
        boolean flag2;
        flag2 = false;
        if (!flag1)
            break MISSING_BLOCK_LABEL_38;
        boolean flag3 = mWindowFocused;
        flag2 = false;
        if (!flag3)
            flag2 = flag;
        mWindowFocused = flag;
        obj;
        JVM INSTR monitorexit ;
        Exception exception;
        if (!flag)
        {
            if (mBiometricUnlock != null)
            {
                mSuppressBiometricUnlock = true;
                mBiometricUnlock.stop();
                mBiometricUnlock.hide();
            }
        } else
        {
            mHasDialog = false;
            if (mBiometricUnlock != null && flag2)
            {
                maybeStartBiometricUnlock();
                return;
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void reset()
    {
        mIsVerifyUnlockOnly = false;
        mForgotPattern = false;
        post(mRecreateRunnable);
    }

    public void show()
    {
        if (mLockScreen != null)
            ((KeyguardScreen)mLockScreen).onResume();
        if (mUnlockScreen != null)
            ((KeyguardScreen)mUnlockScreen).onResume();
        if (mBiometricUnlock != null && mSuppressBiometricUnlock)
            mBiometricUnlock.hide();
    }

    public void verifyUnlock()
    {
        if (!isSecure())
        {
            getCallback().keyguardDone(true);
            return;
        }
        if (mUnlockScreenMode != UnlockMode.Pattern && mUnlockScreenMode != UnlockMode.Password)
        {
            getCallback().keyguardDone(false);
            return;
        } else
        {
            mIsVerifyUnlockOnly = true;
            updateScreen(Mode.UnlockScreen, false);
            return;
        }
    }

    public void wakeWhenReadyTq(int i)
    {
        if (i == 82 && isSecure() && mMode == Mode.LockScreen && mUpdateMonitor.getSimState() != com.android.internal.telephony.IccCardConstants.State.PUK_REQUIRED)
        {
            updateScreen(Mode.UnlockScreen, false);
            getCallback().pokeWakelock();
            return;
        } else
        {
            getCallback().pokeWakelock();
            return;
        }
    }







/*
    static boolean access$1202(LockPatternKeyguardView lockpatternkeyguardview, boolean flag)
    {
        lockpatternkeyguardview.mSuppressBiometricUnlock = flag;
        return flag;
    }

*/



/*
    static Parcelable access$1402(LockPatternKeyguardView lockpatternkeyguardview, Parcelable parcelable)
    {
        lockpatternkeyguardview.mSavedState = parcelable;
        return parcelable;
    }

*/









/*
    static boolean access$2102(LockPatternKeyguardView lockpatternkeyguardview, boolean flag)
    {
        lockpatternkeyguardview.mPluggedIn = flag;
        return flag;
    }

*/





/*
    static boolean access$502(LockPatternKeyguardView lockpatternkeyguardview, boolean flag)
    {
        lockpatternkeyguardview.mForgotPattern = flag;
        return flag;
    }

*/



/*
    static boolean access$602(LockPatternKeyguardView lockpatternkeyguardview, boolean flag)
    {
        lockpatternkeyguardview.mIsVerifyUnlockOnly = flag;
        return flag;
    }

*/





/*
    static boolean access$902(LockPatternKeyguardView lockpatternkeyguardview, boolean flag)
    {
        lockpatternkeyguardview.mEnableFallback = flag;
        return flag;
    }

*/
}
