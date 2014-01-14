// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.os.*;
import android.preference.*;
import android.util.Log;
import android.widget.Toast;
import com.android.internal.app.PlatLogoActivity;
import com.mediatek.settings.ext.IDeviceInfoSettingsExt;
import java.io.*;
import java.util.List;
import java.util.regex.Pattern;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, Utils

public class DeviceInfoSettings extends SettingsPreferenceFragment
{

    private static final String FILENAME_MSV = "/sys/board_properties/soc/msv";
    private static final String FILENAME_PROC_VERSION = "/proc/version";
    private static final String KEY_BASEBAND_VERSION = "baseband_version";
    private static final String KEY_BASEBAND_VERSION_2 = "baseband_version_2";
    private static final String KEY_BUILD_NUMBER = "build_number";
    private static final String KEY_CONTAINER = "container";
    private static final String KEY_CONTRIBUTORS = "contributors";
    private static final String KEY_COPYRIGHT = "copyright";
    private static final String KEY_DEVICE_MODEL = "device_model";
    private static final String KEY_DMSW_UPDATE = "software_update";
    private static final String KEY_EQUIPMENT_ID = "fcc_equipment_id";
    private static final String KEY_FIRMWARE_VERSION = "firmware_version";
    private static final String KEY_KERNEL_VERSION = "kernel_version";
    private static final String KEY_LICENSE = "license";
    private static final String KEY_MOTA_UPDATE_SETTINGS = "mota_system_update";
    private static final String KEY_REGULATORY_INFO = "regulatory_info";
    private static final String KEY_RGK_OTA_UPDATE_SETTINGS = "OTA_update_settings";
    private static final String KEY_SCOMO = "scomo";
    private static final String KEY_SELINUX_STATUS = "selinux_status";
    private static final String KEY_SOFTWARE_UPDATE = "more_software_updates";
    private static final String KEY_STATUS_INFO = "status_info";
    private static final String KEY_STATUS_INFO_GEMINI = "status_info_gemini";
    private static final String KEY_SYSTEM_UPDATE_SETTINGS = "system_update_settings";
    private static final String KEY_TEAM = "team";
    private static final String KEY_TERMS = "terms";
    private static final String KEY_UPDATE_SETTING = "additional_system_update_settings";
    private static final String LOG_TAG = "DeviceInfoSettings";
    private static final String OTA_PREFERENCE = "googleota";
    private static final String OTA_PRE_DOWNLOAND_PERCENT = "downloadpercent";
    private static final String OTA_PRE_VER = "version";
    private static final String PROPERTY_BUILD_VERSION_CUSTOM = "ro.custom.build.version";
    private static final String PROPERTY_EQUIPMENT_ID = "ro.ril.fccid";
    private static final String PROPERTY_SELINUX_STATUS = "ro.build.selinux";
    private static final String PROPERTY_URL_SAFETYLEGAL = "ro.url.safetylegal";
    static final int TAPS_TO_BE_A_DEVELOPER = 7;
    int mDevHitCountdown;
    Toast mDevHitToast;
    IDeviceInfoSettingsExt mExt;
    long mHits[];
    private Preference mPreference;
    private String mSummary;
    private String mSummaryF;

    public DeviceInfoSettings()
    {
        mSummary = null;
        mSummaryF = null;
        mHits = new long[3];
    }

    public static String formatKernelVersion(String s)
    {
        Pattern.compile("Linux version (\\S+) \\((\\S+?)\\) (?:\\(gcc.+? \\)) (#\\d+) (?:.*?)?((Sun|Mon|Tue|Wed|Thu|Fri|Sat).+)").matcher(s);
        return "DOOGEE info@doogee.cc";
    }

    private int getExternalModemSlot()
    {
        String s = SystemProperties.get("ril.external.md", getResources().getString(0x7f0b026c));
        int i;
        if (s.equals(getResources().getString(0x7f0b026c)))
            i = 0;
        else
            i = Integer.valueOf(s).intValue();
        Log.d("DeviceInfoSettings", (new StringBuilder()).append("modemSlot = ").append(i).toString());
        return i;
    }

