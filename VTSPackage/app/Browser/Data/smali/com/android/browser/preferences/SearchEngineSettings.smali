.class public Lcom/android/browser/preferences/SearchEngineSettings;
.super Landroid/preference/PreferenceFragment;
.source "SearchEngineSettings.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# static fields
.field private static final ACTION_QUICKSEARCHBOX_SEARCH_ENGINE_CHANGED:Ljava/lang/String; = "com.android.quicksearchbox.SEARCH_ENGINE_CHANGED"

.field private static final BAIDU:Ljava/lang/String; = "baidu"

.field private static final DBG:Z = true

.field private static final GOOGLE:Ljava/lang/String; = "google"

.field private static final PREF_SYNC_SEARCH_ENGINE:Ljava/lang/String; = "syc_search_engine"

.field private static final XLOG:Ljava/lang/String; = "browser/SearchEngineSettings"


# instance fields
.field private mActivity:Landroid/preference/PreferenceActivity;

.field private mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

.field private mCheckBoxPref:Landroid/preference/CheckBoxPreference;

.field private mEntries:[Ljava/lang/String;

.field private mEntryFavicon:[Ljava/lang/String;

.field private mEntryValues:[Ljava/lang/String;

.field private mPrefs:Landroid/content/SharedPreferences;

.field private mRadioPrefs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/browser/preferences/RadioPreference;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 49
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method

.method private broadcastSearchEngineChangedExternal(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 149
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.android.quicksearchbox.SEARCH_ENGINE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.quicksearchbox"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 152
    iget-object v1, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    iget-object v2, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "search_engine"

    const-string v4, "baidu"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->setIntentSearchEngineExtra(Landroid/content/Intent;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 154
    const-string v1, "search_engine"

    iget-object v2, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v3, "search_engine"

    const-string v4, "google"

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    :cond_0
    const-string v1, "browser/SearchEngineSettings"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Broadcasting: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 162
    return-void
.end method

.method private createPreferenceHierarchy()Landroid/preference/PreferenceScreen;
    .locals 9

    .prologue
    const v8, 0x7f0c0021

    .line 166
    invoke-virtual {p0}, Lcom/android/browser/preferences/SearchEngineSettings;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v6

    iget-object v7, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-virtual {v6, v7}, Landroid/preference/PreferenceManager;->createPreferenceScreen(Landroid/content/Context;)Landroid/preference/PreferenceScreen;

    move-result-object v3

    .line 168
    .local v3, root:Landroid/preference/PreferenceScreen;
    new-instance v0, Landroid/preference/PreferenceCategory;

    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {v0, v6}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 169
    .local v0, consistencyPref:Landroid/preference/PreferenceCategory;
    const v6, 0x7f0c001f

    invoke-virtual {v0, v6}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 170
    invoke-virtual {v3, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 173
    new-instance v6, Landroid/preference/CheckBoxPreference;

    iget-object v7, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {v6, v7}, Landroid/preference/CheckBoxPreference;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    .line 174
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    const-string v7, "toggle_consistency"

    invoke-virtual {v6, v7}, Landroid/preference/CheckBoxPreference;->setKey(Ljava/lang/String;)V

    .line 175
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    const v7, 0x7f0c0020

    invoke-virtual {v6, v7}, Landroid/preference/CheckBoxPreference;->setTitle(I)V

    .line 176
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v8}, Landroid/preference/CheckBoxPreference;->setSummaryOn(I)V

    .line 177
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v8}, Landroid/preference/CheckBoxPreference;->setSummaryOff(I)V

    .line 178
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v6}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 179
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v7, "syc_search_engine"

    const/4 v8, 0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    .line 180
    .local v5, syncSearchEngine:Z
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v6, v5}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 182
    new-instance v4, Landroid/preference/PreferenceCategory;

    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {v4, v6}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    .line 183
    .local v4, searchEnginesPref:Landroid/preference/PreferenceCategory;
    const v6, 0x7f0c00bd

    invoke-virtual {v4, v6}, Landroid/preference/PreferenceCategory;->setTitle(I)V

    .line 184
    invoke-virtual {v3, v4}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 186
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntries:[Ljava/lang/String;

    array-length v6, v6

    if-ge v1, v6, :cond_0

    .line 187
    new-instance v2, Lcom/android/browser/preferences/RadioPreference;

    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {v2, v6}, Lcom/android/browser/preferences/RadioPreference;-><init>(Landroid/content/Context;)V

    .line 188
    .local v2, radioPref:Lcom/android/browser/preferences/RadioPreference;
    const v6, 0x7f04002b

    invoke-virtual {v2, v6}, Lcom/android/browser/preferences/RadioPreference;->setWidgetLayoutResource(I)V

    .line 189
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntries:[Ljava/lang/String;

    aget-object v6, v6, v1

    invoke-virtual {v2, v6}, Lcom/android/browser/preferences/RadioPreference;->setTitle(Ljava/lang/CharSequence;)V

    .line 190
    invoke-virtual {v2, v1}, Lcom/android/browser/preferences/RadioPreference;->setOrder(I)V

    .line 191
    invoke-virtual {v2, p0}, Lcom/android/browser/preferences/RadioPreference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 192
    invoke-virtual {v4, v2}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    .line 193
    iget-object v6, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mRadioPrefs:Ljava/util/List;

    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 196
    .end local v2           #radioPref:Lcom/android/browser/preferences/RadioPreference;
    :cond_0
    return-object v3
.end method

.method public static getSearchEngineInfos(Landroid/content/Context;)Ljava/util/List;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mediatek/common/search/SearchEngineInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 128
    const-string v2, "search"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/SearchManager;

    .line 129
    .local v1, searchManager:Landroid/app/SearchManager;
    const-string v2, "search_engine"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/common/search/ISearchEngineManager;

    .line 131
    .local v0, searchEngineManager:Lcom/mediatek/common/search/ISearchEngineManager;
    invoke-interface {v0}, Lcom/mediatek/common/search/ISearchEngineManager;->getAvailableSearchEngines()Ljava/util/List;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 13
    .parameter "savedInstanceState"

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 53
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mRadioPrefs:Ljava/util/List;

    .line 54
    invoke-virtual {p0}, Lcom/android/browser/preferences/SearchEngineSettings;->getActivity()Landroid/app/Activity;

    move-result-object v10

    check-cast v10, Landroid/preference/PreferenceActivity;

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    .line 55
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-static {v10}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v10

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    .line 57
    const/4 v9, -0x1

    .line 58
    .local v9, selectedItem:I
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-static {v10}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v10

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 59
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v10, v11}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->getSearchEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;

    move-result-object v7

    .line 60
    .local v7, searchEngineName:Ljava/lang/String;
    if-nez v7, :cond_0

    .line 61
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v11, "search_engine"

    const-string v12, "google"

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 64
    :cond_0
    const/4 v3, 0x0

    .line 65
    .local v3, need_refresh:Z
    const-string v4, ""

    .line 66
    .local v4, searchEngineFavicon:Ljava/lang/String;
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    const-string v11, "search_engine"

    invoke-virtual {v10, v11}, Landroid/preference/PreferenceActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mediatek/common/search/ISearchEngineManager;

    .line 68
    .local v6, searchEngineManager:Lcom/mediatek/common/search/ISearchEngineManager;
    invoke-interface {v6, v7}, Lcom/mediatek/common/search/ISearchEngineManager;->getSearchEngineByName(Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v5

    .line 69
    .local v5, searchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    if-eqz v5, :cond_4

    .line 70
    invoke-virtual {v5}, Lcom/mediatek/common/search/SearchEngineInfo;->getFaviconUri()Ljava/lang/String;

    move-result-object v4

    .line 75
    :goto_0
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-static {v10}, Lcom/android/browser/preferences/SearchEngineSettings;->getSearchEngineInfos(Landroid/content/Context;)Ljava/util/List;

    move-result-object v8

    .line 76
    .local v8, searchEngines:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/search/SearchEngineInfo;>;"
    const/4 v2, 0x0

    .line 77
    .local v2, len:I
    if-eqz v8, :cond_1

    .line 78
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v2

    .line 80
    :cond_1
    new-array v10, v2, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    .line 81
    new-array v10, v2, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntries:[Ljava/lang/String;

    .line 82
    new-array v10, v2, [Ljava/lang/String;

    iput-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryFavicon:[Ljava/lang/String;

    .line 84
    const-string v10, ""

    invoke-interface {v6, v10, v4}, Lcom/mediatek/common/search/ISearchEngineManager;->getBestMatchSearchEngine(Ljava/lang/String;Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v5

    .line 85
    if-eqz v5, :cond_2

    .line 86
    invoke-virtual {v5}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_2

    .line 87
    invoke-virtual {v5}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v7

    .line 88
    const/4 v3, 0x1

    .line 92
    :cond_2
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_5

    .line 93
    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v10}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v11, v1

    .line 94
    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntries:[Ljava/lang/String;

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v10}, Lcom/mediatek/common/search/SearchEngineInfo;->getLabel()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v11, v1

    .line 95
    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryFavicon:[Ljava/lang/String;

    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v10}, Lcom/mediatek/common/search/SearchEngineInfo;->getFaviconUri()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v11, v1

    .line 96
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    aget-object v10, v10, v1

    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 97
    move v9, v1

    .line 92
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 72
    .end local v1           #i:I
    .end local v2           #len:I
    .end local v8           #searchEngines:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/search/SearchEngineInfo;>;"
    :cond_4
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    const-string v11, "search_engine_favicon"

    const-string v12, ""

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 101
    .restart local v1       #i:I
    .restart local v2       #len:I
    .restart local v8       #searchEngines:Ljava/util/List;,"Ljava/util/List<Lcom/mediatek/common/search/SearchEngineInfo;>;"
    :cond_5
    invoke-direct {p0}, Lcom/android/browser/preferences/SearchEngineSettings;->createPreferenceHierarchy()Landroid/preference/PreferenceScreen;

    move-result-object v10

    invoke-virtual {p0, v10}, Lcom/android/browser/preferences/SearchEngineSettings;->setPreferenceScreen(Landroid/preference/PreferenceScreen;)V

    .line 102
    const/4 v10, -0x1

    if-eq v9, v10, :cond_9

    .line 103
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mRadioPrefs:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/browser/preferences/RadioPreference;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    .line 116
    :cond_6
    :goto_2
    if-eqz v3, :cond_7

    const/4 v10, -0x1

    if-eq v9, v10, :cond_7

    .line 117
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v10}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 118
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v10, "search_engine"

    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    aget-object v11, v11, v9

    invoke-interface {v0, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 119
    const-string v10, "search_engine_favicon"

    iget-object v11, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryFavicon:[Ljava/lang/String;

    aget-object v11, v11, v9

    invoke-interface {v0, v10, v11}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 120
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 122
    .end local v0           #editor:Landroid/content/SharedPreferences$Editor;
    :cond_7
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v10}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v10

    if-eqz v10, :cond_8

    .line 123
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {p0, v10}, Lcom/android/browser/preferences/SearchEngineSettings;->broadcastSearchEngineChangedExternal(Landroid/content/Context;)V

    .line 125
    :cond_8
    return-void

    .line 105
    :cond_9
    if-lez v2, :cond_6

    .line 106
    const/4 v9, 0x0

    .line 107
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v2, :cond_b

    .line 108
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    aget-object v10, v10, v1

    const-string v11, "google"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a

    .line 109
    move v9, v1

    .line 107
    :cond_a
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 112
    :cond_b
    iget-object v10, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mRadioPrefs:Ljava/util/List;

    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/browser/preferences/RadioPreference;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    .line 113
    const/4 v3, 0x1

    goto :goto_2
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 136
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onPause()V

    .line 137
    iget-object v1, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 138
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v1, "syc_search_engine"

    iget-object v2, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v2}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 139
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 140
    iget-object v1, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mCheckBoxPref:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v1}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 141
    iget-object v1, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mActivity:Landroid/preference/PreferenceActivity;

    invoke-direct {p0, v1}, Lcom/android/browser/preferences/SearchEngineSettings;->broadcastSearchEngineChangedExternal(Landroid/content/Context;)V

    .line 143
    :cond_0
    return-void
.end method

.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 7
    .parameter "preference"

    .prologue
    const/4 v6, 0x1

    .line 200
    iget-object v3, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mRadioPrefs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/browser/preferences/RadioPreference;

    .line 201
    .local v2, radioPref:Lcom/android/browser/preferences/RadioPreference;
    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    goto :goto_0

    .end local v2           #radioPref:Lcom/android/browser/preferences/RadioPreference;
    :cond_0
    move-object v3, p1

    .line 203
    check-cast v3, Lcom/android/browser/preferences/RadioPreference;

    invoke-virtual {v3, v6}, Lcom/android/browser/preferences/RadioPreference;->setChecked(Z)V

    .line 204
    iget-object v3, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 205
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    const-string v3, "search_engine"

    iget-object v4, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryValues:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/preference/Preference;->getOrder()I

    move-result v5

    aget-object v4, v4, v5

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 206
    const-string v3, "search_engine_favicon"

    iget-object v4, p0, Lcom/android/browser/preferences/SearchEngineSettings;->mEntryFavicon:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/preference/Preference;->getOrder()I

    move-result v5

    aget-object v4, v4, v5

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 207
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 210
    return v6
.end method
