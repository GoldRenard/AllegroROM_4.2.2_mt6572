// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.app;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.*;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.*;
import com.mediatek.xlog.Xlog;
import java.io.*;

// Referenced classes of package android.app:
//            IWallpaperManager, WallpaperInfo

public class WallpaperManager
{
    static class FastBitmapDrawable extends Drawable
    {

        private final Bitmap mBitmap;
        private int mDrawLeft;
        private int mDrawTop;
        private final int mHeight;
        private final Paint mPaint;
        private final int mWidth;

        public void draw(Canvas canvas)
        {
            canvas.drawBitmap(mBitmap, mDrawLeft, mDrawTop, mPaint);
        }

        public int getIntrinsicHeight()
        {
            return mHeight;
        }

        public int getIntrinsicWidth()
        {
            return mWidth;
        }

        public int getMinimumHeight()
        {
            return mHeight;
        }

        public int getMinimumWidth()
        {
            return mWidth;
        }

        public int getOpacity()
        {
            return -1;
        }

        public void setAlpha(int i)
        {
            throw new UnsupportedOperationException("Not supported with this drawable");
        }

        public void setBounds(int i, int j, int k, int l)
        {
            mDrawLeft = i + (k - i - mWidth) / 2;
            mDrawTop = j + (l - j - mHeight) / 2;
        }

        public void setColorFilter(ColorFilter colorfilter)
        {
            throw new UnsupportedOperationException("Not supported with this drawable");
        }

        public void setDither(boolean flag)
        {
            throw new UnsupportedOperationException("Not supported with this drawable");
        }

        public void setFilterBitmap(boolean flag)
        {
            throw new UnsupportedOperationException("Not supported with this drawable");
        }

