// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.mediatek.lockscreensettings;

import android.content.Context;
import android.graphics.*;
import android.util.LongSparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;
import java.lang.ref.WeakReference;

public abstract class ReflectionDecorAdapter extends BaseAdapter
{

    private static final boolean DBG = true;
    private static final float DEFAULT_REFLECTION = 0.1F;
    private static final int DEFAULT_REFLECTION_GAP = 4;
    private static final int END_GRADIENT_COLOR = 0xffffff;
    private static final int START_GRADIENT_COLOR = 0x80ffffff;
    private static final String TAG = "ReflectionDecorAdapter";
    private final LongSparseArray mBitmapCache = new LongSparseArray();
    private Context mContext;
    private int mCurrentChosen;
    private int mDispHeight;
    private int mDispWidth;
    private int mEndGradientColor;
    private Paint mGradientPaint;
    private Bitmap mIndicatorBitmap;
    private int mIndicatorResId;
    private final Object mLock = new Object();
    private Paint mNormalPaint;
    private float mReflection;
    private int mStartGradientColor;
    private int mTotalDispHeight;
    private Matrix mTransMatrix;

    public ReflectionDecorAdapter(Context context)
    {
        mReflection = 0.1F;
        mStartGradientColor = 0x80ffffff;
        mEndGradientColor = 0xffffff;
        mTransMatrix = new Matrix();
        mNormalPaint = new Paint();
        mIndicatorResId = -1;
        mContext = context;
    }

    private void decorAndSetContent(ImageView imageview, Bitmap bitmap, int i)
    {
        Bitmap bitmap1 = getCachedBitmap(mBitmapCache, i);
        if (bitmap1 == null) goto _L2; else goto _L1
_L1:
        imageview.setImageBitmap(bitmap1);
        Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("decorAndSetContent return cached bitmap: position = ").append(i).append(",cacheBitmap = ").append(bitmap1).toString());
_L5:
        return;
_L2:
        int j;
        int k;
        Bitmap bitmap2;
        boolean flag;
        j = bitmap.getWidth();
        k = bitmap.getHeight();
        Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("decorAndSetContent: position = ").append(i).append(",width = ").append(j).append(",height = ").append(k).append(",mReflection = ").append(mReflection).append(",mDispWidth= ").append(mDispWidth).append(",mDispHeight = ").append(mDispHeight).toString());
        bitmap2 = bitmap;
        flag = false;
        if (mDispWidth != 0 && mDispHeight != 0) goto _L4; else goto _L3
_L3:
        mDispWidth = j;
        mDispHeight = k;
        mTotalDispHeight = (int)((float)mDispHeight * (1.0F + mReflection));
_L8:
        int l;
        if (mReflection > 0.0F || mReflection < 0.0F)
        {
            mTransMatrix.reset();
            mTransMatrix.preScale(1.0F, -1F);
            Bitmap bitmap3 = Bitmap.createBitmap(bitmap2, 0, (int)((float)mDispHeight * (1.0F - mReflection)), mDispWidth, (int)((float)mDispHeight * mReflection), mTransMatrix, false);
            Bitmap bitmap4 = Bitmap.createBitmap(mDispWidth, mTotalDispHeight, android.graphics.Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap4);
            canvas.drawBitmap(bitmap2, 0.0F, 0.0F, null);
            if (i == mCurrentChosen && mIndicatorBitmap != null)
                canvas.drawBitmap(mIndicatorBitmap, 0.0F, 0.0F, null);
            canvas.drawRect(0.0F, mDispHeight, mDispWidth, 4 + mDispHeight, mNormalPaint);
            canvas.drawBitmap(bitmap3, 0.0F, 4 + mDispHeight, null);
            initPaintWithShader();
            canvas.drawRect(0.0F, mDispHeight, mDispWidth, 4 + mTotalDispHeight, mGradientPaint);
            Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("decorAndSetContent end: width = ").append(bitmap4.getWidth()).append(",height = ").append(bitmap4.getHeight()).toString());
            imageview.setImageBitmap(bitmap4);
            synchronized (mLock)
            {
                Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("decorAndSetContent cache reflection bitmap: position = ").append(i).append(",bitmapWithReflection = ").append(bitmap4).toString());
                mBitmapCache.put(i, new WeakReference(bitmap4));
            }
            bitmap3.recycle();
        } else
        {
            imageview.setImageBitmap(bitmap);
            synchronized (mLock)
            {
                Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("decorAndSetContent cache scaled bitmap: position = ").append(i).append(",scaledBitmap = ").append(bitmap).toString());
                mBitmapCache.put(i, new WeakReference(bitmap));
            }
        }
        if (flag)
        {
            bitmap2.recycle();
            return;
        }
        if (true) goto _L5; else goto _L4
