// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.*;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

public class SlidingDrawer extends ViewGroup
{
    private class DrawerToggler
        implements android.view.View.OnClickListener
    {

        final SlidingDrawer this$0;

        public void onClick(View view)
        {
            if (mLocked)
                return;
            if (mAnimateOnClick)
            {
                animateToggle();
                return;
            } else
            {
                toggle();
                return;
            }
        }

        private DrawerToggler()
        {
            this$0 = SlidingDrawer.this;
            super();
        }

    }

    public static interface OnDrawerCloseListener
    {

        public abstract void onDrawerClosed();
    }

    public static interface OnDrawerOpenListener
    {

        public abstract void onDrawerOpened();
    }

    public static interface OnDrawerScrollListener
    {

        public abstract void onScrollEnded();

        public abstract void onScrollStarted();
    }

    private class SlidingHandler extends Handler
    {

        final SlidingDrawer this$0;

        public void handleMessage(Message message)
        {
            switch (message.what)
            {
            case 1000: 
                doAnimation();
                return;
            }
        }

        private SlidingHandler()
        {
            this$0 = SlidingDrawer.this;
            super();
        }

    }


    private static final int ANIMATION_FRAME_DURATION = 16;
    private static final int COLLAPSED_FULL_CLOSED = -10002;
    private static final int EXPANDED_FULL_OPEN = -10001;
    private static final float MAXIMUM_ACCELERATION = 2000F;
    private static final float MAXIMUM_MAJOR_VELOCITY = 200F;
    private static final float MAXIMUM_MINOR_VELOCITY = 150F;
    private static final float MAXIMUM_TAP_VELOCITY = 100F;
    private static final int MSG_ANIMATE = 1000;
    public static final int ORIENTATION_HORIZONTAL = 0;
    public static final int ORIENTATION_VERTICAL = 1;
    private static final int TAP_THRESHOLD = 6;
    private static final int VELOCITY_UNITS = 1000;
    private boolean mAllowSingleTap;
    private boolean mAnimateOnClick;
    private float mAnimatedAcceleration;
    private float mAnimatedVelocity;
    private boolean mAnimating;
    private long mAnimationLastTime;
    private float mAnimationPosition;
    private int mBottomOffset;
    private View mContent;
    private final int mContentId;
    private long mCurrentAnimationTime;
    private boolean mExpanded;
    private final Rect mFrame;
    private View mHandle;
    private int mHandleHeight;
    private final int mHandleId;
    private int mHandleWidth;
    private final Handler mHandler;
    private final Rect mInvalidate;
    private boolean mLocked;
    private final int mMaximumAcceleration;
    private final int mMaximumMajorVelocity;
    private final int mMaximumMinorVelocity;
    private final int mMaximumTapVelocity;
    private OnDrawerCloseListener mOnDrawerCloseListener;
    private OnDrawerOpenListener mOnDrawerOpenListener;
    private OnDrawerScrollListener mOnDrawerScrollListener;
    private final int mTapThreshold;
    private int mTopOffset;
    private int mTouchDelta;
    private boolean mTracking;
    private VelocityTracker mVelocityTracker;
    private final int mVelocityUnits;
    private boolean mVertical;

