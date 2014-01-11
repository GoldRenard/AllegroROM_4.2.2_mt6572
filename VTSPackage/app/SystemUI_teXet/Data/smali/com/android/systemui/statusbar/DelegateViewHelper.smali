.class public Lcom/android/systemui/statusbar/DelegateViewHelper;
.super Ljava/lang/Object;
.source "DelegateViewHelper.java"


# instance fields
.field private mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

.field private mDelegateView:Landroid/view/View;

.field private mDownPoint:[F

.field mInitialTouch:Landroid/graphics/RectF;

.field private mPanelShowing:Z

.field private mSourceView:Landroid/view/View;

.field private mStarted:Z

.field private mSwapXY:Z

.field private mTempPoint:[I

.field private mTriggerThreshhold:F


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 4
    .parameter "sourceView"

    .prologue
    const/4 v1, 0x2

    .line 38
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-array v0, v1, [I

    iput-object v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    .line 30
    new-array v0, v1, [F

    iput-object v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mInitialTouch:Landroid/graphics/RectF;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSwapXY:Z

    .line 39
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/DelegateViewHelper;->setSourceView(Landroid/view/View;)V

    .line 40
    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 18
    .parameter "event"

    .prologue
    .line 51
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSourceView:Landroid/view/View;

    if-eqz v12, :cond_16

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDelegateView:Landroid/view/View;

    if-eqz v12, :cond_16

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v12}, Lcom/android/systemui/statusbar/BaseStatusBar;->shouldDisableNavbarGestures()Z

    move-result v12

    if-eqz v12, :cond_18

    .line 53
    :cond_16
    const/4 v12, 0x0

    .line 97
    :goto_17
    return v12

    .line 56
    :cond_18
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSourceView:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    invoke-virtual {v12, v13}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 57
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    const/4 v13, 0x0

    aget v12, v12, v13

    int-to-float v8, v12

    .line 58
    .local v8, sourceX:F
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    const/4 v13, 0x1

    aget v12, v12, v13

    int-to-float v9, v12

    .line 61
    .local v9, sourceY:F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v12

    packed-switch v12, :pswitch_data_122

    .line 70
    :goto_3a
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mStarted:Z

    if-nez v12, :cond_86

    .line 71
    const/4 v12, 0x0

    goto :goto_17

    .line 63
    :pswitch_42
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDelegateView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getVisibility()I

    move-result v12

    if-nez v12, :cond_84

    const/4 v12, 0x1

    :goto_4d
    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mPanelShowing:Z

    .line 64
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v13, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v14

    aput v14, v12, v13

    .line 65
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v13, 0x1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v14

    aput v14, v12, v13

    .line 66
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mInitialTouch:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v14, 0x0

    aget v13, v13, v14

    add-float/2addr v13, v8

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v15, 0x1

    aget v14, v14, v15

    add-float/2addr v14, v9

    invoke-virtual {v12, v13, v14}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v12

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mStarted:Z

    goto :goto_3a

    .line 63
    :cond_84
    const/4 v12, 0x0

    goto :goto_4d

    .line 74
    :cond_86
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mPanelShowing:Z

    if-nez v12, :cond_cf

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v12

    const/4 v13, 0x2

    if-ne v12, v13, :cond_cf

    .line 75
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v6

    .line 76
    .local v6, historySize:I
    const/4 v7, 0x0

    .local v7, k:I
    :goto_98
    add-int/lit8 v12, v6, 0x1

    if-ge v7, v12, :cond_cf

    .line 77
    if-ge v7, v6, :cond_109

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Landroid/view/MotionEvent;->getHistoricalX(I)F

    move-result v10

    .line 78
    .local v10, x:F
    :goto_a4
    if-ge v7, v6, :cond_10e

    move-object/from16 v0, p1

    invoke-virtual {v0, v7}, Landroid/view/MotionEvent;->getHistoricalY(I)F

    move-result v11

    .line 79
    .local v11, y:F
    :goto_ac
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSwapXY:Z

    if-eqz v12, :cond_113

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v13, 0x0

    aget v12, v12, v13

    sub-float v5, v12, v10

    .line 80
    .local v5, distance:F
    :goto_bb
    move-object/from16 v0, p0

    iget v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTriggerThreshhold:F

    cmpl-float v12, v5, v12

    if-lez v12, :cond_11d

    .line 81
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    invoke-virtual {v12}, Lcom/android/systemui/statusbar/BaseStatusBar;->showSearchPanel()V

    .line 82
    const/4 v12, 0x1

    move-object/from16 v0, p0

    iput-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mPanelShowing:Z

    .line 88
    .end local v5           #distance:F
    .end local v6           #historySize:I
    .end local v7           #k:I
    .end local v10           #x:F
    .end local v11           #y:F
    :cond_cf
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDelegateView:Landroid/view/View;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    invoke-virtual {v12, v13}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 89
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    const/4 v13, 0x0

    aget v12, v12, v13

    int-to-float v1, v12

    .line 90
    .local v1, delegateX:F
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTempPoint:[I

    const/4 v13, 0x1

    aget v12, v12, v13

    int-to-float v2, v12

    .line 92
    .local v2, delegateY:F
    sub-float v3, v8, v1

    .line 93
    .local v3, deltaX:F
    sub-float v4, v9, v2

    .line 94
    .local v4, deltaY:F
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 95
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDelegateView:Landroid/view/View;

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 96
    neg-float v12, v3

    neg-float v13, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v12, v13}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 97
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mPanelShowing:Z

    goto/16 :goto_17

    .line 77
    .end local v1           #delegateX:F
    .end local v2           #delegateY:F
    .end local v3           #deltaX:F
    .end local v4           #deltaY:F
    .restart local v6       #historySize:I
    .restart local v7       #k:I
    :cond_109
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v10

    goto :goto_a4

    .line 78
    .restart local v10       #x:F
    :cond_10e
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v11

    goto :goto_ac

    .line 79
    .restart local v11       #y:F
    :cond_113
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDownPoint:[F

    const/4 v13, 0x1

    aget v12, v12, v13

    sub-float v5, v12, v11

    goto :goto_bb

    .line 76
    .restart local v5       #distance:F
    :cond_11d
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_98

    .line 61
    nop

    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method

.method public setBar(Lcom/android/systemui/statusbar/BaseStatusBar;)V
    .registers 2
    .parameter "phoneStatusBar"

    .prologue
    .line 47
    iput-object p1, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mBar:Lcom/android/systemui/statusbar/BaseStatusBar;

    .line 48
    return-void
.end method

.method public setDelegateView(Landroid/view/View;)V
    .registers 2
    .parameter "view"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mDelegateView:Landroid/view/View;

    .line 44
    return-void
.end method

.method public varargs setInitialTouchRegion([Landroid/view/View;)V
    .registers 13
    .parameter "views"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 116
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 117
    .local v0, bounds:Landroid/graphics/RectF;
    const/4 v4, 0x2

    new-array v2, v4, [I

    .line 118
    .local v2, p:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_b
    array-length v4, p1

    if-ge v1, v4, :cond_4e

    .line 119
    aget-object v3, p1, v1

    .line 120
    .local v3, view:Landroid/view/View;
    if-nez v3, :cond_15

    .line 118
    :goto_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 121
    :cond_15
    invoke-virtual {v3, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 122
    if-nez v1, :cond_34

    .line 123
    aget v4, v2, v9

    int-to-float v4, v4

    aget v5, v2, v10

    int-to-float v5, v5

    aget v6, v2, v9

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    aget v7, v2, v10

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    goto :goto_12

    .line 125
    :cond_34
    aget v4, v2, v9

    int-to-float v4, v4

    aget v5, v2, v10

    int-to-float v5, v5

    aget v6, v2, v9

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v6, v7

    int-to-float v6, v6

    aget v7, v2, v10

    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v7, v8

    int-to-float v7, v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/graphics/RectF;->union(FFFF)V

    goto :goto_12

    .line 128
    .end local v3           #view:Landroid/view/View;
    :cond_4e
    iget-object v4, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mInitialTouch:Landroid/graphics/RectF;

    invoke-virtual {v4, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 129
    return-void
.end method

.method public setSourceView(Landroid/view/View;)V
    .registers 4
    .parameter "view"

    .prologue
    .line 101
    iput-object p1, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSourceView:Landroid/view/View;

    .line 102
    iget-object v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSourceView:Landroid/view/View;

    if-eqz v0, :cond_19

    .line 103
    iget-object v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSourceView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0d0031

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mTriggerThreshhold:F

    .line 106
    :cond_19
    return-void
.end method

.method public setSwapXY(Z)V
    .registers 2
    .parameter "swap"

    .prologue
    .line 136
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/DelegateViewHelper;->mSwapXY:Z

    .line 137
    return-void
.end method
