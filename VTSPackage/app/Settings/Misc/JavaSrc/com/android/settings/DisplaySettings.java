// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.*;
import android.app.admin.DevicePolicyManager;
import android.content.*;
import android.content.pm.*;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.ContentObserver;
import android.hardware.display.DisplayManager;
import android.hardware.display.WifiDisplayStatus;
import android.os.*;
import android.preference.*;
import android.util.Log;
import android.widget.ListView;
import com.android.internal.view.RotationPolicy;
import com.mediatek.common.policy.IKeyguardLayer;
import com.mediatek.pluginmanager.Plugin;
import com.mediatek.pluginmanager.PluginManager;
import com.mediatek.settings.ext.ISettingsMiscExt;
import com.mediatek.thememanager.ThemeManager;
import com.mediatek.xlog.Xlog;
import java.util.*;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment, DreamSettings, WarnedListPreference, Utils

public class DisplaySettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener, android.preference.Preference.OnPreferenceClickListener
{

    private static final String CONTACT_STRING = "&";
    public static final String CURRENT_KEYGURAD_LAYER_KEY = "mtk_current_keyguard_layer";
    private static final String DATA_STORE_NONE = "none";
    private static final int DEFAULT_LOCK_SCREEN_NOTIFICATIONS = 1;
    private static final String DISPLAY_DEFAULT = "display_default";
    private static final String DISPLAY_PERSONALIZE = "display_personalize";
    private static final int DLG_GLOBAL_CHANGE_WARNING = 1;
    private static final int FALLBACK_SCREEN_TIMEOUT_VALUE = 30000;
    private static final String INCOMING_INDICATOR_ON_LOCKSCREEN = "incoming_indicator_on_lockscreen";
    private static final String KEY_ACCELEROMETER = "accelerometer";
    private static final String KEY_COLOR = "color";
    private static final String KEY_FONT_SIZE = "font_size";
    private static final String KEY_HDMI_SETTINGS = "hdmi_settings";
    private static final String KEY_LANDSCAPE_LAUNCHER = "landscape_launcher";
    private static final String KEY_LOCK_SCREEN_NOTIFICATIONS = "lock_screen_notifications";
    private static final String KEY_LOCK_SCREEN_STYLE = "lock_screen_style";
    private static final String KEY_NOTIFICATION_PULSE = "notification_pulse";
    private static final String KEY_SCENES = "scenes";
    private static final String KEY_SCREEN_SAVER = "screensaver";
    private static final String KEY_SCREEN_TIMEOUT = "screen_timeout";
    private static final String KEY_TV_OUT = "tvout_settings";
    private static final String KEY_WALLPAPER = "wallpaper";
    private static final String KEY_WIFI_DISPLAY = "wifi_display";
    private static final String LOCK_SCREEN_STYLE_INTENT_NAME = "com.mediatek.lockscreensettings.LockScreenStyleSettings";
    private static final String LOCK_SCREEN_STYLE_INTENT_PACKAGE = "com.android.settings";
    private static final int PARSER_STRING_LENGTH_ONE = 1;
    private static final int PARSER_STRING_LENGTH_TWO = 2;
    private static final int PARSER_STRING_LENGTH_ZERO = 0;
    private static final String TAG = "DisplaySettings";
    private CheckBoxPreference mAccelerometer;
    Preference mColorPref;
    private final Configuration mCurConfig = new Configuration();
    private PreferenceCategory mDisplayDefCategory;
    private DisplayManager mDisplayManager;
    private PreferenceCategory mDisplayPerCategory;
    private ISettingsMiscExt mExt;
    private WarnedListPreference mFontSizePref;
    private Preference mHDMISettings;
    private boolean mIsUpdateFont;
    private ListPreference mLandscapeLauncher;
    private CheckBoxPreference mLockScreenNotifications;
    private Preference mLockScreenStylePref;
    private CheckBoxPreference mNotificationPulse;
    private BroadcastReceiver mPackageReceiver;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {

        final DisplaySettings this$0;

        public void onReceive(Context context, Intent intent)
        {
            if (intent.getAction().equals("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"))
            {
                mWifiDisplayStatus = (WifiDisplayStatus)intent.getParcelableExtra("android.hardware.display.extra.WIFI_DISPLAY_STATUS");
                updateWifiDisplaySummary();
            }
        }

            
            {
                this$0 = DisplaySettings.this;
                super();
            }
    }
;
    private final com.android.internal.view.RotationPolicy.RotationPolicyListener mRotationPolicyListener = new com.android.internal.view.RotationPolicy.RotationPolicyListener() {

        final DisplaySettings this$0;

        public void onChange()
        {
            updateAccelerometerRotationCheckbox();
        }

            
            {
                this$0 = DisplaySettings.this;
                super();
            }
    }
;
    Preference mScencePref;
    private Preference mScreenSaverPreference;
    private ContentObserver mScreenTimeoutObserver;
    private ListPreference mScreenTimeoutPreference;
    private Preference mTVOut;
    Preference mWallpaperPref;
    private Preference mWifiDisplayPreference;
    private WifiDisplayStatus mWifiDisplayStatus;

