// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.*;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.tvout.ITVOUTNative;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class TVOutSettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final String KEY_TVOUT_ENABLE = "tvout_enable";
    private static final String KEY_TV_SYSTEM = "tv_system";
    private static final String PROFILE_TV_OUT_SETTINGS = "tv_out";
    private static final String TAG = "TV_OUT";
    private static boolean sIsFirst = true;
    private static boolean sIsFirstFire = true;
    private static boolean sNeedUserEnable = false;
    private CheckBoxPreference mEnablePreference;
    private ListPreference mTVSystem;
    private ITVOUTNative mTvOut;

    public TVOutSettings()
    {
        mTvOut = null;
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050042);
        if (mTvOut == null)
            mTvOut = (ITVOUTNative)MediatekClassFactory.createInstance(com/mediatek/common/tvout/ITVOUTNative, new Object[0]);
        mEnablePreference = (CheckBoxPreference)findPreference("tvout_enable");
        mTVSystem = (ListPreference)findPreference("tv_system");
        sNeedUserEnable = mTvOut.isShowButton();
        if (sNeedUserEnable)
        {
            mEnablePreference.setOnPreferenceChangeListener(this);
            Xlog.i("TV_OUT", "[TVOUT] enable button ");
        }
        mTVSystem.setOnPreferenceChangeListener(this);
        if (sIsFirst)
        {
            Xlog.i("TV_OUT", "First launch");
            mEnablePreference.setChecked(false);
            sIsFirst = false;
        }
        PreferenceScreen preferencescreen = getPreferenceScreen();
        if (!sNeedUserEnable)
        {
            preferencescreen.removePreference(mEnablePreference);
            Xlog.i("TV_OUT", "[TVOUT] no enable button ,remove");
        }
    }

    public void onDestroy()
    {
        super.onDestroy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if (sNeedUserEnable && "tvout_enable".equals(s))
            if (obj.equals(Boolean.valueOf(false)))
            {
                mTvOut.enableTvOut(false);
            } else
            {
                if (sIsFirstFire)
                {
                    String s1 = mTVSystem.getValue();
                    Xlog.i("TV_OUT", (new StringBuilder()).append("First enable, system type is:").append(s1).toString());
                    if (s1.equals("NTSC"))
                        mTvOut.setTvSystem(0);
                    else
                        mTvOut.setTvSystem(1);
                    sIsFirstFire = false;
                }
                mTvOut.enableTvOut(true);
            }
        if ("tv_system".equals(s))
        {
            getActivity().getSharedPreferences("tv_out", 0).edit().putString("tv_system", obj.toString()).commit();
            if (obj.equals("NTSC"))
                mTvOut.setTvSystem(0);
            else
                mTvOut.setTvSystem(1);
            mTVSystem.setSummary(obj.toString());
        }
        return true;
    }

    public void onResume()
    {
        String s = getActivity().getSharedPreferences("tv_out", 0).getString("tv_system", "NTSC");
        Xlog.i("TV_OUT", (new StringBuilder()).append("onResume, tv system is:").append(s).toString());
        mTVSystem.setValue(s);
        mTVSystem.setSummary(s);
        super.onResume();
    }

}
