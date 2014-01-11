.class Lcom/cyanogenmod/trebuchet/ApplicationInfo;
.super Lcom/cyanogenmod/trebuchet/ItemInfo;
.source "ApplicationInfo.java"


# static fields
.field static final DOWNLOADED_FLAG:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Trebuchet.ApplicationInfo"

.field static final UPDATED_SYSTEM_APP_FLAG:I = 0x2


# instance fields
.field componentName:Landroid/content/ComponentName;

.field firstInstallTime:J

.field flags:I

.field iconBitmap:Landroid/graphics/Bitmap;

.field intent:Landroid/content/Intent;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 58
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 59
    const/4 v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->itemType:I

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;Lcom/cyanogenmod/trebuchet/IconCache;Ljava/util/HashMap;)V
    .locals 6
    .parameter "pm"
    .parameter "info"
    .parameter "iconCache"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/pm/PackageManager;",
            "Landroid/content/pm/ResolveInfo;",
            "Lcom/cyanogenmod/trebuchet/IconCache;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Object;Ljava/lang/CharSequence;>;"
    const/4 v3, 0x0

    .line 66
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    .line 56
    iput v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 67
    iget-object v3, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v2, v3, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 69
    .local v2, packageName:Ljava/lang/String;
    new-instance v3, Landroid/content/ComponentName;

    iget-object v4, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v3, v2, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    .line 70
    const-wide/16 v3, -0x1

    iput-wide v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->container:J

    .line 71
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    const/high16 v4, 0x1020

    invoke-virtual {p0, v3, v4}, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->setActivity(Landroid/content/ComponentName;I)V

    .line 75
    const/4 v3, 0x0

    :try_start_0
    invoke-virtual {p1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v0, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 76
    .local v0, appFlags:I
    and-int/lit8 v3, v0, 0x1

    if-nez v3, :cond_0

    .line 77
    iget v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    or-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 79
    and-int/lit16 v3, v0, 0x80

    if-eqz v3, :cond_0

    .line 80
    iget v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    or-int/lit8 v3, v3, 0x2

    iput v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 83
    :cond_0
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    iget-wide v3, v3, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    iput-wide v3, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->firstInstallTime:J
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .end local v0           #appFlags:I
    :goto_0
    invoke-virtual {p3, p0, p2, p4}, Lcom/cyanogenmod/trebuchet/IconCache;->getTitleAndIcon(Lcom/cyanogenmod/trebuchet/ApplicationInfo;Landroid/content/pm/ResolveInfo;Ljava/util/HashMap;)V

    .line 89
    return-void

    .line 84
    :catch_0
    move-exception v1

    .line 85
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v3, "Trebuchet.ApplicationInfo"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "PackageManager.getApplicationInfo failed for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V
    .locals 2
    .parameter "info"

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 56
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 93
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    .line 94
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    .line 95
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    .line 96
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->flags:I

    .line 97
    iget-wide v0, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->firstInstallTime:J

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->firstInstallTime:J

    .line 98
    return-void
.end method

.method public static dumpApplicationInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 5
    .parameter "tag"
    .parameter "label"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/cyanogenmod/trebuchet/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p2, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ApplicationInfo;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " size="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    .line 130
    .local v1, info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "   title=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" iconBitmap="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->iconBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " firstInstallTime="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->firstInstallTime:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 134
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ApplicationInfo;
    :cond_0
    return-void
.end method


# virtual methods
.method getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/ItemInfo;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public makeShortcut()Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    .locals 1

    .prologue
    .line 137
    new-instance v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;-><init>(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V

    return-object v0
.end method

.method final setActivity(Landroid/content/ComponentName;I)V
    .locals 2
    .parameter "className"
    .parameter "launchFlags"

    .prologue
    .line 114
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    .line 115
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 116
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 117
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 118
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->itemType:I

    .line 119
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ApplicationInfo(title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
