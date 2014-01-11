// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.net.*;
import android.os.*;
import android.preference.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import com.android.internal.telephony.ITelephony;
import com.android.internal.telephony.Phone;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.SettingsExtension;
import com.mediatek.phone.gemini.GeminiUtils;
import com.mediatek.settings.*;
import com.mediatek.telephony.TelephonyManagerEx;
import java.util.*;

// Referenced classes of package com.android.phone:
//            PhoneUtils, CdmaOptions, PhoneGlobals, GsmUmtsOptions, 
//            DataUsageListener, PhoneInterfaceManager

public class MobileNetworkSettings extends PreferenceActivity
    implements android.content.DialogInterface.OnClickListener, android.content.DialogInterface.OnDismissListener, android.preference.Preference.OnPreferenceChangeListener
{
    private class MyHandler extends Handler
    {

        private static final int MESSAGE_GET_PREFERRED_NETWORK_TYPE = 0;
        private static final int MESSAGE_SET_PREFERRED_NETWORK_TYPE = 1;
        final MobileNetworkSettings this$0;

        private void handleGetPreferredNetworkTypeResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            if (asyncresult.exception == null)
            {
                int i = ((int[])(int[])asyncresult.result)[0];
                MobileNetworkSettings.log((new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: modemNetworkMode = ").append(i).toString());
                int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                MobileNetworkSettings.log((new StringBuilder()).append("handleGetPreferredNetworkTypeReponse: settingsNetworkMode = ").append(j).toString());
                if (i != 0 && i != 1 && i != 2 && i != 3 && i != 4 && i != 5 && i != 6 && i != 7)
                    if (i == 11)
                    {
                        MobileNetworkSettings.log("handleGetPreferredNetworkTypeResponse: lte only: no action");
                        return;
                    } else
                    {
                        MobileNetworkSettings.log("handleGetPreferredNetworkTypeResponse: else: reset to default");
                        resetNetworkModeToDefault();
                        return;
                    }
                MobileNetworkSettings.log((new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: if 1: modemNetworkMode = ").append(i).toString());
                if (i != j)
                {
                    MobileNetworkSettings.log("handleGetPreferredNetworkTypeResponse: if 2: modemNetworkMode != settingsNetworkMode");
                    int k = i;
                    MobileNetworkSettings.log((new StringBuilder()).append("handleGetPreferredNetworkTypeResponse: if 2: settingsNetworkMode = ").append(k).toString());
                    android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", k);
                }
                if (i == 3)
                    i = 0;
                mButtonPreferredNetworkMode.setValue(Integer.toString(i));
                mButtonPreferredNetworkMode.setSummary(mButtonPreferredNetworkMode.getEntry());
            }
        }

        private void handleSetPreferredNetworkTypeResponse(Message message)
        {
            AsyncResult asyncresult = (AsyncResult)message.obj;
            removeDialog(400);
            if (asyncresult.exception == null)
            {
                int i = Integer.valueOf(mButtonPreferredNetworkMode.getValue()).intValue();
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", i);
                return;
            }
            if (CallSettings.isMultipleSim())
            {
                mGeminiPhone.getPreferredNetworkTypeGemini(obtainMessage(0), mSimId);
                return;
            } else
            {
                mPhone.getPreferredNetworkType(obtainMessage(0));
                return;
            }
        }

        private void resetNetworkModeToDefault()
        {
            mButtonPreferredNetworkMode.setValue(Integer.toString(0));
            android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
            if (CallSettings.isMultipleSim())
            {
                mGeminiPhone.setPreferredNetworkTypeGemini(0, obtainMessage(1), mSimId);
                return;
            } else
            {
                mPhone.setPreferredNetworkType(0, obtainMessage(1));
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
            this$0 = MobileNetworkSettings.this;
            super();
        }

    }


    private static final String ACTION_DATA_USAGE_DISABLED_DIALOG_OK = "com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK";
    private static final String BUTTON_2G_ONLY = "button_prefer_2g_key";
    private static final String BUTTON_3G_SERVICE = "button_3g_service_key";
    private static final String BUTTON_APN = "button_apn_key";
    private static final String BUTTON_CARRIER_SEL = "button_carrier_sel_key";
    private static final String BUTTON_CDMA_LTE_DATA_SERVICE_KEY = "cdma_lte_data_service_key";
    private static final String BUTTON_CDMA_OPTIONS = "cdma_options_key";
    private static final String BUTTON_DATA_ENABLED_KEY = "button_data_enabled_key";
    private static final String BUTTON_DATA_USAGE_KEY = "button_data_usage_key";
    private static final String BUTTON_GSM_UMTS_OPTIONS = "gsm_umts_options_key";
    private static final String BUTTON_NETWORK_MODE_EX_KEY = "button_network_mode_ex_key";
    private static final String BUTTON_NETWORK_MODE_KEY = "gsm_umts_preferred_network_mode_key";
    private static final String BUTTON_PLMN_LIST = "button_plmn_key";
    private static final String BUTTON_PREFERED_NETWORK_MODE = "preferred_network_mode_key";
    private static final String BUTTON_ROAMING_KEY = "button_roaming_key";
    private static final int DATA_DISABLE_ALERT_DIALOG = 200;
    private static final int DATA_ENABLE_ALERT_DIALOG = 100;
    public static final int DATA_STATE_CHANGE_TIMEOUT = 2001;
    private static final boolean DBG = true;
    private static final int DIALOG_GPRS_SWITCH_CONFIRM = 1;
    private static final String IFACE = "rmnet0";
    private static final String KEY_DATA_CONN = "data_connection_setting";
    private static final String LOG_TAG = "NetworkSettings";
    private static final int MODEM_MASK_EDGE = 2;
    private static final int MODEM_MASK_GPRS = 1;
    private static final int MODEM_MASK_HSDPA = 16;
    private static final int MODEM_MASK_HSUPA = 32;
    private static final int MODEM_MASK_TDSCDMA = 8;
    private static final int MODEM_MASK_WCDMA = 4;
    private static final int PIN1_REQUEST_CODE = 302;
    private static final int PREFERRED_NETWORK_MODE = 0;
    private static final int PROGRESS_DIALOG = 400;
    public static final int REQUEST_CODE_EXIT_ECM = 17;
    private static final int ROAMING_DIALOG = 300;
    private static final String TRANSACTION_START = "com.android.mms.transaction.START";
    private static final String TRANSACTION_STOP = "com.android.mms.transaction.STOP";
    private static final String UP_ACTIVITY_CLASS = "com.android.settings.Settings$WirelessSettingsActivity";
    private static final String UP_ACTIVITY_PACKAGE = "com.android.settings";
    private boolean mAirplaneModeEnabled;
    private PreferenceScreen mApnPref;
    private CheckBoxPreference mButtonDataEnabled;
    private CheckBoxPreference mButtonDataRoam;
    private Preference mButtonDataUsage;
    private CheckBoxPreference mButtonPreferredGSMOnly;
    private ListPreference mButtonPreferredNetworkMode;
    private Preference mButtonPreferredNetworkModeEx;
    private PreferenceScreen mCarrierSelPref;
    CdmaOptions mCdmaOptions;
    private CellConnMgr mCellConnMgr;
    private Preference mClickedPreference;
    private ConnectivityManager mConnService;
    private DefaultSimPreference mDataConnPref;
    private int mDataSwitchMsgIndex;
    private DataUsageListener mDataUsageListener;
    private int mDualSimMode;
    private SettingsExtension mExtension;
    private GeminiPhone mGeminiPhone;
    private ContentObserver mGprsDefaultSIMObserver;
    GsmUmtsOptions mGsmUmtsOptions;
    Handler mH;
    private MyHandler mHandler;
    private IntentFilter mIntentFilter;
    private boolean mIsChangeData;
    private Preference mLteDataServicePref;
    private boolean mOkClicked;
    private Preference mPLMNPreference;
    private Phone mPhone;
    private PhoneStateListener mPhoneStateListener;
    private PreCheckForRunning mPreCheckForRunning;
    private Preference mPreference3GSwitch;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final MobileNetworkSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            if (s.equals("android.intent.action.AIRPLANE_MODE"))
            {
                mAirplaneModeEnabled = intent.getBooleanExtra("state", false);
                setScreenEnabled();
            } else
            if (s.equals("android.intent.action.ANY_DATA_STATE") && mIsChangeData)
            {
                Log.d("NetworkSettings", "catch data change!");
                com.android.internal.telephony.PhoneConstants.DataState datastate = MobileNetworkSettings.getMobileDataState(intent);
                String s1 = intent.getStringExtra("apnType");
                Log.d("NetworkSettings", (new StringBuilder()).append("apnTypeList=").append(s1).toString());
                Log.d("NetworkSettings", (new StringBuilder()).append("state=").append(datastate).toString());
                if ("default".equals(s1) && (datastate == com.android.internal.telephony.PhoneConstants.DataState.CONNECTED || datastate == com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED))
                {
                    mH.removeMessages(2001);
                    removeDialog(400);
                    mIsChangeData = false;
                    setDataConnPref();
                    return;
                }
            } else
            {
                if (s.equals("android.intent.action.DUAL_SIM_MODE"))
                {
                    mDualSimMode = intent.getIntExtra("mode", -1);
                    setScreenEnabled();
                    return;
                }
                if ("android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY".equals(s))
                {
                    setNetworkOperator();
                    return;
                }
                if (s.equals("android.intent.action.SIM_INDICATOR_STATE_CHANGED"))
                {
                    Log.d("NetworkSettings", "indicator state changed");
                    setDataConnPref();
                    setScreenEnabled();
                    return;
                }
                if ("android.intent.action.SIM_INFO_UPDATE".equals(s))
                {
                    Log.d("NetworkSettings", "ACTION_SIM_INFO_UPDATE received");
                    List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(MobileNetworkSettings.this);
                    if (list != null)
                    {
                        Log.d("NetworkSettings", (new StringBuilder()).append("sim card number is: ").append(list.size()).toString());
                        if (list.size() > 0)
                        {
                            setDataConnPref();
                            setScreenEnabled();
                            return;
                        } else
                        {
                            finish();
                            return;
                        }
                    }
                } else
                if ("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE".equals(s))
                {
                    if (!intent.getBooleanExtra("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE", true))
                    {
                        Log.d("NetworkSettings", "network mode change failed! restore the old value.");
                        int i = intent.getIntExtra("com.android.phone.OLD_NETWORK_MODE", 0);
                        Log.d("NetworkSettings", (new StringBuilder()).append("oldMode = ").append(i).toString());
                        android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", i);
                        return;
                    }
                } else
                if (s.equals("com.android.mms.transaction.START"))
                {
                    Log.d("NetworkSettings", "start to send MMS");
                    if (mDataConnPref.isEnabled())
                        mDataConnPref.setEnabled(false);
                    Dialog dialog1 = mDataConnPref.getDialog();
                    if (dialog1 != null && dialog1.isShowing())
                    {
                        Log.d("NetworkSettings", "MMS stopped dismiss GPRS selection dialog");
                        dialog1.dismiss();
                        return;
                    }
                } else
                if (s.equals("com.android.mms.transaction.STOP"))
                {
                    Log.d("NetworkSettings", "send MMS is end");
                    if (!mDataConnPref.isEnabled())
                        mDataConnPref.setEnabled(true);
                    Dialog dialog = mDataConnPref.getDialog();
                    if (dialog != null && dialog.isShowing())
                    {
                        Log.d("NetworkSettings", "MMS stopped dismiss GPRS selection dialog");
                        dialog.dismiss();
                        return;
                    }
                } else
                if (s.equals("com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK"))
                {
                    Log.d("NetworkSettings", "deal with data limit broadcast");
                    removeDialog(400);
                    mIsChangeData = false;
                    setDataConnPref();
                    return;
                }
            }
        }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
    }
;
    private long mSelectGprsIndex;
    private int mSimId;
    private TelephonyManager mTelephonyManager;

    public MobileNetworkSettings()
    {
        mDataConnPref = null;
        mDataSwitchMsgIndex = -1;
        mSelectGprsIndex = -1L;
        mPhoneStateListener = new PhoneStateListener() {

            final MobileNetworkSettings this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                MobileNetworkSettings.log((new StringBuilder()).append("onCallStateChanged ans state is ").append(i).toString());
                switch (i)
                {
                case 0: // '\0'
                    setScreenEnabled();
                    return;
                }
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
        }
;
        mGprsDefaultSIMObserver = new ContentObserver(new Handler()) {

            final MobileNetworkSettings this$0;

            public void onChange(boolean flag)
            {
                setDataConnPref();
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super(handler);
            }
        }
;
        mAirplaneModeEnabled = false;
        mDualSimMode = -1;
        mIsChangeData = false;
        mH = new Handler() {

            final MobileNetworkSettings this$0;

            public void handleMessage(Message message)
            {
                if (message.what == 2001)
                {
                    removeDialog(400);
                    mIsChangeData = false;
                    setDataConnPref();
                }
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
        }
;
    }

    private void dealWithDataConn(long l)
    {
        int i = l != 0L;
        boolean flag = false;
        if (i != 0)
            flag = true;
        if (!mExtension.dataEnableReminder(flag, this))
        {
            Log.d("NetworkSettings", "onPreferenceTreeClick: preference == mButtonDataEnabled.");
            if (mConnService == null)
            {
                Log.d("NetworkSettings", "mConnService is null");
            } else
            {
                mConnService.setMobileDataEnabled(flag);
                if (flag && isNeedtoShowRoamingMsg())
                {
                    mExtension.showWarningDlg(this, 0x7f0d011e);
                    return;
                }
            }
        }
    }

    private boolean enableDataRoaming(long l)
    {
        int i = android.provider.Telephony.SIMInfo.getSlotById(this, l);
        log((new StringBuilder()).append("enableDataRoaming with SimId=").append(l).append(", slotId=").append(i).toString());
        if (!GeminiUtils.isValidSlot(i))
            break MISSING_BLOCK_LABEL_90;
        ITelephony itelephony;
        try
        {
            itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        }
        catch (RemoteException remoteexception)
        {
            log("iTelephony exception");
            return false;
        }
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_71;
        itelephony.setDataRoamingEnabledGemini(true, i);
        android.provider.Telephony.SIMInfo.setDataRoaming(this, 1, l);
        return true;
        log("enableDataRoaming error: slotId is not valid, the SIM card may be pulled out.");
        return false;
    }

    private int getBaseBand(int i)
    {
        String s1;
        String s = "gsm.baseband.capability";
        if (i == 1)
            s = (new StringBuilder()).append(s).append("2").toString();
        s1 = SystemProperties.get(s);
        if (s1 == null || "".equals(s1))
            return 0;
        int k = Integer.valueOf(s1, 16).intValue();
        int j = k;
_L2:
        return j;
        NumberFormatException numberformatexception;
        numberformatexception;
        log("parse value of basband error");
        j = 0;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private static com.android.internal.telephony.PhoneConstants.DataState getMobileDataState(Intent intent)
    {
        String s = intent.getStringExtra("state");
        if (s != null)
            return (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, s);
        else
            return com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED;
    }

    private android.provider.Telephony.SIMInfo getSimInfoById(long l)
    {
        for (Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(this).iterator(); iterator.hasNext();)
        {
            android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
            if (l == siminfo.mSimId)
                return siminfo;
        }

        return null;
    }

    private boolean isNeedtoShowRoamingMsg()
    {
        boolean flag = ((TelephonyManager)getSystemService("phone")).isNetworkRoaming();
        boolean flag1 = mPhone.getDataRoamingEnabled();
        Log.d("NetworkSettings", (new StringBuilder()).append("***isInRoaming=").append(flag).append(" isRoamingEnabled=").append(flag1).toString());
        return flag && !flag1;
    }

    private boolean isRadioOff()
    {
        boolean flag = true;
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag && android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1) != 0)
            flag = false;
        Log.d("NetworkSettings", (new StringBuilder()).append("isAllRadioOff=").append(flag).toString());
        return flag;
    }

    private boolean isSimLocked()
    {
        ITelephony itelephony;
        boolean flag;
        int i;
        try
        {
            itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        }
        catch (RemoteException remoteexception)
        {
            Log.d("NetworkSettings", (new StringBuilder()).append("[e = ").append(remoteexception).append("]").toString());
            return false;
        }
        flag = false;
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_34;
        i = itelephony.getSimIndicatorState();
        if (i != 2)
            break MISSING_BLOCK_LABEL_37;
        flag = true;
        return flag;
        return false;
    }

    private static void log(String s)
    {
        Log.d("NetworkSettings", s);
    }

    private void setDataConnPref()
    {
        Log.d("NetworkSettings", "setDataConnPref");
        if (mDataConnPref == null) goto _L2; else goto _L1
_L1:
        long l;
        ArrayList arraylist;
        List list;
        mDataConnPref.setCellConnMgr(mCellConnMgr);
        int i;
        int j;
        Iterator iterator;
        android.provider.Telephony.SIMInfo siminfo;
        SimItem simitem1;
        ITelephony itelephony;
        int k;
        if (mConnService != null)
            mConnService.getMobileDataEnabled();
        else
            Log.d("NetworkSettings", "mConnService is null");
        l = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
        arraylist = new ArrayList();
        list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        Collections.sort(list, new com.mediatek.settings.CallSettings.SIMInfoComparable());
        arraylist.clear();
        i = 0;
        j = 0;
        TelephonyManagerEx.getDefault();
        iterator = list.iterator();
_L9:
        if (!iterator.hasNext()) goto _L4; else goto _L3
_L3:
        siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
        if (siminfo == null) goto _L6; else goto _L5
_L5:
        simitem1 = new SimItem(siminfo);
        itelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
        if (itelephony == null)
            break MISSING_BLOCK_LABEL_181;
        k = itelephony.getSimIndicatorStateGemini(siminfo.mSlot);
        i = k;
_L7:
        simitem1.mState = i;
        Log.d("NetworkSettings", (new StringBuilder()).append("state=").append(simitem1.mState).toString());
        if (siminfo.mSimId == l)
        {
            mDataConnPref.setInitValue(j);
            mDataConnPref.setSummary(siminfo.mDisplayName);
        }
        arraylist.add(simitem1);
_L6:
        j++;
        continue; /* Loop/switch isn't completed */
        RemoteException remoteexception;
        remoteexception;
        Log.d("NetworkSettings", (new StringBuilder()).append("[e = ").append(remoteexception).append("]").toString());
        if (true) goto _L7; else goto _L4
_L4:
        if (l == 0L)
        {
            mDataConnPref.setInitValue(list.size());
            mDataConnPref.setSummary(0x7f0d00a0);
        }
        SimItem simitem = new SimItem(null);
        if (isRadioOff())
            simitem.mState = 1;
        arraylist.add(simitem);
        Log.d("NetworkSettings", (new StringBuilder()).append("mSimItemListGprs=").append(arraylist.size()).toString());
        mDataConnPref.setInitData(arraylist);
_L2:
        return;
        if (true) goto _L9; else goto _L8
_L8:
    }

    private void setNetworkOperator()
    {
        boolean flag = false;
        if (CallSettings.isMultipleSim())
        {
            for (Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(this).iterator(); iterator.hasNext();)
            {
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                flag |= mGeminiPhone.isCspPlmnEnabled(siminfo.mSlot);
            }

        } else
        {
            flag = mPhone.isCspPlmnEnabled();
        }
        mExtension.removeNMOp(getPreferenceScreen(), mCarrierSelPref, flag);
    }

    private void setScreenEnabled()
    {
        boolean flag;
        if (mTelephonyManager.getCallState() == 0)
            flag = true;
        else
            flag = false;
        List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        boolean flag1;
        if (list != null && list.size() > 0)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (flag && !mAirplaneModeEnabled && mDualSimMode != 0 && flag1)
            flag2 = true;
        else
            flag2 = false;
        getPreferenceScreen().setEnabled(flag2);
        mExtension.disableDataRoaming(mButtonDataRoam, mButtonDataEnabled.isChecked());
        CallSettings.isMultipleSim();
        PhoneUtils.isSupportFeature("3G_SWITCH");
        if (mPreference3GSwitch != null)
        {
            Preference preference = mPreference3GSwitch;
            boolean flag7;
            if (flag1 && flag2)
                flag7 = true;
            else
                flag7 = false;
            preference.setEnabled(flag7);
        }
        if (mButtonPreferredNetworkMode != null)
        {
            boolean flag6;
            if (flag2 && CallSettings.isRadioOn(0))
                flag6 = true;
            else
                flag6 = false;
            mButtonPreferredNetworkMode.setEnabled(flag6);
            if (!flag6)
            {
                Dialog dialog = mButtonPreferredNetworkMode.getDialog();
                if (dialog != null && dialog.isShowing())
                    dialog.dismiss();
            }
        }
        if (mButtonPreferredNetworkModeEx != null)
        {
            int ai[] = CallSettings.get3GSimCardSlots(this);
            boolean flag4 = false;
            if (ai != null)
            {
                for (int i = 0; i < ai.length; i++)
                    if (CallSettings.isRadioOn(ai[i]))
                    {
                        flag4 = true;
                        log((new StringBuilder()).append("slot ").append(ai[i]).append(" radio state is = ").append(flag4).toString());
                    }

            }
            boolean flag5;
            if (flag2 && flag4)
                flag5 = true;
            else
                flag5 = false;
            log((new StringBuilder()).append("isNWModeEnabled = ").append(flag5).toString());
            mButtonPreferredNetworkModeEx.setEnabled(flag5);
        }
        if (flag2 && mConnService != null)
        {
            NetworkInfo networkinfo = mConnService.getNetworkInfo(2);
            if (networkinfo != null)
            {
                android.net.NetworkInfo.State state = networkinfo.getState();
                log((new StringBuilder()).append("mms state = ").append(state).toString());
                DefaultSimPreference defaultsimpreference = mDataConnPref;
                boolean flag3;
                if (state != android.net.NetworkInfo.State.CONNECTING && state != android.net.NetworkInfo.State.CONNECTED)
                    flag3 = true;
                else
                    flag3 = false;
                defaultsimpreference.setEnabled(flag3);
            }
        }
    }

    private void switchGprsDefautlSIM(long l)
    {
        if (l < 0L)
        {
            Log.d("NetworkSettings", (new StringBuilder()).append("value=").append(l).append(" is an exceptions").toString());
        } else
        {
            if (l > 0L);
            long l1 = android.provider.Settings.System.getLong(getContentResolver(), "gprs_connection_sim_setting", -5L);
            Log.d("NetworkSettings", (new StringBuilder()).append("Current gprsValue=").append(l1).append(" and target value=").append(l).toString());
            if (l != l1)
            {
                Intent intent = new Intent("android.intent.action.DATA_DEFAULT_SIM");
                intent.putExtra("simid", l);
                sendBroadcast(intent);
                showDialog(400);
                mH.sendMessageDelayed(mH.obtainMessage(2001), 30000L);
                mIsChangeData = true;
                return;
            }
        }
    }

    protected void onActivityResult(int i, int j, Intent intent)
    {
        switch (i)
        {
        case 17: // '\021'
            if (Boolean.valueOf(intent.getBooleanExtra("exit_ecm_result", false)).booleanValue())
            {
                mCdmaOptions.showDialog(mClickedPreference);
                return;
            }
            break;
        }
    }

    public void onClick(DialogInterface dialoginterface, int i)
    {
        if (i == -1)
        {
            mPhone.setDataRoamingEnabled(true);
            mOkClicked = true;
            return;
        } else
        {
            mButtonDataRoam.setChecked(false);
            return;
        }
    }

    protected void onCreate(Bundle bundle)
    {
        int i;
label0:
        {
            super.onCreate(bundle);
            addPreferencesFromResource(0x7f060016);
            mExtension = ExtensionManager.getInstance().getSettingsExtension();
            mPhone = PhoneGlobals.getPhone();
            if (CallSettings.isMultipleSim())
                mGeminiPhone = (GeminiPhone)mPhone;
            mHandler = new MyHandler();
            mIntentFilter = new IntentFilter("android.intent.action.AIRPLANE_MODE");
            mIntentFilter.addAction("android.intent.action.ANY_DATA_STATE");
            mIntentFilter.addAction("android.intent.action.ACTION_EF_CSP_CONTENT_NOTIFY");
            mIntentFilter.addAction("android.intent.action.DUAL_SIM_MODE");
            mIntentFilter.addAction("android.intent.action.SIM_INDICATOR_STATE_CHANGED");
            mIntentFilter.addAction("com.android.phone.NETWORK_MODE_CHANGE_RESPONSE");
            mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
            mIntentFilter.addAction("com.android.mms.transaction.START");
            mIntentFilter.addAction("com.android.mms.transaction.STOP");
            mIntentFilter.addAction("com.mediatek.systemui.net.action.ACTION_DATA_USAGE_DISABLED_DIALOG_OK");
            mTelephonyManager = (TelephonyManager)getSystemService("phone");
            mTelephonyManager.listen(mPhoneStateListener, 32);
            mPreCheckForRunning = new PreCheckForRunning(this);
            List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
            if (list.size() == 1)
            {
                mPreCheckForRunning.mByPass = false;
                mSimId = ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot;
            } else
            {
                mPreCheckForRunning.mByPass = true;
            }
            PreferenceScreen preferencescreen = getPreferenceScreen();
            mDataConnPref = (DefaultSimPreference)preferencescreen.findPreference("data_connection_setting");
            mDataConnPref.setOnPreferenceChangeListener(this);
            mButtonDataEnabled = (CheckBoxPreference)preferencescreen.findPreference("button_data_enabled_key");
            mButtonDataRoam = (CheckBoxPreference)preferencescreen.findPreference("button_roaming_key");
            mButtonDataRoam.setSummaryOn(mExtension.getRoamingSummary(this, 0x7f0d0210));
            mButtonDataRoam.setSummaryOff(mExtension.getRoamingSummary(this, 0x7f0d0211));
            mButtonPreferredNetworkMode = (ListPreference)preferencescreen.findPreference("preferred_network_mode_key");
            mButtonDataUsage = preferencescreen.findPreference("button_data_usage_key");
            preferencescreen.removePreference(mButtonDataEnabled);
            if (CallSettings.isMultipleSim())
                preferencescreen.removePreference(mButtonDataRoam);
            mPreference3GSwitch = preferencescreen.findPreference("button_3g_service_key");
            mPLMNPreference = preferencescreen.findPreference("button_plmn_key");
            mLteDataServicePref = preferencescreen.findPreference("cdma_lte_data_service_key");
            mButtonPreferredNetworkModeEx = preferencescreen.findPreference("button_network_mode_ex_key");
            boolean flag;
            if (mPhone.getLteOnCdmaMode() == 1)
                flag = true;
            else
                flag = false;
            if (getResources().getBoolean(0x7f0a0002))
            {
                mButtonPreferredNetworkMode.setOnPreferenceChangeListener(this);
                int l = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                mButtonPreferredNetworkMode.setValue(Integer.toString(l));
                mCdmaOptions = new CdmaOptions(this, preferencescreen, mPhone);
                mGsmUmtsOptions = new GsmUmtsOptions(this, preferencescreen);
            } else
            {
                if (!flag)
                    preferencescreen.removePreference(mButtonPreferredNetworkMode);
                i = mPhone.getPhoneType();
                if (i == 2)
                {
                    mCdmaOptions = new CdmaOptions(this, preferencescreen, mPhone);
                    if (flag)
                    {
                        mButtonPreferredNetworkMode.setOnPreferenceChangeListener(this);
                        mButtonPreferredNetworkMode.setEntries(0x7f07002e);
                        mButtonPreferredNetworkMode.setEntryValues(0x7f07002f);
                        int k = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                        mButtonPreferredNetworkMode.setValue(Integer.toString(k));
                    }
                    if (!PhoneUtils.isSupportFeature("3G_SWITCH") && mPreference3GSwitch != null)
                    {
                        preferencescreen.removePreference(mPreference3GSwitch);
                        mPreference3GSwitch = null;
                    }
                    preferencescreen.removePreference(mButtonPreferredNetworkModeEx);
                    mApnPref = (PreferenceScreen)preferencescreen.findPreference("button_apn_key");
                    mCarrierSelPref = (PreferenceScreen)preferencescreen.findPreference("button_carrier_sel_key");
                } else
                {
                    if (i != 1)
                        break label0;
                    mGsmUmtsOptions = new GsmUmtsOptions(this, preferencescreen);
                    mApnPref = (PreferenceScreen)preferencescreen.findPreference("button_apn_key");
                    mButtonPreferredGSMOnly = (CheckBoxPreference)preferencescreen.findPreference("button_prefer_2g_key");
                    mButtonPreferredNetworkMode = (ListPreference)preferencescreen.findPreference("gsm_umts_preferred_network_mode_key");
                    int j = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                    if (j > 2)
                    {
                        j = 0;
                        android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                    }
                    mButtonPreferredNetworkMode.setValue(Integer.toString(j));
                    if (!PhoneUtils.isSupportFeature("3G_SWITCH"))
                    {
                        preferencescreen.removePreference(mPreference3GSwitch);
                        if (getBaseBand(0) > 2)
                            if (CallSettings.isMultipleSim())
                                preferencescreen.removePreference(mButtonPreferredNetworkMode);
                            else
                                preferencescreen.removePreference(mButtonPreferredNetworkModeEx);
                    } else
                    {
                        preferencescreen.removePreference(mButtonPreferredNetworkModeEx);
                        preferencescreen.removePreference(mButtonPreferredNetworkMode);
                    }
                    mExtension.customizeFeatureForOperator(preferencescreen, mButtonPreferredNetworkModeEx, mButtonPreferredNetworkMode, mPreference3GSwitch, mButtonPreferredGSMOnly);
                    if (mButtonPreferredNetworkMode != null)
                    {
                        mButtonPreferredNetworkMode.setOnPreferenceChangeListener(this);
                        if ((8 & getBaseBand(0)) != 0)
                        {
                            mButtonPreferredNetworkMode.setEntries(getResources().getStringArray(0x7f070020));
                            mButtonPreferredNetworkMode.setEntryValues(getResources().getStringArray(0x7f070021));
                        }
                    }
                    mCarrierSelPref = (PreferenceScreen)preferencescreen.findPreference("button_carrier_sel_key");
                }
            }
            boolean flag1 = TextUtils.isEmpty(android.provider.Settings.Global.getString(getContentResolver(), "setup_prepaid_data_service_url"));
            if (flag && !flag1)
                Log.d("NetworkSettings", "keep ltePref");
            else
                preferencescreen.removePreference(mLteDataServicePref);
            ThrottleManager _tmp = (ThrottleManager)getSystemService("throttle");
            mDataUsageListener = new DataUsageListener(this, mButtonDataUsage, preferencescreen);
            registerReceiver(mReceiver, mIntentFilter);
            ActionBar actionbar = getActionBar();
            if (actionbar != null)
                actionbar.setDisplayHomeAsUpEnabled(true);
            mExtension.removeNMMode(preferencescreen, mButtonPreferredNetworkMode, mButtonPreferredGSMOnly, mButtonPreferredNetworkModeEx);
            setNetworkOperator();
            mCellConnMgr = new CellConnMgr();
            mCellConnMgr.register(this);
            return;
        }
        throw new IllegalStateException((new StringBuilder()).append("Unexpected phone type: ").append(i).toString());
    }

    protected Dialog onCreateDialog(int i)
    {
label0:
        {
            ProgressDialog progressdialog;
            if (i == 400)
            {
                progressdialog = new ProgressDialog(this);
                ((ProgressDialog)progressdialog).setMessage(getResources().getString(0x7f0d01df));
                progressdialog.setCancelable(false);
            } else
            {
                if (i == 100 || i == 200)
                    break label0;
                if (i == 300)
                {
                    android.app.AlertDialog alertdialog = (new android.app.AlertDialog.Builder(this)).setMessage(mExtension.getRoamingSummary(this, 0x7f0d0213)).setTitle(0x1040014).setIconAttribute(0x1010355).setPositiveButton(0x1040013, this).setNegativeButton(0x1040009, this).create();
                    alertdialog.setOnDismissListener(this);
                    return alertdialog;
                }
                progressdialog = null;
                if (i == 1)
                    return (new android.app.AlertDialog.Builder(this)).setIcon(0x1080027).setTitle(0x1040014).setMessage(getResources().getString(mDataSwitchMsgIndex)).setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

                        final MobileNetworkSettings this$0;

                        public void onClick(DialogInterface dialoginterface, int k)
                        {
label0:
                            {
                                if (mSelectGprsIndex != -1L)
                                {
                                    if (mDataSwitchMsgIndex != 0x7f0d0137 && mDataSwitchMsgIndex != 0x7f0d0139 || enableDataRoaming(mSelectGprsIndex))
                                        break label0;
                                    mSelectGprsIndex = -1L;
                                }
                                return;
                            }
                            switchGprsDefautlSIM(mSelectGprsIndex);
                            mSelectGprsIndex = -1L;
                        }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
                    }
).setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

                        final MobileNetworkSettings this$0;

                        public void onClick(DialogInterface dialoginterface, int k)
                        {
                            setDataConnPref();
                        }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
                    }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

                        final MobileNetworkSettings this$0;

                        public void onCancel(DialogInterface dialoginterface)
                        {
                            setDataConnPref();
                        }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
                    }
).create();
            }
            return progressdialog;
        }
        int j;
        if (i == 100)
            j = 0x7f0d0113;
        else
            j = 0x7f0d0114;
        return (new android.app.AlertDialog.Builder(this)).setMessage(getText(j)).setTitle(0x1040014).setIcon(0x1080027).setPositiveButton(0x1040013, new android.content.DialogInterface.OnClickListener() {

            final MobileNetworkSettings this$0;

            public void onClick(DialogInterface dialoginterface, int k)
            {
                boolean flag = true;
                mIsChangeData = flag;
                if (mConnService != null)
                {
                    showDialog(400);
                    boolean flag1 = mConnService.getMobileDataEnabled();
                    ConnectivityManager connectivitymanager = mConnService;
                    if (flag1)
                        flag = false;
                    connectivitymanager.setMobileDataEnabled(flag);
                    mH.sendMessageDelayed(mH.obtainMessage(2001), 30000L);
                }
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
        }
).setNegativeButton(0x1040009, new android.content.DialogInterface.OnClickListener() {

            final MobileNetworkSettings this$0;

            public void onClick(DialogInterface dialoginterface, int k)
            {
                if (getPreferenceScreen().findPreference("button_data_enabled_key") != null)
                {
                    Log.d("NetworkSettings", "setNegativeButton---restore mButtonDataEnabled to previous state");
                    CheckBoxPreference checkboxpreference = mButtonDataEnabled;
                    boolean flag;
                    if (!mButtonDataEnabled.isChecked())
                        flag = true;
                    else
                        flag = false;
                    checkboxpreference.setChecked(flag);
                    return;
                } else
                {
                    setDataConnPref();
                    return;
                }
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
        }
).setOnCancelListener(new android.content.DialogInterface.OnCancelListener() {

            final MobileNetworkSettings this$0;

            public void onCancel(DialogInterface dialoginterface)
            {
                if (getPreferenceScreen().findPreference("button_data_enabled_key") != null)
                {
                    Log.d("NetworkSettings", "restore mButtonDataEnabled to previous state");
                    CheckBoxPreference checkboxpreference = mButtonDataEnabled;
                    boolean flag;
                    if (!mButtonDataEnabled.isChecked())
                        flag = true;
                    else
                        flag = false;
                    checkboxpreference.setChecked(flag);
                    return;
                } else
                {
                    setDataConnPref();
                    return;
                }
            }

            
            {
                this$0 = MobileNetworkSettings.this;
                super();
            }
        }
).create();
    }

    protected void onDestroy()
    {
        super.onDestroy();
        unregisterReceiver(mReceiver);
        mCellConnMgr.unregister();
        if (mPreCheckForRunning != null)
            mPreCheckForRunning.deRegister();
        if (mTelephonyManager != null)
            mTelephonyManager.listen(mPhoneStateListener, 0);
    }

    public void onDismiss(DialogInterface dialoginterface)
    {
        if (!mOkClicked)
            mButtonDataRoam.setChecked(false);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        if (menuitem.getItemId() == 0x102002c)
        {
            finish();
            return true;
        } else
        {
            return super.onOptionsItemSelected(menuitem);
        }
    }

    protected void onPause()
    {
        super.onPause();
        mDataUsageListener.pause();
        getContentResolver().unregisterContentObserver(mGprsDefaultSIMObserver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        if (preference == mButtonPreferredNetworkMode)
        {
            mButtonPreferredNetworkMode.setValue((String)obj);
            int j = Integer.valueOf((String)obj).intValue();
            int k = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
            if (j != k)
            {
                showDialog(400);
                byte byte0;
                switch (j)
                {
                case 0: // '\0'
                    byte0 = 0;
                    break;

                case 1: // '\001'
                    byte0 = 1;
                    break;

                case 2: // '\002'
                    byte0 = 2;
                    break;

                case 3: // '\003'
                    byte0 = 3;
                    break;

                case 4: // '\004'
                    byte0 = 4;
                    break;

                case 5: // '\005'
                    byte0 = 5;
                    break;

                case 6: // '\006'
                    byte0 = 6;
                    break;

                case 7: // '\007'
                    byte0 = 7;
                    break;

                default:
                    byte0 = 0;
                    break;
                }
                if (byte0 == 0 && k == 11)
                    return true;
                mButtonPreferredNetworkMode.setSummary(mButtonPreferredNetworkMode.getEntry());
                android.provider.Settings.Global.putInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", j);
                if (CallSettings.isMultipleSim())
                    mGeminiPhone.setPreferredNetworkTypeGemini(byte0, mHandler.obtainMessage(1), mSimId);
                else
                    mPhone.setPreferredNetworkType(byte0, mHandler.obtainMessage(1));
            }
        } else
        if (preference == mDataConnPref)
        {
            long l = ((Long)obj).longValue();
            Log.d("NetworkSettings", (new StringBuilder()).append("under click simId=").append(l).toString());
            if (CallSettings.isMultipleSim())
            {
                if (l == 0L)
                {
                    switchGprsDefautlSIM(0L);
                    return true;
                }
                android.provider.Telephony.SIMInfo siminfo = getSimInfoById(l);
                if (siminfo == null)
                    return false;
                boolean flag = mTelephonyManager.isNetworkRoamingGemini(siminfo.mSlot);
                mDataSwitchMsgIndex = -1;
                log((new StringBuilder()).append("isInRoaming = ").append(flag).toString());
                int i = PhoneGlobals.getInstance().phoneMgr.get3GCapabilitySIM();
                if (i == -1);
                if (flag)
                {
                    boolean flag1;
                    if (siminfo.mDataRoaming == 1)
                        flag1 = true;
                    else
                        flag1 = false;
                    log((new StringBuilder()).append("isRoamingDataAllowed = ").append(flag1).toString());
                    if (flag1)
                    {
                        if (siminfo.mSlot == i);
                    } else
                    {
                        mDataSwitchMsgIndex = 0x7f0d0137;
                    }
                } else
                if (siminfo.mSlot == i);
                log((new StringBuilder()).append("slot3G = ").append(i).toString());
                log((new StringBuilder()).append("simInfo.mSlot = ").append(siminfo.mSlot).toString());
                if (mDataSwitchMsgIndex == -1)
                {
                    switchGprsDefautlSIM(l);
                } else
                {
                    mSelectGprsIndex = l;
                    log((new StringBuilder()).append("mSelectGprsIndex = ").append(mSelectGprsIndex).toString());
                    removeDialog(1);
                    showDialog(1);
                }
            } else
            {
                dealWithDataConn(l);
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
label0:
        {
            if (preference == mPLMNPreference)
            {
                if (CallSettings.isMultipleSim())
                {
                    Intent intent3 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                    intent3.putExtra("INIT_TITLE_NAME", 0x7f0d0120);
                    intent3.putExtra("ITEM_TYPE", "PreferenceScreen");
                    intent3.putExtra("TARGET_CLASS", "com.mediatek.settings.PLMNListPreference");
                    mPreCheckForRunning.checkToRun(intent3, mSimId, 302);
                } else
                {
                    return false;
                }
            } else
            {
                if (preference == mButtonPreferredNetworkModeEx)
                {
                    Intent intent2 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                    intent2.putExtra("ITEM_TYPE", "ListPreference");
                    if ((8 & getBaseBand(0)) != 0)
                    {
                        intent2.putExtra("INIT_ARRAY", 0x7f070020);
                        intent2.putExtra("INIT_ARRAY_VALUE", 0x7f070021);
                    } else
                    {
                        intent2.putExtra("INIT_ARRAY", 0x7f07001e);
                        intent2.putExtra("INIT_ARRAY_VALUE", 0x7f07001f);
                    }
                    intent2.putExtra("INIT_TITLE_NAME", 0x7f0d0200);
                    intent2.putExtra("LIST_TITLE_NAME", 0x7f0d00e6);
                    intent2.putExtra("INIT_FEATURE_NAME", "NETWORK_MODE");
                    android.provider.Telephony.SIMInfo.getSIMInfoBySlot(this, 0);
                    intent2.putExtra("INIT_SIM_ID", CallSettings.get3GSimCards(this));
                    intent2.putExtra("INIT_BASE_KEY", "preferred_network_mode_key@");
                    mPreCheckForRunning.checkToRun(intent2, mSimId, 302);
                    return true;
                }
                if (mGsmUmtsOptions == null || !mGsmUmtsOptions.preferenceTreeClick(preference))
                    if (mCdmaOptions != null && mCdmaOptions.preferenceTreeClick(preference))
                    {
                        if (Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
                        {
                            mClickedPreference = preference;
                            startActivityForResult(new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null), 17);
                            return true;
                        }
                    } else
                    {
                        if (preference == mButtonPreferredNetworkMode)
                        {
                            int i = android.provider.Settings.Global.getInt(mPhone.getContext().getContentResolver(), "preferred_network_mode", 0);
                            mButtonPreferredNetworkMode.setValue(Integer.toString(i));
                            return true;
                        }
                        if (preference == mButtonDataRoam)
                        {
                            log("onPreferenceTreeClick: preference == mButtonDataRoam.");
                            if (mButtonDataRoam.isChecked())
                            {
                                mOkClicked = false;
                                showDialog(300);
                                return true;
                            } else
                            {
                                mPhone.setDataRoamingEnabled(false);
                                return true;
                            }
                        }
                        if (preference != mButtonDataEnabled)
                            break label0;
                        log("onPreferenceTreeClick: preference == mButtonDataEnabled.");
                        if (!mExtension.dataEnableReminder(mButtonDataEnabled.isChecked(), this))
                        {
                            Log.d("NetworkSettings", "onPreferenceTreeClick: preference == mButtonDataEnabled.");
                            if (mButtonDataEnabled.isChecked() && isSimLocked())
                            {
                                mCellConnMgr.handleCellConn(0, 302);
                                Log.d("NetworkSettings", "Data enable check change request pin single card");
                                mButtonDataEnabled.setChecked(false);
                                return true;
                            }
                            mIsChangeData = true;
                            NetworkInfo networkinfo = mConnService.getActiveNetworkInfo();
                            if (networkinfo == null || networkinfo.getType() != 1 || !networkinfo.isConnected())
                                showDialog(400);
                            mConnService.setMobileDataEnabled(mButtonDataEnabled.isChecked());
                            mH.sendMessageDelayed(mH.obtainMessage(2001), 30000L);
                            if (mButtonDataEnabled.isChecked() && isNeedtoShowRoamingMsg())
                                mExtension.showWarningDlg(this, 0x7f0d011e);
                            mExtension.disableDataRoaming(mButtonDataRoam, mButtonDataEnabled.isChecked());
                            return true;
                        }
                    }
            }
            return true;
        }
        if (preference == mLteDataServicePref)
        {
            String s = android.provider.Settings.Global.getString(getContentResolver(), "setup_prepaid_data_service_url");
            if (!TextUtils.isEmpty(s))
            {
                String s1 = mTelephonyManager.getSubscriberId();
                if (s1 == null)
                    s1 = "";
                boolean flag = TextUtils.isEmpty(s);
                String s2 = null;
                if (!flag)
                    s2 = TextUtils.expandTemplate(s, new CharSequence[] {
                        s1
                    }).toString();
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(s2)));
                return true;
            } else
            {
                Log.e("NetworkSettings", "Missing SETUP_PREPAID_DATA_SERVICE_URL");
                return true;
            }
        }
        if (preference == mApnPref && CallSettings.isMultipleSim())
        {
            Intent intent1 = new Intent();
            intent1.setAction("android.intent.action.MAIN");
            intent1.setClassName("com.android.phone", "com.mediatek.settings.MultipleSimActivity");
            intent1.putExtra("simId", mSimId);
            intent1.putExtra("INIT_TITLE_NAME", 0x7f0d01b2);
            intent1.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent1.putExtra("TARGET_CLASS", "com.android.settings.ApnSettings");
            mPreCheckForRunning.checkToRun(intent1, mSimId, 302);
            return true;
        }
        if (preference == mCarrierSelPref && CallSettings.isMultipleSim())
        {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.MAIN");
            intent.setClassName("com.android.phone", "com.mediatek.settings.MultipleSimActivity");
            intent.putExtra("INIT_TITLE_NAME", 0x7f0d01b6);
            intent.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent.putExtra("INIT_FEATURE_NAME", "NETWORK_SEARCH");
            intent.putExtra("TARGET_CLASS", "com.android.phone.NetworkSetting");
            mPreCheckForRunning.checkToRun(intent, mSimId, 302);
            return true;
        }
        if (preference == mDataConnPref)
        {
            Log.d("NetworkSettings", "mDataConnPref is clicked");
            return true;
        } else
        {
            preferencescreen.setEnabled(false);
            return false;
        }
    }

    protected void onResume()
    {
        boolean flag = true;
        super.onResume();
        if (android.provider.Settings.System.getInt(getContentResolver(), "airplane_mode_on", -1) != flag)
            flag = false;
        mAirplaneModeEnabled = flag;
        mConnService = (ConnectivityManager)getSystemService("connectivity");
        if (mConnService != null)
            mButtonDataEnabled.setChecked(mConnService.getMobileDataEnabled());
        else
            Log.d("NetworkSettings", "onResume, mConnService is null");
        mButtonDataRoam.setChecked(mPhone.getDataRoamingEnabled());
        if (getPreferenceScreen().findPreference("preferred_network_mode_key") != null)
            mPhone.getPreferredNetworkType(mHandler.obtainMessage(0));
        mDataUsageListener.resume();
        if (CallSettings.isMultipleSim())
        {
            mDualSimMode = android.provider.Settings.System.getInt(getContentResolver(), "dual_sim_mode_setting", -1);
            Log.d("NetworkSettings", (new StringBuilder()).append("Settings.onResume(), mDualSimMode=").append(mDualSimMode).toString());
        }
        if (mButtonPreferredNetworkMode != null)
            mButtonPreferredNetworkMode.setSummary(mButtonPreferredNetworkMode.getEntry());
        setDataConnPref();
        setScreenEnabled();
        getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("gprs_connection_sim_setting"), false, mGprsDefaultSIMObserver);
    }







/*
    static long access$1302(MobileNetworkSettings mobilenetworksettings, long l)
    {
        mobilenetworksettings.mSelectGprsIndex = l;
        return l;
    }

*/









/*
    static boolean access$302(MobileNetworkSettings mobilenetworksettings, boolean flag)
    {
        mobilenetworksettings.mAirplaneModeEnabled = flag;
        return flag;
    }

*/



/*
    static boolean access$402(MobileNetworkSettings mobilenetworksettings, boolean flag)
    {
        mobilenetworksettings.mIsChangeData = flag;
        return flag;
    }

*/



/*
    static int access$602(MobileNetworkSettings mobilenetworksettings, int i)
    {
        mobilenetworksettings.mDualSimMode = i;
        return i;
    }

*/



}
