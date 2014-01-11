.class public abstract Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;
.super Landroid/os/Binder;
.source "IBTAvrcpService.java"

# interfaces
.implements Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

.field static final TRANSACTION_connect:I = 0x2

.field static final TRANSACTION_connectBrowse:I = 0x4

.field static final TRANSACTION_debugPTSAttributes:I = 0x8

.field static final TRANSACTION_disconnect:I = 0x3

.field static final TRANSACTION_disconnectBrowse:I = 0x5

.field static final TRANSACTION_getStatus:I = 0x1

.field static final TRANSACTION_selectPlayerId:I = 0x7

.field static final TRANSACTION_setDebugElementAttribute:I = 0x6


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p0, p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService;
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
    const-string v1, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService;

    goto :goto_0

    .line 30
    :cond_1
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_0

    .line 116
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    :goto_0
    return v3

    .line 42
    :sswitch_0
    const-string v2, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :sswitch_1
    const-string v2, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v2}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 48
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->getStatus()B

    move-result v1

    .line 49
    .local v1, _result:B
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 50
    invoke-virtual {p3, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_0

    .line 55
    .end local v1           #_result:B
    :sswitch_2
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p2}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 58
    .local v0, _arg0:Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->connect(Ljava/lang/String;)Z

    move-result v1

    .line 59
    .local v1, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 60
    if-eqz v1, :cond_0

    move v2, v3

    :cond_0
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 65
    .end local v0           #_arg0:Ljava/lang/String;
    .end local v1           #_result:Z
    :sswitch_3
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->disconnect()Z

    move-result v1

    .line 67
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 68
    if-eqz v1, :cond_1

    move v2, v3

    :cond_1
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 73
    .end local v1           #_result:Z
    :sswitch_4
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 74
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->connectBrowse()Z

    move-result v1

    .line 75
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 76
    if-eqz v1, :cond_2

    move v2, v3

    :cond_2
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 81
    .end local v1           #_result:Z
    :sswitch_5
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->disconnectBrowse()Z

    move-result v1

    .line 83
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    if-eqz v1, :cond_3

    move v2, v3

    :cond_3
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 89
    .end local v1           #_result:Z
    :sswitch_6
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->setDebugElementAttribute()Z

    move-result v1

    .line 91
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 92
    if-eqz v1, :cond_4

    move v2, v3

    :cond_4
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 97
    .end local v1           #_result:Z
    :sswitch_7
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 99
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 100
    .local v0, _arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->selectPlayerId(I)Z

    move-result v1

    .line 101
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 102
    if-eqz v1, :cond_5

    move v2, v3

    :cond_5
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 107
    .end local v0           #_arg0:I
    .end local v1           #_result:Z
    :sswitch_8
    const-string v4, "com.mediatek.bluetooth.avrcp.IBTAvrcpService"

    invoke-virtual {p2, v4}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 110
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpService$Stub;->debugPTSAttributes(I)Z

    move-result v1

    .line 111
    .restart local v1       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 112
    if-eqz v1, :cond_6

    move v2, v3

    :cond_6
    invoke-virtual {p3, v2}, Landroid/os/Parcel;->writeInt(I)V

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
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