    public static String getFormattedKernelVersion()
    {
        return readLine("/proc/version");
    }

    private String getMsvSuffix()
    {
label0:
        {
            if (Long.parseLong(readLine("/sys/board_properties/soc/msv"), 16) == 0L)
                return " (ENGINEERING)";
            break label0;
        }
        NumberFormatException numberformatexception;
        numberformatexception;
_L2:
        return "";
        IOException ioexception;
        ioexception;
        if (true) goto _L2; else goto _L1
_L1:
    }

    private static String readLine(String s)
        throws IOException
    {
        BufferedReader bufferedreader = new BufferedReader(new FileReader(s), 256);
        String s1 = bufferedreader.readLine();
        bufferedreader.close();
        return s1;
        Exception exception;
        exception;
        bufferedreader.close();
        throw exception;
    }

    private void removePreferenceIfBoolFalse(String s, int i)
    {
        if (!getResources().getBoolean(i))
        {
            Preference preference = findPreference(s);
            if (preference != null)
                getPreferenceScreen().removePreference(preference);
        }
    }

    private void removePreferenceIfPropertyMissing(PreferenceGroup preferencegroup, String s, String s1)
    {
        if (!SystemProperties.get(s1).equals(""))
            break MISSING_BLOCK_LABEL_22;
        preferencegroup.removePreference(findPreference(s));
        return;
        RuntimeException runtimeexception;
        runtimeexception;
        Log.d("DeviceInfoSettings", (new StringBuilder()).append("Property '").append(s1).append("' missing and no '").append(s).append("' preference").toString());
        return;
    }

    private void setStringSummary(String s, String s1)
    {
        try
        {
            findPreference(s).setSummary(s1);
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            findPreference(s).setSummary(getResources().getString(0x7f0b026c));
        }
    }

    private void setValueSummary(String s, String s1)
    {
        try
        {
            findPreference(s).setSummary(SystemProperties.get(s1, getResources().getString(0x7f0b026c)));
            return;
        }
        catch (RuntimeException runtimeexception)
        {
            return;
        }
    }

    private void softwareUpdatePreference()
    {
        Log.i("DeviceInfoSettings", "softwareUpdatePreferenceFeatureOption.MTK_SYSTEM_UPDATE_SUPPORT=true FeatureOption.MTK_FOTA_ENTRY=false FeatureOption.MTK_SCOMO_ENTRY=false");
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (preferencescreen.findPreference("mota_system_update") != null)
        {
            if (preferencescreen.findPreference("system_update_settings") == null)
            {
                Log.i("DeviceInfoSettings", "Remove software updates item as no item available");
                preferencescreen.removePreference(findPreference("more_software_updates"));
            } else
            {
                if (preferencescreen.findPreference("software_update") != null)
                {
                    Log.i("DeviceInfoSettings", "Remove fota");
                    preferencescreen.removePreference(findPreference("software_update"));
                }
                if (preferencescreen.findPreference("scomo") != null)
                {
                    Log.i("DeviceInfoSettings", "Remove scomo");
                    preferencescreen.removePreference(findPreference("scomo"));
                }
                if (preferencescreen.findPreference("system_update_settings") != null)
                {
                    Log.i("DeviceInfoSettings", "Remove GMS");
                    preferencescreen.removePreference(findPreference("system_update_settings"));
                    return;
                }
            }
            return;
        } else
        {
            Log.i("DeviceInfoSettings", "Remove software updates item");
            preferencescreen.removePreference(findPreference("more_software_updates"));
            return;
        }
    }

    private void updateBasebandTitle()
    {
        String s = getString(0x7f0b0541);
        String s1 = getString(0x7f0b009f);
        String s2 = (new StringBuilder()).append(s).append(s1.replace(getString(0x7f0b054c), " ")).toString();
        String s3 = getString(0x7f0b00a1);
        String s4 = (new StringBuilder()).append(s).append(s3.replace(getString(0x7f0b054c), " ")).toString();
        findPreference("baseband_version").setTitle(s2);
        findPreference("baseband_version_2").setTitle(s4);
    }

