.class final Lcom/android/browser/DownloadHandler$4;
.super Ljava/lang/Object;
.source "DownloadHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/DownloadHandler;->showDownloadOrOpenContent(Landroid/app/Activity;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$contentDisposition:Ljava/lang/String;

.field final synthetic val$contentLength:J

.field final synthetic val$mimetype:Ljava/lang/String;

.field final synthetic val$privateBrowsing:Z

.field final synthetic val$url:Ljava/lang/String;

.field final synthetic val$userAgent:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 330
    iput-object p1, p0, Lcom/android/browser/DownloadHandler$4;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/android/browser/DownloadHandler$4;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/android/browser/DownloadHandler$4;->val$userAgent:Ljava/lang/String;

    iput-object p4, p0, Lcom/android/browser/DownloadHandler$4;->val$contentDisposition:Ljava/lang/String;

    iput-object p5, p0, Lcom/android/browser/DownloadHandler$4;->val$mimetype:Ljava/lang/String;

    iput-boolean p6, p0, Lcom/android/browser/DownloadHandler$4;->val$privateBrowsing:Z

    iput-wide p7, p0, Lcom/android/browser/DownloadHandler$4;->val$contentLength:J

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 9
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 333
    iget-object v0, p0, Lcom/android/browser/DownloadHandler$4;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/android/browser/DownloadHandler$4;->val$url:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/browser/DownloadHandler$4;->val$userAgent:Ljava/lang/String;

    iget-object v3, p0, Lcom/android/browser/DownloadHandler$4;->val$contentDisposition:Ljava/lang/String;

    iget-object v4, p0, Lcom/android/browser/DownloadHandler$4;->val$mimetype:Ljava/lang/String;

    const/4 v5, 0x0

    iget-boolean v6, p0, Lcom/android/browser/DownloadHandler$4;->val$privateBrowsing:Z

    iget-wide v7, p0, Lcom/android/browser/DownloadHandler$4;->val$contentLength:J

    invoke-static/range {v0 .. v8}, Lcom/android/browser/DownloadHandler;->onDownloadStartNoStream(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    .line 336
    const-string v0, "browser/DLHandler"

    const-string v1, "User decide to download the content"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    return-void
.end method
