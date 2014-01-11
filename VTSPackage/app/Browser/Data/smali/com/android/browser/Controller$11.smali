.class Lcom/android/browser/Controller$11;
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
    .line 1703
    iput-object p1, p0, Lcom/android/browser/Controller$11;->this$0:Lcom/android/browser/Controller;

    iput-object p2, p0, Lcom/android/browser/Controller$11;->val$imageAnchorUrlExtra:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 1706
    iget-object v0, p0, Lcom/android/browser/Controller$11;->this$0:Lcom/android/browser/Controller;

    iget-object v1, p0, Lcom/android/browser/Controller$11;->val$imageAnchorUrlExtra:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/android/browser/Controller;->showSiteNavigationDeleteDialog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/browser/Controller;->access$900(Lcom/android/browser/Controller;Ljava/lang/String;)V

    .line 1708
    const/4 v0, 0x0

    return v0
.end method
