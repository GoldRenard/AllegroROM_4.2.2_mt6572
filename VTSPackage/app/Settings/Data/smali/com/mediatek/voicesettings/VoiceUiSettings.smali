.class public Lcom/mediatek/voicesettings/VoiceUiSettings;
.super Lcom/android/settings/SettingsPreferenceFragment;
.source "VoiceUiSettings.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;
    }
.end annotation


# static fields
.field private static final KEY_VOICE_UI_ALARM:Ljava/lang/String; = "alarm_pref"

.field private static final KEY_VOICE_UI_CAMERA:Ljava/lang/String; = "camera_pref"

.field private static final KEY_VOICE_UI_FOR_APP_CATEGORY:Ljava/lang/String; = "voice_ui_app"

.field private static final KEY_VOICE_UI_INCOMMING_CALL:Ljava/lang/String; = "incomming_all_pref"

.field private static final KEY_VOICE_UI_LANGUAGE:Ljava/lang/String; = "language_settings"

.field private static final KEY_VOICE_UI_MUSIC:Ljava/lang/String; = "music_pref"

.field private static final SUCCESS_RESULT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "VoiceUiSettings"

.field private static final VOICE_CONTROL_DEFAULT_LANGUAGE:Ljava/lang/String; = "voice_control_default_language"

.field private static final VOICE_CONTROL_ENABLED:Ljava/lang/String; = "voice_control_enabled"

.field private static final VOICE_UI_SUPPORT_LANGUAGES:Ljava/lang/String; = "voice_ui_support_languages"


# instance fields
.field private mChoosedLanguage:I

.field private mDefaultLangIndex:I

.field private mEnabledSwitch:Landroid/widget/Switch;

.field private mLanguagePref:Landroid/preference/Preference;

.field private mLocale:Ljava/util/Locale;

.field private mLocaleCode:Ljava/lang/String;

