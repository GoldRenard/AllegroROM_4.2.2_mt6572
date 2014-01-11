// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.Transformation;

// Referenced classes of package android.widget:
//            AbsSpinner, AdapterView, SpinnerAdapter, Scroller

public class Gallery extends AbsSpinner
    implements android.view.GestureDetector.OnGestureListener
{
    public static class LayoutParams extends android.view.ViewGroup.LayoutParams
    {

        public LayoutParams(int i, int j)
        {
            super(i, j);
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
        }
    }


    private static final int SCROLL_TO_FLING_UNCERTAINTY_TIMEOUT = 250;
    private static final String TAG = "Gallery";
    private static final boolean localLOGV;
    private int mAnimationDuration;
    private AdapterView.AdapterContextMenuInfo mContextMenuInfo;
    private Runnable mDisableSuppressSelectionChangedRunnable = new Runnable() {

        final Gallery this$0;

        public void run()
        {
            mSuppressSelectionChanged = false;
            selectionChanged();
        }

            
            {
                this$0 = Gallery.this;
                super();
            }
    }
;
    private int mDownTouchPosition;
    private View mDownTouchView;
    private FlingRunnable mFlingRunnable;
    private GestureDetector mGestureDetector;
    private int mGravity;
    private boolean mIsFirstScroll;
    private boolean mIsRtl;
    private int mLeftMost;
    private boolean mReceivedInvokeKeyDown;
    private int mRightMost;
    private int mSelectedCenterOffset;
    private View mSelectedChild;
    private boolean mShouldCallbackDuringFling;
    private boolean mShouldCallbackOnUnselectedItemClick;
    private boolean mShouldStopFling;
    private int mSpacing;
    private boolean mSuppressSelectionChanged;
    private float mUnselectedAlpha;

    public Gallery(Context context)
    {
        Gallery(context, null);
    }

    public Gallery(Context context, AttributeSet attributeset)
    {
        Gallery(context, attributeset, 0x1010070);
    }

    public Gallery(Context context, AttributeSet attributeset, int i)
    {
        AbsSpinner(context, attributeset, i);
        mSpacing = 0;
        mAnimationDuration = 400;
        mFlingRunnable = new FlingRunnable();
        mShouldCallbackDuringFling = true;
        mShouldCallbackOnUnselectedItemClick = true;
        mIsRtl = true;
        mGestureDetector = new GestureDetector(context, this);
        mGestureDetector.setIsLongpressEnabled(true);
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Gallery, i, 0);
        int j = typedarray.getInt(0, -1);
        if (j >= 0)
            setGravity(j);
        int k = typedarray.getInt(1, -1);
        if (k > 0)
            setAnimationDuration(k);
        setSpacing(typedarray.getDimensionPixelOffset(2, 0));
        setUnselectedAlpha(typedarray.getFloat(3, 0.5F));
        typedarray.recycle();
        super.mGroupFlags = 0x400 | super.mGroupFlags;
        super.mGroupFlags = 0x800 | super.mGroupFlags;
    }

    private int calculateTop(View view, boolean flag)
    {
        int i;
        if (flag)
            i = getMeasuredHeight();
        else
            i = getHeight();
        int j;
        if (flag)
            j = view.getMeasuredHeight();
        else
            j = view.getHeight();
        switch (mGravity)
        {
        case 80: // 'P'
            return i - super.mSpinnerPadding.bottom - j;

        case 16: // '\020'
            int k = i - super.mSpinnerPadding.bottom - super.mSpinnerPadding.top - j;
            return super.mSpinnerPadding.top + k / 2;

        case 48: // '0'
            return super.mSpinnerPadding.top;
        }
        return 0;
    }

    private void detachOffScreenChildren(boolean flag)
    {
        int i = getChildCount();
        int j = super.mFirstPosition;
        int k = 0;
        int l = 0;
        if (flag)
        {
            int l1 = super.mPaddingLeft;
            int i2 = 0;
            do
            {
                if (i2 >= i)
                    break;
                int j2;
                if (mIsRtl)
                    j2 = i - 1 - i2;
                else
                    j2 = i2;
                View view1 = getChildAt(j2);
                if (view1.getRight() >= l1)
                    break;
                k = j2;
                l++;
                super.mRecycler.put(j + j2, view1);
                i2++;
            } while (true);
            if (!mIsRtl)
                k = 0;
        } else
        {
            int i1 = getWidth() - super.mPaddingRight;
            int j1 = i - 1;
            do
            {
                if (j1 < 0)
                    break;
                int k1;
                if (mIsRtl)
                    k1 = i - 1 - j1;
                else
                    k1 = j1;
                View view = getChildAt(k1);
                if (view.getLeft() <= i1)
                    break;
                k = k1;
                l++;
                super.mRecycler.put(j + k1, view);
                j1--;
            } while (true);
            if (mIsRtl)
                k = 0;
        }
        detachViewsFromParent(k, l);
        if (flag != mIsRtl)
            super.mFirstPosition = l + super.mFirstPosition;
    }

    private boolean dispatchLongPress(View view, int i, long l)
    {
        AdapterView.OnItemLongClickListener onitemlongclicklistener = super.mOnItemLongClickListener;
        boolean flag = false;
        if (onitemlongclicklistener != null)
            flag = super.mOnItemLongClickListener.onItemLongClick(this, mDownTouchView, mDownTouchPosition, l);
        if (!flag)
        {
            mContextMenuInfo = new AdapterContextMenuInfo(view, i, l);
            flag = showContextMenuForChild(this);
        }
        if (flag)
            performHapticFeedback(0);
        return flag;
    }

    private void dispatchPress(View view)
    {
        if (view != null)
            view.setPressed(true);
        setPressed(true);
    }

    private void dispatchUnpress()
    {
        for (int i = -1 + getChildCount(); i >= 0; i--)
            getChildAt(i).setPressed(false);

        setPressed(false);
    }

    private void fillToGalleryLeft()
    {
        if (mIsRtl)
        {
            fillToGalleryLeftRtl();
            return;
        } else
        {
            fillToGalleryLeftLtr();
            return;
        }
    }

    private void fillToGalleryLeftLtr()
    {
        int i = mSpacing;
        int j = super.mPaddingLeft;
        View view = getChildAt(0);
        int k;
        int l;
        if (view != null)
        {
            l = -1 + super.mFirstPosition;
            k = view.getLeft() - i;
        } else
        {
            k = super.mRight - super.mLeft - super.mPaddingRight;
            mShouldStopFling = true;
            l = 0;
        }
        for (; k > j && l >= 0; l--)
        {
            View view1 = makeAndAddView(l, l - super.mSelectedPosition, k, false);
            super.mFirstPosition = l;
            k = view1.getLeft() - i;
        }

    }

    private void fillToGalleryLeftRtl()
    {
        int i = mSpacing;
        int j = super.mPaddingLeft;
        int k = getChildCount();
        int _tmp = super.mItemCount;
        View view = getChildAt(k - 1);
        int l;
        int i1;
        if (view != null)
        {
            l = k + super.mFirstPosition;
            i1 = view.getLeft() - i;
        } else
        {
            l = -1 + super.mItemCount;
            super.mFirstPosition = l;
            i1 = super.mRight - super.mLeft - super.mPaddingRight;
            mShouldStopFling = true;
        }
        for (; i1 > j && l < super.mItemCount; l++)
            i1 = makeAndAddView(l, l - super.mSelectedPosition, i1, false).getLeft() - i;

    }

    private void fillToGalleryRight()
    {
        if (mIsRtl)
        {
            fillToGalleryRightRtl();
            return;
        } else
        {
            fillToGalleryRightLtr();
            return;
        }
    }

    private void fillToGalleryRightLtr()
    {
        int i = mSpacing;
        int j = super.mRight - super.mLeft - super.mPaddingRight;
        int k = getChildCount();
        int l = super.mItemCount;
        View view = getChildAt(k - 1);
        int i1;
        int j1;
        if (view != null)
        {
            i1 = k + super.mFirstPosition;
            j1 = i + view.getRight();
        } else
        {
            i1 = -1 + super.mItemCount;
            super.mFirstPosition = i1;
            j1 = super.mPaddingLeft;
            mShouldStopFling = true;
        }
        for (; j1 < j && i1 < l; i1++)
            j1 = i + makeAndAddView(i1, i1 - super.mSelectedPosition, j1, true).getRight();

    }

    private void fillToGalleryRightRtl()
    {
        int i = mSpacing;
        int j = super.mRight - super.mLeft - super.mPaddingRight;
        View view = getChildAt(0);
        int k;
        int l;
        if (view != null)
        {
            l = -1 + super.mFirstPosition;
            k = i + view.getRight();
        } else
        {
            k = super.mPaddingLeft;
            mShouldStopFling = true;
            l = 0;
        }
        for (; k < j && l >= 0; l--)
        {
            View view1 = makeAndAddView(l, l - super.mSelectedPosition, k, true);
            super.mFirstPosition = l;
            k = i + view1.getRight();
        }

    }

    private int getCenterOfGallery()
    {
        return (getWidth() - super.mPaddingLeft - super.mPaddingRight) / 2 + super.mPaddingLeft;
    }

    private static int getCenterOfView(View view)
    {
        return view.getLeft() + view.getWidth() / 2;
    }

    private View makeAndAddView(int i, int j, int k, boolean flag)
    {
        if (!super.mDataChanged)
        {
            View view1 = super.mRecycler.get(i);
            if (view1 != null)
            {
                int l = view1.getLeft();
                mRightMost = Math.max(mRightMost, l + view1.getMeasuredWidth());
                mLeftMost = Math.min(mLeftMost, l);
                setUpChild(view1, j, k, flag);
                return view1;
            }
        }
        View view = super.mAdapter.getView(i, null, this);
        setUpChild(view, j, k, flag);
        return view;
    }

    private void offsetChildrenLeftAndRight(int i)
    {
        for (int j = -1 + getChildCount(); j >= 0; j--)
            getChildAt(j).offsetLeftAndRight(i);

    }

    private void onFinishedMovement()
    {
        if (mSuppressSelectionChanged)
        {
            mSuppressSelectionChanged = false;
            selectionChanged();
        }
        mSelectedCenterOffset = 0;
        invalidate();
    }

    private void scrollIntoSlots()
    {
        if (getChildCount() != 0 && mSelectedChild != null)
        {
            int i = getCenterOfView(mSelectedChild);
            int j = getCenterOfGallery() - i;
            if (j != 0)
            {
                mFlingRunnable.startUsingDistance(j);
                return;
            } else
            {
                onFinishedMovement();
                return;
            }
        } else
        {
            return;
        }
    }

    private boolean scrollToChild(int i)
    {
        View view = getChildAt(i);
        if (view != null)
        {
            int j = getCenterOfGallery() - getCenterOfView(view);
            mFlingRunnable.startUsingDistance(j);
            return true;
        } else
        {
            return false;
        }
    }

    private void setSelectionToCenterChild()
    {
        View view = mSelectedChild;
        if (mSelectedChild == null) goto _L2; else goto _L1
_L1:
        int i = getCenterOfGallery();
        if (view.getLeft() <= i && view.getRight() >= i) goto _L2; else goto _L3
_L3:
        int j;
        int k;
        int l;
        j = 0x7fffffff;
        k = 0;
        l = -1 + getChildCount();
_L9:
        if (l < 0) goto _L5; else goto _L4
_L4:
        View view1 = getChildAt(l);
        if (view1.getLeft() > i || view1.getRight() < i) goto _L7; else goto _L6
_L6:
        k = l;
_L5:
        int i1 = k + super.mFirstPosition;
        if (i1 != super.mSelectedPosition)
        {
            setSelectedPositionInt(i1);
            setNextSelectedPositionInt(i1);
            checkSelectionChanged();
            return;
        }
_L2:
        return;
_L7:
        int j1 = Math.min(Math.abs(view1.getLeft() - i), Math.abs(view1.getRight() - i));
        if (j1 < j)
        {
            j = j1;
            k = l;
        }
        l--;
        if (true) goto _L9; else goto _L8
_L8:
    }

    private void setUpChild(View view, int i, int j, boolean flag)
    {
        LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
        if (layoutparams == null)
            layoutparams = (LayoutParams)generateDefaultLayoutParams();
        byte byte0;
        if (flag != mIsRtl)
            byte0 = -1;
        else
            byte0 = 0;
        addViewInLayout(view, byte0, layoutparams);
        boolean flag1;
        if (i == 0)
            flag1 = true;
        else
            flag1 = false;
        view.setSelected(flag1);
        int k = ViewGroup.getChildMeasureSpec(super.mHeightMeasureSpec, super.mSpinnerPadding.top + super.mSpinnerPadding.bottom, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
        view.measure(ViewGroup.getChildMeasureSpec(super.mWidthMeasureSpec, super.mSpinnerPadding.left + super.mSpinnerPadding.right, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width), k);
        int l = calculateTop(view, true);
        int i1 = l + view.getMeasuredHeight();
        int j1 = view.getMeasuredWidth();
        int k1;
        int l1;
        if (flag)
        {
            k1 = j;
            l1 = k1 + j1;
        } else
        {
            k1 = j - j1;
            l1 = j;
        }
        view.layout(k1, l, l1, i1);
    }

    private void updateSelectedItemMetadata()
    {
        View view = mSelectedChild;
        View view1 = getChildAt(super.mSelectedPosition - super.mFirstPosition);
        mSelectedChild = view1;
        if (view1 != null)
        {
            view1.setSelected(true);
            view1.setFocusable(true);
            if (hasFocus())
                view1.requestFocus();
            if (view != null && view != view1)
            {
                view.setSelected(false);
                view.setFocusable(false);
                return;
            }
        }
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    protected int computeHorizontalScrollExtent()
    {
        return 1;
    }

    protected int computeHorizontalScrollOffset()
    {
        return super.mSelectedPosition;
    }

    protected int computeHorizontalScrollRange()
    {
        return super.mItemCount;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        return keyevent.dispatch(this, null, null);
    }

    protected void dispatchSetPressed(boolean flag)
    {
        if (mSelectedChild != null)
            mSelectedChild.setPressed(flag);
    }

    public void dispatchSetSelected(boolean flag)
    {
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams(-2, -2);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new LayoutParams(layoutparams);
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        int k = super.mSelectedPosition - super.mFirstPosition;
        if (k >= 0)
        {
            if (j == i - 1)
                return k;
            if (j >= k)
                return j + 1;
        }
        return j;
    }

    int getChildHeight(View view)
    {
        return view.getMeasuredHeight();
    }

    protected boolean getChildStaticTransformation(View view, Transformation transformation)
    {
        transformation.clear();
        float f;
        if (view == mSelectedChild)
            f = 1.0F;
        else
            f = mUnselectedAlpha;
        transformation.setAlpha(f);
        return true;
    }

    protected android.view.ContextMenu.ContextMenuInfo getContextMenuInfo()
    {
        return mContextMenuInfo;
    }

    int getLimitedMotionScrollAmount(boolean flag, int i)
    {
        int k;
        int l;
label0:
        {
label1:
            {
                int j;
                if (flag != mIsRtl)
                    j = -1 + super.mItemCount;
                else
                    j = 0;
                View view = getChildAt(j - super.mFirstPosition);
                int j1;
                if (view == null)
                {
                    j1 = i;
                } else
                {
                    k = getCenterOfView(view);
                    l = getCenterOfGallery();
                    if (!flag)
                        break label1;
                    j1 = 0;
                    if (k > l)
                        break label0;
                }
                return j1;
            }
            if (k >= l)
                return 0;
        }
        int i1 = l - k;
        if (flag)
            return Math.max(i1, i);
        else
            return Math.min(i1, i);
    }

    void layout(int i, boolean flag)
    {
        mIsRtl = isLayoutRtl();
        int j = super.mSpinnerPadding.left;
        int k = super.mRight - super.mLeft - super.mSpinnerPadding.left - super.mSpinnerPadding.right;
        if (super.mDataChanged)
            handleDataChanged();
        if (super.mItemCount == 0)
        {
            resetList();
            return;
        }
        if (super.mNextSelectedPosition >= 0)
            setSelectedPositionInt(super.mNextSelectedPosition);
        recycleAllViews();
        detachAllViewsFromParent();
        mRightMost = 0;
        mLeftMost = 0;
        super.mFirstPosition = super.mSelectedPosition;
        View view = makeAndAddView(super.mSelectedPosition, 0, 0, true);
        view.offsetLeftAndRight(((j + k / 2) - view.getWidth() / 2) + mSelectedCenterOffset);
        fillToGalleryRight();
        fillToGalleryLeft();
        super.mRecycler.clear();
        invalidate();
        checkSelectionChanged();
        super.mDataChanged = false;
        super.mNeedSync = false;
        setNextSelectedPositionInt(super.mSelectedPosition);
        updateSelectedItemMetadata();
    }

    boolean moveNext()
    {
        if (super.mItemCount > 0 && super.mSelectedPosition < -1 + super.mItemCount)
        {
            scrollToChild(1 + (super.mSelectedPosition - super.mFirstPosition));
            return true;
        } else
        {
            return false;
        }
    }

    boolean movePrevious()
    {
        if (super.mItemCount > 0 && super.mSelectedPosition > 0)
        {
            scrollToChild(-1 + (super.mSelectedPosition - super.mFirstPosition));
            return true;
        } else
        {
            return false;
        }
    }

    void onCancel()
    {
        onUp();
    }

    public boolean onDown(MotionEvent motionevent)
    {
        mFlingRunnable.stop(false);
        mDownTouchPosition = pointToPosition((int)motionevent.getX(), (int)motionevent.getY());
        if (mDownTouchPosition >= 0)
        {
            mDownTouchView = getChildAt(mDownTouchPosition - super.mFirstPosition);
            mDownTouchView.setPressed(true);
        }
        mIsFirstScroll = true;
        return true;
    }

    public boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        if (!mShouldCallbackDuringFling)
        {
            removeCallbacks(mDisableSuppressSelectionChangedRunnable);
            if (!mSuppressSelectionChanged)
                mSuppressSelectionChanged = true;
        }
        mFlingRunnable.startUsingVelocity((int)(-f));
        return true;
    }

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        onFocusChanged(flag, i, rect);
        if (flag && mSelectedChild != null)
        {
            mSelectedChild.requestFocus(i);
            mSelectedChild.setSelected(true);
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/Gallery.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        boolean flag = true;
        onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/Gallery.getName());
        if (super.mItemCount <= flag)
            flag = false;
        accessibilitynodeinfo.setScrollable(flag);
        if (isEnabled())
        {
            if (super.mItemCount > 0 && super.mSelectedPosition < -1 + super.mItemCount)
                accessibilitynodeinfo.addAction(4096);
            if (isEnabled() && super.mItemCount > 0 && super.mSelectedPosition > 0)
                accessibilitynodeinfo.addAction(8192);
        }
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        default:
            break;

        case 23: // '\027'
        case 66: // 'B'
            mReceivedInvokeKeyDown = true;
            break;

        case 22: // '\026'
            if (moveNext())
            {
                playSoundEffect(3);
                return true;
            }
            break;

        case 21: // '\025'
            if (movePrevious())
            {
                playSoundEffect(1);
                return true;
            }
            break;
        }
        return onKeyDown(i, keyevent);
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        switch (i)
        {
        case 23: // '\027'
        case 66: // 'B'
            if (mReceivedInvokeKeyDown && super.mItemCount > 0)
            {
                dispatchPress(mSelectedChild);
                postDelayed(new Runnable() {

                    final Gallery this$0;

                    public void run()
                    {
                        dispatchUnpress();
                    }

            
            {
                this$0 = Gallery.this;
                super();
            }
                }
, ViewConfiguration.getPressedStateDuration());
                performItemClick(getChildAt(super.mSelectedPosition - super.mFirstPosition), super.mSelectedPosition, super.mAdapter.getItemId(super.mSelectedPosition));
            }
            mReceivedInvokeKeyDown = false;
            return true;
        }
        return super.onKeyUp(i, keyevent);
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        super.mInLayout = true;
        layout(0, false);
        super.mInLayout = false;
    }

    public void onLongPress(MotionEvent motionevent)
    {
        if (mDownTouchPosition < 0)
        {
            return;
        } else
        {
            performHapticFeedback(0);
            long l = getItemIdAtPosition(mDownTouchPosition);
            dispatchLongPress(mDownTouchView, mDownTouchPosition, l);
            return;
        }
    }

    public boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
    {
        super.mParent.requestDisallowInterceptTouchEvent(true);
        if (!mShouldCallbackDuringFling)
        {
            if (mIsFirstScroll)
            {
                if (!mSuppressSelectionChanged)
                    mSuppressSelectionChanged = true;
                postDelayed(mDisableSuppressSelectionChangedRunnable, 250L);
            }
        } else
        if (mSuppressSelectionChanged)
            mSuppressSelectionChanged = false;
        trackMotionScroll(-1 * (int)f);
        mIsFirstScroll = false;
        return true;
    }

    public void onShowPress(MotionEvent motionevent)
    {
    }

    public boolean onSingleTapUp(MotionEvent motionevent)
    {
        if (mDownTouchPosition >= 0)
        {
            scrollToChild(mDownTouchPosition - super.mFirstPosition);
            if (mShouldCallbackOnUnselectedItemClick || mDownTouchPosition == super.mSelectedPosition)
                performItemClick(mDownTouchView, mDownTouchPosition, super.mAdapter.getItemId(mDownTouchPosition));
            return true;
        } else
        {
            return false;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        boolean flag = mGestureDetector.onTouchEvent(motionevent);
        int i = motionevent.getAction();
        if (i == 1)
            onUp();
        else
        if (i == 3)
        {
            onCancel();
            return flag;
        }
        return flag;
    }

    void onUp()
    {
        if (mFlingRunnable.mScroller.isFinished())
            scrollIntoSlots();
        dispatchUnpress();
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
label0:
        {
            boolean flag1;
            if (super.performAccessibilityAction(i, bundle))
                flag1 = true;
            else
                switch (i)
                {
                default:
                    break label0;

                case 8192: 
                    boolean flag2 = isEnabled();
                    flag1 = false;
                    if (flag2)
                    {
                        int i1 = super.mItemCount;
                        flag1 = false;
                        if (i1 > 0)
                        {
                            int j1 = super.mSelectedPosition;
                            flag1 = false;
                            if (j1 > 0)
                                return scrollToChild(-1 + (super.mSelectedPosition - super.mFirstPosition));
                        }
                    }
                    break;

                case 4096: 
                    boolean flag = isEnabled();
                    flag1 = false;
                    if (!flag)
                        break;
                    int j = super.mItemCount;
                    flag1 = false;
                    if (j <= 0)
                        break;
                    int k = super.mSelectedPosition;
                    int l = -1 + super.mItemCount;
                    flag1 = false;
                    if (k < l)
                        return scrollToChild(1 + (super.mSelectedPosition - super.mFirstPosition));
                    break;
                }
            return flag1;
        }
        return false;
    }

    void selectionChanged()
    {
        if (!mSuppressSelectionChanged)
            super.selectionChanged();
    }

    public void setAnimationDuration(int i)
    {
        mAnimationDuration = i;
    }

    public void setCallbackDuringFling(boolean flag)
    {
        mShouldCallbackDuringFling = flag;
    }

    public void setCallbackOnUnselectedItemClick(boolean flag)
    {
        mShouldCallbackOnUnselectedItemClick = flag;
    }

    public void setGravity(int i)
    {
        if (mGravity != i)
        {
            mGravity = i;
            requestLayout();
        }
    }

    void setSelectedPositionInt(int i)
    {
        super.setSelectedPositionInt(i);
        updateSelectedItemMetadata();
    }

    public void setSpacing(int i)
    {
        mSpacing = i;
    }

    public void setUnselectedAlpha(float f)
    {
        mUnselectedAlpha = f;
    }

    public boolean showContextMenu()
    {
        if (isPressed() && super.mSelectedPosition >= 0)
            return dispatchLongPress(getChildAt(super.mSelectedPosition - super.mFirstPosition), super.mSelectedPosition, super.mSelectedRowId);
        else
            return false;
    }

    public boolean showContextMenuForChild(View view)
    {
        int i = getPositionForView(view);
        if (i < 0)
            return false;
        else
            return dispatchLongPress(view, i, super.mAdapter.getItemId(i));
    }

    void trackMotionScroll(int i)
    {
        if (getChildCount() == 0)
            return;
        boolean flag;
        if (i < 0)
            flag = true;
        else
            flag = false;
        int j = getLimitedMotionScrollAmount(flag, i);
        if (j != i)
        {
            mFlingRunnable.endFling(false);
            onFinishedMovement();
        }
        offsetChildrenLeftAndRight(j);
        detachOffScreenChildren(flag);
        if (flag)
            fillToGalleryRight();
        else
            fillToGalleryLeft();
        super.mRecycler.clear();
        setSelectionToCenterChild();
        View view = mSelectedChild;
        if (view != null)
        {
            int k = view.getLeft();
            int l = view.getWidth() / 2;
            int i1 = getWidth() / 2;
            mSelectedCenterOffset = (k + l) - i1;
        }
        onScrollChanged(0, 0, 0, 0);
        invalidate();
    }


/*
    static boolean access$002(Gallery gallery, boolean flag)
    {
        gallery.mSuppressSelectionChanged = flag;
        return flag;
    }

*/









/*
    static boolean access$602(Gallery gallery, boolean flag)
    {
        gallery.mShouldStopFling = flag;
        return flag;
    }

*/


/*
    static int access$702(Gallery gallery, int i)
    {
        gallery.mDownTouchPosition = i;
        return i;
    }

*/


}