    public SlidingDrawer(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SlidingDrawer(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mFrame = new Rect();
        mInvalidate = new Rect();
        mHandler = new SlidingHandler();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, android.R.styleable.SlidingDrawer, i, 0);
        boolean flag;
        if (typedarray.getInt(0, 1) == 1)
            flag = true;
        else
            flag = false;
        mVertical = flag;
        mBottomOffset = (int)typedarray.getDimension(1, 0.0F);
        mTopOffset = (int)typedarray.getDimension(2, 0.0F);
        mAllowSingleTap = typedarray.getBoolean(3, true);
        mAnimateOnClick = typedarray.getBoolean(6, true);
        int j = typedarray.getResourceId(4, 0);
        if (j == 0)
            throw new IllegalArgumentException("The handle attribute is required and must refer to a valid child.");
        int k = typedarray.getResourceId(5, 0);
        if (k == 0)
            throw new IllegalArgumentException("The content attribute is required and must refer to a valid child.");
        if (j == k)
        {
            throw new IllegalArgumentException("The content and handle attributes must refer to different children.");
        } else
        {
            mHandleId = j;
            mContentId = k;
            float f = getResources().getDisplayMetrics().density;
            mTapThreshold = (int)(0.5F + 6F * f);
            mMaximumTapVelocity = (int)(0.5F + 100F * f);
            mMaximumMinorVelocity = (int)(0.5F + 150F * f);
            mMaximumMajorVelocity = (int)(0.5F + 200F * f);
            mMaximumAcceleration = (int)(0.5F + 2000F * f);
            mVelocityUnits = (int)(0.5F + 1000F * f);
            typedarray.recycle();
            setAlwaysDrawnWithCacheEnabled(false);
            return;
        }
    }

    private void animateClose(int i)
    {
        prepareTracking(i);
        performFling(i, mMaximumAcceleration, true);
    }

    private void animateOpen(int i)
    {
        prepareTracking(i);
        performFling(i, -mMaximumAcceleration, true);
    }

    private void closeDrawer()
    {
        moveHandle(-10002);
        mContent.setVisibility(8);
        mContent.destroyDrawingCache();
        if (mExpanded)
        {
            mExpanded = false;
            if (mOnDrawerCloseListener != null)
            {
                mOnDrawerCloseListener.onDrawerClosed();
                return;
            }
        }
    }

    private void doAnimation()
    {
label0:
        {
            if (mAnimating)
            {
                incrementAnimation();
                float f = mAnimationPosition;
                int i = mBottomOffset;
                int j;
                if (mVertical)
                    j = getHeight();
                else
                    j = getWidth();
                if (f < (float)(-1 + (j + i)))
                    break label0;
                mAnimating = false;
                closeDrawer();
            }
            return;
        }
        if (mAnimationPosition < (float)mTopOffset)
        {
            mAnimating = false;
            openDrawer();
            return;
        } else
        {
            moveHandle((int)mAnimationPosition);
            mCurrentAnimationTime = 16L + mCurrentAnimationTime;
            mHandler.sendMessageAtTime(mHandler.obtainMessage(1000), mCurrentAnimationTime);
            return;
        }
    }

    private void incrementAnimation()
    {
        long l = SystemClock.uptimeMillis();
        float f = (float)(l - mAnimationLastTime) / 1000F;
        float f1 = mAnimationPosition;
        float f2 = mAnimatedVelocity;
        float f3 = mAnimatedAcceleration;
        mAnimationPosition = f1 + f2 * f + f * (f * (0.5F * f3));
        mAnimatedVelocity = f2 + f3 * f;
        mAnimationLastTime = l;
    }

