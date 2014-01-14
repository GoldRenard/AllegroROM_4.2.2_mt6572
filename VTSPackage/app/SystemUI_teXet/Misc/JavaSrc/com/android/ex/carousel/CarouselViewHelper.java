// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.ex.carousel;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Rect;
import android.os.*;
import android.renderscript.Matrix4f;
import android.renderscript.Mesh;
import android.util.Log;

// Referenced classes of package com.android.ex.carousel:
//            CarouselView

public class CarouselViewHelper
    implements CarouselRS.CarouselCallback
{
    class AsyncHandler extends Handler
    {

        final CarouselViewHelper this$0;

        public void handleMessage(Message message)
        {
            int i;
label0:
            {
                i = message.arg1;
                if (i >= mCarouselView.getCardCount())
                {
                    Log.e("CarouselViewHelper", (new StringBuilder()).append("Index out of range for get, card:").append(i).toString());
                } else
                {
                    if (message.what < 0xf4240 || message.what > 0x3d0900)
                        break label0;
                    if (message.what < 0x1e8480)
                    {
                        Bitmap bitmap1 = getTexture(i);
                        if (bitmap1 != null)
                            mSyncHandler.obtainMessage(1, i, 0, bitmap1).sendToTarget();
                        TextureParameters textureparameters = getTextureParameters(i);
                        if (textureparameters != null)
                        {
                            mSyncHandler.obtainMessage(4, i, 0, textureparameters.matrix.getArray()).sendToTarget();
                            return;
                        }
                    } else
                    if (message.what < 0x2dc6c0)
                    {
                        Bitmap bitmap = getDetailTexture(i);
                        if (bitmap != null)
                        {
                            mSyncHandler.obtainMessage(2, i, 0, bitmap).sendToTarget();
                            return;
                        }
                    } else
                    if (message.what < 0x3d0900)
                    {
                        Mesh mesh = getGeometry(i);
                        if (mesh != null)
                        {
                            mSyncHandler.obtainMessage(3, i, 0, mesh).sendToTarget();
                            return;
                        }
                    }
                }
                return;
            }
            Log.e("CarouselViewHelper", (new StringBuilder()).append("Unknown message: ").append(i).toString());
        }

        AsyncHandler(Looper looper)
        {
            this$0 = CarouselViewHelper.this;
            super(looper);
        }
    }

    public static class DetailTextureParameters
    {

        public float lineOffsetX;
        public float lineOffsetY;
        public float textureOffsetX;
        public float textureOffsetY;

        public DetailTextureParameters(float f, float f1)
        {
            textureOffsetX = f;
            textureOffsetY = f1;
            lineOffsetX = 0.0F;
            lineOffsetY = 0.0F;
        }

        public DetailTextureParameters(float f, float f1, float f2, float f3)
        {
            textureOffsetX = f;
            textureOffsetY = f1;
            lineOffsetX = f2;
            lineOffsetY = f3;
        }
    }

    class SyncHandler extends Handler
    {

        final CarouselViewHelper this$0;

        public void handleMessage(Message message)
        {
            int i = message.arg1;
            if (i >= mCarouselView.getCardCount())
            {
                Log.e("CarouselViewHelper", (new StringBuilder()).append("Index out of range for set, card:").append(i).toString());
                return;
            }
            switch (message.what)
            {
            case 4: // '\004'
                mCarouselView.setMatrixForItem(i, (float[])(float[])message.obj);
                return;

            case 3: // '\003'
                mCarouselView.setGeometryForItem(i, (Mesh)message.obj);
                return;

            case 2: // '\002'
                DetailTextureParameters detailtextureparameters = getDetailTextureParameters(i);
                float f;
                if (detailtextureparameters != null)
                    f = detailtextureparameters.textureOffsetX;
                else
                    f = 0.0F;
                float f1;
                if (detailtextureparameters != null)
                    f1 = detailtextureparameters.textureOffsetY;
                else
                    f1 = 0.0F;
                float f2;
                if (detailtextureparameters != null)
                    f2 = detailtextureparameters.lineOffsetX;
                else
                    f2 = 0.0F;
                float f3 = 0.0F;
                if (detailtextureparameters != null)
                    f3 = detailtextureparameters.lineOffsetY;
                mCarouselView.setDetailTextureForItem(i, f, f1, f2, f3, (Bitmap)message.obj);
                return;

            case 1: // '\001'
                mCarouselView.setTextureForItem(i, (Bitmap)message.obj);
                return;
            }
        }

        SyncHandler()
        {
            this$0 = CarouselViewHelper.this;
            super();
        }
    }

    public static class TextureParameters
    {

        public Matrix4f matrix;

        public TextureParameters()
        {
            matrix = new Matrix4f();
        }

        public TextureParameters(Matrix4f matrix4f)
        {
            matrix = matrix4f;
        }
    }


    private static final int REQUEST_DETAIL_TEXTURE_N = 0x1e8480;
    private static final int REQUEST_END = 0x3d0900;
    private static final int REQUEST_GEOMETRY_N = 0x2dc6c0;
    private static final int REQUEST_TEXTURE_N = 0xf4240;
    private static final int SET_DETAIL_TEXTURE_N = 2;
    private static final int SET_GEOMETRY_N = 3;
    private static final int SET_MATRIX_N = 4;
    private static final int SET_TEXTURE_N = 1;
    private static final String TAG = "CarouselViewHelper";
    private boolean DBG;
    private long HOLDOFF_DELAY;
    private Handler mAsyncHandler;
    private CarouselView mCarouselView;
    private Context mContext;
    private HandlerThread mHandlerThread;
    private Handler mSyncHandler;

    public CarouselViewHelper(Context context)
    {
        DBG = false;
        HOLDOFF_DELAY = 100L;
        mContext = context;
        mHandlerThread = new HandlerThread("CarouselViewHelper.handler");
        mHandlerThread.start();
        mAsyncHandler = new AsyncHandler(mHandlerThread.getLooper());
        mSyncHandler = new SyncHandler();
    }

    public CarouselViewHelper(Context context, CarouselView carouselview)
    {
        this(context);
        setCarouselView(carouselview);
    }

    protected Handler getAsyncHandler()
    {
        return mAsyncHandler;
    }

    protected CarouselView getCarouselView()
    {
        return mCarouselView;
    }

    public Bitmap getDetailTexture(int i)
    {
        return null;
    }

    public DetailTextureParameters getDetailTextureParameters(int i)
    {
        return null;
    }

    public Mesh getGeometry(int i)
    {
        return null;
    }

    public Bitmap getTexture(int i)
    {
        return null;
    }

    public TextureParameters getTextureParameters(int i)
    {
        return null;
    }

    public void onAnimationFinished(float f)
    {
    }

    public void onAnimationStarted()
    {
    }

    public void onCardLongPress(int i, int ai[], Rect rect)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onCardLongPress(").append(i).append(", (").append(ai).append("), (").append(rect).append(") )").toString());
    }

    public void onCardSelected(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onCardSelected(").append(i).append(")").toString());
    }

    public void onDestroy()
    {
        mHandlerThread.quit();
    }

    public void onDetailSelected(int i, int j, int k)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onDetailSelected(").append(i).append(", ").append(j).append(", ").append(k).append(")").toString());
    }

    public void onInvalidateDetailTexture(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onInvalidateDetailTexture(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0x1e8480 + i);
    }

    public void onInvalidateGeometry(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onInvalidateGeometry(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0x2dc6c0 + i);
    }

    public void onInvalidateTexture(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onInvalidateTexture(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0xf4240 + i);
    }

    public void onPause()
    {
        mCarouselView.pause();
    }

    public void onRequestDetailTexture(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onRequestDetailTexture(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0x1e8480 + i);
        Message message = mAsyncHandler.obtainMessage(0x1e8480 + i, i, 0);
        mAsyncHandler.sendMessageDelayed(message, HOLDOFF_DELAY);
    }

    public void onRequestGeometry(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onRequestGeometry(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0x2dc6c0 + i);
        mAsyncHandler.sendMessage(mAsyncHandler.obtainMessage(0x2dc6c0 + i, i, 0));
    }

    public void onRequestTexture(int i)
    {
        if (DBG)
            Log.v("CarouselViewHelper", (new StringBuilder()).append("onRequestTexture(").append(i).append(")").toString());
        mAsyncHandler.removeMessages(0xf4240 + i);
        Message message = mAsyncHandler.obtainMessage(0xf4240 + i, i, 0);
        mAsyncHandler.sendMessageDelayed(message, HOLDOFF_DELAY);
    }

    public void onResume()
    {
        mCarouselView.resume();
    }

    public void setCarouselView(CarouselView carouselview)
    {
        mCarouselView = carouselview;
        mCarouselView.setCallback(this);
    }


}
