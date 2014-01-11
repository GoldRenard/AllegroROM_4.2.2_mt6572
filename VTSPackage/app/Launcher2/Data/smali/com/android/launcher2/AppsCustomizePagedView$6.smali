.class Lcom/android/launcher2/AppsCustomizePagedView$6;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Lcom/android/launcher2/AsyncTaskCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher2/AppsCustomizePagedView;->prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/AppsCustomizePagedView;


# direct methods
.method constructor <init>(Lcom/android/launcher2/AppsCustomizePagedView;)V
    .locals 0
    .parameter

    .prologue
    .line 1316
    iput-object p1, p0, Lcom/android/launcher2/AppsCustomizePagedView$6;->this$0:Lcom/android/launcher2/AppsCustomizePagedView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/android/launcher2/AppsCustomizeAsyncTask;Lcom/android/launcher2/AsyncTaskPageData;)V
    .locals 1
    .parameter "task"
    .parameter "data"

    .prologue
    .line 1319
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView$6;->this$0:Lcom/android/launcher2/AppsCustomizePagedView;

    iget-object v0, v0, Lcom/android/launcher2/AppsCustomizePagedView;->mRunningTasks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1320
    invoke-virtual {p1}, Lcom/android/launcher2/AppsCustomizeAsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1325
    :goto_0
    return-void

    .line 1324
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/AppsCustomizePagedView$6;->this$0:Lcom/android/launcher2/AppsCustomizePagedView;

    #calls: Lcom/android/launcher2/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/android/launcher2/AsyncTaskPageData;)V
    invoke-static {v0, p2}, Lcom/android/launcher2/AppsCustomizePagedView;->access$200(Lcom/android/launcher2/AppsCustomizePagedView;Lcom/android/launcher2/AsyncTaskPageData;)V

    goto :goto_0
.end method
