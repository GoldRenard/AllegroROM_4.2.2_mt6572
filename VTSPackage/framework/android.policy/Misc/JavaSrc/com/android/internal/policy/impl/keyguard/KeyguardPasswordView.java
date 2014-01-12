// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.content.Context;
import android.content.res.Resources;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.TextKeyListener;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.inputmethod.*;
import android.widget.TextView;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardAbsKeyInputView, KeyguardSecurityView, KeyguardUtils, SecurityMessageDisplay, 
//            KeyguardSecurityCallback

public class KeyguardPasswordView extends KeyguardAbsKeyInputView
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{

    private static final String TAG = "KeyguardPasswordView";
    InputMethodManager mImm;
    private final boolean mShowImeAtScreenOn;
    private int mTempLocation[];

    public KeyguardPasswordView(Context context)
    {
        this(context, null);
    }

    public KeyguardPasswordView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTempLocation = new int[2];
        mShowImeAtScreenOn = context.getResources().getBoolean(0x1110003);
    }

    private boolean hasMultipleEnabledIMEsOrSubtypes(InputMethodManager inputmethodmanager, boolean flag)
    {
        boolean flag1;
label0:
        {
            List list = inputmethodmanager.getEnabledInputMethodList();
            int i = 0;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                InputMethodInfo inputmethodinfo = (InputMethodInfo)iterator.next();
                if (i > 1)
                    return true;
                List list1 = inputmethodmanager.getEnabledInputMethodSubtypeList(inputmethodinfo, true);
                if (list1.isEmpty())
                {
                    i++;
                } else
                {
                    int k = 0;
                    Iterator iterator1 = list1.iterator();
                    do
                    {
                        if (!iterator1.hasNext())
                            break;
                        if (((InputMethodSubtype)iterator1.next()).isAuxiliary())
                            k++;
                    } while (true);
                    if (list1.size() - k > 0 || flag && k > 1)
                        i++;
                }
            } while (true);
            if (i <= 1)
            {
                int j = inputmethodmanager.getEnabledInputMethodSubtypeList(null, false).size();
                flag1 = false;
                if (j <= 1)
                    break label0;
            }
            flag1 = true;
        }
        return flag1;
    }

    protected int getPasswordTextViewId()
    {
        return 0x10202c1;
    }

    public int getWrongPasswordStringId()
    {
        return 0x1040525;
    }

    public boolean needsInput()
    {
        return true;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mImm = (InputMethodManager)getContext().getSystemService("input_method");
        mPasswordEntry.setKeyListener(TextKeyListener.getInstance());
        mPasswordEntry.setInputType(129);
        mPasswordEntry.setOnClickListener(new android.view.View.OnClickListener() {

            final KeyguardPasswordView this$0;

            public void onClick(View view1)
            {
                mCallback.userActivity(0L);
            }

            
            {
                this$0 = KeyguardPasswordView.this;
                super();
            }
        }
);
        mPasswordEntry.addTextChangedListener(new TextWatcher() {

            final KeyguardPasswordView this$0;

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
                this$0 = KeyguardPasswordView.this;
                super();
            }
        }
);
        mPasswordEntry.requestFocus();
        View view = findViewById(0x10202c2);
        boolean flag = false;
        if (view != null)
        {
            boolean flag1 = hasMultipleEnabledIMEsOrSubtypes(mImm, false);
            flag = false;
            if (flag1)
            {
                view.setVisibility(0);
                flag = true;
                view.setOnClickListener(new android.view.View.OnClickListener() {

                    final KeyguardPasswordView this$0;

                    public void onClick(View view1)
                    {
                        mCallback.userActivity(0L);
                        mImm.showInputMethodPicker();
                    }

            
            {
                this$0 = KeyguardPasswordView.this;
                super();
            }
                }
);
            }
        }
        if (!flag)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mPasswordEntry.getLayoutParams();
            if (layoutparams instanceof android.view.ViewGroup.MarginLayoutParams)
            {
                ((android.view.ViewGroup.MarginLayoutParams)layoutparams).setMarginStart(0);
                mPasswordEntry.setLayoutParams(layoutparams);
            }
        }
    }

    public void onPause()
    {
        super.onPause();
        mImm.hideSoftInputFromWindow(getWindowToken(), 0);
    }

    public void onResume(int i)
    {
        super.onResume(i);
        mPasswordEntry.requestFocus();
        mPasswordEntry.getLocationOnScreen(mTempLocation);
        boolean flag;
        if (mTempLocation[1] >= 0 && mTempLocation[1] <= mContext.getResources().getDisplayMetrics().heightPixels)
            flag = true;
        else
            flag = false;
        KeyguardUtils.xlogD("KeyguardPasswordView", (new StringBuilder()).append("reason=").append(i).append(", mShowImeAtScreenOn=").append(mShowImeAtScreenOn).append(", passwordEntryVisible=").append(flag).toString());
        if (i != 1 || mShowImeAtScreenOn && flag)
            mImm.showSoftInput(mPasswordEntry, 1);
    }

    protected void resetState()
    {
        mSecurityMessageDisplay.setMessage(0x104052b, true);
        mPasswordEntry.setEnabled(true);
    }

    public void showUsabilityHint()
    {
    }
}
