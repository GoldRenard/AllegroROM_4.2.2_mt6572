// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.*;
import android.net.NetworkStats;
import android.util.AttributeSet;
import android.view.View;
import com.android.settings.widget.ChartAxis;
import com.google.common.base.Preconditions;
import com.mediatek.xlog.Xlog;

public class ChartBandwidthNetworkSeriesView extends View
{

    private static final long MB_IN_BYTES = 0x100000L;
    private static final String TAG = "ChartBandwidthNetworkSeriesView";
    private static final int TOTAL_LEN = 90;
    private long mCurrentBytes[];
    private int mCurrentLen;
    private long mEnd;
    private long mEndTime;
    private ChartAxis mHoriz;
    private long mLeftBound;
    private long mMax;
    private Paint mPaintStroke;
    private Path mPathStroke;
    private boolean mPathValid;
    private long mStart;
    private NetworkStats mStats;
    private long mTotalUsed;
    private ChartAxis mVert;

    public ChartBandwidthNetworkSeriesView(Context context)
    {
        this(context, null, 0);
    }

    public ChartBandwidthNetworkSeriesView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartBandwidthNetworkSeriesView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mEndTime = 0x8000000000000000L;
        mPathValid = false;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartNetworkSeriesView, i, 0);
        setSeriesColor(typedarray.getColor(0, 0xffff0000));
        setWillNotDraw(false);
        typedarray.recycle();
        mPathStroke = new Path();
        mCurrentBytes = new long[90];
        mCurrentLen = 0;
    }

    public void generatePath()
    {
        long l = getMaxBytes();
        mMax = 0L;
        mPathStroke.reset();
        if (mStats != null && mStats.size() >= 1)
        {
            mPathValid = true;
            android.net.NetworkStats.Entry entry = mStats.getValues(0, null);
            long l1 = entry.rxBytes + entry.txBytes;
            long l2;
            if (mTotalUsed == 0L)
                l2 = 0L;
            else
                l2 = l1 - mTotalUsed;
            mTotalUsed = l1;
            Xlog.d("ChartBandwidthNetworkSeriesView", (new StringBuilder()).append("currentData = ").append(l2).toString());
            if (mCurrentLen < 90)
            {
                mCurrentBytes[mCurrentLen] = l2;
                mCurrentLen = 1 + mCurrentLen;
            } else
            {
                System.arraycopy(mCurrentBytes, 1, mCurrentBytes, 0, 89);
                mCurrentBytes[89] = l2;
            }
            mPathStroke.moveTo(mHoriz.convertToPoint(1 + (100 - mCurrentLen)), mVert.convertToPoint(100L * (mCurrentBytes[0] / l)));
            for (int i = 0; i < mCurrentLen; i++)
            {
                mPathStroke.lineTo(mHoriz.convertToPoint(i + (1 + (100 - mCurrentLen))), mVert.convertToPoint(mCurrentBytes[i]));
                long l3;
                if (mMax < mCurrentBytes[i])
                    l3 = mCurrentBytes[i];
                else
                    l3 = mMax;
                mMax = l3;
            }

            invalidate();
            return;
        } else
        {
            return;
        }
    }

    public long getMaxBytes()
    {
        long l = 0x100000L;
        if (mMax > l)
            l = mMax;
        return l;
    }

    public long getTotalUsedData()
    {
        return mTotalUsed;
    }

    void init(ChartAxis chartaxis, ChartAxis chartaxis1)
    {
        mHoriz = (ChartAxis)Preconditions.checkNotNull(chartaxis, "missing horiz");
        mVert = (ChartAxis)Preconditions.checkNotNull(chartaxis1, "missing vert");
    }

    public void invalidatePath()
    {
        mPathValid = false;
        mMax = 0L;
        invalidate();
    }

    protected void onDraw(Canvas canvas)
    {
        if (!mPathValid)
            generatePath();
        float f = mHoriz.convertToPoint(0L);
        float f1 = mHoriz.convertToPoint(100L);
        int i = canvas.save();
        canvas.clipRect(f, 0.0F, f1, getHeight());
        canvas.drawPath(mPathStroke, mPaintStroke);
        canvas.restoreToCount(i);
    }

    public void setNetworkStates(NetworkStats networkstats)
    {
        mStats = networkstats;
        generatePath();
    }

    public void setSeriesColor(int i)
    {
        mPaintStroke = new Paint();
        mPaintStroke.setStrokeWidth(3F);
        mPaintStroke.setColor(i);
        mPaintStroke.setStyle(android.graphics.Paint.Style.STROKE);
        mPaintStroke.setAntiAlias(true);
    }
}
