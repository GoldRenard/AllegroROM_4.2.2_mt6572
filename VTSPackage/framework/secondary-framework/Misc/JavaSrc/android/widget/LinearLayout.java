// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

public class LinearLayout extends ViewGroup
{
    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        public int gravity;
        public float weight;

        public String debug(String s)
        {
            return (new StringBuilder()).append(s).append("LinearLayout.LayoutParams={width=").append(sizeToString(super.width)).append(", height=").append(sizeToString(super.height)).append(" weight=").append(weight).append("}").toString();
        }

        public LayoutParams(int i, int j)
        {
            super(i, j);
            gravity = -1;
            weight = 0.0F;
        }

        public LayoutParams(int i, int j, float f)
        {
            super(i, j);
            gravity = -1;
            weight = f;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            gravity = -1;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.LinearLayout_Layout);
            weight = typedarray.getFloat(3, 0.0F);
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


    public static final int HORIZONTAL = 0;
    private static final int INDEX_BOTTOM = 2;
    private static final int INDEX_CENTER_VERTICAL = 0;
    private static final int INDEX_FILL = 3;
    private static final int INDEX_TOP = 1;
    public static final int SHOW_DIVIDER_BEGINNING = 1;
    public static final int SHOW_DIVIDER_END = 4;
    public static final int SHOW_DIVIDER_MIDDLE = 2;
    public static final int SHOW_DIVIDER_NONE = 0;
    public static final int VERTICAL = 1;
    private static final int VERTICAL_GRAVITY_COUNT = 4;
    private boolean mBaselineAligned;
    private int mBaselineAlignedChildIndex;
    private int mBaselineChildTop;
    private Drawable mDivider;
    private int mDividerHeight;
    private int mDividerPadding;
    private int mDividerWidth;
    private int mGravity;
    private int mMaxAscent[];
    private int mMaxDescent[];
    private int mOrientation;
    private int mShowDividers;
    private int mTotalLength;
    private boolean mUseLargestChild;
    private float mWeightSum;

    public LinearLayout(Context context)
    {
        super(context);
        mBaselineAligned = true;
        mBaselineAlignedChildIndex = -1;
        mBaselineChildTop = 0;
        mGravity = 0x800033;
    }

