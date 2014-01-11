// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.SparseBooleanArray;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

// Referenced classes of package android.widget:
//            AbsListView, AdapterView, PopupWindow, ListAdapter, 
//            Checkable, Adapter

public class GridView extends AbsListView
{

    public static final int AUTO_FIT = -1;
    public static final int NO_STRETCH = 0;
    public static final int STRETCH_COLUMN_WIDTH = 2;
    public static final int STRETCH_SPACING = 1;
    public static final int STRETCH_SPACING_UNIFORM = 3;
    private int mColumnWidth;
    private int mGravity;
    private int mHorizontalSpacing;
    private int mNumColumns;
    private View mReferenceView;
    private View mReferenceViewInSelectedRow;
    private int mRequestedColumnWidth;
    private int mRequestedHorizontalSpacing;
    private int mRequestedNumColumns;
    private int mStretchMode;
    private final Rect mTempRect;
    private int mVerticalSpacing;

    public GridView(Context context)
    {
        this(context, null);
    }

    public GridView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010071);
    }

    public GridView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mNumColumns = -1;
        mHorizontalSpacing = 0;
        mVerticalSpacing = 0;
        mStretchMode = 2;
        mReferenceView = null;
        mReferenceViewInSelectedRow = null;
        mGravity = 0x800003;
        mTempRect = new Rect();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.GridView, i, 0);
        setHorizontalSpacing(typedarray.getDimensionPixelOffset(1, 0));
        setVerticalSpacing(typedarray.getDimensionPixelOffset(2, 0));
        int j = typedarray.getInt(3, 2);
        if (j >= 0)
            setStretchMode(j);
        int k = typedarray.getDimensionPixelOffset(4, -1);
        if (k > 0)
            setColumnWidth(k);
        setNumColumns(typedarray.getInt(5, 1));
        int l = typedarray.getInt(0, -1);
        if (l >= 0)
            setGravity(l);
        typedarray.recycle();
    }

    private void adjustForBottomFadingEdge(View view, int i, int j)
    {
        if (view.getBottom() > j)
            offsetChildrenTopAndBottom(-Math.min(view.getTop() - i, view.getBottom() - j));
    }

    private void adjustForTopFadingEdge(View view, int i, int j)
    {
        if (view.getTop() < i)
            offsetChildrenTopAndBottom(Math.min(i - view.getTop(), j - view.getBottom()));
    }

    private void adjustViewsUpOrDown()
    {
        int i = getChildCount();
        if (i > 0)
        {
            int j;
            if (!super.mStackFromBottom)
            {
                j = getChildAt(0).getTop() - super.mListPadding.top;
                if (super.mFirstPosition != 0)
                    j -= mVerticalSpacing;
                if (j < 0)
                    j = 0;
            } else
            {
                j = getChildAt(i - 1).getBottom() - (getHeight() - super.mListPadding.bottom);
                if (i + super.mFirstPosition < super.mItemCount)
                    j += mVerticalSpacing;
                if (j > 0)
                    j = 0;
            }
            if (j != 0)
                offsetChildrenTopAndBottom(-j);
        }
    }

    private boolean commonKey(int i, int j, KeyEvent keyevent)
    {
        if (super.mAdapter == null)
            return false;
        if (super.mDataChanged)
            layoutChildren();
        int k = keyevent.getAction();
        boolean flag = false;
        if (k != 1)
        {
            flag = false;
            switch (i)
            {
            default:
                break;

            case 123: // '{'
                boolean flag11 = keyevent.hasNoModifiers();
                flag = false;
                if (!flag11)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                    flag = false;
                else
                    flag = true;
                break;

            case 122: // 'z'
                boolean flag10 = keyevent.hasNoModifiers();
                flag = false;
                if (!flag10)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                    flag = false;
                else
                    flag = true;
                break;

            case 93: // ']'
                if (keyevent.hasNoModifiers())
                {
                    if (!resurrectSelectionIfNeeded() && !pageScroll(130))
                        flag = false;
                    else
                        flag = true;
                    break;
                }
                boolean flag9 = keyevent.hasModifiers(2);
                flag = false;
                if (!flag9)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                    flag = false;
                else
                    flag = true;
                break;

            case 92: // '\\'
                if (keyevent.hasNoModifiers())
                {
                    if (!resurrectSelectionIfNeeded() && !pageScroll(33))
                        flag = false;
                    else
                        flag = true;
                    break;
                }
                boolean flag8 = keyevent.hasModifiers(2);
                flag = false;
                if (!flag8)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                    flag = false;
                else
                    flag = true;
                break;

            case 62: // '>'
                if (super.mPopup != null)
                {
                    boolean flag7 = super.mPopup.isShowing();
                    flag = false;
                    if (flag7)
                        break;
                }
                if (keyevent.hasNoModifiers())
                {
                    if (!resurrectSelectionIfNeeded() && !pageScroll(130))
                        flag = false;
                    else
                        flag = true;
                    break;
                }
                boolean flag6 = keyevent.hasModifiers(1);
                flag = false;
                if (!flag6)
                    break;
                if (!resurrectSelectionIfNeeded() && !pageScroll(33))
                    flag = false;
                else
                    flag = true;
                break;

            case 23: // '\027'
            case 66: // 'B'
                boolean flag5 = keyevent.hasNoModifiers();
                flag = false;
                if (!flag5)
                    break;
                flag = resurrectSelectionIfNeeded();
                if (!flag && keyevent.getRepeatCount() == 0 && getChildCount() > 0)
                {
                    keyPressed();
                    flag = true;
                }
                break;

            case 20: // '\024'
                if (keyevent.hasNoModifiers())
                {
                    if (!resurrectSelectionIfNeeded() && !arrowScroll(130))
                        flag = false;
                    else
                        flag = true;
                    break;
                }
                boolean flag4 = keyevent.hasModifiers(2);
                flag = false;
                if (!flag4)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                    flag = false;
                else
                    flag = true;
                break;

            case 19: // '\023'
                if (keyevent.hasNoModifiers())
                {
                    if (!resurrectSelectionIfNeeded() && !arrowScroll(33))
                        flag = false;
                    else
                        flag = true;
                    break;
                }
                boolean flag3 = keyevent.hasModifiers(2);
                flag = false;
                if (!flag3)
                    break;
                if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                    flag = false;
                else
                    flag = true;
                break;

            case 22: // '\026'
                boolean flag2 = keyevent.hasNoModifiers();
                flag = false;
                if (!flag2)
                    break;
                if (!resurrectSelectionIfNeeded() && !arrowScroll(66))
                    flag = false;
                else
                    flag = true;
                break;

            case 21: // '\025'
                boolean flag1 = keyevent.hasNoModifiers();
                flag = false;
                if (!flag1)
                    break;
                if (!resurrectSelectionIfNeeded() && !arrowScroll(17))
                    flag = false;
                else
                    flag = true;
                break;
            }
        }
        if (flag)
            return true;
        if (sendToTextFilter(i, j, keyevent))
            return true;
        switch (k)
        {
        case 2: // '\002'
            return super.onKeyMultiple(i, j, keyevent);

        case 1: // '\001'
            return super.onKeyUp(i, keyevent);

        case 0: // '\0'
            return super.onKeyDown(i, keyevent);
        }
        return false;
    }

    private void correctTooHigh(int i, int j, int k)
    {
        if (-1 + (k + super.mFirstPosition) == -1 + super.mItemCount && k > 0)
        {
            int l = getChildAt(k - 1).getBottom();
            int i1 = super.mBottom - super.mTop - super.mListPadding.bottom - l;
            View view = getChildAt(0);
            int j1 = view.getTop();
            if (i1 > 0 && (super.mFirstPosition > 0 || j1 < super.mListPadding.top))
            {
                if (super.mFirstPosition == 0)
                    i1 = Math.min(i1, super.mListPadding.top - j1);
                offsetChildrenTopAndBottom(i1);
                if (super.mFirstPosition > 0)
                {
                    int k1 = super.mFirstPosition;
                    if (super.mStackFromBottom)
                        i = 1;
                    fillUp(k1 - i, view.getTop() - j);
                    adjustViewsUpOrDown();
                }
            }
        }
    }

    private void correctTooLow(int i, int j, int k)
    {
        if (super.mFirstPosition == 0 && k > 0)
        {
            int l = getChildAt(0).getTop();
            int i1 = super.mListPadding.top;
            int j1 = super.mBottom - super.mTop - super.mListPadding.bottom;
            int k1 = l - i1;
            View view = getChildAt(k - 1);
            int l1 = view.getBottom();
            int i2 = -1 + (k + super.mFirstPosition);
            if (k1 > 0 && (i2 < -1 + super.mItemCount || l1 > j1))
            {
                if (i2 == -1 + super.mItemCount)
                    k1 = Math.min(k1, l1 - j1);
                offsetChildrenTopAndBottom(-k1);
                if (i2 < -1 + super.mItemCount)
                {
                    if (!super.mStackFromBottom)
                        i = 1;
                    fillDown(i2 + i, j + view.getBottom());
                    adjustViewsUpOrDown();
                }
            }
        }
    }

    private boolean determineColumns(int i)
    {
        int j = mRequestedHorizontalSpacing;
        int k = mStretchMode;
        int l = mRequestedColumnWidth;
        if (mRequestedNumColumns == -1)
        {
            if (l > 0)
                mNumColumns = (i + j) / (l + j);
            else
                mNumColumns = 2;
        } else
        {
            mNumColumns = mRequestedNumColumns;
        }
        if (mNumColumns <= 0)
            mNumColumns = 1;
        switch (k)
        {
        case 0: // '\0'
            mColumnWidth = l;
            mHorizontalSpacing = j;
            return false;
        }
        int i1 = i - l * mNumColumns - j * (-1 + mNumColumns);
        boolean flag = false;
        if (i1 < 0)
            flag = true;
        switch (k)
        {
        case 3: // '\003'
            mColumnWidth = l;
            if (mNumColumns > 1)
            {
                mHorizontalSpacing = j + i1 / (1 + mNumColumns);
                return flag;
            } else
            {
                mHorizontalSpacing = j + i1;
                return flag;
            }

        case 1: // '\001'
            mColumnWidth = l;
            if (mNumColumns > 1)
            {
                mHorizontalSpacing = j + i1 / (-1 + mNumColumns);
                return flag;
            } else
            {
                mHorizontalSpacing = j + i1;
                return flag;
            }

        case 2: // '\002'
            mColumnWidth = l + i1 / mNumColumns;
            mHorizontalSpacing = j;
            return flag;
        }
        return flag;
    }

    private View fillDown(int i, int j)
    {
        int k = super.mBottom - super.mTop;
        int l = 0x22 & super.mGroupFlags;
        View view = null;
        if (l == 34)
            k -= super.mListPadding.bottom;
        for (; j < k && i < super.mItemCount; i += mNumColumns)
        {
            View view1 = makeRow(i, j, true);
            if (view1 != null)
                view = view1;
            j = mReferenceView.getBottom() + mVerticalSpacing;
        }

        setVisibleRangeHint(super.mFirstPosition, -1 + (super.mFirstPosition + getChildCount()));
        return view;
    }

    private View fillFromBottom(int i, int j)
    {
        int k = Math.min(Math.max(i, super.mSelectedPosition), -1 + super.mItemCount);
        int l = (-1 + super.mItemCount) - k;
        return fillUp((-1 + super.mItemCount) - (l - l % mNumColumns), j);
    }

    private View fillFromSelection(int i, int j, int k)
    {
        int l = getVerticalFadingEdgeLength();
        int i1 = super.mSelectedPosition;
        int j1 = mNumColumns;
        int k1 = mVerticalSpacing;
        int l1 = -1;
        int j2;
        if (!super.mStackFromBottom)
        {
            j2 = i1 - i1 % j1;
        } else
        {
            int i2 = (-1 + super.mItemCount) - i1;
            l1 = (-1 + super.mItemCount) - (i2 - i2 % j1);
            j2 = Math.max(0, 1 + (l1 - j1));
        }
        int k2 = getTopSelectionPixel(j, l, j2);
        int l2 = getBottomSelectionPixel(k, l, j1, j2);
        int i3;
        if (super.mStackFromBottom)
            i3 = l1;
        else
            i3 = j2;
        View view = makeRow(i3, i, true);
        super.mFirstPosition = j2;
        View view1 = mReferenceView;
        adjustForTopFadingEdge(view1, k2, l2);
        adjustForBottomFadingEdge(view1, k2, l2);
        if (!super.mStackFromBottom)
        {
            fillUp(j2 - j1, view1.getTop() - k1);
            adjustViewsUpOrDown();
            fillDown(j2 + j1, k1 + view1.getBottom());
            return view;
        } else
        {
            fillDown(l1 + j1, k1 + view1.getBottom());
            adjustViewsUpOrDown();
            fillUp(j2 - 1, view1.getTop() - k1);
            return view;
        }
    }

    private View fillFromTop(int i)
    {
        super.mFirstPosition = Math.min(super.mFirstPosition, super.mSelectedPosition);
        super.mFirstPosition = Math.min(super.mFirstPosition, -1 + super.mItemCount);
        if (super.mFirstPosition < 0)
            super.mFirstPosition = 0;
        super.mFirstPosition = super.mFirstPosition - super.mFirstPosition % mNumColumns;
        return fillDown(super.mFirstPosition, i);
    }

    private View fillSelection(int i, int j)
    {
        int k = reconcileSelectedPosition();
        int l = mNumColumns;
        int i1 = mVerticalSpacing;
        int j1 = -1;
        int l1;
        if (!super.mStackFromBottom)
        {
            l1 = k - k % l;
        } else
        {
            int k1 = (-1 + super.mItemCount) - k;
            j1 = (-1 + super.mItemCount) - (k1 - k1 % l);
            l1 = Math.max(0, 1 + (j1 - l));
        }
        int i2 = getVerticalFadingEdgeLength();
        int j2 = getTopSelectionPixel(i, i2, l1);
        int k2;
        if (super.mStackFromBottom)
            k2 = j1;
        else
            k2 = l1;
        View view = makeRow(k2, j2, true);
        super.mFirstPosition = l1;
        View view1 = mReferenceView;
        if (!super.mStackFromBottom)
        {
            fillDown(l1 + l, i1 + view1.getBottom());
            pinToBottom(j);
            fillUp(l1 - l, view1.getTop() - i1);
            adjustViewsUpOrDown();
            return view;
        } else
        {
            offsetChildrenTopAndBottom(getBottomSelectionPixel(j, i2, l, l1) - view1.getBottom());
            fillUp(l1 - 1, view1.getTop() - i1);
            pinToTop(i);
            fillDown(j1 + l, i1 + view1.getBottom());
            adjustViewsUpOrDown();
            return view;
        }
    }

    private View fillSpecific(int i, int j)
    {
        int k = mNumColumns;
        int l = -1;
        int j1;
        if (!super.mStackFromBottom)
        {
            j1 = i - i % k;
        } else
        {
            int i1 = (-1 + super.mItemCount) - i;
            l = (-1 + super.mItemCount) - (i1 - i1 % k);
            j1 = Math.max(0, 1 + (l - k));
        }
        int k1;
        if (super.mStackFromBottom)
            k1 = l;
        else
            k1 = j1;
        View view = makeRow(k1, j, true);
        super.mFirstPosition = j1;
        View view1 = mReferenceView;
        if (view1 == null)
        {
            view = null;
        } else
        {
            int l1 = mVerticalSpacing;
            View view2;
            View view3;
            if (!super.mStackFromBottom)
            {
                view3 = fillUp(j1 - k, view1.getTop() - l1);
                adjustViewsUpOrDown();
                view2 = fillDown(j1 + k, l1 + view1.getBottom());
                int j2 = getChildCount();
                if (j2 > 0)
                    correctTooHigh(k, l1, j2);
            } else
            {
                view2 = fillDown(l + k, l1 + view1.getBottom());
                adjustViewsUpOrDown();
                view3 = fillUp(j1 - 1, view1.getTop() - l1);
                int i2 = getChildCount();
                if (i2 > 0)
                    correctTooLow(k, l1, i2);
            }
            if (view == null)
                if (view3 != null)
                    return view3;
                else
                    return view2;
        }
        return view;
    }

    private View fillUp(int i, int j)
    {
        int k = 0x22 & super.mGroupFlags;
        int l = 0;
        View view = null;
        if (k == 34)
            l = super.mListPadding.top;
        for (; j > l && i >= 0; i -= mNumColumns)
        {
            View view1 = makeRow(i, j, false);
            if (view1 != null)
                view = view1;
            j = mReferenceView.getTop() - mVerticalSpacing;
            super.mFirstPosition = i;
        }

        if (super.mStackFromBottom)
            super.mFirstPosition = Math.max(0, i + 1);
        setVisibleRangeHint(super.mFirstPosition, -1 + (super.mFirstPosition + getChildCount()));
        return view;
    }

    private int getBottomSelectionPixel(int i, int j, int k, int l)
    {
        int i1 = i;
        if (-1 + (l + k) < -1 + super.mItemCount)
            i1 -= j;
        return i1;
    }

    private int getTopSelectionPixel(int i, int j, int k)
    {
        int l = i;
        if (k > 0)
            l += j;
        return l;
    }

    private boolean isCandidateSelection(int i, int j)
    {
label0:
        {
            int k = getChildCount();
            int l = k - 1 - i;
            int i1;
            int j1;
            if (!super.mStackFromBottom)
            {
                j1 = i - i % mNumColumns;
                i1 = Math.max(-1 + (j1 + mNumColumns), k);
            } else
            {
                i1 = k - 1 - (l - l % mNumColumns);
                j1 = Math.max(0, 1 + (i1 - mNumColumns));
            }
            switch (j)
            {
            default:
                break label0;

            case 1: // '\001'
                if (i != i1 || i1 != k - 1)
                    return false;
                break;

            case 2: // '\002'
                if (i != j1 || j1 != 0)
                    return false;
                break;

            case 33: // '!'
                if (i1 != k - 1)
                    return false;
                break;

            case 17: // '\021'
                if (i != i1)
                    return false;
                break;

            case 130: 
                if (j1 != 0)
                    return false;
                break;

            case 66: // 'B'
                if (i != j1)
                    return false;
                break;
            }
            return true;
        }
        throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT, FOCUS_FORWARD, FOCUS_BACKWARD}.");
    }

    private View makeAndAddView(int i, int j, boolean flag, int k, boolean flag1, int l)
    {
        if (!super.mDataChanged)
        {
            View view1 = super.mRecycler.getActiveView(i);
            if (view1 != null)
            {
                setupChild(view1, i, j, flag, k, flag1, true, l);
                return view1;
            }
        }
        View view = obtainView(i, super.mIsScrap);
        setupChild(view, i, j, flag, k, flag1, super.mIsScrap[0], l);
        return view;
    }

    private View makeRow(int i, int j, boolean flag)
    {
        int k = mColumnWidth;
        int l = mHorizontalSpacing;
        boolean flag1 = isLayoutRtl();
        int k1;
        if (flag1)
        {
            int i3 = getWidth() - super.mListPadding.right - k;
            int j3;
            if (mStretchMode == 3)
                j3 = l;
            else
                j3 = 0;
            k1 = i3 - j3;
        } else
        {
            int i1 = super.mListPadding.left;
            int j1;
            if (mStretchMode == 3)
                j1 = l;
            else
                j1 = 0;
            k1 = i1 + j1;
        }
        int l1;
        if (!super.mStackFromBottom)
        {
            l1 = Math.min(i + mNumColumns, super.mItemCount);
        } else
        {
            l1 = i + 1;
            i = Math.max(0, 1 + (i - mNumColumns));
            if (l1 - i < mNumColumns)
            {
                int l2 = (mNumColumns - (l1 - i)) * (k + l);
                byte byte1;
                if (flag1)
                    byte1 = -1;
                else
                    byte1 = 1;
                k1 += byte1 * l2;
            }
        }
        View view = null;
        boolean flag2 = shouldShowSelector();
        boolean flag3 = touchModeDrawsInPressedState();
        int i2 = super.mSelectedPosition;
        View view1 = null;
        for (int j2 = i; j2 < l1; j2++)
        {
            boolean flag4;
            if (j2 == i2)
                flag4 = true;
            else
                flag4 = false;
            int k2;
            if (flag)
                k2 = -1;
            else
                k2 = j2 - i;
            view1 = makeAndAddView(j2, j, flag, k1, flag4, k2);
            byte byte0;
            if (flag1)
                byte0 = -1;
            else
                byte0 = 1;
            k1 += byte0 * k;
            if (j2 < l1 - 1)
                k1 += l;
            if (flag4 && (flag2 || flag3))
                view = view1;
        }

        mReferenceView = view1;
        if (view != null)
            mReferenceViewInSelectedRow = mReferenceView;
        return view;
    }

    private View moveSelection(int i, int j, int k)
    {
        int l = getVerticalFadingEdgeLength();
        int i1 = super.mSelectedPosition;
        int j1 = mNumColumns;
        int k1 = mVerticalSpacing;
        int l1 = -1;
        int j2;
        int l2;
        if (!super.mStackFromBottom)
        {
            l2 = i1 - i - (i1 - i) % j1;
            j2 = i1 - i1 % j1;
        } else
        {
            int i2 = (-1 + super.mItemCount) - i1;
            l1 = (-1 + super.mItemCount) - (i2 - i2 % j1);
            j2 = Math.max(0, 1 + (l1 - j1));
            int k2 = (-1 + super.mItemCount) - (i1 - i);
            l2 = Math.max(0, 1 + ((-1 + super.mItemCount) - (k2 - k2 % j1) - j1));
        }
        int i3 = j2 - l2;
        int j3 = getTopSelectionPixel(j, l, j2);
        int k3 = getBottomSelectionPixel(k, l, j1, j2);
        super.mFirstPosition = j2;
        View view;
        View view1;
        if (i3 > 0)
        {
            int i5;
            if (mReferenceViewInSelectedRow == null)
                i5 = 0;
            else
                i5 = mReferenceViewInSelectedRow.getBottom();
            int j5;
            if (super.mStackFromBottom)
                j5 = l1;
            else
                j5 = j2;
            int k5 = i5 + k1;
            view = makeRow(j5, k5, true);
            view1 = mReferenceView;
            adjustForBottomFadingEdge(view1, j3, k3);
        } else
        if (i3 < 0)
        {
            int j4;
            if (mReferenceViewInSelectedRow == null)
                j4 = 0;
            else
                j4 = mReferenceViewInSelectedRow.getTop();
            int k4;
            if (super.mStackFromBottom)
                k4 = l1;
            else
                k4 = j2;
            int l4 = j4 - k1;
            view = makeRow(k4, l4, false);
            view1 = mReferenceView;
            adjustForTopFadingEdge(view1, j3, k3);
        } else
        {
            int l3;
            if (mReferenceViewInSelectedRow == null)
                l3 = 0;
            else
                l3 = mReferenceViewInSelectedRow.getTop();
            int i4;
            if (super.mStackFromBottom)
                i4 = l1;
            else
                i4 = j2;
            view = makeRow(i4, l3, true);
            view1 = mReferenceView;
        }
        if (!super.mStackFromBottom)
        {
            fillUp(j2 - j1, view1.getTop() - k1);
            adjustViewsUpOrDown();
            fillDown(j2 + j1, k1 + view1.getBottom());
            return view;
        } else
        {
            fillDown(l1 + j1, k1 + view1.getBottom());
            adjustViewsUpOrDown();
            fillUp(j2 - 1, view1.getTop() - k1);
            return view;
        }
    }

    private void pinToBottom(int i)
    {
        int j = getChildCount();
        if (j + super.mFirstPosition == super.mItemCount)
        {
            int k = i - getChildAt(j - 1).getBottom();
            if (k > 0)
                offsetChildrenTopAndBottom(k);
        }
    }

    private void pinToTop(int i)
    {
        if (super.mFirstPosition == 0)
        {
            int j = i - getChildAt(0).getTop();
            if (j < 0)
                offsetChildrenTopAndBottom(j);
        }
    }

    private void setupChild(View view, int i, int j, boolean flag, int k, boolean flag1, boolean flag2, 
            int l)
    {
        boolean flag3;
        if (flag1 && shouldShowSelector())
            flag3 = true;
        else
            flag3 = false;
        boolean flag4;
        if (flag3 != view.isSelected())
            flag4 = true;
        else
            flag4 = false;
        int i1 = super.mTouchMode;
        boolean flag5;
        if (i1 > 0 && i1 < 3 && super.mMotionPosition == i)
            flag5 = true;
        else
            flag5 = false;
        boolean flag6;
        if (flag5 != view.isPressed())
            flag6 = true;
        else
            flag6 = false;
        boolean flag7;
        if (flag2 && !flag4 && !view.isLayoutRequested())
            flag7 = false;
        else
            flag7 = true;
        AbsListView.LayoutParams layoutparams = (AbsListView.LayoutParams)view.getLayoutParams();
        if (layoutparams == null)
            layoutparams = (AbsListView.LayoutParams)generateDefaultLayoutParams();
        int j1 = super.mAdapter.getItemViewType(i);
        layoutparams.viewType = j1;
        if (flag2 && !layoutparams.forceAdd)
        {
            attachViewToParent(view, l, layoutparams);
        } else
        {
            layoutparams.forceAdd = false;
            addViewInLayout(view, l, layoutparams, true);
        }
        if (flag4)
        {
            view.setSelected(flag3);
            if (flag3)
                requestFocus();
        }
        if (flag6)
            view.setPressed(flag5);
        if (super.mChoiceMode != 0 && super.mCheckStates != null)
            if (view instanceof Checkable)
                ((Checkable)view).setChecked(super.mCheckStates.get(i));
            else
            if (getContext().getApplicationInfo().targetSdkVersion >= 11)
                view.setActivated(super.mCheckStates.get(i));
        if (flag7)
        {
            int l2 = ViewGroup.getChildMeasureSpec(android.view.View.MeasureSpec.makeMeasureSpec(0, 0), 0, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
            view.measure(ViewGroup.getChildMeasureSpec(android.view.View.MeasureSpec.makeMeasureSpec(mColumnWidth, 0x40000000), 0, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width), l2);
        } else
        {
            cleanupLayoutState(view);
        }
        int k1 = view.getMeasuredWidth();
        int l1 = view.getMeasuredHeight();
        int i2;
        if (flag)
            i2 = j;
        else
            i2 = j - l1;
        int j2 = getLayoutDirection();
        int k2;
        switch (7 & Gravity.getAbsoluteGravity(mGravity, j2))
        {
        case 5: // '\005'
            k2 = (k + mColumnWidth) - k1;
            break;

        case 1: // '\001'
            k2 = k + (mColumnWidth - k1) / 2;
            break;

        case 3: // '\003'
            k2 = k;
            break;

        case 2: // '\002'
        case 4: // '\004'
        default:
            k2 = k;
            break;
        }
        if (flag7)
        {
            view.layout(k2, i2, k2 + k1, i2 + l1);
        } else
        {
            view.offsetLeftAndRight(k2 - view.getLeft());
            view.offsetTopAndBottom(i2 - view.getTop());
        }
        if (super.mCachingStarted)
            view.setDrawingCacheEnabled(true);
        if (flag2 && ((AbsListView.LayoutParams)view.getLayoutParams()).scrappedFromPosition != i)
            view.jumpDrawablesToCurrentState();
    }

    boolean arrowScroll(int i)
    {
        int j = super.mSelectedPosition;
        int k = mNumColumns;
        int i1;
        int j1;
        if (!super.mStackFromBottom)
        {
            j1 = k * (j / k);
            i1 = Math.min(-1 + (j1 + k), -1 + super.mItemCount);
        } else
        {
            int l = (-1 + super.mItemCount) - j;
            i1 = (-1 + super.mItemCount) - k * (l / k);
            j1 = Math.max(0, 1 + (i1 - k));
        }
        boolean flag = false;
        switch (i)
        {
        case 66: // 'B'
            flag = false;
            if (j < i1)
            {
                super.mLayoutMode = 6;
                setSelectionInt(Math.min(j + 1, -1 + super.mItemCount));
                flag = true;
            }
            break;

        case 17: // '\021'
            flag = false;
            if (j > j1)
            {
                super.mLayoutMode = 6;
                setSelectionInt(Math.max(0, j - 1));
                flag = true;
            }
            break;

        case 130: 
            int k1 = -1 + super.mItemCount;
            flag = false;
            if (i1 < k1)
            {
                super.mLayoutMode = 6;
                setSelectionInt(Math.min(j + k, -1 + super.mItemCount));
                flag = true;
            }
            break;

        case 33: // '!'
            flag = false;
            if (j1 > 0)
            {
                super.mLayoutMode = 6;
                setSelectionInt(Math.max(0, j - k));
                flag = true;
            }
            break;
        }
        if (flag)
        {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
            invokeOnItemScrollListener();
        }
        if (flag)
            awakenScrollBars();
        return flag;
    }

    protected void attachLayoutAnimationParameters(View view, android.view.ViewGroup.LayoutParams layoutparams, int i, int j)
    {
        android.view.animation.GridLayoutAnimationController.AnimationParameters animationparameters = (android.view.animation.GridLayoutAnimationController.AnimationParameters)layoutparams.layoutAnimationParameters;
        if (animationparameters == null)
        {
            animationparameters = new android.view.animation.GridLayoutAnimationController.AnimationParameters();
            layoutparams.layoutAnimationParameters = animationparameters;
        }
        animationparameters.count = j;
        animationparameters.index = i;
        animationparameters.columnsCount = mNumColumns;
        animationparameters.rowsCount = j / mNumColumns;
        if (!super.mStackFromBottom)
        {
            animationparameters.column = i % mNumColumns;
            animationparameters.row = i / mNumColumns;
            return;
        } else
        {
            int k = j - 1 - i;
            animationparameters.column = (-1 + mNumColumns) - k % mNumColumns;
            animationparameters.row = (-1 + animationparameters.rowsCount) - k / mNumColumns;
            return;
        }
    }

    protected int computeVerticalScrollExtent()
    {
        int i = getChildCount();
        if (i > 0)
        {
            int j = mNumColumns;
            int k = 100 * ((-1 + (i + j)) / j);
            View view = getChildAt(0);
            int l = view.getTop();
            int i1 = view.getHeight();
            if (i1 > 0)
                k += (l * 100) / i1;
            View view1 = getChildAt(i - 1);
            int j1 = view1.getBottom();
            int k1 = view1.getHeight();
            if (k1 > 0)
                k -= (100 * (j1 - getHeight())) / k1;
            return k;
        } else
        {
            return 0;
        }
    }

    protected int computeVerticalScrollOffset()
    {
        int i = super.mFirstPosition;
        int j = 0;
        if (i >= 0)
        {
            int k = getChildCount();
            j = 0;
            if (k > 0)
            {
                View view = getChildAt(0);
                int l = view.getTop();
                int i1 = view.getHeight();
                j = 0;
                if (i1 > 0)
                {
                    int j1 = mNumColumns;
                    int k1 = (-1 + (j1 + super.mItemCount)) / j1;
                    int l1;
                    if (isStackFromBottom())
                        l1 = k1 * j1 - super.mItemCount;
                    else
                        l1 = 0;
                    j = Math.max((100 * ((l1 + super.mFirstPosition) / j1) - (l * 100) / i1) + (int)(100F * (((float)super.mScrollY / (float)getHeight()) * (float)k1)), 0);
                }
            }
        }
        return j;
    }

    protected int computeVerticalScrollRange()
    {
        int i = mNumColumns;
        int j = (-1 + (i + super.mItemCount)) / i;
        int k = Math.max(j * 100, 0);
        if (super.mScrollY != 0)
            k += Math.abs((int)(100F * (((float)super.mScrollY / (float)getHeight()) * (float)j)));
        return k;
    }

    void fillGap(boolean flag)
    {
        int i = mNumColumns;
        int j = mVerticalSpacing;
        int k = getChildCount();
        if (flag)
        {
            int i2 = 0x22 & super.mGroupFlags;
            int j2 = 0;
            if (i2 == 34)
                j2 = getListPaddingTop();
            int k2;
            if (k > 0)
                k2 = j + getChildAt(k - 1).getBottom();
            else
                k2 = j2;
            int l2 = k + super.mFirstPosition;
            if (super.mStackFromBottom)
                l2 += i - 1;
            fillDown(l2, k2);
            correctTooHigh(i, j, getChildCount());
            return;
        }
        int l = 0x22 & super.mGroupFlags;
        int i1 = 0;
        if (l == 34)
            i1 = getListPaddingBottom();
        int j1;
        if (k > 0)
            j1 = getChildAt(0).getTop() - j;
        else
            j1 = getHeight() - i1;
        int k1 = super.mFirstPosition;
        int l1;
        if (!super.mStackFromBottom)
            l1 = k1 - i;
        else
            l1 = k1 - 1;
        fillUp(l1, j1);
        correctTooLow(i, j, getChildCount());
    }

    int findMotionRow(int i)
    {
        int j = getChildCount();
        if (j > 0)
        {
            int k = mNumColumns;
            if (!super.mStackFromBottom)
            {
                for (int i1 = 0; i1 < j; i1 += k)
                    if (i <= getChildAt(i1).getBottom())
                        return i1 + super.mFirstPosition;

            } else
            {
                for (int l = j - 1; l >= 0; l -= k)
                    if (i >= getChildAt(l).getTop())
                        return l + super.mFirstPosition;

            }
        }
        return -1;
    }

    boolean fullScroll(int i)
    {
        boolean flag;
        if (i == 33)
        {
            super.mLayoutMode = 2;
            setSelectionInt(0);
            invokeOnItemScrollListener();
            flag = true;
        } else
        {
            flag = false;
            if (i == 130)
            {
                super.mLayoutMode = 2;
                setSelectionInt(-1 + super.mItemCount);
                invokeOnItemScrollListener();
                flag = true;
            }
        }
        if (flag)
            awakenScrollBars();
        return flag;
    }

    public volatile Adapter getAdapter()
    {
        return getAdapter();
    }

    public ListAdapter getAdapter()
    {
        return super.mAdapter;
    }

    public int getColumnWidth()
    {
        return mColumnWidth;
    }

    public int getGravity()
    {
        return mGravity;
    }

    public int getHorizontalSpacing()
    {
        return mHorizontalSpacing;
    }

    public int getNumColumns()
    {
        return mNumColumns;
    }

    public int getRequestedColumnWidth()
    {
        return mRequestedColumnWidth;
    }

    public int getRequestedHorizontalSpacing()
    {
        return mRequestedHorizontalSpacing;
    }

    public int getStretchMode()
    {
        return mStretchMode;
    }

    public int getVerticalSpacing()
    {
        return mVerticalSpacing;
    }

    protected void layoutChildren()
    {
        boolean flag;
        flag = super.mBlockLayoutRequests;
        if (!flag)
            super.mBlockLayoutRequests = true;
        super.layoutChildren();
        invalidate();
        if (super.mAdapter != null) goto _L2; else goto _L1
_L1:
        resetList();
        invokeOnItemScrollListener();
        if (flag) goto _L4; else goto _L3
_L3:
        super.mBlockLayoutRequests = false;
_L4:
        return;
_L2:
        int i;
        int j;
        int k;
        int l;
        i = super.mListPadding.top;
        j = super.mBottom - super.mTop - super.mListPadding.bottom;
        k = getChildCount();
        l = super.mLayoutMode;
        int i1;
        View view;
        View view1;
        View view2;
        i1 = 0;
        view = null;
        view1 = null;
        view2 = null;
        l;
        JVM INSTR tableswitch 1 6: default 140
    //                   1 184
    //                   2 221
    //                   3 184
    //                   4 184
    //                   5 184
    //                   6 288;
           goto _L5 _L6 _L7 _L6 _L6 _L6 _L8
_L6:
        break MISSING_BLOCK_LABEL_184;
_L5:
        int j3 = super.mSelectedPosition - super.mFirstPosition;
        view2 = null;
        if (j3 < 0)
            break MISSING_BLOCK_LABEL_177;
        view2 = null;
        if (j3 >= k)
            break MISSING_BLOCK_LABEL_177;
        view2 = getChildAt(j3);
        view1 = getChildAt(0);
_L15:
        boolean flag1 = super.mDataChanged;
        if (!flag1) goto _L10; else goto _L9
_L9:
        handleDataChanged();
_L10:
        if (super.mItemCount != 0) goto _L12; else goto _L11
_L11:
        resetList();
        invokeOnItemScrollListener();
        if (flag) goto _L4; else goto _L13
_L13:
        break; /* Loop/switch isn't completed */
_L7:
        int i3 = super.mNextSelectedPosition - super.mFirstPosition;
        i1 = 0;
        view = null;
        view1 = null;
        view2 = null;
        if (i3 < 0) goto _L15; else goto _L14
_L14:
        i1 = 0;
        view = null;
        view1 = null;
        view2 = null;
        if (i3 >= k) goto _L15; else goto _L16
_L16:
        view = getChildAt(i3);
        i1 = 0;
        view1 = null;
        view2 = null;
          goto _L15
_L8:
        int j1 = super.mNextSelectedPosition;
        i1 = 0;
        view = null;
        view1 = null;
        view2 = null;
        if (j1 < 0) goto _L15; else goto _L17
_L17:
        i1 = super.mNextSelectedPosition - super.mSelectedPosition;
        view = null;
        view1 = null;
        view2 = null;
          goto _L15
_L12:
        int k1;
        AbsListView.RecycleBin recyclebin;
        setSelectedPositionInt(super.mNextSelectedPosition);
        k1 = super.mFirstPosition;
        recyclebin = super.mRecycler;
        if (!flag1) goto _L19; else goto _L18
_L18:
        int l2 = 0;
_L21:
        if (l2 >= k)
            break; /* Loop/switch isn't completed */
        recyclebin.addScrapView(getChildAt(l2), k1 + l2);
        l2++;
        if (true) goto _L21; else goto _L20
_L19:
        recyclebin.fillActiveViews(k, k1);
_L20:
        detachAllViewsFromParent();
        recyclebin.removeSkippedScrap();
        super.mLayoutMode;
        JVM INSTR tableswitch 1 6: default 452
    //                   1 624
    //                   2 590
    //                   3 655
    //                   4 676
    //                   5 693
    //                   6 710;
           goto _L22 _L23 _L24 _L25 _L26 _L27 _L28
_L22:
        if (k != 0) goto _L30; else goto _L29
_L29:
        if (super.mStackFromBottom) goto _L32; else goto _L31
_L31:
        Exception exception;
        View view3;
        View view4;
        int l1;
        int i2;
        byte byte0;
        int j2;
        int k2;
        if (super.mAdapter == null || isInTouchMode())
            byte0 = -1;
        else
            byte0 = 0;
        setSelectedPositionInt(byte0);
        view3 = fillFromTop(i);
_L37:
        recyclebin.scrapActiveViews();
        if (view3 == null) goto _L34; else goto _L33
_L33:
        positionSelector(-1, view3);
        super.mSelectedTop = view3.getTop();
_L49:
        super.mLayoutMode = 0;
        super.mDataChanged = false;
        if (super.mPositionScrollAfterLayout != null)
        {
            post(super.mPositionScrollAfterLayout);
            super.mPositionScrollAfterLayout = null;
        }
        super.mNeedSync = false;
        setNextSelectedPositionInt(super.mSelectedPosition);
        updateScrollIndicators();
        if (super.mItemCount > 0)
            checkSelectionChanged();
        invokeOnItemScrollListener();
        if (flag) goto _L4; else goto _L3
_L24:
        if (view == null) goto _L36; else goto _L35
_L35:
        view3 = fillFromSelection(view.getTop(), i, j);
          goto _L37
_L36:
        view3 = fillSelection(i, j);
          goto _L37
_L23:
        super.mFirstPosition = 0;
        view3 = fillFromTop(i);
        adjustViewsUpOrDown();
          goto _L37
        exception;
        if (!flag)
            super.mBlockLayoutRequests = false;
        throw exception;
_L25:
        view3 = fillUp(-1 + super.mItemCount, j);
        adjustViewsUpOrDown();
          goto _L37
_L26:
        view3 = fillSpecific(super.mSelectedPosition, super.mSpecificTop);
          goto _L37
_L27:
        view3 = fillSpecific(super.mSyncPosition, super.mSpecificTop);
          goto _L37
_L28:
        view3 = moveSelection(i1, i, j);
          goto _L37
_L32:
        l1 = -1 + super.mItemCount;
        if (super.mAdapter == null || isInTouchMode())
            i2 = -1;
        else
            i2 = l1;
        setSelectedPositionInt(i2);
        view3 = fillFromBottom(l1, j);
          goto _L37
_L30:
        if (super.mSelectedPosition < 0 || super.mSelectedPosition >= super.mItemCount) goto _L39; else goto _L38
_L38:
        k2 = super.mSelectedPosition;
        if (view2 != null) goto _L41; else goto _L40
_L40:
        view3 = fillSpecific(k2, i);
          goto _L37
_L41:
        i = view2.getTop();
          goto _L40
_L39:
        if (super.mFirstPosition >= super.mItemCount) goto _L43; else goto _L42
_L42:
        j2 = super.mFirstPosition;
        if (view1 != null) goto _L45; else goto _L44
_L44:
        view3 = fillSpecific(j2, i);
          goto _L37
_L45:
        i = view1.getTop();
          goto _L44
_L43:
        view3 = fillSpecific(0, i);
          goto _L37
_L34:
        if (super.mTouchMode <= 0 || super.mTouchMode >= 3) goto _L47; else goto _L46
_L46:
        view4 = getChildAt(super.mMotionPosition - super.mFirstPosition);
        if (view4 == null) goto _L49; else goto _L48
_L48:
        positionSelector(super.mMotionPosition, view4);
          goto _L49
_L47:
        super.mSelectedTop = 0;
        super.mSelectorRect.setEmpty();
          goto _L49
    }

    int lookForSelectablePosition(int i, boolean flag)
    {
        if (super.mAdapter != null && !isInTouchMode())
        {
            if (i < 0 || i >= super.mItemCount)
                return -1;
        } else
        {
            i = -1;
        }
        return i;
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        super.onFocusChanged(flag, i, rect);
        int j = -1;
        if (flag && rect != null)
        {
            rect.offset(super.mScrollX, super.mScrollY);
            Rect rect1 = mTempRect;
            int k = 0x7fffffff;
            int l = getChildCount();
            for (int i1 = 0; i1 < l; i1++)
            {
                if (!isCandidateSelection(i1, i))
                    continue;
                View view = getChildAt(i1);
                view.getDrawingRect(rect1);
                offsetDescendantRectToMyCoords(view, rect1);
                int j1 = getDistance(rect, rect1, i);
                if (j1 < k)
                {
                    k = j1;
                    j = i1;
                }
            }

        }
        if (j >= 0)
        {
            setSelection(j + super.mFirstPosition);
            return;
        } else
        {
            requestLayout();
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/GridView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/GridView.getName());
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        return commonKey(i, 1, keyevent);
    }

    public boolean onKeyMultiple(int i, int j, KeyEvent keyevent)
    {
        return commonKey(i, j, keyevent);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        return commonKey(i, 1, keyevent);
    }

    protected void onMeasure(int i, int j)
    {
        int k;
        int l;
        int i1;
        int j1;
        boolean flag;
        int l1;
        int i2;
        super.onMeasure(i, j);
        k = android.view.View.MeasureSpec.getMode(i);
        l = android.view.View.MeasureSpec.getMode(j);
        i1 = android.view.View.MeasureSpec.getSize(i);
        j1 = android.view.View.MeasureSpec.getSize(j);
        if (k == 0)
        {
            int k3;
            if (mColumnWidth > 0)
                k3 = mColumnWidth + super.mListPadding.left + super.mListPadding.right;
            else
                k3 = super.mListPadding.left + super.mListPadding.right;
            i1 = k3 + getVerticalScrollbarWidth();
        }
        flag = determineColumns(i1 - super.mListPadding.left - super.mListPadding.right);
        int k1;
        if (super.mAdapter == null)
            k1 = 0;
        else
            k1 = super.mAdapter.getCount();
        super.mItemCount = k1;
        l1 = super.mItemCount;
        i2 = 0;
        if (l1 > 0)
        {
            View view = obtainView(0, super.mIsScrap);
            AbsListView.LayoutParams layoutparams = (AbsListView.LayoutParams)view.getLayoutParams();
            if (layoutparams == null)
            {
                layoutparams = (AbsListView.LayoutParams)generateDefaultLayoutParams();
                view.setLayoutParams(layoutparams);
            }
            int i3 = super.mAdapter.getItemViewType(0);
            layoutparams.viewType = i3;
            layoutparams.forceAdd = true;
            int j3 = getChildMeasureSpec(android.view.View.MeasureSpec.makeMeasureSpec(0, 0), 0, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
            view.measure(getChildMeasureSpec(android.view.View.MeasureSpec.makeMeasureSpec(mColumnWidth, 0x40000000), 0, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width), j3);
            i2 = view.getMeasuredHeight();
            combineMeasuredStates(0, view.getMeasuredState());
            if (super.mRecycler.shouldRecycleViewType(layoutparams.viewType))
                super.mRecycler.addScrapView(view, 0);
        }
        if (l == 0)
            j1 = i2 + (super.mListPadding.top + super.mListPadding.bottom) + 2 * getVerticalFadingEdgeLength();
        if (l != 0x80000000) goto _L2; else goto _L1
_L1:
        int j2;
        int k2;
        int l2;
        j2 = super.mListPadding.top + super.mListPadding.bottom;
        k2 = mNumColumns;
        l2 = 0;
_L8:
        if (l2 >= l1) goto _L4; else goto _L3
_L3:
        j2 += i2;
        if (l2 + k2 < l1)
            j2 += mVerticalSpacing;
        if (j2 < j1) goto _L6; else goto _L5
_L5:
        j2 = j1;
_L4:
        j1 = j2;
_L2:
        if (k == 0x80000000 && mRequestedNumColumns != -1 && (mRequestedNumColumns * mColumnWidth + (-1 + mRequestedNumColumns) * mHorizontalSpacing + super.mListPadding.left + super.mListPadding.right > i1 || flag))
            i1 |= 0x1000000;
        setMeasuredDimension(i1, j1);
        super.mWidthMeasureSpec = i;
        return;
_L6:
        l2 += k2;
        if (true) goto _L8; else goto _L7
_L7:
    }

    boolean pageScroll(int i)
    {
        int j = -1;
        if (i == 33)
            j = Math.max(0, super.mSelectedPosition - getChildCount());
        else
        if (i == 130)
            j = Math.min(-1 + super.mItemCount, super.mSelectedPosition + getChildCount());
        boolean flag = false;
        if (j >= 0)
        {
            setSelectionInt(j);
            invokeOnItemScrollListener();
            awakenScrollBars();
            flag = true;
        }
        return flag;
    }

    boolean sequenceScroll(int i)
    {
        int j = super.mSelectedPosition;
        int k = mNumColumns;
        int l = super.mItemCount;
        int j1;
        int k1;
        if (!super.mStackFromBottom)
        {
            k1 = k * (j / k);
            j1 = Math.min(-1 + (k1 + k), l - 1);
        } else
        {
            int i1 = l - 1 - j;
            j1 = l - 1 - k * (i1 / k);
            k1 = Math.max(0, 1 + (j1 - k));
        }
        boolean flag = false;
        boolean flag1 = false;
        switch (i)
        {
        case 1: // '\001'
            flag = false;
            flag1 = false;
            if (j > 0)
            {
                super.mLayoutMode = 6;
                setSelectionInt(j - 1);
                flag = true;
                if (j == k1)
                    flag1 = true;
                else
                    flag1 = false;
            }
            break;

        case 2: // '\002'
            int l1 = l - 1;
            flag = false;
            flag1 = false;
            if (j < l1)
            {
                super.mLayoutMode = 6;
                setSelectionInt(j + 1);
                flag = true;
                if (j == j1)
                    flag1 = true;
                else
                    flag1 = false;
            }
            break;
        }
        if (flag)
        {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
            invokeOnItemScrollListener();
        }
        if (flag1)
            awakenScrollBars();
        return flag;
    }

    public volatile void setAdapter(Adapter adapter)
    {
        setAdapter((ListAdapter)adapter);
    }

    public void setAdapter(ListAdapter listadapter)
    {
        if (super.mAdapter != null && super.mDataSetObserver != null)
            super.mAdapter.unregisterDataSetObserver(super.mDataSetObserver);
        resetList();
        super.mRecycler.clear();
        super.mAdapter = listadapter;
        super.mOldSelectedPosition = -1;
        super.mOldSelectedRowId = 0x8000000000000000L;
        super.setAdapter(listadapter);
        if (super.mAdapter != null)
        {
            super.mOldItemCount = super.mItemCount;
            super.mItemCount = super.mAdapter.getCount();
            super.mDataChanged = true;
            checkFocus();
            super.mDataSetObserver = new AbsListView.AdapterDataSetObserver(this);
            super.mAdapter.registerDataSetObserver(super.mDataSetObserver);
            super.mRecycler.setViewTypeCount(super.mAdapter.getViewTypeCount());
            int i;
            if (super.mStackFromBottom)
                i = lookForSelectablePosition(-1 + super.mItemCount, false);
            else
                i = lookForSelectablePosition(0, true);
            setSelectedPositionInt(i);
            setNextSelectedPositionInt(i);
            checkSelectionChanged();
        } else
        {
            checkFocus();
            checkSelectionChanged();
        }
        requestLayout();
    }

    public void setColumnWidth(int i)
    {
        if (i != mRequestedColumnWidth)
        {
            mRequestedColumnWidth = i;
            requestLayoutIfNecessary();
        }
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            mGravity = i;
            requestLayoutIfNecessary();
        }
    }

    public void setHorizontalSpacing(int i)
    {
        if (i != mRequestedHorizontalSpacing)
        {
            mRequestedHorizontalSpacing = i;
            requestLayoutIfNecessary();
        }
    }

    public void setNumColumns(int i)
    {
        if (i != mRequestedNumColumns)
        {
            mRequestedNumColumns = i;
            requestLayoutIfNecessary();
        }
    }

    public void setRemoteViewsAdapter(Intent intent)
    {
        super.setRemoteViewsAdapter(intent);
    }

    public void setSelection(int i)
    {
        if (!isInTouchMode())
            setNextSelectedPositionInt(i);
        else
            super.mResurrectToPosition = i;
        super.mLayoutMode = 2;
        if (super.mPositionScroller != null)
            super.mPositionScroller.stop();
        requestLayout();
    }

    void setSelectionInt(int i)
    {
        int j = super.mNextSelectedPosition;
        if (super.mPositionScroller != null)
            super.mPositionScroller.stop();
        setNextSelectedPositionInt(i);
        layoutChildren();
        int k;
        if (super.mStackFromBottom)
            k = (-1 + super.mItemCount) - super.mNextSelectedPosition;
        else
            k = super.mNextSelectedPosition;
        int l;
        if (super.mStackFromBottom)
            l = (-1 + super.mItemCount) - j;
        else
            l = j;
        if (k / mNumColumns != l / mNumColumns)
            awakenScrollBars();
    }

    public void setStretchMode(int i)
    {
        if (i != mStretchMode)
        {
            mStretchMode = i;
            requestLayoutIfNecessary();
        }
    }

    public void setVerticalSpacing(int i)
    {
        if (i != mVerticalSpacing)
        {
            mVerticalSpacing = i;
            requestLayoutIfNecessary();
        }
    }

    public void smoothScrollByOffset(int i)
    {
        super.smoothScrollByOffset(i);
    }

    public void smoothScrollToPosition(int i)
    {
        super.smoothScrollToPosition(i);
    }
}
