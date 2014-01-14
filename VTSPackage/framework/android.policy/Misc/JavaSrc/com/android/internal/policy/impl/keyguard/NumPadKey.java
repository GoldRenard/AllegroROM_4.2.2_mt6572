// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.text.SpannableStringBuilder;
import android.text.style.TextAppearanceSpan;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LiftToActivateListener, ObscureSpeechDelegate

public class NumPadKey extends Button
{

    static String sKlondike[];
    int mDigit;
    boolean mEnableHaptics;
    private android.view.View.OnClickListener mListener = new android.view.View.OnClickListener() {

        final NumPadKey this$0;

        public void onClick(View view)
        {
            if (mTextView == null && mTextViewResId > 0)
            {
                View view1 = getRootView().findViewById(mTextViewResId);
                if (view1 != null && (view1 instanceof TextView))
                    mTextView = (TextView)view1;
            }
            if (mTextView != null && mTextView.isEnabled())
                mTextView.append(String.valueOf(mDigit));
            doHapticKeyClick();
        }

            
            {
                this$0 = NumPadKey.this;
                super();
            }
    }
;
    TextView mTextView;
    int mTextViewResId;

    public NumPadKey(Context context)
    {
        this(context, null);
    }

    public NumPadKey(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public NumPadKey(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mDigit = -1;
        mTextView = null;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.NumPadKey);
        mDigit = typedarray.getInt(0, mDigit);
        setTextViewResId(typedarray.getResourceId(1, 0));
        setOnClickListener(mListener);
        setOnHoverListener(new LiftToActivateListener(context));
        setAccessibilityDelegate(new ObscureSpeechDelegate(context));
        mEnableHaptics = (new LockPatternUtils(context)).isTactileFeedbackEnabled();
        SpannableStringBuilder spannablestringbuilder = new SpannableStringBuilder();
        spannablestringbuilder.append(String.valueOf(mDigit));
        if (mDigit >= 0)
        {
            if (sKlondike == null)
                sKlondike = context.getResources().getStringArray(0x1070012);
            if (sKlondike != null && sKlondike.length > mDigit)
            {
                String s = sKlondike[mDigit];
                int j = s.length();
                if (j > 0)
                {
                    spannablestringbuilder.append(" ");
                    spannablestringbuilder.append(s);
                    spannablestringbuilder.setSpan(new TextAppearanceSpan(context, 0x10302a5), spannablestringbuilder.length() - j, spannablestringbuilder.length(), 0);
                }
            }
        }
        setText(spannablestringbuilder);
    }

    public void doHapticKeyClick()
    {
        if (mEnableHaptics)
            performHapticFeedback(1, 3);
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        ObscureSpeechDelegate.sAnnouncedHeadset = false;
    }

    public void setTextView(TextView textview)
    {
        mTextView = textview;
    }

    public void setTextViewResId(int i)
    {
        mTextView = null;
        mTextViewResId = i;
    }
}
