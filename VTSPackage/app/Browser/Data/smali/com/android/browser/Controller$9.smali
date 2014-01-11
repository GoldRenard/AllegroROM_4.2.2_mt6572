.class Lcom/android/browser/Controller$9;
.super Ljava/lang/Object;
.source "Controller.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/Controller;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/Controller;

.field final synthetic val$imageAnchorUrlExtra:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/browser/Controller;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1664
    iput-object p1, p0, Lcom/android/browser/Controller$9;->this$0:Lcom/android/browser/Controller;

    iput-object p2, p0, Lcom/android/browser/Controller$9;->val$imageAnchorUrlExtra:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 5
    .parameter "item"

    .prologue
    .line 1667
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/browser/Controller$9;->this$0:Lcom/android/browser/Controller;

    invoke-virtual {v3}, Lcom/android/browser/Controller;->getContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1670
    .local v1, intent:Landroid/content/Intent;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1671
    .local v0, bundle:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/android/browser/Controller$9;->val$imageAnchorUrlExtra:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1672
    .local v2, url:Ljava/lang/String;
    const-string v3, "isAdding"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1673
    const-string v3, "url"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1674
    const-string v3, "name"

    iget-object v4, p0, Lcom/android/browser/Controller$9;->this$0:Lcom/android/browser/Controller;

    #calls: Lcom/android/browser/Controller;->getNameFromUrl(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v4, v2}, Lcom/android/browser/Controller;->access$800(Lcom/android/browser/Controller;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1675
    const-string v3, "websites"

    invoke-virtual {v1, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 1676
    iget-object v3, p0, Lcom/android/browser/Controller$9;->this$0:Lcom/android/browser/Controller;

    #getter for: Lcom/android/browser/Controller;->mActivity:Landroid/app/Activity;
    invoke-static {v3}, Lcom/android/browser/Controller;->access$200(Lcom/android/browser/Controller;)Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x7

    invoke-virtual {v3, v1, v4}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 1678
    const/4 v3, 0x0

    return v3
.end method
