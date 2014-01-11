.class public interface abstract Lcom/android/phone/NvRAMAgent;
.super Ljava/lang/Object;
.source "NvRAMAgent.java"

# interfaces
.implements Landroid/os/IInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/NvRAMAgent$Stub;
    }
.end annotation


# virtual methods
.method public abstract readFile(I)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method

.method public abstract writeFile(I[B)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation
.end method
