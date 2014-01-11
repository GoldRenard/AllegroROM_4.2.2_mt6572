// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.settings;

import android.content.Context;
import android.content.Intent;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.xlog.Xlog;

public class PreCheckForRunning
{
    class ServiceComplete
        implements Runnable
    {

        final PreCheckForRunning this$0;

        public void run()
        {
            int i = mCellConnMgr.getResult();
            Xlog.d("Settings/PreCheckForRunning", (new StringBuilder()).append("ServiceComplete with the result = ").append(CellConnMgr.resultToString(i)).toString());
            if (i == 0 || 4 == i)
                mContext.startActivity(mIntent);
        }

        ServiceComplete()
        {
            this$0 = PreCheckForRunning.this;
            super();
        }
    }


    private static final String TAG = "Settings/PreCheckForRunning";
    public boolean mByPass;
    private CellConnMgr mCellConnMgr;
    private Context mContext;
    private Intent mIntent;
    private ServiceComplete mServiceComplete;

    public PreCheckForRunning(Context context)
    {
        mByPass = false;
        mContext = context;
        mServiceComplete = new ServiceComplete();
        mCellConnMgr = new CellConnMgr(mServiceComplete);
        mCellConnMgr.register(mContext.getApplicationContext());
    }

    public void checkToRun(Intent intent, int i, int j)
    {
        if (mByPass)
        {
            mContext.startActivity(intent);
            return;
        } else
        {
            setIntent(intent);
            int k = mCellConnMgr.handleCellConn(i, j);
            Xlog.d("Settings/PreCheckForRunning", (new StringBuilder()).append("The result of handleCellConn = ").append(CellConnMgr.resultToString(k)).toString());
            return;
        }
    }

    public void deRegister()
    {
        mCellConnMgr.unregister();
    }

    public void setIntent(Intent intent)
    {
        mIntent = intent;
    }



}
