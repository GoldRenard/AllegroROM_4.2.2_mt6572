// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.media.AudioSystem;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardAbsKeyInputView, KeyguardSecurityView, LiftToActivateListener, SecurityMessageDisplay, 
//            KeyguardUpdateMonitor

public class KeyguardPINView extends KeyguardAbsKeyInputView
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{

    public KeyguardPINView(Context context)
    {
        this(context, null);
    }

    public KeyguardPINView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
    }

    protected int getPasswordTextViewId()
    {
        return 0x10202c6;
    }

    public int getWrongPasswordStringId()
    {
        return 0x1040526;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        View view = findViewById(0x10202d2);
        if (view != null)
        {
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardPINView this$0;

                public void onClick(View view2)
                {
                    doHapticKeyClick();
                    if (mPasswordEntry.isEnabled())
                        verifyPasswordAndUnlock();
                }

            
            {
                this$0 = KeyguardPINView.this;
                super();
            }
            }
);
            view.setOnHoverListener(new LiftToActivateListener(getContext()));
        }
        View view1 = findViewById(0x10202c7);
        if (view1 != null)
        {
            view1.setVisibility(0);
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardPINView this$0;

                public void onClick(View view2)
                {
                    if (mPasswordEntry.isEnabled())
                    {
                        CharSequence charsequence = mPasswordEntry.getText();
                        if (charsequence.length() > 0)
                            mPasswordEntry.setText(charsequence.subSequence(0, -1 + charsequence.length()));
                    }
                    doHapticKeyClick();
                }

            
            {
                this$0 = KeyguardPINView.this;
                super();
            }
            }
);
            view1.setOnLongClickListener(new android.view.View.OnLongClickListener() {

                final KeyguardPINView this$0;

                public boolean onLongClick(View view2)
                {
                    if (mPasswordEntry.isEnabled())
                        mPasswordEntry.setText("");
                    doHapticKeyClick();
                    return true;
                }

            
            {
                this$0 = KeyguardPINView.this;
                super();
            }
            }
);
        }
        mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
        mPasswordEntry.setInputType(18);
        mPasswordEntry.requestFocus();
    }

    public void onResume(int i)
    {
        boolean flag;
label0:
        {
            super.onResume(i);
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

    protected void resetState()
    {
        if (KeyguardUpdateMonitor.getInstance(mContext).getMaxBiometricUnlockAttemptsReached())
        {
            if (mLockPatternUtils.usingBiometricWeak())
                mSecurityMessageDisplay.setMessage(0x10402f0, true);
            else
            if (mLockPatternUtils.usingVoiceWeak())
                mSecurityMessageDisplay.setMessage(0x2050106, true);
        } else
        {
            mSecurityMessageDisplay.setMessage(0x104052a, true);
        }
        mPasswordEntry.setEnabled(true);
    }

    public void showUsabilityHint()
    {
    }
}
