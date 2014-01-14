// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) fieldsfirst noctor space 

package com.android.internal.policy.impl.keyguard;

import android.animation.*;
import android.app.ActivityManagerNative;
import android.app.IActivityManager;
import android.content.*;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.*;
import android.os.*;
import android.text.TextUtils;
import android.util.*;
import android.view.*;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import com.mediatek.xlog.Xlog;
import java.util.ArrayList;
import java.util.Arrays;

// Referenced classes of package com.android.internal.policy.impl.keyguard:
//            TargetDrawable, PointCloud, Tweener, LockScreenLayout, 
//            LockScreenNewEventView, UnReadEventView, DragView

public class MediatekGlowPadView extends View
    implements android.view.View.OnTouchListener
{
    private class AnimationBundle extends ArrayList
    {

        private static final long serialVersionUID = 0xa84d78726f127468L;
        private boolean mSuspended;
        final MediatekGlowPadView this$0;

        public void cancel()
        {
            int i = size();
            for (int j = 0; j < i; j++)
                ((Tweener)get(j)).animator.cancel();

            clear();
        }

        public void setSuspended(boolean flag)
        {
            mSuspended = flag;
        }

        public void start()
        {
            if (!mSuspended)
            {
                int i = size();
                for (int j = 0; j < i; j++)
                    ((Tweener)get(j)).animator.start();

            }
        }

        public void stop()
        {
            int i = size();
            for (int j = 0; j < i; j++)
                ((Tweener)get(j)).animator.end();

            clear();
        }

        private AnimationBundle()
        {
            this$0 = MediatekGlowPadView.this;
            super();
        }

    }

    final class IntersectAnimationRunnable
        implements Runnable
    {

        final MediatekGlowPadView this$0;

        public void run()
        {
            if (mDragging)
                mShouldDoIntersectAnim = false;
        }

        IntersectAnimationRunnable()
        {
            this$0 = MediatekGlowPadView.this;
            super();
        }
    }

    public static interface OnTriggerListener
    {

        public static final int CENTER_HANDLE = 1;
        public static final int NO_HANDLE;

        public abstract void onFinishFinalAnimation();

        public abstract void onGrabbed(View view, int i);

        public abstract void onGrabbedStateChange(View view, int i);

        public abstract void onReleased(View view, int i);

        public abstract void onTrigger(View view, int i);
    }

    private class PendingEvent
    {

        int eventX;
        int eventY;
        final MediatekGlowPadView this$0;
        float velocityX;
        float velocityY;

        private PendingEvent()
        {
            this$0 = MediatekGlowPadView.this;
            super();
        }

    }

    private class SimpleOnGestureListener
        implements android.view.GestureDetector.OnGestureListener
    {

        final MediatekGlowPadView this$0;

        public boolean onDown(MotionEvent motionevent)
        {
            Xlog.d("MediatekGlowPadView", "onDown");
            mTapTimeOut = false;
            mPendingDragViewState = -1;
            switchDragViewToState(0, (int)motionevent.getX(), (int)motionevent.getY(), 0.0F, 0.0F);
            return true;
        }

        public boolean onFling(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
        {
            Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onFling ").append(f).append(", ").append(f1).toString());
            if (mTouchTriggered)
                switchDragViewToState(5, (int)motionevent1.getX(), (int)motionevent1.getY(), f, f1);
            else
                switchDragViewToState(4, (int)motionevent1.getX(), (int)motionevent1.getY(), f, f1);
            return true;
        }

        public void onLongPress(MotionEvent motionevent)
        {
            Xlog.d("MediatekGlowPadView", "onLongPress");
        }

        public boolean onScroll(MotionEvent motionevent, MotionEvent motionevent1, float f, float f1)
        {
            Xlog.v("MediatekGlowPadView", (new StringBuilder()).append("*** onScroll *** mDragViewState=").append(converDragViewStateCodeToString(mDragViewState)).append(", mPendingDragViewState=").append(converDragViewStateCodeToString(mPendingDragViewState)).toString());
            switchDragViewToState(3, (int)motionevent1.getX(), (int)motionevent1.getY(), 0.0F, 0.0F);
            return true;
        }

        public void onShowPress(MotionEvent motionevent)
        {
            Xlog.d("MediatekGlowPadView", "onShowPress");
            mTapTimeOut = true;
            switchDragViewToState(3, (int)motionevent.getX(), (int)motionevent.getY(), 0.0F, 0.0F);
        }

        public boolean onSingleTapUp(MotionEvent motionevent)
        {
            Xlog.d("MediatekGlowPadView", "onSingleTapUp");
            if (!mTapTimeOut)
            {
                switchDragViewToState(2, (int)motionevent.getX(), (int)motionevent.getY(), 0.0F, 0.0F);
                return true;
            } else
            {
                return false;
            }
        }

        private SimpleOnGestureListener()
        {
            this$0 = MediatekGlowPadView.this;
            super();
        }

    }


    private static final int ANIM_TOUCH_STLOP = 3;
    private static final String CALL_LOG_CLASS_NAME = "com.android.contacts.activities.DialtactsActivity";
    private static final String CALL_LOG_PACKAGE_NAME = "com.android.contacts";
    private static final boolean DEBUG = true;
    private static final int DRAG_ANIMATION_DELAY = 50;
    private static final int DRAG_ANIMATION_DURATION = 350;
    private static final int DRAG_BACK_ANIMATION_DELAY = 20;
    private static final int DRAG_BACK_ANIMATION_DURATION = 200;
    private static final String EMAIL_CLASS_NAME = "com.android.email.activity.Welcome";
    private static final String EMAIL_PACKAGE_NAME = "com.android.email";
    private static final int HIDE_ANIMATION_DELAY = 200;
    private static final int HIDE_ANIMATION_DURATION = 200;
    private static final int INITIAL_SHOW_HANDLE_DURATION = 200;
    private static final String MMS_CLASS_NAME = "com.android.mms.ui.ConversationList";
    private static final String MMS_PACKAGE_NAME = "com.android.mms";
    private static final int RETURN_TO_HOME_DELAY = 1200;
    private static final int RETURN_TO_HOME_DURATION = 200;
    private static final int REVEAL_GLOW_DELAY = 0;
    private static final int REVEAL_GLOW_DURATION = 0;
    private static final float RING_SCALE_COLLAPSED = 0.5F;
    private static final float RING_SCALE_EXPANDED = 1F;
    private static final int SHOW_ANIMATION_DELAY = 50;
    private static final int SHOW_ANIMATION_DURATION = 200;
    private static final float SNAP_MARGIN_DEFAULT = 20F;
    private static final int STATE_FINISH = 5;
    private static final int STATE_FIRST_TOUCH = 2;
    private static final int STATE_IDLE = 0;
    private static final int STATE_SNAP = 4;
    private static final int STATE_START = 1;
    private static final int STATE_TRACKING = 3;
    private static final String TAG = "MediatekGlowPadView";
    private static final float TAP_RADIUS_SCALE_ACCESSIBILITY_ENABLED = 1.3F;
    private static final float TARGET_SCALE_COLLAPSED = 0.8F;
    private static final float TARGET_SCALE_EXPANDED = 1F;
    private static final int TOUCH_ANIM_BACK = 6;
    private static final int TOUCH_DRAGGING = 3;
    private static final int TOUCH_END = 7;
    private static final int TOUCH_FLING = 4;
    private static final int TOUCH_HANDLE_ANIM = 1;
    private static final int TOUCH_INIT = 0;
    private static final int TOUCH_INTERSECT = 2;
    private static final float TOUCH_MOVE_INTERSECT_ANIM_THRESHOLD = 10F;
    private static final int TOUCH_MOVE_TRIGGER_THRESHOLD = 3;
    private static final int TOUCH_TRIGGER = 5;
    private static final int WAVE_ANIMATION_DURATION = 1350;
    private boolean mActionCancel;
    private int mActiveTarget;
    private boolean mAllowScaling;
    private boolean mAlwaysTrackFinger;
    private boolean mAnimatingTargets;
    private Tweener mBackgroundAnimator;
    private Canvas mCanvas;
    private Runnable mCheckForInterSectAnimation;
    private float mCurrentFakeHandleTargetX;
    private float mCurrentFakeHandleTargetY;
    private LockScreenNewEventView mCurrentNewEventView;
    private ArrayList mDirectionDescriptions;
    private int mDirectionDescriptionsResourceId;
    private boolean mDoingIntersectAnim;
    private float mDragSnapMargin;
    private DragView mDragView;
    private AnimationBundle mDragViewAnimations;
    private boolean mDragViewDoingTouch;
    private int mDragViewState;
    private boolean mDragging;
    private boolean mFakeHandleAnimating;
    private AnimationBundle mFakeHandleAnimations;
    private TargetDrawable mFakeHandleDrawable;
    private android.animation.Animator.AnimatorListener mFakeHandleDrawableOutListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("mFakeHandleDrawableOutListener mPendingDragViewState=").append(converDragViewStateCodeToString(mPendingDragViewState)).append(", mDragViewState").append(converDragViewStateCodeToString(mDragViewState)).toString());
            mFakeHandleAnimating = false;
            switchDragViewToState(mPendingDragViewState, mPendingEvent.eventX, mPendingEvent.eventY, mPendingEvent.velocityX, mPendingEvent.velocityY);
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private android.animation.Animator.AnimatorListener mFakeHandleDrawableResetListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            Log.d("MediatekGlowPadView", "mFakeHandleDrawableResetListener");
            mHandleDrawable.setScaleX(1.0F);
            mHandleDrawable.setScaleY(1.0F);
            mHandleDrawable.setAlpha(1.0F);
            invalidate();
            switchDragViewToState(7, 0, 0, 0.0F, 0.0F);
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private float mFakeHandleRealX;
    private float mFakeHandleRealY;
    private int mFeedbackCount;
    private float mFirstItemOffset;
    private GestureDetector mGestureDetector;
    private AnimationBundle mGlowAnimations;
    private int mGlowPadViewState;
    private float mGlowRadius;
    private int mGrabbedState;
    private int mGravity;
    private AnimationBundle mHandleAnimations;
    private TargetDrawable mHandleDrawable;
    private android.animation.Animator.AnimatorListener mHandleDrawableResetListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            mHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
            invalidate();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private android.animation.ValueAnimator.AnimatorUpdateListener mHandleDrawableUpdateListener = new android.animation.ValueAnimator.AnimatorUpdateListener() {

        final MediatekGlowPadView this$0;

        public void onAnimationUpdate(ValueAnimator valueanimator)
        {
            invalidate();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private Point mHandlePosition;
    private final int mHistoryTouchXY[];
    private int mHorizontalInset;
    private int mInitDownMotionLocationX;
    private int mInitDownMotionLocationY;
    private boolean mInitialLayout;
    private float mInnerRadius;
    private android.animation.Animator.AnimatorListener mIntersectAnimResetListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            Xlog.d("MediatekGlowPadView", "mIntersectAnimResetListener onAnimationEnd");
            switchDragViewToState(6, 0, 0, 0.0F, 0.0F);
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private boolean mLayoutListenerSet;
    private LockScreenLayout mLockScreenLayout;
    private boolean mMagneticTargets;
    private int mMaxTargetHeight;
    private int mMaxTargetWidth;
    private int mNewEventViewInLockScreenX;
    private int mNewEventViewInLockScreenY;
    private final int mNewEventViewLocationInLockScreen[];
    private int mNewTargetResources;
    private android.view.View.OnLayoutChangeListener mOnLayoutListener = new android.view.View.OnLayoutChangeListener() {

        final MediatekGlowPadView this$0;

        public void onLayoutChange(View view, int i1, int j1, int k1, int l1, int i2, int j2, 
                int k2, int l2)
        {
            refreshPositions();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private OnTriggerListener mOnTriggerListener;
    private float mOuterRadius;
    private TargetDrawable mOuterRing;
    private final int mOwnerDragViewOffsets[];
    private final int mOwnerLocationInLockScreen[];
    private final int mOwnerNewEventViewOffset[];
    private final int mOwnerRawLocation[];
    private final int mOwnerRecepientOffsets[];
    private int mPendingDragViewState;
    private PendingEvent mPendingEvent;
    private final Point mPoint;
    private PointCloud mPointCloud;
    private int mPointerId;
    private android.animation.Animator.AnimatorListener mResetListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            switchToState(0, mWaveCenterX, mWaveCenterY);
            dispatchOnFinishFinalAnimation();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private android.animation.Animator.AnimatorListener mResetListenerWithPing = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            pingInternal();
            switchToState(0, mWaveCenterX, mWaveCenterY);
            dispatchOnFinishFinalAnimation();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private float mRingScaleFactor;
    private boolean mShouldDoIntersectAnim;
    private SimpleOnGestureListener mSimpleOnGestureListener;
    private float mSnapMargin;
    private boolean mTapTimeOut;
    private AnimationBundle mTargetAnimations;
    private ArrayList mTargetDescriptions;
    private int mTargetDescriptionsResourceId;
    private ArrayList mTargetDrawables;
    private int mTargetResourceId;
    private android.animation.Animator.AnimatorListener mTargetUpdateListener = new AnimatorListenerAdapter() {

        final MediatekGlowPadView this$0;

        public void onAnimationEnd(Animator animator)
        {
            if (mNewTargetResources != 0)
            {
                internalSetTargetResources(mNewTargetResources);
                mNewTargetResources = 0;
                hideTargets(false, false);
            }
            mAnimatingTargets = false;
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private Rect mTempRect;
    private final int mTempXY[];
    private boolean mTouchDropped;
    private boolean mTouchIntercepted;
    private float mTouchMoveIntersectAnimThreshold;
    private int mTouchMoveTriggerThreshold;
    private View mTouchRecepient;
    private final int mTouchRecepientRawLocation[];
    private int mTouchSlop;
    private int mTouchSlopSqure;
    private boolean mTouchTriggered;
    private UnReadEventView mUnReadEventView;
    private android.animation.ValueAnimator.AnimatorUpdateListener mUpdateListener = new android.animation.ValueAnimator.AnimatorUpdateListener() {

        final MediatekGlowPadView this$0;

        public void onAnimationUpdate(ValueAnimator valueanimator)
        {
            invalidate();
        }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
    }
;
    private int mVerticalInset;
    private int mVibrationDuration;
    private Vibrator mVibrator;
    private AnimationBundle mWaveAnimations;
    private float mWaveCenterX;
    private float mWaveCenterY;

    public MediatekGlowPadView(Context context)
    {
        this(context, null);
    }

    public MediatekGlowPadView(Context context, AttributeSet attributeset)
    {
        super(context, attributeset);
        mTargetDrawables = new ArrayList();
        mWaveAnimations = new AnimationBundle();
        mTargetAnimations = new AnimationBundle();
        mGlowAnimations = new AnimationBundle();
        mFeedbackCount = 3;
        mVibrationDuration = 0;
        mActiveTarget = -1;
        mRingScaleFactor = 1.0F;
        mOuterRadius = 0.0F;
        mSnapMargin = 0.0F;
        mFirstItemOffset = 0.0F;
        mMagneticTargets = false;
        mActionCancel = false;
        mGravity = 48;
        mInitialLayout = true;
        mTouchRecepientRawLocation = new int[2];
        mOwnerRawLocation = new int[2];
        mOwnerRecepientOffsets = new int[2];
        mNewEventViewLocationInLockScreen = new int[2];
        mOwnerLocationInLockScreen = new int[2];
        mOwnerNewEventViewOffset = new int[2];
        mTempXY = new int[2];
        mPoint = new Point();
        mHistoryTouchXY = new int[2];
        mHandlePosition = new Point();
        mCheckForInterSectAnimation = new IntersectAnimationRunnable();
        mDragViewAnimations = new AnimationBundle();
        mTempRect = new Rect();
        mOwnerDragViewOffsets = new int[2];
        mHandleAnimations = new AnimationBundle();
        mFakeHandleAnimations = new AnimationBundle();
        mCanvas = new Canvas();
        mTapTimeOut = false;
        mPendingEvent = new PendingEvent();
        Resources resources = context.getResources();
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.android.internal.R.styleable.GlowPadView);
        mInnerRadius = typedarray.getDimension(1, mInnerRadius);
        mOuterRadius = typedarray.getDimension(12, mOuterRadius);
        mSnapMargin = typedarray.getDimension(14, mSnapMargin);
        mFirstItemOffset = (float)Math.toRadians(typedarray.getFloat(7, (float)Math.toDegrees(mFirstItemOffset)));
        mVibrationDuration = typedarray.getInt(13, mVibrationDuration);
        mFeedbackCount = typedarray.getInt(15, mFeedbackCount);
        mAllowScaling = typedarray.getBoolean(9, false);
        TypedValue typedvalue = typedarray.peekValue(11);
        int i;
        if (typedvalue != null)
            i = typedvalue.resourceId;
        else
            i = 0;
        mHandleDrawable = new TargetDrawable(resources, i);
        mHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
        mOuterRing = new TargetDrawable(resources, getResourceId(typedarray, 4));
        mAlwaysTrackFinger = typedarray.getBoolean(16, false);
        mMagneticTargets = typedarray.getBoolean(8, mMagneticTargets);
        int j = getResourceId(typedarray, 5);
        android.graphics.drawable.Drawable drawable;
        if (j != 0)
            drawable = resources.getDrawable(j);
        else
            drawable = null;
        mGlowRadius = typedarray.getDimension(6, 0.0F);
        TypedValue typedvalue1 = new TypedValue();
        if (typedarray.getValue(10, typedvalue1))
            internalSetTargetResources(typedvalue1.resourceId);
        if (mTargetDrawables != null && mTargetDrawables.size() != 0)
        {
            if (typedarray.getValue(2, typedvalue1))
            {
                int l = typedvalue1.resourceId;
                if (l == 0)
                    throw new IllegalStateException("Must specify target descriptions");
                setTargetDescriptionsResourceId(l);
            }
            if (typedarray.getValue(3, typedvalue1))
            {
                int k = typedvalue1.resourceId;
                if (k == 0)
                    throw new IllegalStateException("Must specify direction descriptions");
                setDirectionDescriptionsResourceId(k);
            }
            mGravity = typedarray.getInt(0, 48);
            typedarray.recycle();
            boolean flag;
            if (mVibrationDuration > 0)
                flag = true;
            else
                flag = false;
            setVibrateEnabled(flag);
            assignDefaultsIfNeeded();
            mPointCloud = new PointCloud(drawable);
            mPointCloud.makePointCloud(mInnerRadius, mOuterRadius);
            mPointCloud.glowManager.setRadius(mGlowRadius);
            mDragViewState = -1;
            mPendingDragViewState = -1;
            return;
        } else
        {
            throw new IllegalStateException("Must specify at least one target drawable");
        }
    }

    private void activateHandle(int i, int j)
    {
        Xlog.w("MediatekGlowPadView", "activateHandle");
        if (mFakeHandleDrawable == null)
        {
            mFakeHandleDrawable = new TargetDrawable(mHandleDrawable);
            mFakeHandleDrawable.setDrawable(getResources(), 0x2020061);
        } else
        {
            mFakeHandleDrawable.setEnabled(true);
        }
        mFakeHandleDrawable.setAlpha(0.0F);
        mFakeHandleDrawable.setScaleX(0.4F);
        mFakeHandleDrawable.setScaleY(0.4F);
        mFakeHandleDrawable.setPositionX(mWaveCenterX);
        mFakeHandleDrawable.setPositionY(mWaveCenterY);
        mFakeHandleRealX = 0.0F;
        mFakeHandleRealY = 0.0F;
        mHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
        mHandleDrawable.setAlpha(0.0F);
        mHandleDrawable.setScaleX(0.0F);
        mHandleDrawable.setScaleY(0.0F);
        mFakeHandleAnimations.cancel();
        AnimationBundle animationbundle = mFakeHandleAnimations;
        TargetDrawable targetdrawable = mFakeHandleDrawable;
        long l = i / 2;
        Object aobj[] = new Object[14];
        aobj[0] = "ease";
        aobj[1] = Ease.Fling.easeIn;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(j);
        aobj[4] = "scaleX";
        aobj[5] = Float.valueOf(1.0F);
        aobj[6] = "scaleY";
        aobj[7] = Float.valueOf(1.0F);
        aobj[8] = "alpha";
        aobj[9] = Float.valueOf(1.0F);
        aobj[10] = "onUpdate";
        aobj[11] = mHandleDrawableUpdateListener;
        aobj[12] = "onComplete";
        aobj[13] = mFakeHandleDrawableOutListener;
        animationbundle.add(Tweener.to(targetdrawable, l, aobj));
        mFakeHandleAnimations.start();
    }

    private void animDragView(int i, int j, float f, float f1, android.animation.Animator.AnimatorListener animatorlistener)
    {
        Xlog.w("MediatekGlowPadView", (new StringBuilder()).append("animDragView duration=").append(i).append(", delay=").append(j).append(", x=").append(f).append(", y=").append(f1).toString());
        if (mDragView != null)
        {
            mDragViewAnimations.cancel();
            AnimationBundle animationbundle = mDragViewAnimations;
            DragView dragview = mDragView;
            long l = i;
            Object aobj[] = new Object[12];
            aobj[0] = "ease";
            aobj[1] = Ease.Fling.easeOut;
            aobj[2] = "delay";
            aobj[3] = Integer.valueOf(j);
            aobj[4] = "translationX";
            aobj[5] = Float.valueOf(f);
            aobj[6] = "translationY";
            aobj[7] = Float.valueOf(f1);
            aobj[8] = "onUpdate";
            aobj[9] = mUpdateListener;
            aobj[10] = "onComplete";
            aobj[11] = animatorlistener;
            animationbundle.add(Tweener.to(dragview, l, aobj));
            mDragViewAnimations.start();
            return;
        } else
        {
            Xlog.e("MediatekGlowPadView", "animDragView mDragView is null");
            return;
        }
    }

    private void animHandlerBack(int i, int j)
    {
        Xlog.d("MediatekGlowPadView", "animHandlerBack");
        animDragView(i, j, 0.0F, 0.0F, null);
        deactivateHandle(i, j);
    }

    private void announceTargets()
    {
        StringBuilder stringbuilder = new StringBuilder();
        int i = mTargetDrawables.size();
        for (int j = 0; j < i; j++)
        {
            String s = getTargetDescription(j);
            String s1 = getDirectionDescription(j);
            if (!TextUtils.isEmpty(s) && !TextUtils.isEmpty(s1))
                stringbuilder.append(String.format(s1, new Object[] {
                    s
                }));
        }

        if (stringbuilder.length() > 0)
            announceForAccessibility(stringbuilder.toString());
    }

    private void assignDefaultsIfNeeded()
    {
        if (mOuterRadius == 0.0F)
            mOuterRadius = (float)Math.max(mOuterRing.getWidth(), mOuterRing.getHeight()) / 2.0F;
        if (mSnapMargin == 0.0F)
            mSnapMargin = TypedValue.applyDimension(1, 20F, getContext().getResources().getDisplayMetrics());
        if (mInnerRadius == 0.0F)
            mInnerRadius = (float)mHandleDrawable.getWidth() / 10F;
    }

    private void computeInsets(int i, int j)
    {
        int k = getLayoutDirection();
        int l = Gravity.getAbsoluteGravity(mGravity, k);
        switch (l & 7)
        {
        case 5: // '\005'
            mHorizontalInset = i;
            break;

        case 3: // '\003'
            mHorizontalInset = 0;
            break;

        case 4: // '\004'
        default:
            mHorizontalInset = i / 2;
            break;
        }
        switch (l & 0x70)
        {
        case 80: // 'P'
            mVerticalInset = j;
            return;

        case 48: // '0'
            mVerticalInset = 0;
            return;
        }
        mVerticalInset = j / 2;
    }

    private void computeOwnerNewEventViewMotionOffset(View view)
    {
        if (view != null && mLockScreenLayout != null)
        {
            mLockScreenLayout.getLocationInLockScreenLayout(view, mNewEventViewLocationInLockScreen);
            mLockScreenLayout.getLocationInLockScreenLayout(this, mOwnerLocationInLockScreen);
            mOwnerNewEventViewOffset[0] = mOwnerLocationInLockScreen[0] - mNewEventViewLocationInLockScreen[0];
            mOwnerNewEventViewOffset[1] = mOwnerLocationInLockScreen[1] - mNewEventViewLocationInLockScreen[1];
            Log.d("MediatekGlowPadView", (new StringBuilder()).append("computeOwnerNewEventViewMotionOffset mOwnerLocationInLockScreen[0]=").append(mOwnerLocationInLockScreen[0]).append(", mOwnerLocationInLockScreen[1]=").append(mOwnerLocationInLockScreen[1]).append(", mNewEventViewParentLocationInLockScreen[0]=").append(mNewEventViewLocationInLockScreen[0]).append(", mNewEventViewLocationInLockScreen[1]=").append(mNewEventViewLocationInLockScreen[1]).append(", mOwnerNewEventViewOffset[0]=").append(mOwnerNewEventViewOffset[0]).append(", mOwnerNewEventViewOffset[1]=").append(mOwnerNewEventViewOffset[1]).toString());
        }
    }

    private float computeScaleFactor(int i, int j, int k, int l)
    {
        if (!mAllowScaling)
            return 1.0F;
        int i1 = getLayoutDirection();
        int j1 = Gravity.getAbsoluteGravity(mGravity, i1);
        float f = 1.0F;
        float f1 = 1.0F;
        switch (j1 & 7)
        {
        case 4: // '\004'
        default:
            if (i > k)
                f = (1.0F * (float)k - (float)mMaxTargetWidth) / (float)(i - mMaxTargetWidth);
            // fall through

        case 3: // '\003'
        case 5: // '\005'
            switch (j1 & 0x70)
            {
            default:
                if (j > l)
                    f1 = (1.0F * (float)l - (float)mMaxTargetHeight) / (float)(j - mMaxTargetHeight);
                break;

            case 48: // '0'
            case 80: // 'P'
                break;
            }
            break;
        }
        return Math.min(f, f1);
    }

    private String converDragViewStateCodeToString(int i)
    {
        switch (i)
        {
        case 7: // '\007'
            return "TOUCH_END";

        case 6: // '\006'
            return "TOUCH_ANIM_BACK";

        case 5: // '\005'
            return "TOUCH_TRIGGER";

        case 4: // '\004'
            return "TOUCH_FLING";

        case 3: // '\003'
            return "TOUCH_DRAGGING";

        case 2: // '\002'
            return "TOUCH_INTERSECT";

        case 1: // '\001'
            return "TOUCH_HANDLE_ANIM";

        case 0: // '\0'
            return "TOUCH_INIT";
        }
        return null;
    }

    private void deactivateHandle(final int duration, final int delay)
    {
        Xlog.d("MediatekGlowPadView", "deactivateHandle");
        mFakeHandleAnimations.cancel();
        AnimationBundle animationbundle = mFakeHandleAnimations;
        TargetDrawable targetdrawable = mFakeHandleDrawable;
        long l = duration / 2;
        Object aobj[] = new Object[12];
        aobj[0] = "ease";
        aobj[1] = Ease.Fling.easeOut;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(delay);
        aobj[4] = "x";
        aobj[5] = Float.valueOf(0.0F);
        aobj[6] = "y";
        aobj[7] = Float.valueOf(0.0F);
        aobj[8] = "onUpdate";
        aobj[9] = mHandleDrawableUpdateListener;
        aobj[10] = "onComplete";
        aobj[11] = new AnimatorListenerAdapter() {

            final MediatekGlowPadView this$0;
            final int val$delay;
            final int val$duration;

            public void onAnimationEnd(Animator animator)
            {
                Log.d("MediatekGlowPadView", "fake handle drawable back Listener onAnimationEnd");
                mFakeHandleAnimations.cancel();
                AnimationBundle animationbundle1 = mFakeHandleAnimations;
                TargetDrawable targetdrawable1 = mFakeHandleDrawable;
                long l1 = duration / 2;
                Object aobj1[] = new Object[12];
                aobj1[0] = "ease";
                aobj1[1] = Ease.Fling.easeIn;
                aobj1[2] = "delay";
                aobj1[3] = Integer.valueOf(delay);
                aobj1[4] = "scaleX";
                aobj1[5] = Float.valueOf(0.0F);
                aobj1[6] = "scaleY";
                aobj1[7] = Float.valueOf(0.0F);
                aobj1[8] = "onUpdate";
                aobj1[9] = mHandleDrawableUpdateListener;
                aobj1[10] = "onComplete";
                aobj1[11] = mFakeHandleDrawableResetListener;
                animationbundle1.add(Tweener.to(targetdrawable1, l1, aobj1));
                mFakeHandleAnimations.start();
            }

            
            {
                this$0 = MediatekGlowPadView.this;
                duration = i;
                delay = j;
                super();
            }
        }
;
        animationbundle.add(Tweener.to(targetdrawable, l, aobj));
        mFakeHandleAnimations.start();
    }

    private void deactivateTargets()
    {
        int i = mTargetDrawables.size();
        for (int j = 0; j < i; j++)
            ((TargetDrawable)mTargetDrawables.get(j)).setState(TargetDrawable.STATE_INACTIVE);

        mActiveTarget = -1;
    }

    private void dispatchOnFinishFinalAnimation()
    {
        if (mOnTriggerListener != null)
            mOnTriggerListener.onFinishFinalAnimation();
    }

    private void dispatchTriggerEvent(int i)
    {
        vibrate();
        if (mOnTriggerListener != null)
            mOnTriggerListener.onTrigger(this, i);
    }

    private float dist2(float f, float f1)
    {
        return f * f + f1 * f1;
    }

    private void doFinish()
    {
        int i = mActiveTarget;
        boolean flag;
        if (i != -1)
            flag = true;
        else
            flag = false;
        if (flag)
        {
            Log.v("MediatekGlowPadView", (new StringBuilder()).append("Finish with target hit = ").append(flag).toString());
            highlightSelected(i);
            if (!mActionCancel)
            {
                mDragViewState = 5;
                dispatchTriggerEvent(i);
            }
            if (!mAlwaysTrackFinger)
                mTargetAnimations.stop();
        } else
        {
            hideGlow(200, 0, 0.0F, mResetListenerWithPing);
            hideTargets(true, false);
        }
        setGrabbedState(0);
        if (mActionCancel)
            requestLayout();
    }

    private void doIntersectAnimation()
    {
        Xlog.d("MediatekGlowPadView", "doIntersectAnimation");
        int i = mHandlePosition.x + (int)mWaveCenterX;
        int j = mHandlePosition.y + (int)mWaveCenterY;
        int k = (i + mOwnerNewEventViewOffset[0]) - mCurrentNewEventView.getNewEventImageView().getWidth() / 2;
        int l = (j + mOwnerNewEventViewOffset[1]) - mCurrentNewEventView.getNewEventImageView().getHeight() / 2;
        animDragView(350, 50, k, l, null);
        mFakeHandleAnimations.cancel();
        AnimationBundle animationbundle = mFakeHandleAnimations;
        TargetDrawable targetdrawable = mFakeHandleDrawable;
        Object aobj[] = new Object[18];
        aobj[0] = "ease";
        aobj[1] = Ease.Fling.easeOut;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(50);
        aobj[4] = "x";
        aobj[5] = Float.valueOf(mHandlePosition.x);
        aobj[6] = "y";
        aobj[7] = Float.valueOf(mHandlePosition.y);
        aobj[8] = "scaleX";
        aobj[9] = Float.valueOf(1.0F);
        aobj[10] = "scaleY";
        aobj[11] = Float.valueOf(1.0F);
        aobj[12] = "alpha";
        aobj[13] = Float.valueOf(1.0F);
        aobj[14] = "onUpdate";
        aobj[15] = mHandleDrawableUpdateListener;
        aobj[16] = "onComplete";
        aobj[17] = mIntersectAnimResetListener;
        animationbundle.add(Tweener.to(targetdrawable, 350L, aobj));
        mFakeHandleAnimations.start();
    }

    private void drawDragView(View view, Canvas canvas, boolean flag)
    {
        Rect rect = mTempRect;
        view.getDrawingRect(rect);
        canvas.save();
        canvas.clipRect(rect, android.graphics.Region.Op.REPLACE);
        view.draw(canvas);
        canvas.restore();
    }

    private void dump()
    {
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("Outer Radius = ").append(mOuterRadius).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("SnapMargin = ").append(mSnapMargin).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("FeedbackCount = ").append(mFeedbackCount).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("VibrationDuration = ").append(mVibrationDuration).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("GlowRadius = ").append(mGlowRadius).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("WaveCenterX = ").append(mWaveCenterX).toString());
        Log.v("MediatekGlowPadView", (new StringBuilder()).append("WaveCenterY = ").append(mWaveCenterY).toString());
    }

    private void freeFling(float f, float f1)
    {
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("freeFling velX=").append(f).append(", velY=").append(f1).toString());
        switchDragViewToState(6, 0, 0, 0.0F, 0.0F);
    }

    private float getAngle(float f, int i)
    {
        return mFirstItemOffset + f * (float)i;
    }

    private String getDirectionDescription(int i)
    {
        if (mDirectionDescriptions == null || mDirectionDescriptions.isEmpty())
        {
            mDirectionDescriptions = loadDescriptions(mDirectionDescriptionsResourceId);
            if (mTargetDrawables.size() != mDirectionDescriptions.size())
            {
                Log.w("MediatekGlowPadView", "The number of target drawables must be equal to the number of direction descriptions.");
                return null;
            }
        }
        return (String)mDirectionDescriptions.get(i);
    }

    private int getResourceId(TypedArray typedarray, int i)
    {
        TypedValue typedvalue = typedarray.peekValue(i);
        if (typedvalue == null)
            return 0;
        else
            return typedvalue.resourceId;
    }

    private float getRingHeight()
    {
        return mRingScaleFactor * Math.max(mOuterRing.getHeight(), 2.0F * mOuterRadius);
    }

    private float getRingWidth()
    {
        return mRingScaleFactor * Math.max(mOuterRing.getWidth(), 2.0F * mOuterRadius);
    }

    private float getScaledGlowRadiusSquared()
    {
        float f;
        if (AccessibilityManager.getInstance(mContext).isEnabled())
            f = 1.3F * mGlowRadius;
        else
            f = mGlowRadius;
        return square(f);
    }

    private float getSliceAngle()
    {
        return (float)(-6.2831853071795862D / (double)mTargetDrawables.size());
    }

    private String getTargetDescription(int i)
    {
        if (mTargetDescriptions == null || mTargetDescriptions.isEmpty())
        {
            mTargetDescriptions = loadDescriptions(mTargetDescriptionsResourceId);
            if (mTargetDrawables.size() != mTargetDescriptions.size())
            {
                Log.w("MediatekGlowPadView", "The number of target drawables must be equal to the number of target descriptions.");
                return null;
            }
        }
        return (String)mTargetDescriptions.get(i);
    }

    private ObjectAnimator getZoomAnim(boolean flag, float f, float f1, float f2, float f3, float f4, float f5)
    {
        PropertyValuesHolder propertyvaluesholder = PropertyValuesHolder.ofFloat("alpha", new float[] {
            f, f1
        });
        PropertyValuesHolder propertyvaluesholder1 = PropertyValuesHolder.ofFloat("scaleX", new float[] {
            f2, f3
        });
        PropertyValuesHolder propertyvaluesholder2 = PropertyValuesHolder.ofFloat("scaleY", new float[] {
            f4, f5
        });
        ObjectAnimator objectanimator = ObjectAnimator.ofPropertyValuesHolder((Object)null, new PropertyValuesHolder[] {
            propertyvaluesholder, propertyvaluesholder1, propertyvaluesholder2
        });
        objectanimator.setDuration(350L).setStartDelay(50L);
        return objectanimator;
    }

    private void handleCancel(MotionEvent motionevent)
    {
        if (mDragging)
            Log.v("MediatekGlowPadView", "** Handle CANCEL");
        mActiveTarget = -1;
        int i = motionevent.findPointerIndex(mPointerId);
        if (i == -1)
            i = 0;
        switchToState(5, motionevent.getX(i), motionevent.getY(i));
    }

    private void handleDown(MotionEvent motionevent)
    {
        int i = motionevent.getActionIndex();
        float f = motionevent.getX(i);
        float f1 = motionevent.getY(i);
        switchToState(1, f, f1);
        if (!trySwitchToFirstTouchState(f, f1))
        {
            mDragging = false;
            doShakeAnimation();
            return;
        } else
        {
            mPointerId = motionevent.getPointerId(i);
            updateGlowPosition(f, f1);
            return;
        }
    }

    private void handleMove(MotionEvent motionevent)
    {
        int i = -1;
        int j = motionevent.getHistorySize();
        ArrayList arraylist = mTargetDrawables;
        int k = arraylist.size();
        float f = 0.0F;
        float f1 = 0.0F;
        float f2 = 0.0F;
        int l = motionevent.findPointerIndex(mPointerId);
        if (l != -1)
        {
            for (int i1 = 0; i1 < j + 1; i1++)
            {
                float f3;
                if (i1 < j)
                    f3 = motionevent.getHistoricalX(l, i1);
                else
                    f3 = motionevent.getX(l);
                float f4;
                if (i1 < j)
                    f4 = motionevent.getHistoricalY(l, i1);
                else
                    f4 = motionevent.getY(l);
                float f5 = f3 - mWaveCenterX;
                float f6 = f4 - mWaveCenterY;
                float f7 = (float)Math.sqrt(dist2(f5, f6));
                float f8;
                if (f7 > mOuterRadius)
                    f8 = mOuterRadius / f7;
                else
                    f8 = 1.0F;
                float f9 = f5 * f8;
                float f10 = f6 * f8;
                double d = Math.atan2(-f6, f5);
                if (!mDragging)
                    trySwitchToFirstTouchState(f3, f4);
                if (mDragging)
                {
                    float f11 = mRingScaleFactor * mOuterRadius - mSnapMargin;
                    float f12 = f11 * f11;
                    for (int j1 = 0; j1 < k; j1++)
                    {
                        TargetDrawable targetdrawable2 = (TargetDrawable)arraylist.get(j1);
                        double d1 = (double)mFirstItemOffset + (3.1415926535897931D * (2D * ((double)j1 - 0.5D))) / (double)k;
                        double d2 = (double)mFirstItemOffset + (3.1415926535897931D * (2D * (0.5D + (double)j1))) / (double)k;
                        if (!targetdrawable2.isEnabled())
                            continue;
                        boolean flag;
                        if ((d <= d1 || d > d2) && (6.2831853071795862D + d <= d1 || 6.2831853071795862D + d > d2) && (d - 6.2831853071795862D <= d1 || d - 6.2831853071795862D > d2))
                            flag = false;
                        else
                            flag = true;
                        if (flag && dist2(f5, f6) > f12)
                        {
                            i = j1;
                            f2 = (float)(-d);
                        }
                    }

                }
                f = f9;
                f1 = f10;
            }

            if (mDragging)
            {
                if (i != -1)
                {
                    switchToState(4, f, f1);
                    updateGlowPosition(f, f1);
                } else
                {
                    switchToState(3, f, f1);
                    updateGlowPosition(f, f1);
                }
                if (mActiveTarget != i)
                {
                    if (mActiveTarget != -1)
                    {
                        TargetDrawable targetdrawable1 = (TargetDrawable)arraylist.get(mActiveTarget);
                        if (targetdrawable1.hasState(TargetDrawable.STATE_FOCUSED))
                            targetdrawable1.setState(TargetDrawable.STATE_INACTIVE);
                        if (mMagneticTargets)
                            updateTargetPosition(mActiveTarget, mWaveCenterX, mWaveCenterY);
                    }
                    if (i != -1)
                    {
                        TargetDrawable targetdrawable = (TargetDrawable)arraylist.get(i);
                        if (targetdrawable.hasState(TargetDrawable.STATE_FOCUSED))
                            targetdrawable.setState(TargetDrawable.STATE_FOCUSED);
                        if (mMagneticTargets)
                            updateTargetPosition(i, mWaveCenterX, mWaveCenterY, f2);
                        if (AccessibilityManager.getInstance(mContext).isEnabled())
                            announceForAccessibility(getTargetDescription(i));
                    }
                }
                mActiveTarget = i;
                return;
            }
        }
    }

    private void handleTouchCancel(MotionEvent motionevent)
    {
        handleUp(motionevent);
    }

    private void handleTrigger(LockScreenNewEventView lockscreenneweventview)
    {
        if (mOnTriggerListener != null)
            mOnTriggerListener.onTrigger(lockscreenneweventview, -1);
        Intent intent = new Intent();
        int i = lockscreenneweventview.getResourceId();
        switch (i)
        {
        case 33685615: 
            intent.setComponent(new ComponentName("com.android.email", "com.android.email.activity.Welcome"));
            launchActivity(intent);
            return;

        case 33685616: 
            intent.setComponent(new ComponentName("com.android.contacts", "com.android.contacts.activities.DialtactsActivity"));
            launchActivity(intent);
            return;

        case 33685617: 
            intent.setComponent(new ComponentName("com.android.mms", "com.android.mms.ui.ConversationList"));
            launchActivity(intent);
            return;
        }
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("handleTrigger unknown resource id, resourceId=").append(i).toString());
    }

    private void handleUp(MotionEvent motionevent)
    {
        if (mDragging)
            Log.v("MediatekGlowPadView", "** Handle RELEASE");
        int i = motionevent.getActionIndex();
        if (motionevent.getPointerId(i) == mPointerId)
            switchToState(5, motionevent.getX(i), motionevent.getY(i));
    }

    private void hideAllNewEventViews()
    {
        Xlog.d("MediatekGlowPadView", "hideAllNewEventViews");
        ArrayList arraylist = mUnReadEventView.getNewEventViewList();
        for (int i = 0; i < arraylist.size(); i++)
        {
            LockScreenNewEventView lockscreenneweventview = (LockScreenNewEventView)arraylist.get(i);
            ObjectAnimator objectanimator = getZoomAnim(true, lockscreenneweventview.getAlpha(), 0.0F, lockscreenneweventview.getScaleX(), 0.0F, lockscreenneweventview.getScaleY(), 0.0F);
            objectanimator.setTarget(lockscreenneweventview);
            objectanimator.start();
        }

    }

    private void hideGlow(int i, int j, float f, android.animation.Animator.AnimatorListener animatorlistener)
    {
        mGlowAnimations.cancel();
        AnimationBundle animationbundle = mGlowAnimations;
        PointCloud.GlowManager glowmanager = mPointCloud.glowManager;
        long l = i;
        Object aobj[] = new Object[14];
        aobj[0] = "ease";
        aobj[1] = Ease.Quart.easeOut;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(j);
        aobj[4] = "alpha";
        aobj[5] = Float.valueOf(f);
        aobj[6] = "x";
        aobj[7] = Float.valueOf(0.0F);
        aobj[8] = "y";
        aobj[9] = Float.valueOf(0.0F);
        aobj[10] = "onUpdate";
        aobj[11] = mUpdateListener;
        aobj[12] = "onComplete";
        aobj[13] = animatorlistener;
        animationbundle.add(Tweener.to(glowmanager, l, aobj));
        mGlowAnimations.start();
    }

    private void hideOtherNewEventViews()
    {
        Xlog.d("MediatekGlowPadView", "hideOtherNewEventViews");
        ArrayList arraylist = mUnReadEventView.getNewEventViewList();
        for (int i = 0; i < arraylist.size(); i++)
        {
            LockScreenNewEventView lockscreenneweventview = (LockScreenNewEventView)arraylist.get(i);
            if (lockscreenneweventview != mCurrentNewEventView)
            {
                ObjectAnimator objectanimator = getZoomAnim(true, lockscreenneweventview.getAlpha(), 0.0F, lockscreenneweventview.getScaleX(), 0.0F, lockscreenneweventview.getScaleY(), 0.0F);
                objectanimator.setTarget(lockscreenneweventview);
                objectanimator.start();
            }
        }

    }

    private void hideTargets(boolean flag, boolean flag1)
    {
        mTargetAnimations.cancel();
        mAnimatingTargets = flag;
        int i;
        if (flag)
            i = 200;
        else
            i = 0;
        char c;
        if (flag)
            c = '\310';
        else
            c = '\0';
        float f;
        if (flag1)
            f = 1.0F;
        else
            f = 0.8F;
        int j = mTargetDrawables.size();
        android.animation.TimeInterpolator timeinterpolator = Ease.Cubic.easeOut;
        for (int k = 0; k < j; k++)
        {
            TargetDrawable targetdrawable1 = (TargetDrawable)mTargetDrawables.get(k);
            targetdrawable1.setState(TargetDrawable.STATE_INACTIVE);
            AnimationBundle animationbundle1 = mTargetAnimations;
            long l1 = i;
            Object aobj1[] = new Object[12];
            aobj1[0] = "ease";
            aobj1[1] = timeinterpolator;
            aobj1[2] = "alpha";
            aobj1[3] = Float.valueOf(0.0F);
            aobj1[4] = "scaleX";
            aobj1[5] = Float.valueOf(f);
            aobj1[6] = "scaleY";
            aobj1[7] = Float.valueOf(f);
            aobj1[8] = "delay";
            aobj1[9] = Integer.valueOf(c);
            aobj1[10] = "onUpdate";
            aobj1[11] = mUpdateListener;
            animationbundle1.add(Tweener.to(targetdrawable1, l1, aobj1));
        }

        float f1;
        if (flag1)
            f1 = 1.0F;
        else
            f1 = 0.5F;
        float f2 = f1 * mRingScaleFactor;
        AnimationBundle animationbundle = mTargetAnimations;
        TargetDrawable targetdrawable = mOuterRing;
        long l = i;
        Object aobj[] = new Object[14];
        aobj[0] = "ease";
        aobj[1] = timeinterpolator;
        aobj[2] = "alpha";
        aobj[3] = Float.valueOf(0.0F);
        aobj[4] = "scaleX";
        aobj[5] = Float.valueOf(f2);
        aobj[6] = "scaleY";
        aobj[7] = Float.valueOf(f2);
        aobj[8] = "delay";
        aobj[9] = Integer.valueOf(c);
        aobj[10] = "onUpdate";
        aobj[11] = mUpdateListener;
        aobj[12] = "onComplete";
        aobj[13] = mTargetUpdateListener;
        animationbundle.add(Tweener.to(targetdrawable, l, aobj));
        mTargetAnimations.start();
    }

    private void hideUnselected(int i)
    {
        for (int j = 0; j < mTargetDrawables.size(); j++)
            if (j != i)
                ((TargetDrawable)mTargetDrawables.get(j)).setAlpha(0.0F);

    }

    private void highlightSelected(int i)
    {
        ((TargetDrawable)mTargetDrawables.get(i)).setState(TargetDrawable.STATE_ACTIVE);
        hideUnselected(i);
    }

    private boolean hitInCenterRing(float f, float f1)
    {
        float f2 = f - mWaveCenterX;
        float f3 = f1 - mWaveCenterY;
        return mAlwaysTrackFinger || dist2(f2, f3) <= getScaledGlowRadiusSquared();
    }

    private boolean interceptTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getAction();
        boolean flag = mTouchIntercepted;
        switch (i)
        {
        case 1: // '\001'
        case 3: // '\003'
            setShouldIntercept(false);
            break;

        case 0: // '\0'
            if (!hitInCenterRing(motionevent.getX(), motionevent.getY()))
                flag = true;
            else
                flag = false;
            setShouldIntercept(flag);
            break;
        }
        if (flag)
        {
            MotionEvent motionevent1 = MotionEvent.obtain(motionevent);
            motionevent1.offsetLocation(mOwnerRecepientOffsets[0], mOwnerRecepientOffsets[1]);
            boolean flag1 = mTouchRecepient.dispatchTouchEvent(motionevent1);
            motionevent1.recycle();
            return flag1;
        } else
        {
            return false;
        }
    }

    private void internalSetTargetResources(int i)
    {
        ArrayList arraylist = loadDrawableArray(i);
        mTargetDrawables = arraylist;
        mTargetResourceId = i;
        int j = mHandleDrawable.getWidth();
        int k = mHandleDrawable.getHeight();
        int l = arraylist.size();
        for (int i1 = 0; i1 < l; i1++)
        {
            TargetDrawable targetdrawable = (TargetDrawable)arraylist.get(i1);
            j = Math.max(j, targetdrawable.getWidth());
            k = Math.max(k, targetdrawable.getHeight());
        }

        if (mMaxTargetWidth == j && mMaxTargetHeight == k)
        {
            updateTargetPositions(mWaveCenterX, mWaveCenterY);
            updatePointCloudPosition(mWaveCenterX, mWaveCenterY);
            return;
        } else
        {
            mMaxTargetWidth = j;
            mMaxTargetHeight = k;
            requestLayout();
            return;
        }
    }

    private void invlidateGlobalRegion(View view)
    {
        int i = view.getWidth();
        int j = view.getHeight();
        RectF rectf = new RectF(0.0F, 0.0F, i, j);
        rectf.offset(view.getX() - (float)(i / 2), view.getY() - (float)(j / 2));
        for (Object obj = this; ((View) (obj)).getParent() != null && (((View) (obj)).getParent() instanceof View); ((View) (obj)).invalidate((int)Math.floor(rectf.left), (int)Math.floor(rectf.top), (int)Math.ceil(rectf.right), (int)Math.ceil(rectf.bottom)))
        {
            obj = (View)((View) (obj)).getParent();
            ((View) (obj)).getMatrix().mapRect(rectf);
        }

    }

    private void launchActivity(Intent intent)
    {
        intent.setFlags(0x34000000);
        try
        {
            ActivityManagerNative.getDefault().dismissKeyguardOnNextActivity();
        }
        catch (RemoteException remoteexception)
        {
            Xlog.w("MediatekGlowPadView", "can't dismiss keyguard on launch");
        }
        try
        {
            mContext.startActivity(intent);
            return;
        }
        catch (ActivityNotFoundException activitynotfoundexception)
        {
            Xlog.w("MediatekGlowPadView", (new StringBuilder()).append("Activity not found for intent + ").append(intent.getAction()).toString());
        }
    }

    private ArrayList loadDescriptions(int i)
    {
        TypedArray typedarray = getContext().getResources().obtainTypedArray(i);
        int j = typedarray.length();
        ArrayList arraylist = new ArrayList(j);
        for (int k = 0; k < j; k++)
            arraylist.add(typedarray.getString(k));

        typedarray.recycle();
        return arraylist;
    }

    private ArrayList loadDrawableArray(int i)
    {
        Resources resources = getContext().getResources();
        TypedArray typedarray = resources.obtainTypedArray(i);
        int j = typedarray.length();
        ArrayList arraylist = new ArrayList(j);
        for (int k = 0; k < j; k++)
        {
            TypedValue typedvalue = typedarray.peekValue(k);
            int l;
            if (typedvalue != null)
                l = typedvalue.resourceId;
            else
                l = 0;
            arraylist.add(new TargetDrawable(resources, l));
        }

        typedarray.recycle();
        return arraylist;
    }

    private void onDragMove(int i, int j)
    {
        float f = (float)i - mWaveCenterX;
        float f1 = (float)j - mWaveCenterY;
        float f2 = (float)Math.sqrt(dist2(f, f1));
        float f3 = 0.5F * mOuterRadius;
        float f4;
        if (f2 > f3)
            f4 = f3 / f2;
        else
            f4 = 1.0F;
        mCurrentFakeHandleTargetX = f * f4;
        mCurrentFakeHandleTargetY = f1 * f4;
        updateHandleDrawablePositions(false);
        float f5 = (float)Math.sqrt(dist2(mFakeHandleRealX, mFakeHandleRealY)) + mDragSnapMargin;
        float f6 = f5 * f5;
        if (dist2(f, f1) < f6)
        {
            mTouchTriggered = true;
            int k = (int)(mCurrentFakeHandleTargetX + mWaveCenterX) - mCurrentNewEventView.getNewEventImageView().getWidth() / 2;
            int l = (int)(mCurrentFakeHandleTargetY + mWaveCenterY) - mCurrentNewEventView.getNewEventImageView().getHeight() / 2;
            mDragView.move(k + mOwnerLocationInLockScreen[0], l + mOwnerLocationInLockScreen[1]);
            updateHandleDrawablePositions(true);
            int ai[] = mFakeHandleDrawable.getState();
            if (ai != null && !Arrays.equals(ai, TargetDrawable.STATE_FOCUSED))
            {
                vibrate();
                mFakeHandleDrawable.setState(TargetDrawable.STATE_FOCUSED);
            }
        } else
        {
            mTouchTriggered = false;
            mFakeHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
        }
        invalidate();
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onDragMove mTouchTriggered=").append(mTouchTriggered).append(", x=").append(i).append(", y=").append(j).append(",").toString());
    }

    private void onDragStart(int i, int j)
    {
        Xlog.d("MediatekGlowPadView", "onDragStart");
        float f = ((float)i + 0.5F * (float)mDragView.getWidth()) - mWaveCenterX;
        float f1 = ((float)j + 0.5F * (float)mDragView.getHeight()) - mWaveCenterY;
        float f2 = (float)Math.sqrt(dist2(f, f1));
        float f3 = 0.5F * mOuterRadius;
        float f4;
        if (f2 > f3)
            f4 = f3 / f2;
        else
            f4 = 1.0F;
        float f5 = f * f4;
        float f6 = f1 * f4;
        mHandlePosition.x = (int)f5;
        mHandlePosition.y = (int)f6;
        mFakeHandleRealX = mWaveCenterX;
        mFakeHandleRealY = mWaveCenterY;
        mCurrentFakeHandleTargetX = mWaveCenterX;
        mCurrentFakeHandleTargetY = mWaveCenterY;
        invalidate();
    }

    private void refreshPositions()
    {
        if (mTouchRecepient == null)
        {
            return;
        } else
        {
            mTouchRecepient.getLocationOnScreen(mTouchRecepientRawLocation);
            getLocationOnScreen(mOwnerRawLocation);
            mOwnerRecepientOffsets[0] = mOwnerRawLocation[0] - mTouchRecepientRawLocation[0];
            mOwnerRecepientOffsets[1] = mOwnerRawLocation[1] - mTouchRecepientRawLocation[1];
            return;
        }
    }

    private boolean replaceTargetDrawables(Resources resources, int i, int j)
    {
        boolean flag;
        if (i != 0 && j != 0)
        {
            flag = false;
            ArrayList arraylist = mTargetDrawables;
            int k = arraylist.size();
            for (int l = 0; l < k; l++)
            {
                TargetDrawable targetdrawable = (TargetDrawable)arraylist.get(l);
                if (targetdrawable != null && targetdrawable.getResourceId() == i)
                {
                    targetdrawable.setDrawable(resources, j);
                    flag = true;
                }
            }

            if (flag)
            {
                requestLayout();
                return flag;
            }
        } else
        {
            flag = false;
        }
        return flag;
    }

    private int resolveMeasured(int i, int j)
    {
        int k = android.view.View.MeasureSpec.getSize(i);
        switch (android.view.View.MeasureSpec.getMode(i))
        {
        case -2147483648: 
            return Math.min(k, j);

        case 0: // '\0'
            return j;
        }
        return k;
    }

    private void setGrabbedState(int i)
    {
        if (i != mGrabbedState)
        {
            if (i != 0)
                vibrate();
            mGrabbedState = i;
            if (mOnTriggerListener != null)
            {
                if (i == 0)
                    mOnTriggerListener.onReleased(this, 1);
                else
                    mOnTriggerListener.onGrabbed(this, 1);
                mOnTriggerListener.onGrabbedStateChange(this, i);
            }
        }
    }

    private void setShouldIntercept(boolean flag)
    {
        mTouchIntercepted = flag;
    }

    private void showAllNewEventViews()
    {
        Xlog.d("MediatekGlowPadView", "showAllNewEventViews");
        ArrayList arraylist = mUnReadEventView.getNewEventViewList();
        for (int i = 0; i < arraylist.size(); i++)
        {
            LockScreenNewEventView lockscreenneweventview = (LockScreenNewEventView)arraylist.get(i);
            ObjectAnimator objectanimator = getZoomAnim(false, lockscreenneweventview.getAlpha(), 1.0F, lockscreenneweventview.getScaleX(), 1.0F, lockscreenneweventview.getScaleY(), 1.0F);
            objectanimator.setTarget(lockscreenneweventview);
            objectanimator.start();
        }

    }

    private void showGlow(int i, int j, float f, android.animation.Animator.AnimatorListener animatorlistener)
    {
        mGlowAnimations.cancel();
        AnimationBundle animationbundle = mGlowAnimations;
        PointCloud.GlowManager glowmanager = mPointCloud.glowManager;
        long l = i;
        Object aobj[] = new Object[10];
        aobj[0] = "ease";
        aobj[1] = Ease.Cubic.easeIn;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(j);
        aobj[4] = "alpha";
        aobj[5] = Float.valueOf(f);
        aobj[6] = "onUpdate";
        aobj[7] = mUpdateListener;
        aobj[8] = "onComplete";
        aobj[9] = animatorlistener;
        animationbundle.add(Tweener.to(glowmanager, l, aobj));
        mGlowAnimations.start();
    }

    private void showOtherNewEventViews()
    {
        Xlog.d("MediatekGlowPadView", "showOtherNewEventViews");
        ArrayList arraylist = mUnReadEventView.getNewEventViewList();
        for (int i = 0; i < arraylist.size(); i++)
        {
            LockScreenNewEventView lockscreenneweventview = (LockScreenNewEventView)arraylist.get(i);
            if (lockscreenneweventview != mCurrentNewEventView)
            {
                ObjectAnimator objectanimator = getZoomAnim(false, lockscreenneweventview.getAlpha(), 1.0F, lockscreenneweventview.getScaleX(), 1.0F, lockscreenneweventview.getScaleY(), 1.0F);
                objectanimator.setTarget(lockscreenneweventview);
                objectanimator.start();
            }
        }

    }

    private void showTargets(boolean flag)
    {
        mTargetAnimations.stop();
        mAnimatingTargets = flag;
        byte byte0;
        if (flag)
            byte0 = 50;
        else
            byte0 = 0;
        int i;
        if (flag)
            i = 200;
        else
            i = 0;
        int j = mTargetDrawables.size();
        for (int k = 0; k < j; k++)
        {
            TargetDrawable targetdrawable1 = (TargetDrawable)mTargetDrawables.get(k);
            targetdrawable1.setState(TargetDrawable.STATE_INACTIVE);
            AnimationBundle animationbundle1 = mTargetAnimations;
            long l1 = i;
            Object aobj1[] = new Object[12];
            aobj1[0] = "ease";
            aobj1[1] = Ease.Cubic.easeOut;
            aobj1[2] = "alpha";
            aobj1[3] = Float.valueOf(1.0F);
            aobj1[4] = "scaleX";
            aobj1[5] = Float.valueOf(1.0F);
            aobj1[6] = "scaleY";
            aobj1[7] = Float.valueOf(1.0F);
            aobj1[8] = "delay";
            aobj1[9] = Integer.valueOf(byte0);
            aobj1[10] = "onUpdate";
            aobj1[11] = mUpdateListener;
            animationbundle1.add(Tweener.to(targetdrawable1, l1, aobj1));
        }

        float f = 1.0F * mRingScaleFactor;
        AnimationBundle animationbundle = mTargetAnimations;
        TargetDrawable targetdrawable = mOuterRing;
        long l = i;
        Object aobj[] = new Object[14];
        aobj[0] = "ease";
        aobj[1] = Ease.Cubic.easeOut;
        aobj[2] = "alpha";
        aobj[3] = Float.valueOf(1.0F);
        aobj[4] = "scaleX";
        aobj[5] = Float.valueOf(f);
        aobj[6] = "scaleY";
        aobj[7] = Float.valueOf(f);
        aobj[8] = "delay";
        aobj[9] = Integer.valueOf(byte0);
        aobj[10] = "onUpdate";
        aobj[11] = mUpdateListener;
        aobj[12] = "onComplete";
        aobj[13] = mTargetUpdateListener;
        animationbundle.add(Tweener.to(targetdrawable, l, aobj));
        mTargetAnimations.start();
    }

    private float square(float f)
    {
        return f * f;
    }

    private void startBackgroundAnimation(int i, float f)
    {
        android.graphics.drawable.Drawable drawable = getBackground();
        if (mAlwaysTrackFinger && drawable != null)
        {
            if (mBackgroundAnimator != null)
                mBackgroundAnimator.animator.cancel();
            long l = i;
            Object aobj[] = new Object[6];
            aobj[0] = "ease";
            aobj[1] = Ease.Cubic.easeIn;
            aobj[2] = "alpha";
            aobj[3] = Integer.valueOf((int)(255F * f));
            aobj[4] = "delay";
            aobj[5] = Integer.valueOf(50);
            mBackgroundAnimator = Tweener.to(drawable, l, aobj);
            mBackgroundAnimator.animator.start();
        }
    }

    private void startWaveAnimation()
    {
        mWaveAnimations.cancel();
        mPointCloud.waveManager.setAlpha(1.0F);
        mPointCloud.waveManager.setRadius((float)mHandleDrawable.getWidth() / 2.0F);
        AnimationBundle animationbundle = mWaveAnimations;
        PointCloud.WaveManager wavemanager = mPointCloud.waveManager;
        Object aobj[] = new Object[10];
        aobj[0] = "ease";
        aobj[1] = Ease.Quad.easeOut;
        aobj[2] = "delay";
        aobj[3] = Integer.valueOf(0);
        aobj[4] = "radius";
        aobj[5] = Float.valueOf(2.0F * mOuterRadius);
        aobj[6] = "onUpdate";
        aobj[7] = mUpdateListener;
        aobj[8] = "onComplete";
        aobj[9] = new AnimatorListenerAdapter() {

            final MediatekGlowPadView this$0;

            public void onAnimationEnd(Animator animator)
            {
                mPointCloud.waveManager.setRadius(0.0F);
                mPointCloud.waveManager.setAlpha(0.0F);
            }

            
            {
                this$0 = MediatekGlowPadView.this;
                super();
            }
        }
;
        animationbundle.add(Tweener.to(wavemanager, 1350L, aobj));
        mWaveAnimations.start();
    }

    private void stopAndHideWaveAnimation()
    {
        mWaveAnimations.cancel();
        mPointCloud.waveManager.setAlpha(0.0F);
    }

    private void switchDragViewToState(int i, int j, int k, float f, float f1)
    {
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("switchDrageViewToState enter mDragViewState=").append(converDragViewStateCodeToString(mDragViewState)).append(", new state=").append(converDragViewStateCodeToString(i)).append("mPendingDragViewState=").append(converDragViewStateCodeToString(mPendingDragViewState)).append(", eventX=").append(j).append(", eventY=").append(k).toString());
        if (mDragViewState == 1 && mFakeHandleAnimating)
        {
            mPendingDragViewState = i;
            mPendingEvent.eventX = j;
            mPendingEvent.eventY = k;
            mPendingEvent.velocityX = f;
            mPendingEvent.velocityY = f1;
            Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("switchDrageViewToState exit, mDragViewState=").append(mDragViewState).append(", mPendingDragViewState=").append(mPendingDragViewState).toString());
            return;
        }
        switch (i)
        {
        default:
            break;

        case 7: // '\007'
            if (mFakeHandleDrawable != null)
            {
                mFakeHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
                mFakeHandleDrawable.setEnabled(false);
            }
            if (mHandleDrawable != null)
                mHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
            if (mCurrentNewEventView != null)
            {
                mCurrentNewEventView.setVisibility(0);
                mCurrentNewEventView = null;
            }
            if (mDragView != null)
            {
                mDragView.remove();
                mDragView = null;
            }
            mFakeHandleRealX = mWaveCenterX;
            mFakeHandleRealY = mWaveCenterY;
            mCurrentFakeHandleTargetX = mWaveCenterX;
            mCurrentFakeHandleTargetY = mWaveCenterY;
            mDragViewState = 7;
            mPendingDragViewState = -1;
            break;

        case 5: // '\005'
            mDragViewState = 5;
            handleTrigger(mCurrentNewEventView);
            break;

        case 6: // '\006'
            mTouchTriggered = false;
            mFakeHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
            mDragViewState = 6;
            showOtherNewEventViews();
            animHandlerBack(200, 20);
            break;

        case 4: // '\004'
            mDragViewState = 4;
            freeFling(f, f1);
            break;

        case 3: // '\003'
            if (mDragViewState == 3);
            mDragViewState = 3;
            mDragView.move(j + mOwnerLocationInLockScreen[0], k + mOwnerLocationInLockScreen[1]);
            onDragMove(j + mCurrentNewEventView.getNewEventImageView().getWidth() / 2, k + mCurrentNewEventView.getNewEventImageView().getHeight() / 2);
            break;

        case 2: // '\002'
            mDragViewState = 2;
            doIntersectAnimation();
            break;

        case 0: // '\0'
            mOnTriggerListener.onGrabbedStateChange(this, 1);
            mDragViewState = 0;
            mDragViewDoingTouch = true;
            mFakeHandleAnimating = false;
            Bitmap bitmap = createDragBitmap(mCurrentNewEventView, mCanvas);
            mNewEventViewInLockScreenX = j;
            mNewEventViewInLockScreenY = k;
            int l = mNewEventViewInLockScreenX + mOwnerLocationInLockScreen[0];
            int i1 = mNewEventViewInLockScreenY + mOwnerLocationInLockScreen[1];
            Xlog.v("MediatekGlowPadView", (new StringBuilder()).append("handleTouchDown registrationX=").append(l).append(", registrationY=").append(i1).toString());
            mDragView = new DragView(mLockScreenLayout, bitmap, l, i1, 0, 0, bitmap.getWidth(), bitmap.getHeight(), mCurrentNewEventView.getScaleX());
            mDragView.show(l, i1);
            onDragStart(j + mCurrentNewEventView.getNewEventImageView().getWidth() / 2, k + mCurrentNewEventView.getNewEventImageView().getHeight() / 2);
            mCurrentNewEventView.setVisibility(4);
            hideOtherNewEventViews();
            // fall through

        case 1: // '\001'
            mDragViewState = 1;
            mFakeHandleAnimating = true;
            activateHandle(100, 0);
            break;
        }
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("switchDrageViewToState exit, mDragViewState=").append(mDragViewState).append(", mPendingDragViewState=").append(mPendingDragViewState).toString());
    }

    private void switchToState(int i, float f, float f1)
    {
        switch (i)
        {
        case 5: // '\005'
            mGlowPadViewState = 5;
            doFinish();
            return;

        case 4: // '\004'
            mGlowPadViewState = 4;
            mHandleDrawable.setAlpha(0.0F);
            showGlow(0, 0, 0.0F, null);
            return;

        case 3: // '\003'
            mGlowPadViewState = 3;
            mHandleDrawable.setAlpha(0.0F);
            showGlow(0, 0, 1.0F, null);
            return;

        case 2: // '\002'
            mGlowPadViewState = 2;
            mHandleDrawable.setAlpha(0.0F);
            deactivateTargets();
            showTargets(true);
            startBackgroundAnimation(200, 1.0F);
            setGrabbedState(1);
            if (AccessibilityManager.getInstance(mContext).isEnabled())
            {
                announceTargets();
                return;
            }
            // fall through

        default:
            return;

        case 1: // '\001'
            mGlowPadViewState = 0;
            startBackgroundAnimation(0, 0.0F);
            return;

        case 0: // '\0'
            mGlowPadViewState = 0;
            deactivateTargets();
            hideGlow(0, 0, 0.0F, null);
            startBackgroundAnimation(0, 0.0F);
            mHandleDrawable.setState(TargetDrawable.STATE_INACTIVE);
            mHandleDrawable.setAlpha(1.0F);
            return;
        }
    }

    private boolean trySwitchToFirstTouchState(float f, float f1)
    {
        float f2 = f - mWaveCenterX;
        float f3 = f1 - mWaveCenterY;
        if (!mAlwaysTrackFinger && dist2(f2, f3) > getScaledGlowRadiusSquared())
            return false;
        if (mLockScreenLayout != null)
            hideAllNewEventViews();
        Log.v("MediatekGlowPadView", "** Handle HIT");
        switchToState(2, f, f1);
        updateGlowPosition(f2, f3);
        mDragging = true;
        return true;
    }

    private void updateGlobalLayoutListenr(boolean flag)
    {
        if (flag)
        {
            if (!mLayoutListenerSet)
            {
                addOnLayoutChangeListener(mOnLayoutListener);
                mLayoutListenerSet = true;
            }
            return;
        } else
        {
            removeOnLayoutChangeListener(mOnLayoutListener);
            mLayoutListenerSet = false;
            return;
        }
    }

    private void updateGlowPosition(float f, float f1)
    {
        float f2 = f - mOuterRing.getX();
        float f3 = f1 - mOuterRing.getY();
        float f4 = f2 * (1.0F / mRingScaleFactor);
        float f5 = f3 * (1.0F / mRingScaleFactor);
        mPointCloud.glowManager.setX(f4 + mOuterRing.getX());
        mPointCloud.glowManager.setY(f5 + mOuterRing.getY());
    }

    private void updateHandleDrawablePositions(boolean flag)
    {
        if (mDragViewState == 3 && mFakeHandleDrawable != null)
        {
            if (!flag)
            {
                float f = mFakeHandleDrawable.getX();
                float f1 = mFakeHandleDrawable.getY();
                int i = (int)(mCurrentFakeHandleTargetX - f);
                int j = (int)(mCurrentFakeHandleTargetY - f1);
                int k = i * i + j * j;
                if (k > mTouchSlopSqure)
                {
                    int l = (int)Math.sqrt(k);
                    int i1 = (i * mTouchSlop) / l;
                    int j1 = (j * mTouchSlop) / l;
                    mFakeHandleRealX = mFakeHandleRealX + (float)i1;
                    mFakeHandleRealY = mFakeHandleRealY + (float)j1;
                    Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("oldX=").append(f).append(", oldY=").append(f1).append(", deltaX=").append(i).append(", deltaY=").append(j).append(", distance=").append(l).append(", offsetX=").append(i1).append(", offsetY=").append(j1).append(", mFakeHandleRealX=").append(mFakeHandleRealX).append(", mFakeHandleRealY=").append(mFakeHandleRealY).toString());
                    invalidate();
                } else
                {
                    mFakeHandleRealX = mCurrentFakeHandleTargetX;
                    mFakeHandleRealY = mCurrentFakeHandleTargetY;
                }
            } else
            {
                mFakeHandleRealX = mCurrentFakeHandleTargetX;
                mFakeHandleRealY = mCurrentFakeHandleTargetY;
            }
            mFakeHandleDrawable.setX(mFakeHandleRealX);
            mFakeHandleDrawable.setY(mFakeHandleRealY);
            return;
        } else
        {
            return;
        }
    }

    private void updatePointCloudPosition(float f, float f1)
    {
        mPointCloud.setCenter(f, f1);
    }

    private void updateTargetPosition(int i, float f, float f1)
    {
        updateTargetPosition(i, f, f1, getAngle(getSliceAngle(), i));
    }

    private void updateTargetPosition(int i, float f, float f1, float f2)
    {
        float f3 = getRingWidth() / 2.0F;
        float f4 = getRingHeight() / 2.0F;
        if (i >= 0)
        {
            TargetDrawable targetdrawable = (TargetDrawable)mTargetDrawables.get(i);
            targetdrawable.setPositionX(f);
            targetdrawable.setPositionY(f1);
            targetdrawable.setX(f3 * (float)Math.cos(f2));
            targetdrawable.setY(f4 * (float)Math.sin(f2));
        }
    }

    private void updateTargetPositions(float f, float f1)
    {
        updateTargetPositions(f, f1, false);
    }

    private void updateTargetPositions(float f, float f1, boolean flag)
    {
        int i = mTargetDrawables.size();
        float f2 = getSliceAngle();
        for (int j = 0; j < i; j++)
            if (!flag || j != mActiveTarget)
                updateTargetPosition(j, f, f1, getAngle(f2, j));

    }

    private void vibrate()
    {
        int i = 1;
        if (android.provider.Settings.System.getIntForUser(mContext.getContentResolver(), "haptic_feedback_enabled", i, -2) == 0)
            i = 0;
        if (mVibrator != null && i != 0)
            mVibrator.vibrate(mVibrationDuration);
    }

    public Bitmap createDragBitmap(View view, Canvas canvas)
    {
        Bitmap bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), android.graphics.Bitmap.Config.ARGB_8888);
        canvas.setBitmap(bitmap);
        drawDragView(view, canvas, true);
        canvas.setBitmap(null);
        return bitmap;
    }

    public boolean dispatchTouchEvent(MotionEvent motionevent)
    {
        View view = mTouchRecepient;
        boolean flag = false;
        if (view != null)
            flag = interceptTouchEvent(motionevent);
        if (flag)
            return true;
        else
            return super.dispatchTouchEvent(motionevent);
    }

    public void doShakeAnimation()
    {
        if (mLockScreenLayout != null)
            mLockScreenLayout.beginShakeAnimation();
    }

    public int getDirectionDescriptionsResourceId()
    {
        return mDirectionDescriptionsResourceId;
    }

    public int getResourceIdForTarget(int i)
    {
        if (i >= 0)
        {
            TargetDrawable targetdrawable = (TargetDrawable)mTargetDrawables.get(i);
            if (targetdrawable == null)
                return 0;
            else
                return targetdrawable.getResourceId();
        } else
        {
            return -1;
        }
    }

    protected int getScaledSuggestedMinimumHeight()
    {
        return (int)(mRingScaleFactor * Math.max(mOuterRing.getHeight(), 2.0F * mOuterRadius) + (float)mMaxTargetHeight);
    }

    protected int getScaledSuggestedMinimumWidth()
    {
        return (int)(mRingScaleFactor * Math.max(mOuterRing.getWidth(), 2.0F * mOuterRadius) + (float)mMaxTargetWidth);
    }

    protected int getSuggestedMinimumHeight()
    {
        return (int)(Math.max(mOuterRing.getHeight(), 2.0F * mOuterRadius) + (float)mMaxTargetHeight);
    }

    protected int getSuggestedMinimumWidth()
    {
        return (int)(Math.max(mOuterRing.getWidth(), 2.0F * mOuterRadius) + (float)mMaxTargetWidth);
    }

    public int getTargetDescriptionsResourceId()
    {
        return mTargetDescriptionsResourceId;
    }

    public int getTargetPosition(int i)
    {
        for (int j = 0; j < mTargetDrawables.size(); j++)
            if (((TargetDrawable)mTargetDrawables.get(j)).getResourceId() == i)
                return j;

        return -1;
    }

    public int getTargetResourceId()
    {
        return mTargetResourceId;
    }

    public float getWaveCenterX()
    {
        return mWaveCenterX;
    }

    public float getWaveCenterY()
    {
        return mWaveCenterY;
    }

    public void onAttachedToWindow()
    {
        super.onAttachedToWindow();
        updateGlobalLayoutListenr(true);
    }

    public void onDetachedFromWindow()
    {
        super.onDetachedFromWindow();
        updateGlobalLayoutListenr(false);
        setTouchRecepient(null);
    }

    protected void onDraw(Canvas canvas)
    {
        mPointCloud.draw(canvas);
        mOuterRing.draw(canvas);
        int i = mTargetDrawables.size();
        for (int j = 0; j < i; j++)
        {
            TargetDrawable targetdrawable = (TargetDrawable)mTargetDrawables.get(j);
            if (targetdrawable != null)
                targetdrawable.draw(canvas);
        }

        mHandleDrawable.draw(canvas);
        if (mFakeHandleDrawable != null)
        {
            mFakeHandleDrawable.draw(canvas);
            updateHandleDrawablePositions(false);
        }
    }

    public boolean onHoverEvent(MotionEvent motionevent)
    {
        if (AccessibilityManager.getInstance(mContext).isTouchExplorationEnabled())
        {
            int i = motionevent.getAction();
            switch (i)
            {
            case 10: // '\n'
                motionevent.setAction(1);
                break;

            case 7: // '\007'
                motionevent.setAction(2);
                break;

            case 9: // '\t'
                motionevent.setAction(0);
                break;
            }
            onTouchEvent(motionevent);
            motionevent.setAction(i);
        }
        super.onHoverEvent(motionevent);
        return true;
    }

    protected void onLayout(boolean flag, int i, int j, int k, int l)
    {
        super.onLayout(flag, i, j, k, l);
        int i1 = k - i;
        int j1 = l - j;
        float f = getRingWidth();
        float f1 = getRingHeight();
        float f2 = (float)mHorizontalInset + Math.max(i1, f + (float)mMaxTargetWidth) / 2.0F;
        float f3 = (float)mVerticalInset + Math.max(j1, f1 + (float)mMaxTargetHeight) / 2.0F;
        if (mInitialLayout)
        {
            stopAndHideWaveAnimation();
            hideTargets(false, false);
            mInitialLayout = false;
        }
        mOuterRing.setPositionX(f2);
        mOuterRing.setPositionY(f3);
        mPointCloud.setScale(mRingScaleFactor);
        mHandleDrawable.setPositionX(f2);
        mHandleDrawable.setPositionY(f3);
        updateTargetPositions(f2, f3);
        updatePointCloudPosition(f2, f3);
        updateGlowPosition(f2, f3);
        mWaveCenterX = f2;
        mWaveCenterY = f3;
        dump();
    }

    protected void onMeasure(int i, int j)
    {
        int k = getSuggestedMinimumWidth();
        int l = getSuggestedMinimumHeight();
        int i1 = resolveMeasured(i, k);
        int j1 = resolveMeasured(j, l);
        mRingScaleFactor = computeScaleFactor(k, l, i1, j1);
        int k1 = getScaledSuggestedMinimumWidth();
        int l1 = getScaledSuggestedMinimumHeight();
        computeInsets(i1 - k1, j1 - l1);
        setMeasuredDimension(i1, j1);
    }

    public boolean onTouch(View view, MotionEvent motionevent)
    {
        Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onTouch event.action=").append(motionevent.getAction()).append(", event.getX()=").append(motionevent.getX()).append(", event.getY()=").append(motionevent.getY()).append(", event.getRawX()=").append(motionevent.getRawX()).append(", event.getRawY()=").append(motionevent.getRawY()).append(", v=").append(view).append(", mCurrentNewEventView=").append(mCurrentNewEventView).append(", mDragViewDoingTouch=").append(mDragViewDoingTouch).append(", mGlowPadViewState=").append(mGlowPadViewState).toString());
        if (mGlowPadViewState == 0)
        {
            LockScreenNewEventView _tmp = (LockScreenNewEventView)view;
            if (mCurrentNewEventView == null || view == mCurrentNewEventView)
            {
                int i = motionevent.getAction();
                if (i == 0)
                {
                    mCurrentNewEventView = (LockScreenNewEventView)view;
                    mPoint.set((int)(-motionevent.getX()), (int)(-motionevent.getY()));
                    computeOwnerNewEventViewMotionOffset(mCurrentNewEventView);
                    mPoint.offset(-mOwnerNewEventViewOffset[0], -mOwnerNewEventViewOffset[1]);
                }
                motionevent.offsetLocation(mPoint.x, mPoint.y);
                Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onTouch event.getX()=").append(motionevent.getX()).append(", event.getY()=").append(motionevent.getY()).append(", mPoint.x=").append(mPoint.x).append(", mPoint.y=").append(mPoint.y).toString());
                boolean flag = mGestureDetector.onTouchEvent(motionevent);
                Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onTouch handled=").append(flag).append(", mTapTimeOut=").append(mTapTimeOut).append(", mTouchTriggered=").append(mTouchTriggered).toString());
                if (!flag)
                {
                    int j = (int)motionevent.getX();
                    int k = (int)motionevent.getY();
                    if (i == 1)
                    {
                        if (mTouchTriggered)
                            switchDragViewToState(5, j, k, 0.0F, 0.0F);
                        else
                            switchDragViewToState(6, j, k, 0.0F, 0.0F);
                    } else
                    if (i == 3 && mDragViewState != 7)
                        switchDragViewToState(6, j, k, 0.0F, 0.0F);
                }
                return true;
            }
        }
        return false;
    }

    public boolean onTouchEvent(MotionEvent motionevent)
    {
        int i = motionevent.getActionMasked();
        boolean flag = mTouchDropped;
        switch (i)
        {
        case 1: // '\001'
        case 3: // '\003'
        case 6: // '\006'
            mTouchDropped = false;
            break;

        case 0: // '\0'
        case 5: // '\005'
            if (mDragViewState >= 0 && mDragViewState < 7)
            {
                Xlog.d("MediatekGlowPadView", (new StringBuilder()).append("onTouchEvent return directly mDragViewState=").append(mDragViewState).toString());
                mTouchDropped = true;
                flag = true;
            }
            break;
        }
        if (!flag)
        {
            boolean flag1 = false;
            switch (i)
            {
            case 4: // '\004'
            default:
                break;

            case 3: // '\003'
                Log.v("MediatekGlowPadView", "*** CANCEL ***");
                mActionCancel = true;
                handleMove(motionevent);
                handleCancel(motionevent);
                flag1 = true;
                if (mLockScreenLayout != null)
                    showAllNewEventViews();
                break;

            case 1: // '\001'
            case 6: // '\006'
                Log.v("MediatekGlowPadView", "*** UP ***");
                mActionCancel = false;
                handleMove(motionevent);
                handleUp(motionevent);
                flag1 = true;
                if (mLockScreenLayout != null)
                    showAllNewEventViews();
                break;

            case 2: // '\002'
                Log.v("MediatekGlowPadView", "*** MOVE ***");
                handleMove(motionevent);
                flag1 = true;
                break;

            case 0: // '\0'
            case 5: // '\005'
                Log.v("MediatekGlowPadView", "*** DOWN ***");
                handleDown(motionevent);
                handleMove(motionevent);
                flag1 = true;
                break;
            }
            invalidate();
            if (!flag1)
                return super.onTouchEvent(motionevent);
        }
        return true;
    }

    public void ping()
    {
        pingInternal();
        doShakeAnimation();
    }

    public void pingInternal()
    {
        if (mFeedbackCount > 0)
        {
            boolean flag = true;
            AnimationBundle animationbundle = mWaveAnimations;
            if (animationbundle.size() > 0 && ((Tweener)animationbundle.get(0)).animator.isRunning() && ((Tweener)animationbundle.get(0)).animator.getCurrentPlayTime() < 675L)
                flag = false;
            if (flag)
                startWaveAnimation();
        }
    }

    public boolean replaceTargetDrawablesIfPresent(ComponentName componentname, String s, int i)
    {
        if (i != 0) goto _L2; else goto _L1
_L1:
        boolean flag = false;
_L4:
        return flag;
_L2:
        flag = false;
        if (componentname == null)
            break MISSING_BLOCK_LABEL_83;
        PackageManager packagemanager;
        Bundle bundle;
        packagemanager = mContext.getPackageManager();
        bundle = packagemanager.getActivityInfo(componentname, 128).metaData;
        flag = false;
        if (bundle == null)
            break MISSING_BLOCK_LABEL_83;
        int j = bundle.getInt(s);
        flag = false;
        if (j == 0)
            break MISSING_BLOCK_LABEL_83;
        boolean flag1 = replaceTargetDrawables(packagemanager.getResourcesForActivity(componentname), i, j);
        flag = flag1;
_L5:
        if (!flag)
        {
            replaceTargetDrawables(mContext.getResources(), i, i);
            return flag;
        }
        if (true) goto _L4; else goto _L3
_L3:
        android.content.pm.PackageManager.NameNotFoundException namenotfoundexception;
        namenotfoundexception;
        Log.w("MediatekGlowPadView", (new StringBuilder()).append("Failed to swap drawable; ").append(componentname.flattenToShortString()).append(" not found").toString(), namenotfoundexception);
        flag = false;
          goto _L5
        android.content.res.Resources.NotFoundException notfoundexception;
        notfoundexception;
        Log.w("MediatekGlowPadView", (new StringBuilder()).append("Failed to swap drawable from ").append(componentname.flattenToShortString()).toString(), notfoundexception);
        flag = false;
          goto _L5
    }

    public void reset(boolean flag)
    {
        mGlowAnimations.stop();
        mTargetAnimations.stop();
        stopAndHideWaveAnimation();
        hideTargets(flag, false);
        switchToState(0, mWaveCenterX, mWaveCenterY);
        mHandleAnimations.stop();
        mFakeHandleAnimations.stop();
        switchDragViewToState(7, 0, 0, 0.0F, 0.0F);
        Tweener.reset();
    }

    public void resumeAnimations()
    {
        mWaveAnimations.setSuspended(false);
        mTargetAnimations.setSuspended(false);
        mGlowAnimations.setSuspended(false);
        mWaveAnimations.start();
        mTargetAnimations.start();
        mGlowAnimations.start();
    }

    public void setDirectionDescriptionsResourceId(int i)
    {
        mDirectionDescriptionsResourceId = i;
        if (mDirectionDescriptions != null)
            mDirectionDescriptions.clear();
    }

    public void setEnableTarget(int i, boolean flag)
    {
        int j = 0;
        do
        {
label0:
            {
                if (j < mTargetDrawables.size())
                {
                    TargetDrawable targetdrawable = (TargetDrawable)mTargetDrawables.get(j);
                    if (targetdrawable.getResourceId() != i)
                        break label0;
                    targetdrawable.setEnabled(flag);
                }
                return;
            }
            j++;
        } while (true);
    }

    public void setHandleDrawableImage(int i)
    {
        Resources resources = getResources();
        if (mHandleDrawable != null)
            mHandleDrawable.setDrawable(resources, i);
    }

    public void setLockScreenView(LockScreenLayout lockscreenlayout)
    {
        mLockScreenLayout = lockscreenlayout;
    }

    public void setOnTriggerListener(OnTriggerListener ontriggerlistener)
    {
        mOnTriggerListener = ontriggerlistener;
    }

    public void setTargetDescriptionsResourceId(int i)
    {
        mTargetDescriptionsResourceId = i;
        if (mTargetDescriptions != null)
            mTargetDescriptions.clear();
    }

    public void setTargetResources(int i)
    {
        if (mAnimatingTargets)
        {
            mNewTargetResources = i;
            return;
        } else
        {
            internalSetTargetResources(i);
            return;
        }
    }

    public void setTouchRecepient(View view)
    {
        if (view != null)
        {
            mTouchRecepient = view;
            updateGlobalLayoutListenr(true);
            refreshPositions();
            return;
        } else
        {
            mTouchRecepient = null;
            updateGlobalLayoutListenr(false);
            return;
        }
    }

    public void setVibrateEnabled(boolean flag)
    {
        if (flag && mVibrator == null)
        {
            mVibrator = (Vibrator)getContext().getSystemService("vibrator");
            return;
        } else
        {
            mVibrator = null;
            return;
        }
    }

    public void suspendAnimations()
    {
        mWaveAnimations.setSuspended(true);
        mTargetAnimations.setSuspended(true);
        mGlowAnimations.setSuspended(true);
    }

    public void syncUnReadEventView(UnReadEventView unreadeventview)
    {
        mUnReadEventView = unreadeventview;
        ArrayList arraylist = mUnReadEventView.getNewEventViewList();
        if (arraylist != null && arraylist.size() > 0)
        {
            int i = arraylist.size();
            for (int j = 0; j < i; j++)
                ((LockScreenNewEventView)arraylist.get(j)).setOnTouchListener(this);

            mSimpleOnGestureListener = new SimpleOnGestureListener();
            mGestureDetector = new GestureDetector(getContext(), mSimpleOnGestureListener);
            mGestureDetector.setIsLongpressEnabled(false);
            mTouchSlop = (int)(3F * getContext().getResources().getDisplayMetrics().density);
            mTouchSlopSqure = mTouchSlop * mTouchSlop;
            mDragSnapMargin = (float)Math.sqrt(dist2(((LockScreenNewEventView)arraylist.get(0)).getNewEventBitmapWidth(), ((LockScreenNewEventView)arraylist.get(0)).getNewEventBitmapHeight()));
            return;
        } else
        {
            Xlog.w("MediatekGlowPadView", "syncUnReadEventView get empty newEventViews");
            return;
        }
    }





/*
    static int access$1302(MediatekGlowPadView mediatekglowpadview, int i)
    {
        mediatekglowpadview.mPendingDragViewState = i;
        return i;
    }

*/




/*
    static boolean access$1602(MediatekGlowPadView mediatekglowpadview, boolean flag)
    {
        mediatekglowpadview.mFakeHandleAnimating = flag;
        return flag;
    }

*/











/*
    static boolean access$2502(MediatekGlowPadView mediatekglowpadview, boolean flag)
    {
        mediatekglowpadview.mShouldDoIntersectAnim = flag;
        return flag;
    }

*/



/*
    static boolean access$2602(MediatekGlowPadView mediatekglowpadview, boolean flag)
    {
        mediatekglowpadview.mTapTimeOut = flag;
        return flag;
    }

*/






/*
    static int access$502(MediatekGlowPadView mediatekglowpadview, int i)
    {
        mediatekglowpadview.mNewTargetResources = i;
        return i;
    }

*/




/*
    static boolean access$802(MediatekGlowPadView mediatekglowpadview, boolean flag)
    {
        mediatekglowpadview.mAnimatingTargets = flag;
        return flag;
    }

*/

}
