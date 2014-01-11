// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.Service;
import android.content.*;
import android.os.*;
import android.preference.PreferenceManager;
import android.telephony.*;
import android.util.Log;

// Referenced classes of package com.mediatek.settings:
//            CallSettings

public class NoNetworkPopUpService extends Service
{

    private static final boolean DBG = true;
    private static final int DELAY_TIME = 0x1d4c0;
    private static final String DELAY_TIME_KEY = "delay_time_key";
    private static final int NETWORK_POP_UP_MSG = 0;
    private static final int NETWORK_POP_UP_MSG_SIM_1 = 1;
    private static final int NETWORK_POP_UP_MSG_SIM_2 = 2;
    private static final int NETWORK_POP_UP_MSG_SIM_3 = 3;
    private static final int NETWORK_POP_UP_MSG_SIM_4 = 4;
    private static final int NETWORK_PUP_UP_MSG_GEMINI[] = {
        1, 2, 3, 4
    };
    public static final String NO_SERVICE = "no_service";
    public static final String NO_SERVICE_KEY = "no_service_key";
    private static final String TAG = "Settings/NoNetworkPopUpService";
    private boolean mAirplaneModeEnabled;
    private int mDelayTime;
    private int mDualSimMode;
    private IntentFilter mIntentFilter;
    private boolean mIsShouldShow;
    private final Handler mNetworkResponse = new Handler() {

        final NoNetworkPopUpService this$0;

        public void handleMessage(Message message)
        {
            mIsShouldShow = mSP.getBoolean("no_service_key", true);
            log((new StringBuilder()).append("[isShouldShow = ").append(mIsShouldShow).append("]").toString());
            log((new StringBuilder()).append("[mAirplaneModeEnabled = ").append(mAirplaneModeEnabled).append("]").toString());
            log((new StringBuilder()).append("[mDualSimMode = ").append(mDualSimMode).append("]").toString());
            log((new StringBuilder()).append("[message id = ").append(message.what).append("]").toString());
            if (!mIsShouldShow && !mAirplaneModeEnabled)
                switch (message.what)
                {
                default:
                    break;

                case 4: // '\004'
                    if ((8 & mDualSimMode) == 8 && isSimReady(3))
                        startNWActivity(message.what, 3);
                    break;

                case 3: // '\003'
                    if ((4 & mDualSimMode) == 4 && isSimReady(2))
                        startNWActivity(message.what, 2);
                    break;

                case 2: // '\002'
                    if ((2 & mDualSimMode) == 2 && isSimReady(1))
                        startNWActivity(message.what, 1);
                    break;

                case 1: // '\001'
                    if ((1 & mDualSimMode) == 1 && isSimReady(0))
                        startNWActivity(message.what, 0);
                    break;

                case 0: // '\0'
                    if (isSimReady(0))
                        startNWActivity(message.what, 0);
                    break;
                }
            mNetworkResponse.sendEmptyMessageDelayed(message.what, mDelayTime);
        }

            
            {
                this$0 = NoNetworkPopUpService.this;
                super();
            }
    }
;
    private PhoneStateListener mPhoneServiceListener;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final NoNetworkPopUpService this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            log((new StringBuilder()).append("[action = ").append(s).append("]").toString());
            if ("android.intent.action.AIRPLANE_MODE".equals(s))
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
            else
            if ("android.intent.action.DUAL_SIM_MODE".equals(s))
            {
                mDualSimMode = intent.getIntExtra("mode", -1);
                return;
            }
        }

            
            {
                this$0 = NoNetworkPopUpService.this;
                super();
            }
    }
