// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.android.phone.PhoneGlobals;
import com.mediatek.vt.VTManager;

// Referenced classes of package com.mediatek.settings:
//            VTAdvancedSetting

public class VTSettingUtils
{
    public class VTEngineerModeValues
    {

        public boolean auto_answer;
        public String auto_answer_time;
        public String config_audio_channel_adapt;
        public String config_multiplex_level;
        public String config_terminal_type;
        public String config_use_wnsrp;
        public String config_video_channel_adapt;
        public String config_video_channel_reverse;
        public String config_video_codec_preference;
        public boolean debug_message;
        public boolean h223_raw_data;
        public boolean h263_only;
        public int log_filter_tag_0_value;
        public int log_filter_tag_1_value;
        public int log_filter_tag_2_value;
        public int log_filter_tag_3_value;
        public int log_filter_tag_4_value;
        public int log_filter_tag_5_value;
        public int log_filter_tag_6_value;
        public boolean log_to_file;
        public String peer_audio_recoder_format;
        public boolean peer_audio_recoder_service;
        public String peer_video_recoder_format;
        public boolean peer_video_recoder_service;
        final VTSettingUtils this$0;
        public String working_mode;
        public String working_mode_detail;

        public void resetValuesToDefault()
        {
            working_mode = "0";
            working_mode_detail = "0";
            config_audio_channel_adapt = "0";
            config_video_channel_adapt = "0";
            config_video_channel_reverse = "0";
            config_multiplex_level = "0";
            config_video_codec_preference = "0";
            config_use_wnsrp = "0";
            config_terminal_type = "0";
            auto_answer = false;
            auto_answer_time = "0";
            peer_audio_recoder_service = false;
            peer_audio_recoder_format = "0";
            peer_video_recoder_service = false;
            peer_video_recoder_format = "0";
            debug_message = false;
            h223_raw_data = false;
            log_to_file = false;
            h263_only = false;
            log_filter_tag_0_value = 24;
            log_filter_tag_1_value = 24;
            log_filter_tag_2_value = 24;
            log_filter_tag_3_value = 24;
            log_filter_tag_4_value = 24;
            log_filter_tag_5_value = 24;
            log_filter_tag_6_value = 24;
        }

        public VTEngineerModeValues()
        {
            this$0 = VTSettingUtils.this;
            super();
            resetValuesToDefault();
        }
    }


    private static final boolean DBG = true;
    private static final boolean DBGEM = true;
    private static final String LOG_TAG = "VTSettingUtils";
    private static final VTSettingUtils VT_SETTINGS_UTILS = new VTSettingUtils();
    public boolean mAutoDropBack;
    public boolean mEnableBackCamera;
    public boolean mPeerBigger;
    public String mPicToReplaceLocal;
    public String mPicToReplacePeer;
    public boolean mRingOnlyOnce;
    public boolean mShowLocalMO;
    public String mShowLocalMT;
    public boolean mToReplacePeer;
    public VTEngineerModeValues mVTEngineerModeValues;

    private VTSettingUtils()
    {
        mVTEngineerModeValues = new VTEngineerModeValues();
        resetVTSettingToDefaultValue();
    }

    public static VTSettingUtils getInstance()
    {
        return VT_SETTINGS_UTILS;
    }

    private static void log(String s)
    {
        Log.d("VTSettingUtils", s);
    }

    public void resetVTSettingToDefaultValue()
    {
        mPicToReplaceLocal = "0";
        mEnableBackCamera = true;
        mPeerBigger = true;
        mShowLocalMO = true;
        mShowLocalMT = "0";
        mRingOnlyOnce = false;
        mAutoDropBack = false;
        mToReplacePeer = true;
        mPicToReplacePeer = "0";
    }

