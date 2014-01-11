.class Lcom/android/phone/BluetoothPhoneService$1;
.super Landroid/bluetooth/IBluetoothHeadsetPhone$Stub;
.source "BluetoothPhoneService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/BluetoothPhoneService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/BluetoothPhoneService;


# direct methods
.method constructor <init>(Lcom/android/phone/BluetoothPhoneService;)V
    .locals 0
    .parameter

    .prologue
    .line 83
    iput-object p1, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    invoke-direct {p0}, Landroid/bluetooth/IBluetoothHeadsetPhone$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public answerCall()Z
    .locals 3

    .prologue
    .line 85
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public cdmaSetSecondCallState(Z)V
    .locals 3
    .parameter "state"

    .prologue
    .line 146
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    const-string v0, "BluetoothPhoneService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cdmaSetSecondCallState("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    #getter for: Lcom/android/phone/BluetoothPhoneService;->mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;
    invoke-static {v0}, Lcom/android/phone/BluetoothPhoneService;->access$000(Lcom/android/phone/BluetoothPhoneService;)Lcom/android/phone/BluetoothHandsfree;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/phone/BluetoothHandsfree;->cdmaSetSecondCallState(Z)V

    .line 149
    return-void
.end method

.method public cdmaSwapSecondCallState()V
    .locals 3

    .prologue
    .line 140
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    const-string v0, "BluetoothPhoneService"

    const-string v1, "cdmaSwapSecondCallState()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    #getter for: Lcom/android/phone/BluetoothPhoneService;->mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;
    invoke-static {v0}, Lcom/android/phone/BluetoothPhoneService;->access$000(Lcom/android/phone/BluetoothPhoneService;)Lcom/android/phone/BluetoothHandsfree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/BluetoothHandsfree;->cdmaSwapSecondCallState()V

    .line 143
    return-void
.end method

.method public getNetworkOperator()Ljava/lang/String;
    .locals 3

    .prologue
    .line 109
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    const-string v0, ""

    return-object v0
.end method

.method public getSubscriberNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    const-string v0, ""

    return-object v0
.end method

.method public hangupCall()Z
    .locals 3

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    const/4 v0, 0x0

    return v0
.end method

.method public listCurrentCalls()Z
    .locals 3

    .prologue
    .line 121
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public processChld(I)Z
    .locals 3
    .parameter "chld"

    .prologue
    .line 103
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const/4 v0, 0x0

    return v0
.end method

.method public queryPhoneState()Z
    .locals 3

    .prologue
    .line 127
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const/4 v0, 0x0

    return v0
.end method

.method public sendDtmf(I)Z
    .locals 3
    .parameter "dtmf"

    .prologue
    .line 97
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    const/4 v0, 0x0

    return v0
.end method

.method public updateBtHandsfreeAfterRadioTechnologyChange()V
    .locals 3

    .prologue
    .line 134
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    const-string v1, "android.permission.MODIFY_PHONE_STATE"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/android/phone/BluetoothPhoneService;->enforceCallingOrSelfPermission(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    const-string v0, "BluetoothPhoneService"

    const-string v1, "updateBtHandsfreeAfterRadioTechnologyChange()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    iget-object v0, p0, Lcom/android/phone/BluetoothPhoneService$1;->this$0:Lcom/android/phone/BluetoothPhoneService;

    #getter for: Lcom/android/phone/BluetoothPhoneService;->mBtHandsfree:Lcom/android/phone/BluetoothHandsfree;
    invoke-static {v0}, Lcom/android/phone/BluetoothPhoneService;->access$000(Lcom/android/phone/BluetoothPhoneService;)Lcom/android/phone/BluetoothHandsfree;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/phone/BluetoothHandsfree;->updateBtHandsfreeAfterRadioTechnologyChange()V

    .line 137
    return-void
.end method
