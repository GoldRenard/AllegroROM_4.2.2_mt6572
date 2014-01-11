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
import android.text.TextUtils;
import com.android.internal.telephony.PhoneFactory;
import com.android.internal.telephony.gemini.GeminiPhone;
import com.android.settings.Utils;
import com.mediatek.settings.ext.IStatusGeminiExt;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;
import java.util.List;

public class StatusGemini extends PreferenceActivity
{
    private static class MyHandler extends Handler
    {

        private WeakReference mStatus;

        public void handleMessage(Message message)
        {
            StatusGemini statusgemini = (StatusGemini)mStatus.get();
            if (statusgemini != null && 500 == message.what)
            {
                statusgemini.updateTimes();
                sendEmptyMessageDelayed(500, 1000L);
                return;
            } else
            {
                return;
            }
        }

        public MyHandler(StatusGemini statusgemini)
        {
            mStatus = new WeakReference(statusgemini);
        }
    }


    private static final String CDMA = "CDMA";
    private static final int EVENT_UPDATE_STATS = 500;
    private static final String KEY_BATTERY_LEVEL = "battery_level";
    private static final String KEY_BATTERY_STATUS = "battery_status";
    private static final String KEY_BT_ADDRESS = "bt_address";
    private static final String KEY_SERIAL_NUMBER = "serial_number";
    private static final String KEY_SIM_STATUS = "sim_status";
    private static final String KEY_SLOT_STATUS = "slot_status";
    private static final String KEY_UP_TIME = "up_time";
    private static final String KEY_WIFI_IP_ADDRESS = "wifi_ip_address";
    private static final String KEY_WIFI_MAC_ADDRESS = "wifi_mac_address";
    private static final String KEY_WIMAX_MAC_ADDRESS = "wimax_mac_address";
    private static final String TAG = "Gemini_Aboutphone";
    private static final String WIMAX_ADDRESS = "net.wimax.mac.address";
    private static String sUnknown;
    private BroadcastReceiver mBatteryInfoReceiver;
    private Preference mBatteryLevel;
    private Preference mBatteryStatus;
    IStatusGeminiExt mExt;
    private GeminiPhone mGeminiPhone;
    private Handler mHandler;
    private Resources mRes;
    private Preference mUptime;

