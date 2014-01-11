.class Lcom/android/browser/BaseUi$2;
.super Landroid/os/Handler;
.source "BaseUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/browser/BaseUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/browser/BaseUi;


# direct methods
.method constructor <init>(Lcom/android/browser/BaseUi;)V
    .locals 0
    .parameter

    .prologue
    .line 937
    iput-object p1, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 940
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 941
    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    invoke-virtual {v0}, Lcom/android/browser/BaseUi;->suggestHideTitleBar()V

    .line 943
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 944
    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    iget-object v0, v0, Lcom/android/browser/BaseUi;->mUiController:Lcom/android/browser/UiController;

    invoke-interface {v0}, Lcom/android/browser/UiController;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/browser/Tab;->inPageLoad()Z

    move-result v0

    if-nez v0, :cond_1

    .line 947
    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    invoke-virtual {v0}, Lcom/android/browser/BaseUi;->hideBottomBar()V

    .line 950
    :cond_1
    iget-object v0, p0, Lcom/android/browser/BaseUi$2;->this$0:Lcom/android/browser/BaseUi;

    invoke-virtual {v0, p1}, Lcom/android/browser/BaseUi;->handleMessage(Landroid/os/Message;)V

    .line 951
    return-void
.end method
