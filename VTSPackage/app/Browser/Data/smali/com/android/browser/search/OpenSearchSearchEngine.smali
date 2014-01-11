.class public Lcom/android/browser/search/OpenSearchSearchEngine;
.super Ljava/lang/Object;
.source "OpenSearchSearchEngine.java"

# interfaces
.implements Lcom/android/browser/search/SearchEngine;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/browser/search/OpenSearchSearchEngine$SuggestionsCursor;
    }
.end annotation


# static fields
.field private static final COLUMNS:[Ljava/lang/String; = null

.field private static final COLUMNS_WITHOUT_DESCRIPTION:[Ljava/lang/String; = null

.field private static final COLUMN_INDEX_ICON:I = 0x2

.field private static final COLUMN_INDEX_ID:I = 0x0

.field private static final COLUMN_INDEX_QUERY:I = 0x1

.field private static final COLUMN_INDEX_TEXT_1:I = 0x3

.field private static final COLUMN_INDEX_TEXT_2:I = 0x4

.field private static final HTTP_TIMEOUT:Ljava/lang/String; = "http.connection-manager.timeout"

.field private static final HTTP_TIMEOUT_MS:I = 0x3e8

.field private static final TAG:Ljava/lang/String; = "OpenSearchSearchEngine"

.field private static final USER_AGENT:Ljava/lang/String; = "Android/1.0"


# instance fields
.field private final mHttpClient:Landroid/net/http/AndroidHttpClient;

.field private final mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 69
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "suggest_intent_query"

    aput-object v1, v0, v3

    const-string v1, "suggest_icon_1"

    aput-object v1, v0, v4

    const-string v1, "suggest_text_1"

    aput-object v1, v0, v5

    const-string v1, "suggest_text_2"

    aput-object v1, v0, v6

    sput-object v0, Lcom/android/browser/search/OpenSearchSearchEngine;->COLUMNS:[Ljava/lang/String;

    .line 77
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v2

    const-string v1, "suggest_intent_query"

    aput-object v1, v0, v3

    const-string v1, "suggest_icon_1"

    aput-object v1, v0, v4

    const-string v1, "suggest_text_1"

    aput-object v1, v0, v5

    sput-object v0, Lcom/android/browser/search/OpenSearchSearchEngine;->COLUMNS_WITHOUT_DESCRIPTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/mediatek/common/search/SearchEngineInfo;)V
    .locals 4
    .parameter "context"
    .parameter "searchEngineInfo"

    .prologue
    .line 88
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p2, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    .line 90
    const-string v1, "Android/1.0"

    invoke-static {v1}, Landroid/net/http/AndroidHttpClient;->newInstance(Ljava/lang/String;)Landroid/net/http/AndroidHttpClient;

    move-result-object v1

    iput-object v1, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mHttpClient:Landroid/net/http/AndroidHttpClient;

    .line 91
    iget-object v1, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mHttpClient:Landroid/net/http/AndroidHttpClient;

    invoke-virtual {v1}, Landroid/net/http/AndroidHttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    .line 92
    .local v0, params:Lorg/apache/http/params/HttpParams;
    const-string v1, "http.connection-manager.timeout"

    const-wide/16 v2, 0x3e8

    invoke-interface {v0, v1, v2, v3}, Lorg/apache/http/params/HttpParams;->setLongParameter(Ljava/lang/String;J)Lorg/apache/http/params/HttpParams;

    .line 93
    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/android/browser/search/OpenSearchSearchEngine;->COLUMNS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/android/browser/search/OpenSearchSearchEngine;->COLUMNS_WITHOUT_DESCRIPTION:[Ljava/lang/String;

    return-object v0
.end method

.method private getActiveNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;
    .locals 2
    .parameter "context"

    .prologue
    .line 226
    const-string v1, "connectivity"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 228
    .local v0, connectivity:Landroid/net/ConnectivityManager;
    if-nez v0, :cond_0

    .line 229
    const/4 v1, 0x0

    .line 231
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    goto :goto_0
.end method

.method private isNetworkConnected(Landroid/content/Context;)Z
    .locals 2
    .parameter "context"

    .prologue
    .line 221
    invoke-direct {p0, p1}, Lcom/android/browser/search/OpenSearchSearchEngine;->getActiveNetworkInfo(Landroid/content/Context;)Landroid/net/NetworkInfo;

    move-result-object v0

    .line 222
    .local v0, networkInfo:Landroid/net/NetworkInfo;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mHttpClient:Landroid/net/http/AndroidHttpClient;

    invoke-virtual {v0}, Landroid/net/http/AndroidHttpClient;->close()V

    .line 218
    return-void
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v0}, Lcom/mediatek/common/search/SearchEngineInfo;->getLabel()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v0}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSuggestions(Landroid/content/Context;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .parameter "context"
    .parameter "query"

    .prologue
    const/4 v10, 0x2

    const/4 v7, 0x0

    .line 129
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 186
    :cond_0
    :goto_0
    return-object v7

    .line 132
    :cond_1
    invoke-direct {p0, p1}, Lcom/android/browser/search/OpenSearchSearchEngine;->isNetworkConnected(Landroid/content/Context;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 133
    const-string v8, "OpenSearchSearchEngine"

    const-string v9, "Not connected to network."

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 137
    :cond_2
    iget-object v8, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v8, p2}, Lcom/mediatek/common/search/SearchEngineInfo;->getSuggestUriForQuery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 138
    .local v5, suggestUri:Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 144
    :try_start_0
    invoke-virtual {p0, v5}, Lcom/android/browser/search/OpenSearchSearchEngine;->readUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, content:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 157
    const/4 v6, 0x0

    .line 158
    .local v6, suggestions:Lorg/json/JSONArray;
    const/4 v1, 0x0

    .line 159
    .local v1, descriptions:Lorg/json/JSONArray;
    iget-object v8, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v8}, Lcom/mediatek/common/search/SearchEngineInfo;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "baidu"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 160
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    const/16 v9, 0x13

    if-lt v8, v9, :cond_0

    .line 163
    const/16 v8, 0x11

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x2

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 165
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 166
    .local v3, obj:Lorg/json/JSONObject;
    const-string v8, "s"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 167
    const/4 v1, 0x0

    .line 182
    .end local v3           #obj:Lorg/json/JSONObject;
    :cond_3
    :goto_1
    new-instance v8, Lcom/android/browser/search/OpenSearchSearchEngine$SuggestionsCursor;

    invoke-direct {v8, v6, v1}, Lcom/android/browser/search/OpenSearchSearchEngine$SuggestionsCursor;-><init>(Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    move-object v7, v8

    goto :goto_0

    .line 169
    :cond_4
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 170
    .local v4, results:Lorg/json/JSONArray;
    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v6

    .line 171
    const/4 v1, 0x0

    .line 173
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-le v8, v10, :cond_3

    .line 174
    const/4 v8, 0x2

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    .line 177
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    if-nez v8, :cond_3

    .line 178
    const/4 v1, 0x0

    goto :goto_1

    .line 183
    .end local v0           #content:Ljava/lang/String;
    .end local v1           #descriptions:Lorg/json/JSONArray;
    .end local v4           #results:Lorg/json/JSONArray;
    .end local v6           #suggestions:Lorg/json/JSONArray;
    :catch_0
    move-exception v2

    .line 184
    .local v2, e:Lorg/json/JSONException;
    const-string v8, "OpenSearchSearchEngine"

    const-string v9, "Error"

    invoke-static {v8, v9, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public readUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "url"

    .prologue
    const/4 v3, 0x0

    .line 198
    :try_start_0
    new-instance v1, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v1, p1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 199
    .local v1, method:Lorg/apache/http/client/methods/HttpGet;
    iget-object v4, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mHttpClient:Landroid/net/http/AndroidHttpClient;

    invoke-virtual {v4, v1}, Landroid/net/http/AndroidHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v2

    .line 200
    .local v2, response:Lorg/apache/http/HttpResponse;
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0xc8

    if-ne v4, v5, :cond_0

    .line 201
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v3

    .line 208
    .end local v1           #method:Lorg/apache/http/client/methods/HttpGet;
    .end local v2           #response:Lorg/apache/http/HttpResponse;
    :goto_0
    return-object v3

    .line 203
    .restart local v1       #method:Lorg/apache/http/client/methods/HttpGet;
    .restart local v2       #response:Lorg/apache/http/HttpResponse;
    :cond_0
    const-string v4, "OpenSearchSearchEngine"

    const-string v5, "Suggestion request failed"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 206
    .end local v1           #method:Lorg/apache/http/client/methods/HttpGet;
    .end local v2           #response:Lorg/apache/http/HttpResponse;
    :catch_0
    move-exception v0

    .line 207
    .local v0, e:Ljava/io/IOException;
    const-string v4, "OpenSearchSearchEngine"

    const-string v5, "Error"

    invoke-static {v4, v5, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public startSearch(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 5
    .parameter "context"
    .parameter "query"
    .parameter "appData"
    .parameter "extraData"

    .prologue
    .line 104
    iget-object v2, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v2, p2}, Lcom/mediatek/common/search/SearchEngineInfo;->getSearchUriForQuery(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 105
    .local v1, uri:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 106
    const-string v2, "OpenSearchSearchEngine"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to get search URI for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    :goto_0
    return-void

    .line 108
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 110
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 111
    const-string v2, "android.intent.category.DEFAULT"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 112
    const-string v2, "query"

    invoke-virtual {v0, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    if-eqz p3, :cond_1

    .line 114
    const-string v2, "app_data"

    invoke-virtual {v0, v2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 116
    :cond_1
    if-eqz p4, :cond_2

    .line 117
    const-string v2, "intent_extra_data_key"

    invoke-virtual {v0, v2, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    :cond_2
    const-string v2, "com.android.browser.application_id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 120
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public supportsSuggestions()Z
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v0}, Lcom/mediatek/common/search/SearchEngineInfo;->supportsSuggestions()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 313
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OpenSearchSearchEngine{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/browser/search/OpenSearchSearchEngine;->mSearchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public wantsEmptyQuery()Z
    .locals 1

    .prologue
    .line 318
    const/4 v0, 0x0

    return v0
.end method
