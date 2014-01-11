.class public Lcom/android/settings/HDMISettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "HDMISettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final HDMI_VIDEO_RESOLUTION_DEFAULT:I = 0x2

.field private static final KEY_TOGGLE_AUDIO:Ljava/lang/String; = "audio_toggler"

.field private static final KEY_TOGGLE_HDMI:Ljava/lang/String; = "hdmi_toggler"

.field private static final KEY_TOGGLE_VIDEO:Ljava/lang/String; = "video_toggler"

.field private static final KEY_VIDEO_RESOLUTION:Ljava/lang/String; = "video_resolution"

.field private static final KEY_VIDEO_RESOLUTION_8193:Ljava/lang/String; = "video_resolution_8193"

.field private static final TAG:Ljava/lang/String; = "hdmi"


# instance fields
.field private mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

.field private mHDMIServiceConn:Landroid/content/ServiceConnection;

.field private mIsHDMIEnabled:Z

.field mLocalServiceReceiver:Landroid/content/BroadcastReceiver;

.field private mToggleAudioPref:Landroid/preference/CheckBoxPreference;

.field private mToggleHDMIPref:Landroid/preference/CheckBoxPreference;

.field private mToggleVideoPref:Landroid/preference/CheckBoxPreference;

.field private mVideoResolutionPref:Landroid/preference/ListPreference;

.field private mVideoResolutionPrefTemp:Landroid/preference/ListPreference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    .line 46
    new-instance v0, Lcom/android/settings/HDMISettings$1;

    invoke-direct {v0, p0}, Lcom/android/settings/HDMISettings$1;-><init>(Lcom/android/settings/HDMISettings;)V

    iput-object v0, p0, Lcom/android/settings/HDMISettings;->mHDMIServiceConn:Landroid/content/ServiceConnection;

    .line 60
    new-instance v0, Lcom/android/settings/HDMISettings$2;

    invoke-direct {v0, p0}, Lcom/android/settings/HDMISettings$2;-><init>(Lcom/android/settings/HDMISettings;)V

    iput-object v0, p0, Lcom/android/settings/HDMISettings;->mLocalServiceReceiver:Landroid/content/BroadcastReceiver;

    .line 24
    return-void
.end method

.method static synthetic access$002(Lcom/android/settings/HDMISettings;Lcom/mediatek/hdmi/HDMILocalService;)Lcom/mediatek/hdmi/HDMILocalService;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 24
    iput-object p1, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    return-object p1
.end method

