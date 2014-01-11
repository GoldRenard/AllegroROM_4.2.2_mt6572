.class Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "FMRadioActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RGK_FMBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioActivity;


# direct methods
.method private constructor <init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 252
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mediatek/FMRadio/FMRadioActivity;Lcom/mediatek/FMRadio/FMRadioActivity$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 252
    invoke-direct {p0, p1}, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;-><init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 254
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 255
    .local v0, action:Ljava/lang/String;
    const-string v1, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 256
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->isAntennaAvailable()Z
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$400(Lcom/mediatek/FMRadio/FMRadioActivity;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 257
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->finish()V

    .line 258
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->exitService()V
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$600(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    .line 263
    :cond_0
    :goto_0
    return-void

    .line 260
    :cond_1
    const-string v1, "com.mediatek.FMRadio.FMRadioService.ACTION_EXIT_FMSERVICE_AIEPLANE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 261
    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$RGK_FMBroadcastReceiver;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-virtual {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->finish()V

    goto :goto_0
.end method
