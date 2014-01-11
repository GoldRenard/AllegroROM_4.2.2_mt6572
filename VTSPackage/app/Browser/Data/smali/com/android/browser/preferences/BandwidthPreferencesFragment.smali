.class public Lcom/android/browser/preferences/BandwidthPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "BandwidthPreferencesFragment.java"


# static fields
.field static final TAG:Ljava/lang/String; = "BandwidthPreferencesFragment"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .parameter "savedInstanceState"

    .prologue
    .line 35
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v0, 0x7f060003

    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/BandwidthPreferencesFragment;->addPreferencesFromResource(I)V

    .line 38
    return-void
.end method

.method public onResume()V
    .locals 5

    .prologue
    .line 42
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 43
    invoke-virtual {p0}, Lcom/android/browser/preferences/BandwidthPreferencesFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    .line 44
    .local v0, prefScreen:Landroid/preference/PreferenceScreen;
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v3

    .line 45
    .local v3, sharedPrefs:Landroid/content/SharedPreferences;
    const-string v4, "preload_when"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 47
    const-string v4, "preload_when"

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/ListPreference;

    .line 49
    .local v2, preload:Landroid/preference/ListPreference;
    if-eqz v2, :cond_0

    .line 50
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getDefaultPreloadSetting()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 53
    .end local v2           #preload:Landroid/preference/ListPreference;
    :cond_0
    const-string v4, "link_prefetch_when"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 55
    const-string v4, "link_prefetch_when"

    invoke-virtual {v0, v4}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/ListPreference;

    .line 57
    .local v1, prefetch:Landroid/preference/ListPreference;
    if-eqz v1, :cond_1

    .line 58
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/browser/BrowserSettings;->getDefaultLinkPrefetchSetting()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 61
    .end local v1           #prefetch:Landroid/preference/ListPreference;
    :cond_1
    return-void
.end method
