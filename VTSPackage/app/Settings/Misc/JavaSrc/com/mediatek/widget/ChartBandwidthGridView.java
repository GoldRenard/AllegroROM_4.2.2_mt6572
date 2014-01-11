// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import com.android.settings.widget.ChartAxis;
import com.google.common.base.Preconditions;

public class ChartBandwidthGridView extends View
{

    public static final String TAG = "ChartBandwidthGridView";
    private ChartAxis mHoriz;
    private Drawable mSecondary;
    private ChartAxis mVert;

    public ChartBandwidthGridView(Context context)
    {
        this(context, null, 0);
    }

    public ChartBandwidthGridView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartBandwidthGridView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        setWillNotDraw(false);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartGridView, i, 0);
        mSecondary = typedarray.getDrawable(1);
        typedarray.recycle();
    }

    void init(ChartAxis chartaxis, ChartAxis chartaxis1)
    {
        mHoriz = (ChartAxis)Preconditions.checkNotNull(chartaxis, "missing horiz");
        mVert = (ChartAxis)Preconditions.checkNotNull(chartaxis1, "missing vert");
    }

    protected void onDraw(Canvas canvas)
    {
        int i = getWidth();
        int j = getHeight();
        Paint paint = new Paint();
        paint.setColor(0xff669900);
        paint.setStyle(android.graphics.Paint.Style.STROKE);
        Drawable drawable = mSecondary;
        int k = mSecondary.getIntrinsicHeight();
        float af[] = mVert.getTickPoints();
        int l = af.length;
        for (int i1 = 0; i1 < l; i1++)
        {
            float f1 = af[i1];
            int l1 = (int)Math.min(f1 + (float)k, j);
            drawable.setBounds(0, (int)f1, i, l1);
            drawable.draw(canvas);
        }

        float af1[] = mHoriz.getTickPoints();
        int j1 = af1.length;
        for (int k1 = 0; k1 < j1; k1++)
        {
            float f = af1[k1];
            canvas.drawLine(f, 0.0F, f, j, paint);
        }

        canvas.drawLine(mHoriz.convertToPoint(100L), 0.0F, mHoriz.convertToPoint(100L), j, paint);
        Paint paint1 = new Paint();
        paint1.setColor(0xff696969);
        canvas.drawLine(0.0F, 0.0F, i, 0.0F, paint1);
    }

    void setBounds(long l, long l1)
    {
        getContext();
        invalidate();
    }
}