    private void moveHandle(int i)
    {
        View view = mHandle;
        if (mVertical)
        {
            if (i == -10001)
            {
                view.offsetTopAndBottom(mTopOffset - view.getTop());
                invalidate();
                return;
            }
            if (i == -10002)
            {
                view.offsetTopAndBottom((mBottomOffset + super.mBottom) - super.mTop - mHandleHeight - view.getTop());
                invalidate();
                return;
            }
            int l = view.getTop();
            int i1 = i - l;
            if (i < mTopOffset)
                i1 = mTopOffset - l;
            else
            if (i1 > (mBottomOffset + super.mBottom) - super.mTop - mHandleHeight - l)
                i1 = (mBottomOffset + super.mBottom) - super.mTop - mHandleHeight - l;
            view.offsetTopAndBottom(i1);
            Rect rect2 = mFrame;
            Rect rect3 = mInvalidate;
            view.getHitRect(rect2);
            rect3.set(rect2);
            rect3.union(rect2.left, rect2.top - i1, rect2.right, rect2.bottom - i1);
            rect3.union(0, rect2.bottom - i1, getWidth(), (rect2.bottom - i1) + mContent.getHeight());
            invalidate(rect3);
            return;
        }
        if (i == -10001)
        {
            view.offsetLeftAndRight(mTopOffset - view.getLeft());
            invalidate();
            return;
        }
        if (i == -10002)
        {
            view.offsetLeftAndRight((mBottomOffset + super.mRight) - super.mLeft - mHandleWidth - view.getLeft());
            invalidate();
            return;
        }
        int j = view.getLeft();
        int k = i - j;
        if (i < mTopOffset)
            k = mTopOffset - j;
        else
        if (k > (mBottomOffset + super.mRight) - super.mLeft - mHandleWidth - j)
            k = (mBottomOffset + super.mRight) - super.mLeft - mHandleWidth - j;
        view.offsetLeftAndRight(k);
        Rect rect = mFrame;
        Rect rect1 = mInvalidate;
        view.getHitRect(rect);
        rect1.set(rect);
        rect1.union(rect.left - k, rect.top, rect.right - k, rect.bottom);
        rect1.union(rect.right - k, 0, (rect.right - k) + mContent.getWidth(), getHeight());
        invalidate(rect1);
    }

    private void openDrawer()
    {
        moveHandle(-10001);
        mContent.setVisibility(0);
        if (!mExpanded)
        {
            mExpanded = true;
            if (mOnDrawerOpenListener != null)
            {
                mOnDrawerOpenListener.onDrawerOpened();
                return;
            }
        }
    }

    private void performFling(int i, float f, boolean flag)
    {
label0:
        {
label1:
            {
                mAnimationPosition = i;
                mAnimatedVelocity = f;
                if (mExpanded)
                {
                    if (!flag && f <= (float)mMaximumMajorVelocity)
                    {
                        int k = mTopOffset;
                        int i1;
                        if (mVertical)
                            i1 = mHandleHeight;
                        else
                            i1 = mHandleWidth;
                        if (i <= i1 + k || f <= (float)(-mMaximumMajorVelocity))
                        {
                            mAnimatedAcceleration = -mMaximumAcceleration;
                            if (f > 0.0F)
                                mAnimatedVelocity = 0.0F;
                            break label0;
                        }
                    }
                    mAnimatedAcceleration = mMaximumAcceleration;
                    if (f < 0.0F)
                        mAnimatedVelocity = 0.0F;
                    break label0;
                }
                if (!flag)
                {
                    if (f > (float)mMaximumMajorVelocity)
                        break label1;
                    int j;
                    if (mVertical)
                        j = getHeight();
                    else
                        j = getWidth();
                    if (i > j / 2 && f > (float)(-mMaximumMajorVelocity))
                        break label1;
                }
                mAnimatedAcceleration = -mMaximumAcceleration;
                if (f > 0.0F)
                    mAnimatedVelocity = 0.0F;
                break label0;
            }
            mAnimatedAcceleration = mMaximumAcceleration;
            if (f < 0.0F)
                mAnimatedVelocity = 0.0F;
        }
        long l = SystemClock.uptimeMillis();
        mAnimationLastTime = l;
        mCurrentAnimationTime = 16L + l;
        mAnimating = true;
        mHandler.removeMessages(1000);
        mHandler.sendMessageAtTime(mHandler.obtainMessage(1000), mCurrentAnimationTime);
        stopTracking();
    }

