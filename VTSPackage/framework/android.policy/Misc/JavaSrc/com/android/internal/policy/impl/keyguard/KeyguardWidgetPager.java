// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.appwidget.AppWidgetHostView;
import android.appwidget.AppWidgetProviderInfo;
import android.content.Context;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.AttributeSet;
import android.util.Slog;
import android.view.*;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.DecelerateInterpolator;
import com.android.internal.widget.LockPatternUtils;
import java.util.ArrayList;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            PagedView, KeyguardUtils, KeyguardWidgetFrame, KeyguardStatusView, 
//            KeyguardMultiUserSelectorView, CameraWidgetFrame, KeyguardViewStateManager, SlidingChallengeLayout

public class KeyguardWidgetPager extends PagedView
    implements PagedView.PageSwitchListener, android.view.View.OnLongClickListener, ChallengeLayout.OnBouncerStateChangedListener
{
    public static interface Callbacks
    {

        public abstract void onAddView(View view);

        public abstract void onRemoveView(View view, boolean flag);

        public abstract void onRemoveViewAnimationCompleted();

        public abstract void onUserActivityTimeoutChanged();

        public abstract void userActivity();
    }

    static class ZInterpolator
        implements TimeInterpolator
    {

        private float focalLength;

        public float getInterpolation(float f)
        {
            return (1.0F - focalLength / (f + focalLength)) / (1.0F - focalLength / (1.0F + focalLength));
        }

        public ZInterpolator(float f)
        {
            focalLength = f;
        }
    }


    private static float CAMERA_DISTANCE = 0F;
    public static final int CHILDREN_OUTLINE_FADE_IN_DURATION = 100;
    public static final int CHILDREN_OUTLINE_FADE_OUT_DURATION = 375;
    private static final long CUSTOM_WIDGET_USER_ACTIVITY_TIMEOUT = 30000L;
    protected static float OVERSCROLL_MAX_ROTATION = 0F;
    private static final boolean PERFORM_OVERSCROLL_ROTATION = true;
    private static final String TAG = "KeyguardWidgetPager";
    private float BOUNCER_SCALE_FACTOR;
    private View mAddWidgetView;
    private final Handler mBackgroundWorkerHandler;
    private final HandlerThread mBackgroundWorkerThread;
    private int mBouncerZoomInOutDuration;
    private Callbacks mCallbacks;
    private boolean mCenterSmallWidgetsVertically;
    protected AnimatorSet mChildrenOutlineFadeAnimation;
    private boolean mDisableWidgetFeature;
    private boolean mHasMeasure;
    private int mLastHeightMeasureSpec;
    private int mLastWidthMeasureSpec;
    private LockPatternUtils mLockPatternUtils;
    private int mPage;
    protected int mScreenCenter;
    protected boolean mShowingInitialHints;
    private boolean mStatusWidgetIsCompletelyShown;
    protected KeyguardViewStateManager mViewStateManager;
    private int mWidgetToResetAfterFadeOut;
    ZInterpolator mZInterpolator;
    boolean showHintsAfterLayout;

    public KeyguardWidgetPager(Context context)
    {
        this(null, null, 0);
    }

    public KeyguardWidgetPager(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public KeyguardWidgetPager(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mZInterpolator = new ZInterpolator(0.5F);
        mHasMeasure = false;
        showHintsAfterLayout = false;
        mPage = 0;
        mShowingInitialHints = false;
        mBouncerZoomInOutDuration = 250;
        BOUNCER_SCALE_FACTOR = 0.67F;
        mStatusWidgetIsCompletelyShown = true;
        boolean flag = KeyguardUtils.isMediatekLCASupport();
        boolean flag1 = false;
        if (flag)
            flag1 = true;
        mDisableWidgetFeature = flag1;
        if (getImportantForAccessibility() == 0)
            setImportantForAccessibility(1);
        setPageSwitchListener(this);
        mBackgroundWorkerThread = new HandlerThread("KeyguardWidgetPager Worker");
        mBackgroundWorkerThread.start();
        mBackgroundWorkerHandler = new Handler(mBackgroundWorkerThread.getLooper());
    }

    private boolean captureUserInteraction(MotionEvent motionevent)
    {
        KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(getCurrentPage());
        return keyguardwidgetframe != null && keyguardwidgetframe.onUserInteraction(motionevent);
    }

    private void enforceKeyguardWidgetFrame(View view)
    {
        if (!(view instanceof KeyguardWidgetFrame))
            throw new IllegalArgumentException("KeyguardWidgetPager children must be KeyguardWidgetFrames");
        else
            return;
    }

    private void updatePageAlphaValues(int i)
    {
    }

    private void updateWidgetFrameImportantForAccessibility(KeyguardWidgetFrame keyguardwidgetframe)
    {
        if (keyguardwidgetframe.getContentAlpha() <= 0.0F)
        {
            keyguardwidgetframe.setImportantForAccessibility(2);
            return;
        } else
        {
            keyguardwidgetframe.setImportantForAccessibility(1);
            return;
        }
    }

    private void updateWidgetFramesImportantForAccessibility()
    {
        int i = getPageCount();
        for (int j = 0; j < i; j++)
            updateWidgetFrameImportantForAccessibility(getWidgetPageAt(j));

    }

    private void userActivity()
    {
        if (mCallbacks != null)
        {
            mCallbacks.onUserActivityTimeoutChanged();
            mCallbacks.userActivity();
        }
    }

    public void addView(View view, int i)
    {
        enforceKeyguardWidgetFrame(view);
        super.addView(view, i);
    }

    public void addView(View view, int i, int j)
    {
        enforceKeyguardWidgetFrame(view);
        super.addView(view, i, j);
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutparams)
    {
        enforceKeyguardWidgetFrame(view);
        super.addView(view, i, layoutparams);
    }

    public void addView(View view, android.view.ViewGroup.LayoutParams layoutparams)
    {
        enforceKeyguardWidgetFrame(view);
        super.addView(view, layoutparams);
    }

    public void addWidget(View view)
    {
        addWidget(view, -1);
    }

    public void addWidget(View view, int i)
    {
        KeyguardWidgetFrame keyguardwidgetframe;
        if (!(view instanceof KeyguardWidgetFrame))
        {
            keyguardwidgetframe = new KeyguardWidgetFrame(getContext());
            android.widget.FrameLayout.LayoutParams layoutparams1 = new android.widget.FrameLayout.LayoutParams(-1, -1);
            layoutparams1.gravity = 48;
            view.setPadding(0, 0, 0, 0);
            keyguardwidgetframe.addView(view, layoutparams1);
            if (view instanceof AppWidgetHostView)
                if ((2 & ((AppWidgetHostView)view).getAppWidgetInfo().resizeMode) != 0)
                {
                    keyguardwidgetframe.setWidgetLockedSmall(false);
                } else
                {
                    keyguardwidgetframe.setWidgetLockedSmall(true);
                    if (mCenterSmallWidgetsVertically)
                        layoutparams1.gravity = 17;
                }
        } else
        {
            keyguardwidgetframe = (KeyguardWidgetFrame)view;
        }
        android.view.ViewGroup.LayoutParams layoutparams = new android.view.ViewGroup.LayoutParams(-1, -1);
        keyguardwidgetframe.setOnLongClickListener(this);
        keyguardwidgetframe.setWorkerHandler(mBackgroundWorkerHandler);
        if (i == -1)
            addView(keyguardwidgetframe, layoutparams);
        else
            addView(keyguardwidgetframe, i, layoutparams);
        View view1;
        if (view == keyguardwidgetframe)
            view1 = keyguardwidgetframe.getContent();
        else
            view1 = view;
        if (view1 != null)
        {
            Context context = mContext;
            Object aobj[] = new Object[1];
            aobj[0] = view1.getContentDescription();
            keyguardwidgetframe.setContentDescription(context.getString(0x1040322, aobj));
        }
        updateWidgetFrameImportantForAccessibility(keyguardwidgetframe);
    }

    void animateOutlinesAndSidePages(boolean flag)
    {
        animateOutlinesAndSidePages(flag, -1);
    }

    void animateOutlinesAndSidePages(final boolean show, int i)
    {
        KeyguardUtils.xlogD("KeyguardWidgetPager", (new StringBuilder()).append("animateOutlinesAndSidePages show=").append(show).append(", duration=").append(i).toString());
        if (mChildrenOutlineFadeAnimation != null)
        {
            KeyguardUtils.xlogD("KeyguardWidgetPager", "animateOutlinesAndSidePages mChildrenOutlineFadeAnimation != null, cancel it");
            mChildrenOutlineFadeAnimation.cancel();
            mChildrenOutlineFadeAnimation = null;
        }
        int j = getChildCount();
        ArrayList arraylist = new ArrayList();
        if (i == -1)
            if (show)
                i = 100;
            else
                i = 375;
        int k = getNextPage();
        for (int l = 0; l < j; l++)
        {
            float f;
            if (show)
                f = getAlphaForPage(mScreenCenter, l, true);
            else
            if (!show && l == k)
                f = 1.0F;
            else
                f = 0.0F;
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(l);
            arraylist.add(ObjectAnimator.ofPropertyValuesHolder(keyguardwidgetframe, new PropertyValuesHolder[] {
                PropertyValuesHolder.ofFloat("contentAlpha", new float[] {
                    f
                })
            }));
            float f1;
            if (show)
                f1 = getOutlineAlphaForPage(mScreenCenter, l, true);
            else
                f1 = 0.0F;
            keyguardwidgetframe.fadeFrame(this, show, f1, i);
        }

        mChildrenOutlineFadeAnimation = new AnimatorSet();
        mChildrenOutlineFadeAnimation.playTogether(arraylist);
        mChildrenOutlineFadeAnimation.setDuration(i);
        mChildrenOutlineFadeAnimation.addListener(new AnimatorListenerAdapter() {

            final KeyguardWidgetPager this$0;
            final boolean val$show;

            public void onAnimationEnd(Animator animator)
            {
                KeyguardUtils.xlogD("KeyguardWidgetPager", (new StringBuilder()).append("animateOutlinesAndSidePages onAnimationEnd show=").append(show).toString());
                if (!show)
                {
                    disablePageContentLayers();
                    KeyguardWidgetFrame keyguardwidgetframe1 = getWidgetPageAt(mWidgetToResetAfterFadeOut);
                    if (keyguardwidgetframe1 != null && (keyguardwidgetframe1 != getWidgetPageAt(mCurrentPage) || !mViewStateManager.isChallengeOverlapping()))
                        keyguardwidgetframe1.resetSize();
                    mWidgetToResetAfterFadeOut = -1;
                    mShowingInitialHints = false;
                }
                updateWidgetFramesImportantForAccessibility();
            }

            public void onAnimationStart(Animator animator)
            {
                KeyguardUtils.xlogD("KeyguardWidgetPager", (new StringBuilder()).append("animateOutlinesAndSidePages onAnimationStart show=").append(show).toString());
                if (show)
                    enablePageContentLayers();
            }

            
            {
                this$0 = KeyguardWidgetPager.this;
                show = flag;
                super();
            }
        }
);
        mChildrenOutlineFadeAnimation.start();
    }

    float backgroundAlphaInterpolator(float f)
    {
        return Math.min(1.0F, f);
    }

    void boundByReorderablePages(boolean flag, int ai[])
    {
        if (flag)
        {
            for (; ai[1] >= ai[0] && !isWidgetPage(ai[1]); ai[1] = -1 + ai[1]);
            for (; ai[0] <= ai[1] && !isWidgetPage(ai[0]); ai[0] = 1 + ai[0]);
        }
    }

    protected void disablePageContentLayers()
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            getWidgetPageAt(j).disableHardwareLayersForContent();

    }

    protected void enablePageContentLayers()
    {
        int i = getChildCount();
        for (int j = 0; j < i; j++)
            getWidgetPageAt(j).enableHardwareLayersForContent();

    }

    public float getAlphaForPage(int i, int j, boolean flag)
    {
        return flag || j == mCurrentPage ? 1.0F : 0.0F;
    }

    public float getOutlineAlphaForPage(int i, int j, boolean flag)
    {
        if (flag)
            return 0.6F * getAlphaForPage(i, j, flag);
        else
            return 0.0F;
    }

    public long getUserActivityTimeout()
    {
        View view = getPageAt(mPage);
        if (view instanceof ViewGroup)
        {
            View view1 = ((ViewGroup)view).getChildAt(0);
            if (!(view1 instanceof KeyguardStatusView) && !(view1 instanceof KeyguardMultiUserSelectorView))
                return 30000L;
        }
        return -1L;
    }

    public KeyguardWidgetFrame getWidgetPageAt(int i)
    {
        return (KeyguardWidgetFrame)getChildAt(i);
    }

    public int getWidgetPageIndex(View view)
    {
        if (view instanceof KeyguardWidgetFrame)
            return indexOfChild(view);
        else
            return indexOfChild((KeyguardWidgetFrame)view.getParent());
    }

    public int getWidgetToResetOnPageFadeOut()
    {
        return mWidgetToResetAfterFadeOut;
    }

    void hideOutlinesAndSidePages()
    {
        KeyguardUtils.xlogD("KeyguardWidgetPager", "hideOutlinesAndSidePages");
        animateOutlinesAndSidePages(false);
    }

    boolean isAddPage(int i)
    {
        View view = getChildAt(i);
        return view != null && view.getId() == 0x10202a8;
    }

    boolean isCameraPage(int i)
    {
        View view = getChildAt(i);
        return view != null && (view instanceof CameraWidgetFrame);
    }

    protected boolean isOverScrollChild(int i, float f)
    {
        boolean flag;
        if (mOverScrollX >= 0 && mOverScrollX <= mMaxScrollX)
            flag = false;
        else
            flag = true;
        return flag && (i == 0 && f < 0.0F || i == -1 + getChildCount() && f > 0.0F);
    }

    public boolean isWidgetPage(int i)
    {
        if (i >= 0 && i < getChildCount())
        {
            View view = getChildAt(i);
            if (view != null && (view instanceof KeyguardWidgetFrame) && ((KeyguardWidgetFrame)view).getContentAppWidgetId() != 0)
                return true;
        }
        return false;
    }

    public void onAddView(View view, final int index)
    {
        final int appWidgetId = ((KeyguardWidgetFrame)view).getContentAppWidgetId();
        final int pagesRange[] = new int[mTempVisiblePagesRange.length];
        getVisiblePages(pagesRange);
        boundByReorderablePages(true, pagesRange);
        if (mCallbacks != null)
            mCallbacks.onAddView(view);
        mBackgroundWorkerHandler.post(new Runnable() {

            final KeyguardWidgetPager this$0;
            final int val$appWidgetId;
            final int val$index;
            final int val$pagesRange[];

            public void run()
            {
                mLockPatternUtils.addAppWidget(appWidgetId, index - pagesRange[0]);
            }

            
            {
                this$0 = KeyguardWidgetPager.this;
                appWidgetId = i;
                index = j;
                pagesRange = ai;
                super();
            }
        }
);
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mHasMeasure = false;
    }

    public void onBouncerStateChanged(boolean flag)
    {
        if (flag)
        {
            zoomOutToBouncer();
            return;
        } else
        {
            zoomInFromBouncer();
            return;
        }
    }

    protected void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        mBackgroundWorkerThread.quit();
    }

    protected void onEndReordering()
    {
        super.onEndReordering();
        hideOutlinesAndSidePages();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        return captureUserInteraction(motionevent) || super.onInterceptTouchEvent(motionevent);
    }

    public boolean onLongClick(View view)
    {
        boolean flag;
        if (mViewStateManager.isChallengeShowing() && mViewStateManager.isChallengeOverlapping())
            flag = true;
        else
            flag = false;
        return mDisableWidgetFeature || !flag && startReordering();
    }

    protected void onMeasure(int i, int j)
    {
        mLastWidthMeasureSpec = i;
        mLastHeightMeasureSpec = j;
        View view = (View)getParent();
        if (view.getParent() instanceof SlidingChallengeLayout)
        {
            SlidingChallengeLayout slidingchallengelayout = (SlidingChallengeLayout)view.getParent();
            int k = slidingchallengelayout.getMaxChallengeTop() - getPaddingTop();
            boolean flag = slidingchallengelayout.isChallengeShowing();
            int l = getChildCount();
            for (int i1 = 0; i1 < l; i1++)
            {
                KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(i1);
                keyguardwidgetframe.setMaxChallengeTop(k);
                if (flag && i1 == mCurrentPage && !mHasMeasure)
                    keyguardwidgetframe.shrinkWidget();
            }

        }
        super.onMeasure(i, j);
        mHasMeasure = true;
    }

    protected void onPageBeginMoving()
    {
        if (mViewStateManager != null)
            mViewStateManager.onPageBeginMoving();
        if (!isReordering(false))
            showOutlinesAndSidePages();
        userActivity();
    }

    protected void onPageEndMoving()
    {
        if (mViewStateManager != null)
            mViewStateManager.onPageEndMoving();
        if (!isReordering(false))
            hideOutlinesAndSidePages();
    }

    public void onPageSwitched(View view, int i)
    {
        boolean flag = view instanceof ViewGroup;
        boolean flag1 = false;
        if (flag)
        {
            boolean flag2 = ((ViewGroup)view).getChildAt(0) instanceof KeyguardStatusView;
            flag1 = false;
            if (flag2)
                flag1 = true;
        }
        if (flag1 && mStatusWidgetIsCompletelyShown)
            setSystemUiVisibility(0x800000 | getSystemUiVisibility());
        else
            setSystemUiVisibility(0xff7fffff & getSystemUiVisibility());
        if (mPage != i)
        {
            int j = mPage;
            mPage = i;
            userActivity();
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            if (keyguardwidgetframe != null)
                keyguardwidgetframe.onActive(false);
            KeyguardWidgetFrame keyguardwidgetframe1 = getWidgetPageAt(i);
            if (keyguardwidgetframe1 != null)
            {
                keyguardwidgetframe1.onActive(true);
                keyguardwidgetframe1.requestAccessibilityFocus();
            }
            if (mParent != null && AccessibilityManager.getInstance(mContext).isEnabled())
            {
                AccessibilityEvent accessibilityevent = AccessibilityEvent.obtain(4096);
                onInitializeAccessibilityEvent(accessibilityevent);
                onPopulateAccessibilityEvent(accessibilityevent);
                mParent.requestSendAccessibilityEvent(this, accessibilityevent);
            }
        }
        if (mViewStateManager != null)
            mViewStateManager.onPageSwitched(view, i);
    }

    public void onPageSwitching(View view, int i)
    {
        if (mViewStateManager != null)
            mViewStateManager.onPageSwitching(view, i);
    }

    public void onRemoveView(View view, boolean flag)
    {
        final int appWidgetId = ((KeyguardWidgetFrame)view).getContentAppWidgetId();
        if (mCallbacks != null)
            mCallbacks.onRemoveView(view, flag);
        mBackgroundWorkerHandler.post(new Runnable() {

            final KeyguardWidgetPager this$0;
            final int val$appWidgetId;

            public void run()
            {
                mLockPatternUtils.removeAppWidget(appWidgetId);
            }

            
            {
                this$0 = KeyguardWidgetPager.this;
                appWidgetId = i;
                super();
            }
        }
);
    }

    public void onRemoveViewAnimationCompleted()
    {
        if (mCallbacks != null)
            mCallbacks.onRemoveViewAnimationCompleted();
    }

    protected void onStartReordering()
    {
        super.onStartReordering();
        enablePageContentLayers();
        reorderStarting();
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        return captureUserInteraction(motionevent) || super.onTouchEvent(motionevent);
    }

    protected void onUnhandledTap(MotionEvent motionevent)
    {
        showPagingFeedback();
    }

    protected void overScroll(float f)
    {
        acceleratedOverScroll(f);
    }

    public void removeWidget(View view)
    {
        if (view instanceof KeyguardWidgetFrame)
        {
            removeView(view);
            return;
        }
        int i = getWidgetPageIndex(view);
        if (i != -1)
        {
            KeyguardWidgetFrame keyguardwidgetframe = (KeyguardWidgetFrame)getChildAt(i);
            keyguardwidgetframe.removeView(view);
            removeView(keyguardwidgetframe);
            return;
        } else
        {
            Slog.w("KeyguardWidgetPager", (new StringBuilder()).append("removeWidget() can't find:").append(view).toString());
            return;
        }
    }

    protected void reorderStarting()
    {
        showOutlinesAndSidePages();
    }

    protected void screenScrolled(int i)
    {
        mScreenCenter = i;
        updatePageAlphaValues(i);
        for (int j = 0; j < getChildCount(); j++)
        {
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            if (keyguardwidgetframe == mDragView || keyguardwidgetframe == null)
                continue;
            float f = getScrollProgress(i, keyguardwidgetframe, j);
            keyguardwidgetframe.setCameraDistance(mDensity * CAMERA_DISTANCE);
            if (isOverScrollChild(j, f) && !mDisableWidgetFeature)
            {
                float f1 = keyguardwidgetframe.getMeasuredWidth() / 2;
                float f2 = keyguardwidgetframe.getMeasuredHeight() / 2;
                keyguardwidgetframe.setPivotX(f1);
                keyguardwidgetframe.setPivotY(f2);
                keyguardwidgetframe.setRotationY(f * -OVERSCROLL_MAX_ROTATION);
                float f3 = Math.abs(f);
                boolean flag;
                if (f < 0.0F)
                    flag = true;
                else
                    flag = false;
                keyguardwidgetframe.setOverScrollAmount(f3, flag);
            } else
            {
                keyguardwidgetframe.setRotationY(0.0F);
                keyguardwidgetframe.setOverScrollAmount(0.0F, false);
            }
            if (keyguardwidgetframe.getAlpha() == 0.0F)
            {
                keyguardwidgetframe.setVisibility(4);
                continue;
            }
            if (keyguardwidgetframe.getVisibility() != 0)
                keyguardwidgetframe.setVisibility(0);
        }

    }

    public void sendAccessibilityEvent(int i)
    {
        if (i != 4096 || isPageMoving())
            super.sendAccessibilityEvent(i);
    }

    void setAddWidgetEnabled(boolean flag)
    {
        if (mAddWidgetView != null && flag)
        {
            addView(mAddWidgetView, 0);
            measure(mLastWidthMeasureSpec, mLastHeightMeasureSpec);
            setCurrentPage(1 + mCurrentPage);
            mAddWidgetView = null;
        } else
        if (mAddWidgetView == null && !flag)
        {
            View view = findViewById(0x10202a8);
            if (view != null)
            {
                mAddWidgetView = view;
                removeView(view);
                return;
            }
        }
    }

    void setBouncerAnimationDuration(int i)
    {
        mBouncerZoomInOutDuration = i;
    }

    public void setCallbacks(Callbacks callbacks)
    {
        mCallbacks = callbacks;
    }

    void setCurrentPage(int i)
    {
        super.setCurrentPage(i);
        updateWidgetFramesImportantForAccessibility();
    }

    public void setLockPatternUtils(LockPatternUtils lockpatternutils)
    {
        mLockPatternUtils = lockpatternutils;
    }

    protected void setPageHoveringOverDeleteDropTarget(int i, boolean flag)
    {
        KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(i);
        if (keyguardwidgetframe != null)
            keyguardwidgetframe.setIsHoveringOverDeleteDropTarget(flag);
    }

    public void setStatusWidgetIsCompletelyShown(boolean flag)
    {
        mStatusWidgetIsCompletelyShown = flag;
    }

    public void setViewStateManager(KeyguardViewStateManager keyguardviewstatemanager)
    {
        mViewStateManager = keyguardviewstatemanager;
    }

    public void setWidgetToResetOnPageFadeOut(int i)
    {
        mWidgetToResetAfterFadeOut = i;
    }

    protected boolean shouldSetTopAlignedPivotForWidget(int i)
    {
        return !isCameraPage(i) && super.shouldSetTopAlignedPivotForWidget(i);
    }

    public void showInitialPageHints()
    {
        mShowingInitialHints = true;
        int i = getChildCount();
        KeyguardUtils.xlogD("KeyguardWidgetPager", (new StringBuilder()).append("showInitialPageHints childCount=").append(i).append(", mCurrentPage=").append(mCurrentPage).toString());
        for (int j = 0; j < i; j++)
        {
            KeyguardWidgetFrame keyguardwidgetframe = getWidgetPageAt(j);
            if (j != mCurrentPage)
            {
                keyguardwidgetframe.setBackgroundAlpha(0.6F);
                keyguardwidgetframe.setContentAlpha(0.0F);
            } else
            {
                keyguardwidgetframe.setBackgroundAlpha(0.0F);
                keyguardwidgetframe.setContentAlpha(1.0F);
            }
        }

    }

    void showOutlinesAndSidePages()
    {
        KeyguardUtils.xlogD("KeyguardWidgetPager", "showOutlinesAndSidePages");
        animateOutlinesAndSidePages(true);
    }

    public void showPagingFeedback()
    {
    }

    void zoomInFromBouncer()
    {
        if (mZoomInOutAnim != null && mZoomInOutAnim.isRunning())
            mZoomInOutAnim.cancel();
        View view = getPageAt(getCurrentPage());
        if (view.getScaleX() < 1.0F || view.getScaleY() < 1.0F)
        {
            mZoomInOutAnim = new AnimatorSet();
            AnimatorSet animatorset = mZoomInOutAnim;
            Animator aanimator[] = new Animator[2];
            aanimator[0] = ObjectAnimator.ofFloat(view, "scaleX", new float[] {
                1.0F
            });
            aanimator[1] = ObjectAnimator.ofFloat(view, "scaleY", new float[] {
                1.0F
            });
            animatorset.playTogether(aanimator);
            mZoomInOutAnim.setDuration(mBouncerZoomInOutDuration);
            mZoomInOutAnim.setInterpolator(new DecelerateInterpolator(1.5F));
            mZoomInOutAnim.start();
        }
        if (view instanceof KeyguardWidgetFrame)
            ((KeyguardWidgetFrame)view).onBouncerShowing(false);
    }

    void zoomOutToBouncer()
    {
        if (mZoomInOutAnim != null && mZoomInOutAnim.isRunning())
            mZoomInOutAnim.cancel();
        int i = getCurrentPage();
        View view = getPageAt(i);
        if (shouldSetTopAlignedPivotForWidget(i))
        {
            view.setPivotY(0.0F);
            view.setPivotX(0.0F);
            view.setPivotX(view.getMeasuredWidth() / 2);
        }
        if (view.getScaleX() >= 1.0F && view.getScaleY() >= 1.0F)
        {
            mZoomInOutAnim = new AnimatorSet();
            AnimatorSet animatorset = mZoomInOutAnim;
            Animator aanimator[] = new Animator[2];
            float af[] = new float[1];
            af[0] = BOUNCER_SCALE_FACTOR;
            aanimator[0] = ObjectAnimator.ofFloat(view, "scaleX", af);
            float af1[] = new float[1];
            af1[0] = BOUNCER_SCALE_FACTOR;
            aanimator[1] = ObjectAnimator.ofFloat(view, "scaleY", af1);
            animatorset.playTogether(aanimator);
            mZoomInOutAnim.setDuration(mBouncerZoomInOutDuration);
            mZoomInOutAnim.setInterpolator(new DecelerateInterpolator(1.5F));
            mZoomInOutAnim.start();
        }
        if (view instanceof KeyguardWidgetFrame)
            ((KeyguardWidgetFrame)view).onBouncerShowing(true);
    }

    static 
    {
        CAMERA_DISTANCE = 10000F;
        OVERSCROLL_MAX_ROTATION = 30F;
    }




/*
    static int access$102(KeyguardWidgetPager keyguardwidgetpager, int i)
    {
        keyguardwidgetpager.mWidgetToResetAfterFadeOut = i;
        return i;
    }

*/

}
