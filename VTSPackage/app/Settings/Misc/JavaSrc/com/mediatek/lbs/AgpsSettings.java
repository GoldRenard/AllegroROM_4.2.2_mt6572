// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.app.Activity;
import android.app.Dialog;
import android.content.*;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.preference.*;
import android.telephony.TelephonyManager;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.common.agps.*;
import com.mediatek.telephony.TelephonyManagerEx;
import com.mediatek.xlog.Xlog;
import java.util.*;

public class AgpsSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final int ABOUT_AGPS_DIALOG_ID = 0;
    private static final String DISABLE_ON_REBOOT = "disable_agps_on_reboot";
    private static final String KEY_ABOUT_AGPS = "about_agps";
    public static final String KEY_AGPS_SHARE = "agps_share";
    private static final String KEY_MOBILE_DATACONN = "mobile_dataConn";
    private static final String KEY_OPERATOR_CODE = "saved_operator_code";
    private static final String KEY_PORT = "port";
    private static final String KEY_SELECT_PROFILE = "select_profile";
    private static final String KEY_SLP_ADDRESS = "slp_address";
    private static final String KEY_TLS = "tls";
    private static final String NETWORK_INITIATE = "Network_Initiate";
    private static final String NETWORK_USED = "Network_Used";
    private static final int ROAMING_ALERT_DIALOG_ID = 1;
    public static final String SIM_STATUS = "sim_status";
    private static final String XLOGTAG = "Settings/Agps";
    private Preference mAboutPref;
    private MtkAgpsManager mAgpsMgr;
    private MtkAgpsProfileManager mAgpsProfileManager;
    private ConnectivityManager mConnMgr;
    private String mDataConnItemSummary;
    private String mDataConnItemTitle;
    private BroadcastReceiver mDataConnReceiver;
    private MtkAgpsProfile mDefaultProfile;
    private CheckBoxPreference mDisableOnRebootCB;
    private CheckBoxPreference mNetworkInitiateCB;
    private Preference mNetworkPref;
    private ListPreference mNetworkUsedListPref;
    private String mOperatorCode;
    private EditTextPreference mPortET;
    private EditTextPreference mSLPAddressET;
    private ListPreference mSelectProfileListPref;
    private CheckBoxPreference mTLSCB;
    private TelephonyManagerEx mTelMgrEx;
    private TelephonyManager mTelephonyMgr;
    private WifiManager mWifiMgr;

    public AgpsSettings()
    {
        mDataConnReceiver = new BroadcastReceiver() {

            final AgpsSettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                updateDataConnStatus();
                initSlpProfileList();
                log((new StringBuilder()).append("mDataConnReceiver ").append(mAgpsMgr.getProfile().code).append(" ").append(mAgpsMgr.getProfile().name).toString());
                updateSlpProfile(mAgpsMgr.getProfile());
            }

            
            {
                this$0 = AgpsSettings.this;
                super();
            }
        }
