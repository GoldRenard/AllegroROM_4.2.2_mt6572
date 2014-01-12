// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.bluetooth.BluetoothAdapter;
import android.content.*;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.*;
import android.preference.*;
import android.telephony.*;
import android.text.TextUtils;
import com.android.internal.telephony.*;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IStatusExt;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;

public class Status extends PreferenceActivity
{
    private static class MyHandler extends Handler
    {

        private WeakReference mStatus;

        public void handleMessage(Message message)
        {
            Status status = (Status)mStatus.get();
            if (status == null)
                return;
            switch (message.what)
            {
            case 500: 
                status.updateTimes();
                sendEmptyMessageDelayed(500, 1000L);
                return;

            case 300: 
                status.updateServiceState(status.mPhoneStateReceiver.getServiceState());
                return;

            case 200: 
                status.updateSignalStrength();
                return;
            }
        }

        public MyHandler(Status status)
        {
            mStatus = new WeakReference(status);
        }
    }


    static final String CB_AREA_INFO_RECEIVED_ACTION = "android.cellbroadcastreceiver.CB_AREA_INFO_RECEIVED";
    static final String CB_AREA_INFO_SENDER_PERMISSION = "android.permission.RECEIVE_EMERGENCY_BROADCAST";
    private static final int EVENT_SERVICE_STATE_CHANGED = 300;
    private static final int EVENT_SIGNAL_STRENGTH_CHANGED = 200;
    private static final int EVENT_UPDATE_STATS = 500;
    static final String GET_LATEST_CB_AREA_INFO_ACTION = "android.cellbroadcastreceiver.GET_LATEST_CB_AREA_INFO";
    private static final String KEY_BATTERY_LEVEL = "battery_level";
    private static final String KEY_BATTERY_STATUS = "battery_status";
    private static final String KEY_BT_ADDRESS = "bt_address";
    private static final String KEY_DATA_STATE = "data_state";
    private static final String KEY_ICC_ID = "icc_id";
    private static final String KEY_IMEI = "imei";
    private static final String KEY_IMEI_SV = "imei_sv";
    private static final String KEY_IP_ADDRESS = "wifi_ip_address";
    private static final String KEY_LATEST_AREA_INFO = "latest_area_info";
    private static final String KEY_MEID_NUMBER = "meid_number";
    private static final String KEY_MIN_NUMBER = "min_number";
    private static final String KEY_NETWORK_TYPE = "network_type";
    private static final String KEY_OPERATOR_NAME = "operator_name";
    private static final String KEY_PHONE_NUMBER = "number";
    private static final String KEY_PRL_VERSION = "prl_version";
    private static final String KEY_ROAMING_STATE = "roaming_state";
    private static final String KEY_SERIAL_NUMBER = "serial_number";
    private static final String KEY_SERVICE_STATE = "service_state";
    private static final String KEY_SIGNAL_STRENGTH = "signal_strength";
    private static final String KEY_WIFI_MAC_ADDRESS = "wifi_mac_address";
    private static final String KEY_WIMAX_MAC_ADDRESS = "wimax_mac_address";
    private static final String PHONE_RELATED_ENTRIES[] = {
        "data_state", "service_state", "operator_name", "roaming_state", "network_type", "latest_area_info", "number", "imei", "imei_sv", "prl_version", 
        "min_number", "meid_number", "signal_strength", "icc_id"
    };
    private static final String TAG = "DeviceInfoStatus";
    private BroadcastReceiver mAreaInfoReceiver;
    private BroadcastReceiver mBatteryInfoReceiver;
    private Preference mBatteryLevel;
    private Preference mBatteryStatus;
    private IStatusExt mExt;
    private Handler mHandler;
    private Phone mPhone;
    private PhoneStateListener mPhoneServiceListener;
    private PhoneStateListener mPhoneStateListener;
    private PhoneStateIntentReceiver mPhoneStateReceiver;
    private Resources mRes;
    private int mServiceState;
    private boolean mShowLatestAreaInfo;
    private Preference mSignalStrength;
    private PhoneStateListener mSignalStrengthListener;
    private TelephonyManager mTelephonyManager;
    private Preference mUptime;
    private String sUnknown;

