.class Lcom/android/browser/Tab$2;
.super Landroid/webkit/WebViewClientClassicExt;
.source "Tab.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Tab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mDontResend:Landroid/os/Message;

.field private mResend:Landroid/os/Message;

.field final synthetic this$0:Lcom/android/browser/Tab;


# direct methods
.method constructor <init>(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter

    .prologue
    .line 366
    iput-object p1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-direct {p0}, Landroid/webkit/WebViewClientClassicExt;-><init>()V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/browser/Tab$2;)Landroid/os/Message;
    .locals 1
    .parameter "x0"

    .prologue
    .line 366
    iget-object v0, p0, Lcom/android/browser/Tab$2;->mDontResend:Landroid/os/Message;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/android/browser/Tab$2;Landroid/os/Message;)Landroid/os/Message;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 366
    iput-object p1, p0, Lcom/android/browser/Tab$2;->mDontResend:Landroid/os/Message;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/android/browser/Tab$2;)Landroid/os/Message;
    .locals 1
    .parameter "x0"

    .prologue
    .line 366
    iget-object v0, p0, Lcom/android/browser/Tab$2;->mResend:Landroid/os/Message;

    return-object v0
.end method

.method static synthetic access$1302(Lcom/android/browser/Tab$2;Landroid/os/Message;)Landroid/os/Message;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 366
    iput-object p1, p0, Lcom/android/browser/Tab$2;->mResend:Landroid/os/Message;

    return-object p1
.end method

.method private providersDiffer(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .parameter "url"
    .parameter "otherUrl"

    .prologue
    .line 371
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 372
    .local v0, uri1:Landroid/net/Uri;
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 373
    .local v1, uri2:Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/net/Uri;->getEncodedAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 2
    .parameter "view"
    .parameter "url"
    .parameter "isReload"

    .prologue
    .line 565
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1, p3}, Lcom/android/browser/WebViewController;->doUpdateVisitedHistory(Lcom/android/browser/Tab;Z)V

    .line 566
    return-void
.end method

