.class public Lcom/android/systemui/SearchPanelView;
.super Landroid/widget/FrameLayout;
.source "SearchPanelView.java"

# interfaces
.implements Lcom/android/systemui/statusbar/tablet/StatusBarPanel;
.implements Landroid/app/ActivityOptions$OnAnimationStartedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;
    }
.end annotation


# static fields
.field private static final ASSIST_ICON_METADATA_NAME:Ljava/lang/String; = "com.android.systemui.action_assist_icon"

.field static final DEBUG:Z = false

.field private static final SEARCH_PANEL_HOLD_DURATION:I = 0x0

.field static final TAG:Ljava/lang/String; = "SearchPanelView"


# instance fields
.field private mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

.field private final mContext:Landroid/content/Context;

.field private mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

.field final mGlowPadViewListener:Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;

.field private final mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private mSearchTargetsContainer:Landroid/view/View;

.field private mShowing:Z

.field private mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

.field private mWm:Landroid/view/IWindowManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 70
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/SearchPanelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 74
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 154
    new-instance v0, Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;

    invoke-direct {v0, p0}, Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;-><init>(Lcom/android/systemui/SearchPanelView;)V

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadViewListener:Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;

    .line 209
    new-instance v0, Lcom/android/systemui/SearchPanelView$2;

    invoke-direct {v0, p0}, Lcom/android/systemui/SearchPanelView$2;-><init>(Lcom/android/systemui/SearchPanelView;)V

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 75
    iput-object p1, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    .line 76
    const-string v0, "window"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mWm:Landroid/view/IWindowManager;

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/SearchPanelView;)Lcom/android/systemui/statusbar/BaseStatusBar;
    .registers 2
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/systemui/SearchPanelView;)Lcom/android/internal/widget/multiwaveview/GlowPadView;
    .registers 2
    .parameter "x0"

    .prologue
    .line 53
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/systemui/SearchPanelView;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/android/systemui/SearchPanelView;->startAssistActivity()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/systemui/SearchPanelView;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/android/systemui/SearchPanelView;->vibrate()V

    return-void
.end method

.method private createLayoutTransitioner()Landroid/animation/LayoutTransition;
    .registers 5

    .prologue
    .line 308
    new-instance v0, Landroid/animation/LayoutTransition;

    invoke-direct {v0}, Landroid/animation/LayoutTransition;-><init>()V

    .line 309
    .local v0, transitioner:Landroid/animation/LayoutTransition;
    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setDuration(J)V

    .line 310
    const/4 v1, 0x1

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/animation/LayoutTransition;->setStartDelay(IJ)V

    .line 311
    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/animation/LayoutTransition;->setAnimator(ILandroid/animation/Animator;)V

    .line 312
    return-object v0
.end method

