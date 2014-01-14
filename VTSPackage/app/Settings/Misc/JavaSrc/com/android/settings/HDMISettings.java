// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.app.Activity;
import android.content.*;
import android.os.Bundle;
import android.os.IBinder;
import android.preference.*;
import com.mediatek.hdmi.HDMILocalService;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class HDMISettings extends SettingsPreferenceFragment
    implements android.preference.Preference.OnPreferenceChangeListener
{

    private static final int HDMI_VIDEO_RESOLUTION_DEFAULT = 2;
    private static final String KEY_TOGGLE_AUDIO = "audio_toggler";
    private static final String KEY_TOGGLE_HDMI = "hdmi_toggler";
    private static final String KEY_TOGGLE_VIDEO = "video_toggler";
    private static final String KEY_VIDEO_RESOLUTION = "video_resolution";
    private static final String KEY_VIDEO_RESOLUTION_8193 = "video_resolution_8193";
    private static final String TAG = "hdmi";
    private HDMILocalService mHDMIService;
    private ServiceConnection mHDMIServiceConn;
    private boolean mIsHDMIEnabled;
    BroadcastReceiver mLocalServiceReceiver;
    private CheckBoxPreference mToggleAudioPref;
    private CheckBoxPreference mToggleHDMIPref;
    private CheckBoxPreference mToggleVideoPref;
    private ListPreference mVideoResolutionPref;
    private ListPreference mVideoResolutionPrefTemp;

    public HDMISettings()
    {
        mHDMIService = null;
        mIsHDMIEnabled = false;
        mHDMIServiceConn = new ServiceConnection() {

            final HDMISettings this$0;

            public void onServiceConnected(ComponentName componentname, IBinder ibinder)
            {
                mHDMIService = ((com.mediatek.hdmi.HDMILocalService.LocalBinder)ibinder).getService();
                Xlog.w("hdmi", "HDMISettings, HDMILocalService is connected");
                updateSettingsItemEnableStatus();
                updateSelectedResolution();
            }

            public void onServiceDisconnected(ComponentName componentname)
            {
                mHDMIService = null;
            }

            
            {
                this$0 = HDMISettings.this;
                super();
            }
        }
;
        mLocalServiceReceiver = new BroadcastReceiver() {

            final HDMISettings this$0;

            public void onReceive(Context context, Intent intent)
            {
                if ("com.mediatek.hdmi.localservice.action.CABLE_STATE_CHANGED".equals(intent.getAction()))
                    updateSettingsItemEnableStatus();
            }

            
            {
                this$0 = HDMISettings.this;
                super();
            }
        }
;
    }

    private void updatePref()
    {
        boolean flag;
        if (android.provider.Settings.System.getInt(getContentResolver(), "hdmi_enable_status", 1) == 1)
            flag = true;
        else
            flag = false;
        mIsHDMIEnabled = flag;
        boolean flag1;
        if (android.provider.Settings.System.getInt(getContentResolver(), "hdmi_audio_status", 1) == 1)
            flag1 = true;
        else
            flag1 = false;
        boolean flag2;
        if (android.provider.Settings.System.getInt(getContentResolver(), "hdmi_video_status", 0) == 1)
            flag2 = true;
        else
            flag2 = false;
        mToggleHDMIPref.setChecked(mIsHDMIEnabled);
        if (mToggleAudioPref != null)
            mToggleAudioPref.setChecked(flag1);
        if (mToggleVideoPref != null)
            mToggleVideoPref.setChecked(flag2);
        updateSelectedResolution();
    }

    private void updateSelectedResolution()
    {
        Xlog.i("hdmi", "HDMISettings>>updateSelectedResolution()");
        if (mHDMIService != null) goto _L2; else goto _L1
_L1:
        Xlog.e("hdmi", "HDMISettings>>updateSelectedResolution(), service have not been connected, wait");
          goto _L3
_L2:
        String s;
        CharSequence acharsequence[];
        int i;
        int j;
        s = android.provider.Settings.System.getString(getContentResolver(), "hdmi_video_resolution");
        acharsequence = mVideoResolutionPref.getEntryValues();
        i = -1;
        j = 0;
_L9:
        if (j >= acharsequence.length) goto _L5; else goto _L4
_L4:
        if (!acharsequence[j].toString().equals(s)) goto _L7; else goto _L6
_L6:
        i = j;
_L5:
        if (i != -1)
        {
            mVideoResolutionPref.setValueIndex(i);
            return;
        }
        Xlog.i("hdmi", " set HDMI video resolution to default value, the first one");
        mVideoResolutionPref.setValueIndex(0);
        if (mHDMIService != null)
        {
            mHDMIService.setVideoResolution(Integer.parseInt(acharsequence[0].toString()));
            return;
        }
_L3:
        return;
_L7:
        j++;
        if (true) goto _L9; else goto _L8
_L8:
    }

    private void updateSettingsItemEnableStatus()
    {
        Xlog.i("hdmi", "HDMISettings>>updateSettingsItemEnableStatus()");
        if (mHDMIService == null)
        {
            Xlog.i("hdmi", "HDMI service has not connected, wait");
            return;
        }
        boolean flag = mHDMIService.isCablePluged();
        boolean flag1;
        if (android.provider.Settings.System.getInt(getContentResolver(), "hdmi_enable_status", 1) == 1)
            flag1 = true;
        else
            flag1 = false;
        mIsHDMIEnabled = flag1;
        boolean flag2;
        if (flag && mIsHDMIEnabled)
            flag2 = true;
        else
            flag2 = false;
        Xlog.d("hdmi", (new StringBuilder()).append("Is cable pluged?").append(flag).append(", isHDMIEnabled?").append(mIsHDMIEnabled).toString());
        if (mToggleAudioPref != null)
            mToggleAudioPref.setEnabled(flag2);
        if (mToggleVideoPref != null)
            mToggleVideoPref.setEnabled(flag2);
        mVideoResolutionPref.setEnabled(flag2);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Xlog.i("hdmi", ">>HDMISettings.onCreate()");
        addPreferencesFromResource(0x7f05001b);
        mToggleHDMIPref = (CheckBoxPreference)findPreference("hdmi_toggler");
        mToggleHDMIPref.setOnPreferenceChangeListener(this);
        mToggleAudioPref = (CheckBoxPreference)findPreference("audio_toggler");
        mToggleAudioPref.setOnPreferenceChangeListener(this);
        mToggleVideoPref = (CheckBoxPreference)findPreference("video_toggler");
        mToggleVideoPref.setOnPreferenceChangeListener(this);
        Xlog.e("hdmi", "It is not MT8193");
        mVideoResolutionPref = (ListPreference)findPreference("video_resolution");
        mVideoResolutionPref.setOnPreferenceChangeListener(this);
        mVideoResolutionPrefTemp = (ListPreference)findPreference("video_resolution_8193");
        getPreferenceScreen().removePreference(mVideoResolutionPrefTemp);
        if (!getActivity().bindService(new Intent(getActivity(), com/mediatek/hdmi/HDMILocalService), mHDMIServiceConn, 1))
        {
            Xlog.e("hdmi", "HDMISettings fail to bind HDMI service");
            mToggleHDMIPref.setEnabled(false);
            mToggleAudioPref.setEnabled(false);
            mToggleVideoPref.setEnabled(false);
            mVideoResolutionPref.setEnabled(false);
        }
        if (mToggleAudioPref != null)
            getPreferenceScreen().removePreference(mToggleAudioPref);
        if (mToggleVideoPref != null)
            getPreferenceScreen().removePreference(mToggleVideoPref);
        IntentFilter intentfilter = new IntentFilter();
        intentfilter.addAction("com.mediatek.hdmi.localservice.action.CABLE_STATE_CHANGED");
        getActivity().registerReceiver(mLocalServiceReceiver, intentfilter);
    }

    public void onDestroy()
    {
        getActivity().unbindService(mHDMIServiceConn);
        getActivity().unregisterReceiver(mLocalServiceReceiver);
        super.onDestroy();
    }

    public boolean onPreferenceChange(Preference preference, Object obj)
    {
        String s = preference.getKey();
        if (mHDMIService == null)
        {
            Xlog.e("hdmi", "HDMISettings  -- Connection to HDMI local service have not been established.");
            return false;
        }
        if ("hdmi_toggler".equals(s))
        {
            boolean flag2 = ((Boolean)obj).booleanValue();
            mHDMIService.enableHDMI(flag2);
            android.content.ContentResolver contentresolver2 = getContentResolver();
            int k;
            if (flag2)
                k = 1;
            else
                k = 0;
            android.provider.Settings.System.putInt(contentresolver2, "hdmi_enable_status", k);
            updateSettingsItemEnableStatus();
        } else
        if ("audio_toggler".equals(s))
        {
            boolean flag1 = ((Boolean)obj).booleanValue();
            mHDMIService.enableAudio(flag1);
            android.content.ContentResolver contentresolver1 = getContentResolver();
            int j = 0;
            if (flag1)
                j = 1;
            android.provider.Settings.System.putInt(contentresolver1, "hdmi_audio_status", j);
        } else
        if ("video_toggler".equals(s))
        {
            boolean flag = ((Boolean)obj).booleanValue();
            mHDMIService.enableVideo(flag);
            android.content.ContentResolver contentresolver = getContentResolver();
            int i = 0;
            if (flag)
                i = 1;
            android.provider.Settings.System.putInt(contentresolver, "hdmi_video_status", i);
        } else
        if ("video_resolution".equals(s))
        {
            Xlog.e("hdmi", (new StringBuilder()).append("HDMISettings  -- key: ").append(s).append(" newValue: ").append((String)obj).toString());
            String s2 = (String)obj;
            mHDMIService.setVideoResolution(Integer.parseInt(s2));
            android.provider.Settings.System.putString(getContentResolver(), "hdmi_video_resolution", s2);
        } else
        if ("video_resolution_8193".equals(s))
        {
            Xlog.e("hdmi", (new StringBuilder()).append("HDMISettings  -- key: ").append(s).append(" newValue: ").append((String)obj).toString());
            String s1 = (String)obj;
            if (s1.equals("100"))
            {
                HDMILocalService _tmp = mHDMIService;
                if (HDMILocalService.sEdid != null)
                {
                    HDMILocalService _tmp1 = mHDMIService;
                    if (1 == (1 & HDMILocalService.sEdid[0] >> 1))
                    {
                        s1 = "102";
                    } else
                    {
                        HDMILocalService _tmp2 = mHDMIService;
                        if (1 == (1 & HDMILocalService.sEdid[1] >> 11))
                        {
                            s1 = "103";
                        } else
                        {
                            HDMILocalService _tmp3 = mHDMIService;
                            if (1 == (1 & HDMILocalService.sEdid[0]))
                            {
                                s1 = "100";
                            } else
                            {
                                HDMILocalService _tmp4 = mHDMIService;
                                if (1 == (1 & HDMILocalService.sEdid[1] >> 10))
                                    s1 = "101";
                            }
                        }
                    }
                }
            } else
            if (s1.equals("8"))
            {
                HDMILocalService _tmp5 = mHDMIService;
                if (1 == (1 & HDMILocalService.sEdid[0] >> 21))
                    s1 = "9";
                HDMILocalService _tmp6 = mHDMIService;
                if (1 == (1 & HDMILocalService.sEdid[1] >> 20))
                    s1 = "8";
            }
            Xlog.e("hdmi", (new StringBuilder()).append("Final resolution: ").append(s1).toString());
            mHDMIService.setVideoResolution(Integer.parseInt(s1));
            android.provider.Settings.System.putString(getContentResolver(), "hdmi_video_resolution", s1);
        }
        return true;
    }

    public void onResume()
    {
        updatePref();
        updateSettingsItemEnableStatus();
        super.onResume();
    }


/*
    static HDMILocalService access$002(HDMISettings hdmisettings, HDMILocalService hdmilocalservice)
    {
        hdmisettings.mHDMIService = hdmilocalservice;
        return hdmilocalservice;
    }

*/


}
