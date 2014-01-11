.class public Lcom/mediatek/settings/VTSettingUtils;
.super Ljava/lang/Object;
.source "VTSettingUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;
    }
.end annotation


# static fields
.field private static final DBG:Z = true

.field private static final DBGEM:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "VTSettingUtils"

.field private static final VT_SETTINGS_UTILS:Lcom/mediatek/settings/VTSettingUtils;


# instance fields
.field public mAutoDropBack:Z

.field public mEnableBackCamera:Z

.field public mPeerBigger:Z

.field public mPicToReplaceLocal:Ljava/lang/String;

.field public mPicToReplacePeer:Ljava/lang/String;

.field public mRingOnlyOnce:Z

.field public mShowLocalMO:Z

.field public mShowLocalMT:Ljava/lang/String;

.field public mToReplacePeer:Z

.field public mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 69
    new-instance v0, Lcom/mediatek/settings/VTSettingUtils;

    invoke-direct {v0}, Lcom/mediatek/settings/VTSettingUtils;-><init>()V

    sput-object v0, Lcom/mediatek/settings/VTSettingUtils;->VT_SETTINGS_UTILS:Lcom/mediatek/settings/VTSettingUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;-><init>(Lcom/mediatek/settings/VTSettingUtils;)V

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    .line 77
    invoke-virtual {p0}, Lcom/mediatek/settings/VTSettingUtils;->resetVTSettingToDefaultValue()V

    .line 78
    return-void
.end method

.method public static getInstance()Lcom/mediatek/settings/VTSettingUtils;
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/mediatek/settings/VTSettingUtils;->VT_SETTINGS_UTILS:Lcom/mediatek/settings/VTSettingUtils;

    return-object v0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 53
    const-string v0, "VTSettingUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    return-void
.end method


# virtual methods
.method public resetVTSettingToDefaultValue()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 81
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    .line 82
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    .line 83
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    .line 84
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    .line 85
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    .line 86
    iput-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mRingOnlyOnce:Z

    .line 87
    iput-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    .line 88
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    .line 89
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    .line 90
    return-void
.end method

