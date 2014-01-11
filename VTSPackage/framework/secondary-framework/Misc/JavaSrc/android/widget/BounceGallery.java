// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package android.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.*;
import android.view.animation.Transformation;
import com.mediatek.xlog.Xlog;

// Referenced classes of package android.widget:
//            AbsSpinner, AdapterView, SpinnerAdapter, OverScroller

public class BounceGallery extends AbsSpinner
{
    private class CheckForLongPress extends WindowRunnnable
        implements Runnable
    {

        final BounceGallery this$0;

        public void run()
        {
            int i = mDownTouchPosition;
            View view = getChildAt(i - mFirstPosition);
            Xlog.d("BounceGallery", (new StringBuilder()).append("CheckForLongPress mTouchMode = ").append(mTouchMode).append(",mFirstPosition = ").append(mFirstPosition).append(",mDataChanged = ").append(mDataChanged).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",this = ").append(this).toString());
            if (view != null)
            {
                int j = mDownTouchPosition;
                long l = mAdapter.getItemId(mDownTouchPosition);
                boolean flag = sameWindow();
                boolean flag1 = false;
                if (flag)
                {
                    boolean flag2 = mDataChanged;
                    flag1 = false;
                    if (!flag2)
                        flag1 = performLongPress(view, j, l);
                }
                if (flag1)
                {
                    mTouchMode = -1;
                    setPressed(false);
                    view.setPressed(false);
                }
            }
        }

