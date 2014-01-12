// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.telephony.*;
import android.text.TextUtils;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.Iterator;
import java.util.List;

public class SimStatusGemini extends PreferenceActivity
{
    private class AirplaneModeBroadcastReceiver extends BroadcastReceiver
    {

        final SimStatusGemini this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                if (intent.getBooleanExtra("state", false))
                    mCellMgr.handleCellConn(mSimId, 302);
            } else
            if ("android.intent.action.DUAL_SIM_MODE".equals(s))
            {
                int i = intent.getIntExtra("mode", -1);
                if (i == 0)
                {
                    mCellMgr.handleCellConn(mSimId, 302);
                    return;
                }
                if (i != 3 && i != mSimId)
                {
                    mCellMgr.handleCellConn(mSimId, 302);
                    return;
                }
            }
        }

        private AirplaneModeBroadcastReceiver()
        {
            this$0 = SimStatusGemini.this;
            super();
        }

    }


    private static final int EVENT_SERVICE_STATE_CHANGED = 300;
    private static final int EVENT_SIGNAL_STRENGTH_CHANGED = 200;
    private static final String KEY_DATA_STATE = "data_state";
    private static final String KEY_NETWORK_TYPE = "network_type";
    private static final String KEY_NUMBER = "number";
    private static final String KEY_OPERATOR_NAME = "operator_name";
    private static final String KEY_ROAMING_STATE = "roaming_state";
    private static final String KEY_SERVICE_STATE = "service_state";
    private static final String KEY_SIGNAL_STRENGTH = "signal_strength";
    private static final String TAG = "Gemini_SimStatus";
    private static Resources sRes;
    private static String sUnknown;
    private CellConnMgr mCellMgr;
    private GeminiPhone mGeminiPhone;
    private Handler mHandler;
    private boolean mIsShouldBeFinished;
    private boolean mIsUnlockFollow;
    private PhoneStateListener mPhoneStateListener;
    private final BroadcastReceiver mReceiver = new AirplaneModeBroadcastReceiver();
    private Runnable mServiceComplete;
    private int mServiceState;
    private SignalStrength mSignalStrength;
    private Preference mSignalStrengthPreference;
    private int mSimId;
    private TelephonyManager mTelephonyManager;
    private TelephonyManagerEx mTelephonyManagerEx;

    public SimStatusGemini()
    {
        mGeminiPhone = null;
        mSimId = 0;
        mIsUnlockFollow = false;
        mIsShouldBeFinished = false;
        mHandler = new Handler();
        mServiceComplete = new Runnable() {

            final SimStatusGemini this$0;

            public void run()
            {
                int i = mCellMgr.getResult();
                CellConnMgr _tmp = mCellMgr;
                if (i != 0)
                {
                    CellConnMgr _tmp1 = mCellMgr;
                    if (4 != i)
                    {
                        Xlog.d("Gemini_SimStatus", "mCell Mgr Result is not OK");
                        mIsShouldBeFinished = true;
                        finish();
                        return;
                    }
                }
                mIsUnlockFollow = false;
            }

            
            {
                this$0 = SimStatusGemini.this;
                super();
            }
        }
;
        mPhoneStateListener = new PhoneStateListener() {

            final SimStatusGemini this$0;

            public void onDataConnectionStateChanged(int i, int j)
            {
                updateDataState();
                updateNetworkType();
            }

            public void onServiceStateChanged(ServiceState servicestate)
            {
                if (servicestate.getMySimId() == mSimId)
                {
                    mServiceState = servicestate.getState();
                    Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("ServiceStateChanged mSimId : ").append(mSimId).append(" mServiceState : ").append(mServiceState).toString());
                    updateServiceState(servicestate);
                    updateSignalStrength();
                }
            }

            public void onSignalStrengthsChanged(SignalStrength signalstrength)
            {
                if (signalstrength.getMySimId() == mSimId)
                {
                    mSignalStrength = signalstrength;
                    Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("SignalStrengthsChanged mSimId : ").append(mSimId).append(" mSignalStrength : ").append(mSignalStrength).toString());
                    updateSignalStrength();
                }
            }

            
            {
                this$0 = SimStatusGemini.this;
                super();
            }
        }
