// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.advanced;

import android.content.ContentResolver;
import android.os.Bundle;
import android.preference.*;
import android.widget.Button;
import com.mediatek.oobe.utils.OOBEStepPreferenceActivity;
import com.mediatek.xlog.Xlog;

public class SyncSettings extends OOBEStepPreferenceActivity
{

    private static final String SYNC_SWITCH_PREF = "sync_pref";
    private static final String TAG = "OOBE";
    private SwitchPreference mAutoSyncPref;


    protected String getStepSpecialTag()
    {
        return "SyncSettingsActivity";
    }

    protected void initSpecialLayout(int i, int j)
    {
        super.initSpecialLayout(0x7f090075, 0x7f090076);
        if (super.mStepIndex == 1 && super.mBackBtn != null)
        {
            super.mBackBtn.setVisibility(0);
            super.mBackBtn.setText(0x7f09004c);
        }
        mAutoSyncPref = (SwitchPreference)findPreference("sync_pref");
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050006);
        initSpecialLayout(0x7f090078, 0x7f090079);
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferencescreen, Preference preference)
    {
        boolean flag;
label0:
        {
            if (preference == mAutoSyncPref && mAutoSyncPref.isChecked())
            {
                Xlog.d("OOBE", (new StringBuilder()).append("").append(mAutoSyncPref.isChecked()).toString());
                ContentResolver.setMasterSyncAutomatically(true);
            } else
            {
                SwitchPreference switchpreference = mAutoSyncPref;
                flag = false;
                if (preference != switchpreference)
                    break label0;
                boolean flag1 = mAutoSyncPref.isChecked();
                flag = false;
                if (flag1)
                    break label0;
                Xlog.d("OOBE", (new StringBuilder()).append("").append(mAutoSyncPref.isChecked()).toString());
                ContentResolver.setMasterSyncAutomatically(false);
            }
            flag = true;
        }
        return flag;
    }

    protected void onResume()
    {
        super.onResume();
        boolean flag = ContentResolver.getMasterSyncAutomatically();
        mAutoSyncPref.setChecked(flag);
    }
}
