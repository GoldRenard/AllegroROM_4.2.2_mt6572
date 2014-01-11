.class Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;
.super Landroid/os/Handler;
.source "PhoneInterfaceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/PhoneInterfaceManager$SimAuth;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;


# direct methods
.method constructor <init>(Lcom/android/phone/PhoneInterfaceManager$SimAuth;)V
    .locals 0
    .parameter

    .prologue
    .line 2901
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 2904
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 2905
    .local v0, ar:Landroid/os/AsyncResult;
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 2921
    :goto_0
    return-void

    .line 2908
    :pswitch_0
    const-string v1, "PhoneInterfaceManager"

    const-string v2, "SIM_AUTH_COMPLETE"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2909
    iget-object v2, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    monitor-enter v2

    .line 2910
    :try_start_0
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 2911
    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    const/4 v3, 0x0

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SimAuth;->mResult:Ljava/lang/String;
    invoke-static {v1, v3}, Lcom/android/phone/PhoneInterfaceManager$SimAuth;->access$1302(Lcom/android/phone/PhoneInterfaceManager$SimAuth;Ljava/lang/String;)Ljava/lang/String;

    .line 2915
    :goto_1
    const-string v1, "PhoneInterfaceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "SIM_AUTH_COMPLETE result is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$SimAuth;->mResult:Ljava/lang/String;
    invoke-static {v4}, Lcom/android/phone/PhoneInterfaceManager$SimAuth;->access$1300(Lcom/android/phone/PhoneInterfaceManager$SimAuth;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2916
    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    const/4 v3, 0x1

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SimAuth;->mDone:Z
    invoke-static {v1, v3}, Lcom/android/phone/PhoneInterfaceManager$SimAuth;->access$1402(Lcom/android/phone/PhoneInterfaceManager$SimAuth;Z)Z

    .line 2917
    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 2918
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 2913
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/android/phone/PhoneInterfaceManager$SimAuth$1;->this$0:Lcom/android/phone/PhoneInterfaceManager$SimAuth;

    iget-object v1, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    check-cast v1, Ljava/lang/String;

    #setter for: Lcom/android/phone/PhoneInterfaceManager$SimAuth;->mResult:Ljava/lang/String;
    invoke-static {v3, v1}, Lcom/android/phone/PhoneInterfaceManager$SimAuth;->access$1302(Lcom/android/phone/PhoneInterfaceManager$SimAuth;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 2905
    :pswitch_data_0
    .packed-switch 0xc8
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
