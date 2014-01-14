// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard_obsolete;

import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.text.Editable;
import android.view.*;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;
import com.android.internal.widget.LockPatternUtils;

// Referenced classes of package com.android.internal.policy.impl.keyguard_obsolete:
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardUpdateMonitor, KeyguardScreenCallback

public class SimPukUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.view.View.OnClickListener, android.view.View.OnFocusChangeListener
{
    private abstract class CheckSimPuk extends Thread
    {

        private final String mPin;
        private final String mPuk;
        final SimPukUnlockScreen this$0;

        abstract void onSimLockChangedResponse(boolean flag);

        public void run()
        {
            try
            {
                boolean flag = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPuk(mPuk, mPin);
                post(flag. new Runnable() {

                    final CheckSimPuk this$1;
                    final boolean val$result;

                    public void run()
                    {
                        onSimLockChangedResponse(result);
                    }

            
            {
                this$1 = final_checksimpuk;
                result = Z.this;
                super();
            }
                }
);
                return;
            }
            catch (RemoteException remoteexception)
            {
                post(new Runnable() {

                    final CheckSimPuk this$1;

                    public void run()
                    {
                        onSimLockChangedResponse(false);
                    }

            
            {
                this$1 = CheckSimPuk.this;
                super();
            }
                }
);
            }
        }

        protected CheckSimPuk(String s, String s1)
        {
            this$0 = SimPukUnlockScreen.this;
            super();
            mPuk = s;
            mPin = s1;
        }
    }

    private class TouchInput
        implements android.view.View.OnClickListener
    {

        private TextView mCancelButton;
        private TextView mEight;
        private TextView mFive;
        private TextView mFour;
        private TextView mNine;
        private TextView mOne;
        private TextView mSeven;
        private TextView mSix;
        private TextView mThree;
        private TextView mTwo;
        private TextView mZero;
        final SimPukUnlockScreen this$0;

        private int checkDigit(View view)
        {
            byte byte0 = -1;
            if (view == mZero)
            {
                byte0 = 0;
            } else
            {
                if (view == mOne)
                    return 1;
                if (view == mTwo)
                    return 2;
                if (view == mThree)
                    return 3;
                if (view == mFour)
                    return 4;
                if (view == mFive)
                    return 5;
                if (view == mSix)
                    return 6;
                if (view == mSeven)
                    return 7;
                if (view == mEight)
                    return 8;
                if (view == mNine)
                    return 9;
            }
            return byte0;
        }

        public void onClick(View view)
        {
            if (view == mCancelButton)
            {
                mPinText.setText("");
                mPukText.setText("");
                mCallback.goToLockScreen();
            } else
            {
                int i = checkDigit(view);
                if (i >= 0)
                {
                    mCallback.pokeWakelock(5000);
                    reportDigit(i);
                    return;
                }
            }
        }

        private TouchInput()
        {
            this$0 = SimPukUnlockScreen.this;
            super();
            mZero = (TextView)findViewById(0x10203a9);
            mOne = (TextView)findViewById(0x10203a0);
            mTwo = (TextView)findViewById(0x10203a1);
            mThree = (TextView)findViewById(0x10203a2);
            mFour = (TextView)findViewById(0x10203a3);
            mFive = (TextView)findViewById(0x10203a4);
            mSix = (TextView)findViewById(0x10203a5);
            mSeven = (TextView)findViewById(0x10203a6);
            mEight = (TextView)findViewById(0x10203a7);
            mNine = (TextView)findViewById(0x10203a8);
            mCancelButton = (TextView)findViewById(0x1020277);
            mZero.setText("0");
            mOne.setText("1");
            mTwo.setText("2");
            mThree.setText("3");
            mFour.setText("4");
            mFive.setText("5");
            mSix.setText("6");
            mSeven.setText("7");
            mEight.setText("8");
            mNine.setText("9");
            mZero.setOnClickListener(this);
            mOne.setOnClickListener(this);
            mTwo.setOnClickListener(this);
            mThree.setOnClickListener(this);
            mFour.setOnClickListener(this);
            mFive.setOnClickListener(this);
            mSix.setOnClickListener(this);
            mSeven.setOnClickListener(this);
            mEight.setOnClickListener(this);
            mNine.setOnClickListener(this);
            mCancelButton.setOnClickListener(this);
        }

    }


    private static final char DIGITS[] = {
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
    };
    private static final int DIGIT_PRESS_WAKE_MILLIS = 5000;
    private final KeyguardScreenCallback mCallback;
    private int mCreationOrientation;
    private View mDelPinButton;
    private View mDelPukButton;
    private TextView mFocusedEntry;
    private TextView mHeaderText;
    private int mKeyboardHidden;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private View mOkButton;
    private TextView mPinText;
    private TextView mPukText;
    private ProgressDialog mSimUnlockProgressDialog;
    private final KeyguardUpdateMonitor mUpdateMonitor;

