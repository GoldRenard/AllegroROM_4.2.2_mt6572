.class Lcom/cyanogenmod/trebuchet/ItemInfo;
.super Ljava/lang/Object;
.source "ItemInfo.java"


# static fields
.field static final NO_ID:I = -0x1


# instance fields
.field cellX:I

.field cellY:I

.field container:J

.field dropPos:[I

.field id:J

.field itemType:I

.field minSpanX:I

.field minSpanY:I

.field requiresDbUpdate:Z

.field screen:I

.field spanX:I

.field spanY:I

.field title:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>()V
    .locals 4

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, -0x1

    const/4 v0, 0x1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 54
    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 59
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 64
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 69
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 74
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 79
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 84
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    .line 89
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->requiresDbUpdate:Z

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    .line 107
    return-void
.end method

.method constructor <init>(Lcom/cyanogenmod/trebuchet/ItemInfo;)V
    .locals 4
    .parameter "info"

    .prologue
    const-wide/16 v2, -0x1

    const/4 v1, -0x1

    const/4 v0, 0x1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 54
    iput-wide v2, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 59
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 64
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 69
    iput v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 74
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 79
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 84
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanX:I

    .line 89
    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->minSpanY:I

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->requiresDbUpdate:Z

    .line 104
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

    .line 110
    iget-wide v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    .line 111
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    .line 112
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    .line 113
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    .line 114
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    .line 115
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    .line 116
    iget v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    .line 117
    iget-wide v0, p1, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    .line 119
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->checkItemInfo(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 120
    return-void
.end method

.method static flattenBitmap(Landroid/graphics/Bitmap;)[B
    .locals 5
    .parameter "bitmap"

    .prologue
    .line 160
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    mul-int/2addr v3, v4

    mul-int/lit8 v2, v3, 0x4

    .line 161
    .local v2, size:I
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 163
    .local v1, out:Ljava/io/ByteArrayOutputStream;
    :try_start_0
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p0, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 164
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->flush()V

    .line 165
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 166
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 169
    :goto_0
    return-object v3

    .line 167
    :catch_0
    move-exception v0

    .line 168
    .local v0, e:Ljava/io/IOException;
    const-string v3, "Favorite"

    const-string v4, "Could not write icon"

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 169
    const/4 v3, 0x0

    goto :goto_0
.end method

.method static getPackageName(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2
    .parameter "intent"

    .prologue
    .line 125
    if-eqz p0, :cond_1

    .line 126
    invoke-virtual {p0}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    .line 127
    .local v0, packageName:Ljava/lang/String;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 128
    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 130
    :cond_0
    if-eqz v0, :cond_1

    .line 134
    .end local v0           #packageName:Ljava/lang/String;
    :goto_0
    return-object v0

    :cond_1
    const-string v0, ""

    goto :goto_0
.end method

.method static writeBitmap(Landroid/content/ContentValues;Landroid/graphics/Bitmap;)V
    .locals 2
    .parameter "values"
    .parameter "bitmap"

    .prologue
    .line 174
    if-eqz p1, :cond_0

    .line 175
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/ItemInfo;->flattenBitmap(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    .line 176
    .local v0, data:[B
    const-string v1, "icon"

    invoke-virtual {p0, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 178
    .end local v0           #data:[B
    :cond_0
    return-void
.end method


# virtual methods
.method onAddToDatabase(Landroid/content/ContentValues;)V
    .locals 3
    .parameter "values"

    .prologue
    .line 143
    const-string v0, "itemType"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 144
    const-string v0, "container"

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 145
    const-string v0, "screen"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 146
    const-string v0, "cellX"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 147
    const-string v0, "cellY"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 148
    const-string v0, "spanX"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 149
    const-string v0, "spanY"

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 150
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Item(id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->id:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->itemType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " container="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->container:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " screen="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->screen:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cellX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " cellY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->cellY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " spanX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " spanY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->spanY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dropPos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/ItemInfo;->dropPos:[I

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
.end method

.method unbind()V
    .locals 0

    .prologue
    .line 187
    return-void
.end method

.method updateValuesWithCoordinates(Landroid/content/ContentValues;II)V
    .locals 2
    .parameter "values"
    .parameter "cellX"
    .parameter "cellY"

    .prologue
    .line 153
    const-string v0, "cellX"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 154
    const-string v0, "cellY"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 155
    return-void
.end method
