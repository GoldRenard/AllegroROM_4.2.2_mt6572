.class Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper$1;
.super Landroid/os/Handler;
.source "PhoneInterfaceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;


# direct methods
.method constructor <init>(Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 4229
    iput-object p1, p0, Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper$1;->this$1:Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    .line 4233
    :try_start_0
    const-string v1, "PhoneInterfaceManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MessengerWrapper callback triggered: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 4234
    iget-object v1, p0, Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper$1;->this$1:Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;

    #getter for: Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;->mMessenger:Landroid/os/Messenger;
    invoke-static {v1}, Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;->access$1800(Lcom/android/phone/PhoneInterfaceManager$MessengerWrapper;)Landroid/os/Messenger;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-static {p0, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4238
    :goto_0
    return-void

    .line 4235
    :catch_0
    move-exception v0

    .line 4236
    .local v0, e:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method