    private boolean updatePreferenceToSpecificActivity(Context context, PreferenceGroup preferencegroup, String s)
    {
        Preference preference = preferencegroup.findPreference(s);
        if (preference == null)
            return false;
        Intent intent = preference.getIntent();
        if (intent != null)
        {
            PackageManager packagemanager = context.getPackageManager();
            Log.i("GoogleOta", (new StringBuilder()).append("DeviceInfoSettings:intent.getAction() = ").append(intent.getAction()).toString());
            List list = packagemanager.queryIntentActivities(intent, 0);
            int i = list.size();
            Log.i("GoogleOta", (new StringBuilder()).append("DeviceInfoSettings:listSize = ").append(i).toString());
            for (int j = 0; j < i;)
            {
                ResolveInfo resolveinfo = (ResolveInfo)list.get(j);
                Log.i("GoogleOta", (new StringBuilder()).append("DeviceInfoSettings:updatePreferenceToSpecificActivity, resolveInfo.activityInfo.packageName = ").append(((PackageItemInfo) (resolveinfo.activityInfo)).packageName).toString());
                boolean flag = resolveinfo.activityInfo.name.equals("com.mediatek.systemupdate.MainEntry");
                Log.i("GoogleOta", (new StringBuilder()).append("DeviceInfoSettings:is = ").append(flag).toString());
                if (!flag)
                {
                    j++;
                } else
                {
                    preference.setIntent((new Intent()).setClassName(((PackageItemInfo) (resolveinfo.activityInfo)).packageName, resolveinfo.activityInfo.name));
                    preference.setTitle(resolveinfo.loadLabel(packagemanager));
                    return true;
                }
            }

        }
        preferencegroup.removePreference(preference);
        return false;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050011);
        mExt = Utils.getDeviceInfoSettingsPlugin(getActivity());
        setStringSummary("firmware_version", android.os.Build.VERSION.RELEASE);
        findPreference("firmware_version").setEnabled(true);
        Log.d("DeviceInfoSettings", (new StringBuilder()).append("baseversion=").append("gsm.version.baseband").toString());
        setValueSummary("baseband_version", "gsm.version.baseband");
        getPreferenceScreen().removePreference(findPreference("baseband_version_2"));
        setStringSummary("device_model", (new StringBuilder()).append(Build.MODEL).append(getMsvSuffix()).toString());
        setValueSummary("fcc_equipment_id", "ro.ril.fccid");
        setStringSummary("device_model", Build.MODEL);
        setStringSummary("build_number", Build.DISPLAY);
        findPreference("build_number").setEnabled(true);
        findPreference("kernel_version").setSummary(getFormattedKernelVersion());
        if (!SELinux.isSELinuxEnabled())
            setStringSummary("selinux_status", getResources().getString(0x7f0b0907));
        else
        if (!SELinux.isSELinuxEnforced())
            setStringSummary("selinux_status", getResources().getString(0x7f0b0908));
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "selinux_status", "ro.build.selinux");
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "safetylegal", "ro.url.safetylegal");
        removePreferenceIfPropertyMissing(getPreferenceScreen(), "fcc_equipment_id", "ro.ril.fccid");
        getPreferenceScreen().removePreference(findPreference("OTA_update_settings"));
        if (Utils.isWifiOnly(getActivity()))
            getPreferenceScreen().removePreference(findPreference("baseband_version"));
        Activity activity = getActivity();
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("container");
        Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencegroup, "terms", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencegroup, "license", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencegroup, "copyright", 1);
        Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencegroup, "team", 1);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        Log.i("GoogleOta", "DeviceInfoSettings:Start");
        Preference preference = preferencescreen.findPreference("mota_system_update");
        if (preference != null)
            preferencescreen.removePreference(preference);
        removePreference("system_update_settings");
        Log.i("GoogleOta", (new StringBuilder()).append("DeviceInfoSettings:Stop, hasSpecial = ").append(false).toString());
        if (UserHandle.myUserId() == 0)
            Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencescreen, "system_update_settings", 1);
        else
            removePreference("system_update_settings");
        Utils.updatePreferenceToSpecificActivityOrRemove(activity, preferencescreen, "contributors", 1);
        removePreferenceIfBoolFalse("additional_system_update_settings", 0x7f090003);
        removePreferenceIfBoolFalse("regulatory_info", 0x7f090005);
        Preference preference1 = findPreference("scomo");
        if (preference1 != null)
            getPreferenceScreen().removePreference(preference1);
        preferencescreen.removePreference(findPreference("status_info"));
        mExt.initSummary(findPreference("status_info_gemini"));
        preferencescreen.removePreference(findPreference("software_update"));
        softwareUpdatePreference();
    }

    public void onDestroy()
    {
        super.onDestroy();
        Log.i("GoogleOta", "DeviceInfoSettings:onDestroy");
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (!preference.getKey().equals("firmware_version")) goto _L2; else goto _L1
_L1:
        System.arraycopy(mHits, 1, mHits, 0, -1 + mHits.length);
        mHits[-1 + mHits.length] = SystemClock.uptimeMillis();
        if (mHits[0] >= SystemClock.uptimeMillis() - 500L)
        {
            Intent intent2 = new Intent("android.intent.action.MAIN");
            intent2.setClassName("android", com/android/internal/app/PlatLogoActivity.getName());
            Intent intent1;
            try
            {
                startActivity(intent2);
            }
            catch (Exception exception)
            {
                Log.e("DeviceInfoSettings", (new StringBuilder()).append("Unable to start activity ").append(intent2.toString()).toString());
            }
        }
_L4:
        if (preference.getKey().equals("OTA_update_settings"))
        {
            intent1 = new Intent("android.intent.action.MAIN");
            intent1.setClassName("com.android.ota", "com.android.ota.UpdateSystem");
            startActivity(intent1);
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
_L2:
        if (preference.getKey().equals("build_number"))
        {
            if (mDevHitCountdown > 0)
            {
                mDevHitCountdown = -1 + mDevHitCountdown;
                if (mDevHitCountdown == 0)
                {
                    getActivity().getSharedPreferences("development", 0).edit().putBoolean("show", true).apply();
                    if (mDevHitToast != null)
                        mDevHitToast.cancel();
                    mDevHitToast = Toast.makeText(getActivity(), 0x7f0b026d, 1);
                    mDevHitToast.show();
                } else
                if (mDevHitCountdown > 0 && mDevHitCountdown < 5)
                {
                    if (mDevHitToast != null)
                        mDevHitToast.cancel();
                    Activity activity = getActivity();
                    Resources resources = getResources();
                    int i = mDevHitCountdown;
                    Object aobj[] = new Object[1];
                    aobj[0] = Integer.valueOf(mDevHitCountdown);
                    mDevHitToast = Toast.makeText(activity, resources.getQuantityString(0x7f0e0000, i, aobj), 0);
                    mDevHitToast.show();
                }
            } else
            if (mDevHitCountdown < 0)
            {
                if (mDevHitToast != null)
                    mDevHitToast.cancel();
                mDevHitToast = Toast.makeText(getActivity(), 0x7f0b026e, 1);
                mDevHitToast.show();
            }
        } else
        if (preference.getKey().equals("software_update"))
        {
            Intent intent = new Intent();
            intent.setAction("com.mediatek.DMSWUPDATE");
            getActivity().sendBroadcast(intent);
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public void onResume()
    {
        super.onResume();
        getPreferenceScreen();
        int i;
        if (getActivity().getSharedPreferences("development", 0).getBoolean("show", Build.TYPE.equals("eng")))
            i = -1;
        else
            i = 7;
        mDevHitCountdown = i;
        mDevHitToast = null;
    }
}
