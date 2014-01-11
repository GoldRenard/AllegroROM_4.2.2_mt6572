.class Lcom/cyanogenmod/trebuchet/ShortcutInfo;
.super Lcom/cyanogenmod/trebuchet/ItemInfo;
.source "ShortcutInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;
    }
.end annotation


# instance fields
.field customIcon:Z

.field customTitle:Z

.field iconResource:Landroid/content/Intent$ShortcutIconResource;

.field intent:Landroid/content/Intent;

.field mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

.field private mIcon:Landroid/graphics/Bitmap;

.field private mListener:Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;

.field usingFallbackIcon:Z


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 81
    const/4 v0, 0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    .line 82
    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/ApplicationInfo;)V
    .locals 2
    .parameter "info"

    .prologue
    .line 99
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 100
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 101
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->intent:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 102
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 103
    return-void
.end method

.method public constructor <init>(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V
    .locals 2
    .parameter "info"

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;-><init>(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mFolderInfo:Lcom/cyanogenmod/trebuchet/FolderInfo;

    .line 86
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 87
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 88
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    if-eqz v0, :cond_0

    .line 89
    new-instance v0, Landroid/content/Intent$ShortcutIconResource;

    invoke-direct {v0}, Landroid/content/Intent$ShortcutIconResource;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    .line 90
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v1, v1, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    iput-object v1, v0, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    .line 91
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v1, v1, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    iput-object v1, v0, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    .line 93
    :cond_0
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    .line 94
    iget-boolean v0, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    .line 95
    return-void
.end method

.method public static dumpShortcutInfoList(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 4
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
            "Lcom/cyanogenmod/trebuchet/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 194
    .local p2, list:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/cyanogenmod/trebuchet/ShortcutInfo;>;"
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

    .line 195
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    .line 196
    .local v1, info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "   title=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " icon="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " customIcon="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 199
    .end local v1           #info:Lcom/cyanogenmod/trebuchet/ShortcutInfo;
    :cond_0
    return-void
.end method


# virtual methods
.method public getIcon(Lcom/cyanogenmod/trebuchet/IconCache;)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "iconCache"

    .prologue
    .line 110
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    .line 111
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->updateIcon(Lcom/cyanogenmod/trebuchet/IconCache;)V

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/ItemInfo;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method onAddToDatabase(Landroid/content/ContentValues;)V
    .locals 6
    .parameter "values"

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 156
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;->onAddToDatabase(Landroid/content/ContentValues;)V

    .line 158
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    if-eqz v3, :cond_2

    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customTitle:Z

    if-nez v3, :cond_0

    iget v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    if-ne v3, v5, :cond_2

    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, titleStr:Ljava/lang/String;
    :goto_0
    const-string v3, "title"

    invoke-virtual {p1, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    if-eqz v3, :cond_3

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v2, v4}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v1

    .line 163
    .local v1, uri:Ljava/lang/String;
    :goto_1
    const-string v2, "intent"

    invoke-virtual {p1, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customIcon:Z

    if-eqz v2, :cond_4

    .line 166
    const-string v2, "iconType"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 168
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    invoke-static {p1, v2}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->writeBitmap(Landroid/content/ContentValues;Landroid/graphics/Bitmap;)V

    .line 182
    :cond_1
    :goto_2
    return-void

    .end local v0           #titleStr:Ljava/lang/String;
    .end local v1           #uri:Ljava/lang/String;
    :cond_2
    move-object v0, v2

    .line 158
    goto :goto_0

    .restart local v0       #titleStr:Ljava/lang/String;
    :cond_3
    move-object v1, v2

    .line 162
    goto :goto_1

    .line 170
    .restart local v1       #uri:Ljava/lang/String;
    :cond_4
    iget-boolean v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    if-nez v2, :cond_5

    .line 171
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    invoke-static {p1, v2}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->writeBitmap(Landroid/content/ContentValues;Landroid/graphics/Bitmap;)V

    .line 173
    :cond_5
    const-string v2, "iconType"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 175
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    if-eqz v2, :cond_1

    .line 176
    const-string v2, "iconPackage"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v3, v3, Landroid/content/Intent$ShortcutIconResource;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-string v2, "iconResource"

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->iconResource:Landroid/content/Intent$ShortcutIconResource;

    iget-object v3, v3, Landroid/content/Intent$ShortcutIconResource;->resourceName:Ljava/lang/String;

    invoke-virtual {p1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method final setActivity(Landroid/content/ComponentName;I)V
    .locals 2
    .parameter "className"
    .parameter "launchFlags"

    .prologue
    .line 135
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    .line 136
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 138
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 139
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    .line 140
    return-void
.end method

.method public setIcon(Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "b"

    .prologue
    .line 106
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    .line 107
    return-void
.end method

.method setListener(Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 151
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mListener:Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;

    .line 152
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "title"

    .prologue
    .line 143
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    .line 144
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->customTitle:Z

    .line 145
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mListener:Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mListener:Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;

    invoke-interface {v0, p1}, Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;->onTitleChanged(Ljava/lang/CharSequence;)V

    .line 148
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ShortcutInfo(title="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "intent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->id:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->itemType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " container="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->container:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " screen="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->screen:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cellX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cellY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->cellY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " spanX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " spanY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->spanY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dropPos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->dropPos:[I

    invoke-static {v1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "unknown "

    goto/16 :goto_0
.end method

.method public updateIcon(Lcom/cyanogenmod/trebuchet/IconCache;)V
    .locals 1
    .parameter "iconCache"

    .prologue
    .line 123
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/IconCache;->getIcon(Landroid/content/Intent;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    .line 124
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->mIcon:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/cyanogenmod/trebuchet/IconCache;->isDefaultIcon(Landroid/graphics/Bitmap;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->usingFallbackIcon:Z

    .line 125
    return-void
.end method
