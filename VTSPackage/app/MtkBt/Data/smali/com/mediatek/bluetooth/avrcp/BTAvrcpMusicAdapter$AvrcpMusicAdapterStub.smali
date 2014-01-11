.class Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;
.super Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;
.source "BTAvrcpMusicAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AvrcpMusicAdapterStub"
.end annotation


# instance fields
.field mAdapter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 1
    .parameter
    .parameter "adapter"

    .prologue
    .line 1650
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-direct {p0}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback$Stub;-><init>()V

    .line 1651
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->mAdapter:Ljava/lang/ref/WeakReference;

    .line 1652
    return-void
.end method


# virtual methods
.method public notifyAppSettingChanged()V
    .locals 4

    .prologue
    .line 1692
    const/16 v0, 0x8

    .line 1693
    .local v0, eventId:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1698
    :goto_0
    return-void

    .line 1696
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    .line 1697
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] callback notifyAppSettingChanged "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public notifyNowPlayingContentChanged()V
    .locals 0

    .prologue
    .line 1702
    return-void
.end method

.method public notifyPlaybackPosChanged()V
    .locals 4

    .prologue
    .line 1683
    const/4 v0, 0x5

    .line 1684
    .local v0, eventId:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1689
    :goto_0
    return-void

    .line 1687
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    .line 1688
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] callback notifyPlaybackPosChanged "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public notifyPlaybackStatus(B)V
    .locals 0
    .parameter "status"

    .prologue
    .line 1656
    return-void
.end method

.method public notifyTrackChanged(J)V
    .locals 0
    .parameter "id"

    .prologue
    .line 1660
    return-void
.end method

.method public notifyTrackReachEnd()V
    .locals 4

    .prologue
    .line 1674
    const/4 v0, 0x3

    .line 1675
    .local v0, eventId:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1680
    :goto_0
    return-void

    .line 1678
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    .line 1679
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] callback notifyTrackReachEnd "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public notifyTrackReachStart()V
    .locals 4

    .prologue
    .line 1663
    const/4 v0, 0x4

    .line 1664
    .local v0, eventId:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v2

    monitor-enter v2

    .line 1665
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1666
    monitor-exit v2

    .line 1671
    :goto_0
    return-void

    .line 1668
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    .line 1669
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1670
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] callback notifyTrackReachStart "

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1669
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public notifyVolumehanged(B)V
    .locals 5
    .parameter "volume"

    .prologue
    const/4 v4, 0x0

    .line 1705
    const/16 v0, 0xd

    .line 1706
    .local v0, eventId:I
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1712
    :goto_0
    return-void

    .line 1709
    :cond_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mRegBit:Ljava/util/BitSet;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$600(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Ljava/util/BitSet;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->clear(I)V

    .line 1710
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP] callback notifyVolumehanged "

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1711
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAvrcpSrv:Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$700(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;

    move-result-object v1

    invoke-virtual {v1, v4, v4, p1}, Lcom/mediatek/bluetooth/avrcp/BluetoothAvrcpService;->notificationVolumeChangedNative(BBB)Z

    goto :goto_0
.end method
