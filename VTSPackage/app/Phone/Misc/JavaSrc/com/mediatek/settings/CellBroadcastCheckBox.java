// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.os.*;
import android.preference.CheckBoxPreference;
import android.telephony.TelephonyManager;
import android.util.AttributeSet;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.phone.PhoneGlobals;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings:
//            CallSettings, CellBroadcastActivity, RecoverChannelSettings

public class CellBroadcastCheckBox extends CheckBoxPreference
{
    private class MyHandler extends Handler
    {

        final CellBroadcastCheckBox this$0;

        private void handleGetStateResponse(Message message)
        {
            if (message.arg2 == 100)
            {
                if (mListener != null)
                    Xlog.d("Settings/CellBroadcastCheckBox", "For init query, there's no reading dialog!");
            } else
            if (mListener != null)
            {
                mListener.onFinished(CellBroadcastCheckBox.this, false);
                if (!mLastCheckStatus)
                    (new RecoverChannelSettings(mSimId, getContext().getContentResolver())).updateChannelStatus();
            }
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult == null)
            {
                Xlog.i("Settings/CellBroadcastCheckBox", "handleGetStateResponse,ar is null");
                if (message.arg2 == 100)
                {
                    setChecked(false);
                    setEnabled(false);
                } else
                if (mListener != null)
                {
                    mListener.onError(CellBroadcastCheckBox.this, 300);
                    return;
                }
            } else
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/CellBroadcastCheckBox", (new StringBuilder()).append("handleGetStateResponse: ar.exception=").append(asyncresult.exception).toString());
                if (message.arg2 == 100)
                {
                    setChecked(false);
                    setEnabled(false);
                    return;
                }
                if (mListener != null)
                {
                    mListener.onError(CellBroadcastCheckBox.this, 300);
                    return;
                }
            } else
            if (asyncresult.userObj instanceof Throwable)
            {
                if (message.arg2 == 100)
                {
                    setChecked(false);
                    setEnabled(false);
                    return;
                }
                if (mListener != null)
                {
                    mListener.onError(CellBroadcastCheckBox.this, 400);
                    return;
                }
            } else
            {
                if (asyncresult.result != null)
                {
                    Boolean boolean1 = (Boolean)asyncresult.result;
                    setChecked(boolean1.booleanValue());
                    return;
                }
                if (message.arg2 == 100)
                {
                    setChecked(false);
                    setEnabled(false);
                    return;
                }
                if (mListener != null)
                {
                    mListener.onError(CellBroadcastCheckBox.this, 400);
                    return;
                }
            }
        }

        private void handleSetStateResponse(Message message)
        {
label0:
            {
                if (message.arg2 == 101)
                {
                    AsyncResult asyncresult = (AsyncResult)message.obj;
                    if (asyncresult == null)
                    {
                        Xlog.i("Settings/CellBroadcastCheckBox", "handleSetStateResponse,ar is null");
                        mListener.onError(CellBroadcastCheckBox.this, 300);
                    } else
                    {
                        if (asyncresult.exception == null)
                            break label0;
                        Xlog.d("Settings/CellBroadcastCheckBox", (new StringBuilder()).append("handleSetStateResponse: ar.exception=").append(asyncresult.exception).toString());
                        if (mListener != null)
                        {
                            mListener.onError(CellBroadcastCheckBox.this, 300);
                            return;
                        }
                    }
                }
                return;
            }
            Xlog.i("Settings/CellBroadcastCheckBox", "handleSetStateResponse: re get ok");
            getCBState(false);
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 101: // 'e'
                handleSetStateResponse(message);
                return;

            case 100: // 'd'
                handleGetStateResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CellBroadcastCheckBox.this;
            super();
        }

    }


    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/CellBroadcastCheckBox";
    private static final int MESSAGE_GET_STATE = 100;
    private static final int MESSAGE_SET_STATE = 101;
    private MyHandler mHandler;
    private boolean mLastCheckStatus;
    private TimeConsumingPreferenceListener mListener;
    private Phone mPhone;
    int mSimId;

    public CellBroadcastCheckBox(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mPhone = PhoneGlobals.getPhone();
    }

    private void getCBState(boolean flag)
    {
        Message message;
        if (flag)
            message = mHandler.obtainMessage(100, 0, 100, null);
        else
            message = mHandler.obtainMessage(100, 0, 101, null);
        if (CallSettings.isMultipleSim())
            ((GeminiPhone)mPhone).queryCellBroadcastSmsActivationGemini(message, mSimId);
        else
            mPhone.queryCellBroadcastSmsActivation(message);
        if (flag && mListener != null && message.arg2 == 101)
            mListener.onStarted(this, flag);
    }

    private void setCBState(int i)
    {
        Message message = mHandler.obtainMessage(101, 0, 101, null);
        if (CallSettings.isMultipleSim())
            ((GeminiPhone)mPhone).activateCellBroadcastSmsGemini(i, message, mSimId);
        else
            mPhone.activateCellBroadcastSms(i, message);
        if (mListener != null)
            mListener.onStarted(this, false);
    }

    void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
label0:
        {
            Xlog.d("Settings/CellBroadcastCheckBox", (new StringBuilder()).append("init, simId = ").append(i).toString());
            mListener = timeconsumingpreferencelistener;
            mSimId = i;
            if (!flag)
            {
                TelephonyManager telephonymanager = (TelephonyManager)((CellBroadcastActivity)timeconsumingpreferencelistener).getSystemService("phone");
                boolean flag1;
                if (CallSettings.isMultipleSim())
                    flag1 = telephonymanager.hasIccCardGemini(mSimId);
                else
                    flag1 = telephonymanager.hasIccCard();
                if (!flag1)
                    break label0;
                getCBState(true);
            }
            return;
        }
        setChecked(false);
        setEnabled(false);
    }

    protected void onClick()
    {
        boolean flag = true;
        super.onClick();
        boolean flag1 = isChecked();
        boolean flag2;
        if (!flag1)
            flag2 = flag;
        else
            flag2 = false;
        mLastCheckStatus = flag2;
        int i;
        if (flag1)
            i = 0;
        else
            i = ((flag) ? 1 : 0);
        setCBState(i);
        if (flag1)
            flag = false;
        setChecked(flag);
    }



}
