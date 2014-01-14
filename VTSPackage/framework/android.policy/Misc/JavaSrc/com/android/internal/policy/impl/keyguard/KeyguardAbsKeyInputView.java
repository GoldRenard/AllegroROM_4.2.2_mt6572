// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, KeyguardSecurityCallback, KeyguardSecurityViewHelper, KeyguardSimPinPukView, 
//            SecurityMessageDisplay

public abstract class KeyguardAbsKeyInputView extends LinearLayout
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{

    protected static final int MINIMUM_PASSWORD_LENGTH_BEFORE_REPORT = 3;
    private Drawable mBouncerFrame;
    protected KeyguardSecurityCallback mCallback;
    protected View mEcaView;
    protected boolean mEnableHaptics;
    protected LockPatternUtils mLockPatternUtils;
    protected TextView mPasswordEntry;
    protected SecurityMessageDisplay mSecurityMessageDisplay;

    public KeyguardAbsKeyInputView(Context context)
    {
        KeyguardAbsKeyInputView(context, null);
    }

    public KeyguardAbsKeyInputView(Context context, AttributeSet attributeset)
    {
        LinearLayout(context, attributeset);
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        if (mCallback != null)
            mCallback.userActivity(5000L);
    }

    public void doHapticKeyClick()
    {
        if (mEnableHaptics)
            performHapticFeedback(1, 3);
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mCallback;
    }

    protected abstract int getPasswordTextViewId();

    protected int getWrongPasswordStringId()
    {
        return 0x1040525;
    }

    protected void handleAttemptLockout(long l)
    {
        mPasswordEntry.setEnabled(false);
        (new CountDownTimer(l - SystemClock.elapsedRealtime(), 1000L) {

            final KeyguardAbsKeyInputView this$0;

            public void onFinish()
            {
                mSecurityMessageDisplay.setMessage("", false);
                resetState();
            }

            public void onTick(long l1)
            {
                int i = (int)(l1 / 1000L);
                SecurityMessageDisplay securitymessagedisplay = mSecurityMessageDisplay;
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                securitymessagedisplay.setMessage(0x1040527, true, aobj);
            }

            
            {
                this$0 = KeyguardAbsKeyInputView.this;
                CountDownTimer(l, l1);
            }
        }
).start();
    }

    public void hideBouncer(int i)
    {
        KeyguardSecurityViewHelper.hideBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    public boolean needsInput()
    {
        return false;
    }

    public boolean onEditorAction(TextView textview, int i, KeyEvent keyevent)
    {
        if (i != 0 && i != 6 && i != 5)
        {
            return false;
        } else
        {
            verifyPasswordAndUnlock();
            return true;
        }
    }

    protected void onFinishInflate()
    {
        mLockPatternUtils = new LockPatternUtils(mContext);
        mPasswordEntry = (TextView)findViewById(getPasswordTextViewId());
        mPasswordEntry.setOnEditorActionListener(this);
        mPasswordEntry.addTextChangedListener(this);
        mPasswordEntry.setSelected(true);
        mPasswordEntry.setOnClickListener(new android.view.View.OnClickListener() {

            final KeyguardAbsKeyInputView this$0;

            public void onClick(View view1)
            {
                mCallback.userActivity(0L);
            }

            
            {
                this$0 = KeyguardAbsKeyInputView.this;
                Object();
            }
        }
);
        mPasswordEntry.addTextChangedListener(new TextWatcher() {

            final KeyguardAbsKeyInputView this$0;

            public void afterTextChanged(Editable editable)
            {
                if (mCallback != null)
                    mCallback.userActivity(0L);
            }

            public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
            {
            }

            public void onTextChanged(CharSequence charsequence, int i, int j, int k)
            {
            }

            
            {
                this$0 = KeyguardAbsKeyInputView.this;
                Object();
            }
        }
);
        mSecurityMessageDisplay = new Helper(this);
        View view;
        if (this instanceof KeyguardSimPinPukView)
        {
            mEcaView = findViewById(0x2100045);
            view = findViewById(0x2100036);
        } else
        {
            mEcaView = findViewById(0x10202b1);
            view = findViewById(0x10202ad);
        }
        if (view != null)
            mBouncerFrame = view.getBackground();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        mCallback.userActivity(0L);
        return false;
    }

    public void onPause()
    {
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        return mPasswordEntry.requestFocus(i, rect);
    }

    public void onResume(int i)
    {
        reset();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void onWindowFocusChanged(boolean flag)
    {
        if (flag)
            reset();
    }

    public void reset()
    {
        mPasswordEntry.setText("");
        mPasswordEntry.requestFocus();
        long l = mLockPatternUtils.getLockoutAttemptDeadline();
        if (l != 0L)
        {
            handleAttemptLockout(l);
            return;
        } else
        {
            resetState();
            return;
        }
    }

    protected abstract void resetState();

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mCallback = keyguardsecuritycallback;
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
        mEnableHaptics = mLockPatternUtils.isTactileFeedbackEnabled();
    }

    public void showBouncer(int i)
    {
        KeyguardSecurityViewHelper.showBouncer(mSecurityMessageDisplay, mEcaView, mBouncerFrame, i);
    }

    protected void verifyPasswordAndUnlock()
    {
        String s = mPasswordEntry.getText().toString();
        if (mLockPatternUtils.checkPassword(s))
        {
            mCallback.reportSuccessfulUnlockAttempt();
            mCallback.dismiss(true);
        } else
        if (s.length() > 3)
        {
            mCallback.reportFailedUnlockAttempt();
            if (mCallback.getFailedAttempts() % 5 == 0)
                handleAttemptLockout(mLockPatternUtils.setLockoutAttemptDeadline());
            mSecurityMessageDisplay.setMessage(getWrongPasswordStringId(), true);
        }
        mPasswordEntry.setText("");
    }
}
