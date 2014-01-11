.class public Lcom/android/launcher2/StrokedTextView;
.super Landroid/widget/TextView;
.source "StrokedTextView.java"


# instance fields
.field private mCache:Landroid/graphics/Bitmap;

.field private final mCanvas:Landroid/graphics/Canvas;

.field private final mPaint:Landroid/graphics/Paint;

.field private mStrokeColor:I

.field private mStrokeWidth:F

.field private mTextColor:I

.field private mUpdateCachedBitmap:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 46
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 37
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    .line 47
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher2/StrokedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 37
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/StrokedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    .line 38
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/StrokedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 61
    sget-object v1, Lcom/android/launcher/R$styleable;->StrokedTextView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 63
    .local v0, a:Landroid/content/res/TypedArray;
    const/high16 v1, -0x100

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/StrokedTextView;->mStrokeColor:I

    .line 64
    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v1

    iput v1, p0, Lcom/android/launcher2/StrokedTextView;->mStrokeWidth:F

    .line 65
    const/4 v1, -0x1

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/StrokedTextView;->mTextColor:I

    .line 66
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 67
    iput-boolean v3, p0, Lcom/android/launcher2/StrokedTextView;->mUpdateCachedBitmap:Z

    .line 70
    iget-object v1, p0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 71
    iget-object v1, p0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 72
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21
    .parameter "canvas"

    .prologue
    .line 90
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCache:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    if-eqz v17, :cond_3

    .line 91
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/launcher2/StrokedTextView;->mUpdateCachedBitmap:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2

    .line 92
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getMeasuredWidth()I

    move-result v16

    .line 93
    .local v16, w:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getMeasuredHeight()I

    move-result v9

    .line 94
    .local v9, h:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v12

    .line 95
    .local v12, text:Ljava/lang/String;
    new-instance v13, Landroid/graphics/Rect;

    invoke-direct {v13}, Landroid/graphics/Rect;-><init>()V

    .line 96
    .local v13, textBounds:Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v14

    .line 97
    .local v14, textPaint:Landroid/graphics/Paint;
    invoke-virtual {v14, v12}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v17

    move/from16 v0, v17

    float-to-int v15, v0

    .line 98
    .local v15, textWidth:I
    const-string v17, "x"

    const/16 v18, 0x0

    const/16 v19, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v14, v0, v1, v2, v13}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 101
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCache:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    sget-object v19, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual/range {v17 .. v19}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 105
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getPaddingLeft()I

    move-result v6

    .line 106
    .local v6, drawableLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getPaddingTop()I

    move-result v7

    .line 107
    .local v7, drawableTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 108
    .local v8, drawables:[Landroid/graphics/drawable/Drawable;
    const/4 v10, 0x0

    .local v10, i:I
    :goto_0
    array-length v0, v8

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_1

    .line 109
    aget-object v17, v8, v10

    if-eqz v17, :cond_0

    .line 110
    aget-object v17, v8, v10

    aget-object v18, v8, v10

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v18

    add-int v18, v18, v6

    aget-object v19, v8, v10

    invoke-virtual/range {v19 .. v19}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v19

    add-int v19, v19, v7

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v6, v7, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 113
    aget-object v17, v8, v10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 108
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 117
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getPaddingRight()I

    move-result v17

    sub-int v17, v16, v17

    sub-int v11, v17, v15

    .line 118
    .local v11, left:I
    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v17

    add-int v17, v17, v9

    div-int/lit8 v5, v17, 0x2

    .line 121
    .local v5, bottom:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/StrokedTextView;->mStrokeWidth:F

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 122
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/StrokedTextView;->mStrokeColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 123
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/StrokedTextView;->getTextSize()F

    move-result v18

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 124
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v17, v0

    int-to-float v0, v11

    move/from16 v18, v0

    int-to-float v0, v5

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v12, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 127
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/StrokedTextView;->mTextColor:I

    move/from16 v18, v0

    invoke-virtual/range {v17 .. v18}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v17, v0

    int-to-float v0, v11

    move/from16 v18, v0

    int-to-float v0, v5

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move-object/from16 v3, v20

    invoke-virtual {v0, v12, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 131
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/android/launcher2/StrokedTextView;->mUpdateCachedBitmap:Z

    .line 133
    .end local v5           #bottom:I
    .end local v6           #drawableLeft:I
    .end local v7           #drawableTop:I
    .end local v8           #drawables:[Landroid/graphics/drawable/Drawable;
    .end local v9           #h:I
    .end local v10           #i:I
    .end local v11           #left:I
    .end local v12           #text:Ljava/lang/String;
    .end local v13           #textBounds:Landroid/graphics/Rect;
    .end local v14           #textPaint:Landroid/graphics/Paint;
    .end local v15           #textWidth:I
    .end local v16           #w:I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mCache:Landroid/graphics/Bitmap;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/StrokedTextView;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v20, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    move-object/from16 v4, v20

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 137
    :goto_1
    return-void

    .line 135
    :cond_3
    invoke-super/range {p0 .. p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_1
.end method

.method protected onSizeChanged(IIII)V
    .locals 1
    .parameter "w"
    .parameter "h"
    .parameter "oldw"
    .parameter "oldh"

    .prologue
    .line 80
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onSizeChanged(IIII)V

    .line 81
    if-lez p1, :cond_0

    if-lez p2, :cond_0

    .line 82
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/StrokedTextView;->mUpdateCachedBitmap:Z

    .line 83
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mCache:Landroid/graphics/Bitmap;

    .line 87
    :goto_0
    return-void

    .line 85
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/StrokedTextView;->mCache:Landroid/graphics/Bitmap;

    goto :goto_0
.end method

.method protected onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 1
    .parameter "text"
    .parameter "start"
    .parameter "before"
    .parameter "after"

    .prologue
    .line 75
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/StrokedTextView;->mUpdateCachedBitmap:Z

    .line 77
    return-void
.end method
