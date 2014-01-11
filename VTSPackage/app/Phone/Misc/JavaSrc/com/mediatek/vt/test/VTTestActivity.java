// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt.test;

import android.app.Activity;
import android.hardware.Camera;
import android.os.Bundle;
import android.util.Log;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

public class VTTestActivity extends Activity
    implements android.view.SurfaceHolder.Callback
{

    private static final String LOG_TAG = "VTTestActivity";
    private Camera mCamera;
    private SurfaceView mLocalSurfaceView;
    private SurfaceView mPeerSurfaceView;


    public Camera getCamera()
    {
        return mCamera;
    }

    public SurfaceHolder getLocalSurfaceHolder()
    {
        log("getLocalSurfaceHolder()");
        return mLocalSurfaceView.getHolder();
    }

    public SurfaceHolder getPeerSurfaceHolder()
    {
        log("getPeerSurfaceHolder()");
        return mPeerSurfaceView.getHolder();
    }

    void log(String s)
    {
        Log.d("VTTestActivity", s);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f040043);
        log("VTTestActivity onCreate()");
        mPeerSurfaceView = (SurfaceView)findViewById(0x7f080122);
        mLocalSurfaceView = (SurfaceView)findViewById(0x7f080128);
    }

    public void onDestroy()
    {
        log("CameraActivity onDestroy()");
        super.onDestroy();
    }

    public void surfaceChanged(SurfaceHolder surfaceholder, int i, int j, int k)
    {
        try
        {
            android.hardware.Camera.Parameters parameters = mCamera.getParameters();
            parameters.setPictureSize(j, k);
            mCamera.setParameters(parameters);
            mCamera.setPreviewDisplay(surfaceholder);
            mCamera.startPreview();
            return;
        }
        catch (Exception exception)
        {
            return;
        }
    }

    public void surfaceCreated(SurfaceHolder surfaceholder)
    {
        mCamera = Camera.open();
    }

    public void surfaceDestroyed(SurfaceHolder surfaceholder)
    {
        mCamera.stopPreview();
        mCamera.release();
        mCamera = null;
    }
}