;
    }

    private boolean getMobileConnectionInfo(boolean flag, int i)
    {
        if (flag)
        {
            mOperatorCode = mTelMgrEx.getSimOperator(i);
            if (mTelMgrEx.getDataState(i) == 2)
            {
                Object aobj[] = new Object[1];
                aobj[0] = Integer.valueOf(i + 1);
                mDataConnItemTitle = getString(0x7f0b006d, aobj);
                mDataConnItemSummary = getString(0x7f0b006c);
                return true;
            }
        } else
        {
            mOperatorCode = mTelephonyMgr.getSimOperator();
            if (mTelephonyMgr.getDataState() == 2)
            {
                mDataConnItemTitle = getString(0x7f0b006d, new Object[] {
                    ""
                });
                mDataConnItemSummary = getString(0x7f0b006c);
                return true;
            }
        }
        return false;
    }

    private void initPreference()
    {
        mDisableOnRebootCB = (CheckBoxPreference)findPreference("disable_agps_on_reboot");
        SharedPreferences sharedpreferences = getActivity().getSharedPreferences("agps_disable", 0);
        boolean flag = sharedpreferences.getBoolean("changed", false);
        boolean flag1 = false;
        if (flag)
            flag1 = sharedpreferences.getBoolean("status", false);
        mDisableOnRebootCB.setChecked(flag1);
        mNetworkInitiateCB = (CheckBoxPreference)findPreference("Network_Initiate");
        mNetworkUsedListPref = (ListPreference)findPreference("Network_Used");
        mNetworkUsedListPref.setOnPreferenceChangeListener(this);
        mSLPAddressET = (EditTextPreference)findPreference("slp_address");
        mSLPAddressET.setEnabled(false);
        mPortET = (EditTextPreference)findPreference("port");
        mPortET.setEnabled(false);
        mTLSCB = (CheckBoxPreference)findPreference("tls");
        mTLSCB.setEnabled(false);
        mNetworkPref = findPreference("mobile_dataConn");
        mAboutPref = findPreference("about_agps");
        mSelectProfileListPref = (ListPreference)findPreference("select_profile");
        mSelectProfileListPref.setOnPreferenceChangeListener(this);
    }

    private void initSlpProfileList()
    {
        SharedPreferences sharedpreferences = getActivity().getSharedPreferences("omacp_profile", 0);
        if (sharedpreferences.getBoolean("changed", false))
        {
            MtkAgpsProfile mtkagpsprofile4 = new MtkAgpsProfile();
            mtkagpsprofile4.name = sharedpreferences.getString("name", null);
            mtkagpsprofile4.addr = sharedpreferences.getString("addr", null);
            mtkagpsprofile4.backupSlpNameVar = sharedpreferences.getString("backupSlpNameVar", null);
            mtkagpsprofile4.port = sharedpreferences.getInt("port", 0);
            mtkagpsprofile4.tls = sharedpreferences.getInt("tls", 0);
            mtkagpsprofile4.showType = sharedpreferences.getInt("showType", 0);
            mtkagpsprofile4.code = sharedpreferences.getString("code", null);
            mtkagpsprofile4.addrType = sharedpreferences.getString("addrType", null);
            mtkagpsprofile4.defaultApn = sharedpreferences.getString("defaultApn", null);
            mtkagpsprofile4.providerId = sharedpreferences.getString("providerId", null);
            mAgpsProfileManager.insertProfile(mtkagpsprofile4);
        }
        log((new StringBuilder()).append("opeator code ").append(mOperatorCode).toString());
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mAgpsProfileManager.getAllProfile().iterator();
        do
        {
            if (!iterator.hasNext())
                break;
            MtkAgpsProfile mtkagpsprofile3 = (MtkAgpsProfile)iterator.next();
            if (mtkagpsprofile3.code.equals(mAgpsProfileManager.getDefaultProfile().code))
            {
                log((new StringBuilder()).append("default profile code").append(mtkagpsprofile3.code).toString());
                arraylist.add(mtkagpsprofile3);
            } else
            if (mtkagpsprofile3.showType == 0)
            {
                log((new StringBuilder()).append("showType == 0 profile code").append(mtkagpsprofile3.code).toString());
                arraylist.add(mtkagpsprofile3);
            } else
            if (mtkagpsprofile3.showType == 2 && mtkagpsprofile3.code.equals(mOperatorCode))
            {
                log((new StringBuilder()).append("showType == 2 profile code").append(mtkagpsprofile3.code).toString());
                arraylist.add(mtkagpsprofile3);
            }
        } while (true);
        String as[] = new String[arraylist.size()];
        String as1[] = new String[arraylist.size()];
        int i = 0;
        for (Iterator iterator1 = arraylist.iterator(); iterator1.hasNext();)
        {
            MtkAgpsProfile mtkagpsprofile2 = (MtkAgpsProfile)iterator1.next();
            as[i] = mtkagpsprofile2.name;
            as1[i] = mtkagpsprofile2.code;
            i++;
        }

        mSelectProfileListPref.setEntries(as);
        mSelectProfileListPref.setEntryValues(as1);
        MtkAgpsProfile mtkagpsprofile = mAgpsMgr.getProfile();
        log((new StringBuilder()).append("select profile code").append(mtkagpsprofile.code).toString());
        Iterator iterator2 = arraylist.iterator();
        boolean flag1;
        do
        {
            boolean flag = iterator2.hasNext();
            flag1 = false;
            if (!flag)
                break;
            MtkAgpsProfile mtkagpsprofile1 = (MtkAgpsProfile)iterator2.next();
            if (!mtkagpsprofile.code.equals(mtkagpsprofile1.code))
                continue;
            flag1 = true;
            break;
        } while (true);
        if (!flag1)
        {
            log((new StringBuilder()).append("set current profile code").append(mDefaultProfile.code).toString());
            mAgpsMgr.setProfile(mDefaultProfile);
        }
    }

    private boolean isMobileDataEnabled(int i)
    {
        boolean flag = mConnMgr.getMobileDataEnabledGemini(i);
        Xlog.d("Settings/Agps", (new StringBuilder()).append("isMoblieDataEnabled for slotId ").append(i).append(" ").append(flag).toString());
        return flag;
    }

    private void log(String s)
    {
        Xlog.d("Settings/Agps", (new StringBuilder()).append("[AGPS Setting] ").append(s).toString());
    }

    private void updateDataConnStatus()
    {
        int i = -1;
        mDataConnItemTitle = getString(0x7f0b0069);
        mDataConnItemSummary = getString(0x7f0b006a);
        int j = -1;
        NetworkInfo networkinfo = mConnMgr.getActiveNetworkInfo();
        if (networkinfo != null)
            j = networkinfo.getType();
        else
            log("WARNING: no active network");
        log("updateDataConnStatus");
        mOperatorCode = null;
        if (j == 0)
        {
            Iterator iterator = android.provider.Telephony.SIMInfo.getInsertedSIMList(getActivity()).iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                android.provider.Telephony.SIMInfo siminfo = (android.provider.Telephony.SIMInfo)iterator.next();
                if (!isMobileDataEnabled(siminfo.mSlot))
                    continue;
                i = siminfo.mSlot;
                break;
            } while (true);
            Xlog.d("Settings/Agps", (new StringBuilder()).append("under Gemini supoort sim1Satus=").append(i).toString());
            getMobileConnectionInfo(true, i);
        } else
        if (j == 1 && mWifiMgr != null && networkinfo != null && networkinfo.isConnected() && networkinfo.isAvailable())
        {
            mDataConnItemTitle = getString(0x7f0b006b);
            mDataConnItemSummary = getString(0x7f0b006c);
        }
        mNetworkPref.setTitle(mDataConnItemTitle);
        mNetworkPref.setSummary(mDataConnItemSummary);
    }

    private void updatePage()
    {
        if (mAgpsMgr.getRoamingStatus())
        {
            mNetworkUsedListPref.setSummary(0x7f0b0067);
            mNetworkUsedListPref.setValueIndex(1);
        } else
        {
            mNetworkUsedListPref.setSummary(0x7f0b0068);
            mNetworkUsedListPref.setValueIndex(0);
        }
        log((new StringBuilder()).append("updatePage ").append(mAgpsMgr.getProfile().name).toString());
        updateSlpProfile(mAgpsMgr.getProfile());
        mNetworkInitiateCB.setChecked(mAgpsMgr.getNiStatus());
    }

    private void updateSlpProfile(MtkAgpsProfile mtkagpsprofile)
    {
        boolean flag = true;
        mSelectProfileListPref.setValue(mtkagpsprofile.code);
        mSelectProfileListPref.setSummary(mtkagpsprofile.name);
        mSLPAddressET.setText(mtkagpsprofile.addr);
        mSLPAddressET.setSummary(mtkagpsprofile.addr);
        mPortET.setText(String.valueOf(mtkagpsprofile.port));
        mPortET.setSummary(String.valueOf(mtkagpsprofile.port));
        CheckBoxPreference checkboxpreference = mTLSCB;
        if (flag != mtkagpsprofile.tls)
            flag = false;
        checkboxpreference.setChecked(flag);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        log("onCreate");
        mAgpsProfileManager = new MtkAgpsProfileManager();
        mAgpsProfileManager.updateAgpsProfile("/etc/agps_profiles_conf.xml");
        mDefaultProfile = mAgpsProfileManager.getDefaultProfile();
        mAgpsMgr = (MtkAgpsManager)getSystemService("mtk-agps");
        mConnMgr = (ConnectivityManager)getSystemService("connectivity");
        mWifiMgr = (WifiManager)getActivity().getApplicationContext().getSystemService("wifi");
        mTelephonyMgr = (TelephonyManager)getSystemService("phone");
        mTelMgrEx = TelephonyManagerEx.getDefault();
        if (mAgpsMgr != null && mConnMgr != null && mWifiMgr != null && mTelephonyMgr != null)
        {
            addPreferencesFromResource(0x7f050004);
            initPreference();
            return;
        } else
        {
            log((new StringBuilder()).append("ERR: getSystemService failed mAgpsMgr=").append(mAgpsMgr).append(" mConnMgr=").append(mConnMgr).append(" mWifiMgr=").append(mWifiMgr).append(" mTelephonyMgr=").append(mTelephonyMgr).toString());
            return;
        }
    }

    public Dialog onCreateDialog(int i)
    {
        if (i == 0)
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b005a).setIcon(0x108009b).setMessage(0x7f0b005b).setPositiveButton(0x7f0b0020, null).create();
        if (i == 1)
        {
            android.app.AlertDialog alertdialog = (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b006e).setIcon(0x1080027).setMessage(0x7f0b006f).setPositiveButton(0x7f0b0020, new android.content.DialogInterface.OnClickListener() {

                final AgpsSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsMgr.setRoamingEnable(true);
                    updatePage();
                }

            
            {
                this$0 = AgpsSettings.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0044, new android.content.DialogInterface.OnClickListener() {

                final AgpsSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    updatePage();
                }

            
            {
                this$0 = AgpsSettings.this;
                super();
            }
            }
).create();
            updatePage();
            return alertdialog;
        } else
        {
            log("WARNING: onCreateDialog unknown id recv");
            return null;
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
        log("^_^ onDestroy");
    }

    public void onPause()
    {
        super.onPause();
        log("^_^ onPause");
        android.content.SharedPreferences.Editor editor = getActivity().getSharedPreferences("agps_operator", 0).edit();
        log((new StringBuilder()).append("save mOperatorCode to sharedpreference ").append(mOperatorCode).toString());
        editor.putString("saved_operator_code", mOperatorCode);
        editor.commit();
        getActivity().unregisterReceiver(mDataConnReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if ("select_profile".equals(s))
        {
            String s1 = obj.toString();
            log((new StringBuilder()).append("onPreferenceChange ").append(s1).toString());
            MtkAgpsProfile mtkagpsprofile = new MtkAgpsProfile();
            Iterator iterator = mAgpsProfileManager.getAllProfile().iterator();
            do
            {
                if (!iterator.hasNext())
                    break;
                MtkAgpsProfile mtkagpsprofile1 = (MtkAgpsProfile)iterator.next();
                if (!mtkagpsprofile1.code.equals(s1))
                    continue;
                mtkagpsprofile = mtkagpsprofile1;
                break;
            } while (true);
            updateSlpProfile(mtkagpsprofile);
            log("onPreferenceChange set profile to mAgpsMgr");
            mAgpsMgr.setProfile(mtkagpsprofile);
        } else
        if (mNetworkUsedListPref.getKey().equals(s))
        {
            int i = mNetworkUsedListPref.findIndexOfValue(obj.toString());
            if (i == 0)
            {
                mAgpsMgr.setRoamingEnable(false);
                updatePage();
                return true;
            }
            if (i == 1 && !mAgpsMgr.getRoamingStatus())
            {
                showDialog(1);
                return true;
            }
        }
        return true;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        super.onPreferenceTreeClick(preferencescreen, preference);
        if (preference.getKey().equals("Network_Initiate"))
        {
            CheckBoxPreference checkboxpreference = (CheckBoxPreference)preference;
            mAgpsMgr.setNiEnable(checkboxpreference.isChecked());
        } else
        {
            if (preference.getKey().equals("disable_agps_on_reboot"))
            {
                Intent intent = new Intent("com.mediatek.agps.DISABLE_UPDATED");
                intent.putExtra("status", mDisableOnRebootCB.isChecked());
                getActivity().sendBroadcast(intent);
                return false;
            }
            if (mAboutPref != null && mAboutPref.getKey().equals(preference.getKey()))
            {
                showDialog(0);
                return false;
            }
        }
        return false;
    }

    public void onResume()
    {
        super.onResume();
        log("onResume");
        IntentFilter intentfilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
        getActivity().registerReceiver(mDataConnReceiver, intentfilter);
        mOperatorCode = getActivity().getSharedPreferences("agps_operator", 0).getString("saved_operator_code", null);
        log((new StringBuilder()).append("restored mOperatorCode ").append(mOperatorCode).toString());
        updateDataConnStatus();
        initSlpProfileList();
        updatePage();
    }






}
