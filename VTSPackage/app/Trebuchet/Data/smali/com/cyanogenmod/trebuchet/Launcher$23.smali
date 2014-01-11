.class Lcom/cyanogenmod/trebuchet/Launcher$23;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragModeDelayed(ZZLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/Launcher;

.field final synthetic val$onCompleteRunnable:Ljava/lang/Runnable;

.field final synthetic val$successfulDrop:Z


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Launcher;ZLjava/lang/Runnable;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3140
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    iput-boolean p2, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->val$successfulDrop:Z

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 3143
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->val$successfulDrop:Z

    if-eqz v0, :cond_0

    .line 3147
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    #getter for: Lcom/cyanogenmod/trebuchet/Launcher;->mAppsCustomizeTabHost:Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->access$1400(Lcom/cyanogenmod/trebuchet/Launcher;)Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeTabHost;->setVisibility(I)V

    .line 3148
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->val$onCompleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/Launcher;->showWorkspace(ZLjava/lang/Runnable;)V

    .line 3152
    :goto_0
    return-void

    .line 3150
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/Launcher$23;->this$0:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->exitSpringLoadedDragMode()V

    goto :goto_0
.end method
