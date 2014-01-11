.class public Lcom/android/launcher2/PagedViewIconCache;
.super Ljava/lang/Object;
.source "PagedViewIconCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/PagedViewIconCache$Key;
    }
.end annotation


# instance fields
.field private final mIconOutlineCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/launcher2/PagedViewIconCache$Key;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    return-void
.end method

.method private retainAll(Ljava/util/HashSet;Lcom/android/launcher2/PagedViewIconCache$Key$Type;)V
    .locals 4
    .parameter
    .parameter "t"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Lcom/android/launcher2/PagedViewIconCache$Key;",
            ">;",
            "Lcom/android/launcher2/PagedViewIconCache$Key$Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, keysToKeep:Ljava/util/HashSet;,"Ljava/util/HashSet<Lcom/android/launcher2/PagedViewIconCache$Key;>;"
    new-instance v2, Ljava/util/HashSet;

    iget-object v3, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 89
    .local v2, keysToRemove:Ljava/util/HashSet;,"Ljava/util/HashSet<Lcom/android/launcher2/PagedViewIconCache$Key;>;"
    invoke-virtual {v2, p1}, Ljava/util/HashSet;->removeAll(Ljava/util/Collection;)Z

    .line 90
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/PagedViewIconCache$Key;

    .line 91
    .local v1, key:Lcom/android/launcher2/PagedViewIconCache$Key;
    invoke-virtual {v1, p2}, Lcom/android/launcher2/PagedViewIconCache$Key;->isKeyType(Lcom/android/launcher2/PagedViewIconCache$Key$Type;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 92
    iget-object v3, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    .line 93
    iget-object v3, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 96
    .end local v1           #key:Lcom/android/launcher2/PagedViewIconCache$Key;
    :cond_1
    return-void
.end method


# virtual methods
.method public addOutline(Lcom/android/launcher2/PagedViewIconCache$Key;Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "key"
    .parameter "b"

    .prologue
    .line 122
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    return-void
.end method

.method public clear()V
    .locals 3

    .prologue
    .line 82
    iget-object v2, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/PagedViewIconCache$Key;

    .line 83
    .local v1, key:Lcom/android/launcher2/PagedViewIconCache$Key;
    iget-object v2, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_0

    .line 85
    .end local v1           #key:Lcom/android/launcher2/PagedViewIconCache$Key;
    :cond_0
    iget-object v2, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 86
    return-void
.end method

.method public getOutline(Lcom/android/launcher2/PagedViewIconCache$Key;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "key"

    .prologue
    .line 131
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public removeOutline(Lcom/android/launcher2/PagedViewIconCache$Key;)V
    .locals 1
    .parameter "key"

    .prologue
    .line 125
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 127
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache;->mIconOutlineCache:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_0
    return-void
.end method

.method public retainAllAppWidgets(Ljava/util/List;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/appwidget/AppWidgetProviderInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, keys:Ljava/util/List;,"Ljava/util/List<Landroid/appwidget/AppWidgetProviderInfo;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 116
    .local v2, keysSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Lcom/android/launcher2/PagedViewIconCache$Key;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/appwidget/AppWidgetProviderInfo;

    .line 117
    .local v1, info:Landroid/appwidget/AppWidgetProviderInfo;
    new-instance v3, Lcom/android/launcher2/PagedViewIconCache$Key;

    invoke-direct {v3, v1}, Lcom/android/launcher2/PagedViewIconCache$Key;-><init>(Landroid/appwidget/AppWidgetProviderInfo;)V

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 119
    .end local v1           #info:Landroid/appwidget/AppWidgetProviderInfo;
    :cond_0
    sget-object v3, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->AppWidgetProviderInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    invoke-direct {p0, v2, v3}, Lcom/android/launcher2/PagedViewIconCache;->retainAll(Ljava/util/HashSet;Lcom/android/launcher2/PagedViewIconCache$Key$Type;)V

    .line 120
    return-void
.end method

.method public retainAllApps(Ljava/util/ArrayList;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 99
    .local p1, keys:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/launcher2/ApplicationInfo;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 100
    .local v2, keysSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Lcom/android/launcher2/PagedViewIconCache$Key;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    .line 101
    .local v1, info:Lcom/android/launcher2/ApplicationInfo;
    new-instance v3, Lcom/android/launcher2/PagedViewIconCache$Key;

    invoke-direct {v3, v1}, Lcom/android/launcher2/PagedViewIconCache$Key;-><init>(Lcom/android/launcher2/ApplicationInfo;)V

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 103
    .end local v1           #info:Lcom/android/launcher2/ApplicationInfo;
    :cond_0
    sget-object v3, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->ApplicationInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    invoke-direct {p0, v2, v3}, Lcom/android/launcher2/PagedViewIconCache;->retainAll(Ljava/util/HashSet;Lcom/android/launcher2/PagedViewIconCache$Key$Type;)V

    .line 104
    return-void
.end method

.method public retainAllShortcuts(Ljava/util/List;)V
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, keys:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 108
    .local v2, keysSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Lcom/android/launcher2/PagedViewIconCache$Key;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    .line 109
    .local v1, info:Landroid/content/pm/ResolveInfo;
    new-instance v3, Lcom/android/launcher2/PagedViewIconCache$Key;

    invoke-direct {v3, v1}, Lcom/android/launcher2/PagedViewIconCache$Key;-><init>(Landroid/content/pm/ResolveInfo;)V

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 111
    .end local v1           #info:Landroid/content/pm/ResolveInfo;
    :cond_0
    sget-object v3, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->ResolveInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    invoke-direct {p0, v2, v3}, Lcom/android/launcher2/PagedViewIconCache;->retainAll(Ljava/util/HashSet;Lcom/android/launcher2/PagedViewIconCache$Key$Type;)V

    .line 112
    return-void
.end method
