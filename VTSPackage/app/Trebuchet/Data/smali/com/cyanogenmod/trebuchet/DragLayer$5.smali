.class Lcom/cyanogenmod/trebuchet/DragLayer$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "DragLayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DragLayer;->fadeOutDragView()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragLayer;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragLayer;)V
    .locals 0
    .parameter

    .prologue
    .line 656
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .parameter "animation"

    .prologue
    .line 658
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    #getter for: Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->access$000(Lcom/cyanogenmod/trebuchet/DragLayer;)Lcom/cyanogenmod/trebuchet/DragView;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 659
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    #getter for: Lcom/cyanogenmod/trebuchet/DragLayer;->mDragController:Lcom/cyanogenmod/trebuchet/DragController;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->access$400(Lcom/cyanogenmod/trebuchet/DragLayer;)Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    #getter for: Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->access$000(Lcom/cyanogenmod/trebuchet/DragLayer;)Lcom/cyanogenmod/trebuchet/DragView;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->onDeferredEndDrag(Lcom/cyanogenmod/trebuchet/DragView;)V

    .line 661
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    const/4 v1, 0x0

    #setter for: Lcom/cyanogenmod/trebuchet/DragLayer;->mDropView:Lcom/cyanogenmod/trebuchet/DragView;
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DragLayer;->access$002(Lcom/cyanogenmod/trebuchet/DragLayer;Lcom/cyanogenmod/trebuchet/DragView;)Lcom/cyanogenmod/trebuchet/DragView;

    .line 662
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragLayer$5;->this$0:Lcom/cyanogenmod/trebuchet/DragLayer;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->invalidate()V

    .line 663
    return-void
.end method
