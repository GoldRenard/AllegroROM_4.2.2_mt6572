// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Rect;
import android.os.CountDownTimer;
import android.os.SystemClock;
import android.security.KeyStore;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.text.method.TextKeyListener;
import android.view.*;
import android.view.inputmethod.*;
import android.widget.*;
import com.android.internal.widget.*;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class PasswordUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.widget.TextView.OnEditorActionListener
{

    private static final int MINIMUM_PASSWORD_LENGTH_BEFORE_REPORT = 3;
    private static final String TAG = "PasswordUnlockScreen";
    private final KeyguardScreenCallback mCallback;
    private final int mCreationHardKeyboardHidden;
    private final int mCreationOrientation;
    private final boolean mIsAlpha;
    private final PasswordEntryKeyboardHelper mKeyboardHelper;
    private final PasswordEntryKeyboardView mKeyboardView = (PasswordEntryKeyboardView)findViewById(0x1020221);
    private final LockPatternUtils mLockPatternUtils;
    private final EditText mPasswordEntry = (EditText)findViewById(0x10202c1);
    private boolean mResuming;
    private final KeyguardStatusViewManager mStatusViewManager;
    private final KeyguardUpdateMonitor mUpdateMonitor;
    private final boolean mUseSystemIME = true;

    public PasswordUnlockScreen(Context context, Configuration configuration, LockPatternUtils lockpatternutils, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback)
    {
        super(context);
        mCreationHardKeyboardHidden = configuration.hardKeyboardHidden;
        mCreationOrientation = configuration.orientation;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if (mCreationOrientation != 2)
            layoutinflater.inflate(0x1090065, this, true);
        else
            layoutinflater.inflate(0x1090064, this, true);
        mStatusViewManager = new KeyguardStatusViewManager(this, mUpdateMonitor, mLockPatternUtils, mCallback, true);
        int i = lockpatternutils.getKeyguardStoredPasswordQuality();
        boolean flag;
        if (0x40000 != i && 0x50000 != i && 0x60000 != i)
            flag = false;
        else
            flag = true;
        mIsAlpha = flag;
        mPasswordEntry.setOnEditorActionListener(this);
        mKeyboardHelper = new PasswordEntryKeyboardHelper(context, mKeyboardView, this, false);
        mKeyboardHelper.setEnableHaptics(mLockPatternUtils.isTactileFeedbackEnabled());
        boolean flag1 = false;
        if (mIsAlpha)
        {
            mKeyboardHelper.setKeyboardMode(0);
            mKeyboardView.setVisibility(8);
        } else
        {
            mKeyboardHelper.setKeyboardMode(1);
            PasswordEntryKeyboardView passwordentrykeyboardview = mKeyboardView;
            byte byte0;
            if (mCreationHardKeyboardHidden == 1)
                byte0 = 4;
            else
                byte0 = 0;
            passwordentrykeyboardview.setVisibility(byte0);
            View view = findViewById(0x10202ea);
            flag1 = false;
            if (view != null)
            {
                view.setVisibility(0);
                flag1 = true;
                view.setOnClickListener(new android.view.View.OnClickListener() {

                    final PasswordUnlockScreen this$0;

                    public void onClick(View view2)
                    {
                        mKeyboardHelper.handleBackspace();
                    }

            
            {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
                }
);
            }
        }
        mPasswordEntry.requestFocus();
        if (mIsAlpha)
        {
            mPasswordEntry.setKeyListener(TextKeyListener.getInstance());
            mPasswordEntry.setInputType(129);
        } else
        {
            mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
            mPasswordEntry.setInputType(18);
        }
        mPasswordEntry.setOnClickListener(new android.view.View.OnClickListener() {

            final PasswordUnlockScreen this$0;

            public void onClick(View view2)
            {
                mCallback.pokeWakelock();
            }

            
            {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
        }
);
        mPasswordEntry.addTextChangedListener(new TextWatcher() {

            final PasswordUnlockScreen this$0;

            public void afterTextChanged(Editable editable)
            {
                if (!mResuming)
                    mCallback.pokeWakelock();
            }

            public void beforeTextChanged(CharSequence charsequence, int j, int k, int l)
            {
            }

            public void onTextChanged(CharSequence charsequence, int j, int k, int l)
            {
            }

            
            {
                this$0 = PasswordUnlockScreen.this;
                super();
            }
        }
);
        View view1 = findViewById(0x10202c2);
        final InputMethodManager imm = (InputMethodManager)getContext().getSystemService("input_method");
        if (mIsAlpha && view1 != null && hasMultipleEnabledIMEsOrSubtypes(imm, false))
        {
            view1.setVisibility(0);
            flag1 = true;
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final PasswordUnlockScreen this$0;
                final InputMethodManager val$imm;

                public void onClick(View view2)
                {
                    mCallback.pokeWakelock();
                    imm.showInputMethodPicker();
                }

            
            {
                this$0 = PasswordUnlockScreen.this;
                imm = inputmethodmanager;
                super();
            }
            }
);
        }
        if (!flag1)
        {
            android.view.ViewGroup.LayoutParams layoutparams = mPasswordEntry.getLayoutParams();
            if (layoutparams instanceof android.view.ViewGroup.MarginLayoutParams)
            {
                ((android.view.ViewGroup.MarginLayoutParams)layoutparams).leftMargin = 0;
                mPasswordEntry.setLayoutParams(layoutparams);
            }
        }
    }

    private void handleAttemptLockout(long l)
    {
        mPasswordEntry.setEnabled(false);
        mKeyboardView.setEnabled(false);
        (new CountDownTimer(l - SystemClock.elapsedRealtime(), 1000L) {

            final PasswordUnlockScreen this$0;

            public void onFinish()
            {
                mPasswordEntry.setEnabled(true);
                mKeyboardView.setEnabled(true);
                mStatusViewManager.resetStatusInfo();
            }

            public void onTick(long l1)
            {
                int i = (int)(l1 / 1000L);
                Context context = getContext();
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i);
                String s = context.getString(0x104030c, aobj);
                mStatusViewManager.setInstructionText(s);
            }

            
            {
                this$0 = PasswordUnlockScreen.this;
                super(l, l1);
            }
        }
).start();
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

    private void verifyPasswordAndUnlock()
    {
        String s = mPasswordEntry.getText().toString();
        if (mLockPatternUtils.checkPassword(s))
        {
            mCallback.keyguardDone(true);
            mCallback.reportSuccessfulUnlockAttempt();
            mStatusViewManager.setInstructionText(null);
            KeyStore.getInstance().password(s);
        } else
        if (s.length() > 3)
        {
            mCallback.reportFailedUnlockAttempt();
            if (mUpdateMonitor.getFailedAttempts() % 5 == 0)
                handleAttemptLockout(mLockPatternUtils.setLockoutAttemptDeadline());
            mStatusViewManager.setInstructionText(mContext.getString(0x10402ef));
        } else
        if (s.length() > 0)
            mStatusViewManager.setInstructionText(mContext.getString(0x10402ef));
        mPasswordEntry.setText("");
    }

    public void cleanUp()
    {
        mUpdateMonitor.removeCallback(this);
    }

    public boolean needsInput()
    {
        return mIsAlpha;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        Configuration configuration = getResources().getConfiguration();
        if (configuration.orientation != mCreationOrientation || configuration.hardKeyboardHidden != mCreationHardKeyboardHidden)
            mCallback.recreateMe(configuration);
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        if (configuration.orientation != mCreationOrientation || configuration.hardKeyboardHidden != mCreationHardKeyboardHidden)
            mCallback.recreateMe(configuration);
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

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        mCallback.pokeWakelock();
        return false;
    }

    public void onKeyboardChange(boolean flag)
    {
        PasswordEntryKeyboardView passwordentrykeyboardview = mKeyboardView;
        byte byte0;
        if (flag)
            byte0 = 4;
        else
            byte0 = 0;
        passwordentrykeyboardview.setVisibility(byte0);
    }

    public void onPause()
    {
        mStatusViewManager.onPause();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        return mPasswordEntry.requestFocus(i, rect);
    }

    public void onResume()
    {
        mResuming = true;
        mStatusViewManager.onResume();
        mPasswordEntry.setText("");
        mPasswordEntry.requestFocus();
        long l = mLockPatternUtils.getLockoutAttemptDeadline();
        if (l != 0L)
            handleAttemptLockout(l);
        mResuming = false;
    }






}
