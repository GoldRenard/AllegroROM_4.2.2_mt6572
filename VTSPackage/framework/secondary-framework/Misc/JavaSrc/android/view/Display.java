// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.display.DisplayManagerGlobal;
import android.os.SystemClock;
import android.util.DisplayMetrics;

// Referenced classes of package android.view:
//            DisplayInfo, CompatibilityInfoHolder

public final class Display
{

    private static final int CACHED_APP_SIZE_DURATION_MILLIS = 20;
    private static final boolean DEBUG = false;
    public static final int DEFAULT_DISPLAY = 0;
    public static final int FLAG_SECURE = 2;
    public static final int FLAG_SUPPORTS_PROTECTED_BUFFERS = 1;
    private static final String TAG = "Display";
    public static final int TYPE_BUILT_IN = 1;
    public static final int TYPE_HDMI = 2;
    public static final int TYPE_OVERLAY = 4;
    public static final int TYPE_UNKNOWN = 0;
    public static final int TYPE_WIFI = 3;
    private final String mAddress;
    private int mCachedAppHeightCompat;
    private int mCachedAppWidthCompat;
    private final CompatibilityInfoHolder mCompatibilityInfo;
    private final int mDisplayId;
    private DisplayInfo mDisplayInfo;
    private final int mFlags;
    private final DisplayManagerGlobal mGlobal;
    private boolean mIsValid;
    private long mLastCachedAppSizeUpdate;
    private final int mLayerStack;
    private final DisplayMetrics mTempMetrics = new DisplayMetrics();
    private final int mType;

    public Display(DisplayManagerGlobal displaymanagerglobal, int i, DisplayInfo displayinfo, CompatibilityInfoHolder compatibilityinfoholder)
    {
        mGlobal = displaymanagerglobal;
        mDisplayId = i;
        mDisplayInfo = displayinfo;
        mCompatibilityInfo = compatibilityinfoholder;
        mIsValid = true;
        mLayerStack = displayinfo.layerStack;
        mFlags = displayinfo.flags;
        mType = displayinfo.type;
        mAddress = displayinfo.address;
    }

    public static String typeToString(int i)
    {
        switch (i)
        {
        case 4: // '\004'
            return "OVERLAY";

        case 3: // '\003'
            return "WIFI";

        case 2: // '\002'
            return "HDMI";

        case 1: // '\001'
            return "BUILT_IN";

        case 0: // '\0'
            return "UNKNOWN";
        }
        return Integer.toString(i);
    }

    private void updateCachedAppSizeIfNeededLocked()
    {
        long l = SystemClock.uptimeMillis();
        if (l > 20L + mLastCachedAppSizeUpdate)
        {
            updateDisplayInfoLocked();
            mDisplayInfo.getAppMetrics(mTempMetrics, mCompatibilityInfo);
            mCachedAppWidthCompat = mTempMetrics.widthPixels;
            mCachedAppHeightCompat = mTempMetrics.heightPixels;
            mLastCachedAppSizeUpdate = l;
        }
    }

    private void updateDisplayInfoLocked()
    {
        DisplayInfo displayinfo = mGlobal.getDisplayInfo(mDisplayId);
        if (displayinfo == null)
        {
            if (mIsValid)
                mIsValid = false;
        } else
        {
            mDisplayInfo = displayinfo;
            if (!mIsValid)
            {
                mIsValid = true;
                return;
            }
        }
    }

    public String getAddress()
    {
        return mAddress;
    }

    public CompatibilityInfoHolder getCompatibilityInfo()
    {
        return mCompatibilityInfo;
    }

    public void getCurrentSizeRange(Point point, Point point1)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        point.x = mDisplayInfo.smallestNominalAppWidth;
        point.y = mDisplayInfo.smallestNominalAppHeight;
        point1.x = mDisplayInfo.largestNominalAppWidth;
        point1.y = mDisplayInfo.largestNominalAppHeight;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getDisplayId()
    {
        return mDisplayId;
    }

    public boolean getDisplayInfo(DisplayInfo displayinfo)
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        updateDisplayInfoLocked();
        displayinfo.copyFrom(mDisplayInfo);
        flag = mIsValid;
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getFlags()
    {
        return mFlags;
    }

    public int getHeight()
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        updateCachedAppSizeIfNeededLocked();
        i = mCachedAppHeightCompat;
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getLayerStack()
    {
        return mLayerStack;
    }

    public int getMaximumSizeDimension()
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        updateDisplayInfoLocked();
        i = Math.max(mDisplayInfo.logicalWidth, mDisplayInfo.logicalHeight);
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void getMetrics(DisplayMetrics displaymetrics)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        mDisplayInfo.getAppMetrics(displaymetrics, mCompatibilityInfo);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String getName()
    {
        this;
        JVM INSTR monitorenter ;
        String s;
        updateDisplayInfoLocked();
        s = mDisplayInfo.name;
        this;
        JVM INSTR monitorexit ;
        return s;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getOrientation()
    {
        return getRotation();
    }

    public int getPixelFormat()
    {
        return 1;
    }

    public void getRealMetrics(DisplayMetrics displaymetrics)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        mDisplayInfo.getLogicalMetrics(displaymetrics, null);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void getRealSize(Point point)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        point.x = mDisplayInfo.logicalWidth;
        point.y = mDisplayInfo.logicalHeight;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void getRectSize(Rect rect)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        mDisplayInfo.getAppMetrics(mTempMetrics, mCompatibilityInfo);
        rect.set(0, 0, mTempMetrics.widthPixels, mTempMetrics.heightPixels);
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public float getRefreshRate()
    {
        this;
        JVM INSTR monitorenter ;
        float f;
        updateDisplayInfoLocked();
        f = mDisplayInfo.refreshRate;
        this;
        JVM INSTR monitorexit ;
        return f;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getRotation()
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        updateDisplayInfoLocked();
        i = mDisplayInfo.rotation;
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public void getSize(Point point)
    {
        this;
        JVM INSTR monitorenter ;
        updateDisplayInfoLocked();
        mDisplayInfo.getAppMetrics(mTempMetrics, mCompatibilityInfo);
        point.x = mTempMetrics.widthPixels;
        point.y = mTempMetrics.heightPixels;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public int getType()
    {
        return mType;
    }

    public int getWidth()
    {
        this;
        JVM INSTR monitorenter ;
        int i;
        updateCachedAppSizeIfNeededLocked();
        i = mCachedAppWidthCompat;
        this;
        JVM INSTR monitorexit ;
        return i;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public boolean isValid()
    {
        this;
        JVM INSTR monitorenter ;
        boolean flag;
        updateDisplayInfoLocked();
        flag = mIsValid;
        this;
        JVM INSTR monitorexit ;
        return flag;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String toString()
    {
        this;
        JVM INSTR monitorenter ;
        String s;
        updateDisplayInfoLocked();
        mDisplayInfo.getAppMetrics(mTempMetrics, mCompatibilityInfo);
        s = (new StringBuilder()).append("Display id ").append(mDisplayId).append(": ").append(mDisplayInfo).append(", ").append(mTempMetrics).append(", isValid=").append(mIsValid).toString();
        this;
        JVM INSTR monitorexit ;
        return s;
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }
}
