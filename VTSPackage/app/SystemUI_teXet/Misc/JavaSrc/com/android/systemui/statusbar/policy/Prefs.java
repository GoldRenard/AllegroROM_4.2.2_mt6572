// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.policy;

import android.content.Context;
import android.content.SharedPreferences;

public class Prefs
{

    public static final boolean DO_NOT_DISTURB_DEFAULT = false;
    public static final String DO_NOT_DISTURB_PREF = "do_not_disturb";
    private static final String SHARED_PREFS_NAME = "status_bar";
    public static final String SHOWN_COMPAT_MODE_HELP = "shown_compat_mode_help";
    public static final String SHOWN_QUICK_SETTINGS_HELP = "shown_quick_settings_help";


    public static android.content.SharedPreferences.Editor edit(Context context)
    {
        return context.getSharedPreferences("status_bar", 0).edit();
    }

    public static SharedPreferences read(Context context)
    {
        return context.getSharedPreferences("status_bar", 0);
    }
}