_L4:
        if (mDispWidth != j) goto _L7; else goto _L6
_L6:
        l = mDispHeight;
        flag = false;
        if (l == k) goto _L8; else goto _L7
_L7:
        mTransMatrix.reset();
        mTransMatrix.postScale((float)mDispWidth / (float)j, (float)mDispHeight / (float)k);
        bitmap2 = Bitmap.createBitmap(bitmap, 0, 0, j, k, mTransMatrix, true);
        flag = true;
          goto _L8
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
        exception1;
        obj1;
        JVM INSTR monitorexit ;
        throw exception1;
          goto _L8
    }

    private Bitmap getCachedBitmap(LongSparseArray longsparsearray, long l)
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        WeakReference weakreference = (WeakReference)longsparsearray.get(l);
        if (weakreference == null)
            break MISSING_BLOCK_LABEL_50;
        Bitmap bitmap = (Bitmap)weakreference.get();
        if (bitmap == null)
            break MISSING_BLOCK_LABEL_45;
        obj;
        JVM INSTR monitorexit ;
        return bitmap;
        longsparsearray.delete(l);
        obj;
        JVM INSTR monitorexit ;
        return null;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
    }

    private void initPaintWithShader()
    {
        if (mGradientPaint == null)
            mGradientPaint = new Paint();
        LinearGradient lineargradient = new LinearGradient(0.0F, mDispHeight, 0.0F, 4 + mTotalDispHeight, mStartGradientColor, mEndGradientColor, android.graphics.Shader.TileMode.CLAMP);
        mGradientPaint.setShader(lineargradient);
        mGradientPaint.setXfermode(new PorterDuffXfermode(android.graphics.PorterDuff.Mode.DST_IN));
    }

    public void clearBitmapCache()
    {
        Object obj = mLock;
        obj;
        JVM INSTR monitorenter ;
        int i;
        i = mBitmapCache.size();
        Xlog.d("ReflectionDecorAdapter", (new StringBuilder()).append("clearBitmapCache: size = ").append(i).toString());
        int j = 0;
_L5:
        if (j >= i) goto _L2; else goto _L1
_L1:
        Bitmap bitmap;
        StringBuilder stringbuilder;
        bitmap = (Bitmap)((WeakReference)mBitmapCache.valueAt(j)).get();
        stringbuilder = (new StringBuilder()).append("clearBitmapCache: i = ").append(j).append(",bmp = ").append(bitmap).append(",recycled = ");
        if (bitmap == null)
            break MISSING_BLOCK_LABEL_206;
        boolean flag = bitmap.isRecycled();
_L6:
        Xlog.d("ReflectionDecorAdapter", stringbuilder.append(flag).toString());
        if (bitmap == null) goto _L4; else goto _L3
_L3:
        if (!bitmap.isRecycled())
            bitmap.recycle();
          goto _L4
_L2:
        mBitmapCache.clear();
        obj;
        JVM INSTR monitorexit ;
        if (mIndicatorBitmap != null && !mIndicatorBitmap.isRecycled())
        {
            mIndicatorBitmap.recycle();
            mIndicatorBitmap = null;
        }
        return;
        Exception exception;
        exception;
        obj;
        JVM INSTR monitorexit ;
        throw exception;
_L4:
        j++;
          goto _L5
        flag = true;
          goto _L6
    }

    public int getChosenItem()
    {
        return mCurrentChosen;
    }

    public abstract int getContainerId();

    public abstract Bitmap getContentAt(int i);

    public View getView(int i, View view, ViewGroup viewgroup)
    {
        View view1 = getViewInner(i, view, viewgroup);
        decorAndSetContent((ImageView)view1.findViewById(getContainerId()), getContentAt(i), i);
        return view1;
    }

    public abstract View getViewInner(int i, View view, ViewGroup viewgroup);

    public void setChosenItem(int i)
    {
        mCurrentChosen = i;
        mBitmapCache.delete(mCurrentChosen);
    }

    public void setGrandientColor(int i, int j)
    {
        mStartGradientColor = i;
        mEndGradientColor = j;
    }

    public void setImageDispSize(int i, int j)
    {
        mDispWidth = i;
        mDispHeight = j;
        mTotalDispHeight = (int)((float)mDispHeight * (1.0F + mReflection));
        initPaintWithShader();
    }

    public void setImageReflection(float f)
    {
        mReflection = f;
        mTotalDispHeight = (int)((float)mDispHeight * (1.0F + mReflection));
    }

    public void setIndicatorBitmap(Bitmap bitmap)
    {
        mIndicatorBitmap = bitmap;
    }

    public void setIndicatorBitmapResource(int i)
    {
        mIndicatorResId = i;
        mIndicatorBitmap = BitmapFactory.decodeResource(mContext.getResources(), i);
    }
}
