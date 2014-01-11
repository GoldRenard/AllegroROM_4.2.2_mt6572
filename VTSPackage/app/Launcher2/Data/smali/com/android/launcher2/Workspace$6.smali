.class Lcom/android/launcher2/Workspace$6;
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

.field final synthetic val$addResizeFrame:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 2454
    iput-object p1, p0, Lcom/android/launcher2/Workspace$6;->this$0:Lcom/android/launcher2/Workspace;

    iput-object p2, p0, Lcom/android/launcher2/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2456
    iget-object v0, p0, Lcom/android/launcher2/Workspace$6;->this$0:Lcom/android/launcher2/Workspace;

    invoke-virtual {v0}, Lcom/android/launcher2/Workspace;->isPageMoving()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2457
    iget-object v0, p0, Lcom/android/launcher2/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 2461
    :goto_0
    return-void

    .line 2459
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/Workspace$6;->this$0:Lcom/android/launcher2/Workspace;

    iget-object v1, p0, Lcom/android/launcher2/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    #setter for: Lcom/android/launcher2/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;
    invoke-static {v0, v1}, Lcom/android/launcher2/Workspace;->access$502(Lcom/android/launcher2/Workspace;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_0
.end method
