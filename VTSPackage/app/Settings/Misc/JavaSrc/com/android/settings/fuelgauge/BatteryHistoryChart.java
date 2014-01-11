// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.fuelgauge;

import android.content.Context;
import android.content.res.*;
import android.graphics.*;
import android.os.BatteryStats;
import android.os.SystemClock;
import android.text.TextPaint;
import android.util.*;
import android.view.View;
import com.android.settings.Utils;

// Referenced classes of package com.android.settings.fuelgauge:
//            Utils

public class BatteryHistoryChart extends View
{
    static class ChartData
    {

        int mColors[];
        int mLastBin;
        int mNumTicks;
        Paint mPaints[];
        int mTicks[];

        void addTick(int i, int j)
        {
            if (j != mLastBin && mNumTicks < mTicks.length)
            {
                mTicks[mNumTicks] = i | j << 16;
                mNumTicks = 1 + mNumTicks;
                mLastBin = j;
            }
        }

        void draw(Canvas canvas, int i, int j)
        {
            int k = 0;
            int l = 0;
            int i1 = i + j;
            for (int j1 = 0; j1 < mNumTicks; j1++)
            {
                int k1 = mTicks[j1];
                int l1 = k1 & 0xffff;
                int i2 = (0xffff0000 & k1) >> 16;
                if (k != 0)
                {
                    if (k >= mPaints.length)
                        k = -1 + mPaints.length;
                    canvas.drawRect(l, i, l1, i1, mPaints[k]);
                }
                k = i2;
                l = l1;
            }

        }

        void finish(int i)
        {
            if (mLastBin != 0)
                addTick(i, 0);
        }

        void init(int i)
        {
            if (i > 0)
                mTicks = new int[i * 2];
            else
                mTicks = null;
            mNumTicks = 0;
            mLastBin = 0;
        }

        void setColors(int ai[])
        {
            mColors = ai;
            mPaints = new Paint[ai.length];
            for (int i = 0; i < ai.length; i++)
            {
                mPaints[i] = new Paint();
                mPaints[i].setColor(ai[i]);
                mPaints[i].setStyle(android.graphics.Paint.Style.FILL);
            }

        }

    }


    static final int BATTERY_CRITICAL = 14;
    static final int BATTERY_WARN = 29;
    static final int CHART_DATA_BIN_MASK = 0xffff0000;
    static final int CHART_DATA_BIN_SHIFT = 16;
    static final int CHART_DATA_X_MASK = 65535;
    static final int MONOSPACE = 3;
    static final int NUM_PHONE_SIGNALS = 7;
    static final int PHONE_SIGNAL_BIN_MASK = 0xffff0000;
    static final int PHONE_SIGNAL_BIN_SHIFT = 16;
    static final int PHONE_SIGNAL_X_MASK = 65535;
    static final int SANS = 1;
    static final int SERIF = 2;
    final Path mBatCriticalPath = new Path();
    final Path mBatGoodPath = new Path();
    int mBatHigh;
    final Path mBatLevelPath = new Path();
    int mBatLow;
    final Path mBatWarnPath = new Path();
    final Paint mBatteryBackgroundPaint = new Paint(1);
    final Paint mBatteryCriticalPaint = new Paint(1);
    final Paint mBatteryGoodPaint = new Paint(1);
    final Paint mBatteryWarnPaint = new Paint(1);
    String mChargingLabel;
    int mChargingOffset;
    final Paint mChargingPaint = new Paint();
    final Path mChargingPath = new Path();
    String mDurationString;
    int mDurationStringWidth;
    int mFontSize;
    String mGpsOnLabel;
    int mGpsOnOffset;
    final Paint mGpsOnPaint = new Paint();
    final Path mGpsOnPath = new Path();
    boolean mHaveGps;
    boolean mHavePhoneSignal;
    boolean mHaveWifi;
    long mHistEnd;
    long mHistStart;
    boolean mLargeMode;
    int mLevelBottom;
    int mLevelOffset;
    int mLevelTop;
    int mLineWidth;
    int mNumHist;
    int mOffSpace;
    final ChartData mPhoneSignalChart = new ChartData();
    String mPhoneSignalLabel;
    int mPhoneSignalOffset;
    String mScreenOnLabel;
    int mScreenOnOffset;
    final Paint mScreenOnPaint = new Paint();
    final Path mScreenOnPath = new Path();
    BatteryStats mStats;
    long mStatsPeriod;
    int mTextAscent;
    int mTextDescent;
    final TextPaint mTextPaint = new TextPaint(1);
    int mThinLineWidth;
    String mTotalDurationString;
    int mTotalDurationStringWidth;
    String mWakeLockLabel;
    int mWakeLockOffset;
    final Paint mWakeLockPaint = new Paint();
    final Path mWakeLockPath = new Path();
    String mWifiRunningLabel;
    int mWifiRunningOffset;
    final Paint mWifiRunningPaint = new Paint();
    final Path mWifiRunningPath = new Path();

