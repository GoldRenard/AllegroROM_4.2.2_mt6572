.class Lcom/mediatek/phone/UssdAlertActivity$3;
.super Ljava/lang/Object;
.source "UssdAlertActivity.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mediatek/phone/UssdAlertActivity;->setMediaListener(Landroid/media/MediaPlayer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/phone/UssdAlertActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/phone/UssdAlertActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 189
    iput-object p1, p0, Lcom/mediatek/phone/UssdAlertActivity$3;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .parameter "mp"

    .prologue
    .line 191
    iget-object v0, p0, Lcom/mediatek/phone/UssdAlertActivity$3;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    #getter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0}, Lcom/mediatek/phone/UssdAlertActivity;->access$200(Lcom/mediatek/phone/UssdAlertActivity;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 192
    iget-object v0, p0, Lcom/mediatek/phone/UssdAlertActivity$3;->this$0:Lcom/mediatek/phone/UssdAlertActivity;

    const/4 v1, 0x0

    #setter for: Lcom/mediatek/phone/UssdAlertActivity;->mMediaPlayer:Landroid/media/MediaPlayer;
    invoke-static {v0, v1}, Lcom/mediatek/phone/UssdAlertActivity;->access$202(Lcom/mediatek/phone/UssdAlertActivity;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;

    .line 193
    return-void
.end method