.method public onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 3
    .parameter "view"
    .parameter "dontResend"
    .parameter "resend"

    .prologue
    .line 510
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 511
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 554
    :goto_0
    return-void

    .line 514
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab$2;->mDontResend:Landroid/os/Message;

    if-eqz v0, :cond_1

    .line 515
    const-string v0, "Tab"

    const-string v1, "onFormResubmission should not be called again while dialog is still up"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 517
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 520
    :cond_1
    iput-object p2, p0, Lcom/android/browser/Tab$2;->mDontResend:Landroid/os/Message;

    .line 521
    iput-object p3, p0, Lcom/android/browser/Tab$2;->mResend:Landroid/os/Message;

    .line 522
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c0141

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0142

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0058

    new-instance v2, Lcom/android/browser/Tab$2$3;

    invoke-direct {v2, p0}, Lcom/android/browser/Tab$2$3;-><init>(Lcom/android/browser/Tab$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0057

    new-instance v2, Lcom/android/browser/Tab$2$2;

    invoke-direct {v2, p0}, Lcom/android/browser/Tab$2$2;-><init>(Lcom/android/browser/Tab$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/android/browser/Tab$2$1;

    invoke-direct {v1, p0}, Lcom/android/browser/Tab$2$1;-><init>(Lcom/android/browser/Tab$2;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onLoadResource(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 468
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iget-object v0, v0, Lcom/android/browser/Tab$PageState;->mSecurityState:Lcom/android/browser/Tab$SecurityState;

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_SECURE:Lcom/android/browser/Tab$SecurityState;

    if-ne v0, v1, :cond_0

    .line 473
    invoke-static {p2}, Landroid/webkit/URLUtil;->isHttpsUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/webkit/URLUtil;->isDataUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/webkit/URLUtil;->isAboutUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 475
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_MIXED:Lcom/android/browser/Tab$SecurityState;

    iput-object v1, v0, Lcom/android/browser/Tab$PageState;->mSecurityState:Lcom/android/browser/Tab$SecurityState;

    .line 479
    :cond_0
    return-void
.end method

.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v5, 0x0

    .line 427
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mInPageLoad:Z
    invoke-static {v1, v5}, Lcom/android/browser/Tab;->access$202(Lcom/android/browser/Tab;Z)Z

    .line 429
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mIsDebuggable:Z
    invoke-static {v1}, Lcom/android/browser/Tab;->access$100(Lcom/android/browser/Tab;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 430
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    .line 431
    .local v0, tc:Lcom/android/browser/TabControl;
    const-string v1, "Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v0, v3}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] onPageFinished url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    new-instance v1, Lcom/android/browser/OutputMemoryInfo;

    invoke-direct {v1}, Lcom/android/browser/OutputMemoryInfo;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Lcom/android/browser/TabControl;

    aput-object v0, v2, v5

    const/4 v3, 0x1

    const/4 v4, 0x0

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Lcom/android/browser/OutputMemoryInfo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 438
    .end local v0           #tc:Lcom/android/browser/TabControl;
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mDisableOverrideUrlLoading:Z
    invoke-static {v1, v5}, Lcom/android/browser/Tab;->access$802(Lcom/android/browser/Tab;Z)Z

    .line 439
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 440
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mLoadStartTime:J
    invoke-static {v3}, Lcom/android/browser/Tab;->access$500(Lcom/android/browser/Tab;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {p2, v1, v2}, Lcom/android/browser/LogTag;->logPageFinishedLoading(Ljava/lang/String;J)V

    .line 443
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #calls: Lcom/android/browser/Tab;->syncCurrentState(Landroid/webkit/WebView;Ljava/lang/String;)V
    invoke-static {v1, p1, p2}, Lcom/android/browser/Tab;->access$900(Lcom/android/browser/Tab;Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 444
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v2, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v1, v2}, Lcom/android/browser/WebViewController;->onPageFinished(Lcom/android/browser/Tab;)V

    .line 446
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 7
    .parameter "view"
    .parameter "url"
    .parameter "favicon"

    .prologue
    const/4 v6, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 379
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mIsDebuggable:Z
    invoke-static {v1}, Lcom/android/browser/Tab;->access$100(Lcom/android/browser/Tab;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 380
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    .line 381
    .local v0, tc:Lcom/android/browser/TabControl;
    const-string v1, "Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v0, v3}, Lcom/android/browser/TabControl;->getTabPosition(Lcom/android/browser/Tab;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/browser/TabControl;->getTabCount()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] onPageStarted url="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 385
    new-instance v1, Lcom/android/browser/OutputMemoryInfo;

    invoke-direct {v1}, Lcom/android/browser/OutputMemoryInfo;-><init>()V

    new-array v2, v6, [Lcom/android/browser/TabControl;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    aput-object v5, v2, v4

    invoke-virtual {v1, v2}, Lcom/android/browser/OutputMemoryInfo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 389
    .end local v0           #tc:Lcom/android/browser/TabControl;
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mInPageLoad:Z
    invoke-static {v1, v4}, Lcom/android/browser/Tab;->access$202(Lcom/android/browser/Tab;Z)Z

    .line 390
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mUpdateThumbnail:Z
    invoke-static {v1, v4}, Lcom/android/browser/Tab;->access$302(Lcom/android/browser/Tab;Z)Z

    .line 391
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    const/4 v2, 0x5

    #setter for: Lcom/android/browser/Tab;->mPageLoadProgress:I
    invoke-static {v1, v2}, Lcom/android/browser/Tab;->access$402(Lcom/android/browser/Tab;I)I

    .line 392
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    new-instance v2, Lcom/android/browser/Tab$PageState;

    iget-object v3, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v3, v3, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v4

    invoke-direct {v2, v3, v4, p2, p3}, Lcom/android/browser/Tab$PageState;-><init>(Landroid/content/Context;ZLjava/lang/String;Landroid/graphics/Bitmap;)V

    iput-object v2, v1, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    .line 394
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    #setter for: Lcom/android/browser/Tab;->mLoadStartTime:J
    invoke-static {v1, v2, v3}, Lcom/android/browser/Tab;->access$502(Lcom/android/browser/Tab;J)J

    .line 399
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    if-eqz v1, :cond_1

    .line 400
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    iput-object v5, v1, Lcom/android/browser/DownloadTouchIcon;->mTab:Lcom/android/browser/Tab;

    .line 401
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iput-object v5, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    .line 405
    :cond_1
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$600(Lcom/android/browser/Tab;)Lcom/android/browser/ErrorConsoleView;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 406
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$600(Lcom/android/browser/Tab;)Lcom/android/browser/ErrorConsoleView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/ErrorConsoleView;->clearErrorMessages()V

    .line 407
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->shouldShowErrorConsole()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 408
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mErrorConsole:Lcom/android/browser/ErrorConsoleView;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$600(Lcom/android/browser/Tab;)Lcom/android/browser/ErrorConsoleView;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/android/browser/ErrorConsoleView;->showConsole(I)V

    .line 413
    :cond_2
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$700(Lcom/android/browser/Tab;)Lcom/android/browser/DeviceAccountLogin;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 414
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$700(Lcom/android/browser/Tab;)Lcom/android/browser/DeviceAccountLogin;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/browser/DeviceAccountLogin;->cancel()V

    .line 415
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mDeviceAccountLogin:Lcom/android/browser/DeviceAccountLogin;
    invoke-static {v1, v5}, Lcom/android/browser/Tab;->access$702(Lcom/android/browser/Tab;Lcom/android/browser/DeviceAccountLogin;)Lcom/android/browser/DeviceAccountLogin;

    .line 416
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v2, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v1, v2}, Lcom/android/browser/WebViewController;->hideAutoLogin(Lcom/android/browser/Tab;)V

    .line 420
    :cond_3
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v2, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v1, v2, p1, p3}, Lcom/android/browser/WebViewController;->onPageStarted(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 422
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v1}, Lcom/android/browser/Tab;->updateBookmarkedStatus()V

    .line 423
    return-void
.end method

.method public onProceededAfterSslError(Landroid/webkit/WebView;Landroid/net/http/SslError;)V
    .locals 1
    .parameter "view"
    .parameter "error"

    .prologue
    .line 633
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #calls: Lcom/android/browser/Tab;->handleProceededAfterSslError(Landroid/net/http/SslError;)V
    invoke-static {v0, p2}, Lcom/android/browser/Tab;->access$1600(Lcom/android/browser/Tab;Landroid/net/http/SslError;)V

    .line 634
    return-void
.end method

.method public onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequestHandler;Ljava/lang/String;)V
    .locals 10
    .parameter "view"
    .parameter "handler"
    .parameter "host_and_port"

    .prologue
    const/4 v2, 0x0

    .line 642
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 643
    invoke-virtual {p2}, Landroid/webkit/ClientCertRequestHandler;->ignore()V

    .line 672
    :goto_0
    return-void

    .line 646
    :cond_0
    const/16 v0, 0x3a

    invoke-virtual {p3, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    .line 649
    .local v7, colon:I
    const/4 v0, -0x1

    if-ne v7, v0, :cond_1

    .line 650
    move-object v4, p3

    .line 651
    .local v4, host:Ljava/lang/String;
    const/4 v5, -0x1

    .line 662
    .local v5, port:I
    :goto_1
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/android/browser/Tab$2$8;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/Tab$2$8;-><init>(Lcom/android/browser/Tab$2;Landroid/webkit/ClientCertRequestHandler;)V

    move-object v3, v2

    move-object v6, v2

    invoke-static/range {v0 .. v6}, Landroid/security/KeyChain;->choosePrivateKeyAlias(Landroid/app/Activity;Landroid/security/KeyChainAliasCallback;[Ljava/lang/String;[Ljava/security/Principal;Ljava/lang/String;ILjava/lang/String;)V

    goto :goto_0

    .line 653
    .end local v4           #host:Ljava/lang/String;
    .end local v5           #port:I
    :cond_1
    add-int/lit8 v0, v7, 0x1

    invoke-virtual {p3, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 655
    .local v9, portString:Ljava/lang/String;
    :try_start_0
    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 656
    .restart local v5       #port:I
    const/4 v0, 0x0

    invoke-virtual {p3, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .restart local v4       #host:Ljava/lang/String;
    goto :goto_1

    .line 657
    .end local v4           #host:Ljava/lang/String;
    .end local v5           #port:I
    :catch_0
    move-exception v8

    .line 658
    .local v8, e:Ljava/lang/NumberFormatException;
    move-object v4, p3

    .line 659
    .restart local v4       #host:Ljava/lang/String;
    const/4 v5, -0x1

    .restart local v5       #port:I
    goto :goto_1
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    .line 488
    const/4 v0, -0x2

    if-eq p2, v0, :cond_0

    const/4 v0, -0x6

    if-eq p2, v0, :cond_0

    const/16 v0, -0xc

    if-eq p2, v0, :cond_0

    const/16 v0, -0xa

    if-eq p2, v0, :cond_0

    const/16 v0, -0xd

    if-eq p2, v0, :cond_0

    .line 493
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #calls: Lcom/android/browser/Tab;->queueError(ILjava/lang/String;)V
    invoke-static {v0, p2, p3}, Lcom/android/browser/Tab;->access$1100(Lcom/android/browser/Tab;ILjava/lang/String;)V

    .line 496
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 497
    const-string v0, "Tab"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceivedError "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 501
    :cond_0
    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "view"
    .parameter "handler"
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 685
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/android/browser/WebViewController;->onReceivedHttpAuthRequest(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 686
    return-void
.end method

.method public onReceivedLoginRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "view"
    .parameter "realm"
    .parameter "account"
    .parameter "args"

    .prologue
    .line 717
    new-instance v0, Lcom/android/browser/DeviceAccountLogin;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v3, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v3, v3, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/android/browser/DeviceAccountLogin;-><init>(Landroid/app/Activity;Landroid/webkit/WebView;Lcom/android/browser/Tab;Lcom/android/browser/WebViewController;)V

    invoke-virtual {v0, p2, p3, p4}, Lcom/android/browser/DeviceAccountLogin;->handleLogin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 719
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 3
    .parameter "view"
    .parameter "handler"
    .parameter "error"

    .prologue
    .line 574
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 575
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->cancel()V

    .line 576
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    sget-object v1, Lcom/android/browser/Tab$SecurityState;->SECURITY_STATE_NOT_SECURE:Lcom/android/browser/Tab$SecurityState;

    #calls: Lcom/android/browser/Tab;->setSecurityState(Lcom/android/browser/Tab$SecurityState;)V
    invoke-static {v0, v1}, Lcom/android/browser/Tab;->access$1400(Lcom/android/browser/Tab;Lcom/android/browser/Tab$SecurityState;)V

    .line 623
    :goto_0
    return-void

    .line 579
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1500(Lcom/android/browser/Tab;)Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->showSecurityWarnings()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 580
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0c005f

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c005d

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c005e

    new-instance v2, Lcom/android/browser/Tab$2$7;

    invoke-direct {v2, p0, p2, p3}, Lcom/android/browser/Tab$2$7;-><init>(Lcom/android/browser/Tab$2;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0060

    new-instance v2, Lcom/android/browser/Tab$2$6;

    invoke-direct {v2, p0, p1, p2, p3}, Lcom/android/browser/Tab$2$6;-><init>(Lcom/android/browser/Tab$2;Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0c0061

    new-instance v2, Lcom/android/browser/Tab$2$5;

    invoke-direct {v2, p0}, Lcom/android/browser/Tab$2$5;-><init>(Lcom/android/browser/Tab$2;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/android/browser/Tab$2$4;

    invoke-direct {v1, p0, p2}, Lcom/android/browser/Tab$2$4;-><init>(Lcom/android/browser/Tab$2;Landroid/webkit/SslErrorHandler;)V

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 621
    :cond_1
    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    goto :goto_0
.end method

.method public onUnhandledKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V
    .locals 1
    .parameter "view"
    .parameter "event"

    .prologue
    .line 706
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 712
    :cond_0
    :goto_0
    return-void

    .line 709
    :cond_1
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p2}, Lcom/android/browser/WebViewController;->onUnhandledKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 710
    invoke-super {p0, p1, p2}, Landroid/webkit/WebViewClientClassicExt;->onUnhandledKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V

    goto :goto_0
.end method

.method public shouldInterceptRequest(Landroid/webkit/WebView;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 691
    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v1, p2}, Lcom/android/browser/homepages/HomeProvider;->shouldInterceptRequest(Landroid/content/Context;Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v0

    .line 693
    .local v0, res:Landroid/webkit/WebResourceResponse;
    return-object v0
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "view"
    .parameter "event"

    .prologue
    .line 698
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 699
    const/4 v0, 0x0

    .line 701
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p2}, Lcom/android/browser/WebViewController;->shouldOverrideKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .parameter "view"
    .parameter "url"

    .prologue
    .line 451
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mDisableOverrideUrlLoading:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$800(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 452
    iget-object v0, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$2;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1, p1, p2}, Lcom/android/browser/WebViewController;->shouldOverrideUrlLoading(Lcom/android/browser/Tab;Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    .line 455
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
