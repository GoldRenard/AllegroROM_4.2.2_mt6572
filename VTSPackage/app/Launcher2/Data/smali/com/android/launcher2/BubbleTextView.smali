.class public Lcom/android/launcher2/BubbleTextView;
.super Landroid/widget/TextView;
.source "BubbleTextView.java"


# static fields
.field static final CORNER_RADIUS:F = 4.0f

.field static final PADDING_H:F = 8.0f

.field static final PADDING_V:F = 3.0f

.field static final SHADOW_LARGE_COLOUR:I = -0x23000000

.field static final SHADOW_LARGE_RADIUS:F = 4.0f

.field static final SHADOW_SMALL_COLOUR:I = -0x34000000

.field static final SHADOW_SMALL_RADIUS:F = 1.75f

.field static final SHADOW_Y_OFFSET:F = 2.0f


# instance fields
.field private mBackground:Landroid/graphics/drawable/Drawable;

.field private mBackgroundSizeChanged:Z

.field private mDidInvalidateForPressedState:Z

.field private mFocusedGlowColor:I

.field private mFocusedOutlineColor:I

.field private mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

.field private final mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

.field private mPressedGlowColor:I

.field private mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

.field private mPressedOutlineColor:I

.field private mPrevAlpha:I

.field private mStayPressed:Z

.field private final mTempCanvas:Landroid/graphics/Canvas;

.field private final mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 65
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 46
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/BubbleTextView;->mPrevAlpha:I

    .line 48
    new-instance v0, Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/android/launcher2/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    .line 49
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 66
    invoke-direct {p0}, Lcom/android/launcher2/BubbleTextView;->init()V

    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/BubbleTextView;->mPrevAlpha:I

    .line 48
    new-instance v0, Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/android/launcher2/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    .line 49
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 71
    invoke-direct {p0}, Lcom/android/launcher2/BubbleTextView;->init()V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 75
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/launcher2/BubbleTextView;->mPrevAlpha:I

    .line 48
    new-instance v0, Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/android/launcher2/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    .line 49
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 50
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 76
    invoke-direct {p0}, Lcom/android/launcher2/BubbleTextView;->init()V

    .line 77
    return-void
.end method

.method private createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "canvas"
    .parameter "outlineColor"
    .parameter "glowColor"

    .prologue
    .line 196
    sget v1, Lcom/android/launcher2/HolographicOutlineHelper;->MAX_OUTER_BLUR_RADIUS:I

    .line 197
    .local v1, padding:I
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getWidth()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getHeight()I

    move-result v3

    add-int/2addr v3, v1

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 200
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 201
    invoke-direct {p0, p1, v1}, Lcom/android/launcher2/BubbleTextView;->drawWithPadding(Landroid/graphics/Canvas;I)V

    .line 202
    iget-object v2, p0, Lcom/android/launcher2/BubbleTextView;->mOutlineHelper:Lcom/android/launcher2/HolographicOutlineHelper;

    invoke-virtual {v2, v0, p1, p3, p2}, Lcom/android/launcher2/HolographicOutlineHelper;->applyExtraThickExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)V

    .line 203
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 205
    return-object v0
.end method

.method private drawWithPadding(Landroid/graphics/Canvas;I)V
    .locals 5
    .parameter "destCanvas"
    .parameter "padding"

    .prologue
    .line 172
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 173
    .local v0, clipRect:Landroid/graphics/Rect;
    invoke-virtual {p0, v0}, Lcom/android/launcher2/BubbleTextView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 176
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getExtendedPaddingTop()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/text/Layout;->getLineTop(I)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 182
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 183
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScaleX()F

    move-result v1

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScaleY()F

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getWidth()I

    move-result v3

    add-int/2addr v3, p2

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getHeight()I

    move-result v4

    add-int/2addr v4, p2

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 185
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollX()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v2, p2, 0x2

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollY()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v3, p2, 0x2

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 186
    sget-object v1, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 187
    invoke-virtual {p0, p1}, Lcom/android/launcher2/BubbleTextView;->draw(Landroid/graphics/Canvas;)V

    .line 188
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 189
    return-void
.end method

.method private init()V
    .locals 5

    .prologue
    .line 80
    new-instance v1, Lcom/android/launcher2/CheckLongPressHelper;

    invoke-direct {v1, p0}, Lcom/android/launcher2/CheckLongPressHelper;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    .line 81
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 83
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 86
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x1060012

    invoke-static {v0, v1}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedGlowColor:I

    .line 87
    iget v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedGlowColor:I

    iput v1, p0, Lcom/android/launcher2/BubbleTextView;->mFocusedOutlineColor:I

    .line 88
    iget v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedGlowColor:I

    iput v1, p0, Lcom/android/launcher2/BubbleTextView;->mFocusedGlowColor:I

    .line 89
    iget v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedGlowColor:I

    iput v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOutlineColor:I

    .line 91
    const/high16 v1, 0x4080

    const/4 v2, 0x0

    const/high16 v3, 0x4000

    const/high16 v4, -0x2300

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/android/launcher2/BubbleTextView;->setShadowLayer(FFFI)V

    .line 92
    return-void
