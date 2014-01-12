// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.providers.settings.ext;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;

// Referenced classes of package com.mediatek.providers.settings.ext:
//            IDatabaseHelperExt

public class DefaultDatabaseHelperExt
    implements IDatabaseHelperExt
{

    private static final String TAG = "DefaultDatabaseHelperExt";


    public String getResBoolean(Context context, String s, int i)
    {
        String s1;
        if (context.getResources().getBoolean(i))
            s1 = "1";
        else
            s1 = "0";
        Log.d("DefaultDatabaseHelperExt", (new StringBuilder()).append("get name = ").append(s).append(" boolean value = ").append(s1).toString());
        return s1;
    }

    public String getResFraction(Context context, String s, int i, int j)
    {
        String s1 = Float.toString(context.getResources().getFraction(i, j, j));
        Log.d("DefaultDatabaseHelperExt", (new StringBuilder()).append("get name = ").append(s).append(" fraction value = ").append(s1).toString());
        return s1;
    }

    public String getResInteger(Context context, String s, int i)
    {
        String s1 = Integer.toString(context.getResources().getInteger(i));
        Log.d("DefaultDatabaseHelperExt", (new StringBuilder()).append("get name = ").append(s).append(" int value = ").append(s1).toString());
        return s1;
    }

    public String getResStr(Context context, String s, int i)
    {
        String s1 = context.getResources().getString(i);
        Log.d("DefaultDatabaseHelperExt", (new StringBuilder()).append("get name = ").append(s).append(" string value = ").append(s1).toString());
        return s1;
    }
}
