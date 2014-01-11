// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.content.pm.Signature;
import android.util.Log;
import com.android.phone.PhoneGlobals;
import com.mediatek.pluginmanager.Plugin;
import com.mediatek.pluginmanager.PluginManager;
import java.util.LinkedList;

// Referenced classes of package com.mediatek.phone.ext:
//            PhonePluginExtensionContainer, IPhonePlugin, CallCardExtension, InCallScreenExtension, 
//            InCallTouchUiExtension, OthersSettingsExtension, PhoneGlobalsBroadcastReceiverExtension, SettingsExtension, 
//            VTCallBannerControllerExtension, VTInCallScreenExtension, VTInCallScreenFlagsExtension

public final class ExtensionManager
{

    private static final String LOG_TAG = "ExtensionManager";
    private static ExtensionManager sInstance;
    private LinkedList mIPhonePluginList;
    private PhonePluginExtensionContainer mPhonePluginExtContainer;

    private ExtensionManager()
    {
        mPhonePluginExtContainer = new PhonePluginExtensionContainer();
        initContainerByPlugin();
    }

    public static ExtensionManager getInstance()
    {
        if (sInstance == null)
            sInstance = new ExtensionManager();
        return sInstance;
    }

    private void initContainerByPlugin()
    {
        PluginManager pluginmanager;
        int i;
        pluginmanager = PluginManager.create(PhoneGlobals.getInstance(), com/mediatek/phone/ext/IPhonePlugin.getName(), new Signature[0]);
        i = 0;
_L1:
        Plugin plugin;
        if (i >= pluginmanager.getPluginCount())
            break MISSING_BLOCK_LABEL_130;
        plugin = pluginmanager.getPlugin(i);
        if (plugin == null)
            break MISSING_BLOCK_LABEL_114;
        log((new StringBuilder()).append("create plugin object, number = ").append(i + 1).toString());
        IPhonePlugin iphoneplugin = (IPhonePlugin)plugin.createObject();
        mPhonePluginExtContainer.addExtensions(iphoneplugin);
        if (mIPhonePluginList == null)
        {
            log("create mIPhonePluglist");
            mIPhonePluginList = new LinkedList();
        }
        mIPhonePluginList.add(iphoneplugin);
        i++;
          goto _L1
        com.mediatek.pluginmanager.Plugin.ObjectCreationException objectcreationexception;
        objectcreationexception;
        log("create plugin object failed");
        objectcreationexception.printStackTrace();
    }

    private static void log(String s)
    {
        Log.d("ExtensionManager", s);
    }

    public CallCardExtension getCallCardExtension()
    {
        log("getCallCardExtension()");
        return mPhonePluginExtContainer.getCallCardExtension();
    }

    public InCallScreenExtension getInCallScreenExtension()
    {
        log("getInCallScreenExtension()");
        return mPhonePluginExtContainer.getInCallScreenExtension();
    }

    public InCallTouchUiExtension getInCallTouchUiExtension()
    {
        log("getInCallTouchUiExtension()");
        return mPhonePluginExtContainer.getInCallTouchUiExtension();
    }

    public OthersSettingsExtension getOthersSettingsExtension()
    {
        log("getOthersSettingsExtension()");
        return mPhonePluginExtContainer.getOthersSettingsExtension();
    }

    public PhoneGlobalsBroadcastReceiverExtension getPhoneGlobalsBroadcastReceiverExtension()
    {
        log("PhoneGlobalsBroadcastReceiverExtension()");
        return mPhonePluginExtContainer.getPhoneGlobalsBroadcastReceiverExtension();
    }

    public SettingsExtension getSettingsExtension()
    {
        log("getSettingsExtension()");
        return mPhonePluginExtContainer.getSettingsExtension();
    }

    public VTCallBannerControllerExtension getVTCallBannerControllerExtension()
    {
        log("getVTCallBannerControllerExtension()");
        return mPhonePluginExtContainer.getVTCallBannerControllerExtension();
    }

    public VTInCallScreenExtension getVTInCallScreenExtension()
    {
        log("getVTInCallScreenExtension()");
        return mPhonePluginExtContainer.getVTInCallScreenExtension();
    }

    public VTInCallScreenFlagsExtension getVTInCallScreenFlagsExtension()
    {
        log("getVTInCallScreenFlagsExtension()");
        return mPhonePluginExtContainer.getVTInCallScreenFlagsExtension();
    }
}
