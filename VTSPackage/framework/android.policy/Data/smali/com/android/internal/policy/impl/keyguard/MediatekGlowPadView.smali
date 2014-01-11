.class public Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;
.super Landroid/view/View;
.source "MediatekGlowPadView.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;,
        Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$IntersectAnimationRunnable;,
        Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;,
        Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;,
        Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;
    }
.end annotation


# static fields
.field private static final ANIM_TOUCH_STLOP:I = 0x3

.field private static final CALL_LOG_CLASS_NAME:Ljava/lang/String; = "com.android.contacts.activities.DialtactsActivity"

.field private static final CALL_LOG_PACKAGE_NAME:Ljava/lang/String; = "com.android.contacts"

.field private static final DEBUG:Z = true

.field private static final DRAG_ANIMATION_DELAY:I = 0x32

.field private static final DRAG_ANIMATION_DURATION:I = 0x15e

.field private static final DRAG_BACK_ANIMATION_DELAY:I = 0x14

.field private static final DRAG_BACK_ANIMATION_DURATION:I = 0xc8

.field private static final EMAIL_CLASS_NAME:Ljava/lang/String; = "com.android.email.activity.Welcome"

.field private static final EMAIL_PACKAGE_NAME:Ljava/lang/String; = "com.android.email"

.field private static final HIDE_ANIMATION_DELAY:I = 0xc8

.field private static final HIDE_ANIMATION_DURATION:I = 0xc8

.field private static final INITIAL_SHOW_HANDLE_DURATION:I = 0xc8

.field private static final MMS_CLASS_NAME:Ljava/lang/String; = "com.android.mms.ui.ConversationList"

.field private static final MMS_PACKAGE_NAME:Ljava/lang/String; = "com.android.mms"

.field private static final RETURN_TO_HOME_DELAY:I = 0x4b0

.field private static final RETURN_TO_HOME_DURATION:I = 0xc8

.field private static final REVEAL_GLOW_DELAY:I = 0x0

.field private static final REVEAL_GLOW_DURATION:I = 0x0

.field private static final RING_SCALE_COLLAPSED:F = 0.5f

.field private static final RING_SCALE_EXPANDED:F = 1.0f

.field private static final SHOW_ANIMATION_DELAY:I = 0x32

.field private static final SHOW_ANIMATION_DURATION:I = 0xc8

.field private static final SNAP_MARGIN_DEFAULT:F = 20.0f

.field private static final STATE_FINISH:I = 0x5

.field private static final STATE_FIRST_TOUCH:I = 0x2

.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_SNAP:I = 0x4

.field private static final STATE_START:I = 0x1

.field private static final STATE_TRACKING:I = 0x3

.field private static final TAG:Ljava/lang/String; = "MediatekGlowPadView"

.field private static final TAP_RADIUS_SCALE_ACCESSIBILITY_ENABLED:F = 1.3f

.field private static final TARGET_SCALE_COLLAPSED:F = 0.8f

.field private static final TARGET_SCALE_EXPANDED:F = 1.0f

.field private static final TOUCH_ANIM_BACK:I = 0x6

.field private static final TOUCH_DRAGGING:I = 0x3

.field private static final TOUCH_END:I = 0x7

.field private static final TOUCH_FLING:I = 0x4

.field private static final TOUCH_HANDLE_ANIM:I = 0x1

.field private static final TOUCH_INIT:I = 0x0

.field private static final TOUCH_INTERSECT:I = 0x2

.field private static final TOUCH_MOVE_INTERSECT_ANIM_THRESHOLD:F = 10.0f

.field private static final TOUCH_MOVE_TRIGGER_THRESHOLD:I = 0x3

.field private static final TOUCH_TRIGGER:I = 0x5

.field private static final WAVE_ANIMATION_DURATION:I = 0x546


# instance fields
.field private mActionCancel:Z

.field private mActiveTarget:I

.field private mAllowScaling:Z

.field private mAlwaysTrackFinger:Z

.field private mAnimatingTargets:Z

.field private mBackgroundAnimator:Lcom/android/internal/policy/impl/keyguard/Tweener;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mCheckForInterSectAnimation:Ljava/lang/Runnable;

.field private mCurrentFakeHandleTargetX:F

.field private mCurrentFakeHandleTargetY:F

.field private mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

.field private mDirectionDescriptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mDirectionDescriptionsResourceId:I

.field private mDoingIntersectAnim:Z

.field private mDragSnapMargin:F

.field private mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

.field private mDragViewAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mDragViewDoingTouch:Z

.field private mDragViewState:I

.field private mDragging:Z

.field private mFakeHandleAnimating:Z

.field private mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

.field private mFakeHandleDrawableOutListener:Landroid/animation/Animator$AnimatorListener;

.field private mFakeHandleDrawableResetListener:Landroid/animation/Animator$AnimatorListener;

.field private mFakeHandleRealX:F

.field private mFakeHandleRealY:F

.field private mFeedbackCount:I

.field private mFirstItemOffset:F

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mGlowPadViewState:I

.field private mGlowRadius:F

.field private mGrabbedState:I

.field private mGravity:I

.field private mHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

.field private mHandleDrawableResetListener:Landroid/animation/Animator$AnimatorListener;

.field private mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mHandlePosition:Landroid/graphics/Point;

