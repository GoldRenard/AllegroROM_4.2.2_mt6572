// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.providers.settings;

import android.content.*;
import android.content.pm.*;
import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.database.Cursor;
import android.database.sqlite.*;
import android.media.AudioManager;
import android.media.AudioService;
import android.os.*;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import com.android.internal.util.XmlUtils;
import com.android.internal.widget.LockPatternUtils;
import com.mediatek.pluginmanager.PluginManager;
import com.mediatek.providers.settings.ext.DefaultDatabaseHelperExt;
import com.mediatek.providers.settings.ext.IDatabaseHelperExt;
import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import org.xmlpull.v1.XmlPullParserException;

// Referenced classes of package com.android.providers.settings:
//            SettingsProvider

public class DatabaseHelper extends SQLiteOpenHelper
{

    private static final String DATABASE_NAME = "settings.db";
    private static final int DATABASE_VERSION = 95;
    private static final String TABLE_GLOBAL = "global";
    private static final String TABLE_SECURE = "secure";
    private static final String TABLE_SYSTEM = "system";
    private static final String TAG = "SettingsProvider";
    private static final HashSet mValidTables;
    private Context mContext;
    private IDatabaseHelperExt mExt;
    private int mUserHandle;

    public DatabaseHelper(Context context, int i)
    {
        super(context, dbNameForUser(i), null, 95);
        mContext = context;
        mUserHandle = i;
        setWriteAheadLoggingEnabled(true);
    }

    private void createGlobalTable(SQLiteDatabase sqlitedatabase)
    {
        sqlitedatabase.execSQL("CREATE TABLE global (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);");
        sqlitedatabase.execSQL("CREATE INDEX globalIndex1 ON global (name);");
    }

    private void createSecureTable(SQLiteDatabase sqlitedatabase)
    {
        sqlitedatabase.execSQL("CREATE TABLE secure (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);");
        sqlitedatabase.execSQL("CREATE INDEX secureIndex1 ON secure (name);");
    }

    static String dbNameForUser(int i)
    {
        if (i == 0)
            return "settings.db";
        else
            return (new File(Environment.getUserSystemDirectory(i), "settings.db")).getPath();
    }

    public static IDatabaseHelperExt getDatabaseHelperPlgin(Context context)
    {
        IDatabaseHelperExt idatabasehelperext;
        try
        {
            Log.d("SettingsProvider", "getDatabaseHelperPlgin() --- begin");
            idatabasehelperext = (IDatabaseHelperExt)PluginManager.createPluginObject(context, com/mediatek/providers/settings/ext/IDatabaseHelperExt.getName(), new Signature[0]);
            Log.d("SettingsProvider", (new StringBuilder()).append("getDatabaseHelperPlgin() --- end: ").append(idatabasehelperext).toString());
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Log.i("SettingsProvider", "Plugin ObjectCreationException");
            return new DefaultDatabaseHelperExt();
        }
        return idatabasehelperext;
    }

    private int getIntValueFromSystem(SQLiteDatabase sqlitedatabase, String s, int i)
    {
        return getIntValueFromTable(sqlitedatabase, "system", s, i);
    }

    private int getIntValueFromTable(SQLiteDatabase sqlitedatabase, String s, String s1, int i)
    {
        String s2 = getStringValueFromTable(sqlitedatabase, s, s1, null);
        if (s2 != null)
            i = Integer.parseInt(s2);
        return i;
    }

    private String getStringValueFromTable(SQLiteDatabase sqlitedatabase, String s, String s1, String s2)
    {
        Cursor cursor = null;
        cursor = sqlitedatabase.query(s, new String[] {
            "value"
        }, (new StringBuilder()).append("name='").append(s1).append("'").toString(), null, null, null, null);
        if (cursor == null) goto _L2; else goto _L1
_L1:
        if (!cursor.moveToFirst()) goto _L2; else goto _L3
_L3:
        String s3 = cursor.getString(0);
        if (s3 != null)
            s2 = s3;
        if (cursor != null)
            cursor.close();
_L5:
        return s2;
_L2:
        if (cursor == null) goto _L5; else goto _L4
_L4:
        cursor.close();
        return s2;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }

    private String[] hashsetToStringArray(HashSet hashset)
    {
        return (String[])hashset.toArray(new String[hashset.size()]);
    }

    public static boolean isValidTable(String s)
    {
        return mValidTables.contains(s);
    }

    private void loadBookmarks(SQLiteDatabase sqlitedatabase)
    {
        ContentValues contentvalues;
        PackageManager packagemanager;
        contentvalues = new ContentValues();
        packagemanager = mContext.getPackageManager();
        XmlResourceParser xmlresourceparser;
        int i;
        xmlresourceparser = mContext.getResources().getXml(0x7f030000);
        XmlUtils.beginDocument(xmlresourceparser, "bookmarks");
        i = xmlresourceparser.getDepth();
_L2:
        int j = xmlresourceparser.next();
        if (j != 3)
            break MISSING_BLOCK_LABEL_73;
        if (xmlresourceparser.getDepth() <= i)
            break MISSING_BLOCK_LABEL_545;
        if (j == 1)
            break MISSING_BLOCK_LABEL_545;
        if (j != 2) goto _L2; else goto _L1
_L1:
        String s;
        String s1;
        String s2;
        String s3;
        char c;
        Intent intent;
        String s4;
        ComponentName componentname;
        ActivityInfo activityinfo1;
        ActivityInfo activityinfo2;
        try
        {
            if (!"bookmark".equals(xmlresourceparser.getName()))
                return;
        }
        catch (XmlPullParserException xmlpullparserexception)
        {
            Log.w("SettingsProvider", "Got execption parsing bookmarks.", xmlpullparserexception);
            return;
        }
        catch (IOException ioexception)
        {
            Log.w("SettingsProvider", "Got execption parsing bookmarks.", ioexception);
            return;
        }
label0:
        {
            s = xmlresourceparser.getAttributeValue(null, "package");
            s1 = xmlresourceparser.getAttributeValue(null, "class");
            s2 = xmlresourceparser.getAttributeValue(null, "shortcut");
            s3 = xmlresourceparser.getAttributeValue(null, "category");
            c = s2.charAt(0);
            if (!TextUtils.isEmpty(s2))
                break label0;
            Log.w("SettingsProvider", (new StringBuilder()).append("Unable to get shortcut for: ").append(s).append("/").append(s1).toString());
        }
          goto _L2
        if (s == null || s1 == null) goto _L4; else goto _L3
_L3:
        componentname = new ComponentName(s, s1);
        activityinfo2 = packagemanager.getActivityInfo(componentname, 0);
        activityinfo1 = activityinfo2;
_L5:
        intent = new Intent("android.intent.action.MAIN", null);
        intent.addCategory("android.intent.category.LAUNCHER");
        intent.setComponent(componentname);
        s4 = activityinfo1.loadLabel(packagemanager).toString();
_L6:
        intent.setFlags(0x10000000);
        contentvalues.put("intent", intent.toUri(0));
        contentvalues.put("title", s4);
        contentvalues.put("shortcut", Integer.valueOf(c));
        String as[] = new String[1];
        as[0] = Integer.toString(c);
        sqlitedatabase.delete("bookmarks", "shortcut = ?", as);
        sqlitedatabase.insert("bookmarks", null, contentvalues);
          goto _L2
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        componentname = new ComponentName(packagemanager.canonicalToCurrentPackageNames(new String[] {
            s
        })[0], s1);
        ActivityInfo activityinfo = packagemanager.getActivityInfo(componentname, 0);
        activityinfo1 = activityinfo;
          goto _L5
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception1;
        namenotfoundexception1;
        Log.w("SettingsProvider", (new StringBuilder()).append("Unable to add bookmark: ").append(s).append("/").append(s1).toString(), namenotfoundexception);
          goto _L2
_L4:
        if (s3 == null)
            break MISSING_BLOCK_LABEL_509;
        intent = Intent.makeMainSelectorActivity("android.intent.action.MAIN", s3);
        s4 = "";
          goto _L6
        Log.w("SettingsProvider", (new StringBuilder()).append("Unable to add bookmark for shortcut ").append(s2).append(": missing package/class or category attributes").toString());
          goto _L2
    }

    private void loadBooleanSetting(SQLiteStatement sqlitestatement, String s, int i)
    {
        String s1;
        if (mContext.getResources().getBoolean(i))
            s1 = "1";
        else
            s1 = "0";
        loadSetting(sqlitestatement, s, s1);
    }

    private void loadDefaultAnimationSettings(SQLiteStatement sqlitestatement)
    {
        loadFractionSetting(sqlitestatement, "window_animation_scale", 0x7f070000, 1);
        loadFractionSetting(sqlitestatement, "transition_animation_scale", 0x7f070001, 1);
    }

