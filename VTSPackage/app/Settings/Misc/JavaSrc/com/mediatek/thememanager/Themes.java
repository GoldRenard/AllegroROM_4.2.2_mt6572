// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.thememanager;

import android.net.Uri;
import android.provider.BaseColumns;

public class Themes
    implements BaseColumns
{

    public static final String AUTHORITY = "com.mediatek.thememanager.ThemeProvider";
    public static final Uri CONTENT_URI = Uri.parse("content://com.mediatek.thememanager.ThemeProvider/theme");
    public static final String PACKAGE_NAME = "package_name";
    public static final String THEME_NAME_ID = "theme_name_id";
    public static final String THEME_PATH = "theme_path";


}
