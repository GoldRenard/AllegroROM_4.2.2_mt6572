// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.basic.gemini;

import android.os.Bundle;
import android.preference.PreferenceGroup;
import android.preference.PreferenceScreen;
import com.mediatek.oobe.utils.OOBEConstants;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.oobe.basic.gemini:
//            SimManagement, SimInfoPreference

public class SubSimManagementSettings extends SimManagement
{

    private static final String TAG = "SubSimManagementSettings";


    private void logd(String s)
    {
        OOBEConstants.logd((new StringBuilder()).append("SubSimManagementSettings  ").append(s).toString());
    }

    private void loge(String s)
    {
        OOBEConstants.loge((new StringBuilder()).append("SubSimManagementSettings  ").append(s).toString());
    }

    protected void initDefaultSimPreference()
    {
        logd("initDefaultSimPreference(), prevent default action for oobe");
    }

    public void onActivityCreated(Bundle bundle)
    {
        logd("-->onActivityCreated");
        super.onActivityCreated(bundle);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.removePreference(findPreference("default_sim"));
        preferencescreen.removePreference(findPreference("general_settings"));
        PreferenceGroup preferencegroup = (PreferenceGroup)findPreference("sim_info");
        if (preferencegroup != null)
        {
            int i = preferencegroup.getPreferenceCount();
            Xlog.d("SubSimManagementSettings", (new StringBuilder()).append(" SimInfoListCategory children count=").append(preferencegroup.getPreferenceCount()).toString());
            for (int j = i - 1; j >= 0; j--)
            {
                Xlog.d("SubSimManagementSettings", (new StringBuilder()).append("i=").append(j).toString());
                android.preference.Preference preference = preferencegroup.getPreference(j);
                if (preference instanceof SimInfoPreference)
                {
                    ((SimInfoPreference)preference).setNeedCheckBox(false);
                    preferencescreen.addPreference(preference);
                }
            }

            preferencescreen.removePreference(preferencegroup);
        }
        logd("<--onActivityCreated");
    }

    public void onCreate(Bundle bundle)
    {
        logd("-->onCreate()");
        super.onCreate(bundle);
        logd("<--onCreate()");
    }

    protected void updateDefaultSimInfo(long l)
    {
        logd("updateDefaultSimInfo(), prevent default action for oobe");
    }

    protected void updateDefaultSimItemList(int i)
    {
        logd("updateDefaultSimItemList(1), prevent default action for oobe");
    }

    protected void updateDefaultSimState(int i, int j)
    {
        logd("updateDefaultSimState(), prevent default action for oobe");
    }

    protected void updateGprsSettings()
    {
        logd("updateGprsSettings(), prevent default action for oobe");
    }
}
