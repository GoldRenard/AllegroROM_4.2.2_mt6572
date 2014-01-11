.class public Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;
.super Landroid/view/ViewGroup;
.source "PagedViewCellLayoutChildren.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Trebuchet.PagedViewCellLayout"


# instance fields
.field private mCellHeight:I

.field private mCellWidth:I

.field private mCenterContent:Z

.field private mHeightGap:I

.field private mWidthGap:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 40
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 41
    return-void
.end method


# virtual methods
.method public cancelLongPress()V
    .locals 3

    .prologue
    .line 45
    invoke-super {p0}, Landroid/view/ViewGroup;->cancelLongPress()V

    .line 48
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v1

    .line 49
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 50
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 51
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 53
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public enableCenteredContent(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCenterContent:Z

    .line 146
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 12
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v3

    .line 113
    .local v3, count:I
    const/4 v9, 0x0

    .line 114
    .local v9, offsetX:I
    iget-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCenterContent:Z

    if-eqz v10, :cond_2

    if-lez v3, :cond_2

    .line 116
    const/4 v7, 0x0

    .line 117
    .local v7, maxRowX:I
    const v8, 0x7fffffff

    .line 118
    .local v8, minRowX:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    if-ge v4, v3, :cond_1

    .line 119
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 120
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_0

    .line 121
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    .line 123
    .local v5, lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    iget v10, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->x:I

    invoke-static {v8, v10}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 124
    iget v10, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->x:I

    iget v11, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->width:I

    add-int/2addr v10, v11

    invoke-static {v7, v10}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 118
    .end local v5           #lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 127
    .end local v0           #child:Landroid/view/View;
    :cond_1
    sub-int v6, v7, v8

    .line 128
    .local v6, maxRowWidth:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getMeasuredWidth()I

    move-result v10

    sub-int/2addr v10, v6

    div-int/lit8 v9, v10, 0x2

    .line 131
    .end local v4           #i:I
    .end local v6           #maxRowWidth:I
    .end local v7           #maxRowX:I
    .end local v8           #minRowX:I
    :cond_2
    const/4 v4, 0x0

    .restart local v4       #i:I
    :goto_1
    if-ge v4, v3, :cond_4

    .line 132
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 133
    .restart local v0       #child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_3

    .line 134
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    .line 137
    .restart local v5       #lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    iget v10, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->x:I

    add-int v1, v9, v10

    .line 138
    .local v1, childLeft:I
    iget v2, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->y:I

    .line 139
    .local v2, childTop:I
    iget v10, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->width:I

    add-int/2addr v10, v1

    iget v11, v5, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->height:I

    add-int/2addr v11, v2

    invoke-virtual {v0, v1, v2, v10, v11}, Landroid/view/View;->layout(IIII)V

    .line 131
    .end local v1           #childLeft:I
    .end local v2           #childTop:I
    .end local v5           #lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 142
    .end local v0           #child:Landroid/view/View;
    :cond_4
    return-void
.end method

.method protected onMeasure(II)V
    .locals 18
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 79
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v16

    .line 80
    .local v16, widthSpecMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v17

    .line 82
    .local v17, widthSpecSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 83
    .local v13, heightSpecMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v14

    .line 85
    .local v14, heightSpecSize:I
    if-eqz v16, :cond_0

    if-nez v13, :cond_1

    .line 86
    :cond_0
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "CellLayout cannot have UNSPECIFIED dimensions"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 89
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v12

    .line 90
    .local v12, count:I
    const/4 v15, 0x0

    .local v15, i:I
    :goto_0
    if-ge v15, v12, :cond_2

    .line 91
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 92
    .local v9, child:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;

    .line 94
    .local v2, lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCellWidth:I

    move-object/from16 v0, p0

    iget v4, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCellHeight:I

    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mWidthGap:I

    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mHeightGap:I

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getPaddingLeft()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getPaddingTop()I

    move-result v8

    invoke-virtual/range {v2 .. v8}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->setup(IIIIII)V

    .line 98
    iget v3, v2, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->width:I

    const/high16 v4, 0x4000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 100
    .local v10, childWidthMeasureSpec:I
    iget v3, v2, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;->height:I

    const/high16 v4, 0x4000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v11

    .line 103
    .local v11, childheightMeasureSpec:I
    invoke-virtual {v9, v10, v11}, Landroid/view/View;->measure(II)V

    .line 90
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 106
    .end local v2           #lp:Lcom/cyanogenmod/trebuchet/PagedViewCellLayout$LayoutParams;
    .end local v9           #child:Landroid/view/View;
    .end local v10           #childWidthMeasureSpec:I
    .end local v11           #childheightMeasureSpec:I
    :cond_2
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v14}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->setMeasuredDimension(II)V

    .line 107
    return-void
.end method

.method public requestChildFocus(Landroid/view/View;Landroid/view/View;)V
    .locals 1
    .parameter "child"
    .parameter "focused"

    .prologue
    .line 69
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    .line 70
    if-eqz p1, :cond_0

    .line 71
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 72
    .local v0, r:Landroid/graphics/Rect;
    invoke-virtual {p1, v0}, Landroid/view/View;->getDrawingRect(Landroid/graphics/Rect;)V

    .line 73
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->requestRectangleOnScreen(Landroid/graphics/Rect;)Z

    .line 75
    .end local v0           #r:Landroid/graphics/Rect;
    :cond_0
    return-void
.end method

.method public setCellDimensions(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    .line 62
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCellWidth:I

    .line 63
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mCellHeight:I

    .line 64
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->requestLayout()V

    .line 65
    return-void
.end method

.method protected setChildrenDrawingCacheEnabled(Z)V
    .locals 4
    .parameter "enabled"

    .prologue
    .line 150
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildCount()I

    move-result v0

    .line 151
    .local v0, count:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 152
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 153
    .local v2, view:Landroid/view/View;
    invoke-virtual {v2, p1}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 155
    invoke-virtual {v2}, Landroid/view/View;->isHardwareAccelerated()Z

    move-result v3

    if-nez v3, :cond_0

    .line 156
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/view/View;->buildDrawingCache(Z)V

    .line 151
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 159
    .end local v2           #view:Landroid/view/View;
    :cond_1
    return-void
.end method

.method public setGap(II)V
    .locals 0
    .parameter "widthGap"
    .parameter "heightGap"

    .prologue
    .line 56
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mWidthGap:I

    .line 57
    iput p2, p0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->mHeightGap:I

    .line 58
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;->requestLayout()V

    .line 59
    return-void
.end method
