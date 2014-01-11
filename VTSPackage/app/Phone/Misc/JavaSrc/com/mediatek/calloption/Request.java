// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import com.android.internal.telephony.ITelephony;
import com.mediatek.CellConnService.CellConnMgr;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionHandlerFactory

public class Request
{

    private Context mActivityContext;
    private Context mApplicationContext;
    private CallOptionHandlerFactory mCallOptionHandlerFactory;
    private CellConnMgr mCellConnMgr;
    private Intent mIntent;
    private boolean mIs3GSwitchSupport;
    private boolean mIsMultipleSim;
    private CallOptionBaseHandler.ICallOptionResultHandle mResultHandler;
    private ITelephony mTelephonyInterface;

    public Request(Context context, Context context1, Intent intent, CallOptionBaseHandler.ICallOptionResultHandle icalloptionresulthandle, CellConnMgr cellconnmgr, ITelephony itelephony, boolean flag, 
            boolean flag1, CallOptionHandlerFactory calloptionhandlerfactory)
    {
        mActivityContext = context;
        mApplicationContext = context1;
        mIntent = intent;
        mResultHandler = icalloptionresulthandle;
        mCellConnMgr = cellconnmgr;
        mTelephonyInterface = itelephony;
        mIsMultipleSim = flag;
        mIs3GSwitchSupport = flag1;
        mCallOptionHandlerFactory = calloptionhandlerfactory;
    }

    public Context getActivityContext()
    {
        return mActivityContext;
    }

    public Context getApplicationContext()
    {
        return mApplicationContext;
    }

    public CallOptionHandlerFactory getCallOptionHandlerFactory()
    {
        return mCallOptionHandlerFactory;
    }

    public CellConnMgr getCellConnMgr()
    {
        return mCellConnMgr;
    }

    public Intent getIntent()
    {
        return mIntent;
    }

    public CallOptionBaseHandler.ICallOptionResultHandle getResultHandler()
    {
        return mResultHandler;
    }

    public ITelephony getTelephonyInterface()
    {
        return mTelephonyInterface;
    }

    public boolean is3GSwitchSupport()
    {
        return mIs3GSwitchSupport;
    }

    public boolean isMultipleSim()
    {
        return mIsMultipleSim;
    }
}
