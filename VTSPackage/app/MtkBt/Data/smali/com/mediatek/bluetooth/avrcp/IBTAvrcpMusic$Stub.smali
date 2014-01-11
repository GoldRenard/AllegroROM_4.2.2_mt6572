.class public abstract Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;
.super Landroid/os/Binder;
.source "IBTAvrcpMusic.java"

# interfaces
.implements Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Stub"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub$Proxy;
    }
.end annotation


# static fields
.field private static final DESCRIPTOR:Ljava/lang/String; = "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

.field static final TRANSACTION_duration:I = 0x1a

.field static final TRANSACTION_enqueue:I = 0x20

.field static final TRANSACTION_getAlbumId:I = 0x1e

.field static final TRANSACTION_getAlbumName:I = 0x1d

.field static final TRANSACTION_getArtistName:I = 0x1f

.field static final TRANSACTION_getAudioId:I = 0x1b

.field static final TRANSACTION_getCapabilities:I = 0x5

.field static final TRANSACTION_getEqualizeMode:I = 0xf

.field static final TRANSACTION_getNowPlaying:I = 0x21

.field static final TRANSACTION_getNowPlayingItemName:I = 0x22

.field static final TRANSACTION_getPlayStatus:I = 0x18

.field static final TRANSACTION_getQueuePosition:I = 0x24

.field static final TRANSACTION_getRepeatMode:I = 0x13

.field static final TRANSACTION_getScanMode:I = 0x15

.field static final TRANSACTION_getShuffleMode:I = 0x11

.field static final TRANSACTION_getTrackName:I = 0x1c

.field static final TRANSACTION_informBatteryStatusOfCT:I = 0x17

.field static final TRANSACTION_informDisplayableCharacterSet:I = 0x16

.field static final TRANSACTION_next:I = 0xb

.field static final TRANSACTION_nextGroup:I = 0xd

.field static final TRANSACTION_open:I = 0x23

.field static final TRANSACTION_pause:I = 0x8

.field static final TRANSACTION_play:I = 0x6

.field static final TRANSACTION_position:I = 0x19

.field static final TRANSACTION_prev:I = 0xa

.field static final TRANSACTION_prevGroup:I = 0xc

.field static final TRANSACTION_regNotificationEvent:I = 0x3

.field static final TRANSACTION_registerCallback:I = 0x1

.field static final TRANSACTION_resume:I = 0x9

.field static final TRANSACTION_setEqualizeMode:I = 0xe

.field static final TRANSACTION_setPlayerApplicationSettingValue:I = 0x4

.field static final TRANSACTION_setQueuePosition:I = 0x25

.field static final TRANSACTION_setRepeatMode:I = 0x12

.field static final TRANSACTION_setScanMode:I = 0x14

.field static final TRANSACTION_setShuffleMode:I = 0x10

.field static final TRANSACTION_stop:I = 0x7

