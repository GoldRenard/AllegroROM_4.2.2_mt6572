.class Lcom/mediatek/settings/NetworkSettingList$4;
.super Lcom/android/phone/INetworkQueryServiceCallback$Stub;
.source "NetworkSettingList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/NetworkSettingList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/NetworkSettingList;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/NetworkSettingList;)V
    .locals 0
    .parameter

    .prologue
    .line 288
    iput-object p1, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    invoke-direct {p0}, Lcom/android/phone/INetworkQueryServiceCallback$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryComplete(Ljava/util/List;I)V
    .locals 5
    .parameter
    .parameter "status"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/OperatorInfo;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 293
    .local p1, networkInfoArray:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/OperatorInfo;>;"
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    const-string v3, "notifying message loop of query completion."

    #calls: Lcom/mediatek/settings/NetworkSettingList;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkSettingList;->access$100(Lcom/mediatek/settings/NetworkSettingList;Ljava/lang/String;)V

    .line 298
    const/16 v1, 0x64

    .line 299
    .local v1, what:I
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #getter for: Lcom/mediatek/settings/NetworkSettingList;->mSimId:I
    invoke-static {v2}, Lcom/mediatek/settings/NetworkSettingList;->access$400(Lcom/mediatek/settings/NetworkSettingList;)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 313
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mSimId = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #getter for: Lcom/mediatek/settings/NetworkSettingList;->mSimId:I
    invoke-static {v4}, Lcom/mediatek/settings/NetworkSettingList;->access$400(Lcom/mediatek/settings/NetworkSettingList;)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " error!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    #calls: Lcom/mediatek/settings/NetworkSettingList;->log(Ljava/lang/String;)V
    invoke-static {v2, v3}, Lcom/mediatek/settings/NetworkSettingList;->access$100(Lcom/mediatek/settings/NetworkSettingList;Ljava/lang/String;)V

    .line 317
    :goto_0
    iget-object v2, p0, Lcom/mediatek/settings/NetworkSettingList$4;->this$0:Lcom/mediatek/settings/NetworkSettingList;

    #getter for: Lcom/mediatek/settings/NetworkSettingList;->mHandler:Landroid/os/Handler;
    invoke-static {v2}, Lcom/mediatek/settings/NetworkSettingList;->access$1000(Lcom/mediatek/settings/NetworkSettingList;)Landroid/os/Handler;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, p2, v3, p1}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 318
    .local v0, msg:Landroid/os/Message;
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 319
    return-void

    .line 301
    .end local v0           #msg:Landroid/os/Message;
    :pswitch_0
    const/16 v1, 0x64

    .line 302
    goto :goto_0

    .line 304
    :pswitch_1
    const/16 v1, 0x65

    .line 305
    goto :goto_0

    .line 307
    :pswitch_2
    const/16 v1, 0x66

    .line 308
    goto :goto_0

    .line 310
    :pswitch_3
    const/16 v1, 0x67

    .line 311
    goto :goto_0

    .line 299
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