    private void prepareContent()
    {
        if (mAnimating)
            return;
        View view = mContent;
        if (view.isLayoutRequested())
            if (mVertical)
            {
                int j = mHandleHeight;
                int k = super.mBottom - super.mTop - j - mTopOffset;
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(super.mRight - super.mLeft, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(k, 0x40000000));
                view.layout(0, j + mTopOffset, view.getMeasuredWidth(), j + mTopOffset + view.getMeasuredHeight());
            } else
            {
                int i = mHandle.getWidth();
                view.measure(android.view.View.MeasureSpec.makeMeasureSpec(super.mRight - super.mLeft - i - mTopOffset, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(super.mBottom - super.mTop, 0x40000000));
                view.layout(i + mTopOffset, 0, i + mTopOffset + view.getMeasuredWidth(), view.getMeasuredHeight());
            }
        view.getViewTreeObserver().dispatchOnPreDraw();
        if (!view.isHardwareAccelerated())
            view.buildDrawingCache();
        view.setVisibility(8);
    }

    private void prepareTracking(int i)
    {
        mTracking = true;
        mVelocityTracker = VelocityTracker.obtain();
        boolean flag;
        if (!mExpanded)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            mAnimatedAcceleration = mMaximumAcceleration;
            mAnimatedVelocity = mMaximumMajorVelocity;
            int j = mBottomOffset;
            int k;
            if (mVertical)
                k = getHeight() - mHandleHeight;
            else
                k = getWidth() - mHandleWidth;
            mAnimationPosition = k + j;
            moveHandle((int)mAnimationPosition);
            mAnimating = true;
            mHandler.removeMessages(1000);
            long l = SystemClock.uptimeMillis();
            mAnimationLastTime = l;
            mCurrentAnimationTime = 16L + l;
            mAnimating = true;
            return;
        }
        if (mAnimating)
        {
            mAnimating = false;
            mHandler.removeMessages(1000);
        }
        moveHandle(i);
    }

