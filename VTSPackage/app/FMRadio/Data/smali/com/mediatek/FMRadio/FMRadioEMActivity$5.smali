.class Lcom/mediatek/FMRadio/FMRadioEMActivity$5;
.super Landroid/os/Handler;
.source "FMRadioEMActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioEMActivity;
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
    .line 576
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7
    .parameter "msg"

    .prologue
    const/4 v6, 0x1

    .line 578
    const-string v3, "FmRx/EM"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ">>> handleMessage what: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p1, Landroid/os/Message;->what:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsDestroying:Z
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 580
    const-string v3, "FmRx/EM"

    const-string v4, "Warning: app is being destroyed."

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    const-string v3, "FmRx/EM"

    const-string v4, "<<< handleMessage"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    :goto_0
    return-void

    .line 585
    :cond_0
    iget v3, p1, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_0

    .line 643
    const-string v3, "FmRx/EM"

    const-string v4, "invalid view id"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    :cond_1
    :goto_1
    const-string v3, "FmRx/EM"

    const-string v4, "<<< handleMessage"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 587
    :sswitch_0
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextChipID:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3000(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getChipId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 588
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextECOVersion:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getEcoVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 589
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextPatchVersion:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3200(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getPatchVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 590
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextDSPVersion:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-virtual {v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->getDspVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 593
    :sswitch_1
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 594
    .local v0, bundle:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRdsBler:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3400(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    const-string v4, "RDS_BLER_STRING"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 595
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextRssi:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3500(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    const-string v4, "RDS_RSSI_STRING"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 596
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextStereoMono:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3600(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    const-string v4, "RDS_STEREMONO_STRING"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 597
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mTextCapArray:Landroid/widget/TextView;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3700(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/TextView;

    move-result-object v3

    const-string v4, "RDS_CAPARRAY_STRING"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 601
    .end local v0           #bundle:Landroid/os/Bundle;
    :sswitch_2
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->isSpeakerUsed()Z
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3800(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 603
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioGroup;

    move-result-object v3

    const v4, 0x7f060027

    invoke-virtual {v3, v4}, Landroid/widget/RadioGroup;->check(I)V

    .line 608
    :goto_2
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 609
    .restart local v0       #bundle:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v4, "key_is_power_up"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mIsPlaying:Z
    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$002(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)Z

    .line 610
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mHandler:Landroid/os/Handler;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/os/Handler;

    move-result-object v3

    const/4 v4, 0x7

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 611
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->refreshTextStatus(Z)V
    invoke-static {v3, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2000(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)V

    goto/16 :goto_1

    .line 606
    .end local v0           #bundle:Landroid/os/Bundle;
    :cond_2
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mRgAntenna:Landroid/widget/RadioGroup;
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$100(Lcom/mediatek/FMRadio/FMRadioEMActivity;)Landroid/widget/RadioGroup;

    move-result-object v3

    const v4, 0x7f060028

    invoke-virtual {v3, v4}, Landroid/widget/RadioGroup;->check(I)V

    goto :goto_2

    .line 615
    :sswitch_3
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 616
    .restart local v0       #bundle:Landroid/os/Bundle;
    const-string v3, "key_is_switch_anntenna"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 617
    .local v2, isSwitch:Z
    if-eqz v2, :cond_1

    .line 619
    const-string v3, "FmRx/EM"

    const-string v4, "mHandler. switch anntenna ok"

    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 623
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v2           #isSwitch:Z
    :sswitch_4
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 624
    .restart local v0       #bundle:Landroid/os/Bundle;
    const-string v3, "key_tune_to_station"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v1

    .line 625
    .local v1, frequency:F
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeStation(F)I

    move-result v4

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I
    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$902(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)I

    .line 628
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->refreshTextStatus(Z)V
    invoke-static {v3, v6}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2000(Lcom/mediatek/FMRadio/FMRadioEMActivity;Z)V

    goto/16 :goto_1

    .line 633
    .end local v0           #bundle:Landroid/os/Bundle;
    .end local v1           #frequency:F
    :sswitch_5
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 634
    .restart local v0       #bundle:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v4, "key_ps_info"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mPSString:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2502(Lcom/mediatek/FMRadio/FMRadioEMActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 635
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v4, "key_rt_info"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mLRTextString:Ljava/lang/String;
    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$2702(Lcom/mediatek/FMRadio/FMRadioEMActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 636
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioEMActivity;->showRDS()V
    invoke-static {v3}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$3900(Lcom/mediatek/FMRadio/FMRadioEMActivity;)V

    goto/16 :goto_1

    .line 639
    .end local v0           #bundle:Landroid/os/Bundle;
    :sswitch_6
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 640
    .restart local v0       #bundle:Landroid/os/Bundle;
    iget-object v3, p0, Lcom/mediatek/FMRadio/FMRadioEMActivity$5;->this$0:Lcom/mediatek/FMRadio/FMRadioEMActivity;

    const-string v4, "key_rds_station"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    #setter for: Lcom/mediatek/FMRadio/FMRadioEMActivity;->mCurrentStation:I
    invoke-static {v3, v4}, Lcom/mediatek/FMRadio/FMRadioEMActivity;->access$902(Lcom/mediatek/FMRadio/FMRadioEMActivity;I)I

    goto/16 :goto_1

    .line 585
    nop

    :sswitch_data_0
    .sparse-switch
        0x4 -> :sswitch_3
        0x6 -> :sswitch_1
        0x7 -> :sswitch_0
        0x9 -> :sswitch_2
        0xf -> :sswitch_4
        0x100010 -> :sswitch_6
        0x100011 -> :sswitch_5
        0x100100 -> :sswitch_5
    .end sparse-switch
.end method
