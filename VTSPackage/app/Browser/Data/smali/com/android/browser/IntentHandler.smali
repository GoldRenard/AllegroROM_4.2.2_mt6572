.class public Lcom/android/browser/IntentHandler;
.super Ljava/lang/Object;
.source "IntentHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/IntentHandler$UrlData;
    }
.end annotation


# static fields
.field static final EMPTY_URL_DATA:Lcom/android/browser/IntentHandler$UrlData; = null

.field static final GOOGLE_SEARCH_SOURCE_SUGGEST:Ljava/lang/String; = "browser-suggest"

.field static final GOOGLE_SEARCH_SOURCE_UNKNOWN:Ljava/lang/String; = "unknown"

.field private static final XLOGTAG:Ljava/lang/String; = "browser/IntentHandler"

.field private static sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mController:Lcom/android/browser/Controller;

.field private mSettings:Lcom/android/browser/BrowserSettings;

.field private mTabControl:Lcom/android/browser/TabControl;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    new-instance v0, Lcom/android/browser/IntentHandler$UrlData;

    invoke-direct {v0, v1}, Lcom/android/browser/IntentHandler$UrlData;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/browser/IntentHandler;->EMPTY_URL_DATA:Lcom/android/browser/IntentHandler$UrlData;

    .line 66
    sput-object v1, Lcom/android/browser/IntentHandler;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/android/browser/Controller;)V
    .locals 1
    .parameter "browser"
    .parameter "controller"

    .prologue
    .line 68
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    .line 70
    iput-object p2, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    .line 71
    iget-object v0, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v0}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    .line 72
    invoke-virtual {p2}, Lcom/android/browser/Controller;->getSettings()Lcom/android/browser/BrowserSettings;

    move-result-object v0

    iput-object v0, p0, Lcom/android/browser/IntentHandler;->mSettings:Lcom/android/browser/BrowserSettings;

    .line 73
    return-void
.end method

