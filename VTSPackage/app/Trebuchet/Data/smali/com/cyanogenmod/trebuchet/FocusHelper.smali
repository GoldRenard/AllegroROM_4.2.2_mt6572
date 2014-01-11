.class public Lcom/cyanogenmod/trebuchet/FocusHelper;
.super Ljava/lang/Object;
.source "FocusHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static findIndexOfIcon(Ljava/util/ArrayList;II)Landroid/view/View;
    .locals 4
    .parameter
    .parameter "i"
    .parameter "delta"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;II)",
            "Landroid/view/View;"
        }
    .end annotation

    .prologue
    .line 601
    .local p0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 602
    .local v0, count:I
    add-int v1, p1, p2

    .line 603
    .local v1, newI:I
    :goto_0
    if-ltz v1, :cond_2

    if-ge v1, v0, :cond_2

    .line 604
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 605
    .local v2, newV:Landroid/view/View;
    instance-of v3, v2, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-nez v3, :cond_0

    instance-of v3, v2, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v3, :cond_1

    .line 610
    .end local v2           #newV:Landroid/view/View;
    :cond_0
    :goto_1
    return-object v2

    .line 608
    .restart local v2       #newV:Landroid/view/View;
    :cond_1
    add-int/2addr v1, p2

    .line 609
    goto :goto_0

    .line 610
    .end local v2           #newV:Landroid/view/View;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;
    .locals 2
    .parameter "v"

    .prologue
    .line 76
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 77
    .local v0, p:Landroid/view/ViewParent;
    :goto_0
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/widget/TabHost;

    if-nez v1, :cond_0

    .line 78
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 80
    :cond_0
    check-cast v0, Landroid/widget/TabHost;

    .end local v0           #p:Landroid/view/ViewParent;
    return-object v0
.end method

.method private static getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;
    .locals 2
    .parameter "container"
    .parameter "index"

    .prologue
    .line 127
    check-cast p0, Lcom/cyanogenmod/trebuchet/PagedView;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 128
    .local v0, page:Landroid/view/ViewGroup;
    instance-of v1, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    if-eqz v1, :cond_0

    .line 130
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #page:Landroid/view/ViewGroup;
    check-cast v0, Landroid/view/ViewGroup;

    .line 132
    .restart local v0       #page:Landroid/view/ViewGroup;
    :cond_0
    return-object v0
.end method

.method private static getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .locals 2
    .parameter "container"
    .parameter "i"

    .prologue
    .line 564
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 565
    .local v0, parent:Landroid/view/ViewGroup;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    return-object v1
.end method

