.class public Lcom/mediatek/settings/OthersSettings;
.super Landroid/preference/PreferenceActivity;
.source "OthersSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final BUTTON_INTER_KEY:Ljava/lang/String; = "international_dialing_key"

.field private static final BUTTON_OTHERS_DUAL_MIC_KEY:Ljava/lang/String; = "dual_mic_key"

.field private static final BUTTON_OTHERS_FDN_KEY:Ljava/lang/String; = "button_fdn_key"

.field private static final BUTTON_OTHERS_MINUTE_REMINDER_KEY:Ljava/lang/String; = "minute_reminder_key"

.field private static final BUTTON_TTY_KEY:Ljava/lang/String; = "button_tty_mode_key"

.field private static final DEFAULT_INTER_DIALING_VALUE:I = 0x0

.field private static final INTER_DIALING_OFF:I = 0x0

.field private static final INTER_DIALING_ON:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/OthersSettings"


# instance fields
.field private mButtonDualMic:Landroid/preference/CheckBoxPreference;

.field private mButtonFdn:Landroid/preference/Preference;

.field private mButtonInter:Landroid/preference/CheckBoxPreference;

.field private mButtonMr:Landroid/preference/CheckBoxPreference;

.field private mButtonTTY:Landroid/preference/ListPreference;

.field private mExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

.field mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/mediatek/settings/OthersSettings;->mSimId:I

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 54
    new-instance v0, Lcom/mediatek/settings/OthersSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/OthersSettings$1;-><init>(Lcom/mediatek/settings/OthersSettings;)V

    iput-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/OthersSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 30
    invoke-direct {p0}, Lcom/mediatek/settings/OthersSettings;->setScreenEnabled()V

    return-void
.end method

