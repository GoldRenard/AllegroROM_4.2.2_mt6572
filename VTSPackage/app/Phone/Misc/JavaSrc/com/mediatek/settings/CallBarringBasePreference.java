// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.*;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.*;
import android.widget.EditText;
import android.widget.TextView;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.PhoneGlobals;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, CallBarringInterface

public class CallBarringBasePreference extends CheckBoxPreference
    implements android.preference.Preference.OnPreferenceClickListener
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_CALLBARRING_STATE = 0;
        private static final int MESSAGE_SET_CALLBARRING_STATE = 1;
        final CallBarringBasePreference this$0;

        private void handleGetCallBarringResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
            {
                mResult = false;
                Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("handleGetCallBarringResponse: ar.exception=").append(asyncresult.exception).toString());
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
                try
                {
                    mTcpListener.onError(CallBarringBasePreference.this, c);
                }
                catch (android.view.WindowManager.BadTokenException badtokenexception)
                {
                    Xlog.d("Settings/CallBarringBasePreference", "BadTokenException");
                }
            } else
            {
                Xlog.i("Settings/CallBarringBasePreference", "handleGetCallBarringResponse is called without exception");
                setEnabled(true);
                int ai[] = (int[])(int[])asyncresult.result;
                if (ai != null && ai.length > 0)
                {
                    mResult = true;
                    int i = ai[0];
                    Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("Current value = ").append(i).append("  Current serviceClass = ").append(mServiceClass).toString());
                    int j = i & mServiceClass;
                    Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("After value & mServiceClass = ").append(j).toString());
                    Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("Value is ").append(j).toString());
                    String s;
                    if (j == 0)
                    {
                        s = mContext.getString(0x7f0d00c2);
                        setChecked(false);
                    } else
                    {
                        s = mContext.getString(0x7f0d00c3);
                        setChecked(true);
                        mCallBarringInterface.doCallBarringRefresh(mFacility);
                    }
                    setSummary(s);
                } else
                {
                    mResult = false;
                    Xlog.i("Settings/CallBarringBasePreference", "handleGetCallBarringResponse ar.result get error");
                }
            }
            if (message.arg2 == 0)
            {
                mTcpListener.onFinished(CallBarringBasePreference.this, true);
                return;
            } else
            {
                mTcpListener.onFinished(CallBarringBasePreference.this, false);
                return;
            }
        }

        private void handleSetCallBarringResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
            {
                Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("handleSetCallBarringResponse: ar.exception=").append(asyncresult.exception).toString());
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
                mTcpListener.onFinished(CallBarringBasePreference.this, false);
                mTcpListener.onError(CallBarringBasePreference.this, c);
                return;
            } else
            {
                Xlog.i("Settings/CallBarringBasePreference", "handleSetCallBarringResponse is called without exception");
                getCallState(mFacility, "", false);
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetCallBarringResponse(message);
                return;

            case 0: // '\0'
                handleGetCallBarringResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CallBarringBasePreference.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "Settings/CallBarringBasePreference";
    private static final int PASSWORD_LENGTH = 4;
    private CallBarringInterface mCallBarringInterface;
    private Context mContext;
    private boolean mCurrentClickState;
    private String mFacility;
    private MyHandler mHandler;
    private Phone mPhone;
    private boolean mResult;
    private int mServiceClass;
    private int mSimId;
    private TimeConsumingPreferenceListener mTcpListener;
    private int mTitle;

    public CallBarringBasePreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mContext = null;
        mCurrentClickState = false;
        mCallBarringInterface = null;
        mResult = true;
        mSimId = 2;
        mServiceClass = 1;
        setEnabled(false);
        mContext = context;
        mPhone = PhoneGlobals.getPhone();
    }

    private void doPreferenceClick(final String title)
    {
        final View textEntryView = LayoutInflater.from(getContext()).inflate(0x7f04000a, null);
        ((TextView)textEntryView.findViewById(0x7f08001f)).setText(mContext.getString(0x7f0d00ca));
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getContext());
        builder.setView(textEntryView);
        builder.setTitle(title);
        builder.setNegativeButton(0x7f0d0196, null);
        builder.setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

            final CallBarringBasePreference this$0;
            final View val$textEntryView;
            final String val$title;

            public void onClick(DialogInterface dialoginterface, int i)
            {
                String s = ((EditText)textEntryView.findViewById(0x7f08001e)).getText().toString();
                if (!validatePassword(s))
                {
                    android.app.AlertDialog.Builder builder1 = new android.app.AlertDialog.Builder(mContext);
                    builder1.setTitle(title);
                    builder1.setMessage(mContext.getText(0x7f0d00cb));
                    builder1.setCancelable(false);
                    builder1.setPositiveButton(0x7f0d0192, null);
                    builder1.create().show();
                } else
                if (mTcpListener != null)
                {
                    mTcpListener.onStarted(CallBarringBasePreference.this, false);
                    setCallState(mFacility, mCurrentClickState, s);
                    return;
                }
            }

            
            {
                this$0 = CallBarringBasePreference.this;
                textEntryView = view;
                title = s;
                super();
            }
        }
);
        AlertDialog alertdialog = builder.create();
        if (alertdialog != null)
        {
            alertdialog.getWindow().setSoftInputMode(5);
            alertdialog.show();
        }
    }

    private void getCallState(String s, String s1, boolean flag)
    {
        Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("getCallState() is called with facility is ").append(s).append("password is ").append(s1).append("reason is ").append(flag).toString());
        Message message;
        if (flag)
            message = mHandler.obtainMessage(0, 0, 0, null);
        else
            message = mHandler.obtainMessage(0, 0, 1, null);
        if (CallSettings.isMultipleSim())
            if (mServiceClass == 512)
            {
                ((GeminiPhone)mPhone).getVtFacilityLockGemini(s, s1, message, mSimId);
                return;
            } else
            {
                ((GeminiPhone)mPhone).getFacilityLockGemini(s, s1, message, mSimId);
                return;
            }
        if (mServiceClass == 512)
        {
            mPhone.getVtFacilityLock(s, s1, message);
            return;
        } else
        {
            mPhone.getFacilityLock(s, s1, message);
            return;
        }
    }

    private void setCallState(String s, boolean flag, String s1)
    {
        Xlog.i("Settings/CallBarringBasePreference", (new StringBuilder()).append("setCallState() is called with facility is ").append(s).append("password is ").append(s1).append("enable is ").append(flag).toString());
        Message message = mHandler.obtainMessage(1, 0, 1, null);
        if (CallSettings.isMultipleSim())
            if (mServiceClass == 512)
            {
                ((GeminiPhone)mPhone).setVtFacilityLockGemini(s, flag, s1, message, mSimId);
                return;
            } else
            {
                ((GeminiPhone)mPhone).setFacilityLockGemini(s, flag, s1, message, mSimId);
                return;
            }
        if (mServiceClass == 512)
        {
            mPhone.setVtFacilityLock(s, flag, s1, message);
            return;
        } else
        {
            mPhone.setFacilityLock(s, flag, s1, message);
            return;
        }
    }

    private boolean validatePassword(String s)
    {
        return s != null && s.length() == 4;
    }

    void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
        mSimId = i;
        setOnPreferenceClickListener(this);
        mTcpListener = timeconsumingpreferencelistener;
        if (!flag)
        {
            if (mTcpListener != null)
            {
                Xlog.i("Settings/CallBarringBasePreference", "init() is called");
                mTcpListener.onStarted(this, true);
            }
            getCallState(mFacility, "", true);
        }
    }

    public boolean isSuccess()
    {
        return mResult;
    }

    protected void onBindView(View view)
    {
        super.onBindView(view);
        View view1 = view.findViewById(0x1020016);
        if (view1 != null && (view1 instanceof TextView))
            ((TextView)view1).setEllipsize(android.text.TextUtils.TruncateAt.valueOf("MIDDLE"));
    }

    protected void onClick()
    {
        boolean flag;
        if (!isChecked())
            flag = true;
        else
            flag = false;
        mCurrentClickState = flag;
    }

    public boolean onPreferenceClick(Preference preference)
    {
        doPreferenceClick(mContext.getString(mTitle));
        return true;
    }

    public void setCallState(String s)
    {
        setCallState(mFacility, false, s);
        if (mTcpListener != null)
            mTcpListener.onStarted(this, false);
    }

    public void setRefreshInterface(CallBarringInterface callbarringinterface)
    {
        mCallBarringInterface = callbarringinterface;
    }

    public void setServiceClass(int i)
    {
        mServiceClass = i;
    }

    public void setmFacility(String s)
    {
        mFacility = s;
    }

    public void setmTitle(int i)
    {
        mTitle = i;
    }











/*
    static boolean access$902(CallBarringBasePreference callbarringbasepreference, boolean flag)
    {
        callbarringbasepreference.mResult = flag;
        return flag;
    }

*/
}
