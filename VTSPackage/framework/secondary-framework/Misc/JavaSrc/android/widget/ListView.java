// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.res.TypedArray;
import android.graphics.*;
import android.graphics.drawable.Drawable;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import com.android.internal.util.Predicate;
import com.google.android.collect.Lists;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;

// Referenced classes of package android.widget:
//            AbsListView, ArrayAdapter, AdapterView, PopupWindow, 
//            ListAdapter, Checkable, HeaderViewListAdapter, Adapter

public class ListView extends AbsListView
{
    private static class ArrowScrollFocusResult
    {

        private int mAmountToScroll;
        private int mSelectedPosition;

        public int getAmountToScroll()
        {
            return mAmountToScroll;
        }

        public int getSelectedPosition()
        {
            return mSelectedPosition;
        }

        void populate(int i, int j)
        {
            mSelectedPosition = i;
            mAmountToScroll = j;
        }

        private ArrowScrollFocusResult()
        {
        }

    }

    public class FixedViewInfo
    {

        public Object data;
        public boolean isSelectable;
        final ListView this$0;
        public View view;

        public FixedViewInfo()
        {
            this$0 = ListView.this;
            super();
        }
    }

    private class FocusSelector
        implements Runnable
    {

        private int mPosition;
        private int mPositionTop;
        final ListView this$0;

        public void run()
        {
            setSelectionFromTop(mPosition, mPositionTop);
        }

        public FocusSelector setup(int i, int j)
        {
            mPosition = i;
            mPositionTop = j;
            return this;
        }

        private FocusSelector()
        {
            this$0 = ListView.this;
            super();
        }

    }


    private static final float MAX_SCROLL_FACTOR = 0.33F;
    private static final int MIN_SCROLL_PREVIEW_PIXELS = 2;
    static final int NO_POSITION = -1;
    private static final String TAG = "ListView";
    private boolean mAbandonActiveViews;
    private boolean mAreAllItemsSelectable;
    private final ArrowScrollFocusResult mArrowScrollFocusResult;
    Drawable mDivider;
    int mDividerHeight;
    private boolean mDividerIsOpaque;
    private Paint mDividerPaint;
    private boolean mDrawDividerBelowItems;
    private FocusSelector mFocusSelector;
    private boolean mFooterDividersEnabled;
    private ArrayList mFooterViewInfos;
    private boolean mHeaderDividersEnabled;
    private ArrayList mHeaderViewInfos;
    private boolean mIsCacheColorOpaque;
    private boolean mItemsCanFocus;
    Drawable mOverScrollFooter;
    Drawable mOverScrollHeader;
    private final Rect mTempRect;

    public ListView(Context context)
    {
        this(context, null);
    }

