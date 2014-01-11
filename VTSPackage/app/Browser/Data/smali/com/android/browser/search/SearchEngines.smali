.class public Lcom/android/browser/search/SearchEngines;
.super Ljava/lang/Object;
.source "SearchEngines.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SearchEngines"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Lcom/android/browser/search/SearchEngine;
    .locals 3
    .parameter "context"
    .parameter "name"

    .prologue
    .line 54
    invoke-static {p0}, Lcom/android/browser/search/SearchEngines;->getDefaultSearchEngine(Landroid/content/Context;)Lcom/android/browser/search/SearchEngine;

    move-result-object v0

    .line 55
    .local v0, defaultSearchEngine:Lcom/android/browser/search/SearchEngine;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/browser/search/SearchEngine;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 61
    .end local v0           #defaultSearchEngine:Lcom/android/browser/search/SearchEngine;
    :cond_0
    :goto_0
    return-object v0

    .line 59
    .restart local v0       #defaultSearchEngine:Lcom/android/browser/search/SearchEngine;
    :cond_1
    invoke-static {p0, p1}, Lcom/android/browser/search/SearchEngines;->getSearchEngineInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v1

    .line 60
    .local v1, searchEngineInfo:Lcom/mediatek/common/search/SearchEngineInfo;
    if-eqz v1, :cond_0

    .line 61
    new-instance v0, Lcom/android/browser/search/OpenSearchSearchEngine;

    .end local v0           #defaultSearchEngine:Lcom/android/browser/search/SearchEngine;
    invoke-direct {v0, p0, v1}, Lcom/android/browser/search/OpenSearchSearchEngine;-><init>(Landroid/content/Context;Lcom/mediatek/common/search/SearchEngineInfo;)V

    goto :goto_0
.end method

.method public static getDefaultSearchEngine(Landroid/content/Context;)Lcom/android/browser/search/SearchEngine;
    .locals 1
    .parameter "context"

    .prologue
    .line 35
    invoke-static {p0}, Lcom/android/browser/search/DefaultSearchEngine;->create(Landroid/content/Context;)Lcom/android/browser/search/DefaultSearchEngine;

    move-result-object v0

    return-object v0
.end method

.method public static getSearchEngineInfo(Landroid/content/Context;Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;
    .locals 5
    .parameter "context"
    .parameter "name"

    .prologue
    .line 66
    :try_start_0
    const-string v2, "search_engine"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mediatek/common/search/ISearchEngineManager;

    .line 68
    .local v1, searchEngineManger:Lcom/mediatek/common/search/ISearchEngineManager;
    invoke-interface {v1, p1}, Lcom/mediatek/common/search/ISearchEngineManager;->getSearchEngineByName(Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 71
    .end local v1           #searchEngineManger:Lcom/mediatek/common/search/ISearchEngineManager;
    :goto_0
    return-object v2

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, exception:Ljava/lang/IllegalArgumentException;
    const-string v2, "SearchEngines"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot load search engine "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 71
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getSearchEngineInfos(Landroid/content/Context;)Ljava/util/List;
    .locals 8
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
    .line 39
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .local v4, searchEngineInfos:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/mediatek/common/search/SearchEngineInfo;>;"
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 41
    .local v3, res:Landroid/content/res/Resources;
    const v7, 0x7f08005d

    invoke-virtual {v3, v7}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    .line 42
    .local v6, searchEngines:[Ljava/lang/String;
    const-string v7, "search_engine"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/mediatek/common/search/ISearchEngineManager;

    .line 44
    .local v5, searchEngineManger:Lcom/mediatek/common/search/ISearchEngineManager;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v7, v6

    if-ge v0, v7, :cond_0

    .line 45
    aget-object v2, v6, v0

    .line 46
    .local v2, name:Ljava/lang/String;
    invoke-interface {v5, v2}, Lcom/mediatek/common/search/ISearchEngineManager;->getSearchEngineByName(Ljava/lang/String;)Lcom/mediatek/common/search/SearchEngineInfo;

    move-result-object v1

    .line 47
    .local v1, info:Lcom/mediatek/common/search/SearchEngineInfo;
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 49
    .end local v1           #info:Lcom/mediatek/common/search/SearchEngineInfo;
    .end local v2           #name:Ljava/lang/String;
    :cond_0
    return-object v4
.end method
