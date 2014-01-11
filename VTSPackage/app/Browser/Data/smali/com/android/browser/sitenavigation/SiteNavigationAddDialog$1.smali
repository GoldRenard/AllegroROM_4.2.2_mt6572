.class Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;
.super Ljava/lang/Object;
.source "SiteNavigationAddDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;


# direct methods
.method constructor <init>(Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;)V
    .locals 0
    .parameter

    .prologue
    .line 108
    iput-object p1, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .parameter "v"

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-virtual {v0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->save()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    iget-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "need_refresh"

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->setResult(ILandroid/content/Intent;)V

    .line 112
    iget-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$1;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-virtual {v0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->finish()V

    .line 114
    :cond_0
    return-void
.end method
