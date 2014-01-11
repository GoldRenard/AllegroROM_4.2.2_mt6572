.class public Lcom/android/systemui/statusbar/policy/NotificationRowLayout;
.super Landroid/widget/LinearLayout;
.source "NotificationRowLayout.java"

# interfaces
.implements Lcom/android/systemui/SwipeHelper$Callback;
.implements Lcom/android/systemui/ExpandHelper$Callback;


# static fields
.field private static final APPEAR_ANIM_LEN:I = 0xfa

.field private static final DEBUG:Z = false

.field private static final DISAPPEAR_ANIM_LEN:I = 0xfa

.field private static final SLOW_ANIMATIONS:Z = false

.field private static final TAG:Ljava/lang/String; = "NotificationRowLayout"


# instance fields
.field mAnimateBounds:Z

.field mAppearingViews:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field mDisappearingViews:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Landroid/animation/ValueAnimator;",
            ">;"
        }
    .end annotation
.end field

.field private mOnSizeChangedListener:Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;

.field private mRealLayoutTransition:Landroid/animation/LayoutTransition;

.field mRemoveViews:Z

.field private mSwipeHelper:Lcom/android/systemui/SwipeHelper;

.field mTmpRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 75
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v3, 0x1

    .line 78
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mAnimateBounds:Z

    .line 58
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mTmpRect:Landroid/graphics/Rect;

    .line 60
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mAppearingViews:Ljava/util/HashMap;

    .line 61
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mDisappearingViews:Ljava/util/HashMap;

    .line 69
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRemoveViews:Z

    .line 80
    new-instance v2, Landroid/animation/LayoutTransition;

    invoke-direct {v2}, Landroid/animation/LayoutTransition;-><init>()V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    .line 81
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v2, v3}, Landroid/animation/LayoutTransition;->setAnimateParentHierarchy(Z)V

    .line 82
    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->setLayoutTransitionsEnabled(Z)V

    .line 84
    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->setOrientation(I)V

    .line 101
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 102
    .local v0, densityScale:F
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v2

    int-to-float v1, v2

    .line 103
    .local v1, pagingTouchSlop:F
    new-instance v2, Lcom/android/systemui/SwipeHelper;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0, v0, v1}, Lcom/android/systemui/SwipeHelper;-><init>(ILcom/android/systemui/SwipeHelper$Callback;FF)V

    iput-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    .line 104
    return-void
.end method

.method private logLayoutTransition()V
    .locals 3

    .prologue
    .line 127
    const-string v1, "NotificationRowLayout"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "layout "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v0}, Landroid/animation/LayoutTransition;->isChangingLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "is "

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "in transition and animations "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v0}, Landroid/animation/LayoutTransition;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "are "

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "running."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    return-void

    .line 127
    :cond_0
    const-string v0, "is not "

    goto :goto_0

    :cond_1
    const-string v0, "are not "

    goto :goto_1
.end method


