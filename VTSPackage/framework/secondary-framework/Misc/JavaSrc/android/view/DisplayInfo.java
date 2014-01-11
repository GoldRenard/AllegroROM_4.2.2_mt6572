// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.res.CompatibilityInfo;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.DisplayMetrics;
import libcore.util.Objects;

// Referenced classes of package android.view:
//            CompatibilityInfoHolder, Display

public final class DisplayInfo
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public DisplayInfo createFromParcel(Parcel parcel)
        {
            return new DisplayInfo(parcel);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public DisplayInfo[] newArray(int i)
        {
            return new DisplayInfo[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    public String address;
    public int appHeight;
    public int appWidth;
    public int flags;
    public int largestNominalAppHeight;
    public int largestNominalAppWidth;
    public int layerStack;
    public int logicalDensityDpi;
    public int logicalHeight;
    public int logicalWidth;
    public String name;
    public float physicalXDpi;
    public float physicalYDpi;
    public float refreshRate;
    public int rotation;
    public int smallestNominalAppHeight;
    public int smallestNominalAppWidth;
    public int type;


    private DisplayInfo(Parcel parcel)
    {
        readFromParcel(parcel);
    }


    public DisplayInfo(DisplayInfo displayinfo)
    {
        copyFrom(displayinfo);
    }

    private static String flagsToString(int i)
    {
        StringBuilder stringbuilder = new StringBuilder();
        if ((i & 2) != 0)
            stringbuilder.append(", FLAG_SECURE");
        if ((i & 1) != 0)
            stringbuilder.append(", FLAG_SUPPORTS_PROTECTED_BUFFERS");
        return stringbuilder.toString();
    }

    private void getMetricsWithSize(DisplayMetrics displaymetrics, CompatibilityInfoHolder compatibilityinfoholder, int i, int j)
    {
        int k = logicalDensityDpi;
        displaymetrics.noncompatDensityDpi = k;
        displaymetrics.densityDpi = k;
        displaymetrics.widthPixels = i;
        displaymetrics.noncompatWidthPixels = i;
        displaymetrics.heightPixels = j;
        displaymetrics.noncompatHeightPixels = j;
        float f = 0.00625F * (float)logicalDensityDpi;
        displaymetrics.noncompatDensity = f;
        displaymetrics.density = f;
        float f1 = displaymetrics.density;
        displaymetrics.noncompatScaledDensity = f1;
        displaymetrics.scaledDensity = f1;
        float f2 = physicalXDpi;
        displaymetrics.noncompatXdpi = f2;
        displaymetrics.xdpi = f2;
        float f3 = physicalYDpi;
        displaymetrics.noncompatYdpi = f3;
        displaymetrics.ydpi = f3;
        if (compatibilityinfoholder != null)
        {
            CompatibilityInfo compatibilityinfo = compatibilityinfoholder.getIfNeeded();
            if (compatibilityinfo != null)
                compatibilityinfo.applyToDisplayMetrics(displaymetrics);
        }
    }

    public void copyFrom(DisplayInfo displayinfo)
    {
        layerStack = displayinfo.layerStack;
        flags = displayinfo.flags;
        type = displayinfo.type;
        address = displayinfo.address;
        name = displayinfo.name;
        appWidth = displayinfo.appWidth;
        appHeight = displayinfo.appHeight;
        smallestNominalAppWidth = displayinfo.smallestNominalAppWidth;
        smallestNominalAppHeight = displayinfo.smallestNominalAppHeight;
        largestNominalAppWidth = displayinfo.largestNominalAppWidth;
        largestNominalAppHeight = displayinfo.largestNominalAppHeight;
        logicalWidth = displayinfo.logicalWidth;
        logicalHeight = displayinfo.logicalHeight;
        rotation = displayinfo.rotation;
        refreshRate = displayinfo.refreshRate;
        logicalDensityDpi = displayinfo.logicalDensityDpi;
        physicalXDpi = displayinfo.physicalXDpi;
        physicalYDpi = displayinfo.physicalYDpi;
    }

    public int describeContents()
    {
        return 0;
    }

    public boolean equals(DisplayInfo displayinfo)
    {
        return displayinfo != null && layerStack == displayinfo.layerStack && flags == displayinfo.flags && type == displayinfo.type && Objects.equal(address, displayinfo.address) && Objects.equal(name, displayinfo.name) && appWidth == displayinfo.appWidth && appHeight == displayinfo.appHeight && smallestNominalAppWidth == displayinfo.smallestNominalAppWidth && smallestNominalAppHeight == displayinfo.smallestNominalAppHeight && largestNominalAppWidth == displayinfo.largestNominalAppWidth && largestNominalAppHeight == displayinfo.largestNominalAppHeight && logicalWidth == displayinfo.logicalWidth && logicalHeight == displayinfo.logicalHeight && rotation == displayinfo.rotation && refreshRate == displayinfo.refreshRate && logicalDensityDpi == displayinfo.logicalDensityDpi && physicalXDpi == displayinfo.physicalXDpi && physicalYDpi == displayinfo.physicalYDpi;
    }

    public boolean equals(Object obj)
    {
        return (obj instanceof DisplayInfo) && equals((DisplayInfo)obj);
    }

    public void getAppMetrics(DisplayMetrics displaymetrics, CompatibilityInfoHolder compatibilityinfoholder)
    {
        getMetricsWithSize(displaymetrics, compatibilityinfoholder, appWidth, appHeight);
    }

    public void getLogicalMetrics(DisplayMetrics displaymetrics, CompatibilityInfoHolder compatibilityinfoholder)
    {
        getMetricsWithSize(displaymetrics, compatibilityinfoholder, logicalWidth, logicalHeight);
    }

    public int getNaturalHeight()
    {
        if (rotation != 0 && rotation != 2)
            return logicalWidth;
        else
            return logicalHeight;
    }

    public int getNaturalWidth()
    {
        if (rotation != 0 && rotation != 2)
            return logicalHeight;
        else
            return logicalWidth;
    }

    public int hashCode()
    {
        return 0;
    }

    public void readFromParcel(Parcel parcel)
    {
        layerStack = parcel.readInt();
        flags = parcel.readInt();
        type = parcel.readInt();
        address = parcel.readString();
        name = parcel.readString();
        appWidth = parcel.readInt();
        appHeight = parcel.readInt();
        smallestNominalAppWidth = parcel.readInt();
        smallestNominalAppHeight = parcel.readInt();
        largestNominalAppWidth = parcel.readInt();
        largestNominalAppHeight = parcel.readInt();
        logicalWidth = parcel.readInt();
        logicalHeight = parcel.readInt();
        rotation = parcel.readInt();
        refreshRate = parcel.readFloat();
        logicalDensityDpi = parcel.readInt();
        physicalXDpi = parcel.readFloat();
        physicalYDpi = parcel.readFloat();
    }

    public String toString()
    {
        return (new StringBuilder()).append("DisplayInfo{\"").append(name).append("\", app ").append(appWidth).append(" x ").append(appHeight).append(", real ").append(logicalWidth).append(" x ").append(logicalHeight).append(", largest app ").append(largestNominalAppWidth).append(" x ").append(largestNominalAppHeight).append(", smallest app ").append(smallestNominalAppWidth).append(" x ").append(smallestNominalAppHeight).append(", ").append(refreshRate).append(" fps").append(", rotation ").append(rotation).append(", density ").append(logicalDensityDpi).append(", ").append(physicalXDpi).append(" x ").append(physicalYDpi).append(" dpi").append(", layerStack ").append(layerStack).append(", type ").append(Display.typeToString(type)).append(", address ").append(address).append(flagsToString(flags)).append("}").toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeInt(layerStack);
        parcel.writeInt(flags);
        parcel.writeInt(type);
        parcel.writeString(address);
        parcel.writeString(name);
        parcel.writeInt(appWidth);
        parcel.writeInt(appHeight);
        parcel.writeInt(smallestNominalAppWidth);
        parcel.writeInt(smallestNominalAppHeight);
        parcel.writeInt(largestNominalAppWidth);
        parcel.writeInt(largestNominalAppHeight);
        parcel.writeInt(logicalWidth);
        parcel.writeInt(logicalHeight);
        parcel.writeInt(rotation);
        parcel.writeFloat(refreshRate);
        parcel.writeInt(logicalDensityDpi);
        parcel.writeFloat(physicalXDpi);
        parcel.writeFloat(physicalYDpi);
    }

}
