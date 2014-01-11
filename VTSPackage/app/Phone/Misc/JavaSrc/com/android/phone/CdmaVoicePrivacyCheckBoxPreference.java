// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.os.*;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CdmaVoicePrivacyCheckBoxPreference extends CheckBoxPreference
{
    private class MyHandler extends Handler
    {

        static final int MESSAGE_GET_VP = 0;
        static final int MESSAGE_SET_VP = 1;
        final CdmaVoicePrivacyCheckBoxPreference this$0;

        private void handleGetVPResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception != null)
            {
                setEnabled(false);
                return;
            }
            int i = ((int[])(int[])asyncresult.result)[0];
            CdmaVoicePrivacyCheckBoxPreference cdmavoiceprivacycheckboxpreference = CdmaVoicePrivacyCheckBoxPreference.this;
            boolean flag;
            if (i != 0)
                flag = true;
            else
                flag = false;
            cdmavoiceprivacycheckboxpreference.setChecked(flag);
            android.provider.Settings.Secure.putInt(getContext().getContentResolver(), "enhanced_voice_privacy_enabled", i);
        }

        private void handleSetVPResponse(Message message)
        {
            if (((AsyncResult)message.obj).exception == null);
            phone.getEnhancedVoicePrivacy(obtainMessage(0));
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetVPResponse(message);
                return;

            case 0: // '\0'
                handleGetVPResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CdmaVoicePrivacyCheckBoxPreference.this;
            super();
        }

    }


    private static final String LOG_TAG = "CdmaVoicePrivacyCheckBoxPreference";
    private final boolean DBG;
    private MyHandler mHandler;
    Phone phone;

    public CdmaVoicePrivacyCheckBoxPreference(Context context)
    {
        this(context, null);
    }

    public CdmaVoicePrivacyCheckBoxPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101008f);
    }

    public CdmaVoicePrivacyCheckBoxPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        DBG = false;
        mHandler = new MyHandler();
        phone = PhoneGlobals.getPhone();
        phone.getEnhancedVoicePrivacy(mHandler.obtainMessage(0));
    }

    protected void onClick()
    {
        super.onClick();
        phone.enableEnhancedVoicePrivacy(isChecked(), mHandler.obtainMessage(1));
    }
}