        private FastBitmapDrawable(Bitmap bitmap)
        {
            mBitmap = bitmap;
            mWidth = bitmap.getWidth();
            mHeight = bitmap.getHeight();
            setBounds(0, 0, mWidth, mHeight);
            mPaint = new Paint();
            mPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC));
        }

    }

    static class Globals extends IWallpaperManagerCallback.Stub
    {

        private static final int MSG_CLEAR_WALLPAPER = 1;
        private Bitmap mDefaultWallpaper;
        private final Handler mHandler;
        private IWallpaperManager mService;
        private Bitmap mWallpaper;

        private Bitmap getCurrentWallpaperLocked(Context context)
        {
            Bundle bundle;
            ParcelFileDescriptor parcelfiledescriptor;
            bundle = new Bundle();
            parcelfiledescriptor = mService.getWallpaper(this, bundle);
            if (parcelfiledescriptor == null)
                break MISSING_BLOCK_LABEL_112;
            int i;
            int j;
            i = bundle.getInt("width", 0);
            j = bundle.getInt("height", 0);
            Bitmap bitmap;
            android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
            options.inPostProc = true;
            options.inPostProcFlag = 1;
            bitmap = WallpaperManager.generateBitmap(context, BitmapFactory.decodeFileDescriptor(parcelfiledescriptor.getFileDescriptor(), null, options), i, j);
            parcelfiledescriptor.close();
            return bitmap;
            OutOfMemoryError outofmemoryerror;
            outofmemoryerror;
            Log.w(WallpaperManager.TAG, "Can't decode file", outofmemoryerror);
            Exception exception;
            try
            {
                parcelfiledescriptor.close();
            }
            catch (IOException ioexception1) { }
            catch (RemoteException remoteexception) { }
            return null;
            exception;
            try
            {
                parcelfiledescriptor.close();
            }
            catch (IOException ioexception) { }
            throw exception;
            IOException ioexception2;
            ioexception2;
            return bitmap;
        }

        private Bitmap getDefaultWallpaperLocked(Context context)
        {
            InputStream inputstream = context.getResources().openRawResource(0x108021e);
            if (inputstream == null)
                break MISSING_BLOCK_LABEL_134;
            int i;
            int j;
            i = mService.getWidthHint();
            j = mService.getHeightHint();
            Bitmap bitmap1;
            android.graphics.BitmapFactory.Options options = new android.graphics.BitmapFactory.Options();
            options.inPostProc = true;
            options.inPostProcFlag = 1;
            Trace.traceBegin(2L, "BitmapFactory.decodeStream");
            Xlog.d(WallpaperManager.TAG, "decodeStream begin.");
            Bitmap bitmap = BitmapFactory.decodeStream(inputstream, null, options);
            Xlog.d(WallpaperManager.TAG, "decodeStream end.");
            Trace.traceEnd(2L);
            bitmap1 = WallpaperManager.generateBitmap(context, bitmap, i, j);
            inputstream.close();
            return bitmap1;
            OutOfMemoryError outofmemoryerror;
            outofmemoryerror;
            Log.w(WallpaperManager.TAG, "Can't decode stream", outofmemoryerror);
            Exception exception;
            try
            {
                inputstream.close();
            }
            catch (IOException ioexception1) { }
            catch (RemoteException remoteexception) { }
            return null;
            exception;
            try
            {
                inputstream.close();
            }
            catch (IOException ioexception) { }
            throw exception;
            IOException ioexception2;
            ioexception2;
            return bitmap1;
        }

        public void forgetLoadedWallpaper()
        {
            this;
            JVM INSTR monitorenter ;
            mWallpaper = null;
            mDefaultWallpaper = null;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

        public void onWallpaperChanged()
        {
            mHandler.sendEmptyMessage(1);
        }

        public Bitmap peekWallpaperBitmap(Context context, boolean flag)
        {
            this;
            JVM INSTR monitorenter ;
            Bitmap bitmap3;
            if (mWallpaper == null)
                break MISSING_BLOCK_LABEL_20;
            bitmap3 = mWallpaper;
            this;
            JVM INSTR monitorexit ;
            return bitmap3;
            Bitmap bitmap2;
            if (mDefaultWallpaper == null)
                break MISSING_BLOCK_LABEL_43;
            bitmap2 = mDefaultWallpaper;
            this;
            JVM INSTR monitorexit ;
            return bitmap2;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
            mWallpaper = null;
            mWallpaper = getCurrentWallpaperLocked(context);
_L1:
            if (!flag)
                break MISSING_BLOCK_LABEL_109;
            Bitmap bitmap1;
            if (mWallpaper != null)
                break MISSING_BLOCK_LABEL_104;
            mDefaultWallpaper = getDefaultWallpaperLocked(context);
            bitmap1 = mDefaultWallpaper;
            this;
            JVM INSTR monitorexit ;
            return bitmap1;
            OutOfMemoryError outofmemoryerror;
            outofmemoryerror;
            Log.w(WallpaperManager.TAG, "No memory load current wallpaper", outofmemoryerror);
              goto _L1
            mDefaultWallpaper = null;
            Bitmap bitmap = mWallpaper;
            this;
            JVM INSTR monitorexit ;
            return bitmap;
        }


/*
        static Bitmap access$002(Globals globals, Bitmap bitmap)
        {
            globals.mWallpaper = bitmap;
            return bitmap;
        }

*/


/*
        static Bitmap access$102(Globals globals, Bitmap bitmap)
        {
            globals.mDefaultWallpaper = bitmap;
            return bitmap;
        }

*/


        Globals(Looper looper)
        {
            mService = IWallpaperManager.Stub.asInterface(ServiceManager.getService("wallpaper"));
            mHandler = new _cls1(looper);
        }
    }


    public static final String ACTION_CHANGE_LIVE_WALLPAPER = "android.service.wallpaper.CHANGE_LIVE_WALLPAPER";
    public static final String ACTION_LIVE_WALLPAPER_CHOOSER = "android.service.wallpaper.LIVE_WALLPAPER_CHOOSER";
    public static final String COMMAND_DROP = "android.home.drop";
    public static final String COMMAND_SECONDARY_TAP = "android.wallpaper.secondaryTap";
    public static final String COMMAND_TAP = "android.wallpaper.tap";
    private static boolean DEBUG = false;
    public static final String EXTRA_LIVE_WALLPAPER_COMPONENT = "android.service.wallpaper.extra.LIVE_WALLPAPER_COMPONENT";
    private static String TAG = "WallpaperManager";
    public static final String WALLPAPER_PREVIEW_META_DATA = "android.wallpaper.preview";
    private static Globals sGlobals;
    private static final Object sSync = new Object[0];
    private final Context mContext;
    private float mWallpaperXStep;
    private float mWallpaperYStep;

    WallpaperManager(Context context, Handler handler)
    {
        mWallpaperXStep = -1F;
        mWallpaperYStep = -1F;
        mContext = context;
        initGlobals(context.getMainLooper());
    }

    static Bitmap generateBitmap(Context context, Bitmap bitmap, int i, int j)
    {
        if (bitmap != null) goto _L2; else goto _L1
_L1:
        bitmap = null;
_L4:
        return bitmap;
_L2:
        DisplayMetrics displaymetrics;
        WindowManager windowmanager = (WindowManager)context.getSystemService("window");
        displaymetrics = new DisplayMetrics();
        windowmanager.getDefaultDisplay().getMetrics(displaymetrics);
        int k = displaymetrics.noncompatDensityDpi;
        bitmap.setDensity(k);
        if (i <= 0 || j <= 0 || bitmap.getWidth() == i && bitmap.getHeight() == j) goto _L4; else goto _L3
_L3:
        Bitmap bitmap1;
        Canvas canvas;
        Rect rect;
        int l;
        int i1;
        float f;
        float f1;
        int j1;
        try
        {
            Trace.traceBegin(2L, "Bitmap.createBitmap");
            Xlog.d(TAG, (new StringBuilder()).append("createBitmap begin width = ").append(i).append(" , height = ").append(j).toString());
            bitmap1 = Bitmap.createBitmap(i, j, android.graphics.Bitmap.Config.ARGB_8888);
            Xlog.d(TAG, "createBitmap end");
            Trace.traceEnd(2L);
            bitmap1.setDensity(displaymetrics.noncompatDensityDpi);
            canvas = new Canvas(bitmap1);
            rect = new Rect();
            rect.right = bitmap.getWidth();
            rect.bottom = bitmap.getHeight();
            l = i - rect.right;
            i1 = j - rect.bottom;
        }
        catch (OutOfMemoryError outofmemoryerror)
        {
            Log.w(TAG, "Can't generate default bitmap", outofmemoryerror);
            return bitmap;
        }
        if (l <= 0 && i1 <= 0) goto _L6; else goto _L5
_L5:
        if (l <= i1) goto _L8; else goto _L7
_L7:
        f = (float)i / (float)rect.right;
_L9:
        rect.right = (int)(f * (float)rect.right);
        rect.bottom = (int)(f * (float)rect.bottom);
        l = i - rect.right;
        i1 = j - rect.bottom;
_L6:
        rect.offset(l / 2, i1 / 2);
        Paint paint = new Paint();
        paint.setFilterBitmap(true);
        paint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC));
        Trace.traceBegin(2L, "drawBitmap");
        Xlog.d(TAG, (new StringBuilder()).append("drawBitmap begin targetRect = ").append(rect).toString());
        canvas.drawBitmap(bitmap, null, rect, paint);
        Xlog.d(TAG, "drawBitmap end");
        Trace.traceEnd(2L);
        bitmap.recycle();
        canvas.setBitmap(null);
        return bitmap1;
