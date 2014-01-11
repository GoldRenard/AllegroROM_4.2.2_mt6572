.class public Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;
.super Lcom/mediatek/oobe/basic/gemini/SimManagement;
.source "SubDefaultSimSettings.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SubDefaultSimSettings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;-><init>()V

    return-void
.end method

.method private logd(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 129
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SubDefaultSimSettings - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/OOBEConstants;->logd(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SubDefaultSimSettings - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/OOBEConstants;->loge(Ljava/lang/String;)V

    .line 134
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 10
    .parameter "savedInstanceState"

    .prologue
    .line 61
    const-string v8, "-->onActivityCreated"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 62
    invoke-super {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->onActivityCreated(Landroid/os/Bundle;)V

    .line 64
    const/4 v2, 0x1

    .line 65
    .local v2, sIsVoiceCapable:Z
    const-string v8, "phone"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 66
    .local v5, telephony:Landroid/telephony/TelephonyManager;
    if-eqz v5, :cond_0

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->isVoiceCapable()Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v2, 0x1

    .line 67
    :goto_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "VoiceCapable :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 69
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 71
    .local v3, screen:Landroid/preference/PreferenceScreen;
    const-string v8, "sim_info"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 72
    const-string v8, "general_settings"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 74
    const-string v8, "default_sim"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceGroup;

    .line 75
    .local v0, defaultGroup:Landroid/preference/PreferenceGroup;
    const-string v8, "sms_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v4

    .line 76
    .local v4, smsCallPref:Landroid/preference/Preference;
    const-string v8, "gprs_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 77
    .local v1, gprsCallPref:Landroid/preference/Preference;
    const-string v8, "voice_call_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    .line 78
    .local v7, voiceCallPref:Landroid/preference/Preference;
    const-string v8, "video_call_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    .line 80
    .local v6, videoCallPref:Landroid/preference/Preference;
    if-eqz v2, :cond_3

    .line 81
    if-eqz v7, :cond_1

    .line 82
    invoke-virtual {v3, v7}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 86
    :goto_1
    if-eqz v6, :cond_2

    .line 87
    invoke-virtual {v3, v6}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 97
    :goto_2
    if-eqz v4, :cond_4

    .line 98
    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 102
    :goto_3
    if-eqz v1, :cond_5

    .line 103
    invoke-virtual {v3, v1}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 108
    :goto_4
    if-eqz v0, :cond_6

    .line 109
    invoke-virtual {v3, v0}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 113
    :goto_5
    const-string v8, "<--onActivityCreated"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 114
    return-void

    .line 66
    .end local v0           #defaultGroup:Landroid/preference/PreferenceGroup;
    .end local v1           #gprsCallPref:Landroid/preference/Preference;
    .end local v3           #screen:Landroid/preference/PreferenceScreen;
    .end local v4           #smsCallPref:Landroid/preference/Preference;
    .end local v6           #videoCallPref:Landroid/preference/Preference;
    .end local v7           #voiceCallPref:Landroid/preference/Preference;
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 84
    .restart local v0       #defaultGroup:Landroid/preference/PreferenceGroup;
    .restart local v1       #gprsCallPref:Landroid/preference/Preference;
    .restart local v3       #screen:Landroid/preference/PreferenceScreen;
    .restart local v4       #smsCallPref:Landroid/preference/Preference;
    .restart local v6       #videoCallPref:Landroid/preference/Preference;
    .restart local v7       #voiceCallPref:Landroid/preference/Preference;
    :cond_1
    const-string v8, "voiceCallPref is null"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->loge(Ljava/lang/String;)V

    goto :goto_1

    .line 89
    :cond_2
    const-string v8, "videoCallPref is null"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->loge(Ljava/lang/String;)V

    goto :goto_2

    .line 92
    :cond_3
    const-string v8, "voice_call_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 93
    const-string v8, "video_call_sim_setting"

    invoke-virtual {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 94
    const-string v8, "3GDataSMS doesn\'t need voice and video"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    goto :goto_2

    .line 100
    :cond_4
    const-string v8, "smsCallPref is null"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->loge(Ljava/lang/String;)V

    goto :goto_3

    .line 105
    :cond_5
    const-string v8, "gprsCallPref is null"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->loge(Ljava/lang/String;)V

    goto :goto_4

    .line 111
    :cond_6
    const-string v8, "defaultGroup is null"

    invoke-direct {p0, v8}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->loge(Ljava/lang/String;)V

    goto :goto_5
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 54
    const-string v0, "-->onCreate()"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 55
    invoke-super {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->onCreate(Landroid/os/Bundle;)V

    .line 56
    const-string v0, "<--onCreate()"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method protected updateSimInfo(JI)V
    .locals 1
    .parameter "simID"
    .parameter "type"

    .prologue
    .line 124
    const-string v0, "updateSimInfo(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 125
    return-void
.end method

.method protected updateSimState(II)V
    .locals 1
    .parameter "slotID"
    .parameter "state"

    .prologue
    .line 118
    const-string v0, "updateSimState(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubDefaultSimSettings;->logd(Ljava/lang/String;)V

    .line 119
    return-void
.end method
