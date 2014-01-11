// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import com.mediatek.xlog.Xlog;

public class OOBEConstants
{

    public static final String ACTION_ADVANCED_SETTINGS = "com.mediatek.oobe.advanced.AdvanceSettings";
    public static final String ACTION_DATE_TIME_SETTING = "com.android.settings.DATE_TIME_SETTINGS_WIZARD";
    public static final String ACTION_DEFAULT_SIM = "com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD";
    public static final String ACTION_IMPORT_CONTACTS = "com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS";
    public static final String ACTION_INTERNET_CONNECTION = "com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION";
    public static final String ACTION_KEYBOARD_SETTING = "com.mediatek.oobe.basic.OOBE_KEYBOARD_SETTING";
    public static final String ACTION_LANGUAGE_SETTING = "com.mediatek.oobe.basic.OOBE_LANGUAGE_SETTING";
    public static final String ACTION_QUICK_START_GUIDE = "com.mediatek.oobe.QUICK_START_GUIDE";
    public static final String ACTION_SIM_MANAGEMENT = "com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD";
    public static final String ACTION_SNS_SETTING = "com.mediatek.oobe.advanced.SNSSettings";
    public static final String ACTION_TIMEZONE_PICKER = "com.mediatek.oobe.basic.TIMEZONE_PICKER_WIZARD";
    public static final String ACTION_WIFI_SETTING = "com.mediatek.oobe.basic.WIFI_SETTINGS_WIZARD";
    public static final boolean DEBUG = false;
    public static final int ID_BASIC_CONGRATULATION = 9;
    public static final int ID_DATE_TIME_SETTING = 8;
    public static final int ID_DEFAULT_SIM_SETTING = 4;
    public static final int ID_IMPORT_CONTACTS = 5;
    public static final int ID_INTERNET_CONNECTION = 6;
    public static final int ID_KEYBOARD_SETTING = 2;
    public static final int ID_LANGUAGE_SETTING = 1;
    public static final int ID_SIM_MANAGEMENT_SETTING = 3;
    public static final int ID_WIFI_SETTING = 7;
    public static final String OOBE_BASIC_RESULT = "oobe_result";
    public static final String OOBE_BASIC_STEP_INDEX = "oobe_step_index";
    public static final String OOBE_BASIC_STEP_TOTAL = "oobe_step_total";
    public static final String OOBE_HAS_RUN_KEY = "oobe_has_run";
    public static final int RESULT_CODE_BACK = 21;
    public static final int RESULT_CODE_FINISH = 22;
    public static final int RESULT_CODE_NEXT = 20;
    public static final int RESULT_CODE_SKIP = 24;
    public static final int RESULT_QUICK_START_GUIDE_FINISH = 25;
    public static final String TAG = "OOBE";
    public static final boolean WITH_GESTURE = true;


    public static void logd(String s)
    {
    }

    public static void loge(String s)
    {
        Xlog.e("OOBE", s);
    }

    public static void logi(String s)
    {
    }

    public static void logw(String s)
    {
    }
}
