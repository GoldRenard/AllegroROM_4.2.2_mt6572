.class Lcom/cyanogenmod/trebuchet/Workspace$5;
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

.field final synthetic val$cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

.field final synthetic val$hostView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/Workspace;Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 3009
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->val$hostView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->val$cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 3011
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->this$0:Lcom/cyanogenmod/trebuchet/Workspace;

    #getter for: Lcom/cyanogenmod/trebuchet/Workspace;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->access$000(Lcom/cyanogenmod/trebuchet/Workspace;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v0

    .line 3012
    .local v0, dragLayer:Lcom/cyanogenmod/trebuchet/DragLayer;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->val$hostView:Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Workspace$5;->val$cellLayout:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-virtual {v0, v1, v2}, Lcom/cyanogenmod/trebuchet/DragLayer;->addResizeFrame(Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;Lcom/cyanogenmod/trebuchet/CellLayout;)V

    .line 3013
    return-void
.end method
