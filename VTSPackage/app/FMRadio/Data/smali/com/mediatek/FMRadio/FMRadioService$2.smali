.class Lcom/mediatek/FMRadio/FMRadioService$2;
.super Landroid/content/BroadcastReceiver;
.source "FMRadioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioService;->registerSDListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioService;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;)V
    .locals 0
    .parameter

    .prologue
    .line 1788
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 1791
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v2, v2, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    if-nez v2, :cond_1

    .line 1792
    const-string v2, "FmRx/Service"

    const-string v3, "SD receiver: FMRecorder is not present!!"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1821
    :cond_0
    :goto_0
    return-void

    .line 1796
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1799
    .local v0, action:Ljava/lang/String;
    const-string v2, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1800
    const-string v2, "FmRx/Service"

    const-string v3, "MEDIA_MOUNTED"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1801
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v2, v2, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRecorder;->onSDInserted()V

    goto :goto_0

    .line 1805
    :cond_2
    const-string v2, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1807
    :cond_3
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-virtual {v2, p2}, Lcom/mediatek/FMRadio/FMRadioService;->isRecordingCardUnmount(Landroid/content/Intent;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1808
    const-string v2, "FmRx/Service"

    const-string v3, "MEDIA_EJECT"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1809
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v2, v2, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRecorder;->getState()I

    move-result v2

    const/4 v3, 0x6

    if-ne v2, v3, :cond_4

    .line 1810
    const-string v2, "FmRx/Service"

    const-string v3, "old state is recording"

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1811
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/mediatek/FMRadio/FMRadioService;->onRecorderError(I)V

    .line 1812
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v2, v2, Lcom/mediatek/FMRadio/FMRadioService;->mFMRecorder:Lcom/mediatek/FMRadio/FMRecorder;

    invoke-virtual {v2}, Lcom/mediatek/FMRadio/FMRecorder;->discardRecording()V

    .line 1814
    :cond_4
    new-instance v1, Landroid/os/Bundle;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/os/Bundle;-><init>(I)V

    .line 1815
    .local v1, bundle:Landroid/os/Bundle;
    const-string v2, "callback_flag"

    const v3, 0x100101

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1816
    const-string v2, "key_is_recording_state"

    const/4 v3, 0x5

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1817
    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioService$2;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v2, v1}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto :goto_0
.end method
