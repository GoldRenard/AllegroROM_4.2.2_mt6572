// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Context;
import android.preference.Preference;

// Referenced classes of package com.mediatek.settings.ext:
//            ISimRoamingExt

public class DefaultSimRoamingExt
    implements ISimRoamingExt
{


    public String getRoamingWarningMsg(Context context, int i)
    {
        return context.getString(i);
    }

    public void setSummary(Preference preference)
    {
    }

    public void showDialog(Context context)
    {
    }
}
