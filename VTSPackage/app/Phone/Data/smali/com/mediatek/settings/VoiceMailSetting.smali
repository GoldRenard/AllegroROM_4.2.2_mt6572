.class public Lcom/mediatek/settings/VoiceMailSetting;
.super Landroid/preference/PreferenceActivity;
.source "VoiceMailSetting.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;
.implements Lcom/android/phone/EditPhoneNumberPreference$OnDialogClosedListener;
.implements Lcom/android/phone/EditPhoneNumberPreference$GetDefaultNumberListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;,
        Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;,
        Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;
    }
.end annotation


# static fields
.field public static final ACTION_ADD_VOICEMAIL:Ljava/lang/String; = "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

.field public static final ACTION_CONFIGURE_VOICEMAIL:Ljava/lang/String; = "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL"

.field private static final BUTTON_VOICEMAIL_KEY:Ljava/lang/String; = "button_voicemail_key"

.field private static final BUTTON_VOICEMAIL_PROVIDER_KEY:Ljava/lang/String; = "button_voicemail_provider_key"

.field private static final BUTTON_VOICEMAIL_SETTING_KEY:Ljava/lang/String; = "button_voicemail_setting_key"

.field private static final DBG:Z = true

.field private static final DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String; = null

.field static final DTMF_TONE_TYPE_LONG:I = 0x1

.field static final DTMF_TONE_TYPE_NORMAL:I = 0x0

.field private static final EVENT_FORWARDING_CHANGED:I = 0x1f5

.field private static final EVENT_FORWARDING_GET_COMPLETED:I = 0x1f6

.field private static final EVENT_VOICEMAIL_CHANGED:I = 0x1f4

