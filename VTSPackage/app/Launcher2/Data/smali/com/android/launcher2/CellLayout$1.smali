.class Lcom/android/launcher2/CellLayout$1;
.super Ljava/lang/Object;
.source "CellLayout.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/CellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/CellLayout;

.field final synthetic val$anim:Lcom/android/launcher2/InterruptibleInOutAnimator;

.field final synthetic val$thisIndex:I


# direct methods
.method constructor <init>(Lcom/android/launcher2/CellLayout;Lcom/android/launcher2/InterruptibleInOutAnimator;I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 246
    iput-object p1, p0, Lcom/android/launcher2/CellLayout$1;->this$0:Lcom/android/launcher2/CellLayout;

    iput-object p2, p0, Lcom/android/launcher2/CellLayout$1;->val$anim:Lcom/android/launcher2/InterruptibleInOutAnimator;

    iput p3, p0, Lcom/android/launcher2/CellLayout$1;->val$thisIndex:I

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5
    .parameter "animation"

    .prologue
    .line 248
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$1;->val$anim:Lcom/android/launcher2/InterruptibleInOutAnimator;

    invoke-virtual {v2}, Lcom/android/launcher2/InterruptibleInOutAnimator;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    .line 252
    .local v1, outline:Landroid/graphics/Bitmap;
    if-nez v1, :cond_0

    .line 254
    const/4 v0, 0x0

    .line 261
    .local v0, debug:Z
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 266
    .end local v0           #debug:Z
    :goto_0
    return-void

    .line 263
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$1;->this$0:Lcom/android/launcher2/CellLayout;

    #getter for: Lcom/android/launcher2/CellLayout;->mDragOutlineAlphas:[F
    invoke-static {v2}, Lcom/android/launcher2/CellLayout;->access$000(Lcom/android/launcher2/CellLayout;)[F

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/CellLayout$1;->val$thisIndex:I

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v3, v4

    .line 264
    iget-object v2, p0, Lcom/android/launcher2/CellLayout$1;->this$0:Lcom/android/launcher2/CellLayout;

    iget-object v3, p0, Lcom/android/launcher2/CellLayout$1;->this$0:Lcom/android/launcher2/CellLayout;

    #getter for: Lcom/android/launcher2/CellLayout;->mDragOutlines:[Landroid/graphics/Rect;
    invoke-static {v3}, Lcom/android/launcher2/CellLayout;->access$100(Lcom/android/launcher2/CellLayout;)[Landroid/graphics/Rect;

    move-result-object v3

    iget v4, p0, Lcom/android/launcher2/CellLayout$1;->val$thisIndex:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Lcom/android/launcher2/CellLayout;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0
.end method
