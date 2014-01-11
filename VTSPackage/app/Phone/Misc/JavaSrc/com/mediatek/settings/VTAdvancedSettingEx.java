// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.app.ActionBar;
import android.content.*;
import android.os.Bundle;
import android.preference.*;
import android.view.MenuItem;
import com.mediatek.xlog.Xlog;
import java.util.List;

// Referenced classes of package com.mediatek.settings:
//            PreCheckForRunning, CallSettings, MultipleSimActivity

public class VTAdvancedSettingEx extends PreferenceActivity
{

    private static final String BUTTON_CALL_ADDITIONAL_KEY = "button_more_expand_key";
    private static final String BUTTON_CALL_BAR_KEY = "button_cb_expand_key";
    private static final String BUTTON_CALL_FWD_KEY = "button_cf_expand_key";
    private static final String BUTTON_VT_AUTO_DROPBACK_KEY = "button_vt_auto_dropback_key";
    private static final String BUTTON_VT_ENABLE_BACK_CAMERA_KEY = "button_vt_enable_back_camera_key";
    private static final String BUTTON_VT_ENABLE_PEER_REPLACE_KEY = "button_vt_enable_peer_replace_key";
    private static final String BUTTON_VT_MO_LOCAL_VIDEO_DISPLAY_KEY = "button_vt_mo_local_video_display_key";
    private static final String BUTTON_VT_MT_LOCAL_VIDEO_DISPLAY_KEY = "button_vt_mt_local_video_display_key";
    private static final String BUTTON_VT_PEER_BIGGER_KEY = "button_vt_peer_bigger_key";
    private static final String BUTTON_VT_PEER_REPLACE_KEY = "button_vt_replace_peer_expand_key";
    private static final String BUTTON_VT_REPLACE_KEY = "button_vt_replace_expand_key";
    private static final String BUTTON_VT_RINGTONE_KEY = "button_vt_ringtone_key";
    private static final String CHECKBOX_RING_ONLY_ONCE = "ring_only_once";
    private static final boolean DBG = true;
    private static final String LOG_TAG = "Settings/VTAdvancedSetting";
    public static final int REQUESTCODE_PICTRUE_PICKED_WITH_DATA = 3021;
    private static final String SELECT_DEFAULT_PICTURE = "0";
    private static final String SELECT_DEFAULT_PICTURE2 = "0";
    private static final String SELECT_MY_PICTURE = "2";
    private static final String SELECT_MY_PICTURE2 = "1";
    private Preference mButtonCallAdditional;
    private Preference mButtonCallBar;
    private Preference mButtonCallFwd;
    private Preference mButtonVTAutoDropBack;
    private Preference mButtonVTEnablePeerReplace;
    private Preference mButtonVTEnablebackCamer;
    private Preference mButtonVTMoVideo;
    private Preference mButtonVTMtVideo;
    private Preference mButtonVTPeerBigger;
    private Preference mButtonVTPeerReplace;
    private Preference mButtonVTReplace;
    private CheckBoxPreference mCheckBoxRingOnlyOnce;
    private IntentFilter mIntentFilter;
    private boolean mIsOnlyOneSim;
    private PreCheckForRunning mPreCfr;
    private BroadcastReceiver mReceiver;
    private long mSimIds[];

    public VTAdvancedSettingEx()
    {
        mSimIds = null;
        mPreCfr = null;
        mIsOnlyOneSim = false;
        mReceiver = new BroadcastReceiver() {

            final VTAdvancedSettingEx this$0;

            public void onReceive(Context context, Intent intent)
            {
                List list;
label0:
                {
                    if (intent.getAction().equals("android.intent.action.SIM_INFO_UPDATE"))
                    {
                        list = android.provider.Telephony.SIMInfo.getInsertedSIMList(context);
                        if (list.size() != 0)
                            break label0;
                        Xlog.d("Settings/VTAdvancedSetting", "Activity finished");
                        CallSettings.goUpToTopLevelSetting(VTAdvancedSettingEx.this);
                    }
                    return;
                }
                if (list.size() == 1)
                {
                    Xlog.d("Settings/VTAdvancedSetting", (new StringBuilder()).append("temp.size()=").append(list.size()).append("Activity finished").toString());
                    CallSettings.goUpToTopLevelSetting(VTAdvancedSettingEx.this);
                    return;
                } else
                {
                    mSimIds = CallSettings.get3GSimCards(VTAdvancedSettingEx.this);
                    setScreenEnabled();
                    return;
                }
            }

            
            {
                this$0 = VTAdvancedSettingEx.this;
                super();
            }
        }
;
    }

    private String getKeyValue(String s)
    {
        return PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getString(s, null);
    }

    private static void log(String s)
    {
        Xlog.d("Settings/VTAdvancedSetting", s);
    }

