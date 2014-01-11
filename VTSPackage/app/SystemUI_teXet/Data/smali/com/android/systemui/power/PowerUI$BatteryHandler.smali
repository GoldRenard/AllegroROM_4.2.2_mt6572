.class Lcom/android/systemui/power/PowerUI$BatteryHandler;
.super Landroid/os/Handler;
.source "PowerUI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/power/PowerUI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BatteryHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/systemui/power/PowerUI;


# direct methods
.method private constructor <init>(Lcom/android/systemui/power/PowerUI;)V
    .registers 2
    .parameter

    .prologue
    .line 400
    iput-object p1, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/systemui/power/PowerUI;Lcom/android/systemui/power/PowerUI$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 400
    invoke-direct {p0, p1}, Lcom/android/systemui/power/PowerUI$BatteryHandler;-><init>(Lcom/android/systemui/power/PowerUI;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 11
    .parameter "msg"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 403
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_9a

    .line 429
    :cond_7
    :goto_7
    return-void

    .line 405
    :pswitch_8
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    iget-object v4, v4, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    const-string v5, "audio"

    invoke-virtual {v4, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .line 407
    .local v0, audioManager:Landroid/media/AudioManager;
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    const-string v5, "battery"

    invoke-static {v4, v5}, Lcom/android/systemui/power/PowerUI;->access$600(Lcom/android/systemui/power/PowerUI;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 408
    .local v1, path:Ljava/lang/String;
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4}, Lcom/android/systemui/power/PowerUI;->access$400(Lcom/android/systemui/power/PowerUI;)Lcom/android/systemui/media/NotificationPlayer;

    move-result-object v4

    if-nez v4, :cond_30

    .line 409
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    new-instance v5, Lcom/android/systemui/media/NotificationPlayer;

    const-string v6, "StatusBarPolicy"

    invoke-direct {v5, v6}, Lcom/android/systemui/media/NotificationPlayer;-><init>(Ljava/lang/String;)V

    invoke-static {v4, v5}, Lcom/android/systemui/power/PowerUI;->access$402(Lcom/android/systemui/power/PowerUI;Lcom/android/systemui/media/NotificationPlayer;)Lcom/android/systemui/media/NotificationPlayer;

    .line 411
    :cond_30
    if-eqz v1, :cond_7f

    .line 412
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4, v7}, Lcom/android/systemui/power/PowerUI;->access$302(Lcom/android/systemui/power/PowerUI;Z)Z

    .line 413
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "/system/media/audio/ui/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 414
    .local v3, totolPath:Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 415
    .local v2, soundFile:Ljava/io/File;
    invoke-virtual {v0, v7}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v4

    if-eqz v4, :cond_7

    .line 416
    const-string v4, "PowerUI"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleMessage, soundFile="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4}, Lcom/android/systemui/power/PowerUI;->access$400(Lcom/android/systemui/power/PowerUI;)Lcom/android/systemui/media/NotificationPlayer;

    move-result-object v4

    iget-object v5, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    iget-object v5, v5, Lcom/android/systemui/SystemUI;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v4, v5, v6, v8, v7}, Lcom/android/systemui/media/NotificationPlayer;->play(Landroid/content/Context;Landroid/net/Uri;ZI)V

    goto :goto_7

    .line 420
    .end local v2           #soundFile:Ljava/io/File;
    .end local v3           #totolPath:Ljava/lang/String;
    :cond_7f
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4, v8}, Lcom/android/systemui/power/PowerUI;->access$302(Lcom/android/systemui/power/PowerUI;Z)Z

    .line 421
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4}, Lcom/android/systemui/power/PowerUI;->access$700(Lcom/android/systemui/power/PowerUI;)Landroid/media/ToneGenerator;

    move-result-object v4

    if-eqz v4, :cond_7

    .line 422
    iget-object v4, p0, Lcom/android/systemui/power/PowerUI$BatteryHandler;->this$0:Lcom/android/systemui/power/PowerUI;

    invoke-static {v4}, Lcom/android/systemui/power/PowerUI;->access$700(Lcom/android/systemui/power/PowerUI;)Landroid/media/ToneGenerator;

    move-result-object v4

    const/16 v5, 0x2c

    invoke-virtual {v4, v5}, Landroid/media/ToneGenerator;->startTone(I)Z

    goto/16 :goto_7

    .line 403
    nop

    :pswitch_data_9a
    .packed-switch 0xa
        :pswitch_8
    .end packed-switch
.end method
