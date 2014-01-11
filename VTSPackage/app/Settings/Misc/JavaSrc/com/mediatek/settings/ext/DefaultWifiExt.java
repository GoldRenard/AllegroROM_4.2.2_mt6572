// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings.ext;

import android.app.Activity;
import android.content.ContentResolver;
import android.content.Context;
import android.preference.PreferenceScreen;
import android.view.View;
import android.widget.Switch;
import android.widget.TextView;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.mediatek.settings.ext:
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

    public void closeSpinnerDialog()
    {
    }

    public int getApOrder(String s, int i, String s1, int j)
    {
        Xlog.d("DefaultWifiExt", "getApOrder(),return 0");
        return 0;
    }

    public int getPriority()
    {
        return -1;
    }

    public View getPriorityView()
    {
        return null;
    }

    public String getSecurityText(int i)
    {
        return mContext.getString(i);
    }

    public int getSleepPolicy(ContentResolver contentresolver)
    {
        return android.provider.Settings.Global.getInt(contentresolver, "wifi_sleep_policy", 2);
    }

    public boolean getSwitchState()
    {
        Xlog.d("DefaultWifiExt", "getSwitchState(), return true");
        return true;
    }

    public String getWifiApSsid()
    {
        return mContext.getString(0x104040c);
    }

    public void initConnectView(Activity activity, PreferenceScreen preferencescreen)
    {
    }

    public void initNetworkInfoView(PreferenceScreen preferencescreen)
    {
    }

    public void initPreference(ContentResolver contentresolver)
    {
    }

    public void initSwitchState(Switch switch1)
    {
    }

    public void refreshNetworkInfoView()
    {
    }

    public void registerAirplaneModeObserver(Switch switch1)
    {
    }

    public void setAPNetworkId(int i)
    {
    }

    public void setAPPriority(int i)
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
