.class Lcom/android/browser/Tab$SubWindowClient;
.super Landroid/webkit/WebViewClientClassicExt;
.source "Tab.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Tab;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SubWindowClient"
.end annotation


# instance fields
.field private final mClient:Landroid/webkit/WebViewClientClassicExt;

.field private final mController:Lcom/android/browser/WebViewController;


# direct methods
.method constructor <init>(Landroid/webkit/WebViewClientClassicExt;Lcom/android/browser/WebViewController;)V
    .locals 0
    .parameter "client"
    .parameter "controller"

    .prologue
    .line 1186
    invoke-direct {p0}, Landroid/webkit/WebViewClientClassicExt;-><init>()V

    .line 1187
    iput-object p1, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    .line 1188
    iput-object p2, p0, Lcom/android/browser/Tab$SubWindowClient;->mController:Lcom/android/browser/WebViewController;

    .line 1189
    return-void
.end method


# virtual methods
.method public doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V
    .locals 1
    .parameter "view"
    .parameter "url"
    .parameter "isReload"

    .prologue
    .line 1200
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/WebViewClientClassicExt;->doUpdateVisitedHistory(Landroid/webkit/WebView;Ljava/lang/String;Z)V

    .line 1201
    return-void
.end method

.method public onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V
    .locals 1
    .parameter "view"
    .parameter "dontResend"
    .parameter "resend"

    .prologue
    .line 1224
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/WebViewClientClassicExt;->onFormResubmission(Landroid/webkit/WebView;Landroid/os/Message;Landroid/os/Message;)V

    .line 1225
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "view"
    .parameter "url"
    .parameter "favicon"

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mController:Lcom/android/browser/WebViewController;

    invoke-interface {v0}, Lcom/android/browser/WebViewController;->endActionMode()V

    .line 1196
    return-void
.end method

.method public onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequestHandler;Ljava/lang/String;)V
    .locals 1
    .parameter "view"
    .parameter "handler"
    .parameter "host_and_port"

    .prologue
    .line 1214
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/WebViewClientClassicExt;->onReceivedClientCertRequest(Landroid/webkit/WebView;Landroid/webkit/ClientCertRequestHandler;Ljava/lang/String;)V

    .line 1215
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "view"
    .parameter "errorCode"
    .parameter "description"
    .parameter "failingUrl"

    .prologue
    .line 1229
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/webkit/WebViewClientClassicExt;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 1230
    return-void
.end method

.method public onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "view"
    .parameter "handler"
    .parameter "host"
    .parameter "realm"

    .prologue
    .line 1219
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/webkit/WebViewClientClassicExt;->onReceivedHttpAuthRequest(Landroid/webkit/WebView;Landroid/webkit/HttpAuthHandler;Ljava/lang/String;Ljava/lang/String;)V

    .line 1220
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1
    .parameter "view"
    .parameter "handler"
    .parameter "error"

    .prologue
    .line 1209
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2, p3}, Landroid/webkit/WebViewClientClassicExt;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    .line 1210
    return-void
.end method

.method public onUnhandledKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V
    .locals 1
    .parameter "view"
    .parameter "event"

    .prologue
    .line 1239
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebViewClientClassicExt;->onUnhandledKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)V

    .line 1240
    return-void
.end method

.method public shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "view"
    .parameter "event"

    .prologue
    .line 1234
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebViewClientClassicExt;->shouldOverrideKeyEvent(Landroid/webkit/WebView;Landroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .parameter "view"
    .parameter "url"

    .prologue
    .line 1204
    iget-object v0, p0, Lcom/android/browser/Tab$SubWindowClient;->mClient:Landroid/webkit/WebViewClientClassicExt;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebViewClientClassicExt;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
