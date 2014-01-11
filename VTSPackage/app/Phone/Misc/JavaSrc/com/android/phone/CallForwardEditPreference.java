// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import com.android.internal.telephony.*;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            EditPhoneNumberPreference, PhoneGlobals, GsmUmtsCallForwardOptions

public class CallForwardEditPreference extends EditPhoneNumberPreference
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_CF = 0;
        private static final int MESSAGE_SET_CF = 1;
        final CallForwardEditPreference this$0;

        private void handleGetCFResponse(Message message)
        {
            Xlog.d("Settings/CallForwardEditPreference", "handleGetCFResponse: done");
            boolean flag = false;
            AsyncResult asyncresult = (AsyncResult)message.obj;
            mCallForwardInfo = null;
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("handleGetCFResponse: ar.exception=").append(asyncresult.exception).toString());
                setEnabled(false);
                mResult = false;
                mTcpListener.onException(CallForwardEditPreference.this, (CommandException)asyncresult.exception);
            } else
            {
                if (asyncresult.userObj instanceof Throwable)
                {
                    Xlog.d("Settings/CallForwardEditPreference", "userObj == Throwable");
                    mTcpListener.onError(CallForwardEditPreference.this, 400);
                    mTcpListener.onUpdate(mTcpListener, true);
                }
                CallForwardInfo acallforwardinfo[] = (CallForwardInfo[])(CallForwardInfo[])asyncresult.result;
                if (acallforwardinfo.length == 0)
                {
                    Xlog.d("Settings/CallForwardEditPreference", "handleGetCFResponse: cfInfoArray.length==0");
                    setEnabled(false);
                    mResult = false;
                    mTcpListener.onError(CallForwardEditPreference.this, 400);
                    flag = false;
                } else
                {
                    mResult = true;
                    setEnabled(true);
                    int i = 0;
                    for (int j = acallforwardinfo.length; i < j; i++)
                    {
                        Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("handleGetCFResponse, cfInfoArray[").append(i).append("]=").append(acallforwardinfo[i]).toString());
                        if ((mServiceClass & acallforwardinfo[i].serviceClass) == 0)
                            continue;
                        flag = true;
                        CallForwardInfo callforwardinfo = acallforwardinfo[i];
                        handleCallForwardResult(callforwardinfo);
                        if (message.arg2 != 1 || message.arg1 != 0 || callforwardinfo.status != 1)
                            continue;
                        CharSequence charsequence;
                        switch (mReason)
                        {
                        case 2: // '\002'
                            charsequence = getContext().getText(0x7f0d01d6);
                            break;

                        case 1: // '\001'
                            charsequence = getContext().getText(0x7f0d01d1);
                            break;

                        default:
                            charsequence = getContext().getText(0x7f0d01db);
                            break;
                        }
                        android.app.AlertDialog.Builder builder = new android.app.AlertDialog.Builder(getContext());
                        builder.setNeutralButton(0x7f0d01e5, null);
                        builder.setTitle(getContext().getText(0x7f0d01dd));
                        builder.setMessage(charsequence);
                        builder.setCancelable(true);
                        builder.create().show();
                    }

                }
            }
            if (!flag && isToggled())
                setToggled(false);
            Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("tcpListener2 =").append(mTcpListener).toString());
            if (message.arg2 == 1)
                mTcpListener.onFinished(CallForwardEditPreference.this, false);
            else
                mTcpListener.onFinished(CallForwardEditPreference.this, true);
            if (message.arg2 == 1 && mReason == 0 && !isToggled() && (mTcpListener instanceof GsmUmtsCallForwardOptions) && mLastCallForwardInfo != null && mLastCallForwardInfo.status == 1 && mCallForwardInfo != null && mCallForwardInfo.status == 0)
                ((GsmUmtsCallForwardOptions)mTcpListener).refreshSettings(true);
            updateSummaryText();
        }

        private void handleSetCFResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
                Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("handleSetCFResponse: ar.exception=").append(asyncresult.exception).toString());
            Xlog.d("Settings/CallForwardEditPreference", "handleSetCFResponse: re get");
            Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("mSimdId: ").append(mSimId).toString());
            if (CallSettings.isMultipleSim())
                if (mServiceClass == 512)
                {
                    ((GeminiPhone)mPhone).getVtCallForwardingOptionGemini(mReason, obtainMessage(0, message.arg1, 1, asyncresult.exception), mSimId);
                    return;
                } else
                {
                    ((GeminiPhone)mPhone).getCallForwardingOptionGemini(mReason, obtainMessage(0, message.arg1, 1, asyncresult.exception), mSimId);
                    return;
                }
            if (mServiceClass == 512)
            {
                mPhone.getVtCallForwardingOption(mReason, obtainMessage(0, message.arg1, 1, asyncresult.exception));
                return;
            } else
            {
                mPhone.getCallForwardingOption(mReason, obtainMessage(0, message.arg1, 1, asyncresult.exception));
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetCFResponse(message);
                return;

            case 0: // '\0'
                handleGetCFResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CallForwardEditPreference.this;
            super();
        }

    }


    private static final String BUTTON_CFB_KEY = "button_cfb_key";
    private static final String BUTTON_CFNRC_KEY = "button_cfnrc_key";
    private static final String BUTTON_CFNRY_KEY = "button_cfnry_key";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/CallForwardEditPreference";
    private static final String SRC_TAGS[] = {
        "{0}"
    };
    private int mButtonClicked;
    CallForwardInfo mCallForwardInfo;
    private boolean mCancel;
    private MyHandler mHandler;
    private CallForwardInfo mLastCallForwardInfo;
    Phone mPhone;
    int mReason;
    private boolean mResult;
    private int mServiceClass;
    private int mSimId;
    private CharSequence mSummaryOnTemplate;
    TimeConsumingPreferenceListener mTcpListener;

    public CallForwardEditPreference(Context context)
    {
        this(context, null);
    }

    public CallForwardEditPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mCancel = false;
        mResult = true;
        mPhone = PhoneGlobals.getPhone();
        mSummaryOnTemplate = getSummaryOn();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, R.styleable.CallForwardEditPreference, 0, 0x7f0f000b);
        mServiceClass = typedarray.getInt(0, 1);
        mReason = typedarray.getInt(1, 0);
        typedarray.recycle();
        Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("mServiceClass=").append(mServiceClass).append(", reason=").append(mReason).toString());
    }

    private void updatePrefStatus()
    {
        PreferenceManager preferencemanager;
label0:
        {
            if (mReason == 0)
            {
                preferencemanager = getPreferenceManager();
                if (!isToggled() || !isEnabled())
                    break label0;
                preferencemanager.findPreference("button_cfb_key").setEnabled(false);
                preferencemanager.findPreference("button_cfnry_key").setEnabled(false);
                preferencemanager.findPreference("button_cfnrc_key").setEnabled(false);
            }
            return;
        }
        if (!isToggled() && isEnabled())
            preferencemanager.findPreference("button_cfb_key").setEnabled(true);
        preferencemanager.findPreference("button_cfnry_key").setEnabled(true);
        preferencemanager.findPreference("button_cfnrc_key").setEnabled(true);
    }

    private void updateSummaryText()
    {
        if (isToggled())
        {
            String s = getRawPhoneNumber();
            Object obj;
            if (s != null && s.length() > 0)
            {
                String as[] = {
                    s
                };
                obj = TextUtils.replace(mSummaryOnTemplate, SRC_TAGS, as);
            } else
            {
                obj = getContext().getString(0x7f0d01cb);
            }
            setSummaryOn(((CharSequence) (obj)));
        }
    }

    void handleCallForwardResult(CallForwardInfo callforwardinfo)
    {
        boolean flag = true;
        mCallForwardInfo = callforwardinfo;
        Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("handleGetCFResponse done, callForwardInfo=").append(mCallForwardInfo).toString());
        if (mCallForwardInfo.status != flag)
            flag = false;
        setToggled(flag);
        setPhoneNumber(mCallForwardInfo.number);
        updateSummaryText();
        updatePrefStatus();
    }

    void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
        mTcpListener = timeconsumingpreferencelistener;
        Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("tcpListener =").append(mTcpListener).toString());
        if (!flag)
        {
            if (CallSettings.isMultipleSim())
            {
                mSimId = i;
                Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("init - simId =").append(mSimId).toString());
                if (mServiceClass == 512)
                    ((GeminiPhone)mPhone).getVtCallForwardingOptionGemini(mReason, mHandler.obtainMessage(0, mReason, 0, null), i);
                else
                    ((GeminiPhone)mPhone).getCallForwardingOptionGemini(mReason, mHandler.obtainMessage(0, mReason, 0, null), i);
            } else
            if (mServiceClass == 512)
                mPhone.getVtCallForwardingOption(mReason, mHandler.obtainMessage(0, mReason, 0, null));
            else
                mPhone.getCallForwardingOption(mReason, mHandler.obtainMessage(0, mReason, 0, null));
            if (mTcpListener != null)
                mTcpListener.onStarted(this, true);
        }
    }

    public boolean isSuccess()
    {
        return mResult;
    }

    protected void onBindDialogView(View view)
    {
        mButtonClicked = -2;
        super.onBindDialogView(view);
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -3)
            setSummaryOn("");
        super.onClick(dialoginterface, i);
        mButtonClicked = i;
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (!mCancel && mButtonClicked != 0)
        {
            Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("mButtonClicked=").append(mButtonClicked).append(", positiveResult=").append(flag).toString());
            if (mButtonClicked != -2)
            {
                byte byte0;
                if (!isToggled() && mButtonClicked != -1)
                    byte0 = 0;
                else
                    byte0 = 3;
                byte byte1;
                if (mReason != 2)
                    byte1 = 0;
                else
                    byte1 = 20;
                String s = getPhoneNumber();
                Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("callForwardInfo=").append(mCallForwardInfo).toString());
                mLastCallForwardInfo = mCallForwardInfo;
                if (byte0 == 3 && mCallForwardInfo != null && mCallForwardInfo.status == 1 && s.equals(mCallForwardInfo.number))
                {
                    Xlog.d("Settings/CallForwardEditPreference", "no change, do nothing");
                } else
                {
                    Xlog.d("Settings/CallForwardEditPreference", (new StringBuilder()).append("reason=").append(mReason).append(", action=").append(byte0).append(", number=").append(s).toString());
                    setSummaryOn("");
                    if (CallSettings.isMultipleSim())
                    {
                        if (mServiceClass == 512)
                            ((GeminiPhone)mPhone).setVtCallForwardingOptionGemini(byte0, mReason, s, byte1, mHandler.obtainMessage(1, byte0, 1), mSimId);
                        else
                            ((GeminiPhone)mPhone).setCallForwardingOptionGemini(byte0, mReason, s, byte1, mHandler.obtainMessage(1, byte0, 1), mSimId);
                    } else
                    if (mServiceClass == 512)
                        mPhone.setVtCallForwardingOption(byte0, mReason, s, byte1, mHandler.obtainMessage(1, byte0, 1));
                    else
                        mPhone.setCallForwardingOption(byte0, mReason, s, byte1, mHandler.obtainMessage(1, byte0, 1));
                    if (mTcpListener != null)
                        mTcpListener.onStarted(this, false);
                }
            }
            mButtonClicked = 0;
            return;
        } else
        {
            return;
        }
    }

    public void setServiceClass(int i)
    {
        mServiceClass = i;
    }

    public void setStatus(boolean flag)
    {
        mCancel = flag;
    }



/*
    static boolean access$102(CallForwardEditPreference callforwardeditpreference, boolean flag)
    {
        callforwardeditpreference.mResult = flag;
        return flag;
    }

*/




}
