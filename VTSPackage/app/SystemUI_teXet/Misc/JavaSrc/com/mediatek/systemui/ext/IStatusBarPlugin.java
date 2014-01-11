// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.systemui.ext;

import android.content.res.Resources;

// Referenced classes of package com.mediatek.systemui.ext:
//            NetworkType, DataType

public interface IStatusBarPlugin
{

    public abstract boolean get3GPlusResources(boolean flag, int i);

    public abstract String get3gDisabledWarningString();

    public abstract int[] getDataActivityIconList(int i, boolean flag);

    public abstract int getDataNetworkTypeIconGemini(NetworkType networktype, int i);

    public abstract int[] getDataTypeIconListGemini(boolean flag, DataType datatype);

    public abstract boolean getMobileGroupVisible();

    public abstract Resources getPluginResources();

    public abstract int getSignalIndicatorIconGemini(int i);

    public abstract String getSignalStrengthDescription(int i);

    public abstract int getSignalStrengthIcon(boolean flag, int i, int j, boolean flag1);

    public abstract int getSignalStrengthIconGemini(int i, int j, int k, boolean flag);

    public abstract int getSignalStrengthIconGemini(int i, int j, boolean flag);

    public abstract int getSignalStrengthNullIconGemini(int i);

    public abstract int getSignalStrengthSearchingIconGemini(int i);

    public abstract boolean isHspaDataDistinguishable();

    public abstract boolean supportDataTypeAlwaysDisplayWhileOn();

    public abstract boolean supportDisableWifiAtAirplaneMode();
}
