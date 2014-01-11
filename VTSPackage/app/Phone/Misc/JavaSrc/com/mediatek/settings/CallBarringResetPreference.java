// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.widget.EditText;
import android.widget.TextView;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.PhoneGlobals;
import com.mediatek.phone.TimeConsumingPreferenceListener;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, CallBarringInterface, CallBarring, CallBarringBasePreference

public class CallBarringResetPreference extends Preference
    implements android.preference.Preference.OnPreferenceClickListener
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_SET_CALLBARRING_STATE = 1;
        final CallBarringResetPreference this$0;

        private void handleSetCallBarringResponse(Message message)
        {
label0:
            {
                AsyncResult asyncresult = (AsyncResult)message.obj;
                if (asyncresult.exception != null)
                {
                    Log.i("CallBarringResetPreference", (new StringBuilder()).append("handleSetCallBarringResponse: ar.exception=").append(asyncresult.exception).toString());
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
                    mTcpListener.onError(CallBarringResetPreference.this, c);
                } else
                {
                    Log.i("CallBarringResetPreference", "handleSetCallBarringResponse is called without exception");
                    if (!(mCallBarringInterface instanceof CallBarring))
                        break label0;
                    CallBarring callbarring = (CallBarring)mCallBarringInterface;
                    CallBarringBasePreference callbarringbasepreference = (CallBarringBasePreference)callbarring.getPreferenceScreen().findPreference("all_outing_key");
                    if (callbarringbasepreference != null)
                    {
                        callbarring.resetIndex(0);
                        callbarringbasepreference.init(callbarring, false, mSimId);
                        return;
                    }
                }
                return;
            }
            mCallBarringInterface.doCancelAllState();
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                mTcpListener.onFinished(CallBarringResetPreference.this, false);
                handleSetCallBarringResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CallBarringResetPreference.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "CallBarringResetPreference";
    private static final int PASSWORD_LENGTH = 4;
    private CallBarringInterface mCallBarringInterface;
    private Context mContext;
    private MyHandler mHandler;
    private Phone mPhone;
    private int mServiceClass;
    private int mSimId;
    private TimeConsumingPreferenceListener mTcpListener;

    public CallBarringResetPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mCallBarringInterface = null;
        mHandler = new MyHandler();
        mSimId = 2;
        mServiceClass = 1;
        init(context);
        mPhone = PhoneGlobals.getPhone();
    }

    private void init(Context context)
    {
        mContext = context;
        setEnabled(true);
        setOnPreferenceClickListener(this);
    }

    private void setCallState(boolean flag, String s)
    {
        Log.i("CallBarringResetPreference", (new StringBuilder()).append("setCallState() is called password is ").append(s).append("enable is ").append(flag).toString());
        Message message = mHandler.obtainMessage(1, 0, 0, null);
        if (CallSettings.isMultipleSim())
        {
            if (mServiceClass == 512)
                ((GeminiPhone)mPhone).setVtFacilityLockGemini("AB", flag, s, message, mSimId);
            else
                ((GeminiPhone)mPhone).setFacilityLockGemini("AB", flag, s, message, mSimId);
        } else
        if (mServiceClass == 512)
            mPhone.setVtFacilityLock("AB", flag, s, message);
        else
            mPhone.setFacilityLock("AB", flag, s, message);
        if (mTcpListener != null)
            mTcpListener.onStarted(this, false);
    }

    private boolean validatePassword(String s)
    {
        return s != null && s.length() == 4;
    }

    public void doPreferenceClick(final String title)
    {
        final View textEntryView = LayoutInflater.from(getContext()).inflate(0x7f04000a, null);
        ((TextView)textEntryView.findViewById(0x7f08001f)).setText(mContext.getString(0x7f0d00ca));
        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getContext());
        builder.setView(textEntryView);
        builder.setTitle(title);
        builder.setNegativeButton(0x7f0d0196, null);
        builder.setPositiveButton(0x7f0d0192, new android.content.DialogInterface.OnClickListener() {

            final CallBarringResetPreference this$0;
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
                if (mCallBarringInterface != null)
                {
                    setCallState(s);
                    return;
                }
            }

            
            {
                this$0 = CallBarringResetPreference.this;
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

    public boolean onPreferenceClick(Preference preference)
    {
        doPreferenceClick(mContext.getString(0x7f0d00bf));
        return true;
    }

    public void setCallBarringInterface(CallBarringInterface callbarringinterface, int i)
    {
        mCallBarringInterface = callbarringinterface;
        mSimId = i;
    }

    public void setCallState(String s)
    {
        setCallState(false, s);
    }

    public void setListener(TimeConsumingPreferenceListener timeconsumingpreferencelistener)
    {
        mTcpListener = timeconsumingpreferencelistener;
    }

    public void setServiceClass(int i)
    {
        mServiceClass = i;
    }





}
