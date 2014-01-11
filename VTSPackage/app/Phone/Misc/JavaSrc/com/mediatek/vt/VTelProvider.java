// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt;

import android.util.Log;
import android.view.Surface;

// Referenced classes of package com.mediatek.vt:
//            CameraParamters, VTManager

public class VTelProvider
{

    private static final boolean DEBUG = true;
    private static final String TAG = "VTelProvider";


    public static native int closeVTService();

    public static native int enableAlwaysAskSettings(int i);

    public static native int enableHideMe(int i);

    public static native int enableHideYou(int i);

    public static native int getCameraSensorCount();

    public static CameraParamters getParameters()
    {
        CameraParamters cameraparamters = new CameraParamters();
        cameraparamters.unflatten(nativeGetParameters());
        cameraparamters.dump();
        return cameraparamters;
    }

    public static native int incomingVTCall(int i);

    public static native int incomingVideoDispaly(int i);

    public static native int initVTService(Surface surface, Surface surface1);

    public static native int isMicrophoneOn();

    public static native int isSpeakerOn();

    public static native int lockPeerVideo();

    private static native String nativeGetParameters();

    private static native void nativeSetParameters(String s);

    public static native void onUserInput(String s);

    public static final native int openVTService(int i);

    public static void postEventFromNative(int i, int j, int k, Object obj)
    {
        VTManager.getInstance().postEventFromNative(i, j, k, obj);
    }

    public static native int replacePeerVideoSettings(int i, String s);

    public static native void setEM(int i, int j, int k);

    public static native void setEndCallFlag();

    public static native int setInvokeLockPeerVideoBeforeOpen(int i);

    public static native void setLocalVideoType(int i, String s);

    public static void setParameters(CameraParamters cameraparamters)
    {
        if (cameraparamters == null)
        {
            Log.e("VTelProvider", "setParameters: params == null");
            return;
        } else
        {
            Log.i("VTelProvider", cameraparamters.flatten());
            nativeSetParameters(cameraparamters.flatten());
            Log.i("VTelProvider", "setParameters ok");
            return;
        }
    }

    public static native void setPeerVideo(int i);

    public static native int setVTVisible(int i, Surface surface, Surface surface1);

    public static native int snapshot(int i, String s);

    public static native int startRecording(int i, String s, long l);

    public static final native int startVTService();

    public static native int stopRecording(int i);

    public static native int stopVTService();

    public static native int switchCamera();

    public static native void turnOnMicrophone(int i);

    public static native void turnOnSpeaker(int i);

    public static native int unlockPeerVideo();

    public static CameraParamters updateParameters(CameraParamters cameraparamters)
    {
        if (cameraparamters == null)
        {
            Log.e("VTelProvider", "updateParameters: p == null");
            return cameraparamters;
        } else
        {
            cameraparamters.unflatten(nativeGetParameters());
            return cameraparamters;
        }
    }

    public static native int userSelectYes(int i);

    static 
    {
        System.loadLibrary("mtk_vt_client");
    }
}
