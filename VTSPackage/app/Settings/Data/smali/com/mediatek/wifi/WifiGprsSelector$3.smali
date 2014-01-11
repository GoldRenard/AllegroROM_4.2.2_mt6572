.class Lcom/mediatek/wifi/WifiGprsSelector$3;
.super Landroid/telephony/PhoneStateListener;
.source "WifiGprsSelector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/wifi/WifiGprsSelector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/wifi/WifiGprsSelector;


# direct methods
.method constructor <init>(Lcom/mediatek/wifi/WifiGprsSelector;)V
    .locals 0
    .parameter

    .prologue
    .line 212
    iput-object p1, p0, Lcom/mediatek/wifi/WifiGprsSelector$3;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceStateChanged(Landroid/telephony/ServiceState;)V
    .locals 2
    .parameter "serviceState"

    .prologue
    .line 216
    invoke-super {p0, p1}, Landroid/telephony/PhoneStateListener;->onServiceStateChanged(Landroid/telephony/ServiceState;)V

    .line 218
    iget-object v1, p0, Lcom/mediatek/wifi/WifiGprsSelector$3;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    iget-object v0, p0, Lcom/mediatek/wifi/WifiGprsSelector$3;->this$0:Lcom/mediatek/wifi/WifiGprsSelector;

    #getter for: Lcom/mediatek/wifi/WifiGprsSelector;->mTelephonyManager:Landroid/telephony/TelephonyManager;
    invoke-static {v0}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1200(Lcom/mediatek/wifi/WifiGprsSelector;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getCallState()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    #setter for: Lcom/mediatek/wifi/WifiGprsSelector;->mIsCallStateIdle:Z
    invoke-static {v1, v0}, Lcom/mediatek/wifi/WifiGprsSelector;->access$1102(Lcom/mediatek/wifi/WifiGprsSelector;Z)Z

    .line 220
    return-void

    .line 218
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
