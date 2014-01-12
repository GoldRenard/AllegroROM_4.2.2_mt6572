// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.settings.widget;

import android.content.Context;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.text.*;
import android.util.*;
import android.view.*;
import com.google.common.base.Preconditions;
import com.mediatek.xlog.Xlog;

// Referenced classes of package com.android.settings.widget:
//            InvertedChartAxis, ChartAxis

public class ChartSweepView extends View
{
    public static interface OnSweepListener
    {

        public abstract void onSweep(ChartSweepView chartsweepview, boolean flag);

        public abstract void requestEdit(ChartSweepView chartsweepview);
    }


    private static final boolean DRAW_OUTLINE = false;
    public static final int HORIZONTAL = 0;
    private static final int LARGE_WIDTH = 1024;
    private static final int MODE_DRAG = 1;
    private static final int MODE_LABEL = 2;
    private static final int MODE_NONE = 0;
    private static final String TAG = "ChartSweepView";
    public static final int VERTICAL = 1;
    private ChartAxis mAxis;
    private android.view.View.OnClickListener mClickListener = new android.view.View.OnClickListener() {

        final ChartSweepView this$0;

        public void onClick(View view)
        {
            dispatchRequestEdit();
        }

            
            {
                this$0 = ChartSweepView.this;
                super();
            }
    }
;
    private Rect mContentOffset;
    private long mDragInterval;
    private int mFollowAxis;
    private int mLabelColor;
    private DynamicLayout mLabelLayout;
    private int mLabelMinSize;
    private float mLabelOffset;
    private float mLabelSize;
    private SpannableStringBuilder mLabelTemplate;
    private int mLabelTemplateRes;
    private long mLabelValue;
    private OnSweepListener mListener;
    private Rect mMargins;
    private long mMaxValue;
    private float mNeighborMargin;
    private ChartSweepView mNeighbors[];
    private Paint mOutlinePaint;
    private Drawable mSweep;
    private Point mSweepOffset;
    private Rect mSweepPadding;
    private int mTouchMode;
    private MotionEvent mTracking;
    private float mTrackingStart;
    private long mValidAfter;
    private ChartSweepView mValidAfterDynamic;
    private long mValidBefore;
    private ChartSweepView mValidBeforeDynamic;
    private long mValue;

    public ChartSweepView(Context context)
    {
        this(context, null);
    }

