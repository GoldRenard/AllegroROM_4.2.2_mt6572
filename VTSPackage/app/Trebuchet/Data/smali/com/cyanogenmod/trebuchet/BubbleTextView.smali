.class public Lcom/cyanogenmod/trebuchet/BubbleTextView;
.super Landroid/widget/TextView;
.source "BubbleTextView.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;


# static fields
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

.field private mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

.field private final mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

.field private mPressedGlowColor:I

.field private mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

.field private mPressedOutlineColor:I

.field private mPrevAlpha:I

.field private mStayPressed:Z

.field private final mTempCanvas:Landroid/graphics/Canvas;

.field private final mTempRect:Landroid/graphics/Rect;

.field private mTextVisible:Z

.field private mVisibleText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 67
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 45
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPrevAlpha:I

    .line 47
    new-instance v0, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    .line 48
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 49
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    .line 68
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->init()V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 72
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPrevAlpha:I

    .line 47
    new-instance v0, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    .line 48
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 49
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    .line 73
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->init()V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 77
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    const/4 v0, -0x1

    iput v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPrevAlpha:I

    .line 47
    new-instance v0, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-direct {v0}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    .line 48
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0}, Landroid/graphics/Canvas;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    .line 49
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 63
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    .line 78
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->init()V

    .line 79
    return-void
.end method

.method private createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;
    .locals 5
    .parameter "canvas"
    .parameter "outlineColor"
    .parameter "glowColor"

    .prologue
    .line 204
    sget v1, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;->MAX_OUTER_BLUR_RADIUS:I

    .line 205
    .local v1, padding:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getWidth()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getHeight()I

    move-result v3

    add-int/2addr v3, v1

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 208
    .local v0, b:Landroid/graphics/Bitmap;
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 209
    invoke-direct {p0, p1, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->drawWithPadding(Landroid/graphics/Canvas;I)V

    .line 210
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mOutlineHelper:Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;

    invoke-virtual {v2, v0, p1, p3, p2}, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;->applyExtraThickExpensiveOutlineWithBlur(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;II)V

    .line 211
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 213
    return-object v0
.end method

.method private drawWithPadding(Landroid/graphics/Canvas;I)V
    .locals 5
    .parameter "destCanvas"
    .parameter "padding"

    .prologue
    .line 180
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempRect:Landroid/graphics/Rect;

    .line 181
    .local v0, clipRect:Landroid/graphics/Rect;
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 184
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getExtendedPaddingTop()I

    move-result v1

    add-int/lit8 v1, v1, -0x3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/text/Layout;->getLineTop(I)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 190
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 191
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScaleX()F

    move-result v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScaleY()F

    move-result v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getWidth()I

    move-result v3

    add-int/2addr v3, p2

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getHeight()I

    move-result v4

    add-int/2addr v4, p2

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 193
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollX()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v2, p2, 0x2

    add-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollY()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v3, p2, 0x2

    add-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 194
    sget-object v1, Landroid/graphics/Region$Op;->REPLACE:Landroid/graphics/Region$Op;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;Landroid/graphics/Region$Op;)Z

    .line 195
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->draw(Landroid/graphics/Canvas;)V

    .line 196
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 197
    return-void
.end method

