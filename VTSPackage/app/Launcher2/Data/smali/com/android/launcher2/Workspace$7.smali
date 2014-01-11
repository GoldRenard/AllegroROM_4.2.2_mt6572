.class Lcom/android/launcher2/Workspace$7;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/Workspace;->onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/Workspace;

.field final synthetic val$finalResizeRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 2482
    iput-object p1, p0, Lcom/android/launcher2/Workspace$7;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2485
    iget-object v0, p0, Lcom/android/launcher2/Workspace$7;->this$0:Lcom/android/launcher2/Workspace;

    iput-boolean v1, v0, Lcom/android/launcher2/Workspace;->mAnimatingViewIntoPlace:Z

    .line 2486
    iget-object v0, p0, Lcom/android/launcher2/Workspace$7;->this$0:Lcom/android/launcher2/Workspace;

    #calls: Lcom/android/launcher2/Workspace;->updateChildrenLayersEnabled(Z)V
    invoke-static {v0, v1}, Lcom/android/launcher2/Workspace;->access$600(Lcom/android/launcher2/Workspace;Z)V

    .line 2487
    iget-object v0, p0, Lcom/android/launcher2/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 2488
    iget-object v0, p0, Lcom/android/launcher2/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 2490
    :cond_0
    return-void
.end method
