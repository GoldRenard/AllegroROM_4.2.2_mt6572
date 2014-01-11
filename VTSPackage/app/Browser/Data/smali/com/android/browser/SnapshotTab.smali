.class public Lcom/android/browser/SnapshotTab;
.super Lcom/android/browser/Tab;
.source "SnapshotTab.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/SnapshotTab$LoadData;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "SnapshotTab"


# instance fields
.field private mBackgroundColor:I

.field private mDateCreated:J

.field private mIsLive:Z

.field private mLoadTask:Lcom/android/browser/SnapshotTab$LoadData;

.field private mSnapshotId:J

.field private mWebViewFactory:Lcom/android/browser/WebViewFactory;


# direct methods
.method public constructor <init>(Lcom/android/browser/WebViewController;J)V
    .locals 3
    .parameter "wvcontroller"
    .parameter "snapshotId"

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0, p1, v1, v1}, Lcom/android/browser/Tab;-><init>(Lcom/android/browser/WebViewController;Landroid/webkit/WebView;Landroid/os/Bundle;)V

    .line 54
    iput-wide p2, p0, Lcom/android/browser/SnapshotTab;->mSnapshotId:J

    .line 55
    iget-object v1, p0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getWebViewFactory()Lcom/android/browser/WebViewFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/SnapshotTab;->mWebViewFactory:Lcom/android/browser/WebViewFactory;

    .line 56
    iget-object v1, p0, Lcom/android/browser/SnapshotTab;->mWebViewFactory:Lcom/android/browser/WebViewFactory;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/android/browser/WebViewFactory;->createWebView(Z)Landroid/webkit/WebView;

    move-result-object v0

    .line 57
    .local v0, web:Landroid/webkit/WebView;
    invoke-virtual {p0, v0}, Lcom/android/browser/SnapshotTab;->setWebView(Landroid/webkit/WebView;)V

    .line 58
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->loadData()V

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/android/browser/SnapshotTab;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 41
    iget-wide v0, p0, Lcom/android/browser/SnapshotTab;->mSnapshotId:J

    return-wide v0
.end method

