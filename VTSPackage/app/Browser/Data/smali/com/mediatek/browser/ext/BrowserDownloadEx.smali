.class public Lcom/mediatek/browser/ext/BrowserDownloadEx;
.super Ljava/lang/Object;
.source "BrowserDownloadEx.java"

# interfaces
.implements Lcom/mediatek/browser/ext/IBrowserDownloadEx;


# static fields
.field private static final TAG:Ljava/lang/String; = "BrowserPluginEx"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setRequestDestinationDir(Ljava/lang/String;Landroid/app/DownloadManager$Request;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "downloadPath"
    .parameter "mRequest"
    .parameter "filename"
    .parameter "mimeType"

    .prologue
    .line 12
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: setRequestDestinationDir --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 13
    const/4 v0, 0x0

    return v0
.end method

.method public shouldShowDownloadOrOpenContent()Z
    .locals 2

    .prologue
    .line 19
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldShowDownloadOrOpenContent --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    const/4 v0, 0x0

    return v0
.end method

.method public shouldShowToastWithFileSize()Z
    .locals 2

    .prologue
    .line 25
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldShowToastWithFileSize --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    const/4 v0, 0x0

    return v0
.end method