        private CheckForLongPress()
        {
            this$0 = BounceGallery.this;
            super();
        }

    }

    final class CheckForTap
        implements Runnable
    {

        final BounceGallery this$0;

        public void run()
        {
            Xlog.d("BounceGallery", (new StringBuilder()).append("CheckForTap: mTouchMode = ").append(mTouchMode).append(",mFirstPosition = ").append(mFirstPosition).append(",mDataChanged = ").append(mDataChanged).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",this = ").append(this).toString());
            if (mTouchMode == 0)
            {
                View view = getChildAt(mDownTouchPosition - mFirstPosition);
                Xlog.d("BounceGallery", (new StringBuilder()).append("CheckForTap: child = ").append(view).append(",this = ").append(this).toString());
                if (view != null && !mDataChanged)
                {
                    view.setPressed(true);
                    setPressed(true);
                    int i = ViewConfiguration.getLongPressTimeout();
                    boolean flag = isLongClickable();
                    Xlog.d("BounceGallery", (new StringBuilder()).append("CheckForTap longClickable = ").append(flag).append(",mFirstPosition = ").append(mFirstPosition).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",this = ").append(this).toString());
                    if (flag)
                    {
                        if (mPendingCheckForLongPress == null)
                            mPendingCheckForLongPress = new CheckForLongPress();
                        mPendingCheckForLongPress.rememberWindowAttachCount();
                        postDelayed(mPendingCheckForLongPress, i);
                    }
                }
            }
        }

        CheckForTap()
        {
            this$0 = BounceGallery.this;
            super();
        }
    }

    private class FlingRunnable
        implements Runnable
    {

        private int mLastFlingX;
        private OverScroller mScroller;
        private boolean mUsingDistance;
        final BounceGallery this$0;

        private void endFling(boolean flag)
        {
            Xlog.d("BounceGallery", (new StringBuilder()).append("endFling: scrollIntoSlots = ").append(flag).append(",mTouchMode = ").append(mTouchMode).append(",mScrollX = ").append(max).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
            mScroller.forceFinished(true);
            mUsingDistance = false;
            if (flag)
            {
                mTouchMode = -1;
                scrollIntoSlots();
            }
        }

        private void startCommon()
        {
            removeCallbacks(this);
        }

        public void run()
        {
            if (mItemCount != 0 && getChildCount() != 0)
            {
                mShouldStopFling = false;
                switch (mTouchMode)
                {
                case 4: // '\004'
                    OverScroller overscroller1 = mScroller;
                    if (overscroller1.computeScrollOffset())
                    {
                        int i1 = max;
                        int j1 = overscroller1.getCurrX() - i1;
                        Xlog.d("BounceGallery", (new StringBuilder()).append("OverFlinging: mScrollX = ").append(max).append(",mLastFlingX = ").append(mLastFlingX).append(",curx = ").append(overscroller1.getCurrX()).append(",mFirstPosition = ").append(mFirstPosition).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",deltaX = ").append(j1).toString());
                        if (overScrollBy(j1, 0, i1, 0, 0, 0, mOverflingDistance, 0, false))
                        {
                            Xlog.d("BounceGallery", (new StringBuilder()).append("OverFlinging: startSpringback: mScrollX = ").append(max).toString());
                            startSpringback();
                            return;
                        } else
                        {
                            invalidate();
                            post(this);
                            return;
                        }
                    } else
                    {
                        Xlog.d("BounceGallery", (new StringBuilder()).append("Over fling end here, so we finish the movement: mScrollX = ").append(max).toString());
                        endFling(true);
                        return;
                    }

                case 2: // '\002'
                    OverScroller overscroller = mScroller;
                    boolean flag = overscroller.computeScrollOffset();
                    int i = overscroller.getCurrX();
                    int j = mLastFlingX - i;
                    Xlog.d("BounceGallery", (new StringBuilder()).append("Before Fling run: mLastFlingX = ").append(mLastFlingX).append(",x = ").append(i).append(",delta = ").append(j).append(",more = ").append(flag).append(",mFirstPosition = ").append(mFirstPosition).append(",current vel = ").append(mScroller.getCurrVelocity()).toString());
                    int l;
                    if (j > 0)
                    {
                        mDownTouchPosition = mFirstPosition;
                        l = Math.min(-1 + (getWidth() - access$3100 - 
// JavaClassFileOutputException: get_constant: invalid tag

        void startOverfling(int i)
        {
            mUsingDistance = false;
            int j;
            if (max > 0)
                j = 0x80000000;
            else
                j = 0;
            int k;
            if (max > 0)
                k = 0;
            else
                k = 0x7fffffff;
            mScroller.fling(max, 0, i, 0, j, k, 0, 0, getWidth(), 0);
            mTouchMode = 4;
            Xlog.d("BounceGallery", (new StringBuilder()).append("startOverfling: mScrollX = ").append(max).append(",initialVelocity = ").append(i).append(", min = ").append(j).append(",max = ").append(k).append(",mTouchMode = ").append(mTouchMode).toString());
            invalidate();
            post(this);
        }

        void startSpringback()
        {
            mUsingDistance = false;
            if (mScroller.springBack(max, 0, 0, 0, 0, 0))
            {
                mTouchMode = 4;
                invalidate();
                post(this);
                return;
            } else
            {
                mTouchMode = -1;
                return;
            }
        }

        public void startUsingDistance(int i)
        {
            mUsingDistance = true;
            if (i == 0)
            {
                return;
            } else
            {
                startCommon();
                Xlog.d("BounceGallery", (new StringBuilder()).append("startUsingDistance: distance = ").append(i).append(",mScrollX = ").append(max).toString());
                mLastFlingX = 0;
                mScroller.startScroll(0, 0, -i, 0, mAnimationDuration);
                mTouchMode = 2;
                post(this);
                return;
            }
        }

        public void startUsingVelocity(int i)
        {
            mUsingDistance = false;
            if (i == 0)
                return;
            startCommon();
            Xlog.d("BounceGallery", (new StringBuilder()).append("startUsingVelocity: initialVelocity = ").append(i).toString());
            int j;
            if (i < 0)
                j = 0x7fffffff;
            else
                j = 0;
            mLastFlingX = j;
            mTouchMode = 2;
            mScroller.fling(j, 0, i, 0, 0, 0x7fffffff, 0, 0x7fffffff);
            post(this);
        }

        public void stop(boolean flag)
        {
            removeCallbacks(this);
            endFling(flag);
        }


        public FlingRunnable()
        {
            this$0 = BounceGallery.this;
            super();
            mScroller = new OverScroller(getContext());
        }
    }

    public static interface OnSelectionChangeListener
    {

        public abstract void onSelectionChanged();
    }

    private class WindowRunnnable
    {

        private int mOriginalAttachCount;
        final BounceGallery this$0;

        public void rememberWindowAttachCount()
        {
            mOriginalAttachCount = getWindowAttachCount();
        }

        public boolean sameWindow()
        {
            return hasWindowFocus() && getWindowAttachCount() == mOriginalAttachCount;
        }

        private WindowRunnnable()
        {
            this$0 = BounceGallery.this;
            super();
        }

    }


    private static final boolean DBG = true;
    private static final boolean DBG_KEY = true;
    private static final boolean DBG_LAYOUT = true;
    private static final boolean DBG_MOTION = true;
    private static final float DEFAULT_UNSELECTED_ALPHA = 0.5F;
    private static final int OVER_DIST_SCALED_RAT = 3;
    private static final String TAG = "BounceGallery";
    private static final int TOUCH_MODE_DOWN = 0;
    private static final int TOUCH_MODE_FLING = 2;
    private static final int TOUCH_MODE_OVERFLING = 4;
    private static final int TOUCH_MODE_OVERSCROLL = 3;
    private static final int TOUCH_MODE_REST = -1;
    private static final int TOUCH_MODE_SCROLL = 1;
    private int mAnimationDuration;
    private AdapterView.AdapterContextMenuInfo mContextMenuInfo;
    private int mDirection;
    private Runnable mDisableSuppressSelectionChangedRunnable = new Runnable() {

        final BounceGallery this$0;

        public void run()
        {
            mSuppressSelectionChanged = false;
            selectionChanged();
        }

            
            {
                this$0 = BounceGallery.this;
                super();
            }
    }
;
    private int mDistanceLeft;
    private int mDownTouchPosition;
    private View mDownTouchView;
    private FlingRunnable mFlingRunnable;
    private int mGravity;
    private int mLastMotionX;
    private int mLeftMost;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private boolean mNeedOverscroll;
    private int mOverflingDistance;
    private int mOverscrollDistance;
    private CheckForLongPress mPendingCheckForLongPress;
    private Runnable mPendingCheckForTap;
    private boolean mReceivedInvokeKeyDown;
    private int mRightMost;
    private View mSelectedChild;
    private OnSelectionChangeListener mSelectionChangeListener;
    private boolean mShouldCallbackDuringFling;
    private boolean mShouldCallbackOnUnselectedItemClick;
    private boolean mShouldStopFling;
    private int mSpacing;
    private boolean mSuppressSelectionChanged;
    private int mTouchMode;
    private int mTouchSlop;
    private float mUnselectedAlpha;
    private VelocityTracker mVelocityTracker;

    public BounceGallery(Context context)
    {
        this(context, null);
    }

    public BounceGallery(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0x1010070);
    }

    public BounceGallery(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mTouchMode = -1;
        mAnimationDuration = 400;
        mShouldCallbackDuringFling = true;
        mShouldCallbackOnUnselectedItemClick = true;
        mFlingRunnable = new FlingRunnable();
        WindowManager _tmp = (WindowManager)super.mContext.getSystemService("window");
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        mOverscrollDistance = viewconfiguration.getScaledOverscrollDistance() / 3;
        mOverflingDistance = viewconfiguration.getScaledOverflingDistance() / 3;
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mMinimumVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        setHorizontalScrollBarEnabled(false);
        TypedArray typedarray = context.obtainStyledAttributes(com.android.internal.R.styleable.View);
        initializeScrollbars(typedarray);
        typedarray.recycle();
        TypedArray typedarray1 = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.Gallery, i, 0);
        int j = typedarray1.getInt(0, -1);
        if (j >= 0)
            setGravity(j);
        int k = typedarray1.getInt(1, -1);
        if (k > 0)
            setAnimationDuration(k);
        setSpacing(typedarray1.getDimensionPixelOffset(2, 0));
        setUnselectedAlpha(typedarray1.getFloat(3, 0.5F));
        typedarray1.recycle();
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
            int k1 = super.mPaddingLeft;
            int l1 = 0;
            do
            {
                k = 0;
                if (l1 >= i)
                    break;
                View view1 = getChildAt(l1);
                int i2 = view1.getRight();
                k = 0;
                if (i2 >= k1)
                    break;
                l++;
                super.mRecycler.put(j + l1, view1);
                l1++;
            } while (true);
        } else
        {
            int i1 = getWidth() - super.mPaddingRight;
            int j1 = i - 1;
            do
            {
                if (j1 < 0)
                    break;
                View view = getChildAt(j1);
                if (view.getLeft() <= i1)
                    break;
                k = j1;
                l++;
                super.mRecycler.put(j + j1, view);
                j1--;
            } while (true);
        }
        detachViewsFromParent(k, l);
        if (flag)
            super.mFirstPosition = l + super.mFirstPosition;
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
        Xlog.d("BounceGallery", (new StringBuilder()).append("fillToGalleryLeft:curRightEdge = ").append(k).append(",galleryLeft = ").append(j).append(",curPosition = ").append(l).append(",mSelectedPosition = ").append(super.mSelectedPosition).append(",mFirstPosition = ").append(super.mFirstPosition).toString());
        for (; k > j && l >= 0; l--)
        {
            View view1 = makeAndAddView(l, l - super.mSelectedPosition, k, false);
            super.mFirstPosition = l;
            k = view1.getLeft() - i;
        }

    }

    private void fillToGalleryRight()
    {
        int i = mSpacing;
        int j = super.mRight - super.mLeft - super.mPaddingRight;
        int k = getChildCount();
        int l = super.mItemCount;
        if (k == 0)
        {
            Xlog.d("BounceGallery", "No child when fill gallery right!");
        } else
        {
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
            Xlog.d("BounceGallery", (new StringBuilder()).append("fillToGalleryRight: curLeftEdge = ").append(j1).append(",galleryRight = ").append(j).append(",curPosition = ").append(i1).append(",mSelectedPosition = ").append(super.mSelectedPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",numItems = ").append(l).toString());
            for (; j1 < j && i1 < l; i1++)
                j1 = i + makeAndAddView(i1, i1 - super.mSelectedPosition, j1, true).getRight();

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

    private int getSemmChildDrawingOrder(int i, int j, int k)
    {
        if (j == k)
            return i - 1;
        if (j >= k)
            return i - 2 * (j - k);
        else
            return i - 1 - 2 * (k - j);
    }

    private void handleTouchDown(int i, int j)
    {
        switch (mTouchMode)
        {
        case 2: // '\002'
            mTouchMode = 1;
            mDownTouchPosition = pointToPosition(i, j);
            if (mDownTouchPosition >= 0)
            {
                mDownTouchView = getChildAt(mDownTouchPosition - super.mFirstPosition);
                mDownTouchView.setPressed(true);
                return;
            }
            break;

        case 4: // '\004'
            mFlingRunnable.stop(false);
            if (super.mScrollX == 0)
            {
                mTouchMode = 1;
                return;
            } else
            {
                mTouchMode = 3;
                return;
            }

        case 3: // '\003'
        default:
            mTouchMode = 0;
            mDownTouchPosition = pointToPosition(i, j);
            if (mDownTouchPosition >= 0)
            {
                mDownTouchView = getChildAt(mDownTouchPosition - super.mFirstPosition);
                mDownTouchView.setPressed(true);
            }
            if (mPendingCheckForTap == null)
                mPendingCheckForTap = new CheckForTap();
            postDelayed(mPendingCheckForTap, ViewConfiguration.getTapTimeout());
            break;
        }
    }

    private void handleTouchMove(int i, int j, int k)
    {
        switch (mTouchMode)
        {
        case 3: // '\003'
            int j1 = super.mScrollX;
            int k1 = j1 - k;
            int l1 = (int)Math.signum(super.mScrollX);
            boolean flag;
            if (j1 * k1 < 0)
                flag = true;
            else
                flag = false;
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch move from over scroll: mScrollX = ").append(super.mScrollX).append(",mLastMotionX = ").append(mLastMotionX).append(",x = ").append(i).append(",deltaX = ").append(k).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",newScroll = ").append(k1).append(",mFirstPosition = ").append(super.mFirstPosition).append(", mDirection = ").append(mDirection).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
            if (mDirection == 0)
                mDirection = l1;
            if (mDirection == l1 && !flag)
            {
                overScrollBy(-k, 0, super.mScrollX, 0, 0, 0, mOverscrollDistance, 0, true);
                invalidate();
            } else
            {
                int i2 = -k1;
                super.mScrollX = 0;
                if (i2 != 0)
                    trackMotionScroll(i2);
                mTouchMode = 1;
            }
            mDirection = l1;
            mLastMotionX = i;
            return;

        case 1: // '\001'
            if (i != mLastMotionX)
            {
                trackMotionScroll(k);
                int l = super.mFirstPosition;
                int i1 = l + getChildCount();
                if (k > 0 && l == 0 && getCenterOfView(getChildAt(0)) >= getCenterOfGallery())
                    mTouchMode = 3;
                else
                if (k < 0 && i1 == super.mItemCount && getCenterOfView(getChildAt(-1 + getChildCount())) <= getCenterOfGallery())
                    mTouchMode = 3;
                Xlog.d("BounceGallery", (new StringBuilder()).append("Touch move from scroll: mTouchMode = ").append(mTouchMode).append(",mLastMotionX = ").append(mLastMotionX).append(",x = ").append(i).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",deltaX = ").append(k).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
                mLastMotionX = i;
                return;
            }
            // fall through

        case 2: // '\002'
        default:
            return;

        case 0: // '\0'
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch move from touch down: mLastMotionX = ").append(mLastMotionX).append(",x = ").append(i).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",deltaX = ").append(k).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
            startScrollIfNeeded(k);
            return;
        }
    }

    private void handleTouchUp()
    {
        switch (mTouchMode)
        {
        case 2: // '\002'
        default:
            break;

        case -1: 
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch up from TOUCH_MODE_REST: mDownTouchView = ").append(mDownTouchView).toString());
            if (mDownTouchView != null && mDownTouchView.isPressed())
            {
                mDownTouchView.setPressed(false);
                return;
            }
            break;

        case 3: // '\003'
            if (mFlingRunnable == null)
                mFlingRunnable = new FlingRunnable();
            VelocityTracker velocitytracker1 = mVelocityTracker;
            velocitytracker1.computeCurrentVelocity(1000, mMaximumVelocity);
            int j = (int)velocitytracker1.getXVelocity();
            if (Math.abs(j) > mMinimumVelocity)
            {
                mFlingRunnable.startOverfling(-j);
                return;
            } else
            {
                mFlingRunnable.startSpringback();
                return;
            }

        case 1: // '\001'
            if (!mShouldCallbackDuringFling)
            {
                removeCallbacks(mDisableSuppressSelectionChangedRunnable);
                if (!mSuppressSelectionChanged)
                    mSuppressSelectionChanged = true;
            }
            VelocityTracker velocitytracker = mVelocityTracker;
            velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
            int i = (int)velocitytracker.getXVelocity(0);
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch up from scroll: velocityX = ").append(i).append(",mMinimumVelocity = ").append(mMinimumVelocity).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
            if (Math.abs(i) > mMinimumVelocity)
            {
                if (mFlingRunnable == null)
                    mFlingRunnable = new FlingRunnable();
                mFlingRunnable.startUsingVelocity(-i);
                return;
            } else
            {
                mTouchMode = -1;
                onUpOrCancel();
                return;
            }

        case 0: // '\0'
            if (mDownTouchPosition < 0)
                break;
            View view = getChildAt(mDownTouchPosition - super.mFirstPosition);
            if (view != null && !view.hasFocusable() && view.isPressed())
                view.setPressed(false);
            scrollToChild(mDownTouchPosition - super.mFirstPosition);
            if (mShouldCallbackOnUnselectedItemClick || mDownTouchPosition == super.mSelectedPosition)
            {
                performItemClick(mDownTouchView, mDownTouchPosition, super.mAdapter.getItemId(mDownTouchPosition));
                return;
            }
            break;
        }
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

    private boolean moveNext()
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

    private boolean movePrevious()
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

    private void offsetChildrenLeftAndRight(int i)
    {
        for (int j = -1 + getChildCount(); j >= 0; j--)
            getChildAt(j).offsetLeftAndRight(i);

    }

    private void onFinishedMovement()
    {
        Xlog.d("BounceGallery", (new StringBuilder()).append("onFinishedMovement: mSelectedPosition = ").append(super.mSelectedPosition).toString());
        if (mSuppressSelectionChanged)
        {
            mSuppressSelectionChanged = false;
            super.selectionChanged();
        }
        invalidate();
    }

    private boolean performLongPress(View view, int i, long l)
    {
        AdapterView.OnItemLongClickListener onitemlongclicklistener = super.mOnItemLongClickListener;
        boolean flag = false;
        if (onitemlongclicklistener != null)
            flag = super.mOnItemLongClickListener.onItemLongClick(this, mDownTouchView, mDownTouchPosition, l);
        if (!flag)
        {
            mContextMenuInfo = new AdapterView.AdapterContextMenuInfo(view, i, l);
            flag = super.showContextMenuForChild(this);
        }
        if (flag)
            performHapticFeedback(0);
        return flag;
    }

    private void removeRunnables(Runnable runnable)
    {
        Handler handler = getHandler();
        Xlog.d("BounceGallery", (new StringBuilder()).append("removeRunnables runnable = ").append(runnable).append(",handler = ").append(handler).toString());
        if (handler != null)
            handler.removeCallbacks(runnable);
    }

    private void scrollIntoSlots()
    {
        if (getChildCount() != 0 && mSelectedChild != null)
        {
            int i = getCenterOfChildWithScroll(mSelectedChild);
            int j = getCenterOfGallery();
            int k = j - i;
            Xlog.d("BounceGallery", (new StringBuilder()).append("scrollIntoSlots:mSelectedChild = ").append(mSelectedChild).append(",selectedCenter = ").append(i).append(",targetCenter = ").append(j).append(",scrollAmount = ").append(k).toString());
            if (k != 0)
            {
                mFlingRunnable.startUsingDistance(k);
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
        Xlog.d("BounceGallery", (new StringBuilder()).append("scrollToChild: childPosition = ").append(i).append(",mSelectedPosition = ").append(super.mSelectedPosition).append(",mFirstPosition = ").append(super.mFirstPosition).append(",mScrollX = ").append(super.mScrollX).append(",child = ").append(view).toString());
        if (view != null)
        {
            int j = getCenterOfGallery() - getCenterOfView(view);
            Xlog.d("BounceGallery", (new StringBuilder()).append("scrollToChild: childPosition = ").append(i).append(",centerGallery = ").append(getCenterOfGallery()).append(",center view = ").append(getCenterOfView(view)).append(",distance = ").append(j).toString());
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
        Xlog.d("BounceGallery", (new StringBuilder()).append("setSelectionToCenterChild: newPos = ").append(i1).append(",newSelectedChildIndex = ").append(k).append(",mSelectedPosition = ").append(super.mSelectedPosition).toString());
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
        Gallery.LayoutParams layoutparams = (Gallery.LayoutParams)view.getLayoutParams();
        if (layoutparams == null)
            layoutparams = (Gallery.LayoutParams)generateDefaultLayoutParams();
        byte byte0;
        if (flag)
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

    private boolean startScrollIfNeeded(int i)
    {
        boolean flag1;
label0:
        {
            int j = Math.abs(i);
            boolean flag;
            if (super.mScrollX != 0)
                flag = true;
            else
                flag = false;
            Xlog.d("BounceGallery", (new StringBuilder()).append("startScrollIfNeeded: distance = ").append(j).append(",mScrollX = ").append(super.mScrollX).append(",mTouchSlop = ").append(mTouchSlop).append(",mPendingCheckForLongPress = ").append(mPendingCheckForLongPress).toString());
            if (!flag)
            {
                int l = mTouchSlop;
                flag1 = false;
                if (j <= l)
                    break label0;
            }
            int k;
            if (flag)
                k = 3;
            else
                k = 1;
            mTouchMode = k;
            removeRunnables(mPendingCheckForLongPress);
            setPressed(false);
            View view = getChildAt(mDownTouchPosition - super.mFirstPosition);
            if (view != null)
                view.setPressed(false);
            requestDisallowInterceptTouchEvent(true);
            flag1 = true;
        }
        return flag1;
    }

    private void updateSelectedItemMetadata()
    {
        View view = mSelectedChild;
        View view1 = getChildAt(super.mSelectedPosition - super.mFirstPosition);
        if (view1 != null)
        {
            mSelectedChild = view1;
            view1.setSelected(true);
            view1.setFocusable(true);
            if (hasFocus())
                view1.requestFocus();
            if (view != null)
            {
                view.setSelected(false);
                view.setFocusable(false);
                return;
            }
        }
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof Gallery.LayoutParams;
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
        return new Gallery.LayoutParams(-2, -2);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new Gallery.LayoutParams(getContext(), attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return new Gallery.LayoutParams(layoutparams);
    }

    protected int getCenterOfChildWithScroll(View view)
    {
        return getCenterOfView(view) - super.mScrollX;
    }

    protected int getChildDrawingOrder(int i, int j)
    {
        int k = super.mSelectedPosition - super.mFirstPosition;
        if (k < 0)
            return j;
        int l = 1 + (k * 2 - i);
        int i1;
        if (l == 0)
            i1 = getSemmChildDrawingOrder(i, j, k);
        else
        if (l < 0)
        {
            if (j > k * 2)
                i1 = i - 1 - j;
            else
                i1 = getSemmChildDrawingOrder(i, j, k);
        } else
        if (j < l)
            i1 = j;
        else
            i1 = getSemmChildDrawingOrder(i, j, k);
        return i1;
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
                if (flag)
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
        view.offsetLeftAndRight((j + k / 2) - view.getWidth() / 2);
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

    protected void onFocusChanged(boolean flag, int i, Rect rect)
    {
        super.onFocusChanged(flag, i, rect);
        if (flag && mSelectedChild != null)
            mSelectedChild.requestFocus(i);
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        boolean flag = true;
        switch (i)
        {
        case 23: // '\027'
        case 66: // 'B'
            mReceivedInvokeKeyDown = flag;
            // fall through

        default:
            flag = super.onKeyDown(i, keyevent);
            break;

        case 22: // '\026'
            if (moveNext())
            {
                playSoundEffect(3);
                return flag;
            }
            break;

        case 21: // '\025'
            if (movePrevious())
            {
                playSoundEffect(flag);
                return flag;
            }
            break;
        }
        return flag;
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

                    final BounceGallery this$0;

                    public void run()
                    {
                        dispatchUnpress();
                    }

            
            {
                this$0 = BounceGallery.this;
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

    protected void onOverScrolled(int i, int j, boolean flag, boolean flag1)
    {
        Xlog.d("BounceGallery", (new StringBuilder()).append("onOverScrolled: scrollX = ").append(i).append(",clampedX = ").append(flag).append(",mScrollX = ").append(super.mScrollX).toString());
        if (super.mScrollX != i)
        {
            super.mScrollX = i;
            invalidateParentIfNeeded();
            awakenScrollBars();
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        int j = (int)motionevent.getY();
        int k = (int)motionevent.getX();
        if (mVelocityTracker == null)
        {
            mVelocityTracker = VelocityTracker.obtain();
            Xlog.d("BounceGallery", (new StringBuilder()).append("onTouchEvent new mVelocityTracker = ").append(mVelocityTracker).toString());
        }
        mVelocityTracker.addMovement(motionevent);
        switch (i & 0xff)
        {
        case 3: // '\003'
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch cancel: mTouchMode = ").append(mTouchMode).append(",mDownTouchView = ").append(mDownTouchView).toString());
            mTouchMode = -1;
            if (mDownTouchView != null && mDownTouchView.isPressed())
                mDownTouchView.setPressed(false);
            onUpOrCancel();
            return true;

        case 1: // '\001'
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch up: mTouchMode = ").append(mTouchMode).append(",mLastMotionX = ").append(mLastMotionX).append(",x = ").append(k).append(",deltaX = ").append(0).append(",mScrollX = ").append(super.mScrollX).append(",mDownTouchPosition = ").append(mDownTouchPosition).toString());
            handleTouchUp();
            if (mVelocityTracker != null)
            {
                mVelocityTracker.recycle();
                mVelocityTracker = null;
            }
            return true;

        case 2: // '\002'
            handleTouchMove(k, j, k - mLastMotionX);
            return true;

        case 0: // '\0'
            Xlog.d("BounceGallery", (new StringBuilder()).append("Touch down: mTouchMode = ").append(mTouchMode).append(",x = ").append(k).append(",mLastMotionX = ").append(mLastMotionX).append(",mDownTouchPosition = ").append(mDownTouchPosition).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
            mLastMotionX = k;
            handleTouchDown(k, j);
            return true;
        }
        return false;
    }

    void onUpOrCancel()
    {
        Xlog.d("BounceGallery", (new StringBuilder()).append("onUpOrCancel: finished = ").append(mFlingRunnable.mScroller.isFinished()).append(",mSelectedPosition = ").append(super.mSelectedPosition).append(",mVelocityTracker = ").append(mVelocityTracker).toString());
        removeRunnables(mPendingCheckForTap);
        removeRunnables(mPendingCheckForLongPress);
        if (mFlingRunnable.mScroller.isFinished())
            scrollIntoSlots();
        dispatchUnpress();
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    void selectionChanged()
    {
        if (!mSuppressSelectionChanged)
            super.selectionChanged();
        if (mSelectionChangeListener != null)
            mSelectionChangeListener.onSelectionChanged();
        Xlog.d("BounceGallery", (new StringBuilder()).append("selectionChanged mSelectedPosition = ").append(super.mSelectedPosition).toString());
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

    public void setOnSelectionChangeListener(OnSelectionChangeListener onselectionchangelistener)
    {
        mSelectionChangeListener = onselectionchangelistener;
    }

    public void setOverScrollDistance(int i)
    {
        mOverscrollDistance = i;
        mOverflingDistance = i;
    }

    public void setOverflingDistance(int i)
    {
        mOverflingDistance = i;
    }

    public void setOverscrollDistance(int i)
    {
        mOverscrollDistance = i;
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
            return performLongPress(getChildAt(super.mSelectedPosition - super.mFirstPosition), super.mSelectedPosition, super.mSelectedRowId);
        else
            return false;
    }

    public boolean showContextMenuForChild(View view)
    {
        int i = getPositionForView(view);
        if (i < 0)
            return false;
        else
            return performLongPress(view, i, super.mAdapter.getItemId(i));
    }

    void trackMotionScroll(int i)
    {
        if (getChildCount() == 0)
        {
            Xlog.d("BounceGallery", "trackMotionScroll with no children.");
            return;
        }
        boolean flag;
        if (i < 0)
            flag = true;
        else
            flag = false;
        int j = getLimitedMotionScrollAmount(flag, i);
        if (j != i)
        {
            if (mTouchMode == 2)
            {
                mNeedOverscroll = true;
                mDistanceLeft = i - j;
            }
            Xlog.d("BounceGallery", (new StringBuilder()).append("trackMotionScroll: may need over scroll, mTouchMode = ").append(mTouchMode).append(",deltaX = ").append(i).append(",limitedDeltaX = ").append(j).append(",mDistanceLeft = ").append(mDistanceLeft).append(",mFirstPosition = ").append(super.mFirstPosition).toString());
        }
        offsetChildrenLeftAndRight(j);
        detachOffScreenChildren(flag);
        if (flag)
            fillToGalleryRight();
        else
            fillToGalleryLeft();
        super.mRecycler.clear();
        setSelectionToCenterChild();
        invalidate();
    }


/*
    static boolean access$002(BounceGallery bouncegallery, boolean flag)
    {
        bouncegallery.mSuppressSelectionChanged = flag;
        return flag;
    }

*/















/*
    static boolean access$2102(BounceGallery bouncegallery, boolean flag)
    {
        bouncegallery.mShouldStopFling = flag;
        return flag;
    }

*/









/*
    static boolean access$2802(BounceGallery bouncegallery, boolean flag)
    {
        bouncegallery.mNeedOverscroll = flag;
        return flag;
    }

*/





/*
    static int access$302(BounceGallery bouncegallery, int i)
    {
        bouncegallery.mTouchMode = i;
        return i;
    }

*/












/*
    static int access$402(BounceGallery bouncegallery, int i)
    {
        bouncegallery.mDownTouchPosition = i;
        return i;
    }

*/



/*
    static CheckForLongPress access$502(BounceGallery bouncegallery, CheckForLongPress checkforlongpress)
    {
        bouncegallery.mPendingCheckForLongPress = checkforlongpress;
        return checkforlongpress;
    }

*/


}
