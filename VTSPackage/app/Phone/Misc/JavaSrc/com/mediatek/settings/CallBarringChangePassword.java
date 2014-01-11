// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.os.*;
import android.util.AttributeSet;
import android.widget.Toast;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.EditPinPreference;
import com.android.phone.PhoneGlobals;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, CallBarringInterface

public class CallBarringChangePassword extends EditPinPreference
    implements com.android.phone.EditPinPreference.OnPinEnteredListener
{
    private class MyHandler extends Handler
    {

        private static final int EVENT_PASSWORD_CHANGE;
        final CallBarringChangePassword this$0;

        private void handlePasswordChanged(Message message)
        {
label0:
            {
                if (message.arg2 == 0 && mTcpListener != null)
                    mTcpListener.onFinished(CallBarringChangePassword.this, false);
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                {
                    Xlog.i("Settings/CallChangePassword", (new StringBuilder()).append("handlePasswordChanged: ar.exception=").append(asyncresult.exception).toString());
                    if (mTcpListener != null)
                    {
                        CommandException commandexception = (CommandException)asyncresult.exception;
                        char c;
                        if (commandexception.getCommandError() == com.android.internal.telephony.CommandException.Error.PASSWORD_INCORRECT)
                            c = '\u02BC';
                        else
                        if (commandexception.getCommandError() == com.android.internal.telephony.CommandException.Error.FDN_CHECK_FAILURE)
                            c = '\u0320';
                        else
                            c = '\u012C';
                        mCallBarringInterface.setErrorState(c);
                        mTcpListener.onError(CallBarringChangePassword.this, c);
                    }
                } else
                {
                    if (!(asyncresult.userObj instanceof Throwable))
                        break label0;
                    if (mTcpListener != null)
                    {
                        mTcpListener.onError(CallBarringChangePassword.this, 400);
                        return;
                    }
                }
                return;
            }
            Xlog.i("Settings/CallChangePassword", "handlePasswordChanged is called without exception");
            displayMessage(0x7f0d00c9);
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 0: // '\0'
                handlePasswordChanged(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CallBarringChangePassword.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "Settings/CallChangePassword";
    private static final int PASSWORD_CHANGE_NEW = 1;
    private static final int PASSWORD_CHANGE_OLD = 0;
    private static final int PASSWORD_CHANGE_REENTER = 2;
    private static final int PASSWORD_LENGTH = 4;
    private CallBarringInterface mCallBarringInterface;
    private Context mContext;
    private MyHandler mHandler;
    private String mNewPassword;
    private String mOldPassword;
    private int mPasswordChangeState;
    private Phone mPhone;
    private int mSimId;
    private TimeConsumingPreferenceListener mTcpListener;

    public CallBarringChangePassword(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mTcpListener = null;
        mContext = null;
        mCallBarringInterface = null;
        mSimId = 2;
        init(context);
        mPhone = PhoneGlobals.getPhone();
    }

    private void displayMessage(int i)
    {
        Toast.makeText(mContext, mContext.getString(i), 0).show();
    }

    private void displayPasswordChangeDialog(int i, boolean flag)
    {
        int j = mPasswordChangeState;
        int k = 0;
        switch (j)
        {
        case 2: // '\002'
            k = 0x7f0d00c7;
            break;

        case 1: // '\001'
            k = 0x7f0d00c5;
            break;

        case 0: // '\0'
            k = 0x7f0d00c4;
            break;
        }
        if (i != 0)
            setDialogMessage((new StringBuilder()).append(getContext().getText(k)).append("\n").append(getContext().getText(i)).toString());
        else
            setDialogMessage(k);
        if (flag)
            showPinDialog();
    }

    private void doChangePassword(String s, String s1)
    {
        Xlog.d("Settings/CallChangePassword", (new StringBuilder()).append("doChangePassword() is called with oldPassword is ").append(s).append("newPassword is ").append(s1).toString());
        Message message = mHandler.obtainMessage(0, 0, 0, null);
        if (CallSettings.isMultipleSim())
        {
            ((GeminiPhone)mPhone).changeBarringPasswordGemini("AB", s, s1, message, mSimId);
            return;
        } else
        {
            mPhone.changeBarringPassword("AB", s, s1, message);
            return;
        }
    }

    private void init(Context context)
    {
        mContext = context;
        setEnabled(true);
        setOnPinEnteredListener(this);
        resetPasswordChangeState();
    }

    private void resetPasswordChangeState()
    {
        mPasswordChangeState = 0;
        displayPasswordChangeDialog(0, false);
        mOldPassword = "";
        mNewPassword = "";
    }

    private boolean validatePassword(String s)
    {
        return s != null && s.length() == 4;
    }

    public void onPinEntered(EditPinPreference editpinpreference, boolean flag)
    {
        if (!flag)
        {
            resetPasswordChangeState();
            return;
        }
        switch (mPasswordChangeState)
        {
        case 2: // '\002'
            if (!mNewPassword.equals(getText()))
            {
                mPasswordChangeState = 1;
                setText("");
                displayPasswordChangeDialog(0x7f0d00c8, true);
                return;
            }
            if (mTcpListener != null)
                mTcpListener.onStarted(this, false);
            doChangePassword(mOldPassword, mNewPassword);
            setText("");
            resetPasswordChangeState();
            return;

        case 1: // '\001'
            mNewPassword = getText();
            setText("");
            if (validatePassword(mNewPassword))
            {
                mPasswordChangeState = 2;
                displayPasswordChangeDialog(0, true);
                return;
            } else
            {
                displayPasswordChangeDialog(0x7f0d00c6, true);
                return;
            }

        case 0: // '\0'
            mOldPassword = getText();
            setText("");
            if (validatePassword(mOldPassword))
            {
                mPasswordChangeState = 1;
                displayPasswordChangeDialog(0, true);
                return;
            } else
            {
                displayPasswordChangeDialog(0x7f0d00c6, true);
                return;
            }
        }
    }

    public void setTimeConsumingListener(TimeConsumingPreferenceListener timeconsumingpreferencelistener, int i)
    {
        mTcpListener = timeconsumingpreferencelistener;
        mCallBarringInterface = (CallBarringInterface)timeconsumingpreferencelistener;
        mSimId = i;
    }



}
