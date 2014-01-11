// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.*;
import android.os.*;
import android.util.Log;
import dalvik.system.CloseGuard;

// Referenced classes of package android.view:
//            SurfaceSession

public class Surface
    implements Parcelable
{
    private final class CompatibleCanvas extends Canvas
    {

        private Matrix mOrigMatrix;
        final Surface this$0;

        public int getHeight()
        {
            int i = super.getHeight();
            if (mCompatibilityTranslator != null)
                i = (int)(0.5F + (float)i * mCompatibilityTranslator.applicationInvertedScale);
            return i;
        }

        public void getMatrix(Matrix matrix)
        {
            super.getMatrix(matrix);
            if (mOrigMatrix == null)
                mOrigMatrix = new Matrix();
            mOrigMatrix.set(matrix);
        }

        public int getWidth()
        {
            int i = super.getWidth();
            if (mCompatibilityTranslator != null)
                i = (int)(0.5F + (float)i * mCompatibilityTranslator.applicationInvertedScale);
            return i;
        }

        public void setMatrix(Matrix matrix)
        {
            if (mCompatibleMatrix != null && mOrigMatrix != null && !mOrigMatrix.equals(matrix))
            {
                Matrix matrix1 = new Matrix(mCompatibleMatrix);
                matrix1.preConcat(matrix);
                super.setMatrix(matrix1);
                return;
            } else
            {
                super.setMatrix(matrix);
                return;
            }
        }

        private CompatibleCanvas()
        {
            this$0 = Surface.this;
            super();
            mOrigMatrix = null;
        }

    }

    public static class OutOfResourcesException extends Exception
    {


        public OutOfResourcesException(String s)
        {
            super(s);
        }
    }

    public static final class PhysicalDisplayInfo
    {

        public float density;
        public int height;
        public float refreshRate;
        public boolean secure;
        public int width;
        public float xDpi;
        public float yDpi;

        public void copyFrom(PhysicalDisplayInfo physicaldisplayinfo)
        {
            width = physicaldisplayinfo.width;
            height = physicaldisplayinfo.height;
            refreshRate = physicaldisplayinfo.refreshRate;
            density = physicaldisplayinfo.density;
            xDpi = physicaldisplayinfo.xDpi;
            yDpi = physicaldisplayinfo.yDpi;
            secure = physicaldisplayinfo.secure;
        }

        public boolean equals(PhysicalDisplayInfo physicaldisplayinfo)
        {
            return physicaldisplayinfo != null && width == physicaldisplayinfo.width && height == physicaldisplayinfo.height && refreshRate == physicaldisplayinfo.refreshRate && density == physicaldisplayinfo.density && xDpi == physicaldisplayinfo.xDpi && yDpi == physicaldisplayinfo.yDpi && secure == physicaldisplayinfo.secure;
        }

        public boolean equals(Object obj)
        {
            return (obj instanceof PhysicalDisplayInfo) && equals((PhysicalDisplayInfo)obj);
        }

        public int hashCode()
        {
            return 0;
        }

        public String toString()
        {
            return (new StringBuilder()).append("PhysicalDisplayInfo{").append(width).append(" x ").append(height).append(", ").append(refreshRate).append(" fps, ").append("density ").append(density).append(", ").append(xDpi).append(" x ").append(yDpi).append(" dpi, secure ").append(secure).append("}").toString();
        }


        public PhysicalDisplayInfo(PhysicalDisplayInfo physicaldisplayinfo)
        {
            copyFrom(physicaldisplayinfo);
        }
    }


    public static final int BUILT_IN_DISPLAY_ID_HDMI = 1;
    public static final int BUILT_IN_DISPLAY_ID_MAIN = 0;
    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public Surface createFromParcel(Parcel parcel)
        {
            Surface surface;
            try
            {
                surface = new Surface();
                surface.readFromParcel(parcel);
            }
            catch (Exception exception)
            {
                Log.e("Surface", "Exception creating surface from parcel", exception);
                return null;
            }
            return surface;
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public Surface[] newArray(int i)
        {
            return new Surface[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    public static final int FX_SURFACE_BLUR = 0x10000;
    public static final int FX_SURFACE_DIM = 0x20000;
    public static final int FX_SURFACE_MASK = 0xf0000;
    public static final int FX_SURFACE_NORMAL = 0;
    public static final int FX_SURFACE_SCREENSHOT = 0x30000;
    private static final boolean HEADLESS = "1".equals(SystemProperties.get("ro.config.headless", "0"));
    public static final int HIDDEN = 4;
    public static final int NON_PREMULTIPLIED = 256;
    public static final int OPAQUE = 1024;
    public static final int PROTECTED_APP = 2048;
    public static final int ROTATION_0 = 0;
    public static final int ROTATION_180 = 2;
    public static final int ROTATION_270 = 3;
    public static final int ROTATION_90 = 1;
    public static final int SECURE = 128;
    public static final int SURFACE_HIDDEN = 1;
    private static final String TAG = "Surface";
    private final Canvas mCanvas;
    private int mCanvasSaveCount;
    private final CloseGuard mCloseGuard;
    private android.content.res.CompatibilityInfo.Translator mCompatibilityTranslator;
    private Matrix mCompatibleMatrix;
    private int mGenerationId;
    private int mHeight;
    private String mName;
    private int mNativeSurface;
    private int mNativeSurfaceControl;
    private int mWidth;

    public Surface()
    {
        mCloseGuard = CloseGuard.get();
        mCanvas = new CompatibleCanvas();
        checkHeadless();
        mCloseGuard.open("release");
    }

    public Surface(SurfaceTexture surfacetexture)
    {
        mCloseGuard = CloseGuard.get();
        mCanvas = new CompatibleCanvas();
        if (surfacetexture == null)
            throw new IllegalArgumentException("surfaceTexture must not be null");
        checkHeadless();
        mName = surfacetexture.toString();
        try
        {
            nativeCreateFromSurfaceTexture(surfacetexture);
        }
        catch (OutOfResourcesException outofresourcesexception)
        {
            throw new RuntimeException(outofresourcesexception);
        }
        mCloseGuard.open("release");
    }

    public Surface(SurfaceSession surfacesession, String s, int i, int j, int k, int l)
        throws OutOfResourcesException
    {
        mCloseGuard = CloseGuard.get();
        mCanvas = new CompatibleCanvas();
        if (surfacesession == null)
            throw new IllegalArgumentException("session must not be null");
        if (s == null)
            throw new IllegalArgumentException("name must not be null");
        if ((l & 4) == 0)
            Log.w("Surface", (new StringBuilder()).append("Surfaces should always be created with the HIDDEN flag set to ensure that they are not made visible prematurely before all of the surface's properties have been configured.  Set the other properties and make the surface visible within a transaction.  New surface name: ").append(s).toString(), new Throwable());
        checkHeadless();
        mName = s;
        mWidth = i;
        mHeight = j;
        nativeCreate(surfacesession, s, i, j, k, l);
        mCloseGuard.open("release");
    }

    public static void blankDisplay(IBinder ibinder)
    {
        if (ibinder == null)
        {
            throw new IllegalArgumentException("displayToken must not be null");
        } else
        {
            nativeBlankDisplay(ibinder);
            return;
        }
    }

    private static void checkHeadless()
    {
        if (HEADLESS)
            throw new UnsupportedOperationException("Device is headless");
        else
            return;
    }

    public static void closeTransaction()
    {
        nativeCloseTransaction();
    }

    public static IBinder createDisplay(String s, boolean flag)
    {
        if (s == null)
            throw new IllegalArgumentException("name must not be null");
        else
            return nativeCreateDisplay(s, flag);
    }

    public static IBinder getBuiltInDisplay(int i)
    {
        return nativeGetBuiltInDisplay(i);
    }

    public static boolean getDisplayInfo(IBinder ibinder, PhysicalDisplayInfo physicaldisplayinfo)
    {
        if (ibinder == null)
            throw new IllegalArgumentException("displayToken must not be null");
        if (physicaldisplayinfo == null)
            throw new IllegalArgumentException("outInfo must not be null");
        else
            return nativeGetDisplayInfo(ibinder, physicaldisplayinfo);
    }

    private static native void nativeBlankDisplay(IBinder ibinder);

    private static native void nativeCloseTransaction();

    private native void nativeCopyFrom(Surface surface);

    private native void nativeCreate(SurfaceSession surfacesession, String s, int i, int j, int k, int l)
        throws OutOfResourcesException;

    private static native IBinder nativeCreateDisplay(String s, boolean flag);

    private native void nativeCreateFromSurfaceTexture(SurfaceTexture surfacetexture)
        throws OutOfResourcesException;

    private native void nativeDestroy();

    private static native IBinder nativeGetBuiltInDisplay(int i);

    private static native boolean nativeGetDisplayInfo(IBinder ibinder, PhysicalDisplayInfo physicaldisplayinfo);

    private native int nativeGetIdentity();

    private native boolean nativeIsConsumerRunningBehind();

    private native boolean nativeIsValid();

    private native Canvas nativeLockCanvas(Rect rect);

    private static native void nativeOpenTransaction();

    private native void nativeReadFromParcel(Parcel parcel);

    private native void nativeRelease();

    private static native Bitmap nativeScreenshot(IBinder ibinder, int i, int j, int k, int l, boolean flag);

    private native void nativeSetAlpha(float f);

    private static native void nativeSetAnimationTransaction();

    private static native void nativeSetDisplayLayerStack(IBinder ibinder, int i);

    private static native void nativeSetDisplayProjection(IBinder ibinder, int i, Rect rect, Rect rect1);

    private static native void nativeSetDisplaySurface(IBinder ibinder, Surface surface);

    private native void nativeSetFlags(int i, int j);

    private native void nativeSetFlagsEx(int i, int j);

    private native void nativeSetLayer(int i);

    private native void nativeSetLayerStack(int i);

    private native void nativeSetMatrix(float f, float f1, float f2, float f3);

    private native void nativeSetPosition(float f, float f1);

    private native void nativeSetSize(int i, int j);

    private native void nativeSetTransparentRegionHint(Region region);

    private native void nativeSetWindowCrop(Rect rect);

    private native void nativeTransferFrom(Surface surface);

    private static native void nativeUnblankDisplay(IBinder ibinder);

    private native void nativeUnlockCanvasAndPost(Canvas canvas);

    private native void nativeWriteToParcel(Parcel parcel);

    public static void openTransaction()
    {
        nativeOpenTransaction();
    }

    public static Bitmap screenshot(int i, int j)
    {
        return nativeScreenshot(getBuiltInDisplay(0), i, j, 0, 0, true);
    }

    public static Bitmap screenshot(int i, int j, int k, int l)
    {
        return nativeScreenshot(getBuiltInDisplay(0), i, j, k, l, false);
    }

    public static void setAnimationTransaction()
    {
        nativeSetAnimationTransaction();
    }

    public static void setDisplayLayerStack(IBinder ibinder, int i)
    {
        if (ibinder == null)
        {
            throw new IllegalArgumentException("displayToken must not be null");
        } else
        {
            nativeSetDisplayLayerStack(ibinder, i);
            return;
        }
    }

    public static void setDisplayProjection(IBinder ibinder, int i, Rect rect, Rect rect1)
    {
        if (ibinder == null)
            throw new IllegalArgumentException("displayToken must not be null");
        if (rect == null)
            throw new IllegalArgumentException("layerStackRect must not be null");
        if (rect1 == null)
        {
            throw new IllegalArgumentException("displayRect must not be null");
        } else
        {
            nativeSetDisplayProjection(ibinder, i, rect, rect1);
            return;
        }
    }

    public static void setDisplaySurface(IBinder ibinder, Surface surface)
    {
        if (ibinder == null)
        {
            throw new IllegalArgumentException("displayToken must not be null");
        } else
        {
            nativeSetDisplaySurface(ibinder, surface);
            return;
        }
    }

    public static void unblankDisplay(IBinder ibinder)
    {
        if (ibinder == null)
        {
            throw new IllegalArgumentException("displayToken must not be null");
        } else
        {
            nativeUnblankDisplay(ibinder);
            return;
        }
    }

    public void copyFrom(Surface surface)
    {
        if (surface == null)
            throw new IllegalArgumentException("other must not be null");
        if (surface != this)
            nativeCopyFrom(surface);
    }

    public int describeContents()
    {
        return 0;
    }

    public void destroy()
    {
        nativeDestroy();
        mCloseGuard.close();
    }

    protected void finalize()
        throws Throwable
    {
        if (mCloseGuard != null)
            mCloseGuard.warnIfOpen();
        nativeRelease();
        super.finalize();
        return;
        Exception exception;
        exception;
        super.finalize();
        throw exception;
    }

    public int getGenerationId()
    {
        return mGenerationId;
    }

    public int getHeight()
    {
        return mHeight;
    }

    public int getWidth()
    {
        return mWidth;
    }

    public void hide()
    {
        nativeSetFlags(1, 1);
    }

    public boolean isConsumerRunningBehind()
    {
        return nativeIsConsumerRunningBehind();
    }

    public boolean isValid()
    {
        return nativeIsValid();
    }

    public Canvas lockCanvas(Rect rect)
        throws OutOfResourcesException, IllegalArgumentException
    {
        return nativeLockCanvas(rect);
    }

    public void readFromParcel(Parcel parcel)
    {
        if (parcel == null)
        {
            throw new IllegalArgumentException("source must not be null");
        } else
        {
            mName = parcel.readString();
            nativeReadFromParcel(parcel);
            return;
        }
    }

    public void release()
    {
        nativeRelease();
        mCloseGuard.close();
    }

    public void setAlpha(float f)
    {
        nativeSetAlpha(f);
    }

    void setCompatibilityTranslator(android.content.res.CompatibilityInfo.Translator translator)
    {
        if (translator != null)
        {
            float f = translator.applicationScale;
            mCompatibleMatrix = new Matrix();
            mCompatibleMatrix.setScale(f, f);
        }
    }

    public void setFlags(int i, int j)
    {
        nativeSetFlags(i, j);
    }

    public void setFlagsEx(int i, int j)
    {
        nativeSetFlagsEx(i, j);
    }

    public void setLayer(int i)
    {
        nativeSetLayer(i);
    }

    public void setLayerStack(int i)
    {
        nativeSetLayerStack(i);
    }

    public void setMatrix(float f, float f1, float f2, float f3)
    {
        nativeSetMatrix(f, f1, f2, f3);
    }

    public void setPosition(float f, float f1)
    {
        nativeSetPosition(f, f1);
    }

    public void setPosition(int i, int j)
    {
        nativeSetPosition(i, j);
    }

    public void setSize(int i, int j)
    {
        mWidth = i;
        mHeight = j;
        nativeSetSize(i, j);
    }

    public void setTransparentRegionHint(Region region)
    {
        nativeSetTransparentRegionHint(region);
    }

    public void setWindowCrop(Rect rect)
    {
        nativeSetWindowCrop(rect);
    }

    public void show()
    {
        nativeSetFlags(0, 1);
    }

    public String toString()
    {
        return (new StringBuilder()).append("Surface(name=").append(mName).append(", identity=").append(nativeGetIdentity()).append(")").toString();
    }

    public void transferFrom(Surface surface)
    {
        if (surface == null)
            throw new IllegalArgumentException("other must not be null");
        if (surface != this)
            nativeTransferFrom(surface);
    }

    public void unlockCanvas(Canvas canvas)
    {
        throw new UnsupportedOperationException();
    }

    public void unlockCanvasAndPost(Canvas canvas)
    {
        nativeUnlockCanvasAndPost(canvas);
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        if (parcel == null)
            throw new IllegalArgumentException("dest must not be null");
        parcel.writeString(mName);
        nativeWriteToParcel(parcel);
        if ((i & 1) != 0)
            release();
    }



}
