.class public Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;
.super Ljava/lang/Object;
.source "RecentsScrollViewPerformanceHelper.java"


# static fields
.field public static final OPTIMIZE_SW_RENDERED_RECENTS:Z = true

.field public static final USE_DARK_FADE_IN_HW_ACCELERATED_MODE:Z = true


# instance fields
.field private mFadingEdgeLength:I

.field private mIsVertical:Z

.field private mScrollView:Landroid/view/View;

.field private mSoftwareRendered:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;Z)V
    .registers 8
    .parameter "context"
    .parameter "attrs"
    .parameter "scrollView"
    .parameter "isVertical"

    .prologue
    .line 54
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 40
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mSoftwareRendered:Z

    .line 55
    iput-object p3, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mScrollView:Landroid/view/View;

    .line 56
    sget-object v1, Lcom/android/internal/R$styleable;->View:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 57
    .local v0, a:Landroid/content/res/TypedArray;
    const/16 v1, 0x18

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledFadingEdgeLength()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mFadingEdgeLength:I

    .line 59
    iput-boolean p4, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mIsVertical:Z

    .line 60
    return-void
.end method

.method public static create(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;Z)Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;
    .registers 7
    .parameter "context"
    .parameter "attrs"
    .parameter "scrollView"
    .parameter "isVertical"

    .prologue
    .line 44
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x7f0a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    .line 46
    .local v0, isTablet:Z
    if-nez v0, :cond_12

    .line 47
    new-instance v1, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;Z)V

    .line 49
    :goto_11
    return-object v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method


# virtual methods
.method public addViewCallback(Landroid/view/View;)V
    .registers 5
    .parameter "newLinearLayoutChild"

    .prologue
    .line 73
    iget-boolean v1, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mSoftwareRendered:Z

    if-eqz v1, :cond_15

    .line 74
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;

    .line 76
    .local v0, holder:Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;
    iget-object v1, v0, Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;->labelView:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setDrawingCacheEnabled(Z)V

    .line 77
    iget-object v1, v0, Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;->labelView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->buildDrawingCache()V

    .line 79
    .end local v0           #holder:Lcom/android/systemui/recent/RecentsPanelView$ViewHolder;
    :cond_15
    return-void
.end method

