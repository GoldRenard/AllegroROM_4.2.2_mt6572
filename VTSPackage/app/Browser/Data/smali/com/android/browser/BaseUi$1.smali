.class Lcom/android/browser/BaseUi$1;
.super Ljava/lang/Object;
.source "BaseUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/BaseUi;->createSubWindow(Lcom/android/browser/Tab;Landroid/webkit/WebView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BaseUi;

.field final synthetic val$cancelSubView:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/android/browser/BaseUi;Landroid/webkit/WebView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 455
    iput-object p1, p0, Lcom/android/browser/BaseUi$1;->this$0:Lcom/android/browser/BaseUi;

    iput-object p2, p0, Lcom/android/browser/BaseUi$1;->val$cancelSubView:Landroid/webkit/WebView;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 457
    iget-object v0, p0, Lcom/android/browser/BaseUi$1;->val$cancelSubView:Landroid/webkit/WebView;

    invoke-static {v0}, Landroid/webkit/WebViewClassic;->fromWebView(Landroid/webkit/WebView;)Landroid/webkit/WebViewClassic;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebViewClassic;->getWebChromeClient()Landroid/webkit/WebChromeClient;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/BaseUi$1;->val$cancelSubView:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/webkit/WebChromeClient;->onCloseWindow(Landroid/webkit/WebView;)V

    .line 459
    return-void
.end method
