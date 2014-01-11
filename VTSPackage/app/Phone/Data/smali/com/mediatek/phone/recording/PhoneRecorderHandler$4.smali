.class Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;
.super Lcom/mediatek/phone/recording/IPhoneRecordStateListener$Stub;
.source "PhoneRecorderHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/recording/PhoneRecorderHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)V
    .locals 0
    .parameter

    .prologue
    .line 153
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-direct {p0}, Lcom/mediatek/phone/recording/IPhoneRecordStateListener$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(I)V
    .locals 3
    .parameter "iError"

    .prologue
    .line 171
    const/4 v0, 0x0

    .line 172
    .local v0, message:Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 184
    :goto_0
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 185
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 187
    :cond_0
    return-void

    .line 174
    :pswitch_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d000c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 176
    goto :goto_0

    .line 178
    :pswitch_1
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 180
    goto :goto_0

    .line 172
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onStateChange(I)V
    .locals 3
    .parameter "state"

    .prologue
    .line 159
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStateChange, state is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    .line 160
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #setter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorderState:I
    invoke-static {v0, p1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$602(Lcom/mediatek/phone/recording/PhoneRecorderHandler;I)I

    .line 161
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$700(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mListener:Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$700(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$4;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mCustomValue:I
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$800(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)I

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler$Listener;->requestUpdateRecordState(II)V

    .line 164
    :cond_0
    return-void
.end method
