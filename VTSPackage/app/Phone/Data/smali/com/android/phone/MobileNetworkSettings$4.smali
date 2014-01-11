.class Lcom/android/phone/MobileNetworkSettings$4;
.super Landroid/os/Handler;
.source "MobileNetworkSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/phone/MobileNetworkSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/phone/MobileNetworkSettings;


# direct methods
.method constructor <init>(Lcom/android/phone/MobileNetworkSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 323
    iput-object p1, p0, Lcom/android/phone/MobileNetworkSettings$4;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 325
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x7d1

    if-ne v0, v1, :cond_0

    .line 326
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings$4;->this$0:Lcom/android/phone/MobileNetworkSettings;

    const/16 v1, 0x190

    invoke-virtual {v0, v1}, Lcom/android/phone/MobileNetworkSettings;->removeDialog(I)V

    .line 327
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings$4;->this$0:Lcom/android/phone/MobileNetworkSettings;

    const/4 v1, 0x0

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z
    invoke-static {v0, v1}, Lcom/android/phone/MobileNetworkSettings;->access$402(Lcom/android/phone/MobileNetworkSettings;Z)Z

    .line 328
    iget-object v0, p0, Lcom/android/phone/MobileNetworkSettings$4;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #calls: Lcom/android/phone/MobileNetworkSettings;->setDataConnPref()V
    invoke-static {v0}, Lcom/android/phone/MobileNetworkSettings;->access$200(Lcom/android/phone/MobileNetworkSettings;)V

    .line 330
    :cond_0
    return-void
.end method
