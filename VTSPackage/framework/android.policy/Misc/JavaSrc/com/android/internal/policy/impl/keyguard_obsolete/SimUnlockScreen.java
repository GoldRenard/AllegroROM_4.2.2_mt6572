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
//            KeyguardScreen, KeyguardStatusViewManager, KeyguardScreenCallback, KeyguardUpdateMonitor

public class SimUnlockScreen extends LinearLayout
    implements KeyguardScreen, android.view.View.OnClickListener
{
    private abstract class CheckSimPin extends Thread
    {

        private final String mPin;
        final SimUnlockScreen this$0;

        abstract void onSimLockChangedResponse(boolean flag);

        public void run()
        {
            try
            {
                boolean flag = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.checkService("phone")).supplyPin(mPin);
                post(flag. new Runnable() {

                    final CheckSimPin this$1;
                    final boolean val$result;

                    public void run()
                    {
                        onSimLockChangedResponse(result);
                    }

            
            {
                this$1 = final_checksimpin;
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

                    final CheckSimPin this$1;

                    public void run()
                    {
                        onSimLockChangedResponse(false);
                    }

            
            {
                this$1 = CheckSimPin.this;
                super();
            }
                }
);
            }
        }

        protected CheckSimPin(String s)
        {
            this$0 = SimUnlockScreen.this;
            super();
            mPin = s;
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
        final SimUnlockScreen this$0;

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
            this$0 = SimUnlockScreen.this;
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
    private View mBackSpaceButton;
    private final KeyguardScreenCallback mCallback;
    private int mCreationOrientation;
    private int mEnteredDigits;
    private final int mEnteredPin[] = {
        0, 0, 0, 0, 0, 0, 0, 0
    };
    private TextView mHeaderText;
    private int mKeyboardHidden;
    private KeyguardStatusViewManager mKeyguardStatusViewManager;
    private LockPatternUtils mLockPatternUtils;
    private TextView mOkButton;
    private TextView mPinText;
    private ProgressDialog mSimUnlockProgressDialog;
    private final KeyguardUpdateMonitor mUpdateMonitor;

    public SimUnlockScreen(Context context, Configuration configuration, KeyguardUpdateMonitor keyguardupdatemonitor, KeyguardScreenCallback keyguardscreencallback, LockPatternUtils lockpatternutils)
    {
        super(context);
        mEnteredDigits = 0;
        mSimUnlockProgressDialog = null;
        mUpdateMonitor = keyguardupdatemonitor;
        mCallback = keyguardscreencallback;
        mCreationOrientation = configuration.orientation;
        mKeyboardHidden = configuration.hardKeyboardHidden;
        mLockPatternUtils = lockpatternutils;
        LayoutInflater layoutinflater = LayoutInflater.from(context);
        if (mKeyboardHidden == 1)
        {
            layoutinflater.inflate(0x1090066, this, true);
        } else
        {
            layoutinflater.inflate(0x1090067, this, true);
            new TouchInput();
        }
        mHeaderText = (TextView)findViewById(0x10202ee);
        mPinText = (TextView)findViewById(0x10202f0);
        mBackSpaceButton = findViewById(0x10202f1);
        mBackSpaceButton.setOnClickListener(this);
        mOkButton = (TextView)findViewById(0x10202a7);
        mHeaderText.setText(0x10402dc);
        mPinText.setFocusable(false);
        mOkButton.setOnClickListener(this);
        mKeyguardStatusViewManager = new KeyguardStatusViewManager(this, keyguardupdatemonitor, lockpatternutils, keyguardscreencallback, false);
        setFocusableInTouchMode(true);
    }

    private void checkPin()
    {
        if (mEnteredDigits < 4)
        {
            mHeaderText.setText(0x1040081);
            mPinText.setText("");
            mEnteredDigits = 0;
            mCallback.pokeWakelock();
            return;
        } else
        {
            getSimUnlockProgressDialog().show();
            (new CheckSimPin(mPinText.getText().toString()) {

                final SimUnlockScreen this$0;

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
                            } else
                            {
                                mHeaderText.setText(0x10402e3);
                                mPinText.setText("");
                                mEnteredDigits = 0;
                            }
                            mCallback.pokeWakelock();
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
                this$0 = SimUnlockScreen.this;
                super(s);
            }
            }
).start();
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
        if (mEnteredDigits == 0)
            mPinText.setText("");
        if (mEnteredDigits == 8)
        {
            return;
        } else
        {
            mPinText.append(Integer.toString(i));
            int ai[] = mEnteredPin;
            int j = mEnteredDigits;
            mEnteredDigits = j + 1;
            ai[j] = i;
            return;
        }
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
        return true;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        updateConfiguration();
    }

    public void onClick(View view)
    {
        if (view == mBackSpaceButton)
        {
            Editable editable = mPinText.getEditableText();
            int i = editable.length();
            if (i > 0)
            {
                editable.delete(i - 1, i);
                mEnteredDigits = -1 + mEnteredDigits;
            }
            mCallback.pokeWakelock();
        } else
        if (view == mOkButton)
        {
            checkPin();
            return;
        }
    }

    protected void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        updateConfiguration();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
label0:
        {
            if (i == 4)
            {
                mCallback.goToLockScreen();
            } else
            {
                char c = keyevent.getMatch(DIGITS);
                if (c != 0)
                {
                    reportDigit(c - 48);
                    return true;
                }
                if (i != 67)
                    break label0;
                if (mEnteredDigits > 0)
                {
                    mPinText.onKeyDown(i, keyevent);
                    mEnteredDigits = -1 + mEnteredDigits;
                    return true;
                }
            }
            return true;
        }
        if (i == 66)
        {
            checkPin();
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
        mHeaderText.setText(0x10402dc);
        mPinText.setText("");
        mEnteredDigits = 0;
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








/*
    static int access$602(SimUnlockScreen simunlockscreen, int i)
    {
        simunlockscreen.mEnteredDigits = i;
        return i;
    }

*/

}
