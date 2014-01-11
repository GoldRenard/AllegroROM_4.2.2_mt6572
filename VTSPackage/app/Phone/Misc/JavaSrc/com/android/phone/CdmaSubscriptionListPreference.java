// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.os.*;
import android.preference.ListPreference;
import android.util.AttributeSet;
import android.util.Log;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.PhoneFactory;

public class CdmaSubscriptionListPreference extends ListPreference
{
    private class CdmaSubscriptionButtonHandler extends Handler
    {

        static final int MESSAGE_SET_CDMA_SUBSCRIPTION;
        final CdmaSubscriptionListPreference this$0;

        private void handleSetCdmaSubscriptionMode(Message message)
        {
            mPhone = PhoneFactory.getDefaultPhone();
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception == null)
            {
                int i = Integer.valueOf((String)asyncresult.userObj).intValue();
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "subscription_mode", i);
                return;
            } else
            {
                Log.e("CdmaSubscriptionListPreference", "Setting Cdma subscription source failed");
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 0: // '\0'
                handleSetCdmaSubscriptionMode(message);
                return;
            }
        }

        private CdmaSubscriptionButtonHandler()
        {
            this$0 = CdmaSubscriptionListPreference.this;
            super();
        }

    }


    private static final int CDMA_SUBSCRIPTION_NV = 1;
    private static final int CDMA_SUBSCRIPTION_RUIM_SIM = 0;
    private static final String LOG_TAG = "CdmaSubscriptionListPreference";
    static final int preferredSubscriptionMode = 1;
    private CdmaSubscriptionButtonHandler mHandler;
    private Phone mPhone;

    public CdmaSubscriptionListPreference(Context context)
    {
        this(context, null);
    }

    public CdmaSubscriptionListPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mPhone = PhoneFactory.getDefaultPhone();
        mHandler = new CdmaSubscriptionButtonHandler();
        setCurrentCdmaSubscriptionModeValue();
    }

    private void setCurrentCdmaSubscriptionModeValue()
    {
        setValue(Integer.toString(android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "subscription_mode", 1)));
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (!flag)
            return;
        int i = Integer.valueOf(getValue()).intValue();
        Log.d("CdmaSubscriptionListPreference", (new StringBuilder()).append("Setting new value ").append(i).toString());
        int j;
        switch (i)
        {
        case 0: // '\0'
            j = 0;
            break;

        case 1: // '\001'
            j = 1;
            break;

        default:
            j = 1;
            break;
        }
        mPhone.setCdmaSubscription(j, mHandler.obtainMessage(0, getValue()));
    }

    protected void showDialog(Bundle bundle)
    {
        setCurrentCdmaSubscriptionModeValue();
        super.showDialog(bundle);
    }



/*
    static Phone access$102(CdmaSubscriptionListPreference cdmasubscriptionlistpreference, Phone phone)
    {
        cdmasubscriptionlistpreference.mPhone = phone;
        return phone;
    }

*/
}
