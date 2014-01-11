.class Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;
.super Landroid/content/BroadcastReceiver;
.source "SimSwitchPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;


# direct methods
.method constructor <init>(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V
    .locals 0
    .parameter

    .prologue
    .line 60
    iput-object p1, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 11
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 63
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, action:Ljava/lang/String;
    const-string v8, "SimSwitchPanelView"

    const-string v9, "sim state changed"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    const-string v8, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    if-eqz v8, :cond_1

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 69
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 70
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 72
    .local v5, simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v5, :cond_0

    .line 73
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget v9, v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;
    invoke-static {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)Lcom/android/systemui/statusbar/toolbar/SimIconView;

    move-result-object v4

    .line 74
    .local v4, simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v4, :cond_0

    .line 75
    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->updateSimIcon(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 69
    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 79
    .end local v2           #i:I
    .end local v5           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    :cond_1
    const-string v8, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 80
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_3

    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mCurrentServiceType:Ljava/lang/String;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$200(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "gprs_connection_sim_setting"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3

    .line 141
    :cond_2
    return-void

    .line 84
    :cond_3
    const-string v8, "reason"

    invoke-virtual {p2, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 85
    .local v3, reason:Ljava/lang/String;
    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    invoke-static {p2}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$300(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v7

    .line 87
    .local v7, state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    const-string v8, "simId"

    const/4 v9, -0x1

    invoke-virtual {p2, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    .line 89
    .local v6, simSlotId:I
    const-string v8, "SimSwitchPanelView"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mDataConnectionReceiver simId is : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    const-string v8, "SimSwitchPanelView"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mDataConnectionReceiver state is : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    const-string v8, "SimSwitchPanelView"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mDataConnectionReceiver reason is : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    if-eqz v3, :cond_2

    .line 96
    if-eqz v3, :cond_2

    const-string v8, "dataAttached"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    const-string v8, "dataDetached"

    invoke-virtual {v3, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 98
    :cond_4
    sget-object v8, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$7;->$SwitchMap$com$android$internal$telephony$PhoneConstants$DataState:[I

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneConstants$DataState;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 110
    :goto_1
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    if-eqz v8, :cond_2

    .line 111
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_2
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-ge v2, v8, :cond_2

    .line 112
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 114
    .restart local v5       #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v5, :cond_5

    .line 115
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget v9, v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;
    invoke-static {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)Lcom/android/systemui/statusbar/toolbar/SimIconView;

    move-result-object v4

    .line 116
    .restart local v4       #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v4, :cond_5

    .line 117
    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->updateSimIcon(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 111
    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 100
    .end local v2           #i:I
    .end local v5           #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    :pswitch_0
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateMobileConnection()V
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$400(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V

    goto :goto_1

    .line 103
    :pswitch_1
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->updateMobileConnection()V
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$400(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)V

    goto :goto_1

    .line 124
    .end local v3           #reason:Ljava/lang/String;
    .end local v6           #simSlotId:I
    .end local v7           #state:Lcom/android/internal/telephony/PhoneConstants$DataState;
    :cond_6
    const-string v8, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 125
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$500(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Lcom/android/systemui/statusbar/util/SIMHelper;->updateSIMInfos(Landroid/content/Context;)V

    .line 126
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget-object v9, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mContext:Landroid/content/Context;
    invoke-static {v9}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$600(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Landroid/content/Context;

    move-result-object v9

    invoke-static {v9}, Lcom/android/systemui/statusbar/util/SIMHelper;->getSIMInfoList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    #setter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$002(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;Ljava/util/List;)Ljava/util/List;

    .line 127
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    .line 128
    .local v1, count:I
    const/4 v2, 0x0

    .restart local v2       #i:I
    :goto_3
    if-ge v2, v1, :cond_2

    .line 129
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    #getter for: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->mSIMInfoList:Ljava/util/List;
    invoke-static {v8}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$000(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;

    .line 131
    .restart local v5       #simInfo:Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;
    if-eqz v5, :cond_7

    .line 132
    iget-object v8, p0, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel$1;->this$0:Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;

    iget v9, v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    #calls: Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->findViewBySlotId(I)Lcom/android/systemui/statusbar/toolbar/SimIconView;
    invoke-static {v8, v9}, Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;->access$100(Lcom/android/systemui/statusbar/toolbar/SimSwitchPanel;I)Lcom/android/systemui/statusbar/toolbar/SimIconView;

    move-result-object v4

    .line 133
    .restart local v4       #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    if-eqz v4, :cond_7

    .line 134
    iget v8, v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mSimSlotId:I

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSlotId(I)V

    .line 135
    iget v8, v5, Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;->mColor:I

    invoke-virtual {v4, v8}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->setSimColor(I)V

    .line 136
    invoke-virtual {v4, v5}, Lcom/android/systemui/statusbar/toolbar/SimIconView;->updateSimIcon(Lcom/mediatek/telephony/SimInfoManager$SimInfoRecord;)V

    .line 128
    .end local v4           #simIconView:Lcom/android/systemui/statusbar/toolbar/SimIconView;
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 98
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
