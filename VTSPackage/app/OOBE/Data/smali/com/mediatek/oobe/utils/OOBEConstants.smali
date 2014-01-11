.class public Lcom/mediatek/oobe/utils/OOBEConstants;
.super Ljava/lang/Object;
.source "OOBEConstants.java"


# static fields
.field public static final ACTION_ADVANCED_SETTINGS:Ljava/lang/String; = "com.mediatek.oobe.advanced.AdvanceSettings"

.field public static final ACTION_DATE_TIME_SETTING:Ljava/lang/String; = "com.android.settings.DATE_TIME_SETTINGS_WIZARD"

.field public static final ACTION_DEFAULT_SIM:Ljava/lang/String; = "com.mediatek.oobe.basic.DEFAULT_SIM_SETTINGS_WIZARD"

.field public static final ACTION_IMPORT_CONTACTS:Ljava/lang/String; = "com.mediatek.oobe.basic.OOBE_IMPORT_CONTACTS"

.field public static final ACTION_INTERNET_CONNECTION:Ljava/lang/String; = "com.mediatek.oobe.basic.OOBE_INTERNET_CONNECTION"

.field public static final ACTION_KEYBOARD_SETTING:Ljava/lang/String; = "com.mediatek.oobe.basic.OOBE_KEYBOARD_SETTING"

.field public static final ACTION_LANGUAGE_SETTING:Ljava/lang/String; = "com.mediatek.oobe.basic.OOBE_LANGUAGE_SETTING"

.field public static final ACTION_QUICK_START_GUIDE:Ljava/lang/String; = "com.mediatek.oobe.QUICK_START_GUIDE"

.field public static final ACTION_SIM_MANAGEMENT:Ljava/lang/String; = "com.mediatek.oobe.basic.SIM_MANAGEMENT_SETTINGS_WIZARD"

.field public static final ACTION_SNS_SETTING:Ljava/lang/String; = "com.mediatek.oobe.advanced.SNSSettings"

.field public static final ACTION_TIMEZONE_PICKER:Ljava/lang/String; = "com.mediatek.oobe.basic.TIMEZONE_PICKER_WIZARD"

.field public static final ACTION_WIFI_SETTING:Ljava/lang/String; = "com.mediatek.oobe.basic.WIFI_SETTINGS_WIZARD"

.field public static final DEBUG:Z = false

.field public static final ID_BASIC_CONGRATULATION:I = 0x9

.field public static final ID_DATE_TIME_SETTING:I = 0x8

.field public static final ID_DEFAULT_SIM_SETTING:I = 0x4

.field public static final ID_IMPORT_CONTACTS:I = 0x5

.field public static final ID_INTERNET_CONNECTION:I = 0x6

.field public static final ID_KEYBOARD_SETTING:I = 0x2

.field public static final ID_LANGUAGE_SETTING:I = 0x1

.field public static final ID_SIM_MANAGEMENT_SETTING:I = 0x3

.field public static final ID_WIFI_SETTING:I = 0x7

.field public static final OOBE_BASIC_RESULT:Ljava/lang/String; = "oobe_result"

.field public static final OOBE_BASIC_STEP_INDEX:Ljava/lang/String; = "oobe_step_index"

.field public static final OOBE_BASIC_STEP_TOTAL:Ljava/lang/String; = "oobe_step_total"

.field public static final OOBE_HAS_RUN_KEY:Ljava/lang/String; = "oobe_has_run"

.field public static final RESULT_CODE_BACK:I = 0x15

.field public static final RESULT_CODE_FINISH:I = 0x16

.field public static final RESULT_CODE_NEXT:I = 0x14

.field public static final RESULT_CODE_SKIP:I = 0x18

.field public static final RESULT_QUICK_START_GUIDE_FINISH:I = 0x19

.field public static final TAG:Ljava/lang/String; = "OOBE"

.field public static final WITH_GESTURE:Z = true


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 42
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static logd(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 107
    return-void
.end method

.method public static loge(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 114
    const-string v0, "OOBE"

    invoke-static {v0, p0}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    return-void
.end method

.method public static logi(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 97
    return-void
.end method

.method public static logw(Ljava/lang/String;)V
    .locals 0
    .parameter "message"

    .prologue
    .line 125
    return-void
.end method
