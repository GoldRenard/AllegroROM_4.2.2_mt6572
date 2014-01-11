// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;

import android.util.Log;

// Referenced classes of package com.mediatek.phone.ext:
//            InCallScreenExtensionContainer, CallCardExtensionContainer, InCallTouchUiExtensionContainer, VTCallBannerControllerExtensionContainer, 
//            VTInCallScreenExtensionContainer, VTInCallScreenFlagsExtensionContainer, PhoneGlobalsBroadcastReceiverExtensionContainer, IPhonePlugin, 
//            OthersSettingsExtension, SettingsExtension, CallCardExtension, InCallScreenExtension, 
//            InCallTouchUiExtension, PhoneGlobalsBroadcastReceiverExtension, VTCallBannerControllerExtension, VTInCallScreenExtension, 
//            VTInCallScreenFlagsExtension

public class PhonePluginExtensionContainer
{

    private static final String LOG_TAG = "PhonePluginExtensionContainer";
    private CallCardExtensionContainer mCallCardExtensionContainer;
    private InCallScreenExtensionContainer mInCallScreenExtensionContainer;
    private InCallTouchUiExtensionContainer mInCallTouchUiExtensionContainer;
    private OthersSettingsExtension mOthersSettingsExtension;
    private PhoneGlobalsBroadcastReceiverExtensionContainer mPhoneGlobalsBroadcastReceiverExtensionContainer;
    private SettingsExtension mSettingsExtension;
    private VTCallBannerControllerExtensionContainer mVTCallBannerControllerExtensionContainer;
    private VTInCallScreenExtensionContainer mVTInCallScreenExtensionContainer;
    private VTInCallScreenFlagsExtensionContainer mVTInCallScreenFlagsExtensionContainer;

    public PhonePluginExtensionContainer()
    {
        mInCallScreenExtensionContainer = new InCallScreenExtensionContainer();
        mCallCardExtensionContainer = new CallCardExtensionContainer();
        mInCallTouchUiExtensionContainer = new InCallTouchUiExtensionContainer();
        mVTCallBannerControllerExtensionContainer = new VTCallBannerControllerExtensionContainer();
        mVTInCallScreenExtensionContainer = new VTInCallScreenExtensionContainer();
        mVTInCallScreenFlagsExtensionContainer = new VTInCallScreenFlagsExtensionContainer();
        mPhoneGlobalsBroadcastReceiverExtensionContainer = new PhoneGlobalsBroadcastReceiverExtensionContainer();
    }

    private static void log(String s)
    {
        Log.d("PhonePluginExtensionContainer", s);
    }

    public void addExtensions(IPhonePlugin iphoneplugin)
    {
        log((new StringBuilder()).append("addExtensions, phone plugin object is ").append(iphoneplugin).toString());
        mInCallScreenExtensionContainer.add(iphoneplugin.createInCallScreenExtension());
        mCallCardExtensionContainer.add(iphoneplugin.createCallCardExtension());
        mInCallTouchUiExtensionContainer.add(iphoneplugin.createInCallTouchUiExtension());
        mVTCallBannerControllerExtensionContainer.add(iphoneplugin.createVTCallBannerControllerExtension());
        mVTInCallScreenExtensionContainer.add(iphoneplugin.createVTInCallScreenExtension());
        mVTInCallScreenFlagsExtensionContainer.add(iphoneplugin.createVTInCallScreenFlagsExtension());
        mPhoneGlobalsBroadcastReceiverExtensionContainer.add(iphoneplugin.createPhoneGlobalsBroadcastReceiverExtension());
        if (mOthersSettingsExtension == null)
            mOthersSettingsExtension = iphoneplugin.createOthersSettingsExtension();
        if (mSettingsExtension == null)
            mSettingsExtension = iphoneplugin.createSettingsExtension();
    }

    public CallCardExtension getCallCardExtension()
    {
        log("getCallCardExtension()");
        return mCallCardExtensionContainer;
    }

    public InCallScreenExtension getInCallScreenExtension()
    {
        log("getInCallScreenExtension()");
        return mInCallScreenExtensionContainer;
    }

    public InCallTouchUiExtension getInCallTouchUiExtension()
    {
        log("getInCallTouchUiExtension()");
        return mInCallTouchUiExtensionContainer;
    }

    public OthersSettingsExtension getOthersSettingsExtension()
    {
        if (mOthersSettingsExtension == null)
            mOthersSettingsExtension = new OthersSettingsExtension();
        return mOthersSettingsExtension;
    }

    public PhoneGlobalsBroadcastReceiverExtension getPhoneGlobalsBroadcastReceiverExtension()
    {
        log("getPhoneGlobalsBroadcastReceiverExtension()");
        return mPhoneGlobalsBroadcastReceiverExtensionContainer;
    }

    public SettingsExtension getSettingsExtension()
    {
        if (mSettingsExtension == null)
            mSettingsExtension = new SettingsExtension();
        return mSettingsExtension;
    }

    public VTCallBannerControllerExtension getVTCallBannerControllerExtension()
    {
        log("getVTCallBannerControllerExtension()");
        return mVTCallBannerControllerExtensionContainer;
    }

    public VTInCallScreenExtension getVTInCallScreenExtension()
    {
        log("getVTInCallScreenExtension()");
        return mVTInCallScreenExtensionContainer;
    }

    public VTInCallScreenFlagsExtension getVTInCallScreenFlagsExtension()
    {
        log("getVTInCallScreenFlagsExtension()");
        return mVTInCallScreenFlagsExtensionContainer;
    }
}
