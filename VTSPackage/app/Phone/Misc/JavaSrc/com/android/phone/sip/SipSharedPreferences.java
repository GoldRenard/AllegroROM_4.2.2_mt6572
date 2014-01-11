// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone.sip;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Log;

public class SipSharedPreferences
{

    private static final String KEY_NUMBER_OF_PROFILES = "profiles";
    private static final String KEY_PRIMARY_ACCOUNT = "primary";
    private static final String SIP_SHARED_PREFERENCES = "SIP_PREFERENCES";
    private Context mContext;
    private SharedPreferences mPreferences;

    public SipSharedPreferences(Context context)
    {
        mPreferences = context.getSharedPreferences("SIP_PREFERENCES", 1);
        mContext = context;
    }

    public String getPrimaryAccount()
    {
        return mPreferences.getString("primary", null);
    }

    public int getProfilesCount()
    {
        return mPreferences.getInt("profiles", 0);
    }

    public boolean getReceivingCallsEnabled()
    {
        int j = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "sip_receive_calls");
        int i = j;
_L1:
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        return i == 1;
        settingnotfoundexception;
        settingnotfoundexception.printStackTrace();
        i = 0;
          goto _L1
    }

    public String getSipCallOption()
    {
        String s = android.provider.Settings.Global.getString(mContext.getContentResolver(), "sip_call_options");
        if (s != null)
            return s;
        else
            return mContext.getString(0x7f0d0368);
    }

    public boolean hasPrimaryAccount()
    {
        return !TextUtils.isEmpty(mPreferences.getString("primary", null));
    }

    public boolean isPrimaryAccount(String s)
    {
        return s.equals(mPreferences.getString("primary", null));
    }

    public boolean isReceivingCallsEnabled()
    {
        int i;
        boolean flag;
        try
        {
            i = android.provider.Settings.Global.getInt(mContext.getContentResolver(), "sip_receive_calls");
        }
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            Log.d("SIP", "ReceiveCall option is not set; use default value");
            return false;
        }
        flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    public void setPrimaryAccount(String s)
    {
        android.content.SharedPreferences.Editor editor = mPreferences.edit();
        editor.putString("primary", s);
        editor.apply();
    }

    public void setProfilesCount(int i)
    {
        android.content.SharedPreferences.Editor editor = mPreferences.edit();
        editor.putInt("profiles", i);
        editor.apply();
    }

    public void setReceivingCallsEnabled(boolean flag)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "sip_receive_calls", i);
    }

    public void setSipCallOption(String s)
    {
        android.provider.Settings.Global.putString(mContext.getContentResolver(), "sip_call_options", s);
    }

    public void unsetPrimaryAccount()
    {
        setPrimaryAccount(null);
    }
}
