.class public abstract Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;
.super Landroid/os/Binder;
.source "IBTAvrcpMusicCallback.java"

# interfaces
.implements Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

.field static final TRANSACTION_notifyAppSettingChanged:I = 0x6

.field static final TRANSACTION_notifyNowPlayingContentChanged:I = 0x7

.field static final TRANSACTION_notifyPlaybackPosChanged:I = 0x5

.field static final TRANSACTION_notifyPlaybackStatus:I = 0x1

.field static final TRANSACTION_notifyTrackChanged:I = 0x2

.field static final TRANSACTION_notifyTrackReachEnd:I = 0x4

.field static final TRANSACTION_notifyTrackReachStart:I = 0x3

.field static final TRANSACTION_notifyVolumehanged:I = 0x8


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p0, p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
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
    const-string v1, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;

    goto :goto_0

    .line 30
    :cond_1
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    .locals 4
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
    const/4 v2, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_0

    .line 108
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v2

    :goto_0
    return v2

    .line 42
    :sswitch_0
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :sswitch_1
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readByte()B

    move-result v0

    .line 50
    .local v0, _arg0:B
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyPlaybackStatus(B)V

    .line 51
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 56
    .end local v0           #_arg0:B
    :sswitch_2
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    .line 59
    .local v0, _arg0:J
    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyTrackChanged(J)V

    .line 60
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 65
    .end local v0           #_arg0:J
    :sswitch_3
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 66
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyTrackReachStart()V

    .line 67
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 72
    :sswitch_4
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyTrackReachEnd()V

    .line 74
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 79
    :sswitch_5
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 80
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyPlaybackPosChanged()V

    .line 81
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 86
    :sswitch_6
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyAppSettingChanged()V

    .line 88
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 93
    :sswitch_7
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 94
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyNowPlayingContentChanged()V

    .line 95
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 100
    :sswitch_8
    const-string v3, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusicCallback"

    invoke-virtual {p2, v3}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p2}, Landroid/os/Parcel;->readByte()B

    move-result v0

    .line 103
    .local v0, _arg0:B
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->notifyVolumehanged(B)V

    .line 104
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

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
