.class public Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;
.super Lcom/mediatek/oobe/basic/gemini/SimManagement;
.source "SubSimManagementSettings.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SubSimManagementSettings"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/mediatek/oobe/basic/gemini/SimManagement;-><init>()V

    return-void
.end method

.method private logd(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SubSimManagementSettings  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/OOBEConstants;->logd(Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SubSimManagementSettings  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/oobe/utils/OOBEConstants;->loge(Ljava/lang/String;)V

    .line 126
    return-void
.end method


# virtual methods
.method protected initDefaultSimPreference()V
    .locals 1

    .prologue
    .line 93
    const-string v0, "initDefaultSimPreference(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 94
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 9
    .parameter "savedInstanceState"

    .prologue
    .line 60
    const-string v6, "-->onActivityCreated"

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 61
    invoke-super {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->onActivityCreated(Landroid/os/Bundle;)V

    .line 63
    invoke-virtual {p0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 65
    .local v3, screen:Landroid/preference/PreferenceScreen;
    const-string v6, "default_sim"

    invoke-virtual {p0, v6}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 66
    const-string v6, "general_settings"

    invoke-virtual {p0, v6}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 68
    const-string v6, "sim_info"

    invoke-virtual {p0, v6}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    check-cast v5, Landroid/preference/PreferenceGroup;

    .line 69
    .local v5, simInfoCategory:Landroid/preference/PreferenceGroup;
    const/4 v1, 0x0

    .line 70
    .local v1, infoPref:Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;
    if-eqz v5, :cond_2

    .line 71
    invoke-virtual {v5}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    .line 72
    .local v4, simCount:I
    const-string v6, "SubSimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, " SimInfoListCategory children count="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    add-int/lit8 v0, v4, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_1

    .line 75
    const-string v6, "SubSimManagementSettings"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "i="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual {v5, v0}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 77
    .local v2, pref:Landroid/preference/Preference;
    instance-of v6, v2, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    if-eqz v6, :cond_0

    move-object v1, v2

    .line 79
    check-cast v1, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;

    .line 80
    const/4 v6, 0x0

    invoke-virtual {v1, v6}, Lcom/mediatek/oobe/basic/gemini/SimInfoPreference;->setNeedCheckBox(Z)V

    .line 81
    invoke-virtual {v3, v2}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 74
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 85
    .end local v2           #pref:Landroid/preference/Preference;
    :cond_1
    invoke-virtual {v3, v5}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 87
    .end local v0           #i:I
    .end local v4           #simCount:I
    :cond_2
    const-string v6, "<--onActivityCreated"

    invoke-direct {p0, v6}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 88
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 53
    const-string v0, "-->onCreate()"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 54
    invoke-super {p0, p1}, Lcom/mediatek/oobe/basic/gemini/SimManagement;->onCreate(Landroid/os/Bundle;)V

    .line 55
    const-string v0, "<--onCreate()"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method protected updateDefaultSimInfo(J)V
    .locals 1
    .parameter "simID"

    .prologue
    .line 105
    const-string v0, "updateDefaultSimInfo(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 106
    return-void
.end method

.method protected updateDefaultSimItemList(I)V
    .locals 1
    .parameter "type"

    .prologue
    .line 110
    const-string v0, "updateDefaultSimItemList(1), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method protected updateDefaultSimState(II)V
    .locals 1
    .parameter "slotID"
    .parameter "state"

    .prologue
    .line 99
    const-string v0, "updateDefaultSimState(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 100
    return-void
.end method

.method protected updateGprsSettings()V
    .locals 1

    .prologue
    .line 116
    const-string v0, "updateGprsSettings(), prevent default action for oobe"

    invoke-direct {p0, v0}, Lcom/mediatek/oobe/basic/gemini/SubSimManagementSettings;->logd(Ljava/lang/String;)V

    .line 117
    return-void
.end method