.method private maybeSwapSearchIcon()V
    .registers 6

    .prologue
    .line 178
    iget-object v2, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const-string v3, "search"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/SearchManager;

    iget-object v3, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const/4 v4, -0x2

    invoke-virtual {v2, v3, v4}, Landroid/app/SearchManager;->getAssistIntent(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object v1

    .line 180
    .local v1, intent:Landroid/content/Intent;
    if-eqz v1, :cond_26

    .line 181
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    .line 182
    .local v0, component:Landroid/content/ComponentName;
    if-eqz v0, :cond_26

    iget-object v2, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    const-string v3, "com.android.systemui.action_assist_icon"

    const v4, 0x1080294

    invoke-virtual {v2, v0, v3, v4}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->replaceTargetDrawablesIfPresent(Landroid/content/ComponentName;Ljava/lang/String;I)Z

    move-result v2

    if-nez v2, :cond_26

    .line 188
    .end local v0           #component:Landroid/content/ComponentName;
    :cond_26
    return-void
.end method

.method private pointInside(IILandroid/view/View;)Z
    .registers 9
    .parameter "x"
    .parameter "y"
    .parameter "v"

    .prologue
    .line 191
    invoke-virtual {p3}, Landroid/view/View;->getLeft()I

    move-result v1

    .line 192
    .local v1, l:I
    invoke-virtual {p3}, Landroid/view/View;->getRight()I

    move-result v2

    .line 193
    .local v2, r:I
    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result v3

    .line 194
    .local v3, t:I
    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 195
    .local v0, b:I
    if-lt p1, v1, :cond_1a

    if-ge p1, v2, :cond_1a

    if-lt p2, v3, :cond_1a

    if-ge p2, v0, :cond_1a

    const/4 v4, 0x1

    :goto_19
    return v4

    :cond_1a
    const/4 v4, 0x0

    goto :goto_19
.end method

.method private startAssistActivity()V
    .registers 9

    .prologue
    const/4 v6, -0x2

    .line 80
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v4}, Lcom/android/systemui/statusbar/BaseStatusBar;->isDeviceProvisioned()Z

    move-result v4

    if-nez v4, :cond_a

    .line 123
    :cond_9
    :goto_9
    return-void

    .line 83
    :cond_a
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    .line 84
    const/4 v2, 0x0

    .line 86
    .local v2, isKeyguardShowing:Z
    :try_start_11
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mWm:Landroid/view/IWindowManager;

    invoke-interface {v4}, Landroid/view/IWindowManager;->isKeyguardLocked()Z
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_11 .. :try_end_16} :catch_85

    move-result v2

    .line 91
    :goto_17
    if-eqz v2, :cond_22

    .line 94
    :try_start_19
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mWm:Landroid/view/IWindowManager;

    invoke-interface {v4}, Landroid/view/IWindowManager;->showAssistant()V
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_19 .. :try_end_1e} :catch_83

    .line 98
    :goto_1e
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->onAnimationStarted()V

    goto :goto_9

    .line 101
    :cond_22
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const-string v5, "search"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/SearchManager;

    iget-object v5, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v5, v6}, Landroid/app/SearchManager;->getAssistIntent(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object v1

    .line 103
    .local v1, intent:Landroid/content/Intent;
    if-eqz v1, :cond_9

    .line 106
    :try_start_34
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v4

    invoke-interface {v4}, Landroid/app/IActivityManager;->dismissKeyguardOnNextActivity()V
    :try_end_3b
    .catch Landroid/os/RemoteException; {:try_start_34 .. :try_end_3b} :catch_81

    .line 112
    :goto_3b
    :try_start_3b
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const v5, 0x7f050010

    const v6, 0x7f050011

    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getHandler()Landroid/os/Handler;

    move-result-object v7

    invoke-static {v4, v5, v6, v7, p0}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;IILandroid/os/Handler;Landroid/app/ActivityOptions$OnAnimationStartedListener;)Landroid/app/ActivityOptions;

    move-result-object v3

    .line 115
    .local v3, opts:Landroid/app/ActivityOptions;
    const/high16 v4, 0x1000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 116
    iget-object v4, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    new-instance v6, Landroid/os/UserHandle;

    const/4 v7, -0x2

    invoke-direct {v6, v7}, Landroid/os/UserHandle;-><init>(I)V

    invoke-virtual {v4, v1, v5, v6}, Landroid/content/Context;->startActivityAsUser(Landroid/content/Intent;Landroid/os/Bundle;Landroid/os/UserHandle;)V
    :try_end_5f
    .catch Landroid/content/ActivityNotFoundException; {:try_start_3b .. :try_end_5f} :catch_60

    goto :goto_9

    .line 118
    .end local v3           #opts:Landroid/app/ActivityOptions;
    :catch_60
    move-exception v0

    .line 119
    .local v0, e:Landroid/content/ActivityNotFoundException;
    const-string v4, "SearchPanelView"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Activity not found for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->onAnimationStarted()V

    goto :goto_9

    .line 107
    .end local v0           #e:Landroid/content/ActivityNotFoundException;
    :catch_81
    move-exception v4

    goto :goto_3b

    .line 95
    .end local v1           #intent:Landroid/content/Intent;
    :catch_83
    move-exception v4

    goto :goto_1e

    .line 87
    :catch_85
    move-exception v4

    goto :goto_17
.end method

.method private vibrate()V
    .registers 8

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 219
    .local v0, context:Landroid/content/Context;
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "haptic_feedback_enabled"

    const/4 v5, 0x1

    const/4 v6, -0x2

    invoke-static {v3, v4, v5, v6}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    if-eqz v3, :cond_29

    .line 221
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 222
    .local v1, res:Landroid/content/res/Resources;
    const-string v3, "vibrator"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    .line 223
    .local v2, vibrator:Landroid/os/Vibrator;
    const v3, 0x7f0c0003

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Landroid/os/Vibrator;->vibrate(J)V

    .line 225
    .end local v1           #res:Landroid/content/res/Resources;
    .end local v2           #vibrator:Landroid/os/Vibrator;
    :cond_29
    return-void
.end method


# virtual methods
.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .parameter "event"

    .prologue
    .line 276
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v0, v2

    .line 277
    .local v0, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v1, v2

    .line 278
    .local v1, y:I
    if-ltz v0, :cond_1f

    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getWidth()I

    move-result v2

    if-ge v0, v2, :cond_1f

    if-ltz v1, :cond_1f

    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getHeight()I

    move-result v2

    if-ge v1, v2, :cond_1f

    .line 279
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 281
    :goto_1e
    return v2

    :cond_1f
    const/4 v2, 0x1

    goto :goto_1e
.end method

.method public hide(Z)V
    .registers 4
    .parameter "animate"

    .prologue
    .line 253
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    if-eqz v0, :cond_b

    .line 255
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/BaseStatusBar;->animateCollapsePanels(I)V

    .line 259
    :goto_a
    return-void

    .line 257
    :cond_b
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/android/systemui/SearchPanelView;->setVisibility(I)V

    goto :goto_a
.end method

