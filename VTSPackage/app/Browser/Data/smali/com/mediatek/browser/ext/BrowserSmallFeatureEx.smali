.class public Lcom/mediatek/browser/ext/BrowserSmallFeatureEx;
.super Landroid/content/ContextWrapper;
.source "BrowserSmallFeatureEx.java"

# interfaces
.implements Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;


# static fields
.field private static final TAG:Ljava/lang/String; = "BrowserPluginEx"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 21
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    .line 22
    return-void
.end method


# virtual methods
.method public addDefaultBookmarksForCustomer(Lcom/mediatek/browser/ext/IBrowserProvider2Ex;Landroid/database/sqlite/SQLiteDatabase;JI)I
    .locals 2
    .parameter "mBrowserProvider2"
    .parameter "db"
    .parameter "id"
    .parameter "position"

    .prologue
    .line 124
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: addDefaultBookmarksForCustomer --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public checkAndTrimUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "url"

    .prologue
    .line 68
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: checkAndTrimUrl --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    return-object p1
.end method

.method public getCustomerHomepage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 75
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: getCustomerHomepage --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    const/4 v0, 0x0

    return-object v0
.end method

.method public getOperatorUA(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "defaultUA"

    .prologue
    .line 163
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: getOperatorUA --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPredefinedWebsites()[Ljava/lang/CharSequence;
    .locals 2

    .prologue
    .line 103
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: getPredefinedWebsites --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSearchEngine(Landroid/content/SharedPreferences;)Ljava/lang/String;
    .locals 2
    .parameter "mPrefs"

    .prologue
    .line 82
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: getSearchEngine --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    const/4 v0, 0x0

    return-object v0
.end method

.method public setIntentSearchEngineExtra(Landroid/content/Intent;Ljava/lang/String;)Z
    .locals 2
    .parameter "intent"
    .parameter "string"

    .prologue
    .line 97
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: setIntentSearchEngineExtra --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    const/4 v0, 0x0

    return v0
.end method

.method public setStandardFontFamily(Landroid/webkit/WebSettings;Ljava/lang/String;)V
    .locals 2
    .parameter "settings"
    .parameter "fontFamily"

    .prologue
    .line 89
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: setStandardFontFamily --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    return-void
.end method

.method public setTextEncodingChoices(Landroid/preference/ListPreference;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 41
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: setTextEncodingChoices --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    return-void
.end method

.method public shouldChangeBookmarkMenuManner()Z
    .locals 2

    .prologue
    .line 151
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldChangeBookmarkMenuManner --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    const/4 v0, 0x0

    return v0
.end method

.method public shouldCheckUrlLengthLimit()Z
    .locals 2

    .prologue
    .line 62
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldCheckUrlLengthLimit --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public shouldConfigHistoryPageMenuItem(Landroid/view/Menu;ZZ)Z
    .locals 2
    .parameter "menu"
    .parameter "isNull"
    .parameter "isEmpty"

    .prologue
    .line 138
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: configHistoryPageMenuItem --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    const/4 v0, 0x0

    return v0
.end method

.method public shouldCreateBookmarksOptionMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 2
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 145
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: createBookmarksOptionMenu --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    const/4 v0, 0x0

    return v0
.end method

.method public shouldCreateHistoryPageOptionMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .locals 2
    .parameter "menu"
    .parameter "inflater"

    .prologue
    .line 131
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: createHistoryPageOptionMenu --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public shouldDownloadPreference()Z
    .locals 2

    .prologue
    .line 49
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldDownloadPreference --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    const/4 v0, 0x0

    return v0
.end method

.method public shouldLoadCustomerAdvancedXml()Z
    .locals 2

    .prologue
    .line 175
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldLoadCustomerAdvancedXml --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 176
    const/4 v0, 0x0

    return v0
.end method

.method public shouldOnlyLandscape(Landroid/content/SharedPreferences;)Z
    .locals 2
    .parameter "mPrefs"

    .prologue
    .line 169
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldOnlyLandscape --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    const/4 v0, 0x0

    return v0
.end method

.method public shouldOverrideFocusContent()Z
    .locals 2

    .prologue
    .line 181
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldOverrideFocusContent --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    const/4 v0, 0x0

    return v0
.end method

.method public shouldProcessResultForFileManager()Z
    .locals 2

    .prologue
    .line 55
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldProcessResultForFileManager --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    const/4 v0, 0x0

    return v0
.end method

.method public shouldSetNavigationBarTitle()Z
    .locals 2

    .prologue
    .line 110
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldSetNavigationBarTitle --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v0, 0x0

    return v0
.end method

.method public shouldTransferToWapBrowser()Z
    .locals 2

    .prologue
    .line 157
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: shouldTransferToWapBrowser --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    const/4 v0, 0x0

    return v0
.end method

.method public updatePreferenceItem(Landroid/preference/Preference;Ljava/lang/String;)V
    .locals 2
    .parameter "pref"
    .parameter "value"

    .prologue
    .line 26
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: updatePreferenceItem --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    return-void
.end method

.method public updatePreferenceItemAndSetListener(Landroid/preference/Preference;Ljava/lang/String;Landroid/preference/Preference$OnPreferenceChangeListener;)V
    .locals 2
    .parameter "pref"
    .parameter "value"
    .parameter "onPreferenceChangeListener"

    .prologue
    .line 34
    const-string v0, "BrowserPluginEx"

    const-string v1, "Enter: updatePreferenceItemAndSetListener --default implement"

    invoke-static {v0, v1}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    return-void
.end method
