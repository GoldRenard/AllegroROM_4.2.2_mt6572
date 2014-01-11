// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.vt;

import android.hardware.Camera;
import android.util.Log;
import android.view.SurfaceHolder;
import java.io.IOException;

public class PeerAndLocalSurfaceMng
{

    public static final int QCIF_HEIGHT = 144;
    public static final int QCIF_WIDTH = 176;
    public Camera camera;
    SurfaceHolder mBigOne;
    SurfaceHolder mSmallOne;
    android.view.SurfaceHolder.Callback mSurfaceCallback;

    public PeerAndLocalSurfaceMng(SurfaceHolder surfaceholder, SurfaceHolder surfaceholder1)
    {
        mSurfaceCallback = new android.view.SurfaceHolder.Callback() {

            final PeerAndLocalSurfaceMng this$0;

            public void surfaceChanged(SurfaceHolder surfaceholder2, int i, int j, int k)
            {
                android.hardware.Camera.Parameters parameters = camera.getParameters();
                parameters.setPreviewSize(176, 144);
                parameters.setPictureFormat(256);
                camera.setParameters(parameters);
                camera.startPreview();
            }

            public void surfaceCreated(SurfaceHolder surfaceholder2)
            {
                camera = Camera.open();
                camera.getParameters().flatten();
                try
                {
                    camera.setPreviewDisplay(surfaceholder2);
                    return;
                }
                catch (IOException ioexception)
                {
                    Log.e("PictureDemo-surfaceCallback", "Exception in setPreviewDisplay()", ioexception);
                }
            }

            public void surfaceDestroyed(SurfaceHolder surfaceholder2)
            {
                camera.stopPreview();
                camera.release();
                camera = null;
            }

            
            {
                this$0 = PeerAndLocalSurfaceMng.this;
                super();
            }
        }
;
        mBigOne = surfaceholder;
        mSmallOne = surfaceholder1;
        openCamera();
    }

    void openCamera()
    {
        mBigOne.addCallback(mSurfaceCallback);
        mBigOne.setType(3);
    }
}