.method static synthetic access$102(Lcom/android/browser/SnapshotTab;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput p1, p0, Lcom/android/browser/SnapshotTab;->mBackgroundColor:I

    return p1
.end method

.method static synthetic access$202(Lcom/android/browser/SnapshotTab;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-wide p1, p0, Lcom/android/browser/SnapshotTab;->mDateCreated:J

    return-wide p1
.end method

.method static synthetic access$302(Lcom/android/browser/SnapshotTab;Lcom/android/browser/SnapshotTab$LoadData;)Lcom/android/browser/SnapshotTab$LoadData;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    iput-object p1, p0, Lcom/android/browser/SnapshotTab;->mLoadTask:Lcom/android/browser/SnapshotTab$LoadData;

    return-object p1
.end method


# virtual methods
.method public bridge synthetic OnResponseBack(Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Lcom/android/browser/Tab;->OnResponseBack(Ljava/lang/String;I)V

    return-void
.end method

.method addChildTab(Lcom/android/browser/Tab;)V
    .locals 2
    .parameter "child"

    .prologue
    .line 89
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_0

    .line 90
    invoke-super {p0, p1}, Lcom/android/browser/Tab;->addChildTab(Lcom/android/browser/Tab;)V

    .line 94
    return-void

    .line 92
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Snapshot tabs cannot have child tabs!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public canGoBack()Z
    .locals 1

    .prologue
    .line 136
    invoke-super {p0}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public canGoForward()Z
    .locals 1

    .prologue
    .line 141
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_0

    invoke-super {p0}, Lcom/android/browser/Tab;->canGoForward()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic clearBackStackWhenItemAdded(Ljava/util/regex/Pattern;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/android/browser/Tab;->clearBackStackWhenItemAdded(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public bridge synthetic compressBitmap(Landroid/graphics/Bitmap;)[B
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/android/browser/Tab;->compressBitmap(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    return-object v0
.end method

.method public createSnapshotValues()Landroid/content/ContentValues;
    .locals 1

    .prologue
    .line 107
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_0

    .line 108
    invoke-super {p0}, Lcom/android/browser/Tab;->createSnapshotValues()Landroid/content/ContentValues;

    move-result-object v0

    .line 110
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic disableUrlOverridingForLoad()V
    .locals 0

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->disableUrlOverridingForLoad()V

    return-void
.end method

.method public getDateCreated()J
    .locals 2

    .prologue
    .line 122
    iget-wide v0, p0, Lcom/android/browser/SnapshotTab;->mDateCreated:J

    return-wide v0
.end method

.method public bridge synthetic getId()J
    .locals 2

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->getId()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getParent()Lcom/android/browser/Tab;
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->getParent()Lcom/android/browser/Tab;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getScreenshot()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->getScreenshot()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getSnapshotId()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lcom/android/browser/SnapshotTab;->mSnapshotId:J

    return-wide v0
.end method

.method public goBack()V
    .locals 1

    .prologue
    .line 146
    invoke-super {p0}, Lcom/android/browser/Tab;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-super {p0}, Lcom/android/browser/Tab;->goBack()V

    .line 153
    :goto_0
    return-void

    .line 149
    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    .line 150
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 151
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->loadData()V

    goto :goto_0
.end method

.method public bridge synthetic goForward()V
    .locals 0

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->goForward()V

    return-void
.end method

.method public bridge synthetic isBookmarkedSite()Z
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->isBookmarkedSite()Z

    move-result v0

    return v0
.end method

.method public isSnapshot()Z
    .locals 1

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method loadData()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/android/browser/SnapshotTab;->mLoadTask:Lcom/android/browser/SnapshotTab$LoadData;

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Lcom/android/browser/SnapshotTab$LoadData;

    iget-object v1, p0, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1}, Lcom/android/browser/SnapshotTab$LoadData;-><init>(Lcom/android/browser/SnapshotTab;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/browser/SnapshotTab;->mLoadTask:Lcom/android/browser/SnapshotTab$LoadData;

    .line 83
    iget-object v0, p0, Lcom/android/browser/SnapshotTab;->mLoadTask:Lcom/android/browser/SnapshotTab$LoadData;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/browser/SnapshotTab$LoadData;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 85
    :cond_0
    return-void
.end method

.method public loadUrl(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .parameter "url"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 127
    .local p2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-nez v0, :cond_0

    .line 128
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    .line 129
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->clearViewState()V

    .line 131
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/android/browser/Tab;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 132
    return-void
.end method

.method public bridge synthetic onNewPicture(Landroid/webkit/WebView;Landroid/graphics/Picture;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 41
    invoke-super {p0, p1, p2}, Lcom/android/browser/Tab;->onNewPicture(Landroid/webkit/WebView;Landroid/graphics/Picture;)V

    return-void
.end method

.method public bridge synthetic onTest(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 41
    invoke-super {p0, p1, p2, p3}, Lcom/android/browser/Tab;->onTest(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method protected persistThumbnail()V
    .locals 1

    .prologue
    .line 239
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_0

    .line 240
    invoke-super {p0}, Lcom/android/browser/Tab;->persistThumbnail()V

    .line 242
    :cond_0
    return-void
.end method

.method putInBackground()V
    .locals 1

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    if-nez v0, :cond_0

    .line 78
    :goto_0
    return-void

    .line 77
    :cond_0
    invoke-super {p0}, Lcom/android/browser/Tab;->putInBackground()V

    goto :goto_0
.end method

.method putInForeground()V
    .locals 3

    .prologue
    .line 63
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->getWebView()Landroid/webkit/WebView;

    move-result-object v1

    if-nez v1, :cond_1

    .line 64
    iget-object v1, p0, Lcom/android/browser/SnapshotTab;->mWebViewFactory:Lcom/android/browser/WebViewFactory;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/android/browser/WebViewFactory;->createWebView(Z)Landroid/webkit/WebView;

    move-result-object v0

    .line 65
    .local v0, web:Landroid/webkit/WebView;
    iget v1, p0, Lcom/android/browser/SnapshotTab;->mBackgroundColor:I

    if-eqz v1, :cond_0

    .line 66
    iget v1, p0, Lcom/android/browser/SnapshotTab;->mBackgroundColor:I

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setBackgroundColor(I)V

    .line 68
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/browser/SnapshotTab;->setWebView(Landroid/webkit/WebView;)V

    .line 69
    invoke-virtual {p0}, Lcom/android/browser/SnapshotTab;->loadData()V

    .line 71
    .end local v0           #web:Landroid/webkit/WebView;
    :cond_1
    invoke-super {p0}, Lcom/android/browser/Tab;->putInForeground()V

    .line 72
    return-void
.end method

.method public bridge synthetic refreshIdAfterPreload()V
    .locals 0

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->refreshIdAfterPreload()V

    return-void
.end method

.method public saveState()Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 115
    iget-boolean v0, p0, Lcom/android/browser/SnapshotTab;->mIsLive:Z

    if-eqz v0, :cond_0

    .line 116
    invoke-super {p0}, Lcom/android/browser/Tab;->saveState()Landroid/os/Bundle;

    move-result-object v0

    .line 118
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic saveViewState(Landroid/content/ContentValues;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/android/browser/Tab;->saveViewState(Landroid/content/ContentValues;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setController(Lcom/android/browser/WebViewController;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 41
    invoke-super {p0, p1}, Lcom/android/browser/Tab;->setController(Lcom/android/browser/WebViewController;)V

    return-void
.end method

.method public bridge synthetic shouldUpdateThumbnail()Z
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->shouldUpdateThumbnail()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic updateBookmarkedStatus()V
    .locals 0

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->updateBookmarkedStatus()V

    return-void
.end method

.method public bridge synthetic updateShouldCaptureThumbnails()V
    .locals 0

    .prologue
    .line 41
    invoke-super {p0}, Lcom/android/browser/Tab;->updateShouldCaptureThumbnails()V

    return-void
.end method
