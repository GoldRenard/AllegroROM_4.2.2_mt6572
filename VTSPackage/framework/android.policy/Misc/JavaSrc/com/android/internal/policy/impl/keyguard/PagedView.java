// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.os.*;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.*;
import android.view.accessibility.*;
import android.view.animation.*;
import android.widget.Scroller;
import java.util.ArrayList;

public abstract class PagedView extends ViewGroup
    implements android.view.ViewGroup.OnHierarchyChangeListener
{
    private static class FlingAlongVectorAnimatorUpdateListener
        implements android.animation.ValueAnimator.AnimatorUpdateListener
    {

        private final TimeInterpolator mAlphaInterpolator = new DecelerateInterpolator(0.75F);
        private View mDragView;
        private float mFriction;
        private Rect mFrom;
        private long mPrevTime;
        private PointF mVelocity;

        public void onAnimationUpdate(ValueAnimator valueanimator)
        {
            float f = ((Float)valueanimator.getAnimatedValue()).floatValue();
            long l = AnimationUtils.currentAnimationTimeMillis();
            Rect rect = mFrom;
            rect.left = (int)((float)rect.left + (mVelocity.x * (float)(l - mPrevTime)) / 1000F);
            Rect rect1 = mFrom;
            rect1.top = (int)((float)rect1.top + (mVelocity.y * (float)(l - mPrevTime)) / 1000F);
            mDragView.setTranslationX(mFrom.left);
            mDragView.setTranslationY(mFrom.top);
            mDragView.setAlpha(1.0F - mAlphaInterpolator.getInterpolation(f));
            PointF pointf = mVelocity;
            pointf.x = pointf.x * mFriction;
            PointF pointf1 = mVelocity;
            pointf1.y = pointf1.y * mFriction;
            mPrevTime = l;
        }

        public FlingAlongVectorAnimatorUpdateListener(View view, PointF pointf, Rect rect, long l, float f)
        {
            mDragView = view;
            mVelocity = pointf;
            mFrom = rect;
            mPrevTime = l;
            mFriction = 1.0F - f * mDragView.getResources().getDisplayMetrics().density;
        }
    }

    public static interface PageSwitchListener
    {

        public abstract void onPageSwitched(View view, int i);

        public abstract void onPageSwitching(View view, int i);
    }

    public static class SavedState extends android.view.View.BaseSavedState
    {

        public static final android.os.Parcelable.Creator CREATOR = new android.os.Parcelable.Creator() {

            public SavedState createFromParcel(Parcel parcel)
            {
                return new SavedState(parcel);
            }

            public volatile Object createFromParcel(Parcel parcel)
            {
                return createFromParcel(parcel);
            }

            public SavedState[] newArray(int i)
            {
                return new SavedState[i];
            }

            public volatile Object[] newArray(int i)
            {
                return newArray(i);
            }

        }
;
        int currentPage;

        public void writeToParcel(Parcel parcel, int i)
        {
            super.writeToParcel(parcel, i);
            parcel.writeInt(currentPage);
        }


        private SavedState(Parcel parcel)
        {
            super(parcel);
            currentPage = -1;
            currentPage = parcel.readInt();
        }


        SavedState(Parcelable parcelable)
        {
            super(parcelable);
            currentPage = -1;
        }
    }

    private static class ScrollInterpolator
        implements Interpolator
    {

        public float getInterpolation(float f)
        {
            float f1 = f - 1.0F;
            return 1.0F + f1 * (f1 * (f1 * (f1 * f1)));
        }

    }


    protected static final float ALPHA_QUANTIZE_LEVEL = 0.0001F;
    static final int AUTOMATIC_PAGE_SPACING = -1;
    private static final boolean DEBUG = false;
    private static final boolean DISABLE_FLING_TO_DELETE = false;
    private static final boolean DISABLE_TOUCH_INTERACTION = false;
    private static final boolean DISABLE_TOUCH_SIDE_PAGES = true;
    private static final int FLING_THRESHOLD_VELOCITY = 500;
    protected static final int INVALID_PAGE = -1;
    protected static final int INVALID_POINTER = -1;
    private static final int MIN_FLING_VELOCITY = 250;
    private static final int MIN_LENGTH_FOR_FLING = 25;
    private static final int MIN_SNAP_VELOCITY = 1500;
    protected static final float NANOTIME_DIV = 1E+009F;
    private static final float OVERSCROLL_ACCELERATE_FACTOR = 2F;
    private static final float OVERSCROLL_DAMP_FACTOR = 0.14F;
    protected static final int PAGE_SNAP_ANIMATION_DURATION = 750;
    private static final float RETURN_TO_ORIGINAL_PAGE_THRESHOLD = 0.33F;
    private static final float SIGNIFICANT_MOVE_THRESHOLD = 0.4F;
    protected static final int SLOW_PAGE_SNAP_ANIMATION_DURATION = 950;
    private static final String TAG = "WidgetPagedView";
    protected static final int TOUCH_STATE_NEXT_PAGE = 3;
    protected static final int TOUCH_STATE_PREV_PAGE = 2;
    protected static final int TOUCH_STATE_REORDERING = 4;
    protected static final int TOUCH_STATE_REST = 0;
    protected static final int TOUCH_STATE_SCROLLING = 1;
    protected static final int sScrollIndicatorFadeInDuration = 150;
    protected static final int sScrollIndicatorFadeOutDuration = 650;
    protected static final int sScrollIndicatorFlashDuration = 650;
    private int DELETE_SLIDE_IN_SIDE_PAGE_DURATION;
    private int DRAG_TO_DELETE_FADE_OUT_DURATION;
    private int FLING_TO_DELETE_FADE_OUT_DURATION;
    private float FLING_TO_DELETE_FRICTION;
    private float FLING_TO_DELETE_MAX_FLING_DEGREES;
    private int NUM_ANIMATIONS_RUNNING_BEFORE_ZOOM_OUT;
    private long REORDERING_DELETE_DROP_TARGET_FADE_DURATION;
    private int REORDERING_DROP_REPOSITION_DURATION;
    protected int REORDERING_REORDER_REPOSITION_DURATION;
    private float REORDERING_SIDE_PAGE_BUFFER_PERCENTAGE;
    private int REORDERING_SIDE_PAGE_HOVER_TIMEOUT;
    protected int REORDERING_ZOOM_IN_OUT_DURATION;
    Runnable hideScrollingIndicatorRunnable = new Runnable() {

        final PagedView this$0;

        public void run()
        {
            hideScrollingIndicator(false);
        }

            
            {
                this$0 = PagedView.this;
                super();
            }
    }
;
    protected int mActivePointerId;
    protected boolean mAllowOverScroll;
    private Rect mAltTmpRect;
    protected int mCellCountX;
    protected int mCellCountY;
    protected int mChildCountOnLastMeasure;
    private int mChildOffsets[];
    private int mChildOffsetsWithLayoutScale[];
    private int mChildRelativeOffsets[];
    protected boolean mContentIsRefreshable;
    protected int mCurrentPage;
    protected boolean mDeferScrollUpdate;
    private boolean mDeferringForDelete;
    private View mDeleteDropTarget;
    protected float mDensity;
    protected ArrayList mDirtyPageContent;
    private boolean mDownEventOnEdge;
    private float mDownMotionX;
    private float mDownMotionY;
    private float mDownScrollX;
    protected View mDragView;
    private int mEdgeSwipeRegionSize;
    protected boolean mFadeInAdjacentScreens;
    protected boolean mFirstLayout;
    protected int mFlingThresholdVelocity;
    protected int mFlingToDeleteThresholdVelocity;
    protected boolean mForceDrawAllChildrenNextFrame;
    protected boolean mForceScreenScrolled;
    protected boolean mIsDataReady;
    protected boolean mIsPageMoving;
    private boolean mIsReordering;
    protected float mLastMotionX;
    protected float mLastMotionXRemainder;
    protected float mLastMotionY;
    private int mLastScreenCenter;
    protected float mLayoutScale;
    protected android.view.View.OnLongClickListener mLongClickListener;
    protected int mMaxScrollX;
    private int mMaximumVelocity;
    protected int mMinFlingVelocity;
    private float mMinScale;
    protected int mMinSnapVelocity;
    private int mMinimumWidth;
    protected int mNextPage;
    private boolean mOnlyAllowEdgeSwipes;
    protected int mOverScrollX;
    protected int mPageSpacing;
    private PageSwitchListener mPageSwitchListener;
    private int mPagingTouchSlop;
    private float mParentDownMotionX;
    private float mParentDownMotionY;
    private int mPostReorderingPreZoomInRemainingAnimationCount;
    private Runnable mPostReorderingPreZoomInRunnable;
    private boolean mReorderingStarted;
    private View mScrollIndicator;
    private ValueAnimator mScrollIndicatorAnimator;
    private int mScrollIndicatorPaddingLeft;
    private int mScrollIndicatorPaddingRight;
    protected Scroller mScroller;
    private boolean mShouldShowScrollIndicator;
    private boolean mShouldShowScrollIndicatorImmediately;
    private int mSidePageHoverIndex;
    private Runnable mSidePageHoverRunnable;
    protected float mSmoothingTime;
    protected int mTempVisiblePagesRange[];
    private Matrix mTmpInvMatrix;
    private float mTmpPoint[];
    private Rect mTmpRect;
    private boolean mTopAlignPageWhenShrinkingForBouncer;
    protected float mTotalMotionX;
    protected int mTouchSlop;
    protected int mTouchState;
    protected float mTouchX;
    protected int mUnboundedScrollX;
    protected boolean mUsePagingTouchSlop;
    private VelocityTracker mVelocityTracker;
    private Rect mViewport;
    protected AnimatorSet mZoomInOutAnim;

    public PagedView(Context context)
    {
        this(context, null);
    }

    public PagedView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public PagedView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mFirstLayout = true;
        mNextPage = -1;
        mLastScreenCenter = -1;
        mTouchState = 0;
        mForceScreenScrolled = false;
        mCellCountX = 0;
        mCellCountY = 0;
        mAllowOverScroll = true;
        mTempVisiblePagesRange = new int[2];
        mLayoutScale = 1.0F;
        mActivePointerId = -1;
        mContentIsRefreshable = true;
        mFadeInAdjacentScreens = false;
        mUsePagingTouchSlop = true;
        mDeferScrollUpdate = false;
        mIsPageMoving = false;
        mIsDataReady = true;
        mShouldShowScrollIndicator = false;
        mShouldShowScrollIndicatorImmediately = false;
        mViewport = new Rect();
        REORDERING_DROP_REPOSITION_DURATION = 200;
        REORDERING_REORDER_REPOSITION_DURATION = 300;
        REORDERING_ZOOM_IN_OUT_DURATION = 250;
        REORDERING_SIDE_PAGE_HOVER_TIMEOUT = 300;
        REORDERING_SIDE_PAGE_BUFFER_PERCENTAGE = 0.1F;
        REORDERING_DELETE_DROP_TARGET_FADE_DURATION = 150L;
        mMinScale = 1.0F;
        mSidePageHoverIndex = -1;
        mReorderingStarted = false;
        NUM_ANIMATIONS_RUNNING_BEFORE_ZOOM_OUT = 2;
        mOnlyAllowEdgeSwipes = false;
        mDownEventOnEdge = false;
        mEdgeSwipeRegionSize = 0;
        mTmpInvMatrix = new Matrix();
        mTmpPoint = new float[2];
        mTmpRect = new Rect();
        mAltTmpRect = new Rect();
        FLING_TO_DELETE_FADE_OUT_DURATION = 350;
        FLING_TO_DELETE_FRICTION = 0.035F;
        FLING_TO_DELETE_MAX_FLING_DEGREES = 65F;
        mFlingToDeleteThresholdVelocity = -1400;
        mDeferringForDelete = false;
        DELETE_SLIDE_IN_SIDE_PAGE_DURATION = 250;
        DRAG_TO_DELETE_FADE_OUT_DURATION = 350;
        mTopAlignPageWhenShrinkingForBouncer = false;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.PagedView, i, 0);
        setPageSpacing(typedarray.getDimensionPixelSize(0, 0));
        mScrollIndicatorPaddingLeft = typedarray.getDimensionPixelSize(1, 0);
        mScrollIndicatorPaddingRight = typedarray.getDimensionPixelSize(2, 0);
        typedarray.recycle();
        Resources resources = getResources();
        mEdgeSwipeRegionSize = resources.getDimensionPixelSize(0x1050074);
        mTopAlignPageWhenShrinkingForBouncer = resources.getBoolean(0x1110002);
        setHapticFeedbackEnabled(false);
        init();
    }

    private void acquireVelocityTrackerAndAddMovement(MotionEvent motionevent)
    {
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
    }

    private Runnable createPostDeleteAnimationRunnable(final View dragView)
    {
        return new Runnable() {

            final PagedView this$0;
            final View val$dragView;

            public void run()
            {
                int i = indexOfChild(dragView);
                getVisiblePages(mTempVisiblePagesRange);
                boundByReorderablePages(true, mTempVisiblePagesRange);
                boolean flag;
                if (mTempVisiblePagesRange[0] == mTempVisiblePagesRange[1])
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (!flag && i <= mTempVisiblePagesRange[0])
                    flag1 = false;
                else
                    flag1 = true;
                if (flag1)
                    snapToPageImmediately(i - 1);
                int j;
                if (flag)
                    j = 0;
                else
                    j = mTempVisiblePagesRange[0];
                int k = Math.min(mTempVisiblePagesRange[1], -1 + getPageCount());
                int l;
                if (flag1)
                    l = j;
                else
                    l = i + 1;
                int i1;
                if (flag1)
                    i1 = i - 1;
                else
                    i1 = k;
                ArrayList arraylist = new ArrayList();
                for (int j1 = l; j1 <= i1; j1++)
                {
                    View view = getChildAt(j1);
                    int k1;
                    int l1;
                    if (flag1)
                    {
                        if (j1 == 0)
                            k1 = (getViewportOffsetX() + getChildOffset(j1)) - getChildWidth(j1) - mPageSpacing;
                        else
                            k1 = getViewportOffsetX() + getChildOffset(j1 - 1);
                        l1 = getViewportOffsetX() + getChildOffset(j1);
                    } else
                    {
                        k1 = getChildOffset(j1) - getChildOffset(j1 - 1);
                        l1 = 0;
                    }
                    AnimatorSet animatorset1 = (AnimatorSet)view.getTag();
                    if (animatorset1 != null)
                        animatorset1.cancel();
                    view.setAlpha(Math.max(view.getAlpha(), 0.01F));
                    view.setTranslationX(k1 - l1);
                    AnimatorSet animatorset2 = new AnimatorSet();
                    Animator aanimator[] = new Animator[2];
                    aanimator[0] = ObjectAnimator.ofFloat(view, "translationX", new float[] {
                        0.0F
                    });
                    aanimator[1] = ObjectAnimator.ofFloat(view, "alpha", new float[] {
                        1.0F
                    });
                    animatorset2.playTogether(aanimator);
                    arraylist.add(animatorset2);
                    view.setTag(animatorset2);
                }

                AnimatorSet animatorset = new AnimatorSet();
                animatorset.playTogether(arraylist);
                animatorset.setDuration(DELETE_SLIDE_IN_SIDE_PAGE_DURATION);
                AnimatorListenerAdapter animatorlisteneradapter = new AnimatorListenerAdapter() {

                    final _cls9 this$1;

                    public void onAnimationEnd(Animator animator)
                    {
                        Runnable runnable = new Runnable() {

                            final _cls1 this$2;

                            public void run()
                            {
                                mDeferringForDelete = false;
                                onEndReordering();
                                onRemoveViewAnimationCompleted();
                            }

            
            {
                this$2 = _cls1.this;
                super();
            }
                        }
;
                        zoomIn(runnable);
                    }

            
            {
                this$1 = _cls9.this;
                super();
            }
                }
;
                animatorset.addListener(animatorlisteneradapter);
                animatorset.start();
                removeView(dragView);
                onRemoveView(dragView, true);
            }

            
            {
                this$0 = PagedView.this;
                dragView = view;
                super();
            }
        }
;
    }

    private PointF isFlingingToDelete()
    {
        ViewConfiguration viewconfiguration = ViewConfiguration.get(getContext());
        mVelocityTracker.computeCurrentVelocity(1000, viewconfiguration.getScaledMaximumFlingVelocity());
        if (mVelocityTracker.getYVelocity() < (float)mFlingToDeleteThresholdVelocity)
        {
            PointF pointf = new PointF(mVelocityTracker.getXVelocity(), mVelocityTracker.getYVelocity());
            PointF pointf1 = new PointF(0.0F, -1F);
            if ((double)(float)Math.acos((pointf.x * pointf1.x + pointf.y * pointf1.y) / (pointf.length() * pointf1.length())) <= Math.toRadians(FLING_TO_DELETE_MAX_FLING_DEGREES))
                return pointf;
        }
        return null;
    }

    private boolean isHoveringOverDeleteDropTarget(int i, int j)
    {
        View view = mDeleteDropTarget;
        boolean flag = false;
        if (view != null)
        {
            mAltTmpRect.set(0, 0, 0, 0);
            View view1 = (View)mDeleteDropTarget.getParent();
            if (view1 != null)
                view1.getGlobalVisibleRect(mAltTmpRect);
            mDeleteDropTarget.getGlobalVisibleRect(mTmpRect);
            mTmpRect.offset(-mAltTmpRect.left, -mAltTmpRect.top);
            flag = mTmpRect.contains(i, j);
        }
        return flag;
    }

    private boolean isTouchPointInCurrentPage(int i, int j)
    {
        View view = getPageAt(getCurrentPage());
        boolean flag = false;
        if (view != null)
        {
            mTmpRect.set(view.getLeft() - getScrollX(), 0, view.getRight() - getScrollX(), view.getBottom());
            flag = mTmpRect.contains(i, j);
        }
        return flag;
    }

    private boolean isTouchPointInViewportWithBuffer(int i, int j)
    {
        mTmpRect.set(mViewport.left - mViewport.width() / 2, mViewport.top, mViewport.right + mViewport.width() / 2, mViewport.bottom);
        return mTmpRect.contains(i, j);
    }

    private void onDropToDelete()
    {
        View view = mDragView;
        ArrayList arraylist = new ArrayList();
        AnimatorSet animatorset = new AnimatorSet();
        animatorset.setInterpolator(new DecelerateInterpolator(2.0F));
        Animator aanimator[] = new Animator[2];
        aanimator[0] = ObjectAnimator.ofFloat(view, "scaleX", new float[] {
            0.0F
        });
        aanimator[1] = ObjectAnimator.ofFloat(view, "scaleY", new float[] {
            0.0F
        });
        animatorset.playTogether(aanimator);
        arraylist.add(animatorset);
        AnimatorSet animatorset1 = new AnimatorSet();
        animatorset1.setInterpolator(new LinearInterpolator());
        Animator aanimator1[] = new Animator[1];
        aanimator1[0] = ObjectAnimator.ofFloat(view, "alpha", new float[] {
            0.0F
        });
        animatorset1.playTogether(aanimator1);
        arraylist.add(animatorset1);
        final Runnable onAnimationEndRunnable = createPostDeleteAnimationRunnable(view);
        AnimatorSet animatorset2 = new AnimatorSet();
        animatorset2.playTogether(arraylist);
        animatorset2.setDuration(DRAG_TO_DELETE_FADE_OUT_DURATION);
        animatorset2.addListener(new AnimatorListenerAdapter() {

            final PagedView this$0;
            final Runnable val$onAnimationEndRunnable;

            public void onAnimationEnd(Animator animator)
            {
                onAnimationEndRunnable.run();
            }

            
            {
                this$0 = PagedView.this;
                onAnimationEndRunnable = runnable;
                super();
            }
        }
);
        animatorset2.start();
        mDeferringForDelete = true;
    }

    private void onPostReorderingAnimationCompleted()
    {
        mPostReorderingPreZoomInRemainingAnimationCount = -1 + mPostReorderingPreZoomInRemainingAnimationCount;
        if (mPostReorderingPreZoomInRunnable != null && mPostReorderingPreZoomInRemainingAnimationCount == 0)
        {
            mPostReorderingPreZoomInRunnable.run();
            mPostReorderingPreZoomInRunnable = null;
        }
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
            float f = motionevent.getX(j);
            mDownMotionX = f;
            mLastMotionX = f;
            mLastMotionY = motionevent.getY(j);
            mLastMotionXRemainder = 0.0F;
            mActivePointerId = motionevent.getPointerId(j);
            if (mVelocityTracker != null)
                mVelocityTracker.clear();
        }
    }

    private float overScrollInfluenceCurve(float f)
    {
        float f1 = f - 1.0F;
        return 1.0F + f1 * (f1 * f1);
    }

    private void releaseVelocityTracker()
    {
        if (mVelocityTracker != null)
        {
            mVelocityTracker.recycle();
            mVelocityTracker = null;
        }
    }

    private void resetTouchState()
    {
        releaseVelocityTracker();
        endReordering();
        mTouchState = 0;
        mActivePointerId = -1;
        mDownEventOnEdge = false;
    }

    private void updateScrollingIndicator()
    {
        if (getChildCount() > 1 && isScrollingIndicatorEnabled())
        {
            getScrollingIndicator();
            if (mScrollIndicator != null)
                updateScrollingIndicatorPosition();
            if (mShouldShowScrollIndicator)
            {
                showScrollingIndicator(mShouldShowScrollIndicatorImmediately);
                return;
            }
        }
    }

    private void updateScrollingIndicatorPosition()
    {
        if (isScrollingIndicatorEnabled() && mScrollIndicator != null)
        {
            int i = getChildCount();
            int j = getViewportWidth();
            int k = Math.max(0, -1 + getChildCount());
            int l = getChildOffset(k) - getRelativeChildOffset(k);
            int i1 = j - mScrollIndicatorPaddingLeft - mScrollIndicatorPaddingRight;
            int j1 = mScrollIndicator.getMeasuredWidth() - mScrollIndicator.getPaddingLeft() - mScrollIndicator.getPaddingRight();
            float f = Math.max(0.0F, Math.min(1.0F, (float)getScrollX() / (float)l));
            int k1 = i1 / i;
            int l1 = (int)(f * (float)(i1 - k1)) + mScrollIndicatorPaddingLeft;
            if (hasElasticScrollIndicator())
            {
                if (mScrollIndicator.getMeasuredWidth() != k1)
                {
                    mScrollIndicator.getLayoutParams().width = k1;
                    mScrollIndicator.requestLayout();
                }
            } else
            {
                l1 += k1 / 2 - j1 / 2;
            }
            mScrollIndicator.setTranslationX(l1);
            return;
        } else
        {
            return;
        }
    }

    protected void acceleratedOverScroll(float f)
    {
        int i = getViewportWidth();
        float f1 = 2.0F * (f / (float)i);
        if (f1 == 0.0F)
            return;
        if (Math.abs(f1) >= 1.0F)
            f1 /= Math.abs(f1);
        int j = Math.round(f1 * (float)i);
        if (f < 0.0F)
        {
            mOverScrollX = j;
            super.scrollTo(0, getScrollY());
        } else
        {
            mOverScrollX = j + mMaxScrollX;
            super.scrollTo(mMaxScrollX, getScrollY());
        }
        invalidate();
    }

    public void addFocusables(ArrayList arraylist, int i, int j)
    {
        if (mCurrentPage >= 0 && mCurrentPage < getPageCount())
            getPageAt(mCurrentPage).addFocusables(arraylist, i, j);
        if (i == 17)
        {
            if (mCurrentPage > 0)
                getPageAt(-1 + mCurrentPage).addFocusables(arraylist, i, j);
        } else
        if (i == 66 && mCurrentPage < -1 + getPageCount())
        {
            getPageAt(1 + mCurrentPage).addFocusables(arraylist, i, j);
            return;
        }
    }

    void animateDragViewToOriginalPosition()
    {
        if (mDragView != null)
        {
            AnimatorSet animatorset = new AnimatorSet();
            animatorset.setDuration(REORDERING_DROP_REPOSITION_DURATION);
            Animator aanimator[] = new Animator[2];
            aanimator[0] = ObjectAnimator.ofFloat(mDragView, "translationX", new float[] {
                0.0F
            });
            aanimator[1] = ObjectAnimator.ofFloat(mDragView, "translationY", new float[] {
                0.0F
            });
            animatorset.playTogether(aanimator);
            animatorset.addListener(new AnimatorListenerAdapter() {

                final PagedView this$0;

                public void onAnimationEnd(Animator animator)
                {
                    onPostReorderingAnimationCompleted();
                }

            
            {
                this$0 = PagedView.this;
                super();
            }
            }
);
            animatorset.start();
        }
    }

    void boundByReorderablePages(boolean flag, int ai[])
    {
    }

    protected void cancelScrollingIndicatorAnimations()
    {
        if (mScrollIndicatorAnimator != null)
            mScrollIndicatorAnimator.cancel();
    }

    public void computeScroll()
    {
        computeScrollHelper();
    }

    protected boolean computeScrollHelper()
    {
        if (mScroller.computeScrollOffset())
        {
            if (getScrollX() != mScroller.getCurrX() || getScrollY() != mScroller.getCurrY() || mOverScrollX != mScroller.getCurrX())
                scrollTo(mScroller.getCurrX(), mScroller.getCurrY());
            invalidate();
            return true;
        }
        if (mNextPage != -1)
        {
            mCurrentPage = Math.max(0, Math.min(mNextPage, -1 + getPageCount()));
            mNextPage = -1;
            notifyPageSwitched();
            if (mTouchState == 0)
                pageEndMoving();
            onPostReorderingAnimationCompleted();
            return true;
        } else
        {
            return false;
        }
    }

    protected void dampedOverScroll(float f)
    {
        int i = getViewportWidth();
        float f1 = f / (float)i;
        if (f1 == 0.0F)
            return;
        float f2 = (f1 / Math.abs(f1)) * overScrollInfluenceCurve(Math.abs(f1));
        if (Math.abs(f2) >= 1.0F)
            f2 /= Math.abs(f2);
        int j = Math.round(0.14F * f2 * (float)i);
        if (f < 0.0F)
        {
            mOverScrollX = j;
            super.scrollTo(0, getScrollY());
        } else
        {
            mOverScrollX = j + mMaxScrollX;
            super.scrollTo(mMaxScrollX, getScrollY());
        }
        invalidate();
    }

    protected void determineScrollingStart(MotionEvent motionevent)
    {
        determineScrollingStart(motionevent, 1.0F);
    }

    protected void determineScrollingStart(MotionEvent motionevent, float f)
    {
        int i = motionevent.findPointerIndex(mActivePointerId);
        if (i != -1)
        {
            float f1 = motionevent.getX(i);
            float f2 = motionevent.getY(i);
            if (isTouchPointInViewportWithBuffer((int)f1, (int)f2) && (!mOnlyAllowEdgeSwipes || mDownEventOnEdge))
            {
                int j = (int)Math.abs(f1 - mLastMotionX);
                int k = (int)Math.abs(f2 - mLastMotionY);
                int l = Math.round(f * (float)mTouchSlop);
                boolean flag;
                if (j > mPagingTouchSlop)
                    flag = true;
                else
                    flag = false;
                boolean flag1;
                if (j > l)
                    flag1 = true;
                else
                    flag1 = false;
                boolean flag2 = false;
                if (k > l)
                    flag2 = true;
                if ((flag1 || flag || flag2) && (mUsePagingTouchSlop ? flag : flag1))
                {
                    mTouchState = 1;
                    mTotalMotionX = mTotalMotionX + Math.abs(mLastMotionX - f1);
                    mLastMotionX = f1;
                    mLastMotionXRemainder = 0.0F;
                    mTouchX = getViewportOffsetX() + getScrollX();
                    mSmoothingTime = (float)System.nanoTime() / 1E+009F;
                    pageBeginMoving();
                    return;
                }
            }
        }
    }

    protected void dispatchDraw(Canvas canvas)
    {
        int i = getViewportWidth() / 2 + mOverScrollX;
        if (i != mLastScreenCenter || mForceScreenScrolled)
        {
            mForceScreenScrolled = false;
            screenScrolled(i);
            mLastScreenCenter = i;
        }
        int j = getChildCount();
        if (j > 0)
        {
            getVisiblePages(mTempVisiblePagesRange);
            int k = mTempVisiblePagesRange[0];
            int l = mTempVisiblePagesRange[1];
            if (k != -1 && l != -1)
            {
                long l1 = getDrawingTime();
                canvas.save();
                canvas.clipRect(getScrollX(), getScrollY(), (getScrollX() + getRight()) - getLeft(), (getScrollY() + getBottom()) - getTop());
                for (int i1 = j - 1; i1 >= 0; i1--)
                {
                    View view = getPageAt(i1);
                    if (view != mDragView && (mForceDrawAllChildrenNextFrame || k <= i1 && i1 <= l && shouldDrawChild(view)))
                        drawChild(canvas, view, l1);
                }

                if (mDragView != null)
                    drawChild(canvas, mDragView, l1);
                mForceDrawAllChildrenNextFrame = false;
                canvas.restore();
            }
        }
    }

    public boolean dispatchUnhandledMove(View view, int i)
    {
        if (i == 17)
        {
            if (getCurrentPage() > 0)
            {
                snapToPage(-1 + getCurrentPage());
                return true;
            }
        } else
        if (i == 66 && getCurrentPage() < -1 + getPageCount())
        {
            snapToPage(1 + getCurrentPage());
            return true;
        }
        return super.dispatchUnhandledMove(view, i);
    }

    float distanceInfluenceForSnapDuration(float f)
    {
        return (float)Math.sin((float)(0.4712389167638204D * (double)(f - 0.5F)));
    }

    void endReordering()
    {
        if (mReorderingStarted)
        {
            mReorderingStarted = false;
            final Runnable onCompleteRunnable = new Runnable() {

                final PagedView this$0;

                public void run()
                {
                    onEndReordering();
                }

            
            {
                this$0 = PagedView.this;
                super();
            }
            }
;
            if (!mDeferringForDelete)
            {
                mPostReorderingPreZoomInRunnable = new Runnable() {

                    final PagedView this$0;
                    final Runnable val$onCompleteRunnable;

                    public void run()
                    {
                        zoomIn(onCompleteRunnable);
                    }

            
            {
                this$0 = PagedView.this;
                onCompleteRunnable = runnable;
                super();
            }
                }
;
                mPostReorderingPreZoomInRemainingAnimationCount = NUM_ANIMATIONS_RUNNING_BEFORE_ZOOM_OUT;
                snapToPage(indexOfChild(mDragView), 0);
                animateDragViewToOriginalPosition();
                return;
            }
        }
    }

    protected void flashScrollingIndicator(boolean flag)
    {
        removeCallbacks(hideScrollingIndicatorRunnable);
        boolean flag1;
        if (!flag)
            flag1 = true;
        else
            flag1 = false;
        showScrollingIndicator(flag1);
        postDelayed(hideScrollingIndicatorRunnable, 650L);
    }

    public void focusableViewAvailable(View view)
    {
        View view1 = getPageAt(mCurrentPage);
        View view2 = view;
        do
        {
            if (view2 == view1)
            {
                super.focusableViewAvailable(view);
                break;
            }
            if (view2 == this || !(view2.getParent() instanceof View))
                break;
            view2 = (View)view2.getParent();
        } while (true);
    }

    protected float getBoundedScrollProgress(int i, View view, int j)
    {
        int k = getViewportWidth() / 2;
        return getScrollProgress(Math.max(k, Math.min(k + mScrollX, i)), view, j);
    }

    protected int getChildIndexForRelativeOffset(int i)
    {
        int j = getChildCount();
        for (int k = 0; k < j; k++)
        {
            int l = getRelativeChildOffset(k);
            int i1 = l + getScaledMeasuredWidth(getPageAt(k));
            if (l <= i && i <= i1)
                return k;
        }

        return -1;
    }

    protected int getChildOffset(int i)
    {
        int j = 0;
        if (i >= 0)
        {
            int k = -1 + getChildCount();
            j = 0;
            if (i <= k)
            {
                int ai[];
                if (Float.compare(mLayoutScale, 1.0F) == 0)
                    ai = mChildOffsets;
                else
                    ai = mChildOffsetsWithLayoutScale;
                if (ai != null && ai[i] != -1)
                    return ai[i];
                int l = getChildCount();
                j = 0;
                if (l != 0)
                {
                    j = getRelativeChildOffset(0);
                    for (int i1 = 0; i1 < i; i1++)
                        j += getScaledMeasuredWidth(getPageAt(i1)) + mPageSpacing;

                    if (ai != null)
                    {
                        ai[i] = j;
                        return j;
                    }
                }
            }
        }
        return j;
    }

    protected int getChildWidth(int i)
    {
        int j = getPageAt(i).getMeasuredWidth();
        int k = mMinimumWidth;
        if (k > j)
            return k;
        else
            return j;
    }

    int getCurrentPage()
    {
        return mCurrentPage;
    }

    protected float getMaxScrollProgress()
    {
        return 1.0F;
    }

    int getNextPage()
    {
        if (mNextPage != -1)
            return mNextPage;
        else
            return mCurrentPage;
    }

    View getPageAt(int i)
    {
        return getChildAt(i);
    }

    int getPageCount()
    {
        return getChildCount();
    }

    public int getPageForView(View view)
    {
        if (view != null)
        {
            android.view.ViewParent viewparent = view.getParent();
            int i = getChildCount();
            for (int j = 0; j < i; j++)
                if (viewparent == getPageAt(j))
                    return j;

        }
        return -1;
    }

    int getPageNearestToCenterOfScreen()
    {
        int i = 0x7fffffff;
        int j = -1;
        int k = getViewportOffsetX() + getScrollX() + getViewportWidth() / 2;
        int l = getChildCount();
        for (int i1 = 0; i1 < l; i1++)
        {
            int j1 = Math.abs((getScaledMeasuredWidth(getPageAt(i1)) / 2 + (getViewportOffsetX() + getChildOffset(i1))) - k);
            if (j1 < i)
            {
                i = j1;
                j = i1;
            }
        }

        return j;
    }

    int getPageNearestToPoint(float f)
    {
        int i = 0;
        for (int j = 0; j < getChildCount(); j++)
        {
            if (f < (float)(getChildAt(j).getRight() - getScrollX()))
                return i;
            i++;
        }

        return Math.min(i, -1 + getChildCount());
    }

    protected int getRelativeChildOffset(int i)
    {
        int j;
        if (i >= 0 && i <= -1 + getChildCount())
        {
            if (mChildRelativeOffsets != null && mChildRelativeOffsets[i] != -1)
                return mChildRelativeOffsets[i];
            int k = getPaddingLeft() + getPaddingRight();
            j = getPaddingLeft() + (getViewportWidth() - k - getChildWidth(i)) / 2;
            if (mChildRelativeOffsets != null)
            {
                mChildRelativeOffsets[i] = j;
                return j;
            }
        } else
        {
            j = 0;
        }
        return j;
    }

    protected int getScaledMeasuredWidth(View view)
    {
        int i = view.getMeasuredWidth();
        int j = mMinimumWidth;
        int k;
        if (j > i)
            k = j;
        else
            k = i;
        return (int)(0.5F + (float)k * mLayoutScale);
    }

    protected float getScrollProgress(int i, View view, int j)
    {
        int k = getViewportWidth() / 2;
        int l = getScaledMeasuredWidth(view) + mPageSpacing;
        return Math.max(Math.min((float)(i - (k + (getChildOffset(j) - getRelativeChildOffset(j)))) / (1.0F * (float)l), getMaxScrollProgress()), -getMaxScrollProgress());
    }

    protected View getScrollingIndicator()
    {
        return null;
    }

    int getViewportHeight()
    {
        return mViewport.height();
    }

    int getViewportOffsetX()
    {
        return (getMeasuredWidth() - getViewportWidth()) / 2;
    }

    int getViewportOffsetY()
    {
        return (getMeasuredHeight() - getViewportHeight()) / 2;
    }

    int getViewportWidth()
    {
        return mViewport.width();
    }

    protected void getVisiblePages(int ai[])
    {
        ai[0] = 0;
        ai[1] = -1 + getPageCount();
    }

    protected boolean hasElasticScrollIndicator()
    {
        return true;
    }

    protected void hideScrollingIndicator(boolean flag)
    {
        if (getChildCount() > 1 && isScrollingIndicatorEnabled())
        {
            getScrollingIndicator();
            if (mScrollIndicator != null)
            {
                updateScrollingIndicatorPosition();
                cancelScrollingIndicatorAnimations();
                if (flag)
                {
                    mScrollIndicator.setVisibility(4);
                    mScrollIndicator.setAlpha(0.0F);
                    return;
                } else
                {
                    mScrollIndicatorAnimator = ObjectAnimator.ofFloat(mScrollIndicator, "alpha", new float[] {
                        0.0F
                    });
                    mScrollIndicatorAnimator.setDuration(650L);
                    mScrollIndicatorAnimator.addListener(new AnimatorListenerAdapter() {

                        private boolean cancelled;
                        final PagedView this$0;

                        public void onAnimationCancel(Animator animator)
                        {
                            cancelled = true;
                        }

                        public void onAnimationEnd(Animator animator)
                        {
                            if (!cancelled)
                                mScrollIndicator.setVisibility(4);
                        }

            
            {
                this$0 = PagedView.this;
                super();
                cancelled = false;
            }
                    }
);
                    mScrollIndicatorAnimator.start();
                    return;
                }
            }
        }
    }

    protected boolean hitsNextPage(float f, float f1)
    {
        return f > (float)(((getViewportOffsetX() + getViewportWidth()) - getRelativeChildOffset(mCurrentPage)) + mPageSpacing);
    }

    protected boolean hitsPreviousPage(float f, float f1)
    {
        return f < (float)((getViewportOffsetX() + getRelativeChildOffset(mCurrentPage)) - mPageSpacing);
    }

    protected int indexToPage(int i)
    {
        return i;
    }

    protected void init()
    {
        mDirtyPageContent = new ArrayList();
        mDirtyPageContent.ensureCapacity(32);
        mScroller = new Scroller(getContext(), new ScrollInterpolator());
        mCurrentPage = 0;
        ViewConfiguration viewconfiguration = ViewConfiguration.get(getContext());
        mTouchSlop = viewconfiguration.getScaledTouchSlop();
        mPagingTouchSlop = viewconfiguration.getScaledPagingTouchSlop();
        mMaximumVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        mDensity = getResources().getDisplayMetrics().density;
        mFlingToDeleteThresholdVelocity = (int)((float)mFlingToDeleteThresholdVelocity * mDensity);
        mFlingThresholdVelocity = (int)(500F * mDensity);
        mMinFlingVelocity = (int)(250F * mDensity);
        mMinSnapVelocity = (int)(1500F * mDensity);
        setOnHierarchyChangeListener(this);
    }

    protected void invalidateCachedOffsets()
    {
        int i = getChildCount();
        if (i == 0)
        {
            mChildOffsets = null;
            mChildRelativeOffsets = null;
            mChildOffsetsWithLayoutScale = null;
        } else
        {
            mChildOffsets = new int[i];
            mChildRelativeOffsets = new int[i];
            mChildOffsetsWithLayoutScale = new int[i];
            for (int j = 0; j < i; j++)
            {
                mChildOffsets[j] = -1;
                mChildRelativeOffsets[j] = -1;
                mChildOffsetsWithLayoutScale[j] = -1;
            }

        }
    }

    protected boolean isDataReady()
    {
        return mIsDataReady;
    }

    protected boolean isPageMoving()
    {
        return mIsPageMoving;
    }

    boolean isReordering(boolean flag)
    {
        boolean flag1 = mIsReordering;
        if (flag)
        {
            boolean flag2;
            if (mTouchState == 4)
                flag2 = true;
            else
                flag2 = false;
            flag1 &= flag2;
        }
        return flag1;
    }

    protected boolean isScrollingIndicatorEnabled()
    {
        return false;
    }

    float[] mapPointFromParentToView(View view, float f, float f1)
    {
        mTmpPoint[0] = f - (float)view.getLeft();
        mTmpPoint[1] = f1 - (float)view.getTop();
        view.getMatrix().invert(mTmpInvMatrix);
        mTmpInvMatrix.mapPoints(mTmpPoint);
        return mTmpPoint;
    }

    float[] mapPointFromViewToParent(View view, float f, float f1)
    {
        mTmpPoint[0] = f;
        mTmpPoint[1] = f1;
        view.getMatrix().mapPoints(mTmpPoint);
        float af[] = mTmpPoint;
        af[0] = af[0] + (float)view.getLeft();
        float af1[] = mTmpPoint;
        af1[1] = af1[1] + (float)view.getTop();
        return mTmpPoint;
    }

    protected float maxOverScroll()
    {
        return 0.14F * ((1.0F / Math.abs(1.0F)) * overScrollInfluenceCurve(Math.abs(1.0F)));
    }

    protected void notifyPageSwitched()
    {
        if (mPageSwitchListener != null)
            mPageSwitchListener.onPageSwitched(getPageAt(mCurrentPage), mCurrentPage);
    }

    protected void notifyPageSwitching(int i)
    {
        if (mPageSwitchListener != null)
            mPageSwitchListener.onPageSwitching(getPageAt(i), i);
    }

    public abstract void onAddView(View view, int i);

    public void onChildViewAdded(View view, View view1)
    {
        mForceScreenScrolled = true;
        invalidate();
        invalidateCachedOffsets();
    }

    public void onChildViewRemoved(View view, View view1)
    {
        mForceScreenScrolled = true;
    }

    protected void onEndReordering()
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled())
            announceForAccessibility(mContext.getString(0x1040328));
        mIsReordering = false;
        getVisiblePages(mTempVisiblePagesRange);
        boundByReorderablePages(true, mTempVisiblePagesRange);
        for (int i = 0; i < getPageCount(); i++)
            if (i < mTempVisiblePagesRange[0] || i > mTempVisiblePagesRange[1])
                getPageAt(i).setAlpha(1.0F);

    }

    public void onFlingToDelete(PointF pointf)
    {
        final long startTime = AnimationUtils.currentAnimationTimeMillis();
        TimeInterpolator timeinterpolator = new TimeInterpolator() {

            private int mCount;
            private float mOffset;
            private long mStartTime;
            final PagedView this$0;
            final long val$startTime;

            public float getInterpolation(float f)
            {
                if (mCount < 0)
                    mCount = 1 + mCount;
                else
                if (mCount == 0)
                {
                    mOffset = Math.min(0.5F, (float)(AnimationUtils.currentAnimationTimeMillis() - mStartTime) / (float)FLING_TO_DELETE_FADE_OUT_DURATION);
                    mCount = 1 + mCount;
                }
                return Math.min(1.0F, f + mOffset);
            }

            
            {
                this$0 = PagedView.this;
                startTime = l;
                super();
                mCount = -1;
                mStartTime = startTime;
            }
        }
;
        Rect rect = new Rect();
        View view = mDragView;
        rect.left = (int)view.getTranslationX();
        rect.top = (int)view.getTranslationY();
        FlingAlongVectorAnimatorUpdateListener flingalongvectoranimatorupdatelistener = new FlingAlongVectorAnimatorUpdateListener(view, pointf, rect, startTime, FLING_TO_DELETE_FRICTION);
        final Runnable onAnimationEndRunnable = createPostDeleteAnimationRunnable(view);
        ValueAnimator valueanimator = new ValueAnimator();
        valueanimator.setInterpolator(timeinterpolator);
        valueanimator.setDuration(FLING_TO_DELETE_FADE_OUT_DURATION);
        valueanimator.setFloatValues(new float[] {
            0.0F, 1.0F
        });
        valueanimator.addUpdateListener(flingalongvectoranimatorupdatelistener);
        valueanimator.addListener(new AnimatorListenerAdapter() {

            final PagedView this$0;
            final Runnable val$onAnimationEndRunnable;

            public void onAnimationEnd(Animator animator)
            {
                onAnimationEndRunnable.run();
            }

            
            {
                this$0 = PagedView.this;
                onAnimationEndRunnable = runnable;
                super();
            }
        }
);
        valueanimator.start();
        mDeferringForDelete = true;
    }

    public boolean onGenericMotionEvent(MotionEvent motionevent)
    {
        if ((2 & motionevent.getSource()) != 0)
            switch (motionevent.getAction())
            {
            case 8: // '\b'
                float f;
                float f1;
                if ((1 & motionevent.getMetaState()) != 0)
                {
                    f = 0.0F;
                    f1 = motionevent.getAxisValue(9);
                } else
                {
                    f = -motionevent.getAxisValue(9);
                    f1 = motionevent.getAxisValue(10);
                }
                if (f1 != 0.0F || f != 0.0F)
                {
                    if (f1 <= 0.0F && f <= 0.0F)
                        scrollLeft();
                    else
                        scrollRight();
                    return true;
                }
                break;
            }
        return super.onGenericMotionEvent(motionevent);
    }

    public boolean onHoverEvent(MotionEvent motionevent)
    {
        return true;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityevent)
    {
        super.onInitializeAccessibilityEvent(accessibilityevent);
        accessibilityevent.setScrollable(true);
        if (accessibilityevent.getEventType() == 4096)
        {
            accessibilityevent.setFromIndex(mCurrentPage);
            accessibilityevent.setToIndex(mCurrentPage);
            accessibilityevent.setItemCount(getChildCount());
        }
    }

    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilitynodeinfo)
    {
        boolean flag = true;
        super.onInitializeAccessibilityNodeInfo(accessibilitynodeinfo);
        if (getPageCount() <= flag)
            flag = false;
        accessibilitynodeinfo.setScrollable(flag);
        if (getCurrentPage() < -1 + getPageCount())
            accessibilitynodeinfo.addAction(4096);
        if (getCurrentPage() > 0)
            accessibilitynodeinfo.addAction(8192);
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        boolean flag = true;
        acquireVelocityTrackerAndAddMovement(motionevent);
        if (getChildCount() <= 0)
        {
            flag = super.onInterceptTouchEvent(motionevent);
        } else
        {
            int i = motionevent.getAction();
            if (i != 2 || mTouchState != flag)
            {
                switch (i & 0xff)
                {
                case 4: // '\004'
                case 5: // '\005'
                default:
                    break;

                case 6: // '\006'
                    onSecondaryPointerUp(motionevent);
                    releaseVelocityTracker();
                    break;

                case 1: // '\001'
                case 3: // '\003'
                    resetTouchState();
                    if (!isTouchPointInCurrentPage((int)mLastMotionX, (int)mLastMotionY))
                        return flag;
                    break;

                case 2: // '\002'
                    if (mActivePointerId != -1)
                    {
                        determineScrollingStart(motionevent);
                        break;
                    }
                    // fall through

                case 0: // '\0'
                    float f = motionevent.getX();
                    float f1 = motionevent.getY();
                    mDownMotionX = f;
                    mDownMotionY = f1;
                    mDownScrollX = getScrollX();
                    mLastMotionX = f;
                    mLastMotionY = f1;
                    float af[] = mapPointFromViewToParent(this, f, f1);
                    mParentDownMotionX = af[0];
                    mParentDownMotionY = af[flag];
                    mLastMotionXRemainder = 0.0F;
                    mTotalMotionX = 0.0F;
                    mActivePointerId = motionevent.getPointerId(0);
                    int j = getViewportOffsetX() + mEdgeSwipeRegionSize;
                    int k = getMeasuredWidth() - getViewportOffsetX() - mEdgeSwipeRegionSize;
                    if (mDownMotionX <= (float)j || mDownMotionX >= (float)k)
                        mDownEventOnEdge = flag;
                    int l = Math.abs(mScroller.getFinalX() - mScroller.getCurrX());
                    boolean flag1;
                    if (!mScroller.isFinished() && l >= mTouchSlop)
                        flag1 = false;
                    else
                        flag1 = flag;
                    if (flag1)
                        mTouchState = 0;
                    else
                    if (isTouchPointInViewportWithBuffer((int)mDownMotionX, (int)mDownMotionY))
                        mTouchState = ((flag) ? 1 : 0);
                    else
                        mTouchState = 0;
                    break;
                }
                if (mTouchState == 0)
                    return false;
            }
        }
        return flag;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        if (mIsDataReady && getChildCount() != 0)
        {
            int i1 = getChildCount();
            int j1 = getViewportOffsetX();
            int k1 = getViewportOffsetY();
            mViewport.offset(j1, k1);
            int l1 = j1 + getRelativeChildOffset(0);
            for (int i2 = 0; i2 < i1; i2++)
            {
                View view = getPageAt(i2);
                int j2 = k1 + getPaddingTop();
                if (view.getVisibility() != 8)
                {
                    int k2 = getScaledMeasuredWidth(view);
                    int l2 = view.getMeasuredHeight();
                    view.layout(l1, j2, l1 + view.getMeasuredWidth(), j2 + l2);
                    l1 += k2 + mPageSpacing;
                }
            }

            if (mFirstLayout && mCurrentPage >= 0 && mCurrentPage < getChildCount())
            {
                setHorizontalScrollBarEnabled(false);
                updateCurrentPageScroll();
                setHorizontalScrollBarEnabled(true);
                mFirstLayout = false;
                return;
            }
        }
    }

    protected void onMeasure(int i, int j)
    {
        if (mIsDataReady && getChildCount() != 0)
        {
            View _tmp = (View)getParent();
            int k = android.view.View.MeasureSpec.getMode(i);
            int l = android.view.View.MeasureSpec.getSize(i);
            int i1 = android.view.View.MeasureSpec.getMode(j);
            int j1 = android.view.View.MeasureSpec.getSize(j);
            DisplayMetrics displaymetrics = getResources().getDisplayMetrics();
            int k1 = Math.max(displaymetrics.widthPixels, displaymetrics.heightPixels);
            int l1 = (int)((float)(int)(1.5F * (float)k1) / mMinScale);
            int i2 = (int)((float)k1 / mMinScale);
            mViewport.set(0, 0, l, j1);
            if (k != 0 && i1 != 0)
            {
                if (l > 0 && j1 > 0)
                {
                    int j2 = getPaddingTop() + getPaddingBottom();
                    int k2 = getPaddingLeft() + getPaddingRight();
                    int l2 = getChildCount();
                    for (int i3 = 0; i3 < l2; i3++)
                    {
                        View view = getPageAt(i3);
                        android.view.ViewGroup.LayoutParams layoutparams = view.getLayoutParams();
                        int k3;
                        if (layoutparams.width == -2)
                            k3 = 0x80000000;
                        else
                            k3 = 0x40000000;
                        int l3;
                        if (layoutparams.height == -2)
                            l3 = 0x80000000;
                        else
                            l3 = 0x40000000;
                        view.measure(android.view.View.MeasureSpec.makeMeasureSpec(l - k2, k3), android.view.View.MeasureSpec.makeMeasureSpec(j1 - j2, l3));
                    }

                    setMeasuredDimension(l1, i2);
                    invalidateCachedOffsets();
                    if (mChildCountOnLastMeasure != getChildCount() && !mDeferringForDelete)
                        setCurrentPage(mCurrentPage);
                    mChildCountOnLastMeasure = getChildCount();
                    if (l2 > 0 && mPageSpacing == -1)
                    {
                        int j3 = getRelativeChildOffset(0);
                        setPageSpacing(Math.max(j3, l - j3 - getChildAt(0).getMeasuredWidth()));
                    }
                    updateScrollingIndicatorPosition();
                    if (l2 > 0)
                    {
                        mMaxScrollX = getChildOffset(l2 - 1) - getRelativeChildOffset(l2 - 1);
                        return;
                    } else
                    {
                        mMaxScrollX = 0;
                        return;
                    }
                } else
                {
                    super.onMeasure(i, j);
                    return;
                }
            } else
            {
                super.onMeasure(i, j);
                return;
            }
        } else
        {
            super.onMeasure(i, j);
            return;
        }
    }

    protected void onPageBeginMoving()
    {
    }

    protected void onPageEndMoving()
    {
    }

    public abstract void onRemoveView(View view, boolean flag);

    public abstract void onRemoveViewAnimationCompleted();

    protected boolean onRequestFocusInDescendants(int i, Rect rect)
    {
        int j;
        if (mNextPage != -1)
            j = mNextPage;
        else
            j = mCurrentPage;
        View view = getPageAt(j);
        if (view != null)
            return view.requestFocus(i, rect);
        else
            return false;
    }

    protected void onStartReordering()
    {
        if (AccessibilityManager.getInstance(mContext).isEnabled())
            announceForAccessibility(mContext.getString(0x1040327));
        mTouchState = 4;
        mIsReordering = true;
        getVisiblePages(mTempVisiblePagesRange);
        boundByReorderablePages(true, mTempVisiblePagesRange);
        for (int i = 0; i < getPageCount(); i++)
            if (i < mTempVisiblePagesRange[0] || i > mTempVisiblePagesRange[1])
                getPageAt(i).setAlpha(0.0F);

        invalidate();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        if (getChildCount() <= 0)
            return super.onTouchEvent(motionevent);
        acquireVelocityTrackerAndAddMovement(motionevent);
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
            if (mTouchState == 1)
                snapToDestination();
            resetTouchState();
            break;

        case 1: // '\001'
            if (mTouchState == 1)
            {
                int j2 = mActivePointerId;
                float f5 = motionevent.getX(motionevent.findPointerIndex(j2));
                VelocityTracker velocitytracker = mVelocityTracker;
                velocitytracker.computeCurrentVelocity(1000, mMaximumVelocity);
                int k2 = (int)velocitytracker.getXVelocity(j2);
                int l2 = (int)(f5 - mDownMotionX);
                int i3 = getScaledMeasuredWidth(getPageAt(mCurrentPage));
                boolean flag2;
                if ((float)Math.abs(l2) > 0.4F * (float)i3)
                    flag2 = true;
                else
                    flag2 = false;
                mTotalMotionX = mTotalMotionX + Math.abs((mLastMotionX + mLastMotionXRemainder) - f5);
                boolean flag3;
                if (mTotalMotionX > 25F && Math.abs(k2) > mFlingThresholdVelocity)
                    flag3 = true;
                else
                    flag3 = false;
                int j3 = (float)Math.abs(l2) != 0.33F * (float)i3;
                boolean flag4 = false;
                if (j3 > 0)
                {
                    int i4 = Math.signum(k2) != Math.signum(l2);
                    flag4 = false;
                    if (i4 != 0)
                    {
                        flag4 = false;
                        if (flag3)
                            flag4 = true;
                    }
                }
                if ((flag2 && l2 > 0 && !flag3 || flag3 && k2 > 0) && mCurrentPage > 0)
                {
                    int l3;
                    if (flag4)
                        l3 = mCurrentPage;
                    else
                        l3 = -1 + mCurrentPage;
                    snapToPageWithVelocity(l3, k2);
                } else
                if ((flag2 && l2 < 0 && !flag3 || flag3 && k2 < 0) && mCurrentPage < -1 + getChildCount())
                {
                    int k3;
                    if (flag4)
                        k3 = mCurrentPage;
                    else
                        k3 = 1 + mCurrentPage;
                    snapToPageWithVelocity(k3, k2);
                } else
                {
                    snapToDestination();
                }
            } else
            if (mTouchState == 2)
            {
                int i2 = Math.max(0, -1 + mCurrentPage);
                if (i2 != mCurrentPage)
                    snapToPage(i2);
                else
                    snapToDestination();
            } else
            if (mTouchState == 3)
            {
                int l1 = Math.min(-1 + getChildCount(), 1 + mCurrentPage);
                if (l1 != mCurrentPage)
                    snapToPage(l1);
                else
                    snapToDestination();
            } else
            if (mTouchState == 4)
            {
                mLastMotionX = motionevent.getX();
                mLastMotionY = motionevent.getY();
                float af2[] = mapPointFromViewToParent(this, mLastMotionX, mLastMotionY);
                mParentDownMotionX = af2[0];
                mParentDownMotionY = af2[1];
                updateDragViewTranslationDuringDrag();
                PointF pointf = isFlingingToDelete();
                boolean flag1 = false;
                if (pointf != null)
                {
                    onFlingToDelete(pointf);
                    flag1 = true;
                }
                if (!flag1 && isHoveringOverDeleteDropTarget((int)mParentDownMotionX, (int)mParentDownMotionY))
                    onDropToDelete();
            } else
            {
                onUnhandledTap(motionevent);
            }
            removeCallbacks(mSidePageHoverRunnable);
            resetTouchState();
            break;

        case 2: // '\002'
            if (mTouchState == 1)
            {
                int k1 = motionevent.findPointerIndex(mActivePointerId);
                if (k1 == -1)
                {
                    k1 = 0;
                    mActivePointerId = motionevent.getPointerId(0);
                }
                float f3 = motionevent.getX(k1);
                float f4 = (mLastMotionX + mLastMotionXRemainder) - f3;
                mTotalMotionX = mTotalMotionX + Math.abs(f4);
                if (Math.abs(f4) >= 1.0F)
                {
                    mTouchX = f4 + mTouchX;
                    mSmoothingTime = (float)System.nanoTime() / 1E+009F;
                    if (!mDeferScrollUpdate)
                        scrollBy((int)f4, 0);
                    else
                        invalidate();
                    mLastMotionX = f3;
                    mLastMotionXRemainder = f4 - (float)(int)f4;
                } else
                {
                    awakenScrollBars();
                }
                break;
            }
            if (mTouchState == 4)
            {
                mLastMotionX = motionevent.getX();
                mLastMotionY = motionevent.getY();
                float af1[] = mapPointFromViewToParent(this, mLastMotionX, mLastMotionY);
                mParentDownMotionX = af1[0];
                mParentDownMotionY = af1[1];
                updateDragViewTranslationDuringDrag();
                final int dragViewIndex = indexOfChild(mDragView);
                int k = (int)(REORDERING_SIDE_PAGE_BUFFER_PERCENTAGE * (float)getViewportWidth());
                int l = (int)(mapPointFromViewToParent(this, mViewport.left, 0.0F)[0] + (float)k);
                int i1 = (int)(mapPointFromViewToParent(this, mViewport.right, 0.0F)[0] - (float)k);
                boolean flag = isHoveringOverDeleteDropTarget((int)mParentDownMotionX, (int)mParentDownMotionY);
                setPageHoveringOverDeleteDropTarget(dragViewIndex, flag);
                float f2 = mParentDownMotionX;
                int j1 = -1;
                if (f2 < (float)l && dragViewIndex > 0)
                    j1 = dragViewIndex - 1;
                else
                if (f2 > (float)i1 && dragViewIndex < -1 + getChildCount())
                    j1 = dragViewIndex + 1;
                final int pageUnderPointIndex = j1;
                if (pageUnderPointIndex > -1 && !flag)
                {
                    mTempVisiblePagesRange[0] = 0;
                    mTempVisiblePagesRange[1] = -1 + getPageCount();
                    boundByReorderablePages(true, mTempVisiblePagesRange);
                    if (mTempVisiblePagesRange[0] <= pageUnderPointIndex && pageUnderPointIndex <= mTempVisiblePagesRange[1] && pageUnderPointIndex != mSidePageHoverIndex && mScroller.isFinished())
                    {
                        mSidePageHoverIndex = pageUnderPointIndex;
                        Runnable runnable = new Runnable() {

                            final PagedView this$0;
                            final int val$dragViewIndex;
                            final int val$pageUnderPointIndex;

                            public void run()
                            {
                                mDownScrollX = (float)(getChildOffset(pageUnderPointIndex) - getRelativeChildOffset(pageUnderPointIndex));
                                snapToPage(pageUnderPointIndex);
                                byte byte0;
                                if (dragViewIndex < pageUnderPointIndex)
                                    byte0 = -1;
                                else
                                    byte0 = 1;
                                int j4;
                                if (dragViewIndex < pageUnderPointIndex)
                                    j4 = 1 + dragViewIndex;
                                else
                                    j4 = pageUnderPointIndex;
                                int k4;
                                if (dragViewIndex > pageUnderPointIndex)
                                    k4 = -1 + dragViewIndex;
                                else
                                    k4 = pageUnderPointIndex;
                                for (int l4 = j4; l4 <= k4; l4++)
                                {
                                    View view = getChildAt(l4);
                                    int i5 = getViewportOffsetX() + getChildOffset(l4);
                                    int j5 = getViewportOffsetX() + getChildOffset(l4 + byte0);
                                    AnimatorSet animatorset = (AnimatorSet)view.getTag();
                                    if (animatorset != null)
                                        animatorset.cancel();
                                    view.setTranslationX(i5 - j5);
                                    AnimatorSet animatorset1 = new AnimatorSet();
                                    animatorset1.setDuration(REORDERING_REORDER_REPOSITION_DURATION);
                                    Animator aanimator[] = new Animator[1];
                                    aanimator[0] = ObjectAnimator.ofFloat(view, "translationX", new float[] {
                                        0.0F
                                    });
                                    animatorset1.playTogether(aanimator);
                                    animatorset1.start();
                                    view.setTag(animatorset1);
                                }

                                removeView(mDragView);
                                onRemoveView(mDragView, false);
                                addView(mDragView, pageUnderPointIndex);
                                onAddView(mDragView, pageUnderPointIndex);
                                mSidePageHoverIndex = -1;
                            }

            
            {
                this$0 = PagedView.this;
                pageUnderPointIndex = i;
                dragViewIndex = j;
                super();
            }
                        }
;
                        mSidePageHoverRunnable = runnable;
                        postDelayed(mSidePageHoverRunnable, REORDERING_SIDE_PAGE_HOVER_TIMEOUT);
                    }
                } else
                {
                    removeCallbacks(mSidePageHoverRunnable);
                    mSidePageHoverIndex = -1;
                }
            } else
            {
                determineScrollingStart(motionevent);
            }
            break;

        case 0: // '\0'
            if (!mScroller.isFinished())
                mScroller.abortAnimation();
            float f = motionevent.getX();
            mLastMotionX = f;
            mDownMotionX = f;
            float f1 = motionevent.getY();
            mLastMotionY = f1;
            mDownMotionY = f1;
            mDownScrollX = getScrollX();
            float af[] = mapPointFromViewToParent(this, mLastMotionX, mLastMotionY);
            mParentDownMotionX = af[0];
            mParentDownMotionY = af[1];
            mLastMotionXRemainder = 0.0F;
            mTotalMotionX = 0.0F;
            mActivePointerId = motionevent.getPointerId(0);
            int i = getViewportOffsetX() + mEdgeSwipeRegionSize;
            int j = getMeasuredWidth() - getViewportOffsetX() - mEdgeSwipeRegionSize;
            if (mDownMotionX <= (float)i || mDownMotionX >= (float)j)
                mDownEventOnEdge = true;
            if (mTouchState == 1)
                pageBeginMoving();
            break;
        }
        return true;
    }

    protected void onUnhandledTap(MotionEvent motionevent)
    {
    }

    protected void overScroll(float f)
    {
        dampedOverScroll(f);
    }

    protected void pageBeginMoving()
    {
        if (!mIsPageMoving)
        {
            mIsPageMoving = true;
            onPageBeginMoving();
        }
    }

    protected void pageEndMoving()
    {
        if (mIsPageMoving)
        {
            mIsPageMoving = false;
            onPageEndMoving();
        }
    }

    public boolean performAccessibilityAction(int i, Bundle bundle)
    {
        if (super.performAccessibilityAction(i, bundle))
            return true;
        switch (i)
        {
        default:
            break;

        case 8192: 
            if (getCurrentPage() > 0)
            {
                scrollLeft();
                return true;
            }
            break;

        case 4096: 
            if (getCurrentPage() < -1 + getPageCount())
            {
                scrollRight();
                return true;
            }
            break;
        }
        return false;
    }

    public void requestChildFocus(View view, View view1)
    {
        super.requestChildFocus(view, view1);
        int i = indexToPage(indexOfChild(view));
        if (i >= 0 && i != getCurrentPage() && !isInTouchMode())
            snapToPage(i);
    }

    public boolean requestChildRectangleOnScreen(View view, Rect rect, boolean flag)
    {
        int i = indexToPage(indexOfChild(view));
        if (i == mCurrentPage && mScroller.isFinished())
        {
            return false;
        } else
        {
            snapToPage(i);
            return true;
        }
    }

    protected void screenScrolled(int i)
    {
    }

    public void scrollBy(int i, int j)
    {
        scrollTo(i + mUnboundedScrollX, j + getScrollY());
    }

    public void scrollLeft()
    {
        if (mScroller.isFinished())
        {
            if (mCurrentPage > 0)
                snapToPage(-1 + mCurrentPage);
        } else
        if (mNextPage > 0)
        {
            snapToPage(-1 + mNextPage);
            return;
        }
    }

    public void scrollRight()
    {
        if (mScroller.isFinished())
        {
            if (mCurrentPage < -1 + getChildCount())
                snapToPage(1 + mCurrentPage);
        } else
        if (mNextPage < -1 + getChildCount())
        {
            snapToPage(1 + mNextPage);
            return;
        }
    }

    public void scrollTo(int i, int j)
    {
        mUnboundedScrollX = i;
        if (i < 0)
        {
            super.scrollTo(0, j);
            if (mAllowOverScroll)
                overScroll(i);
        } else
        if (i > mMaxScrollX)
        {
            super.scrollTo(mMaxScrollX, j);
            if (mAllowOverScroll)
                overScroll(i - mMaxScrollX);
        } else
        {
            mOverScrollX = i;
            super.scrollTo(i, j);
        }
        mTouchX = i;
        mSmoothingTime = (float)System.nanoTime() / 1E+009F;
        if (isReordering(true))
        {
            float af[] = mapPointFromParentToView(this, mParentDownMotionX, mParentDownMotionY);
            mLastMotionX = af[0];
            mLastMotionY = af[1];
            updateDragViewTranslationDuringDrag();
        }
    }

    void setCurrentPage(int i)
    {
        notifyPageSwitching(i);
        if (!mScroller.isFinished())
            mScroller.abortAnimation();
        if (getChildCount() == 0)
        {
            return;
        } else
        {
            mForceScreenScrolled = true;
            mCurrentPage = Math.max(0, Math.min(i, -1 + getPageCount()));
            updateCurrentPageScroll();
            updateScrollingIndicator();
            notifyPageSwitched();
            invalidate();
            return;
        }
    }

    protected void setDataIsReady()
    {
        mIsDataReady = true;
    }

    void setDeleteDropTarget(View view)
    {
        mDeleteDropTarget = view;
    }

    public void setMinScale(float f)
    {
        mMinScale = f;
        requestLayout();
    }

    public void setOnLongClickListener(android.view.View.OnLongClickListener onlongclicklistener)
    {
        mLongClickListener = onlongclicklistener;
        int i = getPageCount();
        for (int j = 0; j < i; j++)
            getPageAt(j).setOnLongClickListener(onlongclicklistener);

    }

    public void setOnlyAllowEdgeSwipes(boolean flag)
    {
        mOnlyAllowEdgeSwipes = flag;
    }

    protected void setPageHoveringOverDeleteDropTarget(int i, boolean flag)
    {
    }

    public void setPageSpacing(int i)
    {
        mPageSpacing = i;
        invalidateCachedOffsets();
    }

    public void setPageSwitchListener(PageSwitchListener pageswitchlistener)
    {
        mPageSwitchListener = pageswitchlistener;
        if (mPageSwitchListener != null)
            mPageSwitchListener.onPageSwitched(getPageAt(mCurrentPage), mCurrentPage);
    }

    public void setScaleX(float f)
    {
        super.setScaleX(f);
        if (isReordering(true))
        {
            float af[] = mapPointFromParentToView(this, mParentDownMotionX, mParentDownMotionY);
            mLastMotionX = af[0];
            mLastMotionY = af[1];
            updateDragViewTranslationDuringDrag();
        }
    }

    protected boolean shouldDrawChild(View view)
    {
        return view.getAlpha() > 0.0F;
    }

    protected boolean shouldSetTopAlignedPivotForWidget(int i)
    {
        return mTopAlignPageWhenShrinkingForBouncer;
    }

    protected void showScrollingIndicator(boolean flag)
    {
        mShouldShowScrollIndicator = true;
        mShouldShowScrollIndicatorImmediately = true;
        if (getChildCount() > 1 && isScrollingIndicatorEnabled())
        {
            mShouldShowScrollIndicator = false;
            getScrollingIndicator();
            if (mScrollIndicator != null)
            {
                updateScrollingIndicatorPosition();
                mScrollIndicator.setVisibility(0);
                cancelScrollingIndicatorAnimations();
                if (flag)
                {
                    mScrollIndicator.setAlpha(1.0F);
                    return;
                } else
                {
                    mScrollIndicatorAnimator = ObjectAnimator.ofFloat(mScrollIndicator, "alpha", new float[] {
                        1.0F
                    });
                    mScrollIndicatorAnimator.setDuration(150L);
                    mScrollIndicatorAnimator.start();
                    return;
                }
            }
        }
    }

    protected void snapToDestination()
    {
        snapToPage(getPageNearestToCenterOfScreen(), 750);
    }

    protected void snapToPage(int i)
    {
        snapToPage(i, 750);
    }

    protected void snapToPage(int i, int j)
    {
        snapToPage(i, j, false);
    }

    protected void snapToPage(int i, int j, int k)
    {
        snapToPage(i, j, k, false);
    }

    protected void snapToPage(int i, int j, int k, boolean flag)
    {
        mNextPage = i;
        notifyPageSwitching(i);
        View view = getFocusedChild();
        if (view != null && i != mCurrentPage && view == getPageAt(mCurrentPage))
            view.clearFocus();
        pageBeginMoving();
        awakenScrollBars(k);
        if (flag)
            k = 0;
        else
        if (k == 0)
            k = Math.abs(j);
        if (!mScroller.isFinished())
            mScroller.abortAnimation();
        mScroller.startScroll(mUnboundedScrollX, 0, j, 0, k);
        notifyPageSwitched();
        if (flag)
            computeScroll();
        mForceScreenScrolled = true;
        invalidate();
    }

    protected void snapToPage(int i, int j, boolean flag)
    {
        int k = Math.max(0, Math.min(i, -1 + getPageCount()));
        snapToPage(k, getChildOffset(k) - getRelativeChildOffset(k) - mUnboundedScrollX, j, flag);
    }

    protected void snapToPageImmediately(int i)
    {
        snapToPage(i, 750, true);
    }

    protected void snapToPageWithVelocity(int i, int j)
    {
        int k = Math.max(0, Math.min(i, -1 + getChildCount()));
        int l = getViewportWidth() / 2;
        int i1 = getChildOffset(k) - getRelativeChildOffset(k) - mUnboundedScrollX;
        if (Math.abs(j) < mMinFlingVelocity)
        {
            snapToPage(k, 750);
            return;
        } else
        {
            float f = Math.min(1.0F, (1.0F * (float)Math.abs(i1)) / (float)(l * 2));
            float f1 = (float)l + (float)l * distanceInfluenceForSnapDuration(f);
            int j1 = Math.abs(j);
            snapToPage(k, i1, 4 * Math.round(1000F * Math.abs(f1 / (float)Math.max(mMinSnapVelocity, j1))));
            return;
        }
    }

    public boolean startReordering()
    {
        int i = getPageNearestToCenterOfScreen();
        mTempVisiblePagesRange[0] = 0;
        mTempVisiblePagesRange[1] = -1 + getPageCount();
        boundByReorderablePages(true, mTempVisiblePagesRange);
        mReorderingStarted = true;
        if (mTempVisiblePagesRange[0] <= i && i <= mTempVisiblePagesRange[1])
        {
            if (zoomOut())
            {
                mDragView = getChildAt(i);
                onStartReordering();
            }
            return true;
        } else
        {
            return false;
        }
    }

    protected void updateCurrentPageScroll()
    {
        int i = getChildOffset(mCurrentPage) - getRelativeChildOffset(mCurrentPage);
        scrollTo(i, 0);
        mScroller.setFinalX(i);
        mScroller.forceFinished(true);
    }

    void updateDragViewTranslationDuringDrag()
    {
        float f = ((mLastMotionX - mDownMotionX) + (float)getScrollX()) - mDownScrollX;
        float f1 = mLastMotionY - mDownMotionY;
        mDragView.setTranslationX(f);
        mDragView.setTranslationY(f1);
    }

    protected boolean zoomIn(final Runnable onCompleteRunnable)
    {
        if (mZoomInOutAnim != null && mZoomInOutAnim.isRunning())
            mZoomInOutAnim.cancel();
        boolean flag;
        if (getScaleX() >= 1.0F && getScaleY() >= 1.0F)
        {
            flag = false;
            if (onCompleteRunnable != null)
            {
                onCompleteRunnable.run();
                return false;
            }
        } else
        {
            mZoomInOutAnim = new AnimatorSet();
            mZoomInOutAnim.setDuration(REORDERING_ZOOM_IN_OUT_DURATION);
            AnimatorSet animatorset = mZoomInOutAnim;
            Animator aanimator[] = new Animator[2];
            aanimator[0] = ObjectAnimator.ofFloat(this, "scaleX", new float[] {
                1.0F
            });
            aanimator[1] = ObjectAnimator.ofFloat(this, "scaleY", new float[] {
                1.0F
            });
            animatorset.playTogether(aanimator);
            mZoomInOutAnim.addListener(new AnimatorListenerAdapter() {

                final PagedView this$0;
                final Runnable val$onCompleteRunnable;

                public void onAnimationCancel(Animator animator)
                {
                    setPageHoveringOverDeleteDropTarget(indexOfChild(mDragView), false);
                    mDragView = null;
                }

                public void onAnimationEnd(Animator animator)
                {
                    mDragView = null;
                    if (onCompleteRunnable != null)
                        onCompleteRunnable.run();
                }

                public void onAnimationStart(Animator animator)
                {
                    setPageHoveringOverDeleteDropTarget(indexOfChild(mDragView), false);
                    if (mDeleteDropTarget != null)
                        mDeleteDropTarget.animate().alpha(0.0F).setDuration(REORDERING_DELETE_DROP_TARGET_FADE_DURATION).setListener(new AnimatorListenerAdapter() {

                            final _cls8 this$1;

                            public void onAnimationEnd(Animator animator)
                            {
                                mDeleteDropTarget.setVisibility(8);
                            }

            
            {
                this$1 = _cls8.this;
                super();
            }
                        }
);
                }

            
            {
                this$0 = PagedView.this;
                onCompleteRunnable = runnable;
                super();
            }
            }
);
            mZoomInOutAnim.start();
            flag = true;
        }
        return flag;
    }

    protected boolean zoomOut()
    {
        if (mZoomInOutAnim != null && mZoomInOutAnim.isRunning())
            mZoomInOutAnim.cancel();
        if (getScaleX() >= 1.0F && getScaleY() >= 1.0F)
        {
            mZoomInOutAnim = new AnimatorSet();
            mZoomInOutAnim.setDuration(REORDERING_ZOOM_IN_OUT_DURATION);
            AnimatorSet animatorset = mZoomInOutAnim;
            Animator aanimator[] = new Animator[2];
            float af[] = new float[1];
            af[0] = mMinScale;
            aanimator[0] = ObjectAnimator.ofFloat(this, "scaleX", af);
            float af1[] = new float[1];
            af1[0] = mMinScale;
            aanimator[1] = ObjectAnimator.ofFloat(this, "scaleY", af1);
            animatorset.playTogether(aanimator);
            mZoomInOutAnim.addListener(new AnimatorListenerAdapter() {

                final PagedView this$0;

                public void onAnimationStart(Animator animator)
                {
                    if (mDeleteDropTarget != null)
                    {
                        mDeleteDropTarget.setVisibility(0);
                        mDeleteDropTarget.animate().alpha(1.0F).setDuration(REORDERING_DELETE_DROP_TARGET_FADE_DURATION).setListener(new AnimatorListenerAdapter() {

                            final _cls5 this$1;

                            public void onAnimationStart(Animator animator)
                            {
                                mDeleteDropTarget.setAlpha(0.0F);
                            }

            
            {
                this$1 = _cls5.this;
                super();
            }
                        }
);
                    }
                }

            
            {
                this$0 = PagedView.this;
                super();
            }
            }
);
            mZoomInOutAnim.start();
            return true;
        } else
        {
            return false;
        }
    }


/*
    static float access$002(PagedView pagedview, float f)
    {
        pagedview.mDownScrollX = f;
        return f;
    }

*/


/*
    static int access$102(PagedView pagedview, int i)
    {
        pagedview.mSidePageHoverIndex = i;
        return i;
    }

*/







/*
    static boolean access$802(PagedView pagedview, boolean flag)
    {
        pagedview.mDeferringForDelete = flag;
        return flag;
    }

*/

}
