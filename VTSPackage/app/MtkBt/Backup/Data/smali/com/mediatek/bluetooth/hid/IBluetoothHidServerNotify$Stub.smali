.class public abstract Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;
.super Landroid/os/Binder;
.source "IBluetoothHidServerNotify.java"

# interfaces
.implements Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

.field static final TRANSACTION_activateReq:I = 0x1

.field static final TRANSACTION_authorizeReq:I = 0xf

.field static final TRANSACTION_clearService:I = 0xe

.field static final TRANSACTION_connectReq:I = 0x3

.field static final TRANSACTION_deactivateReq:I = 0x2

.field static final TRANSACTION_disconnectReq:I = 0x4

.field static final TRANSACTION_finishActionReq:I = 0x10

.field static final TRANSACTION_getIdleReq:I = 0xc

.field static final TRANSACTION_getProtocolReq:I = 0xa

.field static final TRANSACTION_getReportReq:I = 0x8

.field static final TRANSACTION_getStateByAddr:I = 0xd

.field static final TRANSACTION_sendReportReq:I = 0x6

.field static final TRANSACTION_setIdleReq:I = 0xb

.field static final TRANSACTION_setProtocolReq:I = 0x9

.field static final TRANSACTION_setReportReq:I = 0x7

.field static final TRANSACTION_unplugReq:I = 0x5


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p0, p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;
    .locals 2
    .parameter "obj"

    .prologue
    .line 23
    if-nez p0, :cond_0

    .line 24
    const/4 v0, 0x0

    .line 30
    :goto_0
    return-object v0

    .line 26
    :cond_0
    const-string v1, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify;

    goto :goto_0

    .line 30
    :cond_1
    new-instance v0, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

    goto :goto_0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .prologue
    .line 34
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 5
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
    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_0

    .line 187
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    :goto_0
    return v3

    .line 42
    :sswitch_0
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p3, v4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :sswitch_1
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->activateReq()V

    .line 49
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 54
    :sswitch_2
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->deactivateReq()V

    .line 56
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 61
    :sswitch_3
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 63
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 64
    .local v0, _arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->connectReq(Ljava/lang/String;)V

    .line 65
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 70
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_4
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 73
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->disconnectReq(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 79
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_5
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 81
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 82
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->unplugReq(Ljava/lang/String;)V

    .line 83
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 88
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_6
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_0

    move v1, v3

    .line 93
    .local v1, _arg1:Z
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->sendReportReq(Ljava/lang/String;Z)V

    .line 94
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 99
    .end local v0           #_arg0:Ljava/lang/String;
    .end local v1           #_arg1:Z
    :sswitch_7
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 102
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->setReportReq(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 108
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_8
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 110
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 111
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->getReportReq(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 117
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_9
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 119
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 120
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->setProtocolReq(Ljava/lang/String;)V

    .line 121
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 126
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_a
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 128
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 129
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->getProtocolReq(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 135
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_b
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 137
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 138
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->setIdleReq(Ljava/lang/String;)V

    .line 139
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 144
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_c
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 146
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 147
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->getIdleReq(Ljava/lang/String;)V

    .line 148
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 153
    .end local v0           #_arg0:Ljava/lang/String;
    :sswitch_d
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 156
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->getStateByAddr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 157
    .local v2, _result:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 158
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 163
    .end local v0           #_arg0:Ljava/lang/String;
    .end local v2           #_result:Ljava/lang/String;
    :sswitch_e
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 164
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->clearService()V

    .line 165
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 170
    :sswitch_f
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 172
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 174
    .restart local v0       #_arg0:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v4

    if-eqz v4, :cond_1

    move v1, v3

    .line 175
    .restart local v1       #_arg1:Z
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->authorizeReq(Ljava/lang/String;Z)V

    .line 176
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 181
    .end local v0           #_arg0:Ljava/lang/String;
    .end local v1           #_arg1:Z
    :sswitch_10
    const-string v4, "com.mediatek.bluetooth.hid.IBluetoothHidServerNotify"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 182
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/hid/IBluetoothHidServerNotify$Stub;->finishActionReq()V

    .line 183
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 38
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_2
        0x3 -> :sswitch_3
        0x4 -> :sswitch_4
        0x5 -> :sswitch_5
        0x6 -> :sswitch_6
        0x7 -> :sswitch_7
        0x8 -> :sswitch_8
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
        0xd -> :sswitch_d
        0xe -> :sswitch_e
        0xf -> :sswitch_f
        0x10 -> :sswitch_10
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