.field static final TRANSACTION_unregisterCallback:I = 0x2


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 15
    const-string v0, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p0, p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public static asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
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
    const-string v1, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-interface {p0, v1}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    .line 27
    .local v0, iin:Landroid/os/IInterface;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    if-eqz v1, :cond_1

    .line 28
    check-cast v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    goto :goto_0

    .line 30
    :cond_1
    new-instance v0, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub$Proxy;

    .end local v0           #iin:Landroid/os/IInterface;
    invoke-direct {v0, p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub$Proxy;-><init>(Landroid/os/IBinder;)V

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
    .locals 8
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
    const/4 v5, 0x0

    const/4 v6, 0x1

    .line 38
    sparse-switch p1, :sswitch_data_0

    .line 363
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v6

    :goto_0
    return v6

    .line 42
    :sswitch_0
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_0

    .line 47
    :sswitch_1
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 49
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;

    move-result-object v0

    .line 50
    .local v0, _arg0:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->registerCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V

    .line 51
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 56
    .end local v0           #_arg0:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
    :sswitch_2
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 58
    invoke-virtual {p2}, Landroid/os/Parcel;->readStrongBinder()Landroid/os/IBinder;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;

    move-result-object v0

    .line 59
    .restart local v0       #_arg0:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->unregisterCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V

    .line 60
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 65
    .end local v0           #_arg0:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;
    :sswitch_3
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 67
    invoke-virtual {p2}, Landroid/os/Parcel;->readByte()B

    move-result v0

    .line 69
    .local v0, _arg0:B
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 70
    .local v2, _arg1:I
    invoke-virtual {p0, v0, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->regNotificationEvent(BI)Z

    move-result v3

    .line 71
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 72
    if-eqz v3, :cond_0

    move v5, v6

    :cond_0
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 77
    .end local v0           #_arg0:B
    .end local v2           #_arg1:I
    .end local v3           #_result:Z
    :sswitch_4
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 79
    invoke-virtual {p2}, Landroid/os/Parcel;->readByte()B

    move-result v0

    .line 81
    .restart local v0       #_arg0:B
    invoke-virtual {p2}, Landroid/os/Parcel;->readByte()B

    move-result v2

    .line 82
    .local v2, _arg1:B
    invoke-virtual {p0, v0, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setPlayerApplicationSettingValue(BB)Z

    move-result v3

    .line 83
    .restart local v3       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 84
    if-eqz v3, :cond_1

    move v5, v6

    :cond_1
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 89
    .end local v0           #_arg0:B
    .end local v2           #_arg1:B
    .end local v3           #_result:Z
    :sswitch_5
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getCapabilities()[B

    move-result-object v3

    .line 91
    .local v3, _result:[B
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 92
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeByteArray([B)V

    goto :goto_0

    .line 97
    .end local v3           #_result:[B
    :sswitch_6
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->play()V

    .line 99
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto :goto_0

    .line 104
    :sswitch_7
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->stop()V

    .line 106
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 111
    :sswitch_8
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->pause()V

    .line 113
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 118
    :sswitch_9
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 119
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->resume()V

    .line 120
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 125
    :sswitch_a
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 126
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->prev()V

    .line 127
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 132
    :sswitch_b
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->next()V

    .line 134
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 139
    :sswitch_c
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 140
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->prevGroup()V

    .line 141
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 146
    :sswitch_d
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->nextGroup()V

    .line 148
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 153
    :sswitch_e
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 156
    .local v0, _arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setEqualizeMode(I)Z

    move-result v3

    .line 157
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 158
    if-eqz v3, :cond_2

    move v5, v6

    :cond_2
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 163
    .end local v0           #_arg0:I
    .end local v3           #_result:Z
    :sswitch_f
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 164
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getEqualizeMode()I

    move-result v3

    .line 165
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 166
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 171
    .end local v3           #_result:I
    :sswitch_10
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 173
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 174
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setShuffleMode(I)Z

    move-result v3

    .line 175
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 176
    if-eqz v3, :cond_3

    move v5, v6

    :cond_3
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 181
    .end local v0           #_arg0:I
    .end local v3           #_result:Z
    :sswitch_11
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 182
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getShuffleMode()I

    move-result v3

    .line 183
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 184
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 189
    .end local v3           #_result:I
    :sswitch_12
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 191
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 192
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setRepeatMode(I)Z

    move-result v3

    .line 193
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 194
    if-eqz v3, :cond_4

    move v5, v6

    :cond_4
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 199
    .end local v0           #_arg0:I
    .end local v3           #_result:Z
    :sswitch_13
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 200
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getRepeatMode()I

    move-result v3

    .line 201
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 202
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 207
    .end local v3           #_result:I
    :sswitch_14
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 209
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 210
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setScanMode(I)Z

    move-result v3

    .line 211
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 212
    if-eqz v3, :cond_5

    move v5, v6

    :cond_5
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 217
    .end local v0           #_arg0:I
    .end local v3           #_result:Z
    :sswitch_15
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 218
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getScanMode()I

    move-result v3

    .line 219
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 220
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 225
    .end local v3           #_result:I
    :sswitch_16
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 227
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 228
    .restart local v0       #_arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->informDisplayableCharacterSet(I)Z

    move-result v3

    .line 229
    .local v3, _result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 230
    if-eqz v3, :cond_6

    move v5, v6

    :cond_6
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 235
    .end local v0           #_arg0:I
    .end local v3           #_result:Z
    :sswitch_17
    const-string v7, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v7}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 236
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->informBatteryStatusOfCT()Z

    move-result v3

    .line 237
    .restart local v3       #_result:Z
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 238
    if-eqz v3, :cond_7

    move v5, v6

    :cond_7
    invoke-virtual {p3, v5}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 243
    .end local v3           #_result:Z
    :sswitch_18
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 244
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getPlayStatus()B

    move-result v3

    .line 245
    .local v3, _result:B
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 246
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeByte(B)V

    goto/16 :goto_0

    .line 251
    .end local v3           #_result:B
    :sswitch_19
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 252
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->position()J

    move-result-wide v3

    .line 253
    .local v3, _result:J
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 254
    invoke-virtual {p3, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_0

    .line 259
    .end local v3           #_result:J
    :sswitch_1a
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 260
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->duration()J

    move-result-wide v3

    .line 261
    .restart local v3       #_result:J
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 262
    invoke-virtual {p3, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_0

    .line 267
    .end local v3           #_result:J
    :sswitch_1b
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getAudioId()J

    move-result-wide v3

    .line 269
    .restart local v3       #_result:J
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 270
    invoke-virtual {p3, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_0

    .line 275
    .end local v3           #_result:J
    :sswitch_1c
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 276
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getTrackName()Ljava/lang/String;

    move-result-object v3

    .line 277
    .local v3, _result:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 278
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 283
    .end local v3           #_result:Ljava/lang/String;
    :sswitch_1d
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 284
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getAlbumName()Ljava/lang/String;

    move-result-object v3

    .line 285
    .restart local v3       #_result:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 286
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 291
    .end local v3           #_result:Ljava/lang/String;
    :sswitch_1e
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 292
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getAlbumId()J

    move-result-wide v3

    .line 293
    .local v3, _result:J
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 294
    invoke-virtual {p3, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    goto/16 :goto_0

    .line 299
    .end local v3           #_result:J
    :sswitch_1f
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 300
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getArtistName()Ljava/lang/String;

    move-result-object v3

    .line 301
    .local v3, _result:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 302
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 307
    .end local v3           #_result:Ljava/lang/String;
    :sswitch_20
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 309
    invoke-virtual {p2}, Landroid/os/Parcel;->createLongArray()[J

    move-result-object v0

    .line 311
    .local v0, _arg0:[J
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 312
    .local v2, _arg1:I
    invoke-virtual {p0, v0, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->enqueue([JI)V

    .line 313
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 318
    .end local v0           #_arg0:[J
    .end local v2           #_arg1:I
    :sswitch_21
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 319
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getNowPlaying()[J

    move-result-object v3

    .line 320
    .local v3, _result:[J
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 321
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeLongArray([J)V

    goto/16 :goto_0

    .line 326
    .end local v3           #_result:[J
    :sswitch_22
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 328
    invoke-virtual {p2}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    .line 329
    .local v0, _arg0:J
    invoke-virtual {p0, v0, v1}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getNowPlayingItemName(J)Ljava/lang/String;

    move-result-object v3

    .line 330
    .local v3, _result:Ljava/lang/String;
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 331
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 336
    .end local v0           #_arg0:J
    .end local v3           #_result:Ljava/lang/String;
    :sswitch_23
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 338
    invoke-virtual {p2}, Landroid/os/Parcel;->createLongArray()[J

    move-result-object v0

    .line 340
    .local v0, _arg0:[J
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 341
    .restart local v2       #_arg1:I
    invoke-virtual {p0, v0, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->open([JI)V

    .line 342
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    goto/16 :goto_0

    .line 347
    .end local v0           #_arg0:[J
    .end local v2           #_arg1:I
    :sswitch_24
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 348
    invoke-virtual {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->getQueuePosition()I

    move-result v3

    .line 349
    .local v3, _result:I
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 350
    invoke-virtual {p3, v3}, Landroid/os/Parcel;->writeInt(I)V

    goto/16 :goto_0

    .line 355
    .end local v3           #_result:I
    :sswitch_25
    const-string v5, "com.mediatek.bluetooth.avrcp.IBTAvrcpMusic"

    invoke-virtual {p2, v5}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 357
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 358
    .local v0, _arg0:I
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->setQueuePosition(I)V

    .line 359
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
        0x11 -> :sswitch_11
        0x12 -> :sswitch_12
        0x13 -> :sswitch_13
        0x14 -> :sswitch_14
        0x15 -> :sswitch_15
        0x16 -> :sswitch_16
        0x17 -> :sswitch_17
        0x18 -> :sswitch_18
        0x19 -> :sswitch_19
        0x1a -> :sswitch_1a
        0x1b -> :sswitch_1b
        0x1c -> :sswitch_1c
        0x1d -> :sswitch_1d
        0x1e -> :sswitch_1e
        0x1f -> :sswitch_1f
        0x20 -> :sswitch_20
        0x21 -> :sswitch_21
        0x22 -> :sswitch_22
        0x23 -> :sswitch_23
        0x24 -> :sswitch_24
        0x25 -> :sswitch_25
        0x5f4e5446 -> :sswitch_0
    .end sparse-switch
.end method
