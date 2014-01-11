.class public Lcom/android/settings/applications/CustomizedScrollView;
.super Landroid/widget/ScrollView;
.source "CustomizedScrollView.java"


# instance fields
.field private final mOverscrollDistance:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    iget-object v1, p0, Lcom/android/settings/applications/CustomizedScrollView;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 23
    .local v0, configuration:Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledOverscrollDistance()I

    move-result v1

    iput v1, p0, Lcom/android/settings/applications/CustomizedScrollView;->mOverscrollDistance:I

    .line 24
    return-void
.end method

.method private clamp(III)I
    .locals 1
    .parameter "n"
    .parameter "my"
    .parameter "child"

    .prologue
    .line 59
    if-ge p2, p3, :cond_0

    if-gez p1, :cond_2

    .line 60
    :cond_0
    const/4 p1, 0x0

    .line 65
    .end local p1
    :cond_1
    :goto_0
    return p1

    .line 62
    .restart local p1
    :cond_2
    add-int v0, p2, p1

    if-le v0, p3, :cond_1

    .line 63
    sub-int p1, p3, p2

    goto :goto_0
.end method

.method private getScrollRange()I
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 48
    const/4 v1, 0x0

    .line 49
    .local v1, scrollRange:I
    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 50
    invoke-virtual {p0, v5}, Lcom/android/settings/applications/CustomizedScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 51
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingBottom:I

    sub-int/2addr v3, v4

    iget v4, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingTop:I

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 54
    .end local v0           #child:Landroid/view/View;
    :cond_0
    return v1
.end method


# virtual methods
.method public scrollTo(II)V
    .locals 8
    .parameter "x"
    .parameter "y"

    .prologue
    const/4 v6, 0x1

    const/4 v0, 0x0

    .line 29
    move v4, p1

    .line 30
    .local v4, x1:I
    move v5, p2

    .line 31
    .local v5, y1:I
    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getChildCount()I

    move-result v7

    if-lez v7, :cond_5

    .line 32
    invoke-virtual {p0, v0}, Lcom/android/settings/applications/CustomizedScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 33
    .local v1, child:Landroid/view/View;
    invoke-direct {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getScrollRange()I

    move-result v3

    .line 34
    .local v3, range:I
    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getOverScrollMode()I

    move-result v2

    .line 35
    .local v2, overscrollMode:I
    if-eqz v2, :cond_0

    if-ne v2, v6, :cond_1

    if-lez v3, :cond_1

    :cond_0
    move v0, v6

    .line 37
    .local v0, canOverscroll:Z
    :cond_1
    if-eqz v0, :cond_2

    iget v6, p0, Lcom/android/settings/applications/CustomizedScrollView;->mOverscrollDistance:I

    if-gtz v6, :cond_3

    .line 38
    :cond_2
    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getWidth()I

    move-result v6

    iget v7, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingRight:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingLeft:I

    sub-int/2addr v6, v7

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v7

    invoke-direct {p0, v4, v6, v7}, Lcom/android/settings/applications/CustomizedScrollView;->clamp(III)I

    move-result v4

    .line 39
    invoke-virtual {p0}, Lcom/android/settings/applications/CustomizedScrollView;->getHeight()I

    move-result v6

    iget v7, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingBottom:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/settings/applications/CustomizedScrollView;->mPaddingTop:I

    sub-int/2addr v6, v7

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v7

    invoke-direct {p0, v5, v6, v7}, Lcom/android/settings/applications/CustomizedScrollView;->clamp(III)I

    move-result v5

    .line 41
    :cond_3
    iget v6, p0, Lcom/android/settings/applications/CustomizedScrollView;->mScrollX:I

    if-ne v4, v6, :cond_4

    iget v6, p0, Lcom/android/settings/applications/CustomizedScrollView;->mScrollY:I

    if-eq v5, v6, :cond_5

    .line 42
    :cond_4
    invoke-super {p0, v4, v5}, Landroid/widget/ScrollView;->scrollTo(II)V

    .line 45
    .end local v0           #canOverscroll:Z
    .end local v1           #child:Landroid/view/View;
    .end local v2           #overscrollMode:I
    .end local v3           #range:I
    :cond_5
    return-void
.end method
