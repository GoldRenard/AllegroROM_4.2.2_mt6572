.class public Lcom/android/settings/deviceinfo/ImeiInfoGemini;
.super Landroid/preference/PreferenceActivity;
.source "ImeiInfoGemini.java"


# static fields
.field private static final CDMA:Ljava/lang/String; = "CDMA"

.field private static final KEY_IMEI_SLOT1:Ljava/lang/String; = "imei_slot1"

.field private static final KEY_IMEI_SLOT2:Ljava/lang/String; = "imei_slot2"

.field private static final KEY_IMEI_SLOT3:Ljava/lang/String; = "imei_slot3"

.field private static final KEY_IMEI_SV_SLOT1:Ljava/lang/String; = "imei_sv_slot1"

.field private static final KEY_IMEI_SV_SLOT2:Ljava/lang/String; = "imei_sv_slot2"

.field private static final KEY_IMEI_SV_SLOT3:Ljava/lang/String; = "imei_sv_slot3"

.field private static final KEY_MEID_NUMBER_SLOT1:Ljava/lang/String; = "meid_number_slot1"

.field private static final KEY_MEID_NUMBER_SLOT2:Ljava/lang/String; = "meid_number_slot2"

.field private static final KEY_MEID_NUMBER_SLOT3:Ljava/lang/String; = "meid_number_slot3"

.field private static final KEY_MIN_NUMBER_SLOT1:Ljava/lang/String; = "min_number_slot1"

.field private static final KEY_MIN_NUMBER_SLOT2:Ljava/lang/String; = "min_number_slot2"

.field private static final KEY_MIN_NUMBER_SLOT3:Ljava/lang/String; = "min_number_slot3"

.field private static final KEY_PRL_VERSION_SLOT1:Ljava/lang/String; = "prl_version_slot1"

.field private static final KEY_PRL_VERSION_SLOT2:Ljava/lang/String; = "prl_version_slot2"

.field private static final KEY_PRL_VERSION_SLOT3:Ljava/lang/String; = "prl_version_slot3"

.field private static final TAG:Ljava/lang/String; = "ImeiInfoGemini"


# instance fields
.field private mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

.field private mParent:Landroid/preference/PreferenceScreen;

.field private mRemovablePref:Landroid/preference/Preference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    return-void
.end method

.method private removePreference(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "imeiKey"
    .parameter "imeiSvKey"
    .parameter "meidNumberKey"
    .parameter "minNumberKey"
    .parameter "prlVersionKey"

    .prologue
    .line 112
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 113
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 114
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 115
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 117
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 118
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 119
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 120
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 121
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 122
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 123
    return-void
.end method

.method private setSlotStatus()V
    .locals 7

    .prologue
    .line 57
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    .line 63
    const/4 v1, 0x0

    const-string v2, "imei_slot1"

    const-string v3, "imei_sv_slot1"

    const-string v4, "meid_number_slot1"

    const-string v5, "min_number_slot1"

    const-string v6, "prl_version_slot1"

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->showPreference(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const/4 v1, 0x1

    const-string v2, "imei_slot2"

    const-string v3, "imei_sv_slot2"

    const-string v4, "meid_number_slot2"

    const-string v5, "min_number_slot2"

    const-string v6, "prl_version_slot2"

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->showPreference(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const-string v1, "imei_slot3"

    const-string v2, "imei_sv_slot3"

    const-string v3, "meid_number_slot3"

    const-string v4, "min_number_slot3"

    const-string v5, "prl_version_slot3"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->removePreference(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    const-string v0, "ImeiInfoGemini"

    const-string v1, "MTK_GEMINI_3SIM_SUPPORT is false"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    return-void
.end method

.method private setSummaryText(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "preference"
    .parameter "text"

    .prologue
    .line 126
    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v1, p1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 128
    .local v0, p:Landroid/preference/Preference;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0b026c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 133
    :goto_0
    return-void

    .line 131
    :cond_0
    invoke-virtual {v0, p2}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method private showPreference(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "slotId"
    .parameter "imeiKey"
    .parameter "imeiSvKey"
    .parameter "meidNumberKey"
    .parameter "minNumberKey"
    .parameter "prlVersionKey"

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getPhoneNameGemini(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CDMA"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getMeidGemini(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p4, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSummaryText(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCdmaMinGemini(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p5, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSummaryText(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getCdmaPrlVersionGemini(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p6, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSummaryText(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p2}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 92
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 93
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p3}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 94
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 107
    :goto_0
    return-void

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getDeviceIdGemini(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSummaryText(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/gemini/GeminiPhone;->getDeviceSvnGemini(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p3, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSummaryText(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p6}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 101
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 102
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 103
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 104
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    invoke-virtual {v0, p5}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    .line 105
    iget-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mParent:Landroid/preference/PreferenceScreen;

    iget-object v1, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mRemovablePref:Landroid/preference/Preference;

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "icicle"

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const v0, 0x7f05000f

    invoke-virtual {p0, v0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->addPreferencesFromResource(I)V

    .line 46
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/gemini/GeminiPhone;

    iput-object v0, p0, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->mGeminiPhone:Lcom/android/internal/telephony/gemini/GeminiPhone;

    .line 48
    invoke-direct {p0}, Lcom/android/settings/deviceinfo/ImeiInfoGemini;->setSlotStatus()V

    .line 49
    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 53
    invoke-super {p0}, Landroid/preference/PreferenceActivity;->onDestroy()V

    .line 54
    return-void
.end method
