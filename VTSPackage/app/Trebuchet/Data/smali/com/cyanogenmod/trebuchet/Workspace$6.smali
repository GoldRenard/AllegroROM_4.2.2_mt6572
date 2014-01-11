.class Lcom/cyanogenmod/trebuchet/Workspace$6;
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

.field final synthetic val$addResizeFrame:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 3015
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 3017
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Workspace;->isPageMoving()Z

    move-result v0

    if-nez v0, :cond_0

    .line 3018
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 3022
    :goto_0
    return-void

    .line 3020
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$6;->val$addResizeFrame:Ljava/lang/Runnable;

    #setter for: Lcom/cyanogenmod/trebuchet/Workspace;->mDelayedResizeRunnable:Ljava/lang/Runnable;
    invoke-static {v0, v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$502(Lcom/cyanogenmod/trebuchet/Workspace;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_0
.end method
