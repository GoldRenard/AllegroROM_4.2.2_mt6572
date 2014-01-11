.class Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;
.super Ljava/lang/Object;
.source "CellLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cyanogenmod/trebuchet/CellLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewCluster"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;
    }
.end annotation


# static fields
.field static final BOTTOM:I = 0x3

.field static final LEFT:I = 0x0

.field static final RIGHT:I = 0x2

.field static final TOP:I = 0x1


# instance fields
.field bottomEdge:[I

.field bottomEdgeDirty:Z

.field boundingRect:Landroid/graphics/Rect;

.field boundingRectDirty:Z

.field comparator:Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;

.field config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

.field leftEdge:[I

.field leftEdgeDirty:Z

.field rightEdge:[I

.field rightEdgeDirty:Z

.field final synthetic this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

.field topEdge:[I

.field topEdgeDirty:Z

.field views:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/cyanogenmod/trebuchet/CellLayout;Ljava/util/ArrayList;Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;)V
    .locals 1
    .parameter
    .parameter
    .parameter "config"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;",
            "Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1616
    .local p2, views:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1607
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRect:Landroid/graphics/Rect;

    .line 1609
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$300(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdge:[I

    .line 1610
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$300(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdge:[I

    .line 1611
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$400(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdge:[I

    .line 1612
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$400(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v0

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdge:[I

    .line 1802
    new-instance v0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;-><init>(Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->comparator:Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;

    .line 1617
    invoke-virtual {p2}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    .line 1618
    iput-object p3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    .line 1619
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->resetEdges()V

    .line 1620
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 1740
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1741
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->resetEdges()V

    .line 1742
    return-void
.end method

.method computeEdge(I[I)V
    .locals 10
    .parameter "which"
    .parameter "edge"

    .prologue
    .line 1639
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 1640
    .local v1, count:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_7

    .line 1641
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    iget-object v8, v8, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1642
    .local v2, cs:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    packed-switch p1, :pswitch_data_0

    .line 1640
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1644
    :pswitch_0
    iget v5, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .line 1645
    .local v5, left:I
    iget v4, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .local v4, j:I
    :goto_1
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v8, v9

    if-ge v4, v8, :cond_0

    .line 1646
    aget v8, p2, v4

    if-lt v5, v8, :cond_1

    aget v8, p2, v4

    if-gez v8, :cond_2

    .line 1647
    :cond_1
    aput v5, p2, v4

    .line 1645
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1652
    .end local v4           #j:I
    .end local v5           #left:I
    :pswitch_1
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int v6, v8, v9

    .line 1653
    .local v6, right:I
    iget v4, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .restart local v4       #j:I
    :goto_2
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v8, v9

    if-ge v4, v8, :cond_0

    .line 1654
    aget v8, p2, v4

    if-le v6, v8, :cond_3

    .line 1655
    aput v6, p2, v4

    .line 1653
    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1660
    .end local v4           #j:I
    .end local v6           #right:I
    :pswitch_2
    iget v7, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .line 1661
    .local v7, top:I
    iget v4, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .restart local v4       #j:I
    :goto_3
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v8, v9

    if-ge v4, v8, :cond_0

    .line 1662
    aget v8, p2, v4

    if-lt v7, v8, :cond_4

    aget v8, p2, v4

    if-gez v8, :cond_5

    .line 1663
    :cond_4
    aput v7, p2, v4

    .line 1661
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1668
    .end local v4           #j:I
    .end local v7           #top:I
    :pswitch_3
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int v0, v8, v9

    .line 1669
    .local v0, bottom:I
    iget v4, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .restart local v4       #j:I
    :goto_4
    iget v8, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v9, v2, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v8, v9

    if-ge v4, v8, :cond_0

    .line 1670
    aget v8, p2, v4

    if-le v0, v8, :cond_6

    .line 1671
    aput v0, p2, v4

    .line 1669
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 1677
    .end local v0           #bottom:I
    .end local v2           #cs:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v4           #j:I
    :cond_7
    return-void

    .line 1642
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public getBottomEdge()[I
    .locals 2

    .prologue
    .line 1796
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdgeDirty:Z

    if-eqz v0, :cond_0

    .line 1797
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdge:[I

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->computeEdge(I[I)V

    .line 1799
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdge:[I

    return-object v0
.end method

.method public getBoundingRect()Landroid/graphics/Rect;
    .locals 10

    .prologue
    .line 1745
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRectDirty:Z

    if-eqz v4, :cond_1

    .line 1746
    const/4 v1, 0x1

    .line 1747
    .local v1, first:Z
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1748
    .local v3, v:Landroid/view/View;
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    iget-object v4, v4, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1749
    .local v0, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    if-eqz v1, :cond_0

    .line 1750
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRect:Landroid/graphics/Rect;

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v7, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v7, v8

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v9, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v8, v9

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 1751
    const/4 v1, 0x0

    goto :goto_0

    .line 1753
    :cond_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRect:Landroid/graphics/Rect;

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v7, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v7, v8

    iget v8, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v9, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v8, v9

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;->union(IIII)V

    goto :goto_0

    .line 1757
    .end local v0           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v1           #first:Z
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #v:Landroid/view/View;
    :cond_1
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRect:Landroid/graphics/Rect;

    return-object v4
.end method

.method public getEdge(I)[I
    .locals 1
    .parameter "which"

    .prologue
    .line 1761
    packed-switch p1, :pswitch_data_0

    .line 1770
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getBottomEdge()[I

    move-result-object v0

    :goto_0
    return-object v0

    .line 1763
    :pswitch_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getLeftEdge()[I

    move-result-object v0

    goto :goto_0

    .line 1765
    :pswitch_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getRightEdge()[I

    move-result-object v0

    goto :goto_0

    .line 1767
    :pswitch_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getTopEdge()[I

    move-result-object v0

    goto :goto_0

    .line 1761
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public getLeftEdge()[I
    .locals 2

    .prologue
    .line 1775
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdgeDirty:Z

    if-eqz v0, :cond_0

    .line 1776
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdge:[I

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->computeEdge(I[I)V

    .line 1778
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdge:[I

    return-object v0
.end method

.method public getRightEdge()[I
    .locals 2

    .prologue
    .line 1782
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdgeDirty:Z

    if-eqz v0, :cond_0

    .line 1783
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdge:[I

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->computeEdge(I[I)V

    .line 1785
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdge:[I

    return-object v0
.end method

.method public getTopEdge()[I
    .locals 2

    .prologue
    .line 1789
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdgeDirty:Z

    if-eqz v0, :cond_0

    .line 1790
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdge:[I

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->computeEdge(I[I)V

    .line 1792
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdge:[I

    return-object v0
.end method

.method isViewTouchingEdge(Landroid/view/View;I)Z
    .locals 7
    .parameter "v"
    .parameter "whichEdge"

    .prologue
    const/4 v3, 0x1

    .line 1680
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    iget-object v4, v4, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1682
    .local v0, cs:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    invoke-virtual {p0, p2}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->getEdge(I)[I

    move-result-object v1

    .line 1684
    .local v1, edge:[I
    packed-switch p2, :pswitch_data_0

    .line 1714
    :cond_0
    const/4 v3, 0x0

    :cond_1
    return v3

    .line 1686
    :pswitch_0
    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .local v2, i:I
    :goto_0
    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_0

    .line 1687
    aget v4, v1, v2

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v5, v6

    if-eq v4, v5, :cond_1

    .line 1686
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1693
    .end local v2           #i:I
    :pswitch_1
    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    .restart local v2       #i:I
    :goto_1
    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_0

    .line 1694
    aget v4, v1, v2

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    if-eq v4, v5, :cond_1

    .line 1693
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1700
    .end local v2           #i:I
    :pswitch_2
    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .restart local v2       #i:I
    :goto_2
    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_0

    .line 1701
    aget v4, v1, v2

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    iget v6, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanY:I

    add-int/2addr v5, v6

    if-eq v4, v5, :cond_1

    .line 1700
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1707
    .end local v2           #i:I
    :pswitch_3
    iget v2, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    .restart local v2       #i:I
    :goto_3
    iget v4, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->spanX:I

    add-int/2addr v4, v5

    if-ge v2, v4, :cond_0

    .line 1708
    aget v4, v1, v2

    iget v5, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    if-eq v4, v5, :cond_1

    .line 1707
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 1684
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method resetEdges()V
    .locals 4

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x1

    .line 1623
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountX:I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$400(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1624
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdge:[I

    aput v3, v1, v0

    .line 1625
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdge:[I

    aput v3, v1, v0

    .line 1623
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1627
    :cond_0
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->this$0:Lcom/cyanogenmod/trebuchet/CellLayout;

    #getter for: Lcom/cyanogenmod/trebuchet/CellLayout;->mCountY:I
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/CellLayout;->access$300(Lcom/cyanogenmod/trebuchet/CellLayout;)I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 1628
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdge:[I

    aput v3, v1, v0

    .line 1629
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdge:[I

    aput v3, v1, v0

    .line 1627
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1631
    :cond_1
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->leftEdgeDirty:Z

    .line 1632
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->rightEdgeDirty:Z

    .line 1633
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->bottomEdgeDirty:Z

    .line 1634
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->topEdgeDirty:Z

    .line 1635
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->boundingRectDirty:Z

    .line 1636
    return-void
.end method

.method shift(II)V
    .locals 4
    .parameter "whichEdge"
    .parameter "delta"

    .prologue
    .line 1718
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->views:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 1719
    .local v2, v:Landroid/view/View;
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    iget-object v3, v3, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->map:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;

    .line 1720
    .local v0, c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    packed-switch p1, :pswitch_data_0

    .line 1732
    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    add-int/2addr v3, p2

    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    goto :goto_0

    .line 1722
    :pswitch_0
    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    sub-int/2addr v3, p2

    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    goto :goto_0

    .line 1725
    :pswitch_1
    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    add-int/2addr v3, p2

    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->x:I

    goto :goto_0

    .line 1728
    :pswitch_2
    iget v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    sub-int/2addr v3, p2

    iput v3, v0, Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;->y:I

    goto :goto_0

    .line 1736
    .end local v0           #c:Lcom/cyanogenmod/trebuchet/CellLayout$CellAndSpan;
    .end local v2           #v:Landroid/view/View;
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->resetEdges()V

    .line 1737
    return-void

    .line 1720
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public sortConfigurationForEdgePush(I)V
    .locals 2
    .parameter "edge"

    .prologue
    .line 1823
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->comparator:Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;

    iput p1, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;->whichEdge:I

    .line 1824
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->config:Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/CellLayout$ItemConfiguration;->sortedViews:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster;->comparator:Lcom/cyanogenmod/trebuchet/CellLayout$ViewCluster$PositionComparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1825
    return-void
.end method