    public DisplaySettings()
    {
        mScreenTimeoutObserver = new ContentObserver(new Handler()) {

            final DisplaySettings this$0;

            public void onChange(boolean flag)
            {
                Xlog.d("DisplaySettings", "mScreenTimeoutObserver omChanged");
                int i = android.provider.Settings.System.getInt(getContentResolver(), "screen_off_timeout", 30000);
                updateTimeoutPreference(i);
            }

            
            {
                this$0 = DisplaySettings.this;
                super(handler);
            }
        }
;
        mPackageReceiver = new BroadcastReceiver() {

            final DisplaySettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                Xlog.d("DisplaySettings", "package changed, update list");
                updateLandscapeList();
                updateLockScreenStyle();
            }

            
            {
                this$0 = DisplaySettings.this;
                super();
            }
        }
;
    }

    private void disableUnusableTimeouts(ListPreference listpreference)
    {
        DevicePolicyManager devicepolicymanager = (DevicePolicyManager)getActivity().getSystemService("device_policy");
        long l;
        if (devicepolicymanager != null)
            l = devicepolicymanager.getMaximumTimeToLock(null);
        else
            l = 0L;
        if (l == 0L)
            return;
        CharSequence acharsequence[] = listpreference.getEntries();
        CharSequence acharsequence1[] = listpreference.getEntryValues();
        ArrayList arraylist = new ArrayList();
        ArrayList arraylist1 = new ArrayList();
        for (int i = 0; i < acharsequence1.length; i++)
            if (Long.parseLong(acharsequence1[i].toString()) <= l)
            {
                arraylist.add(acharsequence[i]);
                arraylist1.add(acharsequence1[i]);
            }

        if (arraylist.size() != acharsequence.length || arraylist1.size() != acharsequence1.length)
        {
            listpreference.setEntries((CharSequence[])arraylist.toArray(new CharSequence[arraylist.size()]));
            listpreference.setEntryValues((CharSequence[])arraylist1.toArray(new CharSequence[arraylist1.size()]));
            int j = Integer.parseInt(listpreference.getValue());
            if ((long)j <= l)
                listpreference.setValue(String.valueOf(j));
        }
        boolean flag;
        if (arraylist.size() > 0)
            flag = true;
        else
            flag = false;
        listpreference.setEnabled(flag);
    }

    private int getTimoutValue()
    {
        int i = android.provider.Settings.System.getInt(getActivity().getContentResolver(), "screen_off_timeout", 30000);
        Xlog.d("DisplaySettings", (new StringBuilder()).append("getTimoutValue()---currentValue=").append(i).toString());
        int j = 0;
        CharSequence acharsequence[] = mScreenTimeoutPreference.getEntryValues();
        for (int k = 0; k < acharsequence.length; k++)
        {
            int l = Integer.parseInt(acharsequence[k].toString());
            if (i == l)
                return i;
            if (i > l)
                j = k;
        }

        Xlog.d("DisplaySettings", (new StringBuilder()).append("getTimoutValue()---bestMatch=").append(j).toString());
        return Integer.parseInt(acharsequence[j].toString());
    }

    private boolean queryPluginKeyguardLayers()
    {
        PluginManager pluginmanager;
        int i;
        int j;
        com.mediatek.common.policy.KeyguardLayerInfo keyguardlayerinfo;
        try
        {
            pluginmanager = PluginManager.create(getActivity(), com/mediatek/common/policy/IKeyguardLayer.getName(), new Signature[0]);
            i = pluginmanager.getPluginCount();
            Xlog.d("DisplaySettings", (new StringBuilder()).append("getKeyguardLayers: pluginCount = ").append(i).toString());
        }
        catch (Exception exception)
        {
            Xlog.e("DisplaySettings", (new StringBuilder()).append("getPluginKeyguardLayers exception happens: e = ").append(exception.getMessage()).toString());
            return false;
        }
        if (i == 0) goto _L2; else goto _L1
_L1:
        j = 0;
_L3:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        IKeyguardLayer ikeyguardlayer = (IKeyguardLayer)pluginmanager.getPlugin(j).createObject();
        keyguardlayerinfo = ikeyguardlayer.getKeyguardLayerInfo();
        Xlog.d("DisplaySettings", (new StringBuilder()).append("getKeyguardLayers: i = ").append(j).append(",keyguardLayer = ").append(ikeyguardlayer).append(",info = ").append(keyguardlayerinfo).toString());
        if (keyguardlayerinfo != null)
            return true;
        j++;
        if (true) goto _L3; else goto _L2
_L2:
        return false;
    }

    private void updateAccelerometerRotationCheckbox()
    {
        if (getActivity() != null)
        {
            CheckBoxPreference checkboxpreference = mAccelerometer;
            boolean flag;
            if (!RotationPolicy.isRotationLocked(getActivity()))
                flag = true;
            else
                flag = false;
            checkboxpreference.setChecked(flag);
            if (mLandscapeLauncher != null)
                if (mAccelerometer.isChecked())
                {
                    mLandscapeLauncher.setEnabled(true);
                    return;
                } else
                {
                    mLandscapeLauncher.setEnabled(false);
                    return;
                }
        }
    }

    private void updateFontSize(ListPreference listpreference)
    {
        Xlog.d("DisplaySettings", "update font size ");
        CharSequence acharsequence[] = listpreference.getEntryValues();
        float f = android.provider.Settings.System.getFloat(getContentResolver(), "settings_fontsize_small", -1F);
        float f1 = android.provider.Settings.System.getFloat(getContentResolver(), "settings_fontsize_large", -1F);
        float f2 = android.provider.Settings.System.getFloat(getContentResolver(), "settings_fontsize_extralarge", -1F);
        Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size small = ").append(f).toString());
        Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size large = ").append(f1).toString());
        Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size extraLarge = ").append(f2).toString());
        if (f != -1F || f1 != -1F || f2 != -1F)
        {
            if (acharsequence[0] != null && f != -1F)
            {
                acharsequence[0] = (new StringBuilder()).append(f).append("").toString();
                Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size : ").append(acharsequence[0]).toString());
            }
            if (acharsequence[2] != null && f1 != -1F)
            {
                acharsequence[2] = (new StringBuilder()).append(f1).append("").toString();
                Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size : ").append(acharsequence[2]).toString());
            }
            if (acharsequence[3] != null && f2 != -1F)
            {
                acharsequence[3] = (new StringBuilder()).append(f2).append("").toString();
                Xlog.d("DisplaySettings", (new StringBuilder()).append("update font size : ").append(acharsequence[3]).toString());
            }
            if (acharsequence != null)
                listpreference.setEntryValues(acharsequence);
            mIsUpdateFont = true;
        }
    }

    private void updateLandscapeList()
    {
        Intent intent = new Intent("android.intent.action.ROTATED_MAIN");
        List list = getPackageManager().queryIntentActivities(intent, 0);
        if (list != null && list.size() != 0)
        {
            Xlog.d("DisplaySettings", (new StringBuilder()).append("mLandscapeLauncherApps.size()=").append(list.size()).toString());
            int i = list.size();
            if (mDisplayDefCategory != null && mLandscapeLauncher != null)
                mDisplayDefCategory.addPreference(mLandscapeLauncher);
            CharSequence acharsequence[] = new CharSequence[i + 1];
            CharSequence acharsequence1[] = new CharSequence[i + 1];
            acharsequence[0] = getString(0x7f0b00b5);
            acharsequence1[0] = "none";
            String s = android.provider.Settings.System.getString(getContentResolver(), "landscape_launcher");
            if (s == null)
            {
                android.provider.Settings.System.putString(getContentResolver(), "landscape_launcher", "none");
                s = "none";
            }
            int j = 1;
            int k = 0;
            if (list != null)
            {
                PackageManager packagemanager = getPackageManager();
                for (Iterator iterator = list.iterator(); iterator.hasNext();)
                {
                    ResolveInfo resolveinfo = (ResolveInfo)iterator.next();
                    Xlog.i("DisplaySettings", (new StringBuilder()).append("resolve app : ").append(((PackageItemInfo) (resolveinfo.activityInfo)).packageName).append(" ").append(resolveinfo.activityInfo.name).toString());
                    acharsequence[j] = resolveinfo.activityInfo.loadLabel(packagemanager);
                    acharsequence1[j] = (new StringBuilder()).append(((PackageItemInfo) (resolveinfo.activityInfo)).packageName).append("/").append(resolveinfo.activityInfo.name).toString();
                    if (s.equals(acharsequence1[j]))
                        k = j;
                    j++;
                }

            }
            if (k == 0 && !s.equals("none"))
                android.provider.Settings.System.putString(getContentResolver(), "landscape_launcher", "none");
            mLandscapeLauncher.setEntries(acharsequence);
            mLandscapeLauncher.setEntryValues(acharsequence1);
            mLandscapeLauncher.setValueIndex(k);
            mLandscapeLauncher.setSummary(acharsequence[k]);
            return;
        }
        Xlog.d("DisplaySettings", "landscape launcher query return null or size 0 ");
        if (mDisplayDefCategory != null && mLandscapeLauncher != null)
            mDisplayDefCategory.removePreference(mLandscapeLauncher);
        android.provider.Settings.System.putString(getContentResolver(), "landscape_launcher", "none");
    }

    private void updateLockScreenStyle()
    {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.android.settings", "com.mediatek.lockscreensettings.LockScreenStyleSettings"));
        List list = getPackageManager().queryIntentActivities(intent, 0);
        boolean flag = queryPluginKeyguardLayers();
        if (list != null && list.size() != 0 && flag)
        {
            Xlog.d("DisplaySettings", (new StringBuilder()).append("lockScreenStyleApps.size()=").append(list.size()).toString());
            if (mDisplayPerCategory != null && mLockScreenStylePref != null)
                mDisplayPerCategory.addPreference(mLockScreenStylePref);
            updateLockScreenStyleSummary();
        } else
        {
            Xlog.d("DisplaySettings", "lock screen style query return null or size 0 ");
            if (mDisplayPerCategory != null && mLockScreenStylePref != null)
            {
                mDisplayPerCategory.removePreference(mLockScreenStylePref);
                return;
            }
        }
    }

    private void updateLockScreenStyleSummary()
    {
        String s = parseString(android.provider.Settings.System.getString(getContentResolver(), "mtk_current_keyguard_layer"));
        if (s.equals(""))
        {
            Xlog.d("DisplaySettings", (new StringBuilder()).append("lockScreenStyleSummary = ").append(s).toString());
            mLockScreenStylePref.setSummary(0x7f0b00c3);
            return;
        } else
        {
            mLockScreenStylePref.setSummary(s);
            return;
        }
    }

    private void updateScreenSaverSummary()
    {
        if (mScreenSaverPreference != null)
            mScreenSaverPreference.setSummary(DreamSettings.getSummaryTextWithDreamName(getActivity()));
    }

    private void updateState()
    {
        updateAccelerometerRotationCheckbox();
        readFontSizePreference(mFontSizePref);
        updateScreenSaverSummary();
        updateWifiDisplaySummary();
    }

    private void updateTimeoutPreference(int i)
    {
        Xlog.d("DisplaySettings", (new StringBuilder()).append("currentTimeout=").append(i).toString());
        mScreenTimeoutPreference.setValue(String.valueOf(i));
        updateTimeoutPreferenceDescription(i);
        AlertDialog alertdialog = (AlertDialog)mScreenTimeoutPreference.getDialog();
        if (alertdialog != null && alertdialog.isShowing())
        {
            ListView listview = alertdialog.getListView();
            int j = mScreenTimeoutPreference.findIndexOfValue(mScreenTimeoutPreference.getValue());
            if (j > -1)
            {
                listview.setItemChecked(j, true);
                listview.setSelection(j);
                return;
            }
        }
    }

    private void updateTimeoutPreferenceDescription(long l)
    {
        ListPreference listpreference = mScreenTimeoutPreference;
        String s;
        if (l < 0L)
        {
            s = "";
        } else
        {
            CharSequence acharsequence[] = listpreference.getEntries();
            CharSequence acharsequence1[] = listpreference.getEntryValues();
            if (acharsequence != null && acharsequence.length != 0)
            {
                int i = 0;
                for (int j = 0; j < acharsequence1.length; j++)
                    if (l >= Long.parseLong(acharsequence1[j].toString()))
                        i = j;

                if (acharsequence.length != 0)
                {
                    Context context = listpreference.getContext();
                    Object aobj[] = new Object[1];
                    aobj[0] = acharsequence[i];
                    s = context.getString(0x7f0b0515, aobj);
                } else
                {
                    s = "";
                }
            } else
            {
                s = "";
            }
        }
        listpreference.setSummary(s);
    }

    private void updateWifiDisplaySummary()
    {
        if (mWifiDisplayPreference != null)
            switch (mWifiDisplayStatus.getFeatureState())
            {
            case 3: // '\003'
                mWifiDisplayPreference.setSummary(0x7f0b0423);
                return;

            case 2: // '\002'
                mWifiDisplayPreference.setSummary(0x7f0b0424);
                return;

            default:
                mWifiDisplayPreference.setSummary(0x7f0b0425);
                break;
            }
    }

    int floatToIndex(float f)
    {
        Xlog.w("DisplaySettings", (new StringBuilder()).append("floatToIndex enter val = ").append(f).toString());
        if (mIsUpdateFont)
        {
            CharSequence acharsequence[] = mFontSizePref.getEntryValues();
            Xlog.d("DisplaySettings", (new StringBuilder()).append("current font size : ").append(f).toString());
            for (int j = 0; j < acharsequence.length; j++)
                if (f == Float.parseFloat(acharsequence[j].toString()))
                {
                    Xlog.d("DisplaySettings", (new StringBuilder()).append("Select : ").append(j).toString());
                    return j;
                }

            return 1;
        }
        String as[] = getResources().getStringArray(0x7f070009);
        float f1 = Float.parseFloat(as[0]);
        for (int i = 1; i < as.length; i++)
        {
            float f2 = Float.parseFloat(as[i]);
            if (f < f1 + 0.5F * (f2 - f1))
                return i - 1;
            f1 = f2;
        }

        return -1 + as.length;
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        Xlog.d("DisplaySettings", "onConfigurationChanged");
        super.onConfigurationChanged(configuration);
        mCurConfig.updateFrom(configuration);
    }

    public void onCreate(Bundle bundle)
    {
        int i;
        ContentResolver contentresolver;
        i = 1;
        Xlog.d("DisplaySettings", "onCreate");
        super.onCreate(bundle);
        mExt = Utils.getMiscPlugin(getActivity());
        contentresolver = getActivity().getContentResolver();
        addPreferencesFromResource(0x7f050017);
        mDisplayPerCategory = (PreferenceCategory)findPreference("display_personalize");
        mDisplayDefCategory = (PreferenceCategory)findPreference("display_default");
        mAccelerometer = (CheckBoxPreference)findPreference("accelerometer");
        mAccelerometer.setPersistent(false);
        if (RotationPolicy.isRotationLockToggleSupported(getActivity()) && mDisplayDefCategory != null && mAccelerometer != null)
            mDisplayDefCategory.removePreference(mAccelerometer);
        mScreenSaverPreference = findPreference("screensaver");
        if (mScreenSaverPreference != null && !getResources().getBoolean(0x1110040) && mDisplayDefCategory != null)
            mDisplayDefCategory.removePreference(mScreenSaverPreference);
        mScreenTimeoutPreference = (ListPreference)findPreference("screen_timeout");
        long l = getTimoutValue();
        Xlog.d("DisplaySettings", (new StringBuilder()).append("currentTimeout=").append(l).toString());
        mScreenTimeoutPreference.setValue(String.valueOf(l));
        mScreenTimeoutPreference.setOnPreferenceChangeListener(this);
        disableUnusableTimeouts(mScreenTimeoutPreference);
        updateTimeoutPreferenceDescription(l);
        mExt.setTimeoutPrefTitle(mScreenTimeoutPreference);
        mFontSizePref = (WarnedListPreference)findPreference("font_size");
        updateFontSize(mFontSizePref);
        mFontSizePref.setOnPreferenceChangeListener(this);
        mFontSizePref.setOnPreferenceClickListener(this);
        mNotificationPulse = (CheckBoxPreference)findPreference("notification_pulse");
        if (mNotificationPulse == null || getResources().getBoolean(0x1110024) || mDisplayDefCategory == null) goto _L2; else goto _L1
_L1:
        mDisplayDefCategory.removePreference(mNotificationPulse);
_L3:
        mLandscapeLauncher = (ListPreference)findPreference("landscape_launcher");
        mLandscapeLauncher.setOnPreferenceChangeListener(this);
        mHDMISettings = findPreference("hdmi_settings");
        if (mHDMISettings != null && mDisplayDefCategory != null)
            mDisplayDefCategory.removePreference(mHDMISettings);
        mTVOut = findPreference("tvout_settings");
        if (mTVOut != null && mDisplayDefCategory != null)
            mDisplayDefCategory.removePreference(mTVOut);
        mColorPref = findPreference("color");
        mScencePref = findPreference("scenes");
        mWallpaperPref = findPreference("wallpaper");
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.android.launcher", "com.android.launcher2.SceneChooser"));
        List list = getPackageManager().queryIntentActivities(intent, 0);
        android.provider.Settings.SettingNotFoundException settingnotfoundexception;
        CheckBoxPreference checkboxpreference;
        boolean flag;
        if (list == null || list.size() == 0)
            i = 0;
        if (i == 0)
        {
            Xlog.d("DisplaySettings", "SceneChooserActivity doesn't exist, remove Scence pref");
            mDisplayPerCategory.removePreference(mScencePref);
        }
        mDisplayManager = (DisplayManager)getActivity().getSystemService("display");
        mWifiDisplayStatus = mDisplayManager.getWifiDisplayStatus();
        mWifiDisplayPreference = findPreference("wifi_display");
        if (mWifiDisplayStatus.getFeatureState() == 0)
        {
            mDisplayDefCategory.removePreference(mWifiDisplayPreference);
            mWifiDisplayPreference = null;
        }
        mLockScreenNotifications = (CheckBoxPreference)findPreference("lock_screen_notifications");
        mLockScreenNotifications.setOnPreferenceChangeListener(this);
        mLockScreenStylePref = findPreference("lock_screen_style");
        updateLockScreenStyle();
        return;
_L2:
        checkboxpreference = mNotificationPulse;
        if (android.provider.Settings.System.getInt(contentresolver, "notification_light_pulse") == i)
            flag = i;
        else
            flag = false;
        try
        {
            checkboxpreference.setChecked(flag);
            mNotificationPulse.setOnPreferenceChangeListener(this);
        }
        // Misplaced declaration of an exception variable
        catch (android.provider.Settings.SettingNotFoundException settingnotfoundexception)
        {
            Log.e("DisplaySettings", "notification_light_pulse not found");
        }
          goto _L3
    }

    public Dialog onCreateDialog(int i)
    {
        if (i == 1)
            return Utils.buildGlobalChangeWarningDialog(getActivity(), 0x7f0b0926, new Runnable() {

                final DisplaySettings this$0;

                public void run()
                {
                    mFontSizePref.click();
                }

            
            {
                this$0 = DisplaySettings.this;
                super();
            }
            }
);
        else
            return null;
    }

    public void onPause()
    {
        super.onPause();
        RotationPolicy.unregisterRotationPolicyListener(getActivity(), mRotationPolicyListener);
        getContentResolver().unregisterContentObserver(mScreenTimeoutObserver);
        getActivity().unregisterReceiver(mPackageReceiver);
        if (mWifiDisplayPreference != null)
            getActivity().unregisterReceiver(mReceiver);
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if (!"screen_timeout".equals(s)) goto _L2; else goto _L1
_L1:
        int i = Integer.parseInt((String)obj);
        try
        {
            android.provider.Settings.System.putInt(getContentResolver(), "screen_off_timeout", i);
            updateTimeoutPreferenceDescription(i);
        }
        catch (NumberFormatException numberformatexception)
        {
            Log.e("DisplaySettings", "could not persist screen timeout setting", numberformatexception);
        }
_L4:
        return true;
_L2:
        if ("font_size".equals(s))
            writeFontSizePreference(obj);
        else
        if ("landscape_launcher".equals(s))
        {
            Xlog.d("DisplaySettings", (new StringBuilder()).append("select landscape launcher   ").append(obj).toString());
            if (mLandscapeLauncher != null)
            {
                mLandscapeLauncher.setValue((String)obj);
                mLandscapeLauncher.setSummary(mLandscapeLauncher.getEntry());
            }
            android.provider.Settings.System.putString(getContentResolver(), "landscape_launcher", (String)obj);
        }
        if (true) goto _L4; else goto _L3
_L3:
    }

    public boolean onPreferenceClick(Preference preference)
    {
        if (preference == mFontSizePref)
        {
            if (Utils.hasMultipleUsers(getActivity()))
            {
                showDialog(1);
                return true;
            }
            mFontSizePref.click();
        }
        return false;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag = true;
        if (preference == mAccelerometer)
        {
            Activity activity = getActivity();
            boolean flag3;
            if (!mAccelerometer.isChecked())
                flag3 = flag;
            else
                flag3 = false;
            RotationPolicy.setRotationLockForAccessibility(activity, flag3);
            if (mLandscapeLauncher != null)
                if (mAccelerometer.isChecked())
                    mLandscapeLauncher.setEnabled(flag);
                else
                    mLandscapeLauncher.setEnabled(false);
        } else
        {
            if (preference == mNotificationPulse)
            {
                boolean flag2 = mNotificationPulse.isChecked();
                ContentResolver contentresolver1 = getContentResolver();
                int i = 0;
                if (flag2)
                    i = ((flag) ? 1 : 0);
                android.provider.Settings.System.putInt(contentresolver1, "notification_light_pulse", i);
                return flag;
            }
            if (preference == mLockScreenNotifications)
            {
                boolean flag1 = mLockScreenNotifications.isChecked();
                ContentResolver contentresolver = getContentResolver();
                if (!flag1)
                    flag = false;
                android.provider.Settings.System.putInt(contentresolver, "incoming_indicator_on_lockscreen", flag);
            }
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        boolean flag = true;
        super.onResume();
        Log.d("DisplaySettings", "onResume of DisplaySettings");
        updateLandscapeList();
        RotationPolicy.registerRotationPolicyListener(getActivity(), mRotationPolicyListener);
        getContentResolver().registerContentObserver(android.provider.Settings.System.getUriFor("screen_off_timeout"), false, mScreenTimeoutObserver);
        IntentFilter intentfilter = new IntentFilter("android.intent.action.PACKAGE_ADDED");
        intentfilter.addAction("android.intent.action.PACKAGE_REMOVED");
        intentfilter.addDataScheme("package");
        getActivity().registerReceiver(mPackageReceiver, intentfilter);
        if (mWifiDisplayPreference != null)
        {
            getActivity().registerReceiver(mReceiver, new IntentFilter("android.hardware.display.action.WIFI_DISPLAY_STATUS_CHANGED"));
            mWifiDisplayStatus = mDisplayManager.getWifiDisplayStatus();
        }
        updateState();
        ContentResolver contentresolver = getContentResolver();
        mColorPref.setSummary(ThemeManager.getThemeSummary(mColorPref.getContext()));
        mScencePref.setSummary(parseString(android.provider.Settings.System.getString(contentresolver, "current_scene_name")));
        mWallpaperPref.setSummary(parseString(android.provider.Settings.System.getString(contentresolver, "current_wallpaper_component_name")));
        updateTimeoutPreference(getTimoutValue());
        CheckBoxPreference checkboxpreference = mLockScreenNotifications;
        if (android.provider.Settings.System.getInt(getContentResolver(), "incoming_indicator_on_lockscreen", flag) != flag)
            flag = false;
        checkboxpreference.setChecked(flag);
        updateLockScreenStyleSummary();
    }

    public String parseString(String s)
    {
        if (s == null)
        {
            Xlog.w("DisplaySettings", "parseString error as decodeStr is null");
            return getString(0x7f0b00c3);
        }
        String s1 = s;
        String as[] = s.split("&");
        int i = as.length;
        if (i > 1)
        {
            PackageManager packagemanager = getPackageManager();
            Resources resources;
            int j;
            try
            {
                resources = packagemanager.getResourcesForApplication(as[0]);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Xlog.w("DisplaySettings", (new StringBuilder()).append("parseString can not find pakcage: ").append(as[0]).toString());
                return s1;
            }
            try
            {
                j = Integer.parseInt(as[1]);
            }
            catch (NumberFormatException numberformatexception)
            {
                Xlog.w("DisplaySettings", (new StringBuilder()).append("Invalid format of propery string: ").append(as[1]).toString());
                return s1;
            }
            if (i == 2)
            {
                s1 = resources.getString(j);
            } else
            {
                Object aobj[] = new Object[1];
                aobj[0] = as[2];
                s1 = resources.getString(j, aobj);
            }
        }
        Xlog.d("DisplaySettings", (new StringBuilder()).append("parseString return string: ").append(s1).toString());
        return s1;
    }

    public void readFontSizePreference(ListPreference listpreference)
    {
        int i;
        Resources resources;
        String as[];
        String s;
        Object aobj[];
        try
        {
            mCurConfig.updateFrom(ActivityManagerNative.getDefault().getConfiguration());
        }
        catch (RemoteException remoteexception)
        {
            Log.w("DisplaySettings", "Unable to retrieve font size");
        }
        i = floatToIndex(mCurConfig.fontScale);
        Xlog.d("DisplaySettings", (new StringBuilder()).append("readFontSizePreference index = ").append(i).toString());
        listpreference.setValueIndex(i);
        resources = getResources();
        as = resources.getStringArray(0x7f070008);
        s = resources.getString(0x7f0b0524);
        aobj = new Object[1];
        aobj[0] = as[i];
        listpreference.setSummary(String.format(s, aobj));
    }

    public void writeFontSizePreference(Object obj)
    {
        try
        {
            mCurConfig.fontScale = Float.parseFloat(obj.toString());
            Xlog.d("DisplaySettings", (new StringBuilder()).append("writeFontSizePreference font size =  ").append(Float.parseFloat(obj.toString())).toString());
            ActivityManagerNative.getDefault().updatePersistentConfiguration(mCurConfig);
            return;
        }
        catch (RemoteException remoteexception)
        {
            Log.w("DisplaySettings", "Unable to save font size");
        }
    }







/*
    static WifiDisplayStatus access$502(DisplaySettings displaysettings, WifiDisplayStatus wifidisplaystatus)
    {
        displaysettings.mWifiDisplayStatus = wifidisplaystatus;
        return wifidisplaystatus;
    }

*/

}
