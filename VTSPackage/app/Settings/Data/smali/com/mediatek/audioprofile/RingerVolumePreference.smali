.class public Lcom/mediatek/audioprofile/RingerVolumePreference;
.super Landroid/preference/SeekBarDialogPreference;
.source "RingerVolumePreference.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;,
        Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;,
        Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;,
        Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;
    }
.end annotation


# static fields
.field private static final CHECKBOX_VIEW_ID:[I = null

.field private static final LOGV:Z = true

.field private static final SEEKBAR_ID:[I = null

.field private static final SEEKBAR_TYPE:[I = null

.field private static final SEEKBAR_UNMUTED_RES_ID:[I = null

.field private static final STREAM_TYPE:[I = null

.field private static final TAG:Ljava/lang/String; = "Settings/VolPref"


# instance fields
.field private final mAudioManager:Landroid/media/AudioManager;

.field private mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

.field private mIsDlgDismissed:Z

.field private mKey:Ljava/lang/String;

.field private final mListener:Lcom/mediatek/common/audioprofile/AudioProfileListener;

.field private final mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

.field private mReceiver:Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;

.field private mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 101
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    .line 105
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_TYPE:[I

    .line 109
    new-array v0, v1, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->STREAM_TYPE:[I

    .line 113
    new-array v0, v1, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->CHECKBOX_VIEW_ID:[I

    .line 117
    new-array v0, v1, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_UNMUTED_RES_ID:[I

    return-void

    .line 101
    nop

    :array_0
    .array-data 0x4
        0xfet 0x0t 0x8t 0x7ft
        0xfat 0x0t 0x8t 0x7ft
        0x0t 0x1t 0x8t 0x7ft
    .end array-data

    .line 105
    :array_1
    .array-data 0x4
        0x5t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
    .end array-data

    .line 109
    :array_2
    .array-data 0x4
        0x2t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
    .end array-data

    .line 113
    :array_3
    .array-data 0x4
        0xf9t 0x0t 0x8t 0x7ft
        0xfdt 0x0t 0x8t 0x7ft
        0xfft 0x0t 0x8t 0x7ft
    .end array-data

    .line 117
    :array_4
    .array-data 0x4
        0x9ft 0x2t 0x8t 0x1t
        0x9ct 0x2t 0x8t 0x1t
        0x98t 0x2t 0x8t 0x1t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 142
    invoke-direct {p0, p1, p2}, Landroid/preference/SeekBarDialogPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 97
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mIsDlgDismissed:Z

    .line 908
    new-instance v0, Lcom/mediatek/audioprofile/RingerVolumePreference$1;

    invoke-direct {v0, p0}, Lcom/mediatek/audioprofile/RingerVolumePreference$1;-><init>(Lcom/mediatek/audioprofile/RingerVolumePreference;)V

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mListener:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    .line 143
    const v0, 0x7f040063

    invoke-virtual {p0, v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->setDialogLayoutResource(I)V

    .line 144
    const v0, 0x7f02008f

    invoke-virtual {p0, v0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->setDialogIcon(I)V

    .line 145
    const-string v0, "audio"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    .line 147
    const-string v0, "audioprofile"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/audioprofile/AudioProfileManager;

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    .line 149
    sget-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v0, v0

    new-array v0, v0, [Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .line 150
    invoke-static {p1}, Lcom/android/settings/Utils;->getAudioProfilePlgin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IAudioProfileExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    .line 151
    return-void
.end method

.method static synthetic access$100()[I
    .locals 1

    .prologue
    .line 86
    sget-object v0, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/audioprofile/AudioProfileManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/audioprofile/RingerVolumePreference;)Landroid/media/AudioManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mAudioManager:Landroid/media/AudioManager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/audioprofile/RingerVolumePreference;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/audioprofile/RingerVolumePreference;)Lcom/mediatek/settings/ext/IAudioProfileExt;
    .locals 1
    .parameter "x0"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/audioprofile/RingerVolumePreference;)[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    .locals 1
    .parameter "x0"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    return-object v0
.end method


# virtual methods
.method protected onBindDialogView(Landroid/view/View;)V
    .locals 12
    .parameter "view"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 161
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onBindDialogView(Landroid/view/View;)V

    .line 163
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 164
    .local v0, context:Landroid/content/Context;
    new-instance v7, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;-><init>(Lcom/mediatek/audioprofile/RingerVolumePreference;Lcom/mediatek/audioprofile/RingerVolumePreference$1;)V

    iput-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mReceiver:Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;

    .line 165
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 166
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v7, "android.media.VOLUME_CHANGED_ACTION"

    invoke-virtual {v1, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 167
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mReceiver:Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;

    invoke-virtual {v0, v7, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 169
    iput-boolean v10, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mIsDlgDismissed:Z

    .line 170
    const-string v7, "Settings/VolPref"

    const-string v8, "set mIsDlgDismissed to false "

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    sget-object v7, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v7, v7

    if-ge v3, v7, :cond_3

    .line 173
    sget-object v7, Lcom/mediatek/audioprofile/RingerVolumePreference;->CHECKBOX_VIEW_ID:[I

    aget v7, v7, v3

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 175
    .local v5, imageview:Landroid/widget/ImageView;
    if-eqz v5, :cond_0

    .line 176
    sget-object v7, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_UNMUTED_RES_ID:[I

    aget v7, v7, v3

    invoke-virtual {v5, v7}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 179
    :cond_0
    sget-object v7, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    aget v7, v7, v3

    invoke-virtual {p1, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/SeekBar;

    .line 180
    .local v6, seekBar:Landroid/widget/SeekBar;
    if-eqz v6, :cond_2

    .line 181
    if-nez v3, :cond_1

    .line 182
    invoke-virtual {v6}, Landroid/widget/SeekBar;->requestFocus()Z

    .line 184
    :cond_1
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    new-instance v8, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    sget-object v9, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_TYPE:[I

    aget v9, v9, v3

    invoke-direct {v8, p0, v0, v6, v9}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;-><init>(Lcom/mediatek/audioprofile/RingerVolumePreference;Landroid/content/Context;Landroid/widget/SeekBar;I)V

    aput-object v8, v7, v3

    .line 186
    invoke-virtual {v6, p0}, Landroid/widget/SeekBar;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 172
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 190
    .end local v5           #imageview:Landroid/widget/ImageView;
    .end local v6           #seekBar:Landroid/widget/SeekBar;
    :cond_3
    invoke-virtual {p1, v11}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 194
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/android/settings/Utils;->isVoiceCapable(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 195
    const v4, 0x7f0800fb

    .line 196
    .local v4, id:I
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    aget-object v7, v7, v10

    invoke-virtual {v7, v10}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVisible(Z)V

    .line 201
    :goto_1
    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 203
    .local v2, hideSection:Landroid/view/View;
    const/16 v7, 0x8

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 205
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v8, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mListener:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    const/4 v9, 0x4

    invoke-virtual {v7, v8, v9}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    .line 207
    return-void

    .line 198
    .end local v2           #hideSection:Landroid/view/View;
    .end local v4           #id:I
    :cond_4
    const v4, 0x7f0800f7

    .line 199
    .restart local v4       #id:I
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    aget-object v7, v7, v11

    invoke-virtual {v7, v10}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->setVisible(Z)V

    goto :goto_1
.end method

.method protected onDialogClosed(Z)V
    .locals 7
    .parameter "positiveResult"

    .prologue
    const/4 v6, 0x0

    .line 309
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onDialogClosed(Z)V

    .line 310
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-nez v4, :cond_0

    .line 341
    :goto_0
    return-void

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 314
    .local v3, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->stopSample()V

    .line 313
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 316
    .end local v3           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :cond_1
    if-eqz p1, :cond_3

    .line 317
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    array-length v2, v0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_5

    aget-object v3, v0, v1

    .line 318
    .restart local v3       #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getVisible()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 319
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->saveVolume()V

    .line 320
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getSeekBar()Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/widget/SeekBar;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 321
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->stop()V

    .line 317
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 326
    .end local v3           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :cond_3
    const-string v4, "Settings/VolPref"

    const-string v5, "Cacel: Original checked."

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    array-length v2, v0

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v2, :cond_5

    aget-object v3, v0, v1

    .line 328
    .restart local v3       #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getVisible()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 329
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 330
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getSeekBar()Landroid/widget/SeekBar;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/widget/SeekBar;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 331
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->stop()V

    .line 327
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 336
    .end local v3           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :cond_5
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mIsDlgDismissed:Z

    .line 337
    const-string v4, "Settings/VolPref"

    const-string v5, "set mIsDlgDismissed to true"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mReceiver:Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeReceiver;

    invoke-virtual {v4, v5}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 339
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v5, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mListener:Lcom/mediatek/common/audioprofile/AudioProfileListener;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Lcom/mediatek/audioprofile/AudioProfileManager;->listenAudioProfie(Lcom/mediatek/common/audioprofile/AudioProfileListener;I)V

    goto :goto_0
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 8
    .parameter "v"
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 257
    iget-object v7, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-nez v7, :cond_1

    .line 281
    :cond_0
    :goto_0
    return v5

    .line 261
    :cond_1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v7

    if-nez v7, :cond_2

    move v2, v5

    .line 262
    .local v2, isdown:Z
    :goto_1
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_2
    if-ge v1, v3, :cond_0

    aget-object v4, v0, v1

    .line 263
    .local v4, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v4, :cond_3

    invoke-virtual {v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getSeekBar()Landroid/widget/SeekBar;

    move-result-object v7

    if-eqz v7, :cond_3

    invoke-virtual {v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->getSeekBar()Landroid/widget/SeekBar;

    move-result-object v7

    invoke-virtual {v7}, Landroid/widget/SeekBar;->isFocused()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 265
    packed-switch p2, :pswitch_data_0

    move v5, v6

    .line 277
    goto :goto_0

    .end local v0           #arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    .end local v1           #i$:I
    .end local v2           #isdown:Z
    .end local v3           #len$:I
    .end local v4           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :cond_2
    move v2, v6

    .line 261
    goto :goto_1

    .line 267
    .restart local v0       #arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    .restart local v1       #i$:I
    .restart local v2       #isdown:Z
    .restart local v3       #len$:I
    .restart local v4       #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :pswitch_0
    if-eqz v2, :cond_0

    .line 268
    const/4 v6, -0x1

    invoke-virtual {v4, v6}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->changeVolumeBy(I)V

    goto :goto_0

    .line 272
    :pswitch_1
    if-eqz v2, :cond_0

    .line 273
    invoke-virtual {v4, v5}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->changeVolumeBy(I)V

    goto :goto_0

    .line 262
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 265
    nop

    :pswitch_data_0
    .packed-switch 0x18
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 6
    .parameter "state"

    .prologue
    .line 380
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-class v5, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 382
    :cond_0
    invoke-super {p0, p1}, Landroid/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 398
    :cond_1
    return-void

    :cond_2
    move-object v1, p1

    .line 386
    check-cast v1, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;

    .line 387
    .local v1, myState:Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;
    invoke-virtual {v1}, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v4

    invoke-super {p0, v4}, Landroid/preference/SeekBarDialogPreference;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 388
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-eqz v4, :cond_1

    .line 389
    sget-object v4, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v4, v4

    invoke-virtual {v1, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;->getVolumeStore(I)[Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;

    move-result-object v3

    .line 391
    .local v3, volumeStore:[Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    sget-object v4, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v4, v4

    if-ge v0, v4, :cond_1

    .line 392
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    aget-object v2, v4, v0

    .line 393
    .local v2, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v2, :cond_3

    .line 394
    aget-object v4, v3, v0

    invoke-virtual {v2, v4}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->onRestoreInstanceState(Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;)V

    .line 391
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method protected onSampleStarting(Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;)V
    .locals 4
    .parameter "volumizer"

    .prologue
    .line 291
    if-nez p1, :cond_1

    .line 299
    :cond_0
    return-void

    .line 294
    :cond_1
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 295
    .local v3, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_2

    if-eq v3, p1, :cond_2

    .line 296
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->stopSample()V

    .line 294
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 6

    .prologue
    .line 352
    invoke-super {p0}, Landroid/preference/SeekBarDialogPreference;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    .line 353
    .local v2, superState:Landroid/os/Parcelable;
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/RingerVolumePreference;->isPersistent()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 369
    .end local v2           #superState:Landroid/os/Parcelable;
    :goto_0
    return-object v2

    .line 358
    .restart local v2       #superState:Landroid/os/Parcelable;
    :cond_0
    new-instance v1, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;

    invoke-direct {v1, v2}, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 359
    .local v1, myState:Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;
    iget-object v5, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-eqz v5, :cond_2

    .line 360
    sget-object v5, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    invoke-virtual {v1, v5}, Lcom/mediatek/audioprofile/RingerVolumePreference$SavedState;->getVolumeStore(I)[Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;

    move-result-object v4

    .line 362
    .local v4, volumeStore:[Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    sget-object v5, Lcom/mediatek/audioprofile/RingerVolumePreference;->SEEKBAR_ID:[I

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 363
    iget-object v5, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    aget-object v3, v5, v0

    .line 364
    .local v3, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_1

    .line 365
    aget-object v5, v4, v0

    invoke-virtual {v3, v5}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->onSaveInstanceState(Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;)V

    .line 362
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0           #i:I
    .end local v3           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    .end local v4           #volumeStore:[Lcom/mediatek/audioprofile/RingerVolumePreference$VolumeStore;
    :cond_2
    move-object v2, v1

    .line 369
    goto :goto_0
.end method

.method public revertVolume()V
    .locals 7

    .prologue
    .line 230
    const-string v4, "Settings/VolPref"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "mIsDlgDismissed"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mIsDlgDismissed:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    iget-boolean v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mIsDlgDismissed:Z

    if-eqz v4, :cond_1

    .line 242
    :cond_0
    return-void

    .line 234
    :cond_1
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-eqz v4, :cond_0

    .line 235
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 236
    .local v3, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_2

    .line 237
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->revertVolume()V

    .line 238
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->resume()V

    .line 235
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public setProfile(Ljava/lang/String;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 129
    iput-object p1, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mKey:Ljava/lang/String;

    .line 130
    return-void
.end method

.method public stopPlaying()V
    .locals 6

    .prologue
    .line 214
    iget-object v4, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    if-eqz v4, :cond_1

    .line 215
    iget-object v0, p0, Lcom/mediatek/audioprofile/RingerVolumePreference;->mSeekBarVolumizer:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;

    .local v0, arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 216
    .local v3, vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->isPlaying()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 217
    const-string v4, "Settings/VolPref"

    const-string v5, "IsPlaying"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    invoke-virtual {v3}, Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;->stopSample()V

    .line 219
    const-string v4, "Settings/VolPref"

    const-string v5, "stopPlaying"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 223
    .end local v0           #arr$:[Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #vol:Lcom/mediatek/audioprofile/RingerVolumePreference$SeekBarVolumizer;
    :cond_1
    return-void
.end method
