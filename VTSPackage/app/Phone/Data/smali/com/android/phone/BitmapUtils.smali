.class public Lcom/android/phone/BitmapUtils;
.super Ljava/lang/Object;
.source "BitmapUtils.java"


# static fields
.field private static final BLUE_MASK:I = 0xff

#the value of this static final field might be set in the static constructor
.field private static final DBG:Z = false

.field private static final GREEN_MASK:I = 0xff00

.field private static final GREEN_MASK_SHIFT:I = 0x8

.field private static final RED_MASK:I = 0xff0000

.field private static final RED_MASK_SHIFT:I = 0x10

.field private static final TAG:Ljava/lang/String; = "BitmapUtils"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 30
    const-string v2, "ro.debuggable"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    sput-boolean v0, Lcom/android/phone/BitmapUtils;->DBG:Z

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static createBlurredBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 8
    .parameter "bitmap"

    .prologue
    const/16 v7, 0x80

    .line 61
    sget-boolean v5, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v5, :cond_0

    const-string v5, "createBlurredBitmap()..."

    invoke-static {v5}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    .line 62
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 63
    .local v3, startTime:J
    if-nez p0, :cond_2

    .line 64
    const-string v5, "BitmapUtils"

    const-string v6, "createBlurredBitmap: null bitmap"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    const/4 p0, 0x0

    .line 83
    .end local p0
    :cond_1
    :goto_0
    return-object p0

    .line 68
    .restart local p0
    :cond_2
    sget-boolean v5, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v5, :cond_3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "- input bitmap: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " x "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    .line 72
    :cond_3
    const/16 v2, 0x80

    .line 73
    .local v2, scaledSize:I
    const/4 v5, 0x1

    invoke-static {p0, v7, v7, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 76
    sget-boolean v5, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v5, :cond_4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "- after resize: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " x "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    .line 78
    :cond_4
    invoke-static {p0}, Lcom/android/phone/BitmapUtils;->gaussianBlur(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 79
    sget-boolean v5, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v5, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "- after blur: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " x "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    .line 81
    :cond_5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 82
    .local v0, endTime:J
    sget-boolean v5, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "createBlurredBitmap() done (elapsed = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-long v6, v0, v3

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " msec)"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public static gaussianBlur(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 11
    .parameter "source"

    .prologue
    const/4 v2, 0x0

    .line 93
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 94
    .local v3, width:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 95
    .local v7, height:I
    sget-boolean v0, Lcom/android/phone/BitmapUtils;->DBG:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "gaussianBlur(): input: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " x "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/phone/BitmapUtils;->log(Ljava/lang/String;)V

    .line 98
    :cond_0
    mul-int v9, v3, v7

    .line 99
    .local v9, numPixels:I
    new-array v1, v9, [I

    .line 100
    .local v1, in:[I
    new-array v10, v9, [I

    .local v10, tmp:[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 103
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 112
    invoke-static {v1, v10, v3, v7}, Lcom/android/phone/BitmapUtils;->gaussianBlurFilter([I[III)V

    .line 113
    invoke-static {v10, v1, v3, v7}, Lcom/android/phone/BitmapUtils;->gaussianBlurFilter([I[III)V

    .line 116
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v7, v0}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    .line 117
    .local v8, filtered:Landroid/graphics/Bitmap;
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 118
    return-object v8
.end method

.method private static gaussianBlurFilter([I[III)V
    .locals 17
    .parameter "in"
    .parameter "out"
    .parameter "width"
    .parameter "height"

    .prologue
    .line 124
    const/4 v1, 0x4

    .line 125
    .local v1, RADIUS:I
    const/16 v15, 0x9

    new-array v11, v15, [I

    fill-array-data v11, :array_0

    .line 126
    .local v11, weights:[I
    const/4 v7, 0x0

    .line 127
    .local v7, inPos:I
    add-int/lit8 v12, p2, -0x1

    .line 128
    .local v12, widthMask:I
    const/4 v14, 0x0

    .local v14, y:I
    :goto_0
    move/from16 v0, p3

    if-ge v14, v0, :cond_2

    .line 130
    const/16 v2, 0xff

    .line 132
    .local v2, alpha:I
    move v8, v14

    .line 133
    .local v8, outPos:I
    const/4 v13, 0x0

    .local v13, x:I
    :goto_1
    move/from16 v0, p2

    if-ge v13, v0, :cond_1

    .line 134
    const/4 v9, 0x0

    .line 135
    .local v9, red:I
    const/4 v5, 0x0

    .line 136
    .local v5, green:I
    const/4 v4, 0x0

    .line 137
    .local v4, blue:I
    const/4 v6, -0x4

    .local v6, i:I
    :goto_2
    const/4 v15, 0x4

    if-gt v6, v15, :cond_0

    .line 138
    add-int v15, v13, v6

    and-int/2addr v15, v12

    add-int/2addr v15, v7

    aget v3, p0, v15

    .line 139
    .local v3, argb:I
    add-int/lit8 v15, v6, 0x4

    aget v10, v11, v15

    .line 140
    .local v10, weight:I
    const/high16 v15, 0xff

    and-int/2addr v15, v3

    shr-int/lit8 v15, v15, 0x10

    mul-int/2addr v15, v10

    add-int/2addr v9, v15

    .line 141
    const v15, 0xff00

    and-int/2addr v15, v3

    shr-int/lit8 v15, v15, 0x8

    mul-int/2addr v15, v10

    add-int/2addr v5, v15

    .line 142
    and-int/lit16 v15, v3, 0xff

    mul-int/2addr v15, v10

    add-int/2addr v4, v15

    .line 137
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 145
    .end local v3           #argb:I
    .end local v10           #weight:I
    :cond_0
    const/high16 v15, -0x100

    shr-int/lit8 v16, v9, 0x8

    shl-int/lit8 v16, v16, 0x10

    or-int v15, v15, v16

    shr-int/lit8 v16, v5, 0x8

    shl-int/lit8 v16, v16, 0x8

    or-int v15, v15, v16

    shr-int/lit8 v16, v4, 0x8

    or-int v15, v15, v16

    aput v15, p1, v8

    .line 148
    add-int v8, v8, p3

    .line 133
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 150
    .end local v4           #blue:I
    .end local v5           #green:I
    .end local v6           #i:I
    .end local v9           #red:I
    :cond_1
    add-int v7, v7, p2

    .line 128
    add-int/lit8 v14, v14, 0x1

    goto :goto_0

    .line 152
    .end local v2           #alpha:I
    .end local v8           #outPos:I
    .end local v13           #x:I
    :cond_2
    return-void

    .line 125
    :array_0
    .array-data 0x4
        0xdt 0x0t 0x0t 0x0t
        0x17t 0x0t 0x0t 0x0t
        0x20t 0x0t 0x0t 0x0t
        0x27t 0x0t 0x0t 0x0t
        0x2at 0x0t 0x0t 0x0t
        0x27t 0x0t 0x0t 0x0t
        0x20t 0x0t 0x0t 0x0t
        0x17t 0x0t 0x0t 0x0t
        0xdt 0x0t 0x0t 0x0t
    .end array-data
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1
    .parameter "msg"

    .prologue
    .line 159
    const-string v0, "BitmapUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    return-void
.end method
