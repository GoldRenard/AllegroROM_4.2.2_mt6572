// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.View;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Iterator;

public class PieChartView extends View
{
    public class Slice
    {

        public Paint paint;
        public Path path;
        public Path pathOutline;
        public Path pathSide;
        final PieChartView this$0;
        public long value;

        public Slice(long l, int i)
        {
            this$0 = PieChartView.this;
            super();
            path = new Path();
            pathSide = new Path();
            pathOutline = new Path();
            value = l;
            paint = PieChartView.buildFillPaint(i, getResources());
        }
    }


    private static final boolean FILL_GRADIENT = false;
    public static final boolean LOGD = false;
    public static final String TAG = "PieChartView";
    private Matrix mMatrix;
    private int mOriginAngle;
    private Paint mPaintOutline;
    private Path mPathOutline;
    private Path mPathSide;
    private Path mPathSideOutline;
    private int mSideWidth;
    private ArrayList mSlices;

    public PieChartView(Context context)
    {
        this(context, null);
    }

    public PieChartView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public PieChartView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSlices = Lists.newArrayList();
        mMatrix = new Matrix();
        mPaintOutline = new Paint();
        mPathSide = new Path();
        mPathSideOutline = new Path();
        mPathOutline = new Path();
        mPaintOutline.setColor(0xff000000);
        mPaintOutline.setStyle(android.graphics.Paint.Style.STROKE);
        mPaintOutline.setStrokeWidth(3F * getResources().getDisplayMetrics().density);
        mPaintOutline.setAntiAlias(true);
        mSideWidth = (int)(20F * getResources().getDisplayMetrics().density);
        setWillNotDraw(false);
    }

    private static Paint buildFillPaint(int i, Resources resources)
    {
        Paint paint = new Paint();
        paint.setColor(i);
        paint.setStyle(android.graphics.Paint.Style.FILL_AND_STROKE);
        paint.setAntiAlias(true);
        return paint;
    }

    public static int darken(int i)
    {
        float af[] = new float[3];
        Color.colorToHSV(i, af);
        af[2] = af[2] / 2.0F;
        af[1] = af[1] / 2.0F;
        return Color.HSVToColor(af);
    }

    public void addSlice(long l, int i)
    {
        mSlices.add(new Slice(l, i));
    }

    public void generatePath()
    {
        long l = 0L;
        for (Iterator iterator = mSlices.iterator(); iterator.hasNext();)
        {
            Slice slice1 = (Slice)iterator.next();
            slice1.path.reset();
            slice1.pathSide.reset();
            slice1.pathOutline.reset();
            l += slice1.value;
        }

        mPathSide.reset();
        mPathSideOutline.reset();
        mPathOutline.reset();
        if (l == 0L)
        {
            invalidate();
            return;
        }
        int i = getWidth();
        int j = getHeight();
        RectF rectf = new RectF(0.0F, 0.0F, i, j);
        RectF rectf1 = new RectF();
        rectf1.set(rectf);
        rectf1.offset(-mSideWidth, 0.0F);
        mPathSide.addOval(rectf1, android.graphics.Path.Direction.CW);
        mPathSideOutline.addOval(rectf1, android.graphics.Path.Direction.CW);
        mPathOutline.addOval(rectf, android.graphics.Path.Direction.CW);
        int k = mOriginAngle;
        for (Iterator iterator1 = mSlices.iterator(); iterator1.hasNext();)
        {
            Slice slice = (Slice)iterator1.next();
            int i1 = (int)((360L * slice.value) / l);
            int j1 = k + i1;
            float f = k % 360;
            float f1 = j1 % 360;
            boolean flag;
            if (f > 90F && f < 270F)
                flag = true;
            else
                flag = false;
            boolean flag1;
            if (f1 > 90F && f1 < 270F)
                flag1 = true;
            else
                flag1 = false;
            slice.path.moveTo(rectf.centerX(), rectf.centerY());
            slice.path.arcTo(rectf, k, i1);
            slice.path.lineTo(rectf.centerX(), rectf.centerY());
            if (flag || flag1)
            {
                float f2;
                if (flag)
                    f2 = k;
                else
                    f2 = 450F;
                float f3;
                if (flag1)
                    f3 = j1;
                else
                    f3 = 270F;
                float f4 = f3 - f2;
                slice.pathSide.moveTo(rectf.centerX(), rectf.centerY());
                slice.pathSide.arcTo(rectf, f2, 0.0F);
                slice.pathSide.rLineTo(-mSideWidth, 0.0F);
                slice.pathSide.arcTo(rectf1, f2, f4);
                slice.pathSide.rLineTo(mSideWidth, 0.0F);
                slice.pathSide.arcTo(rectf, f3, -f4);
            }
            slice.pathOutline.moveTo(rectf.centerX(), rectf.centerY());
            slice.pathOutline.arcTo(rectf, k, 0.0F);
            if (flag)
                slice.pathOutline.rLineTo(-mSideWidth, 0.0F);
            slice.pathOutline.moveTo(rectf.centerX(), rectf.centerY());
            slice.pathOutline.arcTo(rectf, k + i1, 0.0F);
            if (flag1)
                slice.pathOutline.rLineTo(-mSideWidth, 0.0F);
            k += i1;
        }

        invalidate();
    }

    protected void onDraw(Canvas canvas)
    {
        canvas.concat(mMatrix);
        Slice slice1;
        for (Iterator iterator = mSlices.iterator(); iterator.hasNext(); canvas.drawPath(slice1.pathSide, slice1.paint))
            slice1 = (Slice)iterator.next();

        canvas.drawPath(mPathSideOutline, mPaintOutline);
        Slice slice;
        for (Iterator iterator1 = mSlices.iterator(); iterator1.hasNext(); canvas.drawPath(slice.pathOutline, mPaintOutline))
        {
            slice = (Slice)iterator1.next();
            canvas.drawPath(slice.path, slice.paint);
        }

        canvas.drawPath(mPathOutline, mPaintOutline);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        float f = getWidth() / 2;
        float f1 = getHeight() / 2;
        mMatrix.reset();
        mMatrix.postScale(0.665F, 0.95F, f, f1);
        mMatrix.postRotate(-40F, f, f1);
        generatePath();
    }

    public void removeAllSlices()
    {
        mSlices.clear();
    }

    public void setOriginAngle(int i)
    {
        mOriginAngle = i;
    }

}
