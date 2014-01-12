// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.thememanager;

import android.content.*;
import android.content.pm.*;
import android.database.Cursor;
import android.net.Uri;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.thememanager:
//            Themes

public class ThemeReceiver extends BroadcastReceiver
{

    private static final String TAG = "ThemeReceiver";
    static final int THEME_PACKAGE_LOGO = 1;
    private PackageManager mPm;


    public void onReceive(Context context, Intent intent)
    {
        String s;
        String s1;
        mPm = context.getPackageManager();
        s = intent.getData().getSchemeSpecificPart();
        s1 = intent.getAction();
        if (!s1.equals("android.intent.action.PACKAGE_ADDED")) goto _L2; else goto _L1
_L1:
        PackageInfo packageinfo = mPm.getPackageInfo(s, 0);
        Xlog.d("ThemeReceiver", (new StringBuilder()).append("insert theme: ").append(packageinfo.isThemePackage).append(" ").append(packageinfo.themeNameId).toString());
        if (1 == packageinfo.isThemePackage)
        {
            ContentValues contentvalues = new ContentValues();
            contentvalues.put("package_name", s);
            contentvalues.put("theme_path", packageinfo.applicationInfo.sourceDir);
            contentvalues.put("theme_name_id", Integer.valueOf(packageinfo.themeNameId));
            context.getContentResolver().insert(Themes.CONTENT_URI, contentvalues);
        }
_L4:
        return;
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Xlog.d("ThemeReceiver", (new StringBuilder()).append("Intent.ACTION_PACKAGE_ADDED can not find name:packageName = ").append(s).toString());
        return;
_L2:
        if (!s1.equals("android.intent.action.PACKAGE_REMOVED")) goto _L4; else goto _L3
_L3:
        Cursor cursor;
        Xlog.d("ThemeReceiver", (new StringBuilder()).append("delete theme: ").append(s).toString());
        cursor = null;
        cursor = context.getContentResolver().query(Themes.CONTENT_URI, null, "package_name = ?", new String[] {
            s
        }, null);
        if (cursor == null)
            continue; /* Loop/switch isn't completed */
        context.getContentResolver().delete(Themes.CONTENT_URI, "package_name = ?", new String[] {
            s
        });
        if (cursor == null) goto _L4; else goto _L5
_L5:
        cursor.close();
        return;
        Exception exception;
        exception;
        if (cursor != null)
            cursor.close();
        throw exception;
    }
}
