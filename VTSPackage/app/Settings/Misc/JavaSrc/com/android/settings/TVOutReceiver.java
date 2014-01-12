// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings;

import android.content.*;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.tvout.ITVOUTNative;

public class TVOutReceiver extends BroadcastReceiver
{


    public void onReceive(Context context, Intent intent)
    {
        ITVOUTNative itvoutnative = null;
        if (true)
            itvoutnative = (ITVOUTNative)MediatekClassFactory.createInstance(com/mediatek/common/tvout/ITVOUTNative, new Object[0]);
        itvoutnative.IPOPowerOff();
    }
}
