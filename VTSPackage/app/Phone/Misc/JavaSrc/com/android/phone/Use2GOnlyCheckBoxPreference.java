// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.*;
import android.preference.CheckBoxPreference;
import android.util.AttributeSet;
import android.util.Log;
import com.android.internal.telephony.Phone;

// Referenced classes of package com.android.phone:
//            PhoneGlobals

public class Use2GOnlyCheckBoxPreference extends CheckBoxPreference
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_PREFERRED_NETWORK_TYPE = 0;
        private static final int MESSAGE_SET_PREFERRED_NETWORK_TYPE = 1;
        final Use2GOnlyCheckBoxPreference this$0;

        private void handleGetPreferredNetworkTypeResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception == null)
            {
                int i = ((int[])(int[])asyncresult.result)[0];
                Log.i("Use2GOnlyCheckBoxPreference", (new StringBuilder()).append("get preferred network type=").append(i).toString());
                Use2GOnlyCheckBoxPreference use2gonlycheckboxpreference = Use2GOnlyCheckBoxPreference.this;
                boolean flag;
                if (i == 1)
                    flag = true;
                else
                    flag = false;
                use2gonlycheckboxpreference.setChecked(flag);
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", i);
                return;
            } else
            {
                Log.i("Use2GOnlyCheckBoxPreference", (new StringBuilder()).append("get preferred network type, exception=").append(asyncresult.exception).toString());
                setEnabled(false);
                return;
            }
        }

        private void handleSetPreferredNetworkTypeResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (mPd != null && mPd.isShowing())
                mPd.dismiss();
            if (asyncresult.exception != null)
            {
                setEnabled(false);
                Log.i("Use2GOnlyCheckBoxPreference", (new StringBuilder()).append("set preferred network type, exception=").append(asyncresult.exception).toString());
                mPhone.getPreferredNetworkType(obtainMessage(0));
                return;
            } else
            {
                Log.i("Use2GOnlyCheckBoxPreference", "set preferred network type done");
                return;
            }
        }

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1: // '\001'
                handleSetPreferredNetworkTypeResponse(message);
                return;

            case 0: // '\0'
                handleGetPreferredNetworkTypeResponse(message);
                return;
            }
        }

        private MyHandler()
        {
            this$0 = Use2GOnlyCheckBoxPreference.this;
            super();
        }

    }


    private static final String LOG_TAG = "Use2GOnlyCheckBoxPreference";
    private MyHandler mHandler;
    private ProgressDialog mPd;
    private Phone mPhone;

    public Use2GOnlyCheckBoxPreference(Context context)
    {
        this(context, null);
    }

    public Use2GOnlyCheckBoxPreference(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x101008f);
    }

    public Use2GOnlyCheckBoxPreference(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mPd = null;
        mPhone = PhoneGlobals.getPhone();
        mHandler = new MyHandler();
        int j = android.provider.Settings.Secure.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", -1);
        Log.i("Use2GOnlyCheckBoxPreference", (new StringBuilder()).append(" At the begining, networkMode=").append(j).append(" end").toString());
        mPhone.getPreferredNetworkType(mHandler.obtainMessage(0));
    }

    private void showProgressDialog()
    {
        mPd = new ProgressDialog(getContext());
        mPd.setMessage(getContext().getText(0x7f0d01df));
        mPd.setCancelable(false);
        mPd.setIndeterminate(true);
        mPd.show();
    }

    protected void onClick()
    {
        super.onClick();
        showProgressDialog();
        int i;
        if (isChecked())
            i = 1;
        else
            i = 0;
        Log.i("Use2GOnlyCheckBoxPreference", (new StringBuilder()).append("set preferred network type=").append(i).toString());
        android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", i);
        mPhone.setPreferredNetworkType(i, mHandler.obtainMessage(1));
    }


}
