.class Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->beginDragging(Landroid/view/View;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)V
    .locals 0
    .parameter

    .prologue
    .line 992
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 996
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragController()Lcom/cyanogenmod/trebuchet/DragController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/DragController;->isDragging()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 998
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/Launcher;->dismissAllAppsCling(Landroid/view/View;)V

    .line 1001
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->resetDrawableState()V

    .line 1004
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$4;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/Launcher;->enterSpringLoadedDragMode()V

    .line 1006
    :cond_0
    return-void
.end method
