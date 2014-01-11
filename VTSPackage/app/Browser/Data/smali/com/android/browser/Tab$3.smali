.class Lcom/android/browser/Tab$3;
.super Landroid/webkit/WebChromeClient;
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
.field final synthetic this$0:Lcom/android/browser/Tab;


# direct methods
.method constructor <init>(Lcom/android/browser/Tab;)V
    .locals 0
    .parameter

    .prologue
    .line 756
    iput-object p1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method private createWindow(ZLandroid/os/Message;)V
    .locals 6
    .parameter "dialog"
    .parameter "msg"

    .prologue
    const/4 v5, 0x1

    .line 759
    iget-object v1, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/webkit/WebView$WebViewTransport;

    .line 761
    .local v1, transport:Landroid/webkit/WebView$WebViewTransport;
    if-eqz p1, :cond_0

    .line 762
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->createSubWindow()Z

    .line 763
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v3, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v2, v3}, Lcom/android/browser/WebViewController;->attachSubWindow(Lcom/android/browser/Tab;)V

    .line 764
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;
    invoke-static {v2}, Lcom/android/browser/Tab;->access$1700(Lcom/android/browser/Tab;)Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    .line 770
    :goto_0
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 771
    return-void

    .line 766
    :cond_0
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v2, v3, v4, v5, v5}, Lcom/android/browser/WebViewController;->openTab(Ljava/lang/String;Lcom/android/browser/Tab;ZZ)Lcom/android/browser/Tab;

    move-result-object v0

    .line 768
    .local v0, newTab:Lcom/android/browser/Tab;
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    goto :goto_0
.end method


# virtual methods
.method public getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 1009
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1010
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->getDefaultVideoPoster()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1012
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getNextNotificationId()I
    .locals 6

    .prologue
    .line 1081
    iget-object v3, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v3, v3, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 1082
    .local v2, p:Landroid/content/SharedPreferences;
    const-string v3, "notification_id"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    add-int/lit8 v1, v3, 0x1

    .line 1084
    .local v1, i:I
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1085
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "notification_id"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1086
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1087
    const-string v3, "Tab"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "getNextNotificationId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1088
    return v1
.end method

.method public getVideoLoadingProgressView()Landroid/view/View;
    .locals 1

    .prologue
    .line 1022
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1023
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->getVideoLoadingProgressView()Landroid/view/View;

    move-result-object v0

    .line 1025
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getVisitedHistory(Landroid/webkit/ValueCallback;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1042
    .local p1, callback:Landroid/webkit/ValueCallback;,"Landroid/webkit/ValueCallback<[Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p1}, Lcom/android/browser/WebViewController;->getVisitedHistory(Landroid/webkit/ValueCallback;)V

    .line 1043
    return-void
.end method

.method public onCloseWindow(Landroid/webkit/WebView;)V
    .locals 2
    .parameter "window"

    .prologue
    .line 819
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1800(Lcom/android/browser/Tab;)Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 821
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 822
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mParent:Lcom/android/browser/Tab;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$1800(Lcom/android/browser/Tab;)Lcom/android/browser/Tab;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/browser/WebViewController;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 824
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1}, Lcom/android/browser/WebViewController;->closeTab(Lcom/android/browser/Tab;)V

    .line 826
    :cond_1
    return-void
.end method

