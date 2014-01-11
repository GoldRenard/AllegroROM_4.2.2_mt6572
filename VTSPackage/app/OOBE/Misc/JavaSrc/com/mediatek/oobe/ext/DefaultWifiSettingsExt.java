// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.ext;

import android.content.Context;
import android.preference.PreferenceCategory;
import android.preference.PreferenceScreen;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.oobe.ext:
//            IWifiSettingsExt

public class DefaultWifiSettingsExt
    implements IWifiSettingsExt
{

    private static final String TAG = "DefaultWifiSettingsExt";

    public DefaultWifiSettingsExt(Context context)
    {
        Xlog.d("DefaultWifiSettingsExt", "DefaultWifiSettingsExt");
    }

    public void emptyCategory(PreferenceScreen preferencescreen)
    {
        preferencescreen.removeAll();
    }

    public void emptyScreen(PreferenceScreen preferencescreen)
    {
        preferencescreen.removeAll();
    }

    public int getAccessPointsCount(PreferenceScreen preferencescreen)
    {
        return preferencescreen.getPreferenceCount();
    }

    public boolean isCatogoryExist()
    {
        return false;
    }

    public boolean isTustAP(String s, int i)
    {
        return false;
    }

    public void refreshCategory(PreferenceScreen preferencescreen)
    {
    }

    public void setCategory(PreferenceCategory preferencecategory, PreferenceCategory preferencecategory1, PreferenceCategory preferencecategory2)
    {
    }

    public boolean shouldAddDisconnectMenu()
    {
        return false;
    }

    public boolean shouldAddForgetMenu(String s, int i)
    {
        Xlog.d("DefaultWifiSettingsExt", "WifiSettingsExt, shouldAddMenuForget(),return true");
        return true;
    }
}
