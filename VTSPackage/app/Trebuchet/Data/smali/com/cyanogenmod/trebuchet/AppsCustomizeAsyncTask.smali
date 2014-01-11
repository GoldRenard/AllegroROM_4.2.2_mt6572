.class Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;
.super Landroid/os/AsyncTask;
.source "AppsCustomizePagedView.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;",
        "Ljava/lang/Void;",
        "Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;",
        ">;"
    }
.end annotation


# instance fields
.field dataType:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;

.field page:I

.field pageContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

.field threadPriority:I


# direct methods
.method constructor <init>(ILcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;)V
    .locals 1
    .parameter "p"
    .parameter "t"
    .parameter "ty"

    .prologue
    .line 129
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 130
    iput p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->page:I

    .line 131
    iput-object p2, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->pageContentType:Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView$ContentType;

    .line 132
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->threadPriority:I

    .line 133
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->dataType:Lcom/cyanogenmod/trebuchet/AsyncTaskPageData$Type;

    .line 134
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;
    .locals 3
    .parameter "params"

    .prologue
    const/4 v2, 0x0

    .line 137
    array-length v0, p1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    .line 140
    :goto_0
    return-object v0

    .line 139
    :cond_0
    aget-object v0, p1, v2

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->doInBackgroundCallback:Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;

    aget-object v1, p1, v2

    invoke-interface {v0, p0, v1}, Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;->run(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    .line 140
    aget-object v0, p1, v2

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 128
    check-cast p1, [Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->doInBackground([Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V
    .locals 1
    .parameter "result"

    .prologue
    .line 145
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;->postExecuteCallback:Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;

    invoke-interface {v0, p0, p1}, Lcom/cyanogenmod/trebuchet/AsyncTaskCallback;->run(Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    .line 146
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 128
    check-cast p1, Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->onPostExecute(Lcom/cyanogenmod/trebuchet/AsyncTaskPageData;)V

    return-void
.end method

.method setThreadPriority(I)V
    .locals 0
    .parameter "p"

    .prologue
    .line 149
    iput p1, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->threadPriority:I

    .line 150
    return-void
.end method

.method syncThreadPriority()V
    .locals 1

    .prologue
    .line 152
    iget v0, p0, Lcom/cyanogenmod/trebuchet/AppsCustomizeAsyncTask;->threadPriority:I

    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 153
    return-void
.end method