.method public static goUpToTopLevelSetting(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 214
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/OthersSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 215
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 216
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 217
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 218
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 219
    return-void
.end method

.method private handleTTYChange(Landroid/preference/Preference;Ljava/lang/Object;)V
    .locals 6
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 223
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 224
    .local v0, buttonTtyMode:I
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "preferred_tty_mode"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 227
    .local v1, settingsTtyMode:I
    const-string v3, "Settings/OthersSettings"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleTTYChange: requesting set TTY mode enable (TTY) to"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    if-eq v0, v1, :cond_0

    .line 231
    packed-switch v0, :pswitch_data_0

    .line 240
    const/4 v0, 0x0

    .line 243
    :goto_0
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 244
    invoke-direct {p0, v0}, Lcom/mediatek/settings/OthersSettings;->updatePreferredTtyModeSummary(I)V

    .line 245
    new-instance v2, Landroid/content/Intent;

    const-string v3, "com.android.internal.telephony.cdma.intent.action.TTY_PREFERRED_MODE_CHANGE"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 246
    .local v2, ttyModeChanged:Landroid/content/Intent;
    const-string v3, "ttyPreferredMode"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 247
    invoke-virtual {p0, v2}, Lcom/mediatek/settings/OthersSettings;->sendBroadcast(Landroid/content/Intent;)V

    .line 249
    .end local v2           #ttyModeChanged:Landroid/content/Intent;
    :cond_0
    return-void

    .line 236
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "preferred_tty_mode"

    invoke-static {v3, v4, v0}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    .line 231
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private setScreenEnabled()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 267
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "airplane_mode_on"

    const/4 v7, -0x1

    invoke-static {v3, v6, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v4, :cond_0

    move v0, v4

    .line 270
    .local v0, airplaneModeOn:Z
    :goto_0
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 271
    .local v1, insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 272
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonFdn:Landroid/preference/Preference;

    invoke-virtual {v3, v5}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 281
    :goto_1
    return-void

    .end local v0           #airplaneModeOn:Z
    .end local v1           #insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    move v0, v5

    .line 267
    goto :goto_0

    .line 273
    .restart local v0       #airplaneModeOn:Z
    .restart local v1       #insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v4, :cond_3

    .line 274
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iput-boolean v5, v3, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    .line 275
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v3, p0, Lcom/mediatek/settings/OthersSettings;->mSimId:I

    .line 276
    iget v3, p0, Lcom/mediatek/settings/OthersSettings;->mSimId:I

    invoke-static {v3}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v2

    .line 277
    .local v2, isRadioOn:Z
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonFdn:Landroid/preference/Preference;

    if-eqz v2, :cond_2

    if-nez v0, :cond_2

    :goto_2
    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_1

    :cond_2
    move v4, v5

    goto :goto_2

    .line 279
    .end local v2           #isRadioOn:Z
    :cond_3
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iput-boolean v4, v3, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    goto :goto_1
.end method

.method private updatePreferredTtyModeSummary(I)V
    .locals 4
    .parameter "ttyMode"

    .prologue
    const/4 v3, 0x0

    .line 252
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070036

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0

    .line 253
    .local v0, txts:[Ljava/lang/String;
    packed-switch p1, :pswitch_data_0

    .line 261
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 262
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    aget-object v2, v0, v3

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 264
    :goto_0
    return-void

    .line 258
    :pswitch_0
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    aget-object v2, v0, p1

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 253
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "icicle"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 71
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 72
    const v3, 0x7f060017

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->addPreferencesFromResource(I)V

    .line 74
    invoke-static {}, Lcom/mediatek/phone/ext/ExtensionManager;->getInstance()Lcom/mediatek/phone/ext/ExtensionManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mediatek/phone/ext/ExtensionManager;->getOthersSettingsExtension()Lcom/mediatek/phone/ext/OthersSettingsExtension;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    .line 76
    const-string v3, "button_fdn_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonFdn:Landroid/preference/Preference;

    .line 77
    const-string v3, "minute_reminder_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    .line 78
    const-string v3, "dual_mic_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    .line 79
    const-string v3, "international_dialing_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/CheckBoxPreference;

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonInter:Landroid/preference/CheckBoxPreference;

    .line 80
    const-string v3, "DUAL_MIC"

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 81
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    iget-object v6, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 83
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mExtension:Lcom/mediatek/phone/ext/OthersSettingsExtension;

    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v6

    const-string v7, "call_reject"

    invoke-virtual {p0, v7}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lcom/mediatek/phone/ext/OthersSettingsExtension;->customizeCallRejectFeature(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)V

    .line 85
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_1

    .line 86
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 89
    :cond_1
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_2

    .line 90
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 92
    :cond_2
    const-string v3, "button_tty_mode_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/OthersSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/ListPreference;

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    .line 94
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    if-eqz v3, :cond_3

    .line 95
    const-string v3, "TTY"

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 96
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    invoke-virtual {v3, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 102
    :cond_3
    :goto_0
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonInter:Landroid/preference/CheckBoxPreference;

    if-eqz v3, :cond_5

    .line 103
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonInter:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v3, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 104
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "international_dialing_key"

    invoke-static {v3, v6, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .line 106
    .local v1, checkedStatus:I
    iget-object v6, p0, Lcom/mediatek/settings/OthersSettings;->mButtonInter:Landroid/preference/CheckBoxPreference;

    if-eqz v1, :cond_8

    move v3, v4

    :goto_1
    invoke-virtual {v6, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 107
    const-string v3, "Settings/OthersSettings"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onResume isChecked in DB:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    if-eqz v1, :cond_4

    move v5, v4

    :cond_4
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .end local v1           #checkedStatus:I
    :cond_5
    new-instance v3, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 112
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 113
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_6

    .line 115
    invoke-virtual {v0, v4}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 117
    :cond_6
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 118
    .local v2, intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 119
    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v2, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v2}, Lcom/mediatek/settings/OthersSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 121
    return-void

    .line 98
    .end local v0           #actionBar:Landroid/app/ActionBar;
    .end local v2           #intentFilter:Landroid/content/IntentFilter;
    :cond_7
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    iget-object v6, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 99
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    goto :goto_0

    .restart local v1       #checkedStatus:I
    :cond_8
    move v3, v5

    .line 106
    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 206
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 207
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 208
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 210
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/OthersSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 211
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 125
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 126
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 133
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 128
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->finish()V

    .line 129
    const/4 v1, 0x1

    goto :goto_0

    .line 126
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 6
    .parameter "preference"
    .parameter "objValue"

    .prologue
    const/4 v5, 0x1

    .line 162
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_2

    .line 163
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 164
    const-string v0, "OthersSettings"

    const-string v1, "onPreferenceChange mButtonReminder turn on"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    const v1, 0x7f0d008f

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/OthersSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 189
    .end local p2
    :cond_0
    :goto_0
    return v5

    .line 167
    .restart local p2
    :cond_1
    const-string v0, "OthersSettings"

    const-string v1, "onPreferenceChange mButtonReminder turn off"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonMr:Landroid/preference/CheckBoxPreference;

    const v1, 0x7f0d0090

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/OthersSettings;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 170
    :cond_2
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_4

    .line 171
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonDualMic:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 172
    const-string v0, "Settings/OthersSettings"

    const-string v1, "onPreferenceChange mButtonDualmic turn on"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    const-string v0, "0"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->setDualMicMode(Ljava/lang/String;)V

    goto :goto_0

    .line 175
    :cond_3
    const-string v0, "Settings/OthersSettings"

    const-string v1, "onPreferenceChange mButtonDualmic turn off"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const-string v0, "1"

    invoke-static {v0}, Lcom/android/phone/PhoneUtils;->setDualMicMode(Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :cond_4
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_5

    .line 179
    invoke-direct {p0, p1, p2}, Lcom/mediatek/settings/OthersSettings;->handleTTYChange(Landroid/preference/Preference;Ljava/lang/Object;)V

    goto :goto_0

    .line 180
    :cond_5
    iget-object v0, p0, Lcom/mediatek/settings/OthersSettings;->mButtonInter:Landroid/preference/CheckBoxPreference;

    if-ne p1, v0, :cond_0

    .line 181
    check-cast p2, Ljava/lang/Boolean;

    .end local p2
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 182
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "international_dialing_key"

    invoke-static {v0, v1, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 186
    :goto_1
    const-string v0, "Settings/OthersSettings"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPreferenceChange mButtonInter turn :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "international_dialing_key"

    const/4 v4, -0x1

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 184
    :cond_6
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "international_dialing_key"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_1
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/16 v4, 0x12e

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 138
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-nez v3, :cond_2

    .line 139
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonFdn:Landroid/preference/Preference;

    if-ne p2, v3, :cond_1

    .line 140
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/FdnSetting2;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 141
    .local v0, intent:Landroid/content/Intent;
    iget-object v2, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/mediatek/settings/OthersSettings;->mSimId:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    .line 158
    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    :goto_0
    return v1

    .line 143
    :cond_1
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    if-eq p2, v3, :cond_0

    move v1, v2

    .line 146
    goto :goto_0

    .line 149
    :cond_2
    iget-object v3, p0, Lcom/mediatek/settings/OthersSettings;->mButtonFdn:Landroid/preference/Preference;

    if-ne p2, v3, :cond_3

    .line 150
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 151
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d026d

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 152
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 153
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.mediatek.settings.FdnSetting2"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 154
    iget-object v2, p0, Lcom/mediatek/settings/OthersSettings;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/mediatek/settings/OthersSettings;->mSimId:I

    invoke-virtual {v2, v0, v3, v4}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    move v1, v2

    .line 158
    goto :goto_0
.end method

.method public onResume()V
    .locals 4

    .prologue
    .line 193
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 194
    invoke-direct {p0}, Lcom/mediatek/settings/OthersSettings;->setScreenEnabled()V

    .line 196
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 197
    invoke-virtual {p0}, Lcom/mediatek/settings/OthersSettings;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "preferred_tty_mode"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 200
    .local v0, settingsTtyMode:I
    iget-object v1, p0, Lcom/mediatek/settings/OthersSettings;->mButtonTTY:Landroid/preference/ListPreference;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 201
    invoke-direct {p0, v0}, Lcom/mediatek/settings/OthersSettings;->updatePreferredTtyModeSummary(I)V

    .line 203
    .end local v0           #settingsTtyMode:I
    :cond_0
    return-void
.end method