.method public drawCallback(Landroid/graphics/Canvas;IIIIIIFFFF)V
    .registers 33
    .parameter "canvas"
    .parameter "left"
    .parameter "right"
    .parameter "top"
    .parameter "bottom"
    .parameter "scrollX"
    .parameter "scrollY"
    .parameter "topFadingEdgeStrength"
    .parameter "bottomFadingEdgeStrength"
    .parameter "leftFadingEdgeStrength"
    .parameter "rightFadingEdgeStrength"

    .prologue
    .line 86
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mSoftwareRendered:Z

    if-eqz v2, :cond_6

    .line 88
    :cond_6
    new-instance v18, Landroid/graphics/Paint;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Paint;-><init>()V

    .line 89
    .local v18, p:Landroid/graphics/Paint;
    new-instance v17, Landroid/graphics/Matrix;

    invoke-direct/range {v17 .. v17}, Landroid/graphics/Matrix;-><init>()V

    .line 92
    .local v17, matrix:Landroid/graphics/Matrix;
    new-instance v1, Landroid/graphics/LinearGradient;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/high16 v5, 0x3f80

    const/high16 v6, -0x3400

    const/4 v7, 0x0

    sget-object v8, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 95
    .local v1, fade:Landroid/graphics/Shader;
    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 98
    const/4 v13, 0x0

    .line 99
    .local v13, drawTop:Z
    const/4 v10, 0x0

    .line 100
    .local v10, drawBottom:Z
    const/4 v11, 0x0

    .line 101
    .local v11, drawLeft:Z
    const/4 v12, 0x0

    .line 103
    .local v12, drawRight:Z
    const/16 v20, 0x0

    .line 104
    .local v20, topFadeStrength:F
    const/4 v9, 0x0

    .line 105
    .local v9, bottomFadeStrength:F
    const/4 v15, 0x0

    .line 106
    .local v15, leftFadeStrength:F
    const/16 v19, 0x0

    .line 108
    .local v19, rightFadeStrength:F
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mFadingEdgeLength:I

    int-to-float v14, v2

    .line 109
    .local v14, fadeHeight:F
    float-to-int v0, v14

    move/from16 v16, v0

    .line 113
    .local v16, length:I
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mIsVertical:Z

    if-eqz v2, :cond_46

    add-int v2, p4, v16

    sub-int v3, p5, v16

    if-le v2, v3, :cond_46

    .line 114
    sub-int v2, p5, p4

    div-int/lit8 v16, v2, 0x2

    .line 118
    :cond_46
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mIsVertical:Z

    if-nez v2, :cond_56

    add-int v2, p2, v16

    sub-int v3, p3, v16

    if-le v2, v3, :cond_56

    .line 119
    sub-int v2, p3, p2

    div-int/lit8 v16, v2, 0x2

    .line 122
    :cond_56
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mIsVertical:Z

    if-eqz v2, :cond_88

    .line 123
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    move/from16 v0, p8

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v20

    .line 124
    mul-float v2, v20, v14

    const/high16 v3, 0x3f80

    cmpl-float v2, v2, v3

    if-lez v2, :cond_188

    const/4 v13, 0x1

    .line 125
    :goto_72
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    move/from16 v0, p9

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v9

    .line 126
    mul-float v2, v9, v14

    const/high16 v3, 0x3f80

    cmpl-float v2, v2, v3

    if-lez v2, :cond_18b

    const/4 v10, 0x1

    .line 129
    :cond_88
    :goto_88
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mIsVertical:Z

    if-nez v2, :cond_ba

    .line 130
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    move/from16 v0, p10

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v15

    .line 131
    mul-float v2, v15, v14

    const/high16 v3, 0x3f80

    cmpl-float v2, v2, v3

    if-lez v2, :cond_18e

    const/4 v11, 0x1

    .line 132
    :goto_a4
    const/4 v2, 0x0

    const/high16 v3, 0x3f80

    move/from16 v0, p11

    invoke-static {v3, v0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v19

    .line 133
    mul-float v2, v19, v14

    const/high16 v3, 0x3f80

    cmpl-float v2, v2, v3

    if-lez v2, :cond_191

    const/4 v12, 0x1

    .line 136
    :cond_ba
    :goto_ba
    if-eqz v13, :cond_e8

    .line 137
    const/high16 v2, 0x3f80

    mul-float v3, v14, v20

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 138
    move/from16 v0, p2

    int-to-float v2, v0

    move/from16 v0, p4

    int-to-float v3, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 139
    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 140
    move/from16 v0, p2

    int-to-float v3, v0

    move/from16 v0, p4

    int-to-float v4, v0

    move/from16 v0, p3

    int-to-float v5, v0

    add-int v2, p4, v16

    int-to-float v6, v2

    move-object/from16 v2, p1

    move-object/from16 v7, v18

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 143
    :cond_e8
    if-eqz v10, :cond_11d

    .line 144
    const/high16 v2, 0x3f80

    mul-float v3, v14, v9

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 145
    const/high16 v2, 0x4334

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 146
    move/from16 v0, p2

    int-to-float v2, v0

    move/from16 v0, p5

    int-to-float v3, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 147
    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 148
    move/from16 v0, p2

    int-to-float v3, v0

    sub-int v2, p5, v16

    int-to-float v4, v2

    move/from16 v0, p3

    int-to-float v5, v0

    move/from16 v0, p5

    int-to-float v6, v0

    move-object/from16 v2, p1

    move-object/from16 v7, v18

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 151
    :cond_11d
    if-eqz v11, :cond_152

    .line 152
    const/high16 v2, 0x3f80

    mul-float v3, v14, v15

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 153
    const/high16 v2, -0x3d4c

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 154
    move/from16 v0, p2

    int-to-float v2, v0

    move/from16 v0, p4

    int-to-float v3, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 155
    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 156
    move/from16 v0, p2

    int-to-float v3, v0

    move/from16 v0, p4

    int-to-float v4, v0

    add-int v2, p2, v16

    int-to-float v5, v2

    move/from16 v0, p5

    int-to-float v6, v0

    move-object/from16 v2, p1

    move-object/from16 v7, v18

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 159
    :cond_152
    if-eqz v12, :cond_187

    .line 160
    const/high16 v2, 0x3f80

    mul-float v3, v14, v19

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 161
    const/high16 v2, 0x42b4

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 162
    move/from16 v0, p3

    int-to-float v2, v0

    move/from16 v0, p4

    int-to-float v3, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 163
    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 164
    sub-int v2, p3, v16

    int-to-float v3, v2

    move/from16 v0, p4

    int-to-float v4, v0

    move/from16 v0, p3

    int-to-float v5, v0

    move/from16 v0, p5

    int-to-float v6, v0

    move-object/from16 v2, p1

    move-object/from16 v7, v18

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 167
    :cond_187
    return-void

    .line 124
    :cond_188
    const/4 v13, 0x0

    goto/16 :goto_72

    .line 126
    :cond_18b
    const/4 v10, 0x0

    goto/16 :goto_88

    .line 131
    :cond_18e
    const/4 v11, 0x0

    goto/16 :goto_a4

    .line 133
    :cond_191
    const/4 v12, 0x0

    goto/16 :goto_ba
.end method

.method public getHorizontalFadingEdgeLengthCallback()I
    .registers 2

    .prologue
    .line 174
    iget v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mFadingEdgeLength:I

    return v0
.end method

.method public getVerticalFadingEdgeLengthCallback()I
    .registers 2

    .prologue
    .line 170
    iget v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mFadingEdgeLength:I

    return v0
.end method

.method public onAttachedToWindowCallback(Lcom/android/systemui/recent/RecentsCallback;Landroid/widget/LinearLayout;Z)V
    .registers 6
    .parameter "callback"
    .parameter "layout"
    .parameter "hardwareAccelerated"

    .prologue
    const/4 v1, 0x0

    .line 64
    if-nez p3, :cond_15

    const/4 v0, 0x1

    :goto_4
    iput-boolean v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mSoftwareRendered:Z

    .line 65
    iget-boolean v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mSoftwareRendered:Z

    if-eqz v0, :cond_a

    .line 67
    :cond_a
    iget-object v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mScrollView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVerticalFadingEdgeEnabled(Z)V

    .line 68
    iget-object v0, p0, Lcom/android/systemui/recent/RecentsScrollViewPerformanceHelper;->mScrollView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setHorizontalFadingEdgeEnabled(Z)V

    .line 70
    return-void

    :cond_15
    move v0, v1

    .line 64
    goto :goto_4
.end method
