.class public Lcom/mediatek/oobe/basic/gemini/SimManagement;
.super Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;
.source "SimManagement.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;


# static fields
.field private static final ALL_RADIO_OFF:I = 0x0

.field private static final ATTACH_TIME_OUT_LENGTH:I = 0x7530

.field private static final DATA_SWITCH_MSG_CASE0:I = 0x0

.field private static final DATA_SWITCH_MSG_CASE1:I = 0x1

.field private static final DATA_SWITCH_MSG_CASE2:I = 0x2

.field private static final DATA_SWITCH_MSG_CASE3:I = 0x3

.field private static final DATA_SWITCH_MSG_CASE4:I = 0x4

.field private static final DETACH_TIME_OUT_LENGTH:I = 0x2710

.field private static final DIALOG_3G_MODEM_SWITCHING:I = 0x3ee

.field private static final DIALOG_3G_MODEM_SWITCH_CONFIRM:I = 0x3ef

.field private static final DIALOG_ACTIVATE:I = 0x3e8

.field private static final DIALOG_DATA_SWITCH:I = 0x44e

.field private static final DIALOG_DEACTIVATE:I = 0x3e9

.field private static final DIALOG_GPRS_SWITCH_CONFIRM:I = 0x3f0

.field private static final DIALOG_MODEN_SWITCH:I = 0x44f

.field private static final DIALOG_NETWORK_MODE:I = 0x450

.field private static final DIALOG_NETWORK_MODE_CHANGE:I = 0x3ed

.field private static final DIALOG_NONE:I = -0x1

.field private static final DIALOG_RADIO_OFF:I = 0x44d

.field private static final DIALOG_RADIO_ON:I = 0x44c

.field private static final DIALOG_WAITING:I = 0x3ec

.field private static final EVENT_ATTACH_TIME_OUT:I = 0x7d1

.field private static final EVENT_DETACH_TIME_OUT:I = 0x7d0

.field private static final EVENT_DUAL_SIM_MODE_CHANGED_COMPLETE:I = 0x1

.field private static final GPRS_SIM_INDEX:I = 0x3

.field private static final KEY_DEFAULT_SIM_SETTINGS_CATEGORY:Ljava/lang/String; = "default_sim"

.field private static final KEY_GENERAL_SETTINGS_CATEGORY:Ljava/lang/String; = "general_settings"

.field private static final KEY_GPRS_SIM_SETTING:Ljava/lang/String; = "gprs_sim_setting"

.field private static final KEY_SIM_CONTACTS_SETTINGS:Ljava/lang/String; = "contacts_sim"

.field private static final KEY_SIM_INFO_CATEGORY:Ljava/lang/String; = "sim_info"

.field private static final KEY_SMS_SIM_SETTING:Ljava/lang/String; = "sms_sim_setting"

.field private static final KEY_VIDEO_CALL_SIM_SETTING:Ljava/lang/String; = "video_call_sim_setting"

.field private static final KEY_VOICE_CALL_SIM_SETTING:Ljava/lang/String; = "voice_call_sim_setting"

.field private static final MMS_TRANSACTION:Ljava/lang/String; = "mms.transaction"

.field private static final PIN1_REQUEST_CODE:I = 0x12e

.field private static final SIM_GENIMI_MODE_DUAL:I = 0x3

.field private static final SIM_GENIMI_MODE_SIM1:I = 0x1

.field private static final SIM_GENIMI_MODE_SIM2:I = 0x2

.field private static final SMS_SIM_INDEX:I = 0x2

.field private static final TAG:Ljava/lang/String; = "SimManagementSettings"

.field private static final TRANSACTION_START:Ljava/lang/String; = "com.android.mms.transaction.START"

.field private static final TRANSACTION_STOP:Ljava/lang/String; = "com.android.mms.transaction.STOP"

.field private static final TYPE_SIM_COLOR:I = 0x1

.field private static final TYPE_SIM_NAME:I = 0x0

.field private static final TYPE_SIM_NUMBER:I = 0x2

.field private static final TYPE_SIM_NUMBER_FORMAT:I = 0x3

.field private static final VEDIO_CALL_OFF:I = -0x1

.field private static final VIDEO_CALL_SIM_INDEX:I = 0x1

.field private static final VOICE_CALL_SIM_INDEX:I

.field private static mIsVoiceCapable:Z

.field private static sAllSimRadioOff:Z

.field private static sCurrentStep:I

.field private static sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

.field private static sGprsTargSim:Z

.field private static sHasSim:Z

.field private static sProgressbarMaxSize:I

.field private static sScreenEnable:Z

.field private static sVTCallSupport:Z

.field private static sVoipAvailable:Z


# instance fields
.field private mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

.field private mDataSwitchMsgIndex:I

.field private mDataSwitchMsgStr:[I

.field private mDualSimMode:I

.field private mDualSimModeChangedHander:Landroid/os/Handler;

.field private mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

.field private mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

.field private mITelephony:Lcom/android/internal/telephony/ITelephony;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mIs3gOff:Z

.field private mIsGprsSwitching:Z

.field private mIsSIMModeSwitching:Z

.field private mIsShowDlg:I

.field private mIsSlot1Insert:Z

.field private mIsSlot2Insert:Z

.field private mIsSmsCapable:Z

.field private mMessenger:Landroid/os/Messenger;

.field private mServiceComplete:Ljava/lang/Runnable;

.field private mSimIdToIndexMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSimItemListGprs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSimItemListSms:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSimItemListVideo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSimItemListVoice:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/oobe/basic/gemini/SimItem;",
            ">;"
        }
    .end annotation
.end field

.field private mSimMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Landroid/provider/Telephony$SIMInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSimReceiver:Landroid/content/BroadcastReceiver;

.field private mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

.field private mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

.field private mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

.field private mTimeHandler:Landroid/os/Handler;

.field private mVTTargetTemp:J

.field private mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

