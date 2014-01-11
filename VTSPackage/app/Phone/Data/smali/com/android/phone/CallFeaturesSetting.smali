.class public Lcom/android/phone/CallFeaturesSetting;
.super Landroid/preference/PreferenceActivity;
.source "CallFeaturesSetting.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field public static final ACTION_ADD_VOICEMAIL:Ljava/lang/String; = "com.android.phone.CallFeaturesSetting.ADD_VOICEMAIL"

.field public static final ACTION_CONFIGURE_VOICEMAIL:Ljava/lang/String; = "com.android.phone.CallFeaturesSetting.CONFIGURE_VOICEMAIL"

.field private static final BUTTON_CALL_ADDITIONAL_KEY:Ljava/lang/String; = "button_more_expand_key"

.field private static final BUTTON_CALL_BAR_KEY:Ljava/lang/String; = "button_cb_expand_key"

.field private static final BUTTON_CALL_FWD_KEY:Ljava/lang/String; = "button_cf_expand_key"

.field private static final BUTTON_CALL_VOICEMAIL_KEY:Ljava/lang/String; = "button_voicemail_key"

.field private static final BUTTON_IP_PREFIX_KEY:Ljava/lang/String; = "button_ip_prefix_key"

.field private static final DBG:Z = true

.field static final DTMF_TONE_TYPE_LONG:I = 0x1

.field static final DTMF_TONE_TYPE_NORMAL:I = 0x0

.field public static final FWD_NUMBER_EXTRA:Ljava/lang/String; = "com.android.phone.ForwardingNumber"

.field public static final FWD_NUMBER_TIME_EXTRA:Ljava/lang/String; = "com.android.phone.ForwardingNumberTime"

.field public static final HAC_KEY:Ljava/lang/String; = "HACSetting"

.field public static final HAC_VAL_OFF:Ljava/lang/String; = "OFF"

.field public static final HAC_VAL_ON:Ljava/lang/String; = "ON"

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallFeaturesSetting"

.field public static final SIGNOUT_EXTRA:Ljava/lang/String; = "com.android.phone.Signout"

.field public static final VM_NUMBER_EXTRA:Ljava/lang/String; = "com.android.phone.VoicemailNumber"


# instance fields
.field private mButtonCallAdditional:Landroid/preference/Preference;

.field private mButtonCallBar:Landroid/preference/Preference;

.field private mButtonCallFwd:Landroid/preference/Preference;

.field private mButtonIpPrefix:Landroid/preference/Preference;

.field private mButtonVoiceMail:Landroid/preference/Preference;

.field private mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 74
    new-instance v0, Lcom/android/phone/CallFeaturesSetting$1;

    invoke-direct {v0, p0}, Lcom/android/phone/CallFeaturesSetting$1;-><init>(Lcom/android/phone/CallFeaturesSetting;)V

    iput-object v0, p0, Lcom/android/phone/CallFeaturesSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/android/phone/CallFeaturesSetting;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/android/phone/CallFeaturesSetting;->setScreenEnabled()V

    return-void
.end method

