// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.phone;

import android.content.Context;
import android.hardware.*;
import android.os.Handler;
import android.os.Message;
import android.util.Log;

public final class AccelerometerListener
{
    public static interface OrientationListener
    {

        public abstract void orientationChanged(int i);
    }


    private static final boolean DEBUG = true;
    private static final int HORIZONTAL_DEBOUNCE = 500;
    private static final int ORIENTATION_CHANGED = 1234;
    public static final int ORIENTATION_HORIZONTAL = 2;
    public static final int ORIENTATION_UNKNOWN = 0;
    public static final int ORIENTATION_VERTICAL = 1;
    private static final String TAG = "AccelerometerListener";
    private static final boolean VDEBUG = false;
    private static final double VERTICAL_ANGLE = 50D;
    private static final int VERTICAL_DEBOUNCE = 100;
    Handler mHandler;
    private OrientationListener mListener;
    private int mOrientation;
    private int mPendingOrientation;
    private Sensor mSensor;
    SensorEventListener mSensorListener;
    private SensorManager mSensorManager;

    public AccelerometerListener(Context context, OrientationListener orientationlistener)
    {
        mSensorListener = new SensorEventListener() {

            final AccelerometerListener this$0;

            public void onAccuracyChanged(Sensor sensor, int i)
            {
            }

            public void onSensorChanged(SensorEvent sensorevent)
            {
                onSensorEvent(sensorevent.values[0], sensorevent.values[1], sensorevent.values[2]);
            }

            
            {
                this$0 = AccelerometerListener.this;
                super();
            }
        }
;
        mHandler = new Handler() {

            final AccelerometerListener this$0;

            public void handleMessage(Message message)
            {
                message.what;
                JVM INSTR tableswitch 1234 1234: default 24
            //                           1234 25;
                   goto _L1 _L2
_L1:
                return;
_L2:
                this;
                JVM INSTR monitorenter ;
                StringBuilder stringbuilder;
                mOrientation = mPendingOrientation;
                stringbuilder = (new StringBuilder()).append("orientation: ");
                if (mOrientation != 2) goto _L4; else goto _L3
_L3:
                String s = "horizontal";
_L6:
                Log.d("AccelerometerListener", stringbuilder.append(s).toString());
                mListener.orientationChanged(mOrientation);
                this;
                JVM INSTR monitorexit ;
                return;
                Exception exception;
                exception;
                this;
                JVM INSTR monitorexit ;
                throw exception;
_L4:
                if (mOrientation == 1)
                    s = "vertical";
                else
                    s = "unknown";
                if (true) goto _L6; else goto _L5
_L5:
            }

            
            {
                this$0 = AccelerometerListener.this;
                super();
            }
        }
;
        mListener = orientationlistener;
        mSensorManager = (SensorManager)context.getSystemService("sensor");
        mSensor = mSensorManager.getDefaultSensor(1);
    }

    private void onSensorEvent(double d, double d1, double d2)
    {
        if (d != 0.0D && d1 != 0.0D && d2 != 0.0D)
        {
            byte byte0;
            if ((180D * Math.atan2(Math.sqrt(d * d + d1 * d1), d2)) / 3.1415926535897931D > 50D)
                byte0 = 1;
            else
                byte0 = 2;
            setOrientation(byte0);
            return;
        } else
        {
            return;
        }
    }

    private void setOrientation(int i)
    {
        this;
        JVM INSTR monitorenter ;
        if (mPendingOrientation != i)
            break MISSING_BLOCK_LABEL_13;
        this;
        JVM INSTR monitorexit ;
        return;
        Message message;
        mHandler.removeMessages(1234);
        if (mOrientation == i)
            break MISSING_BLOCK_LABEL_84;
        mPendingOrientation = i;
        message = mHandler.obtainMessage(1234);
        Exception exception;
        int j;
        if (i == 1)
            j = 100;
        else
            j = 500;
        mHandler.sendMessageDelayed(message, j);
_L1:
        this;
        JVM INSTR monitorexit ;
        return;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
        mPendingOrientation = 0;
          goto _L1
    }

    public void enable(boolean flag)
    {
        Log.d("AccelerometerListener", (new StringBuilder()).append("enable(").append(flag).append(")").toString());
        this;
        JVM INSTR monitorenter ;
        if (!flag)
            break MISSING_BLOCK_LABEL_66;
        mOrientation = 0;
        mPendingOrientation = 0;
        mSensorManager.registerListener(mSensorListener, mSensor, 3);
_L2:
        this;
        JVM INSTR monitorexit ;
        return;
        mSensorManager.unregisterListener(mSensorListener);
        mHandler.removeMessages(1234);
        if (true) goto _L2; else goto _L1
_L1:
        Exception exception;
        exception;
        this;
        JVM INSTR monitorexit ;
        throw exception;
    }




/*
    static int access$102(AccelerometerListener accelerometerlistener, int i)
    {
        accelerometerlistener.mOrientation = i;
        return i;
    }

*/


}