    public ListView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010074);
    }

    public ListView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mHeaderViewInfos = Lists.newArrayList();
        mFooterViewInfos = Lists.newArrayList();
        mAreAllItemsSelectable = true;
        mItemsCanFocus = false;
        mDrawDividerBelowItems = false;
        mTempRect = new Rect();
        mArrowScrollFocusResult = new ArrowScrollFocusResult();
        mAbandonActiveViews = false;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ListView, i, 0);
        CharSequence acharsequence[] = typedarray.getTextArray(0);
        if (acharsequence != null)
            setAdapter(new ArrayAdapter(context, 0x1090003, acharsequence));
        Drawable drawable = typedarray.getDrawable(1);
        if (drawable != null)
            setDivider(drawable);
        Drawable drawable1 = typedarray.getDrawable(5);
        if (drawable1 != null)
            setOverscrollHeader(drawable1);
        Drawable drawable2 = typedarray.getDrawable(6);
        if (drawable2 != null)
            setOverscrollFooter(drawable2);
        int j = typedarray.getDimensionPixelSize(2, 0);
        if (j != 0)
            setDividerHeight(j);
        mHeaderDividersEnabled = typedarray.getBoolean(3, true);
        mFooterDividersEnabled = typedarray.getBoolean(4, true);
        typedarray.recycle();
    }

    private View addViewAbove(View view, int i)
    {
        int j = i - 1;
        View view1 = obtainView(j, super.mIsScrap);
        setupChild(view1, j, view.getTop() - mDividerHeight, false, super.mListPadding.left, false, super.mIsScrap[0]);
        return view1;
    }

    private View addViewBelow(View view, int i)
    {
        int j = i + 1;
        View view1 = obtainView(j, super.mIsScrap);
        setupChild(view1, j, view.getBottom() + mDividerHeight, true, super.mListPadding.left, false, super.mIsScrap[0]);
        return view1;
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
                    j -= mDividerHeight;
                if (j < 0)
                    j = 0;
            } else
            {
                j = getChildAt(i - 1).getBottom() - (getHeight() - super.mListPadding.bottom);
                if (i + super.mFirstPosition < super.mItemCount)
                    j += mDividerHeight;
                if (j > 0)
                    j = 0;
            }
            if (j != 0)
                offsetChildrenTopAndBottom(-j);
        }
    }

    private int amountToScroll(int i, int j)
    {
        int k = getHeight() - super.mListPadding.bottom;
        int l = super.mListPadding.top;
        int i1 = getChildCount();
        if (i == 130)
        {
            int j2 = i1 - 1;
            if (j != -1)
                j2 = j - super.mFirstPosition;
            int k2 = j2 + super.mFirstPosition;
            View view1 = getChildAt(j2);
            int l2 = k;
            if (k2 < -1 + super.mItemCount)
                l2 -= getArrowScrollPreviewLength();
            if (view1.getBottom() <= l2)
                return 0;
            if (j != -1 && l2 - view1.getTop() >= getMaxScrollAmount())
                return 0;
            int i3 = view1.getBottom() - l2;
            if (i1 + super.mFirstPosition == super.mItemCount)
                i3 = Math.min(i3, getChildAt(i1 - 1).getBottom() - k);
            return Math.min(i3, getMaxScrollAmount());
        }
        int j1 = 0;
        if (j != -1)
            j1 = j - super.mFirstPosition;
        int k1 = j1 + super.mFirstPosition;
        View view = getChildAt(j1);
        int l1 = l;
        if (k1 > 0)
            l1 += getArrowScrollPreviewLength();
        if (view.getTop() >= l1)
            return 0;
        if (j != -1 && view.getBottom() - l1 >= getMaxScrollAmount())
            return 0;
        int i2 = l1 - view.getTop();
        if (super.mFirstPosition == 0)
            i2 = Math.min(i2, l - getChildAt(0).getTop());
        return Math.min(i2, getMaxScrollAmount());
    }

    private int amountToScrollToNewFocus(int i, View view, int j)
    {
        view.getDrawingRect(mTempRect);
        offsetDescendantRectToMyCoords(view, mTempRect);
        int i1;
        if (i == 33)
        {
            int j1 = mTempRect.top;
            int k1 = super.mListPadding.top;
            i1 = 0;
            if (j1 < k1)
            {
                i1 = super.mListPadding.top - mTempRect.top;
                if (j > 0)
                    i1 += getArrowScrollPreviewLength();
            }
        } else
        {
            int k = getHeight() - super.mListPadding.bottom;
            int l = mTempRect.bottom;
            i1 = 0;
            if (l > k)
            {
                i1 = mTempRect.bottom - k;
                if (j < -1 + super.mItemCount)
                    return i1 + getArrowScrollPreviewLength();
            }
        }
        return i1;
    }

    private ArrowScrollFocusResult arrowScrollFocused(int i)
    {
label0:
        {
            View view = getSelectedView();
            View view1;
            if (view != null && view.hasFocus())
            {
                View view2 = view.findFocus();
                view1 = FocusFinder.getInstance().findNextFocus(this, view2, i);
            } else
            {
                if (i == 130)
                {
                    boolean flag1;
                    if (super.mFirstPosition > 0)
                        flag1 = true;
                    else
                        flag1 = false;
                    int j2 = super.mListPadding.top;
                    int k2;
                    if (flag1)
                        k2 = getArrowScrollPreviewLength();
                    else
                        k2 = 0;
                    int l2 = j2 + k2;
                    int i3;
                    if (view != null && view.getTop() > l2)
                        i3 = view.getTop();
                    else
                        i3 = l2;
                    mTempRect.set(0, i3, 0, i3);
                } else
                {
                    boolean flag;
                    if (-1 + (super.mFirstPosition + getChildCount()) < super.mItemCount)
                        flag = true;
                    else
                        flag = false;
                    int j = getHeight() - super.mListPadding.bottom;
                    int k;
                    if (flag)
                        k = getArrowScrollPreviewLength();
                    else
                        k = 0;
                    int l = j - k;
                    int i1;
                    if (view != null && view.getBottom() < l)
                        i1 = view.getBottom();
                    else
                        i1 = l;
                    mTempRect.set(0, i1, 0, i1);
                }
                view1 = FocusFinder.getInstance().findNextFocusFromRect(this, mTempRect, i);
            }
            if (view1 != null)
            {
                int j1 = positionOfNewFocus(view1);
                if (super.mSelectedPosition != -1 && j1 != super.mSelectedPosition)
                {
                    int i2 = lookForSelectablePositionOnScreen(i);
                    if (i2 != -1 && (i == 130 && i2 < j1 || i == 33 && i2 > j1))
                        break label0;
                }
                int k1 = amountToScrollToNewFocus(i, view1, j1);
                int l1 = getMaxScrollAmount();
                if (k1 < l1)
                {
                    view1.requestFocus(i);
                    mArrowScrollFocusResult.populate(j1, k1);
                    return mArrowScrollFocusResult;
                }
                if (distanceToView(view1) < l1)
                {
                    view1.requestFocus(i);
                    mArrowScrollFocusResult.populate(j1, l1);
                    return mArrowScrollFocusResult;
                }
            }
            return null;
        }
        return null;
    }

    private boolean arrowScrollImpl(int i)
    {
        if (getChildCount() > 0)
        {
            View view = getSelectedView();
            int j = super.mSelectedPosition;
            int k = lookForSelectablePositionOnScreen(i);
            int l = amountToScroll(i, k);
            ArrowScrollFocusResult arrowscrollfocusresult;
            if (mItemsCanFocus)
                arrowscrollfocusresult = arrowScrollFocused(i);
            else
                arrowscrollfocusresult = null;
            if (arrowscrollfocusresult != null)
            {
                k = arrowscrollfocusresult.getSelectedPosition();
                l = arrowscrollfocusresult.getAmountToScroll();
            }
            boolean flag;
            if (arrowscrollfocusresult != null)
                flag = true;
            else
                flag = false;
            if (k != -1)
            {
                boolean flag1;
                if (arrowscrollfocusresult != null)
                    flag1 = true;
                else
                    flag1 = false;
                handleNewSelectionChange(view, i, k, flag1);
                setSelectedPositionInt(k);
                setNextSelectedPositionInt(k);
                view = getSelectedView();
                j = k;
                if (mItemsCanFocus && arrowscrollfocusresult == null)
                {
                    View view2 = getFocusedChild();
                    if (view2 != null)
                        view2.clearFocus();
                }
                flag = true;
                checkSelectionChanged();
            }
            if (l > 0)
            {
                if (i != 33)
                    l = -l;
                scrollListItemsBy(l);
                flag = true;
            }
            if (mItemsCanFocus && arrowscrollfocusresult == null && view != null && view.hasFocus())
            {
                View view1 = view.findFocus();
                if (!isViewAncestorOf(view1, this) || distanceToView(view1) > 0)
                    view1.clearFocus();
            }
            if (k == -1 && view != null && !isViewAncestorOf(view, this))
            {
                view = null;
                hideSelector();
                super.mResurrectToPosition = -1;
            }
            if (flag)
            {
                if (view != null)
                {
                    positionSelector(j, view);
                    super.mSelectedTop = view.getTop();
                }
                if (!awakenScrollBars())
                    invalidate();
                invokeOnItemScrollListener();
                return true;
            }
        }
        return false;
    }

    private void clearRecycledState(ArrayList arraylist)
    {
        if (arraylist != null)
        {
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                AbsListView.LayoutParams layoutparams = (AbsListView.LayoutParams)((FixedViewInfo)arraylist.get(j)).view.getLayoutParams();
                if (layoutparams != null)
                    layoutparams.recycledHeaderFooter = false;
            }

        }
    }

    private boolean commonKey(int i, int j, KeyEvent keyevent)
    {
        boolean flag = true;
        if (super.mAdapter != null && super.mIsAttached)
        {
            if (super.mDataChanged)
                layoutChildren();
            int k = keyevent.getAction();
            int l = 0;
            if (k != flag)
            {
                l = 0;
label0:
                switch (i)
                {
                default:
                    break;

                case 123: // '{'
                    boolean flag10 = keyevent.hasNoModifiers();
                    l = 0;
                    if (!flag10)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;

                case 122: // 'z'
                    boolean flag9 = keyevent.hasNoModifiers();
                    l = 0;
                    if (!flag9)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;

                case 93: // ']'
                    if (keyevent.hasNoModifiers())
                    {
                        if (!resurrectSelectionIfNeeded() && !pageScroll(130))
                            l = 0;
                        else
                            l = ((flag) ? 1 : 0);
                        break;
                    }
                    boolean flag8 = keyevent.hasModifiers(2);
                    l = 0;
                    if (!flag8)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;

                case 92: // '\\'
                    if (keyevent.hasNoModifiers())
                    {
                        if (!resurrectSelectionIfNeeded() && !pageScroll(33))
                            l = 0;
                        else
                            l = ((flag) ? 1 : 0);
                        break;
                    }
                    boolean flag7 = keyevent.hasModifiers(2);
                    l = 0;
                    if (!flag7)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;

                case 62: // '>'
                    if (super.mPopup != null)
                    {
                        boolean flag6 = super.mPopup.isShowing();
                        l = 0;
                        if (flag6)
                            break;
                    }
                    if (keyevent.hasNoModifiers())
                    {
                        if (resurrectSelectionIfNeeded() || pageScroll(130))
                        {
                            boolean _tmp = flag;
                        }
                    } else
                    if (keyevent.hasModifiers(flag) && (resurrectSelectionIfNeeded() || pageScroll(33)))
                    {
                        boolean _tmp1 = flag;
                    }
                    l = 1;
                    break;

                case 23: // '\027'
                case 66: // 'B'
                    boolean flag5 = keyevent.hasNoModifiers();
                    l = 0;
                    if (!flag5)
                        break;
                    l = resurrectSelectionIfNeeded();
                    if (l == 0 && keyevent.getRepeatCount() == 0 && getChildCount() > 0)
                    {
                        keyPressed();
                        l = 1;
                    }
                    break;

                case 22: // '\026'
                    boolean flag4 = keyevent.hasNoModifiers();
                    l = 0;
                    if (flag4)
                        l = handleHorizontalFocusWithinListItem(66);
                    break;

                case 21: // '\025'
                    boolean flag3 = keyevent.hasNoModifiers();
                    l = 0;
                    if (flag3)
                        l = handleHorizontalFocusWithinListItem(17);
                    break;

                case 20: // '\024'
                    if (keyevent.hasNoModifiers())
                    {
                        l = resurrectSelectionIfNeeded();
                        if (l != 0)
                            break;
                        int j1 = j;
                        do
                        {
                            j = j1 - 1;
                            if (j1 <= 0 || !arrowScroll(130))
                                break label0;
                            l = 1;
                            j1 = j;
                        } while (true);
                    }
                    boolean flag2 = keyevent.hasModifiers(2);
                    l = 0;
                    if (!flag2)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(130))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;

                case 19: // '\023'
                    if (keyevent.hasNoModifiers())
                    {
                        l = resurrectSelectionIfNeeded();
                        if (l != 0)
                            break;
                        int i1 = j;
                        do
                        {
                            j = i1 - 1;
                            if (i1 <= 0 || !arrowScroll(33))
                                break label0;
                            l = 1;
                            i1 = j;
                        } while (true);
                    }
                    boolean flag1 = keyevent.hasModifiers(2);
                    l = 0;
                    if (!flag1)
                        break;
                    if (!resurrectSelectionIfNeeded() && !fullScroll(33))
                        l = 0;
                    else
                        l = ((flag) ? 1 : 0);
                    break;
                }
            }
            if (l == 0 && !sendToTextFilter(i, j, keyevent))
            {
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
        } else
        {
            flag = false;
        }
        return flag;
    }

    private void correctTooHigh(int i)
    {
        if (-1 + (i + super.mFirstPosition) == -1 + super.mItemCount && i > 0)
        {
            int j = getChildAt(i - 1).getBottom();
            int k = super.mBottom - super.mTop - super.mListPadding.bottom - j;
            View view = getChildAt(0);
            int l = view.getTop();
            if (k > 0 && (super.mFirstPosition > 0 || l < super.mListPadding.top))
            {
                if (super.mFirstPosition == 0)
                    k = Math.min(k, super.mListPadding.top - l);
                offsetChildrenTopAndBottom(k);
                if (super.mFirstPosition > 0)
                {
                    fillUp(-1 + super.mFirstPosition, view.getTop() - mDividerHeight);
                    adjustViewsUpOrDown();
                }
            }
        }
    }

    private void correctTooLow(int i)
    {
        if (super.mFirstPosition == 0 && i > 0)
        {
            int j = getChildAt(0).getTop();
            int k = super.mListPadding.top;
            int l = super.mBottom - super.mTop - super.mListPadding.bottom;
            int i1 = j - k;
            View view = getChildAt(i - 1);
            int j1 = view.getBottom();
            int k1 = -1 + (i + super.mFirstPosition);
            if (i1 > 0)
                if (k1 >= -1 + super.mItemCount && j1 <= l)
                {
                    if (k1 == -1 + super.mItemCount)
                    {
                        adjustViewsUpOrDown();
                        return;
                    }
                } else
                {
                    if (k1 == -1 + super.mItemCount)
                        i1 = Math.min(i1, j1 - l);
                    offsetChildrenTopAndBottom(-i1);
                    if (k1 < -1 + super.mItemCount)
                    {
                        fillDown(k1 + 1, view.getBottom() + mDividerHeight);
                        adjustViewsUpOrDown();
                    }
                }
        }
    }

    private int distanceToView(View view)
    {
        view.getDrawingRect(mTempRect);
        offsetDescendantRectToMyCoords(view, mTempRect);
        int i = super.mBottom - super.mTop - super.mListPadding.bottom;
        int k;
        if (mTempRect.bottom < super.mListPadding.top)
        {
            k = super.mListPadding.top - mTempRect.bottom;
        } else
        {
            int j = mTempRect.top;
            k = 0;
            if (j > i)
                return mTempRect.top - i;
        }
        return k;
    }

    private void fillAboveAndBelow(View view, int i)
    {
        int j = mDividerHeight;
        if (!super.mStackFromBottom)
        {
            fillUp(i - 1, view.getTop() - j);
            adjustViewsUpOrDown();
            fillDown(i + 1, j + view.getBottom());
            return;
        } else
        {
            fillDown(i + 1, j + view.getBottom());
            adjustViewsUpOrDown();
            fillUp(i - 1, view.getTop() - j);
            return;
        }
    }

    private View fillDown(int i, int j)
    {
        int k = super.mBottom - super.mTop;
        int l = 0x22 & super.mGroupFlags;
        View view = null;
        if (l == 34)
            k -= super.mListPadding.bottom;
        for (; j < k && i < super.mItemCount; i++)
        {
            boolean flag;
            if (i == super.mSelectedPosition)
                flag = true;
            else
                flag = false;
            int i1 = super.mListPadding.left;
            View view1 = makeAndAddView(i, j, true, i1, flag);
            j = view1.getBottom() + mDividerHeight;
            if (flag)
                view = view1;
        }

        setVisibleRangeHint(super.mFirstPosition, -1 + (super.mFirstPosition + getChildCount()));
        return view;
    }

    private View fillFromMiddle(int i, int j)
    {
        int k = j - i;
        int l = reconcileSelectedPosition();
        View view = makeAndAddView(l, i, true, super.mListPadding.left, true);
        super.mFirstPosition = l;
        int i1 = view.getMeasuredHeight();
        if (i1 <= k)
            view.offsetTopAndBottom((k - i1) / 2);
        fillAboveAndBelow(view, l);
        if (!super.mStackFromBottom)
        {
            correctTooHigh(getChildCount());
            return view;
        } else
        {
            correctTooLow(getChildCount());
            return view;
        }
    }

    private View fillFromSelection(int i, int j, int k)
    {
        int l = getVerticalFadingEdgeLength();
        int i1 = super.mSelectedPosition;
        int j1 = getTopSelectionPixel(j, l, i1);
        int k1 = getBottomSelectionPixel(k, l, i1);
        View view = makeAndAddView(i1, i, true, super.mListPadding.left, true);
        if (view.getBottom() > k1)
            view.offsetTopAndBottom(-Math.min(view.getTop() - j1, view.getBottom() - k1));
        else
        if (view.getTop() < j1)
            view.offsetTopAndBottom(Math.min(j1 - view.getTop(), k1 - view.getBottom()));
        fillAboveAndBelow(view, i1);
        if (!super.mStackFromBottom)
        {
            correctTooHigh(getChildCount());
            return view;
        } else
        {
            correctTooLow(getChildCount());
            return view;
        }
    }

    private View fillFromTop(int i)
    {
        super.mFirstPosition = Math.min(super.mFirstPosition, super.mSelectedPosition);
        super.mFirstPosition = Math.min(super.mFirstPosition, -1 + super.mItemCount);
        if (super.mFirstPosition < 0)
            super.mFirstPosition = 0;
        return fillDown(super.mFirstPosition, i);
    }

    private View fillSpecific(int i, int j)
    {
        boolean flag;
        if (i == super.mSelectedPosition)
            flag = true;
        else
            flag = false;
        View view = makeAndAddView(i, j, true, super.mListPadding.left, flag);
        super.mFirstPosition = i;
        int k = mDividerHeight;
        View view1;
        View view2;
        if (!super.mStackFromBottom)
        {
            view2 = fillUp(i - 1, view.getTop() - k);
            adjustViewsUpOrDown();
            view1 = fillDown(i + 1, k + view.getBottom());
            int i1 = getChildCount();
            if (i1 > 0)
                correctTooHigh(i1);
        } else
        {
            view1 = fillDown(i + 1, k + view.getBottom());
            adjustViewsUpOrDown();
            view2 = fillUp(i - 1, view.getTop() - k);
            int l = getChildCount();
            if (l > 0)
                correctTooLow(l);
        }
        if (flag)
            return view;
        if (view2 != null)
            return view2;
        else
            return view1;
    }

    private View fillUp(int i, int j)
    {
        int k = 0x22 & super.mGroupFlags;
        int l = 0;
        View view = null;
        if (k == 34)
            l = super.mListPadding.top;
        for (; j > l && i >= 0; i--)
        {
            boolean flag;
            if (i == super.mSelectedPosition)
                flag = true;
            else
                flag = false;
            int i1 = super.mListPadding.left;
            View view1 = makeAndAddView(i, j, false, i1, flag);
            j = view1.getTop() - mDividerHeight;
            if (flag)
                view = view1;
        }

        super.mFirstPosition = i + 1;
        setVisibleRangeHint(super.mFirstPosition, -1 + (super.mFirstPosition + getChildCount()));
        return view;
    }

    private View findAccessibilityFocusedChild(View view)
    {
        ViewParent viewparent;
        for (viewparent = view.getParent(); (viewparent instanceof View) && viewparent != this; viewparent = viewparent.getParent())
            view = (View)viewparent;

        if (!(viewparent instanceof View))
            view = null;
        return view;
    }

    private int getArrowScrollPreviewLength()
    {
        return Math.max(2, getVerticalFadingEdgeLength());
    }

    private int getBottomSelectionPixel(int i, int j, int k)
    {
        int l = i;
        if (k != -1 + super.mItemCount)
            l -= j;
        return l;
    }

    private int getTopSelectionPixel(int i, int j, int k)
    {
        int l = i;
        if (k > 0)
            l += j;
        return l;
    }

    private boolean handleHorizontalFocusWithinListItem(int i)
    {
        if (i != 17 && i != 66)
            throw new IllegalArgumentException("direction must be one of {View.FOCUS_LEFT, View.FOCUS_RIGHT}");
        int j = getChildCount();
        if (mItemsCanFocus && j > 0 && super.mSelectedPosition != -1)
        {
            View view = getSelectedView();
            if (view != null && view.hasFocus() && (view instanceof ViewGroup))
            {
                View view1 = view.findFocus();
                View view2 = FocusFinder.getInstance().findNextFocus((ViewGroup)view, view1, i);
                if (view2 != null)
                {
                    view1.getFocusedRect(mTempRect);
                    offsetDescendantRectToMyCoords(view1, mTempRect);
                    offsetRectIntoDescendantCoords(view2, mTempRect);
                    if (view2.requestFocus(i, mTempRect))
                        return true;
                }
                View view3 = FocusFinder.getInstance().findNextFocus((ViewGroup)getRootView(), view1, i);
                if (view3 != null)
                    return isViewAncestorOf(view3, this);
            }
        }
        return false;
    }

    private void handleNewSelectionChange(View view, int i, int j, boolean flag)
    {
        if (j == -1)
            throw new IllegalArgumentException("newSelectedPosition needs to be valid");
        int k = super.mSelectedPosition - super.mFirstPosition;
        int l = j - super.mFirstPosition;
        int i1;
        int j1;
        View view1;
        View view2;
        boolean flag1;
        if (i == 33)
        {
            i1 = l;
            j1 = k;
            view1 = getChildAt(i1);
            view2 = view;
            flag1 = true;
        } else
        {
            i1 = k;
            j1 = l;
            view1 = view;
            view2 = getChildAt(j1);
            flag1 = false;
        }
        int k1 = getChildCount();
        if (view1 != null)
        {
            boolean flag3;
            if (!flag && flag1)
                flag3 = true;
            else
                flag3 = false;
            view1.setSelected(flag3);
            measureAndAdjustDown(view1, i1, k1);
        }
        if (view2 != null)
        {
            boolean flag2;
            if (!flag && !flag1)
                flag2 = true;
            else
                flag2 = false;
            view2.setSelected(flag2);
            measureAndAdjustDown(view2, j1, k1);
        }
    }

    private boolean isDirectChildHeaderOrFooter(View view)
    {
        ArrayList arraylist = mHeaderViewInfos;
        int i = arraylist.size();
        for (int j = 0; j < i; j++)
            if (view == ((FixedViewInfo)arraylist.get(j)).view)
                return true;

        ArrayList arraylist1 = mFooterViewInfos;
        int k = arraylist1.size();
        for (int l = 0; l < k; l++)
            if (view == ((FixedViewInfo)arraylist1.get(l)).view)
                return true;

        return false;
    }

    private boolean isViewAncestorOf(View view, View view1)
    {
        if (view != view1)
        {
            ViewParent viewparent = view.getParent();
            if (!(viewparent instanceof ViewGroup) || !isViewAncestorOf((View)viewparent, view1))
                return false;
        }
        return true;
    }

    private int lookForSelectablePositionOnScreen(int i)
    {
label0:
        {
label1:
            {
                int j = super.mFirstPosition;
                int i1;
                if (i == 130)
                {
                    int j1;
                    if (super.mSelectedPosition != -1)
                        j1 = 1 + super.mSelectedPosition;
                    else
                        j1 = j;
                    if (j1 >= super.mAdapter.getCount())
                    {
                        i1 = -1;
                    } else
                    {
                        if (j1 < j)
                            j1 = j;
                        int k1 = getLastVisiblePosition();
                        ListAdapter listadapter1 = getAdapter();
                        i1 = j1;
                        do
                        {
                            if (i1 > k1)
                                break label1;
                            if (listadapter1.isEnabled(i1) && getChildAt(i1 - j).getVisibility() == 0)
                                break;
                            i1++;
                        } while (true);
                    }
                } else
                {
                    int k = -1 + (j + getChildCount());
                    int l;
                    if (super.mSelectedPosition != -1)
                        l = -1 + super.mSelectedPosition;
                    else
                        l = -1 + (j + getChildCount());
                    if (l < 0 || l >= super.mAdapter.getCount())
                        break label0;
                    if (l > k)
                        l = k;
                    ListAdapter listadapter = getAdapter();
                    i1 = l;
                    do
                    {
                        if (i1 < j)
                            break label1;
                        if (listadapter.isEnabled(i1) && getChildAt(i1 - j).getVisibility() == 0)
                            break;
                        i1--;
                    } while (true);
                }
                return i1;
            }
            return -1;
        }
        return -1;
    }

    private View makeAndAddView(int i, int j, boolean flag, int k, boolean flag1)
    {
        if (!super.mDataChanged)
        {
            View view1 = super.mRecycler.getActiveView(i);
            if (view1 != null)
            {
                setupChild(view1, i, j, flag, k, flag1, true);
                return view1;
            }
        }
        View view = obtainView(i, super.mIsScrap);
        setupChild(view, i, j, flag, k, flag1, super.mIsScrap[0]);
        return view;
    }

    private void measureAndAdjustDown(View view, int i, int j)
    {
        int k = view.getHeight();
        measureItem(view);
        if (view.getMeasuredHeight() != k)
        {
            relayoutMeasuredItem(view);
            int l = view.getMeasuredHeight() - k;
            for (int i1 = i + 1; i1 < j; i1++)
                getChildAt(i1).offsetTopAndBottom(l);

        }
    }

    private void measureItem(View view)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        if (layoutparams == null)
            layoutparams = new android.view.ViewGroup.LayoutParams(-1, -2);
        int i = ViewGroup.getChildMeasureSpec(super.mWidthMeasureSpec, super.mListPadding.left + super.mListPadding.right, layoutparams.width);
        int j = layoutparams.height;
        int k;
        if (j > 0)
            k = android.view.View.MeasureSpec.makeMeasureSpec(j, 0x40000000);
        else
            k = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(i, k);
    }

    private void measureScrapChild(View view, int i, int j)
    {
        AbsListView.LayoutParams layoutparams = (AbsListView.LayoutParams)view.getLayoutParams();
        if (layoutparams == null)
        {
            layoutparams = (AbsListView.LayoutParams)generateDefaultLayoutParams();
            view.setLayoutParams(layoutparams);
        }
        layoutparams.viewType = super.mAdapter.getItemViewType(i);
        layoutparams.forceAdd = true;
        int k = ViewGroup.getChildMeasureSpec(j, super.mListPadding.left + super.mListPadding.right, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width);
        int l = ((android.view.ViewGroup.LayoutParams) (layoutparams)).height;
        int i1;
        if (l > 0)
            i1 = android.view.View.MeasureSpec.makeMeasureSpec(l, 0x40000000);
        else
            i1 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
        view.measure(k, i1);
    }

    private View moveSelection(View view, View view1, int i, int j, int k)
    {
        int l = getVerticalFadingEdgeLength();
        int i1 = super.mSelectedPosition;
        int j1 = getTopSelectionPixel(j, l, i1);
        int k1 = getBottomSelectionPixel(j, l, i1);
        if (i > 0)
        {
            View view4 = makeAndAddView(i1 - 1, view.getTop(), true, super.mListPadding.left, false);
            int l2 = mDividerHeight;
            View view5 = makeAndAddView(i1, l2 + view4.getBottom(), true, super.mListPadding.left, true);
            if (view5.getBottom() > k1)
            {
                int i3 = view5.getTop() - j1;
                int j3 = view5.getBottom() - k1;
                int k3 = (k - j) / 2;
                int l3 = Math.min(Math.min(i3, j3), k3);
                view4.offsetTopAndBottom(-l3);
                view5.offsetTopAndBottom(-l3);
            }
            if (!super.mStackFromBottom)
            {
                fillUp(-2 + super.mSelectedPosition, view5.getTop() - l2);
                adjustViewsUpOrDown();
                fillDown(1 + super.mSelectedPosition, l2 + view5.getBottom());
                return view5;
            } else
            {
                fillDown(1 + super.mSelectedPosition, l2 + view5.getBottom());
                adjustViewsUpOrDown();
                fillUp(-2 + super.mSelectedPosition, view5.getTop() - l2);
                return view5;
            }
        }
        if (i < 0)
        {
            View view3;
            if (view1 != null)
                view3 = makeAndAddView(i1, view1.getTop(), true, super.mListPadding.left, true);
            else
                view3 = makeAndAddView(i1, view.getTop(), false, super.mListPadding.left, true);
            if (view3.getTop() < j1)
            {
                int i2 = j1 - view3.getTop();
                int j2 = k1 - view3.getBottom();
                int k2 = (k - j) / 2;
                view3.offsetTopAndBottom(Math.min(Math.min(i2, j2), k2));
            }
            fillAboveAndBelow(view3, i1);
            return view3;
        }
        int l1 = view.getTop();
        View view2 = makeAndAddView(i1, l1, true, super.mListPadding.left, true);
        if (l1 < j && view2.getBottom() < j + 20)
            view2.offsetTopAndBottom(j - view2.getTop());
        fillAboveAndBelow(view2, i1);
        return view2;
    }

    private int positionOfNewFocus(View view)
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            if (isViewAncestorOf(view, getChildAt(j)))
                return j + super.mFirstPosition;

        throw new IllegalArgumentException("newFocus is not a child of any of the children of the list!");
    }

    private void relayoutMeasuredItem(View view)
    {
        int i = view.getMeasuredWidth();
        int j = view.getMeasuredHeight();
        int k = super.mListPadding.left;
        int l = k + i;
        int i1 = view.getTop();
        view.layout(k, i1, l, i1 + j);
    }

    private void removeFixedViewInfo(View view, ArrayList arraylist)
    {
        int i = arraylist.size();
        int j = 0;
        do
        {
label0:
            {
                if (j < i)
                {
                    if (((FixedViewInfo)arraylist.get(j)).view != view)
                        break label0;
                    arraylist.remove(j);
                }
                return;
            }
            j++;
        } while (true);
    }

    private void scrollListItemsBy(int i)
    {
        offsetChildrenTopAndBottom(i);
        int j = getHeight() - super.mListPadding.bottom;
        int k = super.mListPadding.top;
        AbsListView.RecycleBin recyclebin = super.mRecycler;
        if (i < 0)
        {
            int i1 = getChildCount();
            View view2 = getChildAt(i1 - 1);
            do
            {
                if (view2.getBottom() >= j)
                    break;
                int j1 = -1 + (i1 + super.mFirstPosition);
                if (j1 >= -1 + super.mItemCount)
                    break;
                view2 = addViewBelow(view2, j1);
                i1++;
            } while (true);
            if (view2.getBottom() < j)
                offsetChildrenTopAndBottom(j - view2.getBottom());
            for (View view3 = getChildAt(0); view3.getBottom() < k;)
            {
                if (recyclebin.shouldRecycleViewType(((AbsListView.LayoutParams)view3.getLayoutParams()).viewType))
                {
                    detachViewFromParent(view3);
                    recyclebin.addScrapView(view3, super.mFirstPosition);
                } else
                {
                    removeViewInLayout(view3);
                }
                view3 = getChildAt(0);
                super.mFirstPosition = 1 + super.mFirstPosition;
            }

        } else
        {
            View view;
            for (view = getChildAt(0); view.getTop() > k && super.mFirstPosition > 0; super.mFirstPosition = -1 + super.mFirstPosition)
                view = addViewAbove(view, super.mFirstPosition);

            if (view.getTop() > k)
                offsetChildrenTopAndBottom(k - view.getTop());
            int l = -1 + getChildCount();
            for (View view1 = getChildAt(l); view1.getTop() > j; view1 = getChildAt(l))
            {
                if (recyclebin.shouldRecycleViewType(((AbsListView.LayoutParams)view1.getLayoutParams()).viewType))
                {
                    detachViewFromParent(view1);
                    recyclebin.addScrapView(view1, l + super.mFirstPosition);
                } else
                {
                    removeViewInLayout(view1);
                }
                l--;
            }

        }
    }

    private void setupChild(View view, int i, int j, boolean flag, int k, boolean flag1, boolean flag2)
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
        int l = super.mTouchMode;
        boolean flag5;
        if (l > 0 && l < 3 && super.mMotionPosition == i)
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
        layoutparams.viewType = super.mAdapter.getItemViewType(i);
        if ((!flag2 || layoutparams.forceAdd) && (!layoutparams.recycledHeaderFooter || layoutparams.viewType != -2))
        {
            layoutparams.forceAdd = false;
            if (layoutparams.viewType == -2)
                layoutparams.recycledHeaderFooter = true;
            byte byte0;
            if (flag)
                byte0 = -1;
            else
                byte0 = 0;
            addViewInLayout(view, byte0, layoutparams, true);
        } else
        {
            byte byte1;
            if (flag)
                byte1 = -1;
            else
                byte1 = 0;
            attachViewToParent(view, byte1, layoutparams);
        }
        if (flag4)
            view.setSelected(flag3);
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
            int l1 = ViewGroup.getChildMeasureSpec(super.mWidthMeasureSpec, super.mListPadding.left + super.mListPadding.right, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width);
            int i2 = ((android.view.ViewGroup.LayoutParams) (layoutparams)).height;
            int j2;
            if (i2 > 0)
                j2 = android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x40000000);
            else
                j2 = android.view.View.MeasureSpec.makeMeasureSpec(0, 0);
            view.measure(l1, j2);
        } else
        {
            cleanupLayoutState(view);
        }
        int i1 = view.getMeasuredWidth();
        int j1 = view.getMeasuredHeight();
        int k1;
        if (flag)
            k1 = j;
        else
            k1 = j - j1;
        if (flag7)
        {
            view.layout(k, k1, k + i1, k1 + j1);
        } else
        {
            view.offsetLeftAndRight(k - view.getLeft());
            view.offsetTopAndBottom(k1 - view.getTop());
        }
        if (super.mCachingStarted && !view.isDrawingCacheEnabled())
            view.setDrawingCacheEnabled(true);
        if (flag2 && ((AbsListView.LayoutParams)view.getLayoutParams()).scrappedFromPosition != i)
            view.jumpDrawablesToCurrentState();
    }

    private boolean showingBottomFadingEdge()
    {
        int i = getChildCount();
        int j = getChildAt(i - 1).getBottom();
        int k = -1 + (i + super.mFirstPosition);
        int l = (super.mScrollY + getHeight()) - super.mListPadding.bottom;
        return k < -1 + super.mItemCount || j < l;
    }

    private boolean showingTopFadingEdge()
    {
        boolean flag;
label0:
        {
            int i = super.mScrollY + super.mListPadding.top;
            if (super.mFirstPosition <= 0)
            {
                int j = getChildAt(0).getTop();
                flag = false;
                if (j <= i)
                    break label0;
            }
            flag = true;
        }
        return flag;
    }

    public void addFooterView(View view)
    {
        addFooterView(view, null, true);
    }

    public void addFooterView(View view, Object obj, boolean flag)
    {
        FixedViewInfo fixedviewinfo = new FixedViewInfo();
        fixedviewinfo.view = view;
        fixedviewinfo.data = obj;
        fixedviewinfo.isSelectable = flag;
        mFooterViewInfos.add(fixedviewinfo);
        if (super.mAdapter != null && super.mDataSetObserver != null)
            super.mDataSetObserver.onChanged();
    }

    public void addHeaderView(View view)
    {
        addHeaderView(view, null, true);
    }

    public void addHeaderView(View view, Object obj, boolean flag)
    {
        if (super.mAdapter != null && !(super.mAdapter instanceof HeaderViewListAdapter))
            throw new IllegalStateException("Cannot add header view to list -- setAdapter has already been called.");
        FixedViewInfo fixedviewinfo = new FixedViewInfo();
        fixedviewinfo.view = view;
        fixedviewinfo.data = obj;
        fixedviewinfo.isSelectable = flag;
        mHeaderViewInfos.add(fixedviewinfo);
        if (super.mAdapter != null && super.mDataSetObserver != null)
            super.mDataSetObserver.onChanged();
    }

    boolean arrowScroll(int i)
    {
        boolean flag;
        super.mInLayout = true;
        flag = arrowScrollImpl(i);
        if (!flag)
            break MISSING_BLOCK_LABEL_23;
        playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        super.mInLayout = false;
        return flag;
        Exception exception;
        exception;
        super.mInLayout = false;
        throw exception;
    }

    protected boolean canAnimate()
    {
        return super.canAnimate() && super.mItemCount > 0;
    }

    public void clearScrapViewsIfNeeded()
    {
        Xlog.d("ListView", (new StringBuilder()).append("clearScrapViewsIfNeeded: mRecycler = ").append(super.mRecycler).append(",mAbandonActiveViews = ").append(mAbandonActiveViews).append(",this = ").append(this).toString());
        super.mRecycler.clear();
        mAbandonActiveViews = true;
    }

    protected void dispatchDraw(Canvas canvas)
    {
label0:
        {
            int i;
            Drawable drawable;
            Drawable drawable1;
            boolean flag;
            boolean flag1;
            boolean flag2;
            Rect rect;
            int j;
            int k;
            int i1;
            boolean flag3;
            boolean flag4;
            int j1;
            boolean flag5;
            ListAdapter listadapter;
            boolean flag6;
            Paint paint;
            int i2;
            int j2;
label1:
            {
                if (super.mCachingStarted)
                    super.mCachingActive = true;
                i = mDividerHeight;
                drawable = mOverScrollHeader;
                drawable1 = mOverScrollFooter;
                if (drawable != null)
                    flag = true;
                else
                    flag = false;
                if (drawable1 != null)
                    flag1 = true;
                else
                    flag1 = false;
                if (i > 0 && mDivider != null)
                    flag2 = true;
                else
                    flag2 = false;
                if (!flag2 && !flag && !flag1)
                    break label0;
                rect = mTempRect;
                rect.left = super.mPaddingLeft;
                rect.right = super.mRight - super.mLeft - super.mPaddingRight;
                j = getChildCount();
                k = mHeaderViewInfos.size();
                int l = super.mItemCount;
                i1 = -1 + (l - mFooterViewInfos.size());
                flag3 = mHeaderDividersEnabled;
                flag4 = mFooterDividersEnabled;
                j1 = super.mFirstPosition;
                flag5 = mAreAllItemsSelectable;
                listadapter = super.mAdapter;
                if (isOpaque() && !super.isOpaque())
                    flag6 = true;
                else
                    flag6 = false;
                if (flag6 && mDividerPaint == null && mIsCacheColorOpaque)
                {
                    mDividerPaint = new Paint();
                    mDividerPaint.setColor(getCacheColorHint());
                }
                paint = mDividerPaint;
                int k1 = 0x22 & super.mGroupFlags;
                int l1 = 0;
                i2 = 0;
                if (k1 == 34)
                {
                    i2 = super.mListPadding.top;
                    l1 = super.mListPadding.bottom;
                }
                j2 = (super.mBottom - super.mTop - l1) + super.mScrollY;
                if (super.mStackFromBottom)
                    break label1;
                int l3 = 0;
                int i4 = super.mScrollY;
                if (j > 0 && i4 < 0)
                    if (flag)
                    {
                        rect.bottom = 0;
                        rect.top = i4;
                        drawOverscrollHeader(canvas, drawable, rect);
                    } else
                    if (flag2)
                    {
                        rect.bottom = 0;
                        rect.top = -i;
                        drawDivider(canvas, rect, -1);
                    }
                for (int j4 = 0; j4 < j; j4++)
                {
label2:
                    {
                        if (!flag3 && j1 + j4 < k || !flag4 && j1 + j4 >= i1)
                            continue;
                        l3 = getChildAt(j4).getBottom();
                        if (!flag2 || l3 >= j2)
                            continue;
                        if (flag1)
                        {
                            int i5 = j - 1;
                            if (j4 == i5)
                                continue;
                        }
                        if (flag5)
                            break label2;
                        if (listadapter.isEnabled(j1 + j4))
                        {
                            int l4 = j - 1;
                            if (j4 == l4 || listadapter.isEnabled(1 + (j1 + j4)))
                                break label2;
                        }
                        if (flag6)
                        {
                            rect.top = l3;
                            rect.bottom = l3 + i;
                            canvas.drawRect(rect, paint);
                        }
                        continue;
                    }
                    rect.top = l3;
                    rect.bottom = l3 + i;
                    drawDivider(canvas, rect, j4);
                }

                int k4 = super.mBottom + super.mScrollY;
                if (flag1 && j1 + j == l && k4 > l3)
                {
                    rect.top = l3;
                    rect.bottom = k4;
                    drawOverscrollFooter(canvas, drawable1, rect);
                }
                break label0;
            }
            int k2 = super.mScrollY;
            if (j > 0 && flag)
            {
                rect.top = k2;
                rect.bottom = getChildAt(0).getTop();
                drawOverscrollHeader(canvas, drawable, rect);
            }
            boolean flag7;
            if (flag)
                flag7 = true;
            else
                flag7 = false;
            for (int l2 = ((flag7) ? 1 : 0); l2 < j; l2++)
            {
                int j3;
label3:
                {
                    if (!flag3 && j1 + l2 < k || !flag4 && j1 + l2 >= i1)
                        continue;
                    j3 = getChildAt(l2).getTop();
                    if (j3 <= i2)
                        continue;
                    if (flag5)
                        break label3;
                    if (listadapter.isEnabled(j1 + l2))
                    {
                        int k3 = j - 1;
                        if (l2 == k3 || listadapter.isEnabled(1 + (j1 + l2)))
                            break label3;
                    }
                    if (flag6)
                    {
                        rect.top = j3 - i;
                        rect.bottom = j3;
                        canvas.drawRect(rect, paint);
                    }
                    continue;
                }
                rect.top = j3 - i;
                rect.bottom = j3;
                drawDivider(canvas, rect, l2 - 1);
            }

            if (j > 0 && k2 > 0)
                if (flag1)
                {
                    int i3 = super.mBottom;
                    rect.top = i3;
                    rect.bottom = i3 + k2;
                    drawOverscrollFooter(canvas, drawable1, rect);
                } else
                if (flag2)
                {
                    rect.top = j2;
                    rect.bottom = j2 + i;
                    drawDivider(canvas, rect, -1);
                }
        }
        super.dispatchDraw(canvas);
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        boolean flag = super.dispatchKeyEvent(keyevent);
        if (!flag && getFocusedChild() != null && keyevent.getAction() == 0)
            flag = onKeyDown(keyevent.getKeyCode(), keyevent);
        return flag;
    }

    protected boolean drawChild(Canvas canvas, View view, long l)
    {
        boolean flag = super.drawChild(canvas, view, l);
        if (super.mCachingActive && view.mCachingFailed)
            super.mCachingActive = false;
        return flag;
    }

    void drawDivider(Canvas canvas, Rect rect, int i)
    {
        Drawable drawable = mDivider;
        drawable.setBounds(rect);
        drawable.draw(canvas);
    }

    void drawOverscrollFooter(Canvas canvas, Drawable drawable, Rect rect)
    {
        int i = drawable.getMinimumHeight();
        canvas.save();
        canvas.clipRect(rect);
        if (rect.bottom - rect.top < i)
            rect.bottom = i + rect.top;
        drawable.setBounds(rect);
        drawable.draw(canvas);
        canvas.restore();
    }

    void drawOverscrollHeader(Canvas canvas, Drawable drawable, Rect rect)
    {
        int i = drawable.getMinimumHeight();
        canvas.save();
        canvas.clipRect(rect);
        if (rect.bottom - rect.top < i)
            rect.top = rect.bottom - i;
        drawable.setBounds(rect);
        drawable.draw(canvas);
        canvas.restore();
    }

    void fillGap(boolean flag)
    {
        int i = getChildCount();
        if (flag)
        {
            int i1 = 0x22 & super.mGroupFlags;
            int j1 = 0;
            if (i1 == 34)
                j1 = getListPaddingTop();
            int k1;
            if (i > 0)
                k1 = getChildAt(i - 1).getBottom() + mDividerHeight;
            else
                k1 = j1;
            fillDown(i + super.mFirstPosition, k1);
            correctTooHigh(getChildCount());
            return;
        }
        int j = 0x22 & super.mGroupFlags;
        int k = 0;
        if (j == 34)
            k = getListPaddingBottom();
        int l;
        if (i > 0)
            l = getChildAt(0).getTop() - mDividerHeight;
        else
            l = getHeight() - k;
        fillUp(-1 + super.mFirstPosition, l);
        correctTooLow(getChildCount());
    }

    int findMotionRow(int i)
    {
        int j = getChildCount();
        if (j > 0)
            if (!super.mStackFromBottom)
            {
                for (int l = 0; l < j; l++)
                    if (i <= getChildAt(l).getBottom())
                        return l + super.mFirstPosition;

            } else
            {
                for (int k = j - 1; k >= 0; k--)
                    if (i >= getChildAt(k).getTop())
                        return k + super.mFirstPosition;

            }
        return -1;
    }

    View findViewByPredicateInHeadersOrFooters(ArrayList arraylist, Predicate predicate, View view)
    {
        if (arraylist != null)
        {
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                View view1 = ((FixedViewInfo)arraylist.get(j)).view;
                if (view1 == view || view1.isRootNamespace())
                    continue;
                View view2 = view1.findViewByPredicate(predicate);
                if (view2 != null)
                    return view2;
            }

        }
        return null;
    }

    protected View findViewByPredicateTraversal(Predicate predicate, View view)
    {
        View view1 = super.findViewByPredicateTraversal(predicate, view);
        if (view1 == null)
        {
            View view2 = findViewByPredicateInHeadersOrFooters(mHeaderViewInfos, predicate, view);
            if (view2 != null)
                return view2;
            view1 = findViewByPredicateInHeadersOrFooters(mFooterViewInfos, predicate, view);
            if (view1 != null)
                return view1;
        }
        return view1;
    }

    View findViewInHeadersOrFooters(ArrayList arraylist, int i)
    {
        if (arraylist != null)
        {
            int j = arraylist.size();
            for (int k = 0; k < j; k++)
            {
                View view = ((FixedViewInfo)arraylist.get(k)).view;
                if (view.isRootNamespace())
                    continue;
                View view1 = view.findViewById(i);
                if (view1 != null)
                    return view1;
            }

        }
        return null;
    }

    protected View findViewTraversal(int i)
    {
        View view = super.findViewTraversal(i);
        if (view == null)
        {
            View view1 = findViewInHeadersOrFooters(mHeaderViewInfos, i);
            if (view1 != null)
                return view1;
            view = findViewInHeadersOrFooters(mFooterViewInfos, i);
            if (view != null)
                return view;
        }
        return view;
    }

    View findViewWithTagInHeadersOrFooters(ArrayList arraylist, Object obj)
    {
        if (arraylist != null)
        {
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
            {
                View view = ((FixedViewInfo)arraylist.get(j)).view;
                if (view.isRootNamespace())
                    continue;
                View view1 = view.findViewWithTag(obj);
                if (view1 != null)
                    return view1;
            }

        }
        return null;
    }

    protected View findViewWithTagTraversal(Object obj)
    {
        View view = super.findViewWithTagTraversal(obj);
        if (view == null)
        {
            View view1 = findViewWithTagInHeadersOrFooters(mHeaderViewInfos, obj);
            if (view1 != null)
                return view1;
            view = findViewWithTagInHeadersOrFooters(mFooterViewInfos, obj);
            if (view != null)
                return view;
        }
        return view;
    }

    boolean fullScroll(int i)
    {
        boolean flag;
        if (i == 33)
        {
            int i1 = super.mSelectedPosition;
            flag = false;
            if (i1 != 0)
            {
                int j1 = lookForSelectablePosition(0, true);
                if (j1 >= 0)
                {
                    super.mLayoutMode = 1;
                    setSelectionInt(j1);
                    invokeOnItemScrollListener();
                }
                flag = true;
            }
        } else
        {
            flag = false;
            if (i == 130)
            {
                int j = super.mSelectedPosition;
                int k = -1 + super.mItemCount;
                flag = false;
                if (j < k)
                {
                    int l = lookForSelectablePosition(-1 + super.mItemCount, true);
                    if (l >= 0)
                    {
                        super.mLayoutMode = 3;
                        setSelectionInt(l);
                        invokeOnItemScrollListener();
                    }
                    flag = true;
                }
            }
        }
        if (flag && !awakenScrollBars())
        {
            awakenScrollBars();
            invalidate();
        }
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

    public long[] getCheckItemIds()
    {
label0:
        {
            long al[];
            if (super.mAdapter != null && super.mAdapter.hasStableIds())
            {
                al = getCheckedItemIds();
            } else
            {
                if (super.mChoiceMode == 0 || super.mCheckStates == null || super.mAdapter == null)
                    break label0;
                SparseBooleanArray sparsebooleanarray = super.mCheckStates;
                int i = sparsebooleanarray.size();
                al = new long[i];
                ListAdapter listadapter = super.mAdapter;
                int j = 0;
                int k;
                int l;
                for (k = 0; j < i; k = l)
                {
                    if (sparsebooleanarray.valueAt(j))
                    {
                        l = k + 1;
                        al[k] = listadapter.getItemId(sparsebooleanarray.keyAt(j));
                    } else
                    {
                        l = k;
                    }
                    j++;
                }

                if (k != i)
                {
                    long al1[] = new long[k];
                    System.arraycopy(al, 0, al1, 0, k);
                    return al1;
                }
            }
            return al;
        }
        return new long[0];
    }

    public Drawable getDivider()
    {
        return mDivider;
    }

    public int getDividerHeight()
    {
        return mDividerHeight;
    }

    public int getFooterViewsCount()
    {
        return mFooterViewInfos.size();
    }

    public int getHeaderViewsCount()
    {
        return mHeaderViewInfos.size();
    }

    public boolean getItemsCanFocus()
    {
        return mItemsCanFocus;
    }

    public int getMaxScrollAmount()
    {
        return (int)(0.33F * (float)(super.mBottom - super.mTop));
    }

    public Drawable getOverscrollFooter()
    {
        return mOverScrollFooter;
    }

    public Drawable getOverscrollHeader()
    {
        return mOverScrollHeader;
    }

    public boolean isOpaque()
    {
        boolean flag;
        if ((!super.mCachingActive || !mIsCacheColorOpaque || !mDividerIsOpaque || !hasOpaqueScrollbars()) && !super.isOpaque())
            flag = false;
        else
            flag = true;
        if (flag)
        {
            int i;
            if (super.mListPadding != null)
                i = super.mListPadding.top;
            else
                i = super.mPaddingTop;
            View view = getChildAt(0);
            if (view != null && view.getTop() <= i)
            {
                int j = getHeight();
                int k;
                if (super.mListPadding != null)
                    k = super.mListPadding.bottom;
                else
                    k = super.mPaddingBottom;
                int l = j - k;
                View view1 = getChildAt(-1 + getChildCount());
                if (view1 == null || view1.getBottom() < l)
                    return false;
            } else
            {
                flag = false;
            }
        }
        return flag;
    }

    protected void layoutChildren()
    {
        boolean flag = super.mBlockLayoutRequests;
        if (flag) goto _L2; else goto _L1
_L1:
        super.mBlockLayoutRequests = true;
        super.layoutChildren();
        invalidate();
        if (super.mAdapter != null) goto _L4; else goto _L3
_L3:
        resetList();
        invokeOnItemScrollListener();
        if (flag) goto _L2; else goto _L5
_L5:
        super.mBlockLayoutRequests = false;
_L2:
        return;
_L4:
        int i;
        int j;
        int k;
        i = super.mListPadding.top;
        j = super.mBottom - super.mTop - super.mListPadding.bottom;
        k = getChildCount();
        int l = -1;
        int i1 = super.mLayoutMode;
        View view;
        View view1;
        int j1;
        View view2;
        view = null;
        view1 = null;
        j1 = 0;
        view2 = null;
        i1;
        JVM INSTR tableswitch 1 5: default 136
    //                   1 216
    //                   2 253
    //                   3 216
    //                   4 216
    //                   5 216;
           goto _L6 _L7 _L8 _L7 _L7 _L7
_L7:
        break MISSING_BLOCK_LABEL_216;
_L6:
        int l2 = super.mSelectedPosition - super.mFirstPosition;
        view = null;
        if (l2 < 0)
            break MISSING_BLOCK_LABEL_173;
        view = null;
        if (l2 >= k)
            break MISSING_BLOCK_LABEL_173;
        view = getChildAt(l2);
        int i3;
        view2 = getChildAt(0);
        i3 = super.mNextSelectedPosition;
        j1 = 0;
        if (i3 < 0) goto _L10; else goto _L9
_L9:
        j1 = super.mNextSelectedPosition - super.mSelectedPosition;
_L10:
        view1 = getChildAt(l2 + j1);
_L17:
        boolean flag1 = super.mDataChanged;
        if (!flag1) goto _L12; else goto _L11
_L11:
        handleDataChanged();
_L12:
        if (super.mItemCount != 0) goto _L14; else goto _L13
_L13:
        resetList();
        invokeOnItemScrollListener();
        if (flag) goto _L2; else goto _L15
_L15:
        break; /* Loop/switch isn't completed */
_L8:
        int k1 = super.mNextSelectedPosition - super.mFirstPosition;
        view = null;
        view1 = null;
        j1 = 0;
        view2 = null;
        if (k1 < 0) goto _L17; else goto _L16
_L16:
        view = null;
        view1 = null;
        j1 = 0;
        view2 = null;
        if (k1 >= k) goto _L17; else goto _L18
_L18:
        view1 = getChildAt(k1);
        view = null;
        j1 = 0;
        view2 = null;
          goto _L17
_L14:
        if (super.mItemCount != super.mAdapter.getCount())
            throw new IllegalStateException((new StringBuilder()).append("The content of the adapter has changed but ListView did not receive a notification. Make sure the content of your adapter is not modified from a background thread, but only from the UI thread. [in ListView(").append(getId()).append(", ").append(getClass()).append(") with Adapter(").append(super.mAdapter.getClass()).append(")]").toString());
          goto _L19
        Exception exception;
        exception;
        if (!flag)
            super.mBlockLayoutRequests = false;
        throw exception;
_L19:
        int l1;
        AbsListView.RecycleBin recyclebin;
        setSelectedPositionInt(super.mNextSelectedPosition);
        l1 = super.mFirstPosition;
        recyclebin = super.mRecycler;
        if (!flag1) goto _L21; else goto _L20
_L20:
        if (mAbandonActiveViews) goto _L23; else goto _L22
_L22:
        int i2 = 0;
_L24:
        if (i2 >= k)
            break; /* Loop/switch isn't completed */
        recyclebin.addScrapView(getChildAt(i2), l1 + i2);
        i2++;
        if (true) goto _L24; else goto _L23
_L21:
        recyclebin.fillActiveViews(k, l1);
_L23:
        View view3 = getFocusedChild();
        View view4;
        View view5;
        view4 = null;
        view5 = null;
        if (view3 == null) goto _L26; else goto _L25
_L25:
        if (!flag1) goto _L28; else goto _L27
_L27:
        boolean flag3 = isDirectChildHeaderOrFooter(view3);
        view4 = null;
        view5 = null;
        if (!flag3)
            break MISSING_BLOCK_LABEL_548;
_L28:
        view4 = view3;
        view5 = findFocus();
        if (view5 == null)
            break MISSING_BLOCK_LABEL_548;
        view5.onStartTemporaryDetach();
        requestFocus();
_L26:
        ViewRootImpl viewrootimpl = getViewRootImpl();
        AccessibilityNodeInfo accessibilitynodeinfo;
        View view6;
        accessibilitynodeinfo = null;
        view6 = null;
        if (viewrootimpl == null) goto _L30; else goto _L29
_L29:
        View view7 = viewrootimpl.getAccessibilityFocusedHost();
        accessibilitynodeinfo = null;
        view6 = null;
        if (view7 == null) goto _L30; else goto _L31
_L31:
        View view8 = findAccessibilityFocusedChild(view7);
        accessibilitynodeinfo = null;
        view6 = null;
        if (view8 == null) goto _L30; else goto _L32
_L32:
        if (!flag1) goto _L34; else goto _L33
_L33:
        if (!isDirectChildHeaderOrFooter(view8)) goto _L35; else goto _L34
_L34:
        view6 = view7;
        accessibilitynodeinfo = viewrootimpl.getAccessibilityFocusedVirtualView();
_L30:
        detachAllViewsFromParent();
        recyclebin.removeSkippedScrap();
        super.mLayoutMode;
        JVM INSTR tableswitch 1 6: default 684
    //                   1 1019
    //                   2 947
    //                   3 998
    //                   4 1038
    //                   5 981
    //                   6 1055;
           goto _L36 _L37 _L38 _L39 _L40 _L41 _L42
_L36:
        if (k != 0) goto _L44; else goto _L43
_L43:
        if (super.mStackFromBottom) goto _L46; else goto _L45
_L45:
        View view9;
        setSelectedPositionInt(lookForSelectablePosition(0, true));
        view9 = fillFromTop(i);
_L67:
        if (!mAbandonActiveViews) goto _L48; else goto _L47
_L47:
        Xlog.i("ListView", "Abandon active views because it cann't be reused!");
        mAbandonActiveViews = false;
_L76:
        if (view9 == null) goto _L50; else goto _L49
_L49:
        if (!mItemsCanFocus || !hasFocus() || view9.hasFocus()) goto _L52; else goto _L51
_L51:
        if (view9 != view4 || view5 == null) goto _L54; else goto _L53
_L53:
        if (view5.requestFocus()) goto _L55; else goto _L54
_L54:
        if (!view9.requestFocus()) goto _L56; else goto _L55
_L89:
        boolean flag2;
        if (flag2) goto _L58; else goto _L57
_L57:
        View view11 = getFocusedChild();
        if (view11 == null) goto _L60; else goto _L59
_L59:
        view11.clearFocus();
_L60:
        positionSelector(-1, view9);
_L77:
        super.mSelectedTop = view9.getTop();
_L83:
        if (accessibilitynodeinfo == null) goto _L62; else goto _L61
_L61:
        accessibilitynodeinfo.performAction(64);
_L86:
        if (view5 == null) goto _L64; else goto _L63
_L63:
        if (view5.getWindowToken() != null)
            view5.onFinishTemporaryDetach();
_L64:
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
        if (flag) goto _L2; else goto _L5
_L35:
        l = getPositionForView(view8);
        accessibilitynodeinfo = null;
        view6 = null;
          goto _L30
_L38:
        if (view1 == null) goto _L66; else goto _L65
_L65:
        view9 = fillFromSelection(view1.getTop(), i, j);
          goto _L67
_L66:
        view9 = fillFromMiddle(i, j);
          goto _L67
_L41:
        view9 = fillSpecific(super.mSyncPosition, super.mSpecificTop);
          goto _L67
_L39:
        view9 = fillUp(-1 + super.mItemCount, j);
        adjustViewsUpOrDown();
          goto _L67
_L37:
        super.mFirstPosition = 0;
        view9 = fillFromTop(i);
        adjustViewsUpOrDown();
          goto _L67
_L40:
        view9 = fillSpecific(reconcileSelectedPosition(), super.mSpecificTop);
          goto _L67
_L42:
        view9 = moveSelection(view, view1, j1, i, j);
          goto _L67
_L46:
        setSelectedPositionInt(lookForSelectablePosition(-1 + super.mItemCount, false));
        view9 = fillUp(-1 + super.mItemCount, j);
          goto _L67
_L44:
        if (super.mSelectedPosition < 0 || super.mSelectedPosition >= super.mItemCount) goto _L69; else goto _L68
_L68:
        int k2 = super.mSelectedPosition;
        if (view != null) goto _L71; else goto _L70
_L70:
        view9 = fillSpecific(k2, i);
          goto _L67
_L71:
        i = view.getTop();
          goto _L70
_L69:
        if (super.mFirstPosition >= super.mItemCount) goto _L73; else goto _L72
_L72:
        int j2 = super.mFirstPosition;
        if (view2 != null) goto _L75; else goto _L74
_L74:
        view9 = fillSpecific(j2, i);
          goto _L67
_L75:
        i = view2.getTop();
          goto _L74
_L73:
        view9 = fillSpecific(0, i);
          goto _L67
_L48:
        recyclebin.scrapActiveViews();
          goto _L76
_L58:
        view9.setSelected(false);
        super.mSelectorRect.setEmpty();
          goto _L77
_L52:
        positionSelector(-1, view9);
          goto _L77
_L50:
        if (super.mTouchMode <= 0 || super.mTouchMode >= 3) goto _L79; else goto _L78
_L78:
        View view12 = getChildAt(super.mMotionPosition - super.mFirstPosition);
        if (view12 == null) goto _L81; else goto _L80
_L80:
        positionSelector(super.mMotionPosition, view12);
_L81:
        if (!hasFocus() || view5 == null) goto _L83; else goto _L82
_L82:
        view5.requestFocus();
          goto _L83
_L79:
        super.mSelectedTop = 0;
        super.mSelectorRect.setEmpty();
          goto _L81
_L62:
        if (view6 == null) goto _L85; else goto _L84
_L84:
        view6.requestAccessibilityFocus();
          goto _L86
_L85:
        if (l == -1) goto _L86; else goto _L87
_L87:
        View view10 = getChildAt(MathUtils.constrain(l - super.mFirstPosition, 0, -1 + getChildCount()));
        if (view10 == null) goto _L86; else goto _L88
_L88:
        view10.requestAccessibilityFocus();
          goto _L86
_L55:
        flag2 = true;
          goto _L89
_L56:
        flag2 = false;
          goto _L89
    }

    int lookForSelectablePosition(int i, boolean flag)
    {
        ListAdapter listadapter = super.mAdapter;
        if (listadapter != null && !isInTouchMode())
        {
            int j = listadapter.getCount();
            if (!mAreAllItemsSelectable)
            {
                int k;
                if (flag)
                    for (k = Math.max(0, i); k < j && !listadapter.isEnabled(k); k++);
                else
                    for (k = Math.min(i, j - 1); k >= 0 && !listadapter.isEnabled(k); k--);
                if (k >= 0 && k < j)
                    return k;
            } else
            if (i >= 0 && i < j)
                return i;
        }
        return -1;
    }

    final int measureHeightOfChildren(int i, int j, int k, int l, int i1)
    {
        ListAdapter listadapter = super.mAdapter;
        if (listadapter != null) goto _L2; else goto _L1
_L1:
        int l1 = super.mListPadding.top + super.mListPadding.bottom;
          goto _L3
_L2:
        int j1;
        int k1;
        AbsListView.RecycleBin recyclebin;
        boolean flag;
        boolean aflag[];
        int i2;
        j1 = super.mListPadding.top + super.mListPadding.bottom;
        if (mDividerHeight > 0 && mDivider != null)
            k1 = mDividerHeight;
        else
            k1 = 0;
        l1 = 0;
        if (k == -1)
            k = -1 + listadapter.getCount();
        recyclebin = super.mRecycler;
        flag = recycleOnMeasure();
        aflag = super.mIsScrap;
        i2 = j;
_L8:
        if (i2 > k) goto _L5; else goto _L4
_L4:
        View view = obtainView(i2, aflag);
        measureScrapChild(view, i2, i);
        if (i2 > 0)
            j1 += k1;
        if (flag && recyclebin.shouldRecycleViewType(((AbsListView.LayoutParams)view.getLayoutParams()).viewType))
            recyclebin.addScrapView(view, -1);
        j1 += view.getMeasuredHeight();
        if (j1 < l) goto _L7; else goto _L6
_L6:
        if (i1 < 0 || i2 <= i1 || l1 <= 0 || j1 == l)
            return l;
_L3:
        return l1;
_L7:
        if (i1 >= 0 && i2 >= i1)
            l1 = j1;
        i2++;
          goto _L8
_L5:
        return j1;
    }

    public final int measureHeightOfChildrenP(int i, int j, int k, int l, int i1)
    {
        return measureHeightOfChildren(i, j, k, l, i1);
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        int i = getChildCount();
        if (i > 0)
        {
            for (int j = 0; j < i; j++)
                addHeaderView(getChildAt(j));

            removeAllViews();
        }
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        super.onFocusChanged(flag, i, rect);
        ListAdapter listadapter = super.mAdapter;
        int j = -1;
        int k = 0;
        if (listadapter != null)
        {
            k = 0;
            if (flag)
            {
                k = 0;
                if (rect != null)
                {
                    rect.offset(super.mScrollX, super.mScrollY);
                    if (listadapter.getCount() < getChildCount() + super.mFirstPosition)
                    {
                        super.mLayoutMode = 0;
                        layoutChildren();
                    }
                    Rect rect1 = mTempRect;
                    int l = 0x7fffffff;
                    int i1 = getChildCount();
                    int j1 = super.mFirstPosition;
                    for (int k1 = 0; k1 < i1; k1++)
                    {
                        if (!listadapter.isEnabled(j1 + k1))
                            continue;
                        View view = getChildAt(k1);
                        view.getDrawingRect(rect1);
                        offsetDescendantRectToMyCoords(view, rect1);
                        int l1 = getDistance(rect, rect1, i);
                        if (l1 < l)
                        {
                            l = l1;
                            j = k1;
                            k = view.getTop();
                        }
                    }

                }
            }
        }
        if (j >= 0)
        {
            setSelectionFromTop(j + super.mFirstPosition, k);
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
        accessibilityevent.setClassName(android/widget/ListView.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/ListView.getName());
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
        int i2;
        int j2;
        int k2;
label0:
        {
            super.onMeasure(i, j);
            k = android.view.View.MeasureSpec.getMode(i);
            l = android.view.View.MeasureSpec.getMode(j);
            i1 = android.view.View.MeasureSpec.getSize(i);
            j1 = android.view.View.MeasureSpec.getSize(j);
            int k1;
            if (super.mAdapter == null)
                k1 = 0;
            else
                k1 = super.mAdapter.getCount();
            super.mItemCount = k1;
            int l1 = super.mItemCount;
            i2 = 0;
            j2 = 0;
            k2 = 0;
            if (l1 <= 0)
                break label0;
            if (k != 0)
            {
                i2 = 0;
                j2 = 0;
                k2 = 0;
                if (l != 0)
                    break label0;
            }
            View view = obtainView(0, super.mIsScrap);
            measureScrapChild(view, 0, i);
            k2 = view.getMeasuredWidth();
            i2 = view.getMeasuredHeight();
            j2 = combineMeasuredStates(0, view.getMeasuredState());
            if (recycleOnMeasure() && super.mRecycler.shouldRecycleViewType(((AbsListView.LayoutParams)view.getLayoutParams()).viewType))
                super.mRecycler.addScrapView(view, -1);
        }
        int l2;
        if (k == 0)
            l2 = k2 + (super.mListPadding.left + super.mListPadding.right) + getVerticalScrollbarWidth();
        else
            l2 = i1 | 0xff000000 & j2;
        if (l == 0)
            j1 = i2 + (super.mListPadding.top + super.mListPadding.bottom) + 2 * getVerticalFadingEdgeLength();
        if (l == 0x80000000)
            j1 = measureHeightOfChildren(i, 0, -1, j1, -1);
        setMeasuredDimension(l2, j1);
        super.mWidthMeasureSpec = i;
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        if (getChildCount() > 0)
        {
            View view = getFocusedChild();
            if (view != null)
            {
                int i1 = super.mFirstPosition + indexOfChild(view);
                int j1 = Math.max(0, view.getBottom() - (j - super.mPaddingTop));
                int k1 = view.getTop() - j1;
                if (mFocusSelector == null)
                    mFocusSelector = new FocusSelector();
                post(mFocusSelector.setup(i1, k1));
            }
        }
        super.onSizeChanged(i, j, k, l);
    }

    boolean pageScroll(int i)
    {
        int j = -1;
        boolean flag = false;
        if (i == 33)
        {
            j = Math.max(0, -1 + (super.mSelectedPosition - getChildCount()));
        } else
        {
            flag = false;
            if (i == 130)
            {
                j = Math.min(-1 + super.mItemCount, -1 + (super.mSelectedPosition + getChildCount()));
                flag = true;
            }
        }
        if (j >= 0)
        {
            int k = lookForSelectablePosition(j, flag);
            if (k >= 0)
            {
                super.mLayoutMode = 4;
                super.mSpecificTop = super.mPaddingTop + getVerticalFadingEdgeLength();
                if (flag && k > super.mItemCount - getChildCount())
                    super.mLayoutMode = 3;
                if (!flag && k < getChildCount())
                    super.mLayoutMode = 1;
                setSelectionInt(k);
                invokeOnItemScrollListener();
                if (!awakenScrollBars())
                    invalidate();
                return true;
            }
        }
        return false;
    }

    protected boolean recycleOnMeasure()
    {
        return true;
    }

    public boolean removeFooterView(View view)
    {
        if (mFooterViewInfos.size() > 0)
        {
            ListAdapter listadapter = super.mAdapter;
            boolean flag = false;
            if (listadapter != null)
            {
                boolean flag1 = ((HeaderViewListAdapter)super.mAdapter).removeFooter(view);
                flag = false;
                if (flag1)
                {
                    if (super.mDataSetObserver != null)
                        super.mDataSetObserver.onChanged();
                    flag = true;
                }
            }
            removeFixedViewInfo(view, mFooterViewInfos);
            return flag;
        } else
        {
            return false;
        }
    }

    public boolean removeHeaderView(View view)
    {
        if (mHeaderViewInfos.size() > 0)
        {
            ListAdapter listadapter = super.mAdapter;
            boolean flag = false;
            if (listadapter != null)
            {
                boolean flag1 = ((HeaderViewListAdapter)super.mAdapter).removeHeader(view);
                flag = false;
                if (flag1)
                {
                    if (super.mDataSetObserver != null)
                        super.mDataSetObserver.onChanged();
                    flag = true;
                }
            }
            removeFixedViewInfo(view, mHeaderViewInfos);
            return flag;
        } else
        {
            return false;
        }
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean flag)
    {
        int i = rect.top;
        rect.offset(view.getLeft(), view.getTop());
        rect.offset(-view.getScrollX(), -view.getScrollY());
        int j = getHeight();
        int k = getScrollY();
        int l = k + j;
        int i1 = getVerticalFadingEdgeLength();
        if (showingTopFadingEdge() && (super.mSelectedPosition > 0 || i > i1))
            k += i1;
        int j1 = getChildAt(-1 + getChildCount()).getBottom();
        if (showingBottomFadingEdge() && (super.mSelectedPosition < -1 + super.mItemCount || rect.bottom < j1 - i1))
            l -= i1;
        int l1;
        if (rect.bottom > l && rect.top > k)
        {
            int k2;
            if (rect.height() > j)
                k2 = 0 + (rect.top - k);
            else
                k2 = 0 + (rect.bottom - l);
            l1 = Math.min(k2, j1 - l);
        } else
        {
            int k1 = rect.top;
            l1 = 0;
            if (k1 < k)
            {
                int i2 = rect.bottom;
                l1 = 0;
                if (i2 < l)
                {
                    int j2;
                    if (rect.height() > j)
                        j2 = 0 - (l - rect.bottom);
                    else
                        j2 = 0 - (k - rect.top);
                    l1 = Math.max(j2, getChildAt(0).getTop() - k);
                }
            }
        }
        boolean flag1;
        if (l1 != 0)
            flag1 = true;
        else
            flag1 = false;
        if (flag1)
        {
            scrollListItemsBy(-l1);
            positionSelector(-1, view);
            super.mSelectedTop = view.getTop();
            invalidate();
        }
        return flag1;
    }

    void resetList()
    {
        clearRecycledState(mHeaderViewInfos);
        clearRecycledState(mFooterViewInfos);
        super.resetList();
        super.mLayoutMode = 0;
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
        if (mHeaderViewInfos.size() <= 0 && mFooterViewInfos.size() <= 0)
            super.mAdapter = listadapter;
        else
            super.mAdapter = new HeaderViewListAdapter(mHeaderViewInfos, mFooterViewInfos, listadapter);
        super.mOldSelectedPosition = -1;
        super.mOldSelectedRowId = 0x8000000000000000L;
        super.setAdapter(listadapter);
        if (super.mAdapter != null)
        {
            mAreAllItemsSelectable = super.mAdapter.areAllItemsEnabled();
            super.mOldItemCount = super.mItemCount;
            super.mItemCount = super.mAdapter.getCount();
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
            if (super.mItemCount == 0)
                checkSelectionChanged();
        } else
        {
            mAreAllItemsSelectable = true;
            checkFocus();
            checkSelectionChanged();
        }
        requestLayout();
    }

    public void setCacheColorHint(int i)
    {
        boolean flag;
        if (i >>> 24 == 255)
            flag = true;
        else
            flag = false;
        mIsCacheColorOpaque = flag;
        if (flag)
        {
            if (mDividerPaint == null)
                mDividerPaint = new Paint();
            mDividerPaint.setColor(i);
        }
        super.setCacheColorHint(i);
    }

    public void setDivider(Drawable drawable)
    {
        boolean flag;
label0:
        {
            if (drawable != null)
                mDividerHeight = drawable.getIntrinsicHeight();
            else
                mDividerHeight = 0;
            mDivider = drawable;
            if (drawable != null)
            {
                int i = drawable.getOpacity();
                flag = false;
                if (i != -1)
                    break label0;
            }
            flag = true;
        }
        mDividerIsOpaque = flag;
        requestLayout();
        invalidate();
    }

    public void setDividerHeight(int i)
    {
        mDividerHeight = i;
        requestLayout();
        invalidate();
    }

    public void setFooterDividersEnabled(boolean flag)
    {
        mFooterDividersEnabled = flag;
        invalidate();
    }

    public void setHeaderDividersEnabled(boolean flag)
    {
        mHeaderDividersEnabled = flag;
        invalidate();
    }

    public void setItemsCanFocus(boolean flag)
    {
        mItemsCanFocus = flag;
        if (!flag)
            setDescendantFocusability(0x60000);
    }

    public void setOverscrollFooter(Drawable drawable)
    {
        mOverScrollFooter = drawable;
        invalidate();
    }

    public void setOverscrollHeader(Drawable drawable)
    {
        mOverScrollHeader = drawable;
        if (super.mScrollY < 0)
            invalidate();
    }

    public void setRemoteViewsAdapter(Intent intent)
    {
        super.setRemoteViewsAdapter(intent);
    }

    public void setSelection(int i)
    {
        setSelectionFromTop(i, 0);
    }

    public void setSelectionAfterHeaderView()
    {
        int i = mHeaderViewInfos.size();
        if (i > 0)
        {
            super.mNextSelectedPosition = 0;
            return;
        }
        if (super.mAdapter != null)
        {
            setSelection(i);
            return;
        } else
        {
            super.mNextSelectedPosition = i;
            super.mLayoutMode = 2;
            return;
        }
    }

    public void setSelectionFromTop(int i, int j)
    {
        if (super.mAdapter != null)
        {
            if (!isInTouchMode())
            {
                i = lookForSelectablePosition(i, true);
                if (i >= 0)
                    setNextSelectedPositionInt(i);
            } else
            {
                super.mResurrectToPosition = i;
            }
            if (i >= 0)
            {
                super.mLayoutMode = 4;
                super.mSpecificTop = j + super.mListPadding.top;
                if (super.mNeedSync)
                {
                    super.mSyncPosition = i;
                    super.mSyncRowId = super.mAdapter.getItemId(i);
                }
                if (super.mPositionScroller != null)
                    super.mPositionScroller.stop();
                requestLayout();
                return;
            }
        }
    }

    void setSelectionInt(int i)
    {
        setNextSelectedPositionInt(i);
        int j = super.mSelectedPosition;
        boolean flag = false;
        if (j >= 0)
            if (i == j - 1)
            {
                flag = true;
            } else
            {
                int k = j + 1;
                flag = false;
                if (i == k)
                    flag = true;
            }
        if (super.mPositionScroller != null)
            super.mPositionScroller.stop();
        layoutChildren();
        if (flag)
            awakenScrollBars();
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
