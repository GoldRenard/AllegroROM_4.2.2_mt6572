.class Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;
.super Ljava/lang/Object;
.source "BTAvrcpMusicAdapter.java"

# interfaces
.implements Landroid/content/ServiceConnection;


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
    .line 1595
    iput-object p1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 9
    .parameter "className"
    .parameter "service"

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 1598
    const/4 v2, 0x0

    .line 1599
    .local v2, interval:I
    const/4 v0, 0x0

    .line 1601
    .local v0, bReg:Z
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP][b] onServiceConnected className:%s"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1603
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    invoke-static {p2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic$Stub;->asInterface(Landroid/os/IBinder;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v4

    #setter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v3, v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$202(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    .line 1605
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mDebug:Z
    invoke-static {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$300(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1606
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;
    invoke-static {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$400(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Landroid/content/Context;

    move-result-object v3

    const-string v4, "[BT][AVRCP] MusicService onConnected"

    invoke-static {v3, v4, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 1610
    :cond_0
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 1611
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP][b] registercallback"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1612
    iget-object v3, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v3}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;
    invoke-static {v4}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$500(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->registerCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V

    .line 1613
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] mMusicService.getAudioId:%d"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v7}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v7

    invoke-interface {v7}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->getAudioId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1624
    :goto_0
    return-void

    .line 1615
    :cond_1
    const-string v3, "MMI_AVRCP"

    const-string v4, "[BT][AVRCP] mMusicService.getAudioId:null"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1620
    :catch_0
    move-exception v1

    .line 1621
    .local v1, ex:Landroid/os/RemoteException;
    const-string v3, "MMI_AVRCP"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[BT][AVRCP] BTAvrcpMusicAdapter mMusicService.registerCallback exception.error message:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 6
    .parameter "className"

    .prologue
    const/4 v5, 0x0

    .line 1627
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][b] onServiceDisconnected className:%s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1628
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1630
    const-string v1, "MMI_AVRCP"

    const-string v2, "[BT][AVRCP][b] unregistercallback "

    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1632
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$200(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mAdapterCallback:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;
    invoke-static {v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$500(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$AvrcpMusicAdapterStub;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;->unregisterCallback(Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusicCallback;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1637
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    const/4 v2, 0x0

    #setter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mMusicService:Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;
    invoke-static {v1, v2}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$202(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;)Lcom/mediatek/bluetooth/avrcp/IBTAvrcpMusic;

    .line 1639
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mDebug:Z
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$300(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1640
    iget-object v1, p0, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter$5;->this$0:Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;

    #getter for: Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;->access$400(Lcom/mediatek/bluetooth/avrcp/BTAvrcpMusicAdapter;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "[BT][AVRCP] MusicService onDisconnected !"

    invoke-static {v1, v2, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 1642
    :cond_1
    return-void

    .line 1633
    :catch_0
    move-exception v0

    .line 1634
    .local v0, ex:Landroid/os/RemoteException;
    const-string v1, "MMI_AVRCP"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[BT][AVRCP] mMusicService.unregisterCallback exception.error message:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
