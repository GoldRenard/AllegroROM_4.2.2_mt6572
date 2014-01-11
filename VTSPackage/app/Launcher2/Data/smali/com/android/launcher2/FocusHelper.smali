.class public Lcom/android/launcher2/FocusHelper;
.super Ljava/lang/Object;
.source "FocusHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "FocusHelper"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 71
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

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
    .line 617
    .local p0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 618
    .local v0, count:I
    add-int v1, p1, p2

    .line 619
    .local v1, newI:I
    :goto_0
    if-ltz v1, :cond_2

    if-ge v1, v0, :cond_2

    .line 620
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 621
    .local v2, newV:Landroid/view/View;
    instance-of v3, v2, Lcom/android/launcher2/BubbleTextView;

    if-nez v3, :cond_0

    instance-of v3, v2, Lcom/android/launcher2/FolderIcon;

    if-eqz v3, :cond_1

    .line 626
    .end local v2           #newV:Landroid/view/View;
    :cond_0
    :goto_1
    return-object v2

    .line 624
    .restart local v2       #newV:Landroid/view/View;
    :cond_1
    add-int/2addr v1, p2

    .line 625
    goto :goto_0

    .line 626
    .end local v2           #newV:Landroid/view/View;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;
    .locals 2
    .parameter "v"

    .prologue
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 78
    .local v0, p:Landroid/view/ViewParent;
    :goto_0
    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/widget/TabHost;

    if-nez v1, :cond_0

    .line 79
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 81
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
    .line 123
    check-cast p0, Lcom/android/launcher2/PagedView;

    .end local p0
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedView;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 124
    .local v0, page:Landroid/view/ViewGroup;
    instance-of v1, v0, Lcom/android/launcher2/PagedViewCellLayout;

    if-eqz v1, :cond_0

    .line 126
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .end local v0           #page:Landroid/view/ViewGroup;
    check-cast v0, Landroid/view/ViewGroup;

    .line 128
    .restart local v0       #page:Landroid/view/ViewGroup;
    :cond_0
    return-object v0
.end method

.method private static getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .locals 2
    .parameter "container"
    .parameter "i"

    .prologue
    .line 580
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 581
    .local v0, parent:Landroid/view/ViewGroup;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    return-object v1
.end method

