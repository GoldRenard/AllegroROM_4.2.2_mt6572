.class public Lcom/mediatek/settings/SipCallSetting;
.super Landroid/preference/PreferenceActivity;
.source "SipCallSetting.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final BUTTON_SIP_CALL_OPTIONS:Ljava/lang/String; = "sip_call_options_key"

.field private static final BUTTON_SIP_CALL_OPTIONS_WIFI_ONLY:Ljava/lang/String; = "sip_call_options_wifi_only_key"

.field private static final SIP_SETTINGS_CATEGORY_KEY:Ljava/lang/String; = "sip_settings_category_key"

.field private static final TAG:Ljava/lang/String; = "Settings/SipCallSetting"


# instance fields
.field private mAccountPreference:Landroid/preference/Preference;

.field private mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

.field private mCallManager:Lcom/android/internal/telephony/CallManager;

.field private mListSipCallOptions:Landroid/preference/ListPreference;

.field private mProfileDb:Lcom/android/phone/sip/SipProfileDb;

.field private mSipManager:Landroid/net/sip/SipManager;

.field private mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 66
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/SipCallSetting;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/mediatek/settings/SipCallSetting;->handleSipReceiveCallsOption(Z)V

    return-void
.end method

.method private checkAndSetDefaultSim()V
    .locals 10

    .prologue
    const-wide/16 v8, -0x5

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 213
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "voice_call_sim_setting"

    invoke-static {v3, v4, v8, v9}, Landroid/provider/Settings$System;->getLong(Landroid/content/ContentResolver;Ljava/lang/String;J)J

    move-result-wide v0

    .line 217
    .local v0, defaultSim:J
    const-wide/16 v3, -0x2

    cmp-long v3, v0, v3

    if-eqz v3, :cond_1

    .line 218
    const-wide/16 v3, -0x1

    cmp-long v3, v0, v3

    if-nez v3, :cond_0

    .line 219
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 220
    .local v2, sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v7, :cond_0

    .line 221
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "voice_call_sim_setting"

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-wide v6, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    .line 250
    .end local v2           #sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    :cond_0
    :goto_0
    return-void

    .line 229
    :cond_1
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    .line 230
    .restart local v2       #sims:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_3

    .line 231
    :cond_2
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "voice_call_sim_setting"

    invoke-static {v3, v4, v8, v9}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto :goto_0

    .line 234
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v7, :cond_4

    .line 235
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "voice_call_sim_setting"

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-wide v6, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto :goto_0

    .line 239
    :cond_4
    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget v3, v3, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    if-nez v3, :cond_5

    .line 240
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "voice_call_sim_setting"

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-wide v6, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto :goto_0

    .line 244
    :cond_5
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "voice_call_sim_setting"

    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/provider/Telephony$SIMInfo;

    iget-wide v6, v3, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v4, v5, v6, v7}, Landroid/provider/Settings$System;->putLong(Landroid/content/ContentResolver;Ljava/lang/String;J)Z

    goto :goto_0
.end method

.method private getSipCallOptionPreference()Landroid/preference/ListPreference;
    .locals 4

    .prologue
    .line 159
    const-string v3, "sip_call_options_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/SipCallSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 161
    .local v1, wifiAnd3G:Landroid/preference/ListPreference;
    const-string v3, "sip_call_options_wifi_only_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/SipCallSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    .line 163
    .local v2, wifiOnly:Landroid/preference/ListPreference;
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 164
    .local v0, prefSet:Landroid/preference/PreferenceScreen;
    invoke-static {p0}, Landroid/net/sip/SipManager;->isSipWifiOnly(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 165
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 169
    .end local v2           #wifiOnly:Landroid/preference/ListPreference;
    :goto_0
    return-object v2

    .line 168
    .restart local v2       #wifiOnly:Landroid/preference/ListPreference;
    :cond_0
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    move-object v2, v1

    .line 169
    goto :goto_0
.end method

.method private handleSipCallOptionsChange(Ljava/lang/Object;)V
    .locals 3
    .parameter "objValue"

    .prologue
    .line 301
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 302
    .local v0, option:Ljava/lang/String;
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;

    invoke-virtual {v1, v0}, Lcom/android/phone/sip/SipSharedPreferences;->setSipCallOption(Ljava/lang/String;)V

    .line 303
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v2, v0}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 305
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 306
    return-void
