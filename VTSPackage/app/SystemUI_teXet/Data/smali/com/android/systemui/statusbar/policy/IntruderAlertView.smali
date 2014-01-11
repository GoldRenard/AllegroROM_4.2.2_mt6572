.class public Lcom/android/systemui/statusbar/policy/IntruderAlertView;
.super Landroid/widget/LinearLayout;
.source "IntruderAlertView.java"

# interfaces
.implements Lcom/android/systemui/SwipeHelper$Callback;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "IntruderAlertView"


# instance fields
.field mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

.field private mContentHolder:Landroid/view/ViewGroup;

.field private mIntruderRemoteViews:Landroid/widget/RemoteViews;

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mSwipeHelper:Lcom/android/systemui/SwipeHelper;

.field mTmpRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 61
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mTmpRect:Landroid/graphics/Rect;

    .line 67
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->setOrientation(I)V

    .line 68
    return-void
.end method


# virtual methods
.method public applyIntruderContent(Landroid/widget/RemoteViews;Landroid/view/View$OnClickListener;)V
    .registers 10
    .parameter "intruderView"
    .parameter "listener"

    .prologue
    const v5, 0x7f020113

    const/4 v6, 0x0

    .line 151
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mIntruderRemoteViews:Landroid/widget/RemoteViews;

    .line 152
    iput-object p2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mOnClickListener:Landroid/view/View$OnClickListener;

    .line 153
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    if-nez v2, :cond_d

    .line 175
    :goto_c
    return-void

    .line 157
    :cond_d
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setX(F)V

    .line 158
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    invoke-virtual {v2, v6}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 159
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    const/high16 v3, 0x3f80

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 160
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 161
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    invoke-virtual {p1, v2, v3}, Landroid/widget/RemoteViews;->apply(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 162
    .local v1, content:Landroid/view/View;
    if-eqz p2, :cond_51

    .line 163
    invoke-virtual {v1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 166
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 167
    .local v0, bg:Landroid/graphics/drawable/Drawable;
    if-nez v0, :cond_57

    .line 168
    const-string v2, "IntruderAlertView"

    const-string v3, "Can\'t find background drawable id=0x%08x"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    .end local v0           #bg:Landroid/graphics/drawable/Drawable;
    :cond_51
    :goto_51
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_c

    .line 170
    .restart local v0       #bg:Landroid/graphics/drawable/Drawable;
    :cond_57
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_51
.end method

.method public canChildBeDismissed(Landroid/view/View;)Z
    .registers 3
    .parameter "v"

    .prologue
    .line 101
    const/4 v0, 0x1

    return v0
.end method

.method public getChildAtPosition(Landroid/view/MotionEvent;)Landroid/view/View;
    .registers 3
    .parameter "ev"

    .prologue
    .line 117
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getChildContentView(Landroid/view/View;)Landroid/view/View;
    .registers 2
    .parameter "v"

    .prologue
    .line 121
    return-object p1
.end method

.method public onAttachedToWindow()V
    .registers 5

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 73
    .local v0, densityScale:F
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v2

    int-to-float v1, v2

    .line 74
    .local v1, pagingTouchSlop:F
    new-instance v2, Lcom/android/systemui/SwipeHelper;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0, v0, v1}, Lcom/android/systemui/SwipeHelper;-><init>(ILcom/android/systemui/SwipeHelper$Callback;FF)V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    .line 76
    const v2, 0x7f080063

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    .line 77
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mIntruderRemoteViews:Landroid/widget/RemoteViews;

    if-eqz v2, :cond_35

    .line 79
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mIntruderRemoteViews:Landroid/widget/RemoteViews;

    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p0, v2, v3}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->applyIntruderContent(Landroid/widget/RemoteViews;Landroid/view/View$OnClickListener;)V

    .line 81
    :cond_35
    return-void
.end method

.method public onBeginDrag(Landroid/view/View;)V
    .registers 2
    .parameter "v"

    .prologue
    .line 110
    return-void
.end method

.method public onChildDismissed(Landroid/view/View;)V
    .registers 4
    .parameter "v"

    .prologue
    .line 105
    const-string v0, "IntruderAlertView"

    const-string v1, "User swiped intruder to dismiss"

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/BaseStatusBar;->dismissIntruder()V

    .line 107
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 5
    .parameter "newConfig"

    .prologue
    .line 126
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 127
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 128
    .local v0, densityScale:F
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v2, v0}, Lcom/android/systemui/SwipeHelper;->setDensityScale(F)V

    .line 129
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v2

    int-to-float v1, v2

    .line 130
    .local v1, pagingTouchSlop:F
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v2, v1}, Lcom/android/systemui/SwipeHelper;->setPagingTouchSlop(F)V

    .line 131
    return-void
.end method

.method public onDragCancelled(Landroid/view/View;)V
    .registers 4
    .parameter "v"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mContentHolder:Landroid/view/ViewGroup;

    const/high16 v1, 0x3f80

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 114
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 2
    .parameter "c"

    .prologue
    .line 135
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 145
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 90
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0, p1}, Lcom/android/systemui/SwipeHelper;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0, p1}, Lcom/android/systemui/SwipeHelper;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_10

    :cond_e
    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public setBar(Lcom/android/systemui/statusbar/BaseStatusBar;)V
    .registers 2
    .parameter "bar"

    .prologue
    .line 84
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/IntruderAlertView;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    .line 85
    return-void
.end method
