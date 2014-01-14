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
//            KeyguardAbsKeyInputView, KeyguardSecurityView, SecurityMessageDisplay, KeyguardSecurityCallback, 
//            KeyguardUpdateMonitor

public class KeyguardSimPinView extends KeyguardAbsKeyInputView
    implements KeyguardSecurityView, android.widget.TextView.OnEditorActionListener, TextWatcher
{
    private abstract class CheckSimPin extends Thread
    {

        private final String mPin;
        final KeyguardSimPinView this$0;

        abstract void onSimCheckResponse(boolean flag);

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
                        onSimCheckResponse(result);
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
                        onSimCheckResponse(false);
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
            this$0 = KeyguardSimPinView.this;
            super();
            mPin = s;
        }
    }


    private volatile boolean mSimCheckInProgress;
    private ProgressDialog mSimUnlockProgressDialog;

    public KeyguardSimPinView(Context context)
    {
        this(context, null);
    }

    public KeyguardSimPinView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mSimUnlockProgressDialog = null;
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

                final KeyguardSimPinView this$0;

                public void onClick(View view2)
                {
                    doHapticKeyClick();
                    verifyPasswordAndUnlock();
                }

            
            {
                this$0 = KeyguardSimPinView.this;
                super();
            }
            }
);
        View view1 = findViewById(0x10202c7);
        if (view1 != null)
        {
            view1.setVisibility(0);
            view1.setOnClickListener(new android.view.View.OnClickListener() {

                final KeyguardSimPinView this$0;

                public void onClick(View view2)
                {
                    CharSequence charsequence = mPasswordEntry.getText();
                    if (charsequence.length() > 0)
                        mPasswordEntry.setText(charsequence.subSequence(0, -1 + charsequence.length()));
                    doHapticKeyClick();
                }

            
            {
                this$0 = KeyguardSimPinView.this;
                super();
            }
            }
);
            view1.setOnLongClickListener(new android.view.View.OnLongClickListener() {

                final KeyguardSimPinView this$0;

                public boolean onLongClick(View view2)
                {
                    mPasswordEntry.setText("");
                    doHapticKeyClick();
                    return true;
                }

            
            {
                this$0 = KeyguardSimPinView.this;
                super();
            }
            }
);
        }
        mPasswordEntry.setKeyListener(DigitsKeyListener.getInstance());
        mPasswordEntry.setInputType(18);
        mPasswordEntry.requestFocus();
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
        mSecurityMessageDisplay.setMessage(0x1040529, true);
        mPasswordEntry.setEnabled(true);
    }

    public void showUsabilityHint()
    {
    }

    protected void verifyPasswordAndUnlock()
    {
        if (mPasswordEntry.getText().toString().length() < 4)
        {
            mSecurityMessageDisplay.setMessage(0x1040531, true);
            mPasswordEntry.setText("");
            mCallback.userActivity(0L);
        } else
        {
            getSimUnlockProgressDialog().show();
            if (!mSimCheckInProgress)
            {
                mSimCheckInProgress = true;
                (new CheckSimPin(mPasswordEntry.getText().toString()) {

                    final KeyguardSimPinView this$0;

                    void onSimCheckResponse(boolean flag)
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
                                    KeyguardUpdateMonitor.getInstance(getContext()).reportSimUnlocked();
                                    mCallback.dismiss(true);
                                } else
                                {
                                    mSecurityMessageDisplay.setMessage(0x1040530, true);
                                    mPasswordEntry.setText("");
                                }
                                mCallback.userActivity(0L);
                                mSimCheckInProgress = false;
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
                this$0 = KeyguardSimPinView.this;
                super(s);
            }
                }
).start();
                return;
            }
        }
    }



/*
    static boolean access$102(KeyguardSimPinView keyguardsimpinview, boolean flag)
    {
        keyguardsimpinview.mSimCheckInProgress = flag;
        return flag;
    }

*/
}