.field private mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 153
    sput-boolean v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    .line 154
    sput-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    .line 155
    sput-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    .line 156
    sput-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsTargSim:Z

    .line 157
    sput-boolean v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    .line 158
    sput-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsVoiceCapable:Z

    .line 159
    sput-boolean v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, -0x1

    const/4 v1, 0x0

    .line 124
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;-><init>()V

    .line 160
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSmsCapable:Z

    .line 161
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIs3gOff:Z

    .line 168
    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    .line 175
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    .line 176
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    .line 220
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    .line 221
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    .line 222
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    .line 223
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    .line 225
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    .line 226
    iput-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z

    .line 238
    iput v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 241
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgStr:[I

    .line 254
    iput v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    .line 257
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$1;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$1;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mServiceComplete:Ljava/lang/Runnable;

    .line 264
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$2;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$2;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimModeChangedHander:Landroid/os/Handler;

    .line 284
    new-instance v0, Landroid/os/Messenger;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimModeChangedHander:Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mMessenger:Landroid/os/Messenger;

    .line 285
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$3;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimReceiver:Landroid/content/BroadcastReceiver;

    .line 1478
    new-instance v0, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;

    invoke-direct {v0, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$13;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    iput-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    return-void

    .line 241
    nop

    :array_0
    .array-data 0x4
        0x1at 0x0t 0x9t 0x7ft
        0x1bt 0x0t 0x9t 0x7ft
        0x1ct 0x0t 0x9t 0x7ft
        0x1dt 0x0t 0x9t 0x7ft
        0x1et 0x0t 0x9t 0x7ft
    .end array-data
.end method

.method static synthetic access$000(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealWithSwtichComplete()V

    return-void
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 124
    sget-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    return v0
.end method

.method static synthetic access$1000(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    return-object v0
.end method

.method static synthetic access$102(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    sput-boolean p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    return p0
.end method

.method static synthetic access$1100(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    invoke-static {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1200(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z

    return v0
.end method

.method static synthetic access$1202(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$1500()Z
    .locals 1

    .prologue
    .line 124
    sget-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsTargSim:Z

    return v0
.end method

.method static synthetic access$1600(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$1700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/content/ContentResolver;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/oobe/basic/gemini/SimManagement;IJ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 124
    invoke-direct {p0, p1, p2, p3}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimValue(IJ)V

    return-void
.end method

.method static synthetic access$1900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    return v0
.end method

.method static synthetic access$200()Z
    .locals 1

    .prologue
    .line 124
    sget-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    return v0
.end method

.method static synthetic access$2000(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->enableDataRoaming(J)V

    return-void
.end method

.method static synthetic access$202(Z)Z
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    sput-boolean p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    return p0
.end method

.method static synthetic access$2100(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchGprsDefautlSIM(J)V

    return-void
.end method

.method static synthetic access$2200(Lcom/mediatek/oobe/basic/gemini/SimManagement;)J
    .locals 2
    .parameter "x0"

    .prologue
    .line 124
    iget-wide v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVTTargetTemp:J

    return-wide v0
.end method

.method static synthetic access$2300(Lcom/mediatek/oobe/basic/gemini/SimManagement;J)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-direct {p0, p1, p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchVideoCallDefaultSIM(J)V

    return-void
.end method

.method static synthetic access$2400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    return v0
.end method

.method static synthetic access$2502(Lcom/mediatek/oobe/basic/gemini/SimManagement;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    return p1
.end method

.method static synthetic access$2600(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealSim1Change()V

    return-void
.end method

.method static synthetic access$2700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealSim2Change()V

    return-void
.end method

.method static synthetic access$2900(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$300()Z
    .locals 1

    .prologue
    .line 124
    sget-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    return v0
.end method

.method static synthetic access$3000(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/oobe/basic/gemini/SimManagement;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    return v0
.end method

.method static synthetic access$502(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    iput p1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    return p1
.end method

.method static synthetic access$600(Lcom/mediatek/oobe/basic/gemini/SimManagement;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Landroid/app/StatusBarManager;
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;

    return-object v0
.end method

.method static synthetic access$800(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 124
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateVideoCallDefaultSIM()V

    return-void
.end method

.method static synthetic access$900(Lcom/mediatek/oobe/basic/gemini/SimManagement;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIs3gOff:Z

    return v0
.end method

.method private addNoSimIndicator()V
    .locals 3

    .prologue
    .line 1219
    const-string v2, "sim_info"

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceGroup;

    .line 1222
    .local v1, simInfoListCategory:Landroid/preference/PreferenceGroup;
    new-instance v0, Landroid/preference/Preference;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    .line 1224
    .local v0, pref:Landroid/preference/Preference;
    if-eqz v0, :cond_0

    .line 1225
    const v2, 0x7f090012

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setTitle(I)V

    .line 1226
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    .line 1229
    :cond_0
    return-void
.end method

.method private addSimInfoPreference()V
    .locals 18

    .prologue
    .line 1109
    const-string v2, "sim_info"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v16

    check-cast v16, Landroid/preference/PreferenceGroup;

    .line 1111
    .local v16, simInfoListCategory:Landroid/preference/PreferenceGroup;
    if-nez v16, :cond_1

    .line 1215
    :cond_0
    return-void

    .line 1114
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v15

    .line 1115
    .local v15, mSiminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    new-instance v2, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;

    invoke-direct {v2}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;-><init>()V

    invoke-static {v15, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1117
    invoke-virtual/range {v16 .. v16}, Landroid/preference/PreferenceGroup;->removeAll()V

    .line 1119
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/provider/Telephony$SIMInfo;

    .line 1121
    .local v17, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v17, :cond_0

    .line 1132
    const/4 v6, -0x1

    .line 1133
    .local v6, status:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v2, :cond_3

    .line 1135
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v0, v17

    iget v3, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    .line 1140
    :cond_3
    :goto_1
    new-instance v1, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object/from16 v0, v17

    iget-object v3, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v0, v17

    iget-object v4, v0, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    move-object/from16 v0, v17

    iget v5, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move-object/from16 v0, v17

    iget v7, v0, Landroid/provider/Telephony$SIMInfo;->mColor:I

    move-object/from16 v0, v17

    iget v8, v0, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    move-object/from16 v0, v17

    iget-wide v9, v0, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-direct/range {v1 .. v10}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IIIIJ)V

    .line 1143
    .local v1, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "simid status is  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1145
    if-eqz v1, :cond_2

    .line 1146
    move-object/from16 v0, p0

    invoke-virtual {v1, v0}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setClickCallback(Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference$OnPreferenceClickCallback;)V

    .line 1147
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v2, :cond_4

    .line 1149
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v0, v17

    iget v3, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/ITelephony;->isRadioOnGemini(I)Z

    move-result v14

    .line 1150
    .local v14, isRadioOn:Z
    invoke-virtual {v1, v14}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheck(Z)V

    .line 1151
    invoke-virtual {v1, v14}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setRadioOn(Z)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1158
    .end local v14           #isRadioOn:Z
    :cond_4
    :goto_2
    move-object/from16 v0, v17

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v2, :cond_6

    .line 1159
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    .line 1160
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 1162
    new-instance v2, Lcom/mediatek/oobe/basic/gemini/SimManagement$11;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$11;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheckBoxClickListener(Landroid/view/View$OnClickListener;)V

    .line 1209
    :cond_5
    :goto_3
    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    goto/16 :goto_0

    .line 1136
    .end local v1           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :catch_0
    move-exception v12

    .line 1137
    .local v12, exception:Landroid/os/RemoteException;
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "RemoteException  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1152
    .end local v12           #exception:Landroid/os/RemoteException;
    .restart local v1       #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :catch_1
    move-exception v11

    .line 1153
    .local v11, e:Landroid/os/RemoteException;
    const-string v2, "SimManagementSettings"

    const-string v3, "mITelephony exception"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 1183
    .end local v11           #e:Landroid/os/RemoteException;
    :cond_6
    move-object/from16 v0, v17

    iget v2, v0, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_5

    .line 1185
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    .line 1186
    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 1188
    new-instance v2, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;

    move-object/from16 v0, p0

    invoke-direct {v2, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$12;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheckBoxClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3
.end method

.method private current3GSlotId()I
    .locals 4

    .prologue
    .line 2100
    const/4 v1, -0x1

    .line 2102
    .local v1, slot3G:I
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v2, :cond_0

    .line 2103
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v2}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 2108
    :cond_0
    :goto_0
    return v1

    .line 2105
    :catch_0
    move-exception v0

    .line 2106
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "SimManagementSettings"

    const-string v3, "mTelephony exception"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private dealSim1Change()V
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, -0x1

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1233
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    .line 1235
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dealSim1Change mDualSimMode value is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1238
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mIsSlot1Insert = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; mIsSlot2Insert ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1240
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v4, v1, :cond_2

    .line 1241
    const-string v1, "SimManagementSettings"

    const-string v2, "airplane mode is on"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1243
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_1

    .line 1245
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1246
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1247
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1248
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "state"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1249
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1251
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    .line 1314
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 1253
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-nez v1, :cond_0

    .line 1255
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1256
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1257
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1258
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "state"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1259
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1261
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto :goto_0

    .line 1266
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    iget v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    packed-switch v1, :pswitch_data_0

    .line 1311
    const-string v1, "SimManagementSettings"

    const-string v2, "dual sim mode error."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1268
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1269
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1270
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1271
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1272
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto :goto_0

    .line 1275
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1276
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1277
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1278
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1279
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto :goto_0

    .line 1283
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_2
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_3

    .line 1284
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v8}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1285
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1286
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1287
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1289
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1290
    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_0

    .line 1291
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1292
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1293
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1294
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1296
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1301
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_3
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_0

    .line 1302
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v7}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1303
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1304
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1305
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1307
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1266
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private dealSim2Change()V
    .locals 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, -0x1

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1318
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    .line 1320
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dealSim2Change mDualSimMode value is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1325
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v5, v1, :cond_2

    .line 1327
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_1

    .line 1328
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1329
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1330
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1331
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "state"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1332
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1333
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    .line 1401
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 1336
    :cond_1
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_0

    .line 1337
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1338
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1339
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1340
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "state"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1341
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1343
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto :goto_0

    .line 1349
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    iget v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    packed-switch v1, :pswitch_data_0

    .line 1398
    const-string v1, "SimManagementSettings"

    const-string v2, "dual sim mode error."

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1351
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1352
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1353
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1354
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1355
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto :goto_0

    .line 1360
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_1
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_3

    .line 1361
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v8}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1362
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1363
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1364
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1366
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1369
    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_0

    .line 1370
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1371
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1372
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1373
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1375
    invoke-direct {p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1380
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1381
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1382
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1383
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1384
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1388
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_3
    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot2Insert:Z

    if-eqz v1, :cond_0

    .line 1389
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 1390
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DUAL_SIM_MODE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1391
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "mode"

    invoke-virtual {v0, v1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1392
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 1394
    invoke-direct {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showProgressDlg(Z)V

    goto/16 :goto_0

    .line 1349
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private dealWithSwtichComplete()V
    .locals 14

    .prologue
    const/16 v13, 0x44c

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v12, -0x1

    .line 1405
    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    .line 1406
    .local v5, simid:Ljava/lang/Long;
    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/provider/Telephony$SIMInfo;

    .line 1408
    .local v6, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget-wide v10, v6, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 1410
    .local v4, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    if-eqz v4, :cond_0

    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v7, :cond_0

    .line 1413
    :try_start_0
    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    iget v10, v6, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v7, v10}, Lcom/android/internal/telephony/ITelephony;->isRadioOnGemini(I)Z

    move-result v2

    .line 1414
    .local v2, newState:Z
    invoke-virtual {v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->isRadioOn()Z

    move-result v3

    .line 1415
    .local v3, oldState:Z
    invoke-virtual {v4, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setRadioOn(Z)V

    .line 1417
    invoke-virtual {v4, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheck(Z)V

    .line 1418
    const-string v7, "SimManagementSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "mIsSIMModeSwitching is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v11, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " newState is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " oldState is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1420
    .end local v2           #newState:Z
    .end local v3           #oldState:Z
    :catch_0
    move-exception v0

    .line 1421
    .local v0, e:Landroid/os/RemoteException;
    const-string v7, "SimManagementSettings"

    const-string v8, "mITelephony exception"

    invoke-static {v7, v8}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1450
    .end local v0           #e:Landroid/os/RemoteException;
    .end local v4           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    .end local v5           #simid:Ljava/lang/Long;
    .end local v6           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :goto_1
    return-void

    .line 1429
    :cond_1
    const-string v7, "SimManagementSettings"

    const-string v10, "next will remove the progress dlg"

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1431
    iget v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    if-eq v7, v13, :cond_2

    iget v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    const/16 v10, 0x44d

    if-ne v7, v10, :cond_4

    .line 1432
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isResumed()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1433
    iget v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    if-ne v7, v13, :cond_7

    const/16 v7, 0x3e8

    :goto_2
    invoke-virtual {p0, v7}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    .line 1435
    :cond_3
    iput v12, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 1439
    :cond_4
    iget-boolean v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    if-nez v7, :cond_5

    .line 1440
    const-string v7, "SimManagementSettings"

    const-string v10, "mIsSIMModeSwitching value error......"

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1442
    :cond_5
    iput-boolean v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    .line 1443
    const-string v7, "SimManagementSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "mIsSIMModeSwitching is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-boolean v11, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSIMModeSwitching:Z

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v7, v10}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1445
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v10, "airplane_mode_on"

    invoke-static {v7, v10, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-eq v7, v9, :cond_6

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v10, "dual_sim_mode_setting"

    invoke-static {v7, v10, v12}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v7

    if-nez v7, :cond_8

    :cond_6
    move v7, v9

    :goto_3
    sput-boolean v7, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    .line 1448
    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    sget-boolean v10, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    if-nez v10, :cond_9

    sget-boolean v10, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    if-eqz v10, :cond_9

    sget-boolean v10, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    if-eqz v10, :cond_9

    :goto_4
    invoke-virtual {v7, v9}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto :goto_1

    .line 1433
    :cond_7
    const/16 v7, 0x3e9

    goto :goto_2

    :cond_8
    move v7, v8

    .line 1445
    goto :goto_3

    :cond_9
    move v9, v8

    .line 1448
    goto :goto_4
.end method

.method private dealwithAttach()V
    .locals 4

    .prologue
    .line 1453
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z

    .line 1454
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    const/16 v1, 0x7d1

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1455
    const/16 v0, 0x3ec

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 1456
    const/16 v0, 0x44e

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 1457
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    .line 1459
    return-void
.end method

.method private dealwithDetach()V
    .locals 4

    .prologue
    .line 1462
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsGprsSwitching:Z

    .line 1463
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    const/16 v1, 0x7d0

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 1464
    const/16 v0, 0x3ec

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 1465
    const/16 v0, 0x44e

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 1466
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    .line 1467
    return-void
.end method

.method private enableDataRoaming(J)V
    .locals 5
    .parameter "value"

    .prologue
    const/4 v4, 0x1

    .line 1942
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v1, :cond_0

    .line 1943
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    const/4 v2, 0x1

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSlotById(Landroid/content/Context;J)I

    move-result v3

    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/ITelephony;->setDataRoamingEnabledGemini(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1950
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v4, p1, p2}, Landroid/provider/Telephony$SIMInfo;->setDataRoaming(Landroid/content/Context;IJ)I

    .line 1952
    :goto_0
    return-void

    .line 1946
    :catch_0
    move-exception v0

    .line 1947
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "SimManagementSettings"

    const-string v2, "mITelephony exception"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getDataValue(Ljava/lang/String;)J
    .locals 3
    .parameter "dataString"

    .prologue
    .line 2096
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-wide/16 v1, -0x5

    invoke-static {v0, p1, v1, v2}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method private static getMobileDataState(Landroid/content/Intent;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .locals 2
    .parameter "intent"

    .prologue
    .line 1470
    const-string v1, "state"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1471
    .local v0, str:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 1472
    const-class v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-static {v1, v0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/PhoneConstants$DataState;

    .line 1474
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    goto :goto_0
.end method

.method public static initProgressBar(II)V
    .locals 0
    .parameter "maxSize"
    .parameter "curStep"

    .prologue
    .line 2002
    sput p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sProgressbarMaxSize:I

    .line 2003
    sput p1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sCurrentStep:I

    .line 2004
    return-void
.end method

.method private initSimMap()V
    .locals 6

    .prologue
    .line 1886
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 1887
    .local v1, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    new-instance v3, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;

    invoke-direct {v3}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;-><init>()V

    invoke-static {v1, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1888
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->clear()V

    .line 1889
    const-string v3, "SimManagementSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sim number is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1890
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/provider/Telephony$SIMInfo;

    .line 1891
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    iget-wide v4, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1893
    .end local v2           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    return-void
.end method

.method private isRadioOff()Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v3, -0x1

    .line 2081
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eq v1, v0, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-nez v1, :cond_1

    .line 2085
    .local v0, isAllRadioOff:Z
    :cond_0
    :goto_0
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isAllRadioOff="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2086
    return v0

    .line 2081
    .end local v0           #isAllRadioOff:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isVoipAvailable()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 1899
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "enable_internet_call_value"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 1902
    .local v0, isInternetCallEnabled:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private setIconForDefaultSimPref()V
    .locals 2

    .prologue
    .line 2090
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v1, 0x7f02000e

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setIcon(I)V

    .line 2091
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v1, 0x7f02000d

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setIcon(I)V

    .line 2092
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v1, 0x7f02000c

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setIcon(I)V

    .line 2093
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v1, 0x7f02000b

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setIcon(I)V

    .line 2094
    return-void
.end method

.method private showProgressDlg(Z)V
    .locals 3
    .parameter "isActivating"

    .prologue
    const/4 v2, 0x0

    .line 982
    if-eqz p1, :cond_1

    .line 983
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 984
    const-string v0, "SimManagementSettings"

    const-string v1, "DIALOG_ACTIVATE"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 986
    const/16 v0, 0x3e8

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 987
    const/16 v0, 0x44c

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 988
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    .line 1003
    :goto_0
    return-void

    .line 990
    :cond_0
    const-string v0, "SimManagementSettings"

    const-string v1, "Activity isFinishing, state error......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 993
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_2

    .line 994
    const-string v0, "SimManagementSettings"

    const-string v1, "DIALOG_DEACTIVATE"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 996
    const/16 v0, 0x3e9

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 997
    const/16 v0, 0x44d

    iput v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 998
    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto :goto_0

    .line 1000
    :cond_2
    const-string v0, "SimManagementSettings"

    const-string v1, "Activity isFinishing, state error......"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private switchGprsDefautlSIM(J)V
    .locals 9
    .parameter "value"

    .prologue
    const-wide/16 v7, 0x0

    .line 1914
    cmp-long v3, p1, v7

    if-gez v3, :cond_1

    .line 1937
    :cond_0
    :goto_0
    return-void

    .line 1918
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "gprs_connection_sim_setting"

    const-wide/16 v5, -0x5

    invoke-static {v3, v4, v5, v6}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 1921
    .local v0, gprsValue:J
    cmp-long v3, p1, v0

    if-eqz v3, :cond_0

    .line 1924
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.DATA_DEFAULT_SIM"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1925
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "simid"

    invoke-virtual {v2, v3, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 1927
    cmp-long v3, p1, v7

    if-lez v3, :cond_2

    const/4 v3, 0x1

    :goto_1
    sput-boolean v3, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsTargSim:Z

    .line 1929
    sget-boolean v3, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsTargSim:Z

    if-eqz v3, :cond_3

    .line 1930
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealwithAttach()V

    .line 1936
    :goto_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 1927
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 1932
    :cond_3
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->dealwithDetach()V

    goto :goto_2
.end method

.method private switchVideoCallDefaultSIM(J)V
    .locals 5
    .parameter "value"

    .prologue
    .line 1960
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchVideoCallDefaultSIM to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1962
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v2, :cond_0

    .line 1964
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 1965
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "siminfo = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1967
    if-nez v1, :cond_1

    .line 1994
    .end local v1           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    :goto_0
    return-void

    .line 1973
    .restart local v1       #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    :try_start_0
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sim slot  = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1974
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    iget v3, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v2, v3}, Lcom/android/internal/telephony/ITelephony;->set3GCapabilitySIM(I)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1975
    const-string v2, "SimManagementSettings"

    const-string v3, "result is true"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1977
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v2, :cond_2

    .line 1978
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;

    const/high16 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/StatusBarManager;->disable(I)V

    .line 1981
    :cond_2
    const/16 v2, 0x3ee

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 1982
    const/16 v2, 0x44f

    iput v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    .line 1983
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1988
    :catch_0
    move-exception v0

    .line 1989
    .local v0, e:Landroid/os/RemoteException;
    const-string v2, "SimManagementSettings"

    const-string v3, "mITelephony exception"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1986
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_3
    :try_start_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateVideoCallDefaultSIM()V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private updateDefaultSIMSummary(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;Ljava/lang/Long;)V
    .locals 7
    .parameter "pref"
    .parameter "simid"

    .prologue
    const-wide/16 v5, 0x0

    .line 866
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, v1, v5

    if-lez v1, :cond_1

    .line 867
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/provider/Telephony$SIMInfo;

    .line 869
    .local v0, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v0, :cond_0

    .line 870
    iget-object v1, v0, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 883
    .end local v0           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_0
    :goto_0
    return-void

    .line 873
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, -0x2

    cmp-long v1, v1, v3

    if-nez v1, :cond_2

    .line 874
    const v1, 0x7f09000b

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto :goto_0

    .line 875
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-nez v1, :cond_3

    .line 876
    const v1, 0x7f09000a

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto :goto_0

    .line 877
    :cond_3
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    cmp-long v1, v1, v5

    if-nez v1, :cond_4

    .line 878
    const v1, 0x7f09000c

    invoke-virtual {p1, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto :goto_0

    .line 879
    :cond_4
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, -0x3

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 880
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    invoke-interface {v1, p1, p2}, Lcom/mediatek/oobe/ext/ISimManagementExt;->updateDefaultSIMSummary(Landroid/preference/DialogPreference;Ljava/lang/Long;)V

    goto :goto_0
.end method

.method private updateDefaultSimValue(IJ)V
    .locals 8
    .parameter "type"
    .parameter "simId"

    .prologue
    const-wide/16 v6, 0x0

    const/4 v5, 0x4

    .line 1804
    cmp-long v3, p2, v6

    if-gez v3, :cond_1

    .line 1838
    :cond_0
    :goto_0
    return-void

    .line 1808
    :cond_1
    cmp-long v3, p2, v6

    if-nez v3, :cond_2

    .line 1810
    if-ne p1, v5, :cond_0

    .line 1811
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1812
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v4, 0x7f09000c

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto :goto_0

    .line 1816
    :cond_2
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1817
    .local v1, intIndex:Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 1820
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1822
    .local v0, index:I
    if-ltz v0, :cond_0

    .line 1826
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, p2, p3}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 1828
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v2, :cond_0

    .line 1831
    if-ne p1, v5, :cond_0

    .line 1833
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v3, v0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1834
    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v4, v2, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private updateVideoCallDefaultSIM()V
    .locals 8

    .prologue
    .line 1846
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v5, :cond_0

    .line 1849
    :try_start_0
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    invoke-interface {v5}, Lcom/android/internal/telephony/ITelephony;->get3GCapabilitySIM()I

    move-result v4

    .line 1851
    .local v4, videocallSlotID:I
    sput v4, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->sG3SloteID:I

    .line 1853
    if-gez v4, :cond_1

    .line 1882
    .end local v4           #videocallSlotID:I
    :cond_0
    :goto_0
    return-void

    .line 1857
    .restart local v4       #videocallSlotID:I
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-static {v5, v4}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    .line 1859
    .local v3, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v3, :cond_2

    .line 1861
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    iget-wide v6, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1862
    .local v2, intIndex:Ljava/lang/Integer;
    if-eqz v2, :cond_0

    .line 1865
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1867
    .local v1, index:I
    if-ltz v1, :cond_0

    if-eqz v3, :cond_0

    .line 1869
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v5, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1870
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v6, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1876
    .end local v1           #index:I
    .end local v2           #intIndex:Ljava/lang/Integer;
    .end local v3           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v4           #videocallSlotID:I
    :catch_0
    move-exception v0

    .line 1877
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "SimManagementSettings"

    const-string v6, "mITelephony exception"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1874
    .end local v0           #e:Landroid/os/RemoteException;
    .restart local v3       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v4       #videocallSlotID:I
    :cond_2
    :try_start_1
    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method


# virtual methods
.method public disableSimPrefs()V
    .locals 9

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 2022
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    if-eqz v6, :cond_0

    .line 2023
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    invoke-virtual {v6, v5}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setEnabled(Z)V

    .line 2025
    :cond_0
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    if-eqz v6, :cond_1

    .line 2026
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    invoke-virtual {v6, v5}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setEnabled(Z)V

    .line 2029
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 2031
    .local v1, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    const-string v6, "hotswapdbg"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sim number is "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2033
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    .line 2034
    .local v3, siminfo:Landroid/provider/Telephony$SIMInfo;
    const-string v6, "hotswapdbg"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v3, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2036
    iget v6, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v6, :cond_3

    .line 2037
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    if-eqz v6, :cond_2

    .line 2038
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot1SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    invoke-virtual {v6, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setEnabled(Z)V

    goto :goto_0

    .line 2040
    :cond_3
    iget v6, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-ne v6, v4, :cond_2

    .line 2041
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    if-eqz v6, :cond_2

    .line 2042
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSlot2SimPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    invoke-virtual {v6, v4}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setEnabled(Z)V

    goto :goto_0

    .line 2047
    .end local v3           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_4
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initDefaultSimPreference()V

    .line 2049
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 2050
    .local v2, simNumber:I
    const/4 v6, 0x2

    if-ge v2, v6, :cond_7

    .line 2056
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 2057
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    .line 2059
    :cond_5
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    if-eqz v6, :cond_6

    .line 2060
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    .line 2062
    :cond_6
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    if-eqz v6, :cond_7

    .line 2063
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    .line 2067
    :cond_7
    if-nez v2, :cond_8

    .line 2068
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6, v5}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 2069
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    if-eqz v6, :cond_8

    .line 2070
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->getDialog()Landroid/app/Dialog;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Dialog;->dismiss()V

    .line 2074
    :cond_8
    if-lez v2, :cond_9

    :goto_1
    sput-boolean v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    .line 2075
    return-void

    :cond_9
    move v4, v5

    .line 2074
    goto :goto_1
.end method

.method protected initDefaultSimPreference()V
    .locals 23

    .prologue
    .line 1524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->clear()V

    .line 1525
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->clear()V

    .line 1526
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->clear()V

    .line 1528
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->clear()V

    .line 1530
    const/4 v8, 0x0

    .line 1531
    .local v8, k:I
    const-string v19, "voice_call_sim_setting"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getDataValue(Ljava/lang/String;)J

    move-result-wide v17

    .line 1532
    .local v17, voicecallID:J
    const-string v19, "sms_sim_setting"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getDataValue(Ljava/lang/String;)J

    move-result-wide v13

    .line 1533
    .local v13, smsID:J
    const-string v19, "gprs_connection_sim_setting"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getDataValue(Ljava/lang/String;)J

    move-result-wide v4

    .line 1534
    .local v4, dataconnectionID:J
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->current3GSlotId()I

    move-result v16

    .line 1535
    .local v16, videocallSlotID:I
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v19, :cond_0

    .line 1536
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1538
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const-string v20, ""

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1539
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v9

    .line 1540
    .local v9, mSiminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    new-instance v19, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;

    invoke-direct/range {v19 .. v19}, Lcom/mediatek/oobe/basic/gemini/GeminiUtils$SIMInfoComparable;-><init>()V

    move-object/from16 v0, v19

    invoke-static {v9, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1542
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/provider/Telephony$SIMInfo;

    .line 1543
    .local v11, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v11, :cond_7

    .line 1545
    new-instance v12, Lcom/mediatek/oobe/basic/gemini/SimItem;

    invoke-direct {v12, v11}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 1546
    .local v12, simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    const/4 v15, -0x1

    .line 1547
    .local v15, state:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    .line 1549
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v19, v0

    iget v0, v11, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v20, v0

    invoke-interface/range {v19 .. v20}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v15

    .line 1554
    :cond_1
    :goto_1
    iput v15, v12, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 1556
    iget-wide v0, v11, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v19, v0

    cmp-long v19, v19, v17

    if-nez v19, :cond_2

    .line 1557
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsVoiceCapable:Z

    if-eqz v19, :cond_2

    .line 1558
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1559
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    iget-object v0, v11, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1562
    :cond_2
    iget-wide v0, v11, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v19, v0

    cmp-long v19, v19, v13

    if-nez v19, :cond_3

    .line 1563
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1564
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    iget-object v0, v11, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1566
    :cond_3
    iget-wide v0, v11, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v19, v0

    cmp-long v19, v19, v4

    if-nez v19, :cond_4

    .line 1567
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1568
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    iget-object v0, v11, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1570
    :cond_4
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v19, :cond_5

    .line 1571
    iget v0, v11, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v19, v0

    move/from16 v0, v19

    move/from16 v1, v16

    if-ne v0, v1, :cond_5

    .line 1572
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    iget-object v0, v11, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1576
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1577
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1578
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1579
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v19, :cond_6

    .line 1581
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1583
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    move-object/from16 v19, v0

    iget-wide v0, v11, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    invoke-interface/range {v19 .. v21}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1587
    .end local v12           #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    .end local v15           #state:I
    :cond_7
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 1550
    .restart local v12       #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    .restart local v15       #state:I
    :catch_0
    move-exception v6

    .line 1551
    .local v6, exception:Landroid/os/RemoteException;
    const-string v19, "SimManagementSettings"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "RemoteException  "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v6}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 1591
    .end local v6           #exception:Landroid/os/RemoteException;
    .end local v11           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v12           #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    .end local v15           #state:I
    :cond_8
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    if-eqz v19, :cond_9

    .line 1592
    new-instance v12, Lcom/mediatek/oobe/basic/gemini/SimItem;

    const v19, 0x7f09000b

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x8

    const-wide/16 v21, -0x2

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Ljava/lang/String;IJ)V

    .line 1595
    .restart local v12       #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1598
    .end local v12           #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    :cond_9
    new-instance v12, Lcom/mediatek/oobe/basic/gemini/SimItem;

    const v19, 0x7f09000a

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, -0x1

    const-wide/16 v21, -0x1

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Ljava/lang/String;IJ)V

    .line 1600
    .restart local v12       #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_13

    .line 1601
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1606
    :cond_a
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_b

    .line 1607
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1610
    :cond_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/ext/ISimManagementExt;->isNeedsetAutoItem()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 1611
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_c

    .line 1612
    new-instance v12, Lcom/mediatek/oobe/basic/gemini/SimItem;

    .end local v12           #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/ext/ISimManagementExt;->getAutoString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, -0x1

    const-wide/16 v21, -0x3

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Ljava/lang/String;IJ)V

    .line 1614
    .restart local v12       #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1618
    :cond_c
    new-instance v12, Lcom/mediatek/oobe/basic/gemini/SimItem;

    .end local v12           #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    const v19, 0x7f09000c

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getString(I)Ljava/lang/String;

    move-result-object v19

    const/16 v20, -0x1

    const-wide/16 v21, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide/from16 v2, v21

    invoke-direct {v12, v0, v1, v2, v3}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Ljava/lang/String;IJ)V

    .line 1620
    .restart local v12       #simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->isRadioOff()Z

    move-result v19

    if-eqz v19, :cond_d

    .line 1621
    const/16 v19, 0x1

    move/from16 v0, v19

    iput v0, v12, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 1623
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1625
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    .line 1626
    .local v10, nSim:I
    const-wide/16 v19, -0x2

    cmp-long v19, v17, v19

    if-nez v19, :cond_14

    .line 1627
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1628
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f09000b

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 1635
    :cond_e
    :goto_3
    const-wide/16 v19, -0x1

    cmp-long v19, v13, v19

    if-nez v19, :cond_17

    .line 1636
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1637
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f09000a

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 1648
    :cond_f
    :goto_4
    const-wide/16 v19, 0x0

    cmp-long v19, v4, v19

    if-nez v19, :cond_19

    .line 1649
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1650
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f09000d

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 1655
    :cond_10
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1656
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1657
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1658
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1659
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v19, :cond_11

    .line 1660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_1a

    .line 1661
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 1667
    :cond_11
    :goto_6
    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsVoiceCapable:Z

    if-eqz v19, :cond_12

    .line 1668
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_1b

    .line 1669
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 1674
    :cond_12
    :goto_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-ge v0, v1, :cond_1c

    .line 1675
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 1680
    :goto_8
    return-void

    .line 1602
    .end local v10           #nSim:I
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/List;->size()I

    move-result v19

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_a

    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    if-eqz v19, :cond_a

    .line 1603
    const-string v19, "SimManagementSettings"

    const-string v20, "no sim card inserted but internet call is on"

    invoke-static/range {v19 .. v20}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1604
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 1629
    .restart local v10       #nSim:I
    :cond_14
    const-wide/16 v19, -0x1

    cmp-long v19, v17, v19

    if-nez v19, :cond_16

    .line 1630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v20, v0

    sget-boolean v19, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    if-eqz v19, :cond_15

    add-int/lit8 v19, v10, 0x1

    :goto_9
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 1631
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f09000a

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_3

    :cond_15
    move/from16 v19, v10

    .line 1630
    goto :goto_9

    .line 1632
    :cond_16
    const-wide/16 v19, -0x5

    cmp-long v19, v17, v19

    if-nez v19, :cond_e

    .line 1633
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f090019

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_3

    .line 1638
    :cond_17
    const-wide/16 v19, -0x5

    cmp-long v19, v13, v19

    if-nez v19, :cond_18

    .line 1639
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f090019

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_4

    .line 1641
    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Lcom/mediatek/oobe/ext/ISimManagementExt;->isNeedsetAutoItem()Z

    move-result v19

    if-eqz v19, :cond_f

    const-wide/16 v19, -0x3

    cmp-long v19, v13, v19

    if-nez v19, :cond_f

    .line 1642
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v13, v14}, Lcom/mediatek/oobe/ext/ISimManagementExt;->setPrefProperty(Landroid/preference/DialogPreference;J)V

    .line 1643
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    add-int/lit8 v20, v10, 0x1

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    goto/16 :goto_4

    .line 1651
    :cond_19
    const-wide/16 v19, -0x5

    cmp-long v19, v4, v19

    if-nez v19, :cond_10

    .line 1652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const v20, 0x7f090019

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_5

    .line 1663
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1664
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto/16 :goto_6

    .line 1671
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto/16 :goto_7

    .line 1677
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    invoke-virtual/range {v19 .. v20}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto/16 :goto_8
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 461
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 462
    const-string v4, "phone"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/telephony/TelephonyManager;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 463
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->isVoiceCapable()Z

    move-result v4

    sput-boolean v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsVoiceCapable:Z

    .line 467
    sput-boolean v6, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    .line 469
    const-string v4, "SimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sVTCallSupport = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-boolean v8, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 470
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v7, "enable_internet_call_value"

    invoke-static {v4, v7, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    .line 472
    .local v3, voipEnable:I
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_4

    if-eqz v3, :cond_4

    move v4, v5

    :goto_0
    sput-boolean v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    .line 474
    const v4, 0x7f050008

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->addPreferencesFromResource(I)V

    .line 476
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/oobe/utils/Utils;->getSimManagmentExtPlugin(Landroid/content/Context;)Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    .line 478
    invoke-static {}, Lcom/mediatek/telephony/TelephonyManagerEx;->getDefault()Lcom/mediatek/telephony/TelephonyManagerEx;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    .line 479
    const-string v4, "phone"

    invoke-static {v4}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v4

    invoke-static {v4}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v4

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    .line 480
    const-string v4, "statusbar"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/StatusBarManager;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mStatusBarManager:Landroid/app/StatusBarManager;

    .line 482
    new-instance v4, Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-direct {v4, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    .line 483
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.SIM_SETTING_INFO_CHANGED"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 484
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.ANY_DATA_STATE"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 485
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 486
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "com.android.mms.transaction.START"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 487
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "com.android.mms.transaction.STOP"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 488
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 489
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.SIM_NAME_UPDATE"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 490
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    const-string v7, "android.intent.action.PHB_STATE_CHANGED"

    invoke-virtual {v4, v7}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 497
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    .line 498
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    .line 501
    const-string v4, "voice_call_sim_setting"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    .line 502
    const-string v4, "sms_sim_setting"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    .line 503
    const-string v4, "gprs_sim_setting"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    .line 504
    const-string v4, "video_call_sim_setting"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    check-cast v4, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    .line 505
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setIconForDefaultSimPref()V

    .line 507
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, v5}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setType(I)V

    .line 508
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const/4 v7, 0x3

    invoke-virtual {v4, v7}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setType(I)V

    .line 509
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const/4 v7, 0x4

    invoke-virtual {v4, v7}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setType(I)V

    .line 511
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 512
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 513
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 515
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    if-eqz v4, :cond_0

    .line 516
    sget-boolean v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v4, :cond_5

    .line 517
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const/4 v7, 0x2

    invoke-virtual {v4, v7}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setType(I)V

    .line 518
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, p0}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 530
    :cond_0
    :goto_1
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initSimMap()V

    .line 532
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v2

    .line 533
    .local v2, nSimNum:I
    if-lez v2, :cond_6

    .line 534
    sput-boolean v5, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    .line 536
    :try_start_0
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v4, :cond_1

    .line 537
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mMessenger:Landroid/os/Messenger;

    invoke-virtual {v5}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v5

    const/4 v7, 0x1

    invoke-interface {v4, v5, v7}, Lcom/android/internal/telephony/ITelephony;->registerForSimModeChange(Landroid/os/IBinder;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 545
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimReceiver:Landroid/content/BroadcastReceiver;

    iget-object v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v4, v5, v7}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 546
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->addSimInfoPreference()V

    .line 547
    sget-boolean v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSlot1Insert:Z

    if-nez v4, :cond_2

    .line 548
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, v6}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 551
    :cond_2
    new-instance v4, Lcom/mediatek/CellConnService/CellConnMgr;

    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mServiceComplete:Ljava/lang/Runnable;

    invoke-direct {v4, v5}, Lcom/mediatek/CellConnService/CellConnMgr;-><init>(Ljava/lang/Runnable;)V

    iput-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    .line 553
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/mediatek/CellConnService/CellConnMgr;->register(Landroid/content/Context;)V

    .line 555
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v4, v5}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setCellConnMgr(Lcom/mediatek/CellConnService/CellConnMgr;)V

    .line 566
    :goto_2
    new-instance v4, Lcom/mediatek/oobe/basic/gemini/SimManagement$4;

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    invoke-direct {v4, p0, v5}, Lcom/mediatek/oobe/basic/gemini/SimManagement$4;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;Landroid/os/Handler;)V

    sput-object v4, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    .line 578
    if-eqz p1, :cond_3

    .line 579
    const-string v4, "SimManagementSettings"

    const-string v5, "saved instance not null ,means we need init default sim preference to avoid problems"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 580
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initDefaultSimPreference()V

    .line 583
    :cond_3
    :goto_3
    return-void

    .end local v2           #nSimNum:I
    :cond_4
    move v4, v6

    .line 472
    goto/16 :goto_0

    .line 520
    :cond_5
    const-string v4, "default_sim"

    invoke-virtual {p0, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 523
    .local v0, defaultSIMSettingsCategory:Landroid/preference/PreferenceGroup;
    if-eqz v0, :cond_0

    .line 524
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceGroup;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_1

    .line 540
    .end local v0           #defaultSIMSettingsCategory:Landroid/preference/PreferenceGroup;
    .restart local v2       #nSimNum:I
    :catch_0
    move-exception v1

    .line 541
    .local v1, e:Landroid/os/RemoteException;
    const-string v4, "SimManagementSettings"

    const-string v5, "mITelephony exception"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 558
    .end local v1           #e:Landroid/os/RemoteException;
    :cond_6
    sput-boolean v6, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    .line 559
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->addNoSimIndicator()V

    .line 561
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4, v6}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 562
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v4, v5}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    goto :goto_2
.end method

.method public onCreateDialog(I)Landroid/app/Dialog;
    .locals 11
    .parameter "id"

    .prologue
    const v10, 0x1080027

    const v6, 0x1040014

    const v9, 0x1040013

    const v8, 0x1040009

    const/4 v7, 0x1

    .line 1007
    new-instance v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v2, v5}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1008
    .local v2, dialog:Landroid/app/ProgressDialog;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v1, v5}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1010
    .local v1, builder:Landroid/app/AlertDialog$Builder;
    packed-switch p1, :pswitch_data_0

    .line 1103
    :pswitch_0
    const/4 v2, 0x0

    .end local v2           #dialog:Landroid/app/ProgressDialog;
    :goto_0
    return-object v2

    .line 1012
    .restart local v2       #dialog:Landroid/app/ProgressDialog;
    :pswitch_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090017

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1013
    invoke-virtual {v2, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_0

    .line 1017
    :pswitch_2
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090018

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1018
    invoke-virtual {v2, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_0

    .line 1022
    :pswitch_3
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090013

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1023
    invoke-virtual {v2, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_0

    .line 1027
    :pswitch_4
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090013

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1028
    invoke-virtual {v2, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    goto :goto_0

    .line 1032
    :pswitch_5
    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1033
    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1035
    iget v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    if-ltz v5, :cond_0

    iget v5, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    const/4 v6, 0x4

    if-gt v5, v6, :cond_0

    .line 1036
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgStr:[I

    iget v7, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    aget v6, v6, v7

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1040
    :cond_0
    new-instance v5, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;

    invoke-direct {v5, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$7;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v9, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1055
    new-instance v5, Lcom/mediatek/oobe/basic/gemini/SimManagement$8;

    invoke-direct {v5, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$8;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v8, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1063
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .local v0, alertDlg:Landroid/app/AlertDialog;
    move-object v2, v0

    .line 1065
    goto :goto_0

    .line 1068
    .end local v0           #alertDlg:Landroid/app/AlertDialog;
    :pswitch_6
    invoke-virtual {v1, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 1069
    invoke-virtual {v1, v10}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 1070
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090015

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1071
    new-instance v5, Lcom/mediatek/oobe/basic/gemini/SimManagement$9;

    invoke-direct {v5, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$9;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v9, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1080
    new-instance v5, Lcom/mediatek/oobe/basic/gemini/SimManagement$10;

    invoke-direct {v5, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$10;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {v1, v8, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1089
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .restart local v0       #alertDlg:Landroid/app/AlertDialog;
    move-object v2, v0

    .line 1090
    goto/16 :goto_0

    .line 1094
    .end local v0           #alertDlg:Landroid/app/AlertDialog;
    :pswitch_7
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090014

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 1095
    invoke-virtual {v2, v7}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 1096
    invoke-virtual {v2}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v4

    .line 1097
    .local v4, win:Landroid/view/Window;
    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    .line 1098
    .local v3, lp:Landroid/view/WindowManager$LayoutParams;
    iget v5, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v6, -0x8000

    or-int/2addr v5, v6

    iput v5, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 1099
    invoke-virtual {v4, v3}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    goto/16 :goto_0

    .line 1010
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 7

    .prologue
    const/16 v6, 0x7d1

    const/16 v5, 0x7d0

    const/4 v4, 0x1

    .line 586
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onDestroy()V

    .line 588
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 590
    :try_start_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    if-eqz v1, :cond_0

    .line 591
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mMessenger:Landroid/os/Messenger;

    invoke-virtual {v2}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/android/internal/telephony/ITelephony;->unregisterForSimModeChange(Landroid/os/IBinder;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 598
    :cond_0
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 599
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mCellConnMgr:Lcom/mediatek/CellConnService/CellConnMgr;

    invoke-virtual {v1}, Lcom/mediatek/CellConnService/CellConnMgr;->unregister()V

    .line 602
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "dual_sim_mode_setting"

    const/4 v3, -0x1

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    .line 603
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "has attach msg = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    invoke-virtual {v3, v6}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "has detach msg = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    invoke-virtual {v3, v5}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 605
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "has sim mode msg = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimModeChangedHander:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 606
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    invoke-virtual {v1, v6}, Landroid/os/Handler;->removeMessages(I)V

    .line 607
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTimeHandler:Landroid/os/Handler;

    invoke-virtual {v1, v5}, Landroid/os/Handler;->removeMessages(I)V

    .line 608
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimModeChangedHander:Landroid/os/Handler;

    invoke-virtual {v1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 609
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDestroy: mDualSimMode value is : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDualSimMode:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    :goto_0
    return-void

    .line 594
    :catch_0
    move-exception v0

    .line 595
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "SimManagementSettings"

    const-string v2, "mITelephony exception"

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 831
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPause()V

    .line 835
    iget v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    packed-switch v1, :pswitch_data_0

    .line 854
    :goto_0
    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-ltz v1, :cond_0

    .line 855
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 857
    .local v0, resolver:Landroid/content/ContentResolver;
    if-eqz v0, :cond_0

    sget-object v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    if-eqz v1, :cond_0

    .line 858
    sget-object v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 862
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :cond_0
    return-void

    .line 837
    :pswitch_0
    const/16 v1, 0x3e8

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    goto :goto_0

    .line 840
    :pswitch_1
    const/16 v1, 0x3e9

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    goto :goto_0

    .line 843
    :pswitch_2
    const/16 v1, 0x3ec

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    goto :goto_0

    .line 846
    :pswitch_3
    const/16 v1, 0x3ee

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    goto :goto_0

    .line 849
    :pswitch_4
    const/16 v1, 0x3ed

    invoke-virtual {p0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->removeDialog(I)V

    goto :goto_0

    .line 835
    :pswitch_data_0
    .packed-switch 0x44c
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 13
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    .line 887
    const-string v8, "SimManagementSettings"

    const-string v9, "Enter onPreferenceChange function."

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 889
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    .line 891
    .local v3, key:Ljava/lang/String;
    const-string v8, "voice_call_sim_setting"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 893
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "voice_call_sim_setting"

    move-object v8, p2

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v9, v10, v11, v12}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 895
    new-instance v0, Landroid/content/Intent;

    const-string v8, "android.intent.action.VOICE_CALL_DEFAULT_SIM"

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 896
    .local v0, intent:Landroid/content/Intent;
    const-string v9, "simid"

    move-object v8, p2

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 897
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 898
    iget-object v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    check-cast p2, Ljava/lang/Long;

    .end local p2
    invoke-direct {p0, v8, p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSIMSummary(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;Ljava/lang/Long;)V

    .line 978
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    const/4 v8, 0x1

    :goto_1
    return v8

    .line 899
    .restart local p2
    :cond_1
    const-string v8, "video_call_sim_setting"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 914
    const-string v8, "sms_sim_setting"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 916
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "sms_sim_setting"

    move-object v8, p2

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-static {v9, v10, v11, v12}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 918
    new-instance v0, Landroid/content/Intent;

    const-string v8, "android.intent.action.SMS_DEFAULT_SIM"

    invoke-direct {v0, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 920
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v9, "simid"

    move-object v8, p2

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v0, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 921
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;)V

    .line 922
    iget-object v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    check-cast p2, Ljava/lang/Long;

    .end local p2
    invoke-direct {p0, v8, p2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSIMSummary(Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;Ljava/lang/Long;)V

    goto :goto_0

    .line 924
    .end local v0           #intent:Landroid/content/Intent;
    .restart local p2
    :cond_2
    const-string v8, "gprs_sim_setting"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 926
    check-cast p2, Ljava/lang/Long;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    .line 928
    .local v6, value:J
    const-wide/16 v8, 0x0

    cmp-long v8, v6, v8

    if-nez v8, :cond_3

    .line 929
    invoke-direct {p0, v6, v7}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchGprsDefautlSIM(J)V

    .line 930
    const/4 v8, 0x1

    goto :goto_1

    .line 933
    :cond_3
    iget-object v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 935
    .local v5, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-nez v5, :cond_4

    .line 936
    const/4 v8, 0x0

    goto :goto_1

    .line 939
    :cond_4
    iget-object v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTelephonyManagerEx:Lcom/mediatek/telephony/TelephonyManagerEx;

    iget v9, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-virtual {v8, v9}, Lcom/mediatek/telephony/TelephonyManagerEx;->isNetworkRoaming(I)Z

    move-result v1

    .line 940
    .local v1, isInRoaming:Z
    const/4 v4, 0x0

    .line 941
    .local v4, mIsCU:Z
    const/4 v8, -0x1

    iput v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    .line 942
    if-eqz v1, :cond_9

    .line 943
    iget v8, v5, Landroid/provider/Telephony$SIMInfo;->mDataRoaming:I

    const/4 v9, 0x1

    if-ne v8, v9, :cond_6

    const/4 v2, 0x1

    .line 944
    .local v2, isRoamingDataAllowed:Z
    :goto_2
    if-eqz v2, :cond_7

    .line 945
    iget v8, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    sget v9, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->sG3SloteID:I

    if-eq v8, v9, :cond_5

    .line 962
    .end local v2           #isRoamingDataAllowed:Z
    :cond_5
    :goto_3
    iget v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    const/4 v9, -0x1

    if-ne v8, v9, :cond_a

    .line 964
    invoke-direct {p0, v6, v7}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->switchGprsDefautlSIM(J)V

    goto/16 :goto_0

    .line 943
    :cond_6
    const/4 v2, 0x0

    goto :goto_2

    .line 949
    .restart local v2       #isRoamingDataAllowed:Z
    :cond_7
    iget-boolean v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIs3gOff:Z

    if-nez v8, :cond_8

    iget-boolean v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIs3gOff:Z

    if-nez v8, :cond_8

    iget v8, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    sget v9, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->sG3SloteID:I

    if-eq v8, v9, :cond_8

    .line 951
    :cond_8
    const/4 v8, 0x0

    iput v8, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mDataSwitchMsgIndex:I

    goto :goto_3

    .line 957
    .end local v2           #isRoamingDataAllowed:Z
    :cond_9
    iget v8, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    sget v9, Lcom/mediatek/oobe/basic/gemini/GeminiUtils;->sG3SloteID:I

    if-eq v8, v9, :cond_5

    goto :goto_3

    .line 967
    :cond_a
    const/16 v8, 0x3f0

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 968
    new-instance v8, Lcom/mediatek/oobe/basic/gemini/SimManagement$6;

    invoke-direct {v8, p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement$6;-><init>(Lcom/mediatek/oobe/basic/gemini/SimManagement;)V

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    goto/16 :goto_0
.end method

.method public onPreferenceClick(J)V
    .locals 4
    .parameter "simid"

    .prologue
    .line 2008
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/mediatek/oobe/basic/gemini/SimInfoEditor;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2009
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "oobe_step_total"

    sget v2, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sProgressbarMaxSize:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2010
    const-string v1, "oobe_step_index"

    sget v2, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sCurrentStep:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2011
    const-string v1, "simid"

    invoke-virtual {v0, v1, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 2012
    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->startActivity(Landroid/content/Intent;)V

    .line 2013
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f040002

    const v3, 0x7f040001

    invoke-virtual {v1, v2, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 2014
    const-string v1, "SimManagementSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " Start Sim info editor, simId="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2015
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 615
    invoke-super {p0, p1, p2}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 28

    .prologue
    .line 628
    invoke-super/range {p0 .. p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onResume()V

    .line 629
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "enable_internet_call_value"

    const/16 v26, 0x0

    invoke-static/range {v24 .. v26}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v23

    .line 631
    .local v23, voipEnable:I
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/sip/SipManager;->isVoipSupported(Landroid/content/Context;)Z

    move-result v24

    if-eqz v24, :cond_6

    if-eqz v23, :cond_6

    const/16 v24, 0x1

    :goto_0
    sput-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    .line 632
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/telephony/TelephonyManager;->isSmsCapable()Z

    move-result v24

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsSmsCapable:Z

    .line 634
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/Map;->size()I

    move-result v24

    if-ltz v24, :cond_d

    .line 636
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v12

    .line 638
    .local v12, resolver:Landroid/content/ContentResolver;
    if-eqz v12, :cond_0

    sget-object v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    if-eqz v24, :cond_0

    .line 639
    const-string v24, "gprs_connection_sim_setting"

    invoke-static/range {v24 .. v24}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v24

    const/16 v25, 0x0

    sget-object v26, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sGprsDefaultSIMObserver:Landroid/database/ContentObserver;

    move-object/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v26

    invoke-virtual {v12, v0, v1, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 643
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "voice_call_sim_setting"

    const-wide/16 v26, -0x5

    invoke-static/range {v24 .. v27}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v21

    .line 645
    .local v21, voicecallID:J
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "voicecallID ="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v21

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 650
    const/16 v20, -0x1

    .line 653
    .local v20, videocallSlotID:I
    const/16 v20, 0x0

    .line 668
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "sms_sim_setting"

    const-wide/16 v26, -0x5

    invoke-static/range {v24 .. v27}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v16

    .line 670
    .local v16, smsID:J
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "smsID ="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "gprs_connection_sim_setting"

    const-wide/16 v26, -0x5

    invoke-static/range {v24 .. v27}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v4

    .line 673
    .local v4, dataconnectionID:J
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "dataconnectionID ="

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 675
    const/4 v9, 0x0

    .line 676
    .local v9, k:I
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v14

    .line 677
    .local v14, simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/provider/Telephony$SIMInfo;

    .line 678
    .local v15, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v15, :cond_5

    .line 680
    iget-wide v0, v15, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v24, v0

    cmp-long v24, v24, v21

    if-nez v24, :cond_1

    .line 681
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    iget-object v0, v15, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 684
    :cond_1
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "siminfo.mSlot  = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    iget v0, v15, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v26, v0

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v24, :cond_2

    iget v0, v15, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v24, v0

    move/from16 v0, v24

    move/from16 v1, v20

    if-ne v0, v1, :cond_2

    .line 686
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "set init video call"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 692
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    iget-object v0, v15, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 694
    :cond_2
    iget-wide v0, v15, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v24, v0

    cmp-long v24, v24, v16

    if-nez v24, :cond_3

    .line 695
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    iget-object v0, v15, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 698
    :cond_3
    iget-wide v0, v15, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v24, v0

    cmp-long v24, v24, v4

    if-nez v24, :cond_4

    .line 699
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 700
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    iget-object v0, v15, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    move-object/from16 v25, v0

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 702
    :cond_4
    iget-wide v0, v15, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    move-wide/from16 v24, v0

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    .line 704
    .local v10, key:Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v13

    check-cast v13, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 705
    .local v13, simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    if-eqz v13, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v24, v0

    if-eqz v24, :cond_5

    .line 707
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    move-object/from16 v24, v0

    iget v0, v15, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    move/from16 v25, v0

    invoke-interface/range {v24 .. v25}, Lcom/android/internal/telephony/ITelephony;->isRadioOnGemini(I)Z

    move-result v8

    .line 708
    .local v8, isRadioOn:Z
    invoke-virtual {v13, v8}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setCheck(Z)V

    .line 709
    invoke-virtual {v13, v8}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setRadioOn(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 718
    .end local v8           #isRadioOn:Z
    .end local v10           #key:Ljava/lang/String;
    .end local v13           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :cond_5
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_1

    .line 631
    .end local v4           #dataconnectionID:J
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #k:I
    .end local v12           #resolver:Landroid/content/ContentResolver;
    .end local v14           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v15           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v16           #smsID:J
    .end local v20           #videocallSlotID:I
    .end local v21           #voicecallID:J
    :cond_6
    const/16 v24, 0x0

    goto/16 :goto_0

    .line 710
    .restart local v4       #dataconnectionID:J
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v9       #k:I
    .restart local v10       #key:Ljava/lang/String;
    .restart local v12       #resolver:Landroid/content/ContentResolver;
    .restart local v13       #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    .restart local v14       #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .restart local v15       #siminfo:Landroid/provider/Telephony$SIMInfo;
    .restart local v16       #smsID:J
    .restart local v20       #videocallSlotID:I
    .restart local v21       #voicecallID:J
    :catch_0
    move-exception v6

    .line 711
    .local v6, e:Landroid/os/RemoteException;
    const-string v24, "SimManagementSettings"

    const-string v25, "mITelephony exception"

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    .end local v4           #dataconnectionID:J
    .end local v6           #e:Landroid/os/RemoteException;
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #k:I
    .end local v10           #key:Ljava/lang/String;
    .end local v12           #resolver:Landroid/content/ContentResolver;
    .end local v13           #simInfoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    .end local v14           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v15           #siminfo:Landroid/provider/Telephony$SIMInfo;
    .end local v16           #smsID:J
    .end local v20           #videocallSlotID:I
    .end local v21           #voicecallID:J
    :goto_2
    return-void

    .line 721
    .restart local v4       #dataconnectionID:J
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v9       #k:I
    .restart local v12       #resolver:Landroid/content/ContentResolver;
    .restart local v14       #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .restart local v16       #smsID:J
    .restart local v20       #videocallSlotID:I
    .restart local v21       #voicecallID:J
    :cond_7
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v11

    .line 722
    .local v11, nSim:I
    const-wide/16 v24, -0x2

    cmp-long v24, v21, v24

    if-nez v24, :cond_e

    .line 723
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f09000b

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 733
    :cond_8
    :goto_3
    const-wide/16 v24, -0x1

    cmp-long v24, v16, v24

    if-nez v24, :cond_11

    .line 734
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 735
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f09000a

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 746
    :cond_9
    :goto_4
    const-wide/16 v24, 0x0

    cmp-long v24, v4, v24

    if-nez v24, :cond_13

    .line 747
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 748
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f09000c

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 753
    :cond_a
    :goto_5
    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v24, :cond_b

    .line 775
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "video_call_sim_setting"

    const-wide/16 v26, -0x5

    invoke-static/range {v24 .. v27}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v18

    .line 778
    .local v18, videocallID:J
    const-wide/16 v24, -0x5

    cmp-long v24, v18, v24

    if-nez v24, :cond_b

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f090019

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    .line 786
    .end local v18           #videocallID:J
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "mms.transaction"

    const/16 v26, 0x0

    invoke-static/range {v24 .. v26}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v24

    if-nez v24, :cond_14

    const/16 v24, 0x1

    :goto_6
    sput-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    .line 787
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "airplane_mode_on"

    const/16 v26, -0x1

    invoke-static/range {v24 .. v26}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_c

    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v24

    const-string v25, "dual_sim_mode_setting"

    const/16 v26, -0x1

    invoke-static/range {v24 .. v26}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v24

    if-nez v24, :cond_15

    :cond_c
    const/16 v24, 0x1

    :goto_7
    sput-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    .line 792
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v25, v0

    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    if-nez v24, :cond_16

    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    if-eqz v24, :cond_16

    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    if-eqz v24, :cond_16

    const/16 v24, 0x1

    :goto_8
    move-object/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setEnabled(Z)V

    .line 793
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "mGprsSimSetting.setEnabled = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v26, v0

    invoke-virtual/range {v26 .. v26}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->isEnabled()Z

    move-result v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " in onResume"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 794
    const-string v24, "SimManagementSettings"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "sAllSimRadioOff = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-boolean v26, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sAllSimRadioOff:Z

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " sScreenEnable = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-boolean v26, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sScreenEnable:Z

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " sHasSim = "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-boolean v26, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sHasSim:Z

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    .end local v4           #dataconnectionID:J
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #k:I
    .end local v11           #nSim:I
    .end local v12           #resolver:Landroid/content/ContentResolver;
    .end local v14           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v16           #smsID:J
    .end local v20           #videocallSlotID:I
    .end local v21           #voicecallID:J
    :cond_d
    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mIsShowDlg:I

    move/from16 v24, v0

    packed-switch v24, :pswitch_data_0

    .line 825
    :goto_9
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->initDefaultSimPreference()V

    goto/16 :goto_2

    .line 725
    .restart local v4       #dataconnectionID:J
    .restart local v7       #i$:Ljava/util/Iterator;
    .restart local v9       #k:I
    .restart local v11       #nSim:I
    .restart local v12       #resolver:Landroid/content/ContentResolver;
    .restart local v14       #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .restart local v16       #smsID:J
    .restart local v20       #videocallSlotID:I
    .restart local v21       #voicecallID:J
    :cond_e
    const-wide/16 v24, -0x1

    cmp-long v24, v21, v24

    if-nez v24, :cond_10

    .line 727
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v25, v0

    sget-boolean v24, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVoipAvailable:Z

    if-eqz v24, :cond_f

    add-int/lit8 v24, v11, 0x1

    :goto_a
    move-object/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 728
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f09000a

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_3

    :cond_f
    move/from16 v24, v11

    .line 727
    goto :goto_a

    .line 729
    :cond_10
    const-wide/16 v24, -0x5

    cmp-long v24, v21, v24

    if-nez v24, :cond_8

    .line 730
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f090019

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_3

    .line 736
    :cond_11
    const-wide/16 v24, -0x5

    cmp-long v24, v16, v24

    if-nez v24, :cond_12

    .line 737
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f090019

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_4

    .line 739
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Lcom/mediatek/oobe/ext/ISimManagementExt;->isNeedsetAutoItem()Z

    move-result v24

    if-eqz v24, :cond_9

    const-wide/16 v24, -0x3

    cmp-long v24, v16, v24

    if-nez v24, :cond_9

    .line 740
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mExt:Lcom/mediatek/oobe/ext/ISimManagementExt;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-wide/from16 v2, v16

    invoke-interface {v0, v1, v2, v3}, Lcom/mediatek/oobe/ext/ISimManagementExt;->setPrefProperty(Landroid/preference/DialogPreference;J)V

    .line 741
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    add-int/lit8 v25, v11, 0x1

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    goto/16 :goto_4

    .line 749
    :cond_13
    const-wide/16 v24, -0x5

    cmp-long v24, v4, v24

    if-nez v24, :cond_a

    .line 750
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    move-object/from16 v24, v0

    const v25, 0x7f090019

    invoke-virtual/range {v24 .. v25}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto/16 :goto_5

    .line 786
    :cond_14
    const/16 v24, 0x0

    goto/16 :goto_6

    .line 787
    :cond_15
    const/16 v24, 0x0

    goto/16 :goto_7

    .line 792
    :cond_16
    const/16 v24, 0x0

    goto/16 :goto_8

    .line 803
    .end local v4           #dataconnectionID:J
    .end local v7           #i$:Ljava/util/Iterator;
    .end local v9           #k:I
    .end local v11           #nSim:I
    .end local v12           #resolver:Landroid/content/ContentResolver;
    .end local v14           #simList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    .end local v16           #smsID:J
    .end local v20           #videocallSlotID:I
    .end local v21           #voicecallID:J
    :pswitch_0
    const/16 v24, 0x3e8

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 804
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto/16 :goto_9

    .line 807
    :pswitch_1
    const/16 v24, 0x3e9

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 808
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto/16 :goto_9

    .line 811
    :pswitch_2
    const/16 v24, 0x3ec

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 812
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto/16 :goto_9

    .line 815
    :pswitch_3
    const/16 v24, 0x3ee

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 816
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto/16 :goto_9

    .line 819
    :pswitch_4
    const/16 v24, 0x3ed

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->showDialog(I)V

    .line 820
    const/16 v24, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->setCancelable(Z)V

    goto/16 :goto_9

    .line 801
    :pswitch_data_0
    .packed-switch 0x44c
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 621
    invoke-super {p0}, Lcom/mediatek/oobe/utils/SettingsPreferenceFragment;->onStart()V

    .line 622
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getListView()Landroid/widget/ListView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setItemsCanFocus(Z)V

    .line 623
    return-void
.end method

.method protected updateDefaultSimInfo(J)V
    .locals 10
    .parameter "simID"

    .prologue
    .line 1748
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-static {v6, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v3

    .line 1750
    .local v3, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v3, :cond_0

    .line 1752
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    iget-wide v7, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 1753
    .local v2, intIndex:Ljava/lang/Integer;
    if-nez v2, :cond_1

    .line 1771
    .end local v2           #intIndex:Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 1756
    .restart local v2       #intIndex:Ljava/lang/Integer;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1758
    .local v1, index:I
    new-instance v4, Lcom/mediatek/oobe/basic/gemini/SimItem;

    invoke-direct {v4, v3}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 1759
    .local v4, simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    const/4 v5, -0x1

    .line 1761
    .local v5, state:I
    :try_start_0
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mITelephony:Lcom/android/internal/telephony/ITelephony;

    iget v7, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-interface {v6, v7}, Lcom/android/internal/telephony/ITelephony;->getSimIndicatorStateGemini(I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 1766
    :goto_1
    iput v5, v4, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 1767
    iget v6, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v6, :cond_2

    const/4 v6, 0x1

    :goto_2
    invoke-virtual {p0, v1, v4, v6}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimItemList(ILcom/mediatek/oobe/basic/gemini/SimItem;Z)V

    .line 1769
    const-string v6, "SimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "simid status of sim "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "is  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1762
    :catch_0
    move-exception v0

    .line 1763
    .local v0, exception:Landroid/os/RemoteException;
    const-string v6, "SimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "RemoteException  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1767
    .end local v0           #exception:Landroid/os/RemoteException;
    :cond_2
    const/4 v6, 0x0

    goto :goto_2
.end method

.method protected updateDefaultSimItemList(ILcom/mediatek/oobe/basic/gemini/SimItem;Z)V
    .locals 2
    .parameter "index"
    .parameter "simitem"
    .parameter "slot3g"

    .prologue
    .line 1774
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 1775
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1776
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVoiceCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVoice:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1778
    :cond_0
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_1

    .line 1779
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1780
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSmsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListSms:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1782
    :cond_1
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 1783
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1784
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListGprs:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1786
    :cond_2
    sget-boolean v0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->sVTCallSupport:Z

    if-eqz v0, :cond_4

    .line 1788
    if-eqz p3, :cond_3

    .line 1789
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1798
    :cond_3
    iget-object v0, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mVideoCallSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v1, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimItemListVideo:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setData(Ljava/util/List;)V

    .line 1800
    :cond_4
    return-void
.end method

.method protected updateDefaultSimState(II)V
    .locals 8
    .parameter "slotID"
    .parameter "state"

    .prologue
    .line 1725
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4, p1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    .line 1727
    .local v2, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v2, :cond_0

    .line 1729
    iget-object v4, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    iget-wide v5, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1730
    .local v1, intIndex:Ljava/lang/Integer;
    if-nez v1, :cond_1

    .line 1744
    .end local v1           #intIndex:Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 1733
    .restart local v1       #intIndex:Ljava/lang/Integer;
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1735
    .local v0, index:I
    const-string v4, "SimManagementSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "index is"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1736
    new-instance v3, Lcom/mediatek/oobe/basic/gemini/SimItem;

    invoke-direct {v3, v2}, Lcom/mediatek/oobe/basic/gemini/SimItem;-><init>(Landroid/provider/Telephony$SIMInfo;)V

    .line 1737
    .local v3, simitem:Lcom/mediatek/oobe/basic/gemini/SimItem;
    iput p2, v3, Lcom/mediatek/oobe/basic/gemini/SimItem;->mState:I

    .line 1738
    if-nez p1, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-virtual {p0, v0, v3, v4}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->updateDefaultSimItemList(ILcom/mediatek/oobe/basic/gemini/SimItem;Z)V

    .line 1740
    const-string v4, "SimManagementSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "simid status of sim "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, v2, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "is  "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1738
    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected updateGprsSettings()V
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    .line 433
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "gprs_connection_sim_setting"

    const-wide/16 v8, -0x5

    invoke-static {v6, v7, v8, v9}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 435
    .local v0, dataconnectionID:J
    const-string v6, "SimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "dataconnectionID ="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    cmp-long v6, v0, v10

    if-lez v6, :cond_2

    .line 438
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimIdToIndexMap:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    .line 439
    .local v3, intIndex:Ljava/lang/Integer;
    if-nez v3, :cond_1

    .line 457
    .end local v3           #intIndex:Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-void

    .line 442
    .restart local v3       #intIndex:Ljava/lang/Integer;
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 443
    .local v2, index:I
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 444
    .local v5, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-ltz v2, :cond_0

    if-eqz v5, :cond_0

    .line 446
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6, v2}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 447
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    iget-object v7, v5, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 450
    .end local v2           #index:I
    .end local v3           #intIndex:Ljava/lang/Integer;
    .end local v5           #siminfo:Landroid/provider/Telephony$SIMInfo;
    :cond_2
    cmp-long v6, v0, v10

    if-nez v6, :cond_0

    .line 451
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v4

    .line 452
    .local v4, nSim:I
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    invoke-virtual {v6, v4}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setInitValue(I)V

    .line 453
    iget-object v6, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mGprsSimSetting:Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;

    const v7, 0x7f09000c

    invoke-virtual {v6, v7}, Lcom/mediatek/oobe/basic/gemini/DefaultSimPreference;->setSummary(I)V

    goto :goto_0
.end method

.method protected updateSimInfo(JI)V
    .locals 4
    .parameter "simID"
    .parameter "type"

    .prologue
    .line 1683
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, p1, p2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoById(Landroid/content/Context;J)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 1685
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 1686
    iget-object v2, p0, Lcom/mediatek/oobe/basic/gemini/SimManagement;->mSimMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1687
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 1688
    .local v0, pref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    if-nez v0, :cond_1

    .line 1708
    .end local v0           #pref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :cond_0
    :goto_0
    return-void

    .line 1691
    .restart local v0       #pref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :cond_1
    packed-switch p3, :pswitch_data_0

    goto :goto_0

    .line 1693
    :pswitch_0
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 1696
    :pswitch_1
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mColor:I

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setColor(I)V

    goto :goto_0

    .line 1699
    :pswitch_2
    iget-object v2, v1, Landroid/provider/Telephony$SIMInfo;->mNumber:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setNumber(Ljava/lang/String;)V

    goto :goto_0

    .line 1702
    :pswitch_3
    iget v2, v1, Landroid/provider/Telephony$SIMInfo;->mDispalyNumberFormat:I

    invoke-virtual {v0, v2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setNumDisplayFormat(I)V

    goto :goto_0

    .line 1691
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected updateSimState(II)V
    .locals 6
    .parameter "slotID"
    .parameter "state"

    .prologue
    .line 1711
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, p1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    .line 1713
    .local v1, siminfo:Landroid/provider/Telephony$SIMInfo;
    if-eqz v1, :cond_0

    .line 1715
    iget-wide v2, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;

    .line 1716
    .local v0, pref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    if-eqz v0, :cond_0

    .line 1717
    invoke-virtual {v0, p2}, Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;->setStatus(I)V

    .line 1718
    const-string v2, "SimManagementSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "simid status of sim "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, v1, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "is  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1721
    .end local v0           #pref:Lcom/mediatek/oobe/basic/gemini/SimInfoEnablePreference;
    :cond_0
    return-void
.end method