.method protected static getUrlDataFromIntent(Landroid/content/Intent;)Lcom/android/browser/IntentHandler$UrlData;
    .locals 14
    .parameter "intent"

    .prologue
    .line 230
    const-string v1, ""

    .line 231
    .local v1, url:Ljava/lang/String;
    const/4 v2, 0x0

    .line 232
    .local v2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 233
    .local v4, preloaded:Lcom/android/browser/PreloadedTabControl;
    const/4 v5, 0x0

    .line 234
    .local v5, preloadedSearchBoxQuery:Ljava/lang/String;
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/content/Intent;->getFlags()I

    move-result v0

    const/high16 v3, 0x10

    and-int/2addr v0, v3

    if-nez v0, :cond_2

    .line 236
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    .line 237
    .local v6, action:Ljava/lang/String;
    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "android.nfc.action.NDEF_DISCOVERED"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 239
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Lcom/android/browser/UrlUtils;->smartUrlFilter(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 240
    if-eqz v1, :cond_1

    const-string v0, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 241
    const-string v0, "com.android.browser.headers"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v11

    .line 243
    .local v11, pairs:Landroid/os/Bundle;
    if-eqz v11, :cond_1

    invoke-virtual {v11}, Landroid/os/Bundle;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 244
    invoke-virtual {v11}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 245
    .local v9, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/HashMap;

    .end local v2           #headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 246
    .restart local v2       #headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 247
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 248
    .local v10, key:Ljava/lang/String;
    invoke-virtual {v11, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 252
    .end local v9           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v10           #key:Ljava/lang/String;
    .end local v11           #pairs:Landroid/os/Bundle;
    :cond_1
    const-string v0, "preload_id"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 253
    const-string v0, "preload_id"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 254
    .local v8, id:Ljava/lang/String;
    const-string v0, "searchbox_query"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 256
    invoke-static {}, Lcom/android/browser/Preloader;->getInstance()Lcom/android/browser/Preloader;

    move-result-object v0

    invoke-virtual {v0, v8}, Lcom/android/browser/Preloader;->getPreloadedTab(Ljava/lang/String;)Lcom/android/browser/PreloadedTabControl;

    move-result-object v4

    .line 282
    .end local v6           #action:Ljava/lang/String;
    .end local v8           #id:Ljava/lang/String;
    :cond_2
    :goto_1
    new-instance v0, Lcom/android/browser/IntentHandler$UrlData;

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/browser/IntentHandler$UrlData;-><init>(Ljava/lang/String;Ljava/util/Map;Landroid/content/Intent;Lcom/android/browser/PreloadedTabControl;Ljava/lang/String;)V

    return-object v0

    .line 258
    .restart local v6       #action:Ljava/lang/String;
    :cond_3
    const-string v0, "android.intent.action.SEARCH"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "android.intent.action.MEDIA_SEARCH"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "android.intent.action.WEB_SEARCH"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 261
    :cond_4
    const-string v0, "query"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 262
    if-eqz v1, :cond_2

    .line 265
    invoke-static {v1}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 266
    invoke-static {v1}, Lcom/android/browser/UrlUtils;->smartUrlFilter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 267
    const-string v12, "&source=android-browser-suggest&"

    .line 268
    .local v12, searchSource:Ljava/lang/String;
    invoke-virtual {v1, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 269
    const/4 v13, 0x0

    .line 270
    .local v13, source:Ljava/lang/String;
    const-string v0, "app_data"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v7

    .line 271
    .local v7, appData:Landroid/os/Bundle;
    if-eqz v7, :cond_5

    .line 272
    const-string v0, "source"

    invoke-virtual {v7, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 274
    :cond_5
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 275
    const-string v13, "unknown"

    .line 277
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "&source=android-"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "&"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v12, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method static handleWebSearchIntent(Landroid/app/Activity;Lcom/android/browser/Controller;Landroid/content/Intent;)Z
    .locals 6
    .parameter "activity"
    .parameter "controller"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 292
    if-nez p2, :cond_1

    .line 314
    :cond_0
    :goto_0
    return v4

    .line 294
    :cond_1
    const/4 v3, 0x0

    .line 295
    .local v3, url:Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 296
    .local v0, action:Ljava/lang/String;
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 297
    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 298
    .local v1, data:Landroid/net/Uri;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    .line 300
    :cond_2
    if-eqz v3, :cond_3

    const-string v5, "content://"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 303
    :cond_3
    if-eqz p1, :cond_4

    const-string v5, "inputUrl"

    invoke-virtual {p2, v5, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 304
    invoke-virtual {p1}, Lcom/android/browser/Controller;->getUi()Lcom/android/browser/UI;

    move-result-object v2

    check-cast v2, Lcom/android/browser/BaseUi;

    .line 305
    .local v2, ui:Lcom/android/browser/BaseUi;
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Lcom/android/browser/BaseUi;->setInputUrlFlag(Z)V

    .line 306
    const-string v4, "browser/IntentHandler"

    const-string v5, "handleWebSearchIntent inputUrl setInputUrlFlag"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    .end local v1           #data:Landroid/net/Uri;
    .end local v2           #ui:Lcom/android/browser/BaseUi;
    :cond_4
    :goto_1
    const-string v4, "app_data"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "intent_extra_data_key"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, p1, v3, v4, v5}, Lcom/android/browser/IntentHandler;->handleWebSearchRequest(Landroid/app/Activity;Lcom/android/browser/Controller;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 309
    :cond_5
    const-string v4, "android.intent.action.SEARCH"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "android.intent.action.MEDIA_SEARCH"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6

    const-string v4, "android.intent.action.WEB_SEARCH"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 312
    :cond_6
    const-string v4, "query"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private static handleWebSearchRequest(Landroid/app/Activity;Lcom/android/browser/Controller;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)Z
    .locals 7
    .parameter "activity"
    .parameter "controller"
    .parameter "inUrl"
    .parameter "appData"
    .parameter "extraData"

    .prologue
    const/4 v4, 0x0

    .line 327
    if-nez p2, :cond_1

    .line 365
    :cond_0
    :goto_0
    return v4

    .line 331
    :cond_1
    invoke-static {p2}, Lcom/android/browser/UrlUtils;->fixUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    .line 332
    .local v3, url:Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 336
    sget-object v5, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-nez v5, :cond_0

    sget-object v5, Lcom/android/browser/UrlUtils;->ACCEPTED_URI_SCHEMA:Ljava/util/regex/Pattern;

    invoke-virtual {v5, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-nez v5, :cond_0

    .line 341
    invoke-virtual {p0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 342
    .local v0, cr:Landroid/content/ContentResolver;
    move-object v1, v3

    .line 343
    .local v1, newUrl:Ljava/lang/String;
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/browser/TabControl;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {p1}, Lcom/android/browser/Controller;->getTabControl()Lcom/android/browser/TabControl;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/browser/TabControl;->getCurrentWebView()Landroid/webkit/WebView;

    move-result-object v5

    invoke-virtual {v5}, Landroid/webkit/WebView;->isPrivateBrowsingEnabled()Z

    move-result v5

    if-nez v5, :cond_3

    .line 347
    :cond_2
    new-instance v5, Lcom/android/browser/IntentHandler$1;

    invoke-direct {v5, v0, v1}, Lcom/android/browser/IntentHandler$1;-><init>(Landroid/content/ContentResolver;Ljava/lang/String;)V

    new-array v6, v4, [Ljava/lang/Void;

    invoke-virtual {v5, v6}, Lcom/android/browser/IntentHandler$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 356
    :cond_3
    invoke-static {}, Lcom/android/browser/BrowserSettings;->getInstance()Lcom/android/browser/BrowserSettings;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/browser/BrowserSettings;->getSearchEngine()Lcom/android/browser/search/SearchEngine;

    move-result-object v2

    .line 357
    .local v2, searchEngine:Lcom/android/browser/search/SearchEngine;
    if-eqz v2, :cond_0

    .line 358
    invoke-interface {v2, p0, v3, p3, p4}, Lcom/android/browser/search/SearchEngine;->startSearch(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 360
    invoke-static {p0}, Lcom/mediatek/browser/ext/Extensions;->getSmallFeaturePlugin(Landroid/content/Context;)Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    move-result-object v4

    sput-object v4, Lcom/android/browser/IntentHandler;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    .line 361
    sget-object v4, Lcom/android/browser/IntentHandler;->sBrowserSmallFeatureEx:Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;

    invoke-interface {v4}, Lcom/mediatek/browser/ext/IBrowserSmallFeatureEx;->shouldTransferToWapBrowser()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 362
    invoke-static {p0, v3, v2}, Lcom/android/browser/IntentHandler;->isTransferToWapBrowser(Landroid/app/Activity;Ljava/lang/String;Lcom/android/browser/search/SearchEngine;)Z

    move-result v4

    goto :goto_0

    .line 365
    :cond_4
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private static isTransferToWapBrowser(Landroid/app/Activity;Ljava/lang/String;Lcom/android/browser/search/SearchEngine;)Z
    .locals 1
    .parameter "activity"
    .parameter "url"
    .parameter "searchEngine"

    .prologue
    .line 370
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method onNewIntent(Landroid/content/Intent;)V
    .locals 13
    .parameter "intent"

    .prologue
    .line 76
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v9}, Lcom/android/browser/TabControl;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v3

    .line 79
    .local v3, current:Lcom/android/browser/Tab;
    if-nez v3, :cond_2

    .line 81
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/browser/TabControl;->getTab(I)Lcom/android/browser/Tab;

    move-result-object v3

    .line 82
    if-nez v3, :cond_1

    .line 227
    :cond_0
    :goto_0
    return-void

    .line 86
    :cond_1
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v3}, Lcom/android/browser/Controller;->setActiveTab(Lcom/android/browser/Tab;)V

    .line 88
    :cond_2
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, action:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v4

    .line 90
    .local v4, flags:I
    const-string v9, "android.intent.action.MAIN"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    const/high16 v9, 0x10

    and-int/2addr v9, v4

    if-nez v9, :cond_0

    .line 95
    const-string v9, "show_bookmarks"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 96
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    sget-object v10, Lcom/android/browser/UI$ComboViews;->Bookmarks:Lcom/android/browser/UI$ComboViews;

    invoke-virtual {v9, v10}, Lcom/android/browser/Controller;->bookmarksOrHistoryPicker(Lcom/android/browser/UI$ComboViews;)V

    goto :goto_0

    .line 101
    :cond_3
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    const-string v10, "search"

    invoke-virtual {v9, v10}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/app/SearchManager;

    invoke-virtual {v9}, Landroid/app/SearchManager;->stopSearch()V

    .line 103
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "android.nfc.action.NDEF_DISCOVERED"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "android.intent.action.SEARCH"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "android.intent.action.MEDIA_SEARCH"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "android.intent.action.WEB_SEARCH"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 109
    :cond_4
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    .line 110
    .local v7, uri:Landroid/net/Uri;
    if-eqz v7, :cond_6

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "rtsp://"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_5

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "tel:"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 112
    :cond_5
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v9, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 119
    :cond_6
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    iget-object v10, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-static {v9, v10, p1}, Lcom/android/browser/IntentHandler;->handleWebSearchIntent(Landroid/app/Activity;Lcom/android/browser/Controller;Landroid/content/Intent;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 123
    invoke-static {p1}, Lcom/android/browser/IntentHandler;->getUrlDataFromIntent(Landroid/content/Intent;)Lcom/android/browser/IntentHandler$UrlData;

    move-result-object v8

    .line 124
    .local v8, urlData:Lcom/android/browser/IntentHandler$UrlData;
    invoke-virtual {v8}, Lcom/android/browser/IntentHandler$UrlData;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 125
    new-instance v8, Lcom/android/browser/IntentHandler$UrlData;

    .end local v8           #urlData:Lcom/android/browser/IntentHandler$UrlData;
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v9}, Lcom/android/browser/BrowserSettings;->getHomePage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/browser/IntentHandler$UrlData;-><init>(Ljava/lang/String;)V

    .line 128
    .restart local v8       #urlData:Lcom/android/browser/IntentHandler$UrlData;
    :cond_7
    const-string v9, "create_new_tab"

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v9

    if-nez v9, :cond_8

    invoke-virtual {v8}, Lcom/android/browser/IntentHandler$UrlData;->isPreloaded()Z

    move-result v9

    if-eqz v9, :cond_9

    .line 130
    :cond_8
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v8}, Lcom/android/browser/Controller;->openTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;

    move-result-object v5

    .line 131
    .local v5, t:Lcom/android/browser/Tab;
    goto/16 :goto_0

    .line 140
    .end local v5           #t:Lcom/android/browser/Tab;
    :cond_9
    const-string v9, "com.android.browser.application_id"

    invoke-virtual {p1, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, appId:Ljava/lang/String;
    iget-object v9, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_a

    iget-object v9, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    const-string v10, "javascript:"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_a

    .line 145
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v8}, Lcom/android/browser/Controller;->openTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;

    goto/16 :goto_0

    .line 148
    :cond_a
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b

    if-eqz v1, :cond_b

    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_b

    .line 151
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v9, v1}, Lcom/android/browser/TabControl;->getTabFromAppId(Ljava/lang/String;)Lcom/android/browser/Tab;

    move-result-object v2

    .line 152
    .local v2, appTab:Lcom/android/browser/Tab;
    if-eqz v2, :cond_b

    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9}, Lcom/android/browser/Controller;->getCurrentTab()Lcom/android/browser/Tab;

    move-result-object v9

    if-ne v2, v9, :cond_b

    .line 153
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v2}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    .line 154
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v2, v8}, Lcom/android/browser/Controller;->loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    goto/16 :goto_0

    .line 158
    .end local v2           #appTab:Lcom/android/browser/Tab;
    :cond_b
    const-string v9, "android.intent.action.VIEW"

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e

    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    invoke-virtual {v9}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_e

    .line 160
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mActivity:Landroid/app/Activity;

    invoke-static {v9}, Lcom/android/browser/BrowserActivity;->isTablet(Landroid/content/Context;)Z

    move-result v9

    if-nez v9, :cond_c

    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v9}, Lcom/android/browser/BrowserSettings;->allowAppTabs()Z

    move-result v9

    if-nez v9, :cond_c

    .line 162
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    invoke-virtual {v9, v1}, Lcom/android/browser/TabControl;->getTabFromAppId(Ljava/lang/String;)Lcom/android/browser/Tab;

    move-result-object v2

    .line 163
    .restart local v2       #appTab:Lcom/android/browser/Tab;
    if-eqz v2, :cond_c

    .line 164
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v2, v8}, Lcom/android/browser/Controller;->reuseTab(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    goto/16 :goto_0

    .line 170
    .end local v2           #appTab:Lcom/android/browser/Tab;
    :cond_c
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/android/browser/TabControl;->findTabWithUrl(Ljava/lang/String;)Lcom/android/browser/Tab;

    move-result-object v2

    .line 171
    .restart local v2       #appTab:Lcom/android/browser/Tab;
    if-eqz v2, :cond_d

    .line 173
    invoke-virtual {v2, v1}, Lcom/android/browser/Tab;->setAppId(Ljava/lang/String;)V

    .line 174
    if-eq v3, v2, :cond_0

    .line 175
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v2}, Lcom/android/browser/Controller;->switchToTab(Lcom/android/browser/Tab;)Z

    goto/16 :goto_0

    .line 184
    :cond_d
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v8}, Lcom/android/browser/Controller;->openTab(Lcom/android/browser/IntentHandler$UrlData;)Lcom/android/browser/Tab;

    move-result-object v6

    .line 185
    .local v6, tab:Lcom/android/browser/Tab;
    if-eqz v6, :cond_0

    .line 186
    invoke-virtual {v6, v1}, Lcom/android/browser/Tab;->setAppId(Ljava/lang/String;)V

    .line 187
    invoke-virtual {p1}, Landroid/content/Intent;->getFlags()I

    move-result v9

    const/high16 v10, 0x40

    and-int/2addr v9, v10

    if-eqz v9, :cond_0

    .line 188
    const/4 v9, 0x1

    invoke-virtual {v6, v9}, Lcom/android/browser/Tab;->setCloseOnBack(Z)V

    goto/16 :goto_0

    .line 193
    .end local v2           #appTab:Lcom/android/browser/Tab;
    .end local v6           #tab:Lcom/android/browser/Tab;
    :cond_e
    invoke-virtual {v8}, Lcom/android/browser/IntentHandler$UrlData;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_17

    iget-object v9, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    const-string v10, "about:debug"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_17

    .line 195
    const-string v9, "about:debug.dom"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 196
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/webkit/WebViewClassic;->dumpDomTree(Z)V

    goto/16 :goto_0

    .line 197
    :cond_f
    const-string v9, "about:debug.dom.file"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_10

    .line 198
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/webkit/WebViewClassic;->dumpDomTree(Z)V

    goto/16 :goto_0

    .line 199
    :cond_10
    const-string v9, "about:debug.render"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11

    .line 200
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/webkit/WebViewClassic;->dumpRenderTree(Z)V

    goto/16 :goto_0

    .line 201
    :cond_11
    const-string v9, "about:debug.render.file"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 202
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/webkit/WebViewClassic;->dumpRenderTree(Z)V

    goto/16 :goto_0

    .line 203
    :cond_12
    const-string v9, "about:debug.display"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_13

    .line 204
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebViewClassic()Landroid/webkit/WebViewClassic;

    move-result-object v9

    invoke-virtual {v9}, Landroid/webkit/WebViewClassic;->dumpDisplayTree()V

    goto/16 :goto_0

    .line 205
    :cond_13
    const-string v9, "about:debug.nav"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14

    .line 206
    invoke-virtual {v3}, Lcom/android/browser/Tab;->getWebView()Landroid/webkit/WebView;

    move-result-object v9

    invoke-virtual {v9}, Landroid/webkit/WebView;->debugDump()V

    goto/16 :goto_0

    .line 207
    :cond_14
    const-string v9, "about:debug.dumpmem"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 209
    new-instance v9, Lcom/android/browser/OutputMemoryInfo;

    invoke-direct {v9}, Lcom/android/browser/OutputMemoryInfo;-><init>()V

    const/4 v10, 0x2

    new-array v10, v10, [Lcom/android/browser/TabControl;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/4 v12, 0x0

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/android/browser/OutputMemoryInfo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 210
    :cond_15
    const-string v9, "about:debug.dumpmem.file"

    iget-object v10, v8, Lcom/android/browser/IntentHandler$UrlData;->mUrl:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_16

    .line 212
    new-instance v9, Lcom/android/browser/OutputMemoryInfo;

    invoke-direct {v9}, Lcom/android/browser/OutputMemoryInfo;-><init>()V

    const/4 v10, 0x2

    new-array v10, v10, [Lcom/android/browser/TabControl;

    const/4 v11, 0x0

    iget-object v12, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    aput-object v12, v10, v11

    const/4 v11, 0x1

    iget-object v12, p0, Lcom/android/browser/IntentHandler;->mTabControl:Lcom/android/browser/TabControl;

    aput-object v12, v10, v11

    invoke-virtual {v9, v10}, Lcom/android/browser/OutputMemoryInfo;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto/16 :goto_0

    .line 214
    :cond_16
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mSettings:Lcom/android/browser/BrowserSettings;

    invoke-virtual {v9}, Lcom/android/browser/BrowserSettings;->toggleDebugSettings()V

    goto/16 :goto_0

    .line 219
    :cond_17
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v3}, Lcom/android/browser/Controller;->dismissSubWindow(Lcom/android/browser/Tab;)V

    .line 223
    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Lcom/android/browser/Tab;->setAppId(Ljava/lang/String;)V

    .line 224
    iget-object v9, p0, Lcom/android/browser/IntentHandler;->mController:Lcom/android/browser/Controller;

    invoke-virtual {v9, v3, v8}, Lcom/android/browser/Controller;->loadUrlDataIn(Lcom/android/browser/Tab;Lcom/android/browser/IntentHandler$UrlData;)V

    goto/16 :goto_0
.end method
