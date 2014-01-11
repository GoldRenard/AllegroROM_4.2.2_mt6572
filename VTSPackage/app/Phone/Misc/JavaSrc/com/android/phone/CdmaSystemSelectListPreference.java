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

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class CdmaSystemSelectListPreference extends ListPreference
{
    private class MyHandler extends Handler
    {

        static final int MESSAGE_GET_ROAMING_PREFERENCE = 0;
        static final int MESSAGE_SET_ROAMING_PREFERENCE = 1;
        final CdmaSystemSelectListPreference this$0;

        private void handleQueryCdmaRoamingPreference(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception == null)
            {
                int i = ((int[])(int[])asyncresult.result)[0];
                int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "roaming_settings", 0);
                if (i != 0 && i != 2)
                {
                    resetCdmaRoamingModeToDefault();
                    return;
                }
                if (i != j)
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "roaming_settings", i);
                setValue(Integer.toString(i));
            }
        }

        private void handleSetCdmaRoamingPreference(Message message)
        {
            if (((AsyncResult)message.obj).exception == null && getValue() != null)
            {
                int i = Integer.valueOf(getValue()).intValue();
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "roaming_settings", i);
                return;
            } else
            {
                mPhone.queryCdmaRoamingPreference(obtainMessage(0));
                return;
            }
        }

        private void resetCdmaRoamingModeToDefault()
        {
            setValue(Integer.toString(0));
            android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "roaming_settings", 0);
            mPhone.setCdmaRoamingPreference(0, obtainMessage(1));
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetCdmaRoamingPreference(message);
                return;

            case 0: // '\0'
                handleQueryCdmaRoamingPreference(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = CdmaSystemSelectListPreference.this;
            super();
        }

    }


    private static final boolean DBG = false;
    private static final String LOG_TAG = "CdmaRoamingListPreference";
    private MyHandler mHandler;
    private Phone mPhone;

    public CdmaSystemSelectListPreference(Context context)
    {
        this(context, null);
    }

    public CdmaSystemSelectListPreference(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mHandler = new MyHandler();
        mPhone = PhoneGlobals.getPhone();
        mHandler = new MyHandler();
        mPhone.queryCdmaRoamingPreference(mHandler.obtainMessage(0));
    }

    protected void onDialogClosed(boolean flag)
    {
        super.onDialogClosed(flag);
        if (flag && getValue() != null)
        {
            int i = Integer.valueOf(getValue()).intValue();
            if (i != android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "roaming_settings", 0))
            {
                byte byte0;
                switch (i)
                {
                case 2: // '\002'
                    byte0 = 2;
                    break;

                default:
                    byte0 = 0;
                    break;
                }
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "roaming_settings", i);
                mPhone.setCdmaRoamingPreference(byte0, mHandler.obtainMessage(1));
            }
            return;
        } else
        {
            Object aobj[] = new Object[2];
            aobj[0] = Boolean.valueOf(flag);
            aobj[1] = getValue();
            Log.d("CdmaRoamingListPreference", String.format("onDialogClosed: positiveResult=%b value=%s -- do nothing", aobj));
            return;
        }
    }

    protected void showDialog(Bundle bundle)
    {
        if (Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
        {
            return;
        } else
        {
            super.showDialog(bundle);
            return;
        }
    }

}
