.class public Lcom/android/settings/TVOutReceiver;
.super Landroid/content/BroadcastReceiver;
.source "TVOutReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 15
    const/4 v0, 0x0

    .line 16
    .local v0, mTvOut:Lcom/mediatek/common/tvout/ITVOUTNative;
    if-nez v0, :cond_0

    .line 17
    const-class v1, Lcom/mediatek/common/tvout/ITVOUTNative;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lcom/mediatek/common/MediatekClassFactory;->createInstance(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0           #mTvOut:Lcom/mediatek/common/tvout/ITVOUTNative;
    check-cast v0, Lcom/mediatek/common/tvout/ITVOUTNative;

    .line 20
    .restart local v0       #mTvOut:Lcom/mediatek/common/tvout/ITVOUTNative;
    :cond_0
    invoke-interface {v0}, Lcom/mediatek/common/tvout/ITVOUTNative;->IPOPowerOff()Z

    .line 21
    return-void
.end method
