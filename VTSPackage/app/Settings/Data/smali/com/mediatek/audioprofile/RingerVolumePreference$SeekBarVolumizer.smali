.class public Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
.super Ljava/lang/Object;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/audioprofile/RingerVolumePreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SeekBarVolumizer"
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDefaultUri:Landroid/net/Uri;

.field private mHandler:Landroid/os/Handler;

.field private mIsVisible:Z

.field private mLastProgress:I

.field private mOriginalVolume:I

.field public mProfileIsActive:Z

.field public mRingtone:Landroid/media/Ringtone;

.field private final mSeekBar:Landroid/widget/SeekBar;

.field private final mStreamType:I

.field public mSystemVolume:I

.field final synthetic this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;


# direct methods
.method public constructor <init>(Lcom/mediatek/audioprofile/RingerVolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;I)V
    .locals 2
    .parameter
    .parameter "context"
    .parameter "seekBar"
    .parameter "streamType"

    .prologue
    const/4 v1, -0x1

    .line 483
    iput-object p1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 459
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mHandler:Landroid/os/Handler;

    .line 463
    iput v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    .line 464
    iput v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 465
    iput v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    .line 467
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mDefaultUri:Landroid/net/Uri;

    .line 469
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mProfileIsActive:Z

    .line 471
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mIsVisible:Z

    .line 484
    iput-object p2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mContext:Landroid/content/Context;

    .line 486
    iput p4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    .line 487
    iput-object p3, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    .line 489
    invoke-direct {p0, p3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->initSeekBar(Landroid/widget/SeekBar;)V

    .line 490
    return-void
.end method

.method private initSeekBar(Landroid/widget/SeekBar;)V
    .locals 4
    .parameter "seekBar"

    .prologue
    const/4 v3, 0x2

    .line 499
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->getStreamMaxVolume(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setMax(I)V

    .line 501
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    .line 502
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " get Original SYSTEM Volume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getStreamVolume(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 507
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " get Original Volume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 510
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->isActive(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mProfileIsActive:Z

    .line 515
    iget-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mProfileIsActive:Z

    if-eqz v0, :cond_0

    .line 516
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    if-eq v0, v1, :cond_0

    .line 517
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " sync "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " original Volume to"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 523
    :cond_0
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    .line 524
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {p1, v0}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 525
    invoke-virtual {p1, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 527
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    if-ne v0, v3, :cond_3

    .line 528
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getRingtoneUri(Ljava/lang/String;I)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mDefaultUri:Landroid/net/Uri;

    .line 537
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mDefaultUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    .line 538
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    if-eqz v0, :cond_2

    .line 539
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1}, Landroid/media/Ringtone;->setStreamType(I)V

    .line 541
    :cond_2
    return-void

    .line 530
    :cond_3
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_4

    .line 531
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->getRingtoneUri(Ljava/lang/String;I)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mDefaultUri:Landroid/net/Uri;

    goto :goto_0

    .line 533
    :cond_4
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 534
    sget-object v0, Landroid/provider/Settings$System;->DEFAULT_ALARM_ALERT_URI:Landroid/net/Uri;

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mDefaultUri:Landroid/net/Uri;

    goto :goto_0
.end method

.method private isSilentProfileActive()Z
    .locals 2

    .prologue
    .line 727
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private sample()V
    .locals 3

    .prologue
    .line 793
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    invoke-virtual {v0, p0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->onSampleStarting(Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;)V

    .line 795
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sample, set system Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 796
    invoke-direct {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->isSilentProfileActive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 797
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVolume(IIZ)V

    .line 800
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    if-eqz v0, :cond_1

    .line 801
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " play sample"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 802
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    invoke-virtual {v0}, Landroid/media/Ringtone;->play()V

    .line 804
    :cond_1
    return-void
.end method

.method private setVolume(IIZ)V
    .locals 3
    .parameter "streamType"
    .parameter "volume"
    .parameter "flag"

    .prologue
    const/4 v2, 0x0

    .line 699
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 701
    if-eqz p3, :cond_0

    .line 702
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1, p2, v2}, Landroid/media/AudioManager;->setAudioProfileStreamVolume(III)V

    .line 704
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p2, v2}, Landroid/media/AudioManager;->setAudioProfileStreamVolume(III)V

    .line 718
    :goto_0
    return-void

    .line 707
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$500(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/settings/ext/IAudioProfileExt;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lcom/mediatek/settings/ext/IAudioProfileExt;->setRingerVolume(Landroid/media/AudioManager;I)V

    goto :goto_0

    .line 711
    :cond_1
    if-eqz p3, :cond_2

    .line 712
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2, v2}, Landroid/media/AudioManager;->setAudioProfileStreamVolume(III)V

    goto :goto_0

    .line 715
    :cond_2
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$500(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/settings/ext/IAudioProfileExt;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lcom/mediatek/settings/ext/IAudioProfileExt;->setVolume(Landroid/media/AudioManager;II)V

    goto :goto_0
.end method


# virtual methods
.method public changeVolumeBy(I)V
    .locals 1
    .parameter "amount"

    .prologue
    .line 832
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, p1}, Landroid/widget/SeekBar;->incrementProgressBy(I)V

    .line 833
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->postSetVolume(I)V

    .line 834
    return-void
.end method

.method public getSeekBar()Landroid/widget/SeekBar;
    .locals 1

    .prologue
    .line 822
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    return-object v0
.end method

.method public getVisible()Z
    .locals 1

    .prologue
    .line 559
    iget-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mIsVisible:Z

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 579
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    if-eqz v0, :cond_0

    .line 580
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    invoke-virtual {v0}, Landroid/media/Ringtone;->isPlaying()Z

    move-result v0

    .line 583
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 3
    .parameter "seekBar"
    .parameter "progress"
    .parameter "fromTouch"

    .prologue
    .line 750
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onProgressChanged: progress"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : fromTouch"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 752
    iput p2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    .line 753
    if-nez p3, :cond_0

    .line 757
    :goto_0
    return-void

    .line 756
    :cond_0
    invoke-virtual {p0, p2}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->postSetVolume(I)V

    goto :goto_0
.end method

.method public onRestoreInstanceState(Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;)V
    .locals 2
    .parameter "volumeStore"

    .prologue
    .line 859
    iget v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mVolume:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 860
    iget v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    .line 861
    iget v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mOriginalVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 862
    iget v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mSystemVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    .line 863
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {p0, v0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->postSetVolume(I)V

    .line 865
    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;)V
    .locals 1
    .parameter "volumeStore"

    .prologue
    .line 844
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    if-ltz v0, :cond_0

    .line 845
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    iput v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mVolume:I

    .line 846
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    iput v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mOriginalVolume:I

    .line 847
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    iput v0, p1, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;->mSystemVolume:I

    .line 849
    :cond_0
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0
    .parameter "seekBar"

    .prologue
    .line 736
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 1
    .parameter "seekBar"

    .prologue
    .line 777
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    invoke-virtual {v0}, Landroid/media/Ringtone;->isPlaying()Z

    move-result v0

    if-nez v0, :cond_0

    .line 778
    invoke-direct {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->sample()V

    .line 780
    :cond_0
    return-void
.end method

.method postSetVolume(I)V
    .locals 1
    .parameter "progress"

    .prologue
    .line 766
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 767
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 768
    return-void
.end method

.method public resume()V
    .locals 3

    .prologue
    .line 592
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;

    move-result-object v0

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    .line 593
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " get Original SYSTEM Volume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v0, v1, v2}, Lcom/mediatek/audioprofile/AudioProfileManager;->getStreamVolume(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 598
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " get Original Volume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->isActive(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mProfileIsActive:Z

    .line 606
    iget-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mProfileIsActive:Z

    if-eqz v0, :cond_0

    .line 607
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    if-eq v0, v1, :cond_0

    .line 608
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " sync "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " original Volume to"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    .line 614
    :cond_0
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    iput v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    .line 615
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 616
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 618
    :cond_1
    return-void
.end method

.method public revertVolume()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 625
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " revert Last Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v3, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->setStreamVolume(Ljava/lang/String;II)V

    .line 630
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 631
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    iget v3, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->setStreamVolume(Ljava/lang/String;II)V

    .line 637
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->isActive(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 638
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Active, Revert system Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 640
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mOriginalVolume:I

    invoke-direct {p0, v0, v1, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVolume(IIZ)V

    .line 649
    :cond_1
    :goto_0
    return-void

    .line 642
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->isSilentProfileActive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 643
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not Active, Revert system Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 646
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-direct {p0, v0, v1, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVolume(IIZ)V

    goto :goto_0
.end method

.method public run()V
    .locals 0

    .prologue
    .line 786
    invoke-direct {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->sample()V

    .line 787
    return-void
.end method

.method public saveVolume()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 655
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Save Last Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v3, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->setStreamVolume(Ljava/lang/String;II)V

    .line 658
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 659
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x5

    iget v3, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/mediatek/audioprofile/AudioProfileManager;->setStreamVolume(Ljava/lang/String;II)V

    .line 663
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;
    invoke-static {v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->this$0:Lcom/mediatek/audioprofile/RingerVolumePreference;

    #getter for: Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;
    invoke-static {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference;->access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mediatek/audioprofile/AudioProfileManager;->isActive(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 664
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Active, save system Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mLastProgress:I

    invoke-direct {p0, v0, v1, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVolume(IIZ)V

    .line 676
    :cond_1
    :goto_0
    return-void

    .line 668
    :cond_2
    invoke-direct {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->isSilentProfileActive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 669
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not Active, Revert system Volume "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    iget v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    iget v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSystemVolume:I

    invoke-direct {p0, v0, v1, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVolume(IIZ)V

    goto :goto_0
.end method

.method public setVisible(Z)V
    .locals 0
    .parameter "visible"

    .prologue
    .line 550
    iput-boolean p1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mIsVisible:Z

    .line 551
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 567
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mSeekBar:Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 568
    iput-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mContext:Landroid/content/Context;

    .line 569
    iput-object v1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mHandler:Landroid/os/Handler;

    .line 570
    return-void
.end method

.method public stopSample()V
    .locals 3

    .prologue
    .line 810
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    if-eqz v0, :cond_0

    .line 811
    const-string v0, "Settings/VolPref"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stream type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mStreamType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " stop sample"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 812
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->mRingtone:Landroid/media/Ringtone;

    invoke-virtual {v0}, Landroid/media/Ringtone;->stop()V

    .line 814
    :cond_0
    return-void
.end method
