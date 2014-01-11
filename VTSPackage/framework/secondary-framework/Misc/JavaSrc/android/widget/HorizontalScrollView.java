// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AnimationUtils;
import java.util.List;

// Referenced classes of package android.widget:
//            FrameLayout, OverScroller, EdgeEffect

public class HorizontalScrollView extends FrameLayout
{

    private static final int ANIMATED_SCROLL_GAP = 250;
    private static final int INVALID_POINTER = -1;
    private static final float MAX_SCROLL_FACTOR = 0.5F;
    private static final String TAG = "HorizontalScrollView";
    private int mActivePointerId;
    private View mChildToScrollTo;
    private EdgeEffect mEdgeGlowLeft;
    private EdgeEffect mEdgeGlowRight;
    private boolean mFillViewport;
    private boolean mIsBeingDragged;
    private boolean mIsLayoutDirty;
    private int mLastMotionX;
    private long mLastScroll;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private int mOverflingDistance;
    private int mOverscrollDistance;
    private OverScroller mScroller;
    private boolean mSmoothScrollingEnabled;
    private final Rect mTempRect;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;

    public HorizontalScrollView(Context context)
    {
        this(context, null);
    }

    public HorizontalScrollView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010353);
    }

    public HorizontalScrollView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTempRect = new Rect();
        mIsLayoutDirty = true;
        mChildToScrollTo = null;
        mIsBeingDragged = false;
        mSmoothScrollingEnabled = true;
        mActivePointerId = -1;
        initScrollView();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, android.R.styleable.HorizontalScrollView, i, 0);
        setFillViewport(typedarray.getBoolean(0, false));
        typedarray.recycle();
    }

    private boolean canScroll()
    {
        View view = getChildAt(0);
        boolean flag = false;
        if (view != null)
        {
            int i = view.getWidth();
            int j = getWidth();
            int k = i + super.mPaddingLeft + super.mPaddingRight;
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

    private void doScrollX(int i)
    {
label0:
        {
            if (i != 0)
            {
                if (!mSmoothScrollingEnabled)
                    break label0;
                smoothScrollBy(i, 0);
            }
            return;
        }
        scrollBy(i, 0);
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
            int i1 = view1.getLeft();
            int j1 = view1.getRight();
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
            if ((!flag || i1 >= view.getLeft()) && (flag || j1 <= view.getRight()))
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

    private View findFocusableViewInMyBounds(boolean flag, int i, View view)
    {
        int j = getHorizontalFadingEdgeLength() / 2;
        int k = i + j;
        int l = (i + getWidth()) - j;
        if (view != null && view.getLeft() < l && view.getRight() > k)
            return view;
        else
            return findFocusableViewInBounds(flag, k, l);
    }

    private int getScrollRange()
    {
        int i = getChildCount();
        int j = 0;
        if (i > 0)
            j = Math.max(0, getChildAt(0).getWidth() - (getWidth() - super.mPaddingLeft - super.mPaddingRight));
        return j;
    }

    private boolean inChild(int i, int j)
    {
        int k = getChildCount();
        boolean flag = false;
        if (k > 0)
        {
            int l = super.mScrollX;
            View view = getChildAt(0);
            int i1 = view.getTop();
            flag = false;
            if (j >= i1)
            {
                int j1 = view.getBottom();
                flag = false;
                if (j < j1)
                {
                    int k1 = view.getLeft() - l;
                    flag = false;
                    if (i >= k1)
                    {
                        int l1 = view.getRight() - l;
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
        boolean flag = isWithinDeltaOfScreen(view, 0);
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

    private boolean isWithinDeltaOfScreen(View view, int i)
    {
        view.getDrawingRect(mTempRect);
        offsetDescendantRectToMyCoords(view, mTempRect);
        return i + mTempRect.right >= getScrollX() && mTempRect.left - i <= getScrollX() + getWidth();
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
            mLastMotionX = (int)motionevent.getX(j);
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
        int l = getWidth();
        int i1 = getScrollX();
        int j1 = i1 + l;
        boolean flag1;
        if (i == 17)
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
            doScrollX(k1);
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
            scrollBy(i, 0);
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
                scrollBy(i, 0);
            }
            return flag1;
        }
        smoothScrollBy(i, 0);
        return flag1;
    }

    public void addView(View view)
    {
        if (getChildCount() > 0)
        {
            throw new IllegalStateException("HorizontalScrollView can host only one direct child");
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
            throw new IllegalStateException("HorizontalScrollView can host only one direct child");
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
            throw new IllegalStateException("HorizontalScrollView can host only one direct child");
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
            throw new IllegalStateException("HorizontalScrollView can host only one direct child");
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
            if (view1 != null && isWithinDeltaOfScreen(view1, j))
            {
                view1.getDrawingRect(mTempRect);
                offsetDescendantRectToMyCoords(view1, mTempRect);
                doScrollX(computeScrollDeltaToGetChildRectOnScreen(mTempRect));
                view1.requestFocus(i);
            } else
            {
                int k = j;
                if (i == 17 && getScrollX() < k)
                    k = getScrollX();
                else
                if (i == 66 && getChildCount() > 0)
                {
                    int j1 = getChildAt(0).getRight();
                    int k1 = getScrollX() + getWidth();
                    if (j1 - k1 < j)
                        k = j1 - k1;
                }
                flag = false;
                if (k == 0)
                    break label0;
                int l;
                if (i == 66)
                    l = k;
                else
                    l = -k;
                doScrollX(l);
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

    protected int computeHorizontalScrollOffset()
    {
        return Math.max(0, super.computeHorizontalScrollOffset());
    }

    protected int computeHorizontalScrollRange()
    {
        int i = getChildCount();
        int j = getWidth() - super.mPaddingLeft - super.mPaddingRight;
        if (i == 0)
            return j;
        int k = getChildAt(0).getRight();
        int l = super.mScrollX;
        int i1 = Math.max(0, k - j);
        if (l < 0)
            k -= l;
        else
        if (l > i1)
            k += l - i1;
        return k;
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
                overScrollBy(l - j, i1 - k, j, k, j1, 0, mOverflingDistance, 0, false);
                onScrollChanged(super.mScrollX, super.mScrollY, j, k);
                if (i != 0)
                    if (l < 0 && j >= 0)
                        mEdgeGlowLeft.onAbsorb((int)mScroller.getCurrVelocity());
                    else
                    if (l > j1 && j <= j1)
                        mEdgeGlowRight.onAbsorb((int)mScroller.getCurrVelocity());
            }
            if (!awakenScrollBars())
                postInvalidateOnAnimation();
        }
    }

    protected int computeScrollDeltaToGetChildRectOnScreen(Rect rect)
    {
        if (getChildCount() != 0)
        {
            int i = getWidth();
            int j = getScrollX();
            int k = j + i;
            int l = getHorizontalFadingEdgeLength();
            if (rect.left > 0)
                j += l;
            if (rect.right < getChildAt(0).getWidth())
                k -= l;
            if (rect.right > k && rect.left > j)
            {
                int j1;
                if (rect.width() > i)
                    j1 = 0 + (rect.left - j);
                else
                    j1 = 0 + (rect.right - k);
                return Math.min(j1, getChildAt(0).getRight() - k);
            }
            if (rect.left < j && rect.right < k)
            {
                int i1;
                if (rect.width() > i)
                    i1 = 0 - (k - rect.right);
                else
                    i1 = 0 - (j - rect.left);
                return Math.max(i1, -getScrollX());
            }
        }
        return 0;
    }

    public boolean dispatchKeyEvent(KeyEvent keyevent)
    {
        return super.dispatchKeyEvent(keyevent) || executeKeyEvent(keyevent);
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
        if (mEdgeGlowLeft != null)
        {
            int i = super.mScrollX;
            if (!mEdgeGlowLeft.isFinished())
            {
                int i1 = canvas.save();
                int j1 = getHeight() - super.mPaddingTop - super.mPaddingBottom;
                canvas.rotate(270F);
                canvas.translate(-j1 + super.mPaddingTop, Math.min(0, i));
                mEdgeGlowLeft.setSize(j1, getWidth());
                if (mEdgeGlowLeft.draw(canvas))
                    postInvalidateOnAnimation();
                canvas.restoreToCount(i1);
            }
            if (!mEdgeGlowRight.isFinished())
            {
                int j = canvas.save();
                int k = getWidth();
                int l = getHeight() - super.mPaddingTop - super.mPaddingBottom;
                canvas.rotate(90F);
                canvas.translate(-super.mPaddingTop, -(k + Math.max(getScrollRange(), i)));
                mEdgeGlowRight.setSize(l, k);
                if (mEdgeGlowRight.draw(canvas))
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
                View view = findFocus();
                if (view == this)
                    view = null;
                View view1 = FocusFinder.getInstance().findNextFocus(this, view, 66);
                flag2 = false;
                if (view1 != null)
                {
                    flag2 = false;
                    if (view1 != this)
                    {
                        boolean flag3 = view1.requestFocus(66);
                        flag2 = false;
                        if (flag3)
                            flag2 = true;
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
                byte byte0;
                if (keyevent.isShiftPressed())
                    byte0 = 17;
                else
                    byte0 = 66;
                pageScroll(byte0);
                flag = false;
                break;

            case 22: // '\026'
                if (!keyevent.isAltPressed())
                    flag = arrowScroll(66);
                else
                    flag = fullScroll(66);
                break;

            case 21: // '\025'
                if (!keyevent.isAltPressed())
                    flag = arrowScroll(17);
                else
                    flag = fullScroll(17);
                break;
            }
        }
        return flag;
    }

    public void fling(int i)
    {
        if (getChildCount() > 0)
        {
            int j = getWidth() - super.mPaddingRight - super.mPaddingLeft;
            int k = getChildAt(0).getWidth();
            mScroller.fling(super.mScrollX, super.mScrollY, i, 0, 0, Math.max(0, k - j), 0, 0, j / 2, 0);
            boolean flag;
            if (i > 0)
                flag = true;
            else
                flag = false;
            View view = findFocus();
            Object obj = findFocusableViewInMyBounds(flag, mScroller.getFinalX(), view);
            if (obj == null)
                obj = this;
            if (obj != view)
            {
                byte byte0;
                if (flag)
                    byte0 = 66;
                else
                    byte0 = 17;
                ((View) (obj)).requestFocus(byte0);
            }
            postInvalidateOnAnimation();
        }
    }

    public boolean fullScroll(int i)
    {
        boolean flag;
        if (i == 66)
            flag = true;
        else
            flag = false;
        int j = getWidth();
        mTempRect.left = 0;
        mTempRect.right = j;
        if (flag && getChildCount() > 0)
        {
            View view = getChildAt(0);
            mTempRect.right = view.getRight();
            mTempRect.left = mTempRect.right - j;
        }
        return scrollAndFocus(i, mTempRect.left, mTempRect.right);
    }

    protected float getLeftFadingEdgeStrength()
    {
        if (getChildCount() == 0)
            return 0.0F;
        int i = getHorizontalFadingEdgeLength();
        if (super.mScrollX < i)
            return (float)super.mScrollX / (float)i;
        else
            return 1.0F;
    }

    public int getMaxScrollAmount()
    {
        return (int)(0.5F * (float)(super.mRight - super.mLeft));
    }

    protected float getRightFadingEdgeStrength()
    {
        if (getChildCount() == 0)
            return 0.0F;
        int i = getHorizontalFadingEdgeLength();
        int j = getWidth() - super.mPaddingRight;
        int k = getChildAt(0).getRight() - super.mScrollX - j;
        if (k < i)
            return (float)k / (float)i;
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
        int k = getChildMeasureSpec(j, super.mPaddingTop + super.mPaddingBottom, layoutparams.height);
        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(0, 0), k);
    }

    protected void measureChildWithMargins(View view, int i, int j, int k, int l)
    {
        android.view.ViewGroup.MarginLayoutParams marginlayoutparams = (android.view.ViewGroup.MarginLayoutParams)view.getLayoutParams();
        int i1 = getChildMeasureSpec(k, l + (super.mPaddingTop + super.mPaddingBottom + marginlayoutparams.topMargin + marginlayoutparams.bottomMargin), ((android.view.ViewGroup.LayoutParams) (marginlayoutparams)).height);
        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(marginlayoutparams.leftMargin + marginlayoutparams.rightMargin, 0), i1);
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
                    float f;
                    if ((1 & motionevent.getMetaState()) != 0)
                        f = -motionevent.getAxisValue(9);
                    else
                        f = motionevent.getAxisValue(10);
                    if (f != 0.0F)
                    {
                        int i = (int)(f * getHorizontalScrollFactor());
                        int j = getScrollRange();
                        int k = super.mScrollX;
                        int l = k + i;
                        if (l < 0)
                            l = 0;
                        else
                        if (l > j)
                            l = j;
                        if (l != k)
                        {
                            super.scrollTo(l, super.mScrollY);
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
        accessibilityevent.setClassName(android/widget/HorizontalScrollView.getName());
        boolean flag;
        if (getScrollRange() > 0)
            flag = true;
        else
            flag = false;
        accessibilityevent.setScrollable(flag);
        accessibilityevent.setScrollX(super.mScrollX);
        accessibilityevent.setScrollY(super.mScrollY);
        accessibilityevent.setMaxScrollX(getScrollRange());
        accessibilityevent.setMaxScrollY(super.mScrollY);
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/HorizontalScrollView.getName());
        int i = getScrollRange();
        if (i > 0)
        {
            accessibilitynodeinfo.setScrollable(true);
            if (isEnabled() && super.mScrollX > 0)
                accessibilitynodeinfo.addAction(8192);
            if (isEnabled() && super.mScrollX < i)
                accessibilitynodeinfo.addAction(4096);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        if (i == 2 && mIsBeingDragged)
            return true;
        switch (i & 0xff)
        {
        case 4: // '\004'
        default:
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            mLastMotionX = (int)motionevent.getX(motionevent.findPointerIndex(mActivePointerId));
            break;

        case 5: // '\005'
            int j1 = motionevent.getActionIndex();
            mLastMotionX = (int)motionevent.getX(j1);
            mActivePointerId = motionevent.getPointerId(j1);
            break;

        case 1: // '\001'
        case 3: // '\003'
            mIsBeingDragged = false;
            mActivePointerId = -1;
            if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, getScrollRange(), 0, 0))
                postInvalidateOnAnimation();
            break;

        case 0: // '\0'
            int i1 = (int)motionevent.getX();
            if (!inChild(i1, (int)motionevent.getY()))
            {
                mIsBeingDragged = false;
                recycleVelocityTracker();
                break;
            }
            mLastMotionX = i1;
            mActivePointerId = motionevent.getPointerId(0);
            initOrResetVelocityTracker();
            mVelocityTracker.addMovement(motionevent);
            boolean flag = mScroller.isFinished();
            boolean flag1 = false;
            if (!flag)
                flag1 = true;
            mIsBeingDragged = flag1;
            break;

        case 2: // '\002'
            int j = mActivePointerId;
            if (j == -1)
                break;
            int k = motionevent.findPointerIndex(j);
            if (k == -1)
            {
                Log.e("HorizontalScrollView", (new StringBuilder()).append("Invalid pointerId=").append(j).append(" in onInterceptTouchEvent").toString());
                break;
            }
            int l = (int)motionevent.getX(k);
            if (Math.abs(l - mLastMotionX) <= mTouchSlop)
                break;
            mIsBeingDragged = true;
            mLastMotionX = l;
            initVelocityTrackerIfNotExists();
            mVelocityTracker.addMovement(motionevent);
            if (super.mParent != null)
                super.mParent.requestDisallowInterceptTouchEvent(true);
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
        if (mFillViewport && android.view.View.MeasureSpec.getMode(i) != 0 && getChildCount() > 0)
        {
            View view = getChildAt(0);
            int k = getMeasuredWidth();
            if (view.getMeasuredWidth() < k)
            {
                FrameLayout.LayoutParams layoutparams = (FrameLayout.LayoutParams)view.getLayoutParams();
                int l = getChildMeasureSpec(j, super.mPaddingTop + super.mPaddingBottom, ((android.view.ViewGroup.LayoutParams) (layoutparams)).height);
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(k - super.mPaddingLeft - super.mPaddingRight, 0x40000000), l);
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
            if (flag)
                mScroller.springBack(super.mScrollX, super.mScrollY, 0, getScrollRange(), 0, 0);
        } else
        {
            super.scrollTo(i, j);
        }
        awakenScrollBars();
    }

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        if (i == 2)
            i = 66;
        else
        if (i == 1)
            i = 17;
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
        if (view != null && this != view && isWithinDeltaOfScreen(view, super.mRight - super.mLeft))
        {
            view.getDrawingRect(mTempRect);
            offsetDescendantRectToMyCoords(view, mTempRect);
            doScrollX(computeScrollDeltaToGetChildRectOnScreen(mTempRect));
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
        case 5: // '\005'
        default:
            break;

        case 6: // '\006'
            onSecondaryPointerUp(motionevent);
            break;

        case 3: // '\003'
            if (!mIsBeingDragged || getChildCount() <= 0)
                break;
            if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, getScrollRange(), 0, 0))
                postInvalidateOnAnimation();
            mActivePointerId = -1;
            mIsBeingDragged = false;
            recycleVelocityTracker();
            if (mEdgeGlowLeft != null)
            {
                mEdgeGlowLeft.onRelease();
                mEdgeGlowRight.onRelease();
            }
            break;

        case 1: // '\001'
            if (!mIsBeingDragged)
                break;
            VelocityTracker velocitytracker = mVelocityTracker;
            velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
            int i2 = (int)velocitytracker.getXVelocity(mActivePointerId);
            if (getChildCount() > 0)
                if (Math.abs(i2) > mMinimumVelocity)
                    fling(-i2);
                else
                if (mScroller.springBack(super.mScrollX, super.mScrollY, 0, getScrollRange(), 0, 0))
                    postInvalidateOnAnimation();
            mActivePointerId = -1;
            mIsBeingDragged = false;
            recycleVelocityTracker();
            if (mEdgeGlowLeft != null)
            {
                mEdgeGlowLeft.onRelease();
                mEdgeGlowRight.onRelease();
            }
            break;

        case 2: // '\002'
            int i = motionevent.findPointerIndex(mActivePointerId);
            if (i == -1)
            {
                Log.e("HorizontalScrollView", (new StringBuilder()).append("Invalid pointerId=").append(mActivePointerId).append(" in onTouchEvent").toString());
                break;
            }
            int j = (int)motionevent.getX(i);
            int k = mLastMotionX - j;
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
            mLastMotionX = j;
            int l = super.mScrollX;
            int i1 = super.mScrollY;
            int j1 = getScrollRange();
            int k1 = getOverScrollMode();
            boolean flag1;
            if (k1 != 0 && (k1 != 1 || j1 <= 0))
                flag1 = false;
            else
                flag1 = true;
            if (overScrollBy(k, 0, super.mScrollX, 0, j1, 0, mOverscrollDistance, 0, true))
                mVelocityTracker.clear();
            onScrollChanged(super.mScrollX, super.mScrollY, l, i1);
            if (!flag1)
                break;
            int l1 = l + k;
            if (l1 < 0)
            {
                mEdgeGlowLeft.onPull((float)k / (float)getWidth());
                if (!mEdgeGlowRight.isFinished())
                    mEdgeGlowRight.onRelease();
            } else
            if (l1 > j1)
            {
                mEdgeGlowRight.onPull((float)k / (float)getWidth());
                if (!mEdgeGlowLeft.isFinished())
                    mEdgeGlowLeft.onRelease();
            }
            if (mEdgeGlowLeft != null && (!mEdgeGlowLeft.isFinished() || !mEdgeGlowRight.isFinished()))
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
                mScroller.abortAnimation();
            mLastMotionX = (int)motionevent.getX();
            mActivePointerId = motionevent.getPointerId(0);
            break;
        }
        return true;
    }

    public boolean pageScroll(int i)
    {
        boolean flag;
        if (i == 66)
            flag = true;
        else
            flag = false;
        int j = getWidth();
        if (flag)
        {
            mTempRect.left = j + getScrollX();
            if (getChildCount() > 0)
            {
                View view = getChildAt(0);
                if (j + mTempRect.left > view.getRight())
                    mTempRect.left = view.getRight() - j;
            }
        } else
        {
            mTempRect.left = getScrollX() - j;
            if (mTempRect.left < 0)
                mTempRect.left = 0;
        }
        mTempRect.right = j + mTempRect.left;
        return scrollAndFocus(i, mTempRect.left, mTempRect.right);
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (super.performAccessibilityAction(i, bundle))
            return true;
        switch (i)
        {
        case 8192: 
            if (!isEnabled())
                return false;
            int k = getWidth() - super.mPaddingLeft - super.mPaddingRight;
            int l = Math.max(0, super.mScrollX - k);
            if (l != super.mScrollX)
            {
                smoothScrollTo(l, 0);
                return true;
            } else
            {
                return false;
            }

        case 4096: 
            if (!isEnabled())
                return false;
            int j = Math.min((getWidth() - super.mPaddingLeft - super.mPaddingRight) + super.mScrollX, getScrollRange());
            if (j != super.mScrollX)
            {
                smoothScrollTo(j, 0);
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

    public void setOverScrollMode(int i)
    {
        if (i != 2)
        {
            if (mEdgeGlowLeft == null)
            {
                Context context = getContext();
                mEdgeGlowLeft = new EdgeEffect(context);
                mEdgeGlowRight = new EdgeEffect(context);
            }
        } else
        {
            mEdgeGlowLeft = null;
            mEdgeGlowRight = null;
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
            int k = getWidth() - super.mPaddingRight - super.mPaddingLeft;
            int l = Math.max(0, getChildAt(0).getWidth() - k);
            int i1 = super.mScrollX;
            int j1 = Math.max(0, Math.min(i1 + i, l)) - i1;
            mScroller.startScroll(i1, super.mScrollY, j1, 0);
            postInvalidateOnAnimation();
        } else
        {
            if (!mScroller.isFinished())
                mScroller.abortAnimation();
            scrollBy(i, j);
        }
        mLastScroll = AnimationUtils.currentAnimationTimeMillis();
    }

    public final void smoothScrollTo(int i, int j)
    {
        smoothScrollBy(i - super.mScrollX, j - super.mScrollY);
    }
}
