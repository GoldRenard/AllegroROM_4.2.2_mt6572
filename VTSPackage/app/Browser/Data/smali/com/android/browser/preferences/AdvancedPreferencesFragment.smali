.class public Lcom/android/browser/preferences/AdvancedPreferencesFragment;
.super Landroid/preference/PreferenceFragment;
.source "AdvancedPreferencesFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# static fields
.field private static final FILEMANAGER_EXTRA_NAME:Ljava/lang/String; = "download path"

.field private static final RESULT_CODE_START_FILEMANAGER:I = 0x3e8

.field private static final XLOG:Ljava/lang/String; = "browser/AdvancedPreferencesFragment"


# instance fields
.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method

.method private clickDownloadDirectorySetting()Landroid/preference/Preference$OnPreferenceClickListener;
    .locals 1

    .prologue
    .line 138
    new-instance v0, Lcom/android/browser/preferences/AdvancedPreferencesFragment$1;

    invoke-direct {v0, p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment$1;-><init>(Lcom/android/browser/preferences/AdvancedPreferencesFragment;)V

    return-object v0
.end method

.method private downloadPreference()V
    .locals 8

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 117
    .local v4, pm:Landroid/content/pm/PackageManager;
    const/4 v3, 0x0

    .line 119
    .local v3, packageInfo:Landroid/content/pm/PackageInfo;
    :try_start_0
    const-string v5, "com.mediatek.filemanager"

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 120
    if-eqz v3, :cond_0

    .line 121
    const v5, 0x7f060007

    invoke-virtual {p0, v5}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->addPreferencesFromResource(I)V

    .line 122
    const-string v5, "download_directory_setting"

    invoke-virtual {p0, v5}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    check-cast v1, Landroid/preference/PreferenceScreen;

    .line 124
    .local v1, downloadDirectorySetting:Landroid/preference/PreferenceScreen;
    invoke-direct {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->clickDownloadDirectorySetting()Landroid/preference/Preference$OnPreferenceClickListener;

    move-result-object v5

    invoke-virtual {v1, v5}, Landroid/preference/PreferenceScreen;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 127
    invoke-virtual {v1}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v5

    const-string v6, "download_directory_setting"

    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/browser/BrowserSettings;->getDefaultDownloadPathWithMultiSDcard()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, downloadDir:Ljava/lang/String;
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->setSummary(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 135
    .end local v0           #downloadDir:Ljava/lang/String;
    .end local v1           #downloadDirectorySetting:Landroid/preference/PreferenceScreen;
    :cond_0
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v2

    .line 133
    .local v2, exception:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v5, "browser/AdvancedPreferencesFragment"

    const-string v6, "occur NameNotFoundException"

    invoke-static {v5, v6}, Lcom/mediatek/xlog/Xlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getVisualDefaultZoomName(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 7
    .parameter "enumName"

    .prologue
    .line 255
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 256
    .local v3, res:Landroid/content/res/Resources;
    const v5, 0x7f08006f

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v4

    .line 257
    .local v4, visualNames:[Ljava/lang/CharSequence;
    const v5, 0x7f080070

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v0

    .line 260
    .local v0, enumNames:[Ljava/lang/CharSequence;
    array-length v5, v4

    array-length v6, v0

    if-eq v5, v6, :cond_0

    .line 261
    const-string v5, ""

    .line 271
    :goto_0
    return-object v5

    .line 264
    :cond_0
    array-length v2, v0

    .line 265
    .local v2, length:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 266
    aget-object v5, v0, v1

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 267
    aget-object v5, v4, v1

    goto :goto_0

    .line 265
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 271
    :cond_2
    const-string v5, ""

    goto :goto_0
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .parameter "requestCode"
    .parameter "resultCode"
    .parameter "data"

    .prologue
    .line 154
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 157
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v4

    iput-object v4, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 158
    iget-object v4, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v4}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldProcessResultForFileManager()Z

    move-result v4

    if-eqz v4, :cond_0

    const/16 v4, 0x3e8

    if-ne p1, v4, :cond_0

    .line 159
    const/4 v4, -0x1

    if-ne p2, v4, :cond_0

    if-eqz p3, :cond_0

    .line 160
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 161
    .local v3, extras:Landroid/os/Bundle;
    if-eqz v3, :cond_0

    .line 162
    const-string v4, "download path"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, downloadPath:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 165
    const-string v4, "download_directory_setting"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    .line 167
    .local v0, downloadDirectorySetting:Landroid/preference/PreferenceScreen;
    invoke-virtual {v0}, Landroid/preference/PreferenceScreen;->getEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 168
    .local v2, ed:Landroid/content/SharedPreferences$Editor;
    const-string v4, "download_directory_setting"

    invoke-interface {v2, v4, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 169
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 171
    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setSummary(Ljava/lang/CharSequence;)V

    .line 179
    .end local v0           #downloadDirectorySetting:Landroid/preference/PreferenceScreen;
    .end local v1           #downloadPath:Ljava/lang/String;
    .end local v2           #ed:Landroid/content/SharedPreferences$Editor;
    .end local v3           #extras:Landroid/os/Bundle;
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .parameter "savedInstanceState"

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v4

    iput-object v4, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 62
    iget-object v4, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v4}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldLoadCustomerAdvancedXml()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 63
    const v4, 0x7f060002

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->addPreferencesFromResource(I)V

    .line 68
    :goto_0
    const-string v4, "search_engine"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceScreen;

    .line 70
    .local v2, searchEngineSettings:Landroid/preference/PreferenceScreen;
    const-class v4, Lcom/android/browser/preferences/SearchEngineSettings;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/preference/PreferenceScreen;->setFragment(Ljava/lang/String;)V

    .line 72
    const-string v4, "website_settings"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceScreen;

    .line 74
    .local v3, websiteSettings:Landroid/preference/PreferenceScreen;
    const-class v4, Lcom/android/browser/preferences/WebsiteSettingsFragment;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->setFragment(Ljava/lang/String;)V

    .line 76
    const-string v4, "default_zoom"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 77
    .local v0, e:Landroid/preference/Preference;
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 78
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "default_zoom"

    const/4 v6, 0x0

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getVisualDefaultZoomName(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 82
    const-string v4, "default_text_encoding"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 85
    iget-object v5, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-object v4, v0

    check-cast v4, Landroid/preference/ListPreference;

    invoke-interface {v5, v4}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->setTextEncodingChoices(Landroid/preference/ListPreference;)V

    .line 89
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v4

    invoke-virtual {v4}, Landroid/preference/PreferenceScreen;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "default_text_encoding"

    const-string v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 91
    .local v1, encoding:Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "auto-detector"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 92
    const/high16 v4, 0x7f0c

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 94
    :cond_0
    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    .line 97
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 99
    const-string v4, "reset_default_preferences"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 100
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 102
    const-string v4, "search_engine"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 103
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 105
    const-string v4, "plugin_state"

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 106
    invoke-virtual {v0, p0}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 107
    check-cast v0, Landroid/preference/ListPreference;

    .end local v0           #e:Landroid/preference/Preference;
    invoke-virtual {p0, v0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->updateListPreferenceSummary(Landroid/preference/ListPreference;)V

    .line 109
    iget-object v4, p0, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v4}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldDownloadPreference()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 110
    invoke-direct {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->downloadPreference()V

    .line 113
    :cond_1
    return-void

    .line 65
    .end local v1           #encoding:Ljava/lang/String;
    .end local v2           #searchEngineSettings:Landroid/preference/PreferenceScreen;
    .end local v3           #websiteSettings:Landroid/preference/PreferenceScreen;
    :cond_2
    const v4, 0x7f060001

    invoke-virtual {p0, v4}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->addPreferencesFromResource(I)V

    goto/16 :goto_0
.end method

.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 9
    .parameter "pref"
    .parameter "objValue"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 217
    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-nez v5, :cond_1

    .line 220
    const-string v4, "PageContentPreferencesFragment"

    const-string v5, "onPreferenceChange called from detached fragment!"

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    .end local p2
    :cond_0
    :goto_0
    return v3

    .line 224
    .restart local p2
    :cond_1
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    const-string v6, "default_zoom"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 225
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-direct {p0, p2}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getVisualDefaultZoomName(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    move v3, v4

    .line 226
    goto :goto_0

    .line 227
    .restart local p2
    :cond_2
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    const-string v6, "default_text_encoding"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 229
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, encoding:Ljava/lang/String;
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "auto-detector"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 231
    const/high16 v3, 0x7f0c

    invoke-virtual {p0, v3}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 233
    :cond_3
    invoke-virtual {p1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    move v3, v4

    .line 236
    goto :goto_0

    .line 237
    .end local v0           #encoding:Ljava/lang/String;
    :cond_4
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v5

    const-string v6, "reset_default_preferences"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    move-object v2, p2

    .line 238
    check-cast v2, Ljava/lang/Boolean;

    .line 239
    .local v2, value:Ljava/lang/Boolean;
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 240
    new-instance v3, Landroid/content/Intent;

    const-string v5, "--restart--"

    const/4 v6, 0x0

    invoke-virtual {p0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const-class v8, Lcom/android/browser/BrowserActivity;

    invoke-direct {v3, v5, v6, v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->startActivity(Landroid/content/Intent;)V

    move v3, v4

    .line 242
    goto :goto_0

    .line 244
    .end local v2           #value:Ljava/lang/Boolean;
    :cond_5
    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "plugin_state"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {p1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "search_engine"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :cond_6
    move-object v1, p1

    .line 246
    check-cast v1, Landroid/preference/ListPreference;

    .line 247
    .local v1, lp:Landroid/preference/ListPreference;
    check-cast p2, Ljava/lang/String;

    .end local p2
    invoke-virtual {v1, p2}, Landroid/preference/ListPreference;->setValue(Ljava/lang/String;)V

    .line 248
    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->updateListPreferenceSummary(Landroid/preference/ListPreference;)V

    goto/16 :goto_0
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 193
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onResume()V

    .line 194
    const-string v1, "website_settings"

    invoke-virtual {p0, v1}, Lcom/android/browser/preferences/AdvancedPreferencesFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceScreen;

    .line 196
    .local v0, websiteSettings:Landroid/preference/PreferenceScreen;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->setEnabled(Z)V

    .line 197
    invoke-static {}, Landroid/webkit/WebStorage;->getInstance()Landroid/webkit/WebStorage;

    move-result-object v1

    new-instance v2, Lcom/android/browser/preferences/AdvancedPreferencesFragment$2;

    invoke-direct {v2, p0, v0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment$2;-><init>(Lcom/android/browser/preferences/AdvancedPreferencesFragment;Landroid/preference/PreferenceScreen;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebStorage;->getOrigins(Landroid/webkit/ValueCallback;)V

    .line 205
    invoke-static {}, Landroid/webkit/GeolocationPermissions;->getInstance()Landroid/webkit/GeolocationPermissions;

    move-result-object v1

    new-instance v2, Lcom/android/browser/preferences/AdvancedPreferencesFragment$3;

    invoke-direct {v2, p0, v0}, Lcom/android/browser/preferences/AdvancedPreferencesFragment$3;-><init>(Lcom/android/browser/preferences/AdvancedPreferencesFragment;Landroid/preference/PreferenceScreen;)V

    invoke-virtual {v1, v2}, Landroid/webkit/GeolocationPermissions;->getOrigins(Landroid/webkit/ValueCallback;)V

    .line 213
    return-void
.end method

.method updateListPreferenceSummary(Landroid/preference/ListPreference;)V
    .locals 1
    .parameter "e"

    .prologue
    .line 183
    invoke-virtual {p1}, Landroid/preference/ListPreference;->getEntry()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/preference/ListPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 184
    return-void
.end method
