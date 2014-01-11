// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.os.*;
import android.preference.ListPreference;
import android.util.AttributeSet;
import com.android.internal.telephony.CommandException;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.phone.TimeConsumingPreferenceListener;
import com.mediatek.settings.CallSettings;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CLIRListPreference extends ListPreference
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_CLIR = 0;
        private static final int MESSAGE_SET_CLIR = 1;
        final CLIRListPreference this$0;

        private void handleGetCLIRResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (message.arg2 == 1)
                mTcpListener.onFinished(CLIRListPreference.this, false);
            else
                mTcpListener.onFinished(CLIRListPreference.this, true);
            mClirArray = null;
            if (asyncresult.exception != null)
            {
                Xlog.d("Settings/CLIRListPreference", (new StringBuilder()).append("handleGetCLIRResponse: ar.exception=").append(asyncresult.exception).toString());
                setEnabled(false);
                mTcpListener.onException(CLIRListPreference.this, (CommandException)asyncresult.exception);
                return;
            }
            if (asyncresult.userObj instanceof Throwable)
            {
                mTcpListener.onError(CLIRListPreference.this, 400);
                return;
            }
            int ai[] = (int[])(int[])asyncresult.result;
            if (ai.length != 2)
            {
                mTcpListener.onError(CLIRListPreference.this, 400);
                return;
            } else
            {
                Xlog.d("Settings/CLIRListPreference", (new StringBuilder()).append("handleGetCLIRResponse: CLIR successfully queried, clirArray[0]=").append(ai[0]).append(", clirArray[1]=").append(ai[1]).toString());
                handleGetCLIRResult(ai);
                return;
            }
        }

        private void handleSetCLIRResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
                Xlog.d("Settings/CLIRListPreference", (new StringBuilder()).append("handleSetCallWaitingResponse: ar.exception=").append(asyncresult.exception).toString());
            Xlog.d("Settings/CLIRListPreference", "handleSetCallWaitingResponse: re get");
            if (CallSettings.isMultipleSim())
            {
                ((GeminiPhone)mPhone).getOutgoingCallerIdDisplayGemini(obtainMessage(0, 1, 1, asyncresult.exception), mSimId);
                return;
            } else
            {
                mPhone.getOutgoingCallerIdDisplay(obtainMessage(0, 1, 1, asyncresult.exception));
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetCLIRResponse(message);
                return;

            case 0: // '\0'
                handleGetCLIRResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CLIRListPreference.this;
            super();
        }

    }


    private static final boolean DBG = true;
    public static final int DEFAULT_SIM = 2;
    private static final String LOG_TAG = "Settings/CLIRListPreference";
    int mClirArray[];
    private final MyHandler mHandler;
    private final Phone mPhone;
    private int mSimId;
    private TimeConsumingPreferenceListener mTcpListener;

    public CLIRListPreference(Context context)
    {
        this(context, null);
    }

    public CLIRListPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mSimId = 2;
        mPhone = PhoneGlobals.getPhone();
    }

    void handleGetCLIRResult(int ai[])
    {
        mClirArray = ai;
        boolean flag;
        if (ai[1] != 1 && ai[1] != 3 && ai[1] != 4)
            flag = false;
        else
            flag = true;
        setEnabled(flag);
        byte byte0;
        switch (ai[1])
        {
        case 1: // '\001'
        case 3: // '\003'
        case 4: // '\004'
            switch (ai[0])
            {
            case 2: // '\002'
                byte0 = 2;
                break;

            case 1: // '\001'
                byte0 = 1;
                break;

            default:
                byte0 = 0;
                break;
            }
            break;

        case 2: // '\002'
        default:
            byte0 = 0;
            break;
        }
        setValueIndex(byte0);
        int i = 0x7f0d01c1;
        switch (byte0)
        {
        case 0: // '\0'
            i = 0x7f0d01c1;
            break;

        case 1: // '\001'
            i = 0x7f0d01bf;
            break;

        case 2: // '\002'
            i = 0x7f0d01c0;
            break;
        }
        setSummary(i);
    }

    void init(TimeConsumingPreferenceListener timeconsumingpreferencelistener, boolean flag, int i)
    {
        Xlog.d("Settings/CLIRListPreference", (new StringBuilder()).append("init, simId = ").append(i).toString());
        mTcpListener = timeconsumingpreferencelistener;
        mSimId = i;
        if (!flag)
        {
            if (CallSettings.isMultipleSim())
                ((GeminiPhone)mPhone).getOutgoingCallerIdDisplayGemini(mHandler.obtainMessage(0, 0, 0), mSimId);
            else
                mPhone.getOutgoingCallerIdDisplay(mHandler.obtainMessage(0, 0, 0));
            if (mTcpListener != null)
                mTcpListener.onStarted(this, true);
        }
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (CallSettings.isMultipleSim())
            ((GeminiPhone)mPhone).setOutgoingCallerIdDisplayGemini(findIndexOfValue(getValue()), mHandler.obtainMessage(1), mSimId);
        else
            mPhone.setOutgoingCallerIdDisplay(findIndexOfValue(getValue()), mHandler.obtainMessage(1));
        if (mTcpListener != null)
            mTcpListener.onStarted(this, false);
    }



}