    public Status()
    {
        mPhone = null;
        mBatteryInfoReceiver = new BroadcastReceiver() {

            final Status this$0;

            public void onReceive(Context context, Intent intent)
            {
                String s = intent.getAction();
                if ("android.intent.action.BATTERY_CHANGED".equals(s))
                {
                    mBatteryLevel.setSummary(Utils.getBatteryPercentage(intent));
                    mBatteryStatus.setSummary(Utils.getBatteryStatus(getResources(), intent));
                } else
                if ("android.provider.Telephony.SPN_STRINGS_UPDATED".equals(s))
                {
                    boolean flag = intent.getBooleanExtra("showPlmn", false);
                    String s1 = null;
                    if (flag)
                    {
                        String s3 = intent.getStringExtra("plmn");
                        s1 = null;
                        if (s3 != null)
                            s1 = s3;
                    }
                    if (intent.getBooleanExtra("showSpn", false))
                    {
                        String s2 = intent.getStringExtra("spn");
                        if (s2 != null)
                            s1 = s2;
                    }
                    Preference preference = findPreference("operator_name");
                    if (preference != null)
                    {
                        mExt.updateOpNameFromRec(preference, s1);
                        return;
                    }
                }
            }

            
            {
                this$0 = Status.this;
                super();
            }
        }
;
        mPhoneStateListener = new PhoneStateListener() {

            final Status this$0;

            public void onDataConnectionStateChanged(int i)
            {
                updateDataState();
                updateNetworkType();
            }

            
            {
                this$0 = Status.this;
                super();
            }
        }
;
        mAreaInfoReceiver = new BroadcastReceiver() {

            final Status this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.cellbroadcastreceiver.CB_AREA_INFO_RECEIVED".equals(intent.getAction()))
                {
                    Bundle bundle = intent.getExtras();
                    if (bundle != null)
                    {
                        CellBroadcastMessage cellbroadcastmessage = (CellBroadcastMessage)bundle.get("message");
                        if (cellbroadcastmessage != null && cellbroadcastmessage.getServiceCategory() == 50)
                        {
                            String s = cellbroadcastmessage.getMessageBody();
                            updateAreaInfo(s);
                            return;
                        }
                    }
                }
            }

            
            {
                this$0 = Status.this;
                super();
            }
        }
;
        mSignalStrengthListener = new PhoneStateListener() {

            final Status this$0;

            public void onSignalStrengthsChanged(SignalStrength signalstrength)
            {
                updateSignalStrength();
            }

            
            {
                this$0 = Status.this;
                super();
            }
        }
;
        mPhoneServiceListener = new PhoneStateListener() {

            final Status this$0;

            public void onServiceStateChanged(ServiceState servicestate)
            {
                mServiceState = servicestate.getState();
                updateServiceState(servicestate);
            }

            
            {
                this$0 = Status.this;
                super();
            }
        }
;
    }

    private String convert(long l)
    {
        int i = (int)(l % 60L);
        int j = (int)((l / 60L) % 60L);
        int k = (int)(l / 3600L);
        return (new StringBuilder()).append(k).append(":").append(pad(j)).append(":").append(pad(i)).toString();
    }

    private String pad(int i)
    {
        if (i >= 10)
            return String.valueOf(i);
        else
            return (new StringBuilder()).append("0").append(String.valueOf(i)).toString();
    }

    private void removePreferenceFromScreen(String s)
    {
        Preference preference = findPreference(s);
        if (preference != null)
            getPreferenceScreen().removePreference(preference);
    }

    private void setBtStatus()
    {
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        Preference preference = findPreference("bt_address");
        if (bluetoothadapter == null)
        {
            getPreferenceScreen().removePreference(preference);
            return;
        }
        String s;
        if (bluetoothadapter.isEnabled())
            s = bluetoothadapter.getAddress();
        else
            s = null;
        if (TextUtils.isEmpty(s))
            s = getString(0x7f0b055e);
        preference.setSummary(s);
    }

    private void setIpAddressStatus()
    {
        Preference preference = findPreference("wifi_ip_address");
        String s = Utils.getDefaultIpAddresses(this);
        if (s != null)
        {
            preference.setSummary(s);
            return;
        } else
        {
            preference.setSummary(getString(0x7f0b055e));
            return;
        }
    }

    private void setSummary(String s, String s1, String s2)
    {
        try
        {
            findPreference(s).setSummary(SystemProperties.get(s1, s2));
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            return;
        }
    }

    private void setSummaryText(String s, String s1)
    {
        if (TextUtils.isEmpty(s1))
            s1 = sUnknown;
        if (findPreference(s) != null)
            findPreference(s).setSummary(s1);
    }

    private void setWifiStatus()
    {
        WifiInfo wifiinfo = ((WifiManager)getSystemService("wifi")).getConnectionInfo();
        Preference preference = findPreference("wifi_mac_address");
        String s;
        if (wifiinfo == null)
            s = null;
        else
            s = wifiinfo.getMacAddress();
        if (TextUtils.isEmpty(s))
            s = getString(0x7f0b055e);
        preference.setSummary(s);
    }

    private void setWimaxStatus()
    {
        if (((ConnectivityManager)getSystemService("connectivity")).getNetworkInfo(6) == null)
        {
            PreferenceScreen preferencescreen = getPreferenceScreen();
            Preference preference = findPreference("wimax_mac_address");
            if (preference != null)
                preferencescreen.removePreference(preference);
            return;
        } else
        {
            findPreference("wimax_mac_address").setSummary(SystemProperties.get("net.wimax.mac.address", getString(0x7f0b055e)));
            return;
        }
    }

    private void updateAreaInfo(String s)
    {
        if (s != null)
            setSummaryText("latest_area_info", s);
    }

    private void updateDataState()
    {
        int i = mTelephonyManager.getDataState();
        String s = mRes.getString(0x7f0b028c);
        switch (i)
        {
        case 0: // '\0'
            s = mRes.getString(0x7f0b0288);
            break;

        case 1: // '\001'
            s = mRes.getString(0x7f0b0289);
            break;

        case 3: // '\003'
            s = mRes.getString(0x7f0b028b);
            break;

        case 2: // '\002'
            s = mRes.getString(0x7f0b028a);
            break;
        }
        setSummaryText("data_state", s);
    }

    private void updateNetworkType()
    {
        setSummaryText("network_type", (new StringBuilder()).append(mTelephonyManager.getNetworkTypeName()).append(":").append(mTelephonyManager.getNetworkType()).toString());
    }

    private void updateServiceState(ServiceState servicestate)
    {
        int i = servicestate.getState();
        String s = mRes.getString(0x7f0b028c);
        switch (i)
        {
        case 3: // '\003'
            s = mRes.getString(0x7f0b0282);
            break;

        case 1: // '\001'
        case 2: // '\002'
            s = mRes.getString(0x7f0b0280);
            break;

        case 0: // '\0'
            s = mRes.getString(0x7f0b027f);
            break;
        }
        setSummaryText("service_state", s);
        if (servicestate.getRoaming())
            setSummaryText("roaming_state", mRes.getString(0x7f0b0283));
        else
            setSummaryText("roaming_state", mRes.getString(0x7f0b0284));
        Preference preference = findPreference("operator_name");
        if (TextUtils.isEmpty(servicestate.getOperatorAlphaLong()))
            getResources().getString(0x7f0b026c);
        if (preference != null)
            mExt.updateServiceState(preference, servicestate.getOperatorAlphaLong());
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        mExt = Utils.getStatusExtPlugin(this);
        mHandler = new MyHandler(this);
        mTelephonyManager = (TelephonyManager)getSystemService("phone");
        addPreferencesFromResource(0x7f050014);
        mBatteryLevel = findPreference("battery_level");
        mBatteryStatus = findPreference("battery_status");
        mRes = getResources();
        sUnknown = mRes.getString(0x7f0b026c);
        if (UserHandle.myUserId() == 0)
            mPhone = PhoneFactory.getDefaultPhone();
        mSignalStrength = findPreference("signal_strength");
        mUptime = findPreference("up_time");
        if (mPhone != null && !Utils.isWifiOnly(getApplicationContext()))
        {
            if (mPhone.getPhoneName().equals("CDMA"))
            {
                setSummaryText("meid_number", mPhone.getMeid());
                setSummaryText("min_number", mPhone.getCdmaMin());
                if (getResources().getBoolean(0x7f090007))
                    findPreference("min_number").setTitle(0x7f0b0550);
                setSummaryText("prl_version", mPhone.getCdmaPrlVersion());
                removePreferenceFromScreen("imei_sv");
                if (mPhone.getLteOnCdmaMode() == 1)
                {
                    setSummaryText("icc_id", mPhone.getIccSerialNumber());
                    setSummaryText("imei", mPhone.getImei());
                } else
                {
                    removePreferenceFromScreen("imei");
                    removePreferenceFromScreen("icc_id");
                }
            } else
            {
                setSummaryText("imei", mPhone.getDeviceId());
                setSummaryText("imei_sv", ((TelephonyManager)getSystemService("phone")).getDeviceSoftwareVersion());
                removePreferenceFromScreen("prl_version");
                removePreferenceFromScreen("meid_number");
                removePreferenceFromScreen("min_number");
                removePreferenceFromScreen("icc_id");
                if ("br".equals(mTelephonyManager.getSimCountryIso()))
                    mShowLatestAreaInfo = true;
            }
            String s1 = mPhone.getLine1Number();
            boolean flag = TextUtils.isEmpty(s1);
            String s2 = null;
            if (!flag)
                s2 = PhoneNumberUtils.formatNumber(s1);
            setSummaryText("number", s2);
            mPhoneStateReceiver = new PhoneStateIntentReceiver(this, mHandler);
            mPhoneStateReceiver.notifySignalStrength(200);
            mPhoneStateReceiver.notifyServiceState(300);
            if (!mShowLatestAreaInfo)
                removePreferenceFromScreen("latest_area_info");
        } else
        {
            String as[] = PHONE_RELATED_ENTRIES;
            int i = as.length;
            for (int j = 0; j < i; j++)
                removePreferenceFromScreen(as[j]);

        }
        setWimaxStatus();
        setWifiStatus();
        setBtStatus();
        setIpAddressStatus();
        String s = Build.SERIAL;
        if (s != null && !s.equals(""))
        {
            setSummaryText("serial_number", s);
            return;
        } else
        {
            removePreferenceFromScreen("serial_number");
            return;
        }
    }

    public void onPause()
    {
        super.onPause();
        if (mPhone != null && !Utils.isWifiOnly(getApplicationContext()))
        {
            mPhoneStateReceiver.unregisterIntent();
            mTelephonyManager.listen(mPhoneStateListener, 0);
        }
        if (mShowLatestAreaInfo)
            unregisterReceiver(mAreaInfoReceiver);
        unregisterReceiver(mBatteryInfoReceiver);
        mHandler.removeMessages(500);
    }

    protected void onResume()
    {
        super.onResume();
        if (mPhone != null && !Utils.isWifiOnly(getApplicationContext()))
        {
            mPhoneStateReceiver.registerIntent();
            updateSignalStrength();
            updateServiceState(mPhone.getServiceState());
            updateDataState();
            mTelephonyManager.listen(mPhoneStateListener, 64);
            mTelephonyManager.listen(mSignalStrengthListener, 256);
            mTelephonyManager.listen(mPhoneServiceListener, 1);
            if (mShowLatestAreaInfo)
            {
                registerReceiver(mAreaInfoReceiver, new IntentFilter("android.cellbroadcastreceiver.CB_AREA_INFO_RECEIVED"), "android.permission.RECEIVE_EMERGENCY_BROADCAST", null);
                sendBroadcastAsUser(new Intent("android.cellbroadcastreceiver.GET_LATEST_CB_AREA_INFO"), UserHandle.ALL, "android.permission.RECEIVE_EMERGENCY_BROADCAST");
            }
        }
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("android.intent.action.BATTERY_CHANGED");
        mExt.addAction(intentfilter, "android.provider.Telephony.SPN_STRINGS_UPDATED");
        registerReceiver(mBatteryInfoReceiver, intentfilter);
        mHandler.sendEmptyMessage(500);
    }

    void updateSignalStrength()
    {
        if (mSignalStrength != null)
        {
            int i = mPhoneStateReceiver.getServiceState().getState();
            Resources resources = getResources();
            if (1 == i || 3 == i)
                mSignalStrength.setSummary("0");
            int j = mPhoneStateReceiver.getSignalStrengthDbm();
            Xlog.d("DeviceInfoStatus", (new StringBuilder()).append("updateSignalStrength() signalDbm : ").append(j).toString());
            if (-1 == j)
                j = 0;
            int k = mPhoneStateReceiver.getSignalStrengthLevelAsu();
            Xlog.d("DeviceInfoStatus", (new StringBuilder()).append("updateSignalStrength() signalAsu : ").append(k).toString());
            if (-1 == k)
                k = 0;
            mSignalStrength.setSummary((new StringBuilder()).append(String.valueOf(j)).append(" ").append(resources.getString(0x7f0b028f)).append("   ").append(String.valueOf(k)).append(" ").append(resources.getString(0x7f0b0290)).toString());
        }
    }

    void updateTimes()
    {
        long _tmp = SystemClock.uptimeMillis() / 1000L;
        long l = SystemClock.elapsedRealtime() / 1000L;
        if (l == 0L)
            l = 1L;
        mUptime.setSummary(convert(l));
    }











/*
    static int access$802(Status status, int i)
    {
        status.mServiceState = i;
        return i;
    }

*/
}
