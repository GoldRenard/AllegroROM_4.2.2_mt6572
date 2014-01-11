.class public final Lcom/mediatek/phone/vt/VTCallUtils;
.super Ljava/lang/Object;
.source "VTCallUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;
    }
.end annotation


# static fields
.field private static final BITMAP_COMPRESS_QUALITY:I = 0x64

.field private static final CHANGE_FILE_PERMISSION:Ljava/lang/String; = "chmod 640 "

.field private static final DBG:Z = true

.field private static final LOG_TAG:Ljava/lang/String; = "VTCallUtils"

.field private static final VDBG:Z = true

.field public static final VT_CALL_END:Ljava/lang/String; = "android.phone.extra.VT_CALL_END"

.field public static final VT_CALL_START:Ljava/lang/String; = "android.phone.extra.VT_CALL_START"

.field private static sDialWithSpeakerOff:Z

.field private static sNumbersDefault:[Ljava/lang/String;

.field private static sNumbersNone:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 97
    sput-boolean v2, Lcom/mediatek/phone/vt/VTCallUtils;->sDialWithSpeakerOff:Z

    .line 307
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "12531"

    aput-object v1, v0, v2

    const-string v1, "+8612531"

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/phone/vt/VTCallUtils;->sNumbersNone:[Ljava/lang/String;

    .line 308
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "12535"

    aput-object v1, v0, v2

    const-string v1, "13800100011"

    aput-object v1, v0, v3

    const-string v1, "+8612535"

    aput-object v1, v0, v4

    const/4 v1, 0x3

    const-string v2, "+8613800100011"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/phone/vt/VTCallUtils;->sNumbersDefault:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 99
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 100
    return-void
.end method

.method private static checkDefaultPictureFile()V
    .locals 5

    .prologue
    .line 167
    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 169
    const-string v3, "checkVTFile() : the default pic file not exists , create it ! "

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 173
    :try_start_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020104

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 176
    .local v0, btp1:Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 177
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 179
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - Bitmap.isRecycled() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 185
    :cond_0
    :goto_0
    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 187
    const-string v3, "checkVTFile() : the default pic2 file not exists , create it ! "

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 190
    :try_start_1
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020104

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 192
    .local v1, btp3:Landroid/graphics/Bitmap;
    invoke-static {}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathDefault2()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 193
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 195
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - Bitmap.isRecycled() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 201
    .end local v1           #btp3:Landroid/graphics/Bitmap;
    :cond_1
    :goto_1
    return-void

    .line 181
    :catch_0
    move-exception v2

    .line 182
    .local v2, e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 197
    .end local v2           #e:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 198
    .restart local v2       #e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private static checkUserSelectPictureFile(I)V
    .locals 5
    .parameter "slotId"

    .prologue
    .line 204
    new-instance v3, Ljava/io/File;

    invoke-static {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 206
    const-string v3, "checkVTFile() : the default user select pic file not exists , create it ! "

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 209
    :try_start_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020104

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 211
    .local v0, btp2:Landroid/graphics/Bitmap;
    invoke-static {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 212
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 214
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - Bitmap.isRecycled() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    .end local v0           #btp2:Landroid/graphics/Bitmap;
    :cond_0
    :goto_0
    new-instance v3, Ljava/io/File;

    invoke-static {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    .line 223
    const-string v3, "checkVTFile() : the default user select pic2 file not exists , create it ! "

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 226
    :try_start_1
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/phone/PhoneGlobals;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f020104

    invoke-static {v3, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 228
    .local v1, btp4:Landroid/graphics/Bitmap;
    invoke-static {p0}, Lcom/mediatek/settings/VTAdvancedSetting;->getPicPathUserselect2(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/mediatek/phone/vt/VTCallUtils;->saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 229
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 231
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " - Bitmap.isRecycled() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 239
    .end local v1           #btp4:Landroid/graphics/Bitmap;
    :cond_1
    :goto_1
    const-string v3, "end checkVTFile() ! "

    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 241
    return-void

    .line 216
    :catch_0
    move-exception v2

    .line 217
    .local v2, e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 233
    .end local v2           #e:Ljava/io/IOException;
    :catch_1
    move-exception v2

    .line 234
    .restart local v2       #e:Ljava/io/IOException;
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method public static checkVTFile()V
    .locals 6

    .prologue
    .line 136
    const-string v5, "start checkVTFile() !"

    invoke-static {v5}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 138
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->checkDefaultPictureFile()V

    .line 140
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v4

    .line 141
    .local v4, slots:[I
    move-object v0, v4

    .local v0, arr$:[I
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget v3, v0, v1

    .line 142
    .local v3, slot:I
    invoke-static {v3}, Lcom/mediatek/phone/vt/VTCallUtils;->checkUserSelectPictureFile(I)V

    .line 141
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 148
    .end local v3           #slot:I
    :cond_0
    const-string v5, "end checkVTFile() ! "

    invoke-static {v5}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 150
    return-void
.end method

.method public static checkVTFile(I)V
    .locals 2
    .parameter "slotId"

    .prologue
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "start checkVTFile() !, slotId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 159
    invoke-static {}, Lcom/mediatek/phone/vt/VTCallUtils;->checkDefaultPictureFile()V

    .line 160
    invoke-static {p0}, Lcom/mediatek/phone/vt/VTCallUtils;->checkUserSelectPictureFile(I)V

    .line 162
    const-string v0, "end checkVTFile() ! "

    invoke-static {v0}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 164
    return-void
.end method

.method public static checkVTTimingMode(Ljava/lang/String;)Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;
    .locals 4
    .parameter "number"

    .prologue
    .line 321
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkVTTimingMode - number:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 324
    new-instance v1, Ljava/util/ArrayList;

    sget-object v2, Lcom/mediatek/phone/vt/VTCallUtils;->sNumbersNone:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 325
    .local v1, arrayListNone:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/ArrayList;

    sget-object v2, Lcom/mediatek/phone/vt/VTCallUtils;->sNumbersDefault:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 327
    .local v0, arrayListDefault:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_0

    .line 329
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkVTTimingMode - return:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 331
    sget-object v2, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_NONE:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    .line 341
    :goto_0
    return-object v2

    .line 334
    :cond_0
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    if-ltz v2, :cond_1

    .line 336
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkVTTimingMode - return:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 338
    sget-object v2, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    goto :goto_0

    .line 341
    :cond_1
    sget-object v2, Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;->VT_TIMING_DEFAULT:Lcom/mediatek/phone/vt/VTCallUtils$VTTimingMode;

    goto :goto_0
.end method

.method public static isVTActive()Z
    .locals 1

    .prologue
    .line 515
    const/4 v0, 0x0

    return v0
.end method

.method public static isVTCallActive()Z
    .locals 1

    .prologue
    .line 528
    const/4 v0, 0x0

    return v0
.end method

.method public static isVTDialWithSpeakerOff()Z
    .locals 1

    .prologue
    .line 598
    const/4 v0, 0x0

    return v0
.end method

.method public static isVTIdle()Z
    .locals 1

    .prologue
    .line 493
    const/4 v0, 0x1

    return v0
.end method

.method public static isVTRinging()Z
    .locals 1

    .prologue
    .line 553
    const/4 v0, 0x0

    return v0
.end method

.method public static isVideoCall(Lcom/android/internal/telephony/Call;)Z
    .locals 2
    .parameter "call"

    .prologue
    const/4 v0, 0x0

    .line 482
    if-nez p0, :cond_1

    .line 488
    :cond_0
    :goto_0
    return v0

    .line 485
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 488
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->isVideo()Z

    move-result v0

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 103
    const-string v0, "VTCallUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    return-void
.end method

.method public static placeVTCall(Lcom/android/internal/telephony/Phone;Ljava/lang/String;Landroid/net/Uri;I)I
    .locals 12
    .parameter "phone"
    .parameter "number"
    .parameter "contactRef"
    .parameter "simId"

    .prologue
    const/4 v11, -0x1

    const/4 v10, 0x1

    const/4 v7, 0x2

    .line 353
    const/4 v5, 0x0

    .line 356
    .local v5, status:I
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "placeVTCall: \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\'..."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "simId : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 359
    sget-object v8, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v9

    iget-object v9, v9, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v9}, Lcom/android/internal/telephony/CallManager;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v9

    if-eq v8, v9, :cond_0

    .line 473
    :goto_0
    return v7

    .line 362
    :cond_0
    invoke-static {p1}, Lcom/mediatek/telephony/PhoneNumberUtilsEx;->isIdleSsString(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 364
    const-string v8, "the number for VT call is idle ss string"

    invoke-static {v8}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 468
    :catch_0
    move-exception v2

    .line 469
    .local v2, ex:Lcom/android/internal/telephony/CallStateException;
    const-string v7, "VTCallUtils"

    const-string v8, "Exception from vtDial()"

    invoke-static {v7, v8, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 470
    const/4 v5, 0x2

    .end local v2           #ex:Lcom/android/internal/telephony/CallStateException;
    :cond_1
    :goto_1
    move v7, v5

    .line 473
    goto :goto_0

    .line 369
    :cond_2
    :try_start_1
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->isUriNumber(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_3

    instance-of v8, p0, Lcom/android/internal/telephony/sip/SipPhone;

    if-eqz v8, :cond_4

    .line 371
    :cond_3
    const-string v8, "the number for VT call is idle uri string"

    invoke-static {v8}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 376
    :cond_4
    const/4 v4, 0x0

    .line 378
    .local v4, nCSNetType:I
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getSlots()[I

    move-result-object v8

    invoke-static {p3, v8}, Lcom/mediatek/phone/gemini/GeminiUtils;->getIndexInArray(I[I)I

    move-result v3

    .line 379
    .local v3, index:I
    if-eq v3, v11, :cond_5

    .line 380
    sget-object v8, Lcom/mediatek/phone/GeminiConstants;->PROPERTY_CS_NETWORK_TYPES:[Ljava/lang/String;

    aget-object v8, v8, v3

    const/4 v9, -0x1

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 384
    :cond_5
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "==> placeVTCall(): nCSNetType: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " index="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 386
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v8

    invoke-virtual {v8, p3}, Lcom/mediatek/settings/VTSettingUtils;->updateVTSettingState(I)V

    .line 387
    if-eq v10, v4, :cond_6

    if-ne v7, v4, :cond_7

    .line 388
    :cond_6
    const/4 v7, 0x3

    goto :goto_0

    .line 391
    :cond_7
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->reset()V

    .line 392
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    iget-boolean v7, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    if-nez v7, :cond_8

    .line 393
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v7

    new-instance v8, Landroid/content/Intent;

    const-string v9, "android.phone.extra.VT_CALL_START"

    invoke-direct {v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Lcom/android/phone/PhoneGlobals;->sendBroadcast(Landroid/content/Intent;)V

    .line 394
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    const/4 v8, 0x1

    iput-boolean v8, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTInControlRes:Z

    .line 396
    :cond_8
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    const/4 v8, 0x0

    iput-boolean v8, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTIsMT:Z

    .line 397
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    iput p3, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSlotId:I

    .line 399
    invoke-static {p3}, Lcom/mediatek/phone/vt/VTCallUtils;->checkVTFile(I)V

    .line 400
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mediatek/settings/VTSettingUtils;->updateVTEngineerModeValues()V

    .line 402
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v8

    iget-boolean v8, v8, Lcom/mediatek/settings/VTSettingUtils;->mPeerBigger:Z

    iput-boolean v8, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTPeerBigger:Z

    .line 405
    const-string v7, "- set VTManager open ! "

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 407
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v7

    if-eqz v7, :cond_9

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v7

    iget-object v0, v7, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    .line 409
    .local v0, callManager:Ljava/lang/Object;
    :goto_2
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v7

    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/phone/PhoneGlobals;->getBaseContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v7, v8, v0, p3}, Lcom/mediatek/vt/VTManager;->setVTOpen(Landroid/content/Context;Ljava/lang/Object;I)V

    .line 411
    const-string v7, "- finish set VTManager open ! "

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 414
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    iget-boolean v7, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedH:Z

    if-eqz v7, :cond_a

    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    iget-boolean v7, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSurfaceChangedL:Z

    if-eqz v7, :cond_a

    .line 417
    const-string v7, "- set VTManager ready ! "

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 419
    invoke-static {}, Lcom/mediatek/vt/VTManager;->getInstance()Lcom/mediatek/vt/VTManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/mediatek/vt/VTManager;->setVTReady()V

    .line 421
    const-string v7, "- finish set VTManager ready ! "

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 427
    :goto_3
    invoke-static {p0}, Lcom/android/phone/PhoneUtils;->placeCallRegister(Lcom/android/internal/telephony/Phone;)V

    .line 428
    invoke-static {p0, p1, p3}, Lcom/mediatek/phone/vt/VTCallUtils;->vtDial(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;

    move-result-object v1

    .line 430
    .local v1, conn:Lcom/android/internal/telephony/Connection;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "vtDial() returned: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 432
    if-nez v1, :cond_c

    .line 433
    invoke-interface {p0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v7

    if-ne v7, v10, :cond_b

    .line 436
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "dialed MMI code: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 438
    const/4 v5, 0x1

    goto/16 :goto_1

    .line 407
    .end local v0           #callManager:Ljava/lang/Object;
    .end local v1           #conn:Lcom/android/internal/telephony/Connection;
    :cond_9
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v7

    iget-object v0, v7, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    goto :goto_2

    .line 424
    .restart local v0       #callManager:Ljava/lang/Object;
    :cond_a
    invoke-static {}, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->getInstance()Lcom/mediatek/phone/vt/VTInCallScreenFlags;

    move-result-object v7

    const/4 v8, 0x1

    iput-boolean v8, v7, Lcom/mediatek/phone/vt/VTInCallScreenFlags;->mVTSettingReady:Z

    goto :goto_3

    .line 442
    .restart local v1       #conn:Lcom/android/internal/telephony/Connection;
    :cond_b
    const/4 v5, 0x2

    goto/16 :goto_1

    .line 445
    :cond_c
    const/4 v7, 0x2

    invoke-static {v7}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    .line 452
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    const-string v8, "content"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 453
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getUserData()Ljava/lang/Object;

    move-result-object v6

    .line 454
    .local v6, userDataObject:Ljava/lang/Object;
    if-nez v6, :cond_d

    .line 455
    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/Connection;->setUserData(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 460
    :cond_d
    instance-of v7, v6, Lcom/android/internal/telephony/CallerInfo;

    if-eqz v7, :cond_e

    .line 461
    check-cast v6, Lcom/android/internal/telephony/CallerInfo;

    .end local v6           #userDataObject:Ljava/lang/Object;
    iput-object p2, v6, Lcom/android/internal/telephony/CallerInfo;->contactRefUri:Landroid/net/Uri;

    goto/16 :goto_1

    .line 463
    .restart local v6       #userDataObject:Ljava/lang/Object;
    :cond_e
    check-cast v6, Lcom/android/phone/PhoneUtils$CallerInfoToken;

    .end local v6           #userDataObject:Ljava/lang/Object;
    iget-object v7, v6, Lcom/android/phone/PhoneUtils$CallerInfoToken;->currentInfo:Lcom/android/internal/telephony/CallerInfo;

    iput-object p2, v7, Lcom/android/internal/telephony/CallerInfo;->contactRefUri:Landroid/net/Uri;
    :try_end_1
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_1
.end method

.method public static saveMyBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 7
    .parameter "bitName"
    .parameter "bitmap"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 251
    const-string v5, "saveMyBitmap()..."

    invoke-static {v5}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 254
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 255
    .local v4, file:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 256
    const/4 v2, 0x0

    .line 259
    .local v2, fOut:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2           #fOut:Ljava/io/FileOutputStream;
    .local v3, fOut:Ljava/io/FileOutputStream;
    move-object v2, v3

    .line 264
    .end local v3           #fOut:Ljava/io/FileOutputStream;
    .restart local v2       #fOut:Ljava/io/FileOutputStream;
    :goto_0
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {p1, v5, v6, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 266
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 273
    :goto_1
    :try_start_2
    const-string v5, "Change file visit right for mediaserver process"

    invoke-static {v5}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 277
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "chmod 640 "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 278
    .local v0, command:Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 287
    .end local v0           #command:Ljava/lang/String;
    :goto_2
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 291
    :goto_3
    return-void

    .line 260
    :catch_0
    move-exception v1

    .line 261
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 267
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v1

    .line 268
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 279
    .end local v1           #e:Ljava/io/IOException;
    :catch_2
    move-exception v1

    .line 280
    .restart local v1       #e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 282
    const-string v5, "exception happens when change file permission"

    invoke-static {v5}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    goto :goto_2

    .line 288
    .end local v1           #e:Ljava/io/IOException;
    :catch_3
    move-exception v1

    .line 289
    .restart local v1       #e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3
.end method

.method public static setVTDialWithSpeakerOff(Z)V
    .locals 0
    .parameter "off"

    .prologue
    .line 607
    sput-boolean p0, Lcom/mediatek/phone/vt/VTCallUtils;->sDialWithSpeakerOff:Z

    .line 608
    return-void
.end method

.method public static showVTIncomingCallUi()V
    .locals 4

    .prologue
    .line 111
    const-string v2, "showVTIncomingCallUi()..."

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 114
    invoke-static {}, Lcom/mediatek/settings/VTSettingUtils;->getInstance()Lcom/mediatek/settings/VTSettingUtils;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mediatek/settings/VTSettingUtils;->updateVTEngineerModeValues()V

    .line 116
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v0

    .line 119
    .local v0, app:Lcom/android/phone/PhoneGlobals;
    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v2

    const-string v3, "call"

    invoke-interface {v2, v3}, Landroid/app/IActivityManager;->closeSystemDialogs(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    :goto_0
    sget-object v2, Lcom/android/phone/PhoneGlobals$WakeState;->FULL:Lcom/android/phone/PhoneGlobals$WakeState;

    invoke-virtual {v0, v2}, Lcom/android/phone/PhoneGlobals;->requestWakeState(Lcom/android/phone/PhoneGlobals$WakeState;)V

    .line 128
    const-string v2, "- updating notification from showVTIncomingCall()..."

    invoke-static {v2}, Lcom/mediatek/phone/vt/VTCallUtils;->log(Ljava/lang/String;)V

    .line 131
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/android/phone/PhoneGlobals;->displayCallScreen(Z)V

    .line 132
    return-void

    .line 120
    :catch_0
    move-exception v1

    .line 121
    .local v1, e:Landroid/os/RemoteException;
    invoke-virtual {v1}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method private static vtDial(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;
    .locals 3
    .parameter "phone"
    .parameter "number"
    .parameter "simId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 577
    const/4 v0, 0x0

    .line 578
    .local v0, conn:Lcom/android/internal/telephony/Connection;
    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->isGeminiSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 582
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->mCMGemini:Lcom/android/internal/telephony/gemini/MTKCallManager;

    invoke-static {}, Lcom/mediatek/phone/gemini/GeminiUtils;->getDefaultSlot()I

    move-result v2

    invoke-virtual {v1, p0, p1, v2}, Lcom/android/internal/telephony/gemini/MTKCallManager;->vtDialGemini(Lcom/android/internal/telephony/Phone;Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 587
    :goto_0
    return-object v0

    .line 585
    :cond_0
    invoke-static {}, Lcom/android/phone/PhoneGlobals;->getInstance()Lcom/android/phone/PhoneGlobals;

    move-result-object v1

    iget-object v1, v1, Lcom/android/phone/PhoneGlobals;->mCM:Lcom/android/internal/telephony/CallManager;

    invoke-virtual {v1, p0, p1}, Lcom/android/internal/telephony/CallManager;->vtDial(Lcom/android/internal/telephony/Phone;Ljava/lang/String;)Lcom/android/internal/telephony/Connection;

    move-result-object v0

    goto :goto_0
.end method
