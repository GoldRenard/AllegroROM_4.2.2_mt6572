// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            ProgressBar

public abstract class AbsSeekBar extends ProgressBar
{

    private static final int NO_ALPHA = 255;
    private float mDisabledAlpha;
    private boolean mIsDragging;
    boolean mIsUserSeekable;
    private int mKeyProgressIncrement;
    private int mScaledTouchSlop;
    private Drawable mThumb;
    private int mThumbOffset;
    private float mTouchDownX;
    float mTouchProgressOffset;

    public AbsSeekBar(Context context)
    {
        ProgressBar(context);
        mIsUserSeekable = true;
        mKeyProgressIncrement = 1;
    }

    public AbsSeekBar(Context context, AttributeSet attributeset)
    {
        ProgressBar(context, attributeset);
        mIsUserSeekable = true;
        mKeyProgressIncrement = 1;
    }

    public AbsSeekBar(Context context, AttributeSet attributeset, int i)
    {
        ProgressBar(context, attributeset, i);
        mIsUserSeekable = true;
        mKeyProgressIncrement = 1;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.SeekBar, i, 0);
        setThumb(typedarray.getDrawable(0));
        setThumbOffset(typedarray.getDimensionPixelOffset(1, getThumbOffset()));
        typedarray.recycle();
        TypedArray typedarray1 = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Theme, 0, 0);
        mDisabledAlpha = typedarray1.getFloat(3, 0.5F);
        typedarray1.recycle();
        mScaledTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    private void attemptClaimDrag()
    {
        if (super.mParent != null)
            super.mParent.requestDisallowInterceptTouchEvent(true);
    }

    private void setThumbPos(int i, Drawable drawable, float f, int j)
    {
        int k = i - super.mPaddingLeft - super.mPaddingRight;
        int l = drawable.getIntrinsicWidth();
        int i1 = drawable.getIntrinsicHeight();
        int j1 = (k - l) + 2 * mThumbOffset;
        int k1 = (int)(f * (float)j1);
        int l1;
        int i2;
        if (j == 0x80000000)
        {
            Rect rect = drawable.getBounds();
            l1 = rect.top;
            i2 = rect.bottom;
        } else
        {
            l1 = j;
            i2 = j + i1;
        }
        int j2;
        if (isLayoutRtl())
            j2 = j1 - k1;
        else
            j2 = k1;
        drawable.setBounds(j2, l1, j2 + l, i2);
    }

    private void trackTouchEvent(MotionEvent motionevent)
    {
        int i = getWidth();
        int j = i - super.mPaddingLeft - super.mPaddingRight;
        int k = (int)motionevent.getX();
        float f = 0.0F;
        float f1;
        if (isLayoutRtl())
        {
            if (k > i - super.mPaddingRight)
                f1 = 0.0F;
            else
            if (k < super.mPaddingLeft)
            {
                f1 = 1.0F;
                f = 0.0F;
            } else
            {
                f1 = (float)((j - k) + super.mPaddingLeft) / (float)j;
                f = mTouchProgressOffset;
            }
        } else
        if (k < super.mPaddingLeft)
        {
            f = 0.0F;
            f1 = 0.0F;
        } else
        if (k > i - super.mPaddingRight)
        {
            f1 = 1.0F;
            f = 0.0F;
        } else
        {
            f1 = (float)(k - super.mPaddingLeft) / (float)j;
            f = mTouchProgressOffset;
        }
        setProgress((int)(f + f1 * (float)getMax()), true);
    }

    private void updateThumbPos(int i, int j)
    {
        Drawable drawable = getCurrentDrawable();
        Drawable drawable1 = mThumb;
        int k;
        if (drawable1 == null)
            k = 0;
        else
            k = drawable1.getIntrinsicHeight();
        int l = Math.min(super.mMaxHeight, j - super.mPaddingTop - super.mPaddingBottom);
        int i1 = getMax();
        float f;
        if (i1 > 0)
            f = (float)getProgress() / (float)i1;
        else
            f = 0.0F;
        if (k > l)
        {
            if (drawable1 != null)
                setThumbPos(i, drawable1, f, 0);
            int k1 = (k - l) / 2;
            if (drawable != null)
                drawable.setBounds(0, k1, i - super.mPaddingRight - super.mPaddingLeft, j - super.mPaddingBottom - k1 - super.mPaddingTop);
        } else
        {
            if (drawable != null)
                drawable.setBounds(0, 0, i - super.mPaddingRight - super.mPaddingLeft, j - super.mPaddingBottom - super.mPaddingTop);
            int j1 = (l - k) / 2;
            if (drawable1 != null)
            {
                setThumbPos(i, drawable1, f, j1);
                return;
            }
        }
    }

    protected void drawableStateChanged()
    {
        drawableStateChanged();
        Drawable drawable = getProgressDrawable();
        if (drawable != null)
        {
            int i;
            if (isEnabled())
                i = 255;
            else
                i = (int)(255F * mDisabledAlpha);
            drawable.setAlpha(i);
        }
        if (mThumb != null && mThumb.isStateful())
        {
            int ai[] = getDrawableState();
            mThumb.setState(ai);
        }
    }

    public int getKeyProgressIncrement()
    {
        return mKeyProgressIncrement;
    }

    public Drawable getThumb()
    {
        return mThumb;
    }

    public int getThumbOffset()
    {
        return mThumbOffset;
    }

    public void jumpDrawablesToCurrentState()
    {
        jumpDrawablesToCurrentState();
        if (mThumb != null)
            mThumb.jumpToCurrentState();
    }

    protected void onDraw(Canvas canvas)
    {
        this;
        JVM INSTR monitorenter ;
        onDraw(canvas);
        if (mThumb != null)
        {
            canvas.save();
            canvas.translate(super.mPaddingLeft - mThumbOffset, super.mPaddingTop);
            mThumb.draw(canvas);
            canvas.restore();
        }
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/AbsSeekBar.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/AbsSeekBar.getName());
        if (isEnabled())
        {
            int i = getProgress();
            if (i > 0)
                accessibilitynodeinfo.addAction(8192);
            if (i < getMax())
                accessibilitynodeinfo.addAction(4096);
        }
    }

    void onKeyChange()
    {
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (isEnabled())
        {
            int j = getProgress();
            switch (i)
            {
            default:
                break;

            case 22: // '\026'
                if (j < getMax())
                {
                    setProgress(j + mKeyProgressIncrement, true);
                    onKeyChange();
                    return true;
                }
                break;

            case 21: // '\025'
                if (j > 0)
                {
                    setProgress(j - mKeyProgressIncrement, true);
                    onKeyChange();
                    return true;
                }
                break;
            }
        }
        return onKeyDown(i, keyevent);
    }

    protected void onMeasure(int i, int j)
    {
        this;
        JVM INSTR monitorenter ;
        Drawable drawable;
        Drawable drawable1;
        drawable = getCurrentDrawable();
        drawable1 = mThumb;
        int k = 0;
        if (drawable1 != null) goto _L2; else goto _L1
_L1:
        int i1;
        int j1;
        i1 = 0;
        j1 = 0;
        if (drawable == null)
            break MISSING_BLOCK_LABEL_80;
        j1 = Math.max(super.mMinWidth, Math.min(super.mMaxWidth, drawable.getIntrinsicWidth()));
        i1 = Math.max(k, Math.max(super.mMinHeight, Math.min(super.mMaxHeight, drawable.getIntrinsicHeight())));
        int k1 = j1 + (super.mPaddingLeft + super.mPaddingRight);
        int l1 = i1 + (super.mPaddingTop + super.mPaddingBottom);
        setMeasuredDimension(resolveSizeAndState(k1, i, 0), resolveSizeAndState(l1, j, 0));
        this;
        JVM INSTR monitorexit ;
        return;
_L2:
        int l = mThumb.getIntrinsicHeight();
        k = l;
        if (true) goto _L1; else goto _L3
_L3:
        Exception exception;
        exception;
        throw exception;
    }

    void onProgressRefresh(float f, boolean flag)
    {
        onProgressRefresh(f, flag);
        Drawable drawable = mThumb;
        if (drawable != null)
        {
            setThumbPos(getWidth(), drawable, f, 0x80000000);
            invalidate();
        }
    }

    public void onResolveDrawables(int i)
    {
        onResolveDrawables(i);
        if (mThumb != null)
            mThumb.setLayoutDirection(i);
    }

    public void onRtlPropertiesChanged(int i)
    {
        onRtlPropertiesChanged(i);
        int j = getMax();
        float f;
        if (j > 0)
            f = (float)getProgress() / (float)j;
        else
            f = 0.0F;
        Drawable drawable = mThumb;
        if (drawable != null)
        {
            setThumbPos(getWidth(), drawable, f, 0x80000000);
            invalidate();
        }
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        onSizeChanged(i, j, k, l);
        updateThumbPos(i, j);
    }

    void onStartTrackingTouch()
    {
        mIsDragging = true;
    }

    void onStopTrackingTouch()
    {
        mIsDragging = false;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = true;
        if (mIsUserSeekable && isEnabled())
            switch (motionevent.getAction())
            {
            case 3: // '\003'
                if (mIsDragging)
                {
                    onStopTrackingTouch();
                    setPressed(false);
                }
                invalidate();
                return flag;

            case 1: // '\001'
                if (mIsDragging)
                {
                    trackTouchEvent(motionevent);
                    onStopTrackingTouch();
                    setPressed(false);
                } else
                {
                    onStartTrackingTouch();
                    trackTouchEvent(motionevent);
                    onStopTrackingTouch();
                }
                invalidate();
                return flag;

            case 2: // '\002'
                if (mIsDragging)
                {
                    trackTouchEvent(motionevent);
                    return flag;
                }
                if (Math.abs(motionevent.getX() - mTouchDownX) > (float)mScaledTouchSlop)
                {
                    setPressed(flag);
                    if (mThumb != null)
                        invalidate(mThumb.getBounds());
                    onStartTrackingTouch();
                    trackTouchEvent(motionevent);
                    attemptClaimDrag();
                    return flag;
                }
                break;

            case 0: // '\0'
                if (isInScrollingContainer())
                {
                    mTouchDownX = motionevent.getX();
                    return flag;
                }
                setPressed(flag);
                if (mThumb != null)
                    invalidate(mThumb.getBounds());
                onStartTrackingTouch();
                trackTouchEvent(motionevent);
                attemptClaimDrag();
                return flag;

            default:
                return flag;
            }
        else
            flag = false;
        return flag;
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (performAccessibilityAction(i, bundle))
            return true;
        if (!isEnabled())
            return false;
        int j = getProgress();
        int k = Math.max(1, Math.round((float)getMax() / 5F));
        switch (i)
        {
        case 4096: 
            if (j >= getMax())
            {
                return false;
            } else
            {
                setProgress(j + k, true);
                onKeyChange();
                return true;
            }

        case 8192: 
            if (j <= 0)
            {
                return false;
            } else
            {
                setProgress(j - k, true);
                onKeyChange();
                return true;
            }
        }
        return false;
    }

    public void setKeyProgressIncrement(int i)
    {
        if (i < 0)
            i = -i;
        mKeyProgressIncrement = i;
    }

    public void setMax(int i)
    {
        this;
        JVM INSTR monitorenter ;
        setMax(i);
        if (mKeyProgressIncrement == 0 || getMax() / mKeyProgressIncrement > 20)
            setKeyProgressIncrement(Math.max(1, Math.round((float)getMax() / 20F)));
        this;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public void setThumb(Drawable drawable)
    {
        boolean flag;
        if (mThumb != null && drawable != mThumb)
        {
            mThumb.setCallback(null);
            flag = true;
        } else
        {
            flag = false;
        }
        if (drawable != null)
        {
            drawable.setCallback(this);
            if (canResolveLayoutDirection())
                drawable.setLayoutDirection(getLayoutDirection());
            mThumbOffset = drawable.getIntrinsicWidth() / 2;
            if (flag && (drawable.getIntrinsicWidth() != mThumb.getIntrinsicWidth() || drawable.getIntrinsicHeight() != mThumb.getIntrinsicHeight()))
                requestLayout();
        }
        mThumb = drawable;
        invalidate();
        if (flag)
        {
            updateThumbPos(getWidth(), getHeight());
            if (drawable != null && drawable.isStateful())
                drawable.setState(getDrawableState());
        }
    }

    public void setThumbOffset(int i)
    {
        mThumbOffset = i;
        invalidate();
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return drawable == mThumb || verifyDrawable(drawable);
    }
}
