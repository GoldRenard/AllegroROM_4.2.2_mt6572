.class public Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;
.super Landroid/view/ViewGroup;
.source "PagedViewCellLayout.java"

# interfaces
.implements Lcom/cyanogenmod/trebuchet/Page;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.PagedViewCellLayout"


# instance fields
.field private mCellCountX:I

.field private mCellCountY:I

.field private mCellHeight:I

.field private mCellWidth:I

.field protected mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

.field private mHeightGap:I

.field private mMaxGap:I

.field private mOriginalCellHeight:I

.field private mOriginalCellWidth:I

.field private mOriginalHeightGap:I

.field private mOriginalWidthGap:I

.field private mWidthGap:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 53
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 59
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 63
    .local v0, resources:Landroid/content/res/Resources;
    const v1, 0x7f0d0023

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalCellWidth:I

    .line 65
    const v1, 0x7f0d0024

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalCellHeight:I

    .line 67
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountX()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    .line 68
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherModel;->getWorkspaceCellCountY()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    .line 69
    const/4 v1, -0x1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalHeightGap:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalWidthGap:I

    .line 70
    const v1, 0x7f0d0025

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mMaxGap:I

    .line 72
    new-instance v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-direct {v1, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    .line 73
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    invoke-virtual {v1, v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setCellDimensions(II)V

    .line 74
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    invoke-virtual {v1, v2, v3}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setGap(II)V

    .line 76
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->addView(Landroid/view/View;)V

    .line 77
    return-void
.end method


# virtual methods
.method public addViewToCellLayout(Landroid/view/View;IILcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;)Z
    .locals 3
    .parameter "child"
    .parameter "index"
    .parameter "childId"
    .parameter "params"

    .prologue
    .line 112
    move-object v0, p4

    .line 116
    .local v0, lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    if-ltz v1, :cond_2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    if-ltz v1, :cond_2

    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellY:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_2

    .line 120
    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    if-gez v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    iput v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellHSpan:I

    .line 121
    :cond_0
    iget v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    if-gez v1, :cond_1

    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    iput v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->cellVSpan:I

    .line 123
    :cond_1
    invoke-virtual {p1, p3}, Landroid/view/View;->setId(I)V

    .line 124
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v1, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 126
    const/4 v1, 0x1

    .line 128
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
    .line 361
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->estimateCellHSpan(I)I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    .line 362
    invoke-virtual {p0, p2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->estimateCellVSpan(I)I

    move-result v0

    invoke-static {p4, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    .line 363
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->requestLayout()V

    .line 364
    return-void
.end method

.method public cancelLongPress()V
    .locals 3

    .prologue
    .line 100
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 103
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildCount()I

    move-result v1

    .line 104
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 105
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 106
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 389
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    return v0
.end method

.method createHardwareLayers()V
    .locals 2

    .prologue
    .line 95
    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 96
    return-void
.end method

.method destroyHardwareLayers()V
    .locals 2

    .prologue
    .line 90
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 91
    return-void
.end method

.method public enableCenteredContent(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 280
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->enableCenteredContent(Z)V

    .line 281
    return-void
.end method

.method public estimateCellHSpan(I)I
    .locals 6
    .parameter "width"

    .prologue
    .line 328
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    sub-int v0, p1, v2

    .line 331
    .local v0, availWidth:I
    const/4 v2, 0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    add-int/2addr v3, v0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    add-int/2addr v4, v5

    div-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 334
    .local v1, n:I
    return v1
.end method

.method public estimateCellHeight(I)I
    .locals 1
    .parameter "vSpan"

    .prologue
    .line 379
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v0, p1

    return v0
.end method

.method public estimateCellPosition(II)[I
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    .line 354
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v3, p1

    add-int/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    mul-int/2addr v3, p1

    add-int/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    aput v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v2

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v3, p2

    add-int/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    mul-int/2addr v3, p2

    add-int/2addr v2, v3

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    aput v2, v0, v1

    return-object v0
.end method

.method public estimateCellVSpan(I)I
    .locals 6
    .parameter "height"

    .prologue
    .line 343
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    sub-int v0, p1, v2

    .line 346
    .local v0, availHeight:I
    const/4 v2, 0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    add-int/2addr v3, v0

    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    add-int/2addr v4, v5

    div-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 349
    .local v1, n:I
    return v1
.end method

.method public estimateCellWidth(I)I
    .locals 1
    .parameter "hSpan"

    .prologue
    .line 371
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v0, p1

    return v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 384
    new-instance v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 394
    new-instance v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getCellCountForDimensions(II)[I
    .locals 5
    .parameter "width"
    .parameter "height"

    .prologue
    .line 303
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    iget v4, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 306
    .local v0, smallerSize:I
    add-int v3, p1, v0

    div-int v1, v3, v0

    .line 307
    .local v1, spanX:I
    add-int v3, p2, v0

    div-int v2, v3, v0

    .line 309
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
    .line 172
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    return v0
.end method

.method public getCellCountY()I
    .locals 1

    .prologue
    .line 176
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    return v0
.end method

.method public getCellHeight()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    return v0
.end method

.method public getCellWidth()I
    .locals 1

    .prologue
    .line 80
    iget v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    return v0
.end method

.method public getChildOnPageAt(I)Landroid/view/View;
    .locals 1
    .parameter "i"

    .prologue
    .line 163
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenLayout()Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    return-object v0
.end method

.method getContentHeight()I
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 238
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    if-lez v1, :cond_0

    .line 239
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/2addr v0, v2

    add-int/2addr v0, v1

    .line 241
    :cond_0
    return v0
.end method

.method getContentWidth()I
    .locals 2

    .prologue
    .line 234
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getWidthBeforeFirstLayout()I

    move-result v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getPageChildCount()I
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    return v0
.end method

.method getWidthBeforeFirstLayout()I
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 245
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    if-lez v1, :cond_0

    .line 246
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    add-int/lit8 v2, v2, -0x1

    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/2addr v0, v2

    add-int/2addr v0, v1

    .line 248
    :cond_0
    return v0
.end method

.method public indexOfChildOnPage(Landroid/view/View;)I
    .locals 1
    .parameter "v"

    .prologue
    .line 168
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->indexOfChild(Landroid/view/View;)I

    move-result v0

    return v0
.end method

.method onDragChild(Landroid/view/View;)V
    .locals 2
    .parameter "child"

    .prologue
    .line 318
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    .line 319
    .local v0, lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->isDragging:Z

    .line 320
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
    .line 253
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildCount()I

    move-result v1

    .line 254
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 255
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 256
    .local v0, child:Landroid/view/View;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v4

    sub-int v5, p4, p2

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int v6, p5, p3

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 254
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 259
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 22
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 180
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v17

    .line 181
    .local v17, widthSpecMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    .line 183
    .local v18, widthSpecSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    .line 184
    .local v8, heightSpecMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v9

    .line 186
    .local v9, heightSpecSize:I
    if-eqz v17, :cond_0

    if-nez v8, :cond_1

    .line 187
    :cond_0
    new-instance v19, Ljava/lang/RuntimeException;

    const-string v20, "CellLayout cannot have UNSPECIFIED dimensions"

    invoke-direct/range {v19 .. v20}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 190
    :cond_1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    move/from16 v19, v0

    add-int/lit8 v14, v19, -0x1

    .line 191
    .local v14, numWidthGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    move/from16 v19, v0

    add-int/lit8 v13, v19, -0x1

    .line 193
    .local v13, numHeightGaps:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    if-ltz v19, :cond_2

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    if-gez v19, :cond_6

    .line 194
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v20

    sub-int v7, v19, v20

    .line 195
    .local v7, hSpace:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v9, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v16, v19, v20

    .line 196
    .local v16, vSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalCellWidth:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v6, v7, v19

    .line 197
    .local v6, hFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalCellHeight:I

    move/from16 v20, v0

    mul-int v19, v19, v20

    sub-int v15, v16, v19

    .line 198
    .local v15, vFreeSpace:I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mMaxGap:I

    move/from16 v20, v0

    if-lez v14, :cond_4

    div-int v19, v6, v14

    :goto_0
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    .line 199
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mMaxGap:I

    move/from16 v20, v0

    if-lez v13, :cond_5

    div-int v19, v15, v13

    :goto_1
    move/from16 v0, v20

    move/from16 v1, v19

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    move/from16 v21, v0

    invoke-virtual/range {v19 .. v21}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setGap(II)V

    .line 208
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :goto_2
    move/from16 v12, v18

    .line 209
    .local v12, newWidth:I
    move v11, v9

    .line 210
    .local v11, newHeight:I
    const/high16 v19, -0x8000

    move/from16 v0, v17

    move/from16 v1, v19

    if-ne v0, v1, :cond_3

    .line 211
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellWidth:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v12, v19, v20

    .line 213
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingBottom()I

    move-result v20

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v19, v19, v20

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    move/from16 v20, v0

    add-int/lit8 v20, v20, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    move/from16 v21, v0

    mul-int v20, v20, v21

    add-int v11, v19, v20

    .line 215
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setMeasuredDimension(II)V

    .line 218
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildCount()I

    move-result v5

    .line 219
    .local v5, count:I
    const/4 v10, 0x0

    .local v10, i:I
    :goto_3
    if-ge v10, v5, :cond_7

    .line 220
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 221
    .local v2, child:Landroid/view/View;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingLeft()I

    move-result v19

    sub-int v19, v12, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingRight()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 224
    .local v3, childWidthMeasureSpec:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingTop()I

    move-result v19

    sub-int v19, v11, v19

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPaddingBottom()I

    move-result v20

    sub-int v19, v19, v20

    const/high16 v20, 0x4000

    invoke-static/range {v19 .. v20}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 227
    .local v4, childheightMeasureSpec:I
    invoke-virtual {v2, v3, v4}, Landroid/view/View;->measure(II)V

    .line 219
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 198
    .end local v2           #child:Landroid/view/View;
    .end local v3           #childWidthMeasureSpec:I
    .end local v4           #childheightMeasureSpec:I
    .end local v5           #count:I
    .end local v10           #i:I
    .end local v11           #newHeight:I
    .end local v12           #newWidth:I
    .restart local v6       #hFreeSpace:I
    .restart local v7       #hSpace:I
    .restart local v15       #vFreeSpace:I
    .restart local v16       #vSpace:I
    :cond_4
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 199
    :cond_5
    const/16 v19, 0x0

    goto/16 :goto_1

    .line 203
    .end local v6           #hFreeSpace:I
    .end local v7           #hSpace:I
    .end local v15           #vFreeSpace:I
    .end local v16           #vSpace:I
    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalWidthGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    .line 204
    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalHeightGap:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    goto/16 :goto_2

    .line 230
    .restart local v5       #count:I
    .restart local v10       #i:I
    .restart local v11       #newHeight:I
    .restart local v12       #newWidth:I
    :cond_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v11}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->setMeasuredDimension(II)V

    .line 231
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .parameter "event"

    .prologue
    .line 263
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v4

    .line 264
    .local v4, result:Z
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPageChildCount()I

    move-result v2

    .line 265
    .local v2, count:I
    if-lez v2, :cond_2

    .line 267
    add-int/lit8 v5, v2, -0x1

    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getChildOnPageAt(I)Landroid/view/View;

    move-result-object v1

    .line 268
    .local v1, child:Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    .line 269
    .local v0, bottom:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getPageChildCount()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountX()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v3, v5

    .line 270
    .local v3, numRows:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountY()I

    move-result v5

    if-ge v3, v5, :cond_0

    .line 272
    iget v5, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellHeight:I

    div-int/lit8 v5, v5, 0x2

    add-int/2addr v0, v5

    .line 274
    :cond_0
    if-nez v4, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    int-to-float v6, v0

    cmpg-float v5, v5, v6

    if-gez v5, :cond_3

    :cond_1
    const/4 v4, 0x1

    .line 276
    .end local v0           #bottom:I
    .end local v1           #child:Landroid/view/View;
    .end local v3           #numRows:I
    :cond_2
    :goto_0
    return v4

    .line 274
    .restart local v0       #bottom:I
    .restart local v1       #child:Landroid/view/View;
    .restart local v3       #numRows:I
    :cond_3
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public removeAllViewsOnPage()V
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->removeAllViews()V

    .line 134
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->destroyHardwareLayers()V

    .line 135
    return-void
.end method

.method public removeViewOnPageAt(I)V
    .locals 1
    .parameter "index"

    .prologue
    .line 139
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->removeViewAt(I)V

    .line 140
    return-void
.end method

.method public resetChildrenOnKeyListeners()V
    .locals 4

    .prologue
    .line 146
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 147
    .local v0, childCount:I
    const/4 v1, 0x0

    .local v1, j:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 148
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 147
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 150
    :cond_0
    return-void
.end method

.method public setCellCount(II)V
    .locals 0
    .parameter "xCount"
    .parameter "yCount"

    .prologue
    .line 289
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountX:I

    .line 290
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mCellCountY:I

    .line 291
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->requestLayout()V

    .line 292
    return-void
.end method

.method protected setChildrenDrawingCacheEnabled(Z)V
    .locals 1
    .parameter "enabled"

    .prologue
    .line 285
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setChildrenDrawingCacheEnabled(Z)V

    .line 286
    return-void
.end method

.method public setGap(II)V
    .locals 1
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 295
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mWidthGap:I

    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalWidthGap:I

    .line 296
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mHeightGap:I

    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mOriginalHeightGap:I

    .line 297
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->mChildren:Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    invoke-virtual {v0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setGap(II)V

    .line 298
    return-void
.end method
