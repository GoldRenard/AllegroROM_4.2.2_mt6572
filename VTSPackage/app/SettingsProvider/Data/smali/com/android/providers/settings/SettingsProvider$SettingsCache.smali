.class final Lcom/android/providers/settings/SettingsProvider$SettingsCache;
.super Landroid/util/LruCache;
.source "SettingsProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/providers/settings/SettingsProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SettingsCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache",
        "<",
        "Ljava/lang/String;",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field private mCacheFullyMatchesDisk:Z

.field private final mCacheName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "name"

    .prologue
    .line 1199
    const/16 v0, 0xc8

    invoke-direct {p0, v0}, Landroid/util/LruCache;-><init>(I)V

    .line 1196
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z

    .line 1200
    iput-object p1, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheName:Ljava/lang/String;

    .line 1201
    return-void
.end method

.method static synthetic access$202(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1193
    iput-boolean p1, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z

    return p1
.end method

.method public static isRedundantSetValue(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .parameter "cache"
    .parameter "name"
    .parameter "value"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1276
    if-nez p0, :cond_0

    .line 1285
    :goto_0
    return v2

    .line 1277
    :cond_0
    monitor-enter p0

    .line 1278
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 1279
    .local v0, bundle:Landroid/os/Bundle;
    if-nez v0, :cond_1

    monitor-exit p0

    goto :goto_0

    .line 1286
    .end local v0           #bundle:Landroid/os/Bundle;
    :catchall_0
    move-exception v2

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 1280
    .restart local v0       #bundle:Landroid/os/Bundle;
    :cond_1
    :try_start_1
    invoke-virtual {v0}, Landroid/os/Bundle;->getPairValue()Ljava/lang/String;

    move-result-object v1

    .line 1281
    .local v1, oldValue:Ljava/lang/String;
    const-string v4, "SettingsProvider"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "redundant, old Value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " new value: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    if-nez v1, :cond_2

    if-nez p2, :cond_2

    monitor-exit p0

    move v2, v3

    goto :goto_0

    .line 1284
    :cond_2
    if-nez v1, :cond_3

    move v4, v3

    :goto_1
    if-nez p2, :cond_4

    :goto_2
    if-eq v4, v3, :cond_5

    monitor-exit p0

    goto :goto_0

    :cond_3
    move v4, v2

    goto :goto_1

    :cond_4
    move v3, v2

    goto :goto_2

    .line 1285
    :cond_5
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public static populate(Lcom/android/providers/settings/SettingsProvider$SettingsCache;Landroid/content/ContentValues;)V
    .locals 4
    .parameter "cache"
    .parameter "contentValues"

    .prologue
    .line 1248
    if-nez p0, :cond_0

    .line 1258
    :goto_0
    return-void

    .line 1251
    :cond_0
    const-string v2, "name"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1252
    .local v0, name:Ljava/lang/String;
    if-nez v0, :cond_1

    .line 1253
    const-string v2, "SettingsProvider"

    const-string v3, "null name populating settings cache."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1256
    :cond_1
    const-string v2, "value"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1257
    .local v1, value:Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->populate(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected bridge synthetic entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    .line 1193
    check-cast p2, Ljava/lang/String;

    .end local p2
    check-cast p3, Landroid/os/Bundle;

    .end local p3
    check-cast p4, Landroid/os/Bundle;

    .end local p4
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->entryRemoved(ZLjava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V

    return-void
.end method

.method protected entryRemoved(ZLjava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 1
    .parameter "evicted"
    .parameter "key"
    .parameter "oldValue"
    .parameter "newValue"

    .prologue
    .line 1220
    if-eqz p1, :cond_0

    .line 1221
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z

    .line 1223
    :cond_0
    return-void
.end method

.method public fullyMatchesDisk()Z
    .locals 1

    .prologue
    .line 1207
    monitor-enter p0

    .line 1208
    :try_start_0
    iget-boolean v0, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z

    monitor-exit p0

    return v0

    .line 1209
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public populate(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "name"
    .parameter "value"

    .prologue
    .line 1261
    monitor-enter p0

    .line 1262
    if-eqz p2, :cond_0

    :try_start_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1f4

    if-gt v0, v1, :cond_1

    .line 1263
    :cond_0
    const-string v0, "value"

    invoke-static {v0, p2}, Landroid/os/Bundle;->forPair(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1267
    :goto_0
    monitor-exit p0

    .line 1268
    return-void

    .line 1265
    :cond_1
    invoke-static {}, Lcom/android/providers/settings/SettingsProvider;->access$400()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1267
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public putIfAbsent(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 3
    .parameter "key"
    .parameter "value"

    .prologue
    .line 1233
    if-nez p2, :cond_3

    invoke-static {}, Lcom/android/providers/settings/SettingsProvider;->access$300()Landroid/os/Bundle;

    move-result-object v0

    .line 1234
    .local v0, bundle:Landroid/os/Bundle;
    :goto_0
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x1f4

    if-gt v1, v2, :cond_2

    .line 1235
    :cond_0
    monitor-enter p0

    .line 1236
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 1237
    invoke-virtual {p0, p1, v0}, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1239
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1241
    :cond_2
    return-object v0

    .line 1233
    .end local v0           #bundle:Landroid/os/Bundle;
    :cond_3
    const-string v1, "value"

    invoke-static {v1, p2}, Landroid/os/Bundle;->forPair(Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    goto :goto_0

    .line 1239
    .restart local v0       #bundle:Landroid/os/Bundle;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public setFullyMatchesDisk(Z)V
    .locals 1
    .parameter "value"

    .prologue
    .line 1213
    monitor-enter p0

    .line 1214
    :try_start_0
    iput-boolean p1, p0, Lcom/android/providers/settings/SettingsProvider$SettingsCache;->mCacheFullyMatchesDisk:Z

    .line 1215
    monitor-exit p0

    .line 1216
    return-void

    .line 1215
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
