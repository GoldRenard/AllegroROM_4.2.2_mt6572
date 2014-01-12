// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lbs;

import android.app.*;
import android.content.*;
import android.content.res.Resources;
import android.database.Cursor;
import android.os.Bundle;
import android.os.SystemProperties;
import android.preference.*;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.android.settings.SettingsPreferenceFragment;
import com.mediatek.common.agps.MtkAgpsManager;
import com.mediatek.common.epo.MtkEpoClientManager;
import com.mediatek.xlog.Xlog;
import java.util.Observable;
import java.util.Observer;

// Referenced classes of package com.mediatek.lbs:
//            EPOSettings, AgpsSettings

public class AgpsEpoSettings extends SettingsPreferenceFragment
    implements android.widget.CompoundButton.OnCheckedChangeListener
{

    private static final int CONFIRM_AGPS_DIALOG_ID = 1;
    private static final int CONFIRM_EPO_DIALOG_ID = 0;
    private static final String KEY_AGPS_ENABLER = "agps_enabler";
    private static final String KEY_AGPS_SETTINGS = "agps_settings";
    private static final String KEY_EPO_ENABLER = "epo_enabler";
    private static final String KEY_EPO_SETTINGS = "epo_settings";
    private static final String TAG = "AgpsEpoSettings";
    private CheckBoxPreference mAgpsCB;
    private MtkAgpsManager mAgpsMgr;
    private Preference mAgpsPref;
    private ContentQueryMap mContentQueryMap;
    private ContentResolver mContentResolver;
    private Switch mEnabledSwitch;
    private CheckBoxPreference mEpoEnalberPref;
    private MtkEpoClientManager mEpoMgr;
    private Preference mEpoSettingPref;
    private Cursor mSettingsCursor;
    private Observer mSettingsObserver;


    private void createPreferenceHierarchy()
    {
        addPreferencesFromResource(0x7f050003);
        mEpoEnalberPref = (CheckBoxPreference)findPreference("epo_enabler");
        mEpoSettingPref = findPreference("epo_settings");
        mEpoMgr = (MtkEpoClientManager)getSystemService("mtk-epo-client");
        mAgpsMgr = (MtkAgpsManager)getSystemService("mtk-agps");
        mAgpsPref = findPreference("agps_settings");
        mAgpsCB = (CheckBoxPreference)findPreference("agps_enabler");
    }

    private void updateLocationToggles()
    {
        boolean flag = android.provider.Settings.Secure.isLocationProviderEnabled(mContentResolver, "gps");
        mEnabledSwitch.setChecked(flag);
        if (mAgpsCB != null && mAgpsMgr != null)
        {
            mAgpsCB.setChecked(mAgpsMgr.getStatus());
            mAgpsCB.setEnabled(mEnabledSwitch.isChecked());
        }
        if (mEpoMgr != null)
        {
            mEpoEnalberPref.setChecked(mEpoMgr.getStatus());
            mEpoEnalberPref.setEnabled(mEnabledSwitch.isChecked());
        }
    }

    public void onActivityCreated(Bundle bundle)
    {
        super.onActivityCreated(bundle);
        Activity activity = getActivity();
        mEnabledSwitch = new Switch(activity);
        boolean flag = android.provider.Settings.Secure.isLocationProviderEnabled(mContentResolver, "gps");
        mEnabledSwitch.setChecked(flag);
        int i = activity.getResources().getDimensionPixelSize(0x7f0d0002);
        mEnabledSwitch.setPadding(0, 0, i, 0);
        mEnabledSwitch.setOnCheckedChangeListener(this);
    }

    public void onCheckedChanged(CompoundButton compoundbutton, boolean flag)
    {
        Xlog.d("AgpsEpoSettings", (new StringBuilder()).append("[f] onCheckedChanged ").append(flag).append("; ").append(compoundbutton.isChecked()).toString());
        if (compoundbutton == mEnabledSwitch)
        {
            Xlog.d("AgpsEpoSettings", "[f] onCheckedChanged buttonview is mEnableSwitch");
            android.provider.Settings.Secure.setLocationProviderEnabled(mContentResolver, "gps", flag);
        }
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        Activity activity = getActivity();
        mContentResolver = getContentResolver();
        createPreferenceHierarchy();
        if (!"tablet".equals(SystemProperties.get("ro.build.characteristics")) || !getResources().getBoolean(0x1110007))
            activity.getActionBar().setTitle(0x7f0b05e6);
    }

    public Dialog onCreateDialog(int i)
    {
        switch (i)
        {
        case 1: // '\001'
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b0041).setMessage(0x7f0b0042).setIcon(0x1080027).setPositiveButton(0x7f0b0043, new android.content.DialogInterface.OnClickListener() {

                final AgpsEpoSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mAgpsCB.setChecked(true);
                    mAgpsMgr.enable();
                }

            
            {
                this$0 = AgpsEpoSettings.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0044, new android.content.DialogInterface.OnClickListener() {

                final AgpsEpoSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    Xlog.d("AgpsEpoSettings", (new StringBuilder()).append("-->mAgpsMgr.getStatus()").append(mAgpsMgr.getStatus()).toString());
                    if (!mAgpsMgr.getStatus())
                        mAgpsCB.setChecked(false);
                    Xlog.i("AgpsEpoSettings", "DenyDenyDeny");
                }

            
            {
                this$0 = AgpsEpoSettings.this;
                super();
            }
            }
).create();

        case 0: // '\0'
            return (new android.app.AlertDialog.Builder(getActivity())).setTitle(0x7f0b003d).setIcon(0x1080027).setMessage(0x7f0b003e).setPositiveButton(0x7f0b003f, new android.content.DialogInterface.OnClickListener() {

                final AgpsEpoSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mEpoEnalberPref.setChecked(true);
                    mEpoMgr.enable();
                }

            
            {
                this$0 = AgpsEpoSettings.this;
                super();
            }
            }
).setNegativeButton(0x7f0b0040, new android.content.DialogInterface.OnClickListener() {

                final AgpsEpoSettings this$0;

                public void onClick(DialogInterface dialoginterface, int j)
                {
                    mEpoEnalberPref.setChecked(false);
                    Xlog.i("AgpsEpoSettings", "User Deny Enbale EPO Service");
                }

            
            {
                this$0 = AgpsEpoSettings.this;
                super();
            }
            }
).create();
        }
        return null;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