    private void stopTracking()
    {
        mHandle.setPressed(false);
        mTracking = false;
        if (mOnDrawerScrollListener != null)
            mOnDrawerScrollListener.onScrollEnded();
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    public void animateClose()
    {
        prepareContent();
        OnDrawerScrollListener ondrawerscrolllistener = mOnDrawerScrollListener;
        if (ondrawerscrolllistener != null)
            ondrawerscrolllistener.onScrollStarted();
        int i;
        if (mVertical)
            i = mHandle.getTop();
        else
            i = mHandle.getLeft();
        animateClose(i);
        if (ondrawerscrolllistener != null)
            ondrawerscrolllistener.onScrollEnded();
    }

    public void animateOpen()
    {
        prepareContent();
        OnDrawerScrollListener ondrawerscrolllistener = mOnDrawerScrollListener;
        if (ondrawerscrolllistener != null)
            ondrawerscrolllistener.onScrollStarted();
        int i;
        if (mVertical)
            i = mHandle.getTop();
        else
            i = mHandle.getLeft();
        animateOpen(i);
        sendAccessibilityEvent(32);
        if (ondrawerscrolllistener != null)
            ondrawerscrolllistener.onScrollEnded();
    }

    public void animateToggle()
    {
        if (!mExpanded)
        {
            animateOpen();
            return;
        } else
        {
            animateClose();
            return;
        }
    }

    public void close()
    {
        closeDrawer();
        invalidate();
        requestLayout();
    }

    protected void dispatchDraw(Canvas canvas)
    {
        long l;
        View view;
        boolean flag;
label0:
        {
            android.graphics.Bitmap bitmap;
label1:
            {
                l = getDrawingTime();
                view = mHandle;
                flag = mVertical;
                drawChild(canvas, view, l);
                if (!mTracking && !mAnimating)
                {
                    if (mExpanded)
                    {
                        drawChild(canvas, mContent, l);
                        return;
                    }
                } else
                {
                    bitmap = mContent.getDrawingCache();
                    if (bitmap == null)
                        break label0;
                    if (!flag)
                        break label1;
                    canvas.drawBitmap(bitmap, 0.0F, view.getBottom(), null);
                }
                return;
            }
            canvas.drawBitmap(bitmap, view.getRight(), 0.0F, null);
            return;
        }
        canvas.save();
        float f;
        if (flag)
            f = 0.0F;
        else
            f = view.getLeft() - mTopOffset;
        float f1 = 0.0F;
        if (flag)
            f1 = view.getTop() - mTopOffset;
        canvas.translate(f, f1);
        drawChild(canvas, mContent, l);
        canvas.restore();
    }

    public View getContent()
    {
        return mContent;
    }

    public View getHandle()
    {
        return mHandle;
    }

    public boolean isMoving()
    {
        return mTracking || mAnimating;
    }

    public boolean isOpened()
    {
        return mExpanded;
    }

    public void lock()
    {
        mLocked = true;
    }

    protected void onFinishInflate()
    {
        mHandle = findViewById(mHandleId);
        if (mHandle == null)
            throw new IllegalArgumentException("The handle attribute is must refer to an existing child.");
        mHandle.setOnClickListener(new DrawerToggler());
        mContent = findViewById(mContentId);
        if (mContent == null)
        {
            throw new IllegalArgumentException("The content attribute is must refer to an existing child.");
        } else
        {
            mContent.setVisibility(8);
            return;
        }
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setClassName(android/widget/SlidingDrawer.getName());
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        accessibilitynodeinfo.setClassName(android/widget/SlidingDrawer.getName());
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (!mLocked)
        {
            int i = motionevent.getAction();
            float f = motionevent.getX();
            float f1 = motionevent.getY();
            Rect rect = mFrame;
            View view = mHandle;
            view.getHitRect(rect);
            if (mTracking || rect.contains((int)f, (int)f1))
            {
                if (i == 0)
                {
                    mTracking = true;
                    view.setPressed(true);
                    prepareContent();
                    if (mOnDrawerScrollListener != null)
                        mOnDrawerScrollListener.onScrollStarted();
                    if (mVertical)
                    {
                        int k = mHandle.getTop();
                        mTouchDelta = (int)f1 - k;
                        prepareTracking(k);
                    } else
                    {
                        int j = mHandle.getLeft();
                        mTouchDelta = (int)f - j;
                        prepareTracking(j);
                    }
                    mVelocityTracker.addMovement(motionevent);
                }
                return true;
            }
        }
        return false;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (mTracking)
            return;
        int i1 = k - i;
        int j1 = l - j;
        View view = mHandle;
        int k1 = view.getMeasuredWidth();
        int l1 = view.getMeasuredHeight();
        View view1 = mContent;
        int i2;
        int j2;
        if (mVertical)
        {
            i2 = (i1 - k1) / 2;
            if (mExpanded)
                j2 = mTopOffset;
            else
                j2 = (j1 - l1) + mBottomOffset;
            view1.layout(0, l1 + mTopOffset, view1.getMeasuredWidth(), l1 + mTopOffset + view1.getMeasuredHeight());
        } else
        {
            if (mExpanded)
                i2 = mTopOffset;
            else
                i2 = (i1 - k1) + mBottomOffset;
            j2 = (j1 - l1) / 2;
            view1.layout(k1 + mTopOffset, 0, k1 + mTopOffset + view1.getMeasuredWidth(), view1.getMeasuredHeight());
        }
        view.layout(i2, j2, i2 + k1, j2 + l1);
        mHandleHeight = view.getHeight();
        mHandleWidth = view.getWidth();
    }

    protected void onMeasure(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getMode(i);
        int l = android.view.View.MeasureSpec.getSize(i);
        int i1 = android.view.View.MeasureSpec.getMode(j);
        int j1 = android.view.View.MeasureSpec.getSize(j);
        if (k != 0 && i1 != 0)
        {
            View view = mHandle;
            measureChild(view, i, j);
            if (mVertical)
            {
                int l1 = j1 - view.getMeasuredHeight() - mTopOffset;
                mContent.measure(android.view.View.MeasureSpec.makeMeasureSpec(l, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(l1, 0x40000000));
            } else
            {
                int k1 = l - view.getMeasuredWidth() - mTopOffset;
                mContent.measure(android.view.View.MeasureSpec.makeMeasureSpec(k1, 0x40000000), android.view.View.MeasureSpec.makeMeasureSpec(j1, 0x40000000));
            }
            setMeasuredDimension(l, j1);
            return;
        } else
        {
            throw new RuntimeException("SlidingDrawer cannot have UNSPECIFIED dimensions");
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (mLocked)
            return true;
        if (mTracking)
        {
            mVelocityTracker.addMovement(motionevent);
            switch (motionevent.getAction())
            {
            default:
                break;

            case 1: // '\001'
            case 3: // '\003'
                VelocityTracker velocitytracker = mVelocityTracker;
                velocitytracker.computeCurrentVelocity(mVelocityUnits);
                float f1 = velocitytracker.getYVelocity();
                float f2 = velocitytracker.getXVelocity();
                boolean flag = mVertical;
                boolean flag1;
                if (flag)
                {
                    if (f1 < 0.0F)
                        flag1 = true;
                    else
                        flag1 = false;
                    if (f2 < 0.0F)
                        f2 = -f2;
                    if (f2 > (float)mMaximumMinorVelocity)
                        f2 = mMaximumMinorVelocity;
                } else
                {
                    if (f2 < 0.0F)
                        flag1 = true;
                    else
                        flag1 = false;
                    if (f1 < 0.0F)
                        f1 = -f1;
                    if (f1 > (float)mMaximumMinorVelocity)
                        f1 = mMaximumMinorVelocity;
                }
                float f3 = (float)Math.hypot(f2, f1);
                if (flag1)
                    f3 = -f3;
                int i = mHandle.getTop();
                int j = mHandle.getLeft();
                if (Math.abs(f3) < (float)mMaximumTapVelocity)
                {
                    if (flag ? (!mExpanded || i >= mTapThreshold + mTopOffset) && (mExpanded || i <= (mBottomOffset + super.mBottom) - super.mTop - mHandleHeight - mTapThreshold) : (!mExpanded || j >= mTapThreshold + mTopOffset) && (mExpanded || j <= (mBottomOffset + super.mRight) - super.mLeft - mHandleWidth - mTapThreshold))
                    {
                        if (!flag)
                            i = j;
                        performFling(i, f3, false);
                    } else
                    if (mAllowSingleTap)
                    {
                        playSoundEffect(0);
                        if (mExpanded)
                        {
                            if (!flag)
                                i = j;
                            animateClose(i);
                        } else
                        {
                            if (!flag)
                                i = j;
                            animateOpen(i);
                        }
                    } else
                    {
                        if (!flag)
                            i = j;
                        performFling(i, f3, false);
                    }
                } else
                {
                    if (!flag)
                        i = j;
                    performFling(i, f3, false);
                }
                break;

            case 2: // '\002'
                float f;
                if (mVertical)
                    f = motionevent.getY();
                else
                    f = motionevent.getX();
                moveHandle((int)f - mTouchDelta);
                break;
            }
        }
        return mTracking || mAnimating || super.onTouchEvent(motionevent);
    }

    public void open()
    {
        openDrawer();
        invalidate();
        requestLayout();
        sendAccessibilityEvent(32);
    }

    public void setOnDrawerCloseListener(OnDrawerCloseListener ondrawercloselistener)
    {
        mOnDrawerCloseListener = ondrawercloselistener;
    }

    public void setOnDrawerOpenListener(OnDrawerOpenListener ondraweropenlistener)
    {
        mOnDrawerOpenListener = ondraweropenlistener;
    }

    public void setOnDrawerScrollListener(OnDrawerScrollListener ondrawerscrolllistener)
    {
        mOnDrawerScrollListener = ondrawerscrolllistener;
    }

    public void toggle()
    {
        if (!mExpanded)
            openDrawer();
        else
            closeDrawer();
        invalidate();
        requestLayout();
    }

    public void unlock()
    {
        mLocked = false;
    }



}