    private void loadDefaultHapticSettings(SQLiteStatement sqlitestatement)
    {
        String s = mExt.getResBoolean(mContext, "haptic_feedback_enabled", 0x7f050006);
        if (s != null)
        {
            loadSetting(sqlitestatement, "haptic_feedback_enabled", s);
            return;
        } else
        {
            loadBooleanSetting(sqlitestatement, "haptic_feedback_enabled", 0x7f050006);
            return;
        }
    }

    private void loadFractionSetting(SQLiteStatement sqlitestatement, String s, int i, int j)
    {
        loadSetting(sqlitestatement, s, Float.toString(mContext.getResources().getFraction(i, j, j)));
    }

    private void loadGlobalSettings(SQLiteDatabase sqlitedatabase)
    {
        int i;
        SQLiteStatement sqlitestatement;
        i = 1;
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO global(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement, "airplane_mode_on", 0x7f050001);
        loadStringSetting(sqlitestatement, "airplane_mode_radios", 0x7f040001);
        loadStringSetting(sqlitestatement, "airplane_mode_toggleable_radios", 0x7f040002);
        loadBooleanSetting(sqlitestatement, "assisted_gps_enabled", 0x7f05000b);
        Exception exception;
        int j;
        int k;
        int l;
        int i1;
        int j1;
        String s;
        String s1;
        String s2;
        if (!"1".equals(SystemProperties.get("ro.kernel.qemu")) && !mContext.getResources().getBoolean(0x7f050021))
            j = 0;
        else
            j = i;
        loadSetting(sqlitestatement, "stay_on_while_plugged_in", Integer.valueOf(j));
        loadIntegerSetting(sqlitestatement, "wifi_sleep_policy", 0x7f060003);
        loadSetting(sqlitestatement, "mode_ringer", Integer.valueOf(2));
        loadBooleanSetting(sqlitestatement, "package_verifier_enable", 0x7f05000a);
        loadBooleanSetting(sqlitestatement, "wifi_on", 0x7f05000e);
        loadBooleanSetting(sqlitestatement, "wifi_networks_available_notification_on", 0x7f05000f);
        loadBooleanSetting(sqlitestatement, "bluetooth_on", 0x7f050007);
        loadSetting(sqlitestatement, "cdma_cell_broadcast_sms", Integer.valueOf(1));
        if ("true".equalsIgnoreCase(SystemProperties.get("ro.com.android.dataroaming", "false")))
            k = i;
        else
            k = 0;
        loadSetting(sqlitestatement, "data_roaming", Integer.valueOf(k));
        loadBooleanSetting(sqlitestatement, "device_provisioned", 0x7f050017);
        l = mContext.getResources().getInteger(0x7f060008);
        if (l <= 0)
            break MISSING_BLOCK_LABEL_260;
        loadSetting(sqlitestatement, "download_manager_max_bytes_over_mobile", Integer.toString(l));
        i1 = mContext.getResources().getInteger(0x7f060009);
        if (i1 <= 0)
            break MISSING_BLOCK_LABEL_293;
        loadSetting(sqlitestatement, "download_manager_recommended_max_bytes_over_mobile", Integer.toString(i1));
        loadSetting(sqlitestatement, "mobile_data", Integer.valueOf(0));
        loadBooleanSetting(sqlitestatement, "netstats_enabled", 0x7f05000c);
        loadIntegerSetting(sqlitestatement, "network_preference", 0x7f060002);
        loadBooleanSetting(sqlitestatement, "usb_mass_storage_enabled", 0x7f05000d);
        loadIntegerSetting(sqlitestatement, "wifi_max_dhcp_retry_count", 0x7f06000c);
        loadBooleanSetting(sqlitestatement, "wifi_display_on", 0x7f050008);
        loadStringSetting(sqlitestatement, "lock_sound", 0x7f04000a);
        loadStringSetting(sqlitestatement, "unlock_sound", 0x7f04000b);
        loadIntegerSetting(sqlitestatement, "power_sounds_enabled", 0x7f060004);
        loadStringSetting(sqlitestatement, "low_battery_sound", 0x7f040005);
        loadIntegerSetting(sqlitestatement, "dock_sounds_enabled", 0x7f060005);
        loadStringSetting(sqlitestatement, "desk_dock_sound", 0x7f040006);
        loadStringSetting(sqlitestatement, "desk_undock_sound", 0x7f040007);
        loadStringSetting(sqlitestatement, "car_dock_sound", 0x7f040008);
        loadStringSetting(sqlitestatement, "car_undock_sound", 0x7f040009);
        loadStringSetting(sqlitestatement, "wireless_charging_started_sound", 0x7f04000c);
        loadSetting(sqlitestatement, "set_install_location", Integer.valueOf(0));
        loadSetting(sqlitestatement, "default_install_location", Integer.valueOf(0));
        loadSetting(sqlitestatement, "emergency_tone", Integer.valueOf(0));
        loadSetting(sqlitestatement, "call_auto_retry", Integer.valueOf(0));
        if (TelephonyManager.getLteOnCdmaModeStatic() != i) goto _L2; else goto _L1
_L1:
        j1 = 7;
_L7:
        loadSetting(sqlitestatement, "preferred_network_mode", Integer.valueOf(j1));
        if (!"true".equalsIgnoreCase(SystemProperties.get("ro.com.android.dataroaming2", "false")))
            i = 0;
        loadSetting(sqlitestatement, "data_roaming_2", Integer.valueOf(i));
        loadBooleanSetting(sqlitestatement, "auto_time_gps", 0x7f050023);
        s = mExt.getResBoolean(mContext, "auto_time", 0x7f050002);
        if (s == null) goto _L4; else goto _L3
_L3:
        loadSetting(sqlitestatement, "auto_time", s);
_L8:
        s1 = mExt.getResBoolean(mContext, "auto_time_zone", 0x7f050003);
        if (s1 == null) goto _L6; else goto _L5
_L5:
        loadSetting(sqlitestatement, "auto_time_zone", s1);
_L9:
        s2 = mExt.getResBoolean(mContext, "install_non_market_apps", 0x7f050009);
        if (s2 == null)
            break MISSING_BLOCK_LABEL_765;
        loadSetting(sqlitestatement, "install_non_market_apps", s2);
_L10:
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
_L2:
        j1 = SystemProperties.getInt("ro.telephony.default_network", 0);
          goto _L7
_L4:
        loadBooleanSetting(sqlitestatement, "auto_time", 0x7f050002);
          goto _L8
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
_L6:
        loadBooleanSetting(sqlitestatement, "auto_time_zone", 0x7f050003);
          goto _L9
        loadBooleanSetting(sqlitestatement, "install_non_market_apps", 0x7f050009);
          goto _L10
    }

    private void loadIntegerSetting(SQLiteStatement sqlitestatement, String s, int i)
    {
        loadSetting(sqlitestatement, s, Integer.toString(mContext.getResources().getInteger(i)));
    }

    private void loadSecure35Settings(SQLiteStatement sqlitestatement)
    {
        loadBooleanSetting(sqlitestatement, "backup_enabled", 0x7f050010);
        loadStringSetting(sqlitestatement, "backup_transport", 0x7f040004);
    }

