// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.oobe.utils;

import android.content.Context;
import android.content.pm.Signature;
import android.net.ConnectivityManager;
import android.os.SystemProperties;
import com.mediatek.oobe.ext.*;
import com.mediatek.pluginmanager.PluginManager;
import com.mediatek.xlog.Xlog;

public class Utils
{

    private static final int COLORNUM = 7;
    private static final String TAG = "OOBE";


    public static ISimManagementExt getSimManagmentExtPlugin(Context context)
    {
        ISimManagementExt isimmanagementext;
        try
        {
            isimmanagementext = (ISimManagementExt)PluginManager.createPluginObject(context, com/mediatek/oobe/ext/ISimManagementExt.getName(), new Signature[0]);
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            Xlog.d("OOBE", "Enter the default ISimManagementExt");
            return new DefaultSimManagementExt();
        }
        return isimmanagementext;
    }

    public static IWifiExt getWifiPlugin(Context context)
    {
        IWifiExt iwifiext;
        try
        {
            iwifiext = (IWifiExt)PluginManager.createPluginObject(context, com/mediatek/oobe/ext/IWifiExt.getName(), new Signature[0]);
            Xlog.d("OOBE", "IWifiExt plugin object created");
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            DefaultWifiExt defaultwifiext = new DefaultWifiExt(context);
            Xlog.d("OOBE", (new StringBuilder()).append("DefaultWifiExt plugin object created, e = ").append(objectcreationexception).toString());
            return defaultwifiext;
        }
        return iwifiext;
    }

    public static IWifiSettingsExt getWifiSettingsPlugin(Context context)
    {
        IWifiSettingsExt iwifisettingsext;
        try
        {
            iwifisettingsext = (IWifiSettingsExt)PluginManager.createPluginObject(context, com/mediatek/oobe/ext/IWifiSettingsExt.getName(), new Signature[0]);
            Xlog.d("OOBE", "IWifiSettingsExt Plugin object created");
        }
        catch (com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception)
        {
            DefaultWifiSettingsExt defaultwifisettingsext = new DefaultWifiSettingsExt(context);
            Xlog.d("OOBE", (new StringBuilder()).append("DefaultWifiSettingsExt Plugin object created, e = ").append(objectcreationexception).toString());
            return defaultwifisettingsext;
        }
        return iwifisettingsext;
    }

    public static boolean isGemini()
    {
        int i = SystemProperties.getInt("persist.radio.default_sim_mode", 12);
        Xlog.d("OOBE", (new StringBuilder()).append(" isGemini() networkMode=").append(i).toString());
        return i == 12;
    }

    public static boolean isWifiOnly(Context context)
    {
        boolean flag = ((ConnectivityManager)context.getSystemService("connectivity")).isNetworkSupported(0);
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }
}
