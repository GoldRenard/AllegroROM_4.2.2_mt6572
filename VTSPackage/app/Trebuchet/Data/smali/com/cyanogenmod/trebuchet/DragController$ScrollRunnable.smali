.class Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;
.super Ljava/lang/Object;
.source "DragController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/DragController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollRunnable"
.end annotation


# instance fields
.field private mDirection:I

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DragController;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DragController;)V
    .locals 0
    .parameter

    .prologue
    .line 779
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 780
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 783
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #getter for: Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragController;->access$000(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/DragScroller;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 784
    iget v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->mDirection:I

    if-nez v0, :cond_1

    .line 785
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #getter for: Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragController;->access$000(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/DragScroller;

    move-result-object v0

    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/DragScroller;->scrollLeft()V

    .line 789
    :goto_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #setter for: Lcom/cyanogenmod/trebuchet/DragController;->mScrollState:I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->access$102(Lcom/cyanogenmod/trebuchet/DragController;I)I

    .line 790
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #setter for: Lcom/cyanogenmod/trebuchet/DragController;->mDistanceSinceScroll:I
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->access$202(Lcom/cyanogenmod/trebuchet/DragController;I)I

    .line 791
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #getter for: Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragController;->access$000(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/DragScroller;

    move-result-object v0

    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/DragScroller;->onExitScrollArea()Z

    .line 792
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #getter for: Lcom/cyanogenmod/trebuchet/DragController;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragController;->access$300(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->onExitScrollArea()V

    .line 794
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->isDragging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 796
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->forceMoveEvent()V

    .line 799
    :cond_0
    return-void

    .line 787
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->this$0:Lcom/cyanogenmod/trebuchet/DragController;

    #getter for: Lcom/cyanogenmod/trebuchet/DragController;->mDragScroller:Lcom/cyanogenmod/trebuchet/DragScroller;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/DragController;->access$000(Lcom/cyanogenmod/trebuchet/DragController;)Lcom/cyanogenmod/trebuchet/DragScroller;

    move-result-object v0

    invoke-interface {v0}, Lcom/cyanogenmod/trebuchet/DragScroller;->scrollRight()V

    goto :goto_0
.end method

.method setDirection(I)V
    .locals 0
    .parameter "direction"

    .prologue
    .line 802
    iput p1, p0, Lcom/cyanogenmod/trebuchet/DragController$ScrollRunnable;->mDirection:I

    .line 803
    return-void
.end method
