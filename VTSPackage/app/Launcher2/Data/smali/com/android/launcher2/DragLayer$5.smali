.class Lcom/android/launcher2/DragLayer$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DragLayer.java"


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
    .line 722
    iput-object p1, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 724
    iget-object v0, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    #getter for: Lcom/android/launcher2/DragLayer;->mDropView:Lcom/android/launcher2/DragView;
    invoke-static {v0}, Lcom/android/launcher2/DragLayer;->access$000(Lcom/android/launcher2/DragLayer;)Lcom/android/launcher2/DragView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 725
    iget-object v0, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    #getter for: Lcom/android/launcher2/DragLayer;->mDragController:Lcom/android/launcher2/DragController;
    invoke-static {v0}, Lcom/android/launcher2/DragLayer;->access$400(Lcom/android/launcher2/DragLayer;)Lcom/android/launcher2/DragController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    #getter for: Lcom/android/launcher2/DragLayer;->mDropView:Lcom/android/launcher2/DragView;
    invoke-static {v1}, Lcom/android/launcher2/DragLayer;->access$000(Lcom/android/launcher2/DragLayer;)Lcom/android/launcher2/DragView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->onDeferredEndDrag(Lcom/android/launcher2/DragView;)V

    .line 727
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    const/4 v1, 0x0

    #setter for: Lcom/android/launcher2/DragLayer;->mDropView:Lcom/android/launcher2/DragView;
    invoke-static {v0, v1}, Lcom/android/launcher2/DragLayer;->access$002(Lcom/android/launcher2/DragLayer;Lcom/android/launcher2/DragView;)Lcom/android/launcher2/DragView;

    .line 728
    iget-object v0, p0, Lcom/android/launcher2/DragLayer$5;->this$0:Lcom/android/launcher2/DragLayer;

    invoke-virtual {v0}, Lcom/android/launcher2/DragLayer;->invalidate()V

    .line 729
    return-void
.end method
