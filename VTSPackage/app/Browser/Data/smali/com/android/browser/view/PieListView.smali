.class public Lcom/android/browser/view/PieListView;
.super Lcom/android/browser/view/BasePieView;
.source "PieListView.java"


# instance fields
.field private mBgPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "ctx"

    .prologue
    .line 33
    invoke-direct {p0}, Lcom/android/browser/view/BasePieView;-><init>()V

    .line 34
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/browser/view/PieListView;->mBgPaint:Landroid/graphics/Paint;

    .line 35
    iget-object v0, p0, Lcom/android/browser/view/PieListView;->mBgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a000a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 36
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .parameter "canvas"

    .prologue
    .line 69
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mLeft:I

    int-to-float v1, v0

    iget v0, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    int-to-float v2, v0

    iget v0, p0, Lcom/android/browser/view/BasePieView;->mLeft:I

    iget v3, p0, Lcom/android/browser/view/BasePieView;->mWidth:I

    add-int/2addr v0, v3

    int-to-float v3, v0

    iget v0, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    iget v4, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    add-int/2addr v0, v4

    int-to-float v4, v0

    iget-object v5, p0, Lcom/android/browser/view/PieListView;->mBgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 70
    iget-object v0, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 71
    iget-object v0, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    .line 72
    .local v7, view:Landroid/view/View;
    invoke-virtual {p0, v7, p1}, Lcom/android/browser/view/PieListView;->drawView(Landroid/view/View;Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 75
    .end local v6           #i$:Ljava/util/Iterator;
    .end local v7           #view:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected findChildAt(I)I
    .locals 3
    .parameter "y"

    .prologue
    .line 79
    iget v1, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    sub-int v1, p1, v1

    iget-object v2, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    div-int v0, v1, v2

    .line 80
    .local v0, ix:I
    return v0
.end method

.method public layout(IIZFI)V
    .locals 3
    .parameter "anchorX"
    .parameter "anchorY"
    .parameter "left"
    .parameter "angle"
    .parameter "pHeight"

    .prologue
    const/4 v1, 0x0

    .line 44
    invoke-super/range {p0 .. p5}, Lcom/android/browser/view/BasePieView;->layout(IIZFI)V

    .line 45
    invoke-virtual {p0}, Lcom/android/browser/view/PieListView;->buildViews()V

    .line 46
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mChildWidth:I

    iput v0, p0, Lcom/android/browser/view/BasePieView;->mWidth:I

    .line 47
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mChildHeight:I

    iget-object v2, p0, Lcom/android/browser/view/BasePieView;->mAdapter:Landroid/widget/Adapter;

    invoke-interface {v2}, Landroid/widget/Adapter;->getCount()I

    move-result v2

    mul-int/2addr v0, v2

    iput v0, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    .line 48
    if-eqz p3, :cond_2

    move v0, v1

    :goto_0
    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/browser/view/BasePieView;->mLeft:I

    .line 49
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    div-int/lit8 v0, v0, 0x2

    sub-int v0, p2, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    .line 50
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    iget v1, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    add-int/2addr v0, v1

    if-le v0, p5, :cond_0

    .line 51
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mHeight:I

    sub-int v0, p5, v0

    iput v0, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 54
    invoke-virtual {p0}, Lcom/android/browser/view/PieListView;->layoutChildrenLinear()V

    .line 56
    :cond_1
    return-void

    .line 48
    :cond_2
    iget v0, p0, Lcom/android/browser/view/BasePieView;->mChildWidth:I

    neg-int v0, v0

    goto :goto_0
.end method

.method protected layoutChildrenLinear()V
    .locals 7

    .prologue
    .line 59
    iget-object v4, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 60
    .local v1, n:I
    iget v2, p0, Lcom/android/browser/view/BasePieView;->mTop:I

    .line 61
    .local v2, top:I
    iget-object v4, p0, Lcom/android/browser/view/BasePieView;->mViews:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 62
    .local v3, view:Landroid/view/View;
    iget v4, p0, Lcom/android/browser/view/BasePieView;->mLeft:I

    iget v5, p0, Lcom/android/browser/view/BasePieView;->mLeft:I

    iget v6, p0, Lcom/android/browser/view/BasePieView;->mChildWidth:I

    add-int/2addr v5, v6

    iget v6, p0, Lcom/android/browser/view/BasePieView;->mChildHeight:I

    add-int/2addr v6, v2

    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 63
    iget v4, p0, Lcom/android/browser/view/BasePieView;->mChildHeight:I

    add-int/2addr v2, v4

    goto :goto_0

    .line 65
    .end local v3           #view:Landroid/view/View;
    :cond_0
    return-void
.end method