.method private static getCellLayoutChildrenSortedSpatially(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;
    .locals 5
    .parameter "layout"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/cyanogenmod/trebuchet/CellLayout;",
            "Landroid/view/ViewGroup;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 575
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountX()I

    move-result v0

    .line 576
    .local v0, cellCountX:I
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 577
    .local v1, count:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 578
    .local v3, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 579
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 578
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 581
    :cond_0
    new-instance v4, Lcom/cyanogenmod/trebuchet/FocusHelper$1;

    invoke-direct {v4, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper$1;-><init>(I)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 591
    return-object v3
.end method

.method private static getClosestIconOnLine(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;
    .locals 21
    .parameter "layout"
    .parameter "parent"
    .parameter "v"
    .parameter "lineDelta"

    .prologue
    .line 630
    invoke-static/range {p0 .. p1}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v14

    .line 631
    .local v14, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 632
    .local v7, lp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/CellLayout;->getCountY()I

    move-result v2

    .line 633
    .local v2, cellCountY:I
    iget v10, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    .line 634
    .local v10, row:I
    add-int v8, v10, p3

    .line 635
    .local v8, newRow:I
    if-ltz v8, :cond_8

    if-ge v8, v2, :cond_8

    .line 636
    const v3, 0x7f7fffff

    .line 637
    .local v3, closestDistance:F
    const/4 v4, -0x1

    .line 638
    .local v4, closestIndex:I
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 639
    .local v6, index:I
    if-gez p3, :cond_2

    const/4 v5, -0x1

    .line 640
    .local v5, endIndex:I
    :goto_0
    if-eq v6, v5, :cond_7

    .line 641
    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 642
    .local v9, newV:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;

    .line 643
    .local v13, tmpLp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    if-gez p3, :cond_4

    iget v15, v13, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    if-ge v15, v10, :cond_3

    const/4 v11, 0x1

    .line 644
    .local v11, satisfiesRow:Z
    :goto_1
    if-eqz v11, :cond_1

    instance-of v15, v9, Lcom/cyanogenmod/trebuchet/BubbleTextView;

    if-nez v15, :cond_0

    instance-of v15, v9, Lcom/cyanogenmod/trebuchet/FolderIcon;

    if-eqz v15, :cond_1

    .line 646
    :cond_0
    iget v15, v13, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellX:I

    move/from16 v16, v0

    sub-int v15, v15, v16

    int-to-double v15, v15

    const-wide/high16 v17, 0x4000

    invoke-static/range {v15 .. v18}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v15

    iget v0, v13, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    move/from16 v17, v0

    iget v0, v7, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    move/from16 v18, v0

    sub-int v17, v17, v18

    move/from16 v0, v17

    int-to-double v0, v0

    move-wide/from16 v17, v0

    const-wide/high16 v19, 0x4000

    invoke-static/range {v17 .. v20}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v17

    add-double v15, v15, v17

    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v15

    double-to-float v12, v15

    .line 648
    .local v12, tmpDistance:F
    cmpg-float v15, v12, v3

    if-gez v15, :cond_1

    .line 649
    move v4, v6

    .line 650
    move v3, v12

    .line 653
    .end local v12           #tmpDistance:F
    :cond_1
    if-gt v6, v5, :cond_6

    .line 654
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 639
    .end local v5           #endIndex:I
    .end local v9           #newV:Landroid/view/View;
    .end local v11           #satisfiesRow:Z
    .end local v13           #tmpLp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_2
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v5

    goto :goto_0

    .line 643
    .restart local v5       #endIndex:I
    .restart local v9       #newV:Landroid/view/View;
    .restart local v13       #tmpLp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    :cond_4
    iget v15, v13, Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;->cellY:I

    if-le v15, v10, :cond_5

    const/4 v11, 0x1

    goto :goto_1

    :cond_5
    const/4 v11, 0x0

    goto :goto_1

    .line 656
    .restart local v11       #satisfiesRow:Z
    :cond_6
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 659
    .end local v9           #newV:Landroid/view/View;
    .end local v11           #satisfiesRow:Z
    .end local v13           #tmpLp:Lcom/cyanogenmod/trebuchet/CellLayout$LayoutParams;
    :cond_7
    const/4 v15, -0x1

    if-le v4, v15, :cond_8

    .line 660
    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/view/View;

    .line 663
    .end local v3           #closestDistance:F
    .end local v4           #closestIndex:I
    .end local v5           #endIndex:I
    .end local v6           #index:I
    :goto_2
    return-object v15

    :cond_8
    const/4 v15, 0x0

    goto :goto_2
.end method

.method private static getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;
    .locals 2
    .parameter "layout"
    .parameter "parent"
    .parameter "i"
    .parameter "delta"

    .prologue
    .line 614
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    .line 615
    .local v0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-static {v0, p2, p3}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findIndexOfIcon(Ljava/util/ArrayList;II)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method private static getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;
    .locals 2
    .parameter "layout"
    .parameter "parent"
    .parameter "v"
    .parameter "delta"

    .prologue
    .line 619
    invoke-static {p0, p1}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    .line 620
    .local v0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v1, p3}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findIndexOfIcon(Ljava/util/ArrayList;II)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method static handleAppsCustomizeKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 24
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 289
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v22

    move-object/from16 v0, v22

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/PagedViewCellLayoutChildren;

    move/from16 v22, v0

    if-eqz v22, :cond_0

    .line 290
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    .line 291
    .local v10, itemContainer:Landroid/view/ViewGroup;
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v16

    check-cast v16, Landroid/view/ViewGroup;

    .local v16, parentLayout:Landroid/view/ViewGroup;
    move-object/from16 v22, v16

    .line 292
    check-cast v22, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountX()I

    move-result v6

    .local v6, countX:I
    move-object/from16 v22, v16

    .line 293
    check-cast v22, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/cyanogenmod/trebuchet/PagedViewCellLayout;->getCellCountY()I

    move-result v7

    .line 302
    .local v7, countY:I
    :goto_0
    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/PagedView;

    .line 303
    .local v5, container:Lcom/cyanogenmod/trebuchet/PagedView;
    invoke-static {v5}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v17

    .line 304
    .local v17, tabHost:Landroid/widget/TabHost;
    invoke-virtual/range {v17 .. v17}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v18

    .line 305
    .local v18, tabs:Landroid/widget/TabWidget;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v9

    .line 306
    .local v9, iconIndex:I
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v11

    .line 307
    .local v11, itemCount:I
    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v22

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->indexToPage(I)I

    move-result v15

    .line 308
    .local v15, pageIndex:I
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v14

    .line 310
    .local v14, pageCount:I
    rem-int v20, v9, v6

    .line 311
    .local v20, x:I
    div-int v21, v9, v6

    .line 313
    .local v21, y:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    .line 314
    .local v2, action:I
    const/16 v22, 0x1

    move/from16 v0, v22

    if-eq v2, v0, :cond_1

    const/4 v8, 0x1

    .line 319
    .local v8, handleKeyEvent:Z
    :goto_1
    const/16 v19, 0x0

    .line 320
    .local v19, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 438
    :goto_2
    return v19

    .line 295
    .end local v2           #action:I
    .end local v5           #container:Lcom/cyanogenmod/trebuchet/PagedView;
    .end local v6           #countX:I
    .end local v7           #countY:I
    .end local v8           #handleKeyEvent:Z
    .end local v9           #iconIndex:I
    .end local v10           #itemContainer:Landroid/view/ViewGroup;
    .end local v11           #itemCount:I
    .end local v14           #pageCount:I
    .end local v15           #pageIndex:I
    .end local v16           #parentLayout:Landroid/view/ViewGroup;
    .end local v17           #tabHost:Landroid/widget/TabHost;
    .end local v18           #tabs:Landroid/widget/TabWidget;
    .end local v19           #wasHandled:Z
    .end local v20           #x:I
    .end local v21           #y:I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v16

    check-cast v16, Landroid/view/ViewGroup;

    .restart local v16       #parentLayout:Landroid/view/ViewGroup;
    move-object/from16 v10, v16

    .restart local v10       #itemContainer:Landroid/view/ViewGroup;
    move-object/from16 v22, v16

    .line 296
    check-cast v22, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getCellCountX()I

    move-result v6

    .restart local v6       #countX:I
    move-object/from16 v22, v16

    .line 297
    check-cast v22, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getCellCountY()I

    move-result v7

    .restart local v7       #countY:I
    goto :goto_0

    .line 314
    .restart local v2       #action:I
    .restart local v5       #container:Lcom/cyanogenmod/trebuchet/PagedView;
    .restart local v9       #iconIndex:I
    .restart local v11       #itemCount:I
    .restart local v14       #pageCount:I
    .restart local v15       #pageIndex:I
    .restart local v17       #tabHost:Landroid/widget/TabHost;
    .restart local v18       #tabs:Landroid/widget/TabWidget;
    .restart local v20       #x:I
    .restart local v21       #y:I
    :cond_1
    const/4 v8, 0x0

    goto :goto_1

    .line 322
    .restart local v8       #handleKeyEvent:Z
    .restart local v19       #wasHandled:Z
    :sswitch_0
    if-eqz v8, :cond_2

    .line 324
    if-lez v9, :cond_3

    .line 325
    add-int/lit8 v22, v9, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 337
    :cond_2
    :goto_3
    const/16 v19, 0x1

    .line 338
    goto :goto_2

    .line 327
    :cond_3
    if-lez v15, :cond_2

    .line 328
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 329
    .local v12, newParent:Landroid/view/ViewGroup;
    if-eqz v12, :cond_2

    .line 330
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 331
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v22

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 332
    .local v3, child:Landroid/view/View;
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 340
    .end local v3           #child:Landroid/view/View;
    .end local v12           #newParent:Landroid/view/ViewGroup;
    :sswitch_1
    if-eqz v8, :cond_4

    .line 342
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    if-ge v9, v0, :cond_5

    .line 343
    add-int/lit8 v22, v9, 0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 355
    :cond_4
    :goto_4
    const/16 v19, 0x1

    .line 356
    goto :goto_2

    .line 345
    :cond_5
    add-int/lit8 v22, v14, -0x1

    move/from16 v0, v22

    if-ge v15, v0, :cond_4

    .line 346
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 347
    .restart local v12       #newParent:Landroid/view/ViewGroup;
    if-eqz v12, :cond_4

    .line 348
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 349
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 350
    .restart local v3       #child:Landroid/view/View;
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto :goto_4

    .line 358
    .end local v3           #child:Landroid/view/View;
    .end local v12           #newParent:Landroid/view/ViewGroup;
    :sswitch_2
    if-eqz v8, :cond_6

    .line 360
    if-lez v21, :cond_7

    .line 361
    add-int/lit8 v22, v21, -0x1

    mul-int v22, v22, v6

    add-int v13, v22, v20

    .line 362
    .local v13, newiconIndex:I
    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 367
    .end local v13           #newiconIndex:I
    :cond_6
    :goto_5
    const/16 v19, 0x1

    .line 368
    goto/16 :goto_2

    .line 364
    :cond_7
    invoke-virtual/range {v18 .. v18}, Landroid/widget/TabWidget;->requestFocus()Z

    goto :goto_5

    .line 370
    :sswitch_3
    if-eqz v8, :cond_8

    .line 372
    add-int/lit8 v22, v7, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_8

    .line 373
    add-int/lit8 v22, v11, -0x1

    add-int/lit8 v23, v21, 0x1

    mul-int v23, v23, v6

    add-int v23, v23, v20

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 374
    .restart local v13       #newiconIndex:I
    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 377
    .end local v13           #newiconIndex:I
    :cond_8
    const/16 v19, 0x1

    .line 378
    goto/16 :goto_2

    .line 381
    :sswitch_4
    if-eqz v8, :cond_9

    move-object v4, v5

    .line 383
    check-cast v4, Landroid/view/View$OnClickListener;

    .line 384
    .local v4, clickListener:Landroid/view/View$OnClickListener;
    move-object/from16 v0, p0

    invoke-interface {v4, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 386
    .end local v4           #clickListener:Landroid/view/View$OnClickListener;
    :cond_9
    const/16 v19, 0x1

    .line 387
    goto/16 :goto_2

    .line 389
    :sswitch_5
    if-eqz v8, :cond_a

    .line 392
    if-lez v15, :cond_b

    .line 393
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 394
    .restart local v12       #newParent:Landroid/view/ViewGroup;
    if-eqz v12, :cond_a

    .line 395
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 396
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 397
    .restart local v3       #child:Landroid/view/View;
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 403
    .end local v3           #child:Landroid/view/View;
    .end local v12           #newParent:Landroid/view/ViewGroup;
    :cond_a
    :goto_6
    const/16 v19, 0x1

    .line 404
    goto/16 :goto_2

    .line 400
    :cond_b
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    goto :goto_6

    .line 406
    :sswitch_6
    if-eqz v8, :cond_c

    .line 409
    add-int/lit8 v22, v14, -0x1

    move/from16 v0, v22

    if-ge v15, v0, :cond_d

    .line 410
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 411
    .restart local v12       #newParent:Landroid/view/ViewGroup;
    if-eqz v12, :cond_c

    .line 412
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->snapToPage(I)V

    .line 413
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 414
    .restart local v3       #child:Landroid/view/View;
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 420
    .end local v3           #child:Landroid/view/View;
    .end local v12           #newParent:Landroid/view/ViewGroup;
    :cond_c
    :goto_7
    const/16 v19, 0x1

    .line 421
    goto/16 :goto_2

    .line 417
    :cond_d
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    goto :goto_7

    .line 423
    :sswitch_7
    if-eqz v8, :cond_e

    .line 425
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 427
    :cond_e
    const/16 v19, 0x1

    .line 428
    goto/16 :goto_2

    .line 430
    :sswitch_8
    if-eqz v8, :cond_f

    .line 432
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 434
    :cond_f
    const/16 v19, 0x1

    .line 435
    goto/16 :goto_2

    .line 320
    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x17 -> :sswitch_4
        0x42 -> :sswitch_4
        0x5c -> :sswitch_5
        0x5d -> :sswitch_6
        0x7a -> :sswitch_7
        0x7b -> :sswitch_8
    .end sparse-switch
.end method

.method static handleAppsCustomizeTabKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 8
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    .line 87
    invoke-static {p0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v5

    .line 88
    .local v5, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v5}, Landroid/widget/TabHost;->getTabContentView()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 89
    .local v1, contents:Landroid/view/ViewGroup;
    const v7, 0x7f07000b

    invoke-virtual {v5, v7}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 90
    .local v4, shop:Landroid/view/View;
    const v7, 0x7f07000a

    invoke-virtual {v5, v7}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 92
    .local v3, overflowMenu:Landroid/view/View;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 93
    .local v0, action:I
    if-eq v0, v2, :cond_1

    .line 94
    .local v2, handleKeyEvent:Z
    :goto_0
    const/4 v6, 0x0

    .line 95
    .local v6, wasHandled:Z
    packed-switch p1, :pswitch_data_0

    .line 120
    :cond_0
    :goto_1
    :pswitch_0
    return v6

    .line 93
    .end local v2           #handleKeyEvent:Z
    .end local v6           #wasHandled:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 97
    .restart local v2       #handleKeyEvent:Z
    .restart local v6       #wasHandled:Z
    :pswitch_1
    if-eqz v2, :cond_3

    .line 99
    if-ne p0, v4, :cond_2

    if-eq p0, v3, :cond_3

    .line 100
    :cond_2
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_4

    .line 101
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 107
    :cond_3
    :goto_2
    const/4 v6, 0x1

    .line 108
    goto :goto_1

    .line 102
    :cond_4
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-nez v7, :cond_3

    .line 103
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 110
    :pswitch_2
    if-eqz v2, :cond_0

    .line 112
    if-eq p0, v4, :cond_5

    if-ne p0, v3, :cond_0

    .line 113
    :cond_5
    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 114
    const/4 v6, 0x1

    goto :goto_1

    .line 95
    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static handleFolderKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 10
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x1

    .line 825
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 826
    .local v5, parent:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 827
    .local v3, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/cyanogenmod/trebuchet/Folder;

    .line 828
    .local v1, folder:Lcom/cyanogenmod/trebuchet/Folder;
    iget-object v6, v1, Lcom/cyanogenmod/trebuchet/Folder;->mFolderName:Lcom/cyanogenmod/trebuchet/FolderEditText;

    .line 830
    .local v6, title:Landroid/view/View;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 831
    .local v0, action:I
    if-eq v0, v8, :cond_0

    move v2, v8

    .line 832
    .local v2, handleKeyEvent:Z
    :goto_0
    const/4 v7, 0x0

    .line 833
    .local v7, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 901
    :goto_1
    return v7

    .line 831
    .end local v2           #handleKeyEvent:Z
    .end local v7           #wasHandled:Z
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 835
    .restart local v2       #handleKeyEvent:Z
    .restart local v7       #wasHandled:Z
    :sswitch_0
    if-eqz v2, :cond_1

    .line 837
    invoke-static {v3, v5, p0, v9}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 838
    .local v4, newIcon:Landroid/view/View;
    if-eqz v4, :cond_1

    .line 839
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 842
    .end local v4           #newIcon:Landroid/view/View;
    :cond_1
    const/4 v7, 0x1

    .line 843
    goto :goto_1

    .line 845
    :sswitch_1
    if-eqz v2, :cond_2

    .line 847
    invoke-static {v3, v5, p0, v8}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 848
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_3

    .line 849
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 854
    .end local v4           #newIcon:Landroid/view/View;
    :cond_2
    :goto_2
    const/4 v7, 0x1

    .line 855
    goto :goto_1

    .line 851
    .restart local v4       #newIcon:Landroid/view/View;
    :cond_3
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 857
    .end local v4           #newIcon:Landroid/view/View;
    :sswitch_2
    if-eqz v2, :cond_4

    .line 859
    invoke-static {v3, v5, p0, v9}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getClosestIconOnLine(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 860
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_4

    .line 861
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 864
    .end local v4           #newIcon:Landroid/view/View;
    :cond_4
    const/4 v7, 0x1

    .line 865
    goto :goto_1

    .line 867
    :sswitch_3
    if-eqz v2, :cond_5

    .line 869
    invoke-static {v3, v5, p0, v8}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getClosestIconOnLine(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 870
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_6

    .line 871
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 876
    .end local v4           #newIcon:Landroid/view/View;
    :cond_5
    :goto_3
    const/4 v7, 0x1

    .line 877
    goto :goto_1

    .line 873
    .restart local v4       #newIcon:Landroid/view/View;
    :cond_6
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 879
    .end local v4           #newIcon:Landroid/view/View;
    :sswitch_4
    if-eqz v2, :cond_7

    .line 881
    invoke-static {v3, v5, v9, v8}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    .line 882
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_7

    .line 883
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 886
    .end local v4           #newIcon:Landroid/view/View;
    :cond_7
    const/4 v7, 0x1

    .line 887
    goto :goto_1

    .line 889
    :sswitch_5
    if-eqz v2, :cond_8

    .line 891
    invoke-virtual {v5}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v8

    invoke-static {v3, v5, v8, v9}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    .line 893
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_8

    .line 894
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 897
    .end local v4           #newIcon:Landroid/view/View;
    :cond_8
    const/4 v7, 0x1

    .line 898
    goto :goto_1

    .line 833
    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x7a -> :sswitch_4
        0x7b -> :sswitch_5
    .end sparse-switch
.end method

.method static handleHotseatButtonKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;I)Z
    .locals 14
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"
    .parameter "orientation"

    .prologue
    .line 499
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    .line 500
    .local v9, parent:Landroid/view/ViewGroup;
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 501
    .local v5, launcher:Landroid/view/ViewGroup;
    const v12, 0x7f07002c

    invoke-virtual {v5, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v11

    check-cast v11, Lcom/cyanogenmod/trebuchet/Workspace;

    .line 502
    .local v11, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-virtual {v9, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 503
    .local v2, buttonIndex:I
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 504
    .local v1, buttonCount:I
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/Workspace;->getCurrentPage()I

    move-result v8

    .line 510
    .local v8, pageIndex:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 511
    .local v0, action:I
    const/4 v12, 0x1

    if-eq v0, v12, :cond_0

    const/4 v4, 0x1

    .line 512
    .local v4, handleKeyEvent:Z
    :goto_0
    const/4 v10, 0x0

    .line 513
    .local v10, wasHandled:Z
    packed-switch p1, :pswitch_data_0

    .line 556
    :goto_1
    return v10

    .line 511
    .end local v4           #handleKeyEvent:Z
    .end local v10           #wasHandled:Z
    :cond_0
    const/4 v4, 0x0

    goto :goto_0

    .line 515
    .restart local v4       #handleKeyEvent:Z
    .restart local v10       #wasHandled:Z
    :pswitch_0
    if-eqz v4, :cond_1

    .line 517
    if-lez v2, :cond_2

    .line 518
    add-int/lit8 v12, v2, -0x1

    invoke-virtual {v9, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->requestFocus()Z

    .line 523
    :cond_1
    :goto_2
    const/4 v10, 0x1

    .line 524
    goto :goto_1

    .line 520
    :cond_2
    add-int/lit8 v12, v8, -0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_2

    .line 526
    :pswitch_1
    if-eqz v4, :cond_3

    .line 528
    add-int/lit8 v12, v1, -0x1

    if-ge v2, v12, :cond_4

    .line 529
    add-int/lit8 v12, v2, 0x1

    invoke-virtual {v9, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    invoke-virtual {v12}, Landroid/view/View;->requestFocus()Z

    .line 534
    :cond_3
    :goto_3
    const/4 v10, 0x1

    .line 535
    goto :goto_1

    .line 531
    :cond_4
    add-int/lit8 v12, v8, 0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_3

    .line 537
    :pswitch_2
    if-eqz v4, :cond_5

    .line 539
    invoke-virtual {v11, v8}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 540
    .local v6, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v6}, Lcom/cyanogenmod/trebuchet/CellLayout;->getShortcutsAndWidgets()Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v3

    .line 541
    .local v3, children:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v6, v3, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v7

    .line 542
    .local v7, newIcon:Landroid/view/View;
    if-eqz v7, :cond_6

    .line 543
    invoke-virtual {v7}, Landroid/view/View;->requestFocus()Z

    .line 548
    .end local v3           #children:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .end local v6           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #newIcon:Landroid/view/View;
    :cond_5
    :goto_4
    const/4 v10, 0x1

    .line 549
    goto :goto_1

    .line 545
    .restart local v3       #children:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .restart local v6       #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .restart local v7       #newIcon:Landroid/view/View;
    :cond_6
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/Workspace;->requestFocus()Z

    goto :goto_4

    .line 552
    .end local v3           #children:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    .end local v6           #layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    .end local v7           #newIcon:Landroid/view/View;
    :pswitch_3
    const/4 v10, 0x1

    .line 553
    goto :goto_1

    .line 513
    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static handleIconKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 14
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 670
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    check-cast v8, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    .line 671
    .local v8, parent:Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Lcom/cyanogenmod/trebuchet/CellLayout;

    .line 672
    .local v4, layout:Lcom/cyanogenmod/trebuchet/CellLayout;
    invoke-virtual {v4}, Lcom/cyanogenmod/trebuchet/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v11

    check-cast v11, Lcom/cyanogenmod/trebuchet/Workspace;

    .line 673
    .local v11, workspace:Lcom/cyanogenmod/trebuchet/Workspace;
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 674
    .local v3, launcher:Landroid/view/ViewGroup;
    const v12, 0x7f070031

    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/view/ViewGroup;

    .line 675
    .local v9, tabs:Landroid/view/ViewGroup;
    const v12, 0x7f070030

    invoke-virtual {v3, v12}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 676
    .local v2, hotseat:Landroid/view/ViewGroup;
    invoke-virtual {v11, v4}, Lcom/cyanogenmod/trebuchet/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v7

    .line 677
    .local v7, pageIndex:I
    invoke-virtual {v11}, Lcom/cyanogenmod/trebuchet/Workspace;->getChildCount()I

    move-result v6

    .line 679
    .local v6, pageCount:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 680
    .local v0, action:I
    const/4 v12, 0x1

    if-eq v0, v12, :cond_1

    const/4 v1, 0x1

    .line 681
    .local v1, handleKeyEvent:Z
    :goto_0
    const/4 v10, 0x0

    .line 682
    .local v10, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 818
    :cond_0
    :goto_1
    return v10

    .line 680
    .end local v1           #handleKeyEvent:Z
    .end local v10           #wasHandled:Z
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 684
    .restart local v1       #handleKeyEvent:Z
    .restart local v10       #wasHandled:Z
    :sswitch_0
    if-eqz v1, :cond_2

    .line 686
    const/4 v12, -0x1

    invoke-static {v4, v8, p0, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v5

    .line 687
    .local v5, newIcon:Landroid/view/View;
    if-eqz v5, :cond_3

    .line 688
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 703
    .end local v5           #newIcon:Landroid/view/View;
    :cond_2
    :goto_2
    const/4 v10, 0x1

    .line 704
    goto :goto_1

    .line 690
    .restart local v5       #newIcon:Landroid/view/View;
    :cond_3
    if-lez v7, :cond_2

    .line 691
    add-int/lit8 v12, v7, -0x1

    invoke-static {v11, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v8

    .line 692
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v12

    const/4 v13, -0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 694
    if-eqz v5, :cond_4

    .line 695
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 698
    :cond_4
    add-int/lit8 v12, v7, -0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_2

    .line 706
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_1
    if-eqz v1, :cond_5

    .line 708
    const/4 v12, 0x1

    invoke-static {v4, v8, p0, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v5

    .line 709
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_6

    .line 710
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 724
    .end local v5           #newIcon:Landroid/view/View;
    :cond_5
    :goto_3
    const/4 v10, 0x1

    .line 725
    goto :goto_1

    .line 712
    .restart local v5       #newIcon:Landroid/view/View;
    :cond_6
    add-int/lit8 v12, v6, -0x1

    if-ge v7, v12, :cond_5

    .line 713
    add-int/lit8 v12, v7, 0x1

    invoke-static {v11, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v8

    .line 714
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 715
    if-eqz v5, :cond_7

    .line 716
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 719
    :cond_7
    add-int/lit8 v12, v7, 0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_3

    .line 727
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_2
    if-eqz v1, :cond_0

    .line 729
    const/4 v12, -0x1

    invoke-static {v4, v8, p0, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getClosestIconOnLine(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v5

    .line 730
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_8

    .line 731
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 732
    const/4 v10, 0x1

    goto :goto_1

    .line 734
    :cond_8
    invoke-virtual {v9}, Landroid/view/ViewGroup;->requestFocus()Z

    goto :goto_1

    .line 739
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_3
    if-eqz v1, :cond_0

    .line 741
    const/4 v12, 0x1

    invoke-static {v4, v8, p0, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getClosestIconOnLine(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v5

    .line 742
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_9

    .line 743
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 744
    const/4 v10, 0x1

    goto :goto_1

    .line 745
    :cond_9
    if-eqz v2, :cond_0

    .line 746
    invoke-virtual {v2}, Landroid/view/ViewGroup;->requestFocus()Z

    goto :goto_1

    .line 751
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_4
    if-eqz v1, :cond_a

    .line 754
    if-lez v7, :cond_c

    .line 755
    add-int/lit8 v12, v7, -0x1

    invoke-static {v11, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v8

    .line 756
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 757
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_b

    .line 758
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 770
    .end local v5           #newIcon:Landroid/view/View;
    :cond_a
    :goto_4
    const/4 v10, 0x1

    .line 771
    goto/16 :goto_1

    .line 761
    .restart local v5       #newIcon:Landroid/view/View;
    :cond_b
    add-int/lit8 v12, v7, -0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_4

    .line 764
    .end local v5           #newIcon:Landroid/view/View;
    :cond_c
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 765
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_a

    .line 766
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_4

    .line 773
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_5
    if-eqz v1, :cond_d

    .line 776
    add-int/lit8 v12, v6, -0x1

    if-ge v7, v12, :cond_f

    .line 777
    add-int/lit8 v12, v7, 0x1

    invoke-static {v11, v12}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;

    move-result-object v8

    .line 778
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 779
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_e

    .line 780
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 793
    .end local v5           #newIcon:Landroid/view/View;
    :cond_d
    :goto_5
    const/4 v10, 0x1

    .line 794
    goto/16 :goto_1

    .line 783
    .restart local v5       #newIcon:Landroid/view/View;
    :cond_e
    add-int/lit8 v12, v7, 0x1

    invoke-virtual {v11, v12}, Lcom/cyanogenmod/trebuchet/Workspace;->snapToPage(I)V

    goto :goto_5

    .line 786
    .end local v5           #newIcon:Landroid/view/View;
    :cond_f
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v12

    const/4 v13, -0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 788
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_d

    .line 789
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_5

    .line 796
    .end local v5           #newIcon:Landroid/view/View;
    :sswitch_6
    if-eqz v1, :cond_10

    .line 798
    const/4 v12, -0x1

    const/4 v13, 0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 799
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_10

    .line 800
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 803
    .end local v5           #newIcon:Landroid/view/View;
    :cond_10
    const/4 v10, 0x1

    .line 804
    goto/16 :goto_1

    .line 806
    :sswitch_7
    if-eqz v1, :cond_11

    .line 808
    invoke-virtual {v8}, Lcom/cyanogenmod/trebuchet/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v12

    const/4 v13, -0x1

    invoke-static {v4, v8, v12, v13}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getIconInDirection(Lcom/cyanogenmod/trebuchet/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v5

    .line 810
    .restart local v5       #newIcon:Landroid/view/View;
    if-eqz v5, :cond_11

    .line 811
    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 814
    .end local v5           #newIcon:Landroid/view/View;
    :cond_11
    const/4 v10, 0x1

    .line 815
    goto/16 :goto_1

    .line 682
    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x5c -> :sswitch_4
        0x5d -> :sswitch_5
        0x7a -> :sswitch_6
        0x7b -> :sswitch_7
    .end sparse-switch
.end method

.method static handlePagedViewGridLayoutWidgetKeyEvent(Lcom/cyanogenmod/trebuchet/PagedViewWidget;ILandroid/view/KeyEvent;)Z
    .locals 23
    .parameter "w"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/PagedViewWidget;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    check-cast v13, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;

    .line 142
    .local v13, parent:Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;
    invoke-virtual {v13}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Lcom/cyanogenmod/trebuchet/PagedView;

    .line 143
    .local v7, container:Lcom/cyanogenmod/trebuchet/PagedView;
    invoke-static {v7}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v14

    .line 144
    .local v14, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v14}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v15

    .line 145
    .local v15, tabs:Landroid/widget/TabWidget;
    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->indexOfChild(Landroid/view/View;)I

    move-result v18

    .line 146
    .local v18, widgetIndex:I
    invoke-virtual {v13}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildCount()I

    move-result v17

    .line 147
    .local v17, widgetCount:I
    invoke-virtual {v7, v13}, Lcom/cyanogenmod/trebuchet/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Lcom/cyanogenmod/trebuchet/PagedView;->indexToPage(I)I

    move-result v12

    .line 148
    .local v12, pageIndex:I
    invoke-virtual {v7}, Lcom/cyanogenmod/trebuchet/PagedView;->getChildCount()I

    move-result v11

    .line 149
    .local v11, pageCount:I
    invoke-virtual {v13}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getCellCountX()I

    move-result v3

    .line 150
    .local v3, cellCountX:I
    invoke-virtual {v13}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getCellCountY()I

    move-result v4

    .line 151
    .local v4, cellCountY:I
    rem-int v19, v18, v3

    .line 152
    .local v19, x:I
    div-int v20, v18, v3

    .line 154
    .local v20, y:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    .line 155
    .local v2, action:I
    const/16 v21, 0x1

    move/from16 v0, v21

    if-eq v2, v0, :cond_0

    const/4 v8, 0x1

    .line 159
    .local v8, handleKeyEvent:Z
    :goto_0
    const/4 v5, 0x0

    .line 160
    .local v5, child:Landroid/view/View;
    const/16 v16, 0x0

    .line 161
    .local v16, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 278
    :goto_1
    return v16

    .line 155
    .end local v5           #child:Landroid/view/View;
    .end local v8           #handleKeyEvent:Z
    .end local v16           #wasHandled:Z
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 163
    .restart local v5       #child:Landroid/view/View;
    .restart local v8       #handleKeyEvent:Z
    .restart local v16       #wasHandled:Z
    :sswitch_0
    if-eqz v8, :cond_1

    .line 165
    if-lez v18, :cond_2

    .line 166
    add-int/lit8 v21, v18, -0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->requestFocus()Z

    .line 177
    :cond_1
    :goto_2
    const/16 v16, 0x1

    .line 178
    goto :goto_1

    .line 168
    :cond_2
    if-lez v12, :cond_1

    .line 169
    add-int/lit8 v21, v12, -0x1

    move/from16 v0, v21

    invoke-static {v7, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 170
    .local v9, newParent:Landroid/view/ViewGroup;
    if-eqz v9, :cond_1

    .line 171
    invoke-virtual {v9}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v21

    add-int/lit8 v21, v21, -0x1

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 172
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 180
    .end local v9           #newParent:Landroid/view/ViewGroup;
    :sswitch_1
    if-eqz v8, :cond_3

    .line 182
    add-int/lit8 v21, v17, -0x1

    move/from16 v0, v18

    move/from16 v1, v21

    if-ge v0, v1, :cond_4

    .line 183
    add-int/lit8 v21, v18, 0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->requestFocus()Z

    .line 194
    :cond_3
    :goto_3
    const/16 v16, 0x1

    .line 195
    goto :goto_1

    .line 185
    :cond_4
    add-int/lit8 v21, v11, -0x1

    move/from16 v0, v21

    if-ge v12, v0, :cond_3

    .line 186
    add-int/lit8 v21, v12, 0x1

    move/from16 v0, v21

    invoke-static {v7, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 187
    .restart local v9       #newParent:Landroid/view/ViewGroup;
    if-eqz v9, :cond_3

    .line 188
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 189
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 197
    .end local v9           #newParent:Landroid/view/ViewGroup;
    :sswitch_2
    if-eqz v8, :cond_5

    .line 199
    if-lez v20, :cond_6

    .line 200
    add-int/lit8 v21, v20, -0x1

    mul-int v21, v21, v3

    add-int v10, v21, v19

    .line 201
    .local v10, newWidgetIndex:I
    invoke-virtual {v13, v10}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 202
    if-eqz v5, :cond_5

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 207
    .end local v10           #newWidgetIndex:I
    :cond_5
    :goto_4
    const/16 v16, 0x1

    .line 208
    goto :goto_1

    .line 204
    :cond_6
    invoke-virtual {v15}, Landroid/widget/TabWidget;->requestFocus()Z

    goto :goto_4

    .line 210
    :sswitch_3
    if-eqz v8, :cond_7

    .line 212
    add-int/lit8 v21, v4, -0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_7

    .line 213
    add-int/lit8 v21, v17, -0x1

    add-int/lit8 v22, v20, 0x1

    mul-int v22, v22, v3

    add-int v22, v22, v19

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->min(II)I

    move-result v10

    .line 214
    .restart local v10       #newWidgetIndex:I
    invoke-virtual {v13, v10}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 215
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 218
    .end local v10           #newWidgetIndex:I
    :cond_7
    const/16 v16, 0x1

    .line 219
    goto/16 :goto_1

    .line 222
    :sswitch_4
    if-eqz v8, :cond_8

    move-object v6, v7

    .line 224
    check-cast v6, Landroid/view/View$OnClickListener;

    .line 225
    .local v6, clickListener:Landroid/view/View$OnClickListener;
    move-object/from16 v0, p0

    invoke-interface {v6, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 227
    .end local v6           #clickListener:Landroid/view/View$OnClickListener;
    :cond_8
    const/16 v16, 0x1

    .line 228
    goto/16 :goto_1

    .line 230
    :sswitch_5
    if-eqz v8, :cond_a

    .line 233
    if-lez v12, :cond_b

    .line 234
    add-int/lit8 v21, v12, -0x1

    move/from16 v0, v21

    invoke-static {v7, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 235
    .restart local v9       #newParent:Landroid/view/ViewGroup;
    if-eqz v9, :cond_9

    .line 236
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 241
    .end local v9           #newParent:Landroid/view/ViewGroup;
    :cond_9
    :goto_5
    if-eqz v5, :cond_a

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 243
    :cond_a
    const/16 v16, 0x1

    .line 244
    goto/16 :goto_1

    .line 239
    :cond_b
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    goto :goto_5

    .line 246
    :sswitch_6
    if-eqz v8, :cond_d

    .line 249
    add-int/lit8 v21, v11, -0x1

    move/from16 v0, v21

    if-ge v12, v0, :cond_e

    .line 250
    add-int/lit8 v21, v12, 0x1

    move/from16 v0, v21

    invoke-static {v7, v0}, Lcom/cyanogenmod/trebuchet/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 251
    .restart local v9       #newParent:Landroid/view/ViewGroup;
    if-eqz v9, :cond_c

    .line 252
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 257
    .end local v9           #newParent:Landroid/view/ViewGroup;
    :cond_c
    :goto_6
    if-eqz v5, :cond_d

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 259
    :cond_d
    const/16 v16, 0x1

    .line 260
    goto/16 :goto_1

    .line 255
    :cond_e
    add-int/lit8 v21, v17, -0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    goto :goto_6

    .line 262
    :sswitch_7
    if-eqz v8, :cond_f

    .line 264
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 265
    if-eqz v5, :cond_f

    invoke-virtual {v5}, Landroid/view/View;->requestFocus()Z

    .line 267
    :cond_f
    const/16 v16, 0x1

    .line 268
    goto/16 :goto_1

    .line 270
    :sswitch_8
    if-eqz v8, :cond_10

    .line 272
    add-int/lit8 v21, v17, -0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/cyanogenmod/trebuchet/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->requestFocus()Z

    .line 274
    :cond_10
    const/16 v16, 0x1

    .line 275
    goto/16 :goto_1

    .line 161
    nop

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_2
        0x14 -> :sswitch_3
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x17 -> :sswitch_4
        0x42 -> :sswitch_4
        0x5c -> :sswitch_5
        0x5d -> :sswitch_6
        0x7a -> :sswitch_7
        0x7b -> :sswitch_8
    .end sparse-switch
.end method

.method static handleTabKeyEvent(Lcom/cyanogenmod/trebuchet/AccessibleTabView;ILandroid/view/KeyEvent;)Z
    .locals 10
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    const/4 v7, 0x0

    .line 445
    invoke-static {}, Lcom/cyanogenmod/trebuchet/LauncherApplication;->isScreenLarge()Z

    move-result v8

    if-nez v8, :cond_0

    .line 492
    :goto_0
    return v7

    .line 447
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AccessibleTabView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;

    .line 448
    .local v3, parent:Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;
    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v5

    .line 449
    .local v5, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v5}, Landroid/widget/TabHost;->getTabContentView()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 450
    .local v1, contents:Landroid/view/ViewGroup;
    invoke-virtual {v3}, Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;->getTabCount()I

    move-result v4

    .line 451
    .local v4, tabCount:I
    invoke-virtual {v3, p0}, Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;->getChildTabIndex(Landroid/view/View;)I

    move-result v6

    .line 453
    .local v6, tabIndex:I
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 454
    .local v0, action:I
    if-eq v0, v2, :cond_1

    .line 455
    .local v2, handleKeyEvent:Z
    :goto_1
    const/4 v7, 0x0

    .line 456
    .local v7, wasHandled:Z
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 481
    :pswitch_0
    const/4 v7, 0x1

    .line 482
    goto :goto_0

    .end local v2           #handleKeyEvent:Z
    .end local v7           #wasHandled:Z
    :cond_1
    move v2, v7

    .line 454
    goto :goto_1

    .line 458
    .restart local v2       #handleKeyEvent:Z
    .restart local v7       #wasHandled:Z
    :pswitch_1
    if-eqz v2, :cond_2

    .line 460
    if-lez v6, :cond_2

    .line 461
    add-int/lit8 v8, v6, -0x1

    invoke-virtual {v3, v8}, Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    .line 464
    :cond_2
    const/4 v7, 0x1

    .line 465
    goto :goto_0

    .line 467
    :pswitch_2
    if-eqz v2, :cond_3

    .line 469
    add-int/lit8 v8, v4, -0x1

    if-ge v6, v8, :cond_4

    .line 470
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v3, v8}, Lcom/cyanogenmod/trebuchet/FocusOnlyTabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    .line 477
    :cond_3
    :goto_2
    const/4 v7, 0x1

    .line 478
    goto :goto_0

    .line 472
    :cond_4
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AccessibleTabView;->getNextFocusRightId()I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_3

    .line 473
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/AccessibleTabView;->getNextFocusRightId()I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 484
    :pswitch_3
    if-eqz v2, :cond_5

    .line 486
    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 488
    :cond_5
    const/4 v7, 0x1

    .line 489
    goto :goto_0

    .line 456
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
        :pswitch_3
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
