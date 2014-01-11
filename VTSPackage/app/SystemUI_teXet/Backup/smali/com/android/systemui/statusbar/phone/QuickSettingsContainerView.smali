.class Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;
.super Landroid/widget/FrameLayout;
.source "QuickSettingsContainerView.java"


# instance fields
.field private mCellGap:F

.field private mNumColumns:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->updateResources()V

    .line 44
    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .registers 2

    .prologue
    .line 48
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 51
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object v0

    .line 52
    .local v0, transitions:Landroid/animation/LayoutTransition;
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 19
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getChildCount()I

    move-result v0

    .line 106
    .local v0, N:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingLeft()I

    move-result v8

    .line 107
    .local v8, x:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingTop()I

    move-result v9

    .line 108
    .local v9, y:I
    const/4 v3, 0x0

    .line 109
    .local v3, cursor:I
    const/4 v4, 0x0

    .local v4, i:I
    :goto_e
    if-ge v4, v0, :cond_72

    .line 110
    invoke-virtual {p0, v4}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;

    .line 111
    .local v7, v:Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;
    invoke-virtual {v7}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 112
    .local v5, lp:Landroid/view/ViewGroup$LayoutParams;
    invoke-virtual {v7}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getVisibility()I

    move-result v10

    const/16 v11, 0x8

    if-eq v10, v11, :cond_61

    .line 113
    iget v10, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    rem-int v1, v3, v10

    .line 114
    .local v1, col:I
    invoke-virtual {v7}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getColumnSpan()I

    move-result v2

    .line 115
    .local v2, colSpan:I
    iget v10, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    div-int v6, v3, v10

    .line 118
    .local v6, row:I
    add-int v10, v1, v2

    iget v11, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    if-le v10, v11, :cond_43

    .line 119
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingLeft()I

    move-result v8

    .line 120
    int-to-float v10, v9

    iget v11, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v11, v11

    iget v12, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    add-float/2addr v11, v12

    add-float/2addr v10, v11

    float-to-int v9, v10

    .line 121
    add-int/lit8 v6, v6, 0x1

    .line 125
    :cond_43
    iget v10, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    add-int/2addr v10, v8

    iget v11, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    add-int/2addr v11, v9

    invoke-virtual {v7, v8, v9, v10, v11}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->layout(IIII)V

    .line 129
    invoke-virtual {v7}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getColumnSpan()I

    move-result v10

    add-int/2addr v3, v10

    .line 130
    add-int/lit8 v10, v6, 0x1

    iget v11, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    mul-int/2addr v10, v11

    if-ge v3, v10, :cond_64

    .line 131
    int-to-float v10, v8

    iget v11, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v11, v11

    iget v12, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    add-float/2addr v11, v12

    add-float/2addr v10, v11

    float-to-int v8, v10

    .line 109
    .end local v1           #col:I
    .end local v2           #colSpan:I
    .end local v6           #row:I
    :cond_61
    :goto_61
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    .line 133
    .restart local v1       #col:I
    .restart local v2       #colSpan:I
    .restart local v6       #row:I
    :cond_64
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingLeft()I

    move-result v8

    .line 134
    int-to-float v10, v9

    iget v11, v5, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v11, v11

    iget v12, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    add-float/2addr v11, v12

    add-float/2addr v10, v11

    float-to-int v9, v10

    goto :goto_61

    .line 138
    .end local v1           #col:I
    .end local v2           #colSpan:I
    .end local v5           #lp:Landroid/view/ViewGroup$LayoutParams;
    .end local v6           #row:I
    .end local v7           #v:Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;
    :cond_72
    return-void
.end method

.method protected onMeasure(II)V
    .registers 23
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 64
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v16

    .line 65
    .local v16, width:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v8

    .line 66
    .local v8, height:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingLeft()I

    move-result v17

    sub-int v17, v16, v17

    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingRight()I

    move-result v18

    sub-int v17, v17, v18

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    sub-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v3, v0

    .line 68
    .local v3, availableWidth:I
    int-to-float v0, v3

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    div-float v17, v17, v18

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v17

    move-wide/from16 v0, v17

    double-to-float v5, v0

    .line 71
    .local v5, cellWidth:F
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getChildCount()I

    move-result v2

    .line 72
    .local v2, N:I
    const/4 v4, 0x0

    .line 73
    .local v4, cellHeight:I
    const/4 v7, 0x0

    .line 74
    .local v7, cursor:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_56
    if-ge v9, v2, :cond_b6

    .line 76
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;

    .line 77
    .local v15, v:Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;
    invoke-virtual {v15}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getVisibility()I

    move-result v17

    const/16 v18, 0x8

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_b3

    .line 78
    invoke-virtual {v15}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 79
    .local v10, lp:Landroid/view/ViewGroup$MarginLayoutParams;
    invoke-virtual {v15}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getColumnSpan()I

    move-result v6

    .line 80
    .local v6, colSpan:I
    int-to-float v0, v6

    move/from16 v17, v0

    mul-float v17, v17, v5

    add-int/lit8 v18, v6, -0x1

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    add-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    iput v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 83
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v17, v0

    const/high16 v18, 0x4000

    invoke-static/range {v17 .. v18}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 84
    .local v13, newWidthSpec:I
    iget v0, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v17, v0

    const/high16 v18, 0x4000

    invoke-static/range {v17 .. v18}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    .line 85
    .local v12, newHeightSpec:I
    invoke-virtual {v15, v13, v12}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->measure(II)V

    .line 88
    if-gtz v4, :cond_b2

    .line 89
    invoke-virtual {v15}, Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;->getMeasuredHeight()I

    move-result v4

    .line 91
    :cond_b2
    add-int/2addr v7, v6

    .line 74
    .end local v6           #colSpan:I
    .end local v10           #lp:Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v12           #newHeightSpec:I
    .end local v13           #newWidthSpec:I
    :cond_b3
    add-int/lit8 v9, v9, 0x1

    goto :goto_56

    .line 97
    .end local v15           #v:Lcom/android/systemui/statusbar/phone/QuickSettingsTileView;
    :cond_b6
    int-to-float v0, v7

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    div-float v17, v17, v18

    move/from16 v0, v17

    float-to-double v0, v0

    move-wide/from16 v17, v0

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v17

    move-wide/from16 v0, v17

    double-to-int v14, v0

    .line 98
    .local v14, numRows:I
    mul-int v17, v14, v4

    move/from16 v0, v17

    int-to-float v0, v0

    move/from16 v17, v0

    add-int/lit8 v18, v14, -0x1

    move/from16 v0, v18

    int-to-float v0, v0

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    move/from16 v19, v0

    mul-float v18, v18, v19

    add-float v17, v17, v18

    move/from16 v0, v17

    float-to-int v0, v0

    move/from16 v17, v0

    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingTop()I

    move-result v18

    add-int v17, v17, v18

    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getPaddingBottom()I

    move-result v18

    add-int v11, v17, v18

    .line 100
    .local v11, newHeight:I
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1, v11}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->setMeasuredDimension(II)V

    .line 101
    return-void
.end method

.method updateResources()V
    .registers 3

    .prologue
    .line 55
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 56
    .local v0, r:Landroid/content/res/Resources;
    const v1, 0x7f0d003f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mCellGap:F

    .line 57
    const v1, 0x7f0c0009

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->mNumColumns:I

    .line 58
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsContainerView;->requestLayout()V

    .line 59
    return-void
.end method
