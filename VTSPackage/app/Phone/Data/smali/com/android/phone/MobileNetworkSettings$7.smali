.class Lcom/android/phone/MobileNetworkSettings$7;
.super Ljava/lang/Object;
.source "MobileNetworkSettings.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/phone/MobileNetworkSettings;->onCreateDialog(I)Landroid/app/Dialog;
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
    .line 895
    iput-object p1, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    const/4 v1, 0x1

    .line 898
    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #setter for: Lcom/android/phone/MobileNetworkSettings;->mIsChangeData:Z
    invoke-static {v2, v1}, Lcom/android/phone/MobileNetworkSettings;->access$402(Lcom/android/phone/MobileNetworkSettings;Z)Z

    .line 899
    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;
    invoke-static {v2}, Lcom/android/phone/MobileNetworkSettings;->access$1200(Lcom/android/phone/MobileNetworkSettings;)Landroid/net/ConnectivityManager;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 900
    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    const/16 v3, 0x190

    invoke-virtual {v2, v3}, Lcom/android/phone/MobileNetworkSettings;->showDialog(I)V

    .line 901
    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;
    invoke-static {v2}, Lcom/android/phone/MobileNetworkSettings;->access$1200(Lcom/android/phone/MobileNetworkSettings;)Landroid/net/ConnectivityManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v0

    .line 902
    .local v0, isConnected:Z
    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    #getter for: Lcom/android/phone/MobileNetworkSettings;->mConnService:Landroid/net/ConnectivityManager;
    invoke-static {v2}, Lcom/android/phone/MobileNetworkSettings;->access$1200(Lcom/android/phone/MobileNetworkSettings;)Landroid/net/ConnectivityManager;

    move-result-object v2

    if-nez v0, :cond_1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/net/ConnectivityManager;->setMobileDataEnabled(Z)V

    .line 903
    iget-object v1, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    iget-object v1, v1, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/phone/MobileNetworkSettings$7;->this$0:Lcom/android/phone/MobileNetworkSettings;

    iget-object v2, v2, Lcom/android/phone/MobileNetworkSettings;->mH:Landroid/os/Handler;

    const/16 v3, 0x7d1

    invoke-virtual {v2, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 905
    .end local v0           #isConnected:Z
    :cond_0
    return-void

    .line 902
    .restart local v0       #isConnected:Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
