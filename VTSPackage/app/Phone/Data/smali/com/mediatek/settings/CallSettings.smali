.class public Lcom/mediatek/settings/CallSettings;
.super Landroid/preference/PreferenceActivity;
.source "CallSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/settings/CallSettings$SIMInfoComparable;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "Settings/CallSettings"

.field private static final MD_CAPABILITY_SLOT_1:Ljava/lang/String; = "gsm.baseband.capability"

.field private static final MD_CAPABILITY_SLOT_2:Ljava/lang/String; = "gsm.baseband.capability2"

.field private static final MD_CAPABILITY_SLOT_3:Ljava/lang/String; = "gsm.baseband.capability3"

.field private static final MD_CAPABILITY_SLOT_4:Ljava/lang/String; = "gsm.baseband.capability4"

.field public static final MODEM_3G:I = 0x3


# instance fields
.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field mSipCallSetting:Landroid/preference/Preference;

.field mVTSetting:Landroid/preference/Preference;

.field mVoiceSetting:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 44
    iput-object v0, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    .line 45
    iput-object v0, p0, Lcom/mediatek/settings/CallSettings;->mVoiceSetting:Landroid/preference/Preference;

    .line 46
    iput-object v0, p0, Lcom/mediatek/settings/CallSettings;->mSipCallSetting:Landroid/preference/Preference;

    .line 48
    new-instance v0, Lcom/mediatek/settings/CallSettings$1;

    invoke-direct {v0, p0}, Lcom/mediatek/settings/CallSettings$1;-><init>(Lcom/mediatek/settings/CallSettings;)V

    iput-object v0, p0, Lcom/mediatek/settings/CallSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/mediatek/settings/CallSettings;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/mediatek/settings/CallSettings;->setScreenEnabled()V

    return-void
.end method

