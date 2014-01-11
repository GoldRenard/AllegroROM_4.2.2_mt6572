.class Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;
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

.field final synthetic val$options:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Landroid/os/Bundle;Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 783
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$options:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 786
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getAppWidgetHost()Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHost;->allocateAppWidgetId()I

    move-result v1

    iput v1, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    .line 789
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$options:Landroid/os/Bundle;

    if-nez v0, :cond_1

    .line 790
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    invoke-static {v0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    invoke-virtual {v0, v1, v2}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 792
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput v4, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    .line 800
    :cond_0
    :goto_0
    return-void

    .line 795
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$000(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/Launcher;

    move-result-object v0

    invoke-static {v0}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget v1, v1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetLoadingId:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$info:Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;

    iget-object v2, v2, Lcom/cyanogenmod/trebuchet/PendingAddWidgetInfo;->componentName:Landroid/content/ComponentName;

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->val$options:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2, v3}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;Landroid/os/Bundle;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 797
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$2;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput v4, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mWidgetCleanupState:I

    goto :goto_0
.end method