    public LinearLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public LinearLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mBaselineAligned = true;
        mBaselineAlignedChildIndex = -1;
        mBaselineChildTop = 0;
        mGravity = 0x800033;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.LinearLayout, i, 0);
        int j = typedarray.getInt(1, -1);
        if (j >= 0)
            setOrientation(j);
        int k = typedarray.getInt(0, -1);
        if (k >= 0)
            setGravity(k);
        boolean flag = typedarray.getBoolean(2, true);
        if (!flag)
            setBaselineAligned(flag);
        mWeightSum = typedarray.getFloat(4, -1F);
        mBaselineAlignedChildIndex = typedarray.getInt(3, -1);
        mUseLargestChild = typedarray.getBoolean(6, false);
        setDividerDrawable(typedarray.getDrawable(5));
        mShowDividers = typedarray.getInt(7, 0);
        mDividerPadding = typedarray.getDimensionPixelSize(8, 0);
        typedarray.recycle();
    }

    private void forceUniformHeight(int i, int j)
    {
        int k = android.view.View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0x40000000);
        for (int l = 0; l < i; l++)
        {
            View view = getVirtualChildAt(l);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (((android.view.ViewGroup.LayoutParams) (layoutparams)).height == -1)
            {
                int i1 = ((android.view.ViewGroup.LayoutParams) (layoutparams)).width;
                layoutparams.width = view.getMeasuredWidth();
                measureChildWithMargins(view, j, 0, k, 0);
                layoutparams.width = i1;
            }
        }

    }

    private void forceUniformWidth(int i, int j)
    {
        int k = android.view.View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 0x40000000);
        for (int l = 0; l < i; l++)
        {
            View view = getVirtualChildAt(l);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1)
            {
                int i1 = ((android.view.ViewGroup.LayoutParams) (layoutparams)).height;
                layoutparams.height = view.getMeasuredHeight();
                measureChildWithMargins(view, k, 0, j, 0);
                layoutparams.height = i1;
            }
        }

    }

    private void setChildFrame(View view, int i, int j, int k, int l)
    {
        view.layout(i, j, i + k, j + l);
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    void drawDividersHorizontal(Canvas canvas)
    {
        int i = getVirtualChildCount();
        boolean flag = isLayoutRtl();
        for (int j = 0; j < i; j++)
        {
            View view1 = getVirtualChildAt(j);
            if (view1 == null || view1.getVisibility() == 8 || !hasDividerBeforeChildAt(j))
                continue;
            LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
            int l;
            if (flag)
                l = view1.getRight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).rightMargin;
            else
                l = view1.getLeft() - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).leftMargin - mDividerWidth;
            drawVerticalDivider(canvas, l);
        }

        if (hasDividerBeforeChildAt(i))
        {
            View view = getVirtualChildAt(i - 1);
            int k;
            if (view == null)
            {
                if (flag)
                    k = getPaddingLeft();
                else
                    k = getWidth() - getPaddingRight() - mDividerWidth;
            } else
            {
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                if (flag)
                    k = view.getLeft() - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin - mDividerWidth;
                else
                    k = view.getRight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
            }
            drawVerticalDivider(canvas, k);
        }
    }

    void drawDividersVertical(Canvas canvas)
    {
        int i = getVirtualChildCount();
        for (int j = 0; j < i; j++)
        {
            View view1 = getVirtualChildAt(j);
            if (view1 != null && view1.getVisibility() != 8 && hasDividerBeforeChildAt(j))
            {
                LayoutParams layoutparams1 = (LayoutParams)view1.getLayoutParams();
                drawHorizontalDivider(canvas, view1.getTop() - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).topMargin - mDividerHeight);
            }
        }

        if (hasDividerBeforeChildAt(i))
        {
            View view = getVirtualChildAt(i - 1);
            int k;
            if (view == null)
            {
                k = getHeight() - getPaddingBottom() - mDividerHeight;
            } else
            {
                LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
                k = view.getBottom() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
            }
            drawHorizontalDivider(canvas, k);
        }
    }

    void drawHorizontalDivider(Canvas canvas, int i)
    {
        mDivider.setBounds(getPaddingLeft() + mDividerPadding, i, getWidth() - getPaddingRight() - mDividerPadding, i + mDividerHeight);
        mDivider.draw(canvas);
    }

    void drawVerticalDivider(Canvas canvas, int i)
    {
        mDivider.setBounds(i, getPaddingTop() + mDividerPadding, i + mDividerWidth, getHeight() - getPaddingBottom() - mDividerPadding);
        mDivider.draw(canvas);
    }

    protected volatile android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return generateDefaultLayoutParams();
    }

    protected LayoutParams generateDefaultLayoutParams()
    {
        if (mOrientation == 0)
            return new LayoutParams(-2, -2);
        if (mOrientation == 1)
            return new LayoutParams(-1, -2);
        else
            return null;
    }

    public volatile android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return generateLayoutParams(attributeset);
    }

    protected volatile android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return generateLayoutParams(layoutparams);
    }

    public LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    public int getBaseline()
    {
        View view;
        int j;
label0:
        {
            int i = -1;
            if (mBaselineAlignedChildIndex < 0)
            {
                i = super.getBaseline();
            } else
            {
                if (getChildCount() <= mBaselineAlignedChildIndex)
                    throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
                view = getChildAt(mBaselineAlignedChildIndex);
                j = view.getBaseline();
                if (j != i)
                    break label0;
                if (mBaselineAlignedChildIndex != 0)
                    throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
            }
            return i;
        }
        int k = mBaselineChildTop;
        if (mOrientation == 1)
        {
            int l = 0x70 & mGravity;
            if (l != 48)
                switch (l)
                {
                case 16: // '\020'
                    k += (super.mBottom - super.mTop - super.mPaddingTop - super.mPaddingBottom - mTotalLength) / 2;
                    break;

                case 80: // 'P'
                    k = super.mBottom - super.mTop - super.mPaddingBottom - mTotalLength;
                    break;
                }
        }
        return j + (k + ((android.view.ViewGroup.MarginLayoutParams) ((LayoutParams)view.getLayoutParams())).topMargin);
    }

    public int getBaselineAlignedChildIndex()
    {
        return mBaselineAlignedChildIndex;
    }

    int getChildrenSkipCount(View view, int i)
    {
        return 0;
    }

    public Drawable getDividerDrawable()
    {
        return mDivider;
    }

    public int getDividerPadding()
    {
        return mDividerPadding;
    }

    public int getDividerWidth()
    {
        return mDividerWidth;
    }

    int getLocationOffset(View view)
    {
        return 0;
    }

    int getNextLocationOffset(View view)
    {
        return 0;
    }

    public int getOrientation()
    {
        return mOrientation;
    }

    public int getShowDividers()
    {
        return mShowDividers;
    }

    View getVirtualChildAt(int i)
    {
        return getChildAt(i);
    }

    int getVirtualChildCount()
    {
        return getChildCount();
    }

    public float getWeightSum()
    {
        return mWeightSum;
    }

    protected boolean hasDividerBeforeChildAt(int i)
    {
label0:
        {
            if (i == 0)
            {
                if ((1 & mShowDividers) == 0)
                    return false;
            } else
            {
                if (i != getChildCount())
                    break label0;
                if ((4 & mShowDividers) == 0)
                    return false;
            }
            return true;
        }
        if ((2 & mShowDividers) != 0)
        {
            int j = i - 1;
            do
            {
label1:
                {
                    boolean flag = false;
                    if (j >= 0)
                    {
                        if (getChildAt(j).getVisibility() == 8)
                            break label1;
                        flag = true;
                    }
                    return flag;
                }
                j--;
            } while (true);
        } else
        {
            return false;
        }
    }

    public boolean isBaselineAligned()
    {
        return mBaselineAligned;
    }

    public boolean isMeasureWithLargestChildEnabled()
    {
        return mUseLargestChild;
    }

    void layoutHorizontal()
    {
        boolean flag = isLayoutRtl();
        int i = super.mPaddingTop;
        int j = super.mBottom - super.mTop;
        int k = j - super.mPaddingBottom;
        int l = j - i - super.mPaddingBottom;
        int i1 = getVirtualChildCount();
        int j1 = 0x800007 & mGravity;
        int k1 = 0x70 & mGravity;
        boolean flag1 = mBaselineAligned;
        int ai[] = mMaxAscent;
        int ai1[] = mMaxDescent;
        int l1;
        switch (Gravity.getAbsoluteGravity(j1, getLayoutDirection()))
        {
        case 1: // '\001'
            l1 = super.mPaddingLeft + (super.mRight - super.mLeft - mTotalLength) / 2;
            break;

        case 5: // '\005'
            l1 = (super.mPaddingLeft + super.mRight) - super.mLeft - mTotalLength;
            break;

        default:
            l1 = super.mPaddingLeft;
            break;
        }
        byte byte0 = 1;
        int i2 = 0;
        if (flag)
        {
            i2 = i1 - 1;
            byte0 = -1;
        }
        for (int j2 = 0; j2 < i1; j2++)
        {
            int k2 = i2 + byte0 * j2;
            View view = getVirtualChildAt(k2);
            if (view == null)
            {
                l1 += measureNullChild(k2);
                continue;
            }
            if (view.getVisibility() == 8)
                continue;
            int l2 = view.getMeasuredWidth();
            int i3 = view.getMeasuredHeight();
            int j3 = -1;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (flag1 && ((android.view.ViewGroup.LayoutParams) (layoutparams)).height != -1)
                j3 = view.getBaseline();
            int k3 = layoutparams.gravity;
            if (k3 < 0)
                k3 = k1;
            int l3;
            switch (k3 & 0x70)
            {
            case 80: // 'P'
                l3 = k - i3 - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
                if (j3 != -1)
                {
                    int j4 = view.getMeasuredHeight() - j3;
                    l3 -= ai1[2] - j4;
                }
                break;

            case 16: // '\020'
                l3 = (i + (l - i3) / 2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin) - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
                break;

            case 48: // '0'
                l3 = i + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
                if (j3 != -1)
                    l3 += ai[1] - j3;
                break;

            default:
                l3 = i;
                break;
            }
            if (hasDividerBeforeChildAt(k2))
                l1 += mDividerWidth;
            int i4 = l1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
            setChildFrame(view, i4 + getLocationOffset(view), l3, l2, i3);
            l1 = i4 + (l2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin + getNextLocationOffset(view));
            j2 += getChildrenSkipCount(view, k2);
        }

    }

    void layoutVertical()
    {
        int i = super.mPaddingLeft;
        int j = super.mRight - super.mLeft;
        int k = j - super.mPaddingRight;
        int l = j - i - super.mPaddingRight;
        int i1 = getVirtualChildCount();
        int j1 = 0x70 & mGravity;
        int k1 = 0x800007 & mGravity;
        int l1;
        switch (j1)
        {
        case 16: // '\020'
            l1 = super.mPaddingTop + (super.mBottom - super.mTop - mTotalLength) / 2;
            break;

        case 80: // 'P'
            l1 = (super.mPaddingTop + super.mBottom) - super.mTop - mTotalLength;
            break;

        default:
            l1 = super.mPaddingTop;
            break;
        }
        for (int i2 = 0; i2 < i1; i2++)
        {
            View view = getVirtualChildAt(i2);
            if (view == null)
            {
                l1 += measureNullChild(i2);
                continue;
            }
            if (view.getVisibility() == 8)
                continue;
            int j2 = view.getMeasuredWidth();
            int k2 = view.getMeasuredHeight();
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            int l2 = layoutparams.gravity;
            if (l2 < 0)
                l2 = k1;
            int i3;
            switch (7 & Gravity.getAbsoluteGravity(l2, getLayoutDirection()))
            {
            case 5: // '\005'
                i3 = k - j2 - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                break;

            case 1: // '\001'
                i3 = (i + (l - j2) / 2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin) - ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                break;

            default:
                i3 = i + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin;
                break;
            }
            if (hasDividerBeforeChildAt(i2))
                l1 += mDividerHeight;
            int j3 = l1 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin;
            setChildFrame(view, i3, j3 + getLocationOffset(view), j2, k2);
            l1 = j3 + (k2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin + getNextLocationOffset(view));
            i2 += getChildrenSkipCount(view, i2);
        }

    }

    void measureChildBeforeLayout(View view, int i, int j, int k, int l, int i1)
    {
        measureChildWithMargins(view, j, k, l, i1);
    }

    void measureHorizontal(int i, int j)
    {
        mTotalLength = 0;
        int k = 0;
        int l = 0;
        int i1 = 0;
        int j1 = 0;
        boolean flag = true;
        float f = 0.0F;
        int k1 = getVirtualChildCount();
        int l1 = android.view.View.MeasureSpec.getMode(i);
        int i2 = android.view.View.MeasureSpec.getMode(j);
        boolean flag1 = false;
        if (mMaxAscent == null || mMaxDescent == null)
        {
            mMaxAscent = new int[4];
            mMaxDescent = new int[4];
        }
        int ai[] = mMaxAscent;
        int ai1[] = mMaxDescent;
        ai[3] = -1;
        ai[2] = -1;
        ai[1] = -1;
        ai[0] = -1;
        ai1[3] = -1;
        ai1[2] = -1;
        ai1[1] = -1;
        ai1[0] = -1;
        boolean flag2 = mBaselineAligned;
        boolean flag3 = mUseLargestChild;
        boolean flag4;
        if (l1 == 0x40000000)
            flag4 = true;
        else
            flag4 = false;
        int j2 = 0x80000000;
        for (int k2 = 0; k2 < k1; k2++)
        {
            View view3 = getVirtualChildAt(k2);
            if (view3 == null)
            {
                mTotalLength = mTotalLength + measureNullChild(k2);
                continue;
            }
            if (view3.getVisibility() == 8)
            {
                k2 += getChildrenSkipCount(view3, k2);
                continue;
            }
            if (hasDividerBeforeChildAt(k2))
                mTotalLength = mTotalLength + mDividerWidth;
            LayoutParams layoutparams2 = (LayoutParams)view3.getLayoutParams();
            f += layoutparams2.weight;
            if (l1 == 0x40000000 && ((android.view.ViewGroup.LayoutParams) (layoutparams2)).width == 0 && layoutparams2.weight > 0.0F)
            {
                if (flag4)
                {
                    mTotalLength = mTotalLength + (((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin);
                } else
                {
                    int j10 = mTotalLength;
                    mTotalLength = Math.max(j10, j10 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin);
                }
                view3.resetMeasuredWidthDimension();
                if (flag2)
                {
                    int k10 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
                    view3.measure(k10, k10);
                }
            } else
            {
                int k7 = 0x80000000;
                if (((android.view.ViewGroup.LayoutParams) (layoutparams2)).width == 0 && layoutparams2.weight > 0.0F)
                {
                    k7 = 0;
                    layoutparams2.width = -2;
                }
                int l7;
                if (f == 0.0F)
                    l7 = mTotalLength;
                else
                    l7 = 0;
                measureChildBeforeLayout(view3, k2, i, l7, j, 0);
                if (k7 != 0x80000000)
                    layoutparams2.width = k7;
                int i8 = view3.getMeasuredWidth();
                if (flag4)
                {
                    mTotalLength = mTotalLength + (i8 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin + getNextLocationOffset(view3));
                } else
                {
                    int j8 = mTotalLength;
                    mTotalLength = Math.max(j8, j8 + i8 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin + getNextLocationOffset(view3));
                }
                if (flag3)
                    j2 = Math.max(i8, j2);
            }
            boolean flag6 = false;
            if (i2 != 0x40000000)
            {
                int i10 = ((android.view.ViewGroup.LayoutParams) (layoutparams2)).height;
                flag6 = false;
                if (i10 == -1)
                {
                    flag1 = true;
                    flag6 = true;
                }
            }
            int k8 = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).bottomMargin;
            int l8 = k8 + view3.getMeasuredHeight();
            int i9 = view3.getMeasuredState();
            l = combineMeasuredStates(l, i9);
            if (flag2)
            {
                int j9 = view3.getBaseline();
                if (j9 != -1)
                {
                    int k9;
                    if (layoutparams2.gravity < 0)
                        k9 = mGravity;
                    else
                        k9 = layoutparams2.gravity;
                    int l9 = (-2 & (k9 & 0x70) >> 4) >> 1;
                    ai[l9] = Math.max(ai[l9], j9);
                    ai1[l9] = Math.max(ai1[l9], l8 - j9);
                }
            }
            k = Math.max(k, l8);
            if (flag && ((android.view.ViewGroup.LayoutParams) (layoutparams2)).height == -1)
                flag = true;
            else
                flag = false;
            if (layoutparams2.weight > 0.0F)
            {
                if (!flag6)
                    k8 = l8;
                j1 = Math.max(j1, k8);
            } else
            {
                if (!flag6)
                    k8 = l8;
                i1 = Math.max(i1, k8);
            }
            k2 += getChildrenSkipCount(view3, k2);
        }

        if (mTotalLength > 0 && hasDividerBeforeChildAt(k1))
            mTotalLength = mTotalLength + mDividerWidth;
        if (ai[1] != -1 || ai[0] != -1 || ai[2] != -1 || ai[3] != -1)
        {
            int l2 = Math.max(ai[3], Math.max(ai[0], Math.max(ai[1], ai[2]))) + Math.max(ai1[3], Math.max(ai1[0], Math.max(ai1[1], ai1[2])));
            k = Math.max(k, l2);
        }
        if (flag3 && (l1 == 0x80000000 || l1 == 0))
        {
            mTotalLength = 0;
            for (int i7 = 0; i7 < k1; i7++)
            {
                View view2 = getVirtualChildAt(i7);
                if (view2 == null)
                {
                    mTotalLength = mTotalLength + measureNullChild(i7);
                    continue;
                }
                if (view2.getVisibility() == 8)
                {
                    i7 += getChildrenSkipCount(view2, i7);
                    continue;
                }
                LayoutParams layoutparams1 = (LayoutParams)view2.getLayoutParams();
                if (flag4)
                {
                    mTotalLength = mTotalLength + (j2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).rightMargin + getNextLocationOffset(view2));
                } else
                {
                    int j7 = mTotalLength;
                    mTotalLength = Math.max(j7, j7 + j2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).rightMargin + getNextLocationOffset(view2));
                }
            }

        }
        mTotalLength = mTotalLength + (super.mPaddingLeft + super.mPaddingRight);
        int i3 = resolveSizeAndState(Math.max(mTotalLength, getSuggestedMinimumWidth()), i, 0);
        int j3 = (i3 & 0xffffff) - mTotalLength;
        if (j3 != 0 && f > 0.0F)
        {
            float f1;
            if (mWeightSum > 0.0F)
                f1 = mWeightSum;
            else
                f1 = f;
            ai[3] = -1;
            ai[2] = -1;
            ai[1] = -1;
            ai[0] = -1;
            ai1[3] = -1;
            ai1[2] = -1;
            ai1[1] = -1;
            ai1[0] = -1;
            k = -1;
            mTotalLength = 0;
            for (int i4 = 0; i4 < k1; i4++)
            {
                View view1 = getVirtualChildAt(i4);
                if (view1 == null || view1.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams = (LayoutParams)view1.getLayoutParams();
                float f2 = layoutparams.weight;
                if (f2 > 0.0F)
                {
                    int i6 = (int)((f2 * (float)j3) / f1);
                    f1 -= f2;
                    j3 -= i6;
                    int j6 = getChildMeasureSpec(j, super.mPaddingTop + super.mPaddingBottom + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
                    if (((android.view.ViewGroup.LayoutParams) (layoutparams)).width == 0 && l1 == 0x40000000)
                    {
                        if (i6 <= 0)
                            i6 = 0;
                        view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(i6, 0x40000000), j6);
                    } else
                    {
                        int k6 = i6 + view1.getMeasuredWidth();
                        if (k6 < 0)
                            k6 = 0;
                        view1.measure(android.view.View.MeasureSpec.makeMeasureSpec(k6, 0x40000000), j6);
                    }
                    int l6 = 0xff000000 & view1.getMeasuredState();
                    l = combineMeasuredStates(l, l6);
                }
                if (flag4)
                {
                    mTotalLength = mTotalLength + (view1.getMeasuredWidth() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin + getNextLocationOffset(view1));
                } else
                {
                    int k4 = mTotalLength;
                    mTotalLength = Math.max(k4, k4 + view1.getMeasuredWidth() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin + getNextLocationOffset(view1));
                }
                boolean flag5;
                if (i2 != 0x40000000 && ((android.view.ViewGroup.LayoutParams) (layoutparams)).height == -1)
                    flag5 = true;
                else
                    flag5 = false;
                int l4 = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin;
                int i5 = l4 + view1.getMeasuredHeight();
                k = Math.max(k, i5);
                if (!flag5)
                    l4 = i5;
                i1 = Math.max(i1, l4);
                if (flag && ((android.view.ViewGroup.LayoutParams) (layoutparams)).height == -1)
                    flag = true;
                else
                    flag = false;
                if (!flag2)
                    continue;
                int j5 = view1.getBaseline();
                if (j5 == -1)
                    continue;
                int k5;
                if (layoutparams.gravity < 0)
                    k5 = mGravity;
                else
                    k5 = layoutparams.gravity;
                int l5 = (-2 & (k5 & 0x70) >> 4) >> 1;
                ai[l5] = Math.max(ai[l5], j5);
                ai1[l5] = Math.max(ai1[l5], i5 - j5);
            }

            mTotalLength = mTotalLength + (super.mPaddingLeft + super.mPaddingRight);
            if (ai[1] != -1 || ai[0] != -1 || ai[2] != -1 || ai[3] != -1)
            {
                int j4 = Math.max(ai[3], Math.max(ai[0], Math.max(ai[1], ai[2]))) + Math.max(ai1[3], Math.max(ai1[0], Math.max(ai1[1], ai1[2])));
                k = Math.max(k, j4);
            }
        } else
        {
            i1 = Math.max(i1, j1);
            if (flag3 && l1 != 0x40000000)
            {
                for (int l3 = 0; l3 < k1; l3++)
                {
                    View view = getVirtualChildAt(l3);
                    if (view != null && view.getVisibility() != 8 && ((LayoutParams)view.getLayoutParams()).weight > 0.0F)
                        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(j2, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(view.getMeasuredHeight(), 0x40000000));
                }

            }
        }
        if (!flag && i2 != 0x40000000)
            k = i1;
        int k3 = Math.max(k + (super.mPaddingTop + super.mPaddingBottom), getSuggestedMinimumHeight());
        setMeasuredDimension(i3 | 0xff000000 & l, resolveSizeAndState(k3, j, l << 16));
        if (flag1)
            forceUniformHeight(k1, i);
    }

    int measureNullChild(int i)
    {
        return 0;
    }

    void measureVertical(int i, int j)
    {
        mTotalLength = 0;
        int k = 0;
        int l = 0;
        int i1 = 0;
        int j1 = 0;
        boolean flag = true;
        float f = 0.0F;
        int k1 = getVirtualChildCount();
        int l1 = android.view.View.MeasureSpec.getMode(i);
        int i2 = android.view.View.MeasureSpec.getMode(j);
        boolean flag1 = false;
        int j2 = mBaselineAlignedChildIndex;
        boolean flag2 = mUseLargestChild;
        int k2 = 0x80000000;
        for (int l2 = 0; l2 < k1; l2++)
        {
            View view3 = getVirtualChildAt(l2);
            if (view3 == null)
            {
                mTotalLength = mTotalLength + measureNullChild(l2);
                continue;
            }
            if (view3.getVisibility() == 8)
            {
                l2 += getChildrenSkipCount(view3, l2);
                continue;
            }
            if (hasDividerBeforeChildAt(l2))
                mTotalLength = mTotalLength + mDividerHeight;
            LayoutParams layoutparams2 = (LayoutParams)view3.getLayoutParams();
            f += layoutparams2.weight;
            if (i2 == 0x40000000 && ((android.view.ViewGroup.LayoutParams) (layoutparams2)).height == 0 && layoutparams2.weight > 0.0F)
            {
                view3.resetMeasuredHeightDimension();
                int l7 = mTotalLength;
                mTotalLength = Math.max(l7, l7 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).bottomMargin);
            } else
            {
                int i6 = 0x80000000;
                if (((android.view.ViewGroup.LayoutParams) (layoutparams2)).height == 0 && layoutparams2.weight > 0.0F)
                {
                    i6 = 0;
                    layoutparams2.height = -2;
                }
                int j6;
                if (f == 0.0F)
                    j6 = mTotalLength;
                else
                    j6 = 0;
                measureChildBeforeLayout(view3, l2, i, 0, j, j6);
                if (i6 != 0x80000000)
                    layoutparams2.height = i6;
                int k6 = view3.getMeasuredHeight();
                int l6 = mTotalLength;
                mTotalLength = Math.max(l6, l6 + k6 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).bottomMargin + getNextLocationOffset(view3));
                if (flag2)
                    k2 = Math.max(k6, k2);
            }
            if (j2 >= 0 && j2 == l2 + 1)
                mBaselineChildTop = mTotalLength;
            if (l2 < j2 && layoutparams2.weight > 0.0F)
                throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
            boolean flag4 = false;
            if (l1 != 0x40000000)
            {
                int k7 = ((android.view.ViewGroup.LayoutParams) (layoutparams2)).width;
                flag4 = false;
                if (k7 == -1)
                {
                    flag1 = true;
                    flag4 = true;
                }
            }
            int i7 = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams2)).rightMargin;
            int j7 = i7 + view3.getMeasuredWidth();
            k = Math.max(k, j7);
            l = combineMeasuredStates(l, view3.getMeasuredState());
            if (flag && ((android.view.ViewGroup.LayoutParams) (layoutparams2)).width == -1)
                flag = true;
            else
                flag = false;
            if (layoutparams2.weight > 0.0F)
            {
                if (!flag4)
                    i7 = j7;
                j1 = Math.max(j1, i7);
            } else
            {
                if (!flag4)
                    i7 = j7;
                i1 = Math.max(i1, i7);
            }
            l2 += getChildrenSkipCount(view3, l2);
        }

        if (mTotalLength > 0 && hasDividerBeforeChildAt(k1))
            mTotalLength = mTotalLength + mDividerHeight;
        if (flag2 && (i2 == 0x80000000 || i2 == 0))
        {
            mTotalLength = 0;
            for (int k5 = 0; k5 < k1; k5++)
            {
                View view2 = getVirtualChildAt(k5);
                if (view2 == null)
                {
                    mTotalLength = mTotalLength + measureNullChild(k5);
                    continue;
                }
                if (view2.getVisibility() == 8)
                {
                    k5 += getChildrenSkipCount(view2, k5);
                } else
                {
                    LayoutParams layoutparams1 = (LayoutParams)view2.getLayoutParams();
                    int l5 = mTotalLength;
                    mTotalLength = Math.max(l5, l5 + k2 + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams1)).bottomMargin + getNextLocationOffset(view2));
                }
            }

        }
        mTotalLength = mTotalLength + (super.mPaddingTop + super.mPaddingBottom);
        int i3 = resolveSizeAndState(Math.max(mTotalLength, getSuggestedMinimumHeight()), j, 0);
        int j3 = (i3 & 0xffffff) - mTotalLength;
        if (j3 != 0 && f > 0.0F)
        {
            float f1;
            if (mWeightSum > 0.0F)
                f1 = mWeightSum;
            else
                f1 = f;
            mTotalLength = 0;
            for (int l3 = 0; l3 < k1; l3++)
            {
                View view1 = getVirtualChildAt(l3);
                if (view1.getVisibility() == 8)
                    continue;
                LayoutParams layoutparams = (LayoutParams)view1.getLayoutParams();
                float f2 = layoutparams.weight;
                if (f2 > 0.0F)
                {
                    int l4 = (int)((f2 * (float)j3) / f1);
                    f1 -= f2;
                    j3 -= l4;
                    int i5 = getChildMeasureSpec(i, super.mPaddingLeft + super.mPaddingRight + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width);
                    if (((android.view.ViewGroup.LayoutParams) (layoutparams)).height == 0 && i2 == 0x40000000)
                    {
                        if (l4 <= 0)
                            l4 = 0;
                        view1.measure(i5, android.view.View.MeasureSpec.makeMeasureSpec(l4, 0x40000000));
                    } else
                    {
                        int j5 = l4 + view1.getMeasuredHeight();
                        if (j5 < 0)
                            j5 = 0;
                        view1.measure(i5, android.view.View.MeasureSpec.makeMeasureSpec(j5, 0x40000000));
                    }
                    l = combineMeasuredStates(l, 0xffffff00 & view1.getMeasuredState());
                }
                int i4 = ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).leftMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).rightMargin;
                int j4 = i4 + view1.getMeasuredWidth();
                k = Math.max(k, j4);
                boolean flag3;
                if (l1 != 0x40000000 && ((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1)
                    flag3 = true;
                else
                    flag3 = false;
                if (!flag3)
                    i4 = j4;
                i1 = Math.max(i1, i4);
                if (flag && ((android.view.ViewGroup.LayoutParams) (layoutparams)).width == -1)
                    flag = true;
                else
                    flag = false;
                int k4 = mTotalLength;
                mTotalLength = Math.max(k4, k4 + view1.getMeasuredHeight() + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).topMargin + ((android.view.ViewGroup.MarginLayoutParams) (layoutparams)).bottomMargin + getNextLocationOffset(view1));
            }

            mTotalLength = mTotalLength + (super.mPaddingTop + super.mPaddingBottom);
        } else
        {
            i1 = Math.max(i1, j1);
            if (flag2 && i2 != 0x40000000)
            {
                for (int k3 = 0; k3 < k1; k3++)
                {
                    View view = getVirtualChildAt(k3);
                    if (view != null && view.getVisibility() != 8 && ((LayoutParams)view.getLayoutParams()).weight > 0.0F)
                        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(view.getMeasuredWidth(), 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(k2, 0x40000000));
                }

            }
        }
        if (!flag && l1 != 0x40000000)
            k = i1;
        setMeasuredDimension(resolveSizeAndState(Math.max(k + (super.mPaddingLeft + super.mPaddingRight), getSuggestedMinimumWidth()), i, l), i3);
        if (flag1)
            forceUniformWidth(k1, j);
    }

    protected void onDraw(Canvas canvas)
    {
        if (mDivider == null)
            return;
        if (mOrientation == 1)
        {
            drawDividersVertical(canvas);
            return;
        } else
        {
            drawDividersHorizontal(canvas);
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/LinearLayout.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/LinearLayout.getName());
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (mOrientation == 1)
        {
            layoutVertical();
            return;
        } else
        {
            layoutHorizontal();
            return;
        }
    }

    protected void onMeasure(int i, int j)
    {
        if (mOrientation == 1)
        {
            measureVertical(i, j);
            return;
        } else
        {
            measureHorizontal(i, j);
            return;
        }
    }

    public void setBaselineAligned(boolean flag)
    {
        mBaselineAligned = flag;
    }

    public void setBaselineAlignedChildIndex(int i)
    {
        if (i >= 0 && i < getChildCount())
        {
            mBaselineAlignedChildIndex = i;
            return;
        } else
        {
            throw new IllegalArgumentException((new StringBuilder()).append("base aligned child index out of range (0, ").append(getChildCount()).append(")").toString());
        }
    }

    public void setDividerDrawable(Drawable drawable)
    {
        if (drawable == mDivider)
            return;
        mDivider = drawable;
        if (drawable != null)
        {
            mDividerWidth = drawable.getIntrinsicWidth();
            mDividerHeight = drawable.getIntrinsicHeight();
        } else
        {
            mDividerWidth = 0;
            mDividerHeight = 0;
        }
        boolean flag = false;
        if (drawable == null)
            flag = true;
        setWillNotDraw(flag);
        requestLayout();
    }

    public void setDividerPadding(int i)
    {
        mDividerPadding = i;
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            if ((0x800007 & i) == 0)
                i |= 0x800003;
            if ((i & 0x70) == 0)
                i |= 0x30;
            mGravity = i;
            requestLayout();
        }
    }

    public void setHorizontalGravity(int i)
    {
        int j = i & 0x800007;
        if ((0x800007 & mGravity) != j)
        {
            mGravity = j | 0xff7ffff8 & mGravity;
            requestLayout();
        }
    }

    public void setMeasureWithLargestChildEnabled(boolean flag)
    {
        mUseLargestChild = flag;
    }

    public void setOrientation(int i)
    {
        if (mOrientation != i)
        {
            mOrientation = i;
            requestLayout();
        }
    }

    public void setShowDividers(int i)
    {
        if (i != mShowDividers)
            requestLayout();
        mShowDividers = i;
    }

    public void setVerticalGravity(int i)
    {
        int j = i & 0x70;
        if ((0x70 & mGravity) != j)
        {
            mGravity = j | 0xffffff8f & mGravity;
            requestLayout();
        }
    }

    public void setWeightSum(float f)
    {
        mWeightSum = Math.max(0.0F, f);
    }

    public boolean shouldDelayChildPressedState()
    {
        return false;
    }
}
