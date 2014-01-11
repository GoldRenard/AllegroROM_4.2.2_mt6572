.class Lcom/mediatek/FMRadio/FMRadioService$1;
.super Ljava/lang/Thread;
.source "FMRadioService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/FMRadio/FMRadioService;->startRDSThread()V
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
    .line 1563
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 1565
    const-string v7, "FmRx/Service"

    const-string v8, ">>> RDS Thread run()"

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1567
    :goto_0
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mIsRDSThreadExit:Z
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$1100(Lcom/mediatek/FMRadio/FMRadioService;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1626
    const-string v7, "FmRx/Service"

    const-string v8, "<<< RDS Thread run()"

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1627
    return-void

    .line 1571
    :cond_0
    invoke-static {}, Lcom/mediatek/FMRadio/FMRadioNative;->readrds()S

    move-result v6

    .line 1572
    .local v6, iRDSEvents:I
    if-eqz v6, :cond_1

    .line 1573
    const-string v7, "FmRx/Service"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "FMRadioNative.readrds events: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1576
    :cond_1
    const/16 v7, 0x8

    and-int/lit8 v8, v6, 0x8

    if-ne v7, v8, :cond_2

    .line 1577
    const-string v7, "FmRx/Service"

    const-string v8, "RDS_EVENT_PROGRAMNAME"

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1578
    invoke-static {}, Lcom/mediatek/FMRadio/FMRadioNative;->getPS()[B

    move-result-object v2

    .line 1579
    .local v2, bytePS:[B
    if-eqz v2, :cond_2

    .line 1580
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v2}, Ljava/lang/String;-><init>([B)V

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setPS(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1200(Lcom/mediatek/FMRadio/FMRadioService;Ljava/lang/String;)V

    .line 1584
    .end local v2           #bytePS:[B
    :cond_2
    const/16 v7, 0x40

    and-int/lit8 v8, v6, 0x40

    if-ne v7, v8, :cond_3

    .line 1585
    const-string v7, "FmRx/Service"

    const-string v8, "RDS_EVENT_LAST_RADIOTEXT"

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1586
    invoke-static {}, Lcom/mediatek/FMRadio/FMRadioNative;->getLRText()[B

    move-result-object v1

    .line 1587
    .local v1, byteLRText:[B
    if-eqz v1, :cond_3

    .line 1588
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v1}, Ljava/lang/String;-><init>([B)V

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setLRText(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1300(Lcom/mediatek/FMRadio/FMRadioService;Ljava/lang/String;)V

    .line 1592
    .end local v1           #byteLRText:[B
    :cond_3
    const/16 v7, 0x80

    and-int/lit16 v8, v6, 0x80

    if-ne v7, v8, :cond_4

    .line 1593
    const-string v7, "FmRx/Service"

    const-string v8, "RDS_EVENT_AF"

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1594
    invoke-static {}, Lcom/mediatek/FMRadio/FMRadioNative;->activeAF()S

    move-result v5

    .line 1595
    .local v5, iFreq:I
    invoke-static {v5}, Lcom/mediatek/FMRadio/FMRadioUtils;->isValidStation(I)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1600
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mCurrentStation:I
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$1400(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v7

    if-ne v7, v5, :cond_5

    .line 1601
    const-string v7, "FmRx/Service"

    const-string v8, "Error: the new frequency is the same as current."

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/LogUtils;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1620
    .end local v5           #iFreq:I
    :cond_4
    :goto_1
    const/16 v4, 0x1f4

    .line 1621
    .local v4, hundredMillisecond:I
    const-wide/16 v7, 0x1f4

    :try_start_0
    invoke-static {v7, v8}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 1622
    :catch_0
    move-exception v3

    .line 1623
    .local v3, e:Ljava/lang/InterruptedException;
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_0

    .line 1603
    .end local v3           #e:Ljava/lang/InterruptedException;
    .end local v4           #hundredMillisecond:I
    .restart local v5       #iFreq:I
    :cond_5
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const-string v8, ""

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setPS(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1200(Lcom/mediatek/FMRadio/FMRadioService;Ljava/lang/String;)V

    .line 1604
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const-string v8, ""

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->setLRText(Ljava/lang/String;)V
    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1300(Lcom/mediatek/FMRadio/FMRadioService;Ljava/lang/String;)V

    .line 1606
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #setter for: Lcom/mediatek/FMRadio/FMRadioService;->mCurrentStation:I
    invoke-static {v7, v5}, Lcom/mediatek/FMRadio/FMRadioService;->access$1402(Lcom/mediatek/FMRadio/FMRadioService;I)I

    .line 1607
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->updateNotification()V
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$1500(Lcom/mediatek/FMRadio/FMRadioService;)V

    .line 1608
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mCurrentStation:I
    invoke-static {v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1400(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v8

    invoke-static {v8}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v8

    invoke-virtual {v7, v8}, Lcom/mediatek/FMRadio/FMRadioService;->tuneStationAsync(F)V

    .line 1609
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/mediatek/FMRadio/FMRadioService;->access$1600(Lcom/mediatek/FMRadio/FMRadioService;)Landroid/content/Context;

    move-result-object v7

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mCurrentStation:I
    invoke-static {v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1400(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v8

    invoke-static {v7, v8}, Lcom/mediatek/FMRadio/FMRadioStation;->setCurrentStation(Landroid/content/Context;I)V

    .line 1610
    new-instance v0, Landroid/os/Bundle;

    const/4 v7, 0x2

    invoke-direct {v0, v7}, Landroid/os/Bundle;-><init>(I)V

    .line 1611
    .local v0, bundle:Landroid/os/Bundle;
    const-string v7, "callback_flag"

    const v8, 0x100010

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1612
    const-string v7, "key_rds_station"

    iget-object v8, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #getter for: Lcom/mediatek/FMRadio/FMRadioService;->mCurrentStation:I
    invoke-static {v8}, Lcom/mediatek/FMRadio/FMRadioService;->access$1400(Lcom/mediatek/FMRadio/FMRadioService;)I

    move-result v8

    invoke-virtual {v0, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1613
    iget-object v7, p0, Lcom/mediatek/FMRadio/FMRadioService$1;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->notifyActivityStateChanged(Landroid/os/Bundle;)V
    invoke-static {v7, v0}, Lcom/mediatek/FMRadio/FMRadioService;->access$1700(Lcom/mediatek/FMRadio/FMRadioService;Landroid/os/Bundle;)V

    goto :goto_1
.end method
