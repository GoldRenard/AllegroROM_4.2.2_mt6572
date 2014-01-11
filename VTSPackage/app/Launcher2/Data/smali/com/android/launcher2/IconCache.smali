.class public Lcom/android/launcher2/IconCache;
.super Ljava/lang/Object;
.source "IconCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/IconCache$1;,
        Lcom/android/launcher2/IconCache$CacheEntry;
    }
.end annotation


# static fields
.field private static final INITIAL_ICON_CACHE_CAPACITY:I = 0x32

.field private static final TAG:Ljava/lang/String; = "IconCache"


# instance fields
.field private final mCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Lcom/android/launcher2/IconCache$CacheEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Lcom/android/launcher2/LauncherApplication;

.field private final mDefaultIcon:Landroid/graphics/Bitmap;

.field private mIconDpi:I

.field private final mPackageManager:Landroid/content/pm/PackageManager;


# direct methods
.method public constructor <init>(Lcom/android/launcher2/LauncherApplication;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 54
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0x32

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v1, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    .line 55
    const-string v1, "activity"

    invoke-virtual {p1, v1}, Lcom/android/launcher2/LauncherApplication;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 58
    .local v0, activityManager:Landroid/app/ActivityManager;
    iput-object p1, p0, Lcom/android/launcher2/IconCache;->mContext:Lcom/android/launcher2/LauncherApplication;

    .line 59
    invoke-virtual {p1}, Lcom/android/launcher2/LauncherApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/IconCache;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 60
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLauncherLargeIconDensity()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/IconCache;->mIconDpi:I

    .line 63
    invoke-direct {p0}, Lcom/android/launcher2/IconCache;->makeDefaultIcon()Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/IconCache;->mDefaultIcon:Landroid/graphics/Bitmap;

    .line 64
    return-void
.end method

.method private cacheLocked(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Lcom/android/launcher2/IconCache$CacheEntry;
    .locals 5
    .parameter "componentName"
    .parameter "info"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Landroid/content/pm/ResolveInfo;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Lcom/android/launcher2/IconCache$CacheEntry;"
        }
    .end annotation

    .prologue
    .line 212
    .local p3, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/IconCache$CacheEntry;

    .line 213
    .local v0, entry:Lcom/android/launcher2/IconCache$CacheEntry;
    if-nez v0, :cond_2

    .line 214
    new-instance v0, Lcom/android/launcher2/IconCache$CacheEntry;

    .end local v0           #entry:Lcom/android/launcher2/IconCache$CacheEntry;
    const/4 v2, 0x0

    invoke-direct {v0, v2}, Lcom/android/launcher2/IconCache$CacheEntry;-><init>(Lcom/android/launcher2/IconCache$1;)V

    .line 216
    .restart local v0       #entry:Lcom/android/launcher2/IconCache$CacheEntry;
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    invoke-static {p2}, Lcom/android/launcher2/LauncherModel;->getComponentNameFromResolveInfo(Landroid/content/pm/ResolveInfo;)Landroid/content/ComponentName;

    move-result-object v1

    .line 219
    .local v1, key:Landroid/content/ComponentName;
    if-eqz p3, :cond_3

    invoke-virtual {p3, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 220
    invoke-virtual {p3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    .line 222
    const-string v2, "IconCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CacheLocked get title from cache: title = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :cond_0
    :goto_0
    iget-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 234
    iget-object v2, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    iput-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    .line 236
    const-string v2, "IconCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CacheLocked get title from activity information: entry.title = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    :cond_1
    invoke-virtual {p0, p2}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/pm/ResolveInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mContext:Lcom/android/launcher2/LauncherApplication;

    invoke-static {v2, v3}, Lcom/android/launcher2/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    .line 243
    .end local v1           #key:Landroid/content/ComponentName;
    :cond_2
    return-object v0

    .line 225
    .restart local v1       #key:Landroid/content/ComponentName;
    :cond_3
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {p2, v2}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    .line 227
    const-string v2, "IconCache"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CacheLocked get title from pms: title = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    if-eqz p3, :cond_0

    .line 230
    iget-object v2, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    invoke-virtual {p3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private makeDefaultIcon()Landroid/graphics/Bitmap;
    .locals 7

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 120
    invoke-virtual {p0}, Lcom/android/launcher2/IconCache;->getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 121
    .local v2, d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 124
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 125
    .local v1, c:Landroid/graphics/Canvas;
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-virtual {v2, v6, v6, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 126
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 127
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 128
    return-object v0
.end method


# virtual methods
.method public flush()V
    .locals 5

    .prologue
    .line 144
    iget-object v4, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v4

    .line 146
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    .line 147
    .local v0, cn:Landroid/content/ComponentName;
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/IconCache$CacheEntry;

    .line 148
    .local v1, e:Lcom/android/launcher2/IconCache$CacheEntry;
    const/4 v3, 0x0

    iput-object v3, v1, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    .line 149
    const/4 v3, 0x0

    iput-object v3, v1, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    goto :goto_0

    .line 154
    .end local v0           #cn:Landroid/content/ComponentName;
    .end local v1           #e:Lcom/android/launcher2/IconCache$CacheEntry;
    .end local v2           #i$:Ljava/util/Iterator;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 153
    .restart local v2       #i$:Ljava/util/Iterator;
    :cond_0
    :try_start_1
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 154
    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 157
    const-string v3, "IconCache"

    const-string v4, "Flush icon cache here."

    invoke-static {v3, v4}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    return-void
.end method

.method public getAllIcons()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/ComponentName;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .prologue
    .line 247
    iget-object v5, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v5

    .line 248
    :try_start_0
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 249
    .local v3, set:Ljava/util/HashMap;,"Ljava/util/HashMap<Landroid/content/ComponentName;Landroid/graphics/Bitmap;>;"
    iget-object v4, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    .line 250
    .local v0, cn:Landroid/content/ComponentName;
    iget-object v4, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/IconCache$CacheEntry;

    .line 251
    .local v1, e:Lcom/android/launcher2/IconCache$CacheEntry;
    iget-object v4, v1, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 254
    .end local v0           #cn:Landroid/content/ComponentName;
    .end local v1           #e:Lcom/android/launcher2/IconCache$CacheEntry;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #set:Ljava/util/HashMap;,"Ljava/util/HashMap<Landroid/content/ComponentName;Landroid/graphics/Bitmap;>;"
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 253
    .restart local v2       #i$:Ljava/util/Iterator;
    .restart local v3       #set:Ljava/util/HashMap;,"Ljava/util/HashMap<Landroid/content/ComponentName;Landroid/graphics/Bitmap;>;"
    :cond_0
    :try_start_1
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v3
.end method

.method public getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;
    .locals 2

    .prologue
    .line 67
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x10d

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getFullResIcon(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;
    .locals 5
    .parameter "info"

    .prologue
    .line 105
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v4, p1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v3, v4}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Landroid/content/pm/ApplicationInfo;)Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 110
    .local v2, resources:Landroid/content/res/Resources;
    :goto_0
    if-eqz v2, :cond_0

    .line 111
    invoke-virtual {p1}, Landroid/content/pm/ActivityInfo;->getIconResource()I

    move-result v1

    .line 112
    .local v1, iconId:I
    if-eqz v1, :cond_0

    .line 113
    invoke-virtual {p0, v2, v1}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 116
    .end local v1           #iconId:I
    :goto_1
    return-object v3

    .line 107
    .end local v2           #resources:Landroid/content/res/Resources;
    :catch_0
    move-exception v0

    .line 108
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    .restart local v2       #resources:Landroid/content/res/Resources;
    goto :goto_0

    .line 116
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/IconCache;->getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    goto :goto_1
.end method

.method public getFullResIcon(Landroid/content/pm/ResolveInfo;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .parameter "info"

    .prologue
    .line 98
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;
    .locals 3
    .parameter "resources"
    .parameter "iconId"

    .prologue
    .line 74
    :try_start_0
    iget v2, p0, Lcom/android/launcher2/IconCache;->mIconDpi:I

    invoke-virtual {p1, p2, v2}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 79
    .local v0, d:Landroid/graphics/drawable/Drawable;
    :goto_0
    if-eqz v0, :cond_0

    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    :goto_1
    return-object v0

    .line 75
    :catch_0
    move-exception v1

    .line 76
    .local v1, e:Landroid/content/res/Resources$NotFoundException;
    const/4 v0, 0x0

    .restart local v0       #d:Landroid/graphics/drawable/Drawable;
    goto :goto_0

    .line 79
    .end local v1           #e:Landroid/content/res/Resources$NotFoundException;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/IconCache;->getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1
.end method

.method public getFullResIcon(Ljava/lang/String;I)Landroid/graphics/drawable/Drawable;
    .locals 3
    .parameter "packageName"
    .parameter "iconId"

    .prologue
    .line 85
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mPackageManager:Landroid/content/pm/PackageManager;

    invoke-virtual {v2, p1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 89
    .local v1, resources:Landroid/content/res/Resources;
    :goto_0
    if-eqz v1, :cond_0

    .line 90
    if-eqz p2, :cond_0

    .line 91
    invoke-virtual {p0, v1, p2}, Lcom/android/launcher2/IconCache;->getFullResIcon(Landroid/content/res/Resources;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 94
    :goto_1
    return-object v2

    .line 86
    .end local v1           #resources:Landroid/content/res/Resources;
    :catch_0
    move-exception v0

    .line 87
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    .restart local v1       #resources:Landroid/content/res/Resources;
    goto :goto_0

    .line 94
    .end local v0           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/IconCache;->getFullResDefaultActivityIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    goto :goto_1
.end method

.method public getIcon(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Landroid/graphics/Bitmap;
    .locals 3
    .parameter "component"
    .parameter "resolveInfo"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ComponentName;",
            "Landroid/content/pm/ResolveInfo;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .prologue
    .line 190
    .local p3, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 191
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 192
    :cond_0
    const/4 v1, 0x0

    :try_start_0
    monitor-exit v2

    .line 196
    :goto_0
    return-object v1

    .line 195
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/IconCache;->cacheLocked(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Lcom/android/launcher2/IconCache$CacheEntry;

    move-result-object v0

    .line 196
    .local v0, entry:Lcom/android/launcher2/IconCache$CacheEntry;
    iget-object v1, v0, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    monitor-exit v2

    goto :goto_0

    .line 197
    .end local v0           #entry:Lcom/android/launcher2/IconCache$CacheEntry;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getIcon(Landroid/content/Intent;)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "intent"

    .prologue
    .line 175
    iget-object v4, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v4

    .line 176
    :try_start_0
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mPackageManager:Landroid/content/pm/PackageManager;

    const/4 v5, 0x0

    invoke-virtual {v3, p1, v5}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    .line 177
    .local v2, resolveInfo:Landroid/content/pm/ResolveInfo;
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    .line 179
    .local v0, component:Landroid/content/ComponentName;
    if-eqz v2, :cond_0

    if-nez v0, :cond_1

    .line 180
    :cond_0
    iget-object v3, p0, Lcom/android/launcher2/IconCache;->mDefaultIcon:Landroid/graphics/Bitmap;

    monitor-exit v4

    .line 184
    :goto_0
    return-object v3

    .line 183
    :cond_1
    const/4 v3, 0x0

    invoke-direct {p0, v0, v2, v3}, Lcom/android/launcher2/IconCache;->cacheLocked(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Lcom/android/launcher2/IconCache$CacheEntry;

    move-result-object v1

    .line 184
    .local v1, entry:Lcom/android/launcher2/IconCache$CacheEntry;
    iget-object v3, v1, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    monitor-exit v4

    goto :goto_0

    .line 185
    .end local v0           #component:Landroid/content/ComponentName;
    .end local v1           #entry:Lcom/android/launcher2/IconCache$CacheEntry;
    .end local v2           #resolveInfo:Landroid/content/pm/ResolveInfo;
    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3
.end method

.method public getTitleAndIcon(Lcom/android/launcher2/ApplicationInfo;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)V
    .locals 3
    .parameter "application"
    .parameter "info"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/ApplicationInfo;",
            "Landroid/content/pm/ResolveInfo;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 166
    .local p3, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    iget-object v2, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v2

    .line 167
    :try_start_0
    iget-object v1, p1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    invoke-direct {p0, v1, p2, p3}, Lcom/android/launcher2/IconCache;->cacheLocked(Landroid/content/ComponentName;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)Lcom/android/launcher2/IconCache$CacheEntry;

    move-result-object v0

    .line 169
    .local v0, entry:Lcom/android/launcher2/IconCache$CacheEntry;
    iget-object v1, v0, Lcom/android/launcher2/IconCache$CacheEntry;->title:Ljava/lang/String;

    iput-object v1, p1, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    .line 170
    iget-object v1, v0, Lcom/android/launcher2/IconCache$CacheEntry;->icon:Landroid/graphics/Bitmap;

    iput-object v1, p1, Lcom/android/launcher2/ApplicationInfo;->iconBitmap:Landroid/graphics/Bitmap;

    .line 171
    monitor-exit v2

    .line 172
    return-void

    .line 171
    .end local v0           #entry:Lcom/android/launcher2/IconCache$CacheEntry;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isDefaultIcon(Landroid/graphics/Bitmap;)Z
    .locals 1
    .parameter "icon"

    .prologue
    .line 201
    iget-object v0, p0, Lcom/android/launcher2/IconCache;->mDefaultIcon:Landroid/graphics/Bitmap;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public remove(Landroid/content/ComponentName;)V
    .locals 2
    .parameter "componentName"

    .prologue
    .line 135
    iget-object v1, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    monitor-enter v1

    .line 136
    :try_start_0
    iget-object v0, p0, Lcom/android/launcher2/IconCache;->mCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    monitor-exit v1

    .line 138
    return-void

    .line 137
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