    public BatteryHistoryChart(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mBatteryBackgroundPaint.setARGB(255, 128, 128, 128);
        mBatteryBackgroundPaint.setStyle(android.graphics.Paint.Style.FILL);
        mBatteryGoodPaint.setARGB(128, 0, 255, 0);
        mBatteryGoodPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mBatteryWarnPaint.setARGB(128, 255, 255, 0);
        mBatteryWarnPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mBatteryCriticalPaint.setARGB(192, 255, 0, 0);
        mBatteryCriticalPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mChargingPaint.setARGB(255, 0, 128, 0);
        mChargingPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mScreenOnPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mGpsOnPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mWifiRunningPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mWakeLockPaint.setStyle(android.graphics.Paint.Style.STROKE);
        mPhoneSignalChart.setColors(new int[] {
            0, 0xffa00000, 0xffa0a000, 0xff808020, 0xff808040, 0xff808060, 0xff008000
        });
        mTextPaint.density = getResources().getDisplayMetrics().density;
        mTextPaint.setCompatibilityScaling(getResources().getCompatibilityInfo().applicationScale);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.BatteryHistoryChart, 0, 0);
        int i = 15;
        int j = -1;
        int k = -1;
        int l = typedarray.getResourceId(0, -1);
        TypedArray typedarray1 = null;
        if (l != -1)
            typedarray1 = context.obtainStyledAttributes(l, com.android.internal.R.styleable.TextAppearance);
        ColorStateList colorstatelist = null;
        if (typedarray1 != null)
        {
            int i2 = typedarray1.getIndexCount();
            for (int j2 = 0; j2 < i2; j2++)
            {
                int k2 = typedarray1.getIndex(j2);
                switch (k2)
                {
                case 2: // '\002'
                    k = typedarray1.getInt(k2, -1);
                    break;

                case 1: // '\001'
                    j = typedarray1.getInt(k2, -1);
                    break;

                case 0: // '\0'
                    i = typedarray1.getDimensionPixelSize(k2, i);
                    break;

                case 3: // '\003'
                    colorstatelist = typedarray1.getColorStateList(k2);
                    break;
                }
            }

            typedarray1.recycle();
        }
        int i1 = 0;
        float f = 0.0F;
        float f1 = 0.0F;
        float f2 = 0.0F;
        int j1 = typedarray.getIndexCount();
        for (int k1 = 0; k1 < j1; k1++)
        {
            int l1 = typedarray.getIndex(k1);
            switch (l1)
            {
            case 3: // '\003'
                k = typedarray.getInt(l1, k);
                break;

            case 2: // '\002'
                j = typedarray.getInt(l1, j);
                break;

            case 1: // '\001'
                i = typedarray.getDimensionPixelSize(l1, i);
                break;

            case 4: // '\004'
                colorstatelist = typedarray.getColorStateList(l1);
                break;

            case 8: // '\b'
                f2 = typedarray.getFloat(l1, 0.0F);
                break;

            case 7: // '\007'
                f1 = typedarray.getFloat(l1, 0.0F);
                break;

            case 6: // '\006'
                f = typedarray.getFloat(l1, 0.0F);
                break;

            case 5: // '\005'
                i1 = typedarray.getInt(l1, 0);
                break;
            }
        }