;
    }

    private int dealWith3AppLaunch()
    {
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        int i;
        if (list.size() == 0)
            i = -1;
        else
        if (list.size() == 1)
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
        } else
        {
            i = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            Iterator iterator = list.iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (i > siminfo.mSlot)
                    i = siminfo.mSlot;
            } while (true);
        }
        Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("dealWith3AppLaunch() slotID=").append(i).toString());
        return i;
    }

    private void setSummary(String s, String s1, String s2)
    {
        String s3;
        Preference preference;
        try
        {
            s3 = SystemProperties.get(s1, s2);
            preference = findPreference(s);
        }
        catch (RuntimeException runtimeexception)
        {
            Xlog.d("Gemini_SimStatus", "fail to get system property");
            return;
        }
        if (preference == null)
            break MISSING_BLOCK_LABEL_41;
        if (s3.equals("unknown"))
            s3 = sUnknown;
        preference.setSummary(s3);
    }

    private void setSummaryText(String s, String s1)
    {
        if (TextUtils.isEmpty(s1))
            s1 = getResources().getString(0x7f0b026c);
        Preference preference = findPreference(s);
        if (preference != null)
            preference.setSummary(s1);
    }

    private void updateDataState()
    {
        int i = mTelephonyManagerEx.getDataState(mSimId);
        String s = sRes.getString(0x7f0b028c);
        switch (i)
        {
        case 0: // '\0'
            s = sRes.getString(0x7f0b0288);
            break;

        case 1: // '\001'
            s = sRes.getString(0x7f0b0289);
            break;

        case 3: // '\003'
            s = sRes.getString(0x7f0b028b);
            break;

        case 2: // '\002'
            s = sRes.getString(0x7f0b028a);
            break;
        }
        setSummaryText("data_state", s);
    }

    private void updateNetworkType()
    {
        String s = mTelephonyManager.getNetworkTypeNameGemini(mSimId);
        Preference preference = findPreference("network_type");
        if (preference != null)
        {
            if (s.equals("UNKNOWN"))
                s = sUnknown;
            preference.setSummary(s);
        }
    }

    private void updateServiceState(ServiceState servicestate)
    {
        int i = servicestate.getState();
        String s = sRes.getString(0x7f0b028c);
        switch (i)
        {
        case 3: // '\003'
            s = sRes.getString(0x7f0b0282);
            break;

        case 2: // '\002'
            s = sRes.getString(0x7f0b0281);
            break;

        case 1: // '\001'
            s = sRes.getString(0x7f0b0280);
            break;

        case 0: // '\0'
            s = sRes.getString(0x7f0b027f);
            break;
        }
        setSummaryText("service_state", s);
        if (servicestate.getRoaming())
            setSummaryText("roaming_state", sRes.getString(0x7f0b0283));
        else
            setSummaryText("roaming_state", sRes.getString(0x7f0b0284));
        setSummaryText("operator_name", servicestate.getOperatorAlphaLong());
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mCellMgr = new CellConnMgr(mServiceComplete);
        mCellMgr.register(this);
        addPreferencesFromResource(0x7f050012);
        mSimId = getIntent().getIntExtra("slotid", -1);
        Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("mSimId is : ").append(mSimId).toString());
        if (mSimId == -1)
            mSimId = dealWith3AppLaunch();
        android.provider.Telephony.SIMInfo siminfo = android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, mSimId);
        int i = android.provider.Telephony.SIMInfo.getInsertedSIMCount(this);
        String s = null;
        if (i > 1)
        {
            s = null;
            if (siminfo != null)
                s = siminfo.mDisplayName;
        }
        if (s != null && !s.equals(""))
            setTitle(s);
        sRes = getResources();
        sUnknown = sRes.getString(0x7f0b026c);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManagerEx = new TelephonyManagerEx(this);
        mGeminiPhone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        mSignalStrengthPreference = findPreference("signal_strength");
    }

    protected void onDestroy()
    {
        mCellMgr.unregister();
        super.onDestroy();
    }

    public void onPause()
    {
        super.onPause();
        if (mIsShouldBeFinished)
        {
            finish();
            return;
        } else
        {
            unregisterReceiver(mReceiver);
            mTelephonyManager.listen(mPhoneStateListener, 0);
            return;
        }
    }

    protected void onResume()
    {
        super.onResume();
        if (mIsShouldBeFinished)
        {
            finish();
            return;
        }
        if (!mIsUnlockFollow)
        {
            mIsUnlockFollow = true;
            mHandler.postDelayed(new Runnable() {

                final SimStatusGemini this$0;

                public void run()
                {
                    mCellMgr.handleCellConn(mSimId, 302);
                }

            
            {
                this$0 = SimStatusGemini.this;
                super();
            }
            }
, 500L);
        }
        IntentFilter intentfilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        intentfilter.addAction("android.intent.action.DUAL_SIM_MODE");
        registerReceiver(mReceiver, intentfilter);
        String s = mGeminiPhone.getLine1NumberGemini(mSimId);
        boolean flag = TextUtils.isEmpty(s);
        String s1 = null;
        if (!flag)
            s1 = PhoneNumberUtils.formatNumber(s);
        setSummaryText("number", s1);
        updateDataState();
        ServiceState servicestate = mGeminiPhone.getServiceStateGemini(mSimId);
        updateServiceState(servicestate);
        mServiceState = servicestate.getState();
        mSignalStrength = mGeminiPhone.getSignalStrengthGemini(mSimId);
        updateSignalStrength();
        mTelephonyManagerEx.listen(mPhoneStateListener, 321, mSimId);
    }

    void updateSignalStrength()
    {
        Resources resources;
        int j;
        int k;
label0:
        {
            Xlog.d("Gemini_SimStatus", "updateSignalStrength()");
            if (mSignalStrengthPreference != null)
            {
                Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("ServiceState : ").append(mServiceState).toString());
                if (1 == mServiceState || 3 == mServiceState)
                {
                    Xlog.d("Gemini_SimStatus", "ServiceState is Not ready, set signalStrength 0");
                    mSignalStrengthPreference.setSummary("0");
                }
                resources = getResources();
                boolean flag = true;
                SignalStrength signalstrength = mSignalStrength;
                int i = 0;
                j = 0;
                k = 0;
                if (signalstrength != null)
                {
                    flag = mSignalStrength.isGsm();
                    if (flag)
                    {
                        j = mSignalStrength.getGsmSignalStrengthDbm();
                        i = mSignalStrength.getGsmSignalStrength();
                        Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("SignalStrength is ").append(j).append(" dbm , ").append(i).append(" asu").toString());
                        if (-1 == j)
                            j = 0;
                        k = 0;
                        if (-1 == i)
                            i = 0;
                    } else
                    {
                        j = mSignalStrength.getCdmaDbm();
                        k = mSignalStrength.getEvdoDbm();
                        Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("SignalStrength is ").append(j).append(" dbm , ").append(k).append(" dbm").toString());
                        if (-1 == j)
                            j = 0;
                        if (-1 == k)
                            k = 0;
                        i = 0;
                    }
                }
                if (!flag)
                    break label0;
                Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("SignalStrength is ").append(j).append(" dbm , ").append(i).append(" asu").toString());
                mSignalStrengthPreference.setSummary((new StringBuilder()).append(String.valueOf(j)).append(" ").append(resources.getString(0x7f0b028f)).append("   ").append(String.valueOf(i)).append(" ").append(resources.getString(0x7f0b0290)).toString());
            }
            return;
        }
        Xlog.d("Gemini_SimStatus", (new StringBuilder()).append("SignalStrength is ").append(j).append(" dbm , ").append(k).append(" dbm").toString());
        mSignalStrengthPreference.setSummary((new StringBuilder()).append(String.valueOf(j)).append(" ").append(resources.getString(0x7f0b028f)).append("   ").append(String.valueOf(k)).append(" ").append(resources.getString(0x7f0b01c1)).append(" ").append(resources.getString(0x7f0b028f)).toString());
    }



/*
    static boolean access$202(SimStatusGemini simstatusgemini, boolean flag)
    {
        simstatusgemini.mIsShouldBeFinished = flag;
        return flag;
    }

*/


/*
    static boolean access$302(SimStatusGemini simstatusgemini, boolean flag)
    {
        simstatusgemini.mIsUnlockFollow = flag;
        return flag;
    }

*/






/*
    static SignalStrength access$702(SimStatusGemini simstatusgemini, SignalStrength signalstrength)
    {
        simstatusgemini.mSignalStrength = signalstrength;
        return signalstrength;
    }

*/



/*
    static int access$802(SimStatusGemini simstatusgemini, int i)
    {
        simstatusgemini.mServiceState = i;
        return i;
    }

*/

}
