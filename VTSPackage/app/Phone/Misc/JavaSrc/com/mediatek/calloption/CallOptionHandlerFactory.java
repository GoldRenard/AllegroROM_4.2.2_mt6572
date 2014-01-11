// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;


// Referenced classes of package com.mediatek.calloption:
//            FinalCallOptionHandler, FirstCallOptionHandler, InternationalCallOptionHandler, InternetCallOptionHandler, 
//            IpCallOptionHandler, SimSelectionCallOptionHandler, SimStatusCallOptionHandler, VideoCallOptionHandler, 
//            VoiceMailCallOptionHandler

public abstract class CallOptionHandlerFactory
{


    public FinalCallOptionHandler getFinalCallOptionHandler()
    {
        return new FinalCallOptionHandler();
    }

    public FirstCallOptionHandler getFirstCallOptionHandler()
    {
        return new FirstCallOptionHandler();
    }

    public abstract InternationalCallOptionHandler getInternationalCallOptionHandler();

    public abstract InternetCallOptionHandler getInternetCallOptionHandler();

    public abstract IpCallOptionHandler getIpCallOptionHandler();

    public abstract SimSelectionCallOptionHandler getSimSelectionCallOptionHandler();

    public abstract SimStatusCallOptionHandler getSimStatusCallOptionHandler();

    public abstract VideoCallOptionHandler getVideoCallOptionHandler();

    public abstract VoiceMailCallOptionHandler getVoiceMailCallOptionHandler();
}
