.class Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;
.super Landroid/content/BroadcastReceiver;
.source "BTAvrcpMusicAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;


# direct methods
.method constructor <init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 0
    .parameter

    .prologue
    .line 1513
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 1516
    const/4 v1, 0x1

    .line 1517
    .local v1, eventId:I
    const/4 v2, 0x0

    .line 1518
    .local v2, status:I
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 1521
    .local v0, action:Ljava/lang/String;
    const-string v3, "MMI_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] onReceive mStatusListener: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1522
    const-string v3, "com.android.music.metachanged"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1524
    invoke-static {p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->updateMusicTrackInfo(Landroid/content/Intent;)V

    .line 1525
    const/4 v1, 0x2

    .line 1527
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1528
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1532
    :cond_0
    const/4 v1, 0x1

    .line 1533
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getPlayerstatus()B

    move-result v2

    .line 1534
    const/4 v3, 0x1

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v4, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v4

    if-eq v3, v4, :cond_1

    .line 1535
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1567
    :cond_1
    :goto_0
    return-void

    .line 1537
    :cond_2
    const-string v3, "com.android.music.playstatechanged"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1538
    invoke-static {p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->updateMusicTrackInfo(Landroid/content/Intent;)V

    .line 1540
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->getPlayerstatus()B

    move-result v2

    .line 1541
    invoke-static {}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$000()I

    move-result v3

    if-eq v3, v2, :cond_1

    .line 1542
    invoke-static {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$002(I)I

    .line 1543
    const/4 v1, 0x1

    .line 1544
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1545
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive EVENT_PLAYBACK_STATUS_CHANGED fail"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1548
    :cond_3
    const/4 v1, 0x2

    .line 1549
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1550
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive EVENT_TRACK_CHANGED fail"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1554
    :cond_4
    const-string v3, "com.android.music.quitplayback"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1555
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] action equals BTAvrcpMusicAdapter.QUIT_PLAYBACK"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1556
    :cond_5
    const-string v3, "com.android.music.queuechanged"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1557
    invoke-static {p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->updateMusicTrackInfo(Landroid/content/Intent;)V

    .line 1558
    const/16 v1, 0x9

    .line 1559
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$3;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-virtual {v3, v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->passNotifyMsg(II)Z

    move-result v3

    if-nez v3, :cond_1

    .line 1560
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive EVENT_NOW_PLAYING_CONTENT_CHANGED fail"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1562
    :cond_6
    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1563
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive action equals ACTION_SCREEN_OFF"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1564
    :cond_7
    const-string v3, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1565
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] onReceive action equals ACTION_SCREEN_ON"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method
