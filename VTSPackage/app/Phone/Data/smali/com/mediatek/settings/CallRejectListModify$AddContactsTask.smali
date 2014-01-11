.class Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;
.super Landroid/os/AsyncTask;
.source "CallRejectListModify.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/CallRejectListModify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AddContactsTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallRejectListModify;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CallRejectListModify;)V
    .locals 0
    .parameter

    .prologue
    .line 53
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 5
    .parameter "params"

    .prologue
    .line 61
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 62
    .local v2, index:I
    const/4 v4, 0x1

    aget-object v4, p1, v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 63
    .local v3, size:I
    :goto_0
    if-ge v2, v3, :cond_2

    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->isCancelled()Z

    move-result v4

    if-nez v4, :cond_2

    .line 64
    iget-object v4, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #getter for: Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/settings/CallRejectListModify;->access$000(Lcom/mediatek/settings/CallRejectListModify;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/settings/CallRejectListItem;

    .line 65
    .local v0, callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListItem;->getIsChecked()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 66
    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListItem;->getId()Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, id:Ljava/lang/String;
    iget-object v4, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #getter for: Lcom/mediatek/settings/CallRejectListModify;->mCRLItemArray:Ljava/util/ArrayList;
    invoke-static {v4}, Lcom/mediatek/settings/CallRejectListModify;->access$000(Lcom/mediatek/settings/CallRejectListModify;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 68
    iget-object v4, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #calls: Lcom/mediatek/settings/CallRejectListModify;->isCurTypeVtAndVoice(Ljava/lang/String;)Z
    invoke-static {v4, v1}, Lcom/mediatek/settings/CallRejectListModify;->access$100(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 69
    iget-object v4, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #calls: Lcom/mediatek/settings/CallRejectListModify;->updateRowById(Ljava/lang/String;)V
    invoke-static {v4, v1}, Lcom/mediatek/settings/CallRejectListModify;->access$200(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V

    .line 73
    :goto_1
    add-int/lit8 v3, v3, -0x1

    .line 74
    goto :goto_0

    .line 71
    :cond_0
    iget-object v4, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #calls: Lcom/mediatek/settings/CallRejectListModify;->deleteRowById(Ljava/lang/String;)V
    invoke-static {v4, v1}, Lcom/mediatek/settings/CallRejectListModify;->access$300(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V

    goto :goto_1

    .line 75
    .end local v1           #id:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 78
    .end local v0           #callrejectitem:Lcom/mediatek/settings/CallRejectListItem;
    :cond_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    return-object v4
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 53
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->doInBackground([Ljava/lang/Integer;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 6
    .parameter "size"

    .prologue
    const/4 v5, 0x0

    .line 88
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 89
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallRejectListModify;->dismissDialog(I)V

    .line 90
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    #getter for: Lcom/mediatek/settings/CallRejectListModify;->mListView:Landroid/widget/ListView;
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListModify;->access$400(Lcom/mediatek/settings/CallRejectListModify;)Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->invalidateViews()V

    .line 91
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    .line 92
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    invoke-virtual {v0}, Lcom/mediatek/settings/CallRejectListModify;->finish()V

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    iget-object v1, p0, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListModify;

    const v2, 0x7f0d00b6

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Lcom/mediatek/settings/CallRejectListModify;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/settings/CallRejectListModify;->updateSelectedItemsView(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/settings/CallRejectListModify;->access$500(Lcom/mediatek/settings/CallRejectListModify;Ljava/lang/String;)V

    .line 96
    :cond_1
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 97
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    check-cast p1, Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 0

    .prologue
    .line 56
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 57
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 53
    check-cast p1, [Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListModify$AddContactsTask;->onProgressUpdate([Ljava/lang/String;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/String;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 83
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 84
    return-void
.end method
