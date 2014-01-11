// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.calloption;

import android.content.Context;
import android.content.Intent;
import android.os.*;
import android.telephony.TelephonyManager;
import android.util.Log;
import com.mediatek.CellConnService.CellConnMgr;
import com.mediatek.phone.GeminiConstants;
import com.mediatek.telephony.TelephonyManagerEx;

// Referenced classes of package com.mediatek.calloption:
//            CallOptionBaseHandler, CallOptionUtils, Request

public abstract class SimStatusCallOptionHandler extends CallOptionBaseHandler
{

    private static final int MESSAGE_CHECK_SIM_STATUS = 100;
    private static final String TAG = "SimStatusCallOptionHandler";
    private final Handler mHandler = new Handler() {

        final SimStatusCallOptionHandler this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 100: // 'd'
                int i = mRequest.getCellConnMgr().handleCellConn(message.arg1, 306, mRunnable);
                log((new StringBuilder()).append("result = ").append(i).toString());
                mRequest.getCellConnMgr();
                if (i == 1)
                {
                    showProgressIndication(mRequest);
                    return;
                }
                break;
            }
        }

            
            {
                this$0 = SimStatusCallOptionHandler.this;
                super();
            }
    }
;
    private Request mRequest;
    private Runnable mRunnable;

    public SimStatusCallOptionHandler()
    {
        mRunnable = new Runnable() {

            final SimStatusCallOptionHandler this$0;

            public void run()
            {
                int i = mRequest.getCellConnMgr().getResult();
                int j = mRequest.getCellConnMgr().getPreferSlot();
                log((new StringBuilder()).append("run, result = ").append(i).append(" slot = ").append(j).toString());
                dismissProgressIndication();
                if (i != 4)
                {
                    mRequest.getResultHandler().onHandlingFinish();
                } else
                {
                    int k = mRequest.getIntent().getIntExtra("com.android.phone.extra.slot", -1);
                    log((new StringBuilder()).append("afterCheckSIMStatus, oldSolt = ").append(k).toString());
                    if (k != -1 && j != k)
                        mRequest.getIntent().putExtra("com.android.phone.extra.slot", j);
                    if (mSuccessor != null)
                    {
                        mSuccessor.handleRequest(mRequest);
                        return;
                    }
                }
            }

            
            {
                this$0 = SimStatusCallOptionHandler.this;
                super();
            }
        }
;
    }

    private boolean isRoamingNeeded(int i)
    {
        boolean flag = false;
        for (int j = 0; j < GeminiConstants.SLOTS.length; j++)
            if (i == GeminiConstants.SLOTS[j])
                flag = SystemProperties.getBoolean(GeminiConstants.GSM_ROAMING_INDICATOR_NEEDED_GEMINI[j], false);

        log((new StringBuilder()).append("isRoamingNeeded slot=").append(i).append(" result=").append(flag).toString());
        return flag;
    }

    private void log(String s)
    {
        Log.d("SimStatusCallOptionHandler", s);
    }

    private boolean needToCheckSIMStatus(int i)
    {
        if (i >= 0 && CallOptionUtils.isSimInsert(mRequest, i))
        {
            if (!CallOptionUtils.isRadioOn(mRequest, i))
                return true;
            int j;
            if (mRequest.isMultipleSim())
                j = TelephonyManagerEx.getDefault().getSimState(i);
            else
                j = TelephonyManager.getDefault().getSimState();
            if (j != 5 || roamingRequest(i))
                return true;
        } else
        {
            log("the sim not insert, bail out!");
        }
        return false;
    }

    private boolean roamingRequest(int i)
    {
        log((new StringBuilder()).append("roamingRequest slot = ").append(i).toString());
        boolean flag;
        if (mRequest.isMultipleSim())
            flag = TelephonyManagerEx.getDefault().isNetworkRoaming(i);
        else
            flag = TelephonyManager.getDefault().isNetworkRoaming();
        log((new StringBuilder()).append("roamingRequest slot = ").append(i).append(", isRoam = ").append(flag).toString());
        if (!flag)
            return false;
        if (android.provider.Settings.System.getInt(mRequest.getApplicationContext().getContentResolver(), "roaming_reminder_mode_setting", -1) == 0 && isRoamingNeeded(i))
        {
            log("roamingRequest reminder once and need to indicate");
            return true;
        }
        if (1 == android.provider.Settings.System.getInt(mRequest.getApplicationContext().getContentResolver(), "roaming_reminder_mode_setting", -1))
        {
            log("roamingRequest reminder always");
            return true;
        } else
        {
            log("roamingRequest result = false");
            return false;
        }
    }

    protected abstract void dismissProgressIndication();

    public void handleRequest(Request request)
    {
        int i = request.getIntent().getIntExtra("com.android.phone.extra.slot", -1);
        log((new StringBuilder()).append("handleRequest(), slot = ").append(i).toString());
        if (-1 == i)
        {
            if (super.mSuccessor != null)
                super.mSuccessor.handleRequest(request);
        } else
        {
            mRequest = request;
            if (needToCheckSIMStatus(i))
            {
                mHandler.sendMessage(mHandler.obtainMessage(100, i, 0));
                return;
            }
            if (super.mSuccessor != null)
            {
                super.mSuccessor.handleRequest(request);
                return;
            }
        }
    }

    protected abstract void showProgressIndication(Request request);



}
