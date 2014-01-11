.class Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;
.super Landroid/os/AsyncTask;
.source "CallRejectListSetting.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/CallRejectListSetting;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "UpdateUIContactsTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/CallRejectListSetting;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/CallRejectListSetting;)V
    .locals 0
    .parameter

    .prologue
    .line 191
    iput-object p1, p0, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 191
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->doInBackground([Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Integer;)Ljava/lang/String;
    .locals 3
    .parameter "params"

    .prologue
    .line 201
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x1

    aget-object v2, p1, v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->updateUICallback(II)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/settings/CallRejectListSetting;->access$300(Lcom/mediatek/settings/CallRejectListSetting;II)V

    .line 202
    const-string v0, ""

    return-object v0
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 191
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->onCancelled(Ljava/lang/String;)V

    return-void
.end method

.method protected onCancelled(Ljava/lang/String;)V
    .locals 0
    .parameter "result"

    .prologue
    .line 221
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 222
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 191
    check-cast p1, Ljava/lang/String;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->onPostExecute(Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/String;)V
    .locals 2
    .parameter "result"

    .prologue
    .line 212
    invoke-virtual {p0}, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallRejectListSetting;->dismissDialog(I)V

    .line 214
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    #calls: Lcom/mediatek/settings/CallRejectListSetting;->showNumbers()V
    invoke-static {v0}, Lcom/mediatek/settings/CallRejectListSetting;->access$200(Lcom/mediatek/settings/CallRejectListSetting;)V

    .line 216
    :cond_0
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 217
    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .prologue
    .line 195
    iget-object v0, p0, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->this$0:Lcom/mediatek/settings/CallRejectListSetting;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/CallRejectListSetting;->showDialog(I)V

    .line 196
    invoke-super {p0}, Landroid/os/AsyncTask;->onPreExecute()V

    .line 197
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 0
    .parameter "progress"

    .prologue
    .line 207
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onProgressUpdate([Ljava/lang/Object;)V

    .line 208
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 191
    check-cast p1, [Ljava/lang/Integer;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/CallRejectListSetting$UpdateUIContactsTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
