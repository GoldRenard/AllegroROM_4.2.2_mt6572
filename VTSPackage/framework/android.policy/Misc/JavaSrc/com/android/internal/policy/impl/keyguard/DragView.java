// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.graphics.*;
import android.util.Log;
import android.view.View;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            LockScreenLayout

public class DragView extends View
{

    private static final boolean DEBUG = true;
    private static final String TAG = "DragView";
    private Bitmap mBitmap;
    private LockScreenLayout mLockScreenLayout;
    private Paint mPaint;
    private int mRegistrationX;
    private int mRegistrationY;

    public DragView(LockScreenLayout lockscreenlayout, Bitmap bitmap, int i, int j, int k, int l, int i1, 
            int j1, float f)
    {
        super(lockscreenlayout.getContext());
        mLockScreenLayout = null;
        mLockScreenLayout = lockscreenlayout;
        mBitmap = Bitmap.createBitmap(bitmap, k, l, i1, j1);
        mRegistrationX = i;
        mRegistrationY = j;
        Log.d("DragView", (new StringBuilder()).append("DragView constructor: mRegistrationX = ").append(mRegistrationX).append(", mRegistrationY = ").append(mRegistrationY).append(", this = ").append(this).toString());
        int k1 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        measure(k1, k1);
        mPaint = new Paint(2);
    }

    void move(float f, float f1)
    {
        Log.d("DragView", (new StringBuilder()).append("move touchX=").append(f).append(", touchY=").append(f1).toString());
        setTranslationX(f - (float)mRegistrationX);
        setTranslationY(f1 - (float)mRegistrationY);
    }

    protected void onDraw(Canvas canvas)
    {
        canvas.drawBitmap(mBitmap, 0.0F, 0.0F, mPaint);
    }

    protected void onMeasure(int i, int j)
    {
        setMeasuredDimension(mBitmap.getWidth(), mBitmap.getHeight());
    }

    void remove()
    {
        Log.d("DragView", (new StringBuilder()).append("remove DragView: this = ").append(this).toString());
        if (getParent() != null)
        {
            setDrawingCacheEnabled(false);
            mLockScreenLayout.removeView(this);
        }
    }

    public void show(int i, int j)
    {
        mLockScreenLayout.addView(this);
        setDrawingCacheEnabled(true);
        LockScreenLayout.LayoutParams layoutparams = new LockScreenLayout.LayoutParams(0, 0);
        layoutparams.width = mBitmap.getWidth();
        layoutparams.height = mBitmap.getHeight();
        layoutparams.x = mRegistrationX;
        layoutparams.y = mRegistrationY;
        layoutparams.customPosition = true;
        setLayoutParams(layoutparams);
        setTranslationX(i - mRegistrationX);
        setTranslationY(j - mRegistrationY);
    }
}
