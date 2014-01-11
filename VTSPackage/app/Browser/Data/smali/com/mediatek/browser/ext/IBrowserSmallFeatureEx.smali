.class public interface abstract Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;
.super Ljava/lang/Object;
.source "IBrowserSmallFeatureEx.java"


# virtual methods
.method public abstract addDefaultBookmarksForCustomer(Lcom/mediatek/browser/ext/IBrowserProvider2Ex;Landroid/database/sqlite/SQLiteDatabase;JI)I
.end method

.method public abstract checkAndTrimUrl(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getCustomerHomepage()Ljava/lang/String;
.end method

.method public abstract getOperatorUA(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getPredefinedWebsites()[Ljava/lang/CharSequence;
.end method

.method public abstract getSearchEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;
.end method

.method public abstract setIntentSearchEngineExtra(Landroid/content/Intent;Ljava/lang/String;)Z
.end method

.method public abstract setStandardFontFamily(Landroid/webkit/WebSettings;Ljava/lang/String;)V
.end method

.method public abstract setTextEncodingChoices(Landroid/preference/ListPreference;)V
.end method

.method public abstract shouldChangeBookmarkMenuManner()Z
.end method

.method public abstract shouldCheckUrlLengthLimit()Z
.end method

.method public abstract shouldConfigHistoryPageMenuItem(Landroid/view/Menu;ZZ)Z
.end method

.method public abstract shouldCreateBookmarksOptionMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
.end method

.method public abstract shouldCreateHistoryPageOptionMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
.end method

.method public abstract shouldDownloadPreference()Z
.end method

.method public abstract shouldLoadCustomerAdvancedXml()Z
.end method

.method public abstract shouldOnlyLandscape(Landroid/content/SharedPreferences;)Z
.end method

.method public abstract shouldOverrideFocusContent()Z
.end method

.method public abstract shouldProcessResultForFileManager()Z
.end method

.method public abstract shouldSetNavigationBarTitle()Z
.end method

.method public abstract shouldTransferToWapBrowser()Z
.end method

.method public abstract updatePreferenceItem(Landroid/preference/Preference;Ljava/lang/String;)V
.end method

.method public abstract updatePreferenceItemAndSetListener(Landroid/preference/Preference;Ljava/lang/String;Landroid/preference/Preference$OnPreferenceChangeListener;)V
.end method
