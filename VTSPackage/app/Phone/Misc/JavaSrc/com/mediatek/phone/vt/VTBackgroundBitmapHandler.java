// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.phone.vt;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.mediatek.settings.VTAdvancedSetting;
import com.mediatek.settings.VTSettingUtils;

// Referenced classes of package com.mediatek.phone.vt:
//            VTInCallScreenFlags

public class VTBackgroundBitmapHandler
{

    private Bitmap mBitmap;


    public void forceUpdateBitmapBySetting()
    {
        recycle();
        if (VTSettingUtils.getInstance().mPicToReplacePeer.equals("0"))
            mBitmap = BitmapFactory.decodeFile(VTAdvancedSetting.getPicPathDefault2());
        else
        if (VTSettingUtils.getInstance().mPicToReplacePeer.equals("1"))
        {
            mBitmap = BitmapFactory.decodeFile(VTAdvancedSetting.getPicPathUserselect2(VTInCallScreenFlags.getInstance().mVTSlotId));
            return;
        }
    }

    public Bitmap getBitmap()
    {
        return mBitmap;
    }

    public void recycle()
    {
        if (mBitmap != null)
            mBitmap.recycle();
        mBitmap = null;
    }

    public void updateBitmapBySetting()
    {
        if (mBitmap != null)
        {
            return;
        } else
        {
            forceUpdateBitmapBySetting();
            return;
        }
    }
}
