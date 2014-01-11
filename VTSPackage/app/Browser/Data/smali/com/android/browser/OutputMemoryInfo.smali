.class public Lcom/android/browser/OutputMemoryInfo;
.super Landroid/os/AsyncTask;
.source "OutputMemoryInfo.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/android/browser/TabControl;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "browser"


# instance fields
.field private logToFile:Z

.field private savedFileName:Ljava/lang/String;

.field private tabController:Lcom/android/browser/TabControl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 27
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/OutputMemoryInfo;->tabController:Lcom/android/browser/TabControl;

    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/OutputMemoryInfo;->logToFile:Z

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 25
    check-cast p1, [Lcom/android/browser/TabControl;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/OutputMemoryInfo;->doInBackground([Lcom/android/browser/TabControl;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Lcom/android/browser/TabControl;)Ljava/lang/Void;
    .locals 3
    .parameter "params"

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 33
    array-length v0, p1

    if-eq v0, v2, :cond_0

    .line 35
    const-string v0, "browser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Incorrect parameters to OutputMemoryInfo\'s doInBackground(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    array-length v2, p1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 39
    :cond_0
    const/4 v0, 0x0

    aget-object v0, p1, v0

    iput-object v0, p0, Lcom/android/browser/OutputMemoryInfo;->tabController:Lcom/android/browser/TabControl;

    .line 40
    array-length v0, p1

    if-ne v0, v2, :cond_1

    aget-object v0, p1, v1

    if-eqz v0, :cond_1

    .line 42
    iput-boolean v1, p0, Lcom/android/browser/OutputMemoryInfo;->logToFile:Z

    .line 46
    :cond_1
    iget-boolean v0, p0, Lcom/android/browser/OutputMemoryInfo;->logToFile:Z

    invoke-static {v0}, Lcom/android/browser/Performance;->printMemoryInfo(Z)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/OutputMemoryInfo;->savedFileName:Ljava/lang/String;

    goto :goto_0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 25
    check-cast p1, Ljava/lang/Void;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/android/browser/OutputMemoryInfo;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 4
    .parameter "result"

    .prologue
    .line 53
    const/4 v0, 0x0

    .line 55
    .local v0, curWebView:Landroid/webkit/WebViewClassic;
    iget-object v2, p0, Lcom/android/browser/OutputMemoryInfo;->tabController:Lcom/android/browser/TabControl;

    if-eqz v2, :cond_0

    .line 57
    iget-object v2, p0, Lcom/android/browser/OutputMemoryInfo;->tabController:Lcom/android/browser/TabControl;

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v1

    .line 58
    .local v1, current:Lcom/android/browser/Tab;
    if-eqz v1, :cond_0

    .line 60
    invoke-virtual {v1}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v0

    .line 64
    .end local v1           #current:Lcom/android/browser/Tab;
    :cond_0
    if-eqz v0, :cond_2

    .line 67
    iget-boolean v2, p0, Lcom/android/browser/OutputMemoryInfo;->logToFile:Z

    if-eqz v2, :cond_1

    .line 68
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/webkit/WebViewClassic;->dumpMemoryUsage(Z)V

    .line 76
    :goto_0
    return-void

    .line 70
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/webkit/WebViewClassic;->dumpMemoryUsage(Z)V

    goto :goto_0

    .line 74
    :cond_2
    const-string v2, "browser"

    const-string v3, "Invaliadte WebViewClassic parameters to OutputMemoryInfo "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
