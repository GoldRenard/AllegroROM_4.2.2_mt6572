// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.graphics.Rect;
import android.os.*;

public class WindowInfo
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public WindowInfo createFromParcel(Parcel parcel)
        {
            WindowInfo windowinfo = WindowInfo.obtain();
            windowinfo.initFromParcel(parcel);
            return windowinfo;
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public WindowInfo[] newArray(int i)
        {
            return new WindowInfo[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    private static final int MAX_POOL_SIZE = 20;
    private static int UNDEFINED = -1;
    private static WindowInfo sPool;
    private static Object sPoolLock = new Object();
    private static int sPoolSize;
    public float compatibilityScale;
    public int displayId;
    public final Rect frame = new Rect();
    public int layer;
    private boolean mInPool;
    private WindowInfo mNext;
    public IBinder token;
    public final Rect touchableRegion = new Rect();
    public int type;
    public boolean visible;

    private WindowInfo()
    {
        type = UNDEFINED;
        compatibilityScale = UNDEFINED;
        displayId = UNDEFINED;
        layer = UNDEFINED;
    }

    private void clear()
    {
        token = null;
        frame.setEmpty();
        touchableRegion.setEmpty();
        type = UNDEFINED;
        compatibilityScale = UNDEFINED;
        visible = false;
        displayId = UNDEFINED;
        layer = UNDEFINED;
    }

    private void initFromParcel(Parcel parcel)
    {
        token = parcel.readStrongBinder();
        frame.set((Rect)parcel.readParcelable(null));
        touchableRegion.set((Rect)parcel.readParcelable(null));
        type = parcel.readInt();
        compatibilityScale = parcel.readFloat();
        boolean flag;
        if (parcel.readInt() == 1)
            flag = true;
        else
            flag = false;
        visible = flag;
        displayId = parcel.readInt();
        layer = parcel.readInt();
    }

    public static WindowInfo obtain()
    {
label0:
        {
            WindowInfo windowinfo1;
            synchronized (sPoolLock)
            {
                if (sPoolSize <= 0)
                    break label0;
                windowinfo1 = sPool;
                sPool = windowinfo1.mNext;
                windowinfo1.mNext = null;
                windowinfo1.mInPool = false;
                sPoolSize = -1 + sPoolSize;
            }
            return windowinfo1;
        }
        WindowInfo windowinfo = new WindowInfo();
        obj;
        JVM INSTR monitorexit ;
        return windowinfo;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public static WindowInfo obtain(WindowInfo windowinfo)
    {
        WindowInfo windowinfo1 = obtain();
        windowinfo1.token = windowinfo.token;
        windowinfo1.frame.set(windowinfo.frame);
        windowinfo1.touchableRegion.set(windowinfo.touchableRegion);
        windowinfo1.type = windowinfo.type;
        windowinfo1.compatibilityScale = windowinfo.compatibilityScale;
        windowinfo1.visible = windowinfo.visible;
        windowinfo1.displayId = windowinfo.displayId;
        windowinfo1.layer = windowinfo.layer;
        return windowinfo1;
    }

    public int describeContents()
    {
        return 0;
    }

    public void recycle()
    {
        if (mInPool)
            throw new IllegalStateException("Already recycled.");
        clear();
        synchronized (sPoolLock)
        {
            if (sPoolSize < 20)
            {
                mNext = sPool;
                sPool = this;
                mInPool = true;
                sPoolSize = 1 + sPoolSize;
            }
        }
        return;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public String toString()
    {
        StringBuilder stringbuilder = new StringBuilder();
        StringBuilder stringbuilder1 = stringbuilder.append("Window [token:");
        Integer integer;
        if (token != null)
            integer = Integer.valueOf(token.hashCode());
        else
            integer = null;
        stringbuilder1.append(integer);
        stringbuilder.append(", displayId:").append(displayId);
        stringbuilder.append(", type:").append(type);
        stringbuilder.append(", visible:").append(visible);
        stringbuilder.append(", layer:").append(layer);
        stringbuilder.append(", compatibilityScale:").append(compatibilityScale);
        stringbuilder.append(", frame:").append(frame);
        stringbuilder.append(", touchableRegion:").append(touchableRegion);
        stringbuilder.append("]");
        return stringbuilder.toString();
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeStrongBinder(token);
        parcel.writeParcelable(frame, 0);
        parcel.writeParcelable(touchableRegion, 0);
        parcel.writeInt(type);
        parcel.writeFloat(compatibilityScale);
        boolean flag = visible;
        int j = 0;
        if (flag)
            j = 1;
        parcel.writeInt(j);
        parcel.writeInt(displayId);
        parcel.writeInt(layer);
        recycle();
    }


}
