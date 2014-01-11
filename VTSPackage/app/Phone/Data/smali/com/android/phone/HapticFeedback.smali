.class public Lcom/android/phone/HapticFeedback;
.super Ljava/lang/Object;
.source "HapticFeedback.java"


# static fields
.field private static final DURATION:J = 0x4L

.field private static final NO_REPEAT:I = -0x1

.field private static final TAG:Ljava/lang/String; = "HapticFeedback"

.field private static final VIBRATION_PATTERN_ID:I = 0x1070024


# instance fields
.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mEnabled:Z

.field private mHapticPattern:[J

.field private mSettingEnabled:Z

.field private mSystemSettings:Landroid/provider/Settings$System;

.field private mVibrator:Landroid/os/Vibrator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private loadHapticSystemPattern(Landroid/content/res/Resources;)Z
    .locals 6
    .parameter "r"

    .prologue
    const/4 v3, 0x0

    .line 151
    const/4 v4, 0x0

    iput-object v4, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    .line 153
    const v4, 0x1070024

    :try_start_0
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getIntArray(I)[I
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 159
    .local v2, pattern:[I
    if-eqz v2, :cond_0

    array-length v4, v2

    if-nez v4, :cond_1

    .line 160
    :cond_0
    const-string v4, "HapticFeedback"

    const-string v5, "Haptic pattern is null or empty."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    .end local v2           #pattern:[I
    :goto_0
    return v3

    .line 154
    :catch_0
    move-exception v1

    .line 155
    .local v1, nfe:Landroid/content/res/Resources$NotFoundException;
    const-string v4, "HapticFeedback"

    const-string v5, "Vibrate pattern missing."

    invoke-static {v4, v5, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 165
    .end local v1           #nfe:Landroid/content/res/Resources$NotFoundException;
    .restart local v2       #pattern:[I
    :cond_1
    array-length v3, v2

    new-array v3, v3, [J

    iput-object v3, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    .line 166
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v3, v2

    if-ge v0, v3, :cond_2

    .line 167
    iget-object v3, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    aget v4, v2, v0

    int-to-long v4, v4

    aput-wide v4, v3, v0

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 169
    :cond_2
    const/4 v3, 0x1

    goto :goto_0
.end method


# virtual methods
.method public checkSystemSetting()V
    .locals 6

    .prologue
    const/4 v3, 0x0

    .line 110
    iget-boolean v2, p0, Lcom/android/phone/HapticFeedback;->mEnabled:Z

    if-nez v2, :cond_0

    .line 121
    :goto_0
    return-void

    .line 114
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/android/phone/HapticFeedback;->mSystemSettings:Landroid/provider/Settings$System;

    iget-object v2, p0, Lcom/android/phone/HapticFeedback;->mContentResolver:Landroid/content/ContentResolver;

    const-string v4, "haptic_feedback_enabled"

    const/4 v5, 0x0

    invoke-static {v2, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 115
    .local v1, val:I
    if-eqz v1, :cond_1

    const/4 v2, 0x1

    :goto_1
    iput-boolean v2, p0, Lcom/android/phone/HapticFeedback;->mSettingEnabled:Z
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    .end local v1           #val:I
    :catch_0
    move-exception v0

    .line 117
    .local v0, nfe:Landroid/content/res/Resources$NotFoundException;
    const-string v2, "HapticFeedback"

    const-string v4, "Could not retrieve system setting."

    invoke-static {v2, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    iput-boolean v3, p0, Lcom/android/phone/HapticFeedback;->mSettingEnabled:Z

    goto :goto_0

    .end local v0           #nfe:Landroid/content/res/Resources$NotFoundException;
    .restart local v1       #val:I
    :cond_1
    move v2, v3

    .line 115
    goto :goto_1
.end method

.method public init(Landroid/content/Context;Z)V
    .locals 1
    .parameter "context"
    .parameter "enabled"

    .prologue
    .line 91
    iput-boolean p2, p0, Lcom/android/phone/HapticFeedback;->mEnabled:Z

    .line 92
    if-eqz p2, :cond_0

    .line 95
    new-instance v0, Landroid/os/SystemVibrator;

    invoke-direct {v0}, Landroid/os/SystemVibrator;-><init>()V

    iput-object v0, p0, Lcom/android/phone/HapticFeedback;->mVibrator:Landroid/os/Vibrator;

    .line 97
    const/4 v0, 0x4

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    .line 99
    new-instance v0, Landroid/provider/Settings$System;

    invoke-direct {v0}, Landroid/provider/Settings$System;-><init>()V

    iput-object v0, p0, Lcom/android/phone/HapticFeedback;->mSystemSettings:Landroid/provider/Settings$System;

    .line 100
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/phone/HapticFeedback;->mContentResolver:Landroid/content/ContentResolver;

    .line 102
    :cond_0
    return-void

    .line 97
    nop

    :array_0
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xct 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public vibrate()V
    .locals 3

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/android/phone/HapticFeedback;->mEnabled:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/phone/HapticFeedback;->mSettingEnabled:Z

    if-nez v0, :cond_1

    .line 143
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    iget-object v0, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    array-length v0, v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 139
    iget-object v0, p0, Lcom/android/phone/HapticFeedback;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    const/4 v2, 0x0

    aget-wide v1, v1, v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    goto :goto_0

    .line 141
    :cond_2
    iget-object v0, p0, Lcom/android/phone/HapticFeedback;->mVibrator:Landroid/os/Vibrator;

    iget-object v1, p0, Lcom/android/phone/HapticFeedback;->mHapticPattern:[J

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate([JI)V

    goto :goto_0
.end method