.method private init()V
    .locals 5

    .prologue
    .line 82
    new-instance v1, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;-><init>(Landroid/view/View;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    .line 83
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 85
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 86
    .local v0, res:Landroid/content/res/Resources;
    const v1, 0x1060012

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedGlowColor:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOutlineColor:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mFocusedGlowColor:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mFocusedOutlineColor:I

    .line 89
    const/high16 v1, 0x4080

    const/4 v2, 0x0

    const/high16 v3, 0x4000

    const/high16 v4, -0x2300

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setShadowLayer(FFFI)V

    .line 90
    return-void
.end method


# virtual methods
.method public applyFromShortcutInfo(Lcom/cyanogenmod/trebuchet/ShortcutInfo;Lcom/cyanogenmod/trebuchet/IconCache;)V
    .locals 3
    .parameter "info"
    .parameter "iconCache"

    .prologue
    const/4 v2, 0x0

    .line 93
    invoke-virtual {p1, p2}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->getIcon(Lcom/cyanogenmod/trebuchet/IconCache;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 95
    .local v0, b:Landroid/graphics/Bitmap;
    new-instance v1, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;

    invoke-direct {v1, v0}, Lcom/cyanogenmod/trebuchet/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v2, v1, v2, v2}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 98
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setTag(Ljava/lang/Object;)V

    .line 100
    invoke-virtual {p1, p0}, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->setListener(Lcom/cyanogenmod/trebuchet/ShortcutInfo$ShortcutListener;)V

    .line 101
    return-void
.end method

.method public cancelLongPress()V
    .locals 1

    .prologue
    .line 350
    invoke-super {p0}, Landroid/widget/TextView;->cancelLongPress()V

    .line 352
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    .line 353
    return-void
.end method

.method clearPressedOrFocusedBackground()V
    .locals 1

    .prologue
    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 276
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 277
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v3, 0x0

    const/4 v9, 0x0

    .line 289
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 290
    .local v6, background:Landroid/graphics/drawable/Drawable;
    if-eqz v6, :cond_1

    .line 291
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollX()I

    move-result v7

    .line 292
    .local v7, scrollX:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollY()I

    move-result v8

    .line 294
    .local v8, scrollY:I
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackgroundSizeChanged:Z

    if-eqz v0, :cond_0

    .line 295
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getBottom()I

    move-result v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getTop()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v6, v3, v3, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 296
    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackgroundSizeChanged:Z

    .line 299
    :cond_0
    or-int v0, v7, v8

    if-nez v0, :cond_2

    .line 300
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 309
    .end local v7           #scrollX:I
    .end local v8           #scrollY:I
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getCurrentTextColor()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x106000d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 310
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->clearShadowLayer()V

    .line 311
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 325
    :goto_1
    return-void

    .line 302
    .restart local v7       #scrollX:I
    .restart local v8       #scrollY:I
    :cond_2
    int-to-float v0, v7

    int-to-float v1, v8

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 303
    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 304
    neg-int v0, v7

    int-to-float v0, v0

    neg-int v1, v8

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    .line 316
    .end local v7           #scrollX:I
    .end local v8           #scrollY:I
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/high16 v1, 0x4080

    const/high16 v2, 0x4000

    const/high16 v3, -0x2300

    invoke-virtual {v0, v1, v9, v2, v3}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 317
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 318
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->save(I)I

    .line 319
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollX()I

    move-result v0

    int-to-float v1, v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollY()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getExtendedPaddingTop()I

    move-result v2

    add-int/2addr v0, v2

    int-to-float v2, v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollX()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getWidth()I

    move-result v3

    add-int/2addr v0, v3

    int-to-float v3, v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getScrollY()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getHeight()I

    move-result v4

    add-int/2addr v0, v4

    int-to-float v4, v0

    sget-object v5, Landroid/graphics/Region$Op;->INTERSECT:Landroid/graphics/Region$Op;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->clipRect(FFFFLandroid/graphics/Region$Op;)Z

    .line 322
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const/high16 v1, 0x3fe0

    const/high16 v2, -0x3400

    invoke-virtual {v0, v1, v9, v9, v2}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 323
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 324
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_1
.end method

.method protected drawableStateChanged()V
    .locals 8

    .prologue
    const/4 v6, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 126
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->isPressed()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 129
    iget-boolean v3, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mDidInvalidateForPressedState:Z

    if-nez v3, :cond_0

    .line 130
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 157
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    .line 158
    .local v2, d:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 159
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getDrawableState()[I

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 161
    :cond_1
    invoke-super {p0}, Landroid/widget/TextView;->drawableStateChanged()V

    .line 162
    return-void

    .line 135
    .end local v2           #d:Landroid/graphics/drawable/Drawable;
    :cond_2
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v5, :cond_5

    move v0, v3

    .line 136
    .local v0, backgroundEmptyBefore:Z
    :goto_1
    iget-boolean v5, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mStayPressed:Z

    if-nez v5, :cond_3

    .line 137
    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 139
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->isFocused()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 140
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLayout()Landroid/text/Layout;

    move-result-object v5

    if-nez v5, :cond_6

    .line 143
    iput-object v6, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 148
    :goto_2
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mStayPressed:Z

    .line 149
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 151
    :cond_4
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v5, :cond_7

    move v1, v3

    .line 152
    .local v1, backgroundEmptyNow:Z
    :goto_3
    if-nez v0, :cond_0

    if-eqz v1, :cond_0

    .line 153
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    goto :goto_0

    .end local v0           #backgroundEmptyBefore:Z
    .end local v1           #backgroundEmptyNow:Z
    :cond_5
    move v0, v4

    .line 135
    goto :goto_1

    .line 145
    .restart local v0       #backgroundEmptyBefore:Z
    :cond_6
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    iget v6, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mFocusedGlowColor:I

    iget v7, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mFocusedOutlineColor:I

    invoke-direct {p0, v5, v6, v7}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;

    move-result-object v5

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    goto :goto_2

    :cond_7
    move v1, v4

    .line 151
    goto :goto_3
.end method

.method getPressedOrFocusedBackground()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 280
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getPressedOrFocusedBackgroundPadding()I
    .locals 1

    .prologue
    .line 284
    sget v0, Lcom/cyanogenmod/trebuchet/HolographicOutlineHelper;->MAX_OUTER_BLUR_RADIUS:I

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 329
    invoke-super {p0}, Landroid/widget/TextView;->onAttachedToWindow()V

    .line 330
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 331
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 335
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 336
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 337
    :cond_0
    return-void
.end method

.method protected onSetAlpha(I)Z
    .locals 1
    .parameter "alpha"

    .prologue
    .line 341
    iget v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPrevAlpha:I

    if-eq v0, p1, :cond_0

    .line 342
    iput p1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPrevAlpha:I

    .line 343
    invoke-super {p0, p1}, Landroid/widget/TextView;->onSetAlpha(I)Z

    .line 345
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 1
    .parameter "title"

    .prologue
    .line 166
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    if-eqz v0, :cond_0

    .line 167
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    .line 171
    :goto_0
    return-void

    .line 169
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mVisibleText:Ljava/lang/CharSequence;

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "event"

    .prologue
    .line 220
    invoke-super {p0, p1}, Landroid/widget/TextView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 222
    .local v0, result:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 253
    :goto_0
    :pswitch_0
    return v0

    .line 227
    :pswitch_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-nez v1, :cond_0

    .line 228
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTempCanvas:Landroid/graphics/Canvas;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedGlowColor:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOutlineColor:I

    invoke-direct {p0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->createGlowingOutline(Landroid/graphics/Canvas;II)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 233
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->isPressed()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 234
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mDidInvalidateForPressedState:Z

    .line 235
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 240
    :goto_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->postCheckForLongPress()V

    goto :goto_0

    .line 237
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mDidInvalidateForPressedState:Z

    goto :goto_1

    .line 246
    :pswitch_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->isPressed()Z

    move-result v1

    if-nez v1, :cond_2

    .line 247
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 250
    :cond_2
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    goto :goto_0

    .line 222
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
    .line 265
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    if-eqz v2, :cond_0

    .line 266
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 267
    .local v1, parent:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    if-eqz v1, :cond_0

    .line 268
    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 269
    .local v0, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    if-eqz v2, :cond_1

    .end local p0
    :goto_0
    invoke-virtual {v0, p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->setPressedOrFocusedIcon(Lcom/cyanogenmod/trebuchet/BubbleTextView;)V

    .line 272
    .end local v0           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v1           #parent:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    :cond_0
    return-void

    .line 269
    .restart local v0       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v1       #parent:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
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
    .line 105
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getLeft()I

    move-result v0

    if-ne v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getRight()I

    move-result v0

    if-ne v0, p3, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getTop()I

    move-result v0

    if-ne v0, p2, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getBottom()I

    move-result v0

    if-eq v0, p4, :cond_1

    .line 106
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackgroundSizeChanged:Z

    .line 108
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setFrame(IIII)Z

    move-result v0

    return v0
.end method

.method setStayPressed(Z)V
    .locals 1
    .parameter "stayPressed"

    .prologue
    .line 257
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mStayPressed:Z

    .line 258
    if-nez p1, :cond_0

    .line 259
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mPressedOrFocusedBackground:Landroid/graphics/Bitmap;

    .line 261
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setCellLayoutPressedOrFocusedIcon()V

    .line 262
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 1
    .parameter "tag"

    .prologue
    .line 118
    if-eqz p1, :cond_0

    move-object v0, p1

    .line 119
    check-cast v0, Lcom/cyanogenmod/trebuchet/ItemInfo;

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherModel;->checkItemInfo(Lcom/cyanogenmod/trebuchet/ItemInfo;)V

    .line 121
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 122
    return-void
.end method

.method public setTextVisible(Z)V
    .locals 1
    .parameter "visible"

    .prologue
    .line 356
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    if-ne v0, p1, :cond_0

    .line 364
    :goto_0
    return-void

    .line 357
    :cond_0
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mTextVisible:Z

    .line 358
    if-eqz p1, :cond_1

    .line 359
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mVisibleText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 361
    :cond_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mVisibleText:Ljava/lang/CharSequence;

    .line 362
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/BubbleTextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method protected verifyDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1
    .parameter "who"

    .prologue
    .line 113
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/BubbleTextView;->mBackground:Landroid/graphics/drawable/Drawable;

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
