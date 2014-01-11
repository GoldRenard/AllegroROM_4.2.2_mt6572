.class Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$2;
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
    .line 117
    iput-object p1, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$2;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 119
    iget-object v0, p0, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog$2;->this$0:Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;

    invoke-virtual {v0}, Lcom/android/browser/sitenavigation/SiteNavigationAddDialog;->finish()V

    .line 120
    return-void
.end method
