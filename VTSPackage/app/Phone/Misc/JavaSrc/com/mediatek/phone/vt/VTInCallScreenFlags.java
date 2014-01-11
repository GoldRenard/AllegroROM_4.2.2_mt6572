// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.util.Log;
import com.android.internal.telephony.Connection;
import com.mediatek.phone.ext.ExtensionManager;
import com.mediatek.phone.ext.VTInCallScreenFlagsExtension;

public final class VTInCallScreenFlags
{
    public class VTConnectionStarttime
    {

        public Connection mConnection;
        public long mStarttime;
        final VTInCallScreenFlags this$0;

        public void reset()
        {
            Log.d("VTConnectionStarttime", "reset...");
            mConnection = null;
            mStarttime = -1L;
        }

        public VTConnectionStarttime()
        {
            this$0 = VTInCallScreenFlags.this;
            super();
            reset();
        }
    }


    private static VTInCallScreenFlags sVTInCallScreenFlags = new VTInCallScreenFlags();
    public VTConnectionStarttime mVTConnectionStarttime;
    public boolean mVTFrontCameraNow;
    public boolean mVTHasReceiveFirstFrame;
    public boolean mVTHideMeNow;
    public boolean mVTInControlRes;
    public boolean mVTInEndingCall;
    public boolean mVTInLocalBrightnessSetting;
    public boolean mVTInLocalContrastSetting;
    public boolean mVTInLocalZoomSetting;
    public boolean mVTInSnapshot;
    public boolean mVTInSwitchCamera;
    public boolean mVTIsInflate;
    public boolean mVTIsMT;
    public boolean mVTPeerBigger;
    public boolean mVTSettingReady;
    public boolean mVTShouldCloseVTManager;
    public int mVTSlotId;
    public boolean mVTSurfaceChangedH;
    public boolean mVTSurfaceChangedL;
    public boolean mVTVideoConnected;
    public boolean mVTVideoReady;
    public boolean mVTVoiceAnswer;
    public String mVTVoiceAnswerPhoneNumber;

    private VTInCallScreenFlags()
    {
        mVTConnectionStarttime = new VTConnectionStarttime();
        reset();
    }

    public static VTInCallScreenFlags getInstance()
    {
        return sVTInCallScreenFlags;
    }

    public void reset()
    {
        mVTIsMT = false;
        mVTHideMeNow = false;
        mVTFrontCameraNow = true;
        mVTSettingReady = false;
        mVTSurfaceChangedL = false;
        mVTSurfaceChangedH = false;
        mVTVideoConnected = false;
        mVTVideoReady = false;
        mVTHasReceiveFirstFrame = false;
        mVTInLocalZoomSetting = false;
        mVTInLocalBrightnessSetting = false;
        mVTInLocalContrastSetting = false;
        mVTInControlRes = false;
        mVTInEndingCall = false;
        mVTShouldCloseVTManager = true;
        if (mVTConnectionStarttime != null)
            mVTConnectionStarttime.reset();
        mVTInSnapshot = false;
        mVTInSwitchCamera = false;
        mVTPeerBigger = true;
        mVTVoiceAnswer = false;
        mVTVoiceAnswerPhoneNumber = null;
        ExtensionManager.getInstance().getVTInCallScreenFlagsExtension().reset();
        mVTSlotId = 0;
    }

    public void resetPartial()
    {
        mVTIsMT = false;
        mVTHideMeNow = false;
        mVTFrontCameraNow = true;
        mVTSettingReady = false;
        mVTSurfaceChangedL = false;
        mVTSurfaceChangedH = false;
        mVTVideoConnected = false;
        mVTVideoReady = false;
        mVTHasReceiveFirstFrame = false;
        mVTInLocalZoomSetting = false;
        mVTInLocalBrightnessSetting = false;
        mVTInLocalContrastSetting = false;
        mVTInControlRes = false;
        mVTInEndingCall = false;
        if (mVTConnectionStarttime != null)
            mVTConnectionStarttime.reset();
        mVTInSnapshot = false;
        mVTInSwitchCamera = false;
        mVTPeerBigger = true;
        mVTVoiceAnswer = false;
        mVTVoiceAnswerPhoneNumber = null;
        ExtensionManager.getInstance().getVTInCallScreenFlagsExtension().reset();
        mVTSlotId = 0;
    }

    public void resetTiming()
    {
        if (mVTConnectionStarttime != null)
            mVTConnectionStarttime.reset();
    }

}
