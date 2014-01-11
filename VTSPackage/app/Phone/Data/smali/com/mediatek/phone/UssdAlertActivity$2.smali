.class Lcom/mediatek/phone/UssdAlertActivity$2;
.super Ljava/lang/Object;
.source "UssdAlertActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/UssdAlertActivity;->playUSSDTone(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/UssdAlertActivity;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/UssdAlertActivity;Landroid/content/Context;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 165
    iput-object p1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    iput-object p2, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->val$context:Landroid/content/Context;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 167
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    #setter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1, v2}, Lcom/mediatek/phone/UssdAlertActivity;->access$202(Lcom/mediatek/phone/UssdAlertActivity;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 168
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V

    .line 170
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->val$context:Landroid/content/Context;

    const/4 v3, 0x2

    invoke-static {v3}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 172
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 182
    :goto_0
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v1}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 183
    iget-object v1, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    iget-object v2, p0, Lcom/mediatek/phone/UssdAlertActivity$2;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v2}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mediatek/phone/UssdAlertActivity;->setMediaListener(Landroid/media/MediaPlayer;)V

    .line 184
    return-void

    .line 173
    :catch_0
    move-exception v0

    .line 174
    .local v0, e:Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 175
    .end local v0           #e:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 176
    .local v0, e:Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0

    .line 177
    .end local v0           #e:Ljava/lang/SecurityException;
    :catch_2
    move-exception v0

    .line 178
    .local v0, e:Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .line 179
    .end local v0           #e:Ljava/lang/IllegalStateException;
    :catch_3
    move-exception v0

    .line 180
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method
