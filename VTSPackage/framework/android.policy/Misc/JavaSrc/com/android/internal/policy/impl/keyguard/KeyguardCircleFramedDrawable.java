// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.graphics.*;
import android.graphics.drawable.Drawable;

class KeyguardCircleFramedDrawable extends Drawable
{

    private final Bitmap mBitmap;
    private RectF mDstRect;
    private final int mFrameColor;
    private Path mFramePath;
    private RectF mFrameRect;
    private final int mFrameShadowColor;
    private final int mHighlightColor;
    private final Paint mPaint = new Paint();
    private boolean mPressed;
    private float mScale;
    private final float mShadowRadius;
    private final int mSize;
    private Rect mSrcRect;
    private final float mStrokeWidth;

    public KeyguardCircleFramedDrawable(Bitmap bitmap, int i, int j, float f, int k, float f1, int l)
    {
        mSize = i;
        mShadowRadius = f1;
        mFrameColor = j;
        mFrameShadowColor = k;
        mStrokeWidth = f;
        mHighlightColor = l;
        mBitmap = Bitmap.createBitmap(mSize, mSize, android.graphics.Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(mBitmap);
        int i1 = bitmap.getWidth();
        int j1 = bitmap.getHeight();
        int k1 = Math.min(i1, j1);
        Rect rect = new Rect((i1 - k1) / 2, (j1 - k1) / 2, k1, k1);
        RectF rectf = new RectF(0.0F, 0.0F, mSize, mSize);
        rectf.inset(mStrokeWidth / 2.0F, mStrokeWidth / 2.0F);
        rectf.inset(mShadowRadius, mShadowRadius);
        Path path = new Path();
        path.addArc(rectf, 0.0F, 360F);
        canvas.drawColor(0, android.graphics.PorterDuff.Mode.CLEAR);
        mPaint.setAntiAlias(true);
        mPaint.setColor(0xff000000);
        mPaint.setStyle(android.graphics.Paint.Style.FILL);
        canvas.drawPath(path, mPaint);
        mPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.SRC_ATOP));
        canvas.drawBitmap(bitmap, rect, rectf, mPaint);
        mPaint.setXfermode(null);
        mScale = 1.0F;
        mSrcRect = new Rect(0, 0, mSize, mSize);
        mDstRect = new RectF(0.0F, 0.0F, mSize, mSize);
        mFrameRect = new RectF(mDstRect);
        mFramePath = new Path();
    }

    public void draw(Canvas canvas)
    {
        float f = Math.min(canvas.getWidth(), canvas.getHeight());
        float f1 = (f - f * mScale) / 2.0F;
        mDstRect.set(f1, f1, f - f1, f - f1);
        canvas.drawBitmap(mBitmap, mSrcRect, mDstRect, null);
        mFrameRect.set(mDstRect);
        mFrameRect.inset(mStrokeWidth / 2.0F, mStrokeWidth / 2.0F);
        mFrameRect.inset(mShadowRadius, mShadowRadius);
        mFramePath.reset();
        mFramePath.addArc(mFrameRect, 0.0F, 360F);
        if (mPressed)
        {
            mPaint.setStyle(android.graphics.Paint.Style.FILL);
            mPaint.setColor(Color.argb(84, Color.red(mHighlightColor), Color.green(mHighlightColor), Color.blue(mHighlightColor)));
            canvas.drawPath(mFramePath, mPaint);
        }
        mPaint.setStrokeWidth(mStrokeWidth);
        mPaint.setStyle(android.graphics.Paint.Style.STROKE);
        Paint paint = mPaint;
        int i;
        if (mPressed)
            i = mHighlightColor;
        else
            i = mFrameColor;
        paint.setColor(i);
        mPaint.setShadowLayer(mShadowRadius, 0.0F, 0.0F, mFrameShadowColor);
        canvas.drawPath(mFramePath, mPaint);
    }

    public int getOpacity()
    {
        return -3;
    }

    public float getScale()
    {
        return mScale;
    }

    public void setAlpha(int i)
    {
    }

    public void setColorFilter(ColorFilter colorfilter)
    {
    }

    public void setPressed(boolean flag)
    {
        mPressed = flag;
    }

    public void setScale(float f)
    {
        mScale = f;
    }
}
