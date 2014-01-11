.class Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$2;
.super Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;
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
.method constructor <init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V
    .locals 0
    .parameter
    .parameter "x0"

    .prologue
    .line 1308
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$2;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-direct {p0, p2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpSystemListener;-><init>(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)V

    return-void
.end method


# virtual methods
.method public onBatteryStatusChange(I)V
    .locals 5
    .parameter "status"

    .prologue
    .line 1311
    const-string v0, "MIS_AVRCP"

    const-string v1, "[BT][AVRCP] onBatteryStatusChange status:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1312
    return-void
.end method

.method public onSystemStatusChange(I)V
    .locals 5
    .parameter "status"

    .prologue
    .line 1316
    const-string v0, "MIS_AVRCP"

    const-string v1, "[BT][AVRCP] onSystemStatusChange status:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1317
    return-void
.end method

.method public onVolumeStatusChange(I)V
    .locals 5
    .parameter "volume"

    .prologue
    .line 1320
    const-string v0, "MIS_AVRCP"

    const-string v1, "[BT][AVRCP] onSystemStatusChange volumn:%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1321
    return-void
.end method
