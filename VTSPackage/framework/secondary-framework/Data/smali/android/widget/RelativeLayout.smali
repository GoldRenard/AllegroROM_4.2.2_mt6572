.class public Landroid/widget/RelativeLayout;
.super Landroid/view/ViewGroup;
.source "RelativeLayout.java"


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/widget/RelativeLayout$1;,
        Landroid/widget/RelativeLayout$DependencyGraph;,
        Landroid/widget/RelativeLayout$LayoutParams;,
        Landroid/widget/RelativeLayout$TopToBottomLeftToRightComparator;
    }
.end annotation


# static fields
.field public static final ABOVE:I = 0x2

.field public static final ALIGN_BASELINE:I = 0x4

.field public static final ALIGN_BOTTOM:I = 0x8

.field public static final ALIGN_END:I = 0x13

.field public static final ALIGN_LEFT:I = 0x5

.field public static final ALIGN_PARENT_BOTTOM:I = 0xc

.field public static final ALIGN_PARENT_END:I = 0x15

.field public static final ALIGN_PARENT_LEFT:I = 0x9

.field public static final ALIGN_PARENT_RIGHT:I = 0xb

.field public static final ALIGN_PARENT_START:I = 0x14

.field public static final ALIGN_PARENT_TOP:I = 0xa

.field public static final ALIGN_RIGHT:I = 0x7

.field public static final ALIGN_START:I = 0x12

.field public static final ALIGN_TOP:I = 0x6

.field public static final BELOW:I = 0x3

.field public static final CENTER_HORIZONTAL:I = 0xe

.field public static final CENTER_IN_PARENT:I = 0xd

.field public static final CENTER_VERTICAL:I = 0xf

.field private static final DEBUG_GRAPH:Z = false

.field public static final END_OF:I = 0x11

.field public static final LEFT_OF:I = 0x0

.field private static final LOG_TAG:Ljava/lang/String; = "RelativeLayout"

.field public static final RIGHT_OF:I = 0x1