_L8:
        f1 = j;
        j1 = rect.bottom;
        f = f1 / (float)j1;
          goto _L9
    }

    public static WallpaperManager getInstance(Context context)
    {
        return (WallpaperManager)context.getSystemService("wallpaper");
    }

    static void initGlobals(Looper looper)
    {
        synchronized (sSync)
        {
            if (sGlobals == null)
                sGlobals = new Globals(looper);
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void setWallpaper(InputStream inputstream, FileOutputStream fileoutputstream)
        throws IOException
    {
        byte abyte0[] = new byte[32768];
        do
        {
            int i = inputstream.read(abyte0);
            if (i > 0)
                fileoutputstream.write(abyte0, 0, i);
            else
                return;
        } while (true);
    }

    public void clear()
        throws IOException
    {
        setResource(0x108021e);
    }

    public void clearWallpaperOffsets(IBinder ibinder)
    {
        try
        {
            WindowManagerGlobal.getWindowSession(mContext.getMainLooper()).setWallpaperPosition(ibinder, -1F, -1F, -1F, -1F);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void forgetLoadedWallpaper()
    {
        sGlobals.forgetLoadedWallpaper();
    }

    public Bitmap getBitmap()
    {
        return sGlobals.peekWallpaperBitmap(mContext, true);
    }

    public int getDesiredMinimumHeight()
    {
        if (sGlobals.mService == null)
        {
            Log.w(TAG, "WallpaperService not running");
            return 0;
        }
        int i;
        try
        {
            i = sGlobals.mService.getHeightHint();
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public int getDesiredMinimumWidth()
    {
        if (sGlobals.mService == null)
        {
            Log.w(TAG, "WallpaperService not running");
            return 0;
        }
        int i;
        try
        {
            i = sGlobals.mService.getWidthHint();
        }
        catch (RemoteException remoteexception)
        {
            return 0;
        }
        return i;
    }

    public Drawable getDrawable()
    {
        Bitmap bitmap = sGlobals.peekWallpaperBitmap(mContext, true);
        if (bitmap != null)
        {
            BitmapDrawable bitmapdrawable = new BitmapDrawable(mContext.getResources(), bitmap);
            bitmapdrawable.setDither(false);
            return bitmapdrawable;
        } else
        {
            return null;
        }
    }

    public Drawable getFastDrawable()
    {
        Bitmap bitmap = sGlobals.peekWallpaperBitmap(mContext, true);
        if (bitmap != null)
            return new FastBitmapDrawable(bitmap);
        else
            return null;
    }

    public IWallpaperManager getIWallpaperManager()
    {
        return sGlobals.mService;
    }

    public WallpaperInfo getWallpaperInfo()
    {
        if (sGlobals.mService != null)
            break MISSING_BLOCK_LABEL_21;
        Log.w(TAG, "WallpaperService not running");
        return null;
        WallpaperInfo wallpaperinfo;
        try
        {
            wallpaperinfo = sGlobals.mService.getWallpaperInfo();
        }
        catch (RemoteException remoteexception)
        {
            return null;
        }
        return wallpaperinfo;
    }

    public boolean hasResourceWallpaper(int i)
    {
        if (sGlobals.mService == null)
        {
            Log.w(TAG, "WallpaperService not running");
            return false;
        }
        boolean flag;
        try
        {
            Resources resources = mContext.getResources();
            String s = (new StringBuilder()).append("res:").append(resources.getResourceName(i)).toString();
            flag = sGlobals.mService.hasNamedWallpaper(s);
        }
        catch (RemoteException remoteexception)
        {
            return false;
        }
        return flag;
    }

    public Drawable peekDrawable()
    {
        Bitmap bitmap = sGlobals.peekWallpaperBitmap(mContext, false);
        if (bitmap != null)
        {
            BitmapDrawable bitmapdrawable = new BitmapDrawable(mContext.getResources(), bitmap);
            bitmapdrawable.setDither(false);
            return bitmapdrawable;
        } else
        {
            return null;
        }
    }

    public Drawable peekFastDrawable()
    {
        Bitmap bitmap = sGlobals.peekWallpaperBitmap(mContext, false);
        if (bitmap != null)
            return new FastBitmapDrawable(bitmap);
        else
            return null;
    }

    public void sendWallpaperCommand(IBinder ibinder, String s, int i, int j, int k, Bundle bundle)
    {
        try
        {
            WindowManagerGlobal.getWindowSession(mContext.getMainLooper()).sendWallpaperCommand(ibinder, s, i, j, k, bundle, false);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void setBitmap(Bitmap bitmap)
        throws IOException
    {
        if (sGlobals.mService != null) goto _L2; else goto _L1
_L1:
        Log.w(TAG, "WallpaperService not running");
_L4:
        return;
_L2:
        ParcelFileDescriptor parcelfiledescriptor;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream;
        Exception exception;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream1;
        try
        {
            parcelfiledescriptor = sGlobals.mService.setWallpaper(null);
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (parcelfiledescriptor == null) goto _L4; else goto _L3
_L3:
        autocloseoutputstream = new android.os.ParcelFileDescriptor.AutoCloseOutputStream(parcelfiledescriptor);
        bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 90, autocloseoutputstream);
        if (autocloseoutputstream == null) goto _L4; else goto _L5
_L5:
        autocloseoutputstream.close();
        return;
_L7:
        if (autocloseoutputstream1 == null)
            break MISSING_BLOCK_LABEL_80;
        autocloseoutputstream1.close();
        throw exception;
        exception;
        autocloseoutputstream1 = autocloseoutputstream;
        continue; /* Loop/switch isn't completed */
        exception;
        autocloseoutputstream1 = null;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void setResource(int i)
        throws IOException
    {
        if (sGlobals.mService != null) goto _L2; else goto _L1
_L1:
        Log.w(TAG, "WallpaperService not running");
_L4:
        return;
_L2:
        Resources resources;
        ParcelFileDescriptor parcelfiledescriptor;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream;
        Exception exception;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream1;
        try
        {
            resources = mContext.getResources();
            parcelfiledescriptor = sGlobals.mService.setWallpaper((new StringBuilder()).append("res:").append(resources.getResourceName(i)).toString());
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (parcelfiledescriptor == null) goto _L4; else goto _L3
_L3:
        autocloseoutputstream = new android.os.ParcelFileDescriptor.AutoCloseOutputStream(parcelfiledescriptor);
        setWallpaper(resources.openRawResource(i), autocloseoutputstream);
        if (autocloseoutputstream == null) goto _L4; else goto _L5
_L5:
        autocloseoutputstream.close();
        return;
_L7:
        if (autocloseoutputstream1 == null)
            break MISSING_BLOCK_LABEL_113;
        autocloseoutputstream1.close();
        throw exception;
        exception;
        autocloseoutputstream1 = autocloseoutputstream;
        continue; /* Loop/switch isn't completed */
        exception;
        autocloseoutputstream1 = null;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void setStream(InputStream inputstream)
        throws IOException
    {
        if (sGlobals.mService != null) goto _L2; else goto _L1
_L1:
        Log.w(TAG, "WallpaperService not running");
_L4:
        return;
_L2:
        ParcelFileDescriptor parcelfiledescriptor;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream;
        Exception exception;
        android.os.ParcelFileDescriptor.AutoCloseOutputStream autocloseoutputstream1;
        try
        {
            parcelfiledescriptor = sGlobals.mService.setWallpaper(null);
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        if (parcelfiledescriptor == null) goto _L4; else goto _L3
_L3:
        autocloseoutputstream = new android.os.ParcelFileDescriptor.AutoCloseOutputStream(parcelfiledescriptor);
        setWallpaper(inputstream, autocloseoutputstream);
        if (autocloseoutputstream == null) goto _L4; else goto _L5
_L5:
        autocloseoutputstream.close();
        return;
_L7:
        if (autocloseoutputstream1 == null)
            break MISSING_BLOCK_LABEL_75;
        autocloseoutputstream1.close();
        throw exception;
        exception;
        autocloseoutputstream1 = autocloseoutputstream;
        continue; /* Loop/switch isn't completed */
        exception;
        autocloseoutputstream1 = null;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public void setWallpaperOffsetSteps(float f, float f1)
    {
        mWallpaperXStep = f;
        mWallpaperYStep = f1;
    }

    public void setWallpaperOffsets(IBinder ibinder, float f, float f1)
    {
        try
        {
            WindowManagerGlobal.getWindowSession(mContext.getMainLooper()).setWallpaperPosition(ibinder, f, f1, mWallpaperXStep, mWallpaperYStep);
            return;
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
    }

    public void suggestDesiredDimensions(int i, int j)
    {
        try
        {
            if (sGlobals.mService == null)
            {
                Log.w(TAG, "WallpaperService not running");
                return;
            }
        }
        catch (RemoteException remoteexception)
        {
            return;
        }
        sGlobals.mService.setDimensionHints(i, j);
        return;
    }

    static 
    {
        DEBUG = false;
    }


    // Unreferenced inner class android/app/WallpaperManager$Globals$1

/* anonymous class */
    class Globals._cls1 extends Handler
    {

        final Globals this$0;

        public void handleMessage(Message message)
        {
            message.what;
            JVM INSTR tableswitch 1 1: default 24
        //                       1 25;
               goto _L1 _L2
_L1:
            return;
_L2:
            this;
            JVM INSTR monitorenter ;
            mWallpaper = null;
            mDefaultWallpaper = null;
            this;
            JVM INSTR monitorexit ;
            return;
            Exception exception;
            exception;
            this;
            JVM INSTR monitorexit ;
            throw exception;
        }

            
            {
                this$0 = Globals.this;
                super(looper);
            }
    }

}
