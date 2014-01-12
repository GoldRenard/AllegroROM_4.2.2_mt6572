// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import android.os.SystemProperties;
import android.os.UserHandle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.telephony.*;
import com.android.internal.telephony.PhoneStateIntentReceiver;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            Utils

public class AirplaneModeEnabler
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final int EVENT_SERVICE_STATE_CHANGED = 3;
    private static final String LOG_TAG = "AirplaneModeEnabler";
    private BroadcastReceiver mAirplaneModeReceiver;
    private final CheckBoxPreference mCheckBoxPref;
    private final Context mContext;
    private IntentFilter mIntentFilter;
    PhoneStateListener mPhoneStateListener1;
    PhoneStateListener mPhoneStateListener2;
    PhoneStateListener mPhoneStateListener3;
    PhoneStateListener mPhoneStateListener4;
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    private int mServiceState1;
    private int mServiceState2;
    private int mServiceState3;
    private int mServiceState4;
    private TelephonyManager mTelephonyManager;
    private TelephonyManagerEx mTelephonyManagerEx;

    public AirplaneModeEnabler(Context context, CheckBoxPreference checkboxpreference)
    {
        mServiceState1 = 3;
        mServiceState2 = 3;
        mServiceState3 = 3;
        mServiceState4 = 3;
        mAirplaneModeReceiver = new BroadcastReceiver() {

            final AirplaneModeEnabler this$0;

            public void onReceive(Context context1, Intent intent)
            {
                Xlog.i("AirplaneModeEnabler", "mAirplaneModeReceiver AIRPLANE_MODE_CHANGED...");
                boolean flag = AirplaneModeEnabler.isAirplaneModeOn(mContext);
                mCheckBoxPref.setChecked(flag);
                mCheckBoxPref.setEnabled(true);
            }

            
            {
                this$0 = AirplaneModeEnabler.this;
                super();
            }
        }
;
        mPhoneStateListener1 = new PhoneStateListener() {

            final AirplaneModeEnabler this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                Xlog.i("AirplaneModeEnabler", (new StringBuilder()).append("PhoneStateListener1.onServiceStateChanged: serviceState=").append(servicestate).toString());
                mServiceState1 = servicestate.getState();
                onAirplaneModeChanged();
            }

            
            {
                this$0 = AirplaneModeEnabler.this;
                super();
            }
        }
;
        mPhoneStateListener2 = new PhoneStateListener() {

            final AirplaneModeEnabler this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                Xlog.i("AirplaneModeEnabler", (new StringBuilder()).append("PhoneStateListener2.onServiceStateChanged: serviceState=").append(servicestate).toString());
                mServiceState2 = servicestate.getState();
                onAirplaneModeChanged();
            }

            
            {
                this$0 = AirplaneModeEnabler.this;
                super();
            }
        }
;
        mPhoneStateListener3 = new PhoneStateListener() {

            final AirplaneModeEnabler this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                Xlog.i("AirplaneModeEnabler", (new StringBuilder()).append("PhoneStateListener3.onServiceStateChanged: serviceState=").append(servicestate).toString());
                mServiceState3 = servicestate.getState();
                onAirplaneModeChanged();
            }

            
            {
                this$0 = AirplaneModeEnabler.this;
                super();
            }
        }
;
        mPhoneStateListener4 = new PhoneStateListener() {

            final AirplaneModeEnabler this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                Xlog.i("AirplaneModeEnabler", (new StringBuilder()).append("PhoneStateListener4.onServiceStateChanged: serviceState=").append(servicestate).toString());
                mServiceState4 = servicestate.getState();
                onAirplaneModeChanged();
            }

            
            {
                this$0 = AirplaneModeEnabler.this;
                super();
            }
        }