    public StatusGemini()
    {
        mGeminiPhone = null;
        mBatteryInfoReceiver = new BroadcastReceiver() {

            final StatusGemini this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("android.intent.action.BATTERY_CHANGED".equals(intent.getAction()))
                {
                    int i = intent.getIntExtra("level", 0);
                    int j = intent.getIntExtra("scale", 100);
                    Preference preference = mBatteryLevel;
                    StatusGemini statusgemini = StatusGemini.this;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf((i * 100) / j);
                    preference.setSummary(statusgemini.getString(0x7f0b00b2, aobj));
                    int k = intent.getIntExtra("plugged", 0);
                    int l = intent.getIntExtra("status", 1);
                    String s;
                    if (l == 2)
                    {
                        s = getString(0x7f0b02aa);
                        if (k > 0)
                        {
                            StringBuilder stringbuilder = (new StringBuilder()).append(s).append(" ");
                            StatusGemini statusgemini1 = StatusGemini.this;
                            int i1;
                            if (k == 1)
                                i1 = 0x7f0b02ab;
                            else
                                i1 = 0x7f0b02ac;
                            s = stringbuilder.append(statusgemini1.getString(i1)).toString();
                        }
                    } else
                    if (l == 3)
                        s = getString(0x7f0b02ae);
                    else
                    if (l == 4)
                        s = getString(0x7f0b02af);
                    else
                    if (l == 5)
                        s = getString(0x7f0b02b0);
                    else
                        s = getString(0x7f0b02a9);
                    mBatteryStatus.setSummary(s);
                }
            }

            
            {
                this$0 = StatusGemini.this;
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

    private void setBtStatus()
    {
        BluetoothAdapter bluetoothadapter = BluetoothAdapter.getDefaultAdapter();
        Preference preference = findPreference("bt_address");
        if (bluetoothadapter == null)
        {
            if (preference != null)
                getPreferenceScreen().removePreference(preference);
        } else
        {
            String s;
            if (bluetoothadapter.isEnabled())
                s = bluetoothadapter.getAddress();
            else
                s = null;
            if (preference != null)
            {
                if (TextUtils.isEmpty(s))
                    s = getString(0x7f0b055e);
                preference.setSummary(s);
                return;
            }
        }
    }

    private void setSimListEntrance()
    {
        Preference preference = findPreference("sim_status");
        mExt.initUI(getPreferenceScreen(), preference);
        if (preference != null)
        {
            List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
            int i = list.size();
            Xlog.d("Gemini_Aboutphone", (new StringBuilder()).append("sim num ").append(i).toString());
            if (i == 0)
            {
                preference.setEnabled(false);
            } else
            {
                if (i == 1)
                {
                    Intent intent1 = new Intent();
                    intent1.setClassName("com.android.settings", "com.android.settings.deviceinfo.SimStatusGemini");
                    intent1.putExtra("slotid", ((android.provider.Telephony.SIMInfo)list.get(0)).mSlot);
                    preference.setIntent(intent1);
                    return;
                }
                if (i > 1)
                {
                    Intent intent = new Intent("com.android.settings.SIM_LIST_ENTRANCE_ACTIVITY");
                    intent.putExtra("title", preference.getTitle());
                    intent.putExtra("type", 1);
                    preference.setIntent(intent);
                    return;
                }
            }
        }
    }

    private void setSummaryText(String s, String s1)
    {
        Xlog.d("Gemini_Aboutphone", (new StringBuilder()).append("set ").append(s).append(" with text=").append(s1).toString());
        if (TextUtils.isEmpty(s1))
            s1 = getResources().getString(0x7f0b026c);
        Preference preference = ((PreferenceScreen)findPreference("slot_status")).findPreference(s);
        if (preference == null)
        {
            Xlog.d("Gemini_Aboutphone", (new StringBuilder()).append("slot_status not find preference ").append(s).toString());
            Preference preference1 = findPreference(s);
            if (preference1 != null)
                preference1.setSummary(s1);
            return;
        } else
        {
            preference.setSummary(s1);
            return;
        }
    }

    private void setWifiStatus()
    {
        WifiManager wifimanager = (WifiManager)getSystemService("wifi");
        WifiInfo wifiinfo = null;
        if (wifimanager != null)
            wifiinfo = wifimanager.getConnectionInfo();
        Preference preference = findPreference("wifi_mac_address");
        String s;
        if (wifiinfo == null)
            s = null;
        else
            s = wifiinfo.getMacAddress();
        if (preference != null)
        {
            if (TextUtils.isEmpty(s))
                s = getString(0x7f0b055e);
            preference.setSummary(s);
        }
        Preference preference1 = findPreference("wifi_ip_address");
        String s1 = Utils.getDefaultIpAddresses(this);
        if (s1 != null)
        {
            preference1.setSummary(s1);
            return;
        } else
        {
            preference1.setSummary(getString(0x7f0b055e));
            return;
        }
    }

    private void setWimaxStatus()
    {
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        android.net.NetworkInfo networkinfo = null;
        if (connectivitymanager != null)
            networkinfo = connectivitymanager.getNetworkInfo(6);
        if (networkinfo == null)
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

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050015);
        Xlog.d("Gemini_Aboutphone", "Enter StatusGemini onCreate function.");
        mExt = Utils.getStatusGeminiExtPlugin(this);
        mHandler = new MyHandler(this);
        mGeminiPhone = (GeminiPhone)PhoneFactory.getDefaultPhone();
        mBatteryLevel = findPreference("battery_level");
        mBatteryStatus = findPreference("battery_status");
        mUptime = findPreference("up_time");
        mRes = getResources();
        sUnknown = mRes.getString(0x7f0b026c);
        ConnectivityManager connectivitymanager = (ConnectivityManager)getSystemService("connectivity");
        boolean flag = false;
        if (connectivitymanager != null)
        {
            if (!connectivitymanager.isNetworkSupported(0))
                flag = true;
            else
                flag = false;
            Xlog.d("Gemini_Aboutphone", (new StringBuilder()).append("sIsWifiOnly=").append(flag).toString());
        }
        if (!flag)
        {
            setSimListEntrance();
            String s = Build.SERIAL;
            if (s != null && !s.equals(""))
            {
                setSummaryText("serial_number", s);
            } else
            {
                Preference preference2 = findPreference("serial_number");
                if (preference2 != null)
                    getPreferenceScreen().removePreference(preference2);
            }
        } else
        {
            Preference preference = findPreference("sim_status");
            getPreferenceScreen().removePreference(preference);
            Preference preference1 = findPreference("slot_status");
            getPreferenceScreen().removePreference(preference1);
        }
        setWimaxStatus();
        setWifiStatus();
        setBtStatus();
    }

    public void onPause()
    {
        super.onPause();
        unregisterReceiver(mBatteryInfoReceiver);
        mHandler.removeMessages(500);
    }

    protected void onResume()
    {
        super.onResume();
        registerReceiver(mBatteryInfoReceiver, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
        mHandler.sendEmptyMessage(500);
    }

    void updateTimes()
    {
        long _tmp = SystemClock.uptimeMillis() / 1000L;
        long l = SystemClock.elapsedRealtime() / 1000L;
        if (l == 0L)
            l = 1L;
        mUptime.setSummary(convert(l));
    }


}
