// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt.loopback;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.ViewStub;
import com.mediatek.settings.VTSettingUtils;

// Referenced classes of package com.mediatek.vt.loopback:
//            VTInCallScreenLoopback

public class VTLoopbackActivity extends Activity
{

    private static final String LOG_TAG = "VTLoopbackActivity";
    private VTInCallScreenLoopback mVTInCallScreenLoopback;


    void log(String s)
    {
        Log.w("VTLoopbackActivity", s);
    }

    public void onCreate(Bundle bundle)
    {
        log("VTLoopbackActivity:onCreate");
        super.onCreate(bundle);
        setContentView(0x7f040042);
        mVTInCallScreenLoopback = new VTInCallScreenLoopback(this);
        ((ViewStub)findViewById(0x7f08011f)).inflate();
        mVTInCallScreenLoopback = (VTInCallScreenLoopback)findViewById(0x7f08010e);
        mVTInCallScreenLoopback.setVTLoopBackInstance(this);
        mVTInCallScreenLoopback.initVTInCallScreen();
        VTSettingUtils.getInstance().updateVTSettingState(0);
        VTSettingUtils.getInstance().updateVTEngineerModeValues();
        mVTInCallScreenLoopback.internalAnswerVTCallPre();
        mVTInCallScreenLoopback.setVTScreenMode(com.android.phone.Constants.VTScreenMode.VT_SCREEN_OPEN);
    }

    public void onDestroy()
    {
        log("VTLoopbackActivity:onDestroy()");
        super.onDestroy();
    }

    public void onResume()
    {
        super.onResume();
        log("VTLoopbackActivity:onResume");
    }

    public void onStop()
    {
        super.onStop();
        log("VTLoopbackActivity:onStop");
        mVTInCallScreenLoopback.onStop();
        finish();
    }
}
