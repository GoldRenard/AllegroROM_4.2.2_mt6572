.class Lcom/android/browser/PageDialogsHandler$11;
.super Ljava/lang/Object;
.source "PageDialogsHandler.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/browser/PageDialogsHandler;->showPopupWindowAttempt(Lcom/android/browser/Tab;ZLandroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/PageDialogsHandler;

.field final synthetic val$dialog:Z

.field final synthetic val$resultMsg:Landroid/os/Message;

.field final synthetic val$tab:Lcom/android/browser/Tab;


# direct methods
.method constructor <init>(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;ZLcom/android/browser/Tab;)V
    .locals 0
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 426
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    iput-object p2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$resultMsg:Landroid/os/Message;

    iput-boolean p3, p0, Lcom/android/browser/PageDialogsHandler$11;->val$dialog:Z

    iput-object p4, p0, Lcom/android/browser/PageDialogsHandler$11;->val$tab:Lcom/android/browser/Tab;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 6
    .parameter "d"
    .parameter "which"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 428
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;
    invoke-static {v2, v4}, Lcom/android/browser/PageDialogsHandler;->access$1102(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 429
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;
    invoke-static {v2, v4}, Lcom/android/browser/PageDialogsHandler;->access$1202(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)Lcom/android/browser/Tab;

    .line 430
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    const/4 v3, 0x0

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z
    invoke-static {v2, v3}, Lcom/android/browser/PageDialogsHandler;->access$1302(Lcom/android/browser/PageDialogsHandler;Z)Z

    .line 431
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;
    invoke-static {v2, v4}, Lcom/android/browser/PageDialogsHandler;->access$1402(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;)Landroid/os/Message;

    .line 433
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$resultMsg:Landroid/os/Message;

    iget-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/webkit/WebView$WebViewTransport;

    .line 435
    .local v1, transport:Landroid/webkit/WebView$WebViewTransport;
    iget-boolean v2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$dialog:Z

    if-eqz v2, :cond_0

    .line 436
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$tab:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->createSubWindow()Z

    .line 437
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    #getter for: Lcom/android/browser/PageDialogsHandler;->mController:Lcom/android/browser/Controller;
    invoke-static {v2}, Lcom/android/browser/PageDialogsHandler;->access$100(Lcom/android/browser/PageDialogsHandler;)Lcom/android/browser/Controller;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/PageDialogsHandler$11;->val$tab:Lcom/android/browser/Tab;

    invoke-virtual {v2, v3}, Lcom/android/browser/Controller;->attachSubWindow(Lcom/android/browser/Tab;)V

    .line 438
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$tab:Lcom/android/browser/Tab;

    invoke-virtual {v2}, Lcom/android/browser/Tab;->getSubWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    .line 443
    :goto_0
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->val$resultMsg:Landroid/os/Message;

    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 444
    return-void

    .line 440
    :cond_0
    iget-object v2, p0, Lcom/android/browser/PageDialogsHandler$11;->this$0:Lcom/android/browser/PageDialogsHandler;

    #getter for: Lcom/android/browser/PageDialogsHandler;->mController:Lcom/android/browser/Controller;
    invoke-static {v2}, Lcom/android/browser/PageDialogsHandler;->access$100(Lcom/android/browser/PageDialogsHandler;)Lcom/android/browser/Controller;

    move-result-object v2

    iget-object v3, p0, Lcom/android/browser/PageDialogsHandler$11;->val$tab:Lcom/android/browser/Tab;

    invoke-virtual {v2, v4, v3, v5, v5}, Lcom/android/browser/Controller;->openTab(Ljava/lang/String;Lcom/android/browser/Tab;ZZ)Lcom/android/browser/Tab;

    move-result-object v0

    .line 441
    .local v0, newTab:Lcom/android/browser/Tab;
    invoke-virtual {v0}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebView$WebViewTransport;->setWebView(Landroid/webkit/WebView;)V

    goto :goto_0
.end method