.method public static get3GSimCardSlots(Landroid/app/Activity;)[I
    .locals 8
    .parameter "activity"

    .prologue
    .line 189
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v4, simIds:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v6

    .line 197
    .local v6, siminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 198
    .local v5, simInfo:Landroid/provider/Telephony$SIMInfo;
    iget v7, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v7}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v0

    .line 199
    .local v0, baseband:I
    const/4 v7, 0x3

    if-le v0, v7, :cond_0

    .line 200
    iget v7, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 204
    .end local v0           #baseband:I
    .end local v5           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    new-array v3, v7, [I

    .line 205
    .local v3, md3GIds:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_2

    .line 206
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aput v7, v3, v1

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 208
    :cond_2
    return-object v3
.end method

.method public static get3GSimCards(Landroid/app/Activity;)[J
    .locals 9
    .parameter "activity"

    .prologue
    .line 166
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .local v4, simIds:Ljava/util/List;,"Ljava/util/List<Ljava/lang/Long;>;"
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v6

    .line 174
    .local v6, siminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/provider/Telephony$SIMInfo;

    .line 175
    .local v5, simInfo:Landroid/provider/Telephony$SIMInfo;
    iget v7, v5, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v7}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v0

    .line 176
    .local v0, baseband:I
    const/4 v7, 0x3

    if-le v0, v7, :cond_0

    .line 177
    iget-wide v7, v5, Landroid/provider/Telephony$SIMInfo;->mSimId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 181
    .end local v0           #baseband:I
    .end local v5           #simInfo:Landroid/provider/Telephony$SIMInfo;
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    new-array v3, v7, [J

    .line 182
    .local v3, md3GIds:[J
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_2

    .line 183
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    aput-wide v7, v3, v1

    .line 182
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 185
    :cond_2
    return-object v3
.end method

.method public static getBaseband(I)I
    .locals 7
    .parameter "slot"

    .prologue
    .line 212
    const/4 v3, 0x0

    .line 213
    .local v3, propertyKey:Ljava/lang/String;
    packed-switch p0, :pswitch_data_0

    .line 229
    :goto_0
    const/4 v0, 0x0

    .line 231
    .local v0, baseband:I
    :try_start_0
    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 232
    .local v1, capability:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 233
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 238
    .end local v1           #capability:Ljava/lang/String;
    :cond_0
    :goto_1
    const-string v4, "Settings/CallSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[slot = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    const-string v4, "Settings/CallSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[propertyKey = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    const-string v4, "Settings/CallSettings"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[baseband = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    return v0

    .line 215
    .end local v0           #baseband:I
    :pswitch_0
    const-string v3, "gsm.baseband.capability"

    .line 216
    goto :goto_0

    .line 218
    :pswitch_1
    const-string v3, "gsm.baseband.capability2"

    .line 219
    goto :goto_0

    .line 221
    :pswitch_2
    const-string v3, "gsm.baseband.capability3"

    .line 222
    goto :goto_0

    .line 224
    :pswitch_3
    const-string v3, "gsm.baseband.capability4"

    .line 225
    goto :goto_0

    .line 235
    .restart local v0       #baseband:I
    :catch_0
    move-exception v2

    .line 236
    .local v2, e:Ljava/lang/NumberFormatException;
    const-string v4, "Settings/CallSettings"

    const-string v5, "get base band error"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 213
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static goToMobileNetworkSettings(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 245
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/android/phone/MobileNetworkSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 246
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 247
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 248
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 249
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 250
    return-void
.end method

.method public static goToOthersSettings(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 158
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/OthersSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 159
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 160
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 161
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 162
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 163
    return-void
.end method

.method public static goUpToTopLevelSetting(Landroid/app/Activity;)V
    .locals 2
    .parameter "activity"

    .prologue
    .line 150
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mediatek/settings/CallSettings;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 151
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 152
    const/high16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 153
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 154
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 155
    return-void
.end method

.method public static isMultipleSim()Z
    .locals 1

    .prologue
    .line 128
    const/4 v0, 0x1

    return v0
.end method

.method private isOnlyVt()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 270
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    .line 271
    .local v0, siminfoList:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v2, :cond_0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/provider/Telephony$SIMInfo;

    iget v1, v1, Landroid/provider/Telephony$SIMInfo;->mSlot:I

    invoke-static {v1}, Lcom/mediatek/settings/CallSettings;->getBaseband(I)I

    move-result v1

    const/4 v4, 0x3

    if-le v1, v4, :cond_0

    move v1, v2

    :goto_0
    return v1

    :cond_0
    move v1, v3

    goto :goto_0
.end method

.method public static isRadioOn(I)Z
    .locals 5
    .parameter "slot"

    .prologue
    .line 137
    const/4 v1, 0x0

    .line 138
    .local v1, isRadioOn:Z
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    .line 139
    .local v2, phone:Lcom/android/internal/telephony/Phone;
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_0

    instance-of v3, v2, Lcom/android/internal/telephony/gemini/GeminiPhone;

    if-eqz v3, :cond_0

    move-object v0, v2

    .line 140
    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 141
    .local v0, dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/gemini/GeminiPhone;->isRadioOnGemini(I)Z

    move-result v1

    .line 146
    .end local v0           #dualPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;
    :goto_0
    return v1

    .line 143
    :cond_0
    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/ServiceState;->getState()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_1

    const/4 v1, 0x1

    :goto_1
    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private setScreenEnabled()V
    .locals 7

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 253
    invoke-static {p0}, Landroid/provider/Telephony$SIMInfo;->getInsertedSIMList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    .line 254
    .local v1, insertSim:Ljava/util/List;,"Ljava/util/List<Landroid/provider/Telephony$SIMInfo;>;"
    invoke-static {}, Lcom/mediatek/settings/CallSettings;->isMultipleSim()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 255
    invoke-static {p0}, Lcom/mediatek/settings/CallSettings;->get3GSimCardSlots(Landroid/app/Activity;)[I

    move-result-object v2

    .line 256
    .local v2, simIds:[I
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    if-eqz v3, :cond_0

    .line 257
    iget-object v6, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    array-length v3, v2

    if-lez v3, :cond_1

    move v3, v4

    :goto_0
    invoke-virtual {v6, v3}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 259
    :cond_0
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVoiceSetting:Landroid/preference/Preference;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_2

    :goto_1
    invoke-virtual {v3, v4}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 267
    .end local v2           #simIds:[I
    :goto_2
    return-void

    .restart local v2       #simIds:[I
    :cond_1
    move v3, v5

    .line 257
    goto :goto_0

    :cond_2
    move v4, v5

    .line 259
    goto :goto_1

    .line 261
    .end local v2           #simIds:[I
    :cond_3
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->hasIccCard()Z

    move-result v0

    .line 262
    .local v0, hasSimCard:Z
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    if-eqz v3, :cond_4

    .line 263
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 265
    :cond_4
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVoiceSetting:Landroid/preference/Preference;

    invoke-virtual {v3, v0}, Landroid/preference/Preference;->setEnabled(Z)V

    goto :goto_2
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "icicle"

    .prologue
    .line 68
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 69
    const v3, 0x7f060001

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/CallSettings;->addPreferencesFromResource(I)V

    .line 70
    const-string v3, "button_vedio_call_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/CallSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    .line 71
    const-string v3, "button_voice_call_key"

    invoke-virtual {p0, v3}, Lcom/mediatek/settings/CallSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    iput-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVoiceSetting:Landroid/preference/Preference;

    .line 73
    invoke-static {}, Lcom/android/phone/PhoneUtils;->isVoipSupported()Z

    move-result v2

    .line 74
    .local v2, voipSupported:Z
    if-eqz v2, :cond_1

    .line 80
    :goto_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 81
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    .line 84
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SIM_INFO_UPDATE"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 85
    .local v1, intentFilter:Landroid/content/IntentFilter;
    iget-object v3, p0, Lcom/mediatek/settings/CallSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v3, v1}, Lcom/mediatek/settings/CallSettings;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 87
    invoke-virtual {p0}, Lcom/mediatek/settings/CallSettings;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    .line 88
    .local v0, actionBar:Landroid/app/ActionBar;
    if-eqz v0, :cond_0

    .line 90
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 92
    :cond_0
    return-void

    .line 75
    .end local v0           #actionBar:Landroid/app/ActionBar;
    .end local v1           #intentFilter:Landroid/content/IntentFilter;
    :cond_1
    invoke-virtual {p0}, Lcom/mediatek/settings/CallSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    const-string v4, "button_internet_call_key"

    invoke-virtual {p0, v4}, Lcom/mediatek/settings/CallSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 132
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 133
    iget-object v0, p0, Lcom/mediatek/settings/CallSettings;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallSettings;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 134
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 96
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 97
    .local v0, itemId:I
    packed-switch v0, :pswitch_data_0

    .line 104
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    :goto_0
    return v1

    .line 99
    :pswitch_0
    invoke-virtual {p0}, Lcom/mediatek/settings/CallSettings;->finish()V

    .line 100
    const/4 v1, 0x1

    goto :goto_0

    .line 97
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 108
    iget-object v1, p0, Lcom/mediatek/settings/CallSettings;->mVTSetting:Landroid/preference/Preference;

    if-ne p2, v1, :cond_1

    .line 109
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 110
    .local v0, intent:Landroid/content/Intent;
    invoke-direct {p0}, Lcom/mediatek/settings/CallSettings;->isOnlyVt()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 111
    const-class v1, Lcom/mediatek/settings/VTAdvancedSetting;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 115
    :goto_0
    invoke-virtual {p0, v0}, Lcom/mediatek/settings/CallSettings;->startActivity(Landroid/content/Intent;)V

    .line 116
    const/4 v1, 0x1

    .line 118
    .end local v0           #intent:Landroid/content/Intent;
    :goto_1
    return v1

    .line 113
    .restart local v0       #intent:Landroid/content/Intent;
    :cond_0
    const-class v1, Lcom/mediatek/settings/VTAdvancedSettingEx;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    goto :goto_0

    .line 118
    .end local v0           #intent:Landroid/content/Intent;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 123
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onResume()V

    .line 124
    invoke-direct {p0}, Lcom/mediatek/settings/CallSettings;->setScreenEnabled()V

    .line 125
    return-void
.end method