    public ChartSweepView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ChartSweepView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSweepPadding = new Rect();
        mContentOffset = new Rect();
        mSweepOffset = new Point();
        mMargins = new Rect();
        mOutlinePaint = new Paint();
        mTouchMode = 0;
        mDragInterval = 1L;
        mMaxValue = -1L;
        mNeighbors = new ChartSweepView[0];
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.settings.R.styleable.ChartSweepView, i, 0);
        setSweepDrawable(typedarray.getDrawable(0));
        setFollowAxis(typedarray.getInt(1, -1));
        setNeighborMargin(typedarray.getDimensionPixelSize(2, 0));
        setLabelMinSize(typedarray.getDimensionPixelSize(3, 0));
        setLabelTemplate(typedarray.getResourceId(4, 0));
        setLabelColor(typedarray.getColor(5, 0xff0000ff));
        setBackgroundResource(0x7f020036);
        mOutlinePaint.setColor(0xffff0000);
        mOutlinePaint.setStrokeWidth(1.0F);
        mOutlinePaint.setStyle(android.graphics.Paint.Style.STROKE);
        typedarray.recycle();
        setClickable(true);
        setFocusable(true);
        setOnClickListener(mClickListener);
        setWillNotDraw(false);
    }

    private Rect buildClampRect(Rect rect, long l, long l1, float f)
    {
        if (mAxis instanceof InvertedChartAxis)
        {
            long l2 = l1;
            l1 = l;
            l = l2;
        }
        boolean flag;
        if (l != 0x8000000000000000L && l != 0x7fffffffffffffffL)
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (l1 != 0x8000000000000000L && l1 != 0x7fffffffffffffffL)
            flag1 = true;
        else
            flag1 = false;
        float f1 = f + mAxis.convertToPoint(l);
        float f2 = mAxis.convertToPoint(l1) - f;
        Rect rect1 = new Rect(rect);
        if (mFollowAxis == 1)
        {
            if (flag1)
                rect1.bottom = rect1.top + (int)f2;
            if (flag)
                rect1.top = (int)(f1 + (float)rect1.top);
        } else
        {
            if (flag1)
                rect1.right = rect1.left + (int)f2;
            if (flag)
            {
                rect1.left = (int)(f1 + (float)rect1.left);
                return rect1;
            }
        }
        return rect1;
    }

    private Rect computeClampRect(Rect rect)
    {
        Rect rect1 = buildClampRect(rect, mValidAfter, mValidBefore, 0.0F);
        if (!rect1.intersect(buildClampRect(rect, getValidAfterDynamic(), getValidBeforeDynamic(), mNeighborMargin)))
            rect1.setEmpty();
        return rect1;
    }

    private void dispatchOnSweep(boolean flag)
    {
        if (mListener != null)
            mListener.onSweep(this, flag);
    }

    private void dispatchRequestEdit()
    {
        if (mListener != null)
            mListener.requestEdit(this);
    }

    public static float getLabelBottom(ChartSweepView chartsweepview)
    {
        return getLabelTop(chartsweepview) + (float)chartsweepview.mLabelLayout.getHeight();
    }

    public static float getLabelTop(ChartSweepView chartsweepview)
    {
        return chartsweepview.getY() + (float)chartsweepview.mContentOffset.top;
    }

    public static float getLabelWidth(ChartSweepView chartsweepview)
    {
        return Layout.getDesiredWidth(chartsweepview.mLabelLayout.getText(), chartsweepview.mLabelLayout.getPaint());
    }

    private Rect getParentContentRect()
    {
        View view = (View)getParent();
        return new Rect(view.getPaddingLeft(), view.getPaddingTop(), view.getWidth() - view.getPaddingRight(), view.getHeight() - view.getPaddingBottom());
    }

    private float getTargetInset()
    {
        if (mFollowAxis == 1)
        {
            float f1 = mSweep.getIntrinsicHeight() - mSweepPadding.top - mSweepPadding.bottom;
            return (float)mSweepPadding.top + f1 / 2.0F + (float)mSweepOffset.y;
        } else
        {
            float f = mSweep.getIntrinsicWidth() - mSweepPadding.left - mSweepPadding.right;
            return (float)mSweepPadding.left + f / 2.0F + (float)mSweepOffset.x;
        }
    }

    private float getTouchDistanceFromTarget(MotionEvent motionevent)
    {
        if (mFollowAxis == 0)
            return Math.abs(motionevent.getX() - (getX() + getTargetInset()));
        else
            return Math.abs(motionevent.getY() - (getY() + getTargetInset()));
    }

    private long getValidAfterDynamic()
    {
        ChartSweepView chartsweepview = mValidAfterDynamic;
        if (chartsweepview != null && chartsweepview.isEnabled())
            return chartsweepview.getValue();
        else
            return 0x8000000000000000L;
    }

    private long getValidBeforeDynamic()
    {
        ChartSweepView chartsweepview = mValidBeforeDynamic;
        if (chartsweepview != null && chartsweepview.isEnabled())
            return chartsweepview.getValue();
        else
            return 0x7fffffffffffffffL;
    }

    private void invalidateLabel()
    {
        if (mLabelTemplate != null && mAxis != null)
        {
            mLabelValue = mAxis.buildLabel(getResources(), mLabelTemplate, mValue);
            setContentDescription(mLabelTemplate);
            invalidateLabelOffset();
            invalidate();
            return;
        } else
        {
            mLabelValue = mValue;
            return;
        }
    }

    private void invalidateLabelTemplate()
    {
        if (mLabelTemplateRes != 0)
        {
            CharSequence charsequence = getResources().getText(mLabelTemplateRes);
            TextPaint textpaint = new TextPaint(1);
            textpaint.density = getResources().getDisplayMetrics().density;
            textpaint.setCompatibilityScaling(getResources().getCompatibilityInfo().applicationScale);
            textpaint.setColor(mLabelColor);
            textpaint.setShadowLayer(4F * textpaint.density, 0.0F, 0.0F, 0xff000000);
            mLabelTemplate = new SpannableStringBuilder(charsequence);
            mLabelLayout = new DynamicLayout(mLabelTemplate, textpaint, 1024, android.text.Layout.Alignment.ALIGN_RIGHT, 1.0F, 0.0F, false);
            invalidateLabel();
        } else
        {
            mLabelTemplate = null;
            mLabelLayout = null;
        }
        invalidate();
        requestLayout();
    }

    public void addOnLayoutChangeListener(android.view.View.OnLayoutChangeListener onlayoutchangelistener)
    {
    }

    public void addOnSweepListener(OnSweepListener onsweeplistener)
    {
        mListener = onsweeplistener;
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mSweep.isStateful())
            mSweep.setState(getDrawableState());
    }

    public ChartAxis getAxis()
    {
        return mAxis;
    }

    public int getFollowAxis()
    {
        return mFollowAxis;
    }

    public long getLabelValue()
    {
        return mLabelValue;
    }

    public Rect getMargins()
    {
        return mMargins;
    }

    public float getPoint()
    {
        if (isEnabled())
            return mAxis.convertToPoint(mValue);
        else
            return 0.0F;
    }

    public long getValue()
    {
        return mValue;
    }

    void init(ChartAxis chartaxis)
    {
        mAxis = (ChartAxis)Preconditions.checkNotNull(chartaxis, "missing axis");
    }

    public void invalidateLabelOffset()
    {
        int i = mFollowAxis;
        float f = 0.0F;
        if (i == 1)
            if (mValidAfterDynamic != null)
            {
                mLabelSize = Math.max(getLabelWidth(this), getLabelWidth(mValidAfterDynamic));
                float f2 = getLabelTop(mValidAfterDynamic) - getLabelBottom(this);
                int k = f2 != 0.0F;
                f = 0.0F;
                if (k < 0)
                    f = f2 / 2.0F;
            } else
            if (mValidBeforeDynamic != null)
            {
                mLabelSize = Math.max(getLabelWidth(this), getLabelWidth(mValidBeforeDynamic));
                float f1 = getLabelTop(this) - getLabelBottom(mValidBeforeDynamic);
                int j = f1 != 0.0F;
                f = 0.0F;
                if (j < 0)
                    f = -f1 / 2.0F;
            } else
            {
                mLabelSize = getLabelWidth(this);
                f = 0.0F;
            }
        mLabelSize = Math.max(mLabelSize, mLabelMinSize);
        if (f != mLabelOffset)
        {
            mLabelOffset = f;
            invalidate();
            if (mValidAfterDynamic != null)
                mValidAfterDynamic.invalidateLabelOffset();
            if (mValidBeforeDynamic != null)
                mValidBeforeDynamic.invalidateLabelOffset();
        }
    }

    public boolean isTouchCloserTo(MotionEvent motionevent, ChartSweepView chartsweepview)
    {
        float f = getTouchDistanceFromTarget(motionevent);
        return chartsweepview.getTouchDistanceFromTarget(motionevent) < f;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mSweep != null)
            mSweep.jumpToCurrentState();
    }

    protected void onDraw(Canvas canvas)
    {
        super.onDraw(canvas);
        int i = getWidth();
        int j = getHeight();
        int k;
        if (isEnabled() && mLabelLayout != null)
        {
            int l = canvas.save();
            canvas.translate((mLabelSize - 1024F) + (float)mContentOffset.left, (float)mContentOffset.top + mLabelOffset);
            mLabelLayout.draw(canvas);
            canvas.restoreToCount(l);
            k = (int)mLabelSize;
        } else
        {
            k = 0;
        }
        if (mFollowAxis == 1)
            mSweep.setBounds(k, mSweepOffset.y, i + mContentOffset.right, mSweepOffset.y + mSweep.getIntrinsicHeight());
        else
            mSweep.setBounds(mSweepOffset.x, k, mSweepOffset.x + mSweep.getIntrinsicWidth(), j + mContentOffset.bottom);
        mSweep.draw(canvas);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        invalidateLabelOffset();
    }

    protected void onMeasure(int i, int j)
    {
        if (isEnabled() && mLabelLayout != null)
        {
            int k2 = mSweep.getIntrinsicHeight();
            int l2 = mLabelLayout.getHeight();
            mSweepOffset.x = 0;
            mSweepOffset.y = 0;
            mSweepOffset.y = (int)((float)(l2 / 2) - getTargetInset());
            setMeasuredDimension(mSweep.getIntrinsicWidth(), Math.max(k2, l2));
        } else
        {
            mSweepOffset.x = 0;
            mSweepOffset.y = 0;
            setMeasuredDimension(mSweep.getIntrinsicWidth(), mSweep.getIntrinsicHeight());
        }
        if (mFollowAxis == 1)
        {
            int j2 = mSweep.getIntrinsicHeight() - mSweepPadding.top - mSweepPadding.bottom;
            mMargins.top = -(mSweepPadding.top + j2 / 2);
            mMargins.bottom = 0;
            mMargins.left = -mSweepPadding.left;
            mMargins.right = mSweepPadding.right;
        } else
        {
            int k = mSweep.getIntrinsicWidth() - mSweepPadding.left - mSweepPadding.right;
            mMargins.left = -(mSweepPadding.left + k / 2);
            mMargins.right = 0;
            mMargins.top = -mSweepPadding.top;
            mMargins.bottom = mSweepPadding.bottom;
        }
        mContentOffset.set(0, 0, 0, 0);
        int l = getMeasuredWidth();
        int i1 = getMeasuredHeight();
        if (mFollowAxis == 0)
        {
            int l1 = l * 3;
            setMeasuredDimension(l1, i1);
            mContentOffset.left = (l1 - l) / 2;
            int i2 = 2 * mSweepPadding.bottom;
            Rect rect2 = mContentOffset;
            rect2.bottom = rect2.bottom - i2;
            Rect rect3 = mMargins;
            rect3.bottom = i2 + rect3.bottom;
        } else
        {
            int j1 = i1 * 2;
            setMeasuredDimension(l, j1);
            mContentOffset.offset(0, (j1 - i1) / 2);
            int k1 = 2 * mSweepPadding.right;
            Rect rect = mContentOffset;
            rect.right = rect.right - k1;
            Rect rect1 = mMargins;
            rect1.right = k1 + rect1.right;
        }
        mSweepOffset.offset(mContentOffset.left, mContentOffset.top);
        mMargins.offset(-mSweepOffset.x, -mSweepOffset.y);
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (!isEnabled())
            return false;
        View view = (View)getParent();
        switch (motionevent.getAction())
        {
        case 1: // '\001'
            if (mTouchMode == 2)
                performClick();
            else
            if (mTouchMode == 1)
            {
                mTrackingStart = 0.0F;
                mTracking = null;
                mValue = mLabelValue;
                dispatchOnSweep(true);
                setTranslationX(0.0F);
                setTranslationY(0.0F);
                requestLayout();
            }
            mTouchMode = 0;
            return true;

        case 2: // '\002'
            if (mTouchMode == 2)
                return true;
            getParent().requestDisallowInterceptTouchEvent(true);
            Rect rect = getParentContentRect();
            Rect rect1 = computeClampRect(rect);
            if (rect1.isEmpty())
                return true;
            long l;
            if (mFollowAxis == 1)
            {
                float f2 = getTop() - mMargins.top;
                float f3 = MathUtils.constrain(mTrackingStart + (motionevent.getRawY() - mTracking.getRawY()), rect1.top, rect1.bottom);
                setTranslationY(f3 - f2);
                l = mAxis.convertToValue(f3 - (float)rect.top);
            } else
            {
                float f = getLeft() - mMargins.left;
                float f1 = MathUtils.constrain(mTrackingStart + (motionevent.getRawX() - mTracking.getRawX()), rect1.left, rect1.right);
                setTranslationX(f1 - f);
                l = mAxis.convertToValue(f1 - (float)rect.left);
            }
            setValue(l - l % mDragInterval);
            dispatchOnSweep(false);
            return true;

        case 0: // '\0'
            boolean flag;
            boolean flag1;
            if (mFollowAxis == 1)
            {
                if (motionevent.getX() > (float)(getWidth() - 8 * mSweepPadding.right))
                    flag = true;
                else
                    flag = false;
                if (mLabelLayout != null)
                {
                    if (motionevent.getX() < (float)mLabelLayout.getWidth())
                        flag1 = true;
                    else
                        flag1 = false;
                } else
                {
                    flag1 = false;
                }
            } else
            {
                if (motionevent.getY() > (float)(getHeight() - 8 * mSweepPadding.bottom))
                    flag = true;
                else
                    flag = false;
                if (mLabelLayout != null)
                {
                    if (motionevent.getY() < (float)mLabelLayout.getHeight())
                        flag1 = true;
                    else
                        flag1 = false;
                } else
                {
                    flag1 = false;
                }
            }
            MotionEvent motionevent1 = motionevent.copy();
            motionevent1.offsetLocation(getLeft(), getTop());
            ChartSweepView achartsweepview[] = mNeighbors;
            int i = achartsweepview.length;
            for (int j = 0; j < i; j++)
                if (isTouchCloserTo(motionevent1, achartsweepview[j]))
                    return false;

            if (flag)
            {
                if (mFollowAxis == 1)
                    mTrackingStart = getTop() - mMargins.top;
                else
                    mTrackingStart = getLeft() - mMargins.left;
                mTracking = motionevent.copy();
                mTouchMode = 1;
                if (!view.isActivated())
                    view.setActivated(true);
                return true;
            }
            if (flag1)
            {
                mTouchMode = 2;
                return true;
            } else
            {
                mTouchMode = 0;
                return false;
            }
        }
        return false;
    }

    public void removeOnLayoutChangeListener(android.view.View.OnLayoutChangeListener onlayoutchangelistener)
    {
    }

    public void setDragInterval(long l)
    {
        mDragInterval = l;
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        setFocusable(flag);
        requestLayout();
    }

    public void setFollowAxis(int i)
    {
        mFollowAxis = i;
    }

    public void setLabelColor(int i)
    {
        mLabelColor = i;
        invalidateLabelTemplate();
    }

    public void setLabelMinSize(int i)
    {
        mLabelMinSize = i;
        invalidateLabelTemplate();
    }

    public void setLabelTemplate(int i)
    {
        mLabelTemplateRes = i;
        invalidateLabelTemplate();
    }

    public void setMaxValue(long l)
    {
        mMaxValue = l;
    }

    public void setNeighborMargin(float f)
    {
        mNeighborMargin = f;
    }

    public transient void setNeighbors(ChartSweepView achartsweepview[])
    {
        mNeighbors = achartsweepview;
    }

    public void setSweepDrawable(Drawable drawable)
    {
        if (mSweep != null)
        {
            mSweep.setCallback(null);
            unscheduleDrawable(mSweep);
        }
        if (drawable != null)
        {
            drawable.setCallback(this);
            if (drawable.isStateful())
                drawable.setState(getDrawableState());
            boolean flag;
            if (getVisibility() == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
            mSweep = drawable;
            drawable.getPadding(mSweepPadding);
        } else
        {
            mSweep = null;
        }
        invalidate();
    }

    public void setValidRange(long l, long l1)
    {
        mValidAfter = l;
        mValidBefore = l1;
    }

    public void setValidRangeDynamic(ChartSweepView chartsweepview, ChartSweepView chartsweepview1)
    {
        mValidAfterDynamic = chartsweepview;
        mValidBeforeDynamic = chartsweepview1;
    }

    public void setValue(long l)
    {
        if (mMaxValue != -1L && l > mMaxValue)
        {
            Xlog.i("ChartSweepView", (new StringBuilder()).append("big value ").append(l).toString());
            mValue = mMaxValue;
        } else
        {
            mValue = l;
        }
        invalidateLabel();
    }

    public void setVisibility(int i)
    {
        super.setVisibility(i);
        if (mSweep != null)
        {
            Drawable drawable = mSweep;
            boolean flag;
            if (i == 0)
                flag = true;
            else
                flag = false;
            drawable.setVisible(flag, false);
        }
    }

    public int shouldAdjustAxis()
    {
        return mAxis.shouldAdjustAxis(getValue());
    }

    public void updateValueFromPosition()
    {
        Rect rect = getParentContentRect();
        if (mFollowAxis == 1)
        {
            float f1 = getY() - (float)mMargins.top - (float)rect.top;
            setValue(mAxis.convertToValue(f1));
            return;
        } else
        {
            float f = getX() - (float)mMargins.left - (float)rect.left;
            setValue(mAxis.convertToValue(f));
            return;
        }
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return drawable == mSweep || super.verifyDrawable(drawable);
    }

}
