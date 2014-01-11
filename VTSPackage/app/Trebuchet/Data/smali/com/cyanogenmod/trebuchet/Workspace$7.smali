.class Lcom/cyanogenmod/trebuchet/Workspace$7;
.super Ljava/lang/Object;
.source "Workspace.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Workspace;->onDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Workspace;

.field final synthetic val$finalResizeRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 3042
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 3045
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/Workspace;->mAnimatingViewIntoPlace:Z

    .line 3046
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #calls: Lcom/cyanogenmod/trebuchet/Workspace;->updateChildrenLayersEnabled(Z)V
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$600(Lcom/cyanogenmod/trebuchet/Workspace;Z)V

    .line 3047
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 3048
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$7;->val$finalResizeRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3050
    :cond_0
    return-void
.end method
