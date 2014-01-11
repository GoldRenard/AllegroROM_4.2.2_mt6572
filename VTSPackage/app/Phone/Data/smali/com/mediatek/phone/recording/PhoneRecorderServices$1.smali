.class Lcom/mediatek/phone/recording/PhoneRecorderServices$1;
.super Ljava/lang/Object;
.source "PhoneRecorderServices.java"

# interfaces
.implements Lcom/mediatek/phone/recording/Recorder$OnStateChangedListener;


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
    .line 98
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(I)V
    .locals 4
    .parameter "error"

    .prologue
    .line 119
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    iget-object v1, v1, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    if-eqz v1, :cond_0

    .line 121
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v2, "onError"

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 122
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    iget-object v1, v1, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    invoke-interface {v1, p1}, Lcom/mediatek/phone/recording/IPhoneRecordStateListener;->onError(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    :cond_0
    :goto_0
    return-void

    .line 123
    :catch_0
    move-exception v0

    .line 124
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "RecorderServices"

    const-string v2, "PhoneRecordService: call listener onError() failed"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onStateChanged(I)V
    .locals 6
    .parameter "state"

    .prologue
    .line 100
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStatus:I
    invoke-static {v3}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$000(Lcom/mediatek/phone/recording/PhoneRecorderServices;)I

    move-result v2

    .line 101
    .local v2, iPreviousStatus:I
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    #setter for: Lcom/mediatek/phone/recording/PhoneRecorderServices;->mPhoneRecorderStatus:I
    invoke-static {v3, p1}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->access$002(Lcom/mediatek/phone/recording/PhoneRecorderServices;I)I

    .line 102
    if-eq v2, p1, :cond_0

    .line 103
    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.android.phone.VoiceRecorder.STATE"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    .local v0, broadcastIntent:Landroid/content/Intent;
    const-string v3, "state"

    invoke-virtual {v0, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 105
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    invoke-virtual {v3, v0}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->sendBroadcast(Landroid/content/Intent;)V

    .line 106
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    iget-object v3, v3, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    if-eqz v3, :cond_0

    .line 108
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    const-string v4, "onStateChanged"

    invoke-virtual {v3, v4}, Lcom/mediatek/phone/recording/PhoneRecorderServices;->log(Ljava/lang/String;)V

    .line 109
    iget-object v3, p0, Lcom/mediatek/phone/recording/PhoneRecorderServices$1;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderServices;

    iget-object v3, v3, Lcom/mediatek/phone/recording/PhoneRecorderServices;->mStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    invoke-interface {v3, p1}, Lcom/mediatek/phone/recording/IPhoneRecordStateListener;->onStateChange(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 110
    .restart local v0       #broadcastIntent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 111
    .local v1, e:Landroid/os/RemoteException;
    const-string v3, "RecorderServices"

    const-string v4, "PhoneRecordService: call listener onStateChange failed"

    new-instance v5, Ljava/lang/IllegalStateException;

    invoke-direct {v5}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v3, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method