;
    private int mReminderType;
    private SharedPreferences mSP;
    private TelephonyManager mTelephonyManager;

    public NoNetworkPopUpService()
    {
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mReminderType = 0;
        mIsShouldShow = true;
        mDelayTime = 0;
        mPhoneServiceListener = new PhoneStateListener() {

            final NoNetworkPopUpService this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                int i;
label0:
                {
                    i = servicestate.getMySimId();
                    log((new StringBuilder()).append("[state = ").append(servicestate.getRegState()).append("]").toString());
                    log((new StringBuilder()).append("[mIsShouldShow = ").append(mIsShouldShow).append("]").toString());
                    if (servicestate.getIsManualSelection())
                    {
                        if (servicestate.getRegState() == 4 || servicestate.getRegState() == 1 || servicestate.getRegState() == 5 || servicestate.getRegState() == 2)
                            break label0;
                        if (servicestate.getRegState() == 3 || servicestate.getRegState() == 0)
                            if (CallSettings.isMultipleSim())
                            {
                                mNetworkResponse.sendEmptyMessageDelayed(NoNetworkPopUpService.NETWORK_PUP_UP_MSG_GEMINI[i], mDelayTime);
                                return;
                            } else
                            {
                                mNetworkResponse.sendEmptyMessageDelayed(0, mDelayTime);
                                return;
                            }
                    }
                    return;
                }
                if (CallSettings.isMultipleSim())
                {
                    mNetworkResponse.removeMessages(NoNetworkPopUpService.NETWORK_PUP_UP_MSG_GEMINI[i]);
                    return;
                } else
                {
                    mNetworkResponse.removeMessages(0);
                    return;
                }
            }

            
            {
                this$0 = NoNetworkPopUpService.this;
                super();
            }
        }
;
    }

    private boolean isSimReady(int i)
    {
        if (CallSettings.isMultipleSim())
            return mTelephonyManager.getSimStateGemini(i) == 5;
        return mTelephonyManager.getSimState() == 5;
    }

    private void log(String s)
    {
        Log.d("Settings/NoNetworkPopUpService", (new StringBuilder()).append("[NoNetworkPopUpService]").append(s).toString());
    }

    private void startNWActivity(int i, int j)
    {
        Intent intent = new Intent();
        intent.putExtra("no_service", true);
        if (CallSettings.isMultipleSim())
            intent.putExtra("simId", j);
        intent.setClassName("com.android.phone", "com.android.phone.NetworkSetting");
        intent.addFlags(0x10000000);
        startActivity(intent);
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onCreate()
    {
        super.onCreate();
        log("[create network pop up service]");
        mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
        if (CallSettings.isMultipleSim())
            mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
        registerReceiver(mReceiver, mIntentFilter);
        mSP = PreferenceManager.getDefaultSharedPreferences(getApplicationContext());
        if (mSP.contains("delay_time_key"))
        {
            mDelayTime = mSP.getInt("delay_time_key", 0x1d4c0);
        } else
        {
            android.content.SharedPreferences.Editor editor = mSP.edit();
            editor.putInt("delay_time_key", 0x1d4c0);
            editor.commit();
            mDelayTime = 0x1d4c0;
        }
        if (mSP.contains("no_service_key"))
        {
            mIsShouldShow = mSP.getBoolean("no_service_key", true);
        } else
        {
            android.content.SharedPreferences.Editor editor1 = mSP.edit();
            editor1.putBoolean("no_service_key", false);
            editor1.commit();
            mIsShouldShow = true;
        }
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        mTelephonyManager.listen(mPhoneServiceListener, 1);
        boolean flag;
        if (android.provider.Settings.System.getInt(getApplicationContext().getContentResolver(), "airplane_mode_on", -1) == 1)
            flag = true;
        else
            flag = false;
        mAirplaneModeEnabled = flag;
        if (CallSettings.isMultipleSim())
            mDualSimMode = android.provider.Settings.System.getInt(getApplicationContext().getContentResolver(), "dual_sim_mode_setting", -1);
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("[destroy network pop up service]");
        if (CallSettings.isMultipleSim())
        {
            for (int i = 0; i < NETWORK_PUP_UP_MSG_GEMINI.length; i++)
                mNetworkResponse.removeMessages(NETWORK_PUP_UP_MSG_GEMINI[i]);

        } else
        {
            mNetworkResponse.removeMessages(0);
        }
        unregisterReceiver(mReceiver);
        if (mTelephonyManager != null)
            mTelephonyManager.listen(mPhoneServiceListener, 0);
    }





/*
    static boolean access$102(NoNetworkPopUpService nonetworkpopupservice, boolean flag)
    {
        nonetworkpopupservice.mIsShouldShow = flag;
        return flag;
    }

*/






/*
    static boolean access$502(NoNetworkPopUpService nonetworkpopupservice, boolean flag)
    {
        nonetworkpopupservice.mAirplaneModeEnabled = flag;
        return flag;
    }

*/



/*
    static int access$602(NoNetworkPopUpService nonetworkpopupservice, int i)
    {
        nonetworkpopupservice.mDualSimMode = i;
        return i;
    }

*/



}