    public void updateVTEngineerModeValues()
    {
        log("updateVTEngineerModeValues()...");
        Context context;
        SharedPreferences sharedpreferences;
        try
        {
            context = PhoneGlobals.getInstance().createPackageContext("com.mediatek.engineermode", 1);
        }
        catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
        {
            log("updateVTEngineerModeValues() : can not find 'com.mediatek.engineermode'...");
            return;
        }
        sharedpreferences = context.getSharedPreferences("engineermode_vt_preferences", 1);
        if (sharedpreferences == null)
        {
            log("updateVTEngineerModeValues() : can not find 'engineermode_vt_preferences'...");
            return;
        }
        mVTEngineerModeValues.working_mode = sharedpreferences.getString("working_mode", "0");
        mVTEngineerModeValues.working_mode_detail = sharedpreferences.getString("working_mode_detail", "0");
        mVTEngineerModeValues.config_audio_channel_adapt = sharedpreferences.getString("config_audio_channel_adapt", "0");
        mVTEngineerModeValues.config_video_channel_adapt = sharedpreferences.getString("config_video_channel_adapt", "0");
        mVTEngineerModeValues.config_video_channel_reverse = sharedpreferences.getString("config_video_channel_reverse", "0");
        mVTEngineerModeValues.config_multiplex_level = sharedpreferences.getString("config_multiplex_level", "0");
        mVTEngineerModeValues.config_video_codec_preference = sharedpreferences.getString("config_video_codec_preference", "0");
        mVTEngineerModeValues.config_use_wnsrp = sharedpreferences.getString("config_use_wnsrp", "0");
        mVTEngineerModeValues.config_terminal_type = sharedpreferences.getString("config_terminal_type", "0");
        mVTEngineerModeValues.auto_answer = sharedpreferences.getBoolean("auto_answer", false);
        mVTEngineerModeValues.auto_answer_time = sharedpreferences.getString("auto_answer_time", "0");
        mVTEngineerModeValues.peer_audio_recoder_service = sharedpreferences.getBoolean("peer_audio_recoder_service", false);
        mVTEngineerModeValues.peer_audio_recoder_format = sharedpreferences.getString("peer_audio_recoder_format", "0");
        mVTEngineerModeValues.peer_video_recoder_service = sharedpreferences.getBoolean("peer_video_recoder_service", false);
        mVTEngineerModeValues.peer_video_recoder_format = sharedpreferences.getString("peer_video_recoder_format", "0");
        mVTEngineerModeValues.debug_message = sharedpreferences.getBoolean("debug_message", false);
        mVTEngineerModeValues.h223_raw_data = sharedpreferences.getBoolean("h223_raw_data", false);
        mVTEngineerModeValues.log_to_file = sharedpreferences.getBoolean("log_to_file", false);
        mVTEngineerModeValues.h263_only = sharedpreferences.getBoolean("h263_only", false);
        mVTEngineerModeValues.log_filter_tag_0_value = sharedpreferences.getInt("log_filter_tag_0_value", 24);
        mVTEngineerModeValues.log_filter_tag_1_value = sharedpreferences.getInt("log_filter_tag_1_value", 24);
        mVTEngineerModeValues.log_filter_tag_2_value = sharedpreferences.getInt("log_filter_tag_2_value", 24);
        mVTEngineerModeValues.log_filter_tag_3_value = sharedpreferences.getInt("log_filter_tag_3_value", 24);
        mVTEngineerModeValues.log_filter_tag_4_value = sharedpreferences.getInt("log_filter_tag_4_value", 24);
        mVTEngineerModeValues.log_filter_tag_5_value = sharedpreferences.getInt("log_filter_tag_5_value", 24);
        mVTEngineerModeValues.log_filter_tag_6_value = sharedpreferences.getInt("log_filter_tag_6_value", 24);
        log((new StringBuilder()).append(" - mVTEngineerModeValues.working_mode = ").append(mVTEngineerModeValues.working_mode).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.working_mode_detail = ").append(mVTEngineerModeValues.working_mode_detail).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_audio_channel_adapt = ").append(mVTEngineerModeValues.config_audio_channel_adapt).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_video_channel_adapt = ").append(mVTEngineerModeValues.config_video_channel_adapt).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_video_channel_reverse = ").append(mVTEngineerModeValues.config_video_channel_reverse).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_multiplex_level = ").append(mVTEngineerModeValues.config_multiplex_level).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_video_codec_preference = ").append(mVTEngineerModeValues.config_video_codec_preference).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_use_wnsrp = ").append(mVTEngineerModeValues.config_use_wnsrp).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.config_terminal_type = ").append(mVTEngineerModeValues.config_terminal_type).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.auto_answer = ").append(mVTEngineerModeValues.auto_answer).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.auto_answer_time = ").append(mVTEngineerModeValues.auto_answer_time).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.peer_audio_recoder_service = ").append(mVTEngineerModeValues.peer_audio_recoder_service).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.peer_audio_recoder_format = ").append(mVTEngineerModeValues.peer_audio_recoder_format).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.peer_video_recoder_service = ").append(mVTEngineerModeValues.peer_video_recoder_service).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.peer_video_recoder_format = ").append(mVTEngineerModeValues.peer_video_recoder_format).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.debug_message = ").append(mVTEngineerModeValues.debug_message).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.h223_raw_data = ").append(mVTEngineerModeValues.h223_raw_data).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_to_file = ").append(mVTEngineerModeValues.log_to_file).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.h263_only = ").append(mVTEngineerModeValues.h263_only).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_0_value = ").append(mVTEngineerModeValues.log_filter_tag_0_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_1_value = ").append(mVTEngineerModeValues.log_filter_tag_1_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_2_value = ").append(mVTEngineerModeValues.log_filter_tag_2_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_3_value = ").append(mVTEngineerModeValues.log_filter_tag_3_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_4_value = ").append(mVTEngineerModeValues.log_filter_tag_4_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_5_value = ").append(mVTEngineerModeValues.log_filter_tag_5_value).toString());
        log((new StringBuilder()).append(" - mVTEngineerModeValues.log_filter_tag_6_value = ").append(mVTEngineerModeValues.log_filter_tag_6_value).toString());
        VTManager.setEM(0, (new Integer(mVTEngineerModeValues.working_mode)).intValue(), (new Integer(mVTEngineerModeValues.working_mode_detail)).intValue());
        VTManager.setEM(1, 0, (new Integer(mVTEngineerModeValues.config_audio_channel_adapt)).intValue());
        VTManager.setEM(1, 1, (new Integer(mVTEngineerModeValues.config_video_channel_adapt)).intValue());
        VTManager.setEM(1, 2, (new Integer(mVTEngineerModeValues.config_video_channel_reverse)).intValue());
        VTManager.setEM(1, 3, (new Integer(mVTEngineerModeValues.config_multiplex_level)).intValue());
        VTManager.setEM(1, 4, (new Integer(mVTEngineerModeValues.config_video_codec_preference)).intValue());
        VTManager.setEM(1, 5, (new Integer(mVTEngineerModeValues.config_use_wnsrp)).intValue());
        VTManager.setEM(1, 6, (new Integer(mVTEngineerModeValues.config_terminal_type)).intValue());
        if (mVTEngineerModeValues.peer_audio_recoder_service)
            VTManager.setEM(3, 0, 1);
        else
            VTManager.setEM(3, 0, 0);
        VTManager.setEM(3, 1, (new Integer(mVTEngineerModeValues.peer_audio_recoder_format)).intValue());
        if (mVTEngineerModeValues.peer_video_recoder_service)
            VTManager.setEM(4, 0, 1);
        else
            VTManager.setEM(4, 0, 0);
        VTManager.setEM(4, 1, (new Integer(mVTEngineerModeValues.peer_video_recoder_format)).intValue());
        if (mVTEngineerModeValues.debug_message)
            VTManager.setEM(5, 1, 0);
        else
            VTManager.setEM(5, 0, 0);
        if (mVTEngineerModeValues.h223_raw_data)
            VTManager.setEM(6, 1, 0);
        else
            VTManager.setEM(6, 0, 0);
        if (mVTEngineerModeValues.log_to_file)
            VTManager.setEM(7, 1, 0);
        else
            VTManager.setEM(7, 0, 0);
        VTManager.setEM(8, 0, mVTEngineerModeValues.log_filter_tag_0_value);
        VTManager.setEM(8, 1, mVTEngineerModeValues.log_filter_tag_1_value);
        VTManager.setEM(8, 2, mVTEngineerModeValues.log_filter_tag_2_value);
        VTManager.setEM(8, 3, mVTEngineerModeValues.log_filter_tag_3_value);
        VTManager.setEM(8, 4, mVTEngineerModeValues.log_filter_tag_4_value);
        VTManager.setEM(8, 5, mVTEngineerModeValues.log_filter_tag_5_value);
        VTManager.setEM(8, 6, mVTEngineerModeValues.log_filter_tag_6_value);
        if (mVTEngineerModeValues.h263_only)
        {
            VTManager.setEM(9, 1, 0);
            return;
        } else
        {
            VTManager.setEM(9, 0, 0);
            return;
        }
    }

    public void updateVTSettingState(int i)
    {
        log("updateVTSettingState()...");
        SharedPreferences sharedpreferences = PhoneGlobals.getInstance().getApplicationContext().getSharedPreferences("com.android.phone_preferences", 0);
        if (sharedpreferences == null)
        {
            log("updateVTEngineerModeValues() : can not find 'com.android.phone_preferences'...");
            return;
        }
        mPicToReplaceLocal = sharedpreferences.getString((new StringBuilder()).append("button_vt_replace_expand_key_").append(i).toString(), "0");
        mEnableBackCamera = sharedpreferences.getBoolean((new StringBuilder()).append("button_vt_enable_back_camera_key_").append(i).toString(), true);
        mPeerBigger = sharedpreferences.getBoolean((new StringBuilder()).append("button_vt_peer_bigger_key_").append(i).toString(), true);
        mShowLocalMO = sharedpreferences.getBoolean((new StringBuilder()).append("button_vt_mo_local_video_display_key_").append(i).toString(), true);
        mShowLocalMT = sharedpreferences.getString((new StringBuilder()).append("button_vt_mt_local_video_display_key_").append(i).toString(), "0");
        mRingOnlyOnce = sharedpreferences.getBoolean("ring_only_once", true);
        mAutoDropBack = sharedpreferences.getBoolean((new StringBuilder()).append("button_vt_auto_dropback_key_").append(i).toString(), false);
        mToReplacePeer = sharedpreferences.getBoolean((new StringBuilder()).append("button_vt_enable_peer_replace_key_").append(i).toString(), true);
        mPicToReplacePeer = sharedpreferences.getString((new StringBuilder()).append("button_vt_replace_peer_expand_key_").append(i).toString(), "0");
        log((new StringBuilder()).append(" - mPicToReplaceLocal = ").append(mPicToReplaceLocal).toString());
        log((new StringBuilder()).append(" - mEnableBackCamera = ").append(mEnableBackCamera).toString());
        log((new StringBuilder()).append(" - mPeerBigger = ").append(mPeerBigger).toString());
        log((new StringBuilder()).append(" - mShowLocalMO = ").append(mShowLocalMO).toString());
        log((new StringBuilder()).append(" - mShowLocalMT = ").append(mShowLocalMT).toString());
        log((new StringBuilder()).append(" - mAutoDropBack = ").append(mAutoDropBack).toString());
        log((new StringBuilder()).append(" - mRingOnlyOnce = ").append(mRingOnlyOnce).toString());
        log((new StringBuilder()).append(" - mToReplacePeer = ").append(mToReplacePeer).toString());
        log((new StringBuilder()).append(" - mPicToReplacePeer = ").append(mPicToReplacePeer).toString());
        log("updateVTSettingState() : call VTManager.replacePeerVideoSettings() start !");
        if (mPicToReplacePeer.equals("0"))
        {
            if (mToReplacePeer)
                VTManager.getInstance().replacePeerVideoSettings(1, VTAdvancedSetting.getPicPathDefault2());
            else
                VTManager.getInstance().replacePeerVideoSettings(0, VTAdvancedSetting.getPicPathDefault2());
        } else
        if (mToReplacePeer)
            VTManager.getInstance().replacePeerVideoSettings(1, VTAdvancedSetting.getPicPathUserselect2(i));
        else
            VTManager.getInstance().replacePeerVideoSettings(0, VTAdvancedSetting.getPicPathUserselect2(i));
        log("updateVTSettingState() : call VTManager.replacePeerVideoSettings() end !");
    }

}
