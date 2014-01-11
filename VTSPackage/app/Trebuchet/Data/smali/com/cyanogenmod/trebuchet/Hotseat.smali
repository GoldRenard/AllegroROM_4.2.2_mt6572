.class public Lcom/cyanogenmod/trebuchet/Hotseat;
.super Lcom/cyanogenmod/trebuchet/PagedView;
.source "Hotseat.java"


# static fields
.field private static final DEFAULT_CELL_COUNT:I = 0x5

.field private static final DEFAULT_PAGE:I


# instance fields
.field private mCellCount:I

.field private mDefaultPage:I

.field private mHotseatPages:I

.field private mIsLandscape:Z

.field private mTempCellLayoutCenterCoordinates:[F

.field private mTempInverseMatrix:Landroid/graphics/Matrix;

.field private mTransposeLayoutWithOrientation:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    const/4 v9, 0x2

    new-array v9, v9, [F

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempCellLayoutCenterCoordinates:[F

    .line 40
    new-instance v9, Landroid/graphics/Matrix;

    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    iput-object v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 57
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    .line 59
    .local v8, res:Landroid/content/res/Resources;
    const/4 v9, 0x0

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mFadeInAdjacentScreens:Z

    .line 60
    const/4 v9, 0x1

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHandleScrollIndicator:Z

    .line 62
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getNumberPages()I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHotseatPages:I

    .line 63
    const/4 v9, 0x0

    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getDefaultPage(I)I

    move-result v4

    .line 64
    .local v4, defaultPage:I
    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHotseatPages:I

    if-lt v4, v9, :cond_0

    .line 65
    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHotseatPages:I

    div-int/lit8 v4, v9, 0x2

    .line 68
    :cond_0
    iput v4, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mDefaultPage:I

    iput v4, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCurrentPage:I

    .line 70
    sget-object v9, Lcom/cyanogenmod/trebuchet/R$styleable;->Hotseat:[I

    const/4 v10, 0x0

    invoke-virtual {p1, p2, v9, p3, v10}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 72
    .local v0, a:Landroid/content/res/TypedArray;
    const v9, 0x7f0b000a

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v9

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTransposeLayoutWithOrientation:Z

    .line 74
    invoke-virtual {v8}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v9, v9, Landroid/content/res/Configuration;->orientation:I

    const/4 v10, 0x2

    if-ne v9, v10, :cond_4

    const/4 v9, 0x1

    :goto_0
    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mIsLandscape:Z

    .line 76
    const/4 v9, 0x0

    const/4 v10, 0x5

    invoke-virtual {v0, v9, v10}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    .line 77
    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getNumberIcons(I)I

    move-result v9

    iput v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    .line 79
    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/LauncherModel;->updateHotseatLayoutCells(I)V

    .line 81
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v9

    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mVertical:Z

    .line 83
    invoke-static {}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getHideIconLabels()Z

    move-result v9

    if-nez v9, :cond_1

    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mVertical:Z

    if-eqz v9, :cond_5

    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v9

    if-nez v9, :cond_5

    :cond_1
    const/4 v5, 0x1

    .line 85
    .local v5, hideDockIconLabels:Z
    :goto_1
    const v9, 0x7f0d0014

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v9

    float-to-int v1, v9

    .line 86
    .local v1, cellHeight:I
    if-nez v5, :cond_2

    .line 87
    const v9, 0x7f0d007b

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v9

    float-to-int v1, v9

    .line 90
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f0c0023

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v9

    invoke-static {v9}, Lcom/cyanogenmod/trebuchet/preference/PreferencesProvider$Interface$Dock;->getIconScale(I)I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x42c8

    div-float v2, v9, v10

    .line 93
    .local v2, childrenScale:F
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "layout_inflater"

    invoke-virtual {v9, v10}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/LayoutInflater;

    .line 95
    .local v7, inflater:Landroid/view/LayoutInflater;
    const/4 v6, 0x0

    .local v6, i:I
    :goto_2
    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHotseatPages:I

    if-ge v6, v9, :cond_8

    .line 96
    const v9, 0x7f040013

    const/4 v10, 0x0

    invoke-virtual {v7, v9, v10}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 97
    .local v3, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v3, v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->setChildrenScale(F)V

    .line 98
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v9

    if-nez v9, :cond_6

    iget v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    :goto_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v10

    if-eqz v10, :cond_7

    iget v10, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    :goto_4
    invoke-virtual {v3, v9, v10}, Lcom/cyanogenmod/trebuchet/CellLayout;->setGridSize(II)V

    .line 100
    if-nez v5, :cond_3

    .line 101
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCellWidth()I

    move-result v9

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidthGap()I

    move-result v10

    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeightGap()I

    move-result v11

    invoke-virtual {v3, v9, v1, v10, v11}, Lcom/cyanogenmod/trebuchet/CellLayout;->setCellDimensions(IIII)V

    .line 104
    :cond_3
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/Hotseat;->addView(Landroid/view/View;)V

    .line 95
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 74
    .end local v1           #cellHeight:I
    .end local v2           #childrenScale:F
    .end local v3           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v5           #hideDockIconLabels:Z
    .end local v6           #i:I
    .end local v7           #inflater:Landroid/view/LayoutInflater;
    :cond_4
    const/4 v9, 0x0

    goto/16 :goto_0

    .line 83
    :cond_5
    const/4 v5, 0x0

    goto :goto_1

    .line 98
    .restart local v1       #cellHeight:I
    .restart local v2       #childrenScale:F
    .restart local v3       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v5       #hideDockIconLabels:Z
    .restart local v6       #i:I
    .restart local v7       #inflater:Landroid/view/LayoutInflater;
    :cond_6
    const/4 v9, 0x1

    goto :goto_3

    :cond_7
    const/4 v10, 0x1

    goto :goto_4

    .line 108
    .end local v3           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_8
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->setDataIsReady()V

    .line 110
    new-instance v9, Lcom/cyanogenmod/trebuchet/HotseatIconKeyEventListener;

    invoke-direct {v9}, Lcom/cyanogenmod/trebuchet/HotseatIconKeyEventListener;-><init>()V

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/Hotseat;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 111
    return-void
.end method


# virtual methods
.method findMatchingPageForDragOver(FFZ)Lcom/cyanogenmod/trebuchet/CellLayout;
    .locals 10
    .parameter "originX"
    .parameter "originY"
    .parameter "exact"

    .prologue
    .line 214
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v5

    .line 215
    .local v5, screenCount:I
    const/4 v0, 0x0

    .line 216
    .local v0, bestMatchingScreen:Lcom/cyanogenmod/trebuchet/CellLayout;
    const v6, 0x7f7fffff

    .line 218
    .local v6, smallestDistSoFar:F
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v5, :cond_2

    .line 219
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 221
    .local v2, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    const/4 v8, 0x2

    new-array v7, v8, [F

    const/4 v8, 0x0

    aput p1, v7, v8

    const/4 v8, 0x1

    aput p2, v7, v8

    .line 224
    .local v7, touchXy:[F
    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v8

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v8, v9}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 225
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v2, v7, v8}, Lcom/cyanogenmod/trebuchet/Hotseat;->mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V

    .line 227
    const/4 v8, 0x0

    aget v8, v7, v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_0

    const/4 v8, 0x0

    aget v8, v7, v8

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_0

    const/4 v8, 0x1

    aget v8, v7, v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-ltz v8, :cond_0

    const/4 v8, 0x1

    aget v8, v7, v8

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v9

    int-to-float v9, v9

    cmpg-float v8, v8, v9

    if-gtz v8, :cond_0

    .line 253
    .end local v2           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #touchXy:[F
    :goto_1
    return-object v2

    .line 232
    .restart local v2       #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v7       #touchXy:[F
    :cond_0
    if-nez p3, :cond_1

    .line 234
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempCellLayoutCenterCoordinates:[F

    .line 235
    .local v1, cellLayoutCenter:[F
    const/4 v8, 0x0

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getWidth()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    aput v9, v1, v8

    .line 236
    const/4 v8, 0x1

    invoke-virtual {v2}, Lcom/cyanogenmod/trebuchet/CellLayout;->getHeight()I

    move-result v9

    div-int/lit8 v9, v9, 0x2

    int-to-float v9, v9

    aput v9, v1, v8

    .line 237
    invoke-virtual {p0, v2, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->mapPointFromChildToSelf(Landroid/view/View;[F)V

    .line 239
    const/4 v8, 0x0

    aput p1, v7, v8

    .line 240
    const/4 v8, 0x1

    aput p2, v7, v8

    .line 244
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v8

    invoke-static {v7, v1, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->squaredDistance([F[FZ)F

    move-result v3

    .line 247
    .local v3, dist:F
    cmpg-float v8, v3, v6

    if-gez v8, :cond_1

    .line 248
    move v6, v3

    .line 249
    move-object v0, v2

    .line 218
    .end local v1           #cellLayoutCenter:[F
    .end local v3           #dist:F
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .end local v2           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #touchXy:[F
    :cond_2
    move-object v2, v0

    .line 253
    goto :goto_1
.end method

.method getCellXFromOrder(I)I
    .locals 1
    .parameter "rank"

    .prologue
    .line 142
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .end local p1
    :cond_0
    return p1
.end method

.method getCellYFromOrder(I)I
    .locals 1
    .parameter "rank"

    .prologue
    .line 145
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getDatabaseCellsFromLayout([I)[I
    .locals 5
    .parameter "lpCells"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 157
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-nez v0, :cond_0

    .line 163
    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    aget v2, p1, v4

    sub-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    aput v1, v0, v3

    aget v1, p1, v3

    aput v1, v0, v4

    move-object p1, v0

    goto :goto_0
.end method

.method getInverterCellXFromOrder(I)I
    .locals 1
    .parameter "rank"

    .prologue
    .line 148
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    sub-int/2addr v0, p1

    add-int/lit8 v0, v0, -0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getInverterCellYFromOrder(I)I
    .locals 1
    .parameter "rank"

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .end local p1
    :cond_0
    return p1
.end method

.method getOrderInHotseat(II)I
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mCellCount:I

    sub-int/2addr v0, p2

    add-int/lit8 p1, v0, -0x1

    .end local p1
    :cond_0
    return p1
.end method

.method getScreenFromOrder(I)I
    .locals 1
    .parameter "screen"

    .prologue
    .line 154
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v0

    sub-int/2addr v0, p1

    add-int/lit8 p1, v0, -0x1

    .end local p1
    :cond_0
    return p1
.end method

.method public hasPage(Landroid/view/View;)Z
    .locals 2
    .parameter "view"

    .prologue
    .line 114
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 115
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-ne p1, v1, :cond_0

    .line 116
    const/4 v1, 0x1

    .line 119
    :goto_1
    return v1

    .line 114
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 119
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method hasVerticalHotseat()Z
    .locals 1

    .prologue
    .line 123
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mIsLandscape:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTransposeLayoutWithOrientation:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hitsNextPage(FF)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->hitsNextPage(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected hitsPreviousPage(FF)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 128
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/PagedView;->hitsPreviousPage(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected loadAssociatedPages(I)V
    .locals 0
    .parameter "page"

    .prologue
    .line 296
    return-void
.end method

.method protected loadAssociatedPages(IZ)V
    .locals 0
    .parameter "page"
    .parameter "immediateAndOnly"

    .prologue
    .line 299
    return-void
.end method

.method mapPointFromChildToSelf(Landroid/view/View;[F)V
    .locals 5
    .parameter "v"
    .parameter "xy"

    .prologue
    .line 195
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 196
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollX()I

    move-result v0

    .line 197
    .local v0, scrollX:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 198
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 200
    :cond_0
    const/4 v1, 0x0

    aget v2, p2, v1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    sub-int v3, v0, v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 201
    const/4 v1, 0x1

    aget v2, p2, v1

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollY()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    sub-float/2addr v2, v3

    aput v2, p2, v1

    .line 202
    return-void
.end method

.method mapPointFromSelfToChild(Landroid/view/View;[FLandroid/graphics/Matrix;)V
    .locals 5
    .parameter "v"
    .parameter "xy"
    .parameter "cachedInverseMatrix"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 177
    if-nez p3, :cond_0

    .line 178
    invoke-virtual {p1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempInverseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 179
    iget-object p3, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mTempInverseMatrix:Landroid/graphics/Matrix;

    .line 181
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollX()I

    move-result v0

    .line 182
    .local v0, scrollX:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mNextPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 183
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getFinalX()I

    move-result v0

    .line 185
    :cond_1
    aget v1, p2, v3

    int-to-float v2, v0

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v3

    .line 186
    aget v1, p2, v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getScrollY()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    aput v1, p2, v4

    .line 187
    invoke-virtual {p3, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 188
    return-void
.end method

.method moveToDefaultScreen(Z)V
    .locals 3
    .parameter "animate"

    .prologue
    .line 277
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->hasVerticalHotseat()Z

    move-result v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mHotseatPages:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mDefaultPage:I

    sub-int/2addr v1, v2

    add-int/lit8 v0, v1, -0x1

    .line 278
    .local v0, page:I
    :goto_0
    if-eqz p1, :cond_1

    .line 279
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->snapToPage(I)V

    .line 283
    :goto_1
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 284
    return-void

    .line 277
    .end local v0           #page:I
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/Hotseat;->mDefaultPage:I

    goto :goto_0

    .line 281
    .restart local v0       #page:I
    :cond_1
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/Hotseat;->setCurrentPage(I)V

    goto :goto_1
.end method

.method protected onFinishInflate()V
    .locals 0

    .prologue
    .line 265
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onFinishInflate()V

    .line 266
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->resetLayout()V

    .line 267
    return-void
.end method

.method resetLayout()V
    .locals 3

    .prologue
    .line 270
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 271
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 272
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->removeAllViewsInLayout()V

    .line 270
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 274
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method public setChildrenOutlineAlpha(F)V
    .locals 3
    .parameter "alpha"

    .prologue
    .line 257
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 258
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/Hotseat;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 259
    .local v0, cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v0, p1}, Lcom/cyanogenmod/trebuchet/CellLayout;->setBackgroundAlpha(F)V

    .line 257
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 261
    .end local v0           #cl:Lcom/cyanogenmod/trebuchet/CellLayout;
    :cond_0
    return-void
.end method

.method public syncPageItems(IZ)V
    .locals 0
    .parameter "page"
    .parameter "immediate"

    .prologue
    .line 292
    return-void
.end method

.method public syncPages()V
    .locals 0

    .prologue
    .line 288
    return-void
.end method
