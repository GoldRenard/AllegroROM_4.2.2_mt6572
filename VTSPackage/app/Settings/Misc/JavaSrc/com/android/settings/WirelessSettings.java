// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.nfc.NfcAdapter;
import android.os.*;
import android.preference.*;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import com.android.internal.telephony.ITelephony;
import com.android.settings.nfc.NfcEnabler;
import com.mediatek.nfc.*;
import com.mediatek.wireless.UsbSharingInfo;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, AirplaneModeEnabler, Utils, NsdEnabler

public class WirelessSettings extends SettingsPreferenceFragment
{

    public static final String EXIT_ECM_RESULT = "exit_ecm_result";
    private static final String KEY_ANDROID_BEAM_SETTINGS = "android_beam_settings";
    private static final String KEY_CELL_BROADCAST_SETTINGS = "cell_broadcast_settings";
    private static final String KEY_MOBILE_NETWORK_SETTINGS = "mobile_network_settings";
    private static final String KEY_MTK_TOGGLE_NFC = "toggle_mtk_nfc";
    private static final String KEY_PROXY_SETTINGS = "proxy_settings";
    private static final String KEY_RCSE_SETTINGS = "rcse_settings";
    private static final String KEY_TETHER_SETTINGS = "tether_settings";
    private static final String KEY_TOGGLE_AIRPLANE = "toggle_airplane";
    private static final String KEY_TOGGLE_NFC = "toggle_nfc";
    private static final String KEY_TOGGLE_NSD = "toggle_nsd";
    private static final String KEY_USB_SHARING = "usb_sharing";
    private static final String KEY_VPN_SETTINGS = "vpn_settings";
    private static final String KEY_WIMAX_SETTINGS = "wimax_settings";
    private static final String RCSE_SETTINGS_INTENT = "com.mediatek.rcse.RCSE_SETTINGS";
    public static final int REQUEST_CODE_EXIT_ECM = 1;
    private static final String TAG = "WirelessSettings";
    private static final String USB_DATA_STATE = "mediatek.intent.action.USB_DATA_STATE";
    private AirplaneModeEnabler mAirplaneModeEnabler;
    private CheckBoxPreference mAirplaneModePreference;
    private ConnectivityManager mConnectivityManager;
    private IntentFilter mIntentFilter;
    private MtkNfcEnabler mMTKNfcEnabler;
    private PreferenceScreen mNetworkSettingsPreference;
    private NfcAdapter mNfcAdapter;
    private NfcEnabler mNfcEnabler;
    private NfcPreference mNfcPreference;
    private NsdEnabler mNsdEnabler;
    private PhoneStateListener mPhoneStateListener;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final WirelessSettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            String s = intent.getAction();
            String s1 = intent.getStringExtra("apn");
            if ("mediatek.intent.action.USB_DATA_STATE".equals(s) && "internet".equals(s1))
            {
                com.android.internal.telephony.PhoneConstants.DataState datastate = (com.android.internal.telephony.PhoneConstants.DataState)Enum.valueOf(com/android/internal/telephony/PhoneConstants$DataState, intent.getStringExtra("state"));
                Xlog.d("WirelessSettings", "receive USB_DATA_STATE");
                Xlog.d("WirelessSettings", (new StringBuilder()).append("dataApnKey = ").append(s1).append(", state = ").append(datastate).toString());
                static class _cls3
                {

                    static final int $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[];

                    static 
                    {
                        $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState = new int[com.android.internal.telephony.PhoneConstants.DataState.values().length];
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.CONNECTING.ordinal()] = 1;
                        }
                        catch (NoSuchFieldError nosuchfielderror) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.CONNECTED.ordinal()] = 2;
                        }
                        catch (NoSuchFieldError nosuchfielderror1) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.SUSPENDED.ordinal()] = 3;
                        }
                        catch (NoSuchFieldError nosuchfielderror2) { }
                        try
                        {
                            $SwitchMap$com$android$internal$telephony$PhoneConstants$DataState[com.android.internal.telephony.PhoneConstants.DataState.DISCONNECTED.ordinal()] = 4;
                        }
                        catch (NoSuchFieldError nosuchfielderror3)
                        {
                            return;
                        }
                    }
                }

                switch (_cls3..SwitchMap.com.android.internal.telephony.PhoneConstants.DataState[datastate.ordinal()])
                {
                case 4: // '\004'
                    mUsbSharing.setEnabled(true);
                    mUsbSharing.setChecked(false);
                    mUsbSharing.setSummary(0x7f0b016d);
                    return;

                case 2: // '\002'
                    mUsbSharing.setEnabled(true);
                    mUsbSharing.setChecked(true);
                    mUsbSharing.setSummary(0x7f0b028a);
                    return;

                case 1: // '\001'
                    mUsbSharing.setEnabled(false);
                    mUsbSharing.setChecked(false);
                    mUsbSharing.setSummary(0x7f0b0289);
                    return;
                }
            } else
            if (s.equals("android.hardware.usb.action.USB_STATE"))
            {
                boolean flag1 = intent.getBooleanExtra("connected", false);
                boolean flag2 = false;
                String as[] = mConnectivityManager.getTetheredIfaces();
                String as1[] = mConnectivityManager.getTetherableUsbRegexs();
                int i = as.length;
                for (int j = 0; j < i; j++)
                {
                    String s2 = as[j];
                    int k = as1.length;
                    for (int l = 0; l < k; l++)
                        if (s2.matches(as1[l]))
                            flag2 = true;

                }

                Xlog.d("WirelessSettings", (new StringBuilder()).append("onReceive: ACTION_USB_STATE usbConnected:").append(flag1).append(" usbTethered:").append(flag2).toString());
                if (!mUsbSharing.isChecked())
                {
                    CheckBoxPreference checkboxpreference = mUsbSharing;
                    boolean flag3;
                    if (flag1 && !flag2)
                        flag3 = true;
                    else
                        flag3 = false;
                    checkboxpreference.setEnabled(flag3);
                    return;
                }
            } else
            if (s.equals("android.intent.action.SIM_INFO_UPDATE"))
            {
                Xlog.d("WirelessSettings", "ACTION_SIM_INFO_UPDATE received");
                List list = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity());
                if (list != null)
                {
                    Xlog.d("WirelessSettings", (new StringBuilder()).append("sim card number is: ").append(list.size()).toString());
                    PreferenceScreen preferencescreen = mNetworkSettingsPreference;
                    boolean flag;
                    if (list.size() > 0)
                        flag = true;
                    else
                        flag = false;
                    preferencescreen.setEnabled(flag);
                    return;
                }
            }
        }

            
            {
                this$0 = WirelessSettings.this;
                super();
            }
    }
