.class final Lcom/cyanogenmod/trebuchet/Utilities;
.super Ljava/lang/Object;
.source "Utilities.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.Utilities"

.field private static final sBlurPaint:Landroid/graphics/Paint;

.field private static final sCanvas:Landroid/graphics/Canvas;

.field static sColorIndex:I

.field static sColors:[I

.field private static final sDisabledPaint:Landroid/graphics/Paint;

.field private static final sGlowColorFocusedPaint:Landroid/graphics/Paint;

.field private static final sGlowColorPressedPaint:Landroid/graphics/Paint;

.field private static sIconHeight:I

.field private static sIconTextureHeight:I

.field private static sIconTextureWidth:I

.field private static sIconWidth:I

.field private static final sOldBounds:Landroid/graphics/Rect;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v0, -0x1

    .line 42
    sput v0, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    .line 43
    sput v0, Lcom/cyanogenmod/trebuchet/Utilities;->sIconHeight:I

    .line 44
    sput v0, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureWidth:I

    .line 45
    sput v0, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureHeight:I

    .line 47
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sBlurPaint:Landroid/graphics/Paint;

    .line 48
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorPressedPaint:Landroid/graphics/Paint;

    .line 49
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorFocusedPaint:Landroid/graphics/Paint;

    .line 50
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sDisabledPaint:Landroid/graphics/Paint;

    .line 51
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sOldBounds:Landroid/graphics/Rect;

    .line 52
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    .line 55
    sget-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    new-instance v1, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v2, 0x4

    const/4 v3, 0x2

    invoke-direct {v1, v2, v3}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    .line 58
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sColors:[I

    .line 59
    const/4 v0, 0x0

    sput v0, Lcom/cyanogenmod/trebuchet/Utilities;->sColorIndex:I

    return-void

    .line 58
    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0xfft 0xfft
        0x0t 0xfft 0x0t 0xfft
        0xfft 0x0t 0x0t 0xfft
    .end array-data
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createIconBitmap(Landroid/graphics/Bitmap;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 7
    .parameter "icon"
    .parameter "context"

    .prologue
    .line 67
    sget v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureWidth:I

    .line 68
    .local v4, textureWidth:I
    sget v3, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureHeight:I

    .line 69
    .local v3, textureHeight:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .line 70
    .local v2, sourceWidth:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .line 71
    .local v1, sourceHeight:I
    if-le v2, v4, :cond_1

    if-le v1, v3, :cond_1

    .line 73
    sub-int v5, v2, v4

    div-int/lit8 v5, v5, 0x2

    sub-int v6, v1, v3

    div-int/lit8 v6, v6, 0x2

    invoke-static {p0, v5, v6, v4, v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 83
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 77
    .restart local p0
    :cond_1
    if-ne v2, v4, :cond_2

    if-eq v1, v3, :cond_0

    .line 82
    :cond_2
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 83
    .local v0, resources:Landroid/content/res/Resources;
    new-instance v5, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v5, v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-static {v5, p1}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0
.end method

.method static createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 20
    .parameter "icon"
    .parameter "context"

    .prologue
    .line 91
    sget-object v18, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    monitor-enter v18

    .line 92
    :try_start_0
    sget v17, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    const/16 v19, -0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_0

    .line 93
    invoke-static/range {p1 .. p1}, Lcom/cyanogenmod/trebuchet/Utilities;->initStatics(Landroid/content/Context;)V

    .line 96
    :cond_0
    sget v16, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    .line 97
    .local v16, width:I
    sget v7, Lcom/cyanogenmod/trebuchet/Utilities;->sIconHeight:I

    .line 99
    .local v7, height:I
    move-object/from16 v0, p0

    instance-of v0, v0, Landroid/graphics/drawable/PaintDrawable;

    move/from16 v17, v0

    if-eqz v17, :cond_4

    .line 100
    move-object/from16 v0, p0

    check-cast v0, Landroid/graphics/drawable/PaintDrawable;

    move-object v9, v0

    .line 101
    .local v9, painter:Landroid/graphics/drawable/PaintDrawable;
    move/from16 v0, v16

    invoke-virtual {v9, v0}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicWidth(I)V

    .line 102
    invoke-virtual {v9, v7}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicHeight(I)V

    .line 111
    .end local v9           #painter:Landroid/graphics/drawable/PaintDrawable;
    :cond_1
    :goto_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v12

    .line 112
    .local v12, sourceWidth:I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v11

    .line 113
    .local v11, sourceHeight:I
    if-lez v12, :cond_3

    if-lez v11, :cond_3

    .line 115
    move/from16 v0, v16

    if-lt v0, v12, :cond_2

    if-ge v7, v11, :cond_6

    .line 117
    :cond_2
    int-to-float v0, v12

    move/from16 v17, v0

    int-to-float v0, v11

    move/from16 v19, v0

    div-float v10, v17, v19

    .line 118
    .local v10, ratio:F
    if-le v12, v11, :cond_5

    .line 119
    move/from16 v0, v16

    int-to-float v0, v0

    move/from16 v17, v0

    div-float v17, v17, v10

    move/from16 v0, v17

    float-to-int v7, v0

    .line 131
    .end local v10           #ratio:F
    :cond_3
    :goto_1
    sget v14, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureWidth:I

    .line 132
    .local v14, textureWidth:I
    sget v13, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureHeight:I

    .line 134
    .local v13, textureHeight:I
    sget-object v17, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move-object/from16 v0, v17

    invoke-static {v14, v13, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 136
    .local v3, bitmap:Landroid/graphics/Bitmap;
    sget-object v5, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    .line 137
    .local v5, canvas:Landroid/graphics/Canvas;
    invoke-virtual {v5, v3}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 139
    sub-int v17, v14, v16

    div-int/lit8 v8, v17, 0x2

    .line 140
    .local v8, left:I
    sub-int v17, v13, v7

    div-int/lit8 v15, v17, 0x2

    .line 143
    .local v15, top:I
    const/4 v6, 0x0

    .line 153
    .local v6, debug:Z
    sget-object v17, Lcom/cyanogenmod/trebuchet/Utilities;->sOldBounds:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 154
    add-int v17, v8, v16

    add-int v19, v15, v7

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v19

    invoke-virtual {v0, v8, v15, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 155
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 156
    sget-object v17, Lcom/cyanogenmod/trebuchet/Utilities;->sOldBounds:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 157
    const/16 v17, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v5, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 159
    monitor-exit v18

    return-object v3

    .line 103
    .end local v3           #bitmap:Landroid/graphics/Bitmap;
    .end local v5           #canvas:Landroid/graphics/Canvas;
    .end local v6           #debug:Z
    .end local v8           #left:I
    .end local v11           #sourceHeight:I
    .end local v12           #sourceWidth:I
    .end local v13           #textureHeight:I
    .end local v14           #textureWidth:I
    .end local v15           #top:I
    :cond_4
    move-object/from16 v0, p0

    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    move/from16 v17, v0

    if-eqz v17, :cond_1

    .line 105
    move-object/from16 v0, p0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    move-object v4, v0

    .line 106
    .local v4, bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v4}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    .line 107
    .restart local v3       #bitmap:Landroid/graphics/Bitmap;
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v17

    if-nez v17, :cond_1

    .line 108
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    goto/16 :goto_0

    .line 160
    .end local v3           #bitmap:Landroid/graphics/Bitmap;
    .end local v4           #bitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    .end local v7           #height:I
    .end local v16           #width:I
    :catchall_0
    move-exception v17

    monitor-exit v18
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v17

    .line 120
    .restart local v7       #height:I
    .restart local v10       #ratio:F
    .restart local v11       #sourceHeight:I
    .restart local v12       #sourceWidth:I
    .restart local v16       #width:I
    :cond_5
    if-le v11, v12, :cond_3

    .line 121
    int-to-float v0, v7

    move/from16 v17, v0

    mul-float v17, v17, v10

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v16, v0

    goto :goto_1

    .line 123
    .end local v10           #ratio:F
    :cond_6
    move/from16 v0, v16

    if-ge v12, v0, :cond_3

    if-ge v11, v7, :cond_3

    .line 125
    move/from16 v16, v12

    .line 126
    move v7, v11

    goto/16 :goto_1
.end method

.method static drawDisabledBitmap(Landroid/graphics/Bitmap;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "bitmap"
    .parameter "context"

    .prologue
    .line 214
    sget-object v3, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    monitor-enter v3

    .line 215
    :try_start_0
    sget v2, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    .line 216
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/Utilities;->initStatics(Landroid/content/Context;)V

    .line 218
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v4, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 220
    .local v1, disabled:Landroid/graphics/Bitmap;
    sget-object v0, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    .line 221
    .local v0, canvas:Landroid/graphics/Canvas;
    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 223
    const/4 v2, 0x0

    const/4 v4, 0x0

    sget-object v5, Lcom/cyanogenmod/trebuchet/Utilities;->sDisabledPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p0, v2, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 225
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 227
    monitor-exit v3

    return-object v1

    .line 228
    .end local v0           #canvas:Landroid/graphics/Canvas;
    .end local v1           #disabled:Landroid/graphics/Bitmap;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method static drawSelectedAllAppsBitmap(Landroid/graphics/Canvas;IIZLandroid/graphics/Bitmap;)V
    .locals 8
    .parameter "dest"
    .parameter "destWidth"
    .parameter "destHeight"
    .parameter "pressed"
    .parameter "src"

    .prologue
    .line 165
    sget-object v5, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    monitor-enter v5

    .line 166
    :try_start_0
    sget v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    const/4 v6, -0x1

    if-ne v4, v6, :cond_0

    .line 170
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v6, "Assertion failed: Utilities not initialized"

    invoke-direct {v4, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 184
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 173
    :cond_0
    const/4 v4, 0x0

    :try_start_1
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p0, v4, v6}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 175
    const/4 v4, 0x2

    new-array v3, v4, [I

    .line 176
    .local v3, xy:[I
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sBlurPaint:Landroid/graphics/Paint;

    invoke-virtual {p4, v4, v3}, Landroid/graphics/Bitmap;->extractAlpha(Landroid/graphics/Paint;[I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 178
    .local v0, mask:Landroid/graphics/Bitmap;
    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    sub-int v4, p1, v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v1, v4

    .line 179
    .local v1, px:F
    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    sub-int v4, p2, v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v2, v4

    .line 180
    .local v2, py:F
    const/4 v4, 0x0

    aget v4, v3, v4

    int-to-float v4, v4

    add-float v6, v1, v4

    const/4 v4, 0x1

    aget v4, v3, v4

    int-to-float v4, v4

    add-float v7, v2, v4

    if-eqz p3, :cond_1

    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorPressedPaint:Landroid/graphics/Paint;

    :goto_0
    invoke-virtual {p0, v0, v6, v7, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 183
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 184
    monitor-exit v5

    .line 185
    return-void

    .line 180
    :cond_1
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorFocusedPaint:Landroid/graphics/Paint;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method private static initStatics(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    .line 232
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 233
    .local v3, resources:Landroid/content/res/Resources;
    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 234
    .local v2, metrics:Landroid/util/DisplayMetrics;
    iget v1, v2, Landroid/util/DisplayMetrics;->density:F

    .line 236
    .local v1, density:F
    const v4, 0x7f0d0022

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v4

    float-to-int v4, v4

    sput v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconHeight:I

    sput v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    .line 237
    sget v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    sput v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureHeight:I

    sput v4, Lcom/cyanogenmod/trebuchet/Utilities;->sIconTextureWidth:I

    .line 239
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sBlurPaint:Landroid/graphics/Paint;

    new-instance v5, Landroid/graphics/BlurMaskFilter;

    const/high16 v6, 0x40a0

    mul-float/2addr v6, v1

    sget-object v7, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    invoke-direct {v5, v6, v7}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    .line 240
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorPressedPaint:Landroid/graphics/Paint;

    const/16 v5, -0x3d00

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 241
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sGlowColorFocusedPaint:Landroid/graphics/Paint;

    const/16 v5, -0x7200

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 243
    new-instance v0, Landroid/graphics/ColorMatrix;

    invoke-direct {v0}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 244
    .local v0, cm:Landroid/graphics/ColorMatrix;
    const v4, 0x3e4ccccd

    invoke-virtual {v0, v4}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 245
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sDisabledPaint:Landroid/graphics/Paint;

    new-instance v5, Landroid/graphics/ColorMatrixColorFilter;

    invoke-direct {v5, v0}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 246
    sget-object v4, Lcom/cyanogenmod/trebuchet/Utilities;->sDisabledPaint:Landroid/graphics/Paint;

    const/16 v5, 0x88

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 247
    return-void
.end method

.method static resampleIconBitmap(Landroid/graphics/Bitmap;Landroid/content/Context;)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "bitmap"
    .parameter "context"

    .prologue
    .line 199
    sget-object v2, Lcom/cyanogenmod/trebuchet/Utilities;->sCanvas:Landroid/graphics/Canvas;

    monitor-enter v2

    .line 200
    :try_start_0
    sget v1, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 201
    invoke-static {p1}, Lcom/cyanogenmod/trebuchet/Utilities;->initStatics(Landroid/content/Context;)V

    .line 204
    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    sget v3, Lcom/cyanogenmod/trebuchet/Utilities;->sIconWidth:I

    if-ne v1, v3, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget v3, Lcom/cyanogenmod/trebuchet/Utilities;->sIconHeight:I

    if-ne v1, v3, :cond_1

    .line 205
    monitor-exit v2

    .line 208
    .end local p0
    :goto_0
    return-object p0

    .line 207
    .restart local p0
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 208
    .local v0, resources:Landroid/content/res/Resources;
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v0, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-static {v1, p1}, Lcom/cyanogenmod/trebuchet/Utilities;->createIconBitmap(Landroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/Bitmap;

    move-result-object p0

    .end local p0
    monitor-exit v2

    goto :goto_0

    .line 210
    .end local v0           #resources:Landroid/content/res/Resources;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
