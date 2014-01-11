.class Lcom/android/browser/Controller$SelectText;
.super Ljava/lang/Object;
.source "Controller.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/Controller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SelectText"
.end annotation


# instance fields
.field private mWebView:Landroid/webkit/WebViewClassic;


# direct methods
.method public constructor <init>(Landroid/webkit/WebView;)V
    .locals 1
    .parameter "webView"

    .prologue
    .line 2891
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 2892
    invoke-static {p1}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/Controller$SelectText;->mWebView:Landroid/webkit/WebViewClassic;

    .line 2893
    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .parameter "item"

    .prologue
    .line 2885
    iget-object v0, p0, Lcom/android/browser/Controller$SelectText;->mWebView:Landroid/webkit/WebViewClassic;

    if-eqz v0, :cond_0

    .line 2886
    iget-object v0, p0, Lcom/android/browser/Controller$SelectText;->mWebView:Landroid/webkit/WebViewClassic;

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->selectText()Z

    move-result v0

    .line 2888
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
