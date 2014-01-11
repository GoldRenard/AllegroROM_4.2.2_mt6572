.class public Lcom/mediatek/browser/ext/BrowserProcessNetworkEx;
.super Ljava/lang/Object;
.source "BrowserProcessNetworkEx.java"

# interfaces
.implements Lcom/mediatek/browser/ext/IBrowserProcessNetworkEx;


# static fields
.field private static final TAG:Ljava/lang/String; = "BrowserPluginEx"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processNetworkNotify(Landroid/webkit/WebView;Landroid/content/Context;ZLcom/mediatek/browser/ext/IBrowserControllerEx;)V
    .locals 2
    .parameter "view"
    .parameter "context"
    .parameter "isNetworkUp"
    .parameter "mBrowserControllerEx"

    .prologue
    .line 20
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: processNetworkNotify --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    return-void
.end method

.method public shouldProcessNetworkNotify(Z)Z
    .locals 2
    .parameter "isNetworkUp"

    .prologue
    .line 13
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldProcessNetworkNotify --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    const/4 v0, 0x0

    return v0
.end method
