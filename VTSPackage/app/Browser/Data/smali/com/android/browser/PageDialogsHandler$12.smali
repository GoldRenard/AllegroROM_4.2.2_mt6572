.class Lcom/android/browser/PageDialogsHandler$12;
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

.field final synthetic val$resultMsg:Landroid/os/Message;


# direct methods
.method constructor <init>(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 449
    iput-object p1, p0, Lcom/android/browser/PageDialogsHandler$12;->this$0:Lcom/android/browser/PageDialogsHandler;

    iput-object p2, p0, Lcom/android/browser/PageDialogsHandler$12;->val$resultMsg:Landroid/os/Message;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .parameter "d"
    .parameter "which"

    .prologue
    const/4 v2, 0x0

    .line 451
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler$12;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptDialog:Landroid/app/AlertDialog;
    invoke-static {v0, v2}, Lcom/android/browser/PageDialogsHandler;->access$1102(Lcom/android/browser/PageDialogsHandler;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 452
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler$12;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptView:Lcom/android/browser/Tab;
    invoke-static {v0, v2}, Lcom/android/browser/PageDialogsHandler;->access$1202(Lcom/android/browser/PageDialogsHandler;Lcom/android/browser/Tab;)Lcom/android/browser/Tab;

    .line 453
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler$12;->this$0:Lcom/android/browser/PageDialogsHandler;

    const/4 v1, 0x0

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptIsDialog:Z
    invoke-static {v0, v1}, Lcom/android/browser/PageDialogsHandler;->access$1302(Lcom/android/browser/PageDialogsHandler;Z)Z

    .line 454
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler$12;->this$0:Lcom/android/browser/PageDialogsHandler;

    #setter for: Lcom/android/browser/PageDialogsHandler;->mPopupWindowAttemptMessage:Landroid/os/Message;
    invoke-static {v0, v2}, Lcom/android/browser/PageDialogsHandler;->access$1402(Lcom/android/browser/PageDialogsHandler;Landroid/os/Message;)Landroid/os/Message;

    .line 456
    iget-object v0, p0, Lcom/android/browser/PageDialogsHandler$12;->val$resultMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 457
    return-void
.end method
