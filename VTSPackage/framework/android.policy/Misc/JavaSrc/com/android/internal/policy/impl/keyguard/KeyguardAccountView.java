// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.accounts.*;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.UserHandle;
import android.text.*;
import android.util.AttributeSet;
import android.view.*;
import android.view.inputmethod.InputMethodManager;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import java.io.IOException;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardSecurityView, KeyguardSecurityCallback, SecurityMessageDisplay

public class KeyguardAccountView extends LinearLayout
    implements KeyguardSecurityView, android.view.View.OnClickListener, TextWatcher
{

    private static final int AWAKE_POKE_MILLIS = 30000;
    private static final String LOCK_PATTERN_CLASS = "com.android.settings.ChooseLockGeneric";
    private static final String LOCK_PATTERN_PACKAGE = "com.android.settings";
    private KeyguardSecurityCallback mCallback;
    private ProgressDialog mCheckingDialog;
    public boolean mEnableFallback;
    private LockPatternUtils mLockPatternUtils;
    private EditText mLogin;
    private Button mOk;
    private EditText mPassword;
    private SecurityMessageDisplay mSecurityMessageDisplay;

    public KeyguardAccountView(Context context)
    {
        KeyguardAccountView(context, null, 0);
    }

    public KeyguardAccountView(Context context, AttributeSet attributeset)
    {
        KeyguardAccountView(context, attributeset, 0);
    }

    public KeyguardAccountView(Context context, AttributeSet attributeset, int i)
    {
        LinearLayout(context, attributeset, i);
        mLockPatternUtils = new LockPatternUtils(getContext());
    }

    private void asyncCheckPassword()
    {
        mCallback.userActivity(30000L);
        String s = mLogin.getText().toString();
        String s1 = mPassword.getText().toString();
        Account account = findIntendedAccount(s);
        if (account == null)
        {
            postOnCheckPasswordResult(false);
            return;
        } else
        {
            getProgressDialog().show();
            Bundle bundle = new Bundle();
            bundle.putString("password", s1);
            AccountManager.get(mContext).confirmCredentialsAsUser(account, bundle, null, new AccountManagerCallback() {

                final KeyguardAccountView this$0;

                public void run(AccountManagerFuture accountmanagerfuture)
                {
                    KeyguardSecurityCallback keyguardsecuritycallback = mCallback;
                    if (keyguardsecuritycallback == null)
                    {
                        mLogin.post(new Runnable() {

                            final _cls2 this$1;

                            public void run()
                            {
                                getProgressDialog().hide();
                            }

            
            {
                this$1 = _cls2.this;
                Object();
            }
                        }
);
                        return;
                    }
                    mCallback.userActivity(30000L);
                    boolean flag = ((Bundle)accountmanagerfuture.getResult()).getBoolean("booleanResult");
                    postOnCheckPasswordResult(flag);
                    mLogin.post(new _cls1());
                    return;
                    OperationCanceledException operationcanceledexception;
                    operationcanceledexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                    return;
                    IOException ioexception;
                    ioexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                    return;
                    AuthenticatorException authenticatorexception;
                    authenticatorexception;
                    postOnCheckPasswordResult(false);
                    mLogin.post(new _cls1());
                    return;
                    Exception exception;
                    exception;
                    mLogin.post(new _cls1());
                    throw exception;
                }

            
            {
                this$0 = KeyguardAccountView.this;
                Object();
            }
            }
, null, new UserHandle(mLockPatternUtils.getCurrentUser()));
            return;
        }
    }

    private Account findIntendedAccount(String s)
    {
        Account aaccount[] = AccountManager.get(mContext).getAccountsByTypeAsUser("com.google", new UserHandle(mLockPatternUtils.getCurrentUser()));
        Account account = null;
        int i = 0;
        int j = aaccount.length;
        for (int k = 0; k < j; k++)
        {
            Account account1 = aaccount[k];
            byte byte0;
            if (s.equals(account1.name))
                byte0 = 4;
            else
            if (s.equalsIgnoreCase(account1.name))
            {
                byte0 = 3;
            } else
            {
                int l = s.indexOf('@');
                byte0 = 0;
                if (l < 0)
                {
                    int i1 = account1.name.indexOf('@');
                    byte0 = 0;
                    if (i1 >= 0)
                    {
                        String s1 = account1.name.substring(0, i1);
                        if (s.equals(s1))
                        {
                            byte0 = 2;
                        } else
                        {
                            boolean flag = s.equalsIgnoreCase(s1);
                            byte0 = 0;
                            if (flag)
                                byte0 = 1;
                        }
                    }
                }
            }
            if (byte0 > i)
            {
                account = account1;
                i = byte0;
                continue;
            }
            if (byte0 == i)
                account = null;
        }

        return account;
    }

    private Dialog getProgressDialog()
    {
        if (mCheckingDialog == null)
        {
            mCheckingDialog = new ProgressDialog(mContext);
            mCheckingDialog.setMessage(mContext.getString(0x104053c));
            mCheckingDialog.setIndeterminate(true);
            mCheckingDialog.setCancelable(false);
            mCheckingDialog.getWindow().setType(2009);
        }
        return mCheckingDialog;
    }

    private void postOnCheckPasswordResult(final boolean success)
    {
        mLogin.post(new Runnable() {

            final KeyguardAccountView this$0;
            final boolean val$success;

            public void run()
            {
                if (success)
                {
                    mLockPatternUtils.setPermanentlyLocked(false);
                    mLockPatternUtils.setLockPatternEnabled(false);
                    mLockPatternUtils.saveLockPattern(null);
                    Intent intent = new Intent();
                    intent.setClassName("com.android.settings", "com.android.settings.ChooseLockGeneric");
                    intent.setFlags(0x10000000);
                    access$100.startActivityAsUser(intent, new UserHandle(mLockPatternUtils.getCurrentUser()));
                    mCallback.reportSuccessfulUnlockAttempt();
                    mCallback.dismiss(true);
                    return;
                } else
                {
                    mSecurityMessageDisplay.setMessage(0x104053a, true);
                    mPassword.setText("");
                    mCallback.reportFailedUnlockAttempt();
                    return;
                }
            }

            
            {
                this$0 = KeyguardAccountView.this;
                success = flag;
                Object();
            }
        }
);
    }

    public void afterTextChanged(Editable editable)
    {
    }

    public void beforeTextChanged(CharSequence charsequence, int i, int j, int k)
    {
    }

    public void cleanUp()
    {
        if (mCheckingDialog != null)
            mCheckingDialog.hide();
        mCallback = null;
        mLockPatternUtils = null;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (keyevent.getAction() == 0 && keyevent.getKeyCode() == 4)
        {
            if (mLockPatternUtils.isPermanentlyLocked())
                mCallback.dismiss(false);
            return true;
        } else
        {
            return super.dispatchKeyEvent(keyevent);
        }
    }

    public KeyguardSecurityCallback getCallback()
    {
        return mCallback;
    }

    public void hideBouncer(int i)
    {
    }

    public boolean needsInput()
    {
        return true;
    }

    public void onClick(View view)
    {
        mCallback.userActivity(0L);
        if (view == mOk)
            asyncCheckPassword();
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        mLogin = (EditText)findViewById(0x10202a5);
        EditText edittext = mLogin;
        InputFilter ainputfilter[] = new InputFilter[1];
        ainputfilter[0] = new android.text.LoginFilter.UsernameFilterGeneric();
        edittext.setFilters(ainputfilter);
        mLogin.addTextChangedListener(this);
        mPassword = (EditText)findViewById(0x10202a6);
        mPassword.addTextChangedListener(this);
        mOk = (Button)findViewById(0x10202a7);
        mOk.setOnClickListener(this);
        mSecurityMessageDisplay = new KeyguardMessageArea.Helper(this);
        reset();
    }

    public void onPause()
    {
        InputMethodManager inputmethodmanager = (InputMethodManager)mContext.getSystemService("input_method");
        if (inputmethodmanager != null)
            inputmethodmanager.hideSoftInputFromWindow(getWindowToken(), 2);
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        return mLogin.requestFocus(i, rect);
    }

    public void onResume(int i)
    {
        reset();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        if (mCallback != null)
            mCallback.userActivity(30000L);
    }

    public void reset()
    {
        mLogin.setText("");
        mPassword.setText("");
        mLogin.requestFocus();
        boolean flag = mLockPatternUtils.isPermanentlyLocked();
        SecurityMessageDisplay securitymessagedisplay = mSecurityMessageDisplay;
        int i;
        if (flag)
            i = 0x1040535;
        else
            i = 0x1040536;
        boolean flag1;
        if (flag)
            flag1 = true;
        else
            flag1 = false;
        securitymessagedisplay.setMessage(i, flag1);
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
    }

    public void showUsabilityHint()
    {
    }








}
