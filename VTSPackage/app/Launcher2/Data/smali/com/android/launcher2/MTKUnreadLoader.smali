.class public Lcom/android/launcher2/MTKUnreadLoader;
.super Landroid/content/BroadcastReceiver;
.source "MTKUnreadLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;
    }
.end annotation


# static fields
.field private static final LOG_LOCK:Ljava/lang/Object; = null

.field private static final TAG:Ljava/lang/String; = "MTKUnreadLoader"

.field private static final TAG_UNREADSHORTCUTS:Ljava/lang/String; = "unreadshortcuts"

.field private static final UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/launcher2/UnreadSupportShortcut;",
            ">;"
        }
    .end annotation
.end field

.field private static sUnreadSupportShortcutsNum:I


# instance fields
.field private mCallbacks:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    .line 72
    const/4 v0, 0x0

    sput v0, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I

    .line 73
    new-instance v0, Ljava/lang/Object;

    invoke-direct/range {v0 .. v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/launcher2/MTKUnreadLoader;->LOG_LOCK:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 79
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/android/launcher2/MTKUnreadLoader;->mContext:Landroid/content/Context;

    .line 81
    return-void
.end method

.method static synthetic access$000(Lcom/android/launcher2/MTKUnreadLoader;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/launcher2/MTKUnreadLoader;->loadUnreadSupportShortcuts()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/launcher2/MTKUnreadLoader;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 66
    invoke-direct {p0}, Lcom/android/launcher2/MTKUnreadLoader;->initUnreadNumberFromSystem()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/launcher2/MTKUnreadLoader;)Ljava/lang/ref/WeakReference;
    .locals 1
    .parameter "x0"

    .prologue
    .line 66
    iget-object v0, p0, Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static drawUnreadEventIfNeed(Landroid/graphics/Canvas;Landroid/view/View;)V
    .locals 30
    .parameter "canvas"
    .parameter "icon"

    .prologue
    .line 320
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/launcher2/ItemInfo;

    .line 321
    .local v6, info:Lcom/android/launcher2/ItemInfo;
    if-eqz v6, :cond_4

    iget v0, v6, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move/from16 v26, v0

    if-lez v26, :cond_4

    .line 322
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .line 325
    .local v7, res:Landroid/content/res/Resources;
    new-instance v22, Landroid/graphics/Paint;

    invoke-direct/range {v22 .. v22}, Landroid/graphics/Paint;-><init>()V

    .line 326
    .local v22, unreadTextNumberPaint:Landroid/graphics/Paint;
    const v26, 0x7f0b0068

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move-object/from16 v0, v22

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 327
    sget-object v26, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 328
    const/16 v26, -0x1

    move-object/from16 v0, v22

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 329
    sget-object v26, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 331
    new-instance v25, Landroid/graphics/Paint;

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 332
    .local v25, unreadTextPlusPaint:Landroid/graphics/Paint;
    const v26, 0x7f0b0069

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    invoke-virtual/range {v25 .. v26}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 335
    const-string v23, "+"

    .line 336
    .local v23, unreadTextPlus:Ljava/lang/String;
    new-instance v21, Landroid/graphics/Rect;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, v21

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 337
    .local v21, unreadTextNumberBounds:Landroid/graphics/Rect;
    new-instance v24, Landroid/graphics/Rect;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    move-object/from16 v0, v24

    move/from16 v1, v26

    move/from16 v2, v27

    move/from16 v3, v28

    move/from16 v4, v29

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 338
    .local v24, unreadTextPlusBounds:Landroid/graphics/Rect;
    iget v0, v6, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move/from16 v26, v0

    const/16 v27, 0x63

    move/from16 v0, v26

    move/from16 v1, v27

    if-le v0, v1, :cond_5

    .line 339
    const/16 v26, 0x63

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    .line 340
    .local v20, unreadTextNumber:Ljava/lang/String;
    const/16 v26, 0x0

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->length()I

    move-result v27

    move-object/from16 v0, v25

    move-object/from16 v1, v23

    move/from16 v2, v26

    move/from16 v3, v27

    move-object/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 344
    :goto_0
    const/16 v26, 0x0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v27

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    move/from16 v2, v26

    move/from16 v3, v27

    move-object/from16 v4, v21

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 345
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Rect;->height()I

    move-result v8

    .line 346
    .local v8, textHeight:I
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Rect;->width()I

    move-result v26

    invoke-virtual/range {v24 .. v24}, Landroid/graphics/Rect;->width()I

    move-result v27

    add-int v9, v26, v27

    .line 349
    .local v9, textWidth:I
    const v26, 0x7f02003a

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    check-cast v12, Landroid/graphics/drawable/NinePatchDrawable;

    .line 350
    .local v12, unreadBgNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;
    invoke-virtual {v12}, Landroid/graphics/drawable/NinePatchDrawable;->getIntrinsicWidth()I

    move-result v15

    .line 351
    .local v15, unreadBgWidth:I
    invoke-virtual {v12}, Landroid/graphics/drawable/NinePatchDrawable;->getIntrinsicHeight()I

    move-result v11

    .line 353
    .local v11, unreadBgHeight:I
    const v26, 0x7f0b005e

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v18, v0

    .line 354
    .local v18, unreadMinWidth:I
    move/from16 v0, v18

    if-ge v15, v0, :cond_0

    .line 355
    move/from16 v15, v18

    .line 357
    :cond_0
    const v26, 0x7f0b0067

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v19, v0

    .line 358
    .local v19, unreadTextMargin:I
    add-int v26, v9, v19

    move/from16 v0, v26

    if-ge v15, v0, :cond_1

    .line 359
    add-int v15, v9, v19

    .line 361
    :cond_1
    if-ge v11, v8, :cond_2

    .line 362
    move v11, v8

    .line 364
    :cond_2
    new-instance v10, Landroid/graphics/Rect;

    const/16 v26, 0x0

    const/16 v27, 0x0

    move/from16 v0, v26

    move/from16 v1, v27

    invoke-direct {v10, v0, v1, v15, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 365
    .local v10, unreadBgBounds:Landroid/graphics/Rect;
    invoke-virtual {v12, v10}, Landroid/graphics/drawable/NinePatchDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 367
    const/16 v17, 0x0

    .line 368
    .local v17, unreadMarginTop:I
    const/16 v16, 0x0

    .line 369
    .local v16, unreadMarginRight:I
    instance-of v0, v6, Lcom/android/launcher2/ShortcutInfo;

    move/from16 v26, v0

    if-eqz v26, :cond_8

    .line 370
    iget-wide v0, v6, Lcom/android/launcher2/ItemInfo;->container:J

    move-wide/from16 v26, v0

    const-wide/16 v28, -0x65

    cmp-long v26, v26, v28

    if-nez v26, :cond_6

    .line 371
    const v26, 0x7f0b005f

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 372
    const v26, 0x7f0b0060

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    .line 394
    :cond_3
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScrollX()I

    move-result v26

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v27

    add-int v26, v26, v27

    sub-int v26, v26, v15

    sub-int v13, v26, v16

    .line 395
    .local v13, unreadBgPosX:I
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScrollY()I

    move-result v26

    add-int v14, v26, v17

    .line 397
    .local v14, unreadBgPosY:I
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Canvas;->save()I

    .line 398
    int-to-float v0, v13

    move/from16 v26, v0

    int-to-float v0, v14

    move/from16 v27, v0

    move-object/from16 v0, p0

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 400
    move-object/from16 v0, p0

    invoke-virtual {v12, v0}, Landroid/graphics/drawable/NinePatchDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 403
    invoke-virtual/range {v22 .. v22}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v5

    .line 404
    .local v5, fontMetrics:Landroid/graphics/Paint$FontMetrics;
    iget v0, v6, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move/from16 v26, v0

    const/16 v27, 0x63

    move/from16 v0, v26

    move/from16 v1, v27

    if-le v0, v1, :cond_b

    .line 405
    invoke-virtual/range {v24 .. v24}, Landroid/graphics/Rect;->width()I

    move-result v26

    sub-int v26, v15, v26

    div-int/lit8 v26, v26, 0x2

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    add-int v27, v11, v8

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v26

    move/from16 v3, v27

    move-object/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 409
    invoke-virtual/range {v21 .. v21}, Landroid/graphics/Rect;->width()I

    move-result v26

    add-int v26, v26, v15

    div-int/lit8 v26, v26, 0x2

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    add-int v27, v11, v8

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    iget v0, v5, Landroid/graphics/Paint$FontMetrics;->ascent:F

    move/from16 v28, v0

    const/high16 v29, 0x4000

    div-float v28, v28, v29

    add-float v27, v27, v28

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v26

    move/from16 v3, v27

    move-object/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 420
    :goto_2
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Canvas;->restore()V

    .line 422
    .end local v5           #fontMetrics:Landroid/graphics/Paint$FontMetrics;
    .end local v7           #res:Landroid/content/res/Resources;
    .end local v8           #textHeight:I
    .end local v9           #textWidth:I
    .end local v10           #unreadBgBounds:Landroid/graphics/Rect;
    .end local v11           #unreadBgHeight:I
    .end local v12           #unreadBgNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;
    .end local v13           #unreadBgPosX:I
    .end local v14           #unreadBgPosY:I
    .end local v15           #unreadBgWidth:I
    .end local v16           #unreadMarginRight:I
    .end local v17           #unreadMarginTop:I
    .end local v18           #unreadMinWidth:I
    .end local v19           #unreadTextMargin:I
    .end local v20           #unreadTextNumber:Ljava/lang/String;
    .end local v21           #unreadTextNumberBounds:Landroid/graphics/Rect;
    .end local v22           #unreadTextNumberPaint:Landroid/graphics/Paint;
    .end local v23           #unreadTextPlus:Ljava/lang/String;
    .end local v24           #unreadTextPlusBounds:Landroid/graphics/Rect;
    .end local v25           #unreadTextPlusPaint:Landroid/graphics/Paint;
    :cond_4
    return-void

    .line 342
    .restart local v7       #res:Landroid/content/res/Resources;
    .restart local v21       #unreadTextNumberBounds:Landroid/graphics/Rect;
    .restart local v22       #unreadTextNumberPaint:Landroid/graphics/Paint;
    .restart local v23       #unreadTextPlus:Ljava/lang/String;
    .restart local v24       #unreadTextPlusBounds:Landroid/graphics/Rect;
    .restart local v25       #unreadTextPlusPaint:Landroid/graphics/Paint;
    :cond_5
    iget v0, v6, Lcom/android/launcher2/ItemInfo;->unreadNum:I

    move/from16 v26, v0

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    .restart local v20       #unreadTextNumber:Ljava/lang/String;
    goto/16 :goto_0

    .line 373
    .restart local v8       #textHeight:I
    .restart local v9       #textWidth:I
    .restart local v10       #unreadBgBounds:Landroid/graphics/Rect;
    .restart local v11       #unreadBgHeight:I
    .restart local v12       #unreadBgNinePatchDrawable:Landroid/graphics/drawable/NinePatchDrawable;
    .restart local v15       #unreadBgWidth:I
    .restart local v16       #unreadMarginRight:I
    .restart local v17       #unreadMarginTop:I
    .restart local v18       #unreadMinWidth:I
    .restart local v19       #unreadTextMargin:I
    :cond_6
    iget-wide v0, v6, Lcom/android/launcher2/ItemInfo;->container:J

    move-wide/from16 v26, v0

    const-wide/16 v28, -0x64

    cmp-long v26, v26, v28

    if-nez v26, :cond_7

    .line 374
    const v26, 0x7f0b0063

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 375
    const v26, 0x7f0b0064

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_1

    .line 377
    :cond_7
    const v26, 0x7f0b0061

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 378
    const v26, 0x7f0b0062

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_1

    .line 380
    :cond_8
    instance-of v0, v6, Lcom/android/launcher2/FolderInfo;

    move/from16 v26, v0

    if-eqz v26, :cond_a

    .line 381
    iget-wide v0, v6, Lcom/android/launcher2/ItemInfo;->container:J

    move-wide/from16 v26, v0

    const-wide/16 v28, -0x65

    cmp-long v26, v26, v28

    if-nez v26, :cond_9

    .line 382
    const v26, 0x7f0b005f

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 383
    const v26, 0x7f0b0060

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_1

    .line 384
    :cond_9
    iget-wide v0, v6, Lcom/android/launcher2/ItemInfo;->container:J

    move-wide/from16 v26, v0

    const-wide/16 v28, -0x64

    cmp-long v26, v26, v28

    if-nez v26, :cond_3

    .line 385
    const v26, 0x7f0b0063

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 386
    const v26, 0x7f0b0064

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_1

    .line 389
    :cond_a
    instance-of v0, v6, Lcom/android/launcher2/ApplicationInfo;

    move/from16 v26, v0

    if-eqz v26, :cond_3

    .line 390
    const v26, 0x7f0b0065

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v17, v0

    .line 391
    const v26, 0x7f0b0066

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v26

    move/from16 v0, v26

    float-to-int v0, v0

    move/from16 v16, v0

    goto/16 :goto_1

    .line 414
    .restart local v5       #fontMetrics:Landroid/graphics/Paint$FontMetrics;
    .restart local v13       #unreadBgPosX:I
    .restart local v14       #unreadBgPosY:I
    :cond_b
    div-int/lit8 v26, v15, 0x2

    move/from16 v0, v26

    int-to-float v0, v0

    move/from16 v26, v0

    add-int v27, v11, v8

    div-int/lit8 v27, v27, 0x2

    move/from16 v0, v27

    int-to-float v0, v0

    move/from16 v27, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move/from16 v2, v26

    move/from16 v3, v27

    move-object/from16 v4, v22

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto/16 :goto_2
.end method

.method static declared-synchronized getUnreadNumberAt(I)I
    .locals 2
    .parameter "index"

    .prologue
    .line 291
    const-class v1, Lcom/android/launcher2/MTKUnreadLoader;

    monitor-enter v1

    if-ltz p0, :cond_0

    :try_start_0
    sget v0, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt p0, v0, :cond_1

    .line 292
    :cond_0
    const/4 v0, 0x0

    .line 298
    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    :try_start_1
    sget-object v0, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/UnreadSupportShortcut;

    iget v0, v0, Lcom/android/launcher2/UnreadSupportShortcut;->mUnreadNum:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 291
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static getUnreadNumberOfComponent(Landroid/content/ComponentName;)I
    .locals 2
    .parameter "component"

    .prologue
    .line 308
    invoke-static {p0}, Lcom/android/launcher2/MTKUnreadLoader;->supportUnreadFeature(Landroid/content/ComponentName;)I

    move-result v0

    .line 309
    .local v0, index:I
    invoke-static {v0}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadNumberAt(I)I

    move-result v1

    return v1
.end method

.method private static getUnreadSupportShortcutInfo()Ljava/lang/String;
    .locals 4

    .prologue
    .line 231
    const-string v0, " Unread support shortcuts are "

    .line 232
    .local v0, info:Ljava/lang/String;
    sget-object v2, Lcom/android/launcher2/MTKUnreadLoader;->LOG_LOCK:Ljava/lang/Object;

    monitor-enter v2

    .line 233
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v3, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 234
    monitor-exit v2

    .line 235
    return-object v0

    .line 234
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private initUnreadNumberFromSystem()V
    .locals 8

    .prologue
    .line 153
    iget-object v5, p0, Lcom/android/launcher2/MTKUnreadLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 154
    .local v0, cr:Landroid/content/ContentResolver;
    sget v4, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I

    .line 155
    .local v4, shortcutsNum:I
    const/4 v3, 0x0

    .line 156
    .local v3, shortcut:Lcom/android/launcher2/UnreadSupportShortcut;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v4, :cond_0

    .line 157
    sget-object v5, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    .end local v3           #shortcut:Lcom/android/launcher2/UnreadSupportShortcut;
    check-cast v3, Lcom/android/launcher2/UnreadSupportShortcut;

    .line 159
    .restart local v3       #shortcut:Lcom/android/launcher2/UnreadSupportShortcut;
    :try_start_0
    iget-object v5, v3, Lcom/android/launcher2/UnreadSupportShortcut;->mKey:Ljava/lang/String;

    invoke-static {v0, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v5

    iput v5, v3, Lcom/android/launcher2/UnreadSupportShortcut;->mUnreadNum:I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 156
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 164
    :catch_0
    move-exception v1

    .line 165
    .local v1, e:Landroid/provider/Settings$SettingNotFoundException;
    const-string v5, "MTKUnreadLoader"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "initUnreadNumberFromSystem SettingNotFoundException key = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/android/launcher2/UnreadSupportShortcut;->mKey:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", e = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Landroid/provider/Settings$SettingNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/android/launcher2/LauncherLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 172
    .end local v1           #e:Landroid/provider/Settings$SettingNotFoundException;
    :cond_0
    return-void
.end method

.method private loadUnreadSupportShortcuts()V
    .locals 17

    .prologue
    .line 175
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 177
    .local v6, start:J
    const-string v9, "MTKUnreadLoader"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "loadUnreadSupportShortcuts begin: start = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    sget-object v9, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 184
    :try_start_0
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/MTKUnreadLoader;->mContext:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f060005

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v5

    .line 186
    .local v5, parser:Landroid/content/res/XmlResourceParser;
    invoke-static {v5}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    .line 187
    .local v2, attrs:Landroid/util/AttributeSet;
    const-string v9, "unreadshortcuts"

    invoke-static {v5, v9}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 189
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v3

    .line 191
    .local v3, depth:I
    const/4 v8, -0x1

    .line 193
    .local v8, type:I
    :cond_0
    :goto_0
    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->next()I

    move-result v8

    const/4 v9, 0x3

    if-ne v8, v9, :cond_1

    invoke-interface {v5}, Landroid/content/res/XmlResourceParser;->getDepth()I

    move-result v9

    if-le v9, v3, :cond_2

    :cond_1
    const/4 v9, 0x1

    if-eq v8, v9, :cond_2

    .line 195
    const/4 v9, 0x2

    if-ne v8, v9, :cond_0

    .line 199
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/launcher2/MTKUnreadLoader;->mContext:Landroid/content/Context;

    sget-object v10, Lcom/android/launcher/R$styleable;->UnreadShortcut:[I

    invoke-virtual {v9, v2, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 200
    .local v1, a:Landroid/content/res/TypedArray;
    sget-object v10, Lcom/android/launcher2/MTKUnreadLoader;->LOG_LOCK:Ljava/lang/Object;

    monitor-enter v10
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 201
    :try_start_1
    sget-object v9, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    new-instance v11, Lcom/android/launcher2/UnreadSupportShortcut;

    const/4 v12, 0x0

    invoke-virtual {v1, v12}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {v1, v13}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    invoke-virtual {v1, v14}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v1, v15, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v15

    invoke-direct {v11, v12, v13, v14, v15}, Lcom/android/launcher2/UnreadSupportShortcut;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 206
    monitor-exit v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 207
    :try_start_2
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 210
    .end local v1           #a:Landroid/content/res/TypedArray;
    .end local v2           #attrs:Landroid/util/AttributeSet;
    .end local v3           #depth:I
    .end local v5           #parser:Landroid/content/res/XmlResourceParser;
    .end local v8           #type:I
    :catch_0
    move-exception v4

    .line 211
    .local v4, e:Lorg/xmlpull/v1/XmlPullParserException;
    const-string v9, "MTKUnreadLoader"

    const-string v10, "Got XmlPullParserException while parsing unread shortcuts."

    invoke-static {v9, v10, v4}, Lcom/android/launcher2/LauncherLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 215
    .end local v4           #e:Lorg/xmlpull/v1/XmlPullParserException;
    :cond_2
    :goto_1
    sget-object v9, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    sput v9, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I

    .line 217
    const-string v9, "MTKUnreadLoader"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "loadUnreadSupportShortcuts end: time used = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    sub-long/2addr v11, v6

    invoke-virtual {v10, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ",sUnreadSupportShortcutsNum = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget v11, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadSupportShortcutInfo()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    return-void

    .line 206
    .restart local v1       #a:Landroid/content/res/TypedArray;
    .restart local v2       #attrs:Landroid/util/AttributeSet;
    .restart local v3       #depth:I
    .restart local v5       #parser:Landroid/content/res/XmlResourceParser;
    .restart local v8       #type:I
    :catchall_0
    move-exception v9

    :try_start_3
    monitor-exit v10
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v9
    :try_end_4
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 212
    .end local v1           #a:Landroid/content/res/TypedArray;
    .end local v2           #attrs:Landroid/util/AttributeSet;
    .end local v3           #depth:I
    .end local v5           #parser:Landroid/content/res/XmlResourceParser;
    .end local v8           #type:I
    :catch_1
    move-exception v4

    .line 213
    .local v4, e:Ljava/io/IOException;
    const-string v9, "MTKUnreadLoader"

    const-string v10, "Got IOException while parsing unread shortcuts."

    invoke-static {v9, v10, v4}, Lcom/android/launcher2/LauncherLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method static declared-synchronized setUnreadNumberAt(II)Z
    .locals 2
    .parameter "index"
    .parameter "unreadNum"

    .prologue
    .line 270
    const-class v1, Lcom/android/launcher2/MTKUnreadLoader;

    monitor-enter v1

    if-gez p0, :cond_0

    :try_start_0
    sget v0, Lcom/android/launcher2/MTKUnreadLoader;->sUnreadSupportShortcutsNum:I

    if-ge p0, v0, :cond_1

    .line 275
    :cond_0
    sget-object v0, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/UnreadSupportShortcut;

    iget v0, v0, Lcom/android/launcher2/UnreadSupportShortcut;->mUnreadNum:I

    if-eq v0, p1, :cond_1

    .line 276
    sget-object v0, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/UnreadSupportShortcut;

    iput p1, v0, Lcom/android/launcher2/UnreadSupportShortcut;->mUnreadNum:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 277
    const/4 v0, 0x1

    .line 280
    :goto_0
    monitor-exit v1

    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 270
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method static supportUnreadFeature(Landroid/content/ComponentName;)I
    .locals 5
    .parameter "component"

    .prologue
    const/4 v4, -0x1

    .line 248
    if-nez p0, :cond_1

    move v0, v4

    .line 259
    :cond_0
    :goto_0
    return v0

    .line 252
    :cond_1
    sget-object v3, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 253
    .local v1, size:I
    const/4 v0, 0x0

    .local v0, i:I
    move v2, v1

    .local v2, sz:I
    :goto_1
    if-ge v0, v2, :cond_2

    .line 254
    sget-object v3, Lcom/android/launcher2/MTKUnreadLoader;->UNREAD_SUPPORT_SHORTCUTS:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/UnreadSupportShortcut;

    iget-object v3, v3, Lcom/android/launcher2/UnreadSupportShortcut;->mComponent:Landroid/content/ComponentName;

    invoke-virtual {v3, p0}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 253
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    move v0, v4

    .line 259
    goto :goto_0
.end method


# virtual methods
.method public initialize(Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;)V
    .locals 1
    .parameter "callbacks"

    .prologue
    .line 115
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;

    .line 119
    return-void
.end method

.method loadAndInitUnreadShortcuts()V
    .locals 2

    .prologue
    .line 127
    new-instance v0, Lcom/android/launcher2/MTKUnreadLoader$1;

    invoke-direct {v0, p0}, Lcom/android/launcher2/MTKUnreadLoader$1;-><init>(Lcom/android/launcher2/MTKUnreadLoader;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/MTKUnreadLoader$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 145
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v9, -0x1

    .line 85
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 86
    .local v0, action:Ljava/lang/String;
    const-string v6, "com.mediatek.action.UNREAD_CHANGED"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 87
    const-string v6, "com.mediatek.intent.extra.UNREAD_COMPONENT"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->getExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ComponentName;

    .line 89
    .local v2, componentName:Landroid/content/ComponentName;
    const-string v6, "com.mediatek.intent.extra.UNREAD_NUMBER"

    invoke-virtual {p2, v6, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 91
    .local v5, unreadNum:I
    const-string v6, "MTKUnreadLoader"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Receive unread broadcast: componentName = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", unreadNum = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", mCallbacks = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/android/launcher2/MTKUnreadLoader;->getUnreadSupportShortcutInfo()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    iget-object v6, p0, Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;

    if-eqz v6, :cond_0

    if-eqz v2, :cond_0

    if-eq v5, v9, :cond_0

    .line 97
    invoke-static {v2}, Lcom/android/launcher2/MTKUnreadLoader;->supportUnreadFeature(Landroid/content/ComponentName;)I

    move-result v3

    .line 98
    .local v3, index:I
    if-ltz v3, :cond_0

    .line 99
    invoke-static {v3, v5}, Lcom/android/launcher2/MTKUnreadLoader;->setUnreadNumberAt(II)Z

    move-result v4

    .line 100
    .local v4, ret:Z
    if-eqz v4, :cond_0

    .line 101
    iget-object v6, p0, Lcom/android/launcher2/MTKUnreadLoader;->mCallbacks:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;

    .line 102
    .local v1, callbacks:Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;
    if-eqz v1, :cond_0

    .line 103
    invoke-interface {v1, v2, v5}, Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;->bindComponentUnreadChanged(Landroid/content/ComponentName;I)V

    .line 109
    .end local v1           #callbacks:Lcom/android/launcher2/MTKUnreadLoader$UnreadCallbacks;
    .end local v2           #componentName:Landroid/content/ComponentName;
    .end local v3           #index:I
    .end local v4           #ret:Z
    .end local v5           #unreadNum:I
    :cond_0
    return-void
.end method
