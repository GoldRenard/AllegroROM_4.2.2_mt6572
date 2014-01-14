// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.accounts.*;
import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.media.AudioSystem;
import android.os.*;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import com.android.internal.widget.LockPatternUtils;
import com.android.internal.widget.LockPatternView;
import java.io.IOException;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, KeyguardUpdateMonitor, SecurityMessageDisplay, KeyguardSecurityViewHelper, 
//            KeyguardSecurityCallback

public class KeyguardPatternView extends LinearLayout
    implements KeyguardSecurityView
{
    private class AccountAnalyzer
        implements AccountManagerCallback
    {

        private int mAccountIndex;
        private final AccountManager mAccountManager;
        private final Account mAccounts[];
        final KeyguardPatternView this$0;

        private void next()
        {
            if (!mEnableFallback && mAccountIndex < mAccounts.length)
            {
                mAccountManager.confirmCredentialsAsUser(mAccounts[mAccountIndex], null, null, this, null, new UserHandle(mLockPatternUtils.getCurrentUser()));
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
            this$0 = KeyguardPatternView.this;
            super();
            mAccountManager = accountmanager;
            mAccounts = accountmanager.getAccountsByTypeAsUser("com.google", new UserHandle(mLockPatternUtils.getCurrentUser()));
        }

    }

    static final class FooterMode extends Enum
    {

        private static final FooterMode $VALUES[];
        public static final FooterMode ForgotLockPattern;
        public static final FooterMode Normal;
        public static final FooterMode VerifyUnlocked;

        public static FooterMode valueOf(String s)
        {
            return (FooterMode)Enum.valueOf(com/android/internal/policy/impl/keyguard/KeyguardPatternView$FooterMode, s);
        }

        public static FooterMode[] values()
        {
            return (FooterMode[])$VALUES.clone();
        }

        static 
        {
            Normal = new FooterMode("Normal", 0);
            ForgotLockPattern = new FooterMode("ForgotLockPattern", 1);
            VerifyUnlocked = new FooterMode("VerifyUnlocked", 2);
            FooterMode afootermode[] = new FooterMode[3];
            afootermode[0] = Normal;
            afootermode[1] = ForgotLockPattern;
            afootermode[2] = VerifyUnlocked;
            $VALUES = afootermode;
        }

        private FooterMode(String s, int i)
        {
            super(s, i);
        }
    }

    private class UnlockPatternListener
        implements com.android.internal.widget.LockPatternView.OnPatternListener
    {

        final KeyguardPatternView this$0;

        public void onPatternCellAdded(List list)
        {
            if (list.size() > 2)
            {
                mCallback.userActivity(7000L);
                return;
            } else
            {
                mCallback.userActivity(2000L);
                return;
            }
        }

        public void onPatternCleared()
        {
        }

        public void onPatternDetected(List list)
        {
            if (mLockPatternUtils.checkPattern(list))
            {
                mCallback.reportSuccessfulUnlockAttempt();
                mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Correct);
                mTotalFailedPatternAttempts = 0;
                mCallback.dismiss(true);
                return;
            }
            if (list.size() > 2)
                mCallback.userActivity(7000L);
            mLockPatternView.setDisplayMode(com.android.internal.widget.LockPatternView.DisplayMode.Wrong);
            if (list.size() >= 4)
            {
                int i = ((reportSuccessfulUnlockAttempt) (this)).reportSuccessfulUnlockAttempt;
                int i = ((LockPatternUtils) (this)).checkPattern;
                mCallback.reportFailedUnlockAttempt();
                if (KeyguardUpdateMonitor.getInstance(access$900).getFailedUnlockAttempts() % 5 == 0)
                {
                    long l = mLockPatternUtils.setLockoutAttemptDeadline();
                    handleAttemptLockout(l);
                }
            }
            mSecurityMessageDisplay.setMessage(0x1040524, true);
            mLockPatternView.postDelayed(mCancelPatternRunnable, 2000L);
        }

        public void onPatternStart()
        {
            mLockPatternView.removeCallbacks(mCancelPatternRunnable);
        }

        private UnlockPatternListener()
        {
            this$0 = KeyguardPatternView.this;
            super();
        }

    }


    private static final boolean DEBUG = false;
    private static final int MIN_PATTERN_BEFORE_POKE_WAKELOCK = 2;
    private static final int PATTERN_CLEAR_TIMEOUT_MS = 2000;
    private static final String TAG = "SecurityPatternView";
    private static final int UNLOCK_PATTERN_WAKE_INTERVAL_FIRST_DOTS_MS = 2000;
    private static final int UNLOCK_PATTERN_WAKE_INTERVAL_MS = 7000;
    private Drawable mBouncerFrame;
    private KeyguardSecurityCallback mCallback;
    private Runnable mCancelPatternRunnable = new Runnable() {

        final KeyguardPatternView this$0;

        public void run()
        {
            mLockPatternView.clearPattern();
        }

            
            {
                this$0 = KeyguardPatternView.this;
                super();
            }
    }
;
    private CountDownTimer mCountdownTimer;
    private View mEcaView;
    private boolean mEnableFallback;
    private int mFailedPatternAttemptsSinceLastTimeout;
    private Button mForgotPatternButton;
    private long mLastPokeTime;
    private LockPatternUtils mLockPatternUtils;
    private LockPatternView mLockPatternView;
    private SecurityMessageDisplay mSecurityMessageDisplay;
    private Rect mTempRect;
    private int mTotalFailedPatternAttempts;

    public KeyguardPatternView(Context context)
    {
        this(context, null);
    }

    public KeyguardPatternView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mFailedPatternAttemptsSinceLastTimeout = 0;
        mTotalFailedPatternAttempts = 0;
        mCountdownTimer = null;
        mLastPokeTime = -7000L;
        mTempRect = new Rect();
    }

    private void displayDefaultSecurityMessage()
    {
        if (KeyguardUpdateMonitor.getInstance(mContext).getMaxBiometricUnlockAttemptsReached())
        {
            if (mLockPatternUtils.usingBiometricWeak())
                mSecurityMessageDisplay.setMessage(0x10402f0, true);
            else
            if (mLockPatternUtils.usingVoiceWeak())
            {
                mSecurityMessageDisplay.setMessage(0x2050106, true);
                return;
            }
            return;
        } else
        {
            mSecurityMessageDisplay.setMessage(0x1040528, true);
            return;
        }
    }

    private void handleAttemptLockout(long l)
    {
        mLockPatternView.clearPattern();
        mLockPatternView.setEnabled(false);
        long l1 = SystemClock.elapsedRealtime();
        if (mEnableFallback)
            updateFooter(FooterMode.ForgotLockPattern);
        mCountdownTimer = (new CountDownTimer(l - l1, 1000L) {

            final KeyguardPatternView this$0;

            public void onFinish()
            {
                mLockPatternView.setEnabled(true);
                displayDefaultSecurityMessage();
                mFailedPatternAttemptsSinceLastTimeout = 0;
                if (mEnableFallback)
                {
                    updateFooter(FooterMode.ForgotLockPattern);
                    return;
                } else
                {
                    updateFooter(FooterMode.Normal);
                    return;
                }
            }

            public void onTick(long l2)
            {
                int i = (int)(l2 / 1000L);
                SecurityMessageDisplay securitymessagedisplay = mSecurityMessageDisplay;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                securitymessagedisplay.setMessage(0x1040527, true, aobj);
            }

            
            {
                this$0 = KeyguardPatternView.this;
                super(l, l1);
            }
        }
).start();
    }

    private void maybeEnableFallback(Context context)
    {
        (new AccountAnalyzer(AccountManager.get(context))).start();
    }

    private void updateFooter(FooterMode footermode)
    {
        if (mForgotPatternButton == null)
            return;
        static class _cls4
        {

            static final int $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardPatternView$FooterMode[];

            static 
            {
                $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardPatternView$FooterMode = new int[FooterMode.values().length];
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardPatternView$FooterMode[FooterMode.Normal.ordinal()] = 1;
                }
                catch (NoSuchFieldError nosuchfielderror) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardPatternView$FooterMode[FooterMode.ForgotLockPattern.ordinal()] = 2;
                }
                catch (NoSuchFieldError nosuchfielderror1) { }
                try
                {
                    $SwitchMap$com$android$internal$policy$impl$keyguard$KeyguardPatternView$FooterMode[FooterMode.VerifyUnlocked.ordinal()] = 3;
                }
                catch (NoSuchFieldError nosuchfielderror2)
                {
                    return;
                }
            }
        }

        switch (_cls4..SwitchMap.com.android.internal.policy.impl.keyguard.KeyguardPatternView.FooterMode[footermode.ordinal()])
        {
        case 3: // '\003'
            mForgotPatternButton.setVisibility(8);
            return;

        case 2: // '\002'
            mForgotPatternButton.setVisibility(0);
            return;

        case 1: // '\001'
            mForgotPatternButton.setVisibility(8);
            return;
        }
    }

    public void cleanUp()
    {
        mLockPatternUtils = null;
        mLockPatternView.setOnPatternListener(null);
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mCallback;
    }

    public void hideBouncer(int i)
    {
        KeyguardSecurityViewHelper.hideBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    public boolean needsInput()
    {
        return false;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        LockPatternUtils lockpatternutils;
        if (mLockPatternUtils == null)
            lockpatternutils = new LockPatternUtils(mContext);
        else
            lockpatternutils = mLockPatternUtils;
        mLockPatternUtils = lockpatternutils;
        mLockPatternView = (LockPatternView)findViewById(0x10202c4);
        mLockPatternView.setSaveEnabled(false);
        mLockPatternView.setFocusable(false);
        mLockPatternView.setOnPatternListener(new UnlockPatternListener());
        LockPatternView lockpatternview = mLockPatternView;
        boolean flag;
        if (!mLockPatternUtils.isVisiblePatternEnabled())
            flag = true;
        else
            flag = false;
        lockpatternview.setInStealthMode(flag);
        mLockPatternView.setTactileFeedbackEnabled(mLockPatternUtils.isTactileFeedbackEnabled());
        mForgotPatternButton = (Button)findViewById(0x10202ab);
        if (mForgotPatternButton != null)
        {
            mForgotPatternButton.setText(0x1040523);
            mForgotPatternButton.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardPatternView this$0;

                public void onClick(View view1)
                {
                    mCallback.showBackupSecurity();
                }

            
            {
                this$0 = KeyguardPatternView.this;
                super();
            }
            }
);
        }
        setFocusableInTouchMode(true);
        maybeEnableFallback(mContext);
        mSecurityMessageDisplay = new KeyguardMessageArea.Helper(this);
        mEcaView = findViewById(0x10202b1);
        View view = findViewById(0x10202ad);
        if (view != null)
            mBouncerFrame = view.getBackground();
    }

    public void onPause()
    {
        if (mCountdownTimer != null)
        {
            mCountdownTimer.cancel();
            mCountdownTimer = null;
        }
    }

    public void onResume(int i)
    {
        boolean flag;
label0:
        {
            reset();
            if (!AudioSystem.isStreamActive(3, 0))
            {
                boolean flag1 = AudioSystem.isStreamActive(10, 0);
                flag = false;
                if (!flag1)
                    break label0;
            }
            flag = true;
        }
        if (mLockPatternUtils.usingVoiceWeak() && flag)
            mSecurityMessageDisplay.setMessage(0x2050105, true);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = super.onTouchEvent(motionevent);
        long l = SystemClock.elapsedRealtime() - mLastPokeTime;
        if (flag && l > 6900L)
            mLastPokeTime = SystemClock.elapsedRealtime();
        mTempRect.set(0, 0, 0, 0);
        offsetRectIntoDescendantCoords(mLockPatternView, mTempRect);
        motionevent.offsetLocation(mTempRect.left, mTempRect.top);
        boolean flag1;
        if (!mLockPatternView.dispatchTouchEvent(motionevent) && !flag)
            flag1 = false;
        else
            flag1 = true;
        motionevent.offsetLocation(-mTempRect.left, -mTempRect.top);
        return flag1;
    }

    public void onWindowFocusChanged(boolean flag)
    {
        super.onWindowFocusChanged(flag);
        if (flag)
            reset();
    }

    public void reset()
    {
        mLockPatternView.enableInput();
        mLockPatternView.setEnabled(true);
        mLockPatternView.clearPattern();
        long l = mLockPatternUtils.getLockoutAttemptDeadline();
        if (l != 0L)
            handleAttemptLockout(l);
        else
            displayDefaultSecurityMessage();
        if (mCallback.isVerifyUnlockOnly())
        {
            updateFooter(FooterMode.VerifyUnlocked);
            return;
        }
        if (mEnableFallback && mTotalFailedPatternAttempts >= 5)
        {
            updateFooter(FooterMode.ForgotLockPattern);
            return;
        } else
        {
            updateFooter(FooterMode.Normal);
            return;
        }
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mCallback = keyguardsecuritycallback;
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }

    public void showBouncer(int i)
    {
        KeyguardSecurityViewHelper.showBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    public void showUsabilityHint()
    {
    }




/*
    static boolean access$1102(KeyguardPatternView keyguardpatternview, boolean flag)
    {
        keyguardpatternview.mEnableFallback = flag;
        return flag;
    }

*/







/*
    static int access$502(KeyguardPatternView keyguardpatternview, int i)
    {
        keyguardpatternview.mTotalFailedPatternAttempts = i;
        return i;
    }

*/


/*
    static int access$508(KeyguardPatternView keyguardpatternview)
    {
        int i = keyguardpatternview.mTotalFailedPatternAttempts;
        keyguardpatternview.mTotalFailedPatternAttempts = i + 1;
        return i;
    }

*/


/*
    static int access$602(KeyguardPatternView keyguardpatternview, int i)
    {
        keyguardpatternview.mFailedPatternAttemptsSinceLastTimeout = i;
        return i;
    }

*/


/*
    static int access$608(KeyguardPatternView keyguardpatternview)
    {
        int i = keyguardpatternview.mFailedPatternAttemptsSinceLastTimeout;
        keyguardpatternview.mFailedPatternAttemptsSinceLastTimeout = i + 1;
        return i;
    }

*/



}
