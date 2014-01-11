.class Lcom/android/systemui/media/NotificationPlayer$1;
.super Ljava/lang/Object;
.source "NotificationPlayer.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/media/NotificationPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/media/NotificationPlayer;


# direct methods
.method constructor <init>(Lcom/android/systemui/media/NotificationPlayer;)V
    .registers 2
    .parameter

    .prologue
    .line 373
    iput-object p1, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .registers 4
    .parameter "focusChange"

    .prologue
    .line 376
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-nez v0, :cond_9

    .line 404
    :goto_8
    return-void

    .line 379
    :cond_9
    packed-switch p1, :pswitch_data_8a

    :pswitch_c
    goto :goto_8

    .line 389
    :pswitch_d
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$200(Lcom/android/systemui/media/NotificationPlayer;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 390
    :try_start_14
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_6b

    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isLooping()Z

    move-result v0

    if-eqz v0, :cond_6b

    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 392
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 393
    monitor-exit v1

    goto :goto_8

    .line 395
    :catchall_3f
    move-exception v0

    monitor-exit v1
    :try_end_41
    .catchall {:try_start_14 .. :try_end_41} :catchall_3f

    throw v0

    .line 381
    :pswitch_42
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$200(Lcom/android/systemui/media/NotificationPlayer;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 382
    :try_start_49
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_66

    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_66

    .line 383
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 385
    :cond_66
    monitor-exit v1

    goto :goto_8

    :catchall_68
    move-exception v0

    monitor-exit v1
    :try_end_6a
    .catchall {:try_start_49 .. :try_end_6a} :catchall_68

    throw v0

    .line 395
    :cond_6b
    :try_start_6b
    monitor-exit v1
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_3f

    .line 397
    :pswitch_6c
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$200(Lcom/android/systemui/media/NotificationPlayer;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    .line 398
    :try_start_73
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    if-eqz v0, :cond_84

    .line 399
    iget-object v0, p0, Lcom/android/systemui/media/NotificationPlayer$1;->this$0:Lcom/android/systemui/media/NotificationPlayer;

    invoke-static {v0}, Lcom/android/systemui/media/NotificationPlayer;->access$300(Lcom/android/systemui/media/NotificationPlayer;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 401
    :cond_84
    monitor-exit v1

    goto :goto_8

    :catchall_86
    move-exception v0

    monitor-exit v1
    :try_end_88
    .catchall {:try_start_73 .. :try_end_88} :catchall_86

    throw v0

    .line 379
    nop

    :pswitch_data_8a
    .packed-switch -0x3
        :pswitch_d
        :pswitch_d
        :pswitch_6c
        :pswitch_c
        :pswitch_42
    .end packed-switch
.end method
