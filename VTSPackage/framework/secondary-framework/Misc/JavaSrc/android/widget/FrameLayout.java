// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import java.util.ArrayList;

public class FrameLayout extends ViewGroup
{
    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        public int gravity;

        public LayoutParams(int i, int j)
        {
            super(i, j);
            gravity = -1;
        }

        public LayoutParams(int i, int j, int k)
        {
            super(i, j);
            gravity = -1;
            gravity = k;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            gravity = -1;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.FrameLayout_Layout);
            gravity = typedarray.getInt(0, -1);
            typedarray.recycle();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            gravity = -1;
        }

        public LayoutParams(android.view.ViewGroup.MarginLayoutParams marginlayoutparams)
        {
            super(marginlayoutparams);
            gravity = -1;
        }
    }


    private static final int DEFAULT_CHILD_GRAVITY = 0x800033;
    private Drawable mForeground;
    boolean mForegroundBoundsChanged;
    private int mForegroundGravity;
    protected boolean mForegroundInPadding;
    private int mForegroundPaddingBottom;
    private int mForegroundPaddingLeft;
    private int mForegroundPaddingRight;
    private int mForegroundPaddingTop;
    private final ArrayList mMatchParentChildren;
    boolean mMeasureAllChildren;
    private final Rect mOverlayBounds;
    private final Rect mSelfBounds;

    public FrameLayout(Context context)
    {
        super(context);
        mMeasureAllChildren = false;
        mForegroundPaddingLeft = 0;
        mForegroundPaddingTop = 0;
        mForegroundPaddingRight = 0;
        mForegroundPaddingBottom = 0;
        mSelfBounds = new Rect();
        mOverlayBounds = new Rect();
        mForegroundGravity = 119;
        mForegroundInPadding = true;
        mForegroundBoundsChanged = false;
        mMatchParentChildren = new ArrayList(1);
    }

    public FrameLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public FrameLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mMeasureAllChildren = false;
        mForegroundPaddingLeft = 0;
        mForegroundPaddingTop = 0;
        mForegroundPaddingRight = 0;
        mForegroundPaddingBottom = 0;
        mSelfBounds = new Rect();
        mOverlayBounds = new Rect();
        mForegroundGravity = 119;
        mForegroundInPadding = true;
        mForegroundBoundsChanged = false;
        mMatchParentChildren = new ArrayList(1);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.FrameLayout, i, 0);
        mForegroundGravity = typedarray.getInt(2, mForegroundGravity);
        Drawable drawable = typedarray.getDrawable(0);
        if (drawable != null)
            setForeground(drawable);
        if (typedarray.getBoolean(1, false))
            setMeasureAllChildren(true);
        mForegroundInPadding = typedarray.getBoolean(3, true);
        typedarray.recycle();
    }

    private int getPaddingBottomWithForeground()
    {
        if (mForegroundInPadding)
            return Math.max(super.mPaddingBottom, mForegroundPaddingBottom);
        else
            return super.mPaddingBottom + mForegroundPaddingBottom;
    }

    private int getPaddingLeftWithForeground()
    {
        if (mForegroundInPadding)
            return Math.max(super.mPaddingLeft, mForegroundPaddingLeft);
        else
            return super.mPaddingLeft + mForegroundPaddingLeft;
    }

    private int getPaddingRightWithForeground()
    {
        if (mForegroundInPadding)
            return Math.max(super.mPaddingRight, mForegroundPaddingRight);
        else
            return super.mPaddingRight + mForegroundPaddingRight;
    }

    private int getPaddingTopWithForeground()
    {
        if (mForegroundInPadding)
            return Math.max(super.mPaddingTop, mForegroundPaddingTop);
        else
            return super.mPaddingTop + mForegroundPaddingTop;
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        if (mForeground != null)
        {
            Drawable drawable = mForeground;
            if (mForegroundBoundsChanged)
            {
                mForegroundBoundsChanged = false;
                Rect rect = mSelfBounds;
                Rect rect1 = mOverlayBounds;
                int i = super.mRight - super.mLeft;
                int j = super.mBottom - super.mTop;
                if (mForegroundInPadding)
                    rect.set(0, 0, i, j);
                else
                    rect.set(super.mPaddingLeft, super.mPaddingTop, i - super.mPaddingRight, j - super.mPaddingBottom);
                int k = getLayoutDirection();
                Gravity.apply(mForegroundGravity, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), rect, rect1, k);
                drawable.setBounds(rect1);
            }
            drawable.draw(canvas);
        }
    }

    protected void drawableStateChanged()
    {
        super.drawableStateChanged();
        if (mForeground != null && mForeground.isStateful())
            mForeground.setState(getDrawableState());
    }

    public boolean gatherTransparentRegion(Region region)
    {
        boolean flag = super.gatherTransparentRegion(region);
        if (region != null && mForeground != null)
            applyDrawableToTransparentRegion(mForeground, region);
        return flag;
    }

    protected volatile android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return generateDefaultLayoutParams();
    }

    protected LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams(-1, -1);
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    public boolean getConsiderGoneChildrenWhenMeasuring()
    {
        return getMeasureAllChildren();
    }

    public Drawable getForeground()
    {
        return mForeground;
    }

    public int getForegroundGravity()
    {
        return mForegroundGravity;
    }

    public boolean getMeasureAllChildren()
    {
        return mMeasureAllChildren;
    }

    public void jumpDrawablesToCurrentState()
    {
        super.jumpDrawablesToCurrentState();
        if (mForeground != null)
            mForeground.jumpToCurrentState();
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/FrameLayout.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/FrameLayout.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = getChildCount();
        int j1 = getPaddingLeftWithForeground();
        int k1 = k - i - getPaddingRightWithForeground();
        int l1 = getPaddingTopWithForeground();
        int i2 = l - j - getPaddingBottomWithForeground();
        mForegroundBoundsChanged = true;
        for (int j2 = 0; j2 < i1; j2++)
        {
            View view = getChildAt(j2);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            int k2 = view.getMeasuredWidth();
            int l2 = view.getMeasuredHeight();
            int i3 = layoutparams.gravity;
            if (i3 == -1)
                i3 = 0x800033;
            int j3 = Gravity.getAbsoluteGravity(i3, getLayoutDirection());
            int k3 = i3 & 0x70;
            int l3;
            switch (j3 & 7)
            {
            case 5: // '\005'
                l3 = k1 - k2 - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                break;

            case 1: // '\001'
                l3 = (j1 + (k1 - j1 - k2) / 2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin) - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                break;

            case 3: // '\003'
                l3 = j1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
                break;

            case 2: // '\002'
            case 4: // '\004'
            default:
                l3 = j1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
                break;
            }
            int i4;
            switch (k3)
            {
            case 80: // 'P'
                i4 = i2 - l2 - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
                break;

            case 16: // '\020'
                i4 = (l1 + (i2 - l1 - l2) / 2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin) - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
                break;

            case 48: // '0'
                i4 = l1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
                break;

            default:
                i4 = l1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
                break;
            }
            view.layout(l3, i4, l3 + k2, i4 + l2);
        }

    }

    protected void onMeasure(int i, int j)
    {
        int k = getChildCount();
        boolean flag;
        if (android.view.View.MeasureSpec.getMode(i) == 0x40000000 && android.view.View.MeasureSpec.getMode(j) == 0x40000000)
            flag = false;
        else
            flag = true;
        mMatchParentChildren.clear();
        int l = 0;
        int i1 = 0;
        int j1 = 0;
        for (int k1 = 0; k1 < k; k1++)
        {
            View view1 = getChildAt(k1);
            if (!mMeasureAllChildren && view1.getVisibility() == 8)
                continue;
            measureChildWithMargins(view1, i, 0, j, 0);
            LayoutParams layoutparams = (LayoutParams)view1.getLayoutParams();
            i1 = Math.max(i1, view1.getMeasuredWidth() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin);
            l = Math.max(l, view1.getMeasuredHeight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin);
            j1 = combineMeasuredStates(j1, view1.getMeasuredState());
            if (flag && (((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1 || ((android.view.ViewGroup.LayoutParams) (layoutparams)).height == -1))
                mMatchParentChildren.add(view1);
        }

        int l1 = i1 + (getPaddingLeftWithForeground() + getPaddingRightWithForeground());
        int i2 = Math.max(l + (getPaddingTopWithForeground() + getPaddingBottomWithForeground()), getSuggestedMinimumHeight());
        int j2 = Math.max(l1, getSuggestedMinimumWidth());
        Drawable drawable = getForeground();
        if (drawable != null)
        {
            i2 = Math.max(i2, drawable.getMinimumHeight());
            j2 = Math.max(j2, drawable.getMinimumWidth());
        }
        setMeasuredDimension(resolveSizeAndState(j2, i, j1), resolveSizeAndState(i2, j, j1 << 16));
        int k2 = mMatchParentChildren.size();
        if (k2 > 1)
        {
            for (int l2 = 0; l2 < k2; l2++)
            {
                View view = (View)mMatchParentChildren.get(l2);
                android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
                int i3;
                if (((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).width == -1)
                    i3 = android.view.View.MeasureSpec.makeMeasureSpec(getMeasuredWidth() - getPaddingLeftWithForeground() - getPaddingRightWithForeground() - marginlayoutparams.leftMargin - marginlayoutparams.rightMargin, 0x40000000);
                else
                    i3 = getChildMeasureSpec(i, getPaddingLeftWithForeground() + getPaddingRightWithForeground() + marginlayoutparams.leftMargin + marginlayoutparams.rightMargin, ((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).width);
                int j3;
                if (((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).height == -1)
                    j3 = android.view.View.MeasureSpec.makeMeasureSpec(getMeasuredHeight() - getPaddingTopWithForeground() - getPaddingBottomWithForeground() - marginlayoutparams.topMargin - marginlayoutparams.bottomMargin, 0x40000000);
                else
                    j3 = getChildMeasureSpec(j, getPaddingTopWithForeground() + getPaddingBottomWithForeground() + marginlayoutparams.topMargin + marginlayoutparams.bottomMargin, ((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).height);
                view.measure(i3, j3);
            }

        }
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        mForegroundBoundsChanged = true;
    }

    public void setForeground(Drawable drawable)
    {
        if (mForeground != drawable)
        {
            if (mForeground != null)
            {
                mForeground.setCallback(null);
                unscheduleDrawable(mForeground);
            }
            mForeground = drawable;
            mForegroundPaddingLeft = 0;
            mForegroundPaddingTop = 0;
            mForegroundPaddingRight = 0;
            mForegroundPaddingBottom = 0;
            if (drawable != null)
            {
                setWillNotDraw(false);
                drawable.setCallback(this);
                if (drawable.isStateful())
                    drawable.setState(getDrawableState());
                if (mForegroundGravity == 119)
                {
                    Rect rect = new Rect();
                    if (drawable.getPadding(rect))
                    {
                        mForegroundPaddingLeft = rect.left;
                        mForegroundPaddingTop = rect.top;
                        mForegroundPaddingRight = rect.right;
                        mForegroundPaddingBottom = rect.bottom;
                    }
                }
            } else
            {
                setWillNotDraw(true);
            }
            requestLayout();
            invalidate();
        }
    }

    public void setForegroundGravity(int i)
    {
        if (mForegroundGravity != i)
        {
            if ((0x800007 & i) == 0)
                i |= 0x800003;
            if ((i & 0x70) == 0)
                i |= 0x30;
            mForegroundGravity = i;
            if (mForegroundGravity == 119 && mForeground != null)
            {
                Rect rect = new Rect();
                if (mForeground.getPadding(rect))
                {
                    mForegroundPaddingLeft = rect.left;
                    mForegroundPaddingTop = rect.top;
                    mForegroundPaddingRight = rect.right;
                    mForegroundPaddingBottom = rect.bottom;
                }
            } else
            {
                mForegroundPaddingLeft = 0;
                mForegroundPaddingTop = 0;
                mForegroundPaddingRight = 0;
                mForegroundPaddingBottom = 0;
            }
            requestLayout();
        }
    }

    public void setMeasureAllChildren(boolean flag)
    {
        mMeasureAllChildren = flag;
    }

    public boolean shouldDelayChildPressedState()
    {
        return false;
    }

    protected boolean verifyDrawable(Drawable drawable)
    {
        return super.verifyDrawable(drawable) || drawable == mForeground;
    }
}