    private void loadSecureSettings(SQLiteDatabase sqlitedatabase)
    {
        SQLiteStatement sqlitestatement = null;
        boolean flag;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);");
        String s = SystemProperties.get("ro.com.android.wifi-watchlist");
        if (!TextUtils.isEmpty(s))
            loadSetting(sqlitestatement, "wifi_watchdog_watch_list", s);
        flag = "1".equals(SystemProperties.get("ro.allow.mock.location"));
        int i;
        i = 0;
        if (flag)
            i = 1;
        loadSetting(sqlitestatement, "mock_location", Integer.valueOf(i));
        loadSecure35Settings(sqlitestatement);
        loadBooleanSetting(sqlitestatement, "mount_play_not_snd", 0x7f050012);
        loadBooleanSetting(sqlitestatement, "mount_ums_autostart", 0x7f050013);
        loadBooleanSetting(sqlitestatement, "mount_ums_prompt", 0x7f050014);
        loadBooleanSetting(sqlitestatement, "mount_ums_notify_enabled", 0x7f050015);
        loadBooleanSetting(sqlitestatement, "accessibility_script_injection", 0x7f05001a);
        loadStringSetting(sqlitestatement, "accessibility_web_content_key_bindings", 0x7f04000d);
        loadIntegerSetting(sqlitestatement, "long_press_timeout", 0x7f06000a);
        loadBooleanSetting(sqlitestatement, "touch_exploration_enabled", 0x7f05001c);
        loadBooleanSetting(sqlitestatement, "speak_password", 0x7f05001b);
        loadStringSetting(sqlitestatement, "accessibility_script_injection_url", 0x7f04000e);
        if (!SystemProperties.getBoolean("ro.lockscreen.disable.default", false)) goto _L2; else goto _L1
_L1:
        loadSetting(sqlitestatement, "lockscreen.disabled", "1");
_L7:
        loadBooleanSetting(sqlitestatement, "screensaver_enabled", 0x1110041);
        loadBooleanSetting(sqlitestatement, "screensaver_activate_on_dock", 0x1110042);
        loadBooleanSetting(sqlitestatement, "screensaver_activate_on_sleep", 0x1110043);
        loadStringSetting(sqlitestatement, "screensaver_components", 0x104002c);
        loadStringSetting(sqlitestatement, "screensaver_default_component", 0x104002c);
        loadBooleanSetting(sqlitestatement, "accessibility_display_magnification_enabled", 0x7f05001d);
        loadFractionSetting(sqlitestatement, "accessibility_display_magnification_scale", 0x7f070002, 1);
        loadBooleanSetting(sqlitestatement, "accessibility_display_magnification_auto_update", 0x7f05001e);
        loadBooleanSetting(sqlitestatement, "user_setup_complete", 0x7f050022);
        Log.i("SettingsProvider", (new StringBuilder()).append("defaultIME : ").append("com.android.inputmethod.pinyin.PinyinIME").toString());
        if ("com.android.inputmethod.pinyin.PinyinIME" == null) goto _L4; else goto _L3
_L3:
        StringBuffer stringbuffer = new StringBuffer("com.android.inputmethod.pinyin.PinyinIME");
        stringbuffer.insert("com.android.inputmethod.pinyin.PinyinIME".lastIndexOf("."), "/");
        loadSetting(sqlitestatement, "default_input_method", stringbuffer.toString());
_L8:
        String s1 = mExt.getResBoolean(mContext, "battery_percentage", 0x7f050026);
        if (s1 == null) goto _L6; else goto _L5
_L5:
        loadSetting(sqlitestatement, "battery_percentage", s1);
_L9:
        String s2;
        loadBooleanSetting(sqlitestatement, "wfd_auto_connect_on", 0x7f050028);
        s2 = mExt.getResStr(mContext, "location_providers_allowed", 0x7f040003);
        if (s2 == null)
            break MISSING_BLOCK_LABEL_531;
        loadSetting(sqlitestatement, "location_providers_allowed", s2);
_L10:
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
_L2:
        loadBooleanSetting(sqlitestatement, "lockscreen.disabled", 0x7f050016);
          goto _L7
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
_L4:
        Log.i("SettingsProvider", "default IME from IMEFeatureOption is null!!");
          goto _L8
_L6:
        loadBooleanSetting(sqlitestatement, "battery_percentage", 0x7f050026);
          goto _L9
        loadStringSetting(sqlitestatement, "location_providers_allowed", 0x7f040003);
          goto _L10
    }

    private void loadSetting(SQLiteStatement sqlitestatement, String s, Object obj)
    {
        sqlitestatement.bindString(1, s);
        sqlitestatement.bindString(2, obj.toString());
        sqlitestatement.execute();
    }

    private void loadSettings(SQLiteDatabase sqlitedatabase)
    {
        mExt = getDatabaseHelperPlgin(mContext);
        loadSystemSettings(sqlitedatabase);
        loadSecureSettings(sqlitedatabase);
        if (mUserHandle == 0)
            loadGlobalSettings(sqlitedatabase);
    }

    private void loadStringSetting(SQLiteStatement sqlitestatement, String s, int i)
    {
        loadSetting(sqlitestatement, s, mContext.getResources().getString(i));
    }

    private void loadSystemSettings(SQLiteDatabase sqlitedatabase)
    {
        SQLiteStatement sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement, "time_12_24", 0x7f040000);
        loadBooleanSetting(sqlitestatement, "dim_screen", 0x7f050000);
        loadIntegerSetting(sqlitestatement, "screen_off_timeout", 0x7f060000);
        loadSetting(sqlitestatement, "dtmf_tone_type", Integer.valueOf(0));
        loadSetting(sqlitestatement, "hearing_aid", Integer.valueOf(0));
        loadSetting(sqlitestatement, "tty_mode", Integer.valueOf(0));
        loadIntegerSetting(sqlitestatement, "screen_brightness", 0x7f060001);
        loadBooleanSetting(sqlitestatement, "screen_brightness_mode", 0x7f050005);
        loadDefaultAnimationSettings(sqlitestatement);
        loadBooleanSetting(sqlitestatement, "accelerometer_rotation", 0x7f050004);
        loadDefaultHapticSettings(sqlitestatement);
        loadBooleanSetting(sqlitestatement, "notification_light_pulse", 0x7f050011);
        loadUISoundEffectsSettings(sqlitestatement);
        loadIntegerSetting(sqlitestatement, "pointer_speed", 0x7f06000b);
        loadStringSetting(sqlitestatement, "mtk_audioprofile_active", 0x7f040010);
        loadSetting(sqlitestatement, "dual_sim_mode_setting", Integer.valueOf(3));
        loadIntegerSetting(sqlitestatement, "boot_up_select_mode", 0x7f06000e);
        loadSetting(sqlitestatement, "enable_internet_call_value", Integer.valueOf(0));
        loadSetting(sqlitestatement, "roaming_reminder_mode_setting", Integer.valueOf(1));
        loadBooleanSetting(sqlitestatement, "roaming_indication_needed", 0x7f050024);
        loadBooleanSetting(sqlitestatement, "ipo_setting", 0x7f050025);
        loadStringSetting(sqlitestatement, "landscape_launcher", 0x7f04000f);
        loadIntegerSetting(sqlitestatement, "wifi_select_ssid_type", 0x7f06000d);
        loadStringSetting(sqlitestatement, "mtk_rtsp_name", 0x7f040012);
        loadStringSetting(sqlitestatement, "mtk_rtsp_to_proxy", 0x7f040013);
        loadStringSetting(sqlitestatement, "mtk_rtsp_netinfo", 0x7f040014);
        loadStringSetting(sqlitestatement, "mtk_rtsp_to_napid", 0x7f040015);
        loadStringSetting(sqlitestatement, "mtk_rtsp_max_udp_port", 0x7f040016);
        loadStringSetting(sqlitestatement, "mtk_rtsp_min_udp_port", 0x7f040017);
        loadIntegerSetting(sqlitestatement, "voice_call_reject_mode", 0x7f060010);
        loadIntegerSetting(sqlitestatement, "vt_call_reject_mode", 0x7f060011);
        loadIntegerSetting(sqlitestatement, "ivsr_setting", 0x7f060012);
        loadIntegerSetting(sqlitestatement, "cro_setting", 0x7f060013);
        loadIntegerSetting(sqlitestatement, "hoo_setting", 0x7f060014);
        loadIntegerSetting(sqlitestatement, "tether_ipv6_feature", 0x7f060015);
        loadIntegerSetting(sqlitestatement, "international_dialing_key", 0x7f06000f);
        loadBooleanSetting(sqlitestatement, "data_usage_on_lockscreen_sim1", 0x7f050027);
        loadBooleanSetting(sqlitestatement, "data_usage_on_lockscreen_sim2", 0x7f050027);
        loadSetting(sqlitestatement, "dtmf_tone", Integer.valueOf(1));
        loadSetting(sqlitestatement, "gprs_connection_setting", Integer.valueOf(-4));
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    private void loadUISoundEffectsSettings(SQLiteStatement sqlitestatement)
    {
        loadBooleanSetting(sqlitestatement, "dtmf_tone", 0x7f05001f);
        loadBooleanSetting(sqlitestatement, "sound_effects_enabled", 0x7f050020);
        String s = mExt.getResBoolean(mContext, "haptic_feedback_enabled", 0x7f050006);
        if (s != null)
            loadSetting(sqlitestatement, "haptic_feedback_enabled", s);
        else
            loadBooleanSetting(sqlitestatement, "haptic_feedback_enabled", 0x7f050006);
        loadIntegerSetting(sqlitestatement, "lockscreen_sounds_enabled", 0x7f060006);
    }

    private void loadVibrateSetting(SQLiteDatabase sqlitedatabase, boolean flag)
    {
        SQLiteStatement sqlitestatement;
        if (flag)
            sqlitedatabase.execSQL("DELETE FROM system WHERE name='vibrate_on'");
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        int i = AudioService.getValueForVibrateSetting(0, 1, 0);
        loadSetting(sqlitestatement, "vibrate_on", Integer.valueOf(i | AudioService.getValueForVibrateSetting(i, 0, 0)));
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    private void loadVibrateWhenRingingSetting(SQLiteDatabase sqlitedatabase)
    {
        int i;
        SQLiteStatement sqlitestatement;
        i = 1;
        int j;
        if ((3 & getIntValueFromSystem(sqlitedatabase, "vibrate_on", 0)) == i)
            j = i;
        else
            j = 0;
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        if (j == 0)
            i = 0;
        loadSetting(sqlitestatement, "vibrate_when_ringing", Integer.valueOf(i));
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    private void loadVolumeLevels(SQLiteDatabase sqlitedatabase)
    {
        SQLiteStatement sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        loadSetting(sqlitestatement, "volume_music", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[3]));
        loadSetting(sqlitestatement, "volume_ring", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[2]));
        loadSetting(sqlitestatement, "volume_system", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[1]));
        loadSetting(sqlitestatement, "volume_voice", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[0]));
        loadSetting(sqlitestatement, "volume_alarm", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[4]));
        loadSetting(sqlitestatement, "volume_notification", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[5]));
        loadSetting(sqlitestatement, "volume_bluetooth_sco", Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[6]));
        int i = 166;
        if (!mContext.getResources().getBoolean(0x1110030))
            i |= 8;
        loadSetting(sqlitestatement, "mode_ringer_streams_affected", Integer.valueOf(i));
        loadSetting(sqlitestatement, "mute_streams_affected", Integer.valueOf(3118));
        if (sqlitestatement != null)
            sqlitestatement.close();
        loadVibrateWhenRingingSetting(sqlitedatabase);
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    private void movePrefixedSettingsToNewTable(SQLiteDatabase sqlitedatabase, String s, String s1, String as[])
    {
        SQLiteStatement sqlitestatement;
        SQLiteStatement sqlitestatement1;
        sqlitestatement = null;
        sqlitestatement1 = null;
        sqlitedatabase.beginTransaction();
        int i;
        sqlitestatement = sqlitedatabase.compileStatement((new StringBuilder()).append("INSERT INTO ").append(s1).append(" (name,value) SELECT name,value FROM ").append(s).append(" WHERE substr(name,0,?)=?").toString());
        sqlitestatement1 = sqlitedatabase.compileStatement((new StringBuilder()).append("DELETE FROM ").append(s).append(" WHERE substr(name,0,?)=?").toString());
        i = as.length;
        int j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        String s2 = as[j];
        sqlitestatement.bindLong(1, 1 + s2.length());
        sqlitestatement.bindString(2, s2);
        sqlitestatement.execute();
        sqlitestatement1.bindLong(1, 1 + s2.length());
        sqlitestatement1.bindString(2, s2);
        sqlitestatement1.execute();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        return;
        Exception exception;
        exception;
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        throw exception;
    }

    private void moveSettingsToNewTable(SQLiteDatabase sqlitedatabase, String s, String s1, String as[], boolean flag)
    {
        SQLiteStatement sqlitestatement;
        SQLiteStatement sqlitestatement1;
        sqlitestatement = null;
        sqlitestatement1 = null;
        sqlitedatabase.beginTransaction();
        StringBuilder stringbuilder = (new StringBuilder()).append("INSERT ");
        Exception exception;
        String s2;
        int i;
        int j;
        if (flag)
            s2 = " OR IGNORE ";
        else
            s2 = "";
        sqlitestatement = sqlitedatabase.compileStatement(stringbuilder.append(s2).append(" INTO ").append(s1).append(" (name,value) SELECT name,value FROM ").append(s).append(" WHERE name=?").toString());
        sqlitestatement1 = sqlitedatabase.compileStatement((new StringBuilder()).append("DELETE FROM ").append(s).append(" WHERE name=?").toString());
        i = as.length;
        j = 0;
_L2:
        if (j >= i)
            break; /* Loop/switch isn't completed */
        String s3 = as[j];
        sqlitestatement.bindString(1, s3);
        sqlitestatement.execute();
        sqlitestatement1.bindString(1, s3);
        sqlitestatement1.execute();
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        return;
        exception;
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        throw exception;
    }

    private void upgradeAutoBrightness(SQLiteDatabase sqlitedatabase)
    {
        sqlitedatabase.beginTransaction();
        String s;
        if (mContext.getResources().getBoolean(0x7f050005))
            s = "1";
        else
            s = "0";
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT OR REPLACE INTO system(name,value) values('screen_brightness_mode','").append(s).append("');").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        return;
        Exception exception;
        exception;
        sqlitedatabase.endTransaction();
        throw exception;
    }

    private void upgradeLockPatternLocation(SQLiteDatabase sqlitedatabase)
    {
        Cursor cursor = sqlitedatabase.query("system", new String[] {
            "_id", "value"
        }, "name='lock_pattern'", null, null, null, null);
        if (cursor.getCount() > 0)
        {
            cursor.moveToFirst();
            String s = cursor.getString(1);
            if (!TextUtils.isEmpty(s))
                try
                {
                    (new LockPatternUtils(mContext)).saveLockPattern(LockPatternUtils.stringToPattern(s));
                }
                catch (IllegalArgumentException illegalargumentexception) { }
            cursor.close();
            sqlitedatabase.delete("system", "name='lock_pattern'", null);
            return;
        } else
        {
            cursor.close();
            return;
        }
    }

    private void upgradeScreenTimeout(SQLiteDatabase sqlitedatabase)
    {
        SQLiteStatement sqlitestatement;
        sqlitedatabase.beginTransaction();
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO system(name,value) VALUES(?,?);");
        loadIntegerSetting(sqlitestatement, "screen_off_timeout", 0x7f060000);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    private void upgradeScreenTimeoutFromNever(SQLiteDatabase sqlitedatabase)
    {
        Cursor cursor;
        SQLiteStatement sqlitestatement;
        cursor = sqlitedatabase.query("system", new String[] {
            "_id", "value"
        }, "name=? AND value=?", new String[] {
            "screen_off_timeout", "-1"
        }, null, null, null);
        sqlitestatement = null;
        if (cursor.getCount() <= 0)
            break MISSING_BLOCK_LABEL_105;
        cursor.close();
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO system(name,value) VALUES(?,?);");
        loadSetting(sqlitestatement, "screen_off_timeout", Integer.toString(0x1b7740));
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
        cursor.close();
        return;
    }

    private void upgradeVibrateSettingFromNone(SQLiteDatabase sqlitedatabase)
    {
        int j;
        SQLiteStatement sqlitestatement;
        int i = getIntValueFromSystem(sqlitedatabase, "vibrate_on", 0);
        if ((i & 3) == 0)
            i = AudioService.getValueForVibrateSetting(0, 0, 2);
        j = AudioService.getValueForVibrateSetting(i, 1, i);
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO system(name,value) VALUES(?,?);");
        loadSetting(sqlitestatement, "vibrate_on", Integer.valueOf(j));
        if (sqlitestatement != null)
            sqlitestatement.close();
        return;
        Exception exception;
        exception;
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception;
    }

    public void onCreate(SQLiteDatabase sqlitedatabase)
    {
        sqlitedatabase.execSQL("CREATE TABLE system (_id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);");
        sqlitedatabase.execSQL("CREATE INDEX systemIndex1 ON system (name);");
        createSecureTable(sqlitedatabase);
        if (mUserHandle == 0)
            createGlobalTable(sqlitedatabase);
        sqlitedatabase.execSQL("CREATE TABLE bluetooth_devices (_id INTEGER PRIMARY KEY,name TEXT,addr TEXT,channel INTEGER,type INTEGER);");
        sqlitedatabase.execSQL("CREATE TABLE bookmarks (_id INTEGER PRIMARY KEY,title TEXT,folder TEXT,intent TEXT,shortcut INTEGER,ordering INTEGER);");
        sqlitedatabase.execSQL("CREATE INDEX bookmarksIndex1 ON bookmarks (folder);");
        sqlitedatabase.execSQL("CREATE INDEX bookmarksIndex2 ON bookmarks (shortcut);");
        boolean flag1 = android.content.pm.IPackageManager.Stub.asInterface(ServiceManager.getService("package")).isOnlyCoreApps();
        boolean flag = flag1;
_L2:
        if (!flag)
            loadBookmarks(sqlitedatabase);
        loadVolumeLevels(sqlitedatabase);
        loadSettings(sqlitedatabase);
        return;
        RemoteException remoteexception;
        remoteexception;
        flag = false;
        if (true) goto _L2; else goto _L1
_L1:
    }

    public void onUpgrade(SQLiteDatabase sqlitedatabase, int i, int j)
    {
        int k;
        Log.w("SettingsProvider", (new StringBuilder()).append("Upgrading settings database from version ").append(i).append(" to ").append(j).toString());
        k = i;
        if (k == 20)
        {
            loadVibrateSetting(sqlitedatabase, true);
            k = 21;
        }
        if (k < 22)
        {
            k = 22;
            upgradeLockPatternLocation(sqlitedatabase);
        }
        if (k < 23)
        {
            sqlitedatabase.execSQL("UPDATE favorites SET iconResource=0 WHERE iconType=0");
            k = 23;
        }
        if (k != 23)
            break MISSING_BLOCK_LABEL_148;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("ALTER TABLE favorites ADD spanX INTEGER");
        sqlitedatabase.execSQL("ALTER TABLE favorites ADD spanY INTEGER");
        sqlitedatabase.execSQL("UPDATE favorites SET spanX=1, spanY=1 WHERE itemType<=0");
        sqlitedatabase.execSQL("UPDATE favorites SET spanX=2, spanY=2 WHERE itemType=1000 or itemType=1002");
        sqlitedatabase.execSQL("UPDATE favorites SET spanX=4, spanY=1 WHERE itemType=1001");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 24;
        if (k != 24)
            break MISSING_BLOCK_LABEL_185;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='network_preference'");
        sqlitedatabase.execSQL("INSERT INTO system ('name', 'value') values ('network_preference', '1')");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 25;
        if (k != 25)
            break MISSING_BLOCK_LABEL_222;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("ALTER TABLE favorites ADD uri TEXT");
        sqlitedatabase.execSQL("ALTER TABLE favorites ADD displayMode INTEGER");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 26;
        if (k != 26)
            break MISSING_BLOCK_LABEL_250;
        sqlitedatabase.beginTransaction();
        createSecureTable(sqlitedatabase);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 27;
        if (k == 27)
        {
            moveSettingsToNewTable(sqlitedatabase, "system", "secure", new String[] {
                "adb_enabled", "android_id", "bluetooth_on", "data_roaming", "device_provisioned", "http_proxy", "install_non_market_apps", "location_providers_allowed", "logging_id", "network_preference", 
                "parental_control_enabled", "parental_control_last_update", "parental_control_redirect_url", "settings_classname", "usb_mass_storage_enabled", "use_google_mail", "wifi_networks_available_notification_on", "wifi_networks_available_repeat_delay", "wifi_num_open_networks_kept", "wifi_on", 
                "wifi_watchdog_acceptable_packet_loss_percentage", "wifi_watchdog_ap_count", "wifi_watchdog_background_check_delay_ms", "wifi_watchdog_background_check_enabled", "wifi_watchdog_background_check_timeout_ms", "wifi_watchdog_initial_ignored_ping_count", "wifi_watchdog_max_ap_checks", "wifi_watchdog_on", "wifi_watchdog_ping_count", "wifi_watchdog_ping_delay_ms", 
                "wifi_watchdog_ping_timeout_ms"
            }, false);
            k = 28;
        }
        if (k != 28 && k != 29)
            break MISSING_BLOCK_LABEL_558;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='mode_ringer_streams_affected'");
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT INTO system ('name', 'value') values ('mode_ringer_streams_affected', '").append(String.valueOf(38)).append("')").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 30;
        if (k != 30)
            break MISSING_BLOCK_LABEL_595;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("UPDATE bookmarks SET folder = '@quicklaunch'");
        sqlitedatabase.execSQL("UPDATE bookmarks SET title = ''");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 31;
        SQLiteStatement sqlitestatement27;
        if (k != 31)
            break MISSING_BLOCK_LABEL_660;
        sqlitedatabase.beginTransaction();
        sqlitestatement27 = null;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='window_animation_scale'");
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='transition_animation_scale'");
        sqlitestatement27 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadDefaultAnimationSettings(sqlitestatement27);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement27 != null)
            sqlitestatement27.close();
        k = 32;
        String s5;
        if (k != 32)
            break MISSING_BLOCK_LABEL_730;
        s5 = SystemProperties.get("ro.com.android.wifi-watchlist");
        if (TextUtils.isEmpty(s5))
            break MISSING_BLOCK_LABEL_726;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT OR IGNORE INTO secure(name,value) values('wifi_watchdog_watch_list','").append(s5).append("');").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 33;
        if (k != 33)
            break MISSING_BLOCK_LABEL_760;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("INSERT INTO system(name,value) values('zoom','2');");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 34;
        SQLiteStatement sqlitestatement26;
        if (k != 34)
            break MISSING_BLOCK_LABEL_811;
        sqlitedatabase.beginTransaction();
        sqlitestatement26 = null;
        sqlitestatement26 = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);");
        loadSecure35Settings(sqlitestatement26);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement26 != null)
            sqlitestatement26.close();
        k = 35;
        if (k == 35)
            k = 36;
        if (k != 36)
            break MISSING_BLOCK_LABEL_887;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='mode_ringer_streams_affected'");
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT INTO system ('name', 'value') values ('mode_ringer_streams_affected', '").append(String.valueOf(166)).append("')").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 37;
        SQLiteStatement sqlitestatement25;
        if (k != 37)
            break MISSING_BLOCK_LABEL_944;
        sqlitedatabase.beginTransaction();
        sqlitestatement25 = null;
        sqlitestatement25 = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement25, "airplane_mode_toggleable_radios", 0x7f040002);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement25 != null)
            sqlitestatement25.close();
        k = 38;
        if (k != 38)
            break MISSING_BLOCK_LABEL_1019;
        sqlitedatabase.beginTransaction();
        SQLiteStatement sqlitestatement;
        SQLiteStatement sqlitestatement1;
        SQLiteStatement sqlitestatement2;
        SQLiteStatement sqlitestatement3;
        SQLiteStatement sqlitestatement4;
        SQLiteStatement sqlitestatement5;
        SQLiteStatement sqlitestatement6;
        SQLiteStatement sqlitestatement7;
        Cursor cursor;
        int l;
        SQLiteStatement sqlitestatement8;
        SQLiteStatement sqlitestatement9;
        SQLiteStatement sqlitestatement10;
        String s2;
        String s3;
        SQLiteStatement sqlitestatement11;
        int i1;
        SQLiteStatement sqlitestatement12;
        SQLiteStatement sqlitestatement13;
        SQLiteStatement sqlitestatement14;
        int j1;
        SQLiteStatement sqlitestatement15;
        SQLiteStatement sqlitestatement16;
        SQLiteStatement sqlitestatement17;
        SQLiteStatement sqlitestatement18;
        SQLiteStatement sqlitestatement19;
        SQLiteStatement sqlitestatement20;
        SQLiteStatement sqlitestatement21;
        SQLiteStatement sqlitestatement22;
        SQLiteStatement sqlitestatement23;
        SQLiteStatement sqlitestatement24;
        String s4;
        if (mContext.getResources().getBoolean(0x7f05000b))
            s4 = "1";
        else
            s4 = "0";
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT OR IGNORE INTO secure(name,value) values('assisted_gps_enabled','").append(s4).append("');").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 39;
        if (k == 39)
        {
            upgradeAutoBrightness(sqlitedatabase);
            k = 40;
        }
        if (k != 40)
            break MISSING_BLOCK_LABEL_1100;
        sqlitedatabase.beginTransaction();
        sqlitestatement24 = null;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='window_animation_scale'");
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='transition_animation_scale'");
        sqlitestatement24 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadDefaultAnimationSettings(sqlitestatement24);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement24 != null)
            sqlitestatement24.close();
        k = 41;
        if (k != 41)
            break MISSING_BLOCK_LABEL_1158;
        sqlitedatabase.beginTransaction();
        sqlitestatement23 = null;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='haptic_feedback_enabled'");
        sqlitestatement23 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadDefaultHapticSettings(sqlitestatement23);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement23 != null)
            sqlitestatement23.close();
        k = 42;
        if (k != 42)
            break MISSING_BLOCK_LABEL_1215;
        sqlitedatabase.beginTransaction();
        sqlitestatement22 = null;
        sqlitestatement22 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement22, "notification_light_pulse", 0x7f050011);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement22 != null)
            sqlitestatement22.close();
        k = 43;
        if (k != 43)
            break MISSING_BLOCK_LABEL_1282;
        sqlitedatabase.beginTransaction();
        sqlitestatement21 = null;
        sqlitestatement21 = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        Integer integer4 = Integer.valueOf(AudioManager.DEFAULT_STREAM_VOLUME[6]);
        loadSetting(sqlitestatement21, "volume_bluetooth_sco", integer4);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement21 != null)
            sqlitestatement21.close();
        k = 44;
        if (k == 44)
        {
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS gservices");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS gservicesIndex1");
            k = 45;
        }
        if (k != 45)
            break MISSING_BLOCK_LABEL_1358;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("INSERT INTO secure(name,value) values('mount_play_not_snd','1');");
        sqlitedatabase.execSQL("INSERT INTO secure(name,value) values('mount_ums_autostart','0');");
        sqlitedatabase.execSQL("INSERT INTO secure(name,value) values('mount_ums_prompt','1');");
        sqlitedatabase.execSQL("INSERT INTO secure(name,value) values('mount_ums_notify_enabled','1');");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 46;
        if (k != 46)
            break MISSING_BLOCK_LABEL_1388;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='lockscreen.password_type';");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 47;
        if (k != 47)
            break MISSING_BLOCK_LABEL_1418;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='lockscreen.password_type';");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 48;
        if (k == 48)
            k = 49;
        if (k != 49)
            break MISSING_BLOCK_LABEL_1480;
        sqlitedatabase.beginTransaction();
        sqlitestatement20 = null;
        sqlitestatement20 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadUISoundEffectsSettings(sqlitestatement20);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement20 != null)
            sqlitestatement20.close();
        k = 50;
        if (k == 50)
            k = 51;
        if (k == 51)
        {
            moveSettingsToNewTable(sqlitedatabase, "system", "secure", new String[] {
                "lock_pattern_autolock", "lock_pattern_visible_pattern", "lock_pattern_tactile_feedback_enabled", "lockscreen.password_type", "lockscreen.lockoutattemptdeadline", "lockscreen.patterneverchosen", "lock_pattern_autolock", "lockscreen.lockedoutpermanently", "lockscreen.password_salt"
            }, false);
            k = 52;
        }
        if (k != 52)
            break MISSING_BLOCK_LABEL_1631;
        sqlitedatabase.beginTransaction();
        sqlitestatement19 = null;
        sqlitestatement19 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement19, "vibrate_in_silent", 0x7f050019);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement19 != null)
            sqlitestatement19.close();
        k = 53;
        if (k == 53)
            k = 54;
        if (k != 54)
            break MISSING_BLOCK_LABEL_1670;
        sqlitedatabase.beginTransaction();
        upgradeScreenTimeoutFromNever(sqlitedatabase);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 55;
        if (k != 55)
            break MISSING_BLOCK_LABEL_1775;
        moveSettingsToNewTable(sqlitedatabase, "system", "secure", new String[] {
            "set_install_location", "default_install_location"
        }, false);
        sqlitedatabase.beginTransaction();
        sqlitestatement18 = null;
        sqlitestatement18 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        Integer integer2 = Integer.valueOf(0);
        loadSetting(sqlitestatement18, "set_install_location", integer2);
        Integer integer3 = Integer.valueOf(0);
        loadSetting(sqlitestatement18, "default_install_location", integer3);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement18 != null)
            sqlitestatement18.close();
        k = 56;
        if (k != 56)
            break MISSING_BLOCK_LABEL_1839;
        sqlitedatabase.beginTransaction();
        sqlitestatement17 = null;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='airplane_mode_toggleable_radios'");
        sqlitestatement17 = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO system(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement17, "airplane_mode_toggleable_radios", 0x7f040002);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement17 != null)
            sqlitestatement17.close();
        k = 57;
        if (k != 57)
            break MISSING_BLOCK_LABEL_1922;
        sqlitedatabase.beginTransaction();
        sqlitestatement16 = null;
        sqlitestatement16 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement16, "accessibility_script_injection", 0x7f05001a);
        sqlitestatement16.close();
        sqlitestatement16 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement16, "accessibility_web_content_key_bindings", 0x7f04000d);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement16 != null)
            sqlitestatement16.close();
        k = 58;
        if (k != 58)
            break MISSING_BLOCK_LABEL_1996;
        j1 = getIntValueFromSystem(sqlitedatabase, "auto_time", 0);
        sqlitedatabase.beginTransaction();
        sqlitestatement15 = null;
        sqlitestatement15 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        Integer integer1 = Integer.valueOf(j1);
        loadSetting(sqlitestatement15, "auto_time_zone", integer1);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement15 != null)
            sqlitestatement15.close();
        k = 59;
        if (k != 59)
            break MISSING_BLOCK_LABEL_2053;
        sqlitedatabase.beginTransaction();
        sqlitestatement14 = null;
        sqlitestatement14 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement14, "user_rotation", 0x7f060007);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement14 != null)
            sqlitestatement14.close();
        k = 60;
        if (k == 60)
            k = 61;
        if (k == 61)
            k = 62;
        if (k == 62)
            k = 63;
        if (k != 63)
            break MISSING_BLOCK_LABEL_2151;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='mode_ringer_streams_affected'");
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT INTO system ('name', 'value') values ('mode_ringer_streams_affected', '").append(String.valueOf(174)).append("')").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 64;
        if (k != 64)
            break MISSING_BLOCK_LABEL_2213;
        sqlitedatabase.beginTransaction();
        sqlitestatement13 = null;
        sqlitestatement13 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadIntegerSetting(sqlitestatement13, "long_press_timeout", 0x7f06000a);
        sqlitestatement13.close();
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement13 != null)
            sqlitestatement13.close();
        k = 65;
        if (k != 65)
            break MISSING_BLOCK_LABEL_2278;
        sqlitedatabase.beginTransaction();
        sqlitestatement12 = null;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='window_animation_scale'");
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='transition_animation_scale'");
        sqlitestatement12 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadDefaultAnimationSettings(sqlitestatement12);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement12 != null)
            sqlitestatement12.close();
        k = 66;
        if (k != 66)
            break MISSING_BLOCK_LABEL_2370;
        sqlitedatabase.beginTransaction();
        i1 = 166;
        if (!mContext.getResources().getBoolean(0x1110030))
            i1 |= 8;
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='mode_ringer_streams_affected'");
        sqlitedatabase.execSQL((new StringBuilder()).append("INSERT INTO system ('name', 'value') values ('mode_ringer_streams_affected', '").append(String.valueOf(i1)).append("')").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 67;
        if (k != 67)
            break MISSING_BLOCK_LABEL_2432;
        sqlitedatabase.beginTransaction();
        sqlitestatement11 = null;
        sqlitestatement11 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement11, "touch_exploration_enabled", 0x7f05001c);
        sqlitestatement11.close();
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement11 != null)
            sqlitestatement11.close();
        k = 68;
        if (k != 68)
            break MISSING_BLOCK_LABEL_2462;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='notifications_use_ring_volume'");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 69;
        if (k != 69)
            break MISSING_BLOCK_LABEL_2611;
        s2 = mContext.getResources().getString(0x7f040001);
        s3 = mContext.getResources().getString(0x7f040002);
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL((new StringBuilder()).append("UPDATE system SET value='").append(s2).append("' ").append("WHERE name='").append("airplane_mode_radios").append("'").toString());
        sqlitedatabase.execSQL((new StringBuilder()).append("UPDATE system SET value='").append(s3).append("' ").append("WHERE name='").append("airplane_mode_toggleable_radios").append("'").toString());
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 70;
        if (k == 70)
        {
            loadBookmarks(sqlitedatabase);
            k = 71;
        }
        if (k != 71)
            break MISSING_BLOCK_LABEL_2684;
        sqlitedatabase.beginTransaction();
        sqlitestatement10 = null;
        sqlitestatement10 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement10, "speak_password", 0x7f05001b);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement10 != null)
            sqlitestatement10.close();
        k = 72;
        if (k != 72)
            break MISSING_BLOCK_LABEL_2741;
        sqlitedatabase.beginTransaction();
        sqlitestatement9 = null;
        sqlitestatement9 = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO system(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement9, "vibrate_in_silent", 0x7f050019);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement9 != null)
            sqlitestatement9.close();
        k = 73;
        if (k == 73)
        {
            upgradeVibrateSettingFromNone(sqlitedatabase);
            k = 74;
        }
        if (k != 74)
            break MISSING_BLOCK_LABEL_2814;
        sqlitedatabase.beginTransaction();
        sqlitestatement8 = null;
        sqlitestatement8 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement8, "accessibility_script_injection_url", 0x7f04000e);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement8 != null)
            sqlitestatement8.close();
        k = 75;
        if (k != 75)
            break MISSING_BLOCK_LABEL_2941;
        sqlitedatabase.beginTransaction();
        sqlitestatement7 = null;
        cursor = null;
        cursor = sqlitedatabase.query("secure", new String[] {
            "_id", "value"
        }, "name='lockscreen.disabled'", null, null, null, null);
        sqlitestatement7 = null;
        if (cursor == null)
            break MISSING_BLOCK_LABEL_2886;
        l = cursor.getCount();
        sqlitestatement7 = null;
        if (l != 0)
            break MISSING_BLOCK_LABEL_2907;
        sqlitestatement7 = sqlitedatabase.compileStatement("INSERT INTO system(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement7, "lockscreen.disabled", 0x7f050016);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (cursor != null)
            cursor.close();
        if (sqlitestatement7 != null)
            sqlitestatement7.close();
        k = 76;
        if (k != 76)
            break MISSING_BLOCK_LABEL_2971;
        sqlitedatabase.beginTransaction();
        sqlitedatabase.execSQL("DELETE FROM system WHERE name='vibrate_in_silent'");
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 77;
        if (k == 77)
        {
            loadVibrateWhenRingingSetting(sqlitedatabase);
            k = 78;
        }
        if (k != 78)
            break MISSING_BLOCK_LABEL_3044;
        sqlitedatabase.beginTransaction();
        sqlitestatement6 = null;
        sqlitestatement6 = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement6, "accessibility_script_injection_url", 0x7f04000e);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement6 != null)
            sqlitestatement6.close();
        k = 79;
        if (k != 79)
            break MISSING_BLOCK_LABEL_3188;
        Exception exception;
        String s;
        Integer integer;
        String as[];
        String as1[];
        boolean flag;
        boolean flag1;
        String s1;
        Exception exception17;
        Exception exception18;
        Exception exception19;
        Exception exception20;
        Exception exception21;
        Exception exception22;
        Exception exception23;
        Exception exception24;
        Exception exception25;
        Exception exception26;
        Exception exception27;
        Exception exception28;
        Exception exception29;
        Exception exception30;
        Exception exception31;
        Exception exception32;
        Exception exception33;
        Exception exception34;
        Exception exception35;
        Exception exception36;
        Exception exception37;
        Exception exception38;
        Exception exception39;
        Exception exception40;
        Exception exception41;
        Exception exception42;
        Exception exception43;
        Exception exception44;
        Exception exception45;
        Exception exception46;
        Exception exception47;
        Exception exception48;
        Exception exception49;
        Exception exception50;
        Exception exception51;
        Exception exception52;
        Exception exception53;
        Exception exception54;
        Exception exception55;
        Exception exception56;
        if (getIntValueFromTable(sqlitedatabase, "secure", "accessibility_enabled", 0) == 1)
            flag = true;
        else
            flag = false;
        if (getIntValueFromTable(sqlitedatabase, "secure", "touch_exploration_enabled", 0) == 1)
            flag1 = true;
        else
            flag1 = false;
        if (!flag || !flag1)
            break MISSING_BLOCK_LABEL_3184;
        s1 = getStringValueFromTable(sqlitedatabase, "secure", "enabled_accessibility_services", "");
        if (!TextUtils.isEmpty(getStringValueFromTable(sqlitedatabase, "secure", "touch_exploration_granted_accessibility_services", "")) || TextUtils.isEmpty(s1))
            break MISSING_BLOCK_LABEL_3184;
        sqlitestatement5 = null;
        sqlitedatabase.beginTransaction();
        sqlitestatement5 = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);");
        loadSetting(sqlitestatement5, "touch_exploration_granted_accessibility_services", s1);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement5 != null)
            sqlitestatement5.close();
        k = 80;
        if (k != 80)
            break MISSING_BLOCK_LABEL_3293;
        sqlitedatabase.beginTransaction();
        sqlitestatement4 = null;
        sqlitestatement4 = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement4, "screensaver_enabled", 0x1110041);
        loadBooleanSetting(sqlitestatement4, "screensaver_activate_on_dock", 0x1110042);
        loadBooleanSetting(sqlitestatement4, "screensaver_activate_on_sleep", 0x1110043);
        loadStringSetting(sqlitestatement4, "screensaver_components", 0x104002c);
        loadStringSetting(sqlitestatement4, "screensaver_default_component", 0x104002c);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement4 != null)
            sqlitestatement4.close();
        k = 81;
        if (k != 81)
            break MISSING_BLOCK_LABEL_3350;
        sqlitedatabase.beginTransaction();
        sqlitestatement3 = null;
        sqlitestatement3 = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement3, "package_verifier_enable", 0x7f05000a);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement3 != null)
            sqlitestatement3.close();
        k = 82;
        if (k != 82)
            break MISSING_BLOCK_LABEL_3425;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_3421;
        sqlitedatabase.beginTransaction();
        createGlobalTable(sqlitedatabase);
        moveSettingsToNewTable(sqlitedatabase, "system", "global", hashsetToStringArray(SettingsProvider.sSystemGlobalKeys), false);
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", hashsetToStringArray(SettingsProvider.sSecureGlobalKeys), false);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        k = 83;
        if (k != 83)
            break MISSING_BLOCK_LABEL_3535;
        sqlitedatabase.beginTransaction();
        sqlitestatement2 = null;
        sqlitestatement2 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement2, "accessibility_display_magnification_enabled", 0x7f05001d);
        sqlitestatement2.close();
        sqlitestatement2 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadFractionSetting(sqlitestatement2, "accessibility_display_magnification_scale", 0x7f070002, 1);
        sqlitestatement2.close();
        sqlitestatement2 = sqlitedatabase.compileStatement("INSERT INTO secure(name,value) VALUES(?,?);");
        loadBooleanSetting(sqlitestatement2, "accessibility_display_magnification_auto_update", 0x7f05001e);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement2 != null)
            sqlitestatement2.close();
        k = 84;
        if (k != 84)
            break MISSING_BLOCK_LABEL_3622;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_3618;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", new String[] {
            "adb_enabled", "bluetooth_on", "data_roaming", "device_provisioned", "install_non_market_apps", "usb_mass_storage_enabled"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        k = 85;
        if (k != 85)
            break MISSING_BLOCK_LABEL_3672;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_3668;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "system", "global", new String[] {
            "stay_on_while_plugged_in"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 86;
        if (k != 86)
            break MISSING_BLOCK_LABEL_3734;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_3730;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", new String[] {
            "package_verifier_enable", "verifier_timeout", "verifier_default_response"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 87;
        if (k != 87)
            break MISSING_BLOCK_LABEL_3796;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_3792;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", new String[] {
            "data_stall_alarm_non_aggressive_delay_in_ms", "data_stall_alarm_aggressive_delay_in_ms", "gprs_register_check_period_ms"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 88;
        if (k != 88)
            break MISSING_BLOCK_LABEL_4052;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4048;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", new String[] {
            "battery_discharge_duration_threshold", "battery_discharge_threshold", "send_action_app_error", "dropbox_age_seconds", "dropbox_max_files", "dropbox_quota_kb", "dropbox_quota_percent", "dropbox_reserve_percent", "dropbox:", "logcat_for_", 
            "sys_free_storage_log_interval", "disk_free_change_reporting_threshold", "sys_storage_threshold_percentage", "sys_storage_threshold_max_bytes", "sys_storage_full_threshold_bytes", "sync_max_retry_delay_in_seconds", "connectivity_change_delay", "captive_portal_detection_enabled", "captive_portal_server", "nsd_on", 
            "set_install_location", "default_install_location", "inet_condition_debounce_up_delay", "inet_condition_debounce_down_delay", "read_external_storage_enforced_default", "http_proxy", "global_http_proxy_host", "global_http_proxy_port", "global_http_proxy_exclusion_list", "set_global_http_proxy", 
            "default_dns_server"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 89;
        if (k != 89)
            break MISSING_BLOCK_LABEL_4113;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4109;
        sqlitedatabase.beginTransaction();
        movePrefixedSettingsToNewTable(sqlitedatabase, "secure", "global", new String[] {
            "bluetooth_headset_priority_", "bluetooth_a2dp_sink_priority_", "bluetooth_input_device_priority_"
        });
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 90;
        if (k != 90)
            break MISSING_BLOCK_LABEL_4263;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4259;
        sqlitedatabase.beginTransaction();
        as = (new String[] {
            "window_animation_scale", "transition_animation_scale", "animator_duration_scale", "fancy_ime_animations", "compatibility_mode", "emergency_tone", "call_auto_retry", "debug_app", "wait_for_debugger", "show_processes", 
            "always_finish_activities"
        });
        as1 = (new String[] {
            "preferred_network_mode", "preferred_cdma_subscription"
        });
        moveSettingsToNewTable(sqlitedatabase, "system", "global", as, true);
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", as1, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 91;
        if (k != 91)
            break MISSING_BLOCK_LABEL_4313;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4309;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "system", "global", new String[] {
            "mode_ringer"
        }, true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        k = 92;
        if (k != 92) goto _L2; else goto _L1
_L1:
        sqlitestatement1 = null;
        sqlitestatement1 = sqlitedatabase.compileStatement("INSERT OR IGNORE INTO secure(name,value) VALUES(?,?);");
        if (mUserHandle != 0) goto _L4; else goto _L3
_L3:
        integer = Integer.valueOf(getIntValueFromTable(sqlitedatabase, "global", "device_provisioned", 0));
        loadSetting(sqlitestatement1, "user_setup_complete", integer);
_L6:
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        k = 93;
_L2:
        if (k != 93)
            break MISSING_BLOCK_LABEL_4450;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4446;
        sqlitedatabase.beginTransaction();
        moveSettingsToNewTable(sqlitedatabase, "system", "global", hashsetToStringArray(SettingsProvider.sSystemGlobalKeys), true);
        moveSettingsToNewTable(sqlitedatabase, "secure", "global", hashsetToStringArray(SettingsProvider.sSecureGlobalKeys), true);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        k = 94;
        if (k != 94)
            break MISSING_BLOCK_LABEL_4514;
        if (mUserHandle != 0)
            break MISSING_BLOCK_LABEL_4510;
        sqlitedatabase.beginTransaction();
        sqlitestatement = null;
        sqlitestatement = sqlitedatabase.compileStatement("INSERT OR REPLACE INTO global(name,value) VALUES(?,?);");
        loadStringSetting(sqlitestatement, "wireless_charging_started_sound", 0x7f04000c);
        sqlitedatabase.setTransactionSuccessful();
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        k = 95;
        if (k != j)
        {
            Log.w("SettingsProvider", (new StringBuilder()).append("Got stuck trying to upgrade from version ").append(k).append(", must wipe the settings provider").toString());
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS global");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS globalIndex1");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS system");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS systemIndex1");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS secure");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS secureIndex1");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS gservices");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS gservicesIndex1");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS bluetooth_devices");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS bookmarks");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS bookmarksIndex1");
            sqlitedatabase.execSQL("DROP INDEX IF EXISTS bookmarksIndex2");
            sqlitedatabase.execSQL("DROP TABLE IF EXISTS favorites");
            onCreate(sqlitedatabase);
            s = (new StringBuilder()).append(i).append("/").append(k).append("/").append(j).toString();
            sqlitedatabase.execSQL((new StringBuilder()).append("INSERT INTO secure(name,value) values('wiped_db_reason','").append(s).append("');").toString());
        }
        return;
        exception56;
        sqlitedatabase.endTransaction();
        throw exception56;
        exception55;
        sqlitedatabase.endTransaction();
        throw exception55;
        exception54;
        sqlitedatabase.endTransaction();
        throw exception54;
        exception53;
        sqlitedatabase.endTransaction();
        throw exception53;
        exception;
        sqlitedatabase.endTransaction();
        throw exception;
        exception52;
        sqlitedatabase.endTransaction();
        throw exception52;
        exception51;
        sqlitedatabase.endTransaction();
        if (sqlitestatement27 != null)
            sqlitestatement27.close();
        throw exception51;
        exception50;
        sqlitedatabase.endTransaction();
        throw exception50;
        exception49;
        sqlitedatabase.endTransaction();
        throw exception49;
        exception48;
        sqlitedatabase.endTransaction();
        if (sqlitestatement26 != null)
            sqlitestatement26.close();
        throw exception48;
        exception47;
        sqlitedatabase.endTransaction();
        throw exception47;
        exception46;
        sqlitedatabase.endTransaction();
        if (sqlitestatement25 != null)
            sqlitestatement25.close();
        throw exception46;
        exception45;
        sqlitedatabase.endTransaction();
        throw exception45;
        exception44;
        sqlitedatabase.endTransaction();
        if (sqlitestatement24 != null)
            sqlitestatement24.close();
        throw exception44;
        exception43;
        sqlitedatabase.endTransaction();
        if (sqlitestatement23 != null)
            sqlitestatement23.close();
        throw exception43;
        exception42;
        sqlitedatabase.endTransaction();
        if (sqlitestatement22 != null)
            sqlitestatement22.close();
        throw exception42;
        exception41;
        sqlitedatabase.endTransaction();
        if (sqlitestatement21 != null)
            sqlitestatement21.close();
        throw exception41;
        exception40;
        sqlitedatabase.endTransaction();
        throw exception40;
        exception39;
        sqlitedatabase.endTransaction();
        throw exception39;
        exception38;
        sqlitedatabase.endTransaction();
        throw exception38;
        exception37;
        sqlitedatabase.endTransaction();
        if (sqlitestatement20 != null)
            sqlitestatement20.close();
        throw exception37;
        exception36;
        sqlitedatabase.endTransaction();
        if (sqlitestatement19 != null)
            sqlitestatement19.close();
        throw exception36;
        exception35;
        sqlitedatabase.endTransaction();
        throw exception35;
        exception34;
        sqlitedatabase.endTransaction();
        if (sqlitestatement18 != null)
            sqlitestatement18.close();
        throw exception34;
        exception33;
        sqlitedatabase.endTransaction();
        if (sqlitestatement17 != null)
            sqlitestatement17.close();
        throw exception33;
        exception32;
        sqlitedatabase.endTransaction();
        if (sqlitestatement16 != null)
            sqlitestatement16.close();
        throw exception32;
        exception31;
        sqlitedatabase.endTransaction();
        if (sqlitestatement15 != null)
            sqlitestatement15.close();
        throw exception31;
        exception30;
        sqlitedatabase.endTransaction();
        if (sqlitestatement14 != null)
            sqlitestatement14.close();
        throw exception30;
        exception29;
        sqlitedatabase.endTransaction();
        throw exception29;
        exception28;
        sqlitedatabase.endTransaction();
        if (sqlitestatement13 != null)
            sqlitestatement13.close();
        throw exception28;
        exception27;
        sqlitedatabase.endTransaction();
        if (sqlitestatement12 != null)
            sqlitestatement12.close();
        throw exception27;
        exception26;
        sqlitedatabase.endTransaction();
        throw exception26;
        exception25;
        sqlitedatabase.endTransaction();
        if (sqlitestatement11 != null)
            sqlitestatement11.close();
        throw exception25;
        exception24;
        sqlitedatabase.endTransaction();
        throw exception24;
        exception23;
        sqlitedatabase.endTransaction();
        throw exception23;
        exception22;
        sqlitedatabase.endTransaction();
        if (sqlitestatement10 != null)
            sqlitestatement10.close();
        throw exception22;
        exception21;
        sqlitedatabase.endTransaction();
        if (sqlitestatement9 != null)
            sqlitestatement9.close();
        throw exception21;
        exception20;
        sqlitedatabase.endTransaction();
        if (sqlitestatement8 != null)
            sqlitestatement8.close();
        throw exception20;
        exception19;
        sqlitedatabase.endTransaction();
        if (cursor != null)
            cursor.close();
        if (sqlitestatement7 != null)
            sqlitestatement7.close();
        throw exception19;
        exception18;
        sqlitedatabase.endTransaction();
        throw exception18;
        exception17;
        sqlitedatabase.endTransaction();
        if (sqlitestatement6 != null)
            sqlitestatement6.close();
        throw exception17;
        Exception exception16;
        exception16;
        sqlitedatabase.endTransaction();
        if (sqlitestatement5 != null)
            sqlitestatement5.close();
        throw exception16;
        Exception exception15;
        exception15;
        sqlitedatabase.endTransaction();
        if (sqlitestatement4 != null)
            sqlitestatement4.close();
        throw exception15;
        Exception exception14;
        exception14;
        sqlitedatabase.endTransaction();
        if (sqlitestatement3 != null)
            sqlitestatement3.close();
        throw exception14;
        Exception exception13;
        exception13;
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        else
            throw exception13;
        Exception exception12;
        exception12;
        sqlitedatabase.endTransaction();
        if (sqlitestatement2 != null)
            sqlitestatement2.close();
        throw exception12;
        Exception exception11;
        exception11;
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        else
            throw exception11;
        Exception exception10;
        exception10;
        sqlitedatabase.endTransaction();
        throw exception10;
        Exception exception9;
        exception9;
        sqlitedatabase.endTransaction();
        throw exception9;
        Exception exception8;
        exception8;
        sqlitedatabase.endTransaction();
        throw exception8;
        Exception exception7;
        exception7;
        sqlitedatabase.endTransaction();
        throw exception7;
        Exception exception6;
        exception6;
        sqlitedatabase.endTransaction();
        throw exception6;
        Exception exception5;
        exception5;
        sqlitedatabase.endTransaction();
        throw exception5;
        Exception exception4;
        exception4;
        sqlitedatabase.endTransaction();
        throw exception4;
_L4:
        loadBooleanSetting(sqlitestatement1, "user_setup_complete", 0x7f050022);
        if (true) goto _L6; else goto _L5
_L5:
        Exception exception3;
        exception3;
        if (sqlitestatement1 != null)
            sqlitestatement1.close();
        throw exception3;
        Exception exception2;
        exception2;
        sqlitedatabase.endTransaction();
        if (false)
            throw null;
        else
            throw exception2;
        Exception exception1;
        exception1;
        sqlitedatabase.endTransaction();
        if (sqlitestatement != null)
            sqlitestatement.close();
        throw exception1;
    }

    static 
    {
        mValidTables = new HashSet();
        mValidTables.add("system");
        mValidTables.add("secure");
        mValidTables.add("global");
        mValidTables.add("bluetooth_devices");
        mValidTables.add("bookmarks");
        mValidTables.add("favorites");
        mValidTables.add("gservices");
        mValidTables.add("old_favorites");
    }
}
