.class public Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "PrivacySecurityPreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 42
    const v2, 0x7f06000c

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->addPreferencesFromResource(I)V

    .line 44
    const-string v2, "privacy_clear_history"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 45
    .local v0, e:Landroid/preference/Preference;
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 49
    const-string v2, "notification_state"

    invoke-virtual {p0, v2}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 50
    .local v1, notificationState:Landroid/preference/Preference;
    if-eqz v1, :cond_0

    .line 51
    invoke-virtual {v1, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 52
    check-cast v1, Landroid/preference/ListPreference;

    .end local v1           #notificationState:Landroid/preference/Preference;
    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->updateListPreferenceSummary(Landroid/preference/ListPreference;)V

    .line 61
    :cond_0
    return-void
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 7
    .parameter "pref"
    .parameter "objValue"

    .prologue
    const/4 v2, 0x1

    .line 70
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v3, "privacy_clear_history"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-ne v1, v2, :cond_0

    .line 74
    invoke-virtual {p0}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v3, -0x1

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    const-string v5, "android.intent.extra.TEXT"

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    move v1, v2

    .line 90
    .end local p2
    :goto_0
    return v1

    .line 81
    .restart local p2
    :cond_0
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    const-string v3, "notification_state"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p1

    .line 82
    check-cast v0, Landroid/preference/ListPreference;

    .line 83
    .local v0, localListPreference:Landroid/preference/ListPreference;
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {v0, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/PrivacySecurityPreferencesFragment;->updateListPreferenceSummary(Landroid/preference/ListPreference;)V

    move v1, v2

    .line 85
    goto :goto_0

    .line 90
    .end local v0           #localListPreference:Landroid/preference/ListPreference;
    .restart local p2
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 65
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 66
    return-void
.end method

.method updateListPreferenceSummary(Landroid/preference/ListPreference;)V
    .locals 1
    .parameter "listPreference"

    .prologue
    .line 95
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 96
    return-void
.end method
