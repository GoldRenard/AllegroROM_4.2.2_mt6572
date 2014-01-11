.class Lcom/android/launcher2/DragLayer$4;
.super Ljava/lang/Object;
.source "DragLayer.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/DragLayer;->fadeOutDragView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/DragLayer;


# direct methods
.method constructor <init>(Lcom/android/launcher2/DragLayer;)V
    .locals 0
    .parameter

    .prologue
    .line 714
    iput-object p1, p0, Lcom/android/launcher2/DragLayer$4;->this$0:Lcom/android/launcher2/DragLayer;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3
    .parameter "animation"

    .prologue
    .line 716
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 718
    .local v1, percent:F
    const/high16 v2, 0x3f80

    sub-float v0, v2, v1

    .line 719
    .local v0, alpha:F
    iget-object v2, p0, Lcom/android/launcher2/DragLayer$4;->this$0:Lcom/android/launcher2/DragLayer;

    #getter for: Lcom/android/launcher2/DragLayer;->mDropView:Lcom/android/launcher2/DragView;
    invoke-static {v2}, Lcom/android/launcher2/DragLayer;->access$000(Lcom/android/launcher2/DragLayer;)Lcom/android/launcher2/DragView;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/launcher2/DragView;->setAlpha(F)V

    .line 720
    return-void
.end method
