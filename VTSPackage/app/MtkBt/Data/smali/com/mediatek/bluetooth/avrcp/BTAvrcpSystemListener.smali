.class public Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;
.super Ljava/lang/Object;
.source "BTAvrcpSystemListener.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "MIS_AVRCP"


# instance fields
.field private mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

.field private mBatteryStatus:I

.field private mIsRegBattery:Z

.field private mIsRegSystem:Z

.field private mSystemStatus:I


# direct methods
.method public constructor <init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 1
    .parameter "adapter"

    .prologue
    const/4 v0, 0x0

    .line 58
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    .line 61
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegBattery:Z

    .line 62
    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegSystem:Z

    .line 63
    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mBatteryStatus:I

    .line 64
    iput v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mSystemStatus:I

    .line 67
    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->onBatteryStatusChange(I)V

    .line 68
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->onSystemStatusChange(I)V

    .line 69
    return-void
.end method


# virtual methods
.method public declared-synchronized onBatteryStatusChange(I)V
    .locals 4
    .parameter "status"

    .prologue
    .line 85
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegBattery:Z

    if-eqz v0, :cond_0

    .line 86
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegBattery:Z

    .line 87
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    const/4 v1, 0x0

    const/4 v2, 0x0

    int-to-byte v3, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationBatteryStatusChanged(BBB)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    :cond_0
    monitor-exit p0

    return-void

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 81
    const-string v0, "AVRCP"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[BT][AVRCP] onReceive :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    return-void
.end method

.method public declared-synchronized onSystemStatusChange(I)V
    .locals 4
    .parameter "status"

    .prologue
    .line 92
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegSystem:Z

    if-eqz v0, :cond_0

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegSystem:Z

    .line 94
    iget-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    const/4 v1, 0x0

    const/4 v2, 0x0

    int-to-byte v3, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationSystemStatusChanged(BBB)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    :cond_0
    monitor-exit p0

    return-void

    .line 92
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onVolumeStatusChange(I)V
    .locals 4
    .parameter "volume"

    .prologue
    .line 122
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegSystem:Z

    if-eqz v1, :cond_0

    .line 123
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mIsRegSystem:Z

    .line 124
    const/4 v0, 0x0

    .line 125
    .local v0, absVolume:B
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationVolumeChanged(BBB)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    .end local v0           #absVolume:B
    :cond_0
    monitor-exit p0

    return-void

    .line 122
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public regNotificationEvent(BI)Z
    .locals 3
    .parameter "eventId"
    .parameter "interval"

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 99
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    if-nez v2, :cond_1

    .line 117
    :cond_0
    :goto_0
    return v0

    .line 102
    :cond_1
    const/4 v2, 0x6

    if-ne v2, p1, :cond_2

    .line 104
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v2, v0, v1, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationBatteryStatusChanged(BBB)V

    move v0, v1

    .line 105
    goto :goto_0

    .line 107
    :cond_2
    const/4 v2, 0x7

    if-ne v2, p1, :cond_3

    .line 109
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v2, v0, v1, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationSystemStatusChanged(BBB)V

    move v0, v1

    .line 110
    goto :goto_0

    .line 112
    :cond_3
    const/16 v2, 0xd

    if-ne v2, p1, :cond_0

    .line 114
    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v2, v0, v1, v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->notificationVolumeChanged(BBB)V

    move v0, v1

    .line 115
    goto :goto_0
.end method

.method public declared-synchronized startListener(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 1
    .parameter "adapter"

    .prologue
    .line 73
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    monitor-exit p0

    return-void

    .line 73
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopListener()V
    .locals 1

    .prologue
    .line 77
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;->mAdapter:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    monitor-exit p0

    return-void

    .line 77
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
