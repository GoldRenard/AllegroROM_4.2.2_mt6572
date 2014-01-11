.class Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;
.super Ljava/lang/Object;
.source "PhoneRecorderHandler.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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
    .line 132
    iput-object p1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .parameter "className"
    .parameter "service"

    .prologue
    .line 134
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    invoke-static {p2}, Lcom/mediatek/phone/recording/IPhoneRecorder$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    move-result-object v2

    #setter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v1, v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$102(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Lcom/mediatek/phone/recording/IPhoneRecorder;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    .line 136
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const-string v2, "onServiceConnected"

    #calls: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->log(Ljava/lang/String;)V
    invoke-static {v1, v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$200(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Ljava/lang/String;)V

    .line 137
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 138
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecordStateListener:Lcom/mediatek/phone/recording/IPhoneRecordStateListener;
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$300(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecordStateListener;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mediatek/phone/recording/IPhoneRecorder;->listen(Lcom/mediatek/phone/recording/IPhoneRecordStateListener;)V

    .line 139
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$100(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    move-result-object v1

    invoke-interface {v1}, Lcom/mediatek/phone/recording/IPhoneRecorder;->startRecord()V

    .line 140
    iget-object v1, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mHandler:Landroid/os/Handler;
    invoke-static {v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$500(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Landroid/os/Handler;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    #getter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mRecordDiskCheck:Ljava/lang/Runnable;
    invoke-static {v2}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$400(Lcom/mediatek/phone/recording/PhoneRecorderHandler;)Ljava/lang/Runnable;

    move-result-object v2

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    :cond_0
    :goto_0
    return-void

    .line 142
    :catch_0
    move-exception v0

    .line 143
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "PhoneRecorderHandler"

    const-string v2, "onServiceConnected: couldn\'t register to record service"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "className"

    .prologue
    .line 149
    iget-object v0, p0, Lcom/mediatek/phone/recording/PhoneRecorderHandler$3;->this$0:Lcom/mediatek/phone/recording/PhoneRecorderHandler;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/phone/recording/PhoneRecorderHandler;->mPhoneRecorder:Lcom/mediatek/phone/recording/IPhoneRecorder;
    invoke-static {v0, v1}, Lcom/mediatek/phone/recording/PhoneRecorderHandler;->access$102(Lcom/mediatek/phone/recording/PhoneRecorderHandler;Lcom/mediatek/phone/recording/IPhoneRecorder;)Lcom/mediatek/phone/recording/IPhoneRecorder;

    .line 150
    return-void
.end method
