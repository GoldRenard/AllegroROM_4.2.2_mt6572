// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Log;

// Referenced classes of package android.view:
//            View, HardwareLayer, HardwareRenderer

public class TextureView extends View
{
    public static interface SurfaceTextureListener
    {

        public abstract void onSurfaceTextureAvailable(SurfaceTexture surfacetexture, int i, int j);

        public abstract boolean onSurfaceTextureDestroyed(SurfaceTexture surfacetexture);

        public abstract void onSurfaceTextureSizeChanged(SurfaceTexture surfacetexture, int i, int j);

        public abstract void onSurfaceTextureUpdated(SurfaceTexture surfacetexture);
    }


    private static final String LOG_TAG = "TextureView";
    private Canvas mCanvas;
    private HardwareLayer mLayer;
    private SurfaceTextureListener mListener;
    private final Object mLock[];
    private final Matrix mMatrix;
    private boolean mMatrixChanged;
    private int mNativeWindow;
    private final Object mNativeWindowLock[];
    private boolean mOpaque;
    private int mSaveCount;
    private SurfaceTexture mSurface;
    private boolean mUpdateLayer;
    private android.graphics.SurfaceTexture.OnFrameAvailableListener mUpdateListener;
    private boolean mUpdateSurface;

    public TextureView(Context context)
    {
        super(context);
        mOpaque = true;
        mMatrix = new Matrix();
        mLock = new Object[0];
        mNativeWindowLock = new Object[0];
        init();
    }

