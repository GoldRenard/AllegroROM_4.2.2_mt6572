.class public Lcom/mediatek/audioprofile/DefaultRingtonePreference;
.super Landroid/preference/RingtonePreference;
.source "DefaultRingtonePreference.java"


# static fields
.field public static final NOTIFICATION_TYPE:Ljava/lang/String; = "NOTIFICATION"

.field public static final RING_TYPE:Ljava/lang/String; = "RING"

.field private static final TAG:Ljava/lang/String; = "Settings/Rt_Pref"


# instance fields
.field private mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

.field private mKey:Ljava/lang/String;

.field private final mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

.field private mStreamType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 87
    invoke-direct {p0, p1, p2}, Landroid/preference/RingtonePreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 88
    const-string v0, "audioprofile"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/audioprofile/AudioProfileManager;

    iput-object v0, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    .line 90
    invoke-static {p1}, Lcom/android/settings/Utils;->getAudioProfilePlgin(Landroid/content/Context;)Lcom/mediatek/settings/ext/IAudioProfileExt;

    move-result-object v0

    iput-object v0, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    .line 91
    return-void
.end method


# virtual methods
.method protected onPrepareRingtonePickerIntent(Landroid/content/Intent;)V
    .locals 3
    .parameter "ringtonePickerIntent"

    .prologue
    const/4 v2, 0x0

    .line 121
    invoke-super {p0, p1}, Landroid/preference/RingtonePreference;->onPrepareRingtonePickerIntent(Landroid/content/Intent;)V

    .line 126
    const-string v0, "android.intent.extra.ringtone.SHOW_DEFAULT"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 129
    iget-object v0, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mStreamType:Ljava/lang/String;

    const-string v1, "RING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 130
    const-string v0, "android.intent.extra.ringtone.SHOW_SILENT"

    invoke-virtual {p1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mExt:Lcom/mediatek/settings/ext/IAudioProfileExt;

    invoke-interface {v0, p1}, Lcom/mediatek/settings/ext/IAudioProfileExt;->setRingtonePickerParams(Landroid/content/Intent;)V

    .line 135
    return-void
.end method

.method protected onRestoreRingtone()Landroid/net/Uri;
    .locals 5

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->getRingtoneType()I

    move-result v0

    .line 158
    .local v0, type:I
    const-string v2, "Settings/Rt_Pref"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onRestoreRingtone: type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    iget-object v2, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v3, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mKey:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Lcom/mediatek/audioprofile/AudioProfileManager;->getRingtoneUri(Ljava/lang/String;I)Landroid/net/Uri;

    move-result-object v1

    .line 161
    .local v1, uri:Landroid/net/Uri;
    const-string v3, "Settings/Rt_Pref"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onRestoreRingtone: uri = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-nez v1, :cond_0

    const-string v2, "null"

    :goto_0
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    return-object v1

    .line 161
    :cond_0
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method protected onSaveRingtone(Landroid/net/Uri;)V
    .locals 3
    .parameter "ringtoneUri"

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mProfileManager:Lcom/mediatek/audioprofile/AudioProfileManager;

    iget-object v1, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mKey:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->getRingtoneType()I

    move-result v2

    invoke-virtual {v0, v1, v2, p1}, Lcom/mediatek/audioprofile/AudioProfileManager;->setRingtoneUri(Ljava/lang/String;ILandroid/net/Uri;)V

    .line 147
    return-void
.end method

.method public setProfile(Ljava/lang/String;)V
    .locals 0
    .parameter "key"

    .prologue
    .line 100
    iput-object p1, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mKey:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setStreamType(Ljava/lang/String;)V
    .locals 0
    .parameter "streamType"

    .prologue
    .line 110
    iput-object p1, p0, Lcom/mediatek/audioprofile/DefaultRingtonePreference;->mStreamType:Ljava/lang/String;

    .line 111
    return-void
.end method
