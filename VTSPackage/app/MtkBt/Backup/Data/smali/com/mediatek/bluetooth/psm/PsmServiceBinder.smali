.class public interface abstract Lcom/mediatek/bluetooth/psm/PsmServiceBinder;
.super Ljava/lang/Object;
.source "PsmServiceBinder.java"


# virtual methods
.method public abstract getBinder()Landroid/os/IBinder;
.end method

.method public abstract onMessageReceived(Lcom/mediatek/bluetooth/psm/PsmMessage;)V
.end method

.method public abstract onServiceBind()V
.end method

.method public abstract onServiceDestroy()V
.end method
