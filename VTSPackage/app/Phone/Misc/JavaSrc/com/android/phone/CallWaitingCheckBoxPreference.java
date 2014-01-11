// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.os.*;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CallWaitingCheckBoxPreference extends CheckBoxPreference
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_CALL_WAITING = 0;
        private static final int MESSAGE_SET_CALL_WAITING = 1;
        final CallWaitingCheckBoxPreference this$0;

        private void handleGetCallWaitingResponse(Message message)
        {
            AsyncResult asyncresult;
            asyncresult = (AsyncResult)message.obj;
            if (mTcpListener != null)
                if (message.arg2 == 1)
                    mTcpListener.onFinished(CallWaitingCheckBoxPreference.this, false);
                else
                    mTcpListener.onFinished(CallWaitingCheckBoxPreference.this, true);
            if (asyncresult.exception == null) goto _L2; else goto _L1
_L1:
            Xlog.d("Settings/CallWaitingCheckBoxPreference", (new StringBuilder()).append("handleGetCallWaitingResponse: ar.exception=").append(asyncresult.exception).toString());
            setEnabled(false);
            if (mTcpListener != null)
                mTcpListener.onException(CallWaitingCheckBoxPreference.this, (CommandException)asyncresult.exception);
_L4:
            return;
_L2:
            if (!(asyncresult.userObj instanceof Throwable))
                break; /* Loop/switch isn't completed */
            if (mTcpListener != null)
            {
                mTcpListener.onError(CallWaitingCheckBoxPreference.this, 400);
                return;
            }
            if (true) goto _L4; else goto _L3
_L3:
            int ai[];
            Xlog.d("Settings/CallWaitingCheckBoxPreference", "handleGetCallWaitingResponse: CW state successfully queried.");
            ai = (int[])(int[])asyncresult.result;
            CallWaitingCheckBoxPreference callwaitingcheckboxpreference = CallWaitingCheckBoxPreference.this;
            boolean flag;
            if (ai[0] == 1 && (1 & ai[1]) == 1)
                flag = true;
            else
                flag = false;
            try
            {
                callwaitingcheckboxpreference.setChecked(flag);
                return;
            }
            catch (ArrayIndexOutOfBoundsException arrayindexoutofboundsexception)
            {
                Xlog.e("Settings/CallWaitingCheckBoxPreference", (new StringBuilder()).append("handleGetCallWaitingResponse: improper result: err =").append(arrayindexoutofboundsexception.getMessage()).toString());
            }
            return;
        }

        private void handleSetCallWaitingResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
                Xlog.d("Settings/CallWaitingCheckBoxPreference", (new StringBuilder()).append("handleSetCallWaitingResponse: ar.exception=").append(asyncresult.exception).toString());
            Xlog.d("Settings/CallWaitingCheckBoxPreference", "handleSetCallWaitingResponse: re get");
            if (CallSettings.isMultipleSim())
                if (mServiceClass == 512)
                {
                    ((GeminiPhone)mPhone).getVtCallWaitingGemini(obtainMessage(0, 1, 1, asyncresult.exception), mSimId);
                    return;
                } else
                {
                    ((GeminiPhone)mPhone).getCallWaitingGemini(obtainMessage(0, 1, 1, asyncresult.exception), mSimId);
                    return;
                }
            if (mServiceClass == 512)
            {
                mPhone.getVtCallWaiting(obtainMessage(0, 1, 1, asyncresult.exception));
                return;
            } else
            {
                mPhone.getCallWaiting(obtainMessage(0, 1, 1, asyncresult.exception));
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetCallWaitingResponse(message);
                return;

            case 0: // '\0'
                handleGetCallWaitingResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CallWaitingCheckBoxPreference.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "Settings/CallWaitingCheckBoxPreference";
    private final MyHandler mHandler;
    private final Phone mPhone;
    private int mServiceClass;
    private int mSimId;
    private TimeConsumingPreferenceListener mTcpListener;

    public CallWaitingCheckBoxPreference(Context context)
    {
        this(context, null);
    }

    public CallWaitingCheckBoxPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101008f);
    }

    public CallWaitingCheckBoxPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mHandler = new MyHandler();
        mSimId = 2;
        mServiceClass = 1;
        mPhone = PhoneGlobals.getPhone();
    }

    void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
        Xlog.d("Settings/CallWaitingCheckBoxPreference", (new StringBuilder()).append("init, simId = ").append(i).toString());
        mTcpListener = timeconsumingpreferencelistener;
        mSimId = i;
        if (!flag)
        {
            if (CallSettings.isMultipleSim())
            {
                if (mServiceClass == 512)
                    ((GeminiPhone)mPhone).getVtCallWaitingGemini(mHandler.obtainMessage(0, 0, 0), mSimId);
                else
                    ((GeminiPhone)mPhone).getCallWaitingGemini(mHandler.obtainMessage(0, 0, 0), mSimId);
            } else
            if (mServiceClass == 512)
                mPhone.getVtCallWaiting(mHandler.obtainMessage(0, 0, 0));
            else
                mPhone.getCallWaiting(mHandler.obtainMessage(0, 0, 0));
            if (mTcpListener != null)
                mTcpListener.onStarted(this, true);
        }
    }

    protected void onClick()
    {
        super.onClick();
        boolean flag = isChecked();
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        setChecked(flag1);
        if (CallSettings.isMultipleSim())
        {
            if (mServiceClass == 512)
                ((GeminiPhone)mPhone).setVtCallWaitingGemini(flag, mHandler.obtainMessage(1), mSimId);
            else
                ((GeminiPhone)mPhone).setCallWaitingGemini(flag, mHandler.obtainMessage(1), mSimId);
        } else
        if (mServiceClass == 512)
            mPhone.setVtCallWaiting(flag, mHandler.obtainMessage(1));
        else
            mPhone.setCallWaiting(flag, mHandler.obtainMessage(1));
        if (mTcpListener != null)
            mTcpListener.onStarted(this, false);
    }

    public void setServiceClass(int i)
    {
        mServiceClass = i;
    }




}
