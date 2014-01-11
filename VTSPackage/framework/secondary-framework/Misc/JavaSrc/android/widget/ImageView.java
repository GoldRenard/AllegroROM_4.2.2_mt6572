// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.io.PrintStream;
import java.util.List;

public class ImageView extends View
{
    public static final class ScaleType extends Enum
    {

        private static final ScaleType $VALUES[];
        public static final ScaleType CENTER;
        public static final ScaleType CENTER_CROP;
        public static final ScaleType CENTER_INSIDE;
        public static final ScaleType FIT_CENTER;
        public static final ScaleType FIT_END;
        public static final ScaleType FIT_START;
        public static final ScaleType FIT_XY;
        public static final ScaleType MATRIX;
        final int nativeInt;

        public static ScaleType valueOf(String s)
        {
            return (ScaleType)Enum.valueOf(android/widget/ImageView$ScaleType, s);
        }

        public static ScaleType[] values()
        {
            return (ScaleType[])$VALUES.clone();
        }

        static 
        {
            MATRIX = new ScaleType("MATRIX", 0, 0);
            FIT_XY = new ScaleType("FIT_XY", 1, 1);
            FIT_START = new ScaleType("FIT_START", 2, 2);
            FIT_CENTER = new ScaleType("FIT_CENTER", 3, 3);
            FIT_END = new ScaleType("FIT_END", 4, 4);
            CENTER = new ScaleType("CENTER", 5, 5);
            CENTER_CROP = new ScaleType("CENTER_CROP", 6, 6);
            CENTER_INSIDE = new ScaleType("CENTER_INSIDE", 7, 7);
            ScaleType ascaletype[] = new ScaleType[8];
            ascaletype[0] = MATRIX;
            ascaletype[1] = FIT_XY;
            ascaletype[2] = FIT_START;
            ascaletype[3] = FIT_CENTER;
            ascaletype[4] = FIT_END;
            ascaletype[5] = CENTER;
            ascaletype[6] = CENTER_CROP;
            ascaletype[7] = CENTER_INSIDE;
            $VALUES = ascaletype;
        }

        private ScaleType(String s, int i, int j)
        {
            super(s, i);
            nativeInt = j;
        }
    }


    private static final android.graphics.Matrix.ScaleToFit sS2FArray[];
    private static final ScaleType sScaleTypeArray[];
    private boolean mAdjustViewBounds;
    private int mAlpha;
    private int mBaseline;
    private boolean mBaselineAlignBottom;
    private ColorFilter mColorFilter;
    private boolean mColorMod;
    private boolean mCropToPadding;
    private Matrix mDrawMatrix;
    private Drawable mDrawable;
    private int mDrawableHeight;
    private int mDrawableWidth;
    private boolean mHaveFrame;
    private int mLevel;
    private Matrix mMatrix;
    private int mMaxHeight;
    private int mMaxWidth;
    private boolean mMergeState;
    private int mResource;
    private ScaleType mScaleType;
    private int mState[];
    private RectF mTempDst;
    private RectF mTempSrc;
    private Uri mUri;
    private int mViewAlphaScale;

    public ImageView(Context context)
    {
        super(context);
        mResource = 0;
        mHaveFrame = false;
        mAdjustViewBounds = false;
        mMaxWidth = 0x7fffffff;
        mMaxHeight = 0x7fffffff;
        mAlpha = 255;
        mViewAlphaScale = 256;
        mColorMod = false;
        mDrawable = null;
        mState = null;
        mMergeState = false;
        mLevel = 0;
        mDrawMatrix = null;
        mTempSrc = new RectF();
        mTempDst = new RectF();
        mBaseline = -1;
        mBaselineAlignBottom = false;
        initImageView();
    }

