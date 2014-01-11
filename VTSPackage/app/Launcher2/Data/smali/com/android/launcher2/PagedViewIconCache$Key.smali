.class public Lcom/android/launcher2/PagedViewIconCache$Key;
.super Ljava/lang/Object;
.source "PagedViewIconCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/PagedViewIconCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Key"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/PagedViewIconCache$Key$Type;
    }
.end annotation


# instance fields
.field private final mComponentName:Landroid/content/ComponentName;

.field private final mType:Lcom/android/launcher2/PagedViewIconCache$Key$Type;


# direct methods
.method public constructor <init>(Landroid/appwidget/AppWidgetProviderInfo;)V
    .locals 1
    .parameter "info"

    .prologue
    .line 53
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iget-object v0, p1, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    .line 55
    sget-object v0, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->AppWidgetProviderInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mType:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ResolveInfo;)V
    .locals 4
    .parameter "info"

    .prologue
    .line 47
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iget-object v1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v1, :cond_0

    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 50
    .local v0, ci:Landroid/content/pm/ComponentInfo;
    :goto_0
    new-instance v1, Landroid/content/ComponentName;

    iget-object v2, v0, Landroid/content/pm/ComponentInfo;->packageName:Ljava/lang/String;

    iget-object v3, v0, Landroid/content/pm/ComponentInfo;->name:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    .line 51
    sget-object v1, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->ResolveInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    iput-object v1, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mType:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    .line 52
    return-void

    .line 48
    .end local v0           #ci:Landroid/content/pm/ComponentInfo;
    :cond_0
    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    goto :goto_0
.end method

.method public constructor <init>(Lcom/android/launcher2/ApplicationInfo;)V
    .locals 1
    .parameter "info"

    .prologue
    .line 43
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iget-object v0, p1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    .line 45
    sget-object v0, Lcom/android/launcher2/PagedViewIconCache$Key$Type;->ApplicationInfoKey:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mType:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    .line 46
    return-void
.end method

.method private getComponentName()Landroid/content/ComponentName;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "o"

    .prologue
    .line 67
    instance-of v1, p1, Lcom/android/launcher2/PagedViewIconCache$Key;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 68
    check-cast v0, Lcom/android/launcher2/PagedViewIconCache$Key;

    .line 69
    .local v0, k:Lcom/android/launcher2/PagedViewIconCache$Key;
    iget-object v1, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    iget-object v2, v0, Lcom/android/launcher2/PagedViewIconCache$Key;->mComponentName:Landroid/content/ComponentName;

    invoke-virtual {v1, v2}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 71
    .end local v0           #k:Lcom/android/launcher2/PagedViewIconCache$Key;
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/android/launcher2/PagedViewIconCache$Key;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->hashCode()I

    move-result v0

    return v0
.end method

.method public isKeyType(Lcom/android/launcher2/PagedViewIconCache$Key$Type;)Z
    .locals 1
    .parameter "t"

    .prologue
    .line 62
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIconCache$Key;->mType:Lcom/android/launcher2/PagedViewIconCache$Key$Type;

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