.field private final mHistoryTouchXY:[I

.field private mHorizontalInset:I

.field private mInitDownMotionLocationX:I

.field private mInitDownMotionLocationY:I

.field private mInitialLayout:Z

.field private mInnerRadius:F

.field private mIntersectAnimResetListener:Landroid/animation/Animator$AnimatorListener;

.field private mLayoutListenerSet:Z

.field private mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

.field private mMagneticTargets:Z

.field private mMaxTargetHeight:I

.field private mMaxTargetWidth:I

.field private mNewEventViewInLockScreenX:I

.field private mNewEventViewInLockScreenY:I

.field private final mNewEventViewLocationInLockScreen:[I

.field private mNewTargetResources:I

.field private mOnLayoutListener:Landroid/view/View$OnLayoutChangeListener;

.field private mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

.field private mOuterRadius:F

.field private mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

.field private final mOwnerDragViewOffsets:[I

.field private final mOwnerLocationInLockScreen:[I

.field private final mOwnerNewEventViewOffset:[I

.field private final mOwnerRawLocation:[I

.field private final mOwnerRecepientOffsets:[I

.field private mPendingDragViewState:I

.field private mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

.field private final mPoint:Landroid/graphics/Point;

.field private mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

.field private mPointerId:I

.field private mResetListener:Landroid/animation/Animator$AnimatorListener;

.field private mResetListenerWithPing:Landroid/animation/Animator$AnimatorListener;

.field private mRingScaleFactor:F

.field private mShouldDoIntersectAnim:Z

.field private mSimpleOnGestureListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;

.field private mSnapMargin:F

.field private mTapTimeOut:Z

.field private mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mTargetDescriptions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTargetDescriptionsResourceId:I

.field private mTargetDrawables:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/keyguard/TargetDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private mTargetResourceId:I

.field private mTargetUpdateListener:Landroid/animation/Animator$AnimatorListener;

.field private mTempRect:Landroid/graphics/Rect;

.field private final mTempXY:[I

.field private mTouchDropped:Z

.field private mTouchIntercepted:Z

.field private mTouchMoveIntersectAnimThreshold:F

.field private mTouchMoveTriggerThreshold:I

.field private mTouchRecepient:Landroid/view/View;

.field private final mTouchRecepientRawLocation:[I

.field private mTouchSlop:I

.field private mTouchSlopSqure:I

.field private mTouchTriggered:Z

.field private mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

.field private mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mVerticalInset:I

.field private mVibrationDuration:I

.field private mVibrator:Landroid/os/Vibrator;

.field private mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

.field private mWaveCenterX:F

.field private mWaveCenterY:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 401
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 402
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 10
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 405
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 122
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    .line 123
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 124
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 125
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 133
    const/4 v7, 0x3

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFeedbackCount:I

    .line 134
    const/4 v7, 0x0

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    .line 136
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    .line 142
    const/high16 v7, 0x3f80

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    .line 145
    const/4 v7, 0x0

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    .line 146
    const/4 v7, 0x0

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    .line 147
    const/4 v7, 0x0

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    .line 148
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMagneticTargets:Z

    .line 152
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActionCancel:Z

    .line 190
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mResetListener:Landroid/animation/Animator$AnimatorListener;

    .line 197
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$2;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$2;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mResetListenerWithPing:Landroid/animation/Animator$AnimatorListener;

    .line 205
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$3;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$3;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 212
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$4;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$4;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetUpdateListener:Landroid/animation/Animator$AnimatorListener;

    .line 228
    const/16 v7, 0x30

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGravity:I

    .line 229
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInitialLayout:Z

    .line 247
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$5;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$5;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnLayoutListener:Landroid/view/View$OnLayoutChangeListener;

    .line 264
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepientRawLocation:[I

    .line 267
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRawLocation:[I

    .line 271
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRecepientOffsets:[I

    .line 273
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    .line 275
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    .line 277
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    .line 285
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTempXY:[I

    .line 288
    new-instance v7, Landroid/graphics/Point;

    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    .line 292
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHistoryTouchXY:[I

    .line 299
    new-instance v7, Landroid/graphics/Point;

    invoke-direct {v7}, Landroid/graphics/Point;-><init>()V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    .line 303
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$IntersectAnimationRunnable;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$IntersectAnimationRunnable;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCheckForInterSectAnimation:Ljava/lang/Runnable;

    .line 306
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 313
    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTempRect:Landroid/graphics/Rect;

    .line 316
    const/4 v7, 0x2

    new-array v7, v7, [I

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerDragViewOffsets:[I

    .line 323
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 324
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 326
    new-instance v7, Landroid/graphics/Canvas;

    invoke-direct {v7}, Landroid/graphics/Canvas;-><init>()V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCanvas:Landroid/graphics/Canvas;

    .line 334
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTapTimeOut:Z

    .line 371
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    .line 1863
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$7;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$7;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawableOutListener:Landroid/animation/Animator$AnimatorListener;

    .line 1937
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$9;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$9;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 1943
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$10;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$10;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableResetListener:Landroid/animation/Animator$AnimatorListener;

    .line 1950
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$11;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$11;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawableResetListener:Landroid/animation/Animator$AnimatorListener;

    .line 2198
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$12;

    invoke-direct {v7, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$12;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mIntersectAnimResetListener:Landroid/animation/Animator$AnimatorListener;

    .line 406
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .line 408
    .local v5, res:Landroid/content/res/Resources;
    sget-object v7, Lcom/android/internal/R$styleable;->GlowPadView:[I

    invoke-virtual {p1, p2, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 409
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v7, 0x1

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInnerRadius:F

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInnerRadius:F

    .line 410
    const/16 v7, 0xc

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    .line 411
    const/16 v7, 0xe

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    .line 412
    const/4 v7, 0x7

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v8

    double-to-float v8, v8

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v7

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v7

    double-to-float v7, v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    .line 415
    const/16 v7, 0xd

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    .line 417
    const/16 v7, 0xf

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFeedbackCount:I

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFeedbackCount:I

    .line 419
    const/16 v7, 0x9

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAllowScaling:Z

    .line 420
    const/16 v7, 0xb

    invoke-virtual {v0, v7}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v1

    .line 421
    .local v1, handle:Landroid/util/TypedValue;
    new-instance v8, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v1, :cond_2

    iget v7, v1, Landroid/util/TypedValue;->resourceId:I

    :goto_0
    invoke-direct {v8, v5, v7}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;-><init>(Landroid/content/res/Resources;I)V

    iput-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 422
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v8, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v7, v8}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 423
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    const/4 v8, 0x4

    invoke-direct {p0, v0, v8}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getResourceId(Landroid/content/res/TypedArray;I)I

    move-result v8

    invoke-direct {v7, v5, v8}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;-><init>(Landroid/content/res/Resources;I)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 426
    const/16 v7, 0x10

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAlwaysTrackFinger:Z

    .line 427
    const/16 v7, 0x8

    iget-boolean v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMagneticTargets:Z

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v7

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMagneticTargets:Z

    .line 429
    const/4 v7, 0x5

    invoke-direct {p0, v0, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getResourceId(Landroid/content/res/TypedArray;I)I

    move-result v4

    .line 430
    .local v4, pointId:I
    if-eqz v4, :cond_3

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 431
    .local v3, pointDrawable:Landroid/graphics/drawable/Drawable;
    :goto_1
    const/4 v7, 0x6

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowRadius:F

    .line 433
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 436
    .local v2, outValue:Landroid/util/TypedValue;
    const/16 v7, 0xa

    invoke-virtual {v0, v7, v2}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 437
    iget v7, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {p0, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->internalSetTargetResources(I)V

    .line 439
    :cond_0
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-nez v7, :cond_4

    .line 440
    :cond_1
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Must specify at least one target drawable"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 421
    .end local v2           #outValue:Landroid/util/TypedValue;
    .end local v3           #pointDrawable:Landroid/graphics/drawable/Drawable;
    .end local v4           #pointId:I
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 430
    .restart local v4       #pointId:I
    :cond_3
    const/4 v3, 0x0

    goto :goto_1

    .line 444
    .restart local v2       #outValue:Landroid/util/TypedValue;
    .restart local v3       #pointDrawable:Landroid/graphics/drawable/Drawable;
    :cond_4
    const/4 v7, 0x2

    invoke-virtual {v0, v7, v2}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 445
    iget v6, v2, Landroid/util/TypedValue;->resourceId:I

    .line 446
    .local v6, resourceId:I
    if-nez v6, :cond_5

    .line 447
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Must specify target descriptions"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 449
    :cond_5
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setTargetDescriptionsResourceId(I)V

    .line 453
    .end local v6           #resourceId:I
    :cond_6
    const/4 v7, 0x3

    invoke-virtual {v0, v7, v2}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    move-result v7

    if-eqz v7, :cond_8

    .line 454
    iget v6, v2, Landroid/util/TypedValue;->resourceId:I

    .line 455
    .restart local v6       #resourceId:I
    if-nez v6, :cond_7

    .line 456
    new-instance v7, Ljava/lang/IllegalStateException;

    const-string v8, "Must specify direction descriptions"

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 458
    :cond_7
    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setDirectionDescriptionsResourceId(I)V

    .line 461
    .end local v6           #resourceId:I
    :cond_8
    const/4 v7, 0x0

    const/16 v8, 0x30

    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGravity:I

    .line 463
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 465
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    if-lez v7, :cond_9

    const/4 v7, 0x1

    :goto_2
    invoke-virtual {p0, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setVibrateEnabled(Z)V

    .line 467
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->assignDefaultsIfNeeded()V

    .line 469
    new-instance v7, Lcom/android/internal/policy/impl/keyguard/PointCloud;

    invoke-direct {v7, v3}, Lcom/android/internal/policy/impl/keyguard/PointCloud;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    .line 470
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInnerRadius:F

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    invoke-virtual {v7, v8, v9}, Lcom/android/internal/policy/impl/keyguard/PointCloud;->makePointCloud(FF)V

    .line 471
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v7, v7, Lcom/android/internal/policy/impl/keyguard/PointCloud;->glowManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowRadius:F

    invoke-virtual {v7, v8}, Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;->setRadius(F)V

    .line 473
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 474
    const/4 v7, -0x1

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    .line 475
    return-void

    .line 465
    :cond_9
    const/4 v7, 0x0

    goto :goto_2
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    return v0
.end method

.method static synthetic access$1100(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Lcom/android/internal/policy/impl/keyguard/PointCloud;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    return v0
.end method

.method static synthetic access$1302(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    return p1
.end method

.method static synthetic access$1400(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;I)Ljava/lang/String;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->converDragViewStateCodeToString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1500(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    return v0
.end method

.method static synthetic access$1602(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimating:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    return-object v0
.end method

.method static synthetic access$1800(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;IIIFF)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"
    .parameter "x4"
    .parameter "x5"

    .prologue
    .line 79
    invoke-direct/range {p0 .. p5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    return-void
.end method

.method static synthetic access$1900(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)F
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    return v0
.end method

.method static synthetic access$2000(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    return-object v0
.end method

.method static synthetic access$2100(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-object v0
.end method

.method static synthetic access$2200(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Landroid/animation/Animator$AnimatorListener;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawableResetListener:Landroid/animation/Animator$AnimatorListener;

    return-object v0
.end method

.method static synthetic access$2300(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    return-object v0
.end method

.method static synthetic access$2400(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    return v0
.end method

.method static synthetic access$2502(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mShouldDoIntersectAnim:Z

    return p1
.end method

.method static synthetic access$2600(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTapTimeOut:Z

    return v0
.end method

.method static synthetic access$2602(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTapTimeOut:Z

    return p1
.end method

.method static synthetic access$2700(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    return v0
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;IFF)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 79
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dispatchOnFinishFinalAnimation()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewTargetResources:I

    return v0
.end method

.method static synthetic access$502(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewTargetResources:I

    return p1
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->internalSetTargetResources(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;ZZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideTargets(ZZ)V

    return-void
.end method

.method static synthetic access$802(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAnimatingTargets:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->refreshPositions()V

    return-void
.end method

.method private activateHandle(II)V
    .locals 9
    .parameter "duration"
    .parameter "delay"

    .prologue
    const/4 v8, 0x1

    const v4, 0x3ecccccd

    const/high16 v7, 0x3f80

    const/4 v3, 0x0

    .line 1829
    const-string v0, "MediatekGlowPadView"

    const-string v1, "activateHandle"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1831
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-nez v0, :cond_0

    .line 1833
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-direct {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;-><init>(Lcom/android/internal/policy/impl/keyguard/TargetDrawable;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1834
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x2020061

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setDrawable(Landroid/content/res/Resources;I)V

    .line 1838
    :goto_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 1839
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setScaleX(F)V

    .line 1840
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setScaleY(F)V

    .line 1841
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionX(F)V

    .line 1842
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionY(F)V

    .line 1843
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 1844
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    .line 1846
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 1847
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 1848
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setScaleX(F)V

    .line 1849
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setScaleY(F)V

    .line 1851
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 1852
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    div-int/lit8 v2, p1, 0x2

    int-to-long v2, v2

    const/16 v4, 0xe

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ease"

    aput-object v6, v4, v5

    sget-object v5, Lcom/android/internal/policy/impl/keyguard/Ease$Fling;->easeIn:Landroid/animation/TimeInterpolator;

    aput-object v5, v4, v8

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "scaleX"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "scaleY"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "alpha"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/16 v5, 0xb

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0xc

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0xd

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawableOutListener:Landroid/animation/Animator$AnimatorListener;

    aput-object v6, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 1860
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 1861
    return-void

    .line 1836
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v8}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setEnabled(Z)V

    goto/16 :goto_0
.end method

.method private animDragView(IIFFLandroid/animation/Animator$AnimatorListener;)V
    .locals 7
    .parameter "duration"
    .parameter "delay"
    .parameter "x"
    .parameter "y"
    .parameter "onCompleteListener"

    .prologue
    .line 1810
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "animDragView duration="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", delay="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", x="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1812
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    if-eqz v0, :cond_0

    .line 1813
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 1814
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    int-to-long v2, p1

    const/16 v4, 0xc

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ease"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/policy/impl/keyguard/Ease$Fling;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "translationX"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "translationY"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0xb

    aput-object p5, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 1821
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 1825
    :goto_0
    return-void

    .line 1823
    :cond_0
    const-string v0, "MediatekGlowPadView"

    const-string v1, "animDragView mDragView is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private animHandlerBack(II)V
    .locals 6
    .parameter "duration"
    .parameter "delay"

    .prologue
    const/4 v3, 0x0

    .line 2167
    const-string v0, "MediatekGlowPadView"

    const-string v1, "animHandlerBack"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2168
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->animDragView(IIFFLandroid/animation/Animator$AnimatorListener;)V

    .line 2169
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->deactivateHandle(II)V

    .line 2170
    return-void
.end method

.method private announceTargets()V
    .locals 8

    .prologue
    .line 1516
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 1517
    .local v5, utterance:Ljava/lang/StringBuilder;
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 1518
    .local v2, targetCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 1519
    invoke-direct {p0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getTargetDescription(I)Ljava/lang/String;

    move-result-object v3

    .line 1520
    .local v3, targetDescription:Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getDirectionDescription(I)Ljava/lang/String;

    move-result-object v0

    .line 1521
    .local v0, directionDescription:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 1523
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v3, v6, v7

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1524
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1518
    .end local v4           #text:Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1527
    .end local v0           #directionDescription:Ljava/lang/String;
    .end local v3           #targetDescription:Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 1528
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 1530
    :cond_2
    return-void
.end method

.method private assignDefaultsIfNeeded()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1277
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    cmpl-float v0, v0, v3

    if-nez v0, :cond_0

    .line 1278
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x4000

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    .line 1280
    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    cmpl-float v0, v0, v3

    if-nez v0, :cond_1

    .line 1281
    const/4 v0, 0x1

    const/high16 v1, 0x41a0

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    .line 1284
    :cond_1
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInnerRadius:F

    cmpl-float v0, v0, v3

    if-nez v0, :cond_2

    .line 1285
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x4120

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInnerRadius:F

    .line 1287
    :cond_2
    return-void
.end method

.method private computeInsets(II)V
    .locals 4
    .parameter "dx"
    .parameter "dy"

    .prologue
    const/4 v3, 0x0

    .line 1290
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getLayoutDirection()I

    move-result v1

    .line 1291
    .local v1, layoutDirection:I
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGravity:I

    invoke-static {v2, v1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    .line 1293
    .local v0, absoluteGravity:I
    and-int/lit8 v2, v0, 0x7

    packed-switch v2, :pswitch_data_0

    .line 1302
    :pswitch_0
    div-int/lit8 v2, p1, 0x2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHorizontalInset:I

    .line 1305
    :goto_0
    and-int/lit8 v2, v0, 0x70

    sparse-switch v2, :sswitch_data_0

    .line 1314
    div-int/lit8 v2, p2, 0x2

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVerticalInset:I

    .line 1317
    :goto_1
    return-void

    .line 1295
    :pswitch_1
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHorizontalInset:I

    goto :goto_0

    .line 1298
    :pswitch_2
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHorizontalInset:I

    goto :goto_0

    .line 1307
    :sswitch_0
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVerticalInset:I

    goto :goto_1

    .line 1310
    :sswitch_1
    iput p2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVerticalInset:I

    goto :goto_1

    .line 1293
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch

    .line 1305
    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x50 -> :sswitch_1
    .end sparse-switch
.end method

.method private computeOwnerNewEventViewMotionOffset(Landroid/view/View;)V
    .locals 5
    .parameter "newEventView"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2086
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    if-eqz v0, :cond_0

    .line 2087
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    invoke-virtual {v0, p1, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->getLocationInLockScreenLayout(Landroid/view/View;[I)V

    .line 2088
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->getLocationInLockScreenLayout(Landroid/view/View;[I)V

    .line 2089
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    aget v1, v1, v3

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    aget v2, v2, v3

    sub-int/2addr v1, v2

    aput v1, v0, v3

    .line 2090
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    aget v1, v1, v4

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    aget v2, v2, v4

    sub-int/2addr v1, v2

    aput v1, v0, v4

    .line 2091
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "computeOwnerNewEventViewMotionOffset mOwnerLocationInLockScreen[0]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mOwnerLocationInLockScreen[1]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    aget v2, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mNewEventViewParentLocationInLockScreen[0]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mNewEventViewLocationInLockScreen[1]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewLocationInLockScreen:[I

    aget v2, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mOwnerNewEventViewOffset[0]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", mOwnerNewEventViewOffset[1]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v2, v2, v4

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2096
    :cond_0
    return-void
.end method

.method private computeScaleFactor(IIII)F
    .locals 7
    .parameter "desiredWidth"
    .parameter "desiredHeight"
    .parameter "actualWidth"
    .parameter "actualHeight"

    .prologue
    const/high16 v4, 0x3f80

    .line 1327
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAllowScaling:Z

    if-nez v5, :cond_0

    .line 1363
    :goto_0
    return v4

    .line 1329
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getLayoutDirection()I

    move-result v1

    .line 1330
    .local v1, layoutDirection:I
    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGravity:I

    invoke-static {v5, v1}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v0

    .line 1332
    .local v0, absoluteGravity:I
    const/high16 v2, 0x3f80

    .line 1333
    .local v2, scaleX:F
    const/high16 v3, 0x3f80

    .line 1339
    .local v3, scaleY:F
    and-int/lit8 v5, v0, 0x7

    packed-switch v5, :pswitch_data_0

    .line 1345
    :pswitch_0
    if-le p1, p3, :cond_1

    .line 1346
    int-to-float v5, p3

    mul-float/2addr v5, v4

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    sub-int v6, p1, v6

    int-to-float v6, v6

    div-float v2, v5, v6

    .line 1351
    :cond_1
    :pswitch_1
    and-int/lit8 v5, v0, 0x70

    sparse-switch v5, :sswitch_data_0

    .line 1357
    if-le p2, p4, :cond_2

    .line 1358
    int-to-float v5, p4

    mul-float/2addr v4, v5

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    int-to-float v5, v5

    sub-float/2addr v4, v5

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    sub-int v5, p2, v5

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 1363
    :cond_2
    :sswitch_0
    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v4

    goto :goto_0

    .line 1339
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 1351
    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_0
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method private converDragViewStateCodeToString(I)Ljava/lang/String;
    .locals 1
    .parameter "state"

    .prologue
    .line 2372
    packed-switch p1, :pswitch_data_0

    .line 2390
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 2374
    :pswitch_0
    const-string v0, "TOUCH_INIT"

    goto :goto_0

    .line 2376
    :pswitch_1
    const-string v0, "TOUCH_HANDLE_ANIM"

    goto :goto_0

    .line 2378
    :pswitch_2
    const-string v0, "TOUCH_INTERSECT"

    goto :goto_0

    .line 2380
    :pswitch_3
    const-string v0, "TOUCH_DRAGGING"

    goto :goto_0

    .line 2382
    :pswitch_4
    const-string v0, "TOUCH_FLING"

    goto :goto_0

    .line 2384
    :pswitch_5
    const-string v0, "TOUCH_TRIGGER"

    goto :goto_0

    .line 2386
    :pswitch_6
    const-string v0, "TOUCH_ANIM_BACK"

    goto :goto_0

    .line 2388
    :pswitch_7
    const-string v0, "TOUCH_END"

    goto :goto_0

    .line 2372
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private deactivateHandle(II)V
    .locals 8
    .parameter "duration"
    .parameter "delay"

    .prologue
    const/4 v7, 0x0

    .line 1876
    const-string v0, "MediatekGlowPadView"

    const-string v1, "deactivateHandle"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1878
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 1879
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    div-int/lit8 v2, p1, 0x2

    int-to-long v2, v2

    const/16 v4, 0xc

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ease"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/policy/impl/keyguard/Ease$Fling;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "x"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "y"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0xb

    new-instance v6, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$8;

    invoke-direct {v6, p0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$8;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;II)V

    aput-object v6, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 1898
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 1899
    return-void
.end method

.method private deactivateTargets()V
    .locals 4

    .prologue
    .line 630
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 631
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 632
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 633
    .local v2, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    sget-object v3, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 631
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 635
    .end local v2           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    const/4 v3, -0x1

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    .line 636
    return-void
.end method

.method private dispatchOnFinishFinalAnimation()V
    .locals 1

    .prologue
    .line 650
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    if-eqz v0, :cond_0

    .line 651
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    invoke-interface {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onFinishFinalAnimation()V

    .line 653
    :cond_0
    return-void
.end method

.method private dispatchTriggerEvent(I)V
    .locals 1
    .parameter "whichTarget"

    .prologue
    .line 643
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->vibrate()V

    .line 644
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    if-eqz v0, :cond_0

    .line 645
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    invoke-interface {v0, p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onTrigger(Landroid/view/View;I)V

    .line 647
    :cond_0
    return-void
.end method

.method private dist2(FF)F
    .locals 2
    .parameter "dx"
    .parameter "dy"

    .prologue
    .line 1502
    mul-float v0, p1, p1

    mul-float v1, p2, p2

    add-float/2addr v0, v1

    return v0
.end method

.method private doFinish()V
    .locals 7

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 656
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    .line 657
    .local v0, activeTarget:I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_3

    move v1, v2

    .line 659
    .local v1, targetHit:Z
    :goto_0
    if-eqz v1, :cond_4

    .line 660
    const-string v2, "MediatekGlowPadView"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finish with target hit = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 662
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->highlightSelected(I)V

    .line 670
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActionCancel:Z

    if-nez v2, :cond_0

    .line 672
    const/4 v2, 0x5

    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 673
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dispatchTriggerEvent(I)V

    .line 676
    :cond_0
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAlwaysTrackFinger:Z

    if-nez v2, :cond_1

    .line 678
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 687
    :cond_1
    :goto_1
    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setGrabbedState(I)V

    .line 688
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActionCancel:Z

    if-eqz v2, :cond_2

    .line 689
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->requestLayout()V

    .line 691
    :cond_2
    return-void

    .end local v1           #targetHit:Z
    :cond_3
    move v1, v3

    .line 657
    goto :goto_0

    .line 682
    .restart local v1       #targetHit:Z
    :cond_4
    const/16 v4, 0xc8

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mResetListenerWithPing:Landroid/animation/Animator$AnimatorListener;

    invoke-direct {p0, v4, v3, v5, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideGlow(IIFLandroid/animation/Animator$AnimatorListener;)V

    .line 683
    invoke-direct {p0, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideTargets(ZZ)V

    goto :goto_1
.end method

.method private doIntersectAnimation()V
    .locals 12

    .prologue
    const/16 v2, 0x32

    const/4 v11, 0x1

    const/4 v9, 0x0

    const/high16 v10, 0x3f80

    .line 2174
    const-string v0, "MediatekGlowPadView"

    const-string v1, "doIntersectAnimation"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2176
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    float-to-int v1, v1

    add-int v6, v0, v1

    .line 2177
    .local v6, targetX:I
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->y:I

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    float-to-int v1, v1

    add-int v7, v0, v1

    .line 2178
    .local v7, targetY:I
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v0, v0, v9

    add-int/2addr v6, v0

    .line 2179
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr v6, v0

    .line 2180
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v0, v0, v11

    add-int/2addr v7, v0

    .line 2181
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    sub-int/2addr v7, v0

    .line 2182
    const/16 v1, 0x15e

    int-to-float v3, v6

    int-to-float v4, v7

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->animDragView(IIFFLandroid/animation/Animator$AnimatorListener;)V

    .line 2184
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 2185
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    const-wide/16 v3, 0x15e

    const/16 v5, 0x12

    new-array v5, v5, [Ljava/lang/Object;

    const-string v8, "ease"

    aput-object v8, v5, v9

    sget-object v8, Lcom/android/internal/policy/impl/keyguard/Ease$Fling;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v8, v5, v11

    const/4 v8, 0x2

    const-string v9, "delay"

    aput-object v9, v5, v8

    const/4 v8, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v8

    const/4 v2, 0x4

    const-string v8, "x"

    aput-object v8, v5, v2

    const/4 v2, 0x5

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    iget v8, v8, Landroid/graphics/Point;->x:I

    int-to-float v8, v8

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v5, v2

    const/4 v2, 0x6

    const-string v8, "y"

    aput-object v8, v5, v2

    const/4 v2, 0x7

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    iget v8, v8, Landroid/graphics/Point;->y:I

    int-to-float v8, v8

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v5, v2

    const/16 v2, 0x8

    const-string v8, "scaleX"

    aput-object v8, v5, v2

    const/16 v2, 0x9

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v5, v2

    const/16 v2, 0xa

    const-string v8, "scaleY"

    aput-object v8, v5, v2

    const/16 v2, 0xb

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v5, v2

    const/16 v2, 0xc

    const-string v8, "alpha"

    aput-object v8, v5, v2

    const/16 v2, 0xd

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    aput-object v8, v5, v2

    const/16 v2, 0xe

    const-string v8, "onUpdate"

    aput-object v8, v5, v2

    const/16 v2, 0xf

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawableUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v8, v5, v2

    const/16 v2, 0x10

    const-string v8, "onComplete"

    aput-object v8, v5, v2

    const/16 v2, 0x11

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mIntersectAnimResetListener:Landroid/animation/Animator$AnimatorListener;

    aput-object v8, v5, v2

    invoke-static {v1, v3, v4, v5}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 2195
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 2196
    return-void
.end method

.method private drawDragView(Landroid/view/View;Landroid/graphics/Canvas;Z)V
    .locals 3
    .parameter "v"
    .parameter "destCanvas"
    .parameter "pruneToDrawable"

    .prologue
    .line 2300
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTempRect:Landroid/graphics/Rect;

    .line 2301
    .local v0, clipRect:Landroid/graphics/Rect;
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 2303
    const/4 v1, 0x0

    .line 2305
    .local v1, textVisible:Z
    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    .line 2306
    sget-object v2, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p2, v0, v2}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 2307
    invoke-virtual {p1, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2308
    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    .line 2309
    return-void
.end method

.method private dump()V
    .locals 3

    .prologue
    .line 483
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Outer Radius = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SnapMargin = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "FeedbackCount = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFeedbackCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VibrationDuration = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 487
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "GlowRadius = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowRadius:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WaveCenterX = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 489
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WaveCenterY = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    return-void
.end method

.method private freeFling(FF)V
    .locals 6
    .parameter "velX"
    .parameter "velY"

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 2162
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "freeFling velX="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", velY="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2163
    const/4 v1, 0x6

    move-object v0, p0

    move v3, v2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    .line 2164
    return-void
.end method

.method private getAngle(FI)F
    .locals 2
    .parameter "alpha"
    .parameter "i"

    .prologue
    .line 1464
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    int-to-float v1, p2

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    return v0
.end method

.method private getDirectionDescription(I)Ljava/lang/String;
    .locals 2
    .parameter "index"

    .prologue
    .line 1545
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1546
    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptionsResourceId:I

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->loadDescriptions(I)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    .line 1547
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 1548
    const-string v0, "MediatekGlowPadView"

    const-string v1, "The number of target drawables must be equal to the number of direction descriptions."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1550
    const/4 v0, 0x0

    .line 1553
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method private getResourceId(Landroid/content/res/TypedArray;I)I
    .locals 2
    .parameter "a"
    .parameter "id"

    .prologue
    .line 478
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    .line 479
    .local v0, tv:Landroid/util/TypedValue;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    iget v1, v0, Landroid/util/TypedValue;->resourceId:I

    goto :goto_0
.end method

.method private getRingHeight()F
    .locals 4

    .prologue
    .line 1388
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4000

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private getRingWidth()F
    .locals 4

    .prologue
    .line 1384
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4000

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float/2addr v0, v1

    return v0
.end method

.method private getScaledGlowRadiusSquared()F
    .locals 3

    .prologue
    .line 1507
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1508
    const v1, 0x3fa66666

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowRadius:F

    mul-float v0, v1, v2

    .line 1512
    .local v0, scaledTapRadius:F
    :goto_0
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->square(F)F

    move-result v1

    return v1

    .line 1510
    .end local v0           #scaledTapRadius:F
    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowRadius:F

    .restart local v0       #scaledTapRadius:F
    goto :goto_0
.end method

.method private getSliceAngle()F
    .locals 4

    .prologue
    .line 1468
    const-wide v0, -0x3fe6de04abbbd2e8L

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v0, v2

    double-to-float v0, v0

    return v0
.end method

.method private getTargetDescription(I)Ljava/lang/String;
    .locals 2
    .parameter "index"

    .prologue
    .line 1533
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1534
    :cond_0
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptionsResourceId:I

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->loadDescriptions(I)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    .line 1535
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 1536
    const-string v0, "MediatekGlowPadView"

    const-string v1, "The number of target drawables must be equal to the number of target descriptions."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1538
    const/4 v0, 0x0

    .line 1541
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0
.end method

.method private getZoomAnim(ZFFFFFF)Landroid/animation/ObjectAnimator;
    .locals 7
    .parameter "zoomIn"
    .parameter "alphaFrom"
    .parameter "alphaTo"
    .parameter "scaleXFrom"
    .parameter "scaleXTo"
    .parameter "scaleYFrom"
    .parameter "scaleYTo"

    .prologue
    .line 2077
    const-string v4, "alpha"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput p2, v5, v6

    const/4 v6, 0x1

    aput p3, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    .line 2078
    .local v0, pvhAlphaZoom:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleX"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput p4, v5, v6

    const/4 v6, 0x1

    aput p5, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    .line 2079
    .local v1, pvhScaleXZoom:Landroid/animation/PropertyValuesHolder;
    const-string v4, "scaleY"

    const/4 v5, 0x2

    new-array v5, v5, [F

    const/4 v6, 0x0

    aput p6, v5, v6

    const/4 v6, 0x1

    aput p7, v5, v6

    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v2

    .line 2080
    .local v2, pvhScaleYZoom:Landroid/animation/PropertyValuesHolder;
    const/4 v4, 0x0

    check-cast v4, Ljava/lang/Object;

    const/4 v5, 0x3

    new-array v5, v5, [Landroid/animation/PropertyValuesHolder;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v6, 0x1

    aput-object v1, v5, v6

    const/4 v6, 0x2

    aput-object v2, v5, v6

    invoke-static {v4, v5}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v3

    .line 2081
    .local v3, targetViewAnimation:Landroid/animation/ObjectAnimator;
    const-wide/16 v4, 0x15e

    invoke-virtual {v3, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object v4

    const-wide/16 v5, 0x32

    invoke-virtual {v4, v5, v6}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    .line 2082
    return-object v3
.end method

.method private handleCancel(Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "event"

    .prologue
    const/4 v3, -0x1

    .line 1106
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    if-eqz v1, :cond_0

    const-string v1, "MediatekGlowPadView"

    const-string v2, "** Handle CANCEL"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1109
    :cond_0
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    .line 1111
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointerId:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    .line 1112
    .local v0, actionIndex:I
    if-ne v0, v3, :cond_1

    const/4 v0, 0x0

    .line 1113
    :cond_1
    const/4 v1, 0x5

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1114
    return-void
.end method

.method private handleDown(Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "event"

    .prologue
    .line 1083
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 1084
    .local v0, actionIndex:I
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    .line 1085
    .local v1, eventX:F
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    .line 1086
    .local v2, eventY:F
    const/4 v3, 0x1

    invoke-direct {p0, v3, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1087
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->trySwitchToFirstTouchState(FF)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1088
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    .line 1090
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->doShakeAnimation()V

    .line 1095
    :goto_0
    return-void

    .line 1092
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointerId:I

    .line 1093
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlowPosition(FF)V

    goto :goto_0
.end method

.method private handleMove(Landroid/view/MotionEvent;)V
    .locals 39
    .parameter "event"

    .prologue
    .line 1117
    const/4 v6, -0x1

    .line 1118
    .local v6, activeTarget:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v12

    .line 1119
    .local v12, historySize:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    .line 1120
    .local v27, targets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->size()I

    move-result v17

    .line 1121
    .local v17, ntargets:I
    const/16 v31, 0x0

    .line 1122
    .local v31, x:F
    const/16 v32, 0x0

    .line 1123
    .local v32, y:F
    const/4 v5, 0x0

    .line 1124
    .local v5, activeAngle:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointerId:I

    move/from16 v33, v0

    move-object/from16 v0, p1

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v4

    .line 1126
    .local v4, actionIndex:I
    const/16 v33, -0x1

    move/from16 v0, v33

    if-ne v4, v0, :cond_1

    .line 1215
    :cond_0
    :goto_0
    return-void

    .line 1130
    :cond_1
    const/4 v14, 0x0

    .local v14, k:I
    :goto_1
    add-int/lit8 v33, v12, 0x1

    move/from16 v0, v33

    if-ge v14, v0, :cond_c

    .line 1131
    if-ge v14, v12, :cond_7

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v14}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v10

    .line 1133
    .local v10, eventX:F
    :goto_2
    if-ge v14, v12, :cond_8

    move-object/from16 v0, p1

    invoke-virtual {v0, v4, v14}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v11

    .line 1136
    .local v11, eventY:F
    :goto_3
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    move/from16 v33, v0

    sub-float v29, v10, v33

    .line 1137
    .local v29, tx:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    move/from16 v33, v0

    sub-float v30, v11, v33

    .line 1138
    .local v30, ty:F
    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v33

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v33, v0

    invoke-static/range {v33 .. v34}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v33

    move-wide/from16 v0, v33

    double-to-float v0, v0

    move/from16 v28, v0

    .line 1139
    .local v28, touchRadius:F
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    move/from16 v33, v0

    cmpl-float v33, v28, v33

    if-lez v33, :cond_9

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    move/from16 v33, v0

    div-float v18, v33, v28

    .line 1140
    .local v18, scale:F
    :goto_4
    mul-float v15, v29, v18

    .line 1141
    .local v15, limitX:F
    mul-float v16, v30, v18

    .line 1142
    .local v16, limitY:F
    move/from16 v0, v30

    neg-float v0, v0

    move/from16 v33, v0

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v33, v0

    move/from16 v0, v29

    float-to-double v0, v0

    move-wide/from16 v35, v0

    invoke-static/range {v33 .. v36}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v8

    .line 1144
    .local v8, angleRad:D
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    move/from16 v33, v0

    if-nez v33, :cond_2

    .line 1145
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->trySwitchToFirstTouchState(FF)Z

    .line 1148
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    move/from16 v33, v0

    if-eqz v33, :cond_b

    .line 1150
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    move/from16 v33, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    move/from16 v34, v0

    mul-float v33, v33, v34

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSnapMargin:F

    move/from16 v34, v0

    sub-float v20, v33, v34

    .line 1151
    .local v20, snapRadius:F
    mul-float v19, v20, v20

    .line 1153
    .local v19, snapDistance2:F
    const/4 v13, 0x0

    .local v13, i:I
    :goto_5
    move/from16 v0, v17

    if-ge v13, v0, :cond_b

    .line 1154
    move-object/from16 v0, v27

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1156
    .local v21, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    move/from16 v33, v0

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v33, v0

    int-to-double v0, v13

    move-wide/from16 v35, v0

    const-wide/high16 v37, 0x3fe0

    sub-double v35, v35, v37

    const-wide/high16 v37, 0x4000

    mul-double v35, v35, v37

    const-wide v37, 0x400921fb54442d18L

    mul-double v35, v35, v37

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v37, v0

    div-double v35, v35, v37

    add-double v25, v33, v35

    .line 1157
    .local v25, targetMinRad:D
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFirstItemOffset:F

    move/from16 v33, v0

    move/from16 v0, v33

    float-to-double v0, v0

    move-wide/from16 v33, v0

    int-to-double v0, v13

    move-wide/from16 v35, v0

    const-wide/high16 v37, 0x3fe0

    add-double v35, v35, v37

    const-wide/high16 v37, 0x4000

    mul-double v35, v35, v37

    const-wide v37, 0x400921fb54442d18L

    mul-double v35, v35, v37

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v37, v0

    div-double v35, v35, v37

    add-double v23, v33, v35

    .line 1158
    .local v23, targetMaxRad:D
    invoke-virtual/range {v21 .. v21}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->isEnabled()Z

    move-result v33

    if-eqz v33, :cond_6

    .line 1159
    cmpl-double v33, v8, v25

    if-lez v33, :cond_3

    cmpg-double v33, v8, v23

    if-lez v33, :cond_5

    :cond_3
    const-wide v33, 0x401921fb54442d18L

    add-double v33, v33, v8

    cmpl-double v33, v33, v25

    if-lez v33, :cond_4

    const-wide v33, 0x401921fb54442d18L

    add-double v33, v33, v8

    cmpg-double v33, v33, v23

    if-lez v33, :cond_5

    :cond_4
    const-wide v33, 0x401921fb54442d18L

    sub-double v33, v8, v33

    cmpl-double v33, v33, v25

    if-lez v33, :cond_a

    const-wide v33, 0x401921fb54442d18L

    sub-double v33, v8, v33

    cmpg-double v33, v33, v23

    if-gtz v33, :cond_a

    :cond_5
    const/4 v7, 0x1

    .line 1165
    .local v7, angleMatches:Z
    :goto_6
    if-eqz v7, :cond_6

    move-object/from16 v0, p0

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v33

    cmpl-float v33, v33, v19

    if-lez v33, :cond_6

    .line 1166
    move v6, v13

    .line 1167
    neg-double v0, v8

    move-wide/from16 v33, v0

    move-wide/from16 v0, v33

    double-to-float v5, v0

    .line 1153
    .end local v7           #angleMatches:Z
    :cond_6
    add-int/lit8 v13, v13, 0x1

    goto/16 :goto_5

    .line 1131
    .end local v8           #angleRad:D
    .end local v10           #eventX:F
    .end local v11           #eventY:F
    .end local v13           #i:I
    .end local v15           #limitX:F
    .end local v16           #limitY:F
    .end local v18           #scale:F
    .end local v19           #snapDistance2:F
    .end local v20           #snapRadius:F
    .end local v21           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .end local v23           #targetMaxRad:D
    .end local v25           #targetMinRad:D
    .end local v28           #touchRadius:F
    .end local v29           #tx:F
    .end local v30           #ty:F
    :cond_7
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getX(I)F

    move-result v10

    goto/16 :goto_2

    .line 1133
    .restart local v10       #eventX:F
    :cond_8
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    goto/16 :goto_3

    .line 1139
    .restart local v11       #eventY:F
    .restart local v28       #touchRadius:F
    .restart local v29       #tx:F
    .restart local v30       #ty:F
    :cond_9
    const/high16 v18, 0x3f80

    goto/16 :goto_4

    .line 1159
    .restart local v8       #angleRad:D
    .restart local v13       #i:I
    .restart local v15       #limitX:F
    .restart local v16       #limitY:F
    .restart local v18       #scale:F
    .restart local v19       #snapDistance2:F
    .restart local v20       #snapRadius:F
    .restart local v21       #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .restart local v23       #targetMaxRad:D
    .restart local v25       #targetMinRad:D
    :cond_a
    const/4 v7, 0x0

    goto :goto_6

    .line 1172
    .end local v13           #i:I
    .end local v19           #snapDistance2:F
    .end local v20           #snapRadius:F
    .end local v21           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .end local v23           #targetMaxRad:D
    .end local v25           #targetMinRad:D
    :cond_b
    move/from16 v31, v15

    .line 1173
    move/from16 v32, v16

    .line 1130
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_1

    .line 1176
    .end local v8           #angleRad:D
    .end local v10           #eventX:F
    .end local v11           #eventY:F
    .end local v15           #limitX:F
    .end local v16           #limitY:F
    .end local v18           #scale:F
    .end local v28           #touchRadius:F
    .end local v29           #tx:F
    .end local v30           #ty:F
    :cond_c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    move/from16 v33, v0

    if-eqz v33, :cond_0

    .line 1180
    const/16 v33, -0x1

    move/from16 v0, v33

    if-eq v6, v0, :cond_12

    .line 1181
    const/16 v33, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v33

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1182
    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlowPosition(FF)V

    .line 1188
    :goto_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    move/from16 v33, v0

    move/from16 v0, v33

    if-eq v0, v6, :cond_11

    .line 1190
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    move/from16 v33, v0

    const/16 v34, -0x1

    move/from16 v0, v33

    move/from16 v1, v34

    if-eq v0, v1, :cond_e

    .line 1191
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    move/from16 v33, v0

    move-object/from16 v0, v27

    move/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1192
    .restart local v21       #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    sget-object v33, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_FOCUSED:[I

    move-object/from16 v0, v21

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->hasState([I)Z

    move-result v33

    if-eqz v33, :cond_d

    .line 1193
    sget-object v33, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    move-object/from16 v0, v21

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 1195
    :cond_d
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMagneticTargets:Z

    move/from16 v33, v0

    if-eqz v33, :cond_e

    .line 1196
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    move/from16 v33, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    move/from16 v34, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    move/from16 v35, v0

    move-object/from16 v0, p0

    move/from16 v1, v33

    move/from16 v2, v34

    move/from16 v3, v35

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPosition(IFF)V

    .line 1200
    .end local v21           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_e
    const/16 v33, -0x1

    move/from16 v0, v33

    if-eq v6, v0, :cond_11

    .line 1201
    move-object/from16 v0, v27

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1202
    .restart local v21       #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    sget-object v33, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_FOCUSED:[I

    move-object/from16 v0, v21

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->hasState([I)Z

    move-result v33

    if-eqz v33, :cond_f

    .line 1203
    sget-object v33, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_FOCUSED:[I

    move-object/from16 v0, v21

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 1205
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMagneticTargets:Z

    move/from16 v33, v0

    if-eqz v33, :cond_10

    .line 1206
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    move/from16 v33, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    move/from16 v34, v0

    move-object/from16 v0, p0

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-direct {v0, v6, v1, v2, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPosition(IFFF)V

    .line 1208
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    move-object/from16 v33, v0

    invoke-static/range {v33 .. v33}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v33

    if-eqz v33, :cond_11

    .line 1209
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getTargetDescription(I)Ljava/lang/String;

    move-result-object v22

    .line 1210
    .local v22, targetContentDescription:Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 1214
    .end local v21           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .end local v22           #targetContentDescription:Ljava/lang/String;
    :cond_11
    move-object/from16 v0, p0

    iput v6, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    goto/16 :goto_0

    .line 1184
    :cond_12
    const/16 v33, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v33

    move/from16 v2, v31

    move/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1185
    move-object/from16 v0, p0

    move/from16 v1, v31

    move/from16 v2, v32

    invoke-direct {v0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlowPosition(FF)V

    goto/16 :goto_7
.end method

.method private handleTouchCancel(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "event"

    .prologue
    .line 2222
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleUp(Landroid/view/MotionEvent;)V

    .line 2223
    return-void
.end method

.method private handleTrigger(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)V
    .locals 5
    .parameter "newEventView"

    .prologue
    .line 2236
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    if-eqz v2, :cond_0

    .line 2237
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    const/4 v3, -0x1

    invoke-interface {v2, p1, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onTrigger(Landroid/view/View;I)V

    .line 2239
    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 2240
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getResourceId()I

    move-result v1

    .line 2241
    .local v1, resourceId:I
    packed-switch v1, :pswitch_data_0

    .line 2255
    const-string v2, "MediatekGlowPadView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleTrigger unknown resource id, resourceId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2257
    :goto_0
    return-void

    .line 2243
    :pswitch_0
    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.android.mms"

    const-string v4, "com.android.mms.ui.ConversationList"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2244
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->launchActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2247
    :pswitch_1
    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.android.contacts"

    const-string v4, "com.android.contacts.activities.DialtactsActivity"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2248
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->launchActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2251
    :pswitch_2
    new-instance v2, Landroid/content/ComponentName;

    const-string v3, "com.android.email"

    const-string v4, "com.android.email.activity.Welcome"

    invoke-direct {v2, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2252
    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->launchActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 2241
    nop

    :pswitch_data_0
    .packed-switch 0x202006f
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleUp(Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "event"

    .prologue
    .line 1098
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    if-eqz v1, :cond_0

    const-string v1, "MediatekGlowPadView"

    const-string v2, "** Handle RELEASE"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1099
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    .line 1100
    .local v0, actionIndex:I
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointerId:I

    if-ne v1, v2, :cond_1

    .line 1101
    const/4 v1, 0x5

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1103
    :cond_1
    return-void
.end method

.method private hideAllNewEventViews()V
    .locals 12

    .prologue
    const/4 v3, 0x0

    .line 2045
    const-string v0, "MediatekGlowPadView"

    const-string v1, "hideAllNewEventViews"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2047
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/UnReadEventView;->getNewEventViewList()Ljava/util/ArrayList;

    move-result-object v9

    .line 2048
    .local v9, newEventViweList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;>;"
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_0

    .line 2049
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 2050
    .local v11, tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    const/4 v1, 0x1

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getAlpha()F

    move-result v2

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleX()F

    move-result v4

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleY()F

    move-result v6

    move-object v0, p0

    move v5, v3

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getZoomAnim(ZFFFFFF)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 2052
    .local v10, objectAnimator:Landroid/animation/ObjectAnimator;
    invoke-virtual {v10, v11}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 2053
    invoke-virtual {v10}, Landroid/animation/ObjectAnimator;->start()V

    .line 2048
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2055
    .end local v10           #objectAnimator:Landroid/animation/ObjectAnimator;
    .end local v11           #tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    :cond_0
    return-void
.end method

.method private hideGlow(IIFLandroid/animation/Animator$AnimatorListener;)V
    .locals 8
    .parameter "duration"
    .parameter "delay"
    .parameter "finalAlpha"
    .parameter "finishListener"

    .prologue
    const/4 v7, 0x0

    .line 617
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 618
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/PointCloud;->glowManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;

    int-to-long v2, p1

    const/16 v4, 0xe

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ease"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/policy/impl/keyguard/Ease$Quart;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "alpha"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "x"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "y"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0xa

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/16 v5, 0xb

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0xc

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0xd

    aput-object p4, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 626
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 627
    return-void
.end method

.method private hideOtherNewEventViews()V
    .locals 12

    .prologue
    const/4 v3, 0x0

    .line 2013
    const-string v0, "MediatekGlowPadView"

    const-string v1, "hideOtherNewEventViews"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2015
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/UnReadEventView;->getNewEventViewList()Ljava/util/ArrayList;

    move-result-object v9

    .line 2016
    .local v9, newEventViweList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;>;"
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 2017
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 2018
    .local v11, tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    if-eq v11, v0, :cond_0

    .line 2019
    const/4 v1, 0x1

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getAlpha()F

    move-result v2

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleX()F

    move-result v4

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleY()F

    move-result v6

    move-object v0, p0

    move v5, v3

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getZoomAnim(ZFFFFFF)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 2021
    .local v10, objectAnimator:Landroid/animation/ObjectAnimator;
    invoke-virtual {v10, v11}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 2022
    invoke-virtual {v10}, Landroid/animation/ObjectAnimator;->start()V

    .line 2016
    .end local v10           #objectAnimator:Landroid/animation/ObjectAnimator;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2025
    .end local v11           #tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    :cond_1
    return-void
.end method

.method private hideTargets(ZZ)V
    .locals 17
    .parameter "animate"
    .parameter "expanded"

    .prologue
    .line 708
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 711
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAnimatingTargets:Z

    .line 712
    if-eqz p1, :cond_0

    const/16 v3, 0xc8

    .line 713
    .local v3, duration:I
    :goto_0
    if-eqz p1, :cond_1

    const/16 v2, 0xc8

    .line 715
    .local v2, delay:I
    :goto_1
    if-eqz p2, :cond_2

    const/high16 v9, 0x3f80

    .line 717
    .local v9, targetScale:F
    :goto_2
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 718
    .local v6, length:I
    sget-object v5, Lcom/android/internal/policy/impl/keyguard/Ease$Cubic;->easeOut:Landroid/animation/TimeInterpolator;

    .line 719
    .local v5, interpolator:Landroid/animation/TimeInterpolator;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_3
    if-ge v4, v6, :cond_3

    .line 720
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 721
    .local v8, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    sget-object v10, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v8, v10}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 722
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    int-to-long v11, v3

    const/16 v13, 0xc

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    const-string v15, "ease"

    aput-object v15, v13, v14

    const/4 v14, 0x1

    aput-object v5, v13, v14

    const/4 v14, 0x2

    const-string v15, "alpha"

    aput-object v15, v13, v14

    const/4 v14, 0x3

    const/4 v15, 0x0

    invoke-static {v15}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x4

    const-string v15, "scaleX"

    aput-object v15, v13, v14

    const/4 v14, 0x5

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x6

    const-string v15, "scaleY"

    aput-object v15, v13, v14

    const/4 v14, 0x7

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    aput-object v15, v13, v14

    const/16 v14, 0x8

    const-string v15, "delay"

    aput-object v15, v13, v14

    const/16 v14, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    const/16 v14, 0xa

    const-string v15, "onUpdate"

    aput-object v15, v13, v14

    const/16 v14, 0xb

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v15, v13, v14

    invoke-static {v8, v11, v12, v13}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 719
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 712
    .end local v2           #delay:I
    .end local v3           #duration:I
    .end local v4           #i:I
    .end local v5           #interpolator:Landroid/animation/TimeInterpolator;
    .end local v6           #length:I
    .end local v8           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .end local v9           #targetScale:F
    :cond_0
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 713
    .restart local v3       #duration:I
    :cond_1
    const/4 v2, 0x0

    goto :goto_1

    .line 715
    .restart local v2       #delay:I
    :cond_2
    const v9, 0x3f4ccccd

    goto :goto_2

    .line 731
    .restart local v4       #i:I
    .restart local v5       #interpolator:Landroid/animation/TimeInterpolator;
    .restart local v6       #length:I
    .restart local v9       #targetScale:F
    :cond_3
    if-eqz p2, :cond_4

    const/high16 v7, 0x3f80

    .line 733
    .local v7, ringScaleTarget:F
    :goto_4
    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    mul-float/2addr v7, v10

    .line 734
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    int-to-long v12, v3

    const/16 v14, 0xe

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "ease"

    aput-object v16, v14, v15

    const/4 v15, 0x1

    aput-object v5, v14, v15

    const/4 v15, 0x2

    const-string v16, "alpha"

    aput-object v16, v14, v15

    const/4 v15, 0x3

    const/16 v16, 0x0

    invoke-static/range {v16 .. v16}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x4

    const-string v16, "scaleX"

    aput-object v16, v14, v15

    const/4 v15, 0x5

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x6

    const-string v16, "scaleY"

    aput-object v16, v14, v15

    const/4 v15, 0x7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v16

    aput-object v16, v14, v15

    const/16 v15, 0x8

    const-string v16, "delay"

    aput-object v16, v14, v15

    const/16 v15, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v14, v15

    const/16 v15, 0xa

    const-string v16, "onUpdate"

    aput-object v16, v14, v15

    const/16 v15, 0xb

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    const/16 v15, 0xc

    const-string v16, "onComplete"

    aput-object v16, v14, v15

    const/16 v15, 0xd

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetUpdateListener:Landroid/animation/Animator$AnimatorListener;

    move-object/from16 v16, v0

    aput-object v16, v14, v15

    invoke-static {v11, v12, v13, v14}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v11

    invoke-virtual {v10, v11}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 743
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v10}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 744
    return-void

    .line 731
    .end local v7           #ringScaleTarget:F
    :cond_4
    const/high16 v7, 0x3f00

    goto :goto_4
.end method

.method private hideUnselected(I)V
    .locals 3
    .parameter "active"

    .prologue
    .line 700
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 701
    if-eq v0, p1, :cond_0

    .line 702
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 700
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 705
    :cond_1
    return-void
.end method

.method private highlightSelected(I)V
    .locals 2
    .parameter "activeTarget"

    .prologue
    .line 695
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_ACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 696
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideUnselected(I)V

    .line 697
    return-void
.end method

.method private hitInCenterRing(FF)Z
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    .line 1779
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    sub-float v0, p1, v2

    .line 1780
    .local v0, tx:F
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    sub-float v1, p2, v2

    .line 1781
    .local v1, ty:F
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAlwaysTrackFinger:Z

    if-nez v2, :cond_0

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v2

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getScaledGlowRadiusSquared()F

    move-result v3

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private interceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "event"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1704
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1706
    .local v0, action:I
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchIntercepted:Z

    .line 1707
    .local v3, shouldIntercept:Z
    packed-switch v0, :pswitch_data_0

    .line 1719
    :goto_0
    :pswitch_0
    if-eqz v3, :cond_1

    .line 1720
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v1

    .line 1723
    .local v1, containerEvent:Landroid/view/MotionEvent;
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRecepientOffsets:[I

    aget v5, v6, v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRecepientOffsets:[I

    aget v4, v6, v4

    int-to-float v4, v4

    invoke-virtual {v1, v5, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 1724
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 1725
    .local v2, retValue:Z
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 1728
    .end local v1           #containerEvent:Landroid/view/MotionEvent;
    .end local v2           #retValue:Z
    :goto_1
    return v2

    .line 1709
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    invoke-direct {p0, v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hitInCenterRing(FF)Z

    move-result v6

    if-nez v6, :cond_0

    move v3, v4

    .line 1710
    :goto_2
    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setShouldIntercept(Z)V

    goto :goto_0

    :cond_0
    move v3, v5

    .line 1709
    goto :goto_2

    .line 1714
    :pswitch_2
    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setShouldIntercept(Z)V

    goto :goto_0

    :cond_1
    move v2, v5

    .line 1728
    goto :goto_1

    .line 1707
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private internalSetTargetResources(I)V
    .locals 8
    .parameter "resourceId"

    .prologue
    .line 801
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->loadDrawableArray(I)Ljava/util/ArrayList;

    move-result-object v5

    .line 802
    .local v5, targets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    iput-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    .line 803
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetResourceId:I

    .line 805
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v3

    .line 806
    .local v3, maxWidth:I
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v2

    .line 807
    .local v2, maxHeight:I
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 808
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 809
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 810
    .local v4, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    invoke-virtual {v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v6

    invoke-static {v3, v6}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 811
    invoke-virtual {v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v6

    invoke-static {v2, v6}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 808
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 813
    .end local v4           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    if-ne v6, v3, :cond_1

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    if-eq v6, v2, :cond_2

    .line 814
    :cond_1
    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    .line 815
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    .line 816
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->requestLayout()V

    .line 821
    :goto_1
    return-void

    .line 818
    :cond_2
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    invoke-direct {p0, v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPositions(FF)V

    .line 819
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    invoke-direct {p0, v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updatePointCloudPosition(FF)V

    goto :goto_1
.end method

.method private invlidateGlobalRegion(Landroid/view/View;)V
    .locals 9
    .parameter "childView"

    .prologue
    const/4 v6, 0x0

    .line 2206
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v3

    .line 2207
    .local v3, width:I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 2208
    .local v1, height:I
    new-instance v0, Landroid/graphics/RectF;

    int-to-float v4, v3

    int-to-float v5, v1

    invoke-direct {v0, v6, v6, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 2209
    .local v0, childBounds:Landroid/graphics/RectF;
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v4

    div-int/lit8 v5, v3, 0x2

    int-to-float v5, v5

    sub-float/2addr v4, v5

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v5

    div-int/lit8 v6, v1, 0x2

    int-to-float v6, v6

    sub-float/2addr v5, v6

    invoke-virtual {v0, v4, v5}, Landroid/graphics/RectF;->offset(FF)V

    .line 2210
    move-object v2, p0

    .line 2211
    .local v2, view:Landroid/view/View;
    :goto_0
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/View;

    if-eqz v4, :cond_0

    .line 2212
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    .end local v2           #view:Landroid/view/View;
    check-cast v2, Landroid/view/View;

    .line 2213
    .restart local v2       #view:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 2214
    iget v4, v0, Landroid/graphics/RectF;->left:F

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v4, v4

    iget v5, v0, Landroid/graphics/RectF;->top:F

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v5, v5

    iget v6, v0, Landroid/graphics/RectF;->right:F

    float-to-double v6, v6

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    iget v7, v0, Landroid/graphics/RectF;->bottom:F

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    double-to-int v7, v7

    invoke-virtual {v2, v4, v5, v6, v7}, Landroid/view/View;->invalidate(IIII)V

    goto :goto_0

    .line 2219
    :cond_0
    return-void
.end method

.method private launchActivity(Landroid/content/Intent;)V
    .locals 4
    .parameter "intent"

    .prologue
    .line 2260
    const/high16 v1, 0x3400

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2265
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/app/IActivityManager;->dismissKeyguardOnNextActivity()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2270
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 2274
    :goto_1
    return-void

    .line 2266
    :catch_0
    move-exception v0

    .line 2267
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "MediatekGlowPadView"

    const-string v2, "can\'t dismiss keyguard on launch"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2271
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 2272
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const-string v1, "MediatekGlowPadView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Activity not found for intent + "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private loadDescriptions(I)Ljava/util/ArrayList;
    .locals 6
    .parameter "resourceId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1557
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, p1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 1558
    .local v0, array:Landroid/content/res/TypedArray;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v2

    .line 1559
    .local v2, count:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1560
    .local v4, targetContentDescriptions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 1561
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1562
    .local v1, contentDescription:Ljava/lang/String;
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1560
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1564
    .end local v1           #contentDescription:Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 1565
    return-object v4
.end method

.method private loadDrawableArray(I)Ljava/util/ArrayList;
    .locals 8
    .parameter "resourceId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/keyguard/TargetDrawable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 787
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 788
    .local v4, res:Landroid/content/res/Resources;
    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->obtainTypedArray(I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 789
    .local v0, array:Landroid/content/res/TypedArray;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    .line 790
    .local v1, count:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 791
    .local v2, drawables:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 792
    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v6

    .line 793
    .local v6, value:Landroid/util/TypedValue;
    new-instance v5, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v6, :cond_0

    iget v7, v6, Landroid/util/TypedValue;->resourceId:I

    :goto_1
    invoke-direct {v5, v4, v7}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;-><init>(Landroid/content/res/Resources;I)V

    .line 794
    .local v5, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 791
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 793
    .end local v5           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    const/4 v7, 0x0

    goto :goto_1

    .line 796
    .end local v6           #value:Landroid/util/TypedValue;
    :cond_1
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 797
    return-object v2
.end method

.method private onDragMove(II)V
    .locals 16
    .parameter "x"
    .parameter "y"

    .prologue
    .line 2127
    move/from16 v0, p1

    int-to-float v12, v0

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    sub-float v10, v12, v13

    .line 2128
    .local v10, tx:F
    move/from16 v0, p2

    int-to-float v12, v0

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    sub-float v11, v12, v13

    .line 2129
    .local v11, ty:F
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v12

    float-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    double-to-float v9, v12

    .line 2131
    .local v9, touchRadius:F
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    const/high16 v13, 0x3f00

    mul-float v1, v12, v13

    .line 2132
    .local v1, FakeHandleRadius:F
    cmpl-float v12, v9, v1

    if-lez v12, :cond_1

    div-float v5, v1, v9

    .line 2133
    .local v5, scale:F
    :goto_0
    mul-float v12, v10, v5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    .line 2134
    mul-float v12, v11, v5

    move-object/from16 v0, p0

    iput v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    .line 2135
    const/4 v12, 0x0

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateHandleDrawablePositions(Z)V

    .line 2137
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v12

    float-to-double v12, v12

    invoke-static {v12, v13}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v12

    double-to-float v2, v12

    .line 2138
    .local v2, currentFakeHandleRadius:F
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragSnapMargin:F

    add-float v7, v2, v12

    .line 2139
    .local v7, snapRadius:F
    mul-float v6, v7, v7

    .line 2140
    .local v6, snapDistance2:F
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v11}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v12

    cmpg-float v12, v12, v6

    if-gez v12, :cond_2

    .line 2141
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    .line 2142
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    add-float/2addr v12, v13

    float-to-int v12, v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v13}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/ImageView;->getWidth()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    sub-int v3, v12, v13

    .line 2143
    .local v3, dragViewX:I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    move-object/from16 v0, p0

    iget v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    add-float/2addr v12, v13

    float-to-int v12, v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v13}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v13

    invoke-virtual {v13}, Landroid/widget/ImageView;->getHeight()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    sub-int v4, v12, v13

    .line 2144
    .local v4, dragViewY:I
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v14, 0x0

    aget v13, v13, v14

    add-int/2addr v13, v3

    int-to-float v13, v13

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v15, 0x1

    aget v14, v14, v15

    add-int/2addr v14, v4

    int-to-float v14, v14

    invoke-virtual {v12, v13, v14}, Lcom/android/internal/policy/impl/keyguard/DragView;->move(FF)V

    .line 2145
    const/4 v12, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v12}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateHandleDrawablePositions(Z)V

    .line 2146
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v12}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getState()[I

    move-result-object v8

    .line 2147
    .local v8, state:[I
    if-eqz v8, :cond_0

    sget-object v12, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_FOCUSED:[I

    invoke-static {v8, v12}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v12

    if-nez v12, :cond_0

    .line 2148
    invoke-direct/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->vibrate()V

    .line 2149
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v13, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_FOCUSED:[I

    invoke-virtual {v12, v13}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 2155
    .end local v3           #dragViewX:I
    .end local v4           #dragViewY:I
    .end local v8           #state:[I
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->invalidate()V

    .line 2157
    const-string v12, "MediatekGlowPadView"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "onDragMove mTouchTriggered="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", x="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", y="

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ","

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2159
    return-void

    .line 2132
    .end local v2           #currentFakeHandleRadius:F
    .end local v5           #scale:F
    .end local v6           #snapDistance2:F
    .end local v7           #snapRadius:F
    :cond_1
    const/high16 v5, 0x3f80

    goto/16 :goto_0

    .line 2152
    .restart local v2       #currentFakeHandleRadius:F
    .restart local v5       #scale:F
    .restart local v6       #snapDistance2:F
    .restart local v7       #snapRadius:F
    :cond_2
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    .line 2153
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v13, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v12, v13}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    goto :goto_1
.end method

.method private onDragStart(II)V
    .locals 10
    .parameter "x"
    .parameter "y"

    .prologue
    const/high16 v9, 0x3f00

    .line 2102
    const-string v7, "MediatekGlowPadView"

    const-string v8, "onDragStart"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2105
    int-to-float v7, p1

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/keyguard/DragView;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v9

    add-float/2addr v7, v8

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    sub-float v1, v7, v8

    .line 2106
    .local v1, dragTargetCenterX:F
    int-to-float v7, p2

    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/keyguard/DragView;->getHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v9

    add-float/2addr v7, v8

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    sub-float v2, v7, v8

    .line 2107
    .local v2, dragTargetCenterY:F
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v7

    float-to-double v7, v7

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v6, v7

    .line 2108
    .local v6, touchRadius:F
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float v0, v7, v9

    .line 2109
    .local v0, currentOuterRadius:F
    cmpl-float v7, v6, v0

    if-lez v7, :cond_0

    div-float v5, v0, v6

    .line 2110
    .local v5, scale:F
    :goto_0
    mul-float v3, v1, v5

    .line 2111
    .local v3, limitX:F
    mul-float v4, v2, v5

    .line 2114
    .local v4, limitY:F
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    float-to-int v8, v3

    iput v8, v7, Landroid/graphics/Point;->x:I

    .line 2115
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandlePosition:Landroid/graphics/Point;

    float-to-int v8, v4

    iput v8, v7, Landroid/graphics/Point;->y:I

    .line 2117
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 2118
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    .line 2120
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    .line 2121
    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    iput v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    .line 2122
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->invalidate()V

    .line 2123
    return-void

    .line 2109
    .end local v3           #limitX:F
    .end local v4           #limitY:F
    .end local v5           #scale:F
    :cond_0
    const/high16 v5, 0x3f80

    goto :goto_0
.end method

.method private refreshPositions()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1735
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    if-nez v0, :cond_0

    .line 1743
    :goto_0
    return-void

    .line 1739
    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepientRawLocation:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 1740
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRawLocation:[I

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getLocationOnScreen([I)V

    .line 1741
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRecepientOffsets:[I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRawLocation:[I

    aget v1, v1, v3

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepientRawLocation:[I

    aget v2, v2, v3

    sub-int/2addr v1, v2

    aput v1, v0, v3

    .line 1742
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRecepientOffsets:[I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerRawLocation:[I

    aget v1, v1, v4

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepientRawLocation:[I

    aget v2, v2, v4

    sub-int/2addr v1, v2

    aput v1, v0, v4

    goto :goto_0
.end method

.method private replaceTargetDrawables(Landroid/content/res/Resources;II)Z
    .locals 6
    .parameter "res"
    .parameter "existingResourceId"
    .parameter "newResourceId"

    .prologue
    .line 1609
    if-eqz p2, :cond_0

    if-nez p3, :cond_2

    .line 1610
    :cond_0
    const/4 v2, 0x0

    .line 1628
    :cond_1
    :goto_0
    return v2

    .line 1613
    :cond_2
    const/4 v2, 0x0

    .line 1614
    .local v2, result:Z
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    .line 1615
    .local v0, drawables:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1616
    .local v3, size:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v3, :cond_4

    .line 1617
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1618
    .local v4, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getResourceId()I

    move-result v5

    if-ne v5, p2, :cond_3

    .line 1619
    invoke-virtual {v4, p1, p3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setDrawable(Landroid/content/res/Resources;I)V

    .line 1620
    const/4 v2, 0x1

    .line 1616
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1624
    .end local v4           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_4
    if-eqz v2, :cond_1

    .line 1625
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->requestLayout()V

    goto :goto_0
.end method

.method private resolveMeasured(II)I
    .locals 3
    .parameter "measureSpec"
    .parameter "desired"

    .prologue
    .line 539
    const/4 v0, 0x0

    .line 540
    .local v0, result:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 541
    .local v1, specSize:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 550
    move v0, v1

    .line 552
    :goto_0
    return v0

    .line 543
    :sswitch_0
    move v0, p2

    .line 544
    goto :goto_0

    .line 546
    :sswitch_1
    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 547
    goto :goto_0

    .line 541
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_1
        0x0 -> :sswitch_0
    .end sparse-switch
.end method

.method private setGrabbedState(I)V
    .locals 2
    .parameter "newState"

    .prologue
    const/4 v1, 0x1

    .line 1244
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGrabbedState:I

    if-eq p1, v0, :cond_1

    .line 1245
    if-eqz p1, :cond_0

    .line 1246
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->vibrate()V

    .line 1248
    :cond_0
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGrabbedState:I

    .line 1249
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    if-eqz v0, :cond_1

    .line 1250
    if-nez p1, :cond_2

    .line 1251
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    invoke-interface {v0, p0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onReleased(Landroid/view/View;I)V

    .line 1255
    :goto_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    invoke-interface {v0, p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onGrabbedStateChange(Landroid/view/View;I)V

    .line 1258
    :cond_1
    return-void

    .line 1253
    :cond_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    invoke-interface {v0, p0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onGrabbed(Landroid/view/View;I)V

    goto :goto_0
.end method

.method private setShouldIntercept(Z)V
    .locals 0
    .parameter "shouldIntercept"

    .prologue
    .line 1774
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchIntercepted:Z

    .line 1775
    return-void
.end method

.method private showAllNewEventViews()V
    .locals 12

    .prologue
    const/high16 v3, 0x3f80

    .line 2059
    const-string v0, "MediatekGlowPadView"

    const-string v1, "showAllNewEventViews"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2061
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/UnReadEventView;->getNewEventViewList()Ljava/util/ArrayList;

    move-result-object v9

    .line 2062
    .local v9, newEventViweList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;>;"
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_0

    .line 2063
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 2064
    .local v11, tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    const/4 v1, 0x0

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getAlpha()F

    move-result v2

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleX()F

    move-result v4

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleY()F

    move-result v6

    move-object v0, p0

    move v5, v3

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getZoomAnim(ZFFFFFF)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 2066
    .local v10, objectAnimator:Landroid/animation/ObjectAnimator;
    invoke-virtual {v10, v11}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 2067
    invoke-virtual {v10}, Landroid/animation/ObjectAnimator;->start()V

    .line 2062
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2069
    .end local v10           #objectAnimator:Landroid/animation/ObjectAnimator;
    .end local v11           #tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    :cond_0
    return-void
.end method

.method private showGlow(IIFLandroid/animation/Animator$AnimatorListener;)V
    .locals 7
    .parameter "duration"
    .parameter "delay"
    .parameter "finalAlpha"
    .parameter "finishListener"

    .prologue
    .line 605
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 606
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/PointCloud;->glowManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;

    int-to-long v2, p1

    const/16 v4, 0xa

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ease"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/policy/impl/keyguard/Ease$Cubic;->easeIn:Landroid/animation/TimeInterpolator;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "alpha"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    aput-object p4, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 612
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 613
    return-void
.end method

.method private showOtherNewEventViews()V
    .locals 12

    .prologue
    const/high16 v3, 0x3f80

    .line 2029
    const-string v0, "MediatekGlowPadView"

    const-string v1, "showOtherNewEventViews"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2031
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/UnReadEventView;->getNewEventViewList()Ljava/util/ArrayList;

    move-result-object v9

    .line 2032
    .local v9, newEventViweList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;>;"
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v8, v0, :cond_1

    .line 2033
    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 2034
    .local v11, tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    if-eq v11, v0, :cond_0

    .line 2035
    const/4 v1, 0x0

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getAlpha()F

    move-result v2

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleX()F

    move-result v4

    invoke-virtual {v11}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleY()F

    move-result v6

    move-object v0, p0

    move v5, v3

    move v7, v3

    invoke-direct/range {v0 .. v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getZoomAnim(ZFFFFFF)Landroid/animation/ObjectAnimator;

    move-result-object v10

    .line 2037
    .local v10, objectAnimator:Landroid/animation/ObjectAnimator;
    invoke-virtual {v10, v11}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    .line 2038
    invoke-virtual {v10}, Landroid/animation/ObjectAnimator;->start()V

    .line 2032
    .end local v10           #objectAnimator:Landroid/animation/ObjectAnimator;
    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 2041
    .end local v11           #tmpNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    :cond_1
    return-void
.end method

.method private showTargets(Z)V
    .locals 13
    .parameter "animate"

    .prologue
    .line 747
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 748
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAnimatingTargets:Z

    .line 749
    if-eqz p1, :cond_0

    const/16 v0, 0x32

    .line 750
    .local v0, delay:I
    :goto_0
    if-eqz p1, :cond_1

    const/16 v1, 0xc8

    .line 751
    .local v1, duration:I
    :goto_1
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 752
    .local v3, length:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    if-ge v2, v3, :cond_2

    .line 753
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 754
    .local v5, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    sget-object v6, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v5, v6}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 755
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    int-to-long v7, v1

    const/16 v9, 0xc

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    const-string v11, "ease"

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Lcom/android/internal/policy/impl/keyguard/Ease$Cubic;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v11, v9, v10

    const/4 v10, 0x2

    const-string v11, "alpha"

    aput-object v11, v9, v10

    const/4 v10, 0x3

    const/high16 v11, 0x3f80

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x4

    const-string v11, "scaleX"

    aput-object v11, v9, v10

    const/4 v10, 0x5

    const/high16 v11, 0x3f80

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x6

    const-string v11, "scaleY"

    aput-object v11, v9, v10

    const/4 v10, 0x7

    const/high16 v11, 0x3f80

    invoke-static {v11}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v11

    aput-object v11, v9, v10

    const/16 v10, 0x8

    const-string v11, "delay"

    aput-object v11, v9, v10

    const/16 v10, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    const/16 v10, 0xa

    const-string v11, "onUpdate"

    aput-object v11, v9, v10

    const/16 v10, 0xb

    iget-object v11, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v11, v9, v10

    invoke-static {v5, v7, v8, v9}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 752
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 749
    .end local v0           #delay:I
    .end local v1           #duration:I
    .end local v2           #i:I
    .end local v3           #length:I
    .end local v5           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 750
    .restart local v0       #delay:I
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 764
    .restart local v1       #duration:I
    .restart local v2       #i:I
    .restart local v3       #length:I
    :cond_2
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    const/high16 v7, 0x3f80

    mul-float v4, v6, v7

    .line 765
    .local v4, ringScale:F
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    int-to-long v8, v1

    const/16 v10, 0xe

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "ease"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    sget-object v12, Lcom/android/internal/policy/impl/keyguard/Ease$Cubic;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-string v12, "alpha"

    aput-object v12, v10, v11

    const/4 v11, 0x3

    const/high16 v12, 0x3f80

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x4

    const-string v12, "scaleX"

    aput-object v12, v10, v11

    const/4 v11, 0x5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x6

    const-string v12, "scaleY"

    aput-object v12, v10, v11

    const/4 v11, 0x7

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    const/16 v11, 0x8

    const-string v12, "delay"

    aput-object v12, v10, v11

    const/16 v11, 0x9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/16 v11, 0xa

    const-string v12, "onUpdate"

    aput-object v12, v10, v11

    const/16 v11, 0xb

    iget-object v12, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v12, v10, v11

    const/16 v11, 0xc

    const-string v12, "onComplete"

    aput-object v12, v10, v11

    const/16 v11, 0xd

    iget-object v12, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetUpdateListener:Landroid/animation/Animator$AnimatorListener;

    aput-object v12, v10, v11

    invoke-static {v7, v8, v9, v10}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 774
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v6}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 775
    return-void
.end method

.method private square(F)F
    .locals 1
    .parameter "d"

    .prologue
    .line 1498
    mul-float v0, p1, p1

    return v0
.end method

.method private startBackgroundAnimation(IF)V
    .locals 6
    .parameter "duration"
    .parameter "alpha"

    .prologue
    .line 989
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 990
    .local v0, background:Landroid/graphics/drawable/Drawable;
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAlwaysTrackFinger:Z

    if-eqz v1, :cond_1

    if-eqz v0, :cond_1

    .line 991
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mBackgroundAnimator:Lcom/android/internal/policy/impl/keyguard/Tweener;

    if-eqz v1, :cond_0

    .line 992
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mBackgroundAnimator:Lcom/android/internal/policy/impl/keyguard/Tweener;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/Tweener;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 994
    :cond_0
    int-to-long v1, p1

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "ease"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Lcom/android/internal/policy/impl/keyguard/Ease$Cubic;->easeIn:Landroid/animation/TimeInterpolator;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-string v5, "alpha"

    aput-object v5, v3, v4

    const/4 v4, 0x3

    const/high16 v5, 0x437f

    mul-float/2addr v5, p2

    float-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-string v5, "delay"

    aput-object v5, v3, v4

    const/4 v4, 0x5

    const/16 v5, 0x32

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v0, v1, v2, v3}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mBackgroundAnimator:Lcom/android/internal/policy/impl/keyguard/Tweener;

    .line 998
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mBackgroundAnimator:Lcom/android/internal/policy/impl/keyguard/Tweener;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/Tweener;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 1000
    :cond_1
    return-void
.end method

.method private startWaveAnimation()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/high16 v7, 0x4000

    .line 946
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 947
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/PointCloud;->waveManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;->setAlpha(F)V

    .line 948
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/PointCloud;->waveManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v7

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;->setRadius(F)V

    .line 949
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v1, v1, Lcom/android/internal/policy/impl/keyguard/PointCloud;->waveManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;

    const-wide/16 v2, 0x546

    const/16 v4, 0xa

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "ease"

    aput-object v5, v4, v8

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/policy/impl/keyguard/Ease$Quad;->easeOut:Landroid/animation/TimeInterpolator;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "delay"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const-string v6, "radius"

    aput-object v6, v4, v5

    const/4 v5, 0x5

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-string v6, "onUpdate"

    aput-object v6, v4, v5

    const/4 v5, 0x7

    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const-string v6, "onComplete"

    aput-object v6, v4, v5

    const/16 v5, 0x9

    new-instance v6, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$6;

    invoke-direct {v6, p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$6;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;)V

    aput-object v6, v4, v5

    invoke-static {v1, v2, v3, v4}, Lcom/android/internal/policy/impl/keyguard/Tweener;->to(Ljava/lang/Object;J[Ljava/lang/Object;)Lcom/android/internal/policy/impl/keyguard/Tweener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->add(Ljava/lang/Object;)Z

    .line 961
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 962
    return-void
.end method

.method private stopAndHideWaveAnimation()V
    .locals 2

    .prologue
    .line 941
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->cancel()V

    .line 942
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v0, v0, Lcom/android/internal/policy/impl/keyguard/PointCloud;->waveManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/PointCloud$WaveManager;->setAlpha(F)V

    .line 943
    return-void
.end method

.method private switchDragViewToState(IIIFF)V
    .locals 10
    .parameter "state"
    .parameter "eventX"
    .parameter "eventY"
    .parameter "velocityX"
    .parameter "velocityY"

    .prologue
    .line 2395
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "switchDrageViewToState enter mDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->converDragViewStateCodeToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", new state="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->converDragViewStateCodeToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "mPendingDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->converDragViewStateCodeToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", eventX="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", eventY="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2397
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimating:Z

    if-eqz v0, :cond_0

    .line 2398
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    .line 2399
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    iput p2, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;->eventX:I

    .line 2400
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    iput p3, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;->eventY:I

    .line 2401
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    iput p4, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;->velocityX:F

    .line 2402
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingEvent:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;

    iput p5, v0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$PendingEvent;->velocityY:F

    .line 2403
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "switchDrageViewToState exit, mDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", mPendingDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2493
    :goto_0
    return-void

    .line 2406
    :cond_0
    packed-switch p1, :pswitch_data_0

    .line 2492
    :goto_1
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "switchDrageViewToState exit, mDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", mPendingDragViewState="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 2408
    :pswitch_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;->onGrabbedStateChange(Landroid/view/View;I)V

    .line 2409
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2410
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewDoingTouch:Z

    .line 2411
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimating:Z

    .line 2412
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 2413
    .local v2, b:Landroid/graphics/Bitmap;
    iput p2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewInLockScreenX:I

    .line 2414
    iput p3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewInLockScreenY:I

    .line 2416
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewInLockScreenX:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v5, 0x0

    aget v1, v1, v5

    add-int v3, v0, v1

    .line 2417
    .local v3, registrationX:I
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewEventViewInLockScreenY:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v5, 0x1

    aget v1, v1, v5

    add-int v4, v0, v1

    .line 2419
    .local v4, registrationY:I
    const-string v0, "MediatekGlowPadView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleTouchDown registrationX="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, ", registrationY="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 2422
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/DragView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    iget-object v9, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v9}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getScaleX()F

    move-result v9

    invoke-direct/range {v0 .. v9}, Lcom/android/internal/policy/impl/keyguard/DragView;-><init>(Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;Landroid/graphics/Bitmap;IIIIIIF)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    .line 2424
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/policy/impl/keyguard/DragView;->show(II)V

    .line 2426
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p2

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p3

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->onDragStart(II)V

    .line 2429
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setVisibility(I)V

    .line 2430
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideOtherNewEventViews()V

    .line 2432
    .end local v2           #b:Landroid/graphics/Bitmap;
    .end local v3           #registrationX:I
    .end local v4           #registrationY:I
    :pswitch_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2433
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimating:Z

    .line 2434
    const/16 v0, 0x64

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->activateHandle(II)V

    goto/16 :goto_1

    .line 2437
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2438
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->doIntersectAnimation()V

    goto/16 :goto_1

    .line 2441
    :pswitch_3
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 2444
    :cond_1
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2445
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v5, 0x0

    aget v1, v1, v5

    add-int/2addr v1, p2

    int-to-float v1, v1

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerLocationInLockScreen:[I

    const/4 v6, 0x1

    aget v5, v5, v6

    add-int/2addr v5, p3

    int-to-float v5, v5

    invoke-virtual {v0, v1, v5}, Lcom/android/internal/policy/impl/keyguard/DragView;->move(FF)V

    .line 2446
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p2

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ImageView;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p3

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->onDragMove(II)V

    goto/16 :goto_1

    .line 2450
    :pswitch_4
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2451
    invoke-direct {p0, p4, p5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->freeFling(FF)V

    goto/16 :goto_1

    .line 2456
    :pswitch_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    .line 2457
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 2458
    const/4 v0, 0x6

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2459
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showOtherNewEventViews()V

    .line 2460
    const/16 v0, 0xc8

    const/16 v1, 0x14

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->animHandlerBack(II)V

    goto/16 :goto_1

    .line 2463
    :pswitch_6
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2464
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleTrigger(Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;)V

    goto/16 :goto_1

    .line 2468
    :pswitch_7
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v0, :cond_2

    .line 2469
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 2470
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setEnabled(Z)V

    .line 2472
    :cond_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v0, :cond_3

    .line 2473
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 2476
    :cond_3
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    if-eqz v0, :cond_4

    .line 2477
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setVisibility(I)V

    .line 2478
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 2480
    :cond_4
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    if-eqz v0, :cond_5

    .line 2481
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->remove()V

    .line 2482
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragView:Lcom/android/internal/policy/impl/keyguard/DragView;

    .line 2484
    :cond_5
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 2485
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    .line 2486
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    .line 2487
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    .line 2488
    const/4 v0, 0x7

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    .line 2489
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPendingDragViewState:I

    goto/16 :goto_1

    .line 2406
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_7
    .end packed-switch
.end method

.method private switchToState(IFF)V
    .locals 6
    .parameter "state"
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 556
    packed-switch p1, :pswitch_data_0

    .line 601
    :cond_0
    :goto_0
    return-void

    .line 558
    :pswitch_0
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 559
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->deactivateTargets()V

    .line 560
    invoke-direct {p0, v1, v1, v2, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideGlow(IIFLandroid/animation/Animator$AnimatorListener;)V

    .line 561
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->startBackgroundAnimation(IF)V

    .line 562
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    sget-object v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->STATE_INACTIVE:[I

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setState([I)V

    .line 563
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    goto :goto_0

    .line 567
    :pswitch_1
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 568
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->startBackgroundAnimation(IF)V

    goto :goto_0

    .line 572
    :pswitch_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 573
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 574
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->deactivateTargets()V

    .line 575
    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showTargets(Z)V

    .line 576
    const/16 v0, 0xc8

    invoke-direct {p0, v0, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->startBackgroundAnimation(IF)V

    .line 577
    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setGrabbedState(I)V

    .line 578
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 579
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->announceTargets()V

    goto :goto_0

    .line 584
    :pswitch_3
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 585
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 586
    invoke-direct {p0, v1, v1, v3, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showGlow(IIFLandroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    .line 591
    :pswitch_4
    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 592
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setAlpha(F)V

    .line 593
    invoke-direct {p0, v1, v1, v2, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showGlow(IIFLandroid/animation/Animator$AnimatorListener;)V

    goto :goto_0

    .line 597
    :pswitch_5
    const/4 v0, 0x5

    iput v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    .line 598
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->doFinish()V

    goto :goto_0

    .line 556
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method private trySwitchToFirstTouchState(FF)Z
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v2, 0x1

    .line 1261
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    sub-float v0, p1, v3

    .line 1262
    .local v0, tx:F
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    sub-float v1, p2, v3

    .line 1263
    .local v1, ty:F
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAlwaysTrackFinger:Z

    if-nez v3, :cond_0

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v3

    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getScaledGlowRadiusSquared()F

    move-result v4

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_2

    .line 1264
    :cond_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    if-eqz v3, :cond_1

    .line 1265
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideAllNewEventViews()V

    .line 1267
    :cond_1
    const-string v3, "MediatekGlowPadView"

    const-string v4, "** Handle HIT"

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1268
    const/4 v3, 0x2

    invoke-direct {p0, v3, p1, p2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 1269
    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlowPosition(FF)V

    .line 1270
    iput-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragging:Z

    .line 1273
    :goto_0
    return v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private updateGlobalLayoutListenr(Z)V
    .locals 1
    .parameter "shouldEnable"

    .prologue
    .line 1762
    if-eqz p1, :cond_1

    .line 1763
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLayoutListenerSet:Z

    if-nez v0, :cond_0

    .line 1764
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnLayoutListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 1765
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLayoutListenerSet:Z

    .line 1771
    :cond_0
    :goto_0
    return-void

    .line 1768
    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnLayoutListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 1769
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLayoutListenerSet:Z

    goto :goto_0
.end method

.method private updateGlowPosition(FF)V
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    const/high16 v3, 0x3f80

    .line 1074
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getX()F

    move-result v2

    sub-float v0, p1, v2

    .line 1075
    .local v0, dx:F
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getY()F

    move-result v2

    sub-float v1, p2, v2

    .line 1076
    .local v1, dy:F
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    div-float v2, v3, v2

    mul-float/2addr v0, v2

    .line 1077
    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    div-float v2, v3, v2

    mul-float/2addr v1, v2

    .line 1078
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v2, v2, Lcom/android/internal/policy/impl/keyguard/PointCloud;->glowManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getX()F

    move-result v3

    add-float/2addr v3, v0

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;->setX(F)V

    .line 1079
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget-object v2, v2, Lcom/android/internal/policy/impl/keyguard/PointCloud;->glowManager:Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getY()F

    move-result v3

    add-float/2addr v3, v1

    invoke-virtual {v2, v3}, Lcom/android/internal/policy/impl/keyguard/PointCloud$GlowManager;->setY(F)V

    .line 1080
    return-void
.end method

.method private updateHandleDrawablePositions(Z)V
    .locals 11
    .parameter "force"

    .prologue
    .line 1902
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    const/4 v9, 0x3

    if-eq v8, v9, :cond_1

    .line 1935
    :cond_0
    :goto_0
    return-void

    .line 1905
    :cond_1
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v8, :cond_0

    .line 1906
    if-nez p1, :cond_3

    .line 1907
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getX()F

    move-result v6

    .line 1908
    .local v6, oldX:F
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v8}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getY()F

    move-result v7

    .line 1909
    .local v7, oldY:F
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    sub-float/2addr v8, v6

    float-to-int v0, v8

    .line 1910
    .local v0, deltaX:I
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    sub-float/2addr v8, v7

    float-to-int v1, v8

    .line 1911
    .local v1, deltaY:I
    mul-int v8, v0, v0

    mul-int v9, v1, v1

    add-int v3, v8, v9

    .line 1912
    .local v3, distanceSqure:I
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlopSqure:I

    if-le v3, v8, :cond_2

    .line 1913
    int-to-double v8, v3

    invoke-static {v8, v9}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v8

    double-to-int v2, v8

    .line 1914
    .local v2, distance:I
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlop:I

    mul-int/2addr v8, v0

    div-int v4, v8, v2

    .line 1915
    .local v4, offsetX:I
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlop:I

    mul-int/2addr v8, v1

    div-int v5, v8, v2

    .line 1916
    .local v5, offsetY:I
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    int-to-float v9, v4

    add-float/2addr v8, v9

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 1917
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    int-to-float v9, v5

    add-float/2addr v8, v9

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    .line 1919
    const-string v8, "MediatekGlowPadView"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "oldX="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", oldY="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", deltaX="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", deltaY="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", distance="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", offsetX="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", offsetY="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", mFakeHandleRealX="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", mFakeHandleRealY="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1923
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->invalidate()V

    .line 1932
    .end local v0           #deltaX:I
    .end local v1           #deltaY:I
    .end local v2           #distance:I
    .end local v3           #distanceSqure:I
    .end local v4           #offsetX:I
    .end local v5           #offsetY:I
    .end local v6           #oldX:F
    .end local v7           #oldY:F
    :goto_1
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    invoke-virtual {v8, v9}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setX(F)V

    .line 1933
    iget-object v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    iget v9, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    invoke-virtual {v8, v9}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setY(F)V

    goto/16 :goto_0

    .line 1925
    .restart local v0       #deltaX:I
    .restart local v1       #deltaY:I
    .restart local v3       #distanceSqure:I
    .restart local v6       #oldX:F
    .restart local v7       #oldY:F
    :cond_2
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 1926
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    goto :goto_1

    .line 1929
    .end local v0           #deltaX:I
    .end local v1           #deltaY:I
    .end local v3           #distanceSqure:I
    .end local v6           #oldX:F
    .end local v7           #oldY:F
    :cond_3
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetX:F

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealX:F

    .line 1930
    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentFakeHandleTargetY:F

    iput v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleRealY:F

    goto :goto_1
.end method

.method private updatePointCloudPosition(FF)V
    .locals 1
    .parameter "centerX"
    .parameter "centerY"

    .prologue
    .line 1472
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/policy/impl/keyguard/PointCloud;->setCenter(FF)V

    .line 1473
    return-void
.end method

.method private updateTargetPosition(IFF)V
    .locals 2
    .parameter "i"
    .parameter "centerX"
    .parameter "centerY"

    .prologue
    .line 1431
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getSliceAngle()F

    move-result v1

    invoke-direct {p0, v1, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getAngle(FI)F

    move-result v0

    .line 1432
    .local v0, angle:F
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPosition(IFFF)V

    .line 1433
    return-void
.end method

.method private updateTargetPosition(IFFF)V
    .locals 6
    .parameter "i"
    .parameter "centerX"
    .parameter "centerY"
    .parameter "angle"

    .prologue
    const/high16 v5, 0x4000

    .line 1436
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getRingWidth()F

    move-result v4

    div-float v0, v4, v5

    .line 1437
    .local v0, placementRadiusX:F
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getRingHeight()F

    move-result v4

    div-float v1, v4, v5

    .line 1438
    .local v1, placementRadiusY:F
    if-ltz p1, :cond_0

    .line 1439
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    .line 1440
    .local v3, targets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1441
    .local v2, targetIcon:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    invoke-virtual {v2, p2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionX(F)V

    .line 1442
    invoke-virtual {v2, p3}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionY(F)V

    .line 1443
    float-to-double v4, p4

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v4, v0

    invoke-virtual {v2, v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setX(F)V

    .line 1444
    float-to-double v4, p4

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float/2addr v4, v1

    invoke-virtual {v2, v4}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setY(F)V

    .line 1446
    .end local v2           #targetIcon:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .end local v3           #targets:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/TargetDrawable;>;"
    :cond_0
    return-void
.end method

.method private updateTargetPositions(FF)V
    .locals 1
    .parameter "centerX"
    .parameter "centerY"

    .prologue
    .line 1449
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPositions(FFZ)V

    .line 1450
    return-void
.end method

.method private updateTargetPositions(FFZ)V
    .locals 4
    .parameter "centerX"
    .parameter "centerY"
    .parameter "skipActive"

    .prologue
    .line 1453
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 1454
    .local v2, size:I
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getSliceAngle()F

    move-result v0

    .line 1456
    .local v0, alpha:F
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 1457
    if-eqz p3, :cond_0

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActiveTarget:I

    if-eq v1, v3, :cond_1

    .line 1458
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getAngle(FI)F

    move-result v3

    invoke-direct {p0, v1, p1, p2, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPosition(IFFF)V

    .line 1456
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1461
    :cond_2
    return-void
.end method

.method private vibrate()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 778
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "haptic_feedback_enabled"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_1

    .line 781
    .local v0, hapticEnabled:Z
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrator:Landroid/os/Vibrator;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 782
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrator:Landroid/os/Vibrator;

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrationDuration:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 784
    :cond_0
    return-void

    .line 778
    .end local v0           #hapticEnabled:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public createDragBitmap(Landroid/view/View;Landroid/graphics/Canvas;)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "v"
    .parameter "canvas"

    .prologue
    .line 2283
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 2285
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p2, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2286
    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->drawDragView(Landroid/view/View;Landroid/graphics/Canvas;Z)V

    .line 2287
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 2289
    return-object v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    .line 1696
    const/4 v0, 0x0

    .line 1697
    .local v0, handled:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 1698
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->interceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 1700
    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_0
.end method

.method public doShakeAnimation()V
    .locals 1

    .prologue
    .line 2506
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    if-eqz v0, :cond_0

    .line 2507
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->beginShakeAnimation()V

    .line 2509
    :cond_0
    return-void
.end method

.method public getDirectionDescriptionsResourceId()I
    .locals 1

    .prologue
    .line 896
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptionsResourceId:I

    return v0
.end method

.method public getResourceIdForTarget(I)I
    .locals 3
    .parameter "index"

    .prologue
    .line 1573
    if-ltz p1, :cond_1

    .line 1574
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1575
    .local v0, drawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 1579
    .end local v0           #drawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    .local v1, resId:I
    :goto_0
    return v1

    .line 1575
    .end local v1           #resId:I
    .restart local v0       #drawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getResourceId()I

    move-result v1

    goto :goto_0

    .line 1577
    .end local v0           #drawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_1
    const/4 v1, -0x1

    .restart local v1       #resId:I
    goto :goto_0
.end method

.method protected getScaledSuggestedMinimumHeight()I
    .locals 4

    .prologue
    .line 533
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4000

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method protected getScaledSuggestedMinimumWidth()I
    .locals 4

    .prologue
    .line 525
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x4000

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method protected getSuggestedMinimumHeight()I
    .locals 3

    .prologue
    .line 518
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x4000

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method protected getSuggestedMinimumWidth()I
    .locals 3

    .prologue
    .line 511
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x4000

    iget v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRadius:F

    mul-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    int-to-float v1, v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getTargetDescriptionsResourceId()I
    .locals 1

    .prologue
    .line 875
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptionsResourceId:I

    return v0
.end method

.method public getTargetPosition(I)I
    .locals 3
    .parameter "resourceId"

    .prologue
    .line 1598
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 1599
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1600
    .local v1, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getResourceId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 1604
    .end local v0           #i:I
    .end local v1           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :goto_1
    return v0

    .line 1598
    .restart local v0       #i:I
    .restart local v1       #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1604
    .end local v1           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_1
    const/4 v0, -0x1

    goto :goto_1
.end method

.method public getTargetResourceId()I
    .locals 1

    .prologue
    .line 854
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetResourceId:I

    return v0
.end method

.method public getWaveCenterX()F
    .locals 1

    .prologue
    .line 2497
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    return v0
.end method

.method public getWaveCenterY()F
    .locals 1

    .prologue
    .line 2502
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    return v0
.end method

.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 1748
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 1749
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlobalLayoutListenr(Z)V

    .line 1750
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 1755
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 1756
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlobalLayoutListenr(Z)V

    .line 1757
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setTouchRecepient(Landroid/view/View;)V

    .line 1758
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .parameter "canvas"

    .prologue
    .line 1477
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    invoke-virtual {v3, p1}, Lcom/android/internal/policy/impl/keyguard/PointCloud;->draw(Landroid/graphics/Canvas;)V

    .line 1478
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v3, p1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1479
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1480
    .local v1, ntargets:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 1481
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1482
    .local v2, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    if-eqz v2, :cond_0

    .line 1483
    invoke-virtual {v2, p1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1480
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1486
    .end local v2           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_1
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v3, p1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1487
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v3, :cond_2

    .line 1488
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v3, p1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 1489
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateHandleDrawablePositions(Z)V

    .line 1491
    :cond_2
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x1

    .line 1219
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/accessibility/AccessibilityManager;->getInstance(Landroid/content/Context;)Landroid/view/accessibility/AccessibilityManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityManager;->isTouchExplorationEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1220
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1221
    .local v0, action:I
    packed-switch v0, :pswitch_data_0

    .line 1232
    :goto_0
    :pswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1233
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    .line 1235
    .end local v0           #action:I
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->onHoverEvent(Landroid/view/MotionEvent;)Z

    .line 1236
    return v2

    .line 1223
    .restart local v0       #action:I
    :pswitch_1
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    goto :goto_0

    .line 1226
    :pswitch_2
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    goto :goto_0

    .line 1229
    :pswitch_3
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->setAction(I)V

    goto :goto_0

    .line 1221
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 9
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 1393
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 1394
    sub-int v5, p4, p2

    .line 1395
    .local v5, width:I
    sub-int v0, p5, p3

    .line 1399
    .local v0, height:I
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getRingWidth()F

    move-result v4

    .line 1400
    .local v4, placementWidth:F
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getRingHeight()F

    move-result v3

    .line 1401
    .local v3, placementHeight:F
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHorizontalInset:I

    int-to-float v6, v6

    int-to-float v7, v5

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetWidth:I

    int-to-float v8, v8

    add-float/2addr v8, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    const/high16 v8, 0x4000

    div-float/2addr v7, v8

    add-float v1, v6, v7

    .line 1403
    .local v1, newWaveCenterX:F
    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVerticalInset:I

    int-to-float v6, v6

    int-to-float v7, v0

    iget v8, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mMaxTargetHeight:I

    int-to-float v8, v8

    add-float/2addr v8, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    move-result v7

    const/high16 v8, 0x4000

    div-float/2addr v7, v8

    add-float v2, v6, v7

    .line 1406
    .local v2, newWaveCenterY:F
    iget-boolean v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInitialLayout:Z

    if-eqz v6, :cond_0

    .line 1407
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->stopAndHideWaveAnimation()V

    .line 1408
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct {p0, v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideTargets(ZZ)V

    .line 1409
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mInitialLayout:Z

    .line 1412
    :cond_0
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionX(F)V

    .line 1413
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOuterRing:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionY(F)V

    .line 1415
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPointCloud:Lcom/android/internal/policy/impl/keyguard/PointCloud;

    iget v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    invoke-virtual {v6, v7}, Lcom/android/internal/policy/impl/keyguard/PointCloud;->setScale(F)V

    .line 1417
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6, v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionX(F)V

    .line 1418
    iget-object v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v6, v2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setPositionY(F)V

    .line 1420
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateTargetPositions(FF)V

    .line 1421
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updatePointCloudPosition(FF)V

    .line 1422
    invoke-direct {p0, v1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlowPosition(FF)V

    .line 1424
    iput v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    .line 1425
    iput v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    .line 1427
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dump()V

    .line 1428
    return-void
.end method

.method protected onMeasure(II)V
    .locals 8
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 1368
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getSuggestedMinimumWidth()I

    move-result v3

    .line 1369
    .local v3, minimumWidth:I
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getSuggestedMinimumHeight()I

    move-result v2

    .line 1370
    .local v2, minimumHeight:I
    invoke-direct {p0, p1, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->resolveMeasured(II)I

    move-result v1

    .line 1371
    .local v1, computedWidth:I
    invoke-direct {p0, p2, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->resolveMeasured(II)I

    move-result v0

    .line 1373
    .local v0, computedHeight:I
    invoke-direct {p0, v3, v2, v1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->computeScaleFactor(IIII)F

    move-result v6

    iput v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mRingScaleFactor:F

    .line 1376
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getScaledSuggestedMinimumWidth()I

    move-result v5

    .line 1377
    .local v5, scaledWidth:I
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getScaledSuggestedMinimumHeight()I

    move-result v4

    .line 1379
    .local v4, scaledHeight:I
    sub-int v6, v1, v5

    sub-int v7, v0, v4

    invoke-direct {p0, v6, v7}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->computeInsets(II)V

    .line 1380
    invoke-virtual {p0, v1, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->setMeasuredDimension(II)V

    .line 1381
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 12
    .parameter "v"
    .parameter "event"

    .prologue
    const/4 v1, 0x6

    const/4 v9, 0x1

    const/4 v0, 0x0

    const/4 v4, 0x0

    .line 1964
    const-string v5, "MediatekGlowPadView"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onTouch event.action="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", event.getX()="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", event.getY()="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", event.getRawX()="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", event.getRawY()="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", v="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mCurrentNewEventView="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mDragViewDoingTouch="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v11, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewDoingTouch:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", mGlowPadViewState="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1968
    iget v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowPadViewState:I

    if-eqz v5, :cond_1

    .line 2008
    .end local p1
    :cond_0
    :goto_0
    return v0

    .restart local p1
    :cond_1
    move-object v8, p1

    .line 1971
    check-cast v8, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 1972
    .local v8, newEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    if-ne p1, v5, :cond_0

    .line 1975
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    .line 1976
    .local v6, action:I
    if-nez v6, :cond_3

    .line 1977
    check-cast p1, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .end local p1
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    .line 1979
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    neg-float v10, v10

    float-to-int v10, v10

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    neg-float v11, v11

    float-to-int v11, v11

    invoke-virtual {v5, v10, v11}, Landroid/graphics/Point;->set(II)V

    .line 1981
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mCurrentNewEventView:Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-direct {p0, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->computeOwnerNewEventViewMotionOffset(Landroid/view/View;)V

    .line 1982
    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    iget-object v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v0, v10, v0

    neg-int v0, v0

    iget-object v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOwnerNewEventViewOffset:[I

    aget v10, v10, v9

    neg-int v10, v10

    invoke-virtual {v5, v0, v10}, Landroid/graphics/Point;->offset(II)V

    .line 1984
    :cond_3
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    iget v0, v0, Landroid/graphics/Point;->x:I

    int-to-float v0, v0

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    invoke-virtual {p2, v0, v5}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 1986
    const-string v0, "MediatekGlowPadView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onTouch event.getX()="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ", event.getY()="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v10

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ", mPoint.x="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->x:I

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ", mPoint.y="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mPoint:Landroid/graphics/Point;

    iget v10, v10, Landroid/graphics/Point;->y:I

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1989
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v7

    .line 1991
    .local v7, handled:Z
    const-string v0, "MediatekGlowPadView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "onTouch handled="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ", mTapTimeOut="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTapTimeOut:Z

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v10, ", mTouchTriggered="

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v10, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1993
    if-nez v7, :cond_4

    .line 1994
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v2, v0

    .line 1995
    .local v2, eventX:I
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v3, v0

    .line 1996
    .local v3, eventY:I
    if-ne v6, v9, :cond_6

    .line 1997
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchTriggered:Z

    if-eqz v0, :cond_5

    .line 1998
    const/4 v1, 0x5

    move-object v0, p0

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    .end local v2           #eventX:I
    .end local v3           #eventY:I
    :cond_4
    :goto_1
    move v0, v9

    .line 2008
    goto/16 :goto_0

    .restart local v2       #eventX:I
    .restart local v3       #eventY:I
    :cond_5
    move-object v0, p0

    move v5, v4

    .line 2000
    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    goto :goto_1

    .line 2002
    :cond_6
    const/4 v0, 0x3

    if-ne v6, v0, :cond_4

    .line 2003
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    const/4 v5, 0x7

    if-eq v0, v5, :cond_4

    move-object v0, p0

    move v5, v4

    .line 2004
    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    goto :goto_1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .parameter "event"

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x1

    .line 1004
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 1007
    .local v0, action:I
    iget-boolean v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchDropped:Z

    .line 1008
    .local v2, shouldDropTouch:Z
    packed-switch v0, :pswitch_data_0

    .line 1023
    :cond_0
    :goto_0
    :pswitch_0
    if-eqz v2, :cond_2

    .line 1070
    :cond_1
    :goto_1
    return v3

    .line 1011
    :pswitch_1
    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    if-ltz v4, :cond_0

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    const/4 v5, 0x7

    if-ge v4, v5, :cond_0

    .line 1012
    const-string v4, "MediatekGlowPadView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "onTouchEvent return directly mDragViewState="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragViewState:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1013
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchDropped:Z

    .line 1014
    const/4 v2, 0x1

    goto :goto_0

    .line 1020
    :pswitch_2
    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchDropped:Z

    goto :goto_0

    .line 1027
    :cond_2
    const/4 v1, 0x0

    .line 1028
    .local v1, handled:Z
    packed-switch v0, :pswitch_data_1

    .line 1069
    :cond_3
    :goto_2
    :pswitch_3
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->invalidate()V

    .line 1070
    if-nez v1, :cond_1

    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    goto :goto_1

    .line 1031
    :pswitch_4
    const-string v4, "MediatekGlowPadView"

    const-string v5, "*** DOWN ***"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1032
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleDown(Landroid/view/MotionEvent;)V

    .line 1033
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleMove(Landroid/view/MotionEvent;)V

    .line 1034
    const/4 v1, 0x1

    .line 1035
    goto :goto_2

    .line 1038
    :pswitch_5
    const-string v4, "MediatekGlowPadView"

    const-string v5, "*** MOVE ***"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1039
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleMove(Landroid/view/MotionEvent;)V

    .line 1040
    const/4 v1, 0x1

    .line 1041
    goto :goto_2

    .line 1045
    :pswitch_6
    const-string v4, "MediatekGlowPadView"

    const-string v5, "*** UP ***"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1047
    iput-boolean v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActionCancel:Z

    .line 1048
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleMove(Landroid/view/MotionEvent;)V

    .line 1049
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleUp(Landroid/view/MotionEvent;)V

    .line 1050
    const/4 v1, 0x1

    .line 1051
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    if-eqz v4, :cond_3

    .line 1052
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showAllNewEventViews()V

    goto :goto_2

    .line 1057
    :pswitch_7
    const-string v4, "MediatekGlowPadView"

    const-string v5, "*** CANCEL ***"

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1059
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mActionCancel:Z

    .line 1060
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleMove(Landroid/view/MotionEvent;)V

    .line 1061
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->handleCancel(Landroid/view/MotionEvent;)V

    .line 1062
    const/4 v1, 0x1

    .line 1063
    iget-object v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    if-eqz v4, :cond_3

    .line 1064
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->showAllNewEventViews()V

    goto :goto_2

    .line 1008
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 1028
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_6
        :pswitch_5
        :pswitch_7
        :pswitch_3
        :pswitch_4
        :pswitch_6
    .end packed-switch
.end method

.method public ping()V
    .locals 0

    .prologue
    .line 917
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->pingInternal()V

    .line 918
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->doShakeAnimation()V

    .line 919
    return-void
.end method

.method public pingInternal()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 922
    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFeedbackCount:I

    if-lez v4, :cond_1

    .line 923
    const/4 v0, 0x1

    .line 924
    .local v0, doWaveAnimation:Z
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    .line 927
    .local v3, waveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;
    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->size()I

    move-result v4

    if-lez v4, :cond_0

    invoke-virtual {v3, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/keyguard/Tweener;

    iget-object v4, v4, Lcom/android/internal/policy/impl/keyguard/Tweener;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 928
    invoke-virtual {v3, v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/policy/impl/keyguard/Tweener;

    iget-object v4, v4, Lcom/android/internal/policy/impl/keyguard/Tweener;->animator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->getCurrentPlayTime()J

    move-result-wide v1

    .line 929
    .local v1, t:J
    const-wide/16 v4, 0x2a3

    cmp-long v4, v1, v4

    if-gez v4, :cond_0

    .line 930
    const/4 v0, 0x0

    .line 934
    .end local v1           #t:J
    :cond_0
    if-eqz v0, :cond_1

    .line 935
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->startWaveAnimation()V

    .line 938
    .end local v0           #doWaveAnimation:Z
    .end local v3           #waveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;
    :cond_1
    return-void
.end method

.method public replaceTargetDrawablesIfPresent(Landroid/content/ComponentName;Ljava/lang/String;I)Z
    .locals 10
    .parameter "component"
    .parameter "name"
    .parameter "existingResId"

    .prologue
    .line 1641
    if-nez p3, :cond_1

    const/4 v5, 0x0

    .line 1669
    :cond_0
    :goto_0
    return v5

    .line 1643
    :cond_1
    const/4 v5, 0x0

    .line 1644
    .local v5, replaced:Z
    if-eqz p1, :cond_2

    .line 1646
    :try_start_0
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 1648
    .local v4, packageManager:Landroid/content/pm/PackageManager;
    const/16 v7, 0x80

    invoke-virtual {v4, p1, v7}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v7

    iget-object v2, v7, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 1650
    .local v2, metaData:Landroid/os/Bundle;
    if-eqz v2, :cond_2

    .line 1651
    invoke-virtual {v2, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 1652
    .local v1, iconResId:I
    if-eqz v1, :cond_2

    .line 1653
    invoke-virtual {v4, p1}, Landroid/content/pm/PackageManager;->getResourcesForActivity(Landroid/content/ComponentName;)Landroid/content/res/Resources;

    move-result-object v6

    .line 1654
    .local v6, res:Landroid/content/res/Resources;
    invoke-direct {p0, v6, p3, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->replaceTargetDrawables(Landroid/content/res/Resources;II)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v5

    .line 1665
    .end local v1           #iconResId:I
    .end local v2           #metaData:Landroid/os/Bundle;
    .end local v4           #packageManager:Landroid/content/pm/PackageManager;
    .end local v6           #res:Landroid/content/res/Resources;
    :cond_2
    :goto_1
    if-nez v5, :cond_0

    .line 1667
    iget-object v7, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-direct {p0, v7, p3, p3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->replaceTargetDrawables(Landroid/content/res/Resources;II)Z

    goto :goto_0

    .line 1657
    :catch_0
    move-exception v0

    .line 1658
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v7, "MediatekGlowPadView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to swap drawable; "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " not found"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 1660
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_1
    move-exception v3

    .line 1661
    .local v3, nfe:Landroid/content/res/Resources$NotFoundException;
    const-string v7, "MediatekGlowPadView"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to swap drawable from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1
.end method

.method public reset(Z)V
    .locals 6
    .parameter "animate"

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 971
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 972
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 974
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->stopAndHideWaveAnimation()V

    .line 975
    invoke-direct {p0, p1, v2}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->hideTargets(ZZ)V

    .line 979
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterX:F

    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveCenterY:F

    invoke-direct {p0, v2, v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchToState(IFF)V

    .line 981
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 982
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mFakeHandleAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->stop()V

    .line 983
    const/4 v1, 0x7

    move-object v0, p0

    move v3, v2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->switchDragViewToState(IIIFF)V

    .line 985
    invoke-static {}, Lcom/android/internal/policy/impl/keyguard/Tweener;->reset()V

    .line 986
    return-void
.end method

.method public resumeAnimations()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 499
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 500
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 501
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 502
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 503
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 504
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->start()V

    .line 505
    return-void
.end method

.method public setDirectionDescriptionsResourceId(I)V
    .locals 1
    .parameter "resourceId"

    .prologue
    .line 884
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptionsResourceId:I

    .line 885
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 886
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDirectionDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 888
    :cond_0
    return-void
.end method

.method public setEnableTarget(IZ)V
    .locals 3
    .parameter "resourceId"
    .parameter "enabled"

    .prologue
    .line 1583
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 1584
    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDrawables:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    .line 1585
    .local v1, target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    invoke-virtual {v1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->getResourceId()I

    move-result v2

    if-ne v2, p1, :cond_1

    .line 1586
    invoke-virtual {v1, p2}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setEnabled(Z)V

    .line 1590
    .end local v1           #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_0
    return-void

    .line 1583
    .restart local v1       #target:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setHandleDrawableImage(I)V
    .locals 2
    .parameter "id"

    .prologue
    .line 832
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 833
    .local v0, res:Landroid/content/res/Resources;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    if-eqz v1, :cond_0

    .line 834
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mHandleDrawable:Lcom/android/internal/policy/impl/keyguard/TargetDrawable;

    invoke-virtual {v1, v0, p1}, Lcom/android/internal/policy/impl/keyguard/TargetDrawable;->setDrawable(Landroid/content/res/Resources;I)V

    .line 836
    :cond_0
    return-void
.end method

.method public setLockScreenView(Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;)V
    .locals 0
    .parameter "lockScreenLayout"

    .prologue
    .line 1785
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    .line 1786
    return-void
.end method

.method public setOnTriggerListener(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 1494
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mOnTriggerListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$OnTriggerListener;

    .line 1495
    return-void
.end method

.method public setTargetDescriptionsResourceId(I)V
    .locals 1
    .parameter "resourceId"

    .prologue
    .line 863
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptionsResourceId:I

    .line 864
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 865
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetDescriptions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 867
    :cond_0
    return-void
.end method

.method public setTargetResources(I)V
    .locals 1
    .parameter "resourceId"

    .prologue
    .line 845
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mAnimatingTargets:Z

    if-eqz v0, :cond_0

    .line 847
    iput p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mNewTargetResources:I

    .line 851
    :goto_0
    return-void

    .line 849
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->internalSetTargetResources(I)V

    goto :goto_0
.end method

.method public setTouchRecepient(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 1683
    if-eqz p1, :cond_0

    .line 1684
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    .line 1685
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlobalLayoutListenr(Z)V

    .line 1686
    invoke-direct {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->refreshPositions()V

    .line 1691
    :goto_0
    return-void

    .line 1688
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchRecepient:Landroid/view/View;

    .line 1689
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->updateGlobalLayoutListenr(Z)V

    goto :goto_0
.end method

.method public setVibrateEnabled(Z)V
    .locals 2
    .parameter "enabled"

    .prologue
    .line 905
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_0

    .line 906
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrator:Landroid/os/Vibrator;

    .line 910
    :goto_0
    return-void

    .line 908
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mVibrator:Landroid/os/Vibrator;

    goto :goto_0
.end method

.method public suspendAnimations()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 493
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mWaveAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 494
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTargetAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 495
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGlowAnimations:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$AnimationBundle;->setSuspended(Z)V

    .line 496
    return-void
.end method

.method public syncUnReadEventView(Lcom/android/internal/policy/impl/keyguard/UnReadEventView;)V
    .locals 7
    .parameter "unReadEventView"

    .prologue
    const/4 v6, 0x0

    .line 1789
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    .line 1790
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mUnReadEventView:Lcom/android/internal/policy/impl/keyguard/UnReadEventView;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/UnReadEventView;->getNewEventViewList()Ljava/util/ArrayList;

    move-result-object v2

    .line 1791
    .local v2, newEventViews:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;>;"
    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-gtz v3, :cond_1

    .line 1792
    :cond_0
    const-string v3, "MediatekGlowPadView"

    const-string v4, "syncUnReadEventView get empty newEventViews"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1806
    :goto_0
    return-void

    .line 1795
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 1796
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 1797
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v3, p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1796
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1799
    :cond_2
    new-instance v3, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;-><init>(Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$1;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSimpleOnGestureListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;

    .line 1800
    new-instance v3, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mSimpleOnGestureListener:Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView$SimpleOnGestureListener;

    invoke-direct {v3, v4, v5}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 1801
    iget-object v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v6}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 1803
    const/high16 v3, 0x4040

    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    iget v4, v4, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlop:I

    .line 1804
    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlop:I

    iget v4, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlop:I

    mul-int/2addr v3, v4

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mTouchSlopSqure:I

    .line 1805
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventBitmapWidth()I

    move-result v3

    int-to-float v4, v3

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/keyguard/LockScreenNewEventView;->getNewEventBitmapHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {p0, v4, v3}, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->dist2(FF)F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v3, v3

    iput v3, p0, Lcom/android/internal/policy/impl/keyguard/MediatekGlowPadView;->mDragSnapMargin:F

    goto :goto_0
.end method
