.class public Lcom/android/launcher2/PagedViewCellLayout;
.super Landroid/view/ViewGroup;
.source "PagedViewCellLayout.java"

# interfaces
.implements Lcom/android/launcher2/Page;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;
    }
.end annotation


# static fields
.field static final TAG:Ljava/lang/String; = "PagedViewCellLayout"


# instance fields
.field private mCellCountX:I

.field private mCellCountY:I

.field private mCellHeight:I

.field private mCellWidth:I

.field protected mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

.field private mHeightGap:I

.field private mMaxGap:I

.field private mOriginalCellHeight:I

.field private mOriginalCellWidth:I

.field private mOriginalHeightGap:I

.field private mOriginalPaddingLeft:I

.field private mOriginalPaddingRight:I

.field private mOriginalWidthGap:I

.field private mWidthGap:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/PagedViewCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/PagedViewCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedViewCellLayout;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 69
    .local v0, resources:Landroid/content/res/Resources;
    const v1, 0x7f0b0023

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalCellWidth:I

    .line 71
    const v1, 0x7f0b0024

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalCellHeight:I

    .line 75
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingLeft:I

    .line 76
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingRight:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingRight:I

    .line 78
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    .line 79
    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    .line 80
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalHeightGap:I

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalWidthGap:I

    .line 81
    const v1, 0x7f0b0025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mMaxGap:I

    .line 83
    new-instance v1, Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-direct {v1, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    .line 84
    iget-object v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->setCellDimensions(II)V

    .line 85
    iget-object v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    invoke-virtual {v1, v2, v3}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->setGap(II)V

    .line 87
    iget-object v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/PagedViewCellLayout;->addView(Landroid/view/View;)V

    .line 88
    return-void
.end method


# virtual methods
.method public addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/PagedViewCellLayout$LayoutParams;)Z
    .locals 3
    .parameter "child"
    .parameter "index"
    .parameter "childId"
    .parameter "params"

    .prologue
    .line 131
    move-object v0, p4

    .line 135
    .local v0, lp:Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;
    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellX:I

    if-ltz v1, :cond_2

    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellX:I

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_2

    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellY:I

    if-ltz v1, :cond_2

    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellY:I

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_2

    .line 139
    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    if-gez v1, :cond_0

    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    iput v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 140
    :cond_0
    iget v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    if-gez v1, :cond_1

    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    iput v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 142
    :cond_1
    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    .line 143
    iget-object v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v1, p1, p2, v0}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 145
    const/4 v1, 0x1

    .line 147
    :goto_0
    return v1

    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public calculateCellCount(IIII)V
    .locals 1
    .parameter "width"
    .parameter "height"
    .parameter "maxCellCountX"
    .parameter "maxCellCountY"

    .prologue
    .line 448
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedViewCellLayout;->estimateCellHSpan(I)I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    .line 449
    invoke-virtual {p0, p2}, Lcom/android/launcher2/PagedViewCellLayout;->estimateCellVSpan(I)I

    move-result v0

    invoke-static {p4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    .line 456
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->requestLayout()V

    .line 457
    return-void
.end method

.method public cancelLongPress()V
    .locals 3

    .prologue
    .line 119
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 122
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getChildCount()I

    move-result v1

    .line 123
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 124
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 125
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 123
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 127
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 490
    instance-of v0, p1, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;

    return v0
.end method

.method createHardwareLayers()V
    .locals 2

    .prologue
    .line 114
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/PagedViewCellLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 115
    return-void
.end method

.method destroyHardwareLayers()V
    .locals 2

    .prologue
    .line 105
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/android/launcher2/PagedViewCellLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 106
    return-void
.end method

.method public enableCenteredContent(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 349
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->enableCenteredContent(Z)V

    .line 350
    return-void
.end method

.method public estimateCellHSpan(I)I
    .locals 6
    .parameter "width"

    .prologue
    .line 401
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    sub-int v0, p1, v2

    .line 404
    .local v0, availWidth:I
    const/4 v2, 0x1

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    iget v5, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    add-int/2addr v4, v5

    div-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 412
    .local v1, n:I
    return v1
.end method

.method public estimateCellHeight(I)I
    .locals 1
    .parameter "vSpan"

    .prologue
    .line 480
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v0, p1

    return v0
.end method

.method public estimateCellPosition(II)[I
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    .line 436
    const/4 v1, 0x2

    new-array v0, v1, [I

    const/4 v1, 0x0

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v3, p1

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    mul-int/2addr v3, p1

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    aput v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingTop:I

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v3, p2

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    mul-int/2addr v3, p2

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    aput v2, v0, v1

    .line 444
    .local v0, result:[I
    return-object v0
.end method

.method public estimateCellVSpan(I)I
    .locals 6
    .parameter "height"

    .prologue
    .line 421
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    sub-int v0, p1, v2

    .line 424
    .local v0, availHeight:I
    const/4 v2, 0x1

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    iget v5, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    add-int/2addr v4, v5

    div-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 431
    .local v1, n:I
    return v1
.end method

.method public estimateCellWidth(I)I
    .locals 1
    .parameter "hSpan"

    .prologue
    .line 468
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v0, p1

    return v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 485
    new-instance v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 495
    new-instance v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getCellCountForDimensions(II)[I
    .locals 5
    .parameter "width"
    .parameter "height"

    .prologue
    .line 372
    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    iget v4, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 375
    .local v0, smallerSize:I
    add-int v3, p1, v0

    div-int v1, v3, v0

    .line 376
    .local v1, spanX:I
    add-int v3, p2, v0

    div-int v2, v3, v0

    .line 382
    .local v2, spanY:I
    const/4 v3, 0x2

    new-array v3, v3, [I

    const/4 v4, 0x0

    aput v1, v3, v4

    const/4 v4, 0x1

    aput v2, v3, v4

    return-object v3
.end method

.method public getCellCountX()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    return v0
.end method

.method public getCellCountY()I
    .locals 1

    .prologue
    .line 203
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    return v0
.end method

.method public getCellHeight()I
    .locals 1

    .prologue
    .line 95
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    return v0
.end method

.method public getCellWidth()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    return v0
.end method

.method public getChildOnPageAt(I)Landroid/view/View;
    .locals 1
    .parameter "i"

    .prologue
    .line 190
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenLayout()Lcom/android/launcher2/PagedViewCellLayoutChildren;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    return-object v0
.end method

.method getContentHeight()I
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 307
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    if-lez v1, :cond_0

    .line 308
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/2addr v0, v2

    add-int/2addr v0, v1

    .line 310
    :cond_0
    return v0
.end method

.method getContentWidth()I
    .locals 2

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getWidthBeforeFirstLayout()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getPageChildCount()I
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    return v0
.end method

.method getWidthBeforeFirstLayout()I
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 314
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    if-lez v1, :cond_0

    .line 315
    iget v1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/2addr v0, v2

    add-int/2addr v0, v1

    .line 317
    :cond_0
    return v0
.end method

.method public indexOfChildOnPage(Landroid/view/View;)I
    .locals 1
    .parameter "v"

    .prologue
    .line 195
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->indexOfChild(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method onDragChild(Landroid/view/View;)V
    .locals 2
    .parameter "child"

    .prologue
    .line 391
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;

    .line 392
    .local v0, lp:Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/android/launcher2/PagedViewCellLayout$LayoutParams;->isDragging:Z

    .line 393
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 8
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getChildCount()I

    move-result v1

    .line 323
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 324
    invoke-virtual {p0, v2}, Lcom/android/launcher2/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 325
    .local v0, child:Landroid/view/View;
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingTop()I

    move-result v4

    sub-int v5, p4, p2

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 323
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 328
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 23
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 207
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    .line 208
    .local v18, widthSpecMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v19

    .line 210
    .local v19, widthSpecSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v9

    .line 211
    .local v9, heightSpecMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v10

    .line 213
    .local v10, heightSpecSize:I
    if-eqz v18, :cond_0

    if-nez v9, :cond_1

    .line 214
    :cond_0
    new-instance v20, Ljava/lang/RuntimeException;

    const-string v21, "CellLayout cannot have UNSPECIFIED dimensions"

    invoke-direct/range {v20 .. v21}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 219
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingLeft:I

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    .line 220
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingRight:I

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingRight:I

    .line 222
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    move/from16 v20, v0

    add-int/lit8 v15, v20, -0x1

    .line 223
    .local v15, numWidthGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    move/from16 v20, v0

    add-int/lit8 v14, v20, -0x1

    .line 225
    .local v14, numHeightGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalWidthGap:I

    move/from16 v20, v0

    if-ltz v20, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalHeightGap:I

    move/from16 v20, v0

    if-gez v20, :cond_7

    .line 226
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v20

    sub-int v20, v19, v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v21

    sub-int v7, v20, v21

    .line 227
    .local v7, hSpace:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingTop()I

    move-result v20

    sub-int v20, v10, v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingBottom()I

    move-result v21

    sub-int v17, v20, v21

    .line 228
    .local v17, vSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalCellWidth:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    sub-int v6, v7, v20

    .line 229
    .local v6, hFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalCellHeight:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    sub-int v16, v17, v20

    .line 230
    .local v16, vFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mMaxGap:I

    move/from16 v21, v0

    if-lez v15, :cond_5

    div-int v20, v6, v15

    :goto_0
    move/from16 v0, v21

    move/from16 v1, v20

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    .line 231
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mMaxGap:I

    move/from16 v21, v0

    if-lez v14, :cond_6

    div-int v20, v16, v14

    :goto_1
    move/from16 v0, v21

    move/from16 v1, v20

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v20

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    .line 239
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    move/from16 v22, v0

    invoke-virtual/range {v20 .. v22}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->setGap(II)V

    .line 246
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v16           #vFreeSpace:I
    .end local v17           #vSpace:I
    :goto_2
    move/from16 v13, v19

    .line 247
    .local v13, newWidth:I
    move v12, v10

    .line 258
    .local v12, newHeight:I
    const/high16 v20, -0x8000

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 259
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v21

    add-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellWidth:I

    move/from16 v22, v0

    mul-int v21, v21, v22

    add-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    move/from16 v22, v0

    mul-int v21, v21, v22

    add-int v13, v20, v21

    .line 261
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingTop()I

    move-result v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingBottom()I

    move-result v21

    add-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    move/from16 v22, v0

    mul-int v21, v21, v22

    add-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    move/from16 v22, v0

    mul-int v21, v21, v22

    add-int v12, v20, v21

    .line 274
    move/from16 v0, v19

    if-eq v13, v0, :cond_3

    .line 275
    sub-int v20, v19, v13

    shr-int/lit8 v8, v20, 0x1

    .line 276
    .local v8, halfGap:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    move/from16 v20, v0

    add-int v20, v20, v8

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    .line 277
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingRight:I

    move/from16 v20, v0

    sub-int v21, v19, v13

    sub-int v21, v21, v8

    add-int v20, v20, v21

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingRight:I

    .line 278
    move/from16 v13, v19

    .line 280
    .end local v8           #halfGap:I
    :cond_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v12}, Lcom/android/launcher2/PagedViewCellLayout;->setMeasuredDimension(II)V

    .line 283
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getChildCount()I

    move-result v5

    .line 284
    .local v5, count:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_3
    if-ge v11, v5, :cond_8

    .line 285
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/android/launcher2/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 286
    .local v2, child:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingLeft()I

    move-result v20

    sub-int v20, v13, v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingRight()I

    move-result v21

    sub-int v20, v20, v21

    const/high16 v21, 0x4000

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 289
    .local v3, childWidthMeasureSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingTop()I

    move-result v20

    sub-int v20, v12, v20

    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPaddingBottom()I

    move-result v21

    sub-int v20, v20, v21

    const/high16 v21, 0x4000

    invoke-static/range {v20 .. v21}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 292
    .local v4, childheightMeasureSpec:I
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 284
    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 230
    .end local v2           #child:Landroid/view/View;
    .end local v3           #childWidthMeasureSpec:I
    .end local v4           #childheightMeasureSpec:I
    .end local v5           #count:I
    .end local v11           #i:I
    .end local v12           #newHeight:I
    .end local v13           #newWidth:I
    .restart local v6       #hFreeSpace:I
    .restart local v7       #hSpace:I
    .restart local v16       #vFreeSpace:I
    .restart local v17       #vSpace:I
    :cond_5
    const/16 v20, 0x0

    goto/16 :goto_0

    .line 231
    :cond_6
    const/16 v20, 0x0

    goto/16 :goto_1

    .line 241
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v16           #vFreeSpace:I
    .end local v17           #vSpace:I
    :cond_7
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalWidthGap:I

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    .line 242
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalHeightGap:I

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    goto/16 :goto_2

    .line 299
    .restart local v5       #count:I
    .restart local v11       #i:I
    .restart local v12       #newHeight:I
    .restart local v13       #newWidth:I
    :cond_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v13, v12}, Lcom/android/launcher2/PagedViewCellLayout;->setMeasuredDimension(II)V

    .line 300
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .parameter "event"

    .prologue
    .line 332
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    .line 333
    .local v4, result:Z
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPageChildCount()I

    move-result v2

    .line 334
    .local v2, count:I
    if-lez v2, :cond_2

    .line 336
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v5}, Lcom/android/launcher2/PagedViewCellLayout;->getChildOnPageAt(I)Landroid/view/View;

    move-result-object v1

    .line 337
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 338
    .local v0, bottom:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getPageChildCount()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountX()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 339
    .local v3, numRows:I
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountY()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 341
    iget v5, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellHeight:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v0, v5

    .line 343
    :cond_0
    if-nez v4, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    int-to-float v6, v0

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    :cond_1
    const/4 v4, 0x1

    .line 345
    .end local v0           #bottom:I
    .end local v1           #child:Landroid/view/View;
    .end local v3           #numRows:I
    :cond_2
    :goto_0
    return v4

    .line 343
    .restart local v0       #bottom:I
    .restart local v1       #child:Landroid/view/View;
    .restart local v3       #numRows:I
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public removeAllViewsOnPage()V
    .locals 3

    .prologue
    .line 153
    const-string v0, "PagedViewCellLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeAllViewsOnPage: mChildren = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->removeAllViews()V

    .line 157
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->destroyHardwareLayers()V

    .line 158
    return-void
.end method

.method public removeViewOnPageAt(I)V
    .locals 3
    .parameter "index"

    .prologue
    .line 163
    const-string v0, "PagedViewCellLayout"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeViewOnPageAt: mChildren = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->removeViewAt(I)V

    .line 167
    return-void
.end method

.method public resetChildrenOnKeyListeners()V
    .locals 4

    .prologue
    .line 173
    iget-object v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v2}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 174
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, j:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 175
    iget-object v2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v2, v1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 174
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 177
    :cond_0
    return-void
.end method

.method public setCellCount(II)V
    .locals 0
    .parameter "xCount"
    .parameter "yCount"

    .prologue
    .line 358
    iput p1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountX:I

    .line 359
    iput p2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mCellCountY:I

    .line 360
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewCellLayout;->requestLayout()V

    .line 361
    return-void
.end method

.method protected setChildrenDrawingCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 354
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->setChildrenDrawingCacheEnabled(Z)V

    .line 355
    return-void
.end method

.method public setGap(II)V
    .locals 1
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 364
    iput p1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mWidthGap:I

    iput p1, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalWidthGap:I

    .line 365
    iput p2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mHeightGap:I

    iput p2, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalHeightGap:I

    .line 366
    iget-object v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mChildren:Lcom/android/launcher2/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1, p2}, Lcom/android/launcher2/PagedViewCellLayoutChildren;->setGap(II)V

    .line 367
    return-void
.end method

.method public setPadding(IIII)V
    .locals 1
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 500
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 503
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingLeft:I

    iput v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingLeft:I

    .line 504
    iget v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mPaddingRight:I

    iput v0, p0, Lcom/android/launcher2/PagedViewCellLayout;->mOriginalPaddingRight:I

    .line 505
    return-void
.end method