    public ImageView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ImageView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mResource = 0;
        mHaveFrame = false;
        mAdjustViewBounds = false;
        mMaxWidth = 0x7fffffff;
        mMaxHeight = 0x7fffffff;
        mAlpha = 255;
        mViewAlphaScale = 256;
        mColorMod = false;
        mDrawable = null;
        mState = null;
        mMergeState = false;
        mLevel = 0;
        mDrawMatrix = null;
        mTempSrc = new RectF();
        mTempDst = new RectF();
        mBaseline = -1;
        mBaselineAlignBottom = false;
        initImageView();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ImageView, i, 0);
        Drawable drawable = typedarray.getDrawable(0);
        if (drawable != null)
            setImageDrawable(drawable);
        mBaselineAlignBottom = typedarray.getBoolean(6, false);
        mBaseline = typedarray.getDimensionPixelSize(8, -1);
        setAdjustViewBounds(typedarray.getBoolean(2, false));
        setMaxWidth(typedarray.getDimensionPixelSize(3, 0x7fffffff));
        setMaxHeight(typedarray.getDimensionPixelSize(4, 0x7fffffff));
        int j = typedarray.getInt(1, -1);
        if (j >= 0)
            setScaleType(sScaleTypeArray[j]);
        int k = typedarray.getInt(5, 0);
        if (k != 0)
            setColorFilter(k);
        int l = typedarray.getInt(9, 255);
        if (l != 255)
            setAlpha(l);
        mCropToPadding = typedarray.getBoolean(7, false);
        typedarray.recycle();
    }

    private void applyColorMod()
    {
        if (mDrawable != null && mColorMod)
        {
            mDrawable = mDrawable.mutate();
            mDrawable.setColorFilter(mColorFilter);
            mDrawable.setAlpha(mAlpha * mViewAlphaScale >> 8);
        }
    }

    private void configureBounds()
    {
        if (mDrawable != null && mHaveFrame)
        {
            int i = mDrawableWidth;
            int j = mDrawableHeight;
            int k = getWidth() - super.mPaddingLeft - super.mPaddingRight;
            int l = getHeight() - super.mPaddingTop - super.mPaddingBottom;
            boolean flag;
            if (i >= 0 && k != i || j >= 0 && l != j)
                flag = false;
            else
                flag = true;
            if (i > 0 && j > 0 && ScaleType.FIT_XY != mScaleType)
            {
                mDrawable.setBounds(0, 0, i, j);
                if (ScaleType.MATRIX == mScaleType)
                    if (mMatrix.isIdentity())
                    {
                        mDrawMatrix = null;
                        return;
                    } else
                    {
                        mDrawMatrix = mMatrix;
                        return;
                    }
                if (flag)
                {
                    mDrawMatrix = null;
                    return;
                }
                if (ScaleType.CENTER == mScaleType)
                {
                    mDrawMatrix = mMatrix;
                    mDrawMatrix.setTranslate((int)(0.5F + 0.5F * (float)(k - i)), (int)(0.5F + 0.5F * (float)(l - j)));
                    return;
                }
                if (ScaleType.CENTER_CROP == mScaleType)
                {
                    mDrawMatrix = mMatrix;
                    float f3 = 0.0F;
                    float f4;
                    float f5;
                    if (i * l > k * j)
                    {
                        f4 = (float)l / (float)j;
                        f5 = 0.5F * ((float)k - f4 * (float)i);
                    } else
                    {
                        f4 = (float)k / (float)i;
                        f3 = 0.5F * ((float)l - f4 * (float)j);
                        f5 = 0.0F;
                    }
                    mDrawMatrix.setScale(f4, f4);
                    mDrawMatrix.postTranslate((int)(f5 + 0.5F), (int)(f3 + 0.5F));
                    return;
                }
                if (ScaleType.CENTER_INSIDE == mScaleType)
                {
                    mDrawMatrix = mMatrix;
                    float f;
                    if (i <= k && j <= l)
                        f = 1.0F;
                    else
                        f = Math.min((float)k / (float)i, (float)l / (float)j);
                    float f1 = (int)(0.5F + 0.5F * ((float)k - f * (float)i));
                    float f2 = (int)(0.5F + 0.5F * ((float)l - f * (float)j));
                    mDrawMatrix.setScale(f, f);
                    mDrawMatrix.postTranslate(f1, f2);
                    return;
                } else
                {
                    mTempSrc.set(0.0F, 0.0F, i, j);
                    mTempDst.set(0.0F, 0.0F, k, l);
                    mDrawMatrix = mMatrix;
                    mDrawMatrix.setRectToRect(mTempSrc, mTempDst, scaleTypeToScaleToFit(mScaleType));
                    return;
                }
            } else
            {
                mDrawable.setBounds(0, 0, k, l);
                mDrawMatrix = null;
                return;
            }
        } else
        {
            return;
        }
    }

    private void initImageView()
    {
        mMatrix = new Matrix();
        mScaleType = ScaleType.FIT_CENTER;
    }

    private void resizeFromDrawable()
    {
        Drawable drawable = mDrawable;
        if (drawable != null)
        {
            int i = drawable.getIntrinsicWidth();
            if (i < 0)
                i = mDrawableWidth;
            int j = drawable.getIntrinsicHeight();
            if (j < 0)
                j = mDrawableHeight;
            if (i != mDrawableWidth || j != mDrawableHeight)
            {
                mDrawableWidth = i;
                mDrawableHeight = j;
                requestLayout();
            }
        }
    }

    private int resolveAdjustedSize(int i, int j, int k)
    {
        int l = android.view.View.MeasureSpec.getMode(k);
        int i1 = android.view.View.MeasureSpec.getSize(k);
        switch (l)
        {
        case 1073741824: 
            return i1;

        case -2147483648: 
            return Math.min(Math.min(i, i1), j);

        case 0: // '\0'
            return Math.min(i, j);
        }
        return i;
    }

    private void resolveUri()
    {
        if (mDrawable == null) goto _L2; else goto _L1
_L1:
        Resources resources;
        return;
_L2:
        if ((resources = getResources()) == null) goto _L1; else goto _L3
_L3:
        if (mResource == 0)
            continue; /* Loop/switch isn't completed */
        Drawable drawable3 = resources.getDrawable(mResource);
        Drawable drawable = drawable3;
_L4:
        updateDrawable(drawable);
        return;
        Exception exception2;
        exception2;
        Log.w("ImageView", (new StringBuilder()).append("Unable to find resource: ").append(mResource).toString(), exception2);
        mUri = null;
        drawable = null;
          goto _L4
        if (mUri == null) goto _L1; else goto _L5
_L5:
        String s = mUri.getScheme();
        if (!"android.resource".equals(s)) goto _L7; else goto _L6
_L6:
        Drawable drawable2;
        android.content.ContentResolver.OpenResourceIdResult openresourceidresult = super.mContext.getContentResolver().getResourceId(mUri);
        drawable2 = openresourceidresult.r.getDrawable(openresourceidresult.id);
        drawable = drawable2;
_L8:
        if (drawable == null)
        {
            System.out.println((new StringBuilder()).append("resolveUri failed on bad bitmap uri: ").append(mUri).toString());
            mUri = null;
        }
          goto _L4
        Exception exception1;
        exception1;
        Log.w("ImageView", (new StringBuilder()).append("Unable to open content: ").append(mUri).toString(), exception1);
        drawable = null;
          goto _L8
_L7:
        if (!"content".equals(s) && !"file".equals(s))
            break MISSING_BLOCK_LABEL_317;
        Drawable drawable1 = Drawable.createFromStream(super.mContext.getContentResolver().openInputStream(mUri), null);
        drawable = drawable1;
          goto _L8
        Exception exception;
        exception;
        Log.w("ImageView", (new StringBuilder()).append("Unable to open content: ").append(mUri).toString(), exception);
        drawable = null;
          goto _L8
        drawable = Drawable.createFromPath(mUri.toString());
          goto _L8
    }

    private static android.graphics.Matrix.ScaleToFit scaleTypeToScaleToFit(ScaleType scaletype)
    {
        return sS2FArray[-1 + scaletype.nativeInt];
    }

    private void updateDrawable(Drawable drawable)
    {
        if (mDrawable != null)
        {
            mDrawable.setCallback(null);
            unscheduleDrawable(mDrawable);
        }
        mDrawable = drawable;
        if (drawable != null)
        {
            drawable.setCallback(this);
            if (drawable.isStateful())
                drawable.setState(getDrawableState());
            drawable.setLevel(mLevel);
            drawable.setLayoutDirection(getLayoutDirection());
            mDrawableWidth = drawable.getIntrinsicWidth();
            mDrawableHeight = drawable.getIntrinsicHeight();
            applyColorMod();
            configureBounds();
            return;
        } else
        {
            mDrawableHeight = -1;
            mDrawableWidth = -1;
            return;
        }
    }

    public final void clearColorFilter()
    {
        setColorFilter(((ColorFilter) (null)));
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        Drawable drawable = mDrawable;
        if (drawable != null && drawable.isStateful())
            drawable.setState(getDrawableState());
    }

    public boolean getAdjustViewBounds()
    {
        return mAdjustViewBounds;
    }

    public int getBaseline()
    {
        if (mBaselineAlignBottom)
            return getMeasuredHeight();
        else
            return mBaseline;
    }

    public boolean getBaselineAlignBottom()
    {
        return mBaselineAlignBottom;
    }

    public ColorFilter getColorFilter()
    {
        return mColorFilter;
    }

    public boolean getCropToPadding()
    {
        return mCropToPadding;
    }

    public Drawable getDrawable()
    {
        return mDrawable;
    }

    public int getImageAlpha()
    {
        return mAlpha;
    }

    public Matrix getImageMatrix()
    {
        return mMatrix;
    }

    public int getMaxHeight()
    {
        return mMaxHeight;
    }

    public int getMaxWidth()
    {
        return mMaxWidth;
    }

    public ScaleType getScaleType()
    {
        return mScaleType;
    }

    public boolean hasOverlappingRendering()
    {
        return getBackground() != null;
    }

    public void invalidateDrawable(Drawable drawable)
    {
        if (drawable == mDrawable)
        {
            invalidate();
            return;
        } else
        {
            super.invalidateDrawable(drawable);
            return;
        }
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mDrawable != null)
            mDrawable.jumpToCurrentState();
    }

    protected void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        if (mDrawable != null)
        {
            Drawable drawable = mDrawable;
            boolean flag;
            if (getVisibility() == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
    }

    public int[] onCreateDrawableState(int i)
    {
        if (mState == null)
            return super.onCreateDrawableState(i);
        if (!mMergeState)
            return mState;
        else
            return mergeDrawableStates(super.onCreateDrawableState(i + mState.length), mState);
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mDrawable != null)
            mDrawable.setVisible(false, false);
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        if (mDrawable != null && mDrawableWidth != 0 && mDrawableHeight != 0)
        {
            if (mDrawMatrix == null && super.mPaddingTop == 0 && super.mPaddingLeft == 0)
            {
                mDrawable.draw(canvas);
                return;
            }
            int i = canvas.getSaveCount();
            canvas.save();
            if (mCropToPadding)
            {
                int j = super.mScrollX;
                int k = super.mScrollY;
                canvas.clipRect(j + super.mPaddingLeft, k + super.mPaddingTop, (j + super.mRight) - super.mLeft - super.mPaddingRight, (k + super.mBottom) - super.mTop - super.mPaddingBottom);
            }
            canvas.translate(super.mPaddingLeft, super.mPaddingTop);
            if (mDrawMatrix != null)
                canvas.concat(mDrawMatrix);
            mDrawable.draw(canvas);
            canvas.restoreToCount(i);
            return;
        } else
        {
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/ImageView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/ImageView.getName());
    }

    protected void onMeasure(int i, int j)
    {
        resolveUri();
        float f = 0.0F;
        boolean flag = false;
        boolean flag1 = false;
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getMode(j);
        int i1;
        int j1;
        if (mDrawable == null)
        {
            mDrawableWidth = -1;
            mDrawableHeight = -1;
            j1 = 0;
            i1 = 0;
        } else
        {
            i1 = mDrawableWidth;
            j1 = mDrawableHeight;
            if (i1 <= 0)
                i1 = 1;
            if (j1 <= 0)
                j1 = 1;
            boolean flag2 = mAdjustViewBounds;
            f = 0.0F;
            flag1 = false;
            flag = false;
            if (flag2)
            {
                if (k != 0x40000000)
                    flag = true;
                else
                    flag = false;
                if (l != 0x40000000)
                    flag1 = true;
                else
                    flag1 = false;
                f = (float)i1 / (float)j1;
            }
        }
        int k1 = super.mPaddingLeft;
        int l1 = super.mPaddingRight;
        int i2 = super.mPaddingTop;
        int j2 = super.mPaddingBottom;
        int k2;
        int l2;
        if (!flag && !flag1)
        {
            int l3 = i1 + (k1 + l1);
            int i4 = j1 + (i2 + j2);
            int j4 = Math.max(l3, getSuggestedMinimumWidth());
            int k4 = Math.max(i4, getSuggestedMinimumHeight());
            k2 = resolveSizeAndState(j4, i, 0);
            l2 = resolveSizeAndState(k4, j, 0);
        } else
        {
            k2 = resolveAdjustedSize(l1 + (i1 + k1), mMaxWidth, i);
            l2 = resolveAdjustedSize(j2 + (j1 + i2), mMaxHeight, j);
            if (f != 0.0F && (double)Math.abs((float)(k2 - k1 - l1) / (float)(l2 - i2 - j2) - f) > 9.9999999999999995E-008D)
            {
                boolean flag3 = false;
                if (flag)
                {
                    int j3 = l1 + (k1 + (int)(f * (float)(l2 - i2 - j2)));
                    int k3 = k2;
                    flag3 = false;
                    if (j3 <= k3)
                    {
                        k2 = j3;
                        flag3 = true;
                    }
                }
                if (!flag3 && flag1)
                {
                    int i3 = j2 + (i2 + (int)((float)(k2 - k1 - l1) / f));
                    if (i3 <= l2)
                        l2 = i3;
                }
            }
        }
        setMeasuredDimension(k2, l2);
    }

    public void onPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onPopulateAccessibilityEvent(accessibilityevent);
        CharSequence charsequence = getContentDescription();
        if (!TextUtils.isEmpty(charsequence))
            accessibilityevent.getText().add(charsequence);
    }

    public void setAdjustViewBounds(boolean flag)
    {
        mAdjustViewBounds = flag;
        if (flag)
            setScaleType(ScaleType.FIT_CENTER);
    }

    public void setAlpha(int i)
    {
        int j = i & 0xff;
        if (mAlpha != j)
        {
            mAlpha = j;
            mColorMod = true;
            applyColorMod();
            invalidate();
        }
    }

    public void setBaseline(int i)
    {
        if (mBaseline != i)
        {
            mBaseline = i;
            requestLayout();
        }
    }

    public void setBaselineAlignBottom(boolean flag)
    {
        if (mBaselineAlignBottom != flag)
        {
            mBaselineAlignBottom = flag;
            requestLayout();
        }
    }

    public final void setColorFilter(int i)
    {
        setColorFilter(i, android.graphics.PorterDuff.Mode.SRC_ATOP);
    }

    public final void setColorFilter(int i, android.graphics.PorterDuff.Mode mode)
    {
        setColorFilter(((ColorFilter) (new PorterDuffColorFilter(i, mode))));
    }

    public void setColorFilter(ColorFilter colorfilter)
    {
        if (mColorFilter != colorfilter)
        {
            mColorFilter = colorfilter;
            mColorMod = true;
            applyColorMod();
            invalidate();
        }
    }

    public void setCropToPadding(boolean flag)
    {
        if (mCropToPadding != flag)
        {
            mCropToPadding = flag;
            requestLayout();
            invalidate();
        }
    }

    protected boolean setFrame(int i, int j, int k, int l)
    {
        boolean flag = super.setFrame(i, j, k, l);
        mHaveFrame = true;
        configureBounds();
        return flag;
    }

    public void setImageAlpha(int i)
    {
        setAlpha(i);
    }

    public void setImageBitmap(Bitmap bitmap)
    {
        setImageDrawable(new BitmapDrawable(super.mContext.getResources(), bitmap));
    }

    public void setImageDrawable(Drawable drawable)
    {
        if (mDrawable != drawable)
        {
            mResource = 0;
            mUri = null;
            int i = mDrawableWidth;
            int j = mDrawableHeight;
            updateDrawable(drawable);
            if (i != mDrawableWidth || j != mDrawableHeight)
                requestLayout();
            invalidate();
        }
    }

    public void setImageLevel(int i)
    {
        mLevel = i;
        if (mDrawable != null)
        {
            mDrawable.setLevel(i);
            resizeFromDrawable();
        }
    }

    public void setImageMatrix(Matrix matrix)
    {
        if (matrix != null && matrix.isIdentity())
            matrix = null;
        if (matrix == null && !mMatrix.isIdentity() || matrix != null && !mMatrix.equals(matrix))
        {
            mMatrix.set(matrix);
            configureBounds();
            invalidate();
        }
    }

    public void setImageResource(int i)
    {
        if (mUri != null || mResource != i)
        {
            updateDrawable(null);
            mResource = i;
            mUri = null;
            int j = mDrawableWidth;
            int k = mDrawableHeight;
            resolveUri();
            if (j != mDrawableWidth || k != mDrawableHeight)
                requestLayout();
            invalidate();
        }
    }

    public void setImageState(int ai[], boolean flag)
    {
        mState = ai;
        mMergeState = flag;
        if (mDrawable != null)
        {
            refreshDrawableState();
            resizeFromDrawable();
        }
    }

    public void setImageURI(Uri uri)
    {
        if (mResource != 0 || mUri != uri && (uri == null || mUri == null || !uri.equals(mUri)))
        {
            updateDrawable(null);
            mResource = 0;
            mUri = uri;
            int i = mDrawableWidth;
            int j = mDrawableHeight;
            resolveUri();
            if (i != mDrawableWidth || j != mDrawableHeight)
                requestLayout();
            invalidate();
        }
    }

    public void setMaxHeight(int i)
    {
        mMaxHeight = i;
    }

    public void setMaxWidth(int i)
    {
        mMaxWidth = i;
    }

    public void setScaleType(ScaleType scaletype)
    {
        if (scaletype == null)
            throw new NullPointerException();
        if (mScaleType != scaletype)
        {
            mScaleType = scaletype;
            boolean flag;
            if (mScaleType == ScaleType.CENTER)
                flag = true;
            else
                flag = false;
            setWillNotCacheDrawing(flag);
            requestLayout();
            invalidate();
        }
    }

    public void setSelected(boolean flag)
    {
        super.setSelected(flag);
        resizeFromDrawable();
    }

    public void setVisibility(int i)
    {
        super.setVisibility(i);
        if (mDrawable != null)
        {
            Drawable drawable = mDrawable;
            boolean flag;
            if (i == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return mDrawable == drawable || super.verifyDrawable(drawable);
    }

    static 
    {
        ScaleType ascaletype[] = new ScaleType[8];
        ascaletype[0] = ScaleType.MATRIX;
        ascaletype[1] = ScaleType.FIT_XY;
        ascaletype[2] = ScaleType.FIT_START;
        ascaletype[3] = ScaleType.FIT_CENTER;
        ascaletype[4] = ScaleType.FIT_END;
        ascaletype[5] = ScaleType.CENTER;
        ascaletype[6] = ScaleType.CENTER_CROP;
        ascaletype[7] = ScaleType.CENTER_INSIDE;
        sScaleTypeArray = ascaletype;
        android.graphics.Matrix.ScaleToFit ascaletofit[] = new android.graphics.Matrix.ScaleToFit[4];
        ascaletofit[0] = android.graphics.Matrix.ScaleToFit.FILL;
        ascaletofit[1] = android.graphics.Matrix.ScaleToFit.START;
        ascaletofit[2] = android.graphics.Matrix.ScaleToFit.CENTER;
        ascaletofit[3] = android.graphics.Matrix.ScaleToFit.END;
        sS2FArray = ascaletofit;
    }
}
