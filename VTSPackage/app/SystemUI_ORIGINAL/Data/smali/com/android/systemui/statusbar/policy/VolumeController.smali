.class public Lcom/android/systemui/statusbar/policy/VolumeController;
.super Ljava/lang/Object;
.source "VolumeController.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/ToggleSlider$Listener;


# static fields
.field private static final STREAM:I = 0x5

.field private static final TAG:Ljava/lang/String; = "StatusBar.VolumeController"


# instance fields
.field private mAudioManager:Landroid/media/AudioManager;

.field private mContext:Landroid/content/Context;

.field private mControl:Lcom/android/systemui/statusbar/policy/ToggleSlider;

.field private final mHasVibrator:Z

.field private mMute:Z

.field private mVolume:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/systemui/statusbar/policy/ToggleSlider;)V
    .locals 4
    .parameter "context"
    .parameter "control"

    .prologue
    const/4 v2, 0x0

    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mContext:Landroid/content/Context;

    .line 45
    iput-object p2, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mControl:Lcom/android/systemui/statusbar/policy/ToggleSlider;

    .line 47
    const-string v1, "vibrator"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 48
    .local v0, vibrator:Landroid/os/Vibrator;
    if-nez v0, :cond_1

    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mHasVibrator:Z

    .line 50
    const-string v1, "audio"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    .line 52
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v1

    const/4 v3, 0x2

    if-eq v1, v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mMute:Z

    .line 53
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    const/4 v2, 0x5

    invoke-virtual {v1, v2}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mVolume:I

    .line 55
    invoke-virtual {p2, p0}, Lcom/android/systemui/statusbar/policy/ToggleSlider;->setOnChangedListener(Lcom/android/systemui/statusbar/policy/ToggleSlider$Listener;)V

    .line 56
    return-void

    .line 48
    :cond_1
    invoke-virtual {v0}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v1

    goto :goto_0
.end method


# virtual methods
.method public onChanged(Lcom/android/systemui/statusbar/policy/ToggleSlider;ZZI)V
    .locals 3
    .parameter "view"
    .parameter "tracking"
    .parameter "mute"
    .parameter "level"

    .prologue
    .line 66
    if-nez p2, :cond_0

    .line 67
    if-eqz p3, :cond_2

    .line 68
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mHasVibrator:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 76
    :cond_0
    :goto_1
    return-void

    .line 68
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 72
    :cond_2
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setRingerMode(I)V

    .line 73
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x5

    const/4 v2, 0x4

    invoke-virtual {v0, v1, p4, v2}, Landroid/media/AudioManager;->setStreamVolume(III)V

    goto :goto_1
.end method

.method public onInit(Lcom/android/systemui/statusbar/policy/ToggleSlider;)V
    .locals 2
    .parameter "control"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mAudioManager:Landroid/media/AudioManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/systemui/statusbar/policy/ToggleSlider;->setMax(I)V

    .line 61
    iget v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mVolume:I

    invoke-virtual {p1, v0}, Lcom/android/systemui/statusbar/policy/ToggleSlider;->setValue(I)V

    .line 62
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/VolumeController;->mMute:Z

    invoke-virtual {p1, v0}, Lcom/android/systemui/statusbar/policy/ToggleSlider;->setChecked(Z)V

    .line 63
    return-void
.end method
