.class Lcom/android/launcher2/DeleteDropTarget$6;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/DeleteDropTarget;->onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/DeleteDropTarget;

.field final synthetic val$d:Lcom/android/launcher2/DropTarget$DragObject;

.field final synthetic val$isAllApps:Z


# direct methods
.method constructor <init>(Lcom/android/launcher2/DeleteDropTarget;ZLcom/android/launcher2/DropTarget$DragObject;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 436
    iput-object p1, p0, Lcom/android/launcher2/DeleteDropTarget$6;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iput-boolean p2, p0, Lcom/android/launcher2/DeleteDropTarget$6;->val$isAllApps:Z

    iput-object p3, p0, Lcom/android/launcher2/DeleteDropTarget$6;->val$d:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 439
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget$6;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iget-object v0, v0, Lcom/android/launcher2/ButtonDropTarget;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    invoke-virtual {v0}, Lcom/android/launcher2/SearchDropTargetBar;->onDragEnd()V

    .line 443
    iget-boolean v0, p0, Lcom/android/launcher2/DeleteDropTarget$6;->val$isAllApps:Z

    if-nez v0, :cond_0

    .line 444
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget$6;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iget-object v0, v0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->exitSpringLoadedDragMode()V

    .line 445
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget$6;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iget-object v1, p0, Lcom/android/launcher2/DeleteDropTarget$6;->val$d:Lcom/android/launcher2/DropTarget$DragObject;

    #calls: Lcom/android/launcher2/DeleteDropTarget;->completeDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    invoke-static {v0, v1}, Lcom/android/launcher2/DeleteDropTarget;->access$000(Lcom/android/launcher2/DeleteDropTarget;Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/DeleteDropTarget$6;->this$0:Lcom/android/launcher2/DeleteDropTarget;

    iget-object v0, v0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragController()Lcom/android/launcher2/DragController;

    move-result-object v0

    iget-object v1, p0, Lcom/android/launcher2/DeleteDropTarget$6;->val$d:Lcom/android/launcher2/DropTarget$DragObject;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragController;->onDeferredEndFling(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 448
    return-void
.end method
