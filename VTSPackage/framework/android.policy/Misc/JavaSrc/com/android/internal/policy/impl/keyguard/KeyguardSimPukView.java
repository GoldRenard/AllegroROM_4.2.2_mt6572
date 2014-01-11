// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.app.*;
import android.content.Context;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.text.TextWatcher;
import android.text.method.DigitsKeyListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.Window;
import android.widget.TextView;
import com.android.internal.telephony.ITelephony;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            KeyguardAbsKeyInputView, KeyguardSecurityView, SecurityMessageDisplay, KeyguardSecurityCallback

public class KeyguardSimPukView extends KeyguardAbsKeyInputView
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{
    private abstract class CheckSimPuk extends Thread
    {

        private final String mPin;
        private final String mPuk;
        final KeyguardSimPukView this$0;

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
            this$0 = KeyguardSimPukView.this;
            super();
            mPuk = s;
            mPin = s1;
        }
    }

    private class StateMachine
    {

        final int CONFIRM_PIN;
        final int DONE;
        final int ENTER_PIN;
        final int ENTER_PUK;
        private int state;
        final KeyguardSimPukView this$0;

        public void next()
        {
            int j;
            if (state == 0)
            {
                if (checkPuk())
                {
                    state = 1;
                    j = 0x104052d;
                } else
                {
                    j = 0x1040532;
                }
            } else
            if (state == 1)
            {
                if (checkPin())
                {
                    state = 2;
                    j = 0x104052e;
                } else
                {
                    j = 0x1040531;
                }
            } else
            {
                int i = state;
                j = 0;
                if (i == 2)
                    if (confirmPin())
                    {
                        state = 3;
                        j = 0x1040305;
                        updateSim();
                    } else
                    {
                        state = 1;
                        j = 0x1040534;
                    }
            }
            mPasswordEntry.setText(null);
            if (j != 0)
                mSecurityMessageDisplay.setMessage(j, true);
        }

        void reset()
        {
            mPinText = "";
            mPukText = "";
            state = 0;
            mSecurityMessageDisplay.setMessage(0x104052c, true);
            mPasswordEntry.requestFocus();
        }

        private StateMachine()
        {
            this$0 = KeyguardSimPukView.this;
            super();
            ENTER_PUK = 0;
            ENTER_PIN = 1;
            CONFIRM_PIN = 2;
            DONE = 3;
            state = 0;
        }

    }


    private volatile boolean mCheckInProgress;
    private String mPinText;
    private String mPukText;
    private ProgressDialog mSimUnlockProgressDialog;
    private StateMachine mStateMachine;

    public KeyguardSimPukView(Context context)
    {
        this(context, null);
    }

    public KeyguardSimPukView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mSimUnlockProgressDialog = null;
        mStateMachine = new StateMachine();
    }

    private boolean checkPin()
    {
        int i = mPasswordEntry.getText().length();
        if (i >= 4 && i <= 8)
        {
            mPinText = mPasswordEntry.getText().toString();
            return true;
        } else
        {
            return false;
        }
    }

    private boolean checkPuk()
    {
        if (mPasswordEntry.getText().length() >= 8)
        {
            mPukText = mPasswordEntry.getText().toString();
            return true;
        } else
        {
            return false;
        }
    }

    private Dialog getSimUnlockProgressDialog()
    {
        if (mSimUnlockProgressDialog == null)
        {
            mSimUnlockProgressDialog = new ProgressDialog(mContext);
            mSimUnlockProgressDialog.setMessage(mContext.getString(0x104052f));
            mSimUnlockProgressDialog.setIndeterminate(true);
            mSimUnlockProgressDialog.setCancelable(false);
            if (!(mContext instanceof Activity))
                mSimUnlockProgressDialog.getWindow().setType(2009);
        }
        return mSimUnlockProgressDialog;
    }

    private void updateSim()
    {
        getSimUnlockProgressDialog().show();
        if (!mCheckInProgress)
        {
            mCheckInProgress = true;
            (new CheckSimPuk(mPukText, mPinText) {

                final KeyguardSimPukView this$0;

                void onSimLockChangedResponse(boolean flag)
                {
                    post(flag. new Runnable() {

                        final _cls4 this$1;
                        final boolean val$success;

                        public void run()
                        {
                            if (mSimUnlockProgressDialog != null)
                                mSimUnlockProgressDialog.hide();
                            if (success)
                            {
                                mCallback.dismiss(true);
                            } else
                            {
                                mStateMachine.reset();
                                mSecurityMessageDisplay.setMessage(0x1040533, true);
                            }
                            mCheckInProgress = false;
                        }

            
            {
                this$1 = final__pcls4;
                success = Z.this;
                super();
            }
                    }
);
                }

            
            {
                this$0 = KeyguardSimPukView.this;
                super(s, s1);
            }
            }
).start();
        }
    }

    public boolean confirmPin()
    {
        return mPinText.equals(mPasswordEntry.getText().toString());
    }

    protected int getPasswordTextViewId()
    {
        return 0x10202c6;
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        View view = findViewById(0x10202d2);
        if (view != null)
            view.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardSimPukView this$0;

                public void onClick(View view2)
                {
                    doHapticKeyClick();
                    verifyPasswordAndUnlock();
                }

            
            {
                this$0 = KeyguardSimPukView.this;
                super();
            }
            }
);
        View view1 = findViewById(0x10202c7);
        if (view1 != null)
        {
            view1.setVisibility(0);
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardSimPukView this$0;

                public void onClick(View view2)
                {
                    CharSequence charsequence = mPasswordEntry.getText();
                    if (charsequence.length() > 0)
                        mPasswordEntry.setText(charsequence.subSequence(0, -1 + charsequence.length()));
                    doHapticKeyClick();
                }

            
            {
                this$0 = KeyguardSimPukView.this;
                super();
            }
            }
);
            view1.setOnLongClickListener(new android.view.View.OnLongClickListener() {

                final KeyguardSimPukView this$0;

                public boolean onLongClick(View view2)
                {
                    mPasswordEntry.setText("");
                    doHapticKeyClick();
                    return true;
                }

            
            {
                this$0 = KeyguardSimPukView.this;
                super();
            }
            }
);
        }
        mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
        mPasswordEntry.setInputType(18);
        mPasswordEntry.requestFocus();
        mSecurityMessageDisplay.setTimeout(0);
    }

    public void onPause()
    {
        if (mSimUnlockProgressDialog != null)
        {
            mSimUnlockProgressDialog.dismiss();
            mSimUnlockProgressDialog = null;
        }
    }

    public void resetState()
    {
        mStateMachine.reset();
        mPasswordEntry.setEnabled(true);
    }

    public void showUsabilityHint()
    {
    }

    protected void verifyPasswordAndUnlock()
    {
        mStateMachine.next();
    }





/*
    static String access$402(KeyguardSimPukView keyguardsimpukview, String s)
    {
        keyguardsimpukview.mPinText = s;
        return s;
    }

*/


/*
    static String access$502(KeyguardSimPukView keyguardsimpukview, String s)
    {
        keyguardsimpukview.mPukText = s;
        return s;
    }

*/




/*
    static boolean access$802(KeyguardSimPukView keyguardsimpukview, boolean flag)
    {
        keyguardsimpukview.mCheckInProgress = flag;
        return flag;
    }

*/
}
