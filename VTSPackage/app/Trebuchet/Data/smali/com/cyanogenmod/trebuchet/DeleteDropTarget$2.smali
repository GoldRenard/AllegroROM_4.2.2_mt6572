.class Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;
.super Ljava/lang/Object;
.source "DeleteDropTarget.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->animateToTrashAndCompleteDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

.field final synthetic val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 268
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 271
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mSearchDropTargetBar:Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/SearchDropTargetBar;->onDragEnd()V

    .line 272
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragMode()V

    .line 273
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->this$0:Lcom/cyanogenmod/trebuchet/DeleteDropTarget;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DeleteDropTarget$2;->val$d:Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;

    #calls: Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->completeDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/DeleteDropTarget;->access$100(Lcom/cyanogenmod/trebuchet/DeleteDropTarget;Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 274
    return-void
.end method
