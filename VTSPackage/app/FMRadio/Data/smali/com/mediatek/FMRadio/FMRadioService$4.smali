.class Lcom/mediatek/FMRadio/FMRadioService$4;
.super Ljava/lang/Object;
.source "FMRadioService.java"

# interfaces
.implements Landroid/media/AudioManager$OnAudioFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioService;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioService;)V
    .locals 0
    .parameter

    .prologue
    .line 1989
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioService$4;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAudioFocusChange(I)V
    .locals 2
    .parameter "focusChange"

    .prologue
    .line 1997
    packed-switch p1, :pswitch_data_0

    .line 2014
    :pswitch_0
    const-string v0, "FmRx/Service"

    const-string v1, "AudioFocus: Audio focus change, but not need handle"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2017
    :goto_0
    return-void

    .line 1999
    :pswitch_1
    const-string v0, "FmRx/Service"

    const-string v1, "AudioFocus: received AUDIOFOCUS_LOSS"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2000
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioService$4;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v1, -0x1

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->stopFMFocusLoss(I)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->access$100(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto :goto_0

    .line 2004
    :pswitch_2
    const-string v0, "FmRx/Service"

    const-string v1, "AudioFocus: received AUDIOFOCUS_LOSS_TRANSIENT"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2005
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioService$4;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v1, -0x2

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->stopFMFocusLoss(I)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->access$100(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto :goto_0

    .line 2009
    :pswitch_3
    const-string v0, "FmRx/Service"

    const-string v1, "AudioFocus: received AUDIOFOCUS_GAIN"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2010
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioService$4;->this$0:Lcom/mediatek/FMRadio/FMRadioService;

    const/4 v1, 0x1

    #calls: Lcom/mediatek/FMRadio/FMRadioService;->updateAudioFocusAync(I)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioService;->access$2000(Lcom/mediatek/FMRadio/FMRadioService;I)V

    goto :goto_0

    .line 1997
    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method
