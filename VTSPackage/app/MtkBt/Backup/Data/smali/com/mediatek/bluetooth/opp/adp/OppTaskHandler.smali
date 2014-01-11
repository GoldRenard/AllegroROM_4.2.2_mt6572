.class public interface abstract Lcom/mediatek/bluetooth/opp/adp/OppTaskHandler;
.super Ljava/lang/Object;
.source "OppTaskHandler.java"


# virtual methods
.method public abstract afterWait()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract beforeWait()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method

.method public abstract onObjectChange(Lcom/mediatek/bluetooth/share/BluetoothShareTask;)V
.end method