;
    private ITelephony mTelephony;
    private Preference mTetherSettings;
    private CheckBoxPreference mUsbSharing;

    public WirelessSettings()
    {
        mPhoneStateListener = new PhoneStateListener() {

            final WirelessSettings this$0;

            public void onCallStateChanged(int i, String s)
            {
                super.onCallStateChanged(i, s);
                Xlog.d("WirelessSettings", (new StringBuilder()).append("PhoneStateListener, new state=").append(i).toString());
                if (i == 0 && getActivity() != null)
                {
                    int j = ((TelephonyManager)getSystemService("phone")).getCallState();
                    Xlog.d("WirelessSettings", (new StringBuilder()).append("Total PhoneState =").append(j).toString());
                    if (j == 0)
                    {
                        mTelephony = com.android.internal.telephony.ITelephony.Stub.asInterface(ServiceManager.getService("phone"));
                        updateMobileNetworkEnabled();
                    }
                }
            }

            
            {
                this$0 = WirelessSettings.this;
                super();
            }
        }
;
    }

    public static boolean isRadioAllowed(Context context, String s)
    {
        if (AirplaneModeEnabler.isAirplaneModeOn(context))
        {
            String s1 = android.provider.Settings.Global.getString(context.getContentResolver(), "airplane_mode_toggleable_radios");
            if (s1 == null || !s1.contains(s))
                return false;
        }
        return true;
    }

    private void updateMobileNetworkEnabled()
    {
        int i = android.provider.Telephony.SIMInfo.getInsertedSIMCount(getActivity());
        Xlog.d("WirelessSettings", (new StringBuilder()).append("simNum=").append(i).toString());
        if (i > 0)
        {
            mNetworkSettingsPreference.setEnabled(true);
            return;
        } else
        {
            mNetworkSettingsPreference.setEnabled(false);
            return;
        }
    }

    protected int getHelpResource()
    {
        return 0x7f0b092c;
    }

    public void onActivityResult(int i, int j, Intent intent)
    {
        if (i == 1)
        {
            Boolean boolean1 = Boolean.valueOf(intent.getBooleanExtra("exit_ecm_result", false));
            mAirplaneModeEnabler.setAirplaneModeInECM(boolean1.booleanValue(), mAirplaneModePreference.isChecked());
        }
    }

    public void onCreate(Bundle bundle)
    {
        boolean flag3;
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050050);
        boolean flag;
        Activity activity;
        CheckBoxPreference checkboxpreference;
        PreferenceScreen preferencescreen;
        NfcEnabler nfcenabler;
        CheckBoxPreference checkboxpreference1;
        AirplaneModeEnabler airplanemodeenabler;
        String s;
        boolean flag1;
        Preference preference;
        DevicePolicyManager devicepolicymanager;
        boolean flag2;
        PreferenceScreen preferencescreen1;
        Preference preference1;
        List list;
        int i;
        if (UserHandle.myUserId() != 0)
            flag = true;
        else
            flag = false;
        activity = getActivity();
        mAirplaneModePreference = (CheckBoxPreference)findPreference("toggle_airplane");
        checkboxpreference = (CheckBoxPreference)findPreference("toggle_nfc");
        preferencescreen = (PreferenceScreen)findPreference("android_beam_settings");
        mNfcPreference = (NfcPreference)findPreference("toggle_mtk_nfc");
        mNfcAdapter = NfcAdapter.getDefaultAdapter(activity);
        getPreferenceScreen().removePreference(mNfcPreference);
        nfcenabler = new NfcEnabler(activity, checkboxpreference, preferencescreen);
        mNfcEnabler = nfcenabler;
        mNetworkSettingsPreference = (PreferenceScreen)findPreference("mobile_network_settings");
        mUsbSharing = (CheckBoxPreference)findPreference("usb_sharing");
        checkboxpreference1 = (CheckBoxPreference)findPreference("toggle_nsd");
        airplanemodeenabler = new AirplaneModeEnabler(activity, mAirplaneModePreference);
        mAirplaneModeEnabler = airplanemodeenabler;
        getPreferenceScreen().removePreference(checkboxpreference1);
        s = android.provider.Settings.Global.getString(activity.getContentResolver(), "airplane_mode_toggleable_radios");
        if (!flag && getResources().getBoolean(0x111003f))
            flag1 = true;
        else
            flag1 = false;
        if (!flag1)
        {
            PreferenceScreen preferencescreen2 = getPreferenceScreen();
            Preference preference2 = findPreference("wimax_settings");
            if (preference2 != null)
                preferencescreen2.removePreference(preference2);
        } else
        if (s == null || !s.contains("wimax") && flag1)
            findPreference("wimax_settings").setDependency("toggle_airplane");
        if (s == null || !s.contains("wifi"))
            findPreference("vpn_settings").setDependency("toggle_airplane");
        if (flag)
            removePreference("vpn_settings");
        if (s == null || !s.contains("nfc"))
        {
            checkboxpreference.setDependency("toggle_airplane");
            findPreference("android_beam_settings").setDependency("toggle_airplane");
        }
        if (mNfcAdapter == null)
        {
            getPreferenceScreen().removePreference(checkboxpreference);
            mNfcEnabler = null;
            getPreferenceScreen().removePreference(preferencescreen);
        }
        if (flag || Utils.isWifiOnly(getActivity()))
            getPreferenceScreen().removePreference(mNetworkSettingsPreference);
        preference = findPreference("proxy_settings");
        devicepolicymanager = (DevicePolicyManager)activity.getSystemService("device_policy");
        getPreferenceScreen().removePreference(preference);
        if (devicepolicymanager.getGlobalProxyAdmin() == null)
            flag2 = true;
        else
            flag2 = false;
        preference.setEnabled(flag2);
        mConnectivityManager = (ConnectivityManager)activity.getSystemService("connectivity");
        mTetherSettings = findPreference("tether_settings");
        if (mConnectivityManager != null)
            if (flag || !mConnectivityManager.isTetheringSupported() || Utils.isWifiOnly(getActivity()))
                getPreferenceScreen().removePreference(mTetherSettings);
            else
                mTetherSettings.setTitle(Utils.getTetheringLabel(mConnectivityManager));
        flag3 = getResources().getBoolean(0x1110044);
        if (!flag3)
            break MISSING_BLOCK_LABEL_524;
        i = getPackageManager().getApplicationEnabledSetting("com.android.cellbroadcastreceiver");
        if (i == 2)
            flag3 = false;
