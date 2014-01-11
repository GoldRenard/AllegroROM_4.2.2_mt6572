// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Intent;
import android.preference.*;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings.ext:
//            ISimManagementExt

public class DefaultSimManagementExt
    implements ISimManagementExt
{

    private static final String KEY_3G_SERVICE_SETTING = "3g_service_settings";
    private static final String KEY_SIM_STATUS = "status_info";
    private static final String TAG = "DefaultSimManagementExt";


    public void dealWithDataConnChanged(Intent intent, boolean flag)
    {
    }

    public String getAutoString()
    {
        return null;
    }

    public boolean isNeedsetAutoItem()
    {
        return false;
    }

    public void setPrefProperty(DialogPreference dialogpreference, long l)
    {
    }

    public void setToClosedSimSlot(int i)
    {
    }

    public void showChangeDataConnDialog(PreferenceFragment preferencefragment, boolean flag)
    {
        Xlog.d("DefaultSimManagementExt", "showChangeDataConnDialog");
    }

    public void updateDefaultSIMSummary(DialogPreference dialogpreference, Long long1)
    {
    }

    public void updateSimEditorPref(PreferenceFragment preferencefragment)
    {
    }

    public void updateSimManagementPref(PreferenceGroup preferencegroup)
    {
        Xlog.d("DefaultSimManagementExt", "updateSimManagementPref()");
        PreferenceScreen preferencescreen = null;
        PreferenceScreen preferencescreen1 = null;
        if (preferencegroup != null)
        {
            preferencescreen = (PreferenceScreen)preferencegroup.findPreference("3g_service_settings");
            preferencescreen1 = (PreferenceScreen)preferencegroup.findPreference("status_info");
        }
        if (preferencescreen != null)
        {
            Xlog.d("DefaultSimManagementExt", "updateSimManagementPref()---remove pref3GService");
            preferencegroup.removePreference(preferencescreen);
        }
        if (preferencescreen1 != null)
        {
            Xlog.d("DefaultSimManagementExt", "updateSimManagementPref()---remove prefStatus");
            preferencegroup.removePreference(preferencescreen1);
        }
    }
}
