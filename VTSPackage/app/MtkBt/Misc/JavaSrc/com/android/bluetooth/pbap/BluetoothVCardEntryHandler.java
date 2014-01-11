// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.bluetooth.pbap;

import android.content.Context;

// Referenced classes of package com.android.bluetooth.pbap:
//            BluetoothPbapWriter

public class BluetoothVCardEntryHandler
    implements BluetoothVCardComposer.OneEntryHandler
{

    private static final String TAG = "BluetoothVCardEntryHandler";
    String mVcard;
    BluetoothPbapWriter mWriter;

    public BluetoothVCardEntryHandler(String s)
    {
        mWriter = null;
        mVcard = s;
    }

    public String getPath()
    {
        if (mWriter != null)
            return mWriter.getPath();
        else
            return null;
    }

    public boolean onEntryCreated(String s)
    {
        return mWriter.write(s);
    }

    public boolean onInit(Context context)
    {
        if (mWriter == null)
        {
            mWriter = new BluetoothPbapWriter();
            if (mWriter != null)
                if (!mWriter.init(context))
                    mWriter = null;
                else
                if (mVcard != null && !onEntryCreated(mVcard))
                {
                    mWriter.terminate();
                    mWriter = null;
                }
        }
        return mWriter != null;
    }

    public void onTerminate()
    {
        if (mWriter != null)
        {
            mWriter.terminate();
            mWriter = null;
        }
    }
}
