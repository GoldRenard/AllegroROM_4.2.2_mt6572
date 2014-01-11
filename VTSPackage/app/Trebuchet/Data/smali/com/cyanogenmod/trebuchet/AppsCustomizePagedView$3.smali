.class Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->preloadWidget(Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

.field final synthetic val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

.field final synthetic val$pInfo:Landroid/appwidget/AppWidgetProviderInfo;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Landroid/appwidget/AppWidgetProviderInfo;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 804
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$pInfo:Landroid/appwidget/AppWidgetProviderInfo;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 807
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget v3, v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    if-eq v3, v8, :cond_0

    .line 826
    :goto_0
    return-void

    .line 810
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$pInfo:Landroid/appwidget/AppWidgetProviderInfo;

    invoke-virtual {v3, v4, v5, v6}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->createView(Landroid/content/Context;ILandroid/appwidget/AppWidgetProviderInfo;)Landroid/appwidget/AppWidgetHostView;

    move-result-object v0

    .line 812
    .local v0, hostView:Landroid/appwidget/AppWidgetHostView;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iput-object v0, v3, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->boundWidget:Landroid/appwidget/AppWidgetHostView;

    .line 813
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    const/4 v4, 0x2

    iput v4, v3, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 814
    const/4 v3, 0x4

    invoke-virtual {v0, v3}, Landroid/appwidget/AppWidgetHostView;->setVisibility(I)V

    .line 815
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v3

    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v4, v4, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->spanX:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget v5, v5, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->spanY:I

    invoke-virtual {v3, v4, v5, v7}, Lcom/cyanogenmod/trebuchet/Workspace;->estimateItemSize(IIZ)[I

    move-result-object v2

    .line 820
    .local v2, unScaledSize:[I
    new-instance v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;

    aget v3, v2, v7

    aget v4, v2, v8

    invoke-direct {v1, v3, v4}, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;-><init>(II)V

    .line 822
    .local v1, lp:Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;
    iput v7, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->y:I

    iput v7, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->x:I

    .line 823
    iput-boolean v8, v1, Lcom/cyanogenmod/trebuchet/DragLayer$LayoutParams;->customPosition:Z

    .line 824
    invoke-virtual {v0, v1}, Landroid/appwidget/AppWidgetHostView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 825
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$3;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v3

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getDragLayer()Lcom/cyanogenmod/trebuchet/DragLayer;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/DragLayer;->addView(Landroid/view/View;)V

    goto :goto_0
.end method
