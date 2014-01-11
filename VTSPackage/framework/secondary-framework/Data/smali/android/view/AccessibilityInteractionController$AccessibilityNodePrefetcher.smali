.class Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;
.super Ljava/lang/Object;
.source "AccessibilityInteractionController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/AccessibilityInteractionController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AccessibilityNodePrefetcher"
.end annotation


# static fields
.field private static final MAX_ACCESSIBILITY_NODE_INFO_BATCH_SIZE:I = 0x32


# instance fields
.field private final mTempViewList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroid/view/AccessibilityInteractionController;


# direct methods
.method private constructor <init>(Landroid/view/AccessibilityInteractionController;)V
    .locals 1
    .parameter

    .prologue
    .line 613
    iput-object p1, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->this$0:Landroid/view/AccessibilityInteractionController;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 617
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->mTempViewList:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Landroid/view/AccessibilityInteractionController;Landroid/view/AccessibilityInteractionController$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 613
    invoke-direct {p0, p1}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;-><init>(Landroid/view/AccessibilityInteractionController;)V

    return-void
.end method

.method private prefetchDescendantsOfRealNode(Landroid/view/View;Ljava/util/List;)V
    .locals 13
    .parameter "root"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    const/16 v12, 0x32

    .line 706
    instance-of v11, p1, Landroid/view/ViewGroup;

    if-nez v11, :cond_1

    .line 755
    :cond_0
    :goto_0
    return-void

    .line 709
    :cond_1
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 711
    .local v1, addedChildren:Ljava/util/HashMap;,"Ljava/util/HashMap<Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    iget-object v4, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->mTempViewList:Ljava/util/ArrayList;

    .line 712
    .local v4, children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 714
    :try_start_0
    invoke-virtual {p1, v4}, Landroid/view/View;->addChildrenForAccessibility(Ljava/util/ArrayList;)V

    .line 715
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 716
    .local v3, childCount:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-ge v6, v3, :cond_5

    .line 717
    invoke-interface {p2}, Ljava/util/List;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v11

    if-lt v11, v12, :cond_2

    .line 740
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    goto :goto_0

    .line 720
    :cond_2
    :try_start_1
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 721
    .local v2, child:Landroid/view/View;
    iget-object v11, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->this$0:Landroid/view/AccessibilityInteractionController;

    #calls: Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z
    invoke-static {v11, v2}, Landroid/view/AccessibilityInteractionController;->access$100(Landroid/view/AccessibilityInteractionController;Landroid/view/View;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 722
    invoke-virtual {v2}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v9

    .line 723
    .local v9, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-nez v9, :cond_4

    .line 724
    invoke-virtual {v2}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v8

    .line 725
    .local v8, info:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v8, :cond_3

    .line 726
    invoke-interface {p2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 727
    const/4 v11, 0x0

    invoke-virtual {v1, v2, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 716
    .end local v8           #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v9           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_3
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 730
    .restart local v9       #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_4
    const/4 v11, -0x1

    invoke-virtual {v9, v11}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v8

    .line 732
    .restart local v8       #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v8, :cond_3

    .line 733
    invoke-interface {p2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 734
    invoke-virtual {v1, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 740
    .end local v2           #child:Landroid/view/View;
    .end local v3           #childCount:I
    .end local v6           #i:I
    .end local v8           #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v9           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :catchall_0
    move-exception v11

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    throw v11

    .restart local v3       #childCount:I
    .restart local v6       #i:I
    :cond_5
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 742
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v11

    if-ge v11, v12, :cond_0

    .line 743
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 744
    .local v5, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 745
    .local v0, addedChild:Landroid/view/View;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 746
    .local v10, virtualRoot:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-nez v10, :cond_6

    .line 747
    invoke-direct {p0, v0, p2}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchDescendantsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    goto :goto_3

    .line 749
    :cond_6
    invoke-virtual {v0}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v9

    .line 751
    .restart local v9       #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    invoke-direct {p0, v10, v9, p2}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchDescendantsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V

    goto :goto_3
.end method

.method private prefetchDescendantsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V
    .locals 10
    .parameter "root"
    .parameter "provider"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            "Landroid/view/accessibility/AccessibilityNodeProvider;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    const/16 v9, 0x32

    .line 822
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildNodeIds()Landroid/util/SparseLongArray;

    move-result-object v5

    .line 823
    .local v5, childNodeIds:Landroid/util/SparseLongArray;
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v7

    .line 824
    .local v7, initialOutInfosSize:I
    invoke-virtual {v5}, Landroid/util/SparseLongArray;->size()I

    move-result v2

    .line 825
    .local v2, childCount:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_0
    if-ge v6, v2, :cond_3

    .line 826
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v8

    if-lt v8, v9, :cond_1

    .line 843
    :cond_0
    return-void

    .line 829
    :cond_1
    invoke-virtual {v5, v6}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v3

    .line 830
    .local v3, childNodeId:J
    invoke-static {v3, v4}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v8

    invoke-virtual {p2, v8}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    .line 832
    .local v1, child:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v1, :cond_2

    .line 833
    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 825
    :cond_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 836
    .end local v1           #child:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v3           #childNodeId:J
    :cond_3
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v8

    if-ge v8, v9, :cond_0

    .line 837
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v8

    sub-int v0, v8, v7

    .line 838
    .local v0, addedChildCount:I
    const/4 v6, 0x0

    :goto_1
    if-ge v6, v0, :cond_0

    .line 839
    add-int v8, v7, v6

    invoke-interface {p3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 840
    .restart local v1       #child:Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-direct {p0, v1, p2, p3}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchDescendantsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V

    .line 838
    add-int/lit8 v6, v6, 0x1

    goto :goto_1
.end method

.method private prefetchPredecessorsOfRealNode(Landroid/view/View;Ljava/util/List;)V
    .locals 5
    .parameter "view"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 655
    .local p2, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-virtual {p1}, Landroid/view/View;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object v1

    .line 657
    .local v1, parent:Landroid/view/ViewParent;
    :goto_0
    instance-of v3, v1, Landroid/view/View;

    if-eqz v3, :cond_1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x32

    if-ge v3, v4, :cond_1

    move-object v2, v1

    .line 658
    check-cast v2, Landroid/view/View;

    .line 659
    .local v2, parentView:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v0

    .line 660
    .local v0, info:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v0, :cond_0

    .line 661
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 663
    :cond_0
    invoke-interface {v1}, Landroid/view/ViewParent;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object v1

    .line 664
    goto :goto_0

    .line 665
    .end local v0           #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v2           #parentView:Landroid/view/View;
    :cond_1
    return-void
.end method

.method private prefetchPredecessorsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V
    .locals 8
    .parameter "root"
    .parameter "providerHost"
    .parameter "provider"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            "Landroid/view/View;",
            "Landroid/view/accessibility/AccessibilityNodeProvider;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p4, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    const/4 v7, -0x1

    .line 760
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParentNodeId()J

    move-result-wide v2

    .line 761
    .local v2, parentNodeId:J
    invoke-static {v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v0

    .line 762
    .local v0, accessibilityViewId:I
    :goto_0
    if-eq v0, v7, :cond_0

    .line 763
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v5

    const/16 v6, 0x32

    if-lt v5, v6, :cond_1

    .line 783
    :cond_0
    :goto_1
    return-void

    .line 766
    :cond_1
    invoke-static {v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v4

    .line 768
    .local v4, virtualDescendantId:I
    if-ne v4, v7, :cond_2

    invoke-virtual {p2}, Landroid/view/View;->getAccessibilityViewId()I

    move-result v5

    if-ne v0, v5, :cond_4

    .line 770
    :cond_2
    invoke-virtual {p3, v4}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    .line 772
    .local v1, parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v1, :cond_3

    .line 773
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 775
    :cond_3
    invoke-virtual {v1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParentNodeId()J

    move-result-wide v2

    .line 776
    invoke-static {v2, v3}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v0

    .line 778
    goto :goto_0

    .line 779
    .end local v1           #parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    :cond_4
    invoke-direct {p0, p2, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchPredecessorsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    goto :goto_1
.end method

.method private prefetchSiblingsOfRealNode(Landroid/view/View;Ljava/util/List;)V
    .locals 10
    .parameter "current"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 669
    .local p2, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-virtual {p1}, Landroid/view/View;->getParentForAccessibility()Landroid/view/ViewParent;

    move-result-object v5

    .line 670
    .local v5, parent:Landroid/view/ViewParent;
    instance-of v8, v5, Landroid/view/ViewGroup;

    if-eqz v8, :cond_1

    move-object v6, v5

    .line 671
    check-cast v6, Landroid/view/ViewGroup;

    .line 672
    .local v6, parentGroup:Landroid/view/ViewGroup;
    iget-object v2, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->mTempViewList:Ljava/util/ArrayList;

    .line 673
    .local v2, children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 675
    :try_start_0
    invoke-virtual {v6, v2}, Landroid/view/ViewGroup;->addChildrenForAccessibility(Ljava/util/ArrayList;)V

    .line 676
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 677
    .local v1, childCount:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 678
    invoke-interface {p2}, Ljava/util/List;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    const/16 v9, 0x32

    if-lt v8, v9, :cond_2

    .line 699
    :cond_0
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 702
    .end local v1           #childCount:I
    .end local v2           #children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    .end local v3           #i:I
    .end local v6           #parentGroup:Landroid/view/ViewGroup;
    :cond_1
    return-void

    .line 681
    .restart local v1       #childCount:I
    .restart local v2       #children:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/view/View;>;"
    .restart local v3       #i:I
    .restart local v6       #parentGroup:Landroid/view/ViewGroup;
    :cond_2
    :try_start_1
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 682
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getAccessibilityViewId()I

    move-result v8

    invoke-virtual {p1}, Landroid/view/View;->getAccessibilityViewId()I

    move-result v9

    if-eq v8, v9, :cond_3

    iget-object v8, p0, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->this$0:Landroid/view/AccessibilityInteractionController;

    #calls: Landroid/view/AccessibilityInteractionController;->isShown(Landroid/view/View;)Z
    invoke-static {v8, v0}, Landroid/view/AccessibilityInteractionController;->access$100(Landroid/view/AccessibilityInteractionController;Landroid/view/View;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 684
    const/4 v4, 0x0

    .line 685
    .local v4, info:Landroid/view/accessibility/AccessibilityNodeInfo;
    invoke-virtual {v0}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v7

    .line 687
    .local v7, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-nez v7, :cond_4

    .line 688
    invoke-virtual {v0}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v4

    .line 693
    :goto_1
    if-eqz v4, :cond_3

    .line 694
    invoke-interface {p2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 677
    .end local v4           #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v7           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 690
    .restart local v4       #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .restart local v7       #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :cond_4
    const/4 v8, -0x1

    invoke-virtual {v7, v8}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v4

    goto :goto_1

    .line 699
    .end local v0           #child:Landroid/view/View;
    .end local v1           #childCount:I
    .end local v3           #i:I
    .end local v4           #info:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v7           #provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    :catchall_0
    move-exception v8

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    throw v8
.end method

.method private prefetchSiblingsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V
    .locals 17
    .parameter "current"
    .parameter "providerHost"
    .parameter "provider"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            "Landroid/view/View;",
            "Landroid/view/accessibility/AccessibilityNodeProvider;",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 787
    .local p4, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getParentNodeId()J

    move-result-wide v12

    .line 788
    .local v12, parentNodeId:J
    invoke-static {v12, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->getAccessibilityViewId(J)I

    move-result v11

    .line 790
    .local v11, parentAccessibilityViewId:I
    invoke-static {v12, v13}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v14

    .line 792
    .local v14, parentVirtualDescendantId:I
    const/4 v15, -0x1

    if-ne v14, v15, :cond_0

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getAccessibilityViewId()I

    move-result v15

    if-ne v11, v15, :cond_4

    .line 794
    :cond_0
    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v10

    .line 796
    .local v10, parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v10, :cond_1

    .line 797
    invoke-virtual {v10}, Landroid/view/accessibility/AccessibilityNodeInfo;->getChildNodeIds()Landroid/util/SparseLongArray;

    move-result-object v7

    .line 798
    .local v7, childNodeIds:Landroid/util/SparseLongArray;
    invoke-virtual {v7}, Landroid/util/SparseLongArray;->size()I

    move-result v4

    .line 799
    .local v4, childCount:I
    const/4 v9, 0x0

    .local v9, i:I
    :goto_0
    if-ge v9, v4, :cond_1

    .line 800
    invoke-interface/range {p4 .. p4}, Ljava/util/List;->size()I

    move-result v15

    const/16 v16, 0x32

    move/from16 v0, v16

    if-lt v15, v0, :cond_2

    .line 818
    .end local v4           #childCount:I
    .end local v7           #childNodeIds:Landroid/util/SparseLongArray;
    .end local v9           #i:I
    .end local v10           #parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    :cond_1
    :goto_1
    return-void

    .line 803
    .restart local v4       #childCount:I
    .restart local v7       #childNodeIds:Landroid/util/SparseLongArray;
    .restart local v9       #i:I
    .restart local v10       #parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    :cond_2
    invoke-virtual {v7, v9}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v5

    .line 804
    .local v5, childNodeId:J
    invoke-virtual/range {p1 .. p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->getSourceNodeId()J

    move-result-wide v15

    cmp-long v15, v5, v15

    if-eqz v15, :cond_3

    .line 805
    invoke-static {v5, v6}, Landroid/view/accessibility/AccessibilityNodeInfo;->getVirtualDescendantId(J)I

    move-result v8

    .line 807
    .local v8, childVirtualDescendantId:I
    move-object/from16 v0, p3

    invoke-virtual {v0, v8}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v3

    .line 809
    .local v3, child:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v3, :cond_3

    .line 810
    move-object/from16 v0, p4

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 799
    .end local v3           #child:Landroid/view/accessibility/AccessibilityNodeInfo;
    .end local v8           #childVirtualDescendantId:I
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 816
    .end local v4           #childCount:I
    .end local v5           #childNodeId:J
    .end local v7           #childNodeIds:Landroid/util/SparseLongArray;
    .end local v9           #i:I
    .end local v10           #parent:Landroid/view/accessibility/AccessibilityNodeInfo;
    :cond_4
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchSiblingsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    goto :goto_1
.end method


# virtual methods
.method public prefetchAccessibilityNodeInfos(Landroid/view/View;IILjava/util/List;)V
    .locals 3
    .parameter "view"
    .parameter "virtualViewId"
    .parameter "prefetchFlags"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "II",
            "Ljava/util/List",
            "<",
            "Landroid/view/accessibility/AccessibilityNodeInfo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 621
    .local p4, outInfos:Ljava/util/List;,"Ljava/util/List<Landroid/view/accessibility/AccessibilityNodeInfo;>;"
    invoke-virtual {p1}, Landroid/view/View;->getAccessibilityNodeProvider()Landroid/view/accessibility/AccessibilityNodeProvider;

    move-result-object v0

    .line 622
    .local v0, provider:Landroid/view/accessibility/AccessibilityNodeProvider;
    if-nez v0, :cond_3

    .line 623
    invoke-virtual {p1}, Landroid/view/View;->createAccessibilityNodeInfo()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    .line 624
    .local v1, root:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v1, :cond_2

    .line 625
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    and-int/lit8 v2, p3, 0x1

    if-eqz v2, :cond_0

    .line 627
    invoke-direct {p0, p1, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchPredecessorsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    .line 629
    :cond_0
    and-int/lit8 v2, p3, 0x2

    if-eqz v2, :cond_1

    .line 630
    invoke-direct {p0, p1, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchSiblingsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    .line 632
    :cond_1
    and-int/lit8 v2, p3, 0x4

    if-eqz v2, :cond_2

    .line 633
    invoke-direct {p0, p1, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchDescendantsOfRealNode(Landroid/view/View;Ljava/util/List;)V

    .line 651
    :cond_2
    :goto_0
    return-void

    .line 637
    .end local v1           #root:Landroid/view/accessibility/AccessibilityNodeInfo;
    :cond_3
    invoke-virtual {v0, p2}, Landroid/view/accessibility/AccessibilityNodeProvider;->createAccessibilityNodeInfo(I)Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object v1

    .line 638
    .restart local v1       #root:Landroid/view/accessibility/AccessibilityNodeInfo;
    if-eqz v1, :cond_2

    .line 639
    invoke-interface {p4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 640
    and-int/lit8 v2, p3, 0x1

    if-eqz v2, :cond_4

    .line 641
    invoke-direct {p0, v1, p1, v0, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchPredecessorsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V

    .line 643
    :cond_4
    and-int/lit8 v2, p3, 0x2

    if-eqz v2, :cond_5

    .line 644
    invoke-direct {p0, v1, p1, v0, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchSiblingsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V

    .line 646
    :cond_5
    and-int/lit8 v2, p3, 0x4

    if-eqz v2, :cond_2

    .line 647
    invoke-direct {p0, v1, v0, p4}, Landroid/view/AccessibilityInteractionController$AccessibilityNodePrefetcher;->prefetchDescendantsOfVirtualNode(Landroid/view/accessibility/AccessibilityNodeInfo;Landroid/view/accessibility/AccessibilityNodeProvider;Ljava/util/List;)V

    goto :goto_0
.end method
