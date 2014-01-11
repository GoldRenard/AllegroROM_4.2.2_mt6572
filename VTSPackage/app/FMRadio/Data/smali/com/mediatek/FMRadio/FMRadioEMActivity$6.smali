.class Lcom/mediatek/FMRadio/FMRadioEMActivity$6;
.super Ljava/lang/Thread;
.source "FMRadioEMActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;->readTickEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1017
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 1019
    const-string v5, "FmRx/EM"

    const-string v6, ">>> tick envent Thread run()"

    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1021
    :goto_0
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsTickEventExit:Z
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$4000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1049
    const-string v5, "FmRx/EM"

    const-string v6, "<<< tick envent Thread run()"

    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1050
    return-void

    .line 1025
    :cond_0
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->isDeviceOpen()Z
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1026
    new-instance v0, Landroid/os/Bundle;

    const/4 v5, 0x3

    invoke-direct {v0, v5}, Landroid/os/Bundle;-><init>(I)V

    .line 1027
    .local v0, bundle:Landroid/os/Bundle;
    const-string v5, "RDS_BLER_STRING"

    const-string v6, "%d%%"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v8}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->readRdsBler()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1028
    const-string v5, "RDS_RSSI_STRING"

    const-string v6, "%d"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v8}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->readRssi()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1029
    const-string v6, "RDS_STEREMONO_STRING"

    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getStereoMono()Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "Stereo"

    :goto_1
    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1030
    const-string v1, "N/A"

    .line 1031
    .local v1, capStr:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRdAntennaL:Landroid/widget/RadioButton;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$4100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioButton;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/RadioButton;->isChecked()Z

    move-result v5

    if-nez v5, :cond_1

    .line 1032
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    iget-object v6, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->readCapArray()I

    move-result v6

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->formatCapArray(I)Ljava/lang/String;
    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$4200(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)Ljava/lang/String;

    move-result-object v1

    .line 1034
    :cond_1
    const-string v5, "RDS_CAPARRAY_STRING"

    invoke-virtual {v0, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1035
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;

    move-result-object v5

    const/4 v6, 0x6

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    .line 1036
    .local v4, msg:Landroid/os/Message;
    invoke-virtual {v4, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 1037
    iget-object v5, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$6;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1042
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #capStr:Ljava/lang/String;
    .end local v4           #msg:Landroid/os/Message;
    :cond_2
    const/16 v3, 0x3e8

    .line 1043
    .local v3, hundredMillisecond:I
    const-wide/16 v5, 0x3e8

    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1047
    :goto_2
    const-string v5, "FmRx/EM"

    const-string v6, "get tick information"

    invoke-static {v5, v6}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 1029
    .end local v3           #hundredMillisecond:I
    .restart local v0       #bundle:Landroid/os/Bundle;
    :cond_3
    const-string v5, "Mono"

    goto :goto_1

    .line 1044
    .end local v0           #bundle:Landroid/os/Bundle;
    .restart local v3       #hundredMillisecond:I
    :catch_0
    move-exception v2

    .line 1045
    .local v2, e:Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2
.end method