.end method


# virtual methods
.method public applyFromShortcutInfo(Lcom/android/launcher2/ShortcutInfo;Lcom/android/launcher2/IconCache;)V
    .locals 3
    .parameter "info"
    .parameter "iconCache"

    .prologue
    const/4 v2, 0x0

    .line 95
    invoke-virtual {p1, p2}, Lcom/android/launcher2/ShortcutInfo;->getIcon(Lcom/android/launcher2/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 97
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Lcom/android/launcher2/FastBitmapDrawable;

    invoke-direct {v1, v0}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v2, v1, v2, v2}, Lcom/android/launcher2/BubbleTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 100
    iget-object v1, p1, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    invoke-virtual {p0, p1}, Lcom/android/launcher2/BubbleTextView;->setTag(Ljava/lang/Object;)V

    .line 102
    return-void
.end method

.method public cancelLongPress()V
    .locals 1

    .prologue
    .line 353
    invoke-super {p0}, Landroid/widget/TextView;->cancelLongPress()V

    .line 355
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    .line 356
    return-void
.end method

.method clearPressedOrFocusedBackground()V
    .locals 1

    .prologue
    .line 267
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 268
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 269
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 281
    iget-object v6, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 282
    .local v6, background:Landroid/graphics/drawable/Drawable;
    if-eqz v6, :cond_1

    .line 283
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollX()I

    move-result v7

    .line 284
    .local v7, scrollX:I
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollY()I

    move-result v8

    .line 286
    .local v8, scrollY:I
    iget-boolean v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackgroundSizeChanged:Z

    if-eqz v0, :cond_0

    .line 287
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getBottom()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v6, v3, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 288
    iput-boolean v3, p0, Lcom/android/launcher2/BubbleTextView;->mBackgroundSizeChanged:Z

    .line 291
    :cond_0
    or-int v0, v7, v8

    if-nez v0, :cond_2

    .line 292
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 301
    .end local v7           #scrollX:I
    .end local v8           #scrollY:I
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getCurrentTextColor()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x106000d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 302
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->clearShadowLayer()V

    .line 303
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 306
    invoke-static {p1, p0}, Lcom/android/launcher2/MTKUnreadLoader;->drawUnreadEventIfNeed(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 324
    :goto_1
    return-void

    .line 294
    .restart local v7       #scrollX:I
    .restart local v8       #scrollY:I
    :cond_2
    int-to-float v0, v7

    int-to-float v1, v8

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 295
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 296
    neg-int v0, v7

    int-to-float v0, v0

    neg-int v1, v8

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    .line 312
    .end local v7           #scrollX:I
    .end local v8           #scrollY:I
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/high16 v1, 0x4080

    const/high16 v2, 0x4000

    const/high16 v3, -0x2300

    invoke-virtual {v0, v1, v9, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 313
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 314
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->save(I)I

    .line 315
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollX()I

    move-result v0

    int-to-float v1, v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollY()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getExtendedPaddingTop()I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollX()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getWidth()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v3, v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getScrollY()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getHeight()I

    move-result v4

    add-int/2addr v0, v4

    int-to-float v4, v0

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    .line 318
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/high16 v1, 0x3fe0

    const/high16 v2, -0x3400

    invoke-virtual {v0, v1, v9, v9, v2}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 319
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 320
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 323
    invoke-static {p1, p0}, Lcom/android/launcher2/MTKUnreadLoader;->drawUnreadEventIfNeed(Landroid/graphics/Canvas;Landroid/view/View;)V

    goto :goto_1
.end method

.method protected drawableStateChanged()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 127
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->isPressed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 130
    iget-boolean v3, p0, Lcom/android/launcher2/BubbleTextView;->mDidInvalidateForPressedState:Z

    if-nez v3, :cond_0

    .line 131
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 158
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 159
    .local v2, d:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 160
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 162
    :cond_1
    invoke-super {p0}, Landroid/widget/TextView;->drawableStateChanged()V

    .line 163
    return-void

    .line 136
    .end local v2           #d:Landroid/graphics/drawable/Drawable;
    :cond_2
    iget-object v5, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v5, :cond_5

    move v0, v3

    .line 137
    .local v0, backgroundEmptyBefore:Z
    :goto_1
    iget-boolean v5, p0, Lcom/android/launcher2/BubbleTextView;->mStayPressed:Z

    if-nez v5, :cond_3

    .line 138
    iput-object v6, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 140
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->isFocused()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 141
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    if-nez v5, :cond_6

    .line 144
    iput-object v6, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 149
    :goto_2
    iput-boolean v4, p0, Lcom/android/launcher2/BubbleTextView;->mStayPressed:Z

    .line 150
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 152
    :cond_4
    iget-object v5, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v5, :cond_7

    move v1, v3

    .line 153
    .local v1, backgroundEmptyNow:Z
    :goto_3
    if-nez v0, :cond_0

    if-eqz v1, :cond_0

    .line 154
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    goto :goto_0

    .end local v0           #backgroundEmptyBefore:Z
    .end local v1           #backgroundEmptyNow:Z
    :cond_5
    move v0, v4

    .line 136
    goto :goto_1

    .line 146
    .restart local v0       #backgroundEmptyBefore:Z
    :cond_6
    iget-object v5, p0, Lcom/android/launcher2/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    iget v6, p0, Lcom/android/launcher2/BubbleTextView;->mFocusedGlowColor:I

    iget v7, p0, Lcom/android/launcher2/BubbleTextView;->mFocusedOutlineColor:I

    invoke-direct {p0, v5, v6, v7}, Lcom/android/launcher2/BubbleTextView;->createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;

    move-result-object v5

    iput-object v5, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    goto :goto_2

    :cond_7
    move v1, v4

    .line 152
    goto :goto_3
.end method

.method getPressedOrFocusedBackground()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 272
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getPressedOrFocusedBackgroundPadding()I
    .locals 1

    .prologue
    .line 276
    sget v0, Lcom/android/launcher2/HolographicOutlineHelper;->MAX_OUTER_BLUR_RADIUS:I

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 328
    invoke-super {p0}, Landroid/widget/TextView;->onAttachedToWindow()V

    .line 329
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 330
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 332
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 336
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 337
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 340
    :cond_0
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1
    .parameter "alpha"

    .prologue
    .line 344
    iget v0, p0, Lcom/android/launcher2/BubbleTextView;->mPrevAlpha:I

    if-eq v0, p1, :cond_0

    .line 345
    iput p1, p0, Lcom/android/launcher2/BubbleTextView;->mPrevAlpha:I

    .line 346
    invoke-super {p0, p1}, Landroid/widget/TextView;->onSetAlpha(I)Z

    .line 348
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    .line 212
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 214
    .local v0, result:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 245
    :goto_0
    :pswitch_0
    return v0

    .line 219
    :pswitch_1
    iget-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v1, :cond_0

    .line 220
    iget-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    iget v2, p0, Lcom/android/launcher2/BubbleTextView;->mPressedGlowColor:I

    iget v3, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOutlineColor:I

    invoke-direct {p0, v1, v2, v3}, Lcom/android/launcher2/BubbleTextView;->createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 225
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->isPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 226
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/launcher2/BubbleTextView;->mDidInvalidateForPressedState:Z

    .line 227
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 232
    :goto_1
    iget-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/android/launcher2/CheckLongPressHelper;->postCheckForLongPress()V

    goto :goto_0

    .line 229
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/launcher2/BubbleTextView;->mDidInvalidateForPressedState:Z

    goto :goto_1

    .line 238
    :pswitch_2
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->isPressed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 239
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 242
    :cond_2
    iget-object v1, p0, Lcom/android/launcher2/BubbleTextView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    goto :goto_0

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method setCellLayoutPressedOrFocusedIcon()V
    .locals 3

    .prologue
    .line 257
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    if-eqz v2, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 259
    .local v1, parent:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    if-eqz v1, :cond_0

    .line 260
    invoke-virtual {v1}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    .line 261
    .local v0, layout:Lcom/android/launcher2/CellLayout;
    iget-object v2, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1

    .end local p0
    :goto_0
    invoke-virtual {v0, p0}, Lcom/android/launcher2/CellLayout;->setPressedOrFocusedIcon(Lcom/android/launcher2/BubbleTextView;)V

    .line 264
    .end local v0           #layout:Lcom/android/launcher2/CellLayout;
    .end local v1           #parent:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    :cond_0
    return-void

    .line 261
    .restart local v0       #layout:Lcom/android/launcher2/CellLayout;
    .restart local v1       #parent:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .restart local p0
    :cond_1
    const/4 p0, 0x0

    goto :goto_0
.end method

.method protected setFrame(IIII)Z
    .locals 1
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getLeft()I

    move-result v0

    if-ne v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getRight()I

    move-result v0

    if-ne v0, p3, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getTop()I

    move-result v0

    if-ne v0, p2, :cond_0

    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->getBottom()I

    move-result v0

    if-eq v0, p4, :cond_1

    .line 107
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackgroundSizeChanged:Z

    .line 109
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setFrame(IIII)Z

    move-result v0

    return v0
.end method

.method setStayPressed(Z)V
    .locals 1
    .parameter "stayPressed"

    .prologue
    .line 249
    iput-boolean p1, p0, Lcom/android/launcher2/BubbleTextView;->mStayPressed:Z

    .line 250
    if-nez p1, :cond_0

    .line 251
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 253
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 254
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 1
    .parameter "tag"

    .prologue
    .line 119
    if-eqz p1, :cond_0

    move-object v0, p1

    .line 120
    check-cast v0, Lcom/android/launcher2/ItemInfo;

    invoke-static {v0}, Lcom/android/launcher2/LauncherModel;->checkItemInfo(Lcom/android/launcher2/ItemInfo;)V

    .line 122
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 123
    return-void
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .parameter "who"

    .prologue
    .line 114
    iget-object v0, p0, Lcom/android/launcher2/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/TextView;->verifyDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
