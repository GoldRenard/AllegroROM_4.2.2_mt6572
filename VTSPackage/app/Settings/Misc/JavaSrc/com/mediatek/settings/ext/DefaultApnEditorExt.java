// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.*;
import android.content.res.Resources;
import android.net.Uri;
import android.preference.DialogPreference;

// Referenced classes of package com.mediatek.settings.ext:
//            IApnEditorExt

public class DefaultApnEditorExt
    implements IApnEditorExt
{

    private static final String TAG = "DefaultWifiApEnablerExt";


    private boolean isCmccCard(String s)
    {
        return "46000".equals(s) || "46002".equals(s) || "46007".equals(s);
    }

    public String[] getApnTypeArray(Context context, int i, int j, int k)
    {
        return context.getResources().getStringArray(k);
    }

    public String[] getApnTypeArrayByCard(Context context, String s, boolean flag, int i, int j, int k, String as[])
    {
        return as;
    }

    public Uri getUriFromIntent(Context context, Intent intent)
    {
        return context.getContentResolver().insert(intent.getData(), new ContentValues());
    }

    public void setPreferenceState(DialogPreference dialogpreference)
    {
    }
}
