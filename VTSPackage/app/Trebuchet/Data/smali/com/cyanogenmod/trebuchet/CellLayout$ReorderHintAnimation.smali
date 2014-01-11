.class Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
.super Ljava/lang/Object;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReorderHintAnimation"
.end annotation


# static fields
.field private static final DURATION:I = 0x12c


# instance fields
.field a:Landroid/animation/Animator;

.field child:Landroid/view/View;

.field finalDeltaX:F

.field finalDeltaY:F

.field finalScale:F

.field initDeltaX:F

.field initDeltaY:F

.field initScale:F

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/View;IIIIII)V
    .locals 15
    .parameter
    .parameter "child"
    .parameter "cellX0"
    .parameter "cellY0"
    .parameter "cellX1"
    .parameter "cellY1"
    .parameter "spanX"
    .parameter "spanY"

    .prologue
    .line 2294
    move-object/from16 v0, p1

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2295
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v6

    move-object/from16 v1, p1

    move/from16 v2, p3

    move/from16 v3, p4

    move/from16 v4, p7

    move/from16 v5, p8

    invoke-virtual/range {v1 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 2296
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v11, v1, v2

    .line 2297
    .local v11, x0:I
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v13, v1, v2

    .line 2298
    .local v13, y0:I
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v6

    move-object/from16 v1, p1

    move/from16 v2, p5

    move/from16 v3, p6

    move/from16 v4, p7

    move/from16 v5, p8

    invoke-virtual/range {v1 .. v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->regionToCenterPoint(IIII[I)V

    .line 2299
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v12, v1, v2

    .line 2300
    .local v12, x1:I
    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mTmpPoint:[I
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$500(Lcom/cyanogenmod/trebuchet/CellLayout;)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v14, v1, v2

    .line 2301
    .local v14, y1:I
    sub-int v9, v12, v11

    .line 2302
    .local v9, dX:I
    sub-int v10, v14, v13

    .line 2303
    .local v10, dY:I
    const/4 v1, 0x0

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaX:F

    .line 2304
    const/4 v1, 0x0

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaY:F

    .line 2305
    if-ne v9, v10, :cond_0

    if-nez v9, :cond_0

    .line 2319
    :goto_0
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTranslationX()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initDeltaX:F

    .line 2320
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTranslationY()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initDeltaY:F

    .line 2321
    invoke-virtual/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v1

    const/high16 v2, 0x4080

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    sub-float/2addr v1, v2

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalScale:F

    .line 2322
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getScaleX()F

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->initScale:F

    .line 2323
    move-object/from16 v0, p2

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    .line 2324
    return-void

    .line 2307
    :cond_0
    if-nez v10, :cond_1

    .line 2308
    int-to-float v1, v9

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$600(Lcom/cyanogenmod/trebuchet/CellLayout;)F

    move-result v2

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaX:F

    goto :goto_0

    .line 2309
    :cond_1
    if-nez v9, :cond_2

    .line 2310
    int-to-float v1, v10

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$600(Lcom/cyanogenmod/trebuchet/CellLayout;)F

    move-result v2

    mul-float/2addr v1, v2

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaY:F

    goto :goto_0

    .line 2312
    :cond_2
    int-to-float v1, v10

    int-to-float v2, v9

    div-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->atan(D)D

    move-result-wide v7

    .line 2313
    .local v7, angle:D
    int-to-float v1, v9

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    float-to-double v1, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v3

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$600(Lcom/cyanogenmod/trebuchet/CellLayout;)F

    move-result v5

    float-to-double v5, v5

    mul-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    int-to-float v1, v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaX:F

    .line 2315
    int-to-float v1, v10

    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    float-to-double v1, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mReorderHintAnimationMagnitude:F
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$600(Lcom/cyanogenmod/trebuchet/CellLayout;)F

    move-result v5

    float-to-double v5, v5

    mul-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(D)D

    move-result-wide v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    int-to-float v1, v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaY:F

    goto/16 :goto_0
.end method

.method static synthetic access$800(Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 2282
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->completeAnimationImmediately()V

    return-void
.end method

.method private cancel()V
    .locals 1

    .prologue
    .line 2371
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    .line 2372
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 2374
    :cond_0
    return-void
.end method

.method private completeAnimationImmediately()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 2377
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    if-eqz v1, :cond_0

    .line 2378
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    invoke-virtual {v1}, Landroid/animation/Animator;->cancel()V

    .line 2381
    :cond_0
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->createAnimatorSet()Landroid/animation/AnimatorSet;

    move-result-object v0

    .line 2382
    .local v0, s:Landroid/animation/AnimatorSet;
    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    .line 2383
    const/4 v1, 0x4

    new-array v1, v1, [Landroid/animation/Animator;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    const-string v3, "scaleX"

    new-array v4, v7, [F

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v5

    aput v5, v4, v6

    invoke-static {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v6

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    const-string v3, "scaleY"

    new-array v4, v7, [F

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/CellLayout;->getChildrenScale()F

    move-result v5

    aput v5, v4, v6

    invoke-static {v2, v3, v4}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v2

    aput-object v2, v1, v7

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    const-string v4, "translationX"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v3, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    const-string v4, "translationY"

    new-array v5, v7, [F

    aput v8, v5, v6

    invoke-static {v3, v4, v5}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 2389
    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 2390
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v2, 0x3fc0

    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 2391
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 2392
    return-void
.end method


# virtual methods
.method animate()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 2327
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$700(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2328
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$700(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;

    .line 2329
    .local v0, oldAnimation:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->cancel()V

    .line 2330
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$700(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2331
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaX:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaY:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_1

    .line 2332
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->completeAnimationImmediately()V

    .line 2368
    .end local v0           #oldAnimation:Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;
    :cond_0
    :goto_0
    return-void

    .line 2336
    :cond_1
    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaX:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_2

    iget v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->finalDeltaY:F

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_0

    .line 2339
    :cond_2
    new-array v2, v5, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    .line 2340
    .local v1, va:Landroid/animation/ValueAnimator;
    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->a:Landroid/animation/Animator;

    .line 2341
    invoke-virtual {v1, v5}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 2342
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 2343
    const-wide/16 v2, 0x12c

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 2344
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v2

    const-wide/high16 v4, 0x404e

    mul-double/2addr v2, v4

    double-to-int v2, v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 2345
    new-instance v2, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$1;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$1;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 2358
    new-instance v2, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;

    invoke-direct {v2, p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation$2;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 2366
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mShakeAnimators:Ljava/util/HashMap;
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$700(Lcom/cyanogenmod/trebuchet/CellLayout;)Ljava/util/HashMap;

    move-result-object v2

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ReorderHintAnimation;->child:Landroid/view/View;

    invoke-virtual {v2, v3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2367
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    .line 2339
    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x80t 0x3ft
    .end array-data
.end method