    private void setKeyValue(String s, String s1)
    {
        android.content.SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).edit();
        editor.putString(s, s1);
        editor.commit();
    }

    private void setScreenEnabled()
    {
        boolean flag;
        if (mSimIds.length > 0)
            flag = true;
        else
            flag = false;
        if (mButtonVTReplace.isEnabled() && !flag || !mButtonVTReplace.isEnabled() && flag)
        {
            mButtonVTReplace.setEnabled(flag);
            mButtonVTEnablebackCamer.setEnabled(flag);
            mButtonVTPeerBigger.setEnabled(flag);
            mButtonVTMoVideo.setEnabled(flag);
            mButtonVTMtVideo.setEnabled(flag);
            mButtonCallAdditional.setEnabled(flag);
            mButtonCallFwd.setEnabled(flag);
            mButtonCallBar.setEnabled(flag);
            mButtonVTPeerReplace.setEnabled(flag);
            mButtonVTEnablePeerReplace.setEnabled(flag);
            mButtonVTAutoDropBack.setEnabled(flag);
        }
    }

    protected void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f060024);
        mPreCfr = new PreCheckForRunning(this);
        android.provider.Telephony.SIMInfo.getInsertedSIMList(this);
        mSimIds = CallSettings.get3GSimCards(this);
        mButtonVTReplace = findPreference("button_vt_replace_expand_key");
        mButtonVTEnablebackCamer = findPreference("button_vt_enable_back_camera_key");
        mButtonVTPeerBigger = findPreference("button_vt_peer_bigger_key");
        mButtonVTMoVideo = findPreference("button_vt_mo_local_video_display_key");
        mButtonVTMtVideo = findPreference("button_vt_mt_local_video_display_key");
        mButtonCallAdditional = findPreference("button_more_expand_key");
        mButtonCallFwd = findPreference("button_cf_expand_key");
        mButtonCallBar = findPreference("button_cb_expand_key");
        mButtonVTPeerReplace = findPreference("button_vt_replace_peer_expand_key");
        mButtonVTEnablePeerReplace = findPreference("button_vt_enable_peer_replace_key");
        mButtonVTAutoDropBack = findPreference("button_vt_auto_dropback_key");
        mCheckBoxRingOnlyOnce = (CheckBoxPreference)findPreference("ring_only_once");
        Xlog.d("MyLog", "FeatureOption.MTK_VT3G324M_SUPPORT=falseFeatureOption.MTK_PHONE_VT_VOICE_ANSWER=false");
        getPreferenceScreen().removePreference(mCheckBoxRingOnlyOnce);
        mIntentFilter = new IntentFilter("android.intent.action.SIM_INFO_UPDATE");
        registerReceiver(mReceiver, mIntentFilter);
        ActionBar actionbar = getActionBar();
        if (actionbar != null)
            actionbar.setDisplayHomeAsUpEnabled(true);
    }

    protected void onDestroy()
    {
        super.onDestroy();
        if (mPreCfr != null)
            mPreCfr.deRegister();
        unregisterReceiver(mReceiver);
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        switch (menuitem.getItemId())
        {
        case 16908332: 
            finish();
            return true;
        }
        return super.onOptionsItemSelected(menuitem);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        if (preference == mButtonCallFwd)
        {
            Intent intent10 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent10.putExtra("INIT_TITLE_NAME", 0x7f0d01c6);
            intent10.putExtra("INIT_FEATURE_NAME", "VT");
            intent10.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent10.putExtra("INIT_SIM_ID", mSimIds);
            intent10.putExtra("TARGET_CLASS", "com.android.phone.GsmUmtsCallForwardOptions");
            startActivity(intent10);
            return true;
        }
        if (preference == mButtonCallBar)
        {
            Intent intent9 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent9.putExtra("ISVT", true);
            intent9.putExtra("INIT_TITLE_NAME", 0x7f0d00b9);
            intent9.putExtra("INIT_FEATURE_NAME", "VT");
            intent9.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent9.putExtra("INIT_SIM_ID", mSimIds);
            intent9.putExtra("TARGET_CLASS", "com.mediatek.settings.CallBarring");
            startActivity(intent9);
            return true;
        }
        if (preference == mButtonCallAdditional)
        {
            Intent intent8 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent8.putExtra("INIT_TITLE_NAME", 0x7f0d01b8);
            intent8.putExtra("INIT_FEATURE_NAME", "VT");
            intent8.putExtra("ITEM_TYPE", "PreferenceScreen");
            intent8.putExtra("INIT_SIM_ID", mSimIds);
            intent8.putExtra("TARGET_CLASS", "com.android.phone.GsmUmtsAdditionalCallOptions");
            startActivity(intent8);
            return true;
        }
        if (preference == mButtonVTEnablebackCamer)
        {
            Intent intent7 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent7.putExtra("INIT_FEATURE_NAME", "VT");
            intent7.putExtra("INIT_SIM_ID", mSimIds);
            intent7.putExtra("INIT_TITLE_NAME", 0x7f0d0025);
            intent7.putExtra("INIT_BASE_KEY", "button_vt_enable_back_camera_key@");
            intent7.putExtra("ITEM_TYPE", "CheckBoxPreference");
            startActivity(intent7);
            return true;
        }
        if (preference == mButtonVTReplace)
        {
            Intent intent6 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent6.putExtra("INIT_TITLE_NAME", 0x7f0d00f7);
            intent6.putExtra("INIT_FEATURE_NAME", "VT");
            intent6.putExtra("ITEM_TYPE", "ListPreference");
            intent6.putExtra("LIST_TITLE_NAME", 0x7f0d00f7);
            intent6.putExtra("INIT_ARRAY", 0x7f07000e);
            intent6.putExtra("INIT_SIM_ID", mSimIds);
            if (getKeyValue("button_vt_replace_expand_key") == null)
                setKeyValue("button_vt_replace_expand_key", "0");
            intent6.putExtra("INIT_BASE_KEY", "button_vt_replace_expand_key@");
            intent6.putExtra("INIT_ARRAY_VALUE", 0x7f070010);
            startActivity(intent6);
            return true;
        }
        if (preference == mButtonVTPeerBigger)
        {
            Intent intent5 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent5.putExtra("INIT_FEATURE_NAME", "VT");
            intent5.putExtra("INIT_SIM_ID", mSimIds);
            intent5.putExtra("INIT_TITLE_NAME", 0x7f0d0027);
            intent5.putExtra("ITEM_TYPE", "CheckBoxPreference");
            intent5.putExtra("INIT_BASE_KEY", "button_vt_peer_bigger_key@");
            startActivity(intent5);
        } else
        if (preference == mButtonVTMoVideo)
        {
            Intent intent4 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
            intent4.putExtra("INIT_FEATURE_NAME", "VT");
            intent4.putExtra("INIT_SIM_ID", mSimIds);
            intent4.putExtra("INIT_TITLE_NAME", 0x7f0d0029);
            intent4.putExtra("ITEM_TYPE", "CheckBoxPreference");
            intent4.putExtra("INIT_BASE_KEY", "button_vt_mo_local_video_display_key@");
            startActivity(intent4);
        } else
        {
            if (preference == mButtonVTMtVideo)
            {
                Intent intent3 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                intent3.putExtra("INIT_TITLE_NAME", 0x7f0d001e);
                intent3.putExtra("INIT_FEATURE_NAME", "VT");
                intent3.putExtra("LIST_TITLE_NAME", 0x7f0d001e);
                intent3.putExtra("ITEM_TYPE", "ListPreference");
                intent3.putExtra("INIT_ARRAY", 0x7f070012);
                intent3.putExtra("INIT_SIM_ID", mSimIds);
                if (getKeyValue("button_vt_mt_local_video_display_key") == null)
                    setKeyValue("button_vt_mt_local_video_display_key", "0");
                intent3.putExtra("INIT_BASE_KEY", "button_vt_mt_local_video_display_key@");
                intent3.putExtra("INIT_ARRAY_VALUE", 0x7f070013);
                startActivity(intent3);
                return true;
            }
            if (preference == mButtonVTPeerReplace)
            {
                Intent intent2 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                intent2.putExtra("INIT_TITLE_NAME", 0x7f0d0047);
                intent2.putExtra("INIT_FEATURE_NAME", "VT");
                intent2.putExtra("ITEM_TYPE", "ListPreference");
                intent2.putExtra("LIST_TITLE_NAME", 0x7f0d0047);
                intent2.putExtra("INIT_ARRAY", 0x7f07000f);
                intent2.putExtra("INIT_SIM_ID", mSimIds);
                if (getKeyValue("button_vt_replace_peer_expand_key") == null)
                    setKeyValue("button_vt_replace_peer_expand_key", "0");
                intent2.putExtra("INIT_BASE_KEY", "button_vt_replace_peer_expand_key@");
                intent2.putExtra("INIT_ARRAY_VALUE", 0x7f070011);
                startActivity(intent2);
                return true;
            }
            if (preference == mButtonVTEnablePeerReplace)
            {
                Intent intent1 = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                intent1.putExtra("INIT_FEATURE_NAME", "VT");
                intent1.putExtra("INIT_SIM_ID", mSimIds);
                intent1.putExtra("INIT_TITLE_NAME", 0x7f0d0045);
                intent1.putExtra("ITEM_TYPE", "CheckBoxPreference");
                intent1.putExtra("INIT_BASE_KEY", "button_vt_enable_peer_replace_key@");
                startActivity(intent1);
            } else
            if (preference == mButtonVTAutoDropBack)
            {
                Intent intent = new Intent(this, com/mediatek/settings/MultipleSimActivity);
                intent.putExtra("INIT_FEATURE_NAME", "VT");
                intent.putExtra("INIT_SIM_ID", mSimIds);
                intent.putExtra("INIT_TITLE_NAME", 0x7f0d004c);
                intent.putExtra("ITEM_TYPE", "CheckBoxPreference");
                intent.putExtra("INIT_BASE_KEY", "button_vt_auto_dropback_key@");
                startActivity(intent);
            }
        }
        return false;
    }

    protected void onResume()
    {
        super.onResume();
        setScreenEnabled();
    }


/*
    static long[] access$002(VTAdvancedSettingEx vtadvancedsettingex, long al[])
    {
        vtadvancedsettingex.mSimIds = al;
        return al;
    }

*/

}