    public TextureView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mOpaque = true;
        mMatrix = new Matrix();
        mLock = new Object[0];
        mNativeWindowLock = new Object[0];
        init();
    }

    public TextureView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mOpaque = true;
        mMatrix = new Matrix();
        mLock = new Object[0];
        mNativeWindowLock = new Object[0];
        init();
    }

    private void applyTransformMatrix()
    {
        if (mMatrixChanged && mLayer != null)
        {
            mLayer.setTransform(mMatrix);
            mMatrixChanged = false;
        }
    }

    private void applyUpdate()
    {
        if (mLayer != null) goto _L2; else goto _L1
_L1:
        return;
_L2:
        synchronized (mLock)
        {
            if (!mUpdateLayer)
                break MISSING_BLOCK_LABEL_69;
            mUpdateLayer = false;
        }
        mLayer.update(getWidth(), getHeight(), mOpaque);
        if (mListener == null) goto _L1; else goto _L3
_L3:
        mListener.onSurfaceTextureUpdated(mSurface);
        return;
        aobj;
        JVM INSTR monitorexit ;
        return;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void destroySurface()
    {
        if (mLayer != null)
        {
            mSurface.detachFromGLContext();
            mLayer.clearStorage();
            boolean flag = true;
            if (mListener != null)
                flag = mListener.onSurfaceTextureDestroyed(mSurface);
            synchronized (mNativeWindowLock)
            {
                nDestroyNativeWindow();
            }
            mLayer.destroy();
            if (flag)
                mSurface.release();
            mSurface = null;
            mLayer = null;
        }
        return;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void init()
    {
        super.mLayerPaint = new Paint();
    }

    private native void nCreateNativeWindow(SurfaceTexture surfacetexture);

    private native void nDestroyNativeWindow();

    private static native void nLockCanvas(int i, Canvas canvas, Rect rect);

    private static native void nSetDefaultBufferSize(SurfaceTexture surfacetexture, int i, int j);

    private static native void nUnlockCanvasAndPost(int i, Canvas canvas);

    private void updateLayer()
    {
        synchronized (mLock)
        {
            mUpdateLayer = true;
        }
        return;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void updateLayerAndInvalidate()
    {
        synchronized (mLock)
        {
            mUpdateLayer = true;
        }
        invalidate();
        return;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void buildLayer()
    {
    }

    protected void destroyHardwareResources()
    {
        super.destroyHardwareResources();
        destroySurface();
        invalidateParentCaches();
        invalidate(true);
    }

    boolean destroyLayer(boolean flag)
    {
        return false;
    }

    protected void destroySurfaceSafely()
    {
        if (mLayer != null && super.mAttachInfo != null && super.mAttachInfo.mHardwareRenderer != null && !super.mAttachInfo.mHardwareRenderer.safelyRun(new Runnable() {

        final TextureView this$0;

        public void run()
        {
            destroySurface();
        }

            
            {
                this$0 = TextureView.this;
                super();
            }
    }
))
            Log.w("TextureView", (new StringBuilder()).append("TextureView was not able to detach from GLContext ").append(this).toString());
    }

    public final void draw(Canvas canvas)
    {
        super.mPrivateFlags = 0x20 | 0xff9fffff & super.mPrivateFlags;
        applyUpdate();
        applyTransformMatrix();
    }

    public Bitmap getBitmap()
    {
        return getBitmap(getWidth(), getHeight());
    }

    public Bitmap getBitmap(int i, int j)
    {
        if (isAvailable() && i > 0 && j > 0)
            return getBitmap(Bitmap.createBitmap(getResources().getDisplayMetrics(), i, j, android.graphics.Bitmap.Config.ARGB_8888));
        else
            return null;
    }

    public Bitmap getBitmap(Bitmap bitmap)
    {
        if (bitmap != null && isAvailable())
        {
            View.AttachInfo attachinfo = super.mAttachInfo;
            if (attachinfo != null && attachinfo.mHardwareRenderer != null && attachinfo.mHardwareRenderer.isEnabled() && !attachinfo.mHardwareRenderer.validate())
                throw new IllegalStateException("Could not acquire hardware rendering context");
            applyUpdate();
            applyTransformMatrix();
            if (mLayer == null && mUpdateSurface)
                getHardwareLayer();
            if (mLayer != null)
                mLayer.copyInto(bitmap);
        }
        return bitmap;
    }

    HardwareLayer getHardwareLayer()
    {
label0:
        {
            super.mPrivateFlags = 0x8020 | super.mPrivateFlags;
            super.mPrivateFlags = 0xff9fffff & super.mPrivateFlags;
            if (mLayer == null)
            {
                if (super.mAttachInfo == null || super.mAttachInfo.mHardwareRenderer == null)
                    break label0;
                mLayer = super.mAttachInfo.mHardwareRenderer.createHardwareLayer(mOpaque);
                if (!mUpdateSurface)
                    mSurface = super.mAttachInfo.mHardwareRenderer.createSurfaceTexture(mLayer);
                nSetDefaultBufferSize(mSurface, getWidth(), getHeight());
                nCreateNativeWindow(mSurface);
                mUpdateListener = new android.graphics.SurfaceTexture.OnFrameAvailableListener() {

                    final TextureView this$0;

                    public void onFrameAvailable(SurfaceTexture surfacetexture)
                    {
                        updateLayer();
                        if (Looper.myLooper() == Looper.getMainLooper())
                        {
                            invalidate();
                            return;
                        } else
                        {
                            postInvalidate();
                            return;
                        }
                    }

            
            {
                this$0 = TextureView.this;
                super();
            }
                }
;
                mSurface.setOnFrameAvailableListener(mUpdateListener);
                if (mListener != null && !mUpdateSurface)
                    mListener.onSurfaceTextureAvailable(mSurface, getWidth(), getHeight());
                mLayer.setLayerPaint(super.mLayerPaint);
            }
            if (mUpdateSurface)
            {
                mUpdateSurface = false;
                updateLayer();
                mMatrixChanged = true;
                super.mAttachInfo.mHardwareRenderer.setSurfaceTexture(mLayer, mSurface);
                nSetDefaultBufferSize(mSurface, getWidth(), getHeight());
            }
            applyUpdate();
            applyTransformMatrix();
            return mLayer;
        }
        return null;
    }

    public int getLayerType()
    {
        return 2;
    }

    public SurfaceTexture getSurfaceTexture()
    {
        return mSurface;
    }

    public SurfaceTextureListener getSurfaceTextureListener()
    {
        return mListener;
    }

    public Matrix getTransform(Matrix matrix)
    {
        if (matrix == null)
            matrix = new Matrix();
        matrix.set(mMatrix);
        return matrix;
    }

    boolean hasStaticLayer()
    {
        return true;
    }

    public boolean isAvailable()
    {
        return mSurface != null;
    }

    public boolean isOpaque()
    {
        return mOpaque;
    }

    public Canvas lockCanvas()
    {
        return lockCanvas(null);
    }

    public Canvas lockCanvas(Rect rect)
    {
        if (!isAvailable())
            return null;
        if (mCanvas == null)
            mCanvas = new Canvas();
        synchronized (mNativeWindowLock)
        {
            nLockCanvas(mNativeWindow, mCanvas, rect);
        }
        mSaveCount = mCanvas.save();
        return mCanvas;
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (!isHardwareAccelerated())
            Log.w("TextureView", "A TextureView or a subclass can only be used with hardware acceleration enabled.");
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mLayer != null && super.mAttachInfo != null && super.mAttachInfo.mHardwareRenderer != null && !super.mAttachInfo.mHardwareRenderer.safelyRun(new Runnable() {

        final TextureView this$0;

        public void run()
        {
            destroySurface();
        }

            
            {
                this$0 = TextureView.this;
                super();
            }
    }
))
            Log.w("TextureView", (new StringBuilder()).append("TextureView was not able to destroy its surface: ").append(this).toString());
    }

    protected final void onDraw(Canvas canvas)
    {
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        if (mSurface != null)
        {
            nSetDefaultBufferSize(mSurface, getWidth(), getHeight());
            updateLayer();
            if (mListener != null)
                mListener.onSurfaceTextureSizeChanged(mSurface, getWidth(), getHeight());
        }
    }

    protected void onVisibilityChanged(View view, int i)
    {
label0:
        {
            super.onVisibilityChanged(view, i);
            if (mSurface != null)
            {
                if (i != 0)
                    break label0;
                mSurface.setOnFrameAvailableListener(mUpdateListener);
                updateLayerAndInvalidate();
            }
            return;
        }
        mSurface.setOnFrameAvailableListener(null);
    }

    public void setLayerType(int i, Paint paint)
    {
        if (paint != super.mLayerPaint)
        {
            super.mLayerPaint = paint;
            invalidate();
        }
    }

    public void setOpaque(boolean flag)
    {
        if (flag != mOpaque)
        {
            mOpaque = flag;
            if (mLayer != null)
                updateLayerAndInvalidate();
        }
    }

    public void setSurfaceTexture(SurfaceTexture surfacetexture)
    {
        if (surfacetexture == null)
            throw new NullPointerException("surfaceTexture must not be null");
        if (mSurface != null)
            mSurface.release();
        mSurface = surfacetexture;
        mUpdateSurface = true;
        invalidateParentIfNeeded();
    }

    public void setSurfaceTextureListener(SurfaceTextureListener surfacetexturelistener)
    {
        mListener = surfacetexturelistener;
    }

    public void setTransform(Matrix matrix)
    {
        mMatrix.set(matrix);
        mMatrixChanged = true;
        invalidateParentIfNeeded();
    }

    public void unlockCanvasAndPost(Canvas canvas)
    {
        if (mCanvas != null && canvas == mCanvas)
        {
            canvas.restoreToCount(mSaveCount);
            mSaveCount = 0;
            synchronized (mNativeWindowLock)
            {
                nUnlockCanvasAndPost(mNativeWindow, mCanvas);
            }
            return;
        } else
        {
            return;
        }
        exception;
        aobj;
        JVM INSTR monitorexit ;
        throw exception;
    }


}