.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 5
    .parameter "consoleMessage"

    .prologue
    const/4 v4, 0x1

    .line 963
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v2}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 965
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v2, v4}, Lcom/android/browser/Tab;->getErrorConsole(Z)Lcom/android/browser/ErrorConsoleView;

    move-result-object v0

    .line 966
    .local v0, errorConsole:Lcom/android/browser/ErrorConsoleView;
    invoke-virtual {v0, p1}, Lcom/android/browser/ErrorConsoleView;->addErrorMessage(Landroid/webkit/ConsoleMessage;)V

    .line 967
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v2}, Lcom/android/browser/WebViewController;->shouldShowErrorConsole()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/android/browser/ErrorConsoleView;->getShowState()I

    move-result v2

    if-eq v2, v4, :cond_0

    .line 970
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/android/browser/ErrorConsoleView;->showConsole(I)V

    .line 975
    .end local v0           #errorConsole:Lcom/android/browser/ErrorConsoleView;
    :cond_0
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->isPrivateBrowsingEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 999
    :goto_0
    return v4

    .line 977
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Console: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->message()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->sourceId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->lineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 981
    .local v1, message:Ljava/lang/String;
    sget-object v2, Lcom/android/browser/Tab$10;->$SwitchMap$android$webkit$ConsoleMessage$MessageLevel:[I

    invoke-virtual {p1}, Landroid/webkit/ConsoleMessage;->messageLevel()Landroid/webkit/ConsoleMessage$MessageLevel;

    move-result-object v3

    invoke-virtual {v3}, Landroid/webkit/ConsoleMessage$MessageLevel;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    goto :goto_0

    .line 983
    :pswitch_0
    const-string v2, "browser"

    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 986
    :pswitch_1
    const-string v2, "browser"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 989
    :pswitch_2
    const-string v2, "browser"

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 992
    :pswitch_3
    const-string v2, "browser"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 995
    :pswitch_4
    const-string v2, "browser"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 981
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onCreateWindow(Landroid/webkit/WebView;ZZLandroid/os/Message;)Z
    .locals 6
    .parameter "view"
    .parameter "dialog"
    .parameter "userGesture"
    .parameter "resultMsg"

    .prologue
    const/4 v5, 0x0

    const v4, 0x7f0c0058

    const v3, 0x1010355

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 777
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v2}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 807
    :goto_0
    return v0

    .line 781
    :cond_0
    if-eqz p2, :cond_1

    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mSubView:Landroid/webkit/WebView;
    invoke-static {v2}, Lcom/android/browser/Tab;->access$1700(Lcom/android/browser/Tab;)Landroid/webkit/WebView;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 782
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0c0154

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0155

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 789
    :cond_1
    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v2}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/browser/TabControl;->canCreateNewTab()Z

    move-result v2

    if-nez v2, :cond_2

    .line 790
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v2, v2, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0c0152

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0c0153

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 800
    :cond_2
    if-eqz p3, :cond_3

    .line 801
    invoke-direct {p0, p2, p4}, Lcom/android/browser/Tab$3;->createWindow(ZLandroid/os/Message;)V

    move v0, v1

    .line 802
    goto :goto_0

    .line 806
    :cond_3
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v2, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v2, p2, p4}, Lcom/android/browser/WebViewController;->onShowPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V

    move v0, v1

    .line 807
    goto :goto_0
.end method

.method public onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 10
    .parameter "url"
    .parameter "databaseIdentifier"
    .parameter "currentQuota"
    .parameter "estimatedSize"
    .parameter "totalUsedQuota"
    .parameter "quotaUpdater"

    .prologue
    .line 906
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1500(Lcom/android/browser/Tab;)Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->getWebStorageSizeManager()Lcom/android/browser/WebStorageSizeManager;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    move-wide/from16 v7, p7

    move-object/from16 v9, p9

    invoke-virtual/range {v0 .. v9}, Lcom/android/browser/WebStorageSizeManager;->onExceededDatabaseQuota(Ljava/lang/String;Ljava/lang/String;JJJLandroid/webkit/WebStorage$QuotaUpdater;)V

    .line 910
    return-void
.end method

