.class Lcom/mediatek/phone/recording/PhoneRecorderServices$2;
.super Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;
.source "PhoneRecorderServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/phone/recording/PhoneRecorderServices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/recording/PhoneRecorderServices;)V
    .locals 0
    .parameter

    .prologue
    .line 131
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    invoke-direct {p0}, Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public listen(Lcom/mediatek/phone/recording/IPhoneRecordStateListener;)V
    .locals 2
    .parameter "callback"

    .prologue
    .line 133
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v1, "listen"

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 134
    if-eqz p1, :cond_0

    .line 135
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    iput-object p1, v0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    .line 137
    :cond_0
    return-void
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 140
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v1, "remove"

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 141
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    .line 142
    return-void
.end method

.method public startRecord()V
    .locals 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v1, "startRecord"

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderServices;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderServices;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/phone/recording/PhoneRecorder;->startRecord()V

    .line 149
    :cond_0
    return-void
.end method

.method public stopRecord(Z)V
    .locals 2
    .parameter "isMounted"

    .prologue
    .line 152
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v1, "stopRecord"

    invoke-virtual {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderServices;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    invoke-static {v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderServices;)Lcom/mediatek/phone/recording/PhoneRecorder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mediatek/phone/recording/PhoneRecorder;->stopRecord(Z)V

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$2;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorder:Lcom/mediatek/phone/recording/PhoneRecorder;
    invoke-static {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$102(Lcom/mediatek/phone/recording/PhoneRecorderServices;Lcom/mediatek/phone/recording/PhoneRecorder;)Lcom/mediatek/phone/recording/PhoneRecorder;

    .line 157
    return-void
.end method
