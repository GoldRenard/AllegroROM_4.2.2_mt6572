.class Lcom/mediatek/settings/FdnSetting2$1;
.super Landroid/os/Handler;
.source "FdnSetting2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/FdnSetting2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/settings/FdnSetting2;


# direct methods
.method constructor <init>(Lcom/mediatek/settings/FdnSetting2;)V
    .locals 0
    .parameter

    .prologue
    .line 291
    iput-object p1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 294
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 318
    :goto_0
    return-void

    .line 298
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 299
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 300
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #calls: Lcom/mediatek/settings/FdnSetting2;->getRetryPin2Count()I
    invoke-static {v1}, Lcom/mediatek/settings/FdnSetting2;->access$100(Lcom/mediatek/settings/FdnSetting2;)I

    move-result v1

    if-nez v1, :cond_0

    .line 301
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    const v2, 0x7f0d02b4

    #calls: Lcom/mediatek/settings/FdnSetting2;->displayMessage(I)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/FdnSetting2;->access$200(Lcom/mediatek/settings/FdnSetting2;I)V

    .line 302
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "EVENT_PIN2_ENTRY_COMPLETE,puk2_requested"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #calls: Lcom/mediatek/settings/FdnSetting2;->updateFDNPreference()V
    invoke-static {v1}, Lcom/mediatek/settings/FdnSetting2;->access$300(Lcom/mediatek/settings/FdnSetting2;)V

    .line 311
    :goto_1
    const-string v1, "Settings/FdnSetting2"

    const-string v2, "EVENT_PIN2_ENTRY_COMPLETE"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    iget-object v2, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mRetryPin2New:I
    invoke-static {v2}, Lcom/mediatek/settings/FdnSetting2;->access$800(Lcom/mediatek/settings/FdnSetting2;)I

    move-result v2

    #setter for: Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I
    invoke-static {v1, v2}, Lcom/mediatek/settings/FdnSetting2;->access$702(Lcom/mediatek/settings/FdnSetting2;I)I

    .line 313
    const-string v1, "Settings/FdnSetting2"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "EVENT_PIN2_ENTRY_COMPLETE mRetryPin2Old="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mRetryPin2Old:I
    invoke-static {v3}, Lcom/mediatek/settings/FdnSetting2;->access$700(Lcom/mediatek/settings/FdnSetting2;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 305
    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    const v2, 0x7f0d0290

    #calls: Lcom/mediatek/settings/FdnSetting2;->resetFDNDialog(I)V
    invoke-static {v1, v2}, Lcom/mediatek/settings/FdnSetting2;->access$400(Lcom/mediatek/settings/FdnSetting2;I)V

    .line 306
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #getter for: Lcom/mediatek/settings/FdnSetting2;->mButtonEnableFDN:Lcom/android/phone/EditPinPreference;
    invoke-static {v1}, Lcom/mediatek/settings/FdnSetting2;->access$500(Lcom/mediatek/settings/FdnSetting2;)Lcom/android/phone/EditPinPreference;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/EditPinPreference;->showPinDialog()V

    goto :goto_1

    .line 309
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/FdnSetting2$1;->this$0:Lcom/mediatek/settings/FdnSetting2;

    #calls: Lcom/mediatek/settings/FdnSetting2;->updateEnableFDN()V
    invoke-static {v1}, Lcom/mediatek/settings/FdnSetting2;->access$600(Lcom/mediatek/settings/FdnSetting2;)V

    goto :goto_1

    .line 294
    nop

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_0
    .end packed-switch
.end method
