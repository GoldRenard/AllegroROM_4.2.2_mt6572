// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.net.TrafficStats;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.*;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.WindowManager;
import com.android.internal.os.ProcessStats;
import java.io.*;

public class LoadAverageService extends Service
{
    private class LoadView extends View
    {

        private Paint mAddedPaint;
        private float mAscent;
        private int mFH;
        private Handler mHandler;
        private Paint mIrqPaint;
        private Paint mLoadPaint;
        private int mNeededHeight;
        private int mNeededWidth;
        private long mPreTxBytes;
        private long mPreTxTime;
        private Paint mRemovedPaint;
        private Paint mShadow2Paint;
        private Paint mShadowPaint;
        private final Stats mStats;
        private int mStorageIndicatorDelay;
        private int mStorageIndicatorMode;
        private Paint mSystemPaint;
        private int mThermalIndicatorDelay;
        private int mThermalIndicatorMode;
        private String mThermalText;
        private String mThermalTextExtra;
        private String mThermalTextLineThree;
        private int mThermalWidth;
        private int mThermalWidthExtra;
        private int mThermalWidthLineThree;
        private Paint mUserPaint;
        final LoadAverageService this$0;

        String getBattTemp()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/mtktz/mtktsbattery"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getCpuTemp()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/mtktz/mtktscpu"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getCurCpuFreq()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "N/A";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "N/A";
            }
            return s;
        }

        String getMaxCpuFreq()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "N/A";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "N/A";
            }
            return s;
        }

        String getMinCpuFreq()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "N/A";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "N/A";
            }
            return s;
        }

        String getPaTemp()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/mtktz/mtktspa"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getPhyRate()
        {
            String s = "";
            WifiInfo wifiinfo = ((WifiManager)getSystemService("wifi")).getConnectionInfo();
            if (wifiinfo != null)
                s = (new StringBuilder()).append(String.valueOf(wifiinfo.getLinkSpeed())).append(" Mbps").toString();
            return s;
        }

        void getStorageIndicatorModeAndDelay()
        {
            try
            {
                BufferedReader bufferedreader = new BufferedReader(new FileReader("/proc/driver/mtk_io_osd_config"));
                mStorageIndicatorMode = Integer.valueOf(bufferedreader.readLine()).intValue();
                mStorageIndicatorDelay = Integer.valueOf(bufferedreader.readLine()).intValue();
                if (mStorageIndicatorMode == 1)
                    mThermalIndicatorMode = 99;
                return;
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return;
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
            }
        }

        void getThermalIndicatorModeAndDelay()
        {
            try
            {
                BufferedReader bufferedreader = new BufferedReader(new FileReader("/proc/driver/mtk_thermal_indicator"));
                mThermalIndicatorMode = Integer.valueOf(bufferedreader.readLine()).intValue();
                mThermalIndicatorDelay = Integer.valueOf(bufferedreader.readLine()).intValue();
                return;
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return;
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
            }
        }

        String getThermalLimitCpuOpp()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/mtktscpu/mtktscpu_opp"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getTxBytes()
        {
            long l = TrafficStats.getMobileTxBytes();
            long l1 = TrafficStats.getTotalTxBytes();
            long l2 = 0L;
            long l3 = 8L * (l1 - l);
            long l4 = System.currentTimeMillis() / 1000L;
            if (l3 > 0L && mPreTxTime > 0L)
                l2 = (l3 - mPreTxBytes) / (l4 - mPreTxTime) / 1000L;
            mPreTxTime = l4;
            mPreTxBytes = l3;
            return String.valueOf(l2);
        }

        String getWiFiTemp()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/mtktz/mtktswmt"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getWiFiTxUsage()
        {
            String s = "";
            String s1;
            String s2;
            try
            {
                s1 = (new BufferedReader(new FileReader("/proc/wmt_tm/tx_thro"))).readLine();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return s;
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return s;
            }
            if (s1 == null)
                break MISSING_BLOCK_LABEL_40;
            s2 = s1.trim();
            s = s2;
            return s;
        }

        String getmmcqd1()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/driver/mtk_io_osd_mmcqd1"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        String getmmcqd2()
        {
            String s;
            try
            {
                s = (new BufferedReader(new FileReader("/proc/driver/mtk_io_osd_mmcqd2"))).readLine().trim();
            }
            catch (FileNotFoundException filenotfoundexception)
            {
                filenotfoundexception.printStackTrace();
                return "";
            }
            catch (IOException ioexception)
            {
                ioexception.printStackTrace();
                return "";
            }
            return s;
        }

        protected void onAttachedToWindow()
        {
            super.onAttachedToWindow();
            mHandler.sendEmptyMessage(1);
        }

        protected void onDetachedFromWindow()
        {
            super.onDetachedFromWindow();
            mHandler.removeMessages(1);
        }

        public void onDraw(Canvas canvas)
        {
            super.onDraw(canvas);
            int i = mNeededWidth;
            int j = -1 + getWidth();
            Stats stats = mStats;
            int k = stats.getLastUserTime();
            int l = stats.getLastSystemTime();
            int i1 = stats.getLastIoWaitTime();
            int j1 = stats.getLastIrqTime();
            int k1 = stats.getLastSoftIrqTime();
            int l1 = stats.getLastIdleTime() + (k1 + (j1 + (i1 + (k + l))));
            if (l1 != 0)
            {
                int i2 = (k * i) / l1;
                int j2 = (l * i) / l1;
                int k2 = (i * (k1 + (i1 + j1))) / l1;
                int l2 = j - mPaddingRight;
                int i3 = 2 + mPaddingTop;
                int j3 = -2 + (mPaddingTop + mFH);
                int k3 = mPaddingTop - (int)mAscent;
                if (1 == mThermalIndicatorMode || 2 == mThermalIndicatorMode || 3 == mThermalIndicatorMode)
                {
                    canvas.drawText(mThermalText, j - mPaddingRight - mThermalWidth, k3, mLoadPaint);
                    l2 = j - mPaddingRight;
                    k3 += mFH;
                    i3 += mFH;
                    j3 += mFH;
                }
                if (2 == mThermalIndicatorMode || 3 == mThermalIndicatorMode)
                {
                    canvas.drawText(mThermalTextExtra, j - mPaddingRight - mThermalWidthExtra, k3, mLoadPaint);
                    l2 = j - mPaddingRight;
                    k3 += mFH;
                    i3 += mFH;
                    j3 += mFH;
                }
                if (3 == mThermalIndicatorMode)
                {
                    canvas.drawText(mThermalTextLineThree, j - mPaddingRight - mThermalWidthLineThree, k3, mLoadPaint);
                    l2 = j - mPaddingRight;
                    k3 += mFH;
                    i3 += mFH;
                    j3 += mFH;
                }
                if (99 == mThermalIndicatorMode)
                {
                    canvas.drawText(mThermalText, j - mPaddingRight - mThermalWidth, k3, mLoadPaint);
                    int _tmp = j - mPaddingRight;
                    int j5 = k3 + mFH;
                    int k5 = i3 + mFH;
                    int l5 = j3 + mFH;
                    canvas.drawText(mThermalTextExtra, j - mPaddingRight - mThermalWidthExtra, j5, mLoadPaint);
                    l2 = j - mPaddingRight;
                    k3 = j5 + mFH;
                    i3 = k5 + mFH;
                    j3 = l5 + mFH;
                }
                if (mThermalIndicatorMode == 0)
                {
                    if (k2 > 0)
                    {
                        canvas.drawRect(l2 - k2, i3, l2, j3, mIrqPaint);
                        l2 -= k2;
                    }
                    if (j2 > 0)
                    {
                        canvas.drawRect(l2 - j2, i3, l2, j3, mSystemPaint);
                        l2 -= j2;
                    }
                    if (i2 > 0)
                    {
                        canvas.drawRect(l2 - i2, i3, l2, j3, mUserPaint);
                        int _tmp1 = l2 - i2;
                    }
                    canvas.drawText(stats.mLoadText, -1 + (j - mPaddingRight - stats.mLoadWidth), k3 - 1, mShadowPaint);
                    canvas.drawText(stats.mLoadText, -1 + (j - mPaddingRight - stats.mLoadWidth), k3 + 1, mShadowPaint);
                    canvas.drawText(stats.mLoadText, 1 + (j - mPaddingRight - stats.mLoadWidth), k3 - 1, mShadow2Paint);
                    canvas.drawText(stats.mLoadText, 1 + (j - mPaddingRight - stats.mLoadWidth), k3 + 1, mShadow2Paint);
                    canvas.drawText(stats.mLoadText, j - mPaddingRight - stats.mLoadWidth, k3, mLoadPaint);
                }
                int l3 = mThermalIndicatorMode;
                int i4 = 0;
                if (l3 == 0)
                    i4 = stats.countWorkingStats();
                for (int j4 = 0; j4 < i4; j4++)
                {
                    com.android.internal.os.ProcessStats.Stats stats1 = stats.getWorkingStats(j4);
                    k3 += mFH;
                    i3 += mFH;
                    j3 += mFH;
                    int k4 = (i * stats1.rel_utime) / l1;
                    int l4 = (i * stats1.rel_stime) / l1;
                    int i5 = j - mPaddingRight;
                    if (l4 > 0)
                    {
                        canvas.drawRect(i5 - l4, i3, i5, j3, mSystemPaint);
                        i5 -= l4;
                    }
                    if (k4 > 0)
                    {
                        canvas.drawRect(i5 - k4, i3, i5, j3, mUserPaint);
                        int _tmp2 = i5 - k4;
                    }
                    canvas.drawText(stats1.name, -1 + (j - mPaddingRight - stats1.nameWidth), k3 - 1, mShadowPaint);
                    canvas.drawText(stats1.name, -1 + (j - mPaddingRight - stats1.nameWidth), k3 + 1, mShadowPaint);
                    canvas.drawText(stats1.name, 1 + (j - mPaddingRight - stats1.nameWidth), k3 - 1, mShadow2Paint);
                    canvas.drawText(stats1.name, 1 + (j - mPaddingRight - stats1.nameWidth), k3 + 1, mShadow2Paint);
                    Paint paint = mLoadPaint;
                    if (stats1.added)
                        paint = mAddedPaint;
                    if (stats1.removed)
                        paint = mRemovedPaint;
                    canvas.drawText(stats1.name, j - mPaddingRight - stats1.nameWidth, k3, paint);
                }

            }
        }

        protected void onMeasure(int i, int j)
        {
            setMeasuredDimension(resolveSize(mNeededWidth, i), resolveSize(mNeededHeight, j));
        }

        void updateDisplay()
        {
            Stats stats = mStats;
            int i = mThermalIndicatorMode;
            int j = 0;
            if (i == 0)
                j = stats.countWorkingStats();
            int k = stats.mLoadWidth;
            for (int l = 0; l < j; l++)
            {
                com.android.internal.os.ProcessStats.Stats stats1 = stats.getWorkingStats(l);
                if (stats1.nameWidth > k)
                    k = stats1.nameWidth;
            }

            int i1 = k + (mPaddingLeft + mPaddingRight);
            int j1 = mPaddingTop + mPaddingBottom + mFH * (j + (1 + mThermalIndicatorMode));
            if (i1 == mNeededWidth && j1 == mNeededHeight)
            {
                invalidate();
                return;
            } else
            {
                mNeededWidth = i1;
                mNeededHeight = j1;
                requestLayout();
                return;
            }
        }

        void updateThermalInfo()
        {
            getThermalIndicatorModeAndDelay();
            getStorageIndicatorModeAndDelay();
            if (mThermalIndicatorMode == 0)
            {
                mThermalText = "";
                mThermalTextExtra = "";
                mThermalTextLineThree = "";
            } else
            if (1 == mThermalIndicatorMode)
            {
                mThermalText = (new StringBuilder()).append("Tcpu=").append(getCpuTemp()).append(" limit=").append(getThermalLimitCpuOpp()).toString();
                mThermalTextExtra = "";
                mThermalTextLineThree = "";
            } else
            if (2 == mThermalIndicatorMode)
            {
                mThermalText = (new StringBuilder()).append("Tcpu=").append(getCpuTemp()).append(" limit=").append(getThermalLimitCpuOpp()).toString();
                mThermalTextExtra = (new StringBuilder()).append("Tbat=").append(getBattTemp()).append(" Tpa=").append(getPaTemp()).append(" Twifi=").append(getWiFiTemp()).toString();
                mThermalTextLineThree = "";
            } else
            if (3 == mThermalIndicatorMode)
            {
                String s = getWiFiTxUsage();
                String s1 = getTxBytes();
                String s2 = getWiFiTemp();
                mThermalText = (new StringBuilder()).append("Tcpu=").append(getCpuTemp()).append(" limit=").append(getThermalLimitCpuOpp()).toString();
                mThermalTextExtra = (new StringBuilder()).append("Tbat=").append(getBattTemp()).append(" Tpa=").append(getPaTemp()).append(" Twifi=").append(s2).toString();
                mThermalTextLineThree = (new StringBuilder()).append("Tx=").append(s).append("/").append(s1).append("Kbps").toString();
            } else
            if (99 == mThermalIndicatorMode && 1 == mStorageIndicatorMode)
            {
                mThermalText = getmmcqd1();
                mThermalTextExtra = getmmcqd2();
                mThermalTextLineThree = "";
                mThermalIndicatorDelay = mStorageIndicatorDelay;
            }
            mThermalWidth = (int)mLoadPaint.measureText(mThermalText);
            mThermalWidthExtra = (int)mLoadPaint.measureText(mThermalTextExtra);
            mThermalWidthLineThree = (int)mLoadPaint.measureText(mThermalTextLineThree);
        }




        LoadView(Context context)
        {
            this$0 = LoadAverageService.this;
            super(context);
            mHandler = new _cls1();
            mPreTxBytes = 0L;
            mPreTxTime = 0L;
            mThermalIndicatorMode = 0;
            mThermalIndicatorDelay = 0;
            mStorageIndicatorMode = 0;
            mStorageIndicatorDelay = 0;
            setPadding(4, 4, 4, 4);
            float f = context.getResources().getDisplayMetrics().density;
            int i;
            if (f < 1.0F)
            {
                i = 9;
            } else
            {
                i = (int)(10F * f);
                if (i < 10)
                    i = 10;
            }
            mLoadPaint = new Paint();
            mLoadPaint.setAntiAlias(true);
            mLoadPaint.setTextSize(i);
            mLoadPaint.setARGB(255, 255, 255, 255);
            mAddedPaint = new Paint();
            mAddedPaint.setAntiAlias(true);
            mAddedPaint.setTextSize(i);
            mAddedPaint.setARGB(255, 128, 255, 128);
            mRemovedPaint = new Paint();
            mRemovedPaint.setAntiAlias(true);
            mRemovedPaint.setStrikeThruText(true);
            mRemovedPaint.setTextSize(i);
            mRemovedPaint.setARGB(255, 255, 128, 128);
            mShadowPaint = new Paint();
            mShadowPaint.setAntiAlias(true);
            mShadowPaint.setTextSize(i);
            mShadowPaint.setARGB(192, 0, 0, 0);
            mLoadPaint.setShadowLayer(4F, 0.0F, 0.0F, 0xff000000);
            mShadow2Paint = new Paint();
            mShadow2Paint.setAntiAlias(true);
            mShadow2Paint.setTextSize(i);
            mShadow2Paint.setARGB(192, 0, 0, 0);
            mLoadPaint.setShadowLayer(2.0F, 0.0F, 0.0F, 0xff000000);
            mIrqPaint = new Paint();
            mIrqPaint.setARGB(128, 0, 0, 255);
            mIrqPaint.setShadowLayer(2.0F, 0.0F, 0.0F, 0xff000000);
            mSystemPaint = new Paint();
            mSystemPaint.setARGB(128, 255, 0, 0);
            mSystemPaint.setShadowLayer(2.0F, 0.0F, 0.0F, 0xff000000);
            mUserPaint = new Paint();
            mUserPaint.setARGB(128, 0, 255, 0);
            mSystemPaint.setShadowLayer(2.0F, 0.0F, 0.0F, 0xff000000);
            mAscent = mLoadPaint.ascent();
            mFH = (int)(0.5F + (mLoadPaint.descent() - mAscent));
            mStats = new Stats(mLoadPaint);
            mStats.init();
            updateDisplay();
        }
    }

    private static final class Stats extends ProcessStats
    {

        String mLoadText;
        int mLoadWidth;
        private final Paint mPaint;

        public void onLoadChanged(float f, float f1, float f2)
        {
            mLoadText = (new StringBuilder()).append(f).append(" / ").append(f1).append(" / ").append(f2).toString();
            mLoadWidth = (int)mPaint.measureText(mLoadText);
        }

        public int onMeasureProcessName(String s)
        {
            return (int)mPaint.measureText(s);
        }

        Stats(Paint paint)
        {
            super(false);
            mPaint = paint;
        }
    }


    private View mView;


    public IBinder onBind(Intent intent)
    {
        return null;
    }

    public void onCreate()
    {
        super.onCreate();
        mView = new LoadView(this);
        android.view.WindowManager.LayoutParams layoutparams = new android.view.WindowManager.LayoutParams(-1, -2, 2015, 24, -3);
        layoutparams.gravity = 53;
        layoutparams.setTitle("Load Average");
        ((WindowManager)getSystemService("window")).addView(mView, layoutparams);
    }

    public void onDestroy()
    {
        super.onDestroy();
        ((WindowManager)getSystemService("window")).removeView(mView);
        mView = null;
    }

    // Unreferenced inner class com/android/systemui/LoadAverageService$LoadView$1

/* anonymous class */
    class LoadView._cls1 extends Handler
    {

        final LoadView this$1;

        public void handleMessage(Message message)
        {
            Message message1;
label0:
            {
                if (message.what == 1)
                {
                    if (mThermalIndicatorMode == 0)
                        mStats.update();
                    updateThermalInfo();
                    updateDisplay();
                    message1 = obtainMessage(1);
                    if (mThermalIndicatorMode <= 0 || mThermalIndicatorDelay < 2000)
                        break label0;
                    sendMessageDelayed(message1, mThermalIndicatorDelay);
                }
                return;
            }
            if (mThermalIndicatorMode == 99 && mThermalIndicatorDelay >= 500)
            {
                sendMessageDelayed(message1, mThermalIndicatorDelay);
                return;
            } else
            {
                sendMessageDelayed(message1, 2000L);
                return;
            }
        }

            
            {
                this$1 = LoadView.this;
                super();
            }
    }

}
