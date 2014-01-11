// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.StrictMode;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AnimationUtils;
import java.util.List;

// Referenced classes of package android.widget:
//            FrameLayout, EdgeEffect, OverScroller

public class ScrollView extends FrameLayout
{

    static final int ANIMATED_SCROLL_GAP = 250;
    private static final int INVALID_POINTER = -1;
    static final float MAX_SCROLL_FACTOR = 0.5F;
    private static final String TAG = "ScrollView";
    private int mActivePointerId;
    private View mChildToScrollTo;
    private EdgeEffect mEdgeGlowBottom;
    private EdgeEffect mEdgeGlowTop;
    private boolean mFillViewport;
    private android.os.StrictMode.Span mFlingStrictSpan;
    private boolean mIsBeingDragged;
    private boolean mIsLayoutDirty;
    private int mLastMotionY;
    private long mLastScroll;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private int mOverflingDistance;
    private int mOverscrollDistance;
    private android.os.StrictMode.Span mScrollStrictSpan;
    private OverScroller mScroller;
    private boolean mSmoothScrollingEnabled;
    private final Rect mTempRect;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;

    public ScrollView(Context context)
    {
        this(context, null);
    }

    public ScrollView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010080);
    }

    public ScrollView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTempRect = new Rect();
        mIsLayoutDirty = true;
        mChildToScrollTo = null;
        mIsBeingDragged = false;
        mSmoothScrollingEnabled = true;
        mActivePointerId = -1;
        mScrollStrictSpan = null;
        mFlingStrictSpan = null;
        initScrollView();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.ScrollView, i, 0);
        setFillViewport(typedarray.getBoolean(0, false));
        typedarray.recycle();
    }

    private boolean canScroll()
    {
        View view = getChildAt(0);
        boolean flag = false;
        if (view != null)
        {
            int i = view.getHeight();
            int j = getHeight();
            int k = i + super.mPaddingTop + super.mPaddingBottom;
            flag = false;
            if (j < k)
                flag = true;
        }
        return flag;
    }

    private static int clamp(int i, int j, int k)
    {
        if (j < k && i >= 0)
        {
            if (j + i > k)
                return k - j;
        } else
        {
            i = 0;
        }
        return i;
    }

    private void doScrollY(int i)
    {
label0:
        {
            if (i != 0)
            {
                if (!mSmoothScrollingEnabled)
                    break label0;
                smoothScrollBy(0, i);
            }
            return;
        }
        scrollBy(0, i);
    }

    private void endDrag()
    {
        mIsBeingDragged = false;
        recycleVelocityTracker();
        if (mEdgeGlowTop != null)
        {
            mEdgeGlowTop.onRelease();
            mEdgeGlowBottom.onRelease();
        }
        if (mScrollStrictSpan != null)
        {
            mScrollStrictSpan.finish();
            mScrollStrictSpan = null;
        }
    }

    private View findFocusableViewInBounds(boolean flag, int i, int j)
    {
        java.util.ArrayList arraylist = getFocusables(2);
        View view = null;
        boolean flag1 = false;
        int k = arraylist.size();
        for (int l = 0; l < k; l++)
        {
            View view1 = (View)arraylist.get(l);
            int i1 = view1.getTop();
            int j1 = view1.getBottom();
            if (i >= j1 || i1 >= j)
                continue;
            boolean flag2;
            if (i < i1 && j1 < j)
                flag2 = true;
            else
                flag2 = false;
            if (view == null)
            {
                view = view1;
                flag1 = flag2;
                continue;
            }
            boolean flag3;
            if ((!flag || i1 >= view.getTop()) && (flag || j1 <= view.getBottom()))
                flag3 = false;
            else
                flag3 = true;
            if (flag1)
            {
                if (flag2 && flag3)
                    view = view1;
                continue;
            }
            if (flag2)
            {
                view = view1;
                flag1 = true;
                continue;
            }
            if (flag3)
                view = view1;
        }

        return view;
    }

    private int getScrollRange()
    {
        int i = getChildCount();
        int j = 0;
        if (i > 0)
        {
            View view = getChildAt(0);
            android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
            j = Math.max(0, view.getHeight() - (getHeight() - super.mPaddingBottom - super.mPaddingTop - marginlayoutparams.topMargin - marginlayoutparams.bottomMargin));
        }
        return j;
    }

    private boolean inChild(int i, int j)
    {
        int k = getChildCount();
        boolean flag = false;
        if (k > 0)
        {
            int l = super.mScrollY;
            View view = getChildAt(0);
            int i1 = view.getTop() - l;
            flag = false;
            if (j >= i1)
            {
                int j1 = view.getBottom() - l;
                flag = false;
                if (j < j1)
                {
                    int k1 = view.getLeft();
                    flag = false;
                    if (i >= k1)
                    {
                        int l1 = view.getRight();
                        flag = false;
                        if (i < l1)
                            flag = true;
                    }
                }
            }
        }
        return flag;
    }

    private void initOrResetVelocityTracker()
    {
        if (mVelocityTracker == null)
        {
            mVelocityTracker = VelocityTracker.obtain();
            return;
        } else
        {
            mVelocityTracker.clear();
            return;
        }
    }

    private void initScrollView()
    {
        mScroller = new OverScroller(getContext());
        setFocusable(true);
        setDescendantFocusability(0x40000);
        setWillNotDraw(false);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(super.mContext);
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMinimumVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mOverscrollDistance = viewconfiguration.getScaledOverscrollDistance();
        mOverflingDistance = viewconfiguration.getScaledOverflingDistance();
    }

    private void initVelocityTrackerIfNotExists()
    {
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
    }

    private boolean isOffScreen(View view)
    {
        boolean flag = isWithinDeltaOfScreen(view, 0, getHeight());
        boolean flag1 = false;
        if (!flag)
            flag1 = true;
        return flag1;
    }

    private static boolean isViewDescendantOf(View view, View view1)
    {
        if (view != view1)
        {
            ViewParent viewparent = view.getParent();
            if (!(viewparent instanceof ViewGroup) || !isViewDescendantOf((View)viewparent, view1))
                return false;
        }
        return true;
    }

    private boolean isWithinDeltaOfScreen(View view, int i, int j)
    {
        view.getDrawingRect(mTempRect);
        offsetDescendantRectToMyCoords(view, mTempRect);
        return i + mTempRect.bottom >= getScrollY() && mTempRect.top - i <= j + getScrollY();
    }

    private void onSecondaryPointerUp(MotionEvent motionevent)
    {
        int i = (0xff00 & motionevent.getAction()) >> 8;
        if (motionevent.getPointerId(i) == mActivePointerId)
        {
            int j;
            if (i == 0)
                j = 1;
            else
                j = 0;
            mLastMotionY = (int)motionevent.getY(j);
            mActivePointerId = motionevent.getPointerId(j);
            if (mVelocityTracker != null)
                mVelocityTracker.clear();
        }
    }

    private void recycleVelocityTracker()
    {
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    private boolean scrollAndFocus(int i, int j, int k)
    {
        boolean flag = true;
        int l = getHeight();
        int i1 = getScrollY();
        int j1 = i1 + l;
        boolean flag1;
        if (i == 33)
            flag1 = true;
        else
            flag1 = false;
        Object obj = findFocusableViewInBounds(flag1, j, k);
        if (obj == null)
            obj = this;
        if (j >= i1 && k <= j1)
        {
            flag = false;
        } else
        {
            int k1;
            if (flag1)
                k1 = j - i1;
            else
                k1 = k - j1;
            doScrollY(k1);
        }
        if (obj != findFocus())
            ((View) (obj)).requestFocus(i);
        return flag;
    }

    private void scrollToChild(View view)
    {
        view.getDrawingRect(mTempRect);
        offsetDescendantRectToMyCoords(view, mTempRect);
        int i = computeScrollDeltaToGetChildRectOnScreen(mTempRect);
        if (i != 0)
            scrollBy(0, i);
    }

    private boolean scrollToChildRect(Rect rect, boolean flag)
    {
        int i;
        boolean flag1;
label0:
        {
            i = computeScrollDeltaToGetChildRectOnScreen(rect);
            if (i != 0)
                flag1 = true;
            else
                flag1 = false;
            if (flag1)
            {
                if (!flag)
                    break label0;
                scrollBy(0, i);
            }
            return flag1;
        }
        smoothScrollBy(0, i);
        return flag1;
    }

    public void addView(View view)
    {
        if (getChildCount() > 0)
        {
            throw new IllegalStateException("ScrollView can host only one direct child");
        } else
        {
            super.addView(view);
            return;
        }
    }

    public void addView(View view, int i)
    {
        if (getChildCount() > 0)
        {
            throw new IllegalStateException("ScrollView can host only one direct child");
        } else
        {
            super.addView(view, i);
            return;
        }
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (getChildCount() > 0)
        {
            throw new IllegalStateException("ScrollView can host only one direct child");
        } else
        {
            super.addView(view, i, layoutparams);
            return;
        }
    }

    public void addView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (getChildCount() > 0)
        {
            throw new IllegalStateException("ScrollView can host only one direct child");
        } else
        {
            super.addView(view, layoutparams);
            return;
        }
    }

    public boolean arrowScroll(int i)
    {
        boolean flag;
label0:
        {
            View view = findFocus();
            if (view == this)
                view = null;
            View view1 = FocusFinder.getInstance().findNextFocus(this, view, i);
            int j = getMaxScrollAmount();
            if (view1 != null && isWithinDeltaOfScreen(view1, j, getHeight()))
            {
                view1.getDrawingRect(mTempRect);
                offsetDescendantRectToMyCoords(view1, mTempRect);
                doScrollY(computeScrollDeltaToGetChildRectOnScreen(mTempRect));
                view1.requestFocus(i);
            } else
            {
                int k = j;
                if (i == 33 && getScrollY() < k)
                    k = getScrollY();
                else
                if (i == 130 && getChildCount() > 0)
                {
                    int j1 = getChildAt(0).getBottom();
                    int k1 = (getScrollY() + getHeight()) - super.mPaddingBottom;
                    if (j1 - k1 < j)
                        k = j1 - k1;
                }
                flag = false;
                if (k == 0)
                    break label0;
                int l;
                if (i == 130)
                    l = k;
                else
                    l = -k;
                doScrollY(l);
            }
            if (view != null && view.isFocused() && isOffScreen(view))
            {
                int i1 = getDescendantFocusability();
                setDescendantFocusability(0x20000);
                requestFocus();
                setDescendantFocusability(i1);
            }
            flag = true;
        }
        return flag;
    }

    public void computeScroll()
    {
        int i = 1;
        if (mScroller.computeScrollOffset())
        {
            int j = super.mScrollX;
            int k = super.mScrollY;
            int l = mScroller.getCurrX();
            int i1 = mScroller.getCurrY();
            if (j != l || k != i1)
            {
                int j1 = getScrollRange();
                int k1 = getOverScrollMode();
                if (k1 != 0 && (k1 != i || j1 <= 0))
                    i = 0;
                overScrollBy(l - j, i1 - k, j, k, 0, j1, 0, mOverflingDistance, false);
                onScrollChanged(super.mScrollX, super.mScrollY, j, k);
                if (i != 0)
                    if (i1 < 0 && k >= 0)
                        mEdgeGlowTop.onAbsorb((int)mScroller.getCurrVelocity());
                    else
                    if (i1 > j1 && k <= j1)
                        mEdgeGlowBottom.onAbsorb((int)mScroller.getCurrVelocity());
            }
            if (!awakenScrollBars())
                postInvalidateOnAnimation();
        } else
        if (mFlingStrictSpan != null)
        {
            mFlingStrictSpan.finish();
            mFlingStrictSpan = null;
            return;
        }
    }

    protected int computeScrollDeltaToGetChildRectOnScreen(Rect rect)
    {
        if (getChildCount() != 0)
        {
            int i = getHeight();
            int j = getScrollY();
            int k = j + i;
            int l = getVerticalFadingEdgeLength();
            if (rect.top > 0)
                j += l;
            if (rect.bottom < getChildAt(0).getHeight())
                k -= l;
            if (rect.bottom > k && rect.top > j)
            {
                int j1;
                if (rect.height() > i)
                    j1 = 0 + (rect.top - j);
                else
                    j1 = 0 + (rect.bottom - k);
                return Math.min(j1, getChildAt(0).getBottom() - k);
            }
            if (rect.top < j && rect.bottom < k)
            {
                int i1;
                if (rect.height() > i)
                    i1 = 0 - (k - rect.bottom);
                else
                    i1 = 0 - (j - rect.top);
                return Math.max(i1, -getScrollY());
            }
        }
        return 0;
    }

    protected int computeVerticalScrollOffset()
    {
        return Math.max(0, super.computeVerticalScrollOffset());
    }

    protected int computeVerticalScrollRange()
    {
        int i = getChildCount();
        int j = getHeight() - super.mPaddingBottom - super.mPaddingTop;
        if (i == 0)
            return j;
        int k = getChildAt(0).getBottom();
        int l = super.mScrollY;
        int i1 = Math.max(0, k - j);
        if (l < 0)
            k -= l;
        else
        if (l > i1)
            k += l - i1;
        return k;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        return super.dispatchKeyEvent(keyevent) || executeKeyEvent(keyevent);
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        if (mEdgeGlowTop != null)
        {
            int i = super.mScrollY;
            if (!mEdgeGlowTop.isFinished())
            {
                int i1 = canvas.save();
                int j1 = getWidth() - super.mPaddingLeft - super.mPaddingRight;
                canvas.translate(super.mPaddingLeft, Math.min(0, i));
                mEdgeGlowTop.setSize(j1, getHeight());
                if (mEdgeGlowTop.draw(canvas))
                    postInvalidateOnAnimation();
                canvas.restoreToCount(i1);
            }
            if (!mEdgeGlowBottom.isFinished())
            {
                int j = canvas.save();
                int k = getWidth() - super.mPaddingLeft - super.mPaddingRight;
                int l = getHeight();
                canvas.translate(-k + super.mPaddingLeft, l + Math.max(getScrollRange(), i));
                canvas.rotate(180F, k, 0.0F);
                mEdgeGlowBottom.setSize(k, l);
                if (mEdgeGlowBottom.draw(canvas))
                    postInvalidateOnAnimation();
                canvas.restoreToCount(j);
            }
        }
    }

    public boolean executeKeyEvent(KeyEvent keyevent)
    {
        mTempRect.setEmpty();
        if (!canScroll())
        {
            boolean flag1 = isFocused();
            boolean flag2 = false;
            if (flag1)
            {
                int k = keyevent.getKeyCode();
                flag2 = false;
                if (k != 4)
                {
                    View view = findFocus();
                    if (view == this)
                        view = null;
                    View view1 = FocusFinder.getInstance().findNextFocus(this, view, 130);
                    flag2 = false;
                    if (view1 != null)
                    {
                        flag2 = false;
                        if (view1 != this)
                        {
                            boolean flag3 = view1.requestFocus(130);
                            flag2 = false;
                            if (flag3)
                                flag2 = true;
                        }
                    }
                }
            }
            return flag2;
        }
        int i = keyevent.getAction();
        boolean flag = false;
        if (i == 0)
        {
            int j = keyevent.getKeyCode();
            flag = false;
            switch (j)
            {
            default:
                break;

            case 62: // '>'
                char c;
                if (keyevent.isShiftPressed())
                    c = '!';
                else
                    c = '\202';
                pageScroll(c);
                flag = false;
                break;

            case 20: // '\024'
                if (!keyevent.isAltPressed())
                    flag = arrowScroll(130);
                else
                    flag = fullScroll(130);
                break;

            case 19: // '\023'
                if (!keyevent.isAltPressed())
                    flag = arrowScroll(33);
                else
                    flag = fullScroll(33);
                break;
            }
        }
        return flag;
    }

    public void fling(int i)
    {
        if (getChildCount() > 0)
        {
            int j = getHeight() - super.mPaddingBottom - super.mPaddingTop;
            int k = getChildAt(0).getHeight();
            mScroller.fling(super.mScrollX, super.mScrollY, 0, i, 0, 0, 0, Math.max(0, k - j), 0, j / 2);
            if (mFlingStrictSpan == null)
                mFlingStrictSpan = StrictMode.enterCriticalSpan("ScrollView-fling");
            postInvalidateOnAnimation();
        }
    }

    public boolean fullScroll(int i)
    {
        boolean flag;
        if (i == 130)
            flag = true;
        else
            flag = false;
        int j = getHeight();
        mTempRect.top = 0;
        mTempRect.bottom = j;
        if (flag)
        {
            int k = getChildCount();
            if (k > 0)
            {
                View view = getChildAt(k - 1);
                mTempRect.bottom = view.getBottom() + super.mPaddingBottom;
                mTempRect.top = mTempRect.bottom - j;
            }
        }
        return scrollAndFocus(i, mTempRect.top, mTempRect.bottom);
    }

    protected float getBottomFadingEdgeStrength()
    {
        if (getChildCount() == 0)
            return 0.0F;
        int i = getVerticalFadingEdgeLength();
        int j = getHeight() - super.mPaddingBottom;
        int k = getChildAt(0).getBottom() - super.mScrollY - j;
        if (k < i)
            return (float)k / (float)i;
        else
            return 1.0F;
    }

    public int getMaxScrollAmount()
    {
        return (int)(0.5F * (float)(super.mBottom - super.mTop));
    }

    protected float getTopFadingEdgeStrength()
    {
        if (getChildCount() == 0)
            return 0.0F;
        int i = getVerticalFadingEdgeLength();
        if (super.mScrollY < i)
            return (float)super.mScrollY / (float)i;
        else
            return 1.0F;
    }

    public boolean isFillViewport()
    {
        return mFillViewport;
    }

    public boolean isSmoothScrollingEnabled()
    {
        return mSmoothScrollingEnabled;
    }

    protected void measureChild(View view, int i, int j)
    {
        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, super.mPaddingLeft + super.mPaddingRight, layoutparams.width), android.view.View.MeasureSpec.makeMeasureSpec(0, 0));
    }

    protected void measureChildWithMargins(View view, int i, int j, int k, int l)
    {
        android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
        view.measure(getChildMeasureSpec(i, j + (super.mPaddingLeft + super.mPaddingRight + marginlayoutparams.leftMargin + marginlayoutparams.rightMargin), ((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).width), android.view.View.MeasureSpec.makeMeasureSpec(marginlayoutparams.topMargin + marginlayoutparams.bottomMargin, 0));
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        if (mScrollStrictSpan != null)
        {
            mScrollStrictSpan.finish();
            mScrollStrictSpan = null;
        }
        if (mFlingStrictSpan != null)
        {
            mFlingStrictSpan.finish();
            mFlingStrictSpan = null;
        }
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        if ((2 & motionevent.getSource()) != 0)
            switch (motionevent.getAction())
            {
            default:
                break;

            case 8: // '\b'
                if (!mIsBeingDragged)
                {
                    float f = motionevent.getAxisValue(9);
                    if (f != 0.0F)
                    {
                        int i = (int)(f * getVerticalScrollFactor());
                        int j = getScrollRange();
                        int k = super.mScrollY;
                        int l = k - i;
                        if (l < 0)
                            l = 0;
                        else
                        if (l > j)
                            l = j;
                        if (l != k)
                        {
                            super.scrollTo(super.mScrollX, l);
                            return true;
                        }
                    }
                }
                break;
            }
        return super.onGenericMotionEvent(motionevent);
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/ScrollView.getName());
        boolean flag;
        if (getScrollRange() > 0)
            flag = true;
        else
            flag = false;
        accessibilityevent.setScrollable(flag);
        accessibilityevent.setScrollX(super.mScrollX);
        accessibilityevent.setScrollY(super.mScrollY);
        accessibilityevent.setMaxScrollX(super.mScrollX);
        accessibilityevent.setMaxScrollY(getScrollRange());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/ScrollView.getName());
        if (isEnabled())
        {
            int i = getScrollRange();
            if (i > 0)
            {
                accessibilitynodeinfo.setScrollable(true);
                if (super.mScrollY > 0)
                    accessibilitynodeinfo.addAction(8192);
                if (super.mScrollY < i)
                    accessibilitynodeinfo.addAction(4096);
            }
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (i == 2 && mIsBeingDragged)
            return true;
        if (getScrollY() == 0 && !canScrollVertically(1))
            return false;
        switch (i & 0xff)
        {
        case 4: // '\004'
        case 5: // '\005'
        default:
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            break;

        case 1: // '\001'
        case 3: // '\003'
            mIsBeingDragged = false;
            mActivePointerId = -1;
            recycleVelocityTracker();
            if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, 0, 0, getScrollRange()))
                postInvalidateOnAnimation();
            break;

        case 0: // '\0'
            int i1 = (int)motionevent.getY();
            if (!inChild((int)motionevent.getX(), i1))
            {
                mIsBeingDragged = false;
                recycleVelocityTracker();
                break;
            }
            mLastMotionY = i1;
            mActivePointerId = motionevent.getPointerId(0);
            initOrResetVelocityTracker();
            mVelocityTracker.addMovement(motionevent);
            boolean flag = mScroller.isFinished();
            boolean flag1 = false;
            if (!flag)
                flag1 = true;
            mIsBeingDragged = flag1;
            if (mIsBeingDragged && mScrollStrictSpan == null)
                mScrollStrictSpan = StrictMode.enterCriticalSpan("ScrollView-scroll");
            break;

        case 2: // '\002'
            int j = mActivePointerId;
            if (j == -1)
                break;
            int k = motionevent.findPointerIndex(j);
            if (k == -1)
            {
                Log.e("ScrollView", (new StringBuilder()).append("Invalid pointerId=").append(j).append(" in onInterceptTouchEvent").toString());
                break;
            }
            int l = (int)motionevent.getY(k);
            if (Math.abs(l - mLastMotionY) <= mTouchSlop)
                break;
            mIsBeingDragged = true;
            mLastMotionY = l;
            initVelocityTrackerIfNotExists();
            mVelocityTracker.addMovement(motionevent);
            if (mScrollStrictSpan == null)
                mScrollStrictSpan = StrictMode.enterCriticalSpan("ScrollView-scroll");
            ViewParent viewparent = getParent();
            if (viewparent != null)
                viewparent.requestDisallowInterceptTouchEvent(true);
            break;
        }
        return mIsBeingDragged;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        mIsLayoutDirty = false;
        if (mChildToScrollTo != null && isViewDescendantOf(mChildToScrollTo, this))
            scrollToChild(mChildToScrollTo);
        mChildToScrollTo = null;
        scrollTo(super.mScrollX, super.mScrollY);
    }

    protected void onMeasure(int i, int j)
    {
        super.onMeasure(i, j);
        if (mFillViewport && android.view.View.MeasureSpec.getMode(j) != 0 && getChildCount() > 0)
        {
            View view = getChildAt(0);
            int k = getMeasuredHeight();
            if (view.getMeasuredHeight() < k)
            {
                FrameLayout.LayoutParams layoutparams = (FrameLayout.LayoutParams)view.getLayoutParams();
                view.measure(getChildMeasureSpec(i, super.mPaddingLeft + super.mPaddingRight, ((android.view.ViewGroup.LayoutParams) (layoutparams)).width), android.view.View.MeasureSpec.makeMeasureSpec(k - super.mPaddingTop - super.mPaddingBottom, 0x40000000));
                return;
            }
        }
    }

    protected void onOverScrolled(int i, int j, boolean flag, boolean flag1)
    {
        if (!mScroller.isFinished())
        {
            super.mScrollX = i;
            super.mScrollY = j;
            invalidateParentIfNeeded();
            if (flag1)
                mScroller.springBack(super.mScrollX, super.mScrollY, 0, 0, 0, getScrollRange());
        } else
        {
            super.scrollTo(i, j);
        }
        awakenScrollBars();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        if (i == 2)
            i = 130;
        else
        if (i == 1)
            i = 33;
        View view;
        if (rect == null)
            view = FocusFinder.getInstance().findNextFocus(this, null, i);
        else
            view = FocusFinder.getInstance().findNextFocusFromRect(this, rect, i);
        if (view != null && !isOffScreen(view))
            return view.requestFocus(i, rect);
        else
            return false;
    }

    protected void onSizeChanged(int i, int j, int k, int l)
    {
        super.onSizeChanged(i, j, k, l);
        View view = findFocus();
        if (view != null && this != view && isWithinDeltaOfScreen(view, 0, l))
        {
            view.getDrawingRect(mTempRect);
            offsetDescendantRectToMyCoords(view, mTempRect);
            doScrollY(computeScrollDeltaToGetChildRectOnScreen(mTempRect));
            return;
        } else
        {
            return;
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        initVelocityTrackerIfNotExists();
        mVelocityTracker.addMovement(motionevent);
        switch (0xff & motionevent.getAction())
        {
        case 4: // '\004'
        default:
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            mLastMotionY = (int)motionevent.getY(motionevent.findPointerIndex(mActivePointerId));
            break;

        case 5: // '\005'
            int j2 = motionevent.getActionIndex();
            mLastMotionY = (int)motionevent.getY(j2);
            mActivePointerId = motionevent.getPointerId(j2);
            break;

        case 3: // '\003'
            if (!mIsBeingDragged || getChildCount() <= 0)
                break;
            if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, 0, 0, getScrollRange()))
                postInvalidateOnAnimation();
            mActivePointerId = -1;
            endDrag();
            break;

        case 1: // '\001'
            if (!mIsBeingDragged)
                break;
            VelocityTracker velocitytracker = mVelocityTracker;
            velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
            int i2 = (int)velocitytracker.getYVelocity(mActivePointerId);
            if (getChildCount() > 0)
                if (Math.abs(i2) > mMinimumVelocity)
                    fling(-i2);
                else
                if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, 0, 0, getScrollRange()))
                    postInvalidateOnAnimation();
            mActivePointerId = -1;
            endDrag();
            break;

        case 2: // '\002'
            int i = motionevent.findPointerIndex(mActivePointerId);
            if (i == -1)
            {
                Log.e("ScrollView", (new StringBuilder()).append("Invalid pointerId=").append(mActivePointerId).append(" in onTouchEvent").toString());
                break;
            }
            int j = (int)motionevent.getY(i);
            int k = mLastMotionY - j;
            if (!mIsBeingDragged && Math.abs(k) > mTouchSlop)
            {
                ViewParent viewparent1 = getParent();
                if (viewparent1 != null)
                    viewparent1.requestDisallowInterceptTouchEvent(true);
                mIsBeingDragged = true;
                if (k > 0)
                    k -= mTouchSlop;
                else
                    k += mTouchSlop;
            }
            if (!mIsBeingDragged)
                break;
            mLastMotionY = j;
            int l = super.mScrollX;
            int i1 = super.mScrollY;
            int j1 = getScrollRange();
            int k1 = getOverScrollMode();
            boolean flag1;
            if (k1 != 0 && (k1 != 1 || j1 <= 0))
                flag1 = false;
            else
                flag1 = true;
            if (overScrollBy(0, k, 0, super.mScrollY, 0, j1, 0, mOverscrollDistance, true))
                mVelocityTracker.clear();
            onScrollChanged(super.mScrollX, super.mScrollY, l, i1);
            if (!flag1)
                break;
            int l1 = i1 + k;
            if (l1 < 0)
            {
                mEdgeGlowTop.onPull((float)k / (float)getHeight());
                if (!mEdgeGlowBottom.isFinished())
                    mEdgeGlowBottom.onRelease();
            } else
            if (l1 > j1)
            {
                mEdgeGlowBottom.onPull((float)k / (float)getHeight());
                if (!mEdgeGlowTop.isFinished())
                    mEdgeGlowTop.onRelease();
            }
            if (mEdgeGlowTop != null && (!mEdgeGlowTop.isFinished() || !mEdgeGlowBottom.isFinished()))
                postInvalidateOnAnimation();
            break;

        case 0: // '\0'
            if (getChildCount() == 0)
                return false;
            boolean flag;
            if (!mScroller.isFinished())
                flag = true;
            else
                flag = false;
            mIsBeingDragged = flag;
            if (flag)
            {
                ViewParent viewparent = getParent();
                if (viewparent != null)
                    viewparent.requestDisallowInterceptTouchEvent(true);
            }
            if (!mScroller.isFinished())
            {
                mScroller.abortAnimation();
                if (mFlingStrictSpan != null)
                {
                    mFlingStrictSpan.finish();
                    mFlingStrictSpan = null;
                }
            }
            mLastMotionY = (int)motionevent.getY();
            mActivePointerId = motionevent.getPointerId(0);
            break;
        }
        return true;
    }

    public boolean pageScroll(int i)
    {
        boolean flag;
        if (i == 130)
            flag = true;
        else
            flag = false;
        int j = getHeight();
        if (flag)
        {
            mTempRect.top = j + getScrollY();
            int k = getChildCount();
            if (k > 0)
            {
                View view = getChildAt(k - 1);
                if (j + mTempRect.top > view.getBottom())
                    mTempRect.top = view.getBottom() - j;
            }
        } else
        {
            mTempRect.top = getScrollY() - j;
            if (mTempRect.top < 0)
                mTempRect.top = 0;
        }
        mTempRect.bottom = j + mTempRect.top;
        return scrollAndFocus(i, mTempRect.top, mTempRect.bottom);
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (super.performAccessibilityAction(i, bundle))
            return true;
        if (!isEnabled())
            return false;
        switch (i)
        {
        case 8192: 
            int k = getHeight() - super.mPaddingBottom - super.mPaddingTop;
            int l = Math.max(super.mScrollY - k, 0);
            if (l != super.mScrollY)
            {
                smoothScrollTo(0, l);
                return true;
            } else
            {
                return false;
            }

        case 4096: 
            int j = Math.min((getHeight() - super.mPaddingBottom - super.mPaddingTop) + super.mScrollY, getScrollRange());
            if (j != super.mScrollY)
            {
                smoothScrollTo(0, j);
                return true;
            } else
            {
                return false;
            }
        }
        return false;
    }

    public void requestChildFocus(View view, View view1)
    {
        if (!mIsLayoutDirty)
            scrollToChild(view1);
        else
            mChildToScrollTo = view1;
        super.requestChildFocus(view, view1);
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean flag)
    {
        rect.offset(view.getLeft() - view.getScrollX(), view.getTop() - view.getScrollY());
        return scrollToChildRect(rect, flag);
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
        if (flag)
            recycleVelocityTracker();
        super.requestDisallowInterceptTouchEvent(flag);
    }

    public void requestLayout()
    {
        mIsLayoutDirty = true;
        super.requestLayout();
    }

    public void scrollTo(int i, int j)
    {
        if (getChildCount() > 0)
        {
            View view = getChildAt(0);
            int k = clamp(i, getWidth() - super.mPaddingRight - super.mPaddingLeft, view.getWidth());
            int l = clamp(j, getHeight() - super.mPaddingBottom - super.mPaddingTop, view.getHeight());
            if (k != super.mScrollX || l != super.mScrollY)
                super.scrollTo(k, l);
        }
    }

    public void setFillViewport(boolean flag)
    {
        if (flag != mFillViewport)
        {
            mFillViewport = flag;
            requestLayout();
        }
    }

    public void setFriction(float f)
    {
        if (mScroller == null)
            mScroller = new OverScroller(getContext());
        mScroller.setFriction(f);
    }

    public void setOverScrollMode(int i)
    {
        if (i != 2)
        {
            if (mEdgeGlowTop == null)
            {
                Context context = getContext();
                mEdgeGlowTop = new EdgeEffect(context);
                mEdgeGlowBottom = new EdgeEffect(context);
            }
        } else
        {
            mEdgeGlowTop = null;
            mEdgeGlowBottom = null;
        }
        super.setOverScrollMode(i);
    }

    public void setSmoothScrollingEnabled(boolean flag)
    {
        mSmoothScrollingEnabled = flag;
    }

    public boolean shouldDelayChildPressedState()
    {
        return true;
    }

    public final void smoothScrollBy(int i, int j)
    {
        if (getChildCount() == 0)
            return;
        if (AnimationUtils.currentAnimationTimeMillis() - mLastScroll > 250L)
        {
            int k = getHeight() - super.mPaddingBottom - super.mPaddingTop;
            int l = Math.max(0, getChildAt(0).getHeight() - k);
            int i1 = super.mScrollY;
            int j1 = Math.max(0, Math.min(i1 + j, l)) - i1;
            mScroller.startScroll(super.mScrollX, i1, 0, j1);
            postInvalidateOnAnimation();
        } else
        {
            if (!mScroller.isFinished())
            {
                mScroller.abortAnimation();
                if (mFlingStrictSpan != null)
                {
                    mFlingStrictSpan.finish();
                    mFlingStrictSpan = null;
                }
            }
            scrollBy(i, j);
        }
        mLastScroll = AnimationUtils.currentAnimationTimeMillis();
    }

    public final void smoothScrollTo(int i, int j)
    {
        smoothScrollBy(i - super.mScrollX, j - super.mScrollY);
    }
}