.end method

.method private declared-synchronized handleSipReceiveCallsOption(Z)V
    .locals 9
    .parameter "enabled"

    .prologue
    .line 253
    monitor-enter p0

    :try_start_0
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;

    invoke-virtual {v6}, Lcom/android/phone/sip/SipSharedPreferences;->getReceivingCallsEnabled()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 254
    .local v2, isReceiveCall:Z
    if-eqz p1, :cond_0

    if-eqz v2, :cond_1

    :cond_0
    if-nez p1, :cond_2

    if-nez v2, :cond_2

    .line 276
    :cond_1
    monitor-exit p0

    return-void

    .line 257
    :cond_2
    :try_start_1
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mProfileDb:Lcom/android/phone/sip/SipProfileDb;

    invoke-virtual {v6}, Lcom/android/phone/sip/SipProfileDb;->retrieveSipProfileList()Ljava/util/List;

    move-result-object v4

    .line 258
    .local v4, sipProfileList:Ljava/util/List;,"Ljava/util/List<Landroid/net/sip/SipProfile;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_3
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/sip/SipProfile;

    .line 259
    .local v3, p:Landroid/net/sip/SipProfile;
    invoke-virtual {v3}, Landroid/net/sip/SipProfile;->getUriString()Ljava/lang/String;

    move-result-object v5

    .line 260
    .local v5, sipUri:Ljava/lang/String;
    invoke-direct {p0, v3, p1}, Lcom/mediatek/settings/SipCallSetting;->updateAutoRegistrationFlag(Landroid/net/sip/SipProfile;Z)Landroid/net/sip/SipProfile;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 262
    if-eqz p1, :cond_4

    .line 263
    :try_start_2
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mSipManager:Landroid/net/sip/SipManager;

    invoke-static {}, Lcom/android/phone/SipUtil;->createIncomingCallPendingIntent()Landroid/app/PendingIntent;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v3, v7, v8}, Landroid/net/sip/SipManager;->open(Landroid/net/sip/SipProfile;Landroid/app/PendingIntent;Landroid/net/sip/SipRegistrationListener;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/net/sip/SipException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 272
    :catch_0
    move-exception v0

    .line 273
    .local v0, e:Landroid/net/sip/SipException;
    :try_start_3
    const-string v6, "Settings/SipCallSetting"

    const-string v7, "register failed"

    invoke-static {v6, v7, v0}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 253
    .end local v0           #e:Landroid/net/sip/SipException;
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #isReceiveCall:Z
    .end local v3           #p:Landroid/net/sip/SipProfile;
    .end local v4           #sipProfileList:Ljava/util/List;,"Ljava/util/List<Landroid/net/sip/SipProfile;>;"
    .end local v5           #sipUri:Ljava/lang/String;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 266
    .restart local v1       #i$:Ljava/util/Iterator;
    .restart local v2       #isReceiveCall:Z
    .restart local v3       #p:Landroid/net/sip/SipProfile;
    .restart local v4       #sipProfileList:Ljava/util/List;,"Ljava/util/List<Landroid/net/sip/SipProfile;>;"
    .restart local v5       #sipUri:Ljava/lang/String;
    :cond_4
    :try_start_4
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mSipManager:Landroid/net/sip/SipManager;

    invoke-virtual {v6, v5}, Landroid/net/sip/SipManager;->close(Ljava/lang/String;)V

    .line 267
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;

    invoke-virtual {v6, v5}, Lcom/android/phone/sip/SipSharedPreferences;->isPrimaryAccount(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 269
    iget-object v6, p0, Lcom/mediatek/settings/SipCallSetting;->mSipManager:Landroid/net/sip/SipManager;

    invoke-virtual {v6, v3}, Landroid/net/sip/SipManager;->open(Landroid/net/sip/SipProfile;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Landroid/net/sip/SipException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0
.end method

.method private updateAutoRegistrationFlag(Landroid/net/sip/SipProfile;Z)Landroid/net/sip/SipProfile;
    .locals 4
    .parameter "p"
    .parameter "enabled"

    .prologue
    .line 280
    new-instance v2, Landroid/net/sip/SipProfile$Builder;

    invoke-direct {v2, p1}, Landroid/net/sip/SipProfile$Builder;-><init>(Landroid/net/sip/SipProfile;)V

    invoke-virtual {v2, p2}, Landroid/net/sip/SipProfile$Builder;->setAutoRegistration(Z)Landroid/net/sip/SipProfile$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/sip/SipProfile$Builder;->build()Landroid/net/sip/SipProfile;

    move-result-object v1

    .line 284
    .local v1, newProfile:Landroid/net/sip/SipProfile;
    :try_start_0
    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mProfileDb:Lcom/android/phone/sip/SipProfileDb;

    invoke-virtual {v2, p1}, Lcom/android/phone/sip/SipProfileDb;->deleteProfile(Landroid/net/sip/SipProfile;)V

    .line 285
    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mProfileDb:Lcom/android/phone/sip/SipProfileDb;

    invoke-virtual {v2, v1}, Lcom/android/phone/sip/SipProfileDb;->saveProfile(Landroid/net/sip/SipProfile;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 289
    :goto_0
    return-object v1

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, e:Ljava/io/IOException;
    const-string v2, "Settings/SipCallSetting"

    const-string v3, "updateAutoRegistrationFlag error"

    invoke-static {v2, v3, v0}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 87
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 88
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isVoipSupported()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    invoke-static {p0}, Landroid/net/sip/SipManager;->newInstance(Landroid/content/Context;)Landroid/net/sip/SipManager;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mSipManager:Landroid/net/sip/SipManager;

    .line 90
    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mCallManager:Lcom/android/internal/telephony/CallManager;

    .line 91
    new-instance v1, Lcom/android/phone/sip/SipSharedPreferences;

    invoke-direct {v1, p0}, Lcom/android/phone/sip/SipSharedPreferences;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;

    .line 92
    const v1, 0x7f06001f

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/SipCallSetting;->addPreferencesFromResource(I)V

    .line 93
    const-string v1, "open_sip_call_option_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/SipCallSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/CheckBoxPreference;

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    .line 94
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, p0}, Landroid/preference/CheckBoxPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 95
    invoke-direct {p0}, Lcom/mediatek/settings/SipCallSetting;->getSipCallOptionPreference()Landroid/preference/ListPreference;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    .line 97
    const-string v1, "sip_account_settings_key"

    invoke-virtual {p0, v1}, Lcom/mediatek/settings/SipCallSetting;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mAccountPreference:Landroid/preference/Preference;

    .line 98
    new-instance v1, Lcom/android/phone/sip/SipProfileDb;

    invoke-direct {v1, p0}, Lcom/android/phone/sip/SipProfileDb;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mProfileDb:Lcom/android/phone/sip/SipProfileDb;

    .line 99
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 100
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 101
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    .line 110
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 111
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_1

    .line 113
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 115
    :cond_1
    return-void

    .line 103
    .end local v0           #actionBar:Landroid/app/ActionBar;
    :cond_2
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v1, p0}, Landroid/preference/ListPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 104
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    iget-object v3, p0, Lcom/mediatek/settings/SipCallSetting;->mSipSharedPreferences:Lcom/android/phone/sip/SipSharedPreferences;

    invoke-virtual {v3}, Lcom/android/phone/sip/SipSharedPreferences;->getSipCallOption()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->findIndexOfValue(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setValueIndex(I)V

    .line 107
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v2}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 145
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 146
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 153
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 148
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/SipCallSetting;->finish()V

    .line 149
    const/4 v1, 0x1

    goto :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 1
    .parameter "preference"
    .parameter "newValue"

    .prologue
    .line 294
    iget-object v0, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-ne p1, v0, :cond_0

    .line 295
    invoke-direct {p0, p2}, Lcom/mediatek/settings/SipCallSetting;->handleSipCallOptionsChange(Ljava/lang/Object;)V

    .line 297
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 6
    .parameter "preference"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 174
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    if-ne p1, v4, :cond_0

    .line 176
    iget-object v0, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    .line 177
    .local v0, cp:Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_1

    move v1, v2

    .line 178
    .local v1, intEnable:I
    :goto_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "enable_internet_call_value"

    invoke-static {v4, v5, v1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 181
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/mediatek/settings/SipCallSetting$1;

    invoke-direct {v5, p0, v1}, Lcom/mediatek/settings/SipCallSetting$1;-><init>(Lcom/mediatek/settings/SipCallSetting;I)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 186
    if-ne v1, v2, :cond_2

    .line 187
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mAccountPreference:Landroid/preference/Preference;

    invoke-virtual {v4, v2}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 188
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-eqz v4, :cond_0

    .line 189
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v4, v2}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 202
    .end local v0           #cp:Landroid/preference/CheckBoxPreference;
    .end local v1           #intEnable:I
    :cond_0
    :goto_1
    return v3

    .restart local v0       #cp:Landroid/preference/CheckBoxPreference;
    :cond_1
    move v1, v3

    .line 177
    goto :goto_0

    .line 193
    .restart local v1       #intEnable:I
    :cond_2
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 194
    invoke-direct {p0}, Lcom/mediatek/settings/SipCallSetting;->checkAndSetDefaultSim()V

    .line 196
    :cond_3
    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mAccountPreference:Landroid/preference/Preference;

    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 197
    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-eqz v2, :cond_0

    .line 198
    iget-object v2, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v2, v3}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_1
.end method

.method protected onResume()V
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 118
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 119
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/phone/PhoneGlobals;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "enable_internet_call_value"

    invoke-static {v1, v4, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 122
    .local v0, enable:I
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mCallManager:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    sget-object v4, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v1, v4, :cond_2

    .line 123
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mAccountPreference:Landroid/preference/Preference;

    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 124
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 125
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 126
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    invoke-virtual {v1, v3}, Landroid/preference/ListPreference;->setEnabled(Z)V

    .line 136
    :cond_0
    :goto_0
    if-ne v0, v2, :cond_5

    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-nez v1, :cond_5

    .line 137
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 141
    :cond_1
    :goto_1
    return-void

    .line 129
    :cond_2
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mAccountPreference:Landroid/preference/Preference;

    if-ne v0, v2, :cond_3

    move v1, v2

    :goto_2
    invoke-virtual {v4, v1}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 130
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 131
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-eqz v1, :cond_0

    .line 132
    iget-object v4, p0, Lcom/mediatek/settings/SipCallSetting;->mListSipCallOptions:Landroid/preference/ListPreference;

    if-ne v0, v2, :cond_4

    move v1, v2

    :goto_3
    invoke-virtual {v4, v1}, Landroid/preference/ListPreference;->setEnabled(Z)V

    goto :goto_0

    :cond_3
    move v1, v3

    .line 129
    goto :goto_2

    :cond_4
    move v1, v3

    .line 132
    goto :goto_3

    .line 138
    :cond_5
    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    iget-object v1, p0, Lcom/mediatek/settings/SipCallSetting;->mButtonSipCallOptions:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1, v3}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_1
.end method