.field private mRawData:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSupportLangs:[Ljava/lang/String;

.field private mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

.field private mVoiceControlEnable:Z

.field private mVoiceKeyWordInfos:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mVoiceListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

.field private mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

.field private mVoiceUiAppStatus:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 67
    invoke-direct {p0}, Lcom/android/settings/SettingsPreferenceFragment;-><init>()V

    .line 81
    iput-boolean v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 86
    iput v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    .line 87
    iput v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    .line 96
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;

    .line 98
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    .line 104
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/voicesettings/VoiceUiSettings;ILandroid/os/Bundle;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lcom/mediatek/voicesettings/VoiceUiSettings;->handleVoiceUiApps(ILandroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mediatek/voicesettings/VoiceUiSettings;ILandroid/os/Bundle;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 67
    invoke-direct {p0, p1, p2}, Lcom/mediatek/voicesettings/VoiceUiSettings;->handleSupportLanguageList(ILandroid/os/Bundle;)V

    return-void
.end method

.method static synthetic access$200(Lcom/mediatek/voicesettings/VoiceUiSettings;)[Ljava/lang/String;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mediatek/voicesettings/VoiceUiSettings;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/voicesettings/VoiceUiSettings;)Landroid/preference/Preference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;

    return-object v0
.end method

.method static synthetic access$500(Lcom/mediatek/voicesettings/VoiceUiSettings;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceKeyWordInfos:Ljava/util/HashMap;

    return-object v0
.end method

.method private changeSupportLanguage(I)V
    .locals 6
    .parameter "langIndex"

    .prologue
    .line 608
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v2, :cond_0

    .line 609
    const-string v2, "VoiceUiSettings"

    const-string v3, "send change support language command"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 611
    .local v0, data:Landroid/os/Bundle;
    const-string v2, "Send_Info"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 613
    :try_start_0
    const-string v2, "VoiceUiSettings"

    const-string v3, "send command mainAction = 5 subAction = 4"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 616
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x5

    const/4 v5, 0x4

    invoke-interface {v2, v3, v4, v5, v0}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V

    .line 620
    const/4 v2, 0x5

    invoke-direct {p0, v2}, Lcom/mediatek/voicesettings/VoiceUiSettings;->sendCommand(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 629
    .end local v0           #data:Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 621
    .restart local v0       #data:Landroid/os/Bundle;
    :catch_0
    move-exception v1

    .line 622
    .local v1, e:Landroid/os/RemoteException;
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Remote exception error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 623
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 624
    .end local v1           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 625
    .local v1, e:Ljava/lang/IllegalAccessException;
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IllegalAccessException exception error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0
.end method

.method private createPreferenceHierarchy(Ljava/util/HashMap;)V
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, appStatus:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v5, 0x1

    .line 222
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 223
    .local v2, key:Ljava/lang/String;
    new-instance v0, Landroid/preference/CheckBoxPreference;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    .line 224
    .local v0, appPref:Landroid/preference/CheckBoxPreference;
    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 226
    .local v3, value:I
    invoke-direct {p0, v2}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getProcessTitleResourceId(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    .line 227
    if-ne v3, v5, :cond_1

    move v4, v5

    :goto_1
    invoke-virtual {v0, v4}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 228
    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 229
    iget-object v4, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v4, v0}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 227
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 232
    .end local v0           #appPref:Landroid/preference/CheckBoxPreference;
    .end local v2           #key:Ljava/lang/String;
    .end local v3           #value:I
    :cond_2
    return-void
.end method

.method private getProcessTitleResourceId(Ljava/lang/String;)I
    .locals 3
    .parameter "processName"

    .prologue
    .line 701
    const-string v0, "com.android.deskclock"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 702
    const v0, 0x7f0b01b4

    .line 711
    :goto_0
    return v0

    .line 703
    :cond_0
    const-string v0, "com.android.phone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 704
    const v0, 0x7f0b01b3

    goto :goto_0

    .line 705
    :cond_1
    const-string v0, "com.android.music"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 706
    const v0, 0x7f0b01b6

    goto :goto_0

    .line 707
    :cond_2
    const-string v0, "com.android.gallery3d"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 708
    const v0, 0x7f0b01b5

    goto :goto_0

    .line 710
    :cond_3
    const-string v0, "VoiceUiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "voice ui not support "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getSummaryResourceId(Ljava/lang/String;)I
    .locals 3
    .parameter "process"

    .prologue
    .line 368
    const-string v0, "com.android.deskclock"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 369
    const v0, 0x7f0b01b8

    .line 378
    :goto_0
    return v0

    .line 370
    :cond_0
    const-string v0, "com.android.phone"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 371
    const v0, 0x7f0b01b7

    goto :goto_0

    .line 372
    :cond_1
    const-string v0, "com.android.music"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 373
    const v0, 0x7f0b01ba

    goto :goto_0

    .line 374
    :cond_2
    const-string v0, "com.android.gallery3d"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 375
    const v0, 0x7f0b01b9

    goto :goto_0

    .line 377
    :cond_3
    const-string v0, "VoiceUiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "voice ui not support "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private handleSupportLanguageList(ILandroid/os/Bundle;)V
    .locals 5
    .parameter "result"
    .parameter "data"

    .prologue
    .line 562
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleSupportLanguageList result="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    if-eqz p2, :cond_0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 564
    const-string v1, "Result_Info"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    .line 565
    const-string v1, "Reslut_INfo1"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    .line 566
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleSupportLanguageList Default language is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v4, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 567
    iget v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    iput v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    .line 568
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    aget-object v0, v1, v2

    .line 569
    .local v0, language:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 571
    .end local v0           #language:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private handleVoiceUiApps(ILandroid/os/Bundle;)V
    .locals 13
    .parameter "result"
    .parameter "data"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 485
    const-string v8, "VoiceUiSettings"

    const-string v9, "handleVoiceUiApps"

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    if-eq p1, v12, :cond_0

    .line 487
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "handleVoiceUiApps error = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 543
    :goto_0
    return-void

    .line 491
    :cond_0
    const-string v8, "Result_Info"

    invoke-virtual {p2, v8}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 492
    .local v6, voiceUiApps:[Ljava/lang/String;
    const-string v8, "Reslut_INfo1"

    invoke-virtual {p2, v8}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    move-result-object v7

    .line 493
    .local v7, voiceUiValues:[I
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "get process data from framework: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v6}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 494
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "get values data from framework: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v7}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v8, v6

    if-ge v1, v8, :cond_3

    .line 497
    aget-object v4, v6, v1

    .line 498
    .local v4, processName:Ljava/lang/String;
    aget v5, v7, v1

    .line 499
    .local v5, value:I
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_1
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 500
    .local v0, availabe:Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 501
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 496
    .end local v0           #availabe:Ljava/lang/String;
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 505
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #processName:Ljava/lang/String;
    .end local v5           #value:I
    :cond_3
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    new-array v9, v11, [Ljava/lang/String;

    invoke-interface {v8, v9}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-direct {p0, v6, v7, v8}, Lcom/mediatek/voicesettings/VoiceUiSettings;->isAllDisabled([Ljava/lang/String;[I[Ljava/lang/String;)Z

    move-result v3

    .line 507
    .local v3, isAllProcessesOff:Z
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "isAllProcessesOff="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " mVoiceControlEnable="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 509
    if-eqz v3, :cond_6

    .line 510
    iget-boolean v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    if-eqz v8, :cond_5

    .line 511
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2       #i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 512
    .restart local v0       #availabe:Ljava/lang/String;
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v0, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 514
    .end local v0           #availabe:Ljava/lang/String;
    :cond_4
    iput-boolean v11, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 515
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "voice_control_enabled"

    invoke-static {v8, v9, v11}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 535
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_5
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mVoiceUiAppStatus hash map: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v10}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 537
    const-string v8, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "mVoiceControlEnable = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    iget-boolean v9, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v8, v9}, Landroid/widget/Switch;->setChecked(Z)V

    .line 539
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    iget-boolean v9, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v8, v9}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    .line 542
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-direct {p0, v8}, Lcom/mediatek/voicesettings/VoiceUiSettings;->updateVoiceUiAppPrefs(Ljava/util/HashMap;)V

    goto/16 :goto_0

    .line 519
    :cond_6
    iput-boolean v12, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 520
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "voice_control_enabled"

    invoke-static {v8, v9, v12}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 524
    const/4 v1, 0x0

    :goto_4
    array-length v8, v6

    if-ge v1, v8, :cond_5

    .line 525
    aget-object v4, v6, v1

    .line 526
    .restart local v4       #processName:Ljava/lang/String;
    aget v5, v7, v1

    .line 527
    .restart local v5       #value:I
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_7
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 528
    .restart local v0       #availabe:Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    .line 529
    iget-object v8, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v8, v4, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 524
    .end local v0           #availabe:Ljava/lang/String;
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method private isAllDisabled(Ljava/util/HashMap;)Z
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 652
    .local p1, appsStatus:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v0, 0x1

    .line 653
    .local v0, allAppsDisabled:Z
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 654
    .local v2, status:Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 655
    const/4 v0, 0x0

    .line 659
    .end local v2           #status:Ljava/lang/Integer;
    :cond_1
    const-string v3, "VoiceUiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "all app disabled is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 660
    return v0
.end method

.method private isAllDisabled([Ljava/lang/String;[I[Ljava/lang/String;)Z
    .locals 12
    .parameter "allProcessNames"
    .parameter "values"
    .parameter "availabedProcessNames"

    .prologue
    .line 671
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 672
    .local v7, processStatus:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const-string v9, "VoiceUiSettings"

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 673
    const-string v9, "VoiceUiSettings"

    invoke-static {p2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 674
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v9, p1

    if-ge v2, v9, :cond_2

    .line 675
    aget-object v6, p1, v2

    .line 676
    .local v6, processName:Ljava/lang/String;
    aget v8, p2, v2

    .line 677
    .local v8, value:I
    move-object v0, p3

    .local v0, arr$:[Ljava/lang/String;
    array-length v5, v0

    .local v5, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_1
    if-ge v3, v5, :cond_1

    aget-object v1, v0, v3

    .line 678
    .local v1, availabe:Ljava/lang/String;
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 679
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v7, v6, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 674
    .end local v1           #availabe:Ljava/lang/String;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 683
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v3           #i$:I
    .end local v5           #len$:I
    .end local v6           #processName:Ljava/lang/String;
    .end local v8           #value:I
    :cond_2
    const-string v9, "VoiceUiSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "judge is All Disabled "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 687
    .local v4, key:Ljava/lang/String;
    invoke-virtual {v7, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_3

    .line 688
    const-string v9, "VoiceUiSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "on"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 689
    const/4 v9, 0x0

    .line 692
    .end local v4           #key:Ljava/lang/String;
    :goto_2
    return v9

    :cond_4
    const/4 v9, 0x1

    goto :goto_2
.end method

.method private sendCommand(I)V
    .locals 5
    .parameter "cmdCode"

    .prologue
    .line 632
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v1, :cond_0

    .line 634
    :try_start_0
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "send command mainAction = 5 subAction = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, p1, v4}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 648
    :cond_0
    :goto_0
    return-void

    .line 640
    :catch_0
    move-exception v0

    .line 641
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Remote exception error"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 643
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 644
    .local v0, e:Ljava/lang/IllegalAccessException;
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IllegalAccessException exception error"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0
.end method

.method private setApps([Ljava/lang/String;[I)V
    .locals 6
    .parameter "processNames"
    .parameter "values"

    .prologue
    .line 580
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "send command: set apps names "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "send command: set apps values "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {p2}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 582
    array-length v2, p1

    array-length v3, p2

    if-eq v2, v3, :cond_1

    .line 605
    :cond_0
    :goto_0
    return-void

    .line 586
    :cond_1
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v2, :cond_0

    .line 587
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 588
    .local v0, data:Landroid/os/Bundle;
    const-string v2, "Send_Info"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 589
    const-string v2, "Send_Info1"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putIntArray(Ljava/lang/String;[I)V

    .line 591
    :try_start_0
    const-string v2, "VoiceUiSettings"

    const-string v3, "send command mainAction = 5 subAction = 2"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 594
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x5

    const/4 v5, 0x2

    invoke-interface {v2, v3, v4, v5, v0}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 597
    :catch_0
    move-exception v1

    .line 598
    .local v1, e:Landroid/os/RemoteException;
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Remote exception error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 600
    .end local v1           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v1

    .line 601
    .local v1, e:Ljava/lang/IllegalAccessException;
    const-string v2, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IllegalAccessException exception error"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 602
    invoke-virtual {v1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0
.end method

.method private updateVoiceUiAppPrefs(Ljava/util/HashMap;)V
    .locals 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, voiceUiAppStatus:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Integer;>;"
    const/4 v6, 0x1

    .line 546
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 547
    .local v4, processName:Ljava/lang/String;
    invoke-virtual {p1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v5, v6, :cond_1

    move v0, v6

    .line 548
    .local v0, enabled:Z
    :goto_1
    invoke-virtual {p0, v4}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getPreferenceFromProcessName(Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v2

    .line 549
    .local v2, pref:Landroid/preference/Preference;
    if-eqz v2, :cond_0

    instance-of v5, v2, Landroid/preference/CheckBoxPreference;

    if-eqz v5, :cond_0

    move-object v3, v2

    .line 550
    check-cast v3, Landroid/preference/CheckBoxPreference;

    .line 551
    .local v3, processCheckBoxPref:Landroid/preference/CheckBoxPreference;
    invoke-virtual {v3, v0}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 547
    .end local v0           #enabled:Z
    .end local v2           #pref:Landroid/preference/Preference;
    .end local v3           #processCheckBoxPref:Landroid/preference/CheckBoxPreference;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .line 554
    .end local v4           #processName:Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public getPreferenceFromProcessName(Ljava/lang/String;)Landroid/preference/Preference;
    .locals 2
    .parameter "processName"

    .prologue
    .line 320
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    if-eqz v0, :cond_0

    .line 321
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceCategory;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 324
    :goto_0
    return-object v0

    .line 323
    :cond_0
    const-string v0, "VoiceUiSettings"

    const-string v1, "app checkbox list category is null"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 191
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 193
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 194
    .local v0, activity:Landroid/app/Activity;
    new-instance v2, Landroid/widget/Switch;

    invoke-direct {v2, v0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    .line 196
    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 197
    .local v1, padding:I
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, v4, v4, v1, v4}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 198
    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v2, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 199
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 470
    const-string v2, "VoiceUiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "-->>result "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " data is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    if-nez p3, :cond_1

    const-string v1, "null"

    :goto_0
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 473
    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    if-nez p3, :cond_2

    .line 482
    :cond_0
    :goto_1
    return-void

    .line 470
    :cond_1
    const-string v1, "not null"

    goto :goto_0

    .line 478
    :cond_2
    const-string v1, "voice_control_default_language"

    const/4 v2, 0x0

    invoke-virtual {p3, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    iput v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    .line 479
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    aget-object v0, v1, v2

    .line 480
    .local v0, language:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 481
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Select Voice language "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 11
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 384
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "voice_control_enabled"

    if-eqz p2, :cond_1

    move v6, v7

    :goto_0
    invoke-static {v9, v10, v6}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 386
    iput-boolean p2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 388
    const-string v9, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "on checked change switch is "

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-eqz p2, :cond_2

    const-string v6, "checked"

    :goto_1
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    invoke-virtual {v6, p2}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    .line 390
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 391
    const-string v6, "VoiceUiSettings"

    const-string v7, "mVoiceUiAppStatus not initialized"

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 425
    :cond_0
    :goto_2
    return-void

    :cond_1
    move v6, v8

    .line 384
    goto :goto_0

    .line 388
    :cond_2
    const-string v6, "unchecked"

    goto :goto_1

    .line 394
    :cond_3
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-direct {p0, v6}, Lcom/mediatek/voicesettings/VoiceUiSettings;->isAllDisabled(Ljava/util/HashMap;)Z

    move-result v2

    .line 395
    .local v2, isAllOff:Z
    if-nez p2, :cond_5

    move v6, v7

    :goto_3
    if-eq v2, v6, :cond_0

    .line 402
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v6}, Landroid/widget/Switch;->isChecked()Z

    move-result v6

    if-nez v6, :cond_6

    .line 403
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 404
    .local v3, key:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_4

    .line 405
    const-string v6, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "disable process : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 406
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .end local v1           #i$:Ljava/util/Iterator;
    .end local v3           #key:Ljava/lang/String;
    :cond_5
    move v6, v8

    .line 395
    goto :goto_3

    .line 410
    :cond_6
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1       #i$:Ljava/util/Iterator;
    :cond_7
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 411
    .restart local v3       #key:Ljava/lang/String;
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-ne v6, v7, :cond_7

    .line 412
    const-string v6, "VoiceUiSettings"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "enable process : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 413
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v3, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    .line 418
    .end local v3           #key:Ljava/lang/String;
    :cond_8
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    new-array v7, v8, [Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    .line 419
    .local v4, procs:[Ljava/lang/String;
    array-length v6, v4

    new-array v5, v6, [I

    .line 420
    .local v5, values:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_6
    array-length v6, v4

    if-ge v0, v6, :cond_9

    .line 421
    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    aget-object v7, v4, v0

    invoke-virtual {v6, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v5, v0

    .line 420
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 423
    :cond_9
    invoke-direct {p0, v4, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->setApps([Ljava/lang/String;[I)V

    .line 424
    const-string v7, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "update these values "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    invoke-virtual {v6}, Landroid/widget/Switch;->isChecked()Z

    move-result v6

    if-eqz v6, :cond_a

    const-string v6, "on "

    :goto_7
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v4}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_a
    const-string v6, "off "

    goto :goto_7
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 151
    invoke-super {p0, p1}, Lcom/android/settings/SettingsPreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 153
    const v5, 0x7f050046

    invoke-virtual {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->addPreferencesFromResource(I)V

    .line 155
    const-string v5, "voice_ui_app"

    invoke-virtual {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    check-cast v5, Landroid/preference/PreferenceCategory;

    iput-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    .line 156
    const-string v5, "language_settings"

    invoke-virtual {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    iput-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;

    .line 158
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 159
    .local v0, activity:Landroid/app/Activity;
    const-string v5, "tablet"

    const-string v6, "ro.build.characteristics"

    invoke-static {v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x1110007

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    if-nez v5, :cond_1

    .line 162
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v5

    const v6, 0x7f0b01af

    invoke-virtual {v5, v6}, Landroid/app/ActionBar;->setTitle(I)V

    .line 165
    :cond_1
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    const-string v6, "com.android.phone"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    const-string v6, "com.android.deskclock"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    const-string v6, "com.android.gallery3d"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    const-string v6, "com.android.music"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const-string v6, "voice_ui_settings"

    invoke-virtual {v5, v6, v9}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 171
    .local v3, processSharedPres:Landroid/content/SharedPreferences;
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 172
    .local v2, key:Ljava/lang/String;
    invoke-interface {v3, v2, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 173
    .local v4, state:I
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 175
    .end local v2           #key:Ljava/lang/String;
    .end local v4           #state:I
    :cond_2
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "read from shared preference "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-direct {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->createPreferenceHierarchy(Ljava/util/HashMap;)V

    .line 181
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "voice_control_default_language"

    invoke-static {v5, v6, v9}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    .line 182
    iget v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    iput v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    .line 183
    const-string v5, "voicecommand"

    invoke-virtual {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    iput-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    .line 184
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v5, :cond_3

    .line 185
    new-instance v5, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v5, p0, v6}, Lcom/mediatek/voicesettings/VoiceUiSettings$VoiceCommandCallback;-><init>(Lcom/mediatek/voicesettings/VoiceUiSettings;Landroid/content/Context;)V

    iput-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    .line 187
    :cond_3
    return-void
.end method

.method public onPause()V
    .locals 8

    .prologue
    .line 286
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onPause()V

    .line 287
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "--->> on Pause mVoiceControlEnable = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "--->> mVoiceUiAppStatus "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "--->> mRawData "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v5, :cond_0

    .line 293
    :try_start_0
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    iget-object v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    invoke-interface {v5, v6}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->unRegisterListener(Lcom/mediatek/common/voicecommand/VoiceCommandListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 303
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const-string v6, "voice_ui_settings"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 304
    .local v4, processSharedPres:Landroid/content/SharedPreferences;
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 305
    .local v1, editor:Landroid/content/SharedPreferences$Editor;
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 306
    .local v3, key:Ljava/lang/String;
    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v5, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 307
    const-string v5, "VoiceUiSettings"

    const-string v6, "save state now"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 294
    .end local v1           #editor:Landroid/content/SharedPreferences$Editor;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #key:Ljava/lang/String;
    .end local v4           #processSharedPres:Landroid/content/SharedPreferences;
    :catch_0
    move-exception v0

    .line 295
    .local v0, e:Landroid/os/RemoteException;
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Remote exception error"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .line 297
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 298
    .local v0, e:Ljava/lang/IllegalAccessException;
    const-string v5, "VoiceUiSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "IllegalAccessException exception error"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_0

    .line 310
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    .restart local v1       #editor:Landroid/content/SharedPreferences$Editor;
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v4       #processSharedPres:Landroid/content/SharedPreferences;
    :cond_1
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 311
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 8
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 429
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 430
    :cond_0
    const-string v0, "VoiceUiSettings"

    const-string v2, "Voice UI data got from framework is null"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v3, v1

    .line 465
    :goto_0
    return v3

    .line 433
    :cond_1
    const-string v0, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " onPreferenceTreeClick "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    const-string v0, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " onPreferenceTreeClick "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    const-string v0, "language_settings"

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 437
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 438
    .local v4, data:Landroid/os/Bundle;
    const-string v0, "voice_ui_support_languages"

    iget-object v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 439
    const-string v0, "voice_control_default_language"

    iget v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    invoke-virtual {v4, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 440
    const-class v0, Lcom/mediatek/voicesettings/VoiceUiAvailableLanguageFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    const v5, 0x7f0b01b2

    move-object v0, p0

    move-object v1, p0

    invoke-virtual/range {v0 .. v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ILandroid/os/Bundle;I)Z

    goto :goto_0

    .line 443
    .end local v4           #data:Landroid/os/Bundle;
    :cond_2
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 444
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    .local v6, processName:Ljava/lang/String;
    move-object v0, p2

    .line 445
    check-cast v0, Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_4

    move v7, v3

    .line 446
    .local v7, value:I
    :goto_1
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppStatus:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    new-array v0, v3, [Ljava/lang/String;

    aput-object v6, v0, v1

    new-array v2, v3, [I

    aput v7, v2, v1

    invoke-direct {p0, v0, v2}, Lcom/mediatek/voicesettings/VoiceUiSettings;->setApps([Ljava/lang/String;[I)V

    .line 449
    const-string v0, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "changed app name = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " value = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mRawData:Ljava/util/HashMap;

    invoke-direct {p0, v0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->isAllDisabled(Ljava/util/HashMap;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 453
    const-string v0, "VoiceUiSettings"

    const-string v2, " set switch to off, disable app preferences"

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v2, "voice_control_enabled"

    invoke-static {v0, v2, v1}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 456
    iput-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 457
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    iget-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 458
    iget-object v0, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceUiAppCategory:Landroid/preference/PreferenceCategory;

    iget-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceCategory;->setEnabled(Z)V

    .line 465
    .end local v6           #processName:Ljava/lang/String;
    .end local v7           #value:I
    :cond_3
    :goto_2
    invoke-super {p0, p1, p2}, Lcom/android/settings/SettingsPreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v3

    goto/16 :goto_0

    .restart local v6       #processName:Ljava/lang/String;
    :cond_4
    move v7, v1

    .line 445
    goto :goto_1

    .line 462
    .end local v6           #processName:Ljava/lang/String;
    :cond_5
    const-string v0, "VoiceUiSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceClick not support click this preference "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method

.method public onResume()V
    .locals 8

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 236
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onResume()V

    .line 237
    const-string v3, "VoiceUiSettings"

    const-string v4, "--->> onResume"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    if-eqz v3, :cond_0

    .line 240
    :try_start_0
    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    iget-object v4, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceListener:Lcom/mediatek/common/voicecommand/VoiceCommandListener;

    invoke-interface {v3, v4}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->registerListener(Lcom/mediatek/common/voicecommand/VoiceCommandListener;)V

    .line 242
    const-string v3, "VoiceUiSettings"

    const-string v4, "send command mainAction = 5 subAction = 1"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceCmdMgr:Lcom/mediatek/common/voicecommand/IVoiceCommandManager;

    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const/4 v5, 0x5

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-interface {v3, v4, v5, v6, v7}, Lcom/mediatek/common/voicecommand/IVoiceCommandManager;->sendCommand(Landroid/content/Context;IILandroid/os/Bundle;)V

    .line 248
    const-string v4, "VoiceUiSettings"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Support language is "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    if-nez v3, :cond_2

    const-string v3, "null"

    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    if-nez v3, :cond_0

    .line 252
    const/4 v3, 0x3

    invoke-direct {p0, v3}, Lcom/mediatek/voicesettings/VoiceUiSettings;->sendCommand(I)V

    .line 255
    const/4 v3, 0x5

    invoke-direct {p0, v3}, Lcom/mediatek/voicesettings/VoiceUiSettings;->sendCommand(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 267
    :cond_0
    :goto_1
    iget v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    iget v4, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    array-length v3, v3

    if-lez v3, :cond_1

    .line 268
    const-string v3, "VoiceUiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Default language is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    const-string v3, "VoiceUiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Use choose language is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v6, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    aget-object v5, v5, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    const-string v3, "VoiceUiSettings"

    const-string v4, "in onResume change support language and update keywords summary"

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "voice_control_default_language"

    iget v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 272
    iget v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    invoke-direct {p0, v3}, Lcom/mediatek/voicesettings/VoiceUiSettings;->changeSupportLanguage(I)V

    .line 273
    iget v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mChoosedLanguage:I

    iput v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    .line 274
    iget-object v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mLanguagePref:Landroid/preference/Preference;

    iget-object v4, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mSupportLangs:[Ljava/lang/String;

    iget v5, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mDefaultLangIndex:I

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 277
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "voice_control_enabled"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_3

    :goto_2
    iput-boolean v1, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    .line 278
    const-string v1, "VoiceUiSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "--->> mVoiceControlEnable = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mVoiceControlEnable:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    return-void

    .line 248
    :cond_2
    :try_start_1
    const-string v3, "not null"
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_0

    .line 257
    :catch_0
    move-exception v0

    .line 258
    .local v0, e:Landroid/os/RemoteException;
    const-string v3, "VoiceUiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Remote exception error"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Landroid/os/RemoteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto/16 :goto_1

    .line 260
    .end local v0           #e:Landroid/os/RemoteException;
    :catch_1
    move-exception v0

    .line 261
    .local v0, e:Ljava/lang/IllegalAccessException;
    const-string v3, "VoiceUiSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IllegalAccessException exception error"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto/16 :goto_1

    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :cond_3
    move v1, v2

    .line 277
    goto :goto_2
.end method

.method public onStart()V
    .locals 6

    .prologue
    const/16 v2, 0x10

    const/4 v5, -0x2

    .line 203
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onStart()V

    .line 205
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 206
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    invoke-virtual {v1, v2, v2}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 207
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/voicesettings/VoiceUiSettings;->mEnabledSwitch:Landroid/widget/Switch;

    new-instance v3, Landroid/app/ActionBar$LayoutParams;

    const/16 v4, 0x15

    invoke-direct {v3, v5, v5, v4}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v2, v3}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    .line 211
    return-void
.end method

.method public onStop()V
    .locals 4

    .prologue
    .line 215
    invoke-super {p0}, Lcom/android/settings/SettingsPreferenceFragment;->onStop()V

    .line 216
    invoke-virtual {p0}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 217
    .local v0, activity:Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-virtual {v1, v2, v3}, Landroid/app/ActionBar;->setDisplayOptions(II)V

    .line 218
    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ActionBar;->setCustomView(Landroid/view/View;)V

    .line 219
    return-void
.end method

.method public updateKeywordsSummary(Ljava/util/HashMap;)V
    .locals 13
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, voiceKeyWordInfos:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    const/4 v12, 0x1

    .line 333
    const-string v9, "VoiceUiSettings"

    const-string v10, "update keywords summary"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 334
    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 335
    const-string v9, "VoiceUiSettings"

    const-string v10, "keywords is empty"

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    :cond_0
    return-void

    .line 338
    :cond_1
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 339
    .local v5, processName:Ljava/lang/String;
    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 340
    .local v0, commands:[Ljava/lang/String;
    const-string v9, "VoiceUiSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "updateKeywordsSummary processName = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " commands = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    const-string v9, "VoiceUiSettings"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "commands length is "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    array-length v11, v0

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 343
    .local v3, keywords:Ljava/lang/StringBuilder;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    array-length v10, v0

    add-int/lit8 v10, v10, -0x1

    aget-object v10, v0, v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 345
    .local v4, lastWord:Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v9, v0

    add-int/lit8 v9, v9, -0x1

    if-ge v1, v9, :cond_4

    .line 346
    const-string v9, "\""

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v0, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    array-length v9, v0

    add-int/lit8 v9, v9, -0x2

    if-eq v1, v9, :cond_3

    .line 348
    const-string v9, ","

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 352
    :cond_4
    invoke-direct {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getSummaryResourceId(Ljava/lang/String;)I

    move-result v7

    .line 353
    .local v7, resId:I
    if-eqz v7, :cond_2

    .line 356
    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    aput-object v4, v9, v12

    invoke-virtual {p0, v7, v9}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 359
    .local v8, summary:Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcom/mediatek/voicesettings/VoiceUiSettings;->getPreferenceFromProcessName(Ljava/lang/String;)Landroid/preference/Preference;

    move-result-object v6

    .line 360
    .local v6, processPref:Landroid/preference/Preference;
    if-eqz v6, :cond_2

    array-length v9, v0

    if-le v9, v12, :cond_2

    .line 361
    invoke-virtual {v6, v8}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto/16 :goto_0
.end method
