// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.os.SystemProperties;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Interpolator;
import android.widget.FrameLayout;
import android.widget.Scroller;
import com.mediatek.common.MediatekClassFactory;
import com.mediatek.common.pluginmanager.IPlugin;
import com.mediatek.common.pluginmanager.IPluginManager;
import com.mediatek.common.policy.IKeyguardLayer;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            ChallengeLayout, KeyguardSecurityContainer, KeyguardUtils, KeyguardSelectorView, 
//            KeyguardWidgetPager, MediatekGlowPadView, KeyguardSecurityCallback

public class SlidingChallengeLayout extends ViewGroup
    implements ChallengeLayout
{
    public static class LayoutParams extends android.view.ViewGroup.MarginLayoutParams
    {

        public static final int CHILD_TYPE_CHALLENGE = 2;
        public static final int CHILD_TYPE_EXPAND_CHALLENGE_HANDLE = 6;
        public static final int CHILD_TYPE_KEYGUARD_LAYER_BACKGROUND = 9;
        public static final int CHILD_TYPE_KEYGUARD_LAYER_FOREGROUND = 8;
        public static final int CHILD_TYPE_NONE = 0;
        public static final int CHILD_TYPE_SCRIM = 4;
        public static final int CHILD_TYPE_WIDGETS = 5;
        public int childType;
        public int maxHeight;

        public LayoutParams()
        {
            this(-1, -2);
        }

        public LayoutParams(int i, int j)
        {
            super(i, j);
            childType = 0;
        }

        public LayoutParams(Context context, AttributeSet attributeset)
        {
            super(context, attributeset);
            childType = 0;
            TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.SlidingChallengeLayout_Layout);
            childType = typedarray.getInt(1, 0);
            maxHeight = typedarray.getDimensionPixelSize(0, 0);
            typedarray.recycle();
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
        {
            super(layoutparams);
            childType = 0;
        }

        public LayoutParams(android.view.ViewGroup.MarginLayoutParams marginlayoutparams)
        {
            super(marginlayoutparams);
            childType = 0;
        }

        public LayoutParams(LayoutParams layoutparams)
        {
            super(layoutparams);
            childType = 0;
            childType = layoutparams.childType;
        }
    }

    public static interface OnChallengeScrolledListener
    {

        public abstract void onScrollPositionChanged(float f, int i);

        public abstract void onScrollStateChanged(int i);
    }


    private static final int CHALLENGE_FADE_IN_DURATION = 160;
    private static final int CHALLENGE_FADE_OUT_DURATION = 100;
    private static final boolean DEBUG = false;
    private static final boolean DEBUG_PLUG_IN = false;
    private static final int DRAG_HANDLE_CLOSED_ABOVE = 8;
    private static final int DRAG_HANDLE_CLOSED_BELOW = 0;
    private static final int DRAG_HANDLE_OPEN_ABOVE = 8;
    private static final int DRAG_HANDLE_OPEN_BELOW = 0;
    private static final int FULL_SCREEN_CHALLENGE_HEIGHT = 400;
    static final Property HANDLE_ALPHA = new FloatProperty("handleAlpha") {

        public Float get(SlidingChallengeLayout slidingchallengelayout)
        {
            return Float.valueOf(slidingchallengelayout.mHandleAlpha);
        }

        public volatile Object get(Object obj)
        {
            return get((SlidingChallengeLayout)obj);
        }

        public void setValue(SlidingChallengeLayout slidingchallengelayout, float f)
        {
            slidingchallengelayout.mHandleAlpha = f;
            slidingchallengelayout.invalidate();
        }

        public volatile void setValue(Object obj, float f)
        {
            setValue((SlidingChallengeLayout)obj, f);
        }

    }
;
    private static final int HANDLE_ANIMATE_DURATION = 250;
    private static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_FADING = 3;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "SlidingChallengeLayout";
    private static final Interpolator sHandleFadeInterpolator = new Interpolator() {

        public float getInterpolation(float f)
        {
            return f * f;
        }

    }
;
    private static final Interpolator sMotionInterpolator = new Interpolator() {

        public float getInterpolation(float f)
        {
            float f1 = f - 1.0F;
            return 1.0F + f1 * (f1 * (f1 * (f1 * f1)));
        }

    }
;
    private int mActivePointerId;
    private boolean mBlockDrag;
    private boolean mBlockDrag_qj;
    private ChallengeLayout.OnBouncerStateChangedListener mBouncerListener;
    private KeyguardSecurityCallback mCallback;
    private int mChallengeBottomBound;
    private boolean mChallengeInteractiveExternal;
    private boolean mChallengeInteractiveInternal;
    private float mChallengeOffset;
    private boolean mChallengeShowing;
    private boolean mChallengeShowingTargetState;
    private KeyguardSecurityContainer mChallengeView;
    private DisplayMetrics mDisplayMetrics;
    private int mDragHandleClosedAbove;
    private int mDragHandleClosedBelow;
    private int mDragHandleEdgeSlop;
    private int mDragHandleOpenAbove;
    private int mDragHandleOpenBelow;
    private boolean mDragging;
    private boolean mEdgeCaptured;
    private final Runnable mEndScrollRunnable;
    private final android.view.View.OnClickListener mExpandChallengeClickListener;
    private View mExpandChallengeView;
    private ObjectAnimator mFader;
    float mFrameAlpha;
    private ObjectAnimator mFrameAnimation;
    float mFrameAnimationTarget;
    private int mGestureStartChallengeBottom;
    private float mGestureStartX;
    private float mGestureStartY;
    float mHandleAlpha;
    private ObjectAnimator mHandleAnimation;
    private boolean mHasGlowpad;
    private boolean mHasLayout;
    private boolean mIsBouncing;
    private IKeyguardLayer mKeyguardLayerBackground;
    private FrameLayout mKeyguardLayerBackgroundLayout;
    private View mKeyguardLayerBackgroundView;
    private IKeyguardLayer mKeyguardLayerForeground;
    private FrameLayout mKeyguardLayerForegroundLayout;
    private View mKeyguardLayerForegroundView;
    private int mKeyguardSecurityHeight;
    private KeyguardSelectorView mKeyguardSelectorView;
    private View mLQLockView;
    private int mMaxVelocity;
    private int mMinVelocity;
    private final android.view.View.OnClickListener mScrimClickListener;
    private View mScrimView;
    private OnChallengeScrolledListener mScrollListener;
    private int mScrollState;
    private final Scroller mScroller;
    private boolean mShowKeyguardLayer;
    private Runnable mShowKeyguardLayerRunnable = new Runnable() {

        final SlidingChallengeLayout this$0;

        public void run()
        {
            updateKeyguardLayerView(mShowKeyguardLayer);
            if (mKeyguardLayerForegroundLayout != null)
            {
                FrameLayout framelayout1 = mKeyguardLayerForegroundLayout;
                byte byte1;
                if (mShowKeyguardLayer)
                    byte1 = 0;
                else
                    byte1 = 4;
                framelayout1.setVisibility(byte1);
            }
            if (mKeyguardLayerBackgroundLayout != null)
            {
                FrameLayout framelayout = mKeyguardLayerBackgroundLayout;
                boolean flag = mShowKeyguardLayer;
                byte byte0 = 0;
                if (!flag)
                    byte0 = 4;
                framelayout.setVisibility(byte0);
            }
        }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
    }
;
    private int mTouchSlop;
    private int mTouchSlopSquare;
    private VelocityTracker mVelocityTracker;
    private boolean mWasChallengeShowing;
    private View mWidgetsView;

    public SlidingChallengeLayout(Context context)
    {
        this(context, null);
    }

    public SlidingChallengeLayout(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public SlidingChallengeLayout(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset, i);
        mLQLockView = null;
        mCallback = null;
        mKeyguardSelectorView = null;
        mBlockDrag_qj = true;
        mKeyguardSecurityHeight = 0;
        mChallengeOffset = 1.0F;
        mChallengeShowing = true;
        mChallengeShowingTargetState = true;
        mWasChallengeShowing = true;
        mIsBouncing = false;
        mActivePointerId = -1;
        mFrameAnimationTarget = 1.401298E-045F;
        mChallengeInteractiveExternal = true;
        mChallengeInteractiveInternal = true;
        mEndScrollRunnable = new Runnable() {

            final SlidingChallengeLayout this$0;

            public void run()
            {
                completeChallengeScroll();
            }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
        }
;
        mScrimClickListener = new android.view.View.OnClickListener() {

            final SlidingChallengeLayout this$0;

            public void onClick(View view)
            {
                hideBouncer();
            }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
        }
;
        mExpandChallengeClickListener = new android.view.View.OnClickListener() {

            final SlidingChallengeLayout this$0;

            public void onClick(View view)
            {
                if (!isChallengeShowing())
                    showChallenge(true);
            }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
        }
;
        mScroller = new Scroller(context, sMotionInterpolator);
        ViewConfiguration viewconfiguration = ViewConfiguration.get(context);
        mMinVelocity = viewconfiguration.getScaledMinimumFlingVelocity();
        mMaxVelocity = viewconfiguration.getScaledMaximumFlingVelocity();
        Resources resources = getResources();
        mDragHandleEdgeSlop = resources.getDimensionPixelSize(0x1050074);
        mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        mTouchSlopSquare = mTouchSlop * mTouchSlop;
        mDisplayMetrics = resources.getDisplayMetrics();
        float f = mDisplayMetrics.density;
        mDragHandleClosedAbove = (int)(0.5F + 8F * f);
        mDragHandleClosedBelow = (int)(0.5F + 0.0F * f);
        mDragHandleOpenAbove = (int)(0.5F + 8F * f);
        mDragHandleOpenBelow = (int)(0.5F + 0.0F * f);
        mChallengeBottomBound = resources.getDimensionPixelSize(0x1050069);
        setWillNotDraw(false);
        setSystemUiVisibility(256);
    }

    private void cancelTransitionsInProgress()
    {
        if (!mScroller.isFinished())
        {
            mScroller.abortAnimation();
            completeChallengeScroll();
        }
        if (mFader != null)
            mFader.cancel();
    }

    private boolean crossedDragHandle(float f, float f1, float f2)
    {
        int i = mChallengeView.getTop();
        boolean flag;
        if (f >= 0.0F && f < (float)getWidth())
            flag = true;
        else
            flag = false;
        boolean flag1;
        if (mChallengeShowing)
        {
            if (f2 < (float)(i - getDragHandleSizeAbove()) && f1 > (float)(i + getDragHandleSizeBelow()))
                flag1 = true;
            else
                flag1 = false;
        } else
        if (f2 > (float)(i + getDragHandleSizeBelow()) && f1 < (float)(i - getDragHandleSizeAbove()))
            flag1 = true;
        else
            flag1 = false;
        return flag && flag1;
    }

    private float getChallengeAlpha()
    {
        float f = mChallengeOffset - 1.0F;
        return 1.0F + f * (f * f);
    }

    private int getChallengeBottom()
    {
        if (mChallengeView == null)
            return 0;
        else
            return mChallengeView.getBottom();
    }

    private int getChallengeMargin(boolean flag)
    {
        if (flag && mHasGlowpad)
            return 0;
        else
            return mDragHandleEdgeSlop;
    }

    private int getDragHandleSizeAbove()
    {
        if (isChallengeShowing())
            return mDragHandleOpenAbove;
        else
            return mDragHandleClosedAbove;
    }

    private int getDragHandleSizeBelow()
    {
        if (isChallengeShowing())
            return mDragHandleOpenBelow;
        else
            return mDragHandleClosedBelow;
    }

    private int getLayoutBottom()
    {
        int i;
        if (mChallengeView == null)
            i = 0;
        else
            i = ((LayoutParams)mChallengeView.getLayoutParams()).bottomMargin;
        return getMeasuredHeight() - getPaddingBottom() - i;
    }

    private int getMaxChallengeBottom()
    {
        if (mChallengeView == null)
            return 0;
        else
            return (getLayoutBottom() + mChallengeView.getMeasuredHeight()) - mChallengeBottomBound;
    }

    private int getMinChallengeBottom()
    {
        return getLayoutBottom();
    }

    private boolean isChallengeInteractionBlocked()
    {
        return !mChallengeInteractiveExternal || !mChallengeInteractiveInternal;
    }

    private boolean isEdgeSwipeBeginEvent(MotionEvent motionevent)
    {
        if (motionevent.getActionMasked() == 0)
        {
            float f = motionevent.getX();
            if (f < (float)mDragHandleEdgeSlop || f >= (float)(getWidth() - mDragHandleEdgeSlop))
                return true;
        }
        return false;
    }

    private boolean isInChallengeView(float f, float f1)
    {
        return isPointInView(f, f1, mChallengeView);
    }

    private boolean isInDragHandle(float f, float f1)
    {
        return isPointInView(f, f1, mExpandChallengeView);
    }

    private boolean isPointInView(float f, float f1, View view)
    {
        return view != null && f >= (float)view.getLeft() && f1 >= (float)view.getTop() && f < (float)view.getRight() && f1 < (float)view.getBottom();
    }

    private int makeChildMeasureSpec(int i, int j)
    {
        int k;
        int l;
        switch (j)
        {
        case -1: 
            k = 0x40000000;
            l = i;
            break;

        case -2: 
            k = 0x80000000;
            l = i;
            break;

        default:
            k = 0x40000000;
            l = Math.min(i, j);
            break;
        }
        return android.view.View.MeasureSpec.makeMeasureSpec(l, k);
    }

    private boolean moveChallengeTo(int i)
    {
        if (mChallengeView != null && mHasLayout)
        {
            int j = getLayoutBottom();
            int k = mChallengeView.getHeight();
            int l = Math.max(getMinChallengeBottom(), Math.min(i, getMaxChallengeBottom()));
            float f = 1.0F - (float)(l - j) / (float)(k - mChallengeBottomBound);
            mChallengeOffset = f;
            if (f > 0.0F && !mChallengeShowing)
                setChallengeShowing(true);
            updateKeyguardLayerPosition(l);
            mChallengeView.layout(mChallengeView.getLeft(), l - mChallengeView.getHeight(), mChallengeView.getRight(), l);
            mChallengeView.setAlpha(getChallengeAlpha());
            if (mScrollListener != null)
                mScrollListener.onScrollPositionChanged(f, mChallengeView.getTop());
            postInvalidateOnAnimation();
            return true;
        } else
        {
            return false;
        }
    }

    private void onFadeEnd(boolean flag)
    {
        mChallengeInteractiveInternal = true;
        setChallengeShowing(flag);
        if (!flag)
            moveChallengeTo(getMaxChallengeBottom());
        mChallengeView.setLayerType(0, null);
        mFader = null;
        setScrollState(0);
    }

    private void onFadeStart(boolean flag)
    {
        mChallengeInteractiveInternal = false;
        mChallengeView.setLayerType(2, null);
        if (flag)
            moveChallengeTo(getMinChallengeBottom());
        setScrollState(3);
    }

    private void resetTouch()
    {
        mVelocityTracker.recycle();
        mVelocityTracker = null;
        mActivePointerId = -1;
        mBlockDrag = false;
        mDragging = false;
    }

    private void sendInitialListenerUpdates()
    {
        if (mScrollListener != null)
        {
            int i;
            if (mChallengeView != null)
                i = mChallengeView.getTop();
            else
                i = 0;
            mScrollListener.onScrollPositionChanged(mChallengeOffset, i);
            mScrollListener.onScrollStateChanged(mScrollState);
        }
    }

    private void setChallengeShowing(boolean flag)
    {
        if (mChallengeShowing != flag)
        {
            mChallengeShowing = flag;
            if (mExpandChallengeView != null && mChallengeView != null)
                if (mChallengeShowing)
                {
                    mExpandChallengeView.setVisibility(4);
                    mChallengeView.setVisibility(0);
                    if (AccessibilityManager.getInstance(mContext).isEnabled())
                    {
                        mChallengeView.requestAccessibilityFocus();
                        mChallengeView.announceForAccessibility(mContext.getString(0x1040320));
                        return;
                    }
                } else
                {
                    mExpandChallengeView.setVisibility(0);
                    mChallengeView.setVisibility(4);
                    if (AccessibilityManager.getInstance(mContext).isEnabled())
                    {
                        mExpandChallengeView.requestAccessibilityFocus();
                        mChallengeView.announceForAccessibility(mContext.getString(0x1040321));
                        return;
                    }
                }
        }
    }

    private void showChallenge(int i)
    {
        boolean flag;
        if (Math.abs(i) > mMinVelocity)
        {
            if (i < 0)
                flag = true;
            else
                flag = false;
        } else
        if (mChallengeOffset >= 0.5F)
            flag = true;
        else
            flag = false;
        showChallenge(flag, i);
    }

    private void showChallenge(boolean flag, int i)
    {
        if (mChallengeView == null)
            setChallengeShowing(false);
        else
        if (mHasLayout)
        {
            mChallengeShowingTargetState = flag;
            int j = getLayoutBottom();
            if (!flag)
                j = (j + mChallengeView.getHeight()) - mChallengeBottomBound;
            animateChallengeTo(j, i);
            return;
        }
    }

    private void updateKeyguardLayerPosition(int i)
    {
        if (mKeyguardLayerForegroundLayout != null && mChallengeView != null)
        {
            mKeyguardLayerForegroundLayout.layout(mKeyguardLayerForegroundLayout.getLeft(), i - mKeyguardLayerForegroundLayout.getHeight(), mKeyguardLayerForegroundLayout.getRight(), i);
            int j = getLayoutBottom();
            int k = getLayoutBottom() + mChallengeView.getMeasuredHeight();
            float f = 1.0F - (1.0F * (float)(Math.min(Math.max(j, i), k) - j)) / (float)mChallengeView.getMeasuredHeight();
            if (mKeyguardLayerForegroundView != null)
                mKeyguardLayerForegroundView.setAlpha(f);
        }
    }

    private void updateKeyguardLayerView(boolean flag)
    {
        if (!flag || mKeyguardLayerBackgroundView != null || mKeyguardLayerForegroundView != null) goto _L2; else goto _L1
_L1:
        IPluginManager ipluginmanager;
        int i;
        Object aobj[] = new Object[4];
        aobj[0] = "create";
        aobj[1] = mContext;
        aobj[2] = com/mediatek/common/policy/IKeyguardLayer.getName();
        aobj[3] = null;
        ipluginmanager = (IPluginManager)MediatekClassFactory.createInstance(com/mediatek/common/pluginmanager/IPluginManager, aobj);
        i = ipluginmanager.getPluginCount();
        if (i == 0) goto _L4; else goto _L3
_L3:
        int j = 0;
_L11:
        if (j >= i) goto _L4; else goto _L5
_L5:
        IKeyguardLayer ikeyguardlayer;
        View view;
        ikeyguardlayer = (IKeyguardLayer)ipluginmanager.getPlugin(j).createObject();
        view = ikeyguardlayer.create();
        KeyguardUtils.xlogD("SlidingChallengeLayout", (new StringBuilder()).append("updateDataUsageView create plugin keyguardLayer=").append(ikeyguardlayer).append(", this=").append(this).toString());
        if (ikeyguardlayer.getKeyguardLayerInfo() == null) goto _L7; else goto _L6
_L6:
        mKeyguardLayerBackground = ikeyguardlayer;
        mKeyguardLayerBackgroundView = view;
          goto _L8
_L7:
        mKeyguardLayerForeground = ikeyguardlayer;
        mKeyguardLayerForegroundView = view;
          goto _L8
        Exception exception;
        exception;
        exception.printStackTrace();
_L2:
        return;
_L4:
        if (mKeyguardLayerForegroundLayout != null && mKeyguardLayerForegroundView != null)
        {
            LayoutParams layoutparams1 = new LayoutParams(-1, -1);
            mKeyguardLayerForegroundView.setLayoutParams(layoutparams1);
            mKeyguardLayerForegroundLayout.addView(mKeyguardLayerForegroundView);
        }
        if (mKeyguardLayerBackgroundLayout == null || mKeyguardLayerBackgroundView == null) goto _L2; else goto _L9
_L9:
        LayoutParams layoutparams = new LayoutParams(-1, -1);
        mKeyguardLayerBackgroundView.setLayoutParams(layoutparams);
        mKeyguardLayerBackgroundLayout.addView(mKeyguardLayerBackgroundView);
        return;
_L8:
        j++;
        if (true) goto _L11; else goto _L10
_L10:
    }

    void animateChallengeTo(int i, int j)
    {
        if (mChallengeView == null)
            return;
        cancelTransitionsInProgress();
        mChallengeInteractiveInternal = false;
        mChallengeView.setLayerType(2, null);
        int k = mChallengeView.getBottom();
        int l = i - k;
        if (l == 0)
        {
            completeChallengeScroll();
            return;
        }
        setScrollState(2);
        int i1 = mChallengeView.getHeight();
        int j1 = i1 / 2;
        float f = Math.min(1.0F, (1.0F * (float)Math.abs(l)) / (float)i1);
        float f1 = (float)j1 + (float)j1 * distanceInfluenceForSnapDuration(f);
        int k1 = Math.abs(j);
        int l1;
        if (k1 > 0)
            l1 = 4 * Math.round(1000F * Math.abs(f1 / (float)k1));
        else
            l1 = (int)(100F * (1.0F + (float)Math.abs(l) / (float)i1));
        int i2 = Math.min(l1, 600);
        mScroller.startScroll(0, k, 0, l, i2);
        postInvalidateOnAnimation();
    }

    void animateHandle(boolean flag)
    {
        if (mHandleAnimation != null)
        {
            mHandleAnimation.cancel();
            mHandleAnimation = null;
        }
        float f;
        if (flag)
            f = 1.0F;
        else
            f = 0.0F;
        if (f == mHandleAlpha)
        {
            return;
        } else
        {
            mHandleAnimation = ObjectAnimator.ofFloat(this, HANDLE_ALPHA, new float[] {
                f
            });
            mHandleAnimation.setInterpolator(sHandleFadeInterpolator);
            mHandleAnimation.setDuration(250L);
            mHandleAnimation.start();
            return;
        }
    }

    protected boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        return layoutparams instanceof LayoutParams;
    }

    void completeChallengeScroll()
    {
        setChallengeShowing(mChallengeShowingTargetState);
        float f;
        if (mChallengeShowing)
            f = 1.0F;
        else
            f = 0.0F;
        mChallengeOffset = f;
        setScrollState(0);
        mChallengeInteractiveInternal = true;
        mChallengeView.setLayerType(0, null);
    }

    public void computeScroll()
    {
        super.computeScroll();
        if (!mScroller.isFinished())
            if (mChallengeView == null)
            {
                Log.e("SlidingChallengeLayout", "Challenge view missing in computeScroll");
                mScroller.abortAnimation();
            } else
            {
                mScroller.computeScrollOffset();
                moveChallengeTo(mScroller.getCurrY());
                if (mScroller.isFinished())
                {
                    post(mEndScrollRunnable);
                    return;
                }
            }
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        int i;
        boolean flag;
label0:
        {
            i = motionevent.getActionMasked();
            if (i == 0)
                mEdgeCaptured = false;
            View view = mWidgetsView;
            flag = false;
            if (view == null)
                break label0;
            boolean flag1 = mIsBouncing;
            flag = false;
            if (flag1)
                break label0;
            if (!mEdgeCaptured)
            {
                boolean flag2 = isEdgeSwipeBeginEvent(motionevent);
                flag = false;
                if (!flag2)
                    break label0;
            }
            flag = mEdgeCaptured | mWidgetsView.dispatchTouchEvent(motionevent);
            mEdgeCaptured = flag;
        }
        if (!flag && !mEdgeCaptured)
            flag = super.dispatchTouchEvent(motionevent);
        if (i == 1 || i == 3)
            mEdgeCaptured = false;
        return flag;
    }

    float distanceInfluenceForSnapDuration(float f)
    {
        return (float)Math.sin((float)(0.4712389167638204D * (double)(f - 0.5F)));
    }

    public void draw(Canvas canvas)
    {
        super.draw(canvas);
    }

    public void fadeChallenge(final boolean show)
    {
        if (mChallengeView != null)
        {
            cancelTransitionsInProgress();
            float f;
            if (show)
                f = 1.0F;
            else
                f = 0.0F;
            int i;
            if (show)
                i = 160;
            else
                i = 100;
            mFader = ObjectAnimator.ofFloat(mChallengeView, "alpha", new float[] {
                f
            });
            mFader.addListener(new AnimatorListenerAdapter() {

                final SlidingChallengeLayout this$0;
                final boolean val$show;

                public void onAnimationEnd(Animator animator)
                {
                    onFadeEnd(show);
                }

                public void onAnimationStart(Animator animator)
                {
                    onFadeStart(show);
                }

            
            {
                this$0 = SlidingChallengeLayout.this;
                show = flag;
                super();
            }
            }
);
            mFader.setDuration(i);
            mFader.start();
        }
    }

    public void fadeInChallenge()
    {
        fadeChallenge(true);
    }

    public void fadeOutChallenge()
    {
        fadeChallenge(false);
    }

    protected android.view.ViewGroup.LayoutParams generateDefaultLayoutParams()
    {
        return new LayoutParams();
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeset)
    {
        return new LayoutParams(getContext(), attributeset);
    }

    protected android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutparams)
    {
        if (layoutparams instanceof LayoutParams)
            return new LayoutParams((LayoutParams)layoutparams);
        if (layoutparams instanceof android.view.ViewGroup.MarginLayoutParams)
            return new LayoutParams((android.view.ViewGroup.MarginLayoutParams)layoutparams);
        else
            return new LayoutParams(layoutparams);
    }

    public int getBouncerAnimationDuration()
    {
        return 250;
    }

    public int getMaxChallengeTop()
    {
        if (mChallengeView == null)
            return 0;
        else
            return getLayoutBottom() - mChallengeView.getMeasuredHeight();
    }

    public void hideBouncer()
    {
        if (mIsBouncing)
        {
            if (!mWasChallengeShowing)
                showChallenge(false);
            mIsBouncing = false;
            if (mScrimView != null)
            {
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mScrimView, "alpha", new float[] {
                    0.0F
                });
                objectanimator.setDuration(250L);
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final SlidingChallengeLayout this$0;

                    public void onAnimationEnd(Animator animator)
                    {
                        mScrimView.setVisibility(8);
                    }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
                }
);
                objectanimator.start();
            }
            if (mChallengeView != null)
                mChallengeView.hideBouncer(250);
            if (mBouncerListener != null)
            {
                mBouncerListener.onBouncerStateChanged(false);
                return;
            }
        }
    }

    public void hideLockPadView()
    {
        if (mLQLockView != null)
            mLQLockView.setVisibility(0);
    }

    public boolean isBouncing()
    {
        return mIsBouncing;
    }

    public boolean isChallengeOverlapping()
    {
        return mChallengeShowing;
    }

    public boolean isChallengeShowing()
    {
        return mChallengeShowing;
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        mHasLayout = false;
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        removeCallbacks(mEndScrollRunnable);
        removeCallbacks(mShowKeyguardLayerRunnable);
        mHasLayout = false;
        if (mKeyguardLayerBackground != null)
        {
            KeyguardUtils.xlogD("SlidingChallengeLayout", (new StringBuilder()).append("onDetachedFromWindow mKeyguardLayerBackground destroy ").append(mKeyguardLayerBackground).toString());
            mKeyguardLayerBackground.destroy();
            mKeyguardLayerBackground = null;
        }
        if (mKeyguardLayerForeground != null)
        {
            KeyguardUtils.xlogD("SlidingChallengeLayout", (new StringBuilder()).append("onDetachedFromWindow mKeyguardLayerForeground destroy ").append(mKeyguardLayerForeground).toString());
            mKeyguardLayerForeground.destroy();
            mKeyguardLayerForeground = null;
        }
        mKeyguardLayerBackgroundView = null;
        mKeyguardLayerForegroundView = null;
    }

    public void onFinishInflate()
    {
        super.onFinishInflate();
        int i = getChildCount();
        for (int j = 0; j < i; j++)
        {
            View view = getChildAt(j);
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams.childType == 8)
            {
                mKeyguardLayerForegroundLayout = (FrameLayout)view;
                continue;
            }
            if (layoutparams.childType == 9)
            {
                mKeyguardLayerBackgroundLayout = (FrameLayout)view;
                continue;
            }
            if (layoutparams.childType != 2)
                continue;
            if (mChallengeView != null)
                throw new IllegalStateException("There may only be one child with layout_isChallenge=\"true\"");
            if (!(view instanceof KeyguardSecurityContainer))
                throw new IllegalArgumentException("Challenge must be a KeyguardSecurityContainer");
            mChallengeView = (KeyguardSecurityContainer)view;
        }

    }

    public boolean onInterceptTouchEvent(MotionEvent motionevent)
    {
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
        int i = motionevent.getActionMasked();
        if (SystemProperties.get("ro.rgk.sm611.style").equals("samsun"))
        {
            if (mChallengeView != null)
                mKeyguardSecurityHeight = mChallengeView.getHeight();
            int ai[] = new int[2];
            if (!mDragging && mLQLockView != null && mKeyguardSelectorView != null)
            {
                mKeyguardSelectorView.getLocationOnScreen(ai);
                boolean flag = true;
                if (i == 0)
                {
                    StringBuilder stringbuilder = (new StringBuilder()).append("Sl --------isInChallengeView  --------- d ");
                    boolean flag1;
                    if (motionevent.getY() < (float)ai[1])
                        flag1 = true;
                    else
                        flag1 = false;
                    Log.d("xing", stringbuilder.append(flag1).toString());
                    if (motionevent.getY() >= (float)ai[1] && ai[1] <= mKeyguardSecurityHeight)
                    {
                        mBlockDrag_qj = false;
                    } else
                    {
                        flag = false;
                        mBlockDrag_qj = true;
                        Log.d("xing", "Sl --------isInChallengeView  ---------1");
                    }
                } else
                {
                    if (mBlockDrag_qj)
                        flag = false;
                    Log.d("xing", (new StringBuilder()).append("Sl --------isInChallengeView  ---------falg").append(flag).toString());
                }
                if (flag)
                {
                    Log.d("xing", (new StringBuilder()).append("Sl --------isInChallengeView ").append(i).toString());
                    mLQLockView.onTouchEvent(motionevent);
                }
            }
        }
        switch (i)
        {
        case 2: // '\002'
            int j = motionevent.getPointerCount();
            for (int k = 0; k < j; k++)
            {
                float f = motionevent.getX(k);
                float f1 = motionevent.getY(k);
                if (mIsBouncing || mActivePointerId != -1 || !crossedDragHandle(f, f1, mGestureStartY) && (!isInChallengeView(f, f1) || mScrollState != 2))
                {
                    if (mChallengeShowing && isInChallengeView(f, f1))
                        mBlockDrag = true;
                } else
                {
                    mActivePointerId = motionevent.getPointerId(k);
                    mGestureStartX = f;
                    mGestureStartY = f1;
                    mGestureStartChallengeBottom = getChallengeBottom();
                    mDragging = true;
                    mChallengeView.setLayerType(2, null);
                }
            }

            break;

        case 1: // '\001'
        case 3: // '\003'
            resetTouch();
            break;

        case 0: // '\0'
            mGestureStartX = motionevent.getX();
            mGestureStartY = motionevent.getY();
            mBlockDrag = false;
            break;
        }
        if (mBlockDrag || isChallengeInteractionBlocked())
        {
            mActivePointerId = -1;
            mDragging = false;
        }
        return mDragging;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        int i1 = getPaddingLeft();
        int j1 = getPaddingTop();
        int k1 = getPaddingRight();
        int l1 = getPaddingBottom();
        int i2 = k - i;
        int j2 = l - j;
        int k2 = getChildCount();
        for (int l2 = 0; l2 < k2; l2++)
        {
            View view = getChildAt(l2);
            if (view.getVisibility() == 8)
                continue;
            LayoutParams layoutparams = (LayoutParams)view.getLayoutParams();
            if (layoutparams.childType == 2)
            {
                int l3 = ((i1 + i2) - k1) / 2;
                int i4 = view.getMeasuredWidth();
                int j4 = view.getMeasuredHeight();
                int k4 = l3 - i4 / 2;
                int l4 = (j2 - l1 - layoutparams.bottomMargin) + (int)((float)(j4 - mChallengeBottomBound) * (1.0F - mChallengeOffset));
                view.setAlpha(getChallengeAlpha());
                view.layout(k4, l4 - j4, k4 + i4, l4);
                continue;
            }
            if (layoutparams.childType == 6)
            {
                int i3 = ((i1 + i2) - k1) / 2 - view.getMeasuredWidth() / 2;
                int j3 = i3 + view.getMeasuredWidth();
                int k3 = j2 - l1 - layoutparams.bottomMargin;
                view.layout(i3, k3 - view.getMeasuredHeight(), j3, k3);
                continue;
            }
            if (layoutparams.childType == 8)
                continue;
            if (layoutparams.childType == 9)
                view.layout(i, j, k, l);
            else
                view.layout(i1 + layoutparams.leftMargin, j1 + layoutparams.topMargin, i1 + view.getMeasuredWidth(), j1 + view.getMeasuredHeight());
        }

        if (mKeyguardLayerForegroundLayout != null)
            mKeyguardLayerForegroundLayout.layout(i, mChallengeView.getBottom() - mKeyguardLayerForegroundLayout.getMeasuredHeight(), k, mChallengeView.getBottom());
        if (!mHasLayout)
            mHasLayout = true;
    }

    protected void onMeasure(int i, int j)
    {
        if (android.view.View.MeasureSpec.getMode(i) == 0x40000000 && android.view.View.MeasureSpec.getMode(j) == 0x40000000)
        {
            setMeasuredDimension(android.view.View.MeasureSpec.getSize(i), android.view.View.MeasureSpec.getSize(j));
            KeyguardSecurityContainer keyguardsecuritycontainer = mChallengeView;
            KeyguardSecurityContainer keyguardsecuritycontainer1 = mChallengeView;
            mChallengeView = null;
            mExpandChallengeView = null;
            int k = getChildCount();
            for (int l = 0; l < k; l++)
            {
                View view3 = getChildAt(l);
                LayoutParams layoutparams1 = (LayoutParams)view3.getLayoutParams();
                if (layoutparams1.childType == 2)
                {
                    if (mChallengeView != null)
                        throw new IllegalStateException("There may only be one child with layout_isChallenge=\"true\"");
                    if (!(view3 instanceof KeyguardSecurityContainer))
                        throw new IllegalArgumentException("Challenge must be a KeyguardSecurityContainer");
                    mChallengeView = (KeyguardSecurityContainer)view3;
                    if (mChallengeView != keyguardsecuritycontainer)
                    {
                        KeyguardSecurityContainer keyguardsecuritycontainer2 = mChallengeView;
                        byte byte1;
                        if (mChallengeShowing)
                            byte1 = 0;
                        else
                            byte1 = 4;
                        keyguardsecuritycontainer2.setVisibility(byte1);
                    }
                    View view5 = view3.findViewById(0x10202fe);
                    boolean flag;
                    if (view5 != null && view5.getVisibility() == 0)
                        flag = true;
                    else
                        flag = false;
                    mHasGlowpad = flag;
                    int i4 = getChallengeMargin(true);
                    layoutparams1.rightMargin = i4;
                    layoutparams1.leftMargin = i4;
                    continue;
                }
                if (layoutparams1.childType == 6)
                {
                    if (mExpandChallengeView != null)
                        throw new IllegalStateException("There may only be one child with layout_childType=\"expandChallengeHandle\"");
                    mExpandChallengeView = view3;
                    if (mExpandChallengeView == keyguardsecuritycontainer1)
                        continue;
                    View view4 = mExpandChallengeView;
                    byte byte0;
                    if (mChallengeShowing)
                        byte0 = 4;
                    else
                        byte0 = 0;
                    view4.setVisibility(byte0);
                    mExpandChallengeView.setOnClickListener(mExpandChallengeClickListener);
                    continue;
                }
                if (layoutparams1.childType == 4)
                {
                    setScrimView(view3);
                    continue;
                }
                if (layoutparams1.childType == 5)
                    mWidgetsView = view3;
            }

            if (mChallengeView != null && mChallengeView.getVisibility() != 8)
            {
                int j2 = j;
                View view2 = getRootView();
                if (view2 != null)
                {
                    LayoutParams layoutparams = (LayoutParams)mChallengeView.getLayoutParams();
                    int k2 = android.view.View.MeasureSpec.getSize(j);
                    int l2 = mDisplayMetrics.heightPixels - view2.getPaddingTop() - k2;
                    int i3 = layoutparams.maxHeight - l2;
                    KeyguardWidgetPager keyguardwidgetpager = (KeyguardWidgetPager)findViewById(0x10202b6);
                    int j3 = (int)(400F * mDisplayMetrics.density);
                    if (keyguardwidgetpager != null && keyguardwidgetpager.getVisibility() != 0)
                    {
                        int l3 = Math.min(k2, j3);
                        if (i3 < l3)
                            i3 = Math.min(k2, j3);
                    }
                    if (i3 > 0)
                    {
                        int k3 = layoutparams.height;
                        j2 = makeChildMeasureSpec(i3, k3);
                    }
                }
                measureChildWithMargins(mChallengeView, i, 0, j2, 0);
            }
            for (int i1 = 0; i1 < k; i1++)
            {
                View view = getChildAt(i1);
                if (view.getVisibility() == 8 || view == mChallengeView)
                    continue;
                int j1 = i;
                int k1 = j;
                if (((LayoutParams)view.getLayoutParams()).childType == 5)
                {
                    View view1 = getRootView();
                    if (view1 != null)
                    {
                        int l1 = mDisplayMetrics.widthPixels;
                        int i2 = mDisplayMetrics.heightPixels - view1.getPaddingTop();
                        j1 = android.view.View.MeasureSpec.makeMeasureSpec(l1, 0x40000000);
                        k1 = android.view.View.MeasureSpec.makeMeasureSpec(i2, 0x40000000);
                    }
                }
                measureChildWithMargins(view, j1, 0, k1, 0);
            }

            return;
        } else
        {
            throw new IllegalArgumentException("SlidingChallengeLayout must be measured with an exact size");
        }
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        float f = motionevent.getX();
        float f1 = motionevent.getY();
        if (!mDragging && isInChallengeView(f, f1))
        {
            Log.d("xing", "SlidingChallengeLayout -------- onTouchEvent---------2");
            if (mLQLockView != null)
                mLQLockView.onTouchEvent(motionevent);
        }
        if (mVelocityTracker == null)
            mVelocityTracker = VelocityTracker.obtain();
        mVelocityTracker.addMovement(motionevent);
        motionevent.getActionMasked();
        JVM INSTR tableswitch 0 6: default 428
    //                   0 455
    //                   1 377
    //                   2 120
    //                   3 430
    //                   4 428
    //                   5 428
    //                   6 362;
           goto _L1 _L2 _L3 _L4 _L5 _L1 _L1 _L6
_L4:
        if (mDragging || mBlockDrag || mIsBouncing) goto _L8; else goto _L7
_L7:
        int j;
        int k;
        j = motionevent.getPointerCount();
        k = 0;
_L12:
        if (k >= j) goto _L8; else goto _L9
_L9:
        float f3;
        float f4;
        f3 = motionevent.getX(k);
        f4 = motionevent.getY(k);
        if (!isInDragHandle(f3, f4) && !crossedDragHandle(f3, f4, mGestureStartY) && (!isInChallengeView(f3, f4) || mScrollState != 2) || mActivePointerId != -1 || isChallengeInteractionBlocked()) goto _L11; else goto _L10
_L10:
        mGestureStartX = f3;
        mGestureStartY = f4;
        mActivePointerId = motionevent.getPointerId(k);
        mGestureStartChallengeBottom = getChallengeBottom();
        mDragging = true;
        mChallengeView.setLayerType(2, null);
_L8:
        if (mDragging)
        {
            setScrollState(1);
            int i = motionevent.findPointerIndex(mActivePointerId);
            if (i < 0)
            {
                resetTouch();
                showChallenge(0);
                return true;
            } else
            {
                float f2 = Math.min(motionevent.getY(i) - mGestureStartY, getLayoutBottom() - mChallengeBottomBound);
                moveChallengeTo(mGestureStartChallengeBottom + (int)f2);
                return true;
            }
        }
        break; /* Loop/switch isn't completed */
_L11:
        k++;
        if (true) goto _L12; else goto _L1
_L6:
        if (mActivePointerId != motionevent.getPointerId(motionevent.getActionIndex())) goto _L1; else goto _L3
_L3:
        if (mDragging && !isChallengeInteractionBlocked())
        {
            mVelocityTracker.computeCurrentVelocity(1000, mMaxVelocity);
            showChallenge((int)mVelocityTracker.getYVelocity(mActivePointerId));
        }
        resetTouch();
        return true;
_L1:
        return true;
_L5:
        if (mDragging && !isChallengeInteractionBlocked())
            showChallenge(0);
        resetTouch();
        return true;
_L2:
        mBlockDrag = false;
        mGestureStartX = motionevent.getX();
        mGestureStartY = motionevent.getY();
        return true;
    }

    public void requestChildFocus(View view, View view1)
    {
        if (mIsBouncing && view != mChallengeView)
            hideBouncer();
        super.requestChildFocus(view, view1);
    }

    public void requestDisallowInterceptTouchEvent(boolean flag)
    {
    }

    public void setChallengeInteractive(boolean flag)
    {
        mChallengeInteractiveExternal = flag;
        if (mExpandChallengeView != null)
            mExpandChallengeView.setEnabled(flag);
    }

    public void setClipChildrenForNewEventView(boolean flag)
    {
        setClipChildren(flag);
        if (mChallengeView != null)
            mChallengeView.setClipChildrenForNewEventView(flag);
    }

    public void setHandleAlpha(float f)
    {
        if (mExpandChallengeView != null)
            mExpandChallengeView.setAlpha(f);
    }

    public void setKeyguardCallback(KeyguardSecurityCallback keyguardsecuritycallback)
    {
        mCallback = keyguardsecuritycallback;
    }

    public void setLockView(View view, KeyguardSelectorView keyguardselectorview)
    {
        mLQLockView = view;
        mKeyguardSelectorView = keyguardselectorview;
    }

    public void setOnBouncerStateChangedListener(ChallengeLayout.OnBouncerStateChangedListener onbouncerstatechangedlistener)
    {
        mBouncerListener = onbouncerstatechangedlistener;
    }

    public void setOnChallengeScrolledListener(OnChallengeScrolledListener onchallengescrolledlistener)
    {
        mScrollListener = onchallengescrolledlistener;
        if (mHasLayout)
            sendInitialListenerUpdates();
    }

    void setScrimView(View view)
    {
        if (mScrimView != null)
            mScrimView.setOnClickListener(null);
        mScrimView = view;
        View view1 = mScrimView;
        byte byte0;
        if (mIsBouncing)
            byte0 = 0;
        else
            byte0 = 8;
        view1.setVisibility(byte0);
        mScrimView.setFocusable(true);
        mScrimView.setOnClickListener(mScrimClickListener);
    }

    void setScrollState(int i)
    {
        if (mScrollState != i)
        {
            mScrollState = i;
            boolean flag;
            if (i == 0 && !mChallengeShowing)
                flag = true;
            else
                flag = false;
            animateHandle(flag);
            if (mScrollListener != null)
                mScrollListener.onScrollStateChanged(i);
        }
    }

    public void setTouchRecepientForKeyguardLayer(MediatekGlowPadView mediatekglowpadview)
    {
        if (mLQLockView != null && mKeyguardLayerForegroundLayout != null && mediatekglowpadview != null)
            mediatekglowpadview.setTouchRecepient(mLQLockView);
        else
        if (mKeyguardLayerForegroundLayout != null && mediatekglowpadview != null)
        {
            mediatekglowpadview.setTouchRecepient(mKeyguardLayerForegroundLayout);
            return;
        }
    }

    public void showBouncer()
    {
        if (!mIsBouncing)
        {
            mWasChallengeShowing = mChallengeShowing;
            mIsBouncing = true;
            showChallenge(true);
            if (mScrimView != null)
            {
                ObjectAnimator objectanimator = ObjectAnimator.ofFloat(mScrimView, "alpha", new float[] {
                    1.0F
                });
                objectanimator.setDuration(250L);
                objectanimator.addListener(new AnimatorListenerAdapter() {

                    final SlidingChallengeLayout this$0;

                    public void onAnimationStart(Animator animator)
                    {
                        mScrimView.setVisibility(0);
                    }

            
            {
                this$0 = SlidingChallengeLayout.this;
                super();
            }
                }
);
                objectanimator.start();
            }
            if (mChallengeView != null)
                mChallengeView.showBouncer(250);
            if (mBouncerListener != null)
            {
                mBouncerListener.onBouncerStateChanged(true);
                return;
            }
        }
    }

    public void showChallenge(boolean flag)
    {
        showChallenge(flag, 0);
        if (!flag)
            mBlockDrag = true;
    }

    public void showLockPadView()
    {
        if (mLQLockView != null)
            mLQLockView.setVisibility(0);
    }

    public void updateKeyguardLayerVisibility(boolean flag)
    {
        mShowKeyguardLayer = flag;
        removeCallbacks(mShowKeyguardLayerRunnable);
        post(mShowKeyguardLayerRunnable);
    }








}