.method public onGeolocationPermissionsHidePrompt()V
    .locals 1

    .prologue
    .line 951
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1900(Lcom/android/browser/Tab;)Lcom/android/browser/GeolocationPermissionsPrompt;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 952
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mGeolocationPermissionsPrompt:Lcom/android/browser/GeolocationPermissionsPrompt;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1900(Lcom/android/browser/Tab;)Lcom/android/browser/GeolocationPermissionsPrompt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/GeolocationPermissionsPrompt;->hide()V

    .line 954
    :cond_0
    return-void
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 1
    .parameter "origin"
    .parameter "callback"

    .prologue
    .line 941
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 942
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getGeolocationPermissionsPrompt()Lcom/android/browser/GeolocationPermissionsPrompt;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/GeolocationPermissionsPrompt;->show(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    .line 944
    :cond_0
    return-void
.end method

.method public onHideCustomView()V
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->hideCustomView()V

    .line 889
    :cond_0
    return-void
.end method

.method public onNotificationManagerCancelPrompt(I)V
    .locals 4
    .parameter "id"

    .prologue
    .line 1093
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1094
    .local v0, p:Landroid/content/SharedPreferences;
    const-string v1, "Shown"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 1095
    const-string v1, "Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Inside onNotificationManagerCancelPrompt cancel from NM notify id is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1096
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/android/browser/Tab;->access$2000(Lcom/android/browser/Tab;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 1098
    :cond_0
    const-string v1, "Tab"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Inside onNotificationManagerCancelPrompt cancel prompt from display, id = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1099
    return-void
.end method

.method public onNotificationManagerShowPrompt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILandroid/webkit/NotificationPermissions$Callback;)V
    .locals 13
    .parameter "icon"
    .parameter "title"
    .parameter "body"
    .parameter "id"
    .parameter "callback"

    .prologue
    .line 1103
    invoke-static {}, Landroid/webkit/NotificationPermissions;->getInstance()Landroid/webkit/NotificationPermissions;

    .line 1105
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    move-object/from16 v0, p5

    #setter for: Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;
    invoke-static {v9, v0}, Lcom/android/browser/Tab;->access$2102(Lcom/android/browser/Tab;Landroid/webkit/NotificationPermissions$Callback;)Landroid/webkit/NotificationPermissions$Callback;

    .line 1106
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    move/from16 v0, p4

    #setter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v9, v0}, Lcom/android/browser/Tab;->access$2202(Lcom/android/browser/Tab;I)I

    .line 1108
    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v9, v9, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const-string v11, "notification"

    invoke-virtual {v9, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/NotificationManager;

    #setter for: Lcom/android/browser/Tab;->mManager:Landroid/app/NotificationManager;
    invoke-static {v10, v9}, Lcom/android/browser/Tab;->access$2002(Lcom/android/browser/Tab;Landroid/app/NotificationManager;)Landroid/app/NotificationManager;

    .line 1110
    new-instance v6, Landroid/app/Notification;

    invoke-direct {v6}, Landroid/app/Notification;-><init>()V

    .line 1112
    .local v6, notification:Landroid/app/Notification;
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    const v10, 0x7f020058

    iput v10, v9, Landroid/app/Notification;->icon:I

    .line 1113
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    const-wide/16 v10, 0x0

    iput-wide v10, v9, Landroid/app/Notification;->when:J

    .line 1114
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    iput-object p2, v9, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 1115
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    const/4 v10, 0x0

    iput v10, v9, Landroid/app/Notification;->defaults:I

    .line 1116
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    const/4 v10, 0x0

    iput-object v10, v9, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 1117
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    const/4 v10, 0x0

    iput-object v10, v9, Landroid/app/Notification;->vibrate:[J

    .line 1118
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v6

    .line 1119
    iget v9, v6, Landroid/app/Notification;->flags:I

    or-int/lit8 v9, v9, 0x10

    iput v9, v6, Landroid/app/Notification;->flags:I

    .line 1120
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v9, v9, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v9}, Lcom/android/browser/WebViewController;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v8

    .line 1121
    .local v8, tabControl:Lcom/android/browser/TabControl;
    invoke-virtual {v8}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v5

    .line 1122
    .local v5, localTab:Lcom/android/browser/Tab;
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {p0}, Lcom/android/browser/Tab$3;->getNextNotificationId()I

    move-result v10

    #setter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v9, v10}, Lcom/android/browser/Tab;->access$2202(Lcom/android/browser/Tab;I)I

    .line 1123
    const-string v9, "Tab"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "notificationId is"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v11}, Lcom/android/browser/Tab;->access$2200(Lcom/android/browser/Tab;)I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1124
    const-string v9, "Tab"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "position is"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1126
    invoke-static {}, Lcom/android/browser/Tab;->access$2400()Ljava/util/HashMap;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 1127
    .local v3, localObject:Ljava/util/List;
    if-nez v3, :cond_0

    .line 1128
    new-instance v3, Ljava/util/ArrayList;

    .end local v3           #localObject:Ljava/util/List;
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    move-object v9, v3

    .line 1130
    check-cast v9, Ljava/util/List;

    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v10}, Lcom/android/browser/Tab;->access$2200(Lcom/android/browser/Tab;)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1131
    invoke-static {}, Lcom/android/browser/Tab;->access$2400()Ljava/util/HashMap;

    move-result-object v9

    check-cast v3, Ljava/util/List;

    invoke-virtual {v9, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    const-string v9, "Tab"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "SIZE  is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Lcom/android/browser/Tab;->access$2400()Ljava/util/HashMap;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/HashMap;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1135
    new-instance v2, Landroid/content/Intent;

    const-string v9, "notifications"

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v11, v11, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const-class v12, Lcom/android/browser/BrowserActivity;

    invoke-direct {v2, v9, v10, v11, v12}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 1136
    .local v2, intent:Landroid/content/Intent;
    const/high16 v9, 0x1000

    invoke-virtual {v2, v9}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1137
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2200(Lcom/android/browser/Tab;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1138
    const-string v9, "TITLE"

    invoke-virtual {v2, v9, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1139
    const-string v9, "BODY"

    move-object/from16 v0, p3

    invoke-virtual {v2, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1140
    const-string v9, "Position"

    invoke-virtual {v8}, Lcom/android/browser/TabControl;->getCurrentPosition()I

    move-result v10

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1141
    const-string v9, "COUNTER"

    move/from16 v0, p4

    invoke-virtual {v2, v9, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1142
    const-string v9, "com.android.browser.application_id"

    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v10, v10, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1143
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v9, v9, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const/4 v10, 0x0

    const/high16 v11, 0x800

    invoke-static {v9, v10, v2, v11}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    .line 1144
    .local v4, localPendingIntent:Landroid/app/PendingIntent;
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v9

    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v10, v10, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    move-object/from16 v0, p3

    invoke-virtual {v9, v10, p2, v0, v4}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 1146
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mManager:Landroid/app/NotificationManager;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2000(Lcom/android/browser/Tab;)Landroid/app/NotificationManager;

    move-result-object v9

    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v10}, Lcom/android/browser/Tab;->access$2200(Lcom/android/browser/Tab;)I

    move-result v10

    iget-object v11, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotification:Landroid/app/Notification;
    invoke-static {v11}, Lcom/android/browser/Tab;->access$2300(Lcom/android/browser/Tab;)Landroid/app/Notification;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 1148
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v9, v9, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-static {v9}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    .line 1149
    .local v7, prefs:Landroid/content/SharedPreferences;
    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1151
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    const-string v9, "Shown"

    const/4 v10, 0x1

    invoke-interface {v1, v9, v10}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1152
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 1154
    iget-object v9, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationPermissions:Landroid/webkit/NotificationPermissions$Callback;
    invoke-static {v9}, Lcom/android/browser/Tab;->access$2100(Lcom/android/browser/Tab;)Landroid/webkit/NotificationPermissions$Callback;

    move-result-object v9

    iget-object v10, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationID:I
    invoke-static {v10}, Lcom/android/browser/Tab;->access$2200(Lcom/android/browser/Tab;)I

    move-result v10

    iget-object v11, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mPointer:I
    invoke-static {v11}, Lcom/android/browser/Tab;->access$2500(Lcom/android/browser/Tab;)I

    move-result v11

    invoke-interface {v9, v10, v11}, Landroid/webkit/NotificationPermissions$Callback;->invokeNotificationID(II)V

    .line 1155
    return-void
.end method

.method public onNotificationPermissionsHidePrompt()V
    .locals 2

    .prologue
    .line 1159
    const-string v0, "Tab"

    const-string v1, "Inside tab.java onNotificationPermissionsHidePrompt"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1160
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$2600(Lcom/android/browser/Tab;)Lcom/android/browser/NotificationPermissionsPrompt;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1161
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mNotificationPermissionsPrompt:Lcom/android/browser/NotificationPermissionsPrompt;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$2600(Lcom/android/browser/Tab;)Lcom/android/browser/NotificationPermissionsPrompt;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/NotificationPermissionsPrompt;->hide()V

    .line 1163
    :cond_0
    return-void
.end method

.method public onNotificationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/NotificationPermissions$Callback;)V
    .locals 2
    .parameter "string"
    .parameter "callback"

    .prologue
    .line 1167
    const-string v0, "Tab"

    const-string v1, "Inside tab.java onNotificationPermissionsShowPrompt"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1168
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1169
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-virtual {v0}, Lcom/android/browser/Tab;->getNotificationPermissionsPrompt()Lcom/android/browser/NotificationPermissionsPrompt;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/android/browser/NotificationPermissionsPrompt;->show(Ljava/lang/String;Landroid/webkit/NotificationPermissions$Callback;)V

    .line 1171
    :cond_0
    return-void
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 4
    .parameter "view"
    .parameter "newProgress"

    .prologue
    const/16 v3, 0x64

    const/4 v2, 0x0

    .line 830
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mPageLoadProgress:I
    invoke-static {v0, p2}, Lcom/android/browser/Tab;->access$402(Lcom/android/browser/Tab;I)I

    .line 831
    if-ne p2, v3, :cond_0

    .line 832
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mInPageLoad:Z
    invoke-static {v0, v2}, Lcom/android/browser/Tab;->access$202(Lcom/android/browser/Tab;Z)Z

    .line 834
    :cond_0
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1}, Lcom/android/browser/WebViewController;->onProgressChanged(Lcom/android/browser/Tab;)V

    .line 835
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mUpdateThumbnail:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$300(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-ne p2, v3, :cond_1

    .line 836
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #setter for: Lcom/android/browser/Tab;->mUpdateThumbnail:Z
    invoke-static {v0, v2}, Lcom/android/browser/Tab;->access$302(Lcom/android/browser/Tab;Z)Z

    .line 838
    :cond_1
    return-void
.end method

.method public onReachedMaxAppCacheSize(JJLandroid/webkit/WebStorage$QuotaUpdater;)V
    .locals 6
    .parameter "spaceNeeded"
    .parameter "totalUsedQuota"
    .parameter "quotaUpdater"

    .prologue
    .line 925
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mSettings:Lcom/android/browser/BrowserSettings;
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1500(Lcom/android/browser/Tab;)Lcom/android/browser/BrowserSettings;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/BrowserSettings;->getWebStorageSizeManager()Lcom/android/browser/WebStorageSizeManager;

    move-result-object v0

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/browser/WebStorageSizeManager;->onReachedMaxAppCacheSize(JJLandroid/webkit/WebStorage$QuotaUpdater;)V

    .line 928
    return-void
.end method

.method public onReceivedIcon(Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "view"
    .parameter "icon"

    .prologue
    .line 848
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iput-object p2, v0, Lcom/android/browser/Tab$PageState;->mFavicon:Landroid/graphics/Bitmap;

    .line 849
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1, p1, p2}, Lcom/android/browser/WebViewController;->onFavicon(Lcom/android/browser/Tab;Landroid/webkit/WebView;Landroid/graphics/Bitmap;)V

    .line 850
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "title"

    .prologue
    .line 842
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mCurrentState:Lcom/android/browser/Tab$PageState;

    iput-object p2, v0, Lcom/android/browser/Tab$PageState;->mTitle:Ljava/lang/String;

    .line 843
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1, p2}, Lcom/android/browser/WebViewController;->onReceivedTitle(Lcom/android/browser/Tab;Ljava/lang/String;)V

    .line 844
    return-void
.end method

.method public onReceivedTouchIconUrl(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 6
    .parameter "view"
    .parameter "url"
    .parameter "precomposed"

    .prologue
    const/4 v5, 0x0

    .line 855
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 858
    .local v0, cr:Landroid/content/ContentResolver;
    if-eqz p3, :cond_0

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    if-eqz v1, :cond_0

    .line 859
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    invoke-virtual {v1, v5}, Lcom/android/browser/DownloadTouchIcon;->cancel(Z)Z

    .line 860
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    .line 863
    :cond_0
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    if-nez v1, :cond_1

    .line 864
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    new-instance v2, Lcom/android/browser/DownloadTouchIcon;

    iget-object v3, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v4, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v4, v4, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, v4, v0, p1}, Lcom/android/browser/DownloadTouchIcon;-><init>(Lcom/android/browser/Tab;Landroid/content/Context;Landroid/content/ContentResolver;Landroid/webkit/WebView;)V

    iput-object v2, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    .line 866
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mTouchIconLoader:Lcom/android/browser/DownloadTouchIcon;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    aput-object p2, v2, v5

    invoke-virtual {v1, v2}, Lcom/android/browser/DownloadTouchIcon;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 868
    :cond_1
    return-void
.end method

.method public onRequestFocus(Landroid/webkit/WebView;)V
    .locals 2
    .parameter "view"

    .prologue
    .line 812
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 813
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1}, Lcom/android/browser/WebViewController;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 815
    :cond_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2
    .parameter "view"
    .parameter "requestedOrientation"
    .parameter "callback"

    .prologue
    .line 882
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    invoke-interface {v0, v1, p1, p2, p3}, Lcom/android/browser/WebViewController;->showCustomView(Lcom/android/browser/Tab;Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    .line 884
    :cond_0
    return-void
.end method

.method public onShowCustomView(Landroid/view/View;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 2
    .parameter "view"
    .parameter "callback"

    .prologue
    .line 873
    iget-object v1, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v1, v1, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v1}, Lcom/android/browser/WebViewController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 874
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 875
    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    invoke-virtual {p0, p1, v1, p2}, Lcom/android/browser/Tab$3;->onShowCustomView(Landroid/view/View;ILandroid/webkit/WebChromeClient$CustomViewCallback;)V

    .line 877
    :cond_0
    return-void
.end method

.method public openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter
    .parameter "acceptType"
    .parameter "capture"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/ValueCallback",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1030
    .local p1, uploadMsg:Landroid/webkit/ValueCallback;,"Landroid/webkit/ValueCallback<Landroid/net/Uri;>;"
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    #getter for: Lcom/android/browser/Tab;->mInForeground:Z
    invoke-static {v0}, Lcom/android/browser/Tab;->access$1000(Lcom/android/browser/Tab;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1031
    iget-object v0, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v0, v0, Lcom/android/browser/Tab;->mWebViewController:Lcom/android/browser/WebViewController;

    invoke-interface {v0, p1, p2, p3}, Lcom/android/browser/WebViewController;->openFileChooser(Landroid/webkit/ValueCallback;Ljava/lang/String;Ljava/lang/String;)V

    .line 1035
    :goto_0
    return-void

    .line 1033
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public setupAutoFill(Landroid/os/Message;)V
    .locals 8
    .parameter "message"

    .prologue
    const/4 v7, 0x0

    .line 1048
    move-object v3, p1

    .line 1049
    .local v3, msg:Landroid/os/Message;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v4, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v4, v4, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1050
    .local v0, builder:Landroid/app/AlertDialog$Builder;
    iget-object v4, p0, Lcom/android/browser/Tab$3;->this$0:Lcom/android/browser/Tab;

    iget-object v4, v4, Lcom/android/browser/Tab;->mContext:Landroid/content/Context;

    const-string v5, "layout_inflater"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 1052
    .local v1, inflater:Landroid/view/LayoutInflater;
    const v4, 0x7f04002c

    invoke-virtual {v1, v4, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 1054
    .local v2, layout:Landroid/view/View;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0c0058

    new-instance v6, Lcom/android/browser/Tab$3$1;

    invoke-direct {v6, p0, v2, v3}, Lcom/android/browser/Tab$3$1;-><init>(Lcom/android/browser/Tab$3;Landroid/view/View;Landroid/os/Message;)V

    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0c0057

    invoke-virtual {v4, v5, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1077
    return-void
.end method
