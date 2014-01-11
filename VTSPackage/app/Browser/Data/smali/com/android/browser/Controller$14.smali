.class Lcom/android/browser/Controller$14;
.super Ljava/lang/Object;
.source "Controller.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/Controller;->showSiteNavigationDeleteDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/Controller;

.field final synthetic val$itemUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/browser/Controller;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1775
    iput-object p1, p0, Lcom/android/browser/Controller$14;->this$0:Lcom/android/browser/Controller;

    iput-object p2, p0, Lcom/android/browser/Controller$14;->val$itemUrl:Ljava/lang/String;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "whichButton"

    .prologue
    .line 1778
    iget-object v0, p0, Lcom/android/browser/Controller$14;->this$0:Lcom/android/browser/Controller;

    iget-object v1, p0, Lcom/android/browser/Controller$14;->val$itemUrl:Ljava/lang/String;

    #calls: Lcom/android/browser/Controller;->deleteSiteNavigationItem(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/android/browser/Controller;->access$1000(Lcom/android/browser/Controller;Ljava/lang/String;)V

    .line 1779
    return-void
.end method
