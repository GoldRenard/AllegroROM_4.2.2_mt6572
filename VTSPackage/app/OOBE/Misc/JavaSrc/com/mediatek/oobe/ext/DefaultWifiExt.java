// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.ext;

import android.content.Context;
import android.preference.SwitchPreference;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.oobe.ext:
//            IWifiExt

public class DefaultWifiExt
    implements IWifiExt
{

    private static final String TAG = "DefaultWifiExt";
    private Context mContext;

    public DefaultWifiExt(Context context)
    {
        mContext = context;
        Xlog.d("DefaultWifiExt", "DefaultWifiExt");
    }

    public int getApOrder(String s, int i, String s1, int j)
    {
        Xlog.d("DefaultWifiExt", "getApOrder(),return 0");
        return 0;
    }

    public String getSecurityText(int i)
    {
        return mContext.getString(i);
    }

    public boolean getSwitchState()
    {
        Xlog.d("DefaultWifiExt", "getSwitchState(), return true");
        return true;
    }

    public void initSwitchState(SwitchPreference switchpreference)
    {
    }

    public void registerAirplaneModeObserver(SwitchPreference switchpreference)
    {
    }

    public void setProxyText(TextView textview)
    {
    }

    public void setSecurityText(TextView textview)
    {
    }

    public boolean shouldAddForgetButton(String s, int i)
    {
        return true;
    }

    public boolean shouldSetDisconnectButton()
    {
        return false;
    }

    public void unRegisterAirplaneObserver()
    {
    }
}
