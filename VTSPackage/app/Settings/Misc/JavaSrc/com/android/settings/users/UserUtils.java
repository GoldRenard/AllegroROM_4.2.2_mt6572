// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.users;

import android.content.pm.UserInfo;
import android.content.res.Resources;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.UserManager;

public class UserUtils
{


    public static Drawable getUserIcon(UserManager usermanager, UserInfo userinfo, Resources resources)
    {
        if (userinfo.iconPath != null)
        {
            android.graphics.Bitmap bitmap = usermanager.getUserIcon(userinfo.id);
            if (bitmap != null)
                return new BitmapDrawable(resources, bitmap);
        }
        return null;
    }
}
