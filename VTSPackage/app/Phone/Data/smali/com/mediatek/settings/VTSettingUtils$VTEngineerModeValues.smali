.class public Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;
.super Ljava/lang/Object;
.source "VTSettingUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/settings/VTSettingUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VTEngineerModeValues"
.end annotation


# instance fields
.field public auto_answer:Z

.field public auto_answer_time:Ljava/lang/String;

.field public config_audio_channel_adapt:Ljava/lang/String;

.field public config_multiplex_level:Ljava/lang/String;

.field public config_terminal_type:Ljava/lang/String;

.field public config_use_wnsrp:Ljava/lang/String;

.field public config_video_channel_adapt:Ljava/lang/String;

.field public config_video_channel_reverse:Ljava/lang/String;

.field public config_video_codec_preference:Ljava/lang/String;

.field public debug_message:Z

.field public h223_raw_data:Z

.field public h263_only:Z

.field public log_filter_tag_0_value:I

.field public log_filter_tag_1_value:I

.field public log_filter_tag_2_value:I

.field public log_filter_tag_3_value:I

.field public log_filter_tag_4_value:I

.field public log_filter_tag_5_value:I

.field public log_filter_tag_6_value:I

.field public log_to_file:Z

.field public peer_audio_recoder_format:Ljava/lang/String;

.field public peer_audio_recoder_service:Z

.field public peer_video_recoder_format:Ljava/lang/String;

.field public peer_video_recoder_service:Z

.field final synthetic this$0:Lcom/mediatek/settings/VTSettingUtils;

.field public working_mode:Ljava/lang/String;

.field public working_mode_detail:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/mediatek/settings/VTSettingUtils;)V
    .locals 0
    .parameter

    .prologue
    .line 196
    iput-object p1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->this$0:Lcom/mediatek/settings/VTSettingUtils;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 197
    invoke-virtual {p0}, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->resetValuesToDefault()V

    .line 198
    return-void
.end method


# virtual methods
.method public resetValuesToDefault()V
    .locals 3

    .prologue
    const/16 v2, 0x18

    const/4 v1, 0x0

    .line 201
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode:Ljava/lang/String;

    .line 202
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->working_mode_detail:Ljava/lang/String;

    .line 203
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_audio_channel_adapt:Ljava/lang/String;

    .line 204
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_adapt:Ljava/lang/String;

    .line 205
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_channel_reverse:Ljava/lang/String;

    .line 206
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_multiplex_level:Ljava/lang/String;

    .line 207
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_video_codec_preference:Ljava/lang/String;

    .line 208
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_use_wnsrp:Ljava/lang/String;

    .line 209
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->config_terminal_type:Ljava/lang/String;

    .line 210
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer:Z

    .line 211
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->auto_answer_time:Ljava/lang/String;

    .line 212
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_service:Z

    .line 213
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_audio_recoder_format:Ljava/lang/String;

    .line 214
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_service:Z

    .line 215
    const-string v0, "0"

    iput-object v0, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->peer_video_recoder_format:Ljava/lang/String;

    .line 216
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->debug_message:Z

    .line 217
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h223_raw_data:Z

    .line 218
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_to_file:Z

    .line 219
    iput-boolean v1, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->h263_only:Z

    .line 221
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_0_value:I

    .line 222
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_1_value:I

    .line 223
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_2_value:I

    .line 224
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_3_value:I

    .line 225
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_4_value:I

    .line 226
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_5_value:I

    .line 227
    iput v2, p0, Lcom/mediatek/settings/VTSettingUtils$VTEngineerModeValues;->log_filter_tag_6_value:I

    .line 228
    return-void
.end method
