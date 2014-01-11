.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FlingAlongVectorAnimatorUpdateListener"
.end annotation


# instance fields
.field private final mAlphaInterpolator:Landroid/animation/TimeInterpolator;

.field private mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

.field private mFriction:F

.field private mFrom:Landroid/graphics/Rect;

.field private mHasOffsetForScale:Z

.field private mPrevTime:J

.field private mVelocity:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/DragLayer;Landroid/graphics/PointF;Landroid/graphics/Rect;JF)V
    .locals 2
    .parameter "dragLayer"
    .parameter "vel"
    .parameter "from"
    .parameter "startTime"
    .parameter "friction"

    .prologue
    .line 398
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 395
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    const/high16 v1, 0x3f40

    invoke-direct {v0, v1}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mAlphaInterpolator:Landroid/animation/TimeInterpolator;

    .line 399
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    .line 400
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mVelocity:Landroid/graphics/PointF;

    .line 401
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    .line 402
    iput-wide p4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mPrevTime:J

    .line 403
    const/high16 v0, 0x3f80

    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/DragLayer;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, p6

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFriction:F

    .line 404
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 14
    .parameter "animation"

    .prologue
    const/high16 v13, 0x447a

    const/high16 v9, 0x4000

    const/high16 v12, 0x3f80

    .line 408
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mDragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/DragView;

    .line 409
    .local v2, dragView:Lcom/cyanogenmod/trebuchet/DragView;
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 410
    .local v4, t:F
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    .line 412
    .local v0, curTime:J
    iget-boolean v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mHasOffsetForScale:Z

    if-nez v7, :cond_0

    .line 413
    const/4 v7, 0x1

    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mHasOffsetForScale:Z

    .line 414
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getScaleX()F

    move-result v3

    .line 415
    .local v3, scale:F
    sub-float v7, v3, v12

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    div-float v5, v7, v9

    .line 416
    .local v5, xOffset:F
    sub-float v7, v3, v12

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v7, v8

    div-float v6, v7, v9

    .line 418
    .local v6, yOffset:F
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v8, v7, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    add-float/2addr v8, v5

    float-to-int v8, v8

    iput v8, v7, Landroid/graphics/Rect;->left:I

    .line 419
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v8, v7, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    add-float/2addr v8, v6

    float-to-int v8, v8

    iput v8, v7, Landroid/graphics/Rect;->top:I

    .line 422
    .end local v3           #scale:F
    .end local v5           #xOffset:F
    .end local v6           #yOffset:F
    :cond_0
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v8, v7, Landroid/graphics/Rect;->left:I

    int-to-float v8, v8

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mVelocity:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    iget-wide v10, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mPrevTime:J

    sub-long v10, v0, v10

    long-to-float v10, v10

    mul-float/2addr v9, v10

    div-float/2addr v9, v13

    add-float/2addr v8, v9

    float-to-int v8, v8

    iput v8, v7, Landroid/graphics/Rect;->left:I

    .line 423
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v8, v7, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mVelocity:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    iget-wide v10, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mPrevTime:J

    sub-long v10, v0, v10

    long-to-float v10, v10

    mul-float/2addr v9, v10

    div-float/2addr v9, v13

    add-float/2addr v8, v9

    float-to-int v8, v8

    iput v8, v7, Landroid/graphics/Rect;->top:I

    .line 425
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    invoke-virtual {v2, v7}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationX(F)V

    .line 426
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFrom:Landroid/graphics/Rect;

    iget v7, v7, Landroid/graphics/Rect;->top:I

    int-to-float v7, v7

    invoke-virtual {v2, v7}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationY(F)V

    .line 427
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mAlphaInterpolator:Landroid/animation/TimeInterpolator;

    invoke-interface {v7, v4}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v7

    sub-float v7, v12, v7

    invoke-virtual {v2, v7}, Lcom/cyanogenmod/trebuchet/DragView;->setAlpha(F)V

    .line 429
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mVelocity:Landroid/graphics/PointF;

    iget v8, v7, Landroid/graphics/PointF;->x:F

    iget v9, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFriction:F

    mul-float/2addr v8, v9

    iput v8, v7, Landroid/graphics/PointF;->x:F

    .line 430
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mVelocity:Landroid/graphics/PointF;

    iget v8, v7, Landroid/graphics/PointF;->y:F

    iget v9, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mFriction:F

    mul-float/2addr v8, v9

    iput v8, v7, Landroid/graphics/PointF;->y:F

    .line 431
    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$FlingAlongVectorAnimatorUpdateListener;->mPrevTime:J

    .line 432
    return-void
.end method
