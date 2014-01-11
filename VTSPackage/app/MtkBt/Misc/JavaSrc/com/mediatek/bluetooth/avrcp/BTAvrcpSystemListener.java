// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.bluetooth.avrcp;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

// Referenced classes of package com.mediatek.bluetooth.avrcp:
//            BTAvrcpMusicAdapter

public class BTAvrcpSystemListener
{

    public static final String TAG = "MIS_AVRCP";
    private BTAvrcpMusicAdapter mAdapter;
    private int mBatteryStatus;
    private boolean mIsRegBattery;
    private boolean mIsRegSystem;
    private int mSystemStatus;

    public BTAvrcpSystemListener(BTAvrcpMusicAdapter btavrcpmusicadapter)
    {
        mAdapter = btavrcpmusicadapter;
        mIsRegBattery = false;
        mIsRegSystem = false;
        mBatteryStatus = 0;
        mSystemStatus = 0;
        onBatteryStatusChange(0);
        onSystemStatusChange(1);
    }

    public void onBatteryStatusChange(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mAdapter != null && mIsRegBattery)
        {
            mIsRegBattery = false;
            mAdapter.notificationBatteryStatusChanged((byte)0, (byte)0, (byte)i);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onReceive(Context context, Intent intent)
    {
        Log.v("AVRCP", (new StringBuilder()).append("[BT][AVRCP] onReceive :").append(intent.toString()).toString());
    }

    public void onSystemStatusChange(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mAdapter != null && mIsRegSystem)
        {
            mIsRegSystem = false;
            mAdapter.notificationSystemStatusChanged((byte)0, (byte)0, (byte)i);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onVolumeStatusChange(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mAdapter != null && mIsRegSystem)
        {
            mIsRegSystem = false;
            mAdapter.notificationVolumeChanged((byte)0, (byte)0, (byte)0);
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public boolean regNotificationEvent(byte byte0, int i)
    {
        if (mAdapter != null)
        {
            if (6 == byte0)
            {
                mAdapter.notificationBatteryStatusChanged((byte)0, (byte)1, (byte)1);
                return true;
            }
            if (7 == byte0)
            {
                mAdapter.notificationSystemStatusChanged((byte)0, (byte)1, (byte)1);
                return true;
            }
            if (13 == byte0)
            {
                mAdapter.notificationVolumeChanged((byte)0, (byte)1, (byte)1);
                return true;
            }
        }
        return false;
    }

    public void startListener(BTAvrcpMusicAdapter btavrcpmusicadapter)
    {
        this;
        JVM INSTR monitorenter ;
        mAdapter = btavrcpmusicadapter;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void stopListener()
    {
        this;
        JVM INSTR monitorenter ;
        mAdapter = null;
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }
}