        typedarray.recycle();
        mTextPaint.setColor(colorstatelist.getDefaultColor());
        mTextPaint.setTextSize(i);
        Typeface typeface = null;
        switch (j)
        {
        case 3: // '\003'
            typeface = Typeface.MONOSPACE;
            break;

        case 2: // '\002'
            typeface = Typeface.SERIF;
            break;

        case 1: // '\001'
            typeface = Typeface.SANS_SERIF;
            break;
        }
        setTypeface(typeface, k);
        if (i1 != 0)
            mTextPaint.setShadowLayer(f2, f, f1, i1);
        switch (getResources().getDisplayMetrics().densityDpi)
        {
        case 320: 
            mOffSpace = 12;
            return;

        case 240: 
            mOffSpace = 8;
            return;

        case 160: 
            mOffSpace = 7;
            return;

        case 120: // 'x'
            mOffSpace = 4;
            return;
        }
        mOffSpace = 6;
    }

    void finishPaths(int i, int j, int k, int l, int i1, Path path, int j1, 
            boolean flag, boolean flag1, boolean flag2, boolean flag3, boolean flag4, Path path1)
    {
        if (path != null)
        {
            if (j1 >= 0 && j1 < i)
            {
                if (path1 != null)
                    path1.lineTo(i, i1);
                path.lineTo(i, i1);
            }
            path.lineTo(i, k + mLevelTop);
            path.lineTo(l, k + mLevelTop);
            path.close();
        }
        if (flag)
            mChargingPath.lineTo(i, j - mChargingOffset);
        if (flag1)
            mScreenOnPath.lineTo(i, j - mScreenOnOffset);
        if (flag2)
            mGpsOnPath.lineTo(i, j - mGpsOnOffset);
        if (flag3)
            mWifiRunningPath.lineTo(i, j - mWifiRunningOffset);
        if (flag4)
            mWakeLockPath.lineTo(i, j - mWakeLockOffset);
        if (mHavePhoneSignal)
            mPhoneSignalChart.finish(i);
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = getWidth();
        int j = getHeight();
        canvas.drawPath(mBatLevelPath, mBatteryBackgroundPaint);
        if (mLargeMode)
        {
            canvas.drawText(mDurationString, 0.0F, -mTextAscent + mLineWidth / 2, mTextPaint);
            canvas.drawText(mTotalDurationString, i / 2 - mTotalDurationStringWidth / 2, (mLevelBottom - mTextAscent) + mThinLineWidth, mTextPaint);
        } else
        {
            canvas.drawText(mDurationString, i / 2 - mDurationStringWidth / 2, j / 2 - (mTextDescent - mTextAscent) / 2 - mTextAscent, mTextPaint);
        }
        if (!mBatGoodPath.isEmpty())
            canvas.drawPath(mBatGoodPath, mBatteryGoodPaint);
        if (!mBatWarnPath.isEmpty())
            canvas.drawPath(mBatWarnPath, mBatteryWarnPaint);
        if (!mBatCriticalPath.isEmpty())
            canvas.drawPath(mBatCriticalPath, mBatteryCriticalPaint);
        if (mHavePhoneSignal)
        {
            int i1 = j - mPhoneSignalOffset - mLineWidth / 2;
            mPhoneSignalChart.draw(canvas, i1, mLineWidth);
        }
        if (!mScreenOnPath.isEmpty())
            canvas.drawPath(mScreenOnPath, mScreenOnPaint);
        if (!mChargingPath.isEmpty())
            canvas.drawPath(mChargingPath, mChargingPaint);
        if (mHaveGps && !mGpsOnPath.isEmpty())
            canvas.drawPath(mGpsOnPath, mGpsOnPaint);
        if (mHaveWifi && !mWifiRunningPath.isEmpty())
            canvas.drawPath(mWifiRunningPath, mWifiRunningPaint);
        if (!mWakeLockPath.isEmpty())
            canvas.drawPath(mWakeLockPath, mWakeLockPaint);
        if (mLargeMode)
        {
            if (mHavePhoneSignal)
                canvas.drawText(mPhoneSignalLabel, 0.0F, j - mPhoneSignalOffset - mTextDescent - mOffSpace, mTextPaint);
            if (mHaveGps)
                canvas.drawText(mGpsOnLabel, 0.0F, j - mGpsOnOffset - mTextDescent - mOffSpace, mTextPaint);
            if (mHaveWifi)
                canvas.drawText(mWifiRunningLabel, 0.0F, j - mWifiRunningOffset - mTextDescent - mOffSpace, mTextPaint);
            canvas.drawText(mWakeLockLabel, 0.0F, j - mWakeLockOffset - mTextDescent - mOffSpace, mTextPaint);
            canvas.drawText(mChargingLabel, 0.0F, j - mChargingOffset - mTextDescent - mOffSpace, mTextPaint);
            canvas.drawText(mScreenOnLabel, 0.0F, j - mScreenOnOffset - mTextDescent - mOffSpace, mTextPaint);
            canvas.drawLine(0.0F, mLevelBottom + mThinLineWidth / 2, i, mLevelBottom + mThinLineWidth / 2, mTextPaint);
            canvas.drawLine(0.0F, mLevelTop, 0.0F, mLevelBottom + mThinLineWidth / 2, mTextPaint);
            for (int k = 0; k < 10; k++)
            {
                int l = mLevelTop + (k * (mLevelBottom - mLevelTop)) / 10;
                canvas.drawLine(0.0F, l, 2 * mThinLineWidth, l, mTextPaint);
            }

        }
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        mDurationStringWidth = (int)mTextPaint.measureText(mDurationString);
        mTotalDurationStringWidth = (int)mTextPaint.measureText(mTotalDurationString);
        mTextAscent = (int)mTextPaint.ascent();
        mTextDescent = (int)mTextPaint.descent();
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        int i1 = mTextDescent - mTextAscent;
        mThinLineWidth = (int)TypedValue.applyDimension(1, 2.0F, getResources().getDisplayMetrics());
        if (j > i1 * 6)
        {
            mLargeMode = true;
            if (j > i1 * 15)
                mLineWidth = i1 / 2;
            else
                mLineWidth = i1 / 3;
            mLevelTop = i1 + mLineWidth;
            mScreenOnPaint.setARGB(255, 32, 64, 255);
            mGpsOnPaint.setARGB(255, 32, 64, 255);
            mWifiRunningPaint.setARGB(255, 32, 64, 255);
            mWakeLockPaint.setARGB(255, 32, 64, 255);
        } else
        {
            mLargeMode = false;
            mLineWidth = mThinLineWidth;
            mLevelTop = 0;
            mScreenOnPaint.setARGB(255, 0, 0, 255);
            mGpsOnPaint.setARGB(255, 0, 0, 255);
            mWifiRunningPaint.setARGB(255, 0, 0, 255);
            mWakeLockPaint.setARGB(255, 0, 0, 255);
        }
        if (mLineWidth <= 0)
            mLineWidth = 1;
        mTextPaint.setStrokeWidth(mThinLineWidth);
        mBatteryGoodPaint.setStrokeWidth(mThinLineWidth);
        mBatteryWarnPaint.setStrokeWidth(mThinLineWidth);
        mBatteryCriticalPaint.setStrokeWidth(mThinLineWidth);
        mChargingPaint.setStrokeWidth(mLineWidth);
        mScreenOnPaint.setStrokeWidth(mLineWidth);
        mGpsOnPaint.setStrokeWidth(mLineWidth);
        mWifiRunningPaint.setStrokeWidth(mLineWidth);
        mWakeLockPaint.setStrokeWidth(mLineWidth);
        if (mLargeMode)
        {
            int l4 = 5 + (i1 + mLineWidth);
            mChargingOffset = mLineWidth;
            mScreenOnOffset = l4 + mChargingOffset;
            mWakeLockOffset = l4 + mScreenOnOffset;
            mWifiRunningOffset = l4 + mWakeLockOffset;
            int i5 = mWifiRunningOffset;
            int j5;
            if (mHaveWifi)
                j5 = l4;
            else
                j5 = 0;
            mGpsOnOffset = j5 + i5;
            int k5 = mGpsOnOffset;
            int l5;
            if (mHaveGps)
                l5 = l4;
            else
                l5 = 0;
            mPhoneSignalOffset = l5 + k5;
            int i6 = mPhoneSignalOffset;
            if (!mHavePhoneSignal)
                l4 = 0;
            mLevelOffset = i6 + l4 + (3 * mLineWidth) / 2;
            if (mHavePhoneSignal)
                mPhoneSignalChart.init(i);
        } else
        {
            int j1 = mLineWidth;
            mWakeLockOffset = j1;
            mWifiRunningOffset = j1;
            mGpsOnOffset = j1;
            mScreenOnOffset = j1;
            mChargingOffset = 2 * mLineWidth;
            mPhoneSignalOffset = 0;
            mLevelOffset = 3 * mLineWidth;
            if (mHavePhoneSignal)
                mPhoneSignalChart.init(0);
        }
        mBatLevelPath.reset();
        mBatGoodPath.reset();
        mBatWarnPath.reset();
        mBatCriticalPath.reset();
        mScreenOnPath.reset();
        mGpsOnPath.reset();
        mWifiRunningPath.reset();
        mWakeLockPath.reset();
        mChargingPath.reset();
        long l1 = mHistStart;
        long l2 = mHistEnd - mHistStart;
        int k1 = mBatLow;
        int i2 = mBatHigh - mBatLow;
        int j2 = j - mLevelOffset - mLevelTop;
        mLevelBottom = j2 + mLevelTop;
        int k2 = 0;
        int i3 = -1;
        int j3 = -1;
        int k3 = 0;
        int l3 = mNumHist;
        boolean flag = mStats.startIteratingHistoryLocked();
        int i4 = 0;
        Path path = null;
        boolean flag1 = false;
        boolean flag2 = false;
        boolean flag3 = false;
        boolean flag4 = false;
        boolean flag5 = false;
        Path path1 = null;
        if (flag)
        {
            for (android.os.BatteryStats.HistoryItem historyitem = new android.os.BatteryStats.HistoryItem(); mStats.getNextHistoryLocked(historyitem) && k3 < l3; k3++)
            {
                if (historyitem.cmd == 1)
                {
                    k2 = (int)(((historyitem.time - l1) * (long)i) / l2);
                    int j4 = (j2 + mLevelTop) - ((historyitem.batteryLevel - k1) * (j2 - 1)) / i2;
                    if (i3 == k2)
                        continue;
                    if (j3 != j4)
                    {
                        byte byte0 = historyitem.batteryLevel;
                        Path path2;
                        if (byte0 <= 14)
                            path2 = mBatCriticalPath;
                        else
                        if (byte0 <= 29)
                            path2 = mBatWarnPath;
                        else
                            path2 = mBatGoodPath;
                        if (path2 != path1)
                        {
                            if (path1 != null)
                                path1.lineTo(k2, j4);
                            float f2 = k2;
                            float f3 = j4;
                            path2.moveTo(f2, f3);
                            path1 = path2;
                        } else
                        {
                            float f = k2;
                            float f1 = j4;
                            path2.lineTo(f, f1);
                        }
                        if (path == null)
                        {
                            path = mBatLevelPath;
                            path.moveTo(k2, j4);
                            i4 = k2;
                        } else
                        {
                            path.lineTo(k2, j4);
                        }
                        i3 = k2;
                        j3 = j4;
                    }
                    boolean flag6;
                    if ((0x80000 & historyitem.states) != 0)
                        flag6 = true;
                    else
                        flag6 = false;
                    if (flag6 != flag1)
                    {
                        if (flag6)
                            mChargingPath.moveTo(k2, j - mChargingOffset);
                        else
                            mChargingPath.lineTo(k2, j - mChargingOffset);
                        flag1 = flag6;
                    }
                    boolean flag7;
                    if ((0x100000 & historyitem.states) != 0)
                        flag7 = true;
                    else
                        flag7 = false;
                    if (flag7 != flag2)
                    {
                        if (flag7)
                            mScreenOnPath.moveTo(k2, j - mScreenOnOffset);
                        else
                            mScreenOnPath.lineTo(k2, j - mScreenOnOffset);
                        flag2 = flag7;
                    }
                    boolean flag8;
                    if ((0x10000000 & historyitem.states) != 0)
                        flag8 = true;
                    else
                        flag8 = false;
                    if (flag8 != flag3)
                    {
                        if (flag8)
                            mGpsOnPath.moveTo(k2, j - mGpsOnOffset);
                        else
                            mGpsOnPath.lineTo(k2, j - mGpsOnOffset);
                        flag3 = flag8;
                    }
                    boolean flag9;
                    if ((0x4000000 & historyitem.states) != 0)
                        flag9 = true;
                    else
                        flag9 = false;
                    if (flag9 != flag4)
                    {
                        if (flag9)
                            mWifiRunningPath.moveTo(k2, j - mWifiRunningOffset);
                        else
                            mWifiRunningPath.lineTo(k2, j - mWifiRunningOffset);
                        flag4 = flag9;
                    }
                    boolean flag10;
                    if ((0x40000000 & historyitem.states) != 0)
                        flag10 = true;
                    else
                        flag10 = false;
                    if (flag10 != flag5)
                    {
                        if (flag10)
                            mWakeLockPath.moveTo(k2, j - mWakeLockOffset);
                        else
                            mWakeLockPath.lineTo(k2, j - mWakeLockOffset);
                        flag5 = flag10;
                    }
                    if (!mLargeMode || !mHavePhoneSignal)
                        continue;
                    int k4;
                    if ((0xf00 & historyitem.states) >> 8 == 3)
                        k4 = 0;
                    else
                    if ((0x8000000 & historyitem.states) != 0)
                    {
                        k4 = 1;
                    } else
                    {
                        k4 = 2 + ((0xf0 & historyitem.states) >> 4);
                        Log.i("battery", (new StringBuilder()).append("bin  ").append(k4).toString());
                    }
                    Log.i("battery", (new StringBuilder()).append("addTick bin  ").append(k4).toString());
                    mPhoneSignalChart.addTick(k2, k4);
                    continue;
                }
                if (historyitem.cmd != 3 && path != null)
                {
                    finishPaths(k2 + 1, j, j2, i4, j3, path, i3, flag1, flag2, flag3, flag4, flag5, path1);
                    j3 = -1;
                    i3 = j3;
                    path = null;
                    flag1 = false;
                    flag2 = false;
                    flag3 = false;
                    flag5 = false;
                    path1 = null;
                }
            }

        }
        finishPaths(i, j, j2, i4, j3, path, i3, flag1, flag2, flag3, flag4, flag5, path1);
    }

    void setStats(BatteryStats batterystats)
    {
        mStats = batterystats;
        mStatsPeriod = mStats.computeBatteryRealtime(1000L * SystemClock.elapsedRealtime(), 0);
        String s = Utils.formatElapsedTime(getContext(), mStatsPeriod / 1000L);
        mDurationString = getContext().getString(0x7f0b0753, new Object[] {
            s
        });
        mChargingLabel = getContext().getString(0x7f0b0755);
        mScreenOnLabel = getContext().getString(0x7f0b0756);
        mGpsOnLabel = getContext().getString(0x7f0b0757);
        mWifiRunningLabel = getContext().getString(0x7f0b0758);
        mWakeLockLabel = getContext().getString(0x7f0b0759);
        mPhoneSignalLabel = getContext().getString(0x7f0b075a);
        int i = 0;
        byte byte0 = -1;
        mBatLow = 0;
        mBatHigh = 100;
        boolean flag = true;
        boolean flag1 = batterystats.startIteratingHistoryLocked();
        int j = 0;
        int k = 0;
        if (flag1)
        {
            android.os.BatteryStats.HistoryItem historyitem = new android.os.BatteryStats.HistoryItem();
            do
            {
                if (!batterystats.getNextHistoryLocked(historyitem))
                    break;
                i++;
                if (historyitem.cmd == 1)
                {
                    if (flag)
                    {
                        flag = false;
                        mHistStart = historyitem.time;
                    }
                    if (historyitem.batteryLevel != byte0 || i == 1)
                        byte0 = historyitem.batteryLevel;
                    k = i;
                    mHistEnd = historyitem.time;
                    j |= historyitem.states;
                }
            } while (true);
        }
        mNumHist = k;
        boolean flag2;
        if ((0x10000000 & j) != 0)
            flag2 = true;
        else
            flag2 = false;
        mHaveGps = flag2;
        boolean flag3;
        if ((0x4000000 & j) != 0)
            flag3 = true;
        else
            flag3 = false;
        mHaveWifi = flag3;
        if (!Utils.isWifiOnly(getContext()))
            mHavePhoneSignal = true;
        if (mHistEnd <= mHistStart)
            mHistEnd = 1L + mHistStart;
        mTotalDurationString = Utils.formatElapsedTime(getContext(), mHistEnd - mHistStart);
    }

    public void setTypeface(Typeface typeface, int i)
    {
        if (i > 0)
        {
            Typeface typeface1;
            if (typeface == null)
                typeface1 = Typeface.defaultFromStyle(i);
            else
                typeface1 = Typeface.create(typeface, i);
            mTextPaint.setTypeface(typeface1);
            int j;
            if (typeface1 != null)
                j = typeface1.getStyle();
            else
                j = 0;
            int k = i & ~j;
            TextPaint textpaint = mTextPaint;
            int l = k & 1;
            boolean flag = false;
            if (l != 0)
                flag = true;
            textpaint.setFakeBoldText(flag);
            TextPaint textpaint1 = mTextPaint;
            float f;
            if ((k & 2) != 0)
                f = -0.25F;
            else
                f = 0.0F;
            textpaint1.setTextSkewX(f);
            return;
        } else
        {
            mTextPaint.setFakeBoldText(false);
            mTextPaint.setTextSkewX(0.0F);
            mTextPaint.setTypeface(typeface);
            return;
        }
    }
}
