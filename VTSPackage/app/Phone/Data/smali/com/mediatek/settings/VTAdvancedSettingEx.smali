.class public Lcom/mediatek/settings/VTAdvancedSettingEx;
.super Landroid/preference/PreferenceActivity;
.source "VTAdvancedSettingEx.java"


# static fields
.field private static final BUTTON_CALL_ADDITIONAL_KEY:Ljava/lang/String; = "button_more_expand_key"

.field private static final BUTTON_CALL_BAR_KEY:Ljava/lang/String; = "button_cb_expand_key"

.field private static final BUTTON_CALL_FWD_KEY:Ljava/lang/String; = "button_cf_expand_key"

.field private static final BUTTON_VT_AUTO_DROPBACK_KEY:Ljava/lang/String; = "button_vt_auto_dropback_key"

.field private static final BUTTON_VT_ENABLE_BACK_CAMERA_KEY:Ljava/lang/String; = "button_vt_enable_back_camera_key"

.field private static final BUTTON_VT_ENABLE_PEER_REPLACE_KEY:Ljava/lang/String; = "button_vt_enable_peer_replace_key"

.field private static final BUTTON_VT_MO_LOCAL_VIDEO_DISPLAY_KEY:Ljava/lang/String; = "button_vt_mo_local_video_display_key"

.field private static final BUTTON_VT_MT_LOCAL_VIDEO_DISPLAY_KEY:Ljava/lang/String; = "button_vt_mt_local_video_display_key"

.field private static final BUTTON_VT_PEER_BIGGER_KEY:Ljava/lang/String; = "button_vt_peer_bigger_key"

.field private static final BUTTON_VT_PEER_REPLACE_KEY:Ljava/lang/String; = "button_vt_replace_peer_expand_key"

.field private static final BUTTON_VT_REPLACE_KEY:Ljava/lang/String; = "button_vt_replace_expand_key"

.field private static final BUTTON_VT_RINGTONE_KEY:Ljava/lang/String; = "button_vt_ringtone_key"

.field private static final CHECKBOX_RING_ONLY_ONCE:Ljava/lang/String; = "ring_only_once"

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "Settings/VTAdvancedSetting"

.field public static final REQUESTCODE_PICTRUE_PICKED_WITH_DATA:I = 0xbcd

.field private static final SELECT_DEFAULT_PICTURE:Ljava/lang/String; = "0"

.field private static final SELECT_DEFAULT_PICTURE2:Ljava/lang/String; = "0"

.field private static final SELECT_MY_PICTURE:Ljava/lang/String; = "2"

.field private static final SELECT_MY_PICTURE2:Ljava/lang/String; = "1"


# instance fields
.field private mButtonCallAdditional:Landroid/preference/Preference;

.field private mButtonCallBar:Landroid/preference/Preference;

.field private mButtonCallFwd:Landroid/preference/Preference;

.field private mButtonVTAutoDropBack:Landroid/preference/Preference;

.field private mButtonVTEnablePeerReplace:Landroid/preference/Preference;

.field private mButtonVTEnablebackCamer:Landroid/preference/Preference;

.field private mButtonVTMoVideo:Landroid/preference/Preference;

.field private mButtonVTMtVideo:Landroid/preference/Preference;

.field private mButtonVTPeerBigger:Landroid/preference/Preference;

.field private mButtonVTPeerReplace:Landroid/preference/Preference;

.field private mButtonVTReplace:Landroid/preference/Preference;

.field private mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

.field private mIntentFilter:Landroid/content/IntentFilter;

.field private mIsOnlyOneSim:Z

.field private mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

.field private mReceiver:Landroid/content/BroadcastReceiver;