.field private static final RULES_HORIZONTAL:[I = null

.field private static final RULES_VERTICAL:[I = null

.field public static final START_OF:I = 0x10

.field public static final TRUE:I = -0x1

.field private static final VERB_COUNT:I = 0x16


# instance fields
.field private mBaselineView:Landroid/view/View;

.field private final mContentBounds:Landroid/graphics/Rect;

.field private mDirtyHierarchy:Z

.field private final mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

.field private mGravity:I

.field private mHasBaselineAlignedChild:Z

.field private mIgnoreGravity:I

.field private final mSelfBounds:Landroid/graphics/Rect;

.field private mSortedHorizontalChildren:[Landroid/view/View;

.field private mSortedVerticalChildren:[Landroid/view/View;

.field private mTopToBottomLeftToRightSet:Ljava/util/SortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/SortedSet",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Landroid/widget/RelativeLayout;->RULES_VERTICAL:[I

    .line 186
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Landroid/widget/RelativeLayout;->RULES_HORIZONTAL:[I

    return-void

    .line 182
    :array_0
    .array-data 0x4
        0x2t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t
        0x4t 0x0t 0x0t 0x0t
        0x6t 0x0t 0x0t 0x0t
        0x8t 0x0t 0x0t 0x0t
    .end array-data

    .line 186
    :array_1
    .array-data 0x4
        0x0t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
        0x5t 0x0t 0x0t 0x0t
        0x7t 0x0t 0x0t 0x0t
        0x10t 0x0t 0x0t 0x0t
        0x11t 0x0t 0x0t 0x0t
        0x12t 0x0t 0x0t 0x0t
        0x13t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 206
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 190
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    .line 193
    const v0, 0x800033

    iput v0, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 194
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mContentBounds:Landroid/graphics/Rect;

    .line 195
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSelfBounds:Landroid/graphics/Rect;

    .line 198
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    .line 201
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    .line 202
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    .line 203
    new-instance v0, Landroid/widget/RelativeLayout$DependencyGraph;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$DependencyGraph;-><init>(Landroid/widget/RelativeLayout$1;)V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    .line 207
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 210
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 190
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    .line 193
    const v0, 0x800033

    iput v0, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 194
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mContentBounds:Landroid/graphics/Rect;

    .line 195
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSelfBounds:Landroid/graphics/Rect;

    .line 198
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    .line 201
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    .line 202
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    .line 203
    new-instance v0, Landroid/widget/RelativeLayout$DependencyGraph;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$DependencyGraph;-><init>(Landroid/widget/RelativeLayout$1;)V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    .line 211
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;->initFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 212
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 215
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 190
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    .line 193
    const v0, 0x800033

    iput v0, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 194
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mContentBounds:Landroid/graphics/Rect;

    .line 195
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSelfBounds:Landroid/graphics/Rect;

    .line 198
    iput-object v1, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    .line 201
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    .line 202
    new-array v0, v2, [Landroid/view/View;

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    .line 203
    new-instance v0, Landroid/widget/RelativeLayout$DependencyGraph;

    invoke-direct {v0, v1}, Landroid/widget/RelativeLayout$DependencyGraph;-><init>(Landroid/widget/RelativeLayout$1;)V

    iput-object v0, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    .line 216
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;->initFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 217
    return-void
.end method

.method private alignBaseline(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;)V
    .locals 10
    .parameter "child"
    .parameter "params"

    .prologue
    const/4 v8, 0x4

    const/4 v9, -0x1

    .line 617
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutDirection()I

    move-result v4

    .line 618
    .local v4, layoutDirection:I
    invoke-virtual {p2, v4}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object v7

    .line 619
    .local v7, rules:[I
    invoke-direct {p0, v7, v8}, Landroid/widget/RelativeLayout;->getRelatedViewBaseline([II)I

    move-result v0

    .line 621
    .local v0, anchorBaseline:I
    if-eq v0, v9, :cond_1

    .line 622
    invoke-direct {p0, v7, v8}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v1

    .line 623
    .local v1, anchorParams:Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz v1, :cond_1

    .line 624
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    add-int v6, v8, v0

    .line 625
    .local v6, offset:I
    invoke-virtual {p1}, Landroid/view/View;->getBaseline()I

    move-result v2

    .line 626
    .local v2, baseline:I
    if-eq v2, v9, :cond_0

    .line 627
    sub-int/2addr v6, v2

    .line 629
    :cond_0
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v9

    sub-int v3, v8, v9

    .line 630
    .local v3, height:I
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2, v6}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 631
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    add-int/2addr v8, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2, v8}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 635
    .end local v1           #anchorParams:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2           #baseline:I
    .end local v3           #height:I
    .end local v6           #offset:I
    :cond_1
    iget-object v8, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    if-nez v8, :cond_3

    .line 636
    iput-object p1, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    .line 643
    :cond_2
    :goto_0
    return-void

    .line 638
    :cond_3
    iget-object v8, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/RelativeLayout$LayoutParams;

    .line 639
    .local v5, lp:Landroid/widget/RelativeLayout$LayoutParams;
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v5}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v9

    if-lt v8, v9, :cond_4

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v5}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v9

    if-ne v8, v9, :cond_2

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v8

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {v5}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v9

    if-ge v8, v9, :cond_2

    .line 640
    :cond_4
    iput-object p1, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    goto :goto_0
.end method

.method private applyHorizontalSizeRules(Landroid/widget/RelativeLayout$LayoutParams;I)V
    .locals 9
    .parameter "childParams"
    .parameter "myWidth"

    .prologue
    const/4 v8, 0x7

    const/4 v7, 0x5

    const/4 v6, 0x1

    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 830
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutDirection()I

    move-result v1

    .line 831
    .local v1, layoutDirection:I
    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object v2

    .line 838
    .local v2, rules:[I
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 839
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 841
    invoke-direct {p0, v2, v4}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 842
    .local v0, anchorParams:Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz v0, :cond_6

    .line 843
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 853
    :cond_0
    :goto_0
    invoke-direct {p0, v2, v6}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 854
    if-eqz v0, :cond_7

    .line 855
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v5, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v4, v5

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 861
    :cond_1
    :goto_1
    invoke-direct {p0, v2, v7}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 862
    if-eqz v0, :cond_8

    .line 863
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 868
    :cond_2
    :goto_2
    invoke-direct {p0, v2, v8}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 869
    if-eqz v0, :cond_9

    .line 870
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 879
    :cond_3
    :goto_3
    const/16 v3, 0x9

    aget v3, v2, v3

    if-eqz v3, :cond_4

    .line 880
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 883
    :cond_4
    const/16 v3, 0xb

    aget v3, v2, v3

    if-eqz v3, :cond_5

    .line 884
    if-ltz p2, :cond_5

    .line 885
    iget v3, p0, Landroid/view/View;->mPaddingRight:I

    sub-int v3, p2, v3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 890
    :cond_5
    return-void

    .line 845
    :cond_6
    iget-boolean v3, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v3, :cond_0

    aget v3, v2, v4

    if-eqz v3, :cond_0

    .line 846
    if-ltz p2, :cond_0

    .line 847
    iget v3, p0, Landroid/view/View;->mPaddingRight:I

    sub-int v3, p2, v3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 857
    :cond_7
    iget-boolean v3, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v3, :cond_1

    aget v3, v2, v6

    if-eqz v3, :cond_1

    .line 858
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_1

    .line 864
    :cond_8
    iget-boolean v3, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v3, :cond_2

    aget v3, v2, v7

    if-eqz v3, :cond_2

    .line 865
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_2

    .line 871
    :cond_9
    iget-boolean v3, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v3, :cond_3

    aget v3, v2, v8

    if-eqz v3, :cond_3

    .line 872
    if-ltz p2, :cond_3

    .line 873
    iget v3, p0, Landroid/view/View;->mPaddingRight:I

    sub-int v3, p2, v3

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_3
.end method

.method private applyVerticalSizeRules(Landroid/widget/RelativeLayout$LayoutParams;I)V
    .locals 8
    .parameter "childParams"
    .parameter "myHeight"

    .prologue
    const/16 v7, 0x8

    const/4 v6, 0x6

    const/4 v5, 0x3

    const/4 v3, 0x2

    const/4 v2, -0x1

    .line 893
    invoke-virtual {p1}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v1

    .line 896
    .local v1, rules:[I
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 897
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 899
    invoke-direct {p0, v1, v3}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 900
    .local v0, anchorParams:Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz v0, :cond_7

    .line 901
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v3, v4

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 911
    :cond_0
    :goto_0
    invoke-direct {p0, v1, v5}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 912
    if-eqz v0, :cond_8

    .line 913
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v3, v4

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 919
    :cond_1
    :goto_1
    invoke-direct {p0, v1, v6}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 920
    if-eqz v0, :cond_9

    .line 921
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 926
    :cond_2
    :goto_2
    invoke-direct {p0, v1, v7}, Landroid/widget/RelativeLayout;->getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    .line 927
    if-eqz v0, :cond_a

    .line 928
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {v0}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 937
    :cond_3
    :goto_3
    const/16 v2, 0xa

    aget v2, v1, v2

    if-eqz v2, :cond_4

    .line 938
    iget v2, p0, Landroid/view/View;->mPaddingTop:I

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 941
    :cond_4
    const/16 v2, 0xc

    aget v2, v1, v2

    if-eqz v2, :cond_5

    .line 942
    if-ltz p2, :cond_5

    .line 943
    iget v2, p0, Landroid/view/View;->mPaddingBottom:I

    sub-int v2, p2, v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 949
    :cond_5
    const/4 v2, 0x4

    aget v2, v1, v2

    if-eqz v2, :cond_6

    .line 950
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/widget/RelativeLayout;->mHasBaselineAlignedChild:Z

    .line 952
    :cond_6
    return-void

    .line 903
    :cond_7
    iget-boolean v2, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v2, :cond_0

    aget v2, v1, v3

    if-eqz v2, :cond_0

    .line 904
    if-ltz p2, :cond_0

    .line 905
    iget v2, p0, Landroid/view/View;->mPaddingBottom:I

    sub-int v2, p2, v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 915
    :cond_8
    iget-boolean v2, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v2, :cond_1

    aget v2, v1, v5

    if-eqz v2, :cond_1

    .line 916
    iget v2, p0, Landroid/view/View;->mPaddingTop:I

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_1

    .line 922
    :cond_9
    iget-boolean v2, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v2, :cond_2

    aget v2, v1, v6

    if-eqz v2, :cond_2

    .line 923
    iget v2, p0, Landroid/view/View;->mPaddingTop:I

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_2

    .line 929
    :cond_a
    iget-boolean v2, p1, Landroid/widget/RelativeLayout$LayoutParams;->alignWithParent:Z

    if-eqz v2, :cond_3

    aget v2, v1, v7

    if-eqz v2, :cond_3

    .line 930
    if-ltz p2, :cond_3

    .line 931
    iget v2, p0, Landroid/view/View;->mPaddingBottom:I

    sub-int v2, p2, v2

    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_3
.end method

.method private centerHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V
    .locals 3
    .parameter "child"
    .parameter "params"
    .parameter "myWidth"

    .prologue
    .line 995
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    .line 996
    .local v0, childWidth:I
    sub-int v2, p3, v0

    div-int/lit8 v1, v2, 0x2

    .line 998
    .local v1, left:I
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 999
    add-int v2, v1, v0

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 1000
    return-void
.end method

.method private centerVertical(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V
    .locals 3
    .parameter "child"
    .parameter "params"
    .parameter "myHeight"

    .prologue
    .line 1003
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 1004
    .local v0, childHeight:I
    sub-int v2, p3, v0

    div-int/lit8 v1, v2, 0x2

    .line 1006
    .local v1, top:I
    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 1007
    add-int v2, v1, v0

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 1008
    return-void
.end method

.method private getChildMeasureSpec(IIIIIIII)I
    .locals 6
    .parameter "childStart"
    .parameter "childEnd"
    .parameter "childSize"
    .parameter "startMargin"
    .parameter "endMargin"
    .parameter "startPadding"
    .parameter "endPadding"
    .parameter "mySize"

    .prologue
    .line 703
    const/4 v0, 0x0

    .line 704
    .local v0, childSpecMode:I
    const/4 v1, 0x0

    .line 707
    .local v1, childSpecSize:I
    move v4, p1

    .line 708
    .local v4, tempStart:I
    move v3, p2

    .line 712
    .local v3, tempEnd:I
    if-gez v4, :cond_0

    .line 713
    add-int v4, p6, p4

    .line 715
    :cond_0
    if-gez v3, :cond_1

    .line 716
    sub-int v5, p8, p7

    sub-int v3, v5, p5

    .line 720
    :cond_1
    sub-int v2, v3, v4

    .line 722
    .local v2, maxAvailable:I
    if-ltz p1, :cond_3

    if-ltz p2, :cond_3

    .line 724
    const/high16 v0, 0x4000

    .line 725
    move v1, v2

    .line 760
    :cond_2
    :goto_0
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    return v5

    .line 727
    :cond_3
    if-ltz p3, :cond_5

    .line 729
    const/high16 v0, 0x4000

    .line 731
    if-ltz v2, :cond_4

    .line 733
    invoke-static {v2, p3}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_0

    .line 736
    :cond_4
    move v1, p3

    goto :goto_0

    .line 738
    :cond_5
    const/4 v5, -0x1

    if-ne p3, v5, :cond_6

    .line 741
    const/high16 v0, 0x4000

    .line 742
    move v1, v2

    goto :goto_0

    .line 743
    :cond_6
    const/4 v5, -0x2

    if-ne p3, v5, :cond_2

    .line 747
    if-ltz v2, :cond_7

    .line 749
    const/high16 v0, -0x8000

    .line 750
    move v1, v2

    goto :goto_0

    .line 754
    :cond_7
    const/4 v0, 0x0

    .line 755
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getRelatedView([II)Landroid/view/View;
    .locals 6
    .parameter "rules"
    .parameter "relation"

    .prologue
    const/4 v4, 0x0

    .line 955
    aget v0, p1, p2

    .line 956
    .local v0, id:I
    if-eqz v0, :cond_3

    .line 957
    iget-object v3, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    #getter for: Landroid/widget/RelativeLayout$DependencyGraph;->mKeyNodes:Landroid/util/SparseArray;
    invoke-static {v3}, Landroid/widget/RelativeLayout$DependencyGraph;->access$500(Landroid/widget/RelativeLayout$DependencyGraph;)Landroid/util/SparseArray;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$DependencyGraph$Node;

    .line 958
    .local v1, node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    if-nez v1, :cond_1

    move-object v2, v4

    .line 972
    .end local v1           #node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    :cond_0
    :goto_0
    return-object v2

    .line 959
    .restart local v1       #node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    :cond_1
    iget-object v2, v1, Landroid/widget/RelativeLayout$DependencyGraph$Node;->view:Landroid/view/View;

    .line 962
    .local v2, v:Landroid/view/View;
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    const/16 v5, 0x8

    if-ne v3, v5, :cond_0

    .line 963
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutDirection()I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object p1

    .line 964
    iget-object v3, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    #getter for: Landroid/widget/RelativeLayout$DependencyGraph;->mKeyNodes:Landroid/util/SparseArray;
    invoke-static {v3}, Landroid/widget/RelativeLayout$DependencyGraph;->access$500(Landroid/widget/RelativeLayout$DependencyGraph;)Landroid/util/SparseArray;

    move-result-object v3

    aget v5, p1, p2

    invoke-virtual {v3, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    check-cast v1, Landroid/widget/RelativeLayout$DependencyGraph$Node;

    .line 965
    .restart local v1       #node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    if-nez v1, :cond_2

    move-object v2, v4

    goto :goto_0

    .line 966
    :cond_2
    iget-object v2, v1, Landroid/widget/RelativeLayout$DependencyGraph$Node;->view:Landroid/view/View;

    goto :goto_1

    .end local v1           #node:Landroid/widget/RelativeLayout$DependencyGraph$Node;
    .end local v2           #v:Landroid/view/View;
    :cond_3
    move-object v2, v4

    .line 972
    goto :goto_0
.end method

.method private getRelatedViewBaseline([II)I
    .locals 2
    .parameter "rules"
    .parameter "relation"

    .prologue
    .line 987
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;->getRelatedView([II)Landroid/view/View;

    move-result-object v0

    .line 988
    .local v0, v:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 989
    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v1

    .line 991
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method private getRelatedViewParams([II)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 3
    .parameter "rules"
    .parameter "relation"

    .prologue
    .line 976
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;->getRelatedView([II)Landroid/view/View;

    move-result-object v1

    .line 977
    .local v1, v:Landroid/view/View;
    if-eqz v1, :cond_0

    .line 978
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 979
    .local v0, params:Landroid/view/ViewGroup$LayoutParams;
    instance-of v2, v0, Landroid/widget/RelativeLayout$LayoutParams;

    if-eqz v2, :cond_0

    .line 980
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 983
    .end local v0           #params:Landroid/view/ViewGroup$LayoutParams;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private initFromAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 220
    sget-object v1, Lcom/android/internal/R$styleable;->RelativeLayout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 221
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v1, 0x1

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Landroid/widget/RelativeLayout;->mIgnoreGravity:I

    .line 222
    const/4 v1, 0x0

    iget v2, p0, Landroid/widget/RelativeLayout;->mGravity:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 223
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 224
    return-void
.end method

.method private measureChild(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;II)V
    .locals 11
    .parameter "child"
    .parameter "params"
    .parameter "myWidth"
    .parameter "myHeight"

    .prologue
    .line 656
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v1

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v6, p0, Landroid/view/View;->mPaddingLeft:I

    iget v7, p0, Landroid/view/View;->mPaddingRight:I

    move-object v0, p0

    move v8, p3

    invoke-direct/range {v0 .. v8}, Landroid/widget/RelativeLayout;->getChildMeasureSpec(IIIIIIII)I

    move-result v10

    .line 661
    .local v10, childWidthMeasureSpec:I
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v1

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v6, p0, Landroid/view/View;->mPaddingTop:I

    iget v7, p0, Landroid/view/View;->mPaddingBottom:I

    move-object v0, p0

    move v8, p4

    invoke-direct/range {v0 .. v8}, Landroid/widget/RelativeLayout;->getChildMeasureSpec(IIIIIIII)I

    move-result v9

    .line 666
    .local v9, childHeightMeasureSpec:I
    invoke-virtual {p1, v10, v9}, Landroid/view/View;->measure(II)V

    .line 667
    return-void
.end method

.method private measureChildHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;II)V
    .locals 11
    .parameter "child"
    .parameter "params"
    .parameter "myWidth"
    .parameter "myHeight"

    .prologue
    .line 670
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v1

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    iget v3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v6, p0, Landroid/view/View;->mPaddingLeft:I

    iget v7, p0, Landroid/view/View;->mPaddingRight:I

    move-object v0, p0

    move v8, p3

    invoke-direct/range {v0 .. v8}, Landroid/widget/RelativeLayout;->getChildMeasureSpec(IIIIIIII)I

    move-result v10

    .line 676
    .local v10, childWidthMeasureSpec:I
    iget v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 677
    const/high16 v0, 0x4000

    invoke-static {p4, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 681
    .local v9, childHeightMeasureSpec:I
    :goto_0
    invoke-virtual {p1, v10, v9}, Landroid/view/View;->measure(II)V

    .line 682
    return-void

    .line 679
    .end local v9           #childHeightMeasureSpec:I
    :cond_0
    const/high16 v0, -0x8000

    invoke-static {p4, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .restart local v9       #childHeightMeasureSpec:I
    goto :goto_0
.end method

.method private positionChildHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;IZ)Z
    .locals 5
    .parameter "child"
    .parameter "params"
    .parameter "myWidth"
    .parameter "wrapContent"

    .prologue
    const/4 v2, 0x1

    .line 766
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getLayoutDirection()I

    move-result v0

    .line 767
    .local v0, layoutDirection:I
    invoke-virtual {p2, v0}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object v1

    .line 769
    .local v1, rules:[I
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-gez v3, :cond_1

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-ltz v3, :cond_1

    .line 771
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 797
    :cond_0
    :goto_0
    const/16 v3, 0x15

    aget v3, v1, v3

    if-eqz v3, :cond_7

    :goto_1
    return v2

    .line 772
    :cond_1
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-ltz v3, :cond_2

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-gez v3, :cond_2

    .line 774
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 775
    :cond_2
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-gez v3, :cond_0

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    if-gez v3, :cond_0

    .line 777
    const/16 v3, 0xd

    aget v3, v1, v3

    if-nez v3, :cond_3

    const/16 v3, 0xe

    aget v3, v1, v3

    if-eqz v3, :cond_5

    .line 778
    :cond_3
    if-nez p4, :cond_4

    .line 779
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;->centerHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V

    goto :goto_1

    .line 781
    :cond_4
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 782
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_1

    .line 788
    :cond_5
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->isLayoutRtl()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 789
    iget v3, p0, Landroid/view/View;->mPaddingRight:I

    sub-int v3, p3, v3

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 790
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    sub-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 792
    :cond_6
    iget v3, p0, Landroid/view/View;->mPaddingLeft:I

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 793
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v3, v4

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {p2, v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto/16 :goto_0

    .line 797
    :cond_7
    const/4 v2, 0x0

    goto/16 :goto_1
.end method

.method private positionChildVertical(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;IZ)Z
    .locals 4
    .parameter "child"
    .parameter "params"
    .parameter "myHeight"
    .parameter "wrapContent"

    .prologue
    const/4 v1, 0x1

    .line 803
    invoke-virtual {p2}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v0

    .line 805
    .local v0, rules:[I
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-gez v2, :cond_1

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-ltz v2, :cond_1

    .line 807
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 826
    :cond_0
    :goto_0
    const/16 v2, 0xc

    aget v2, v0, v2

    if-eqz v2, :cond_6

    :goto_1
    return v1

    .line 808
    :cond_1
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-ltz v2, :cond_2

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-gez v2, :cond_2

    .line 810
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 811
    :cond_2
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-gez v2, :cond_0

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    if-gez v2, :cond_0

    .line 813
    const/16 v2, 0xd

    aget v2, v0, v2

    if-nez v2, :cond_3

    const/16 v2, 0xf

    aget v2, v0, v2

    if-eqz v2, :cond_5

    .line 814
    :cond_3
    if-nez p4, :cond_4

    .line 815
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;->centerVertical(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V

    goto :goto_1

    .line 817
    :cond_4
    iget v2, p0, Landroid/view/View;->mPaddingTop:I

    iget v3, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 818
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_1

    .line 822
    :cond_5
    iget v2, p0, Landroid/view/View;->mPaddingTop:I

    iget v3, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 823
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {p2}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v2

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v2, v3

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {p2, v2}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_0

    .line 826
    :cond_6
    const/4 v1, 0x0

    goto :goto_1
.end method

.method private sortChildren()V
    .locals 6

    .prologue
    .line 323
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v1

    .line 324
    .local v1, count:I
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    array-length v4, v4

    if-eq v4, v1, :cond_0

    new-array v4, v1, [Landroid/view/View;

    iput-object v4, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    .line 325
    :cond_0
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    array-length v4, v4

    if-eq v4, v1, :cond_1

    new-array v4, v1, [Landroid/view/View;

    iput-object v4, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    .line 327
    :cond_1
    iget-object v2, p0, Landroid/widget/RelativeLayout;->mGraph:Landroid/widget/RelativeLayout$DependencyGraph;

    .line 328
    .local v2, graph:Landroid/widget/RelativeLayout$DependencyGraph;
    invoke-virtual {v2}, Landroid/widget/RelativeLayout$DependencyGraph;->clear()V

    .line 330
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v1, :cond_2

    .line 331
    invoke-virtual {p0, v3}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 332
    .local v0, child:Landroid/view/View;
    invoke-virtual {v2, v0}, Landroid/widget/RelativeLayout$DependencyGraph;->add(Landroid/view/View;)V

    .line 330
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 342
    .end local v0           #child:Landroid/view/View;
    :cond_2
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    sget-object v5, Landroid/widget/RelativeLayout;->RULES_VERTICAL:[I

    invoke-virtual {v2, v4, v5}, Landroid/widget/RelativeLayout$DependencyGraph;->getSortedViews([Landroid/view/View;[I)V

    .line 343
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    sget-object v5, Landroid/widget/RelativeLayout;->RULES_HORIZONTAL:[I

    invoke-virtual {v2, v4, v5}, Landroid/widget/RelativeLayout$DependencyGraph;->getSortedViews([Landroid/view/View;[I)V

    .line 355
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 1044
    instance-of v0, p1, Landroid/widget/RelativeLayout$LayoutParams;

    return v0
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 7
    .parameter "event"

    .prologue
    .line 1054
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    if-nez v4, :cond_0

    .line 1055
    new-instance v4, Ljava/util/TreeSet;

    new-instance v5, Landroid/widget/RelativeLayout$TopToBottomLeftToRightComparator;

    const/4 v6, 0x0

    invoke-direct {v5, p0, v6}, Landroid/widget/RelativeLayout$TopToBottomLeftToRightComparator;-><init>(Landroid/widget/RelativeLayout;Landroid/widget/RelativeLayout$1;)V

    invoke-direct {v4, v5}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    .line 1059
    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v0

    .local v0, count:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 1060
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    invoke-virtual {p0, v1}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/SortedSet;->add(Ljava/lang/Object;)Z

    .line 1059
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1063
    :cond_1
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    invoke-interface {v4}, Ljava/util/SortedSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    .line 1064
    .local v3, view:Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v3, p1}, Landroid/view/View;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1066
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    invoke-interface {v4}, Ljava/util/SortedSet;->clear()V

    .line 1067
    const/4 v4, 0x1

    .line 1072
    .end local v3           #view:Landroid/view/View;
    :goto_1
    return v4

    .line 1071
    :cond_3
    iget-object v4, p0, Landroid/widget/RelativeLayout;->mTopToBottomLeftToRightSet:Ljava/util/SortedSet;

    invoke-interface {v4}, Ljava/util/SortedSet;->clear()V

    .line 1072
    const/4 v4, 0x0

    goto :goto_1
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x2

    .line 1038
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "x0"

    .prologue
    .line 70
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/RelativeLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 1049
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/RelativeLayout$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 1028
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public getBaseline()I
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/widget/RelativeLayout;->mBaselineView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBaseline()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Landroid/view/ViewGroup;->getBaseline()I

    move-result v0

    goto :goto_0
.end method

.method public getGravity()I
    .locals 1

    .prologue
    .line 258
    iget v0, p0, Landroid/widget/RelativeLayout;->mGravity:I

    return v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 1077
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1078
    const-class v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 1079
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .parameter "info"

    .prologue
    .line 1083
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 1084
    const-class v0, Landroid/widget/RelativeLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1085
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
    .line 1014
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v1

    .line 1016
    .local v1, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    if-ge v2, v1, :cond_1

    .line 1017
    invoke-virtual {p0, v2}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1018
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_0

    .line 1019
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 1021
    .local v3, st:Landroid/widget/RelativeLayout$LayoutParams;
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v5

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v6

    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {v3}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v7

    invoke-virtual {v0, v4, v5, v6, v7}, Landroid/view/View;->layout(IIII)V

    .line 1016
    .end local v3           #st:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1024
    .end local v0           #child:Landroid/view/View;
    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 44
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 361
    move-object/from16 v0, p0

    iget-boolean v4, v0, Landroid/widget/RelativeLayout;->mDirtyHierarchy:Z

    if-eqz v4, :cond_0

    .line 362
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Landroid/widget/RelativeLayout;->mDirtyHierarchy:Z

    .line 363
    invoke-direct/range {p0 .. p0}, Landroid/widget/RelativeLayout;->sortChildren()V

    .line 366
    :cond_0
    const/16 v29, -0x1

    .line 367
    .local v29, myWidth:I
    const/16 v28, -0x1

    .line 369
    .local v28, myHeight:I
    const/16 v40, 0x0

    .line 370
    .local v40, width:I
    const/16 v18, 0x0

    .line 372
    .local v18, height:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v41

    .line 373
    .local v41, widthMode:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v19

    .line 374
    .local v19, heightMode:I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v42

    .line 375
    .local v42, widthSize:I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v20

    .line 378
    .local v20, heightSize:I
    if-eqz v41, :cond_1

    .line 379
    move/from16 v29, v42

    .line 382
    :cond_1
    if-eqz v19, :cond_2

    .line 383
    move/from16 v28, v20

    .line 386
    :cond_2
    const/high16 v4, 0x4000

    move/from16 v0, v41

    if-ne v0, v4, :cond_3

    .line 387
    move/from16 v40, v29

    .line 390
    :cond_3
    const/high16 v4, 0x4000

    move/from16 v0, v19

    if-ne v0, v4, :cond_4

    .line 391
    move/from16 v18, v28

    .line 394
    :cond_4
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-boolean v4, v0, Landroid/widget/RelativeLayout;->mHasBaselineAlignedChild:Z

    .line 396
    const/16 v24, 0x0

    .line 397
    .local v24, ignore:Landroid/view/View;
    move-object/from16 v0, p0

    iget v4, v0, Landroid/widget/RelativeLayout;->mGravity:I

    const v5, 0x800007

    and-int v17, v4, v5

    .line 398
    .local v17, gravity:I
    const v4, 0x800003

    move/from16 v0, v17

    if-eq v0, v4, :cond_9

    if-eqz v17, :cond_9

    const/16 v21, 0x1

    .line 399
    .local v21, horizontalGravity:Z
    :goto_0
    move-object/from16 v0, p0

    iget v4, v0, Landroid/widget/RelativeLayout;->mGravity:I

    and-int/lit8 v17, v4, 0x70

    .line 400
    const/16 v4, 0x30

    move/from16 v0, v17

    if-eq v0, v4, :cond_a

    if-eqz v17, :cond_a

    const/16 v36, 0x1

    .line 402
    .local v36, verticalGravity:Z
    :goto_1
    const v27, 0x7fffffff

    .line 403
    .local v27, left:I
    const v35, 0x7fffffff

    .line 404
    .local v35, top:I
    const/high16 v33, -0x8000

    .line 405
    .local v33, right:I
    const/high16 v10, -0x8000

    .line 407
    .local v10, bottom:I
    const/16 v30, 0x0

    .line 408
    .local v30, offsetHorizontalAxis:Z
    const/16 v31, 0x0

    .line 410
    .local v31, offsetVerticalAxis:Z
    if-nez v21, :cond_5

    if-eqz v36, :cond_6

    :cond_5
    move-object/from16 v0, p0

    iget v4, v0, Landroid/widget/RelativeLayout;->mIgnoreGravity:I

    const/4 v5, -0x1

    if-eq v4, v5, :cond_6

    .line 411
    move-object/from16 v0, p0

    iget v4, v0, Landroid/widget/RelativeLayout;->mIgnoreGravity:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v24

    .line 414
    :cond_6
    const/high16 v4, 0x4000

    move/from16 v0, v41

    if-eq v0, v4, :cond_b

    const/16 v26, 0x1

    .line 415
    .local v26, isWrapContentWidth:Z
    :goto_2
    const/high16 v4, 0x4000

    move/from16 v0, v19

    if-eq v0, v4, :cond_c

    const/16 v25, 0x1

    .line 417
    .local v25, isWrapContentHeight:Z
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/RelativeLayout;->mSortedHorizontalChildren:[Landroid/view/View;

    move-object/from16 v38, v0

    .line 418
    .local v38, views:[Landroid/view/View;
    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v16, v0

    .line 421
    .local v16, count:I
    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->isLayoutRtl()Z

    move-result v4

    if-eqz v4, :cond_f

    const/4 v4, -0x1

    move/from16 v0, v29

    if-eq v0, v4, :cond_7

    if-eqz v26, :cond_f

    .line 422
    :cond_7
    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->getPaddingStart()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->getPaddingEnd()I

    move-result v5

    add-int v39, v4, v5

    .line 423
    .local v39, w:I
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v15

    .line 424
    .local v15, childWidthMeasureSpec:I
    const/16 v23, 0x0

    .local v23, i:I
    :goto_4
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_e

    .line 425
    aget-object v11, v38, v23

    .line 426
    .local v11, child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_8

    .line 427
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 432
    .local v32, params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, v32

    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_d

    .line 433
    const/high16 v4, 0x4000

    move/from16 v0, v28

    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 437
    .local v13, childHeightMeasureSpec:I
    :goto_5
    invoke-virtual {v11, v15, v13}, Landroid/view/View;->measure(II)V

    .line 439
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int v39, v39, v4

    .line 440
    move-object/from16 v0, v32

    iget v4, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    add-int v39, v39, v4

    .line 424
    .end local v13           #childHeightMeasureSpec:I
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_8
    add-int/lit8 v23, v23, 0x1

    goto :goto_4

    .line 398
    .end local v10           #bottom:I
    .end local v11           #child:Landroid/view/View;
    .end local v15           #childWidthMeasureSpec:I
    .end local v16           #count:I
    .end local v21           #horizontalGravity:Z
    .end local v23           #i:I
    .end local v25           #isWrapContentHeight:Z
    .end local v26           #isWrapContentWidth:Z
    .end local v27           #left:I
    .end local v30           #offsetHorizontalAxis:Z
    .end local v31           #offsetVerticalAxis:Z
    .end local v33           #right:I
    .end local v35           #top:I
    .end local v36           #verticalGravity:Z
    .end local v38           #views:[Landroid/view/View;
    .end local v39           #w:I
    :cond_9
    const/16 v21, 0x0

    goto/16 :goto_0

    .line 400
    .restart local v21       #horizontalGravity:Z
    :cond_a
    const/16 v36, 0x0

    goto/16 :goto_1

    .line 414
    .restart local v10       #bottom:I
    .restart local v27       #left:I
    .restart local v30       #offsetHorizontalAxis:Z
    .restart local v31       #offsetVerticalAxis:Z
    .restart local v33       #right:I
    .restart local v35       #top:I
    .restart local v36       #verticalGravity:Z
    :cond_b
    const/16 v26, 0x0

    goto :goto_2

    .line 415
    .restart local v26       #isWrapContentWidth:Z
    :cond_c
    const/16 v25, 0x0

    goto :goto_3

    .line 435
    .restart local v11       #child:Landroid/view/View;
    .restart local v15       #childWidthMeasureSpec:I
    .restart local v16       #count:I
    .restart local v23       #i:I
    .restart local v25       #isWrapContentHeight:Z
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v38       #views:[Landroid/view/View;
    .restart local v39       #w:I
    :cond_d
    const/high16 v4, -0x8000

    move/from16 v0, v28

    invoke-static {v0, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .restart local v13       #childHeightMeasureSpec:I
    goto :goto_5

    .line 443
    .end local v11           #child:Landroid/view/View;
    .end local v13           #childHeightMeasureSpec:I
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_e
    const/4 v4, -0x1

    move/from16 v0, v29

    if-ne v0, v4, :cond_11

    .line 445
    move/from16 v29, v39

    .line 455
    .end local v15           #childWidthMeasureSpec:I
    .end local v23           #i:I
    .end local v39           #w:I
    :cond_f
    :goto_6
    const/16 v23, 0x0

    .restart local v23       #i:I
    :goto_7
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_12

    .line 456
    aget-object v11, v38, v23

    .line 457
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_10

    .line 458
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 460
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v29

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout;->applyHorizontalSizeRules(Landroid/widget/RelativeLayout$LayoutParams;I)V

    .line 461
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v29

    move/from16 v3, v28

    invoke-direct {v0, v11, v1, v2, v3}, Landroid/widget/RelativeLayout;->measureChildHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;II)V

    .line 462
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v29

    move/from16 v3, v26

    invoke-direct {v0, v11, v1, v2, v3}, Landroid/widget/RelativeLayout;->positionChildHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;IZ)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 463
    const/16 v30, 0x1

    .line 455
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_10
    add-int/lit8 v23, v23, 0x1

    goto :goto_7

    .line 449
    .end local v11           #child:Landroid/view/View;
    .restart local v15       #childWidthMeasureSpec:I
    .restart local v39       #w:I
    :cond_11
    if-lez v39, :cond_f

    .line 450
    move/from16 v0, v29

    move/from16 v1, v39

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v29

    goto :goto_6

    .line 468
    .end local v15           #childWidthMeasureSpec:I
    .end local v39           #w:I
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/widget/RelativeLayout;->mSortedVerticalChildren:[Landroid/view/View;

    move-object/from16 v38, v0

    .line 469
    move-object/from16 v0, v38

    array-length v0, v0

    move/from16 v16, v0

    .line 471
    const/16 v23, 0x0

    :goto_8
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_1a

    .line 472
    aget-object v11, v38, v23

    .line 473
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_19

    .line 474
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 476
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v28

    invoke-direct {v0, v1, v2}, Landroid/widget/RelativeLayout;->applyVerticalSizeRules(Landroid/widget/RelativeLayout$LayoutParams;I)V

    .line 477
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v29

    move/from16 v3, v28

    invoke-direct {v0, v11, v1, v2, v3}, Landroid/widget/RelativeLayout;->measureChild(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;II)V

    .line 478
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v28

    move/from16 v3, v25

    invoke-direct {v0, v11, v1, v2, v3}, Landroid/widget/RelativeLayout;->positionChildVertical(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;IZ)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 479
    const/16 v31, 0x1

    .line 482
    :cond_13
    if-eqz v26, :cond_14

    .line 483
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move/from16 v0, v40

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v40

    .line 486
    :cond_14
    if-eqz v25, :cond_15

    .line 487
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move/from16 v0, v18

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 490
    :cond_15
    move-object/from16 v0, v24

    if-ne v11, v0, :cond_16

    if-eqz v36, :cond_17

    .line 491
    :cond_16
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    move/from16 v0, v27

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v27

    .line 492
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    move/from16 v0, v35

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v35

    .line 495
    :cond_17
    move-object/from16 v0, v24

    if-ne v11, v0, :cond_18

    if-eqz v21, :cond_19

    .line 496
    :cond_18
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    move/from16 v0, v33

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v33

    .line 497
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v4, v5

    invoke-static {v10, v4}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 471
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_19
    add-int/lit8 v23, v23, 0x1

    goto/16 :goto_8

    .line 502
    .end local v11           #child:Landroid/view/View;
    :cond_1a
    move-object/from16 v0, p0

    iget-boolean v4, v0, Landroid/widget/RelativeLayout;->mHasBaselineAlignedChild:Z

    if-eqz v4, :cond_1f

    .line 503
    const/16 v23, 0x0

    :goto_9
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_1f

    .line 504
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 505
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_1e

    .line 506
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 507
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    invoke-direct {v0, v11, v1}, Landroid/widget/RelativeLayout;->alignBaseline(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;)V

    .line 509
    move-object/from16 v0, v24

    if-ne v11, v0, :cond_1b

    if-eqz v36, :cond_1c

    .line 510
    :cond_1b
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int/2addr v4, v5

    move/from16 v0, v27

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v27

    .line 511
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    move/from16 v0, v35

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v35

    .line 514
    :cond_1c
    move-object/from16 v0, v24

    if-ne v11, v0, :cond_1d

    if-eqz v21, :cond_1e

    .line 515
    :cond_1d
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$100(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v4, v5

    move/from16 v0, v33

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v33

    .line 516
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$200(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    move-object/from16 v0, v32

    iget v5, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v4, v5

    invoke-static {v10, v4}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 503
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_1e
    add-int/lit8 v23, v23, 0x1

    goto :goto_9

    .line 522
    .end local v11           #child:Landroid/view/View;
    :cond_1f
    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->getLayoutDirection()I

    move-result v9

    .line 524
    .local v9, layoutDirection:I
    if-eqz v26, :cond_24

    .line 527
    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/View;->mPaddingRight:I

    add-int v40, v40, v4

    .line 529
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/view/View;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ltz v4, :cond_20

    .line 530
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/view/View;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v0, v40

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v40

    .line 533
    :cond_20
    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->getSuggestedMinimumWidth()I

    move-result v4

    move/from16 v0, v40

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v40

    .line 534
    move/from16 v0, v40

    move/from16 v1, p1

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout;->resolveSize(II)I

    move-result v40

    .line 536
    if-eqz v30, :cond_24

    .line 537
    const/16 v23, 0x0

    :goto_a
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_24

    .line 538
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 539
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_22

    .line 540
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 541
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, v32

    invoke-virtual {v0, v9}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object v34

    .line 542
    .local v34, rules:[I
    const/16 v4, 0xd

    aget v4, v34, v4

    if-nez v4, :cond_21

    const/16 v4, 0xe

    aget v4, v34, v4

    if-eqz v4, :cond_23

    .line 543
    :cond_21
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v40

    invoke-direct {v0, v11, v1, v2}, Landroid/widget/RelativeLayout;->centerHorizontal(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V

    .line 537
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34           #rules:[I
    :cond_22
    :goto_b
    add-int/lit8 v23, v23, 0x1

    goto :goto_a

    .line 544
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v34       #rules:[I
    :cond_23
    const/16 v4, 0xb

    aget v4, v34, v4

    if-eqz v4, :cond_22

    .line 545
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredWidth()I

    move-result v14

    .line 546
    .local v14, childWidth:I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/View;->mPaddingRight:I

    sub-int v4, v40, v4

    sub-int/2addr v4, v14

    move-object/from16 v0, v32

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->access$302(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 547
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mLeft:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$300(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    add-int/2addr v4, v14

    move-object/from16 v0, v32

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mRight:I
    invoke-static {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->access$102(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_b

    .line 554
    .end local v11           #child:Landroid/view/View;
    .end local v14           #childWidth:I
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34           #rules:[I
    :cond_24
    if-eqz v25, :cond_29

    .line 557
    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/View;->mPaddingBottom:I

    add-int v18, v18, v4

    .line 559
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/view/View;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-ltz v4, :cond_25

    .line 560
    move-object/from16 v0, p0

    iget-object v4, v0, Landroid/view/View;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget v4, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v0, v18

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 563
    :cond_25
    invoke-virtual/range {p0 .. p0}, Landroid/widget/RelativeLayout;->getSuggestedMinimumHeight()I

    move-result v4

    move/from16 v0, v18

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v18

    .line 564
    move/from16 v0, v18

    move/from16 v1, p2

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout;->resolveSize(II)I

    move-result v18

    .line 566
    if-eqz v31, :cond_29

    .line 567
    const/16 v23, 0x0

    :goto_c
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_29

    .line 568
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 569
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_27

    .line 570
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 571
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    move-object/from16 v0, v32

    invoke-virtual {v0, v9}, Landroid/widget/RelativeLayout$LayoutParams;->getRules(I)[I

    move-result-object v34

    .line 572
    .restart local v34       #rules:[I
    const/16 v4, 0xd

    aget v4, v34, v4

    if-nez v4, :cond_26

    const/16 v4, 0xf

    aget v4, v34, v4

    if-eqz v4, :cond_28

    .line 573
    :cond_26
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move/from16 v2, v18

    invoke-direct {v0, v11, v1, v2}, Landroid/widget/RelativeLayout;->centerVertical(Landroid/view/View;Landroid/widget/RelativeLayout$LayoutParams;I)V

    .line 567
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34           #rules:[I
    :cond_27
    :goto_d
    add-int/lit8 v23, v23, 0x1

    goto :goto_c

    .line 574
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v34       #rules:[I
    :cond_28
    const/16 v4, 0xc

    aget v4, v34, v4

    if-eqz v4, :cond_27

    .line 575
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v12

    .line 576
    .local v12, childHeight:I
    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/View;->mPaddingBottom:I

    sub-int v4, v18, v4

    sub-int/2addr v4, v12

    move-object/from16 v0, v32

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->access$402(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 577
    #getter for: Landroid/widget/RelativeLayout$LayoutParams;->mTop:I
    invoke-static/range {v32 .. v32}, Landroid/widget/RelativeLayout$LayoutParams;->access$400(Landroid/widget/RelativeLayout$LayoutParams;)I

    move-result v4

    add-int/2addr v4, v12

    move-object/from16 v0, v32

    #setter for: Landroid/widget/RelativeLayout$LayoutParams;->mBottom:I
    invoke-static {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->access$202(Landroid/widget/RelativeLayout$LayoutParams;I)I

    goto :goto_d

    .line 584
    .end local v11           #child:Landroid/view/View;
    .end local v12           #childHeight:I
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    .end local v34           #rules:[I
    :cond_29
    if-nez v21, :cond_2a

    if-eqz v36, :cond_2e

    .line 585
    :cond_2a
    move-object/from16 v0, p0

    iget-object v7, v0, Landroid/widget/RelativeLayout;->mSelfBounds:Landroid/graphics/Rect;

    .line 586
    .local v7, selfBounds:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget v4, v0, Landroid/view/View;->mPaddingLeft:I

    move-object/from16 v0, p0

    iget v5, v0, Landroid/view/View;->mPaddingTop:I

    move-object/from16 v0, p0

    iget v6, v0, Landroid/view/View;->mPaddingRight:I

    sub-int v6, v40, v6

    move-object/from16 v0, p0

    iget v0, v0, Landroid/view/View;->mPaddingBottom:I

    move/from16 v43, v0

    sub-int v43, v18, v43

    move/from16 v0, v43

    invoke-virtual {v7, v4, v5, v6, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 589
    move-object/from16 v0, p0

    iget-object v8, v0, Landroid/widget/RelativeLayout;->mContentBounds:Landroid/graphics/Rect;

    .line 590
    .local v8, contentBounds:Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget v4, v0, Landroid/widget/RelativeLayout;->mGravity:I

    sub-int v5, v33, v27

    sub-int v6, v10, v35

    invoke-static/range {v4 .. v9}, Landroid/view/Gravity;->apply(IIILandroid/graphics/Rect;Landroid/graphics/Rect;I)V

    .line 593
    iget v4, v8, Landroid/graphics/Rect;->left:I

    sub-int v22, v4, v27

    .line 594
    .local v22, horizontalOffset:I
    iget v4, v8, Landroid/graphics/Rect;->top:I

    sub-int v37, v4, v35

    .line 595
    .local v37, verticalOffset:I
    if-nez v22, :cond_2b

    if-eqz v37, :cond_2e

    .line 596
    :cond_2b
    const/16 v23, 0x0

    :goto_e
    move/from16 v0, v23

    move/from16 v1, v16

    if-ge v0, v1, :cond_2e

    .line 597
    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 598
    .restart local v11       #child:Landroid/view/View;
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_2d

    move-object/from16 v0, v24

    if-eq v11, v0, :cond_2d

    .line 599
    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v32

    check-cast v32, Landroid/widget/RelativeLayout$LayoutParams;

    .line 600
    .restart local v32       #params:Landroid/widget/RelativeLayout$LayoutParams;
    if-eqz v21, :cond_2c

    .line 601
    move-object/from16 v0, v32

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$312(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 602
    move-object/from16 v0, v32

    move/from16 v1, v22

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$112(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 604
    :cond_2c
    if-eqz v36, :cond_2d

    .line 605
    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$412(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 606
    move-object/from16 v0, v32

    move/from16 v1, v37

    invoke-static {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->access$212(Landroid/widget/RelativeLayout$LayoutParams;I)I

    .line 596
    .end local v32           #params:Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2d
    add-int/lit8 v23, v23, 0x1

    goto :goto_e

    .line 613
    .end local v7           #selfBounds:Landroid/graphics/Rect;
    .end local v8           #contentBounds:Landroid/graphics/Rect;
    .end local v11           #child:Landroid/view/View;
    .end local v22           #horizontalOffset:I
    .end local v37           #verticalOffset:I
    :cond_2e
    move-object/from16 v0, p0

    move/from16 v1, v40

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Landroid/widget/RelativeLayout;->setMeasuredDimension(II)V

    .line 614
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .prologue
    .line 318
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 319
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/widget/RelativeLayout;->mDirtyHierarchy:Z

    .line 320
    return-void
.end method

.method public setGravity(I)V
    .locals 1
    .parameter "gravity"
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 279
    iget v0, p0, Landroid/widget/RelativeLayout;->mGravity:I

    if-eq v0, p1, :cond_2

    .line 280
    const v0, 0x800007

    and-int/2addr v0, p1

    if-nez v0, :cond_0

    .line 281
    const v0, 0x800003

    or-int/2addr p1, v0

    .line 284
    :cond_0
    and-int/lit8 v0, p1, 0x70

    if-nez v0, :cond_1

    .line 285
    or-int/lit8 p1, p1, 0x30

    .line 288
    :cond_1
    iput p1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 289
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->requestLayout()V

    .line 291
    :cond_2
    return-void
.end method

.method public setHorizontalGravity(I)V
    .locals 3
    .parameter "horizontalGravity"
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    const v2, 0x800007

    .line 295
    and-int v0, p1, v2

    .line 296
    .local v0, gravity:I
    iget v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    and-int/2addr v1, v2

    if-eq v1, v0, :cond_0

    .line 297
    iget v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    const v2, -0x800008

    and-int/2addr v1, v2

    or-int/2addr v1, v0

    iput v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 298
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->requestLayout()V

    .line 300
    :cond_0
    return-void
.end method

.method public setIgnoreGravity(I)V
    .locals 0
    .parameter "viewId"
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 244
    iput p1, p0, Landroid/widget/RelativeLayout;->mIgnoreGravity:I

    .line 245
    return-void
.end method

.method public setVerticalGravity(I)V
    .locals 2
    .parameter "verticalGravity"
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 304
    and-int/lit8 v0, p1, 0x70

    .line 305
    .local v0, gravity:I
    iget v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    and-int/lit8 v1, v1, 0x70

    if-eq v1, v0, :cond_0

    .line 306
    iget v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    and-int/lit8 v1, v1, -0x71

    or-int/2addr v1, v0

    iput v1, p0, Landroid/widget/RelativeLayout;->mGravity:I

    .line 307
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->requestLayout()V

    .line 309
    :cond_0
    return-void
.end method

.method public shouldDelayChildPressedState()Z
    .locals 1

    .prologue
    .line 228
    const/4 v0, 0x0

    return v0
.end method
