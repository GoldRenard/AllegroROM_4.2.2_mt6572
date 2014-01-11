// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.view;

import android.content.Context;
import android.content.res.*;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.android.internal.util.XmlUtils;

public final class PointerIcon
    implements Parcelable
{

    public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

        public PointerIcon createFromParcel(Parcel parcel)
        {
            int i = parcel.readInt();
            if (i == 0)
                return PointerIcon.getNullIcon();
            int j = parcel.readInt();
            if (j != 0)
            {
                PointerIcon pointericon = new PointerIcon(i);
                pointericon.mSystemIconResourceId = j;
                return pointericon;
            } else
            {
                return PointerIcon.createCustomIcon((Bitmap)Bitmap.CREATOR.createFromParcel(parcel), parcel.readFloat(), parcel.readFloat());
            }
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public PointerIcon[] newArray(int i)
        {
            return new PointerIcon[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    }
;
    public static final int STYLE_ARROW = 1000;
    public static final int STYLE_CUSTOM = -1;
    private static final int STYLE_DEFAULT = 1000;
    public static final int STYLE_NULL = 0;
    private static final int STYLE_OEM_FIRST = 10000;
    public static final int STYLE_SPOT_ANCHOR = 2002;
    public static final int STYLE_SPOT_HOVER = 2000;
    public static final int STYLE_SPOT_TOUCH = 2001;
    private static final String TAG = "PointerIcon";
    private static final PointerIcon gNullIcon = new PointerIcon(0);
    private Bitmap mBitmap;
    private float mHotSpotX;
    private float mHotSpotY;
    private final int mStyle;
    private int mSystemIconResourceId;

    private PointerIcon(int i)
    {
        mStyle = i;
    }


    public static PointerIcon createCustomIcon(Bitmap bitmap, float f, float f1)
    {
        if (bitmap == null)
        {
            throw new IllegalArgumentException("bitmap must not be null");
        } else
        {
            validateHotSpot(bitmap, f, f1);
            PointerIcon pointericon = new PointerIcon(-1);
            pointericon.mBitmap = bitmap;
            pointericon.mHotSpotX = f;
            pointericon.mHotSpotY = f1;
            return pointericon;
        }
    }

    public static PointerIcon getDefaultIcon(Context context)
    {
        return getSystemIcon(context, 1000);
    }

    public static PointerIcon getNullIcon()
    {
        return gNullIcon;
    }

    public static PointerIcon getSystemIcon(Context context, int i)
    {
        if (context == null)
            throw new IllegalArgumentException("context must not be null");
        if (i == 0)
            return gNullIcon;
        int j = getSystemIconStyleIndex(i);
        if (j == 0)
            j = getSystemIconStyleIndex(1000);
        TypedArray typedarray = context.obtainStyledAttributes(null, com.android.internal.R.styleable.Pointer, 0x10103f7, 0);
        int k = typedarray.getResourceId(j, -1);
        typedarray.recycle();
        if (k == -1)
        {
            Log.w("PointerIcon", (new StringBuilder()).append("Missing theme resources for pointer icon style ").append(i).toString());
            if (i == 1000)
                return gNullIcon;
            else
                return getSystemIcon(context, 1000);
        }
        PointerIcon pointericon = new PointerIcon(i);
        if ((0xff000000 & k) == 0x1000000)
            pointericon.mSystemIconResourceId = k;
        else
            pointericon.loadResource(context.getResources(), k);
        return pointericon;
    }

    private static int getSystemIconStyleIndex(int i)
    {
        switch (i)
        {
        case 2002: 
            return 3;

        case 2001: 
            return 2;

        case 2000: 
            return 1;

        case 1000: 
        default:
            return 0;
        }
    }

    public static PointerIcon loadCustomIcon(Resources resources, int i)
    {
        if (resources == null)
        {
            throw new IllegalArgumentException("resources must not be null");
        } else
        {
            PointerIcon pointericon = new PointerIcon(-1);
            pointericon.loadResource(resources, i);
            return pointericon;
        }
    }

    private void loadResource(Resources resources, int i)
    {
        XmlResourceParser xmlresourceparser = resources.getXml(i);
        int j;
        float f;
        float f1;
        XmlUtils.beginDocument(xmlresourceparser, "pointer-icon");
        TypedArray typedarray = resources.obtainAttributes(xmlresourceparser, com.android.internal.R.styleable.PointerIcon);
        j = typedarray.getResourceId(0, 0);
        f = typedarray.getFloat(1, 0.0F);
        f1 = typedarray.getFloat(2, 0.0F);
        typedarray.recycle();
        xmlresourceparser.close();
        if (j == 0)
            throw new IllegalArgumentException("<pointer-icon> is missing bitmap attribute.");
        break MISSING_BLOCK_LABEL_100;
        Exception exception1;
        exception1;
        throw new IllegalArgumentException("Exception parsing pointer icon resource.", exception1);
        Exception exception;
        exception;
        xmlresourceparser.close();
        throw exception;
        android.graphics.drawable.Drawable drawable = resources.getDrawable(j);
        if (!(drawable instanceof BitmapDrawable))
        {
            throw new IllegalArgumentException("<pointer-icon> bitmap attribute must refer to a bitmap drawable.");
        } else
        {
            mBitmap = ((BitmapDrawable)drawable).getBitmap();
            mHotSpotX = f;
            mHotSpotY = f1;
            return;
        }
    }

    private void throwIfIconIsNotLoaded()
    {
        if (!isLoaded())
            throw new IllegalStateException("The icon is not loaded.");
        else
            return;
    }

    private static void validateHotSpot(Bitmap bitmap, float f, float f1)
    {
        if (f >= 0.0F && f < (float)bitmap.getWidth())
        {
            if (f1 >= 0.0F && f1 < (float)bitmap.getHeight())
                return;
            else
                throw new IllegalArgumentException("y hotspot lies outside of the bitmap area");
        } else
        {
            throw new IllegalArgumentException("x hotspot lies outside of the bitmap area");
        }
    }

    public int describeContents()
    {
        return 0;
    }

    public boolean equals(Object obj)
    {
label0:
        {
label1:
            {
                if (this != obj)
                {
                    if (obj == null || !(obj instanceof PointerIcon))
                        break label0;
                    PointerIcon pointericon = (PointerIcon)obj;
                    if (mStyle != pointericon.mStyle || mSystemIconResourceId != pointericon.mSystemIconResourceId)
                        break label1;
                    if (mSystemIconResourceId == 0 && (mBitmap != pointericon.mBitmap || mHotSpotX != pointericon.mHotSpotX || mHotSpotY != pointericon.mHotSpotY))
                        return false;
                }
                return true;
            }
            return false;
        }
        return false;
    }

    public Bitmap getBitmap()
    {
        throwIfIconIsNotLoaded();
        return mBitmap;
    }

    public float getHotSpotX()
    {
        throwIfIconIsNotLoaded();
        return mHotSpotX;
    }

    public float getHotSpotY()
    {
        throwIfIconIsNotLoaded();
        return mHotSpotY;
    }

    public int getStyle()
    {
        return mStyle;
    }

    public boolean isLoaded()
    {
        return mBitmap != null || mStyle == 0;
    }

    public boolean isNullIcon()
    {
        return mStyle == 0;
    }

    public PointerIcon load(Context context)
    {
        if (context == null)
            throw new IllegalArgumentException("context must not be null");
        if (mSystemIconResourceId != 0 && mBitmap == null)
        {
            PointerIcon pointericon = new PointerIcon(mStyle);
            pointericon.mSystemIconResourceId = mSystemIconResourceId;
            pointericon.loadResource(context.getResources(), mSystemIconResourceId);
            return pointericon;
        } else
        {
            return this;
        }
    }

    public void writeToParcel(Parcel parcel, int i)
    {
        parcel.writeInt(mStyle);
        if (mStyle != 0)
        {
            parcel.writeInt(mSystemIconResourceId);
            if (mSystemIconResourceId == 0)
            {
                mBitmap.writeToParcel(parcel, i);
                parcel.writeFloat(mHotSpotX);
                parcel.writeFloat(mHotSpotY);
            }
        }
    }



/*
    static int access$102(PointerIcon pointericon, int i)
    {
        pointericon.mSystemIconResourceId = i;
        return i;
    }

*/
}
