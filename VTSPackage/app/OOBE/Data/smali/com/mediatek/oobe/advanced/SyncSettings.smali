.class public Lcom/mediatek/oobe/advanced/SyncSettings;
.super Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;
.source "SyncSettings.java"


# static fields
.field private static final SYNC_SWITCH_PREF:Ljava/lang/String; = "sync_pref"

.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mAutoSyncPref:Landroid/preference/SwitchPreference;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getStepSpecialTag()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    const-string v0, "SyncSettingsActivity"

    return-object v0
.end method

.method protected initSpecialLayout(II)V
    .locals 2
    .parameter "titleRes"
    .parameter "summaryRes"

    .prologue
    .line 69
    const v0, 0x7f090075

    const v1, 0x7f090076

    invoke-super {p0, v0, v1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->initSpecialLayout(II)V

    .line 70
    iget v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mStepIndex:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 72
    iget-object v0, p0, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->mBackBtn:Landroid/widget/Button;

    const v1, 0x7f09004c

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 75
    :cond_0
    const-string v0, "sync_pref"

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/SyncSettings;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/SwitchPreference;

    iput-object v0, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    .line 76
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 59
    invoke-super {p0, p1}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    const v0, 0x7f050006

    invoke-virtual {p0, v0}, Lcom/mediatek/oobe/advanced/SyncSettings;->addPreferencesFromResource(I)V

    .line 63
    const v0, 0x7f090078

    const v1, 0x7f090079

    invoke-virtual {p0, v0, v1}, Lcom/mediatek/oobe/advanced/SyncSettings;->initSpecialLayout(II)V

    .line 65
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 5
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 87
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    if-ne p2, v2, :cond_1

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    invoke-virtual {v2}, Landroid/preference/SwitchPreference;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 88
    const-string v0, "OOBE"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    invoke-virtual {v3}, Landroid/preference/SwitchPreference;->isChecked()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    invoke-static {v1}, Landroid/content/ContentResolver;->setMasterSyncAutomatically(Z)V

    :goto_0
    move v0, v1

    .line 97
    :cond_0
    return v0

    .line 91
    :cond_1
    iget-object v2, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    if-ne p2, v2, :cond_0

    iget-object v2, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    invoke-virtual {v2}, Landroid/preference/SwitchPreference;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    .line 92
    const-string v2, "OOBE"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    invoke-virtual {v4}, Landroid/preference/SwitchPreference;->isChecked()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-static {v0}, Landroid/content/ContentResolver;->setMasterSyncAutomatically(Z)V

    goto :goto_0
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 80
    invoke-super {p0}, Lcom/mediatek/oobe/utils/OOBEStepPreferenceActivity;->onResume()V

    .line 81
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    .line 82
    .local v0, masterSyncAutomatically:Z
    iget-object v1, p0, Lcom/mediatek/oobe/advanced/SyncSettings;->mAutoSyncPref:Landroid/preference/SwitchPreference;

    invoke-virtual {v1, v0}, Landroid/preference/SwitchPreference;->setChecked(Z)V

    .line 83
    return-void
.end method
