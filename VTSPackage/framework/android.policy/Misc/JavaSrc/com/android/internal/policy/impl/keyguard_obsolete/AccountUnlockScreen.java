// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.accounts.*;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Bundle;
import android.text.*;
import android.view.*;
import android.widget.*;
import com.android.internal.widget.LockPatternUtils;
import java.io.IOException;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class AccountUnlockScreen extends RelativeLayout
    implements KeyguardScreen, android.view.View.OnClickListener, TextWatcher
{

    private static final int AWAKE_POKE_MILLIS = 30000;
    private static final String LOCK_PATTERN_CLASS = "com.android.settings.ChooseLockGeneric";
    private static final String LOCK_PATTERN_PACKAGE = "com.android.settings";
    private KeyguardScreenCallback mCallback;
    private ProgressDialog mCheckingDialog;
    private TextView mInstructions;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private EditText mLogin;
    private Button mOk;
    private EditText mPassword;
    private TextView mTopHeader;
    private KeyguardUpdateMonitor mUpdateMonitor;

    public AccountUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils)
    {
        super(context);
        mCallback = keyguardscreencallback;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater.from(context).inflate(0x1090062, this, true);
        mTopHeader = (TextView)findViewById(0x10202d4);
        TextView textview = mTopHeader;
        int i;
        if (mLockPatternUtils.isPermanentlyLocked())
            i = 0x104030f;
        else
            i = 0x104030e;
        textview.setText(i);
        mInstructions = (TextView)findViewById(0x10202d6);
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
        mUpdateMonitor = keyguardupdatemonitor;
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, true);
    }

    private void asyncCheckPassword()
    {
        mCallback.pokeWakelock(30000);
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
            AccountManager.get(mContext).confirmCredentials(account, bundle, null, new AccountManagerCallback() {

                final AccountUnlockScreen this$0;

                public void run(AccountManagerFuture accountmanagerfuture)
                {
                    mCallback.pokeWakelock(30000);
                    boolean flag = ((Bundle)accountmanagerfuture.getResult()).getBoolean("booleanResult");
                    postOnCheckPasswordResult(flag);
                    mLogin.post(new Runnable() {

                        final _cls2 this$1;

                        public void run()
                        {
                            getProgressDialog().hide();
                        }

            
            {
                this$1 = _cls2.this;
                super();
            }
                    }
);
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
                this$0 = AccountUnlockScreen.this;
                super();
            }
            }
, null);
            return;
        }
    }

    private Account findIntendedAccount(String s)
    {
        Account aaccount[] = AccountManager.get(mContext).getAccountsByType("com.google");
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
            mCheckingDialog.setMessage(mContext.getString(0x1040316));
            mCheckingDialog.setIndeterminate(true);
            mCheckingDialog.setCancelable(false);
            mCheckingDialog.getWindow().setType(2009);
        }
        return mCheckingDialog;
    }

    private void postOnCheckPasswordResult(final boolean success)
    {
        mLogin.post(new Runnable() );
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
        mUpdateMonitor.removeCallback(this);
        mCallback = null;
        mLockPatternUtils = null;
        mUpdateMonitor = null;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        if (keyevent.getAction() == 0 && keyevent.getKeyCode() == 4)
        {
            if (mLockPatternUtils.isPermanentlyLocked())
                mCallback.goToLockScreen();
            else
                mCallback.forgotPattern(false);
            return true;
        } else
        {
            return dispatchKeyEvent(keyevent);
        }
    }

    public boolean needsInput()
    {
        return true;
    }

    public void onClick(View view)
    {
        mCallback.pokeWakelock();
        if (view == mOk)
            asyncCheckPassword();
    }

    public void onPause()
    {
        mKeyguardStatusViewManager.onPause();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        return mLogin.requestFocus(i, rect);
    }

    public void onResume()
    {
        mLogin.setText("");
        mPassword.setText("");
        mLogin.requestFocus();
        mKeyguardStatusViewManager.onResume();
    }

    public void onTextChanged(CharSequence charsequence, int i, int j, int k)
    {
        mCallback.pokeWakelock(30000);
    }








}