.field static final FORWARDING_SETTINGS_REASONS:[I = null

.field public static final FWD_NUMBER_EXTRA:Ljava/lang/String; = "com.android.phone.ForwardingNumber"

.field public static final FWD_NUMBER_TIME_EXTRA:Ljava/lang/String; = "com.android.phone.ForwardingNumberTime"

.field public static final FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo; = null

.field public static final FWD_SETTINGS_LENGTH_TAG:Ljava/lang/String; = "#Length"

.field public static final FWD_SETTINGS_TAG:Ljava/lang/String; = "#FWDSettings"

.field public static final FWD_SETTING_NUMBER:Ljava/lang/String; = "#Number"

.field public static final FWD_SETTING_REASON:Ljava/lang/String; = "#Reason"

.field public static final FWD_SETTING_STATUS:Ljava/lang/String; = "#Status"

.field public static final FWD_SETTING_TAG:Ljava/lang/String; = "#Setting"

.field public static final FWD_SETTING_TIME:Ljava/lang/String; = "#Time"

.field private static final FW_GET_RESPONSE_ERROR:I = 0x1f6

.field private static final FW_SET_RESPONSE_ERROR:I = 0x1f5

.field public static final IGNORE_PROVIDER_EXTRA:Ljava/lang/String; = "com.android.phone.ProviderToIgnore"

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/VoiceMailSetting"

.field private static final MSG_FW_GET_EXCEPTION:I = 0x192

.field private static final MSG_FW_SET_EXCEPTION:I = 0x191

.field private static final MSG_VM_EXCEPTION:I = 0x190

.field private static final MSG_VM_NOCHANGE:I = 0x2bc

.field private static final MSG_VM_OK:I = 0x258

.field private static final NUM_PROJECTION:[Ljava/lang/String; = null

.field public static final SIGNOUT_EXTRA:Ljava/lang/String; = "com.android.phone.Signout"

.field private static final VM_NOCHANGE_ERROR:I = 0x190

.field private static final VM_NUMBERS_SHARED_PREFERENCES_NAME:[Ljava/lang/String; = null

.field public static final VM_NUMBER_EXTRA:Ljava/lang/String; = "com.android.phone.VoicemailNumber"

.field public static final VM_NUMBER_TAG:Ljava/lang/String; = "#VMNumber"

.field private static final VM_RESPONSE_ERROR:I = 0x1f4

.field private static final VOICEMAIL_DIALOG_CONFIRM:I = 0x258

.field private static final VOICEMAIL_FWD_READING_DIALOG:I = 0x25a

.field private static final VOICEMAIL_FWD_SAVING_DIALOG:I = 0x259

.field private static final VOICEMAIL_PREF_ID:I = 0x1

.field private static final VOICEMAIL_PROVIDER_CFG_ID:I = 0x2

.field private static final VOICEMAIL_REVERTING_DIALOG:I = 0x25b


# instance fields
.field mChangingVMorFwdDueToProviderChange:Z

.field mCurrentDialogId:I

.field private mExpectedChangeResultReasons:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mForeground:Z

.field private mForwardingChangeResults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Landroid/os/AsyncResult;",
            ">;"
        }
    .end annotation
.end field

.field mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

.field mFwdChangesRequireRollback:Z

.field private final mGetOptionComplete:Landroid/os/Handler;

.field private mInitTitle:Ljava/lang/String;

.field private mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

.field mNewVMNumber:Ljava/lang/String;

.field private mOldVmNumber:Ljava/lang/String;

.field mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

.field private mPhone:Lcom/android/internal/telephony/Phone;

.field mPreviousVMProviderKey:Ljava/lang/String;

.field private mReadingSettingsForDefaultProvider:Z

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private final mRevertOptionComplete:Landroid/os/Handler;

.field private final mSetOptionComplete:Landroid/os/Handler;

.field private mSimId:I

.field private mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

.field mVMChangeCompletedSuccesfully:Z

.field mVMOrFwdSetError:I

.field mVMProviderSettingsForced:Z

.field private final mVMProvidersData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;",
            ">;"
        }
    .end annotation
.end field

.field mVoicemailChangeResult:Landroid/os/AsyncResult;

.field private mVoicemailProviders:Landroid/preference/ListPreference;

.field private mVoicemailSettings:Landroid/preference/PreferenceScreen;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x4

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 96
    const/4 v0, 0x0

    sput-object v0, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 113
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "1"

    aput-object v1, v0, v2

    const-string v1, "2"

    aput-object v1, v0, v3

    const-string v1, "3"

    aput-object v1, v0, v5

    const-string v1, "4"

    aput-object v1, v0, v6

    sput-object v0, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    .line 124
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "data1"

    aput-object v1, v0, v2

    sput-object v0, Lcom/mediatek/settings/VoiceMailSetting;->NUM_PROJECTION:[Ljava/lang/String;

    .line 132
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "vm_numbers"

    aput-object v1, v0, v2

    const-string v1, "vm_numbers_sim2"

    aput-object v1, v0, v3

    const-string v1, "vm_numbers_sim3"

    aput-object v1, v0, v5

    const-string v1, "vm_numbers_sim4"

    aput-object v1, v0, v6

    sput-object v0, Lcom/mediatek/settings/VoiceMailSetting;->VM_NUMBERS_SHARED_PREFERENCES_NAME:[Ljava/lang/String;

    .line 190
    new-array v0, v4, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    return-void

    :array_0
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 150
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    .line 169
    new-instance v0, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;

    invoke-direct {v0, p0, v2}, Lcom/mediatek/settings/VoiceMailSetting$CallFeaturesSettingBroadcastReceiver;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Lcom/mediatek/settings/VoiceMailSetting$1;)V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 289
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 295
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    .line 302
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mExpectedChangeResultReasons:Ljava/util/Collection;

    .line 307
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailChangeResult:Landroid/os/AsyncResult;

    .line 312
    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    .line 317
    iput v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mCurrentDialogId:I

    .line 323
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    .line 329
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 335
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMChangeCompletedSuccesfully:Z

    .line 341
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mFwdChangesRequireRollback:Z

    .line 347
    iput v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    .line 357
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    .line 383
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReadingSettingsForDefaultProvider:Z

    .line 868
    new-instance v0, Lcom/mediatek/settings/VoiceMailSetting$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VoiceMailSetting$1;-><init>(Lcom/mediatek/settings/VoiceMailSetting;)V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mGetOptionComplete:Landroid/os/Handler;

    .line 1086
    new-instance v0, Lcom/mediatek/settings/VoiceMailSetting$2;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VoiceMailSetting$2;-><init>(Lcom/mediatek/settings/VoiceMailSetting;)V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSetOptionComplete:Landroid/os/Handler;

    .line 1160
    new-instance v0, Lcom/mediatek/settings/VoiceMailSetting$3;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VoiceMailSetting$3;-><init>(Lcom/mediatek/settings/VoiceMailSetting;)V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mRevertOptionComplete:Landroid/os/Handler;

    .line 1953
    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/settings/VoiceMailSetting;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->checkVMChangeSuccess()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-static {p0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/settings/VoiceMailSetting;)Ljava/util/Map;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$400(Lcom/mediatek/settings/VoiceMailSetting;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->checkForwardingCompleted()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/mediatek/settings/VoiceMailSetting;)Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->checkFwdChangeSuccess()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/settings/VoiceMailSetting;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->dismissDialogSafely(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/mediatek/settings/VoiceMailSetting;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->handleSetVMOrFwdMessage()V

    return-void
.end method

.method static synthetic access$800(Lcom/mediatek/settings/VoiceMailSetting;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 72
    iget v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    return v0
.end method

.method private checkForwardingCompleted()Z
    .locals 4

    .prologue
    .line 1208
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    if-nez v3, :cond_1

    .line 1209
    const/4 v2, 0x1

    .line 1221
    .local v2, result:Z
    :cond_0
    :goto_0
    return v2

    .line 1213
    .end local v2           #result:Z
    :cond_1
    const/4 v2, 0x1

    .line 1214
    .restart local v2       #result:Z
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mExpectedChangeResultReasons:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 1215
    .local v1, reason:Ljava/lang/Integer;
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_2

    .line 1216
    const/4 v2, 0x0

    .line 1217
    goto :goto_0
.end method

.method private checkFwdChangeSuccess()Ljava/lang/String;
    .locals 5

    .prologue
    .line 1227
    const/4 v3, 0x0

    .line 1228
    .local v3, result:Ljava/lang/String;
    iget-object v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 1230
    .local v2, it:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Integer;Landroid/os/AsyncResult;>;>;"
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1231
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1232
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/os/AsyncResult;

    iget-object v1, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 1233
    .local v1, exception:Ljava/lang/Throwable;
    if-eqz v1, :cond_0

    .line 1234
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    .line 1235
    if-nez v3, :cond_1

    .line 1236
    const-string v3, ""

    .line 1241
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    .end local v1           #exception:Ljava/lang/Throwable;
    :cond_1
    return-object v3
.end method

.method private checkVMChangeSuccess()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1248
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailChangeResult:Landroid/os/AsyncResult;

    iget-object v1, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_1

    .line 1249
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailChangeResult:Landroid/os/AsyncResult;

    iget-object v1, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 1250
    .local v0, msg:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 1251
    const-string v0, ""

    .line 1255
    .end local v0           #msg:Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private deleteSettingsForVoicemailProvider(Ljava/lang/String;)V
    .locals 3
    .parameter "key"

    .prologue
    .line 1921
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Deleting settings for"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1923
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-nez v0, :cond_0

    .line 1930
    :goto_0
    return-void

    .line 1926
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#VMNumber"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#FWDSettings"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "#Length"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method private dismissDialogSafely(I)V
    .locals 2
    .parameter "id"

    .prologue
    .line 795
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->dismissDialog(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 799
    :goto_0
    return-void

    .line 796
    :catch_0
    move-exception v0

    .line 797
    .local v0, e:Ljava/lang/IllegalArgumentException;
    const-string v1, "IllegalArgumentException"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getCurrentVoicemailProviderKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 1933
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1935
    .local v0, key:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1936
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1937
    .local v1, sp:Landroid/content/SharedPreferences;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "button_voicemail_provider_key"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1940
    .end local v1           #sp:Landroid/content/SharedPreferences;
    :cond_0
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1941
    if-eqz v0, :cond_2

    .line 1943
    .end local v0           #key:Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v0

    .line 1941
    .restart local v0       #key:Ljava/lang/String;
    :cond_2
    sget-object v2, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    iget v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    aget-object v0, v2, v3

    goto :goto_0

    .line 1943
    :cond_3
    if-nez v0, :cond_1

    sget-object v2, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    const/4 v3, 0x0

    aget-object v0, v2, v3

    goto :goto_0
.end method

.method private handleSetVMOrFwdMessage()V
    .locals 5

    .prologue
    .line 1260
    const-string v3, "handleSetVMMessage: set VM request complete"

    invoke-static {v3}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1262
    const/4 v2, 0x1

    .line 1263
    .local v2, success:Z
    const/4 v1, 0x0

    .line 1264
    .local v1, fwdFailure:Z
    const-string v0, ""

    .line 1265
    .local v0, exceptionMessage:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    if-eqz v3, :cond_0

    .line 1266
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->checkFwdChangeSuccess()Ljava/lang/String;

    move-result-object v0

    .line 1267
    if-eqz v0, :cond_0

    .line 1268
    const/4 v2, 0x0

    .line 1269
    const/4 v1, 0x1

    .line 1272
    :cond_0
    if-eqz v2, :cond_1

    .line 1273
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->checkVMChangeSuccess()Ljava/lang/String;

    move-result-object v0

    .line 1274
    if-eqz v0, :cond_1

    .line 1275
    const/4 v2, 0x0

    .line 1278
    :cond_1
    if-eqz v2, :cond_2

    .line 1280
    const-string v3, "change VM success!"

    invoke-static {v3}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1282
    const/16 v3, 0x258

    invoke-direct {p0, v3}, Lcom/mediatek/settings/VoiceMailSetting;->handleVMAndFwdSetSuccess(I)V

    .line 1283
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    .line 1293
    :goto_0
    return-void

    .line 1285
    :cond_2
    if-eqz v1, :cond_3

    .line 1286
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "change FW failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1287
    const/16 v3, 0x191

    invoke-direct {p0, v3}, Lcom/mediatek/settings/VoiceMailSetting;->handleVMOrFwdSetError(I)V

    goto :goto_0

    .line 1289
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "change VM failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1290
    const/16 v3, 0x190

    invoke-direct {p0, v3}, Lcom/mediatek/settings/VoiceMailSetting;->handleVMOrFwdSetError(I)V

    goto :goto_0
.end method

.method private handleVMAndFwdSetSuccess(I)V
    .locals 1
    .parameter "msgId"

    .prologue
    .line 1308
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 1309
    invoke-direct {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->showVMDialog(I)V

    .line 1310
    return-void
.end method

.method private handleVMBtnClickRequest()V
    .locals 4

    .prologue
    .line 756
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getCurrentVoicemailProviderKey()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    invoke-virtual {v2}, Lcom/android/phone/EditPhoneNumberPreference;->getPhoneNumber()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    invoke-direct {v1, p0, v2, v3}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;[Lcom/android/internal/telephony/CallForwardInfo;)V

    invoke-direct {p0, v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumber(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    .line 760
    return-void
.end method

.method private handleVMOrFwdSetError(I)V
    .locals 2
    .parameter "msgId"

    .prologue
    const/4 v1, 0x0

    .line 1296
    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    if-eqz v0, :cond_0

    .line 1297
    iput p1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    .line 1298
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 1299
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->switchToPreviousVoicemailProvider()V

    .line 1305
    :goto_0
    return-void

    .line 1302
    :cond_0
    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 1303
    invoke-direct {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->showVMDialog(I)V

    .line 1304
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    goto :goto_0
.end method

.method private infoForReason([Lcom/android/internal/telephony/CallForwardInfo;I)Lcom/android/internal/telephony/CallForwardInfo;
    .locals 6
    .parameter "infos"
    .parameter "reason"

    .prologue
    .line 985
    const/4 v4, 0x0

    .line 986
    .local v4, result:Lcom/android/internal/telephony/CallForwardInfo;
    if-eqz p1, :cond_0

    .line 987
    move-object v0, p1

    .local v0, arr$:[Lcom/android/internal/telephony/CallForwardInfo;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 988
    .local v2, info:Lcom/android/internal/telephony/CallForwardInfo;
    iget v5, v2, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    if-ne v5, p2, :cond_1

    .line 989
    move-object v4, v2

    .line 994
    .end local v0           #arr$:[Lcom/android/internal/telephony/CallForwardInfo;
    .end local v1           #i$:I
    .end local v2           #info:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v3           #len$:I
    :cond_0
    return-object v4

    .line 987
    .restart local v0       #arr$:[Lcom/android/internal/telephony/CallForwardInfo;
    .restart local v1       #i$:I
    .restart local v2       #info:Lcom/android/internal/telephony/CallForwardInfo;
    .restart local v3       #len$:I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private initVoiceMailProviders()V
    .locals 23

    .prologue
    .line 1700
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "callFeaturesSettings, initVoiceMailProviders: simId = "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1701
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v19

    if-eqz v19, :cond_2

    .line 1702
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->VM_NUMBERS_SHARED_PREFERENCES_NAME:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    move/from16 v21, v0

    aget-object v20, v20, v21

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    .line 1711
    :goto_0
    const/4 v14, 0x0

    .line 1712
    .local v14, providerToIgnore:Ljava/lang/String;
    const-string v19, "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_1

    .line 1714
    const-string v19, "ACTION_ADD_VOICEMAIL"

    invoke-static/range {v19 .. v19}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1716
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v19

    const-string v20, "com.android.phone.ProviderToIgnore"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_0

    .line 1717
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v19

    const-string v20, "com.android.phone.ProviderToIgnore"

    invoke-virtual/range {v19 .. v20}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1720
    :cond_0
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "providerToIgnore="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1722
    if-eqz v14, :cond_1

    .line 1723
    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lcom/mediatek/settings/VoiceMailSetting;->deleteSettingsForVoicemailProvider(Ljava/lang/String;)V

    .line 1727
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->clear()V

    .line 1730
    const v19, 0x7f0d01f0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 1731
    .local v10, myCarrier:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v19

    if-eqz v19, :cond_3

    .line 1732
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    move/from16 v21, v0

    aget-object v20, v20, v21

    new-instance v21, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v10, v2}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-interface/range {v19 .. v21}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1738
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v12

    .line 1739
    .local v12, pm:Landroid/content/pm/PackageManager;
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 1740
    .local v7, intent:Landroid/content/Intent;
    const-string v19, "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL"

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1741
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v12, v7, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v15

    .line 1742
    .local v15, resolveInfos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v19

    add-int/lit8 v9, v19, 0x1

    .line 1746
    .local v9, len:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_2
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v6, v0, :cond_5

    .line 1747
    invoke-interface {v15, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/content/pm/ResolveInfo;

    .line 1748
    .local v16, ri:Landroid/content/pm/ResolveInfo;
    move-object/from16 v0, v16

    iget-object v3, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 1749
    .local v3, currentActivityInfo:Landroid/content/pm/ActivityInfo;
    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/mediatek/settings/VoiceMailSetting;->makeKeyForActivity(Landroid/content/pm/ActivityInfo;)Ljava/lang/String;

    move-result-object v8

    .line 1751
    .local v8, key:Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Loading "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1753
    invoke-virtual {v8, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 1755
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Ignoring "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1757
    add-int/lit8 v9, v9, -0x1

    .line 1746
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 1706
    .end local v3           #currentActivityInfo:Landroid/content/pm/ActivityInfo;
    .end local v6           #i:I
    .end local v7           #intent:Landroid/content/Intent;
    .end local v8           #key:Ljava/lang/String;
    .end local v9           #len:I
    .end local v10           #myCarrier:Ljava/lang/String;
    .end local v12           #pm:Landroid/content/pm/PackageManager;
    .end local v14           #providerToIgnore:Ljava/lang/String;
    .end local v15           #resolveInfos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v16           #ri:Landroid/content/pm/ResolveInfo;
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->VM_NUMBERS_SHARED_PREFERENCES_NAME:[Ljava/lang/String;

    const/16 v21, 0x0

    aget-object v20, v20, v21

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    goto/16 :goto_0

    .line 1734
    .restart local v10       #myCarrier:Ljava/lang/String;
    .restart local v14       #providerToIgnore:Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    const/16 v21, 0x0

    aget-object v20, v20, v21

    new-instance v21, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;

    const/16 v22, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v10, v2}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;Landroid/content/Intent;)V

    invoke-interface/range {v19 .. v21}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1

    .line 1760
    .restart local v3       #currentActivityInfo:Landroid/content/pm/ActivityInfo;
    .restart local v6       #i:I
    .restart local v7       #intent:Landroid/content/Intent;
    .restart local v8       #key:Ljava/lang/String;
    .restart local v9       #len:I
    .restart local v12       #pm:Landroid/content/pm/PackageManager;
    .restart local v15       #resolveInfos:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .restart local v16       #ri:Landroid/content/pm/ResolveInfo;
    :cond_4
    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 1761
    .local v11, nameForDisplay:Ljava/lang/String;
    new-instance v13, Landroid/content/Intent;

    invoke-direct {v13}, Landroid/content/Intent;-><init>()V

    .line 1762
    .local v13, providerIntent:Landroid/content/Intent;
    const-string v19, "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1763
    iget-object v0, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    move-object/from16 v19, v0

    iget-object v0, v3, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1765
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    new-instance v20, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;

    move-object/from16 v0, v20

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v11, v13}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;Landroid/content/Intent;)V

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1773
    .end local v3           #currentActivityInfo:Landroid/content/pm/ActivityInfo;
    .end local v8           #key:Ljava/lang/String;
    .end local v11           #nameForDisplay:Ljava/lang/String;
    .end local v13           #providerIntent:Landroid/content/Intent;
    .end local v16           #ri:Landroid/content/pm/ResolveInfo;
    :cond_5
    new-array v4, v9, [Ljava/lang/String;

    .line 1774
    .local v4, entries:[Ljava/lang/String;
    new-array v0, v9, [Ljava/lang/String;

    move-object/from16 v18, v0

    .line 1775
    .local v18, values:[Ljava/lang/String;
    const/16 v19, 0x0

    aput-object v10, v4, v19

    .line 1776
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v19

    if-eqz v19, :cond_6

    .line 1777
    const/16 v19, 0x0

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    move/from16 v21, v0

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    .line 1782
    :goto_4
    const/4 v5, 0x1

    .line 1783
    .local v5, entryIdx:I
    const/4 v6, 0x0

    :goto_5
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v6, v0, :cond_8

    .line 1784
    invoke-interface {v15, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/content/pm/ResolveInfo;

    move-object/from16 v0, v19

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->makeKeyForActivity(Landroid/content/pm/ActivityInfo;)Ljava/lang/String;

    move-result-object v8

    .line 1785
    .restart local v8       #key:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_7

    .line 1783
    :goto_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 1779
    .end local v5           #entryIdx:I
    .end local v8           #key:Ljava/lang/String;
    :cond_6
    const/16 v19, 0x0

    sget-object v20, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    const/16 v21, 0x0

    aget-object v20, v20, v21

    aput-object v20, v18, v19

    goto :goto_4

    .line 1788
    .restart local v5       #entryIdx:I
    .restart local v8       #key:Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;->mName:Ljava/lang/String;

    move-object/from16 v19, v0

    aput-object v19, v4, v5

    .line 1789
    aput-object v8, v18, v5

    .line 1790
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 1793
    .end local v8           #key:Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Landroid/preference/ListPreference;->setEntries([Ljava/lang/CharSequence;)V

    .line 1794
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setEntryValues([Ljava/lang/CharSequence;)V

    .line 1796
    invoke-direct/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getCurrentVoicemailProviderKey()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    .line 1797
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v19

    if-eqz v19, :cond_9

    .line 1798
    invoke-virtual/range {p0 .. p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v17

    .line 1799
    .local v17, sp:Landroid/content/SharedPreferences;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "button_voicemail_provider_key"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    const/16 v21, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 1802
    .end local v17           #sp:Landroid/content/SharedPreferences;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->updateVMPreferenceWidgets(Ljava/lang/String;)V

    .line 1803
    return-void
.end method

.method private isAirplaneModeOn()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    .line 1653
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isUpdateRequired(Lcom/android/internal/telephony/CallForwardInfo;Lcom/android/internal/telephony/CallForwardInfo;)Z
    .locals 2
    .parameter "oldInfo"
    .parameter "newInfo"

    .prologue
    .line 999
    const/4 v0, 0x1

    .line 1000
    .local v0, result:Z
    iget v1, p2, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-nez v1, :cond_0

    .line 1003
    if-eqz p1, :cond_0

    iget v1, p1, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-nez v1, :cond_0

    .line 1004
    const/4 v0, 0x0

    .line 1007
    :cond_0
    return v0
.end method

.method private loadSettingsForVoiceMailProvider(Ljava/lang/String;)Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    .locals 12
    .parameter "key"

    .prologue
    const/4 v5, 0x0

    const/4 v11, 0x0

    .line 1878
    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "#VMNumber"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1880
    .local v6, vmNumberSetting:Ljava/lang/String;
    if-nez v6, :cond_0

    .line 1882
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Settings for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not found"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1913
    :goto_0
    return-object v5

    .line 1887
    :cond_0
    sget-object v0, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 1888
    .local v0, cfi:[Lcom/android/internal/telephony/CallForwardInfo;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#FWDSettings"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1889
    .local v1, fwdKey:Ljava/lang/String;
    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "#Length"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1890
    .local v2, fwdLen:I
    if-lez v2, :cond_1

    .line 1891
    new-array v0, v2, [Lcom/android/internal/telephony/CallForwardInfo;

    .line 1892
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v7, v0

    if-ge v3, v7, :cond_1

    .line 1893
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Setting"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1894
    .local v4, settingKey:Ljava/lang/String;
    new-instance v7, Lcom/android/internal/telephony/CallForwardInfo;

    invoke-direct {v7}, Lcom/android/internal/telephony/CallForwardInfo;-><init>()V

    aput-object v7, v0, v3

    .line 1895
    aget-object v7, v0, v3

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "#Status"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    .line 1897
    aget-object v7, v0, v3

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "#Reason"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x5

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    .line 1900
    aget-object v7, v0, v3

    const/4 v8, 0x1

    iput v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    .line 1901
    aget-object v7, v0, v3

    const/16 v8, 0x91

    iput v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->toa:I

    .line 1902
    aget-object v7, v0, v3

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "#Number"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, ""

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    .line 1904
    aget-object v7, v0, v3

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "#Time"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x14

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    iput v8, v7, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    .line 1892
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 1909
    .end local v3           #i:I
    .end local v4           #settingKey:Ljava/lang/String;
    :cond_1
    new-instance v5, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    invoke-direct {v5, p0, v6, v0}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;[Lcom/android/internal/telephony/CallForwardInfo;)V

    .line 1911
    .local v5, settings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Loaded settings for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 1658
    const-string v0, "Settings/VoiceMailSetting"

    invoke-static {v0, p0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1659
    return-void
.end method

.method private makeKeyForActivity(Landroid/content/pm/ActivityInfo;)Ljava/lang/String;
    .locals 1
    .parameter "ai"

    .prologue
    .line 1806
    iget-object v0, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    return-object v0
.end method

.method private maybeSaveSettingsForVoicemailProvider(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V
    .locals 9
    .parameter "key"
    .parameter "newSettings"

    .prologue
    .line 1836
    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-nez v7, :cond_0

    .line 1867
    :goto_0
    return-void

    .line 1839
    :cond_0
    invoke-direct {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->loadSettingsForVoiceMailProvider(Ljava/lang/String;)Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    move-result-object v0

    .line 1840
    .local v0, curSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    invoke-virtual {p2, v0}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1842
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Not saving setting for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " since they have not changed"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1847
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Saving settings for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1849
    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPerProviderSavedVMNumbers:Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 1850
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#VMNumber"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p2, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mVoicemailNumber:Ljava/lang/String;

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1851
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#FWDSettings"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1852
    .local v3, fwdKey:Ljava/lang/String;
    iget-object v5, p2, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mForwardingSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 1853
    .local v5, s:[Lcom/android/internal/telephony/CallForwardInfo;
    sget-object v7, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    if-eq v5, v7, :cond_2

    .line 1854
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Length"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    array-length v8, v5

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1855
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    array-length v7, v5

    if-ge v4, v7, :cond_3

    .line 1856
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Setting"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 1857
    .local v6, settingKey:Ljava/lang/String;
    aget-object v2, v5, v4

    .line 1858
    .local v2, fi:Lcom/android/internal/telephony/CallForwardInfo;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Status"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1859
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Reason"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1860
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Number"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v2, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1861
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Time"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iget v8, v2, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1855
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_1

    .line 1864
    .end local v2           #fi:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v4           #i:I
    .end local v6           #settingKey:Ljava/lang/String;
    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "#Length"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 1866
    :cond_3
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto/16 :goto_0
.end method

.method private resetForwardingChangeState()V
    .locals 1

    .prologue
    .line 1011
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    .line 1012
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mExpectedChangeResultReasons:Ljava/util/Collection;

    .line 1013
    return-void
.end method

.method private saveVoiceMailAndForwardingNumber(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V
    .locals 8
    .parameter "key"
    .parameter "newSettings"

    .prologue
    const/16 v7, 0x1f6

    const/4 v3, 0x0

    .line 804
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "saveVoiceMailAndForwardingNumber: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 806
    iget-object v2, p2, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mVoicemailNumber:Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    .line 808
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 809
    const-string v2, ""

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    .line 812
    :cond_0
    iget-object v2, p2, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mForwardingSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 814
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "newFwdNumber "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    array-length v2, v2

    :goto_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " settings"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 820
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v2

    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    .line 822
    const-string v2, "ignoring forwarding setting since this is CDMA phone"

    invoke-static {v2}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 824
    sget-object v2, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 828
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    iget-object v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    sget-object v4, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    if-ne v2, v4, :cond_3

    .line 829
    const/16 v2, 0x2bc

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->showVMDialog(I)V

    .line 866
    :goto_1
    return-void

    :cond_2
    move v2, v3

    .line 814
    goto :goto_0

    .line 833
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/mediatek/settings/VoiceMailSetting;->maybeSaveSettingsForVoicemailProvider(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    .line 834
    iput-boolean v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMChangeCompletedSuccesfully:Z

    .line 835
    iput-boolean v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mFwdChangesRequireRollback:Z

    .line 836
    iput v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    .line 840
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 841
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    sget-object v4, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    iget v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    aget-object v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 846
    .local v1, isKeySame:Z
    :goto_2
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    if-eqz v1, :cond_7

    .line 849
    const-string v2, "Reading current forwarding settings"

    invoke-static {v2}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 851
    sget-object v2, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    array-length v2, v2

    new-array v2, v2, [Lcom/android/internal/telephony/CallForwardInfo;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 852
    const/4 v0, 0x0

    .local v0, i:I
    :goto_3
    sget-object v2, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    array-length v2, v2

    if-ge v0, v2, :cond_6

    .line 853
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    const/4 v4, 0x0

    aput-object v4, v2, v0

    .line 854
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 855
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    sget-object v4, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mGetOptionComplete:Landroid/os/Handler;

    invoke-virtual {v5, v7, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v2, v4, v5, v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCallForwardingOptionGemini(ILandroid/os/Message;I)V

    .line 852
    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 843
    .end local v0           #i:I
    .end local v1           #isKeySame:Z
    :cond_4
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    sget-object v4, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .restart local v1       #isKeySame:Z
    goto :goto_2

    .line 858
    .restart local v0       #i:I
    :cond_5
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    sget-object v4, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    aget v4, v4, v0

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mGetOptionComplete:Landroid/os/Handler;

    invoke-virtual {v5, v7, v0, v3}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    invoke-interface {v2, v4, v5}, Lcom/android/internal/telephony/Phone;->getCallForwardingOption(ILandroid/os/Message;)V

    goto :goto_4

    .line 862
    :cond_6
    const/16 v2, 0x25a

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_1

    .line 864
    .end local v0           #i:I
    :cond_7
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumberStage2()V

    goto :goto_1
.end method

.method private saveVoiceMailAndForwardingNumberStage2()V
    .locals 14

    .prologue
    const/4 v0, 0x0

    const/16 v13, 0x1f5

    const/4 v10, 0x3

    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 1018
    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    .line 1019
    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailChangeResult:Landroid/os/AsyncResult;

    .line 1020
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    sget-object v1, Lcom/mediatek/settings/VoiceMailSetting;->FWD_SETTINGS_DONT_TOUCH:[Lcom/android/internal/telephony/CallForwardInfo;

    if-eq v0, v1, :cond_4

    .line 1021
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->resetForwardingChangeState()V

    .line 1022
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    array-length v0, v0

    if-ge v9, v0, :cond_5

    .line 1023
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    aget-object v8, v0, v9

    .line 1025
    .local v8, fi:Lcom/android/internal/telephony/CallForwardInfo;
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    iget v1, v8, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    invoke-direct {p0, v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->infoForReason([Lcom/android/internal/telephony/CallForwardInfo;I)Lcom/android/internal/telephony/CallForwardInfo;

    move-result-object v0

    invoke-direct {p0, v0, v8}, Lcom/mediatek/settings/VoiceMailSetting;->isUpdateRequired(Lcom/android/internal/telephony/CallForwardInfo;Lcom/android/internal/telephony/CallForwardInfo;)Z

    move-result v7

    .line 1028
    .local v7, doUpdate:Z
    if-eqz v7, :cond_0

    .line 1030
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Setting fwd #: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v8}, Lcom/android/internal/telephony/CallForwardInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1032
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mExpectedChangeResultReasons:Ljava/util/Collection;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1034
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1035
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v1, v8, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-ne v1, v12, :cond_1

    move v1, v10

    :goto_1
    iget v2, v8, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    iget-object v3, v8, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    iget v4, v8, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSetOptionComplete:Landroid/os/Handler;

    invoke-virtual {v5, v13, v9, v11}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setCallForwardingOptionGemini(IILjava/lang/String;ILandroid/os/Message;I)V

    .line 1055
    :cond_0
    :goto_2
    const/16 v0, 0x259

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    .line 1022
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    move v1, v11

    .line 1035
    goto :goto_1

    .line 1045
    :cond_2
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    iget v1, v8, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-ne v1, v12, :cond_3

    move v1, v10

    :goto_3
    iget v2, v8, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    iget-object v3, v8, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    iget v4, v8, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSetOptionComplete:Landroid/os/Handler;

    invoke-virtual {v5, v13, v9, v11}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/Phone;->setCallForwardingOption(IILjava/lang/String;ILandroid/os/Message;)V

    goto :goto_2

    :cond_3
    move v1, v11

    goto :goto_3

    .line 1059
    .end local v7           #doUpdate:Z
    .end local v8           #fi:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v9           #i:I
    :cond_4
    const-string v0, "Not touching fwd #"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1061
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->setVMNumberWithCarrier()V

    .line 1063
    :cond_5
    return-void
.end method

.method private showDialogIfForeground(I)V
    .locals 1
    .parameter "id"

    .prologue
    .line 788
    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForeground:Z

    if-eqz v0, :cond_0

    .line 789
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->showDialog(I)V

    .line 791
    :cond_0
    return-void
.end method

.method private showVMDialog(I)V
    .locals 1
    .parameter "msgStatus"

    .prologue
    .line 1478
    sparse-switch p1, :sswitch_data_0

    .line 1499
    :goto_0
    return-void

    .line 1482
    :sswitch_0
    const/16 v0, 0x1f4

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_0

    .line 1485
    :sswitch_1
    const/16 v0, 0x1f5

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_0

    .line 1488
    :sswitch_2
    const/16 v0, 0x1f6

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_0

    .line 1491
    :sswitch_3
    const/16 v0, 0x190

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_0

    .line 1494
    :sswitch_4
    const/16 v0, 0x258

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    goto :goto_0

    .line 1478
    :sswitch_data_0
    .sparse-switch
        0x190 -> :sswitch_0
        0x191 -> :sswitch_1
        0x192 -> :sswitch_2
        0x258 -> :sswitch_4
        0x2bc -> :sswitch_3
    .end sparse-switch
.end method

.method private simulatePreferenceClick(Landroid/preference/Preference;)V
    .locals 7
    .parameter "preference"

    .prologue
    .line 1818
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getRootAdapter()Landroid/widget/ListAdapter;

    move-result-object v6

    .line 1819
    .local v6, adapter:Landroid/widget/ListAdapter;
    const/4 v3, 0x0

    .local v3, idx:I
    :goto_0
    invoke-interface {v6}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    if-ge v3, v0, :cond_0

    .line 1820
    invoke-interface {v6, v3}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_1

    .line 1821
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v6, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Landroid/preference/PreferenceScreen;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 1826
    :cond_0
    return-void

    .line 1819
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method private switchToPreviousVoicemailProvider()V
    .locals 14

    .prologue
    .line 539
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "switchToPreviousVoicemailProvider "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 541
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 542
    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMChangeCompletedSuccesfully:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mFwdChangesRequireRollback:Z

    if-eqz v0, :cond_9

    .line 544
    :cond_0
    const/16 v0, 0x25b

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showDialogIfForeground(I)V

    .line 545
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->loadSettingsForVoiceMailProvider(Ljava/lang/String;)Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    move-result-object v10

    .line 547
    .local v10, prevSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    if-nez v10, :cond_2

    .line 620
    .end local v10           #prevSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    :cond_1
    :goto_0
    return-void

    .line 550
    .restart local v10       #prevSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    :cond_2
    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMChangeCompletedSuccesfully:Z

    if-eqz v0, :cond_3

    .line 551
    iget-object v0, v10, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mVoicemailNumber:Ljava/lang/String;

    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "have to revert VM to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 556
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 557
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVoiceMailAlphaTagGemini(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mRevertOptionComplete:Landroid/os/Handler;

    const/16 v4, 0x1f4

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setVoiceMailNumberGemini(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;I)V

    .line 569
    :cond_3
    :goto_1
    iget-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mFwdChangesRequireRollback:Z

    if-eqz v0, :cond_1

    .line 571
    const-string v0, "have to revert fwd"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 573
    iget-object v9, v10, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;->mForwardingSettings:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 575
    .local v9, prevFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;
    if-eqz v9, :cond_1

    .line 576
    iget-object v12, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingChangeResults:Ljava/util/Map;

    .line 578
    .local v12, results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->resetForwardingChangeState()V

    .line 579
    const/4 v8, 0x0

    .local v8, i:I
    :goto_2
    array-length v0, v9

    if-ge v8, v0, :cond_1

    .line 580
    aget-object v7, v9, v8

    .line 582
    .local v7, fi:Lcom/android/internal/telephony/CallForwardInfo;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Reverting fwd #: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v7}, Lcom/android/internal/telephony/CallForwardInfo;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 586
    iget v0, v7, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v12, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/os/AsyncResult;

    .line 587
    .local v11, result:Landroid/os/AsyncResult;
    if-eqz v11, :cond_4

    iget-object v0, v11, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_4

    .line 588
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mExpectedChangeResultReasons:Ljava/util/Collection;

    iget v1, v7, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 590
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 591
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v1, v7, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_6

    const/4 v1, 0x3

    :goto_3
    iget v2, v7, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    iget-object v3, v7, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    iget v4, v7, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mRevertOptionComplete:Landroid/os/Handler;

    const/16 v6, 0x1f5

    const/4 v13, 0x0

    invoke-virtual {v5, v6, v8, v13}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setCallForwardingOptionGemini(IILjava/lang/String;ILandroid/os/Message;I)V

    .line 579
    :cond_4
    :goto_4
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 563
    .end local v7           #fi:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v8           #i:I
    .end local v9           #prevFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;
    .end local v11           #result:Landroid/os/AsyncResult;
    .end local v12           #results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    :cond_5
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getVoiceMailAlphaTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mRevertOptionComplete:Landroid/os/Handler;

    const/16 v4, 0x1f4

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/Phone;->setVoiceMailNumber(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_1

    .line 591
    .restart local v7       #fi:Lcom/android/internal/telephony/CallForwardInfo;
    .restart local v8       #i:I
    .restart local v9       #prevFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;
    .restart local v11       #result:Landroid/os/AsyncResult;
    .restart local v12       #results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    :cond_6
    const/4 v1, 0x0

    goto :goto_3

    .line 600
    :cond_7
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    iget v1, v7, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_8

    const/4 v1, 0x3

    :goto_5
    iget v2, v7, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    iget-object v3, v7, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    iget v4, v7, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mRevertOptionComplete:Landroid/os/Handler;

    const/16 v6, 0x1f5

    const/4 v13, 0x0

    invoke-virtual {v5, v6, v8, v13}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v5

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/Phone;->setCallForwardingOption(IILjava/lang/String;ILandroid/os/Message;)V

    goto :goto_4

    :cond_8
    const/4 v1, 0x0

    goto :goto_5

    .line 615
    .end local v7           #fi:Lcom/android/internal/telephony/CallForwardInfo;
    .end local v8           #i:I
    .end local v9           #prevFwdSettings:[Lcom/android/internal/telephony/CallForwardInfo;
    .end local v10           #prevSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    .end local v11           #result:Landroid/os/AsyncResult;
    .end local v12           #results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Integer;Landroid/os/AsyncResult;>;"
    :cond_9
    const-string v0, "No need to revert"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 617
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->onRevertDone()V

    goto/16 :goto_0
.end method

.method private updateVMPreferenceWidgets(Ljava/lang/String;)V
    .locals 9
    .parameter "currentProviderSetting"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1667
    move-object v0, p1

    .line 1668
    .local v0, key:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;

    .line 1674
    .local v1, provider:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;
    if-nez v1, :cond_0

    .line 1675
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    const v4, 0x7f0d01ef

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/VoiceMailSetting;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1676
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    const-string v4, ""

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->setSummary(Ljava/lang/CharSequence;)V

    .line 1677
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    invoke-virtual {v3, v7}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 1678
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->setIntent(Landroid/content/Intent;)V

    .line 1687
    :goto_0
    return-void

    .line 1680
    :cond_0
    iget-object v2, v1, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;->mName:Ljava/lang/String;

    .line 1681
    .local v2, providerName:Ljava/lang/String;
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    invoke-virtual {v3, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 1682
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0d0165

    new-array v6, v8, [Ljava/lang/Object;

    aput-object v2, v6, v7

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->setSummary(Ljava/lang/CharSequence;)V

    .line 1684
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 1685
    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    iget-object v4, v1, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProvider;->mIntent:Landroid/content/Intent;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->setIntent(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method private updateVoiceNumberField()V
    .locals 4

    .prologue
    .line 1317
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    if-nez v1, :cond_0

    .line 1337
    :goto_0
    return-void

    .line 1321
    :cond_0
    const-string v1, "Settings/VoiceMailSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateVoiceNumberField, simid:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1322
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1323
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVoiceMailNumberGemini(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    .line 1328
    :goto_1
    const-string v1, "Settings/VoiceMailSetting"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateVoiceNumberField, mOldVmNumber:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1330
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 1331
    const-string v1, ""

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    .line 1333
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPhoneNumberPreference;->setPhoneNumber(Ljava/lang/String;)Lcom/android/phone/EditPhoneNumberPreference;

    .line 1334
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3

    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    .line 1336
    .local v0, summary:Ljava/lang/String;
    :goto_2
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    invoke-virtual {v1, v0}, Lcom/android/phone/EditPhoneNumberPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1325
    .end local v0           #summary:Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getVoiceMailNumber()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    goto :goto_1

    .line 1334
    :cond_3
    const v1, 0x7f0d0171

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_2
.end method


# virtual methods
.method handleForwardingSettingsReadResult(Landroid/os/AsyncResult;I)V
    .locals 10
    .parameter "ar"
    .parameter "idx"

    .prologue
    const/16 v8, 0x25a

    const/4 v9, 0x0

    .line 884
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "handleForwardingSettingsReadResult: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 886
    const/4 v2, 0x0

    .line 887
    .local v2, error:Ljava/lang/Throwable;
    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v5, :cond_0

    .line 889
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FwdRead: ar.exception="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v7}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 892
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    .line 894
    :cond_0
    iget-object v5, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v5, v5, Ljava/lang/Throwable;

    if-eqz v5, :cond_1

    .line 896
    const-string v6, "Settings/VoiceMailSetting"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FwdRead: userObj="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v5, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Throwable;

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 899
    iget-object v2, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v2           #error:Ljava/lang/Throwable;
    check-cast v2, Ljava/lang/Throwable;

    .line 903
    .restart local v2       #error:Ljava/lang/Throwable;
    :cond_1
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    if-nez v5, :cond_2

    .line 905
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ignoring fwd reading result: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 982
    :goto_0
    return-void

    .line 911
    :cond_2
    if-eqz v2, :cond_3

    .line 913
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error discovered for fwd read : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 915
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    .line 916
    invoke-direct {p0, v8}, Lcom/mediatek/settings/VoiceMailSetting;->dismissDialogSafely(I)V

    .line 917
    const/16 v5, 0x192

    invoke-direct {p0, v5}, Lcom/mediatek/settings/VoiceMailSetting;->showVMDialog(I)V

    goto :goto_0

    .line 922
    :cond_3
    iget-object v5, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v5, [Lcom/android/internal/telephony/CallForwardInfo;

    move-object v0, v5

    check-cast v0, [Lcom/android/internal/telephony/CallForwardInfo;

    .line 923
    .local v0, cfInfoArray:[Lcom/android/internal/telephony/CallForwardInfo;
    const/4 v3, 0x0

    .line 924
    .local v3, fi:Lcom/android/internal/telephony/CallForwardInfo;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    array-length v5, v0

    if-ge v4, v5, :cond_4

    .line 925
    aget-object v5, v0, v4

    iget v5, v5, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    and-int/lit8 v5, v5, 0x1

    if-eqz v5, :cond_7

    .line 926
    aget-object v3, v0, v4

    .line 930
    :cond_4
    if-nez v3, :cond_8

    .line 935
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Creating default info for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 937
    new-instance v3, Lcom/android/internal/telephony/CallForwardInfo;

    .end local v3           #fi:Lcom/android/internal/telephony/CallForwardInfo;
    invoke-direct {v3}, Lcom/android/internal/telephony/CallForwardInfo;-><init>()V

    .line 938
    .restart local v3       #fi:Lcom/android/internal/telephony/CallForwardInfo;
    iput v9, v3, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    .line 939
    sget-object v5, Lcom/mediatek/settings/VoiceMailSetting;->FORWARDING_SETTINGS_REASONS:[I

    aget v5, v5, p2

    iput v5, v3, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    .line 940
    const/4 v5, 0x1

    iput v5, v3, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    .line 951
    :goto_2
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    aput-object v3, v5, p2

    .line 954
    const/4 v1, 0x1

    .line 955
    .local v1, done:Z
    const/4 v4, 0x0

    :goto_3
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    array-length v5, v5

    if-ge v4, v5, :cond_5

    .line 956
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    aget-object v5, v5, v4

    if-nez v5, :cond_b

    .line 957
    const/4 v1, 0x0

    .line 961
    :cond_5
    if-eqz v1, :cond_d

    .line 963
    const-string v5, "Settings/VoiceMailSetting"

    const-string v6, "Done receiving fwd info"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    invoke-direct {p0, v8}, Lcom/mediatek/settings/VoiceMailSetting;->dismissDialogSafely(I)V

    .line 966
    iget-boolean v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReadingSettingsForDefaultProvider:Z

    if-eqz v5, :cond_6

    .line 967
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 968
    sget-object v5, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    iget v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    aget-object v5, v5, v6

    new-instance v6, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    invoke-direct {v6, p0, v7, v8}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;[Lcom/android/internal/telephony/CallForwardInfo;)V

    invoke-direct {p0, v5, v6}, Lcom/mediatek/settings/VoiceMailSetting;->maybeSaveSettingsForVoicemailProvider(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    .line 974
    :goto_4
    iput-boolean v9, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReadingSettingsForDefaultProvider:Z

    .line 976
    :cond_6
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumberStage2()V

    goto/16 :goto_0

    .line 924
    .end local v1           #done:Z
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 943
    :cond_8
    iget-object v5, v3, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    if-eqz v5, :cond_9

    iget-object v5, v3, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_a

    .line 944
    :cond_9
    iput v9, v3, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    .line 948
    :cond_a
    const-string v5, "Settings/VoiceMailSetting"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Got  "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Lcom/android/internal/telephony/CallForwardInfo;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 955
    .restart local v1       #done:Z
    :cond_b
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 971
    :cond_c
    sget-object v5, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    aget-object v5, v5, v9

    new-instance v6, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    iget-object v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mOldVmNumber:Ljava/lang/String;

    iget-object v8, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForwardingReadResults:[Lcom/android/internal/telephony/CallForwardInfo;

    invoke-direct {v6, p0, v7, v8}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;[Lcom/android/internal/telephony/CallForwardInfo;)V

    invoke-direct {p0, v5, v6}, Lcom/mediatek/settings/VoiceMailSetting;->maybeSaveSettingsForVoicemailProvider(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    goto :goto_4

    .line 979
    :cond_d
    const-string v5, "Settings/VoiceMailSetting"

    const-string v6, "Not done receiving fwd info"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 15
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 641
    const/4 v1, 0x2

    move/from16 v0, p1

    if-ne v0, v1, :cond_a

    .line 642
    const/4 v8, 0x0

    .line 646
    .local v8, failure:Z
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mVMProviderSettingsForced: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 648
    iget-boolean v12, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    .line 649
    .local v12, isVMProviderSettingsForced:Z
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    .line 651
    const/4 v14, 0x0

    .line 652
    .local v14, vmNum:Ljava/lang/String;
    const/4 v1, -0x1

    move/from16 v0, p2

    if-eq v0, v1, :cond_2

    .line 654
    const-string v1, "onActivityResult: vm provider cfg result not OK."

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 656
    const/4 v8, 0x1

    .line 694
    :cond_0
    :goto_0
    if-eqz v8, :cond_8

    .line 696
    const-string v1, "Failure in return from voicemail provider"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 698
    if-eqz v12, :cond_7

    .line 699
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->switchToPreviousVoicemailProvider()V

    .line 747
    .end local v8           #failure:Z
    .end local v12           #isVMProviderSettingsForced:Z
    .end local v14           #vmNum:Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 658
    .restart local v8       #failure:Z
    .restart local v12       #isVMProviderSettingsForced:Z
    .restart local v14       #vmNum:Ljava/lang/String;
    :cond_2
    if-nez p3, :cond_3

    .line 660
    const-string v1, "onActivityResult: vm provider cfg result has no data"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 662
    const/4 v8, 0x1

    goto :goto_0

    .line 664
    :cond_3
    const-string v1, "com.android.phone.Signout"

    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 666
    const-string v1, "Provider requested signout"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 668
    if-eqz v12, :cond_4

    .line 670
    const-string v1, "Going back to previous provider on signout"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 672
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->switchToPreviousVoicemailProvider()V

    goto :goto_1

    .line 674
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getCurrentVoicemailProviderKey()Ljava/lang/String;

    move-result-object v13

    .line 676
    .local v13, victim:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Relaunching activity and ignoring "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 678
    new-instance v11, Landroid/content/Intent;

    const-string v1, "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

    invoke-direct {v11, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 679
    .local v11, i:Landroid/content/Intent;
    const-string v1, "com.android.phone.ProviderToIgnore"

    invoke-virtual {v11, v1, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 680
    const/high16 v1, 0x400

    invoke-virtual {v11, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 681
    invoke-virtual {p0, v11}, Lcom/mediatek/settings/VoiceMailSetting;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 685
    .end local v11           #i:Landroid/content/Intent;
    .end local v13           #victim:Ljava/lang/String;
    :cond_5
    const-string v1, "com.android.phone.VoicemailNumber"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 686
    if-eqz v14, :cond_6

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 688
    :cond_6
    const-string v1, "onActivityResult: vm provider cfg result has no vmnum"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 690
    const/4 v8, 0x1

    goto :goto_0

    .line 702
    :cond_7
    const-string v1, "Not switching back the provider since this is not forced config"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 707
    :cond_8
    iput-boolean v12, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 708
    const-string v1, "com.android.phone.ForwardingNumber"

    move-object/from16 v0, p3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 711
    .local v9, fwdNum:Ljava/lang/String;
    const-string v1, "com.android.phone.ForwardingNumberTime"

    const/16 v2, 0x14

    move-object/from16 v0, p3

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 714
    .local v10, fwdNumTime:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onActivityResult: vm provider cfg result "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v9, :cond_9

    const-string v1, "has"

    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " forwarding number"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 717
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getCurrentVoicemailProviderKey()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    invoke-direct {v2, p0, v14, v9, v10}, Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;-><init>(Lcom/mediatek/settings/VoiceMailSetting;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-direct {p0, v1, v2}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumber(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    goto/16 :goto_1

    .line 714
    :cond_9
    const-string v1, " does not have"

    goto :goto_2

    .line 722
    .end local v8           #failure:Z
    .end local v9           #fwdNum:Ljava/lang/String;
    .end local v10           #fwdNumTime:I
    .end local v12           #isVMProviderSettingsForced:Z
    .end local v14           #vmNum:Ljava/lang/String;
    :cond_a
    const/4 v1, -0x1

    move/from16 v0, p2

    if-eq v0, v1, :cond_b

    .line 724
    const-string v1, "onActivityResult: contact picker result not OK."

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 729
    :cond_b
    const/4 v7, 0x0

    .line 731
    .local v7, cursor:Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual/range {p3 .. p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->NUM_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 733
    if-eqz v7, :cond_c

    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_c

    .line 734
    packed-switch p1, :pswitch_data_0

    .line 743
    :cond_c
    :goto_3
    if-eqz v7, :cond_1

    .line 744
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto/16 :goto_1

    .line 736
    :pswitch_0
    :try_start_1
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    const/4 v2, 0x0

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPhoneNumberPreference;->onPickActivityResult(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 743
    :catchall_0
    move-exception v1

    if-eqz v7, :cond_d

    .line 744
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_d
    throw v1

    .line 734
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/16 v1, 0x1f6

    .line 1435
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 1436
    packed-switch p2, :pswitch_data_0

    .line 1471
    :cond_0
    :goto_0
    const-string v0, "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1472
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    .line 1474
    :cond_1
    :goto_1
    return-void

    .line 1439
    :pswitch_0
    const-string v0, "Neutral button"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1444
    :pswitch_1
    const-string v0, "Negative button"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1446
    iget v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mCurrentDialogId:I

    if-ne v0, v1, :cond_0

    .line 1449
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->switchToPreviousVoicemailProvider()V

    goto :goto_0

    .line 1454
    :pswitch_2
    const-string v0, "Positive button"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1456
    iget v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mCurrentDialogId:I

    if-ne v0, v1, :cond_2

    .line 1459
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumberStage2()V

    goto :goto_1

    .line 1461
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    goto :goto_1

    .line 1436
    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "icicle"

    .prologue
    const/4 v4, -0x1

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1507
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 1509
    const-string v2, "Creating activity"

    invoke-static {v2}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1511
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    .line 1512
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "simId"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    .line 1514
    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    if-eq v2, v4, :cond_0

    .line 1515
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "sub_title_name"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    .line 1516
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 1517
    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-static {p0, v2}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    .line 1521
    :cond_0
    const v2, 0x7f060022

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->addPreferencesFromResource(I)V

    .line 1523
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1524
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->setTitle(Ljava/lang/CharSequence;)V

    .line 1527
    :cond_1
    const-string v2, "button_voicemail_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Lcom/android/phone/EditPhoneNumberPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    .line 1528
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    if-eqz v2, :cond_2

    .line 1529
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    invoke-virtual {v2, p0, v6, p0}, Lcom/android/phone/EditPhoneNumberPreference;->setParentActivity(Landroid/app/Activity;ILcom/android/phone/EditPhoneNumberPreference$GetDefaultNumberListener;)V

    .line 1530
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    invoke-virtual {v2, p0}, Lcom/android/phone/EditPhoneNumberPreference;->setDialogOnClosedListener(Lcom/android/phone/EditPhoneNumberPreference$OnDialogClosedListener;)V

    .line 1531
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    const v3, 0x7f0d02b9

    invoke-virtual {v2, v3}, Lcom/android/phone/EditPhoneNumberPreference;->setDialogTitle(I)V

    .line 1533
    :cond_2
    const-string v2, "button_voicemail_provider_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    .line 1534
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-eqz v2, :cond_4

    .line 1535
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    invoke-virtual {v2, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 1536
    const-string v2, "button_voicemail_setting_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceScreen;

    iput-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    .line 1537
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1538
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "button_voicemail_provider_key"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 1540
    :cond_3
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->initVoiceMailProviders()V

    .line 1549
    :cond_4
    if-nez p1, :cond_5

    .line 1550
    const-string v2, "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-eqz v2, :cond_5

    .line 1552
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProvidersData:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-le v2, v6, :cond_7

    .line 1553
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->simulatePreferenceClick(Landroid/preference/Preference;)V

    .line 1566
    :cond_5
    :goto_0
    iput-boolean v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    .line 1568
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 1572
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.DUAL_SIM_MODE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1575
    const-string v2, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 1578
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2, v1}, Lcom/mediatek/settings/VoiceMailSetting;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 1579
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 1580
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_6

    .line 1582
    invoke-virtual {v0, v6}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 1584
    :cond_6
    return-void

    .line 1555
    .end local v0           #actionBar:Landroid/app/ActionBar;
    .end local v1           #intentFilter:Landroid/content/IntentFilter;
    :cond_7
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1556
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    iget v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    aget-object v3, v3, v4

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/VoiceMailSetting;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    .line 1557
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    iget v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 1559
    :cond_8
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    aget-object v3, v3, v5

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/VoiceMailSetting;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z

    .line 1560
    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    sget-object v3, Lcom/mediatek/settings/VoiceMailSetting;->DEFAULT_VM_PROVIDER_KEY:[Ljava/lang/String;

    aget-object v3, v3, v5

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onCreateDialog(I)Landroid/app/Dialog;
    .locals 10
    .parameter "id"

    .prologue
    const/16 v9, 0x25b

    const/16 v8, 0x259

    const/4 v7, 0x0

    const v6, 0x7f0d01e5

    .line 1357
    const/16 v5, 0x1f4

    if-eq p1, v5, :cond_0

    const/16 v5, 0x190

    if-eq p1, v5, :cond_0

    const/16 v5, 0x1f5

    if-eq p1, v5, :cond_0

    const/16 v5, 0x1f6

    if-eq p1, v5, :cond_0

    const/16 v5, 0x258

    if-ne p1, v5, :cond_1

    .line 1361
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1364
    .local v0, b:Landroid/app/AlertDialog$Builder;
    const v4, 0x7f0d01dd

    .line 1365
    .local v4, titleId:I
    sparse-switch p1, :sswitch_data_0

    .line 1396
    const v3, 0x7f0d01e2

    .line 1399
    .local v3, msgId:I
    invoke-virtual {v0, v6, p0}, Landroid/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1403
    :goto_0
    invoke-virtual {p0, v4}, Lcom/mediatek/settings/VoiceMailSetting;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1404
    invoke-virtual {p0, v3}, Lcom/mediatek/settings/VoiceMailSetting;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1405
    .local v2, message:Ljava/lang/String;
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1406
    invoke-virtual {v0, v7}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1407
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 1410
    .local v1, dialog:Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Landroid/view/Window;->addFlags(I)V

    .line 1427
    .end local v0           #b:Landroid/app/AlertDialog$Builder;
    .end local v1           #dialog:Landroid/app/AlertDialog;
    .end local v2           #message:Ljava/lang/String;
    .end local v3           #msgId:I
    .end local v4           #titleId:I
    :goto_1
    return-object v1

    .line 1367
    .restart local v0       #b:Landroid/app/AlertDialog$Builder;
    .restart local v4       #titleId:I
    :sswitch_0
    const v3, 0x7f0d01ea

    .line 1368
    .restart local v3       #msgId:I
    const v4, 0x7f0d01b4

    .line 1370
    invoke-virtual {v0, v6, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1375
    .end local v3           #msgId:I
    :sswitch_1
    const v3, 0x7f0d01ee

    .line 1376
    .restart local v3       #msgId:I
    const v4, 0x7f0d01b4

    .line 1378
    invoke-virtual {v0, v6, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1381
    .end local v3           #msgId:I
    :sswitch_2
    const v3, 0x7f0d01eb

    .line 1383
    .restart local v3       #msgId:I
    invoke-virtual {v0, v6, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1386
    .end local v3           #msgId:I
    :sswitch_3
    const v3, 0x7f0d01ec

    .line 1388
    .restart local v3       #msgId:I
    invoke-virtual {v0, v6, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1391
    .end local v3           #msgId:I
    :sswitch_4
    const v3, 0x7f0d01ed

    .line 1392
    .restart local v3       #msgId:I
    const v5, 0x7f0d0313

    invoke-virtual {v0, v5, p0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1393
    const v5, 0x7f0d0314

    invoke-virtual {v0, v5, p0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    goto :goto_0

    .line 1413
    .end local v0           #b:Landroid/app/AlertDialog$Builder;
    .end local v3           #msgId:I
    .end local v4           #titleId:I
    :cond_1
    if-eq p1, v8, :cond_2

    const/16 v5, 0x25a

    if-eq p1, v5, :cond_2

    if-ne p1, v9, :cond_5

    .line 1415
    :cond_2
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 1416
    .local v1, dialog:Landroid/app/ProgressDialog;
    const v5, 0x7f0d01dc

    invoke-virtual {p0, v5}, Lcom/mediatek/settings/VoiceMailSetting;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 1417
    const/4 v5, 0x1

    invoke-virtual {v1, v5}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 1418
    invoke-virtual {v1, v7}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 1419
    if-ne p1, v8, :cond_3

    const v5, 0x7f0d01df

    :goto_2
    invoke-virtual {p0, v5}, Lcom/mediatek/settings/VoiceMailSetting;->getText(I)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_3
    if-ne p1, v9, :cond_4

    const v5, 0x7f0d01e0

    goto :goto_2

    :cond_4
    const v5, 0x7f0d01de

    goto :goto_2

    .line 1427
    .end local v1           #dialog:Landroid/app/ProgressDialog;
    :cond_5
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreateDialog(I)Landroid/app/Dialog;

    move-result-object v1

    goto :goto_1

    .line 1365
    nop

    :sswitch_data_0
    .sparse-switch
        0x190 -> :sswitch_1
        0x1f4 -> :sswitch_2
        0x1f5 -> :sswitch_3
        0x1f6 -> :sswitch_4
        0x258 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 1949
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 1950
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1951
    return-void
.end method

.method public onDialogClosed(Lcom/android/phone/EditPhoneNumberPreference;I)V
    .locals 3
    .parameter "preference"
    .parameter "buttonClicked"

    .prologue
    .line 469
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceClick: request preference click on dialog close: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 472
    const/4 v1, -0x2

    if-ne p2, v1, :cond_1

    .line 482
    :cond_0
    :goto_0
    return-void

    .line 475
    :cond_1
    instance-of v1, p1, Lcom/android/phone/EditPhoneNumberPreference;

    if-eqz v1, :cond_0

    .line 476
    move-object v0, p1

    .line 478
    .local v0, epn:Lcom/android/phone/EditPhoneNumberPreference;
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    if-ne v0, v1, :cond_0

    .line 479
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->handleVMBtnClickRequest()V

    goto :goto_0
.end method

.method public onGetDefaultNumber(Lcom/android/phone/EditPhoneNumberPreference;)Ljava/lang/String;
    .locals 4
    .parameter "preference"

    .prologue
    const/4 v2, 0x0

    .line 490
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    if-ne p1, v1, :cond_0

    .line 494
    const-string v1, "updating default for voicemail dialog"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 496
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    move-object v1, v2

    .line 518
    :goto_0
    return-object v1

    .line 501
    :cond_0
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 502
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v1, v3}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVoiceMailNumberGemini(I)Ljava/lang/String;

    move-result-object v0

    .line 507
    .local v0, vmDisplay:Ljava/lang/String;
    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    move-object v1, v2

    .line 510
    goto :goto_0

    .line 504
    .end local v0           #vmDisplay:Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getVoiceMailNumber()Ljava/lang/String;

    move-result-object v0

    .restart local v0       #vmDisplay:Ljava/lang/String;
    goto :goto_1

    .line 515
    :cond_2
    const-string v1, "updating default for call forwarding dialogs"

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 517
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ongetDefaultnumber, vmDisplay:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 518
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const v2, 0x7f0d01b5

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 4
    .parameter "intent"

    .prologue
    const/4 v3, -0x1

    .line 1594
    const-string v1, "simId"

    invoke-virtual {p1, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 1595
    .local v0, newSlotId:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNewIntent newSlotId, oldSlotID "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1596
    iget v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    if-eq v0, v1, :cond_0

    .line 1597
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->startActivity(Landroid/content/Intent;)V

    .line 1598
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    .line 1629
    :goto_0
    return-void

    .line 1602
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mediatek/settings/VoiceMailSetting;->setIntent(Landroid/content/Intent;)V

    .line 1603
    iput v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    .line 1604
    iget v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    if-eq v1, v3, :cond_1

    .line 1605
    const-string v1, "sub_title_name"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    .line 1606
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 1607
    iget v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-static {p0, v1}, Landroid/provider/Telephony$SIMInfo;->getSIMInfoBySlot(Landroid/content/Context;I)Landroid/provider/Telephony$SIMInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/provider/Telephony$SIMInfo;->mDisplayName:Ljava/lang/String;

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    .line 1611
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 1612
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mInitTitle:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->setTitle(Ljava/lang/CharSequence;)V

    .line 1615
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    if-eqz v1, :cond_3

    .line 1616
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2, p0}, Lcom/android/phone/EditPhoneNumberPreference;->setParentActivity(Landroid/app/Activity;ILcom/android/phone/EditPhoneNumberPreference$GetDefaultNumberListener;)V

    .line 1617
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    invoke-virtual {v1, p0}, Lcom/android/phone/EditPhoneNumberPreference;->setDialogOnClosedListener(Lcom/android/phone/EditPhoneNumberPreference$OnDialogClosedListener;)V

    .line 1618
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSubMenuVoicemailSettings:Lcom/android/phone/EditPhoneNumberPreference;

    const v2, 0x7f0d02b9

    invoke-virtual {v1, v2}, Lcom/android/phone/EditPhoneNumberPreference;->setDialogTitle(I)V

    .line 1620
    :cond_3
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-eqz v1, :cond_5

    .line 1621
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 1622
    const-string v1, "button_voicemail_setting_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceScreen;

    iput-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    .line 1623
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1624
    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "button_voicemail_provider_key"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setKey(Ljava/lang/String;)V

    .line 1626
    :cond_4
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->initVoiceMailProviders()V

    .line 1628
    :cond_5
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 1633
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 1634
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 1641
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 1636
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->finish()V

    .line 1637
    const/4 v1, 0x1

    goto :goto_0

    .line 1634
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 373
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onPause()V

    .line 374
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForeground:Z

    .line 375
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 8
    .parameter "preference"
    .parameter "objValue"

    .prologue
    const/4 v7, 0x1

    .line 411
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    if-ne p1, v5, :cond_0

    .line 412
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getCurrentVoicemailProviderKey()Ljava/lang/String;

    move-result-object v0

    .line 413
    .local v0, currentProviderKey:Ljava/lang/String;
    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    move-object v2, p2

    .line 414
    check-cast v2, Ljava/lang/String;

    .line 416
    .local v2, newProviderKey:Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "VM provider changes to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " from "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 419
    iget-object v5, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 421
    const-string v5, "No change "

    invoke-static {v5}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 463
    .end local v0           #currentProviderKey:Ljava/lang/String;
    .end local v2           #newProviderKey:Ljava/lang/String;
    :cond_0
    :goto_0
    return v7

    .line 427
    .restart local v0       #currentProviderKey:Ljava/lang/String;
    .restart local v2       #newProviderKey:Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 428
    invoke-virtual {p0}, Lcom/mediatek/settings/VoiceMailSetting;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 429
    .local v4, sp:Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 430
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "button_voicemail_provider_key"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 431
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 434
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v4           #sp:Landroid/content/SharedPreferences;
    :cond_2
    invoke-direct {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->updateVMPreferenceWidgets(Ljava/lang/String;)V

    .line 436
    iput-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    .line 438
    invoke-direct {p0, v2}, Lcom/mediatek/settings/VoiceMailSetting;->loadSettingsForVoiceMailProvider(Ljava/lang/String;)Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;

    move-result-object v3

    .line 447
    .local v3, newProviderSettings:Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;
    if-nez v3, :cond_3

    .line 450
    const-string v5, "Saved preferences not found - invoking config"

    invoke-static {v5}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 452
    iput-boolean v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMProviderSettingsForced:Z

    goto :goto_0

    .line 455
    :cond_3
    const-string v5, "Saved preferences found - switching to them"

    invoke-static {v5}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 458
    iput-boolean v7, p0, Lcom/mediatek/settings/VoiceMailSetting;->mChangingVMorFwdDueToProviderChange:Z

    .line 459
    invoke-direct {p0, v2, v3}, Lcom/mediatek/settings/VoiceMailSetting;->saveVoiceMailAndForwardingNumber(Ljava/lang/String;Lcom/mediatek/settings/VoiceMailSetting$VoiceMailProviderSettings;)V

    goto :goto_0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 392
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailSettings:Landroid/preference/PreferenceScreen;

    if-ne p2, v0, :cond_0

    invoke-virtual {p2}, Landroid/preference/Preference;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 394
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invoking cfg intent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/preference/Preference;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 396
    invoke-virtual {p2}, Landroid/preference/Preference;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/settings/VoiceMailSetting;->startActivityForResult(Landroid/content/Intent;I)V

    .line 397
    const/4 v0, 0x1

    .line 399
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onPrepareDialog(ILandroid/app/Dialog;)V
    .locals 0
    .parameter "id"
    .parameter "dialog"

    .prologue
    .line 1350
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPrepareDialog(ILandroid/app/Dialog;)V

    .line 1351
    iput p1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mCurrentDialogId:I

    .line 1352
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 1646
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 1648
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    .line 1649
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mForeground:Z

    .line 1650
    return-void
.end method

.method onRevertDone()V
    .locals 2

    .prologue
    .line 624
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Flipping provider key back to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 626
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVoicemailProviders:Landroid/preference/ListPreference;

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 627
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPreviousVMProviderKey:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVMPreferenceWidgets(Ljava/lang/String;)V

    .line 628
    invoke-direct {p0}, Lcom/mediatek/settings/VoiceMailSetting;->updateVoiceNumberField()V

    .line 629
    iget v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    if-eqz v0, :cond_0

    .line 630
    iget v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    invoke-direct {p0, v0}, Lcom/mediatek/settings/VoiceMailSetting;->showVMDialog(I)V

    .line 631
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mVMOrFwdSetError:I

    .line 633
    :cond_0
    return-void
.end method

.method setVMNumberWithCarrier()V
    .locals 5

    .prologue
    const/16 v4, 0x1f4

    .line 1067
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "save voicemail #: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 1070
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1071
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    check-cast v1, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iget v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getVoiceMailAlphaTagGemini(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSetOptionComplete:Landroid/os/Handler;

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    iget v4, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSimId:I

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/gemini/GeminiPhone;->setVoiceMailNumberGemini(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;I)V

    .line 1081
    :goto_0
    return-void

    .line 1076
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    iget-object v1, p0, Lcom/mediatek/settings/VoiceMailSetting;->mPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getVoiceMailAlphaTag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/VoiceMailSetting;->mNewVMNumber:Ljava/lang/String;

    iget-object v3, p0, Lcom/mediatek/settings/VoiceMailSetting;->mSetOptionComplete:Landroid/os/Handler;

    invoke-static {v3, v4}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/Phone;->setVoiceMailNumber(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1
    .parameter "intent"
    .parameter "requestCode"

    .prologue
    .line 525
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 527
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 535
    :goto_0
    return-void

    .line 532
    :cond_0
    const-string v0, "startSubActivity: starting requested subactivity"

    invoke-static {v0}, Lcom/mediatek/settings/VoiceMailSetting;->log(Ljava/lang/String;)V

    .line 534
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method
