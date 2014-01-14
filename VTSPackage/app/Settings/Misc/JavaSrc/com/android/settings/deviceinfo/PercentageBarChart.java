// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.deviceinfo;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import java.util.Collection;
import java.util.Iterator;

public class PercentageBarChart extends View
{
    public static class Entry
        implements Comparable
    {

        public final int order;
        public final Paint paint;
        public final float percentage;

        public int compareTo(Entry entry)
        {
            return order - entry.order;
        }

        public volatile int compareTo(Object obj)
        {
            return compareTo((Entry)obj);
        }

        protected Entry(int i, float f, Paint paint1)
        {
            order = i;
            percentage = f;
            paint = paint1;
        }
    }


    private final Paint mEmptyPaint = new Paint();
    private Collection mEntries;
    private int mMinTickWidth;

    public PercentageBarChart(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mMinTickWidth = 1;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.PercentageBarChart);
        mMinTickWidth = typedarray.getDimensionPixelSize(1, 1);
        int i = typedarray.getColor(0, 0xff000000);
        typedarray.recycle();
        mEmptyPaint.setColor(i);
        mEmptyPaint.setStyle(android.graphics.Paint.Style.FILL);
    }

    public static Entry createEntry(int i, float f, int j)
    {
        Paint paint = new Paint();
        paint.setColor(j);
        paint.setStyle(android.graphics.Paint.Style.FILL);
        return new Entry(i, f, paint);
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = getPaddingLeft();
        int j = getWidth() - getPaddingRight();
        int k = getPaddingTop();
        int l = getHeight() - getPaddingBottom();
        int i1 = j - i;
        if (isLayoutRtl())
        {
            float f9 = j;
            if (mEntries != null)
            {
                for (Iterator iterator1 = mEntries.iterator(); iterator1.hasNext();)
                {
                    Entry entry1 = (Entry)iterator1.next();
                    float f13;
                    if (entry1.percentage == 0.0F)
                        f13 = 0.0F;
                    else
                        f13 = Math.max(mMinTickWidth, (float)i1 * entry1.percentage);
                    float f14 = f9 - f13;
                    if (f14 < (float)i)
                    {
                        canvas.drawRect(i, k, f9, l, entry1.paint);
                        return;
                    }
                    canvas.drawRect(f14, k, f9, l, entry1.paint);
                    f9 = f14;
                }

            }
            float f10 = i;
            float f11 = k;
            float f12 = l;
            Paint paint2 = mEmptyPaint;
            canvas.drawRect(f10, f11, f9, f12, paint2);
            return;
        }
        float f = i;
        if (mEntries != null)
        {
            for (Iterator iterator = mEntries.iterator(); iterator.hasNext();)
            {
                Entry entry = (Entry)iterator.next();
                float f4;
                if (entry.percentage == 0.0F)
                    f4 = 0.0F;
                else
                    f4 = Math.max(mMinTickWidth, (float)i1 * entry.percentage);
                float f5 = f + f4;
                if (f5 > (float)j)
                {
                    float f6 = k;
                    float f7 = j;
                    float f8 = l;
                    Paint paint1 = entry.paint;
                    canvas.drawRect(f, f6, f7, f8, paint1);
                    return;
                }
                canvas.drawRect(f, k, f5, l, entry.paint);
                f = f5;
            }

        }
        float f1 = k;
        float f2 = j;
        float f3 = l;
        Paint paint = mEmptyPaint;
        canvas.drawRect(f, f1, f2, f3, paint);
    }

    public void setBackgroundColor(int i)
    {
        mEmptyPaint.setColor(i);
    }

    public void setEntries(Collection collection)
    {
        mEntries = collection;
    }
}