.method public isAssistantAvailable()Z
    .registers 4

    .prologue
    .line 316
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const-string v1, "search"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/SearchManager;

    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const/4 v2, -0x2

    invoke-virtual {v0, v1, v2}, Landroid/app/SearchManager;->getAssistIntent(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_15

    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public isInContentArea(II)Z
    .registers 5
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v0, 0x1

    .line 199
    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mSearchTargetsContainer:Landroid/view/View;

    invoke-direct {p0, p1, p2, v1}, Lcom/android/systemui/SearchPanelView;->pointInside(IILandroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 205
    :cond_9
    :goto_9
    return v0

    .line 201
    :cond_a
    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

    if-eqz v1, :cond_16

    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

    invoke-direct {p0, p1, p2, v1}, Lcom/android/systemui/SearchPanelView;->pointInside(IILandroid/view/View;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 205
    :cond_16
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 289
    iget-boolean v0, p0, Lcom/android/systemui/SearchPanelView;->mShowing:Z

    return v0
.end method

.method public onAnimationStarted()V
    .registers 4

    .prologue
    .line 158
    new-instance v0, Lcom/android/systemui/SearchPanelView$1;

    invoke-direct {v0, p0}, Lcom/android/systemui/SearchPanelView$1;-><init>(Lcom/android/systemui/SearchPanelView;)V

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/systemui/SearchPanelView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 164
    return-void
.end method

.method protected onFinishInflate()V
    .registers 3

    .prologue
    .line 168
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 169
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mContext:Landroid/content/Context;

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 170
    const v0, 0x7f0800c4

    invoke-virtual {p0, v0}, Lcom/android/systemui/SearchPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mSearchTargetsContainer:Landroid/view/View;

    .line 171
    const v0, 0x7f0800fe

    invoke-virtual {p0, v0}, Lcom/android/systemui/SearchPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/recent/StatusBarTouchProxy;

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

    .line 173
    const v0, 0x7f0800c6

    invoke-virtual {p0, v0}, Lcom/android/systemui/SearchPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iput-object v0, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    .line 174
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadViewListener:Lcom/android/systemui/SearchPanelView$GlowPadTriggerListener;

    invoke-virtual {v0, v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->setOnTriggerListener(Lcom/android/internal/widget/multiwaveview/GlowPadView$OnTriggerListener;)V

    .line 175
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 6
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 267
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 269
    return-void
.end method

.method public setBar(Lcom/android/systemui/statusbar/BaseStatusBar;)V
    .registers 2
    .parameter "bar"

    .prologue
    .line 293
    iput-object p1, p0, Lcom/android/systemui/SearchPanelView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    .line 294
    return-void
.end method

.method public setStatusBarView(Landroid/view/View;)V
    .registers 3
    .parameter "statusBarView"

    .prologue
    .line 297
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

    if-eqz v0, :cond_9

    .line 298
    iget-object v0, p0, Lcom/android/systemui/SearchPanelView;->mStatusBarTouchProxy:Lcom/android/systemui/recent/StatusBarTouchProxy;

    invoke-virtual {v0, p1}, Lcom/android/systemui/recent/StatusBarTouchProxy;->setStatusBar(Landroid/view/View;)V

    .line 305
    :cond_9
    return-void
.end method

.method public show(ZZ)V
    .registers 7
    .parameter "show"
    .parameter "animate"

    .prologue
    const/4 v3, 0x1

    .line 228
    if-nez p1, :cond_10

    .line 229
    if-eqz p2, :cond_41

    invoke-direct {p0}, Lcom/android/systemui/SearchPanelView;->createLayoutTransitioner()Landroid/animation/LayoutTransition;

    move-result-object v0

    .line 230
    .local v0, transitioner:Landroid/animation/LayoutTransition;
    :goto_9
    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mSearchTargetsContainer:Landroid/view/View;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 232
    .end local v0           #transitioner:Landroid/animation/LayoutTransition;
    :cond_10
    iput-boolean p1, p0, Lcom/android/systemui/SearchPanelView;->mShowing:Z

    .line 233
    if-eqz p1, :cond_43

    .line 234
    invoke-direct {p0}, Lcom/android/systemui/SearchPanelView;->maybeSwapSearchIcon()V

    .line 235
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_37

    .line 236
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/systemui/SearchPanelView;->setVisibility(I)V

    .line 239
    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->suspendAnimations()V

    .line 240
    iget-object v1, p0, Lcom/android/systemui/SearchPanelView;->mGlowPadView:Lcom/android/internal/widget/multiwaveview/GlowPadView;

    invoke-virtual {v1}, Lcom/android/internal/widget/multiwaveview/GlowPadView;->ping()V

    .line 241
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Lcom/android/systemui/SearchPanelView;->mPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 242
    invoke-direct {p0}, Lcom/android/systemui/SearchPanelView;->vibrate()V

    .line 244
    :cond_37
    invoke-virtual {p0, v3}, Lcom/android/systemui/SearchPanelView;->setFocusable(Z)V

    .line 245
    invoke-virtual {p0, v3}, Lcom/android/systemui/SearchPanelView;->setFocusableInTouchMode(Z)V

    .line 246
    invoke-virtual {p0}, Lcom/android/systemui/SearchPanelView;->requestFocus()Z

    .line 250
    :goto_40
    return-void

    .line 229
    :cond_41
    const/4 v0, 0x0

    goto :goto_9

    .line 248
    :cond_43
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Lcom/android/systemui/SearchPanelView;->setVisibility(I)V

    goto :goto_40
.end method
