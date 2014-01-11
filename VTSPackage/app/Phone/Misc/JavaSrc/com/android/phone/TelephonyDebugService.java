// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;
import com.android.internal.telephony.DebugService;
import java.io.FileDescriptor;
import java.io.PrintWriter;

public class TelephonyDebugService extends Service
{

    private static String TAG = "TelephonyDebugService";
    private DebugService mDebugService;

    public TelephonyDebugService()
    {
        mDebugService = new DebugService();
        Log.d(TAG, "TelephonyDebugService()");
    }

    protected void dump(FileDescriptor filedescriptor, PrintWriter printwriter, String as[])
    {
        mDebugService.dump(filedescriptor, printwriter, as);
    }

    public IBinder onBind(Intent intent)
    {
        return null;
    }

}
