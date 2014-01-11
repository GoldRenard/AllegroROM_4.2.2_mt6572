// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            LinearLayout

public class TabWidget extends LinearLayout
    implements android.view.View.OnFocusChangeListener
{
    static interface OnTabSelectionChanged
    {

        public abstract void onTabSelectionChanged(int i, boolean flag);
    }

    private class TabClickListener
        implements android.view.View.OnClickListener
    {

        private final int mTabIndex;
        final TabWidget this$0;

        public void onClick(View view)
        {
            mSelectionChangedListener.onTabSelectionChanged(mTabIndex, true);
        }

        private TabClickListener(int i)
        {
            this$0 = TabWidget.this;
            super();
            mTabIndex = i;
        }

    }


    private final Rect mBounds;
    private boolean mDrawBottomStrips;
    private int mImposedTabWidths[];
    private int mImposedTabsHeight;
    private Drawable mLeftStrip;
    private Drawable mRightStrip;
    private int mSelectedTab;
    private OnTabSelectionChanged mSelectionChangedListener;
    private boolean mStripMoved;

    public TabWidget(Context context)
    {
        this(context, null);
    }

    public TabWidget(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010083);
    }

    public TabWidget(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mSelectedTab = -1;
        mDrawBottomStrips = true;
        mBounds = new Rect();
        mImposedTabsHeight = -1;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.TabWidget, i, 0);
        setStripEnabled(typedarray.getBoolean(3, true));
        setLeftStripDrawable(typedarray.getDrawable(1));
        setRightStripDrawable(typedarray.getDrawable(2));
        typedarray.recycle();
        initTabWidget();
    }

    private void initTabWidget()
    {
        setChildrenDrawingOrderEnabled(true);
        Context context = super.mContext;
        Resources resources = context.getResources();
        if (context.getApplicationInfo().targetSdkVersion <= 4)
        {
            if (mLeftStrip == null)
                mLeftStrip = resources.getDrawable(0x10805a9);
            if (mRightStrip == null)
                mRightStrip = resources.getDrawable(0x10805ab);
        } else
        {
            if (mLeftStrip == null)
                mLeftStrip = resources.getDrawable(0x10805a8);
            if (mRightStrip == null)
                mRightStrip = resources.getDrawable(0x10805aa);
        }
        setFocusable(true);
        setOnFocusChangeListener(this);
    }

    public void addView(View view)
    {
        if (view.getLayoutParams() == null)
        {
            LinearLayout.LayoutParams layoutparams = new LinearLayout.LayoutParams(0, -1, 1.0F);
            layoutparams.setMargins(0, 0, 0, 0);
            view.setLayoutParams(layoutparams);
        }
        view.setFocusable(true);
        view.setClickable(true);
        super.addView(view);
        view.setOnClickListener(new TabClickListener(-1 + getTabCount()));
        view.setOnFocusChangeListener(this);
    }

    public void childDrawableStateChanged(View view)
    {
        if (getTabCount() > 0 && view == getChildTabViewAt(mSelectedTab))
            invalidate();
        super.childDrawableStateChanged(view);
    }

    public void dispatchDraw(Canvas canvas)
    {
        super.dispatchDraw(canvas);
        if (getTabCount() != 0 && mDrawBottomStrips)
        {
            View view = getChildTabViewAt(mSelectedTab);
            Drawable drawable = mLeftStrip;
            Drawable drawable1 = mRightStrip;
            drawable.setState(view.getDrawableState());
            drawable1.setState(view.getDrawableState());
            if (mStripMoved)
            {
                Rect rect = mBounds;
                rect.left = view.getLeft();
                rect.right = view.getRight();
                int i = getHeight();
                drawable.setBounds(Math.min(0, rect.left - drawable.getIntrinsicWidth()), i - drawable.getIntrinsicHeight(), rect.left, i);
                drawable1.setBounds(rect.right, i - drawable1.getIntrinsicHeight(), Math.max(getWidth(), rect.right + drawable1.getIntrinsicWidth()), i);
                mStripMoved = false;
            }
            drawable.draw(canvas);
            drawable1.draw(canvas);
            return;
        } else
        {
            return;
        }
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onPopulateAccessibilityEvent(accessibilityevent);
        if (mSelectedTab != -1)
        {
            View view = getChildTabViewAt(mSelectedTab);
            if (view != null && view.getVisibility() == 0)
                return view.dispatchPopulateAccessibilityEvent(accessibilityevent);
        }
        return false;
    }

    public void focusCurrentTab(int i)
    {
        int j = mSelectedTab;
        setCurrentTab(i);
        if (j != i)
            getChildTabViewAt(i).requestFocus();
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        if (mSelectedTab != -1)
        {
            if (j == i - 1)
                return mSelectedTab;
            if (j >= mSelectedTab)
                return j + 1;
        }
        return j;
    }

    public View getChildTabViewAt(int i)
    {
        return getChildAt(i);
    }

    public int getTabCount()
    {
        return getChildCount();
    }

    public boolean isStripEnabled()
    {
        return mDrawBottomStrips;
    }

    void measureChildBeforeLayout(View view, int i, int j, int k, int l, int i1)
    {
        if (!isMeasureWithLargestChildEnabled() && mImposedTabsHeight >= 0)
        {
            j = android.view.View.MeasureSpec.makeMeasureSpec(k + mImposedTabWidths[i], 0x40000000);
            l = android.view.View.MeasureSpec.makeMeasureSpec(mImposedTabsHeight, 0x40000000);
        }
        super.measureChildBeforeLayout(view, i, j, k, l, i1);
    }

    void measureHorizontal(int i, int j)
    {
        if (android.view.View.MeasureSpec.getMode(i) == 0)
        {
            super.measureHorizontal(i, j);
            return;
        }
        int k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        mImposedTabsHeight = -1;
        super.measureHorizontal(k, j);
        int l = getMeasuredWidth() - android.view.View.MeasureSpec.getSize(i);
        if (l > 0)
        {
            int i1 = getChildCount();
            int j1 = 0;
            for (int k1 = 0; k1 < i1; k1++)
                if (getChildAt(k1).getVisibility() != 8)
                    j1++;

            if (j1 > 0)
            {
                if (mImposedTabWidths == null || mImposedTabWidths.length != i1)
                    mImposedTabWidths = new int[i1];
                for (int l1 = 0; l1 < i1; l1++)
                {
                    View view = getChildAt(l1);
                    if (view.getVisibility() != 8)
                    {
                        int i2 = view.getMeasuredWidth();
                        int j2 = Math.max(0, i2 - l / j1);
                        mImposedTabWidths[l1] = j2;
                        l -= i2 - j2;
                        j1--;
                        mImposedTabsHeight = Math.max(mImposedTabsHeight, view.getMeasuredHeight());
                    }
                }

            }
        }
        super.measureHorizontal(i, j);
    }

    public void onFocusChange(View view, boolean flag)
    {
        if (view != this || !flag || getTabCount() <= 0) goto _L2; else goto _L1
_L1:
        getChildTabViewAt(mSelectedTab).requestFocus();
          goto _L3
_L2:
        if (!flag) goto _L3; else goto _L4
_L4:
        int i;
        int j;
        i = 0;
        j = getTabCount();
_L9:
        if (i >= j) goto _L3; else goto _L5
_L5:
        if (getChildTabViewAt(i) != view) goto _L7; else goto _L6
_L6:
        setCurrentTab(i);
        mSelectionChangedListener.onTabSelectionChanged(i, false);
        if (isShown())
        {
            sendAccessibilityEvent(8);
            return;
        }
_L3:
        return;
_L7:
        i++;
        if (true) goto _L9; else goto _L8
_L8:
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/TabWidget.getName());
        accessibilityevent.setItemCount(getTabCount());
        accessibilityevent.setCurrentItemIndex(mSelectedTab);
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/TabWidget.getName());
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        mStripMoved = true;
        super.onSizeChanged(i, j, k, l);
    }

    public void removeAllViews()
    {
        super.removeAllViews();
        mSelectedTab = -1;
    }

    public void sendAccessibilityEventUnchecked(AccessibilityEvent accessibilityevent)
    {
        if (accessibilityevent.getEventType() == 8 && isFocused())
        {
            accessibilityevent.recycle();
            return;
        } else
        {
            super.sendAccessibilityEventUnchecked(accessibilityevent);
            return;
        }
    }

    public void setCurrentTab(int i)
    {
        if (i >= 0 && i < getTabCount() && i != mSelectedTab)
        {
            if (mSelectedTab != -1)
                getChildTabViewAt(mSelectedTab).setSelected(false);
            mSelectedTab = i;
            getChildTabViewAt(mSelectedTab).setSelected(true);
            mStripMoved = true;
            if (isShown())
            {
                sendAccessibilityEvent(4);
                return;
            }
        }
    }

    public void setDividerDrawable(int i)
    {
        setDividerDrawable(getResources().getDrawable(i));
    }

    public void setDividerDrawable(Drawable drawable)
    {
        super.setDividerDrawable(drawable);
    }

    public void setEnabled(boolean flag)
    {
        super.setEnabled(flag);
        int i = getTabCount();
        for (int j = 0; j < i; j++)
            getChildTabViewAt(j).setEnabled(flag);

    }

    public void setLeftStripDrawable(int i)
    {
        setLeftStripDrawable(getResources().getDrawable(i));
    }

    public void setLeftStripDrawable(Drawable drawable)
    {
        mLeftStrip = drawable;
        requestLayout();
        invalidate();
    }

    public void setRightStripDrawable(int i)
    {
        setRightStripDrawable(getResources().getDrawable(i));
    }

    public void setRightStripDrawable(Drawable drawable)
    {
        mRightStrip = drawable;
        requestLayout();
        invalidate();
    }

    public void setStripEnabled(boolean flag)
    {
        mDrawBottomStrips = flag;
        invalidate();
    }

    void setTabSelectionListener(OnTabSelectionChanged ontabselectionchanged)
    {
        mSelectionChangedListener = ontabselectionchanged;
    }

}
