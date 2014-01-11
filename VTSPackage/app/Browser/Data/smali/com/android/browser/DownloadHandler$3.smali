.class final Lcom/android/browser/DownloadHandler$3;
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

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Landroid/content/Intent;Landroid/app/Activity;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 341
    iput-object p1, p0, Lcom/android/browser/DownloadHandler$3;->val$intent:Landroid/content/Intent;

    iput-object p2, p0, Lcom/android/browser/DownloadHandler$3;->val$activity:Landroid/app/Activity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 344
    iget-object v1, p0, Lcom/android/browser/DownloadHandler$3;->val$intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getFlags()I

    move-result v0

    .line 345
    .local v0, nFlags:I
    const v1, -0x10000001

    and-int/2addr v0, v1

    .line 346
    iget-object v1, p0, Lcom/android/browser/DownloadHandler$3;->val$intent:Landroid/content/Intent;

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 348
    iget-object v1, p0, Lcom/android/browser/DownloadHandler$3;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/android/browser/DownloadHandler$3;->val$intent:Landroid/content/Intent;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 349
    const-string v1, "browser/DLHandler"

    const-string v2, "User decide to open the content by startActivity"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    return-void
.end method
