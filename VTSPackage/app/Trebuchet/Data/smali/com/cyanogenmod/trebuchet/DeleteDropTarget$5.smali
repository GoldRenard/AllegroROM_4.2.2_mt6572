.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->createFlingToTrashAnimatorListener(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;Landroid/graphics/PointF;Landroid/view/ViewConfiguration;)Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

.field final synthetic val$dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

.field final synthetic val$scaleAlphaInterpolator:Landroid/animation/TimeInterpolator;

.field final synthetic val$x1:F

.field final synthetic val$x2:F

.field final synthetic val$x3:F

.field final synthetic val$y1:F

.field final synthetic val$y2:F

.field final synthetic val$y3:F


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DragLayer;Landroid/animation/TimeInterpolator;FFFFFF)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 357
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$scaleAlphaInterpolator:Landroid/animation/TimeInterpolator;

    iput p4, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x1:F

    iput p5, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x2:F

    iput p6, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x3:F

    iput p7, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y1:F

    iput p8, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y2:F

    iput p9, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y3:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 13
    .parameter "animation"

    .prologue
    .line 360
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v10}, Lcom/cyanogenmod/trebuchet/DragLayer;->getAnimatedView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/DragView;

    .line 361
    .local v0, dragView:Lcom/cyanogenmod/trebuchet/DragView;
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Float;

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F

    move-result v4

    .line 362
    .local v4, t:F
    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$scaleAlphaInterpolator:Landroid/animation/TimeInterpolator;

    invoke-interface {v10, v4}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result v5

    .line 363
    .local v5, tp:F
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->getInitialScale()F

    move-result v2

    .line 364
    .local v2, initialScale:F
    const/high16 v1, 0x3f00

    .line 365
    .local v1, finalAlpha:F
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->getScaleX()F

    move-result v3

    .line 366
    .local v3, scale:F
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v3

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredWidth()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v10, v11

    const/high16 v11, 0x4000

    div-float v7, v10, v11

    .line 367
    .local v7, x1o:F
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v3

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragView;->getMeasuredHeight()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v10, v11

    const/high16 v11, 0x4000

    div-float v9, v10, v11

    .line 368
    .local v9, y1o:F
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v4

    const/high16 v11, 0x3f80

    sub-float/2addr v11, v4

    mul-float/2addr v10, v11

    iget v11, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x1:F

    sub-float/2addr v11, v7

    mul-float/2addr v10, v11

    const/high16 v11, 0x4000

    const/high16 v12, 0x3f80

    sub-float/2addr v12, v4

    mul-float/2addr v11, v12

    mul-float/2addr v11, v4

    iget v12, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x2:F

    sub-float/2addr v12, v7

    mul-float/2addr v11, v12

    add-float/2addr v10, v11

    mul-float v11, v4, v4

    iget v12, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$x3:F

    mul-float/2addr v11, v12

    add-float v6, v10, v11

    .line 370
    .local v6, x:F
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v4

    const/high16 v11, 0x3f80

    sub-float/2addr v11, v4

    mul-float/2addr v10, v11

    iget v11, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y1:F

    sub-float/2addr v11, v9

    mul-float/2addr v10, v11

    const/high16 v11, 0x4000

    const/high16 v12, 0x3f80

    sub-float/2addr v12, v4

    mul-float/2addr v11, v12

    mul-float/2addr v11, v4

    iget v12, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y2:F

    sub-float/2addr v12, v7

    mul-float/2addr v11, v12

    add-float/2addr v10, v11

    mul-float v11, v4, v4

    iget v12, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$5;->val$y3:F

    mul-float/2addr v11, v12

    add-float v8, v10, v11

    .line 373
    .local v8, y:F
    invoke-virtual {v0, v6}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationX(F)V

    .line 374
    invoke-virtual {v0, v8}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationY(F)V

    .line 375
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v5

    mul-float/2addr v10, v2

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleX(F)V

    .line 376
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v5

    mul-float/2addr v10, v2

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleY(F)V

    .line 377
    const/high16 v10, 0x3f80

    sub-float/2addr v10, v1

    const/high16 v11, 0x3f80

    sub-float/2addr v11, v5

    mul-float/2addr v10, v11

    add-float/2addr v10, v1

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/DragView;->setAlpha(F)V

    .line 378
    return-void
.end method