;
        mContext = context;
        mCheckBoxPref = checkboxpreference;
        mTelephonyManager = (TelephonyManager)context.getSystemService("phone");
        mTelephonyManagerEx = new TelephonyManagerEx(context);
        checkboxpreference.setPersistent(false);
    }

    public static boolean isAirplaneModeOn(Context context)
    {
        int i = android.provider.Settings.Global.getInt(context.getContentResolver(), "airplane_mode_on", 0);
        boolean flag = false;
        if (i != 0)
            flag = true;
        return flag;
    }

    private void onAirplaneModeChanged()
    {
        boolean flag = isAirplaneModeOn(mContext);
        if (!flag || mServiceState1 == 3 && mServiceState2 == 3 && mServiceState3 == 3 && mServiceState4 == 3)
        {
            Xlog.d("AirplaneModeEnabler", (new StringBuilder()).append("Finish! airplaneModeEnabled:").append(flag).toString());
            mCheckBoxPref.setChecked(flag);
            mCheckBoxPref.setEnabled(true);
            return;
        } else
        {
            Xlog.d("AirplaneModeEnabler", (new StringBuilder()).append("Unfinish! serviceState1:").append(mServiceState1).append(" serviceState2:").append(mServiceState2).toString());
            return;
        }
    }

    private void regListenForGeminiPlus(int i)
    {
    }

    private void setAirplaneModeOn(boolean flag)
    {
        android.content.ContentResolver contentresolver = mContext.getContentResolver();
        int i;
        if (flag)
            i = 1;
        else
            i = 0;
        android.provider.Settings.Global.putInt(contentresolver, "airplane_mode_on", i);
        if (!Utils.isWifiOnly(mContext))
            mCheckBoxPref.setEnabled(false);
        mCheckBoxPref.setChecked(flag);
        Intent intent = new Intent("android.intent.action.AIRPLANE_MODE");
        intent.putExtra("state", flag);
        mContext.sendBroadcastAsUser(intent, UserHandle.ALL);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (!Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
            setAirplaneModeOn(((Boolean)obj).booleanValue());
        return true;
    }

    public void pause()
    {
        mCheckBoxPref.setOnPreferenceChangeListener(null);
        if (!Utils.isWifiOnly(mContext))
        {
            mTelephonyManagerEx.listen(mPhoneStateListener1, 0, 0);
            mTelephonyManagerEx.listen(mPhoneStateListener2, 0, 1);
            regListenForGeminiPlus(0);
            return;
        } else
        {
            mContext.unregisterReceiver(mAirplaneModeReceiver);
            return;
        }
    }

    public void resume()
    {
        mCheckBoxPref.setChecked(isAirplaneModeOn(mContext));
        if (!Utils.isWifiOnly(mContext))
        {
            mCheckBoxPref.setEnabled(true);
            mTelephonyManagerEx.listen(mPhoneStateListener1, 1, 0);
            mTelephonyManagerEx.listen(mPhoneStateListener2, 1, 1);
            regListenForGeminiPlus(1);
        } else
        {
            mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
            mIntentFilter.addAction("android.intent.action.AIRPLANE_MODE");
            mContext.registerReceiver(mAirplaneModeReceiver, mIntentFilter);
        }
        mCheckBoxPref.setOnPreferenceChangeListener(this);
    }

    public void setAirplaneModeInECM(boolean flag, boolean flag1)
    {
        if (flag)
            setAirplaneModeOn(flag1);
        else
        if (!Utils.isWifiOnly(mContext))
        {
            onAirplaneModeChanged();
            return;
        }
    }




/*
    static int access$202(AirplaneModeEnabler airplanemodeenabler, int i)
    {
        airplanemodeenabler.mServiceState1 = i;
        return i;
    }

*/



/*
    static int access$402(AirplaneModeEnabler airplanemodeenabler, int i)
    {
        airplanemodeenabler.mServiceState2 = i;
        return i;
    }

*/


/*
    static int access$502(AirplaneModeEnabler airplanemodeenabler, int i)
    {
        airplanemodeenabler.mServiceState3 = i;
        return i;
    }

*/


/*
    static int access$602(AirplaneModeEnabler airplanemodeenabler, int i)
    {
        airplanemodeenabler.mServiceState4 = i;
        return i;
    }

*/
}
