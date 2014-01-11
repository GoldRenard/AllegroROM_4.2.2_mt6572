.class Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;II)V
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
    .line 1345
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 2
    .parameter "task"
    .parameter "data"

    .prologue
    .line 1348
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1349
    invoke-virtual {p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1356
    :cond_0
    :goto_0
    return-void

    .line 1350
    :cond_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mJoinWidgetsApps:Z
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$200(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1351
    iget v0, p1, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->getPageCount()I

    move-result v1

    if-gt v0, v1, :cond_0

    .line 1352
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->pageContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$300(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 1355
    :cond_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$6;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    invoke-static {v0, p2}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    goto :goto_0
.end method