.method public updateVTEngineerModeValues()V
    .locals 11

    .prologue
    const/4 v10, 0x3

    const/16 v9, 0x18

    const/16 v8, 0x8

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 234
    const-string v3, "updateVTEngineerModeValues()..."

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 237
    const/4 v1, 0x0

    .line 239
    .local v1, emContext:Landroid/content/Context;
    :try_start_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    const-string v4, "com.mediatek.engineermode"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lcom/android/phone/PhoneGlobals;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 248
    const-string v3, "engineermode_vt_preferences"

    invoke-virtual {v1, v3, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 251
    .local v2, sp:Landroid/content/SharedPreferences;
    if-nez v2, :cond_0

    .line 253
    const-string v3, "updateVTEngineerModeValues() : can not find \'engineermode_vt_preferences\'..."

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 422
    .end local v2           #sp:Landroid/content/SharedPreferences;
    :goto_0
    return-void

    .line 241
    :catch_0
    move-exception v0

    .line 243
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "updateVTEngineerModeValues() : can not find \'com.mediatek.engineermode\'..."

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 258
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v2       #sp:Landroid/content/SharedPreferences;
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "working_mode"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode:Ljava/lang/String;

    .line 259
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "working_mode_detail"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode_detail:Ljava/lang/String;

    .line 260
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_audio_channel_adapt"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_audio_channel_adapt:Ljava/lang/String;

    .line 261
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_video_channel_adapt"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_adapt:Ljava/lang/String;

    .line 262
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_video_channel_reverse"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_reverse:Ljava/lang/String;

    .line 263
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_multiplex_level"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_multiplex_level:Ljava/lang/String;

    .line 264
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_video_codec_preference"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_codec_preference:Ljava/lang/String;

    .line 265
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_use_wnsrp"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_use_wnsrp:Ljava/lang/String;

    .line 266
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "config_terminal_type"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_terminal_type:Ljava/lang/String;

    .line 267
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "auto_answer"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer:Z

    .line 268
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "auto_answer_time"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer_time:Ljava/lang/String;

    .line 269
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "peer_audio_recoder_service"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_service:Z

    .line 270
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "peer_audio_recoder_format"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_format:Ljava/lang/String;

    .line 271
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "peer_video_recoder_service"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_service:Z

    .line 272
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "peer_video_recoder_format"

    const-string v5, "0"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_format:Ljava/lang/String;

    .line 273
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "debug_message"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->debug_message:Z

    .line 274
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "h223_raw_data"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h223_raw_data:Z

    .line 275
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_to_file"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_to_file:Z

    .line 276
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "h263_only"

    invoke-interface {v2, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h263_only:Z

    .line 278
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_0_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_0_value:I

    .line 279
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_1_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_1_value:I

    .line 280
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_2_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_2_value:I

    .line 281
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_3_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_3_value:I

    .line 282
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_4_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_4_value:I

    .line 283
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_5_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_5_value:I

    .line 284
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    const-string v4, "log_filter_tag_6_value"

    invoke-interface {v2, v4, v9}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_6_value:I

    .line 287
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.working_mode = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 290
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.working_mode_detail = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode_detail:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 293
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_audio_channel_adapt = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_audio_channel_adapt:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 296
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_video_channel_adapt = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_adapt:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 299
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_video_channel_reverse = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_reverse:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 303
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_multiplex_level = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_multiplex_level:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 306
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_video_codec_preference = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_codec_preference:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 310
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_use_wnsrp = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_use_wnsrp:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 313
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.config_terminal_type = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_terminal_type:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 316
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.auto_answer = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 319
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.auto_answer_time = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer_time:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 322
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.peer_audio_recoder_service = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_service:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 325
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.peer_audio_recoder_format = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_format:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 328
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.peer_video_recoder_service = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_service:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 331
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.peer_video_recoder_format = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_format:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 334
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.debug_message = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->debug_message:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.h223_raw_data = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h223_raw_data:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 340
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_to_file = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_to_file:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 343
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.h263_only = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h263_only:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 346
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_0_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_0_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 349
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_1_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_1_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 352
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_2_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_2_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 355
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_3_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_3_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 358
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_4_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_4_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 361
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_5_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_5_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 364
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - mVTEngineerModeValues.log_filter_tag_6_value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_6_value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 367
    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode_detail:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v6, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 369
    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_audio_channel_adapt:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v7, v6, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 370
    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_adapt:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v7, v7, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 371
    const/4 v3, 0x2

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_reverse:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v7, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 372
    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_multiplex_level:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v7, v10, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 373
    const/4 v3, 0x4

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_codec_preference:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v7, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 374
    const/4 v3, 0x5

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_use_wnsrp:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v7, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 375
    const/4 v3, 0x6

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_terminal_type:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v7, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 377
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_service:Z

    if-eqz v3, :cond_1

    .line 378
    invoke-static {v10, v6, v7}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 382
    :goto_1
    new-instance v3, Ljava/lang/Integer;

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_format:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v10, v7, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 384
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_service:Z

    if-eqz v3, :cond_2

    .line 385
    const/4 v3, 0x4

    invoke-static {v3, v6, v7}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 389
    :goto_2
    const/4 v3, 0x4

    new-instance v4, Ljava/lang/Integer;

    iget-object v5, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-object v5, v5, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_format:Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/Integer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v3, v7, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 391
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->debug_message:Z

    if-eqz v3, :cond_3

    .line 392
    const/4 v3, 0x5

    invoke-static {v3, v7, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 397
    :goto_3
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h223_raw_data:Z

    if-eqz v3, :cond_4

    .line 398
    const/4 v3, 0x6

    invoke-static {v3, v7, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 403
    :goto_4
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_to_file:Z

    if-eqz v3, :cond_5

    .line 404
    const/4 v3, 0x7

    invoke-static {v3, v7, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 409
    :goto_5
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_0_value:I

    invoke-static {v8, v6, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 410
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_1_value:I

    invoke-static {v8, v7, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 411
    const/4 v3, 0x2

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_2_value:I

    invoke-static {v8, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 412
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_3_value:I

    invoke-static {v8, v10, v3}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 413
    const/4 v3, 0x4

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_4_value:I

    invoke-static {v8, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 414
    const/4 v3, 0x5

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_5_value:I

    invoke-static {v8, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 415
    const/4 v3, 0x6

    iget-object v4, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget v4, v4, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_6_value:I

    invoke-static {v8, v3, v4}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    .line 417
    iget-object v3, p0, Lcom/mediatek/settings/VTSettingUtils;->mVTEngineerModeValues:Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;

    iget-boolean v3, v3, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h263_only:Z

    if-eqz v3, :cond_6

    .line 418
    const/16 v3, 0x9

    invoke-static {v3, v7, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto/16 :goto_0

    .line 380
    :cond_1
    invoke-static {v10, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto/16 :goto_1

    .line 387
    :cond_2
    const/4 v3, 0x4

    invoke-static {v3, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto :goto_2

    .line 394
    :cond_3
    const/4 v3, 0x5

    invoke-static {v3, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto :goto_3

    .line 400
    :cond_4
    const/4 v3, 0x6

    invoke-static {v3, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto :goto_4

    .line 406
    :cond_5
    const/4 v3, 0x7

    invoke-static {v3, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto :goto_5

    .line 420
    :cond_6
    const/16 v3, 0x9

    invoke-static {v3, v6, v6}, Lcom/mediatek/vt/VTManager;->setEM(III)V

    goto/16 :goto_0
.end method

.method public updateVTSettingState(I)V
    .locals 5
    .parameter "slotId"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 95
    const-string v1, "updateVTSettingState()..."

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 98
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.android.phone_preferences"

    invoke-virtual {v1, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 101
    .local v0, sp:Landroid/content/SharedPreferences;
    if-nez v0, :cond_0

    .line 103
    const-string v1, "updateVTEngineerModeValues() : can not find \'com.android.phone_preferences\'..."

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 164
    :goto_0
    return-void

    .line 108
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_replace_expand_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_enable_back_camera_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_peer_bigger_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_mo_local_video_display_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    .line 112
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_mt_local_video_display_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    .line 113
    const-string v1, "ring_only_once"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mRingOnlyOnce:Z

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_auto_dropback_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    .line 115
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_enable_peer_replace_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    .line 116
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "button_vt_replace_peer_expand_key_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mPicToReplaceLocal = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplaceLocal:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 122
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mEnableBackCamera = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mEnableBackCamera:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mPeerBigger = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mShowLocalMO = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMO:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 131
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mShowLocalMT = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mShowLocalMT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mAutoDropBack = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mAutoDropBack:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 137
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mRingOnlyOnce = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mRingOnlyOnce:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mToReplacePeer = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " - mPicToReplacePeer = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 146
    const-string v1, "updateVTSettingState() : call VTManager.replacePeerVideoSettings() start !"

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    .line 148
    iget-object v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mPicToReplacePeer:Ljava/lang/String;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 149
    iget-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    if-eqz v1, :cond_1

    .line 150
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/mediatek/vt/VTManager;->replacePeerVideoSettings(ILjava/lang/String;)V

    .line 162
    :goto_1
    const-string v1, "updateVTSettingState() : call VTManager.replacePeerVideoSettings() end !"

    invoke-static {v1}, Lcom/mediatek/settings/VTSettingUtils;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 152
    :cond_1
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Lcom/mediatek/vt/VTManager;->replacePeerVideoSettings(ILjava/lang/String;)V

    goto :goto_1

    .line 155
    :cond_2
    iget-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils;->mToReplacePeer:Z

    if-eqz v1, :cond_3

    .line 156
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-static {p1}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Lcom/mediatek/vt/VTManager;->replacePeerVideoSettings(ILjava/lang/String;)V

    goto :goto_1

    .line 158
    :cond_3
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v1

    invoke-static {p1}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v4, v2}, Lcom/mediatek/vt/VTManager;->replacePeerVideoSettings(ILjava/lang/String;)V

    goto :goto_1
.end method
