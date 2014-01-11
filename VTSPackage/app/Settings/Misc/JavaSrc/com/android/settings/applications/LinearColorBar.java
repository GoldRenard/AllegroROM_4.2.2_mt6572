// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.applications;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.*;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.widget.LinearLayout;

public class LinearColorBar extends LinearLayout
{

    private static final int BLUE_COLOR = 0xff0099cc;
    private static final int GRAY_COLOR = 0xff888888;
    final Paint mColorGradientPaint = new Paint();
    final Path mColorPath = new Path();
    final Paint mEdgeGradientPaint = new Paint();
    final Path mEdgePath = new Path();
    private float mGreenRatio;
    int mLastInterestingLeft;
    int mLastInterestingRight;
    private int mLeftColor;
    int mLineWidth;
    private int mMiddleColor;
    final Paint mPaint = new Paint();
    final Rect mRect = new Rect();
    private float mRedRatio;
    private int mRightColor;
    private boolean mShowingGreen;
    private float mYellowRatio;

    public LinearColorBar(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mLeftColor = 0xff0099cc;
        mMiddleColor = 0xff0099cc;
        mRightColor = 0xff888888;
        setWillNotDraw(false);
        mPaint.setStyle(android.graphics.Paint.Style.FILL);
        mColorGradientPaint.setStyle(android.graphics.Paint.Style.FILL);
        mColorGradientPaint.setAntiAlias(true);
        mEdgeGradientPaint.setStyle(android.graphics.Paint.Style.STROKE);
        int i;
        if (getResources().getDisplayMetrics().densityDpi >= 240)
            i = 2;
        else
            i = 1;
        mLineWidth = i;
        mEdgeGradientPaint.setStrokeWidth(mLineWidth);
        mEdgeGradientPaint.setAntiAlias(true);
    }

    private void updateIndicator()
    {
        int i = getContext().getResources().getThemeMainColor();
        if (i != 0)
        {
            mLeftColor = i;
            mMiddleColor = i;
        }
        int j = getPaddingTop() - getPaddingBottom();
        if (j < 0)
            j = 0;
        mRect.top = j;
        mRect.bottom = getHeight();
        if (mShowingGreen)
            mColorGradientPaint.setShader(new LinearGradient(0.0F, 0.0F, 0.0F, j - 2, 0xffffff & mRightColor, mRightColor, android.graphics.Shader.TileMode.CLAMP));
        else
            mColorGradientPaint.setShader(new LinearGradient(0.0F, 0.0F, 0.0F, j - 2, 0xffffff & mMiddleColor, mMiddleColor, android.graphics.Shader.TileMode.CLAMP));
        mEdgeGradientPaint.setShader(new LinearGradient(0.0F, 0.0F, 0.0F, j / 2, 0xa0a0a0, 0xffa0a0a0, android.graphics.Shader.TileMode.CLAMP));
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = getWidth();
        int j = 0 + (int)((float)i * mRedRatio);
        int k = j + (int)((float)i * mYellowRatio);
        int l = k + (int)((float)i * mGreenRatio);
        int i1;
        int j1;
        if (mShowingGreen)
        {
            i1 = k;
            j1 = l;
        } else
        {
            i1 = j;
            j1 = k;
        }
        if (mLastInterestingLeft != i1 || mLastInterestingRight != j1)
        {
            mColorPath.reset();
            mEdgePath.reset();
            if (i1 < j1)
            {
                int i2 = mRect.top;
                mColorPath.moveTo(i1, mRect.top);
                mColorPath.cubicTo(i1, 0.0F, -2F, i2, -2F, 0.0F);
                mColorPath.lineTo(-1 + (i + 2), 0.0F);
                mColorPath.cubicTo(-1 + (i + 2), i2, j1, 0.0F, j1, mRect.top);
                mColorPath.close();
                float f = 0.5F + (float)mLineWidth;
                mEdgePath.moveTo(-2F + f, 0.0F);
                mEdgePath.cubicTo(-2F + f, i2, f + (float)i1, 0.0F, f + (float)i1, mRect.top);
                mEdgePath.moveTo((float)(-1 + (i + 2)) - f, 0.0F);
                mEdgePath.cubicTo((float)(-1 + (i + 2)) - f, i2, (float)j1 - f, 0.0F, (float)j1 - f, mRect.top);
            }
            mLastInterestingLeft = i1;
            mLastInterestingRight = j1;
        }
        if (!mEdgePath.isEmpty())
        {
            canvas.drawPath(mEdgePath, mEdgeGradientPaint);
            canvas.drawPath(mColorPath, mColorGradientPaint);
        }
        int k1 = 0;
        if (j < 0)
        {
            mRect.left = 0;
            mRect.right = j;
            mPaint.setColor(mLeftColor);
            canvas.drawRect(mRect, mPaint);
            i -= j - 0;
            k1 = j;
        }
        if (k1 < k)
        {
            mRect.left = k1;
            mRect.right = k;
            mPaint.setColor(mMiddleColor);
            canvas.drawRect(mRect, mPaint);
            i -= k - k1;
            k1 = k;
        }
        int l1 = k1 + i;
        if (k1 < l1)
        {
            mRect.left = k1;
            mRect.right = l1;
            mPaint.setColor(mRightColor);
            canvas.drawRect(mRect, mPaint);
        }
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        updateIndicator();
    }

    public void setRatios(float f, float f1, float f2)
    {
        mRedRatio = f;
        mYellowRatio = f1;
        mGreenRatio = f2;
        invalidate();
    }

    public void setShowingGreen(boolean flag)
    {
        if (mShowingGreen != flag)
        {
            mShowingGreen = flag;
            updateIndicator();
            invalidate();
        }
    }
}
