// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.content.Context;
import android.widget.Spinner;

// Referenced classes of package com.mediatek.settings.ext:
//            IWifiApDialogExt

public class DefaultWifiApDialogExt
    implements IWifiApDialogExt
{

    private static final String TAG = "DefaultWifiApDialogExt";


    public int getSecurityType(int i)
    {
        return i;
    }

    public int getSelection(int i)
    {
        return i;
    }

    public void setAdapter(Context context, Spinner spinner, int i)
    {
    }
}
