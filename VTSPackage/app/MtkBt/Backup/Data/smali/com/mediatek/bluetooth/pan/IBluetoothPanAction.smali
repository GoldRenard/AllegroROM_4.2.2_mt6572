.class public interface abstract Lcom/mediatek/bluetooth/pan/IBluetoothPanAction;
.super Ljava/lang/Object;
.source "IBluetoothPanAction.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/pan/IBluetoothPanAction$Stub;
    }
.end annotation


# virtual methods
.method public abstract authorizeRspAction(Ljava/lang/String;Z)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract disconnectPanDeviceAction(Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
