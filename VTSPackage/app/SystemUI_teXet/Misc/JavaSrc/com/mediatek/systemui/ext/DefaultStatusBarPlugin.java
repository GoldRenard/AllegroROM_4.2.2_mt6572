// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;

// Referenced classes of package com.mediatek.systemui.ext:
//            IStatusBarPlugin, NetworkType, DataType

public class DefaultStatusBarPlugin extends ContextWrapper
    implements IStatusBarPlugin
{

    public DefaultStatusBarPlugin(Context context)
    {
        super(context);
    }

    public boolean get3GPlusResources(boolean flag, int i)
    {
        return false;
    }

    public String get3gDisabledWarningString()
    {
        return null;
    }

    public int[] getDataActivityIconList(int i, boolean flag)
    {
        return null;
    }

    public int getDataNetworkTypeIconGemini(NetworkType networktype, int i)
    {
        return -1;
    }

    public int[] getDataTypeIconListGemini(boolean flag, DataType datatype)
    {
        return null;
    }

    public boolean getMobileGroupVisible()
    {
        return false;
    }

    public Resources getPluginResources()
    {
        return null;
    }

    public int getSignalIndicatorIconGemini(int i)
    {
        return -1;
    }

    public String getSignalStrengthDescription(int i)
    {
        return null;
    }

    public int getSignalStrengthIcon(boolean flag, int i, int j, boolean flag1)
    {
        return -1;
    }

    public int getSignalStrengthIconGemini(int i, int j, int k, boolean flag)
    {
        return -1;
    }

    public int getSignalStrengthIconGemini(int i, int j, boolean flag)
    {
        return -1;
    }

    public int getSignalStrengthNullIconGemini(int i)
    {
        return -1;
    }

    public int getSignalStrengthSearchingIconGemini(int i)
    {
        return -1;
    }

    public boolean isHspaDataDistinguishable()
    {
        return true;
    }

    public boolean supportDataTypeAlwaysDisplayWhileOn()
    {
        return false;
    }

    public boolean supportDisableWifiAtAirplaneMode()
    {
        return false;
    }
}
