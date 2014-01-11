// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;


// Referenced classes of package com.mediatek.phone.ext:
//            IPhonePlugin, CallCardExtension, InCallScreenExtension, InCallTouchUiExtension, 
//            OthersSettingsExtension, PhoneGlobalsBroadcastReceiverExtension, SettingsExtension, VTCallBannerControllerExtension, 
//            VTInCallScreenExtension, VTInCallScreenFlagsExtension

public class PhonePluginDefault
    implements IPhonePlugin
{


    public CallCardExtension createCallCardExtension()
    {
        return new CallCardExtension();
    }

    public InCallScreenExtension createInCallScreenExtension()
    {
        return new InCallScreenExtension();
    }

    public InCallTouchUiExtension createInCallTouchUiExtension()
    {
        return new InCallTouchUiExtension();
    }

    public OthersSettingsExtension createOthersSettingsExtension()
    {
        return new OthersSettingsExtension();
    }

    public PhoneGlobalsBroadcastReceiverExtension createPhoneGlobalsBroadcastReceiverExtension()
    {
        return new PhoneGlobalsBroadcastReceiverExtension();
    }

    public SettingsExtension createSettingsExtension()
    {
        return new SettingsExtension();
    }

    public VTCallBannerControllerExtension createVTCallBannerControllerExtension()
    {
        return new VTCallBannerControllerExtension();
    }

    public VTInCallScreenExtension createVTInCallScreenExtension()
    {
        return new VTInCallScreenExtension();
    }

    public VTInCallScreenFlagsExtension createVTInCallScreenFlagsExtension()
    {
        return new VTInCallScreenFlagsExtension();
    }
}