.method private static getCellLayoutChildrenSortedSpatially(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;
    .locals 5
    .parameter "layout"
    .parameter "parent"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher2/CellLayout;",
            "Landroid/view/ViewGroup;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .prologue
    .line 591
    invoke-virtual {p0}, Lcom/android/launcher2/CellLayout;->getCountX()I

    move-result v0

    .line 592
    .local v0, cellCountX:I
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .line 593
    .local v1, count:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 594
    .local v3, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    const/4 v2, 0x0

    .local v2, j:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 595
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 597
    :cond_0
    new-instance v4, Lcom/android/launcher2/FocusHelper$1;

    invoke-direct {v4, v0}, Lcom/android/launcher2/FocusHelper$1;-><init>(I)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 607
    return-object v3
.end method

.method private static getClosestIconOnLine(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;
    .locals 21
    .parameter "layout"
    .parameter "parent"
    .parameter "v"
    .parameter "lineDelta"

    .prologue
    .line 646
    invoke-static/range {p0 .. p1}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v14

    .line 647
    .local v14, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 648
    .local v7, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v2

    .line 649
    .local v2, cellCountY:I
    iget v10, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    .line 650
    .local v10, row:I
    add-int v8, v10, p3

    .line 651
    .local v8, newRow:I
    if-ltz v8, :cond_8

    if-ge v8, v2, :cond_8

    .line 652
    const v3, 0x7f7fffff

    .line 653
    .local v3, closestDistance:F
    const/4 v4, -0x1

    .line 654
    .local v4, closestIndex:I
    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    .line 655
    .local v6, index:I
    if-gez p3, :cond_2

    const/4 v5, -0x1

    .line 656
    .local v5, endIndex:I
    :goto_0
    if-eq v6, v5, :cond_7

    .line 657
    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/View;

    .line 658
    .local v9, newV:Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v13

    check-cast v13, Lcom/android/launcher2/CellLayout$LayoutParams;

    .line 659
    .local v13, tmpLp:Lcom/android/launcher2/CellLayout$LayoutParams;
    if-gez p3, :cond_4

    iget v15, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    if-ge v15, v10, :cond_3

    const/4 v11, 0x1

    .line 660
    .local v11, satisfiesRow:Z
    :goto_1
    if-eqz v11, :cond_1

    instance-of v15, v9, Lcom/android/launcher2/BubbleTextView;

    if-nez v15, :cond_0

    instance-of v15, v9, Lcom/android/launcher2/FolderIcon;

    if-eqz v15, :cond_1

    .line 662
    :cond_0
    iget v15, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    iget v0, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellX:I

    move/from16 v16, v0

    sub-int v15, v15, v16

    int-to-double v15, v15

    const-wide/high16 v17, 0x4000

    invoke-static/range {v15 .. v18}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v15

    iget v0, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    move/from16 v17, v0

    iget v0, v7, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

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

    .line 664
    .local v12, tmpDistance:F
    cmpg-float v15, v12, v3

    if-gez v15, :cond_1

    .line 665
    move v4, v6

    .line 666
    move v3, v12

    .line 669
    .end local v12           #tmpDistance:F
    :cond_1
    if-gt v6, v5, :cond_6

    .line 670
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 655
    .end local v5           #endIndex:I
    .end local v9           #newV:Landroid/view/View;
    .end local v11           #satisfiesRow:Z
    .end local v13           #tmpLp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_2
    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v5

    goto :goto_0

    .line 659
    .restart local v5       #endIndex:I
    .restart local v9       #newV:Landroid/view/View;
    .restart local v13       #tmpLp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_3
    const/4 v11, 0x0

    goto :goto_1

    :cond_4
    iget v15, v13, Lcom/android/launcher2/CellLayout$LayoutParams;->cellY:I

    if-le v15, v10, :cond_5

    const/4 v11, 0x1

    goto :goto_1

    :cond_5
    const/4 v11, 0x0

    goto :goto_1

    .line 672
    .restart local v11       #satisfiesRow:Z
    :cond_6
    add-int/lit8 v6, v6, -0x1

    goto :goto_0

    .line 675
    .end local v9           #newV:Landroid/view/View;
    .end local v11           #satisfiesRow:Z
    .end local v13           #tmpLp:Lcom/android/launcher2/CellLayout$LayoutParams;
    :cond_7
    const/4 v15, -0x1

    if-le v4, v15, :cond_8

    .line 676
    invoke-virtual {v14, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/view/View;

    .line 679
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

.method private static getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;
    .locals 2
    .parameter "layout"
    .parameter "parent"
    .parameter "i"
    .parameter "delta"

    .prologue
    .line 630
    invoke-static {p0, p1}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    .line 631
    .local v0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-static {v0, p2, p3}, Lcom/android/launcher2/FocusHelper;->findIndexOfIcon(Ljava/util/ArrayList;II)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method private static getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;
    .locals 2
    .parameter "layout"
    .parameter "parent"
    .parameter "v"
    .parameter "delta"

    .prologue
    .line 635
    invoke-static {p0, p1}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenSortedSpatially(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v0

    .line 636
    .local v0, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v0, v1, p3}, Lcom/android/launcher2/FocusHelper;->findIndexOfIcon(Ljava/util/ArrayList;II)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method static handleAppsCustomizeKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 25
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 290
    const-string v22, "FocusHelper"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "handleAppsCustomizeKeyEvent: v = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ", keyCode = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ", event = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v24, ", parent = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v22

    move-object/from16 v0, v22

    instance-of v0, v0, Lcom/android/launcher2/PagedViewCellLayoutChildren;

    move/from16 v22, v0

    if-eqz v22, :cond_0

    .line 295
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    .line 296
    .local v10, itemContainer:Landroid/view/ViewGroup;
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v16

    check-cast v16, Landroid/view/ViewGroup;

    .local v16, parentLayout:Landroid/view/ViewGroup;
    move-object/from16 v22, v16

    .line 297
    check-cast v22, Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountX()I

    move-result v6

    .local v6, countX:I
    move-object/from16 v22, v16

    .line 298
    check-cast v22, Lcom/android/launcher2/PagedViewCellLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/android/launcher2/PagedViewCellLayout;->getCellCountY()I

    move-result v7

    .line 307
    .local v7, countY:I
    :goto_0
    invoke-virtual/range {v16 .. v16}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/PagedView;

    .line 308
    .local v5, container:Lcom/android/launcher2/PagedView;
    invoke-static {v5}, Lcom/android/launcher2/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v17

    .line 309
    .local v17, tabHost:Landroid/widget/TabHost;
    invoke-virtual/range {v17 .. v17}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v18

    .line 310
    .local v18, tabs:Landroid/widget/TabWidget;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v9

    .line 311
    .local v9, iconIndex:I
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v11

    .line 312
    .local v11, itemCount:I
    move-object/from16 v0, v16

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v22

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->indexToPage(I)I

    move-result v15

    .line 313
    .local v15, pageIndex:I
    invoke-virtual {v5}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v14

    .line 315
    .local v14, pageCount:I
    rem-int v20, v9, v6

    .line 316
    .local v20, x:I
    div-int v21, v9, v6

    .line 318
    .local v21, y:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v2

    .line 319
    .local v2, action:I
    const/16 v22, 0x1

    move/from16 v0, v22

    if-eq v2, v0, :cond_1

    const/4 v8, 0x1

    .line 320
    .local v8, handleKeyEvent:Z
    :goto_1
    const/4 v12, 0x0

    .line 323
    .local v12, newParent:Landroid/view/ViewGroup;
    const/4 v3, 0x0

    .line 324
    .local v3, child:Landroid/view/View;
    const/16 v19, 0x0

    .line 325
    .local v19, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 443
    :goto_2
    return v19

    .line 300
    .end local v2           #action:I
    .end local v3           #child:Landroid/view/View;
    .end local v5           #container:Lcom/android/launcher2/PagedView;
    .end local v6           #countX:I
    .end local v7           #countY:I
    .end local v8           #handleKeyEvent:Z
    .end local v9           #iconIndex:I
    .end local v10           #itemContainer:Landroid/view/ViewGroup;
    .end local v11           #itemCount:I
    .end local v12           #newParent:Landroid/view/ViewGroup;
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

    .line 301
    check-cast v22, Lcom/android/launcher2/PagedViewGridLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/android/launcher2/PagedViewGridLayout;->getCellCountX()I

    move-result v6

    .restart local v6       #countX:I
    move-object/from16 v22, v16

    .line 302
    check-cast v22, Lcom/android/launcher2/PagedViewGridLayout;

    invoke-virtual/range {v22 .. v22}, Lcom/android/launcher2/PagedViewGridLayout;->getCellCountY()I

    move-result v7

    .restart local v7       #countY:I
    goto :goto_0

    .line 319
    .restart local v2       #action:I
    .restart local v5       #container:Lcom/android/launcher2/PagedView;
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

    .line 327
    .restart local v3       #child:Landroid/view/View;
    .restart local v8       #handleKeyEvent:Z
    .restart local v12       #newParent:Landroid/view/ViewGroup;
    .restart local v19       #wasHandled:Z
    :sswitch_0
    if-eqz v8, :cond_2

    .line 329
    if-lez v9, :cond_3

    .line 330
    add-int/lit8 v22, v9, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 342
    :cond_2
    :goto_3
    const/16 v19, 0x1

    .line 343
    goto :goto_2

    .line 332
    :cond_3
    if-lez v15, :cond_2

    .line 333
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 334
    if-eqz v12, :cond_2

    .line 335
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 336
    invoke-virtual {v12}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v22

    add-int/lit8 v22, v22, -0x1

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 337
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 345
    :sswitch_1
    if-eqz v8, :cond_4

    .line 347
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    if-ge v9, v0, :cond_5

    .line 348
    add-int/lit8 v22, v9, 0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 360
    :cond_4
    :goto_4
    const/16 v19, 0x1

    .line 361
    goto :goto_2

    .line 350
    :cond_5
    add-int/lit8 v22, v14, -0x1

    move/from16 v0, v22

    if-ge v15, v0, :cond_4

    .line 351
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 352
    if-eqz v12, :cond_4

    .line 353
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 354
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 355
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    goto :goto_4

    .line 363
    :sswitch_2
    if-eqz v8, :cond_6

    .line 365
    if-lez v21, :cond_7

    .line 366
    add-int/lit8 v22, v21, -0x1

    mul-int v22, v22, v6

    add-int v13, v22, v20

    .line 367
    .local v13, newiconIndex:I
    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 372
    .end local v13           #newiconIndex:I
    :cond_6
    :goto_5
    const/16 v19, 0x1

    .line 373
    goto/16 :goto_2

    .line 369
    :cond_7
    invoke-virtual/range {v18 .. v18}, Landroid/widget/TabWidget;->requestFocus()Z

    goto :goto_5

    .line 375
    :sswitch_3
    if-eqz v8, :cond_8

    .line 377
    add-int/lit8 v22, v7, -0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ge v0, v1, :cond_8

    .line 378
    add-int/lit8 v22, v11, -0x1

    add-int/lit8 v23, v21, 0x1

    mul-int v23, v23, v6

    add-int v23, v23, v20

    invoke-static/range {v22 .. v23}, Ljava/lang/Math;->min(II)I

    move-result v13

    .line 379
    .restart local v13       #newiconIndex:I
    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 382
    .end local v13           #newiconIndex:I
    :cond_8
    const/16 v19, 0x1

    .line 383
    goto/16 :goto_2

    .line 386
    :sswitch_4
    if-eqz v8, :cond_9

    move-object v4, v5

    .line 388
    check-cast v4, Landroid/view/View$OnClickListener;

    .line 389
    .local v4, clickListener:Landroid/view/View$OnClickListener;
    move-object/from16 v0, p0

    invoke-interface {v4, v0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 391
    .end local v4           #clickListener:Landroid/view/View$OnClickListener;
    :cond_9
    const/16 v19, 0x1

    .line 392
    goto/16 :goto_2

    .line 394
    :sswitch_5
    if-eqz v8, :cond_a

    .line 397
    if-lez v15, :cond_b

    .line 398
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 399
    if-eqz v12, :cond_a

    .line 400
    add-int/lit8 v22, v15, -0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 401
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 402
    if-eqz v3, :cond_a

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 408
    :cond_a
    :goto_6
    const/16 v19, 0x1

    .line 409
    goto/16 :goto_2

    .line 405
    :cond_b
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    goto :goto_6

    .line 411
    :sswitch_6
    if-eqz v8, :cond_c

    .line 414
    add-int/lit8 v22, v14, -0x1

    move/from16 v0, v22

    if-ge v15, v0, :cond_d

    .line 415
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-static {v5, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v12

    .line 416
    if-eqz v12, :cond_c

    .line 417
    add-int/lit8 v22, v15, 0x1

    move/from16 v0, v22

    invoke-virtual {v5, v0}, Lcom/android/launcher2/PagedView;->snapToPage(I)V

    .line 418
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v12, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 419
    if-eqz v3, :cond_c

    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 425
    :cond_c
    :goto_7
    const/16 v19, 0x1

    .line 426
    goto/16 :goto_2

    .line 422
    :cond_d
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    goto :goto_7

    .line 428
    :sswitch_7
    if-eqz v8, :cond_e

    .line 430
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 432
    :cond_e
    const/16 v19, 0x1

    .line 433
    goto/16 :goto_2

    .line 435
    :sswitch_8
    if-eqz v8, :cond_f

    .line 437
    add-int/lit8 v22, v11, -0x1

    move/from16 v0, v22

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Landroid/view/View;->requestFocus()Z

    .line 439
    :cond_f
    const/16 v19, 0x1

    .line 440
    goto/16 :goto_2

    .line 325
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
    .locals 7
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    .line 88
    invoke-static {p0}, Lcom/android/launcher2/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v4

    .line 89
    .local v4, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v4}, Landroid/widget/TabHost;->getTabContentView()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 90
    .local v1, contents:Landroid/view/ViewGroup;
    const v6, 0x7f070008

    invoke-virtual {v4, v6}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 92
    .local v3, shop:Landroid/view/View;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 93
    .local v0, action:I
    if-eq v0, v2, :cond_1

    .line 94
    .local v2, handleKeyEvent:Z
    :goto_0
    const/4 v5, 0x0

    .line 95
    .local v5, wasHandled:Z
    packed-switch p1, :pswitch_data_0

    .line 116
    :cond_0
    :goto_1
    :pswitch_0
    return v5

    .line 93
    .end local v2           #handleKeyEvent:Z
    .end local v5           #wasHandled:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 97
    .restart local v2       #handleKeyEvent:Z
    .restart local v5       #wasHandled:Z
    :pswitch_1
    if-eqz v2, :cond_2

    .line 99
    if-eq p0, v3, :cond_2

    .line 100
    invoke-virtual {v3}, Landroid/view/View;->requestFocus()Z

    .line 103
    :cond_2
    const/4 v5, 0x1

    .line 104
    goto :goto_1

    .line 106
    :pswitch_2
    if-eqz v2, :cond_0

    .line 108
    if-ne p0, v3, :cond_0

    .line 109
    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 110
    const/4 v5, 0x1

    goto :goto_1

    .line 95
    nop

    :pswitch_data_0
    .packed-switch 0x14
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method static handleFolderKeyEvent(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 13
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v12, -0x1

    const/4 v8, 0x1

    .line 847
    const-string v9, "FocusHelper"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "handleFolderKeyEvent: v = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ", event = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 850
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 851
    .local v5, parent:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v5}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/CellLayout;

    .line 852
    .local v3, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v3}, Lcom/android/launcher2/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/Folder;

    .line 853
    .local v1, folder:Lcom/android/launcher2/Folder;
    iget-object v6, v1, Lcom/android/launcher2/Folder;->mFolderName:Lcom/android/launcher2/FolderEditText;

    .line 855
    .local v6, title:Landroid/view/View;
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 856
    .local v0, action:I
    if-eq v0, v8, :cond_0

    move v2, v8

    .line 857
    .local v2, handleKeyEvent:Z
    :goto_0
    const/4 v7, 0x0

    .line 858
    .local v7, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 926
    :goto_1
    return v7

    .line 856
    .end local v2           #handleKeyEvent:Z
    .end local v7           #wasHandled:Z
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 860
    .restart local v2       #handleKeyEvent:Z
    .restart local v7       #wasHandled:Z
    :sswitch_0
    if-eqz v2, :cond_1

    .line 862
    invoke-static {v3, v5, p0, v12}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 863
    .local v4, newIcon:Landroid/view/View;
    if-eqz v4, :cond_1

    .line 864
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 867
    .end local v4           #newIcon:Landroid/view/View;
    :cond_1
    const/4 v7, 0x1

    .line 868
    goto :goto_1

    .line 870
    :sswitch_1
    if-eqz v2, :cond_2

    .line 872
    invoke-static {v3, v5, p0, v8}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 873
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_3

    .line 874
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 879
    .end local v4           #newIcon:Landroid/view/View;
    :cond_2
    :goto_2
    const/4 v7, 0x1

    .line 880
    goto :goto_1

    .line 876
    .restart local v4       #newIcon:Landroid/view/View;
    :cond_3
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 882
    .end local v4           #newIcon:Landroid/view/View;
    :sswitch_2
    if-eqz v2, :cond_4

    .line 884
    invoke-static {v3, v5, p0, v12}, Lcom/android/launcher2/FocusHelper;->getClosestIconOnLine(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 885
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_4

    .line 886
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 889
    .end local v4           #newIcon:Landroid/view/View;
    :cond_4
    const/4 v7, 0x1

    .line 890
    goto :goto_1

    .line 892
    :sswitch_3
    if-eqz v2, :cond_5

    .line 894
    invoke-static {v3, v5, p0, v8}, Lcom/android/launcher2/FocusHelper;->getClosestIconOnLine(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v4

    .line 895
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_6

    .line 896
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 901
    .end local v4           #newIcon:Landroid/view/View;
    :cond_5
    :goto_3
    const/4 v7, 0x1

    .line 902
    goto :goto_1

    .line 898
    .restart local v4       #newIcon:Landroid/view/View;
    :cond_6
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 904
    .end local v4           #newIcon:Landroid/view/View;
    :sswitch_4
    if-eqz v2, :cond_7

    .line 906
    invoke-static {v3, v5, v12, v8}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    .line 907
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_7

    .line 908
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 911
    .end local v4           #newIcon:Landroid/view/View;
    :cond_7
    const/4 v7, 0x1

    .line 912
    goto :goto_1

    .line 914
    :sswitch_5
    if-eqz v2, :cond_8

    .line 916
    invoke-virtual {v5}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v8

    invoke-static {v3, v5, v8, v12}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v4

    .line 918
    .restart local v4       #newIcon:Landroid/view/View;
    if-eqz v4, :cond_8

    .line 919
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 922
    .end local v4           #newIcon:Landroid/view/View;
    :cond_8
    const/4 v7, 0x1

    .line 923
    goto :goto_1

    .line 858
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
    .locals 16
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"
    .parameter "orientation"

    .prologue
    .line 511
    const-string v13, "FocusHelper"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleHotseatButtonKeyEvent: v = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", tag = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", event = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", orientation = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move/from16 v0, p3

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 515
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    .line 516
    .local v10, parent:Landroid/view/ViewGroup;
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/ViewGroup;

    .line 517
    .local v6, launcher:Landroid/view/ViewGroup;
    const v13, 0x7f07001c

    invoke-virtual {v6, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Lcom/android/launcher2/Workspace;

    .line 518
    .local v12, workspace:Lcom/android/launcher2/Workspace;
    move-object/from16 v0, p0

    invoke-virtual {v10, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    .line 519
    .local v3, buttonIndex:I
    invoke-virtual {v10}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    .line 520
    .local v2, buttonCount:I
    invoke-virtual {v12}, Lcom/android/launcher2/Workspace;->getCurrentPage()I

    move-result v9

    .line 526
    .local v9, pageIndex:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    .line 527
    .local v1, action:I
    const/4 v13, 0x1

    if-eq v1, v13, :cond_0

    const/4 v5, 0x1

    .line 528
    .local v5, handleKeyEvent:Z
    :goto_0
    const/4 v11, 0x0

    .line 529
    .local v11, wasHandled:Z
    packed-switch p1, :pswitch_data_0

    .line 572
    :goto_1
    return v11

    .line 527
    .end local v5           #handleKeyEvent:Z
    .end local v11           #wasHandled:Z
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 531
    .restart local v5       #handleKeyEvent:Z
    .restart local v11       #wasHandled:Z
    :pswitch_0
    if-eqz v5, :cond_1

    .line 533
    if-lez v3, :cond_2

    .line 534
    add-int/lit8 v13, v3, -0x1

    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->requestFocus()Z

    .line 539
    :cond_1
    :goto_2
    const/4 v11, 0x1

    .line 540
    goto :goto_1

    .line 536
    :cond_2
    add-int/lit8 v13, v9, -0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_2

    .line 542
    :pswitch_1
    if-eqz v5, :cond_3

    .line 544
    add-int/lit8 v13, v2, -0x1

    if-ge v3, v13, :cond_4

    .line 545
    add-int/lit8 v13, v3, 0x1

    invoke-virtual {v10, v13}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    invoke-virtual {v13}, Landroid/view/View;->requestFocus()Z

    .line 550
    :cond_3
    :goto_3
    const/4 v11, 0x1

    .line 551
    goto :goto_1

    .line 547
    :cond_4
    add-int/lit8 v13, v9, 0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_3

    .line 553
    :pswitch_2
    if-eqz v5, :cond_5

    .line 555
    invoke-virtual {v12, v9}, Lcom/android/launcher2/Workspace;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/CellLayout;

    .line 556
    .local v7, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v7}, Lcom/android/launcher2/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v4

    .line 557
    .local v4, children:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v7, v4, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v8

    .line 558
    .local v8, newIcon:Landroid/view/View;
    if-eqz v8, :cond_6

    .line 559
    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    .line 564
    .end local v4           #children:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .end local v7           #layout:Lcom/android/launcher2/CellLayout;
    .end local v8           #newIcon:Landroid/view/View;
    :cond_5
    :goto_4
    const/4 v11, 0x1

    .line 565
    goto :goto_1

    .line 561
    .restart local v4       #children:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .restart local v7       #layout:Lcom/android/launcher2/CellLayout;
    .restart local v8       #newIcon:Landroid/view/View;
    :cond_6
    invoke-virtual {v12}, Lcom/android/launcher2/Workspace;->requestFocus()Z

    goto :goto_4

    .line 568
    .end local v4           #children:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    .end local v7           #layout:Lcom/android/launcher2/CellLayout;
    .end local v8           #newIcon:Landroid/view/View;
    :pswitch_3
    const/4 v11, 0x1

    .line 569
    goto :goto_1

    .line 529
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
    .locals 16
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 687
    const-string v13, "FocusHelper"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "handleIconKeyEvent: v = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", tag = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", event = "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 691
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v9

    check-cast v9, Lcom/android/launcher2/ShortcutAndWidgetContainer;

    .line 692
    .local v9, parent:Lcom/android/launcher2/ShortcutAndWidgetContainer;
    invoke-virtual {v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    check-cast v5, Lcom/android/launcher2/CellLayout;

    .line 693
    .local v5, layout:Lcom/android/launcher2/CellLayout;
    invoke-virtual {v5}, Lcom/android/launcher2/CellLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v12

    check-cast v12, Lcom/android/launcher2/Workspace;

    .line 694
    .local v12, workspace:Lcom/android/launcher2/Workspace;
    invoke-virtual {v12}, Lcom/android/launcher2/Workspace;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 695
    .local v4, launcher:Landroid/view/ViewGroup;
    const v13, 0x7f070025

    invoke-virtual {v4, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/view/ViewGroup;

    .line 696
    .local v10, tabs:Landroid/view/ViewGroup;
    const v13, 0x7f070024

    invoke-virtual {v4, v13}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 697
    .local v3, hotseat:Landroid/view/ViewGroup;
    invoke-virtual {v12, v5}, Lcom/android/launcher2/Workspace;->indexOfChild(Landroid/view/View;)I

    move-result v8

    .line 698
    .local v8, pageIndex:I
    invoke-virtual {v12}, Lcom/android/launcher2/Workspace;->getChildCount()I

    move-result v7

    .line 700
    .local v7, pageCount:I
    invoke-virtual/range {p2 .. p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    .line 701
    .local v1, action:I
    const/4 v13, 0x1

    if-eq v1, v13, :cond_1

    const/4 v2, 0x1

    .line 702
    .local v2, handleKeyEvent:Z
    :goto_0
    const/4 v11, 0x0

    .line 703
    .local v11, wasHandled:Z
    sparse-switch p1, :sswitch_data_0

    .line 839
    :cond_0
    :goto_1
    return v11

    .line 701
    .end local v2           #handleKeyEvent:Z
    .end local v11           #wasHandled:Z
    :cond_1
    const/4 v2, 0x0

    goto :goto_0

    .line 705
    .restart local v2       #handleKeyEvent:Z
    .restart local v11       #wasHandled:Z
    :sswitch_0
    if-eqz v2, :cond_2

    .line 707
    const/4 v13, -0x1

    move-object/from16 v0, p0

    invoke-static {v5, v9, v0, v13}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v6

    .line 708
    .local v6, newIcon:Landroid/view/View;
    if-eqz v6, :cond_3

    .line 709
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 724
    .end local v6           #newIcon:Landroid/view/View;
    :cond_2
    :goto_2
    const/4 v11, 0x1

    .line 725
    goto :goto_1

    .line 711
    .restart local v6       #newIcon:Landroid/view/View;
    :cond_3
    if-lez v8, :cond_2

    .line 712
    add-int/lit8 v13, v8, -0x1

    invoke-static {v12, v13}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 713
    invoke-virtual {v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v13

    const/4 v14, -0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 715
    if-eqz v6, :cond_4

    .line 716
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_2

    .line 719
    :cond_4
    add-int/lit8 v13, v8, -0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_2

    .line 727
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_1
    if-eqz v2, :cond_5

    .line 729
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-static {v5, v9, v0, v13}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v6

    .line 730
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_6

    .line 731
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 745
    .end local v6           #newIcon:Landroid/view/View;
    :cond_5
    :goto_3
    const/4 v11, 0x1

    .line 746
    goto :goto_1

    .line 733
    .restart local v6       #newIcon:Landroid/view/View;
    :cond_6
    add-int/lit8 v13, v7, -0x1

    if-ge v8, v13, :cond_5

    .line 734
    add-int/lit8 v13, v8, 0x1

    invoke-static {v12, v13}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 735
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 736
    if-eqz v6, :cond_7

    .line 737
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 740
    :cond_7
    add-int/lit8 v13, v8, 0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_3

    .line 748
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_2
    if-eqz v2, :cond_0

    .line 750
    const/4 v13, -0x1

    move-object/from16 v0, p0

    invoke-static {v5, v9, v0, v13}, Lcom/android/launcher2/FocusHelper;->getClosestIconOnLine(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v6

    .line 751
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_8

    .line 752
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 753
    const/4 v11, 0x1

    goto :goto_1

    .line 755
    :cond_8
    invoke-virtual {v10}, Landroid/view/ViewGroup;->requestFocus()Z

    goto :goto_1

    .line 760
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_3
    if-eqz v2, :cond_0

    .line 762
    const/4 v13, 0x1

    move-object/from16 v0, p0

    invoke-static {v5, v9, v0, v13}, Lcom/android/launcher2/FocusHelper;->getClosestIconOnLine(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;Landroid/view/View;I)Landroid/view/View;

    move-result-object v6

    .line 763
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_9

    .line 764
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 765
    const/4 v11, 0x1

    goto :goto_1

    .line 766
    :cond_9
    if-eqz v3, :cond_0

    .line 767
    invoke-virtual {v3}, Landroid/view/ViewGroup;->requestFocus()Z

    goto/16 :goto_1

    .line 772
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_4
    if-eqz v2, :cond_a

    .line 775
    if-lez v8, :cond_c

    .line 776
    add-int/lit8 v13, v8, -0x1

    invoke-static {v12, v13}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 777
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 778
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_b

    .line 779
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 791
    .end local v6           #newIcon:Landroid/view/View;
    :cond_a
    :goto_4
    const/4 v11, 0x1

    .line 792
    goto/16 :goto_1

    .line 782
    .restart local v6       #newIcon:Landroid/view/View;
    :cond_b
    add-int/lit8 v13, v8, -0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_4

    .line 785
    .end local v6           #newIcon:Landroid/view/View;
    :cond_c
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 786
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_a

    .line 787
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_4

    .line 794
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_5
    if-eqz v2, :cond_d

    .line 797
    add-int/lit8 v13, v7, -0x1

    if-ge v8, v13, :cond_f

    .line 798
    add-int/lit8 v13, v8, 0x1

    invoke-static {v12, v13}, Lcom/android/launcher2/FocusHelper;->getCellLayoutChildrenForIndex(Landroid/view/ViewGroup;I)Lcom/android/launcher2/ShortcutAndWidgetContainer;

    move-result-object v9

    .line 799
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 800
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_e

    .line 801
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 814
    .end local v6           #newIcon:Landroid/view/View;
    :cond_d
    :goto_5
    const/4 v11, 0x1

    .line 815
    goto/16 :goto_1

    .line 804
    .restart local v6       #newIcon:Landroid/view/View;
    :cond_e
    add-int/lit8 v13, v8, 0x1

    invoke-virtual {v12, v13}, Lcom/android/launcher2/Workspace;->snapToPage(I)V

    goto :goto_5

    .line 807
    .end local v6           #newIcon:Landroid/view/View;
    :cond_f
    invoke-virtual {v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v13

    const/4 v14, -0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 809
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_d

    .line 810
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    goto :goto_5

    .line 817
    .end local v6           #newIcon:Landroid/view/View;
    :sswitch_6
    if-eqz v2, :cond_10

    .line 819
    const/4 v13, -0x1

    const/4 v14, 0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 820
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_10

    .line 821
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 824
    .end local v6           #newIcon:Landroid/view/View;
    :cond_10
    const/4 v11, 0x1

    .line 825
    goto/16 :goto_1

    .line 827
    :sswitch_7
    if-eqz v2, :cond_11

    .line 829
    invoke-virtual {v9}, Lcom/android/launcher2/ShortcutAndWidgetContainer;->getChildCount()I

    move-result v13

    const/4 v14, -0x1

    invoke-static {v5, v9, v13, v14}, Lcom/android/launcher2/FocusHelper;->getIconInDirection(Lcom/android/launcher2/CellLayout;Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v6

    .line 831
    .restart local v6       #newIcon:Landroid/view/View;
    if-eqz v6, :cond_11

    .line 832
    invoke-virtual {v6}, Landroid/view/View;->requestFocus()Z

    .line 835
    .end local v6           #newIcon:Landroid/view/View;
    :cond_11
    const/4 v11, 0x1

    .line 836
    goto/16 :goto_1

    .line 703
    nop

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

.method static handlePagedViewGridLayoutWidgetKeyEvent(Lcom/android/launcher2/PagedViewWidget;ILandroid/view/KeyEvent;)Z
    .locals 24
    .parameter "w"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    .line 137
    const-string v21, "FocusHelper"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "handlePagedViewGridLayoutWidgetKeyEvent: w = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", keyCode = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, ", event = "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    invoke-virtual/range {p0 .. p0}, Lcom/android/launcher2/PagedViewWidget;->getParent()Landroid/view/ViewParent;

    move-result-object v13

    check-cast v13, Lcom/android/launcher2/PagedViewGridLayout;

    .line 142
    .local v13, parent:Lcom/android/launcher2/PagedViewGridLayout;
    invoke-virtual {v13}, Lcom/android/launcher2/PagedViewGridLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    check-cast v7, Lcom/android/launcher2/PagedView;

    .line 143
    .local v7, container:Lcom/android/launcher2/PagedView;
    invoke-static {v7}, Lcom/android/launcher2/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v14

    .line 144
    .local v14, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v14}, Landroid/widget/TabHost;->getTabWidget()Landroid/widget/TabWidget;

    move-result-object v15

    .line 145
    .local v15, tabs:Landroid/widget/TabWidget;
    move-object/from16 v0, p0

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->indexOfChild(Landroid/view/View;)I

    move-result v18

    .line 146
    .local v18, widgetIndex:I
    invoke-virtual {v13}, Lcom/android/launcher2/PagedViewGridLayout;->getChildCount()I

    move-result v17

    .line 147
    .local v17, widgetCount:I
    invoke-virtual {v7, v13}, Lcom/android/launcher2/PagedView;->indexOfChild(Landroid/view/View;)I

    move-result v21

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Lcom/android/launcher2/PagedView;->indexToPage(I)I

    move-result v12

    .line 148
    .local v12, pageIndex:I
    invoke-virtual {v7}, Lcom/android/launcher2/PagedView;->getChildCount()I

    move-result v11

    .line 149
    .local v11, pageCount:I
    invoke-virtual {v13}, Lcom/android/launcher2/PagedViewGridLayout;->getCellCountX()I

    move-result v3

    .line 150
    .local v3, cellCountX:I
    invoke-virtual {v13}, Lcom/android/launcher2/PagedViewGridLayout;->getCellCountY()I

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

    .line 156
    .local v8, handleKeyEvent:Z
    :goto_0
    const/4 v9, 0x0

    .line 159
    .local v9, newParent:Landroid/view/ViewGroup;
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
    .end local v9           #newParent:Landroid/view/ViewGroup;
    .end local v16           #wasHandled:Z
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 163
    .restart local v5       #child:Landroid/view/View;
    .restart local v8       #handleKeyEvent:Z
    .restart local v9       #newParent:Landroid/view/ViewGroup;
    .restart local v16       #wasHandled:Z
    :sswitch_0
    if-eqz v8, :cond_1

    .line 165
    if-lez v18, :cond_2

    .line 166
    add-int/lit8 v21, v18, -0x1

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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

    invoke-static {v7, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 170
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

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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

    invoke-static {v7, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 187
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
    invoke-virtual {v13, v10}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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
    invoke-virtual {v13, v10}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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

    invoke-static {v7, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 235
    if-eqz v9, :cond_9

    .line 236
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 241
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

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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

    invoke-static {v7, v0}, Lcom/android/launcher2/FocusHelper;->getAppsCustomizePage(Landroid/view/ViewGroup;I)Landroid/view/ViewGroup;

    move-result-object v9

    .line 251
    if-eqz v9, :cond_c

    .line 252
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v9, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 257
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

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    goto :goto_6

    .line 262
    :sswitch_7
    if-eqz v8, :cond_f

    .line 264
    const/16 v21, 0x0

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

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

    invoke-virtual {v13, v0}, Lcom/android/launcher2/PagedViewGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->requestFocus()Z

    .line 274
    :cond_10
    const/16 v16, 0x1

    .line 275
    goto/16 :goto_1

    .line 161
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

.method static handleTabKeyEvent(Lcom/android/launcher2/AccessibleTabView;ILandroid/view/KeyEvent;)Z
    .locals 11
    .parameter "v"
    .parameter "keyCode"
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    const/4 v8, 0x0

    .line 450
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v9

    if-nez v9, :cond_0

    .line 503
    :goto_0
    return v8

    .line 452
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher2/AccessibleTabView;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lcom/android/launcher2/FocusOnlyTabWidget;

    .line 453
    .local v3, parent:Lcom/android/launcher2/FocusOnlyTabWidget;
    invoke-static {v3}, Lcom/android/launcher2/FocusHelper;->findTabHostParent(Landroid/view/View;)Landroid/widget/TabHost;

    move-result-object v5

    .line 454
    .local v5, tabHost:Landroid/widget/TabHost;
    invoke-virtual {v5}, Landroid/widget/TabHost;->getTabContentView()Landroid/widget/FrameLayout;

    move-result-object v1

    .line 455
    .local v1, contents:Landroid/view/ViewGroup;
    invoke-virtual {v3}, Lcom/android/launcher2/FocusOnlyTabWidget;->getTabCount()I

    move-result v4

    .line 456
    .local v4, tabCount:I
    invoke-virtual {v3, p0}, Lcom/android/launcher2/FocusOnlyTabWidget;->getChildTabIndex(Landroid/view/View;)I

    move-result v6

    .line 458
    .local v6, tabIndex:I
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    .line 459
    .local v0, action:I
    if-eq v0, v2, :cond_1

    .line 460
    .local v2, handleKeyEvent:Z
    :goto_1
    const/4 v7, 0x0

    .line 462
    .local v7, wasHandled:Z
    const-string v8, "FocusHelper"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "handleTabKeyEvent: action = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", tabCount = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", tabIndex = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", handleKeyEvent = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", keyCode = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", v = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 467
    packed-switch p1, :pswitch_data_0

    :goto_2
    move v8, v7

    .line 503
    goto :goto_0

    .end local v2           #handleKeyEvent:Z
    .end local v7           #wasHandled:Z
    :cond_1
    move v2, v8

    .line 459
    goto :goto_1

    .line 469
    .restart local v2       #handleKeyEvent:Z
    .restart local v7       #wasHandled:Z
    :pswitch_0
    if-eqz v2, :cond_2

    .line 471
    if-lez v6, :cond_2

    .line 472
    add-int/lit8 v8, v6, -0x1

    invoke-virtual {v3, v8}, Lcom/android/launcher2/FocusOnlyTabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    .line 475
    :cond_2
    const/4 v7, 0x1

    .line 476
    goto :goto_2

    .line 478
    :pswitch_1
    if-eqz v2, :cond_3

    .line 480
    add-int/lit8 v8, v4, -0x1

    if-ge v6, v8, :cond_4

    .line 481
    add-int/lit8 v8, v6, 0x1

    invoke-virtual {v3, v8}, Lcom/android/launcher2/FocusOnlyTabWidget;->getChildTabViewAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    .line 488
    :cond_3
    :goto_3
    const/4 v7, 0x1

    .line 489
    goto :goto_2

    .line 483
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher2/AccessibleTabView;->getNextFocusRightId()I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_3

    .line 484
    invoke-virtual {p0}, Lcom/android/launcher2/AccessibleTabView;->getNextFocusRightId()I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TabHost;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->requestFocus()Z

    goto :goto_3

    .line 492
    :pswitch_2
    const/4 v7, 0x1

    .line 493
    goto :goto_2

    .line 495
    :pswitch_3
    if-eqz v2, :cond_5

    .line 497
    invoke-virtual {v1}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 499
    :cond_5
    const/4 v7, 0x1

    .line 500
    goto :goto_2

    .line 467
    nop

    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
