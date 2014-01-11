.class public abstract Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub;
.super Landroid/os/Binder;
.source "IPhoneStatesMgrService.java"

# interfaces
.implements Lcom/mediatek/CellConnService/IPhoneStatesMgrService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/CellConnService/IPhoneStatesMgrService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.mediatek.CellConnService.IPhoneStatesMgrService"

.field static final TRANSACTION_verifyPhoneState:I = 0x1


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.mediatek.CellConnService.IPhoneStatesMgrService"

    invoke-virtual {p0, p0, v0}, Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/mediatek/CellConnService/IPhoneStatesMgrService;
    .registers 3
    .parameter "obj"

    .prologue
    .line 23
    if-nez p0, :cond_4

    .line 24
    const/4 v0, 0x0

    .line 30
    :goto_3
    return-object v0

    .line 26
    :cond_4
    const-string v1, "com.mediatek.CellConnService.IPhoneStatesMgrService"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    if-eqz v1, :cond_13

    .line 28
    check-cast v0, Lcom/mediatek/CellConnService/IPhoneStatesMgrService;

    goto :goto_3

    .line 30
    :cond_13
    new-instance v0, Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    .prologue
    .line 34
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 11
    .parameter "code"
    .parameter "data"
    .parameter "reply"
    .parameter "flags"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_30

    .line 60
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v4

    :goto_8
    return v4

    .line 42
    :sswitch_9
    const-string v5, "com.mediatek.CellConnService.IPhoneStatesMgrService"

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_8

    .line 47
    :sswitch_f
    const-string v5, "com.mediatek.CellConnService.IPhoneStatesMgrService"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 51
    .local v0, _arg0:I
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 53
    .local v1, _arg1:I
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/CellConnService/IPhoneStatesCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/CellConnService/IPhoneStatesCallback;

    move-result-object v2

    .line 54
    .local v2, _arg2:Lcom/mediatek/CellConnService/IPhoneStatesCallback;
    invoke-virtual {p0, v0, v1, v2}, Lcom/mediatek/CellConnService/IPhoneStatesMgrService$Stub;->verifyPhoneState(IILcom/mediatek/CellConnService/IPhoneStatesCallback;)I

    move-result v3

    .line 55
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 56
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_8

    .line 38
    nop

    :sswitch_data_30
    .sparse-switch
        0x1 -> :sswitch_f
        0x5f4e5446 -> :sswitch_9
    .end sparse-switch
.end method
