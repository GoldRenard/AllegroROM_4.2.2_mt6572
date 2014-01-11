.class Lcom/mediatek/FMRadio/FMRadioActivity$3;
.super Ljava/lang/Object;
.source "FMRadioActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/FMRadio/FMRadioActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/FMRadio/FMRadioActivity;


# direct methods
.method constructor <init>(Lcom/mediatek/FMRadio/FMRadioActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 270
    iput-object p1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .parameter "v"

    .prologue
    .line 279
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 353
    :pswitch_0
    const-string v0, "FmRx/Activity"

    const-string v1, "invalid view id"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    :goto_0
    return-void

    .line 282
    :pswitch_1
    const-string v0, "FmRx/Activity"

    const-string v1, "btn record: CLICK!!"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 284
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    if-nez v0, :cond_0

    .line 285
    const-string v0, "FmRx/Activity"

    const-string v1, "mService is null"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 288
    :cond_0
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mIsPlaying:Z
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$500(Lcom/mediatek/FMRadio/FMRadioActivity;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 289
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    const v2, 0x7f040035

    invoke-virtual {v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->showToast(Ljava/lang/CharSequence;)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$300(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 292
    :cond_1
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordNotIdle()V
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    .line 293
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    #setter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mSDDirectory:Ljava/lang/String;
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$902(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;)Ljava/lang/String;

    .line 295
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    #setter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J
    invoke-static {v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1002(Lcom/mediatek/FMRadio/FMRadioActivity;J)J

    .line 296
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    const-string v1, "startRecordTime"

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mRecordStartTime:J
    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1000(Lcom/mediatek/FMRadio/FMRadioActivity;)J

    move-result-wide v2

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->editSharedPreferences(Ljava/lang/String;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1100(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;J)V

    .line 297
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->startRecordingAsync()V

    goto :goto_0

    .line 302
    :pswitch_2
    const-string v0, "FmRx/Activity"

    const-string v1, "btn stop: CLICK!!"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    if-nez v0, :cond_2

    .line 304
    const-string v0, "FmRx/Activity"

    const-string v1, "mService is null"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 307
    :cond_2
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordNotIdle()V
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    .line 308
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->stopRecordingAsync()V

    .line 309
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->stopPlaybackAsync()V

    goto/16 :goto_0

    .line 313
    :pswitch_3
    const-string v0, "FmRx/Activity"

    const-string v1, "btn playback: CLICK!!"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    if-nez v0, :cond_3

    .line 315
    const-string v0, "FmRx/Activity"

    const-string v1, "mService is null"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 318
    :cond_3
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->refreshRecordNotIdle()V
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$800(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    .line 319
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    #setter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J
    invoke-static {v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1202(Lcom/mediatek/FMRadio/FMRadioActivity;J)J

    .line 320
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    const-string v1, "startPlayTime"

    iget-object v2, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mPlayStartTime:J
    invoke-static {v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1200(Lcom/mediatek/FMRadio/FMRadioActivity;)J

    move-result-wide v2

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->editSharedPreferences(Ljava/lang/String;J)V
    invoke-static {v0, v1, v2, v3}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1100(Lcom/mediatek/FMRadio/FMRadioActivity;Ljava/lang/String;J)V

    .line 321
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mService:Lcom/mediatek/FMRadio/FMRadioService;
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$700(Lcom/mediatek/FMRadio/FMRadioActivity;)Lcom/mediatek/FMRadio/FMRadioService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mediatek/FMRadio/FMRadioService;->startPlaybackAsync()V

    goto/16 :goto_0

    .line 325
    :pswitch_4
    const-string v0, "FmRx/Activity"

    const-string v1, "onClick AddToFavorite start"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->updateFavoriteStation()V
    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1300(Lcom/mediatek/FMRadio/FMRadioActivity;)V

    .line 327
    const-string v0, "FmRx/Activity"

    const-string v1, "onClick AddToFavorite end"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 332
    :pswitch_5
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1400(Lcom/mediatek/FMRadio/FMRadioActivity;)I

    move-result v1

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeDecreaseStation(I)I

    move-result v1

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->tuneToStation(I)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1500(Lcom/mediatek/FMRadio/FMRadioActivity;I)V

    goto/16 :goto_0

    .line 337
    :pswitch_6
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1400(Lcom/mediatek/FMRadio/FMRadioActivity;)I

    move-result v1

    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeIncreaseStation(I)I

    move-result v1

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->tuneToStation(I)V
    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1500(Lcom/mediatek/FMRadio/FMRadioActivity;I)V

    goto/16 :goto_0

    .line 341
    :pswitch_7
    const-string v0, "FmRx/Activity"

    const-string v1, "onClick PrevStation"

    invoke-static {v0, v1}, Lcom/mediatek/FMRadio/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 343
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1400(Lcom/mediatek/FMRadio/FMRadioActivity;)I

    move-result v1

    const/4 v2, 0x0

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->seekStation(IZ)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1600(Lcom/mediatek/FMRadio/FMRadioActivity;IZ)V

    goto/16 :goto_0

    .line 348
    :pswitch_8
    iget-object v0, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    iget-object v1, p0, Lcom/mediatek/FMRadio/FMRadioActivity$3;->this$0:Lcom/mediatek/FMRadio/FMRadioActivity;

    #getter for: Lcom/mediatek/FMRadio/FMRadioActivity;->mCurrentStation:I
    invoke-static {v1}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1400(Lcom/mediatek/FMRadio/FMRadioActivity;)I

    move-result v1

    const/4 v2, 0x1

    #calls: Lcom/mediatek/FMRadio/FMRadioActivity;->seekStation(IZ)V
    invoke-static {v0, v1, v2}, Lcom/mediatek/FMRadio/FMRadioActivity;->access$1600(Lcom/mediatek/FMRadio/FMRadioActivity;IZ)V

    goto/16 :goto_0

    .line 279
    nop

    :pswitch_data_0
    .packed-switch 0x7f060042
        :pswitch_4
        :pswitch_0
        :pswitch_7
        :pswitch_5
        :pswitch_6
        :pswitch_8
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
