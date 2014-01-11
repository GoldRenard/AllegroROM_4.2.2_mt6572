// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.calloption;

import com.mediatek.calloption.*;

// Referenced classes of package com.mediatek.phone.calloption:
//            PhoneInternetCallOptionHandler, PhoneVideoCallOptionHandler, PhoneInternationalCallOptionHandler, PhoneSimSelectionCallOptionHandler, 
//            PhoneSimStatusCallOptionHandler, PhoneIpCallOptionHandler, PhoneVoiceMailCallOptionHandler

public class PhoneCallOptionHandlerFactory extends CallOptionHandlerFactory
{

    private InternationalCallOptionHandler mInternationalCallOptionHandler;
    private InternetCallOptionHandler mInternetCallOptionHandler;
    private IpCallOptionHandler mIpCallOptionHandler;
    private SimSelectionCallOptionHandler mSimSelectionCallOptionHandler;
    private SimStatusCallOptionHandler mSimStatusCallOptionHandler;
    private VideoCallOptionHandler mVideoCallOptionHandler;
    private VoiceMailCallOptionHandler mVoiceMailCallOptionHandler;

    public PhoneCallOptionHandlerFactory()
    {
        mInternetCallOptionHandler = new PhoneInternetCallOptionHandler();
        mVideoCallOptionHandler = new PhoneVideoCallOptionHandler();
        mInternationalCallOptionHandler = new PhoneInternationalCallOptionHandler();
        mSimSelectionCallOptionHandler = new PhoneSimSelectionCallOptionHandler();
        mSimStatusCallOptionHandler = new PhoneSimStatusCallOptionHandler();
        mIpCallOptionHandler = new PhoneIpCallOptionHandler();
        mVoiceMailCallOptionHandler = new PhoneVoiceMailCallOptionHandler();
    }

    public InternationalCallOptionHandler getInternationalCallOptionHandler()
    {
        return mInternationalCallOptionHandler;
    }

    public InternetCallOptionHandler getInternetCallOptionHandler()
    {
        return mInternetCallOptionHandler;
    }

    public IpCallOptionHandler getIpCallOptionHandler()
    {
        return mIpCallOptionHandler;
    }

    public SimSelectionCallOptionHandler getSimSelectionCallOptionHandler()
    {
        return mSimSelectionCallOptionHandler;
    }

    public SimStatusCallOptionHandler getSimStatusCallOptionHandler()
    {
        return mSimStatusCallOptionHandler;
    }

    public VideoCallOptionHandler getVideoCallOptionHandler()
    {
        return mVideoCallOptionHandler;
    }

    public VoiceMailCallOptionHandler getVoiceMailCallOptionHandler()
    {
        return mVoiceMailCallOptionHandler;
    }
}