label0:
        {
            if (preference == mEpoEnalberPref)
            {
                if (mEpoEnalberPref.isChecked())
                {
                    mEpoEnalberPref.setChecked(false);
                    showDialog(0);
                } else
                {
                    mEpoMgr.disable();
                }
            } else
            if (preference == mEpoSettingPref)
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/lbs/EPOSettings.getName(), null, 0x7f0b003a, null, null, 0);
            else
            if (preference == mAgpsCB)
            {
                if (mAgpsCB.isChecked())
                {
                    mAgpsCB.setChecked(false);
                    showDialog(1);
                } else
                {
                    mAgpsMgr.disable();
                }
            } else
            {
                if (preference != mAgpsPref)
                    break label0;
                ((PreferenceActivity)getActivity()).startPreferencePanel(com/mediatek/lbs/AgpsSettings.getName(), null, 0x7f0b003c, null, null, 0);
            }
            return true;
        }
        return super.onPreferenceTreeClick(preferencescreen, preference);
    }

    public void onResume()
    {
        super.onResume();
        updateLocationToggles();
        if (mSettingsObserver == null)
            mSettingsObserver = new Observer() {

                final AgpsEpoSettings this$0;

                public void update(Observable observable, Object obj)
                {
                    updateLocationToggles();
                }

            
            {
                this$0 = AgpsEpoSettings.this;
                super();
            }
            }
;
        mContentQueryMap.addObserver(mSettingsObserver);
    }

    public void onStart()
    {
        super.onStart();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(16, 16);
        activity.getActionBar().setCustomView(mEnabledSwitch, new android.app.ActionBar.LayoutParams(-2, -2, 21));
        mSettingsCursor = mContentResolver.query(android.provider.Settings.Secure.CONTENT_URI, null, "(name=?)", new String[] {
            "location_providers_allowed"
        }, null);
        mContentQueryMap = new ContentQueryMap(mSettingsCursor, "name", true, null);
    }

    public void onStop()
    {
        super.onStop();
        Activity activity = getActivity();
        activity.getActionBar().setDisplayOptions(0, 16);
        activity.getActionBar().setCustomView(null);
        if (mSettingsObserver != null)
            mContentQueryMap.deleteObserver(mSettingsObserver);
        if (mSettingsCursor != null)
            mSettingsCursor.close();
    }





}
