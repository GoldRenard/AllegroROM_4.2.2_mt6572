.class Lcom/cyanogenmod/trebuchet/DragView$1;
.super Ljava/lang/Object;
.source "DragView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DragView;-><init>(Lcom/cyanogenmod/trebuchet/Launcher;Landroid/graphics/Bitmap;IIIIIIF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragView;

.field final synthetic val$initialScale:F

.field final synthetic val$offsetX:F

.field final synthetic val$offsetY:F

.field final synthetic val$scale:F


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragView;FFFF)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 85
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iput p2, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$offsetX:F

    iput p3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$offsetY:F

    iput p4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$initialScale:F

    iput p5, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$scale:F

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 8
    .parameter "animation"

    .prologue
    const/high16 v7, 0x3f80

    .line 88
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    .line 90
    .local v2, value:F
    iget v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$offsetX:F

    mul-float/2addr v3, v2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    #getter for: Lcom/cyanogenmod/trebuchet/DragView;->mOffsetX:F
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/DragView;->access$000(Lcom/cyanogenmod/trebuchet/DragView;)F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v0, v3

    .line 91
    .local v0, deltaX:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$offsetY:F

    mul-float/2addr v3, v2

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    #getter for: Lcom/cyanogenmod/trebuchet/DragView;->mOffsetY:F
    invoke-static {v4}, Lcom/cyanogenmod/trebuchet/DragView;->access$100(Lcom/cyanogenmod/trebuchet/DragView;)F

    move-result v4

    sub-float/2addr v3, v4

    float-to-int v1, v3

    .line 93
    .local v1, deltaY:I
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    int-to-float v4, v0

    invoke-static {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->access$016(Lcom/cyanogenmod/trebuchet/DragView;F)F

    .line 94
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    int-to-float v4, v1

    invoke-static {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->access$116(Lcom/cyanogenmod/trebuchet/DragView;F)F

    .line 95
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$initialScale:F

    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$scale:F

    iget v6, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$initialScale:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, v2

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleX(F)V

    .line 96
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$initialScale:F

    iget v5, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$scale:F

    iget v6, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->val$initialScale:F

    sub-float/2addr v5, v6

    mul-float/2addr v5, v2

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->setScaleY(F)V

    .line 97
    invoke-static {}, Lcom/cyanogenmod/trebuchet/DragView;->access$200()F

    move-result v3

    cmpl-float v3, v3, v7

    if-eqz v3, :cond_0

    .line 98
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-static {}, Lcom/cyanogenmod/trebuchet/DragView;->access$200()F

    move-result v4

    mul-float/2addr v4, v2

    sub-float v5, v7, v2

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->setAlpha(F)V

    .line 101
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/DragView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-nez v3, :cond_1

    .line 102
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 107
    :goto_0
    return-void

    .line 104
    :cond_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/DragView;->getTranslationX()F

    move-result v4

    int-to-float v5, v0

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationX(F)V

    .line 105
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/DragView$1;->this$0:Lcom/cyanogenmod/trebuchet/DragView;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/DragView;->getTranslationY()F

    move-result v4

    int-to-float v5, v1

    add-float/2addr v4, v5

    invoke-virtual {v3, v4}, Lcom/cyanogenmod/trebuchet/DragView;->setTranslationY(F)V

    goto :goto_0
.end method