.field private mSimIds:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 61
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 102
    iput-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    .line 108
    iput-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 109
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mIsOnlyOneSim:Z

    .line 116
    new-instance v0, Lcom/mediatek/settings/VTAdvancedSettingEx$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/VTAdvancedSettingEx$1;-><init>(Lcom/mediatek/settings/VTAdvancedSettingEx;)V

    iput-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$002(Lcom/mediatek/settings/VTAdvancedSettingEx;[J)[J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 61
    iput-object p1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    return-object p1
.end method

.method static synthetic access$100(Lcom/mediatek/settings/VTAdvancedSettingEx;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 61
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->setScreenEnabled()V

    return-void
.end method

.method private getKeyValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "key"

    .prologue
    .line 340
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 341
    .local v0, sp:Landroid/content/SharedPreferences;
    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 112
    const-string v0, "Settings/VTAdvancedSetting"

    invoke-static {v0, p0}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    return-void
.end method

.method private setKeyValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "key"
    .parameter "value"

    .prologue
    .line 345
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 346
    .local v1, sp:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 347
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 348
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 349
    return-void
.end method

.method private setScreenEnabled()V
    .locals 2

    .prologue
    .line 198
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    array-length v1, v1

    if-lez v1, :cond_3

    const/4 v0, 0x1

    .line 199
    .local v0, isEnable:Z
    :goto_0
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTReplace:Landroid/preference/Preference;

    invoke-virtual {v1}, Landroid/preference/Preference;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTReplace:Landroid/preference/Preference;

    invoke-virtual {v1}, Landroid/preference/Preference;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_2

    if-eqz v0, :cond_2

    .line 201
    :cond_1
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTReplace:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 202
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablebackCamer:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 203
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerBigger:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 204
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMoVideo:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 205
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMtVideo:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 206
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallAdditional:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 207
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallFwd:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 208
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallBar:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 209
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerReplace:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 210
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablePeerReplace:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 211
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTAutoDropBack:Landroid/preference/Preference;

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 214
    :cond_2
    return-void

    .line 198
    .end local v0           #isEnable:Z
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .parameter "icicle"

    .prologue
    .line 139
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 140
    const v2, 0x7f060024

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->addPreferencesFromResource(I)V

    .line 142
    new-instance v2, Lcom/mediatek/settings/PreCheckForRunning;

    invoke-direct {v2, p0}, Lcom/mediatek/settings/PreCheckForRunning;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    .line 143
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 145
    .local v1, list:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->get3GSimCards(Landroid/app/Activity;)[J

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    .line 147
    const-string v2, "button_vt_replace_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTReplace:Landroid/preference/Preference;

    .line 149
    const-string v2, "button_vt_enable_back_camera_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablebackCamer:Landroid/preference/Preference;

    .line 150
    const-string v2, "button_vt_peer_bigger_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerBigger:Landroid/preference/Preference;

    .line 151
    const-string v2, "button_vt_mo_local_video_display_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMoVideo:Landroid/preference/Preference;

    .line 152
    const-string v2, "button_vt_mt_local_video_display_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMtVideo:Landroid/preference/Preference;

    .line 154
    const-string v2, "button_more_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallAdditional:Landroid/preference/Preference;

    .line 155
    const-string v2, "button_cf_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallFwd:Landroid/preference/Preference;

    .line 156
    const-string v2, "button_cb_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallBar:Landroid/preference/Preference;

    .line 158
    const-string v2, "button_vt_replace_peer_expand_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerReplace:Landroid/preference/Preference;

    .line 159
    const-string v2, "button_vt_enable_peer_replace_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablePeerReplace:Landroid/preference/Preference;

    .line 160
    const-string v2, "button_vt_auto_dropback_key"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTAutoDropBack:Landroid/preference/Preference;

    .line 161
    const-string v2, "ring_only_once"

    invoke-virtual {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/CheckBoxPreference;

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

    .line 162
    const-string v2, "MyLog"

    const-string v3, "FeatureOption.MTK_VT3G324M_SUPPORT=falseFeatureOption.MTK_PHONE_VT_VOICE_ANSWER=false"

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mCheckBoxRingOnlyOnce:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2, v3}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 168
    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mIntentFilter:Landroid/content/IntentFilter;

    .line 169
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mReceiver:Landroid/content/BroadcastReceiver;

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mIntentFilter:Landroid/content/IntentFilter;

    invoke-virtual {p0, v2, v3}, Lcom/mediatek/settings/VTAdvancedSettingEx;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 171
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 172
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 174
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 176
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 352
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 353
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mPreCfr:Lcom/mediatek/settings/PreCheckForRunning;

    invoke-virtual {v0}, Lcom/mediatek/settings/PreCheckForRunning;->deRegister()V

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 359
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 186
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 187
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 194
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 189
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->finish()V

    .line 190
    const/4 v1, 0x1

    goto :goto_0

    .line 187
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 7
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const v6, 0x7f0d00f7

    const v5, 0x7f0d0047

    const v4, 0x7f0d001e

    const/4 v1, 0x1

    .line 220
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallFwd:Landroid/preference/Preference;

    if-ne p2, v2, :cond_0

    .line 221
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 222
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d01c6

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 223
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 224
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 225
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 226
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.android.phone.GsmUmtsCallForwardOptions"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    .line 336
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return v1

    .line 229
    :cond_0
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallBar:Landroid/preference/Preference;

    if-ne p2, v2, :cond_1

    .line 230
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 231
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "ISVT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 232
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d00b9

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 233
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 234
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 235
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 236
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.mediatek.settings.CallBarring"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 237
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 239
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonCallAdditional:Landroid/preference/Preference;

    if-ne p2, v2, :cond_2

    .line 240
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 241
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d01b8

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 242
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 243
    const-string v2, "ITEM_TYPE"

    const-string v3, "PreferenceScreen"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 245
    const-string v2, "TARGET_CLASS"

    const-string v3, "com.android.phone.GsmUmtsAdditionalCallOptions"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 248
    .end local v0           #intent:Landroid/content/Intent;
    :cond_2
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablebackCamer:Landroid/preference/Preference;

    if-ne p2, v2, :cond_3

    .line 249
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 250
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 251
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 252
    const-string v2, "INIT_TITLE_NAME"

    const v3, 0x7f0d0025

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 253
    const-string v2, "INIT_BASE_KEY"

    const-string v3, "button_vt_enable_back_camera_key@"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    const-string v2, "ITEM_TYPE"

    const-string v3, "CheckBoxPreference"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 255
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 257
    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTReplace:Landroid/preference/Preference;

    if-ne p2, v2, :cond_5

    .line 258
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 259
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    invoke-virtual {v0, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 260
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 261
    const-string v2, "ITEM_TYPE"

    const-string v3, "ListPreference"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 262
    const-string v2, "LIST_TITLE_NAME"

    invoke-virtual {v0, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 263
    const-string v2, "INIT_ARRAY"

    const v3, 0x7f07000e

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 264
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 265
    const-string v2, "button_vt_replace_expand_key"

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getKeyValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    .line 266
    const-string v2, "button_vt_replace_expand_key"

    const-string v3, "0"

    invoke-direct {p0, v2, v3}, Lcom/mediatek/settings/VTAdvancedSettingEx;->setKeyValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    :cond_4
    const-string v2, "INIT_BASE_KEY"

    const-string v3, "button_vt_replace_expand_key@"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 269
    const-string v2, "INIT_ARRAY_VALUE"

    const v3, 0x7f070010

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 270
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 272
    .end local v0           #intent:Landroid/content/Intent;
    :cond_5
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerBigger:Landroid/preference/Preference;

    if-ne p2, v2, :cond_7

    .line 273
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 274
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "INIT_FEATURE_NAME"

    const-string v2, "VT"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    const-string v1, "INIT_SIM_ID"

    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 276
    const-string v1, "INIT_TITLE_NAME"

    const v2, 0x7f0d0027

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 277
    const-string v1, "ITEM_TYPE"

    const-string v2, "CheckBoxPreference"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 278
    const-string v1, "INIT_BASE_KEY"

    const-string v2, "button_vt_peer_bigger_key@"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 279
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    .line 336
    .end local v0           #intent:Landroid/content/Intent;
    :cond_6
    :goto_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 280
    :cond_7
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMoVideo:Landroid/preference/Preference;

    if-ne p2, v2, :cond_8

    .line 281
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 282
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "INIT_FEATURE_NAME"

    const-string v2, "VT"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 283
    const-string v1, "INIT_SIM_ID"

    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 284
    const-string v1, "INIT_TITLE_NAME"

    const v2, 0x7f0d0029

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 285
    const-string v1, "ITEM_TYPE"

    const-string v2, "CheckBoxPreference"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 286
    const-string v1, "INIT_BASE_KEY"

    const-string v2, "button_vt_mo_local_video_display_key@"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 287
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 288
    .end local v0           #intent:Landroid/content/Intent;
    :cond_8
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTMtVideo:Landroid/preference/Preference;

    if-ne p2, v2, :cond_a

    .line 289
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 290
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 291
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 292
    const-string v2, "LIST_TITLE_NAME"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 293
    const-string v2, "ITEM_TYPE"

    const-string v3, "ListPreference"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 294
    const-string v2, "INIT_ARRAY"

    const v3, 0x7f070012

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 295
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 296
    const-string v2, "button_vt_mt_local_video_display_key"

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getKeyValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_9

    .line 297
    const-string v2, "button_vt_mt_local_video_display_key"

    const-string v3, "0"

    invoke-direct {p0, v2, v3}, Lcom/mediatek/settings/VTAdvancedSettingEx;->setKeyValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 299
    :cond_9
    const-string v2, "INIT_BASE_KEY"

    const-string v3, "button_vt_mt_local_video_display_key@"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 300
    const-string v2, "INIT_ARRAY_VALUE"

    const v3, 0x7f070013

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 301
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 303
    .end local v0           #intent:Landroid/content/Intent;
    :cond_a
    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTPeerReplace:Landroid/preference/Preference;

    if-ne p2, v2, :cond_c

    .line 304
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 305
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "INIT_TITLE_NAME"

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 306
    const-string v2, "INIT_FEATURE_NAME"

    const-string v3, "VT"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 307
    const-string v2, "ITEM_TYPE"

    const-string v3, "ListPreference"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 308
    const-string v2, "LIST_TITLE_NAME"

    invoke-virtual {v0, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 309
    const-string v2, "INIT_ARRAY"

    const v3, 0x7f07000f

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 310
    const-string v2, "INIT_SIM_ID"

    iget-object v3, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 311
    const-string v2, "button_vt_replace_peer_expand_key"

    invoke-direct {p0, v2}, Lcom/mediatek/settings/VTAdvancedSettingEx;->getKeyValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_b

    .line 312
    const-string v2, "button_vt_replace_peer_expand_key"

    const-string v3, "0"

    invoke-direct {p0, v2, v3}, Lcom/mediatek/settings/VTAdvancedSettingEx;->setKeyValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    :cond_b
    const-string v2, "INIT_BASE_KEY"

    const-string v3, "button_vt_replace_peer_expand_key@"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 315
    const-string v2, "INIT_ARRAY_VALUE"

    const v3, 0x7f070011

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 316
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 318
    .end local v0           #intent:Landroid/content/Intent;
    :cond_c
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTEnablePeerReplace:Landroid/preference/Preference;

    if-ne p2, v1, :cond_d

    .line 319
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 320
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "INIT_FEATURE_NAME"

    const-string v2, "VT"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 321
    const-string v1, "INIT_SIM_ID"

    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 322
    const-string v1, "INIT_TITLE_NAME"

    const v2, 0x7f0d0045

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 323
    const-string v1, "ITEM_TYPE"

    const-string v2, "CheckBoxPreference"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 324
    const-string v1, "INIT_BASE_KEY"

    const-string v2, "button_vt_enable_peer_replace_key@"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 325
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 326
    .end local v0           #intent:Landroid/content/Intent;
    :cond_d
    iget-object v1, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mButtonVTAutoDropBack:Landroid/preference/Preference;

    if-ne p2, v1, :cond_6

    .line 327
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/MultipleSimActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 328
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v1, "INIT_FEATURE_NAME"

    const-string v2, "VT"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 329
    const-string v1, "INIT_SIM_ID"

    iget-object v2, p0, Lcom/mediatek/settings/VTAdvancedSettingEx;->mSimIds:[J

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    .line 330
    const-string v1, "INIT_TITLE_NAME"

    const v2, 0x7f0d004c

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 331
    const-string v1, "ITEM_TYPE"

    const-string v2, "CheckBoxPreference"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 332
    const-string v1, "INIT_BASE_KEY"

    const-string v2, "button_vt_auto_dropback_key@"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 333
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 180
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 181
    invoke-direct {p0}, Lcom/mediatek/settings/VTAdvancedSettingEx;->setScreenEnabled()V

    .line 182
    return-void
.end method
