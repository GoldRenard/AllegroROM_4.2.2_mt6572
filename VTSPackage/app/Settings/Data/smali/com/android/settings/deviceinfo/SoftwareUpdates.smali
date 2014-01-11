.class public Lcom/android/settings/deviceinfo/SoftwareUpdates;
.super Landroid/preference/PreferenceActivity;
.source "SoftwareUpdates.java"


# static fields
.field private static final KEY_DMSW_UPDATE:Ljava/lang/String; = "software_update"

.field private static final KEY_SCOMO:Ljava/lang/String; = "scomo"

.field private static final KEY_SYSTEM_UPDATE_SETTINGS:Ljava/lang/String; = "system_update_settings"

.field private static final TAG:Ljava/lang/String; = "SoftwareUpdates"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 25
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    const v1, 0x7f050013

    invoke-virtual {p0, v1}, Lcom/android/settings/deviceinfo/SoftwareUpdates;->addPreferencesFromResource(I)V

    .line 27
    invoke-virtual {p0}, Lcom/android/settings/deviceinfo/SoftwareUpdates;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 28
    .local v0, parentPreference:Landroid/preference/PreferenceGroup;
    const-string v1, "system_update_settings"

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lcom/android/settings/Utils;->updatePreferenceToSpecificActivityOrRemove(Landroid/content/Context;Landroid/preference/PreferenceGroup;Ljava/lang/String;I)Z

    .line 32
    const-string v1, "SoftwareUpdates"

    const-string v2, "FeatureOption.MTK_FOTA_ENTRY=false removed!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    const-string v1, "software_update"

    invoke-virtual {p0, v1}, Lcom/android/settings/deviceinfo/SoftwareUpdates;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 37
    const-string v1, "SoftwareUpdates"

    const-string v2, "FeatureOption.MTK_SCOMO_ENTRY=false removed!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    const-string v1, "scomo"

    invoke-virtual {p0, v1}, Lcom/android/settings/deviceinfo/SoftwareUpdates;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 41
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 4
    .parameter "preferenceScreen"
    .parameter "preference"

    .prologue
    .line 46
    invoke-virtual {p2}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v2, "software_update"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 47
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 48
    .local v0, i:Landroid/content/Intent;
    const-string v1, "com.mediatek.DMSWUPDATE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    invoke-virtual {p0, v0}, Lcom/android/settings/deviceinfo/SoftwareUpdates;->sendBroadcast(Landroid/content/Intent;)V

    .line 50
    const-string v1, "SoftwareUpdates"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "software_update pressed with intent "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .end local v0           #i:Landroid/content/Intent;
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceActivity;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    move-result v1

    return v1
.end method
