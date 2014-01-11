// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.preference.Preference;
import android.preference.PreferenceScreen;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings.ext:
//            IStatusGeminiExt

public class DefaultStatusGeminiExt
    implements IStatusGeminiExt
{

    private static final String TAG = "DefaultStatusGeminiExt";


    public void initUI(PreferenceScreen preferencescreen, Preference preference)
    {
        Xlog.d("DefaultStatusGeminiExt", "default launched");
    }
}