# virtual methods
.method public canChildBeDismissed(Landroid/view/View;)Z
    .locals 3
    .parameter "v"

    .prologue
    .line 153
    const v1, 0x7f0800b7

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 154
    .local v0, veto:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public canChildBeExpanded(Landroid/view/View;)Z
    .locals 1
    .parameter "v"

    .prologue
    .line 158
    invoke-static {p1}, Lcom/android/systemui/statusbar/NotificationData;->getIsExpandable(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method public dismissRowAnimated(Landroid/view/View;)V
    .locals 1
    .parameter "child"

    .prologue
    .line 251
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->dismissRowAnimated(Landroid/view/View;I)V

    .line 252
    return-void
.end method

.method public dismissRowAnimated(Landroid/view/View;I)V
    .locals 2
    .parameter "child"
    .parameter "vel"

    .prologue
    .line 255
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    int-to-float v1, p2

    invoke-virtual {v0, p1, v1}, Lcom/android/systemui/SwipeHelper;->dismissChild(Landroid/view/View;F)V

    .line 256
    return-void
.end method

.method public getChildAtPosition(FF)Landroid/view/View;
    .locals 6
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 198
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getChildCount()I

    move-result v1

    .line 199
    .local v1, count:I
    const/4 v3, 0x0

    .line 200
    .local v3, y:I
    const/4 v0, 0x0

    .line 202
    .local v0, childIdx:I
    :goto_0
    if-ge v0, v1, :cond_2

    .line 203
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 204
    .local v2, slidingChild:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_1

    .line 202
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    :cond_1
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v3, v4

    .line 208
    int-to-float v4, v3

    cmpg-float v4, p2, v4

    if-gez v4, :cond_0

    .line 210
    .end local v2           #slidingChild:Landroid/view/View;
    :goto_1
    return-object v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getChildAtPosition(Landroid/view/MotionEvent;)Landroid/view/View;
    .locals 2
    .parameter "ev"

    .prologue
    .line 187
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getChildAtPosition(FF)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildAtRawPosition(FF)Landroid/view/View;
    .locals 3
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 191
    const/4 v1, 0x2

    new-array v0, v1, [I

    .line 192
    .local v0, location:[I
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getLocationOnScreen([I)V

    .line 193
    const/4 v1, 0x0

    aget v1, v0, v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    int-to-float v2, v2

    sub-float v2, p2, v2

    invoke-virtual {p0, v1, v2}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getChildAtPosition(FF)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method public getChildContentView(Landroid/view/View;)Landroid/view/View;
    .locals 0
    .parameter "v"

    .prologue
    .line 214
    return-object p1
.end method

.method public onBeginDrag(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 180
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 181
    return-void
.end method

.method public onChildDismissed(Landroid/view/View;)V
    .locals 3
    .parameter "v"

    .prologue
    .line 171
    const v1, 0x7f0800b7

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 172
    .local v0, veto:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRemoveViews:Z

    if-eqz v1, :cond_0

    .line 173
    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    .line 175
    :cond_0
    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .parameter "newConfig"

    .prologue
    .line 219
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 220
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v0, v2, Landroid/util/DisplayMetrics;->density:F

    .line 221
    .local v0, densityScale:F
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v2, v0}, Lcom/android/systemui/SwipeHelper;->setDensityScale(F)V

    .line 222
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledPagingTouchSlop()I

    move-result v2

    int-to-float v1, v2

    .line 223
    .local v1, pagingTouchSlop:F
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v2, v1}, Lcom/android/systemui/SwipeHelper;->setPagingTouchSlop(F)V

    .line 224
    return-void
.end method

.method public onDragCancelled(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 184
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 266
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 277
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .prologue
    .line 260
    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    .line 262
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 139
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0, p1}, Lcom/android/systemui/SwipeHelper;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onSizeChanged(IIII)V
    .locals 6
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 281
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mOnSizeChangedListener:Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;

    if-eqz v0, :cond_0

    .line 282
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mOnSizeChangedListener:Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;->onSizeChanged(Landroid/view/View;IIII)V

    .line 284
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 148
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0, p1}, Lcom/android/systemui/SwipeHelper;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1
    .parameter "hasWindowFocus"

    .prologue
    .line 116
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onWindowFocusChanged(Z)V

    .line 117
    if-nez p1, :cond_0

    .line 118
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0}, Lcom/android/systemui/SwipeHelper;->removeLongPressCallback()V

    .line 120
    :cond_0
    return-void
.end method

.method public setAnimateBounds(Z)V
    .locals 0
    .parameter "anim"

    .prologue
    .line 123
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mAnimateBounds:Z

    .line 124
    return-void
.end method

.method public setLayoutTransitionsEnabled(Z)V
    .locals 1
    .parameter "b"

    .prologue
    .line 240
    if-eqz p1, :cond_0

    .line 241
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    .line 248
    :goto_0
    return-void

    .line 243
    :cond_0
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v0}, Landroid/animation/LayoutTransition;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 244
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRealLayoutTransition:Landroid/animation/LayoutTransition;

    invoke-virtual {v0}, Landroid/animation/LayoutTransition;->cancel()V

    .line 246
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    goto :goto_0
.end method

.method public setLongPressListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mSwipeHelper:Lcom/android/systemui/SwipeHelper;

    invoke-virtual {v0, p1}, Lcom/android/systemui/SwipeHelper;->setLongPressListener(Landroid/view/View$OnLongClickListener;)V

    .line 108
    return-void
.end method

.method public setOnSizeChangedListener(Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 111
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mOnSizeChangedListener:Lcom/android/systemui/statusbar/policy/OnSizeChangedListener;

    .line 112
    return-void
.end method

.method public setUserExpandedChild(Landroid/view/View;Z)Z
    .locals 1
    .parameter "v"
    .parameter "userExpanded"

    .prologue
    .line 162
    invoke-static {p1, p2}, Lcom/android/systemui/statusbar/NotificationData;->setUserExpanded(Landroid/view/View;Z)Z

    move-result v0

    return v0
.end method

.method public setUserLockedChild(Landroid/view/View;Z)Z
    .locals 1
    .parameter "v"
    .parameter "userLocked"

    .prologue
    .line 166
    invoke-static {p1, p2}, Lcom/android/systemui/statusbar/NotificationData;->setUserLocked(Landroid/view/View;Z)Z

    move-result v0

    return v0
.end method

.method public setViewRemoval(Z)V
    .locals 0
    .parameter "removeViews"

    .prologue
    .line 235
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/policy/NotificationRowLayout;->mRemoveViews:Z

    .line 236
    return-void
.end method
