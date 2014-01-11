.class Lcom/android/launcher2/DragView$2;
.super Ljava/lang/Object;
.source "DragView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/DragView;->crossFade(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/DragView;


# direct methods
.method constructor <init>(Lcom/android/launcher2/DragView;)V
    .locals 0
    .parameter

    .prologue
    .line 216
    iput-object p1, p0, Lcom/android/launcher2/DragView$2;->this$0:Lcom/android/launcher2/DragView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 219
    iget-object v0, p0, Lcom/android/launcher2/DragView$2;->this$0:Lcom/android/launcher2/DragView;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    move-result v1

    #setter for: Lcom/android/launcher2/DragView;->mCrossFadeProgress:F
    invoke-static {v0, v1}, Lcom/android/launcher2/DragView;->access$302(Lcom/android/launcher2/DragView;F)F

    .line 220
    return-void
.end method
