.class Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;
.super Ljava/lang/Object;
.source "AppsCustomizePagedView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->syncWidgetPageItems(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

.field final synthetic val$cellHeight:I

.field final synthetic val$cellWidth:I

.field final synthetic val$immediate:Z

.field final synthetic val$items:Ljava/util/ArrayList;

.field final synthetic val$layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

.field final synthetic val$page:I


# direct methods
.method constructor <init>(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;IILcom/cyanogenmod/trebuchet/PagedViewGridLayout;ZILjava/util/ArrayList;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1644
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iput p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$cellWidth:I

    iput p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$cellHeight:I

    iput-object p4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    iput-boolean p5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$immediate:Z

    iput p6, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$page:I

    iput-object p7, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$items:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x0

    .line 1647
    iget v3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$cellWidth:I

    .line 1648
    .local v3, maxPreviewWidth:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$cellHeight:I

    .line 1649
    .local v4, maxPreviewHeight:I
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 1650
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$layout:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    invoke-virtual {v1, v2}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/PagedViewWidget;

    .line 1651
    .local v8, w:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->getPreviewSize()[I

    move-result-object v7

    .line 1652
    .local v7, maxSize:[I
    aget v3, v7, v2

    .line 1653
    const/4 v1, 0x1

    aget v4, v7, v1

    .line 1655
    .end local v7           #maxSize:[I
    .end local v8           #w:Lcom/cyanogenmod/trebuchet/PagedViewWidget;
    :cond_0
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$immediate:Z

    if-eqz v1, :cond_1

    .line 1656
    new-instance v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$page:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$items:Ljava/util/ArrayList;

    move-object v6, v5

    invoke-direct/range {v0 .. v6}, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;-><init>(ILjava/util/ArrayList;IILcom/cyanogenmod/trebuchet/AsyncTaskCallback;Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;)V

    .line 1658
    .local v0, data:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->loadWidgetPreviewsInBackground(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    invoke-static {v1, v5, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$100(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    .line 1659
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->onSyncWidgetPageItems(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    invoke-static {v1, v0}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$400(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    .line 1668
    .end local v0           #data:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    :goto_0
    return-void

    .line 1661
    :cond_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mInTransition:Z
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$500(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1662
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    #getter for: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->mDeferredPrepareLoadWidgetPreviewsTasks:Ljava/util/ArrayList;
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$600(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1664
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->this$0:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$page:I

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$7;->val$items:Ljava/util/ArrayList;

    #calls: Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->prepareLoadWidgetPreviewsTask(ILjava/util/ArrayList;II)V
    invoke-static {v1, v2, v5, v3, v4}, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;->access$700(Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;ILjava/util/ArrayList;II)V

    goto :goto_0
.end method