    public SimPukUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils)
    {
        super(context);
        mSimUnlockProgressDialog = null;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCreationOrientation = configuration.orientation;
        mKeyboardHidden = configuration.hardKeyboardHidden;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if (mKeyboardHidden == 1)
        {
            layoutinflater.inflate(0x1090068, this, true);
        } else
        {
            layoutinflater.inflate(0x1090069, this, true);
            new TouchInput();
        }
        mHeaderText = (TextView)findViewById(0x10202ee);
        mPukText = (TextView)findViewById(0x10202f7);
        mPinText = (TextView)findViewById(0x10202f0);
        mDelPukButton = findViewById(0x10202f8);
        mDelPinButton = findViewById(0x10202ea);
        mOkButton = findViewById(0x10202a7);
        mDelPinButton.setOnClickListener(this);
        mDelPukButton.setOnClickListener(this);
        mOkButton.setOnClickListener(this);
        mHeaderText.setText(0x10402dd);
        mHeaderText.setSelected(true);
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, true);
        mPinText.setFocusableInTouchMode(true);
        mPinText.setOnFocusChangeListener(this);
        mPukText.setFocusableInTouchMode(true);
        mPukText.setOnFocusChangeListener(this);
    }

    private void checkPuk()
    {
        if (mPukText.getText().length() < 8)
        {
            mHeaderText.setText(0x1040082);
            mPukText.setText("");
            return;
        }
        if (mPinText.getText().length() >= 4 && mPinText.getText().length() <= 8)
        {
            getSimUnlockProgressDialog().show();
            (new CheckSimPuk(mPukText.getText().toString(), mPinText.getText().toString()) {

                final SimPukUnlockScreen this$0;

                void onSimLockChangedResponse(boolean flag)
                {
                    mPinText.post(flag. new Runnable() {

                        final _cls1 this$1;
                        final boolean val$success;

                        public void run()
                        {
                            if (mSimUnlockProgressDialog != null)
                                mSimUnlockProgressDialog.hide();
                            if (success)
                            {
                                mUpdateMonitor.reportSimUnlocked();
                                mCallback.goToUnlockScreen();
                                return;
                            } else
                            {
                                mHeaderText.setText(0x104007f);
                                mPukText.setText("");
                                mPinText.setText("");
                                return;
                            }
                        }

            
            {
                this$1 = final__pcls1;
                success = Z.this;
                super();
            }
                    }
);
                }

            
            {
                this$0 = SimPukUnlockScreen.this;
                super(s, s1);
            }
            }
).start();
            return;
        } else
        {
            mHeaderText.setText(0x1040081);
            mPinText.setText("");
            return;
        }
    }

    private Dialog getSimUnlockProgressDialog()
    {
        if (mSimUnlockProgressDialog == null)
        {
            mSimUnlockProgressDialog = new ProgressDialog(mContext);
            mSimUnlockProgressDialog.setMessage(mContext.getString(0x1040305));
            mSimUnlockProgressDialog.setIndeterminate(true);
            mSimUnlockProgressDialog.setCancelable(false);
            mSimUnlockProgressDialog.getWindow().setType(2009);
        }
        return mSimUnlockProgressDialog;
    }

    private void reportDigit(int i)
    {
        mFocusedEntry.append(Integer.toString(i));
    }

    public void cleanUp()
    {
        if (mSimUnlockProgressDialog != null)
        {
            mSimUnlockProgressDialog.dismiss();
            mSimUnlockProgressDialog = null;
        }
        mUpdateMonitor.removeCallback(this);
    }

    public boolean needsInput()
    {
        return false;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    public void onClick(View view)
    {
        if (view == mDelPukButton)
        {
            if (mFocusedEntry != mPukText)
                mPukText.requestFocus();
            Editable editable1 = mPukText.getEditableText();
            int j = editable1.length();
            if (j > 0)
                editable1.delete(j - 1, j);
        } else
        if (view == mDelPinButton)
        {
            if (mFocusedEntry != mPinText)
                mPinText.requestFocus();
            Editable editable = mPinText.getEditableText();
            int i = editable.length();
            if (i > 0)
                editable.delete(i - 1, i);
        } else
        if (view == mOkButton)
            checkPuk();
        mCallback.pokeWakelock(5000);
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public void onFocusChange(View view, boolean flag)
    {
        if (flag)
            mFocusedEntry = (TextView)view;
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i == 4)
        {
            mCallback.goToLockScreen();
            return true;
        }
        char c = keyevent.getMatch(DIGITS);
        if (c != 0)
        {
            reportDigit(c - 48);
            return true;
        }
        if (i == 67)
        {
            mFocusedEntry.onKeyDown(i, keyevent);
            Editable editable = mFocusedEntry.getEditableText();
            int j = editable.length();
            if (j > 0)
                editable.delete(j - 1, j);
            mCallback.pokeWakelock(5000);
            return true;
        }
        if (i == 66)
        {
            checkPuk();
            return true;
        } else
        {
            return false;
        }
    }

    public void onPause()
    {
        mKeyguardStatusViewManager.onPause();
    }

    public void onResume()
    {
        mHeaderText.setText(0x10402dd);
        mKeyguardStatusViewManager.onResume();
    }

    void updateConfiguration()
    {
        Configuration configuration = getResources().getConfiguration();
        if (configuration.orientation != mCreationOrientation)
            mCallback.recreateMe(configuration);
        else
        if (configuration.hardKeyboardHidden != mKeyboardHidden)
        {
            mKeyboardHidden = configuration.hardKeyboardHidden;
            return;
        }
    }








}