.method static synthetic access$100(Lcom/android/settings/HDMISettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updateSettingsItemEnableStatus()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/settings/HDMISettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updateSelectedResolution()V

    return-void
.end method

.method private updatePref()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 133
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "hdmi_enable_status"

    invoke-static {v2, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v3, :cond_2

    move v2, v3

    :goto_0
    iput-boolean v2, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    .line 135
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "hdmi_audio_status"

    invoke-static {v2, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v3, :cond_3

    move v0, v3

    .line 137
    .local v0, isAudioEnabled:Z
    :goto_1
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "hdmi_video_status"

    invoke-static {v2, v5, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v3, :cond_4

    move v1, v3

    .line 139
    .local v1, isVideoEnabled:Z
    :goto_2
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleHDMIPref:Landroid/preference/CheckBoxPreference;

    iget-boolean v3, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    invoke-virtual {v2, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 140
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_0

    .line 141
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 143
    :cond_0
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 144
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 146
    :cond_1
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updateSelectedResolution()V

    .line 147
    return-void

    .end local v0           #isAudioEnabled:Z
    .end local v1           #isVideoEnabled:Z
    :cond_2
    move v2, v4

    .line 133
    goto :goto_0

    :cond_3
    move v0, v4

    .line 135
    goto :goto_1

    .restart local v0       #isAudioEnabled:Z
    :cond_4
    move v1, v4

    .line 137
    goto :goto_2
.end method

.method private updateSelectedResolution()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    .line 154
    const-string v7, "hdmi"

    const-string v8, "HDMISettings>>updateSelectedResolution()"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    if-nez v7, :cond_1

    .line 156
    const-string v7, "hdmi"

    const-string v8, "HDMISettings>>updateSelectedResolution(), service have not been connected, wait"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 162
    :cond_1
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "hdmi_video_resolution"

    invoke-static {v7, v8}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 174
    .local v6, videoResolution:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v7}, Landroid/preference/ListPreference;->getEntryValues()[Ljava/lang/CharSequence;

    move-result-object v4

    .line 175
    .local v4, resolutionValues:[Ljava/lang/CharSequence;
    const/4 v3, 0x0

    .line 176
    .local v3, resolutionEntries:[Ljava/lang/CharSequence;
    const/4 v1, 0x0

    .line 177
    .local v1, realResolution:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    const/4 v2, 0x0

    .line 213
    .local v2, realResolutionValues:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    const/4 v5, -0x1

    .line 214
    .local v5, selectIndex:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v7, v4

    if-ge v0, v7, :cond_2

    .line 215
    aget-object v7, v4, v0

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 216
    move v5, v0

    .line 220
    :cond_2
    const/4 v7, -0x1

    if-eq v5, v7, :cond_4

    .line 221
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v7, v5}, Landroid/preference/ListPreference;->setValueIndex(I)V

    goto :goto_0

    .line 214
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 223
    :cond_4
    const-string v7, "hdmi"

    const-string v8, " set HDMI video resolution to default value, the first one"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v7, v9}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 227
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    if-eqz v7, :cond_0

    .line 228
    iget-object v7, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    aget-object v8, v4, v9

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v7, v8}, Lcom/mediatek/hdmi/HDMILocalService;->setVideoResolution(I)Z

    goto :goto_0
.end method

.method private updateSettingsItemEnableStatus()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 246
    const-string v2, "hdmi"

    const-string v5, "HDMISettings>>updateSettingsItemEnableStatus()"

    invoke-static {v2, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 247
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    if-nez v2, :cond_0

    .line 248
    const-string v2, "hdmi"

    const-string v3, "HDMI service has not connected, wait"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    :goto_0
    return-void

    .line 251
    :cond_0
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-virtual {v2}, Lcom/mediatek/hdmi/HDMILocalService;->isCablePluged()Z

    move-result v0

    .line 252
    .local v0, isHDMICablePluged:Z
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "hdmi_enable_status"

    invoke-static {v2, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v3, :cond_3

    move v2, v3

    :goto_1
    iput-boolean v2, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    .line 254
    if-eqz v0, :cond_4

    iget-boolean v2, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    if-eqz v2, :cond_4

    move v1, v3

    .line 255
    .local v1, shouldEnable:Z
    :goto_2
    const-string v2, "hdmi"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Is cable pluged?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", isHDMIEnabled?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/settings/HDMISettings;->mIsHDMIEnabled:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 258
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 260
    :cond_1
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_2

    .line 261
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v1}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 263
    :cond_2
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v2, v1}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_0

    .end local v1           #shouldEnable:Z
    :cond_3
    move v2, v4

    .line 252
    goto :goto_1

    :cond_4
    move v1, v4

    .line 254
    goto :goto_2
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    const/4 v6, 0x0

    .line 77
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 78
    const-string v2, "hdmi"

    const-string v3, ">>HDMISettings.onCreate()"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const v2, 0x7f05001b

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->addPreferencesFromResource(I)V

    .line 80
    const-string v2, "hdmi_toggler"

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleHDMIPref:Landroid/preference/CheckBoxPreference;

    .line 81
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleHDMIPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 82
    const-string v2, "audio_toggler"

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    .line 83
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 84
    const-string v2, "video_toggler"

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    .line 85
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 88
    const-string v2, "hdmi"

    const-string v3, "It is not MT8193"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const-string v2, "video_resolution"

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    .line 90
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 91
    const-string v2, "video_resolution_8193"

    invoke-virtual {p0, v2}, Lcom/android/settings/HDMISettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPrefTemp:Landroid/preference/ListPreference;

    .line 92
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPrefTemp:Landroid/preference/ListPreference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 101
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-class v5, Lcom/mediatek/hdmi/HDMILocalService;

    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v4, p0, Lcom/android/settings/HDMISettings;->mHDMIServiceConn:Landroid/content/ServiceConnection;

    const/4 v5, 0x1

    invoke-virtual {v2, v3, v4, v5}, Landroid/app/Activity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    .line 104
    .local v0, bindHdmiServiceFlag:Z
    if-nez v0, :cond_0

    .line 105
    const-string v2, "hdmi"

    const-string v3, "HDMISettings fail to bind HDMI service"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleHDMIPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 107
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 108
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v6}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 109
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mVideoResolutionPref:Landroid/preference/ListPreference;

    invoke-virtual {v2, v6}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 112
    :cond_0
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_1

    .line 113
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mToggleAudioPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 115
    :cond_1
    iget-object v2, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    if-eqz v2, :cond_2

    .line 116
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mToggleVideoPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 119
    :cond_2
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 120
    .local v1, filter:Landroid/content/IntentFilter;
    const-string v2, "com.mediatek.hdmi.localservice.action.CABLE_STATE_CHANGED"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 121
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mLocalServiceReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 122
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 237
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/HDMISettings;->mHDMIServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 238
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/android/settings/HDMISettings;->mLocalServiceReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 239
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onDestroy()V

    .line 240
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .parameter "preference"
    .parameter "newValue"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 267
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 268
    .local v1, key:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    if-nez v3, :cond_0

    .line 269
    const-string v3, "hdmi"

    const-string v4, "HDMISettings  -- Connection to HDMI local service have not been established."

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    .end local p2
    :goto_0
    return v5

    .line 274
    .restart local p2
    :cond_0
    const-string v3, "hdmi_toggler"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 275
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 276
    .local v0, checked:Z
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-virtual {v3, v0}, Lcom/mediatek/hdmi/HDMILocalService;->enableHDMI(Z)Z

    .line 277
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "hdmi_enable_status"

    if-eqz v0, :cond_2

    move v3, v4

    :goto_1
    invoke-static {v6, v7, v3}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 279
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updateSettingsItemEnableStatus()V

    .end local v0           #checked:Z
    :cond_1
    :goto_2
    move v5, v4

    .line 333
    goto :goto_0

    .restart local v0       #checked:Z
    :cond_2
    move v3, v5

    .line 277
    goto :goto_1

    .line 280
    .end local v0           #checked:Z
    .restart local p2
    :cond_3
    const-string v3, "audio_toggler"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 281
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 282
    .restart local v0       #checked:Z
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-virtual {v3, v0}, Lcom/mediatek/hdmi/HDMILocalService;->enableAudio(Z)Z

    .line 283
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "hdmi_audio_status"

    if-eqz v0, :cond_4

    move v5, v4

    :cond_4
    invoke-static {v3, v6, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_2

    .line 285
    .end local v0           #checked:Z
    .restart local p2
    :cond_5
    const-string v3, "video_toggler"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 286
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 287
    .restart local v0       #checked:Z
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-virtual {v3, v0}, Lcom/mediatek/hdmi/HDMILocalService;->enableVideo(Z)Z

    .line 288
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "hdmi_video_status"

    if-eqz v0, :cond_6

    move v5, v4

    :cond_6
    invoke-static {v3, v6, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_2

    .line 290
    .end local v0           #checked:Z
    .restart local p2
    :cond_7
    const-string v3, "video_resolution"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 291
    const-string v5, "hdmi"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "HDMISettings  -- key: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, " newValue: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, p2

    .line 292
    check-cast v2, Ljava/lang/String;

    .line 293
    .local v2, newResolution:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/mediatek/hdmi/HDMILocalService;->setVideoResolution(I)Z

    .line 294
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v5, "hdmi_video_resolution"

    invoke-static {v3, v5, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_2

    .line 296
    .end local v2           #newResolution:Ljava/lang/String;
    :cond_8
    const-string v3, "video_resolution_8193"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 297
    const-string v6, "hdmi"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "HDMISettings  -- key: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " newValue: "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v3, p2

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, p2

    .line 298
    check-cast v2, Ljava/lang/String;

    .line 300
    .restart local v2       #newResolution:Ljava/lang/String;
    const-string v3, "100"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 301
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    if-eqz v3, :cond_9

    .line 303
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v5

    shr-int/lit8 v3, v3, 0x1

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_a

    .line 305
    const-string v2, "102"

    .line 328
    :cond_9
    :goto_3
    const-string v3, "hdmi"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Final resolution: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 329
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v5}, Lcom/mediatek/hdmi/HDMILocalService;->setVideoResolution(I)Z

    .line 330
    invoke-virtual {p0}, Lcom/android/settings/HDMISettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v5, "hdmi_video_resolution"

    invoke-static {v3, v5, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    goto/16 :goto_2

    .line 306
    :cond_a
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v4

    shr-int/lit8 v3, v3, 0xb

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_b

    .line 308
    const-string v2, "103"

    goto :goto_3

    .line 309
    :cond_b
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v5

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_c

    .line 311
    const-string v2, "100"

    goto :goto_3

    .line 312
    :cond_c
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v4

    shr-int/lit8 v3, v3, 0xa

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_9

    .line 314
    const-string v2, "101"

    goto :goto_3

    .line 317
    :cond_d
    const-string v3, "8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 319
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v5

    shr-int/lit8 v3, v3, 0x15

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_e

    .line 320
    const-string v2, "9"

    .line 323
    :cond_e
    iget-object v3, p0, Lcom/android/settings/HDMISettings;->mHDMIService:Lcom/mediatek/hdmi/HDMILocalService;

    sget-object v3, Lcom/mediatek/hdmi/HDMILocalService;->sEdid:[I

    aget v3, v3, v4

    shr-int/lit8 v3, v3, 0x14

    and-int/lit8 v3, v3, 0x1

    if-ne v4, v3, :cond_9

    .line 324
    const-string v2, "8"

    goto :goto_3
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 126
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updatePref()V

    .line 127
    invoke-direct {p0}, Lcom/android/settings/HDMISettings;->updateSettingsItemEnableStatus()V

    .line 128
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 129
    return-void
.end method
