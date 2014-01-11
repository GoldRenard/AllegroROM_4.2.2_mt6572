.class Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;
.super Ljava/lang/Object;
.source "NotificationPanel.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/tablet/NotificationPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Choreographer"
.end annotation


# static fields
.field static final CLOSE_DURATION:I = 0xfa

.field static final OPEN_DURATION:I = 0xfa


# instance fields
.field final HYPERSPACE_OFFRAMP:I

.field mContentAnim:Landroid/animation/AnimatorSet;

.field mPanelHeight:I

.field mVisible:Z

.field final synthetic this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/tablet/NotificationPanel;)V
    .registers 3
    .parameter

    .prologue
    .line 346
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 344
    const/16 v0, 0xc8

    iput v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->HYPERSPACE_OFFRAMP:I

    .line 347
    return-void
.end method


# virtual methods
.method createAnimation(Z)V
    .registers 12
    .parameter "appearing"

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/high16 v6, 0x4348

    .line 356
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v5, v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mContentParent:Landroid/view/ViewGroup;

    invoke-virtual {v5}, Landroid/view/ViewGroup;->getTranslationY()F

    move-result v4

    .line 357
    .local v4, y:F
    if-eqz p1, :cond_7e

    .line 360
    const/4 v0, 0x0

    .line 361
    .local v0, end:F
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget v5, v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mNotificationCount:I

    if-nez v5, :cond_1a

    .line 362
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget v5, v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mContentFrameMissingTranslation:F

    add-float/2addr v0, v5

    .line 364
    :cond_1a
    add-float v3, v6, v0

    .line 370
    .local v3, start:F
    :goto_1c
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v5, v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mContentParent:Landroid/view/ViewGroup;

    const-string v6, "translationY"

    const/4 v7, 0x2

    new-array v7, v7, [F

    aput v3, v7, v9

    aput v0, v7, v8

    invoke-static {v5, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    .line 372
    .local v2, posAnim:Landroid/animation/Animator;
    if-eqz p1, :cond_82

    sget-object v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->sDecelerateInterpolator:Landroid/view/animation/Interpolator;

    :goto_31
    invoke-virtual {v2, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 374
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    if-eqz v5, :cond_45

    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v5

    if-eqz v5, :cond_45

    .line 375
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    invoke-virtual {v5}, Landroid/animation/AnimatorSet;->cancel()V

    .line 378
    :cond_45
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v6, v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mContentParent:Landroid/view/ViewGroup;

    const-string v7, "alpha"

    new-array v8, v8, [F

    if-eqz p1, :cond_85

    const/high16 v5, 0x3f80

    :goto_51
    aput v5, v8, v9

    invoke-static {v6, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    .line 380
    .local v1, fadeAnim:Landroid/animation/Animator;
    if-eqz p1, :cond_87

    sget-object v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->sAccelerateInterpolator:Landroid/view/animation/Interpolator;

    :goto_5b
    invoke-virtual {v1, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 382
    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    .line 383
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 387
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    if-eqz p1, :cond_72

    :cond_72
    const/16 v6, 0xfa

    int-to-long v6, v6

    invoke-virtual {v5, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 388
    iget-object v5, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    invoke-virtual {v5, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 389
    return-void

    .line 366
    .end local v0           #end:F
    .end local v1           #fadeAnim:Landroid/animation/Animator;
    .end local v2           #posAnim:Landroid/animation/Animator;
    .end local v3           #start:F
    :cond_7e
    move v3, v4

    .line 367
    .restart local v3       #start:F
    add-float v0, v4, v6

    .restart local v0       #end:F
    goto :goto_1c

    .line 372
    .restart local v2       #posAnim:Landroid/animation/Animator;
    :cond_82
    sget-object v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->sAccelerateInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_31

    .line 378
    :cond_85
    const/4 v5, 0x0

    goto :goto_51

    .line 380
    .restart local v1       #fadeAnim:Landroid/animation/Animator;
    :cond_87
    sget-object v5, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->sDecelerateInterpolator:Landroid/view/animation/Interpolator;

    goto :goto_5b
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    .line 405
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .registers 5
    .parameter "animation"

    .prologue
    const/4 v2, 0x0

    .line 409
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mVisible:Z

    if-nez v0, :cond_c

    .line 410
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->setVisibility(I)V

    .line 412
    :cond_c
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    iget-object v0, v0, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->mContentParent:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    .line 413
    iput-object v2, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    .line 416
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mVisible:Z

    if-eqz v0, :cond_1f

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->updateClearButton()V

    .line 417
    :cond_1f
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    .line 420
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .registers 2
    .parameter "animation"

    .prologue
    .line 423
    return-void
.end method

.method startAnimation(Z)V
    .registers 3
    .parameter "appearing"

    .prologue
    .line 394
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->createAnimation(Z)V

    .line 395
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mContentAnim:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 397
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mVisible:Z

    .line 400
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->mVisible:Z

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPanel$Choreographer;->this$0:Lcom/android/systemui/statusbar/tablet/NotificationPanel;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/NotificationPanel;->updateClearButton()V

    .line 401
    :cond_13
    return-void
.end method
