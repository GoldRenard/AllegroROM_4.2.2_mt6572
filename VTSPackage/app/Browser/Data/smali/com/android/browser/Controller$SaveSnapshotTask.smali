.class Lcom/android/browser/Controller$SaveSnapshotTask;
.super Landroid/os/AsyncTask;
.source "Controller.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Controller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SaveSnapshotTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Long;",
        ">;",
        "Landroid/content/DialogInterface$OnCancelListener;"
    }
.end annotation


# instance fields
.field private mProgressDialog:Landroid/app/Dialog;

.field private mTab:Lcom/android/browser/Tab;

.field private mValues:Landroid/content/ContentValues;

.field final synthetic this$0:Lcom/android/browser/Controller;


# direct methods
.method private constructor <init>(Lcom/android/browser/Controller;Lcom/android/browser/Tab;)V
    .locals 0
    .parameter
    .parameter "tab"

    .prologue
    .line 2243
    iput-object p1, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2244
    iput-object p2, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mTab:Lcom/android/browser/Tab;

    .line 2245
    return-void
.end method

.method synthetic constructor <init>(Lcom/android/browser/Controller;Lcom/android/browser/Tab;Lcom/android/browser/Controller$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 2236
    invoke-direct {p0, p1, p2}, Lcom/android/browser/Controller$SaveSnapshotTask;-><init>(Lcom/android/browser/Controller;Lcom/android/browser/Tab;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Long;
    .locals 9
    .parameter "params"

    .prologue
    const/4 v6, 0x0

    .line 2257
    iget-object v7, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mTab:Lcom/android/browser/Tab;

    iget-object v8, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v7, v8}, Lcom/android/browser/Tab;->saveViewState(Landroid/content/ContentValues;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 2274
    :cond_0
    :goto_0
    return-object v6

    .line 2260
    :cond_1
    invoke-virtual {p0}, Lcom/android/browser/Controller$SaveSnapshotTask;->isCancelled()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 2261
    iget-object v7, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mValues:Landroid/content/ContentValues;

    const-string v8, "viewstate_path"

    invoke-virtual {v7, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2262
    .local v4, path:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v7}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7, v4}, Landroid/app/Activity;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 2263
    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v7

    if-nez v7, :cond_0

    .line 2264
    invoke-virtual {v1}, Ljava/io/File;->deleteOnExit()V

    goto :goto_0

    .line 2268
    .end local v1           #file:Ljava/io/File;
    .end local v4           #path:Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v7}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v7

    invoke-virtual {v7}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 2269
    .local v0, cr:Landroid/content/ContentResolver;
    sget-object v7, Lcom/android/browser/provider/SnapshotProvider$Snapshots;->CONTENT_URI:Landroid/net/Uri;

    iget-object v8, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mValues:Landroid/content/ContentValues;

    invoke-virtual {v0, v7, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v5

    .line 2270
    .local v5, result:Landroid/net/Uri;
    if-eqz v5, :cond_0

    .line 2273
    invoke-static {v5}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    .line 2274
    .local v2, id:J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    goto :goto_0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 2236
    check-cast p1, [Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller$SaveSnapshotTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .parameter "dialog"

    .prologue
    .line 2295
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/Controller$SaveSnapshotTask;->cancel(Z)Z

    .line 2296
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Long;)V
    .locals 4
    .parameter "id"

    .prologue
    .line 2279
    invoke-virtual {p0}, Lcom/android/browser/Controller$SaveSnapshotTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2291
    :goto_0
    return-void

    .line 2282
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->dismiss()V

    .line 2283
    if-nez p1, :cond_1

    .line 2284
    iget-object v1, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v1}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0c009e

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 2288
    :cond_1
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 2289
    .local v0, b:Landroid/os/Bundle;
    const-string v1, "animate_id"

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 2290
    iget-object v1, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mUi:Lcom/android/browser/UI;
    invoke-static {v1}, Lcom/android/browser/Controller;->access$1200(Lcom/android/browser/Controller;)Lcom/android/browser/UI;

    move-result-object v1

    sget-object v2, Lcom/android/browser/UI$ComboViews;->Snapshots:Lcom/android/browser/UI$ComboViews;

    invoke-interface {v1, v2, v0}, Lcom/android/browser/UI;->showComboView(Lcom/android/browser/UI$ComboViews;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 2236
    check-cast p1, Ljava/lang/Long;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/Controller$SaveSnapshotTask;->onPostExecute(Ljava/lang/Long;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    .line 2249
    iget-object v0, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0c0040

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 2250
    .local v2, message:Ljava/lang/CharSequence;
    iget-object v0, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v0}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    move v4, v3

    move-object v5, p0

    invoke-static/range {v0 .. v5}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZLandroid/content/DialogInterface$OnCancelListener;)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mProgressDialog:Landroid/app/Dialog;

    .line 2252
    iget-object v0, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mTab:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->createSnapshotValues()Landroid/content/ContentValues;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller$SaveSnapshotTask;->mValues:Landroid/content/ContentValues;

    .line 2253
    return-void
.end method