.method public static getVibrateWhenRinging(Landroid/content/Context;)Z
    .locals 4
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 222
    const-string v2, "vibrator"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    .line 223
    .local v0, vibrator:Landroid/os/Vibrator;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v2

    if-nez v2, :cond_1

    .line 227
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "vibrate_when_ringing"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private setScreenEnabled()V
    .locals 8

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 232
    invoke-virtual {p0}, Lcom/android/phone/CallFeaturesSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v6, "airplane_mode_on"

    const/4 v7, -0x1

    invoke-static {v3, v6, v7}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v4, :cond_0

    move v0, v4

    .line 235
    .local v0, airplaneOn:Z
    :goto_0
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 236
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 237
    invoke-virtual {p0}, Lcom/android/phone/CallFeaturesSetting;->finish()V

    .line 250
    :goto_1
    return-void

    .end local v0           #airplaneOn:Z
    .end local v2           #list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    move v0, v5

    .line 232
    goto :goto_0

    .line 238
    .restart local v0       #airplaneOn:Z
    .restart local v2       #list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v4, :cond_3

    .line 239
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    iput v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    .line 240
    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-static {v3}, Lcom/mediatek/settings/CallSettings;->isRadioOn(I)Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez v0, :cond_2

    move v1, v4

    .line 241
    .local v1, isRadioOn:Z
    :goto_2
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallAdditional:Landroid/preference/Preference;

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 242
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallFwd:Landroid/preference/Preference;

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 243
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallBar:Landroid/preference/Preference;

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 244
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonVoiceMail:Landroid/preference/Preference;

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 245
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonIpPrefix:Landroid/preference/Preference;

    invoke-virtual {v3, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 246
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iput-boolean v5, v3, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    goto :goto_1

    .end local v1           #isRadioOn:Z
    :cond_2
    move v1, v5

    .line 240
    goto :goto_2

    .line 248
    :cond_3
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iput-boolean v4, v3, Lcom/mediatek/settings/PreCheckForRunning;->mByPass:Z

    goto :goto_1
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 84
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    const v3, 0x7f060021

    invoke-virtual {p0, v3}, Lcom/android/phone/CallFeaturesSetting;->addPreferencesFromResource(I)V

    .line 87
    const v3, 0x7f060011

    invoke-virtual {p0, v3}, Lcom/android/phone/CallFeaturesSetting;->addPreferencesFromResource(I)V

    .line 89
    invoke-virtual {p0}, Lcom/android/phone/CallFeaturesSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    .line 90
    .local v2, prefSet:Landroid/preference/PreferenceScreen;
    const-string v3, "button_more_expand_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallAdditional:Landroid/preference/Preference;

    .line 91
    const-string v3, "button_cf_expand_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallFwd:Landroid/preference/Preference;

    .line 92
    const-string v3, "button_cb_expand_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallBar:Landroid/preference/Preference;

    .line 93
    const-string v3, "button_voicemail_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonVoiceMail:Landroid/preference/Preference;

    .line 94
    const-string v3, "button_ip_prefix_key"

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonIpPrefix:Landroid/preference/Preference;

    .line 96
    const-string v3, "IP_DIAL"

    invoke-static {v3}, Lcom/android/phone/PhoneUtils;->isSupportFeature(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 97
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonIpPrefix:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 98
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonIpPrefix:Landroid/preference/Preference;

    .line 101
    :cond_0
    new-instance v3, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v3, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 103
    invoke-virtual {p0}, Lcom/android/phone/CallFeaturesSetting;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 104
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_1

    .line 106
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 108
    :cond_1
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.AIRPLANE_MODE"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 109
    .local v1, intentFilter:Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SIM_INDICATOR_STATE_CHANGED"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 110
    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-virtual {v1, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 111
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v1}, Lcom/android/phone/CallFeaturesSetting;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 112
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 208
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 209
    iget-object v0, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/android/phone/CallFeaturesSetting;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/phone/CallFeaturesSetting;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 213
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 122
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 123
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 130
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 125
    :pswitch_0
    invoke-virtual {p0}, Lcom/android/phone/CallFeaturesSetting;->finish()V

    .line 126
    const/4 v1, 0x1

    goto :goto_0

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .parameter "preference"
    .parameter "objValue"

    .prologue
    .line 204
    const/4 v0, 0x0

    return v0
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 6
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v2, 0x0

    const/16 v5, 0x12e

    const/4 v1, 0x1

    .line 136
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-nez v3, :cond_4

    .line 137
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonVoiceMail:Landroid/preference/Preference;

    if-ne p2, v3, :cond_0

    .line 138
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/VoiceMailSetting;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 139
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 140
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    .line 200
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return v1

    .line 142
    :cond_0
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallFwd:Landroid/preference/Preference;

    if-ne p2, v3, :cond_1

    .line 143
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/phone/GsmUmtsCallForwardOptions;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 144
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 147
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallBar:Landroid/preference/Preference;

    if-ne p2, v3, :cond_2

    .line 148
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/CallBarring;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 149
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 150
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 152
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallAdditional:Landroid/preference/Preference;

    if-ne p2, v3, :cond_3

    .line 153
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/android/phone/GsmUmtsAdditionalCallOptions;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 154
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "android.intent.action.MAIN"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 155
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    move v1, v2

    .line 158
    goto :goto_0

    .line 161
    :cond_4
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonVoiceMail:Landroid/preference/Preference;

    if-ne p2, v3, :cond_5

    .line 162
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 163
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d00f0

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 164
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 165
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.mediatek.settings.VoiceMailSetting"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 166
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto :goto_0

    .line 168
    .end local v0           #intent:Landroid/content/Intent;
    :cond_5
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallFwd:Landroid/preference/Preference;

    if-ne p2, v3, :cond_6

    .line 169
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 170
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d01c6

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 171
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 172
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.android.phone.GsmUmtsCallForwardOptions"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 173
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto/16 :goto_0

    .line 175
    .end local v0           #intent:Landroid/content/Intent;
    :cond_6
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallBar:Landroid/preference/Preference;

    if-ne p2, v3, :cond_7

    .line 176
    const-string v2, "Settings/CallFeaturesSetting"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPreferenceTreeClick , call barring key , simId= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 178
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d00b9

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 179
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.mediatek.settings.CallBarring"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto/16 :goto_0

    .line 183
    .end local v0           #intent:Landroid/content/Intent;
    :cond_7
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonCallAdditional:Landroid/preference/Preference;

    if-ne p2, v3, :cond_8

    .line 184
    const-string v2, "Settings/CallFeaturesSetting"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onPreferenceTreeClick , call cost key , simId= "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d01b8

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 187
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 188
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.android.phone.GsmUmtsAdditionalCallOptions"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 189
    iget-object v2, p0, Lcom/android/phone/CallFeaturesSetting;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    iget v3, p0, Lcom/android/phone/CallFeaturesSetting;->mSimId:I

    invoke-virtual {v2, v0, v3, v5}, Lcom/mediatek/settings/PreCheckForRunning;->checkToRun(Landroid/content/Intent;II)V

    goto/16 :goto_0

    .line 191
    .end local v0           #intent:Landroid/content/Intent;
    :cond_8
    iget-object v3, p0, Lcom/android/phone/CallFeaturesSetting;->mButtonIpPrefix:Landroid/preference/Preference;

    if-ne v3, p2, :cond_9

    .line 192
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 193
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d0093

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 194
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 195
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.mediatek.settings.IpPrefixPreference"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 196
    invoke-virtual {p0, v0}, Lcom/android/phone/CallFeaturesSetting;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .end local v0           #intent:Landroid/content/Intent;
    :cond_9
    move v1, v2

    .line 200
    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 116
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 117
    invoke-direct {p0}, Lcom/android/phone/CallFeaturesSetting;->setScreenEnabled()V

    .line 118
    return-void
.end method