_L1:
        if (flag || !flag3)
        {
            preferencescreen1 = getPreferenceScreen();
            preference1 = findPreference("cell_broadcast_settings");
            if (preference1 != null)
                preferencescreen1.removePreference(preference1);
        }
        Intent intent = new Intent("com.mediatek.rcse.RCSE_SETTINGS");
        list = getPackageManager().queryIntentActivities(intent, 0);
        IllegalArgumentException illegalargumentexception;
        if (list == null || list.size() == 0)
        {
            Xlog.w("WirelessSettings", "com.mediatek.rcse.RCSE_SETTINGS is not installed");
            getPreferenceScreen().removePreference(findPreference("rcse_settings"));
        } else
        {
            Xlog.w("WirelessSettings", "com.mediatek.rcse.RCSE_SETTINGS is installed");
            findPreference("rcse_settings").setIntent(intent);
        }
        mIntentFilter = new IntentFilter("mediatek.intent.action.USB_DATA_STATE");
        mIntentFilter.addAction("android.hardware.usb.action.USB_STATE");
        mIntentFilter.addAction("android.intent.action.SIM_INFO_UPDATE");
        return;
        illegalargumentexception;
        flag3 = false;
          goto _L1
    }

    public void onPause()
    {
        super.onPause();
        ((TelephonyManager)getSystemService("phone")).listen(mPhoneStateListener, 0);
        getActivity().unregisterReceiver(mReceiver);
        mAirplaneModeEnabler.pause();
        if (mNfcEnabler != null)
            mNfcEnabler.pause();
        if (mNsdEnabler != null)
            mNsdEnabler.pause();
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mAirplaneModePreference && Boolean.parseBoolean(SystemProperties.get("ril.cdma.inecmmode")))
        {
            startActivityForResult(new Intent("android.intent.action.ACTION_SHOW_NOTICE_ECM_BLOCK_OTHERS", null), 1);
            return true;
        }
        if (preference == mUsbSharing)
        {
            if (mUsbSharing.isChecked())
            {
                mConnectivityManager.setUsbInternet(true);
                startFragment(this, com/mediatek/wireless/UsbSharingInfo.getName(), 0, null, 0x7f0b016c);
            } else
            {
                mConnectivityManager.setUsbInternet(false);
            }
            return true;
        }
        if (preference == mNfcPreference)
            ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/nfc/NfcSettings.getName(), null, 0, null, null, 0);
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        mAirplaneModeEnabler.resume();
        if (mNfcEnabler != null)
            mNfcEnabler.resume();
        if (mNsdEnabler != null)
            mNsdEnabler.resume();
        TelephonyManager telephonymanager = (TelephonyManager)getSystemService("phone");
        telephonymanager.listen(mPhoneStateListener, 32);
        Xlog.d("WirelessSettings", (new StringBuilder()).append("onResume(), call state=").append(telephonymanager.getCallState()).toString());
        if (telephonymanager.getCallState() != 0)
            mNetworkSettingsPreference.setEnabled(false);
        else
            mNetworkSettingsPreference.setEnabled(true);
        getActivity().registerReceiver(mReceiver, mIntentFilter);
    }





/*
    static ITelephony access$302(WirelessSettings wirelesssettings, ITelephony itelephony)
    {
        wirelesssettings.mTelephony = itelephony;
        return itelephony;
    }

*/

}
