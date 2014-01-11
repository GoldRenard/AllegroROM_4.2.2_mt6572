// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.ext;


// Referenced classes of package com.mediatek.phone.ext:
//            CallCardExtension, InCallScreenExtension, InCallTouchUiExtension, OthersSettingsExtension, 
//            PhoneGlobalsBroadcastReceiverExtension, SettingsExtension, VTCallBannerControllerExtension, VTInCallScreenExtension, 
//            VTInCallScreenFlagsExtension

public interface IPhonePlugin
{

    public abstract CallCardExtension createCallCardExtension();

    public abstract InCallScreenExtension createInCallScreenExtension();

    public abstract InCallTouchUiExtension createInCallTouchUiExtension();

    public abstract OthersSettingsExtension createOthersSettingsExtension();

    public abstract PhoneGlobalsBroadcastReceiverExtension createPhoneGlobalsBroadcastReceiverExtension();

    public abstract SettingsExtension createSettingsExtension();

    public abstract VTCallBannerControllerExtension createVTCallBannerControllerExtension();

    public abstract VTInCallScreenExtension createVTInCallScreenExtension();

    public abstract VTInCallScreenFlagsExtension createVTInCallScreenFlagsExtension();
}
