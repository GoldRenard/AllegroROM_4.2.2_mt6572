// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.*;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.android.settings:
//            SettingsPreferenceFragment

public class WallpaperTypeSettings extends SettingsPreferenceFragment
{


    private void populateWallpaperTypes()
    {
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
        PackageManager packagemanager = getPackageManager();
        List list = packagemanager.queryIntentActivities(intent, 0x10000);
        PreferenceScreen preferencescreen = getPreferenceScreen();
        preferencescreen.setOrderingAsAdded(false);
        Preference preference;
        for (Iterator iterator = list.iterator(); iterator.hasNext(); preferencescreen.addPreference(preference))
        {
            ResolveInfo resolveinfo = (ResolveInfo)iterator.next();
            preference = new Preference(getActivity());
            Intent intent1 = new Intent(intent);
            intent1.setComponent(new ComponentName(((PackageItemInfo) (resolveinfo.activityInfo)).packageName, resolveinfo.activityInfo.name));
            preference.setIntent(intent1);
            Object obj = resolveinfo.loadLabel(packagemanager);
            if (obj == null)
                obj = ((PackageItemInfo) (resolveinfo.activityInfo)).packageName;
            preference.setTitle(((CharSequence) (obj)));
        }

    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        addPreferencesFromResource(0x7f050048);
        populateWallpaperTypes();
    }
}
