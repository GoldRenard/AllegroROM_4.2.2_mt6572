.class Lcom/cyanogenmod/trebuchet/CellLayout$1;
.super Ljava/lang/Object;
.source "CellLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$anim:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

.field final synthetic val$thisIndex:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 245
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->val$anim:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    iput p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->val$thisIndex:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .parameter "animation"

    .prologue
    .line 247
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->val$anim:Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 251
    .local v1, outline:Landroid/graphics/Bitmap;
    if-nez v1, :cond_0

    .line 253
    const/4 v0, 0x0

    .line 260
    .local v0, debug:Z
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 265
    .end local v0           #debug:Z
    :goto_0
    return-void

    .line 262
    :cond_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlineAlphas:[F
    invoke-static {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$000(Lcom/cyanogenmod/trebuchet/CellLayout;)[F

    move-result-object v3

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->val$thisIndex:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v3, v4

    .line 263
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$100(Lcom/cyanogenmod/trebuchet/CellLayout;)[Landroid/graphics/Rect;

    move-result-object v3

    iget v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$1;->val$thisIndex:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0
.end method
