// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.view.MenuItem;
import java.util.Locale;

public class HelpUtils
{

    private static final String PARAM_LANGUAGE_CODE = "hl";
    private static final String PARAM_VERSION = "version";
    private static final String TAG = com/android/settings/HelpUtils.getName();
    private static String sCachedVersionCode = null;

    private HelpUtils()
    {
    }

    public static boolean prepareHelpMenuItem(Context context, MenuItem menuitem, int i)
    {
        return prepareHelpMenuItem(context, menuitem, context.getResources().getString(i));
    }

    public static boolean prepareHelpMenuItem(Context context, MenuItem menuitem, String s)
    {
        if (TextUtils.isEmpty(s))
        {
            menuitem.setVisible(false);
            return false;
        } else
        {
            Intent intent = new Intent("android.intent.action.VIEW", uriWithAddedParameters(context, Uri.parse(s)));
            intent.setFlags(0x10800000);
            menuitem.setIntent(intent);
            menuitem.setShowAsAction(0);
            menuitem.setVisible(true);
            return true;
        }
    }

    private static Uri uriWithAddedParameters(Context context, Uri uri)
    {
        android.net.Uri.Builder builder = uri.buildUpon();
        builder.appendQueryParameter("hl", Locale.getDefault().toString());
        if (sCachedVersionCode == null)
            try
            {
                sCachedVersionCode = Integer.toString(context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode);
                builder.appendQueryParameter("version", sCachedVersionCode);
            }
            catch (android.content.pm.PackageManager.NameNotFoundException namenotfoundexception)
            {
                Log.wtf(TAG, "Invalid package name for context", namenotfoundexception);
            }
        else
            builder.appendQueryParameter("version", sCachedVersionCode);
        return builder.build();
    }

}
