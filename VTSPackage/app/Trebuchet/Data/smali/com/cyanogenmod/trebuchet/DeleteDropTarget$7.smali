.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->onFlingToDelete(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;IILandroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

.field final synthetic val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

.field final synthetic val$isAllApps:Z


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;ZLcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 492
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iput-boolean p2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->val$isAllApps:Z

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 495
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->onDragEnd()V

    .line 499
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->val$isAllApps:Z

    if-nez v0, :cond_0

    .line 500
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragMode()V

    .line 501
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    #calls: Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->completeDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->access$100(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 503
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragController()Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$7;->val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/DragController;->onDeferredEndFling(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 504
    return-void
.end method
