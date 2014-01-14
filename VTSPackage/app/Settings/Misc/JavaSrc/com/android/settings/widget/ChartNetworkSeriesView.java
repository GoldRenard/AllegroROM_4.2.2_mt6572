// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.net.NetworkStatsHistory;
import android.util.*;
import android.view.View;
import com.google.common.base.Preconditions;

// Referenced classes of package com.android.settings.widget:
//            ChartAxis

public class ChartNetworkSeriesView extends View
{

    private static final boolean ESTIMATE_ENABLED = false;
    private static final boolean LOGD = true;
    private static final String TAG = "ChartNetworkSeriesView";
    private long mEnd;
    private long mEndTime;
    private boolean mEstimateVisible;
    private ChartAxis mHoriz;
    private long mMax;
    private long mMaxEstimate;
    private Paint mPaintEstimate;
    private Paint mPaintFill;
    private Paint mPaintFillSecondary;
    private Paint mPaintStroke;
    private Path mPathEstimate;
    private Path mPathFill;
    private Path mPathStroke;
    private boolean mPathValid;
    private long mPrimaryLeft;
    private long mPrimaryRight;
    private long mStart;
    private NetworkStatsHistory mStats;
    private ChartAxis mVert;

    public ChartNetworkSeriesView(Context context)
    {
        this(context, null, 0);
    }

    public ChartNetworkSeriesView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartNetworkSeriesView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mEndTime = 0x8000000000000000L;
        mPathValid = false;
        mEstimateVisible = false;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartNetworkSeriesView, i, 0);
        setChartColor(typedarray.getColor(0, 0xffff0000), typedarray.getColor(1, 0xffff0000), typedarray.getColor(2, 0xffff0000));
        setWillNotDraw(false);
        typedarray.recycle();
        mPathStroke = new Path();
        mPathFill = new Path();
        mPathEstimate = new Path();
    }

    private void generatePath()
    {
        Log.d("ChartNetworkSeriesView", "generatePath()");
        mMax = 0L;
        mPathStroke.reset();
        mPathFill.reset();
        mPathEstimate.reset();
        mPathValid = true;
        if (mStats != null && mStats.size() >= 1)
        {
            getWidth();
            int i = getHeight();
            float f = 0.0F;
            float f1 = i;
            long l = mHoriz.convertToValue(0.0F);
            mPathStroke.moveTo(0.0F, f1);
            mPathFill.moveTo(0.0F, f1);
            long l1 = 0L;
            android.net.NetworkStatsHistory.Entry entry = null;
            int j = mStats.getIndexBefore(mStart);
            int k = mStats.getIndexAfter(mEnd);
            for (int i1 = j; i1 <= k; i1++)
            {
                entry = mStats.getValues(i1, entry);
                long l2 = entry.bucketStart;
                long l3 = l2 + entry.bucketDuration;
                float f2 = mHoriz.convertToPoint(l2);
                float f3 = mHoriz.convertToPoint(l3);
                if (f3 < 0.0F)
                    continue;
                l1 += entry.rxBytes + entry.txBytes;
                float f4 = f1;
                float f5 = mVert.convertToPoint(l1);
                if (l != l2)
                {
                    mPathStroke.lineTo(f2, f4);
                    mPathFill.lineTo(f2, f4);
                }
                mPathStroke.lineTo(f3, f5);
                mPathFill.lineTo(f3, f5);
                f = f3;
                f1 = f5;
                l = l3;
            }

            if (l < mEndTime)
            {
                f = mHoriz.convertToPoint(mEndTime);
                mPathStroke.lineTo(f, f1);
                mPathFill.lineTo(f, f1);
            }
            RectF rectf = new RectF();
            mPathFill.computeBounds(rectf, true);
            Log.d("ChartNetworkSeriesView", (new StringBuilder()).append("onLayout() rendered with bounds=").append(rectf.toString()).append(" and totalData=").append(l1).toString());
            mPathFill.lineTo(f, i);
            mPathFill.lineTo(0.0F, i);
            mMax = l1;
            invalidate();
            return;
        } else
        {
            return;
        }
    }

    public void bindNetworkStats(NetworkStatsHistory networkstatshistory)
    {
        mStats = networkstatshistory;
        invalidatePath();
        invalidate();
    }

    public long getMaxEstimate()
    {
        return mMaxEstimate;
    }

    public long getMaxVisible()
    {
        long l;
        if (mEstimateVisible)
            l = mMaxEstimate;
        else
            l = mMax;
        if (l <= 0L && mStats != null)
        {
            android.net.NetworkStatsHistory.Entry entry = mStats.getValues(mStart, mEnd, null);
            l = entry.rxBytes + entry.txBytes;
        }
        return l;
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
        float f = mHoriz.convertToPoint(mPrimaryLeft);
        float f1 = mHoriz.convertToPoint(mPrimaryRight);
        if (mEstimateVisible)
        {
            int l = canvas.save();
            canvas.clipRect(0, 0, getWidth(), getHeight());
            canvas.drawPath(mPathEstimate, mPaintEstimate);
            canvas.restoreToCount(l);
        }
        int i = canvas.save();
        canvas.clipRect(0.0F, 0.0F, f, getHeight());
        canvas.drawPath(mPathFill, mPaintFillSecondary);
        canvas.restoreToCount(i);
        int j = canvas.save();
        canvas.clipRect(f1, 0.0F, getWidth(), getHeight());
        canvas.drawPath(mPathFill, mPaintFillSecondary);
        canvas.restoreToCount(j);
        int k = canvas.save();
        canvas.clipRect(f, 0.0F, f1, getHeight());
        canvas.drawPath(mPathFill, mPaintFill);
        canvas.drawPath(mPathStroke, mPaintStroke);
        canvas.restoreToCount(k);
    }

    public void setBounds(long l, long l1)
    {
        mStart = l;
        mEnd = l1;
    }

    public void setChartColor(int i, int j, int k)
    {
        mPaintStroke = new Paint();
        mPaintStroke.setStrokeWidth(4F * getResources().getDisplayMetrics().density);
        mPaintStroke.setColor(i);
        mPaintStroke.setStyle(android.graphics.Paint.Style.STROKE);
        mPaintStroke.setAntiAlias(true);
        mPaintFill = new Paint();
        mPaintFill.setColor(j);
        mPaintFill.setStyle(android.graphics.Paint.Style.FILL);
        mPaintFill.setAntiAlias(true);
        mPaintFillSecondary = new Paint();
        mPaintFillSecondary.setColor(k);
        mPaintFillSecondary.setStyle(android.graphics.Paint.Style.FILL);
        mPaintFillSecondary.setAntiAlias(true);
        mPaintEstimate = new Paint();
        mPaintEstimate.setStrokeWidth(3F);
        mPaintEstimate.setColor(k);
        mPaintEstimate.setStyle(android.graphics.Paint.Style.STROKE);
        mPaintEstimate.setAntiAlias(true);
        mPaintEstimate.setPathEffect(new DashPathEffect(new float[] {
            10F, 10F
        }, 1.0F));
    }

    public void setEndTime(long l)
    {
        mEndTime = l;
    }

    public void setEstimateVisible(boolean flag)
    {
        mEstimateVisible = false;
        invalidate();
    }

    public void setPrimaryRange(long l, long l1)
    {
        mPrimaryLeft = l;
        mPrimaryRight = l1;
        invalidate();
    }
}
