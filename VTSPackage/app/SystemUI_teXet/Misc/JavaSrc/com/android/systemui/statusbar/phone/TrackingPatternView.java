// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.systemui.statusbar.phone;

import android.content.Context;
import android.graphics.*;
import android.util.AttributeSet;
import android.view.View;

public class TrackingPatternView extends View
{

    private Paint mPaint;
    private Bitmap mTexture;
    private int mTextureHeight;
    private int mTextureWidth;

    public TrackingPatternView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTexture = BitmapFactory.decodeResource(getResources(), 0x108056f);
        mTextureWidth = mTexture.getWidth();
        mTextureHeight = mTexture.getHeight();
        mPaint = new Paint();
        mPaint.setDither(false);
    }

    public void onDraw(Canvas canvas)
    {
        Bitmap bitmap = mTexture;
        Paint paint = mPaint;
        int i = getWidth();
        int j = getHeight();
        int k = mTextureWidth;
        int l = mTextureHeight;
        for (int i1 = 0; i1 < i; i1 += k)
        {
            for (int j1 = 0; j1 < j; j1 += l)
                canvas.drawBitmap(bitmap, i1, j1, paint);

        }

    }
}
