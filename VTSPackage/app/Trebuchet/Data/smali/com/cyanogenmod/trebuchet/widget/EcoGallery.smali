.class public Lcom/cyanogenmod/trebuchet/widget/EcoGallery;
.super Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;
.source "EcoGallery.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;,
        Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = null

.field private static final SCROLL_TO_FLING_UNCERTAINTY_TIMEOUT:I = 0xfa

.field private static final TAG:Ljava/lang/String; = "Gallery"

.field private static final localLOGV:Z


# instance fields
.field private mAnimationDuration:I

.field private mContextMenuInfo:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;

.field private mDisableSuppressSelectionChangedRunnable:Ljava/lang/Runnable;

.field private mDownTouchPosition:I

.field private mDownTouchView:Landroid/view/View;

.field private mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGravity:I

.field private mIsFirstScroll:Z

.field private mLeftMost:I

.field private mReceivedInvokeKeyDown:Z

.field private mRightMost:I

.field private mSelectedChild:Landroid/view/View;

.field private mShouldCallbackDuringFling:Z

.field private mShouldCallbackOnUnselectedItemClick:Z

.field private mShouldStopFling:Z

.field private mSpacing:I

.field private mSuppressSelectionChanged:Z

.field private mUnselectedAlpha:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x0

    sput-object v0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 158
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 159
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 162
    const v0, 0x7f010045

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 163
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v8, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 166
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    iput v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpacing:I

    .line 62
    const/16 v5, 0xc8

    iput v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAnimationDuration:I

    .line 99
    new-instance v5, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    invoke-direct {v5, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;-><init>(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    .line 105
    new-instance v5, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;

    invoke-direct {v5, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$1;-><init>(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDisableSuppressSelectionChangedRunnable:Ljava/lang/Runnable;

    .line 129
    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackDuringFling:Z

    .line 134
    iput-boolean v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackOnUnselectedItemClick:Z

    .line 168
    new-instance v5, Landroid/view/GestureDetector;

    invoke-direct {v5, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGestureDetector:Landroid/view/GestureDetector;

    .line 169
    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v5, v7}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    .line 171
    sget-object v5, Lcom/cyanogenmod/trebuchet/R$styleable;->EcoGallery:[I

    invoke-virtual {p1, p2, v5, p3, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 174
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v6, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    .line 175
    .local v2, index:I
    if-ltz v2, :cond_0

    .line 176
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setGravity(I)V

    .line 179
    :cond_0
    invoke-virtual {v0, v7, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 181
    .local v1, animationDuration:I
    if-lez v1, :cond_1

    .line 182
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setAnimationDuration(I)V

    .line 185
    :cond_1
    const/4 v5, 0x3

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    .line 187
    .local v3, spacing:I
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setSpacing(I)V

    .line 189
    const/4 v5, 0x2

    const/high16 v6, 0x3f00

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v4

    .line 191
    .local v4, unselectedAlpha:F
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setUnselectedAlpha(F)V

    .line 193
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 197
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGroupFlags:I

    or-int/lit16 v5, v5, 0x400

    iput v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGroupFlags:I

    .line 198
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGroupFlags:I

    or-int/lit16 v5, v5, 0x800

    iput v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGroupFlags:I

    .line 199
    return-void
.end method

.method static synthetic access$002(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    return p1
.end method

.method static synthetic access$300(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchUnpress()V

    return-void
.end method

.method static synthetic access$400(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)I
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAnimationDuration:I

    return v0
.end method

.method static synthetic access$500(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollIntoSlots()V

    return-void
.end method

.method static synthetic access$600(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 39
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z

    return v0
.end method

.method static synthetic access$602(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z

    return p1
.end method

.method static synthetic access$702(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 39
    iput p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    return p1
.end method

.method private calculateTop(Landroid/view/View;Z)I
    .locals 6
    .parameter "child"
    .parameter "duringLayout"

    .prologue
    .line 778
    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getMeasuredHeight()I

    move-result v3

    .line 779
    .local v3, myHeight:I
    :goto_0
    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    .line 781
    .local v1, childHeight:I
    :goto_1
    const/4 v2, 0x0

    .line 783
    .local v2, childTop:I
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGravity:I

    sparse-switch v4, :sswitch_data_0

    .line 796
    :goto_2
    return v2

    .line 778
    .end local v1           #childHeight:I
    .end local v2           #childTop:I
    .end local v3           #myHeight:I
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getHeight()I

    move-result v3

    goto :goto_0

    .line 779
    .restart local v3       #myHeight:I
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    goto :goto_1

    .line 785
    .restart local v1       #childHeight:I
    .restart local v2       #childTop:I
    :sswitch_0
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v2, v4, Landroid/graphics/Rect;->top:I

    .line 786
    goto :goto_2

    .line 788
    :sswitch_1
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v3, v4

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    sub-int v0, v4, v1

    .line 790
    .local v0, availableSpace:I
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    div-int/lit8 v5, v0, 0x2

    add-int v2, v4, v5

    .line 791
    goto :goto_2

    .line 793
    .end local v0           #availableSpace:I
    :sswitch_2
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v3, v4

    sub-int v2, v4, v1

    goto :goto_2

    .line 783
    nop

    :sswitch_data_0
    .sparse-switch
        0x10 -> :sswitch_1
        0x30 -> :sswitch_0
        0x50 -> :sswitch_2
    .end sparse-switch
.end method

.method private detachOffScreenChildren(Z)V
    .locals 10
    .parameter "toLeft"

    .prologue
    .line 436
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v6

    .line 437
    .local v6, numChildren:I
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    .line 438
    .local v2, firstPosition:I
    const/4 v7, 0x0

    .line 439
    .local v7, start:I
    const/4 v1, 0x0

    .line 441
    .local v1, count:I
    if-eqz p1, :cond_3

    .line 442
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v3

    .line 443
    .local v3, galleryLeft:I
    const/4 v5, 0x0

    .local v5, i:I
    :goto_0
    if-ge v5, v6, :cond_0

    .line 444
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 445
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v8

    if-lt v8, v3, :cond_2

    .line 466
    .end local v0           #child:Landroid/view/View;
    .end local v3           #galleryLeft:I
    :cond_0
    invoke-virtual {p0, v7, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->detachViewsFromParent(II)V

    .line 468
    if-eqz p1, :cond_1

    .line 469
    iget v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    add-int/2addr v8, v1

    iput v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    .line 471
    :cond_1
    return-void

    .line 448
    .restart local v0       #child:Landroid/view/View;
    .restart local v3       #galleryLeft:I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 449
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->add(Landroid/view/View;)V

    .line 443
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 453
    .end local v0           #child:Landroid/view/View;
    .end local v3           #galleryLeft:I
    .end local v5           #i:I
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getWidth()I

    move-result v8

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v9

    sub-int v4, v8, v9

    .line 454
    .local v4, galleryRight:I
    add-int/lit8 v5, v6, -0x1

    .restart local v5       #i:I
    :goto_1
    if-ltz v5, :cond_0

    .line 455
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 456
    .restart local v0       #child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v8

    if-le v8, v4, :cond_0

    .line 459
    move v7, v5

    .line 460
    add-int/lit8 v1, v1, 0x1

    .line 461
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-virtual {v8, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->add(Landroid/view/View;)V

    .line 454
    add-int/lit8 v5, v5, -0x1

    goto :goto_1
.end method

.method private dispatchLongPress(Landroid/view/View;IJ)Z
    .locals 7
    .parameter "view"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 1032
    const/4 v6, 0x0

    .line 1034
    .local v6, handled:Z
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mOnItemLongClickListener:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$OnItemLongClickListener;

    if-eqz v0, :cond_0

    .line 1035
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mOnItemLongClickListener:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$OnItemLongClickListener;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchView:Landroid/view/View;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    move-object v1, p0

    move-wide v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$OnItemLongClickListener;->onItemLongClick(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;Landroid/view/View;IJ)Z

    move-result v6

    .line 1039
    :cond_0
    if-nez v6, :cond_1

    .line 1040
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;-><init>(Landroid/view/View;IJ)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mContextMenuInfo:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;

    .line 1041
    invoke-super {p0, p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->showContextMenuForChild(Landroid/view/View;)Z

    move-result v6

    .line 1044
    :cond_1
    if-eqz v6, :cond_2

    .line 1045
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->performHapticFeedback(I)Z

    .line 1048
    :cond_2
    return v6
.end method

.method private dispatchPress(Landroid/view/View;)V
    .locals 1
    .parameter "child"

    .prologue
    const/4 v0, 0x1

    .line 968
    if-eqz p1, :cond_0

    .line 969
    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    .line 972
    :cond_0
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setPressed(Z)V

    .line 973
    return-void
.end method

.method private dispatchUnpress()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 977
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 978
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 977
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 981
    :cond_0
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setPressed(Z)V

    .line 982
    return-void
.end method

.method private fillToGalleryLeft()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 626
    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpacing:I

    .line 627
    .local v3, itemSpacing:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v2

    .line 630
    .local v2, galleryLeft:I
    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 634
    .local v4, prevIterationView:Landroid/view/View;
    if-eqz v4, :cond_0

    .line 635
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    add-int/lit8 v0, v5, -0x1

    .line 636
    .local v0, curPosition:I
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int v1, v5, v3

    .line 644
    .local v1, curRightEdge:I
    :goto_0
    if-le v1, v2, :cond_1

    if-ltz v0, :cond_1

    .line 645
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    sub-int v5, v0, v5

    invoke-direct {p0, v0, v5, v1, v7}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v4

    .line 649
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    .line 652
    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int v1, v5, v3

    .line 653
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 639
    .end local v0           #curPosition:I
    .end local v1           #curRightEdge:I
    :cond_0
    const/4 v0, 0x0

    .line 640
    .restart local v0       #curPosition:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getRight()I

    move-result v5

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getLeft()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v6

    sub-int v1, v5, v6

    .line 641
    .restart local v1       #curRightEdge:I
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z

    goto :goto_0

    .line 655
    :cond_1
    return-void
.end method

.method private fillToGalleryRight()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    .line 658
    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpacing:I

    .line 659
    .local v3, itemSpacing:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getRight()I

    move-result v7

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getLeft()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v8

    sub-int v2, v7, v8

    .line 660
    .local v2, galleryRight:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v4

    .line 661
    .local v4, numChildren:I
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    .line 664
    .local v5, numItems:I
    add-int/lit8 v7, v4, -0x1

    invoke-virtual {p0, v7}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 668
    .local v6, prevIterationView:Landroid/view/View;
    if-eqz v6, :cond_0

    .line 669
    iget v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    add-int v1, v7, v4

    .line 670
    .local v1, curPosition:I
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v7

    add-int v0, v7, v3

    .line 677
    .local v0, curLeftEdge:I
    :goto_0
    if-ge v0, v2, :cond_1

    if-ge v1, v5, :cond_1

    .line 678
    iget v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    sub-int v7, v1, v7

    invoke-direct {p0, v1, v7, v0, v9}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v6

    .line 682
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v7

    add-int v0, v7, v3

    .line 683
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 672
    .end local v0           #curLeftEdge:I
    .end local v1           #curPosition:I
    :cond_0
    iget v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    add-int/lit8 v1, v7, -0x1

    .restart local v1       #curPosition:I
    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    .line 673
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v0

    .line 674
    .restart local v0       #curLeftEdge:I
    iput-boolean v9, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldStopFling:Z

    goto :goto_0

    .line 685
    :cond_1
    return-void
.end method

.method private getCenterOfGallery()I
    .locals 3

    .prologue
    .line 418
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingLeft()I

    move-result v0

    .line 419
    .local v0, paddingLeft:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getWidth()I

    move-result v1

    sub-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v0

    return v1
.end method

.method private static getCenterOfView(Landroid/view/View;)I
    .locals 2
    .parameter "view"

    .prologue
    .line 426
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method private makeAndAddView(IIIZ)Landroid/view/View;
    .locals 2
    .parameter "position"
    .parameter "offset"
    .parameter "x"
    .parameter "fromLeft"

    .prologue
    .line 707
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->get()Landroid/view/View;

    move-result-object v0

    .line 709
    .local v0, child:Landroid/view/View;
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1, p1, v0, p0}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 712
    invoke-direct {p0, v0, p2, p3, p4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setUpChild(Landroid/view/View;IIZ)V

    .line 714
    return-object v0
.end method

.method private offsetChildrenLeftAndRight(I)V
    .locals 2
    .parameter "offset"

    .prologue
    .line 409
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, i:I
    :goto_0
    if-ltz v0, :cond_0

    .line 410
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 409
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 412
    :cond_0
    return-void
.end method

.method private onFinishedMovement()V
    .locals 1

    .prologue
    .line 493
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    if-eqz v0, :cond_0

    .line 494
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    .line 497
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->selectionChanged()V

    .line 499
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->invalidate()V

    .line 500
    return-void
.end method

.method private scrollIntoSlots()V
    .locals 4

    .prologue
    .line 479
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    if-nez v3, :cond_1

    .line 490
    :cond_0
    :goto_0
    return-void

    .line 481
    :cond_1
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    invoke-static {v3}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfView(Landroid/view/View;)I

    move-result v1

    .line 482
    .local v1, selectedCenter:I
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfGallery()I

    move-result v2

    .line 484
    .local v2, targetCenter:I
    sub-int v0, v2, v1

    .line 485
    .local v0, scrollAmount:I
    if-eqz v0, :cond_2

    .line 486
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    invoke-virtual {v3, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->startUsingDistance(I)V

    goto :goto_0

    .line 488
    :cond_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onFinishedMovement()V

    goto :goto_0
.end method

.method private scrollToChild(I)Z
    .locals 4
    .parameter "childPosition"

    .prologue
    .line 1137
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1139
    .local v0, child:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1140
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfGallery()I

    move-result v2

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfView(Landroid/view/View;)I

    move-result v3

    sub-int v1, v2, v3

    .line 1141
    .local v1, distance:I
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    invoke-virtual {v2, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->startUsingDistance(I)V

    .line 1142
    const/4 v2, 0x1

    .line 1145
    .end local v1           #distance:I
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private setSelectionToCenterChild()V
    .locals 10

    .prologue
    .line 515
    iget-object v7, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    .line 516
    .local v7, selView:Landroid/view/View;
    iget-object v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    if-nez v8, :cond_1

    .line 553
    :cond_0
    :goto_0
    return-void

    .line 518
    :cond_1
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfGallery()I

    move-result v3

    .line 521
    .local v3, galleryCenter:I
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    if-gt v8, v3, :cond_2

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v8, v3, :cond_0

    .line 526
    :cond_2
    const v2, 0x7fffffff

    .line 527
    .local v2, closestEdgeDistance:I
    const/4 v6, 0x0

    .line 528
    .local v6, newSelectedChildIndex:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    .local v4, i:I
    :goto_1
    if-ltz v4, :cond_3

    .line 530
    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 532
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v8

    if-gt v8, v3, :cond_4

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v8

    if-lt v8, v3, :cond_4

    .line 534
    move v6, v4

    .line 546
    .end local v0           #child:Landroid/view/View;
    :cond_3
    iget v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    add-int v5, v8, v6

    .line 548
    .local v5, newPos:I
    iget v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    if-eq v5, v8, :cond_0

    .line 549
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setSelectedPositionInt(I)V

    .line 550
    invoke-virtual {p0, v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setNextSelectedPositionInt(I)V

    .line 551
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->checkSelectionChanged()V

    goto :goto_0

    .line 538
    .end local v5           #newPos:I
    .restart local v0       #child:Landroid/view/View;
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int/2addr v8, v3

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v9

    sub-int/2addr v9, v3

    invoke-static {v9}, Ljava/lang/Math;->abs(I)I

    move-result v9

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 540
    .local v1, childClosestEdgeDistance:I
    if-ge v1, v2, :cond_5

    .line 541
    move v2, v1

    .line 542
    move v6, v4

    .line 528
    :cond_5
    add-int/lit8 v4, v4, -0x1

    goto :goto_1
.end method

.method private setUpChild(Landroid/view/View;IIZ)V
    .locals 11
    .parameter "child"
    .parameter "offset"
    .parameter "x"
    .parameter "fromLeft"

    .prologue
    .line 733
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    .line 735
    .local v6, lp:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;
    if-nez v6, :cond_0

    .line 736
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .end local v6           #lp:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;
    check-cast v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    .line 739
    .restart local v6       #lp:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;
    :cond_0
    if-eqz p4, :cond_1

    const/4 v8, -0x1

    :goto_0
    invoke-virtual {p0, p1, v8, v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)Z

    .line 741
    if-nez p2, :cond_2

    const/4 v8, 0x1

    :goto_1
    invoke-virtual {p1, v8}, Landroid/view/View;->setSelected(Z)V

    .line 744
    iget v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mHeightMeasureSpec:I

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v9, v10

    iget v10, v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;->height:I

    invoke-static {v8, v9, v10}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v1

    .line 746
    .local v1, childHeightSpec:I
    iget v8, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mWidthMeasureSpec:I

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    iget-object v10, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int/2addr v9, v10

    iget v10, v6, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;->width:I

    invoke-static {v8, v9, v10}, Landroid/view/ViewGroup;->getChildMeasureSpec(III)I

    move-result v5

    .line 750
    .local v5, childWidthSpec:I
    invoke-virtual {p1, v5, v1}, Landroid/view/View;->measure(II)V

    .line 756
    const/4 v8, 0x1

    invoke-direct {p0, p1, v8}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->calculateTop(Landroid/view/View;Z)I

    move-result v4

    .line 757
    .local v4, childTop:I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    add-int v0, v4, v8

    .line 759
    .local v0, childBottom:I
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    .line 760
    .local v7, width:I
    if-eqz p4, :cond_3

    .line 761
    move v2, p3

    .line 762
    .local v2, childLeft:I
    add-int v3, v2, v7

    .line 768
    .local v3, childRight:I
    :goto_2
    invoke-virtual {p1, v2, v4, v3, v0}, Landroid/view/View;->layout(IIII)V

    .line 769
    return-void

    .line 739
    .end local v0           #childBottom:I
    .end local v1           #childHeightSpec:I
    .end local v2           #childLeft:I
    .end local v3           #childRight:I
    .end local v4           #childTop:I
    .end local v5           #childWidthSpec:I
    .end local v7           #width:I
    :cond_1
    const/4 v8, 0x0

    goto :goto_0

    .line 741
    :cond_2
    const/4 v8, 0x0

    goto :goto_1

    .line 764
    .restart local v0       #childBottom:I
    .restart local v1       #childHeightSpec:I
    .restart local v4       #childTop:I
    .restart local v5       #childWidthSpec:I
    .restart local v7       #width:I
    :cond_3
    sub-int v2, p3, v7

    .line 765
    .restart local v2       #childLeft:I
    move v3, p3

    .restart local v3       #childRight:I
    goto :goto_2
.end method

.method private updateSelectedItemMetadata()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1158
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    .line 1160
    .local v1, oldSelectedChild:Landroid/view/View;
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    .line 1161
    .local v0, child:Landroid/view/View;
    if-nez v0, :cond_1

    .line 1184
    :cond_0
    :goto_0
    return-void

    .line 1165
    :cond_1
    invoke-virtual {v0, v5}, Landroid/view/View;->setSelected(Z)V

    .line 1166
    invoke-virtual {v0, v5}, Landroid/view/View;->setFocusable(Z)V

    .line 1168
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->hasFocus()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1169
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 1174
    :cond_2
    if-eqz v1, :cond_0

    .line 1177
    invoke-virtual {v1, v4}, Landroid/view/View;->setSelected(Z)V

    .line 1181
    invoke-virtual {v1, v4}, Landroid/view/View;->setFocusable(Z)V

    goto :goto_0
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .parameter "p"

    .prologue
    .line 291
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    return v0
.end method

.method protected computeHorizontalScrollExtent()I
    .locals 1

    .prologue
    .line 274
    const/4 v0, 0x1

    return v0
.end method

.method protected computeHorizontalScrollOffset()I
    .locals 1

    .prologue
    .line 280
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    return v0
.end method

.method protected computeHorizontalScrollRange()I
    .locals 1

    .prologue
    .line 286
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    return v0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    const/4 v0, 0x0

    .line 1054
    invoke-virtual {p1, p0, v0, v0}, Landroid/view/KeyEvent;->dispatch(Landroid/view/KeyEvent$Callback;Landroid/view/KeyEvent$DispatcherState;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected dispatchSetPressed(Z)V
    .locals 1
    .parameter "pressed"

    .prologue
    .line 997
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 998
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 1000
    :cond_0
    return-void
.end method

.method public dispatchSetSelected(Z)V
    .locals 0
    .parameter "selected"

    .prologue
    .line 991
    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .prologue
    const/4 v1, -0x2

    .line 309
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    invoke-direct {v0, v1, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .parameter "attrs"

    .prologue
    .line 301
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .parameter "p"

    .prologue
    .line 296
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;

    invoke-direct {v0, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method protected getChildDrawingOrder(II)I
    .locals 3
    .parameter "childCount"
    .parameter "i"

    .prologue
    .line 1202
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int v0, v1, v2

    .line 1205
    .local v0, selectedIndex:I
    if-gez v0, :cond_1

    .line 1215
    .end local p2
    :cond_0
    :goto_0
    return p2

    .line 1207
    .restart local p2
    :cond_1
    add-int/lit8 v1, p1, -0x1

    if-ne p2, v1, :cond_2

    move p2, v0

    .line 1209
    goto :goto_0

    .line 1210
    :cond_2
    if-lt p2, v0, :cond_0

    .line 1212
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method getChildHeight(Landroid/view/View;)I
    .locals 1
    .parameter "child"

    .prologue
    .line 329
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method protected getChildStaticTransformation(Landroid/view/View;Landroid/view/animation/Transformation;)Z
    .locals 1
    .parameter "child"
    .parameter "t"

    .prologue
    .line 265
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->clear()V

    .line 266
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    if-ne p1, v0, :cond_0

    const/high16 v0, 0x3f80

    :goto_0
    invoke-virtual {p2, v0}, Landroid/view/animation/Transformation;->setAlpha(F)V

    .line 268
    const/4 v0, 0x1

    return v0

    .line 266
    :cond_0
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mUnselectedAlpha:F

    goto :goto_0
.end method

.method protected getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    .prologue
    .line 1004
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mContextMenuInfo:Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterContextMenuInfo;

    return-object v0
.end method

.method getLimitedMotionScrollAmount(ZI)I
    .locals 7
    .parameter "motionToLeft"
    .parameter "deltaX"

    .prologue
    const/4 v5, 0x0

    .line 371
    if-eqz p1, :cond_1

    iget v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    add-int/lit8 v3, v6, -0x1

    .line 372
    .local v3, extremeItemPosition:I
    :goto_0
    iget v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int v6, v3, v6

    invoke-virtual {p0, v6}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 374
    .local v1, extremeChild:Landroid/view/View;
    if-nez v1, :cond_2

    move v5, p2

    .line 397
    :cond_0
    :goto_1
    return v5

    .end local v1           #extremeChild:Landroid/view/View;
    .end local v3           #extremeItemPosition:I
    :cond_1
    move v3, v5

    .line 371
    goto :goto_0

    .line 378
    .restart local v1       #extremeChild:Landroid/view/View;
    .restart local v3       #extremeItemPosition:I
    :cond_2
    invoke-static {v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfView(Landroid/view/View;)I

    move-result v2

    .line 379
    .local v2, extremeChildCenter:I
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getCenterOfGallery()I

    move-result v4

    .line 381
    .local v4, galleryCenter:I
    if-eqz p1, :cond_4

    .line 382
    if-le v2, v4, :cond_0

    .line 395
    :cond_3
    sub-int v0, v4, v2

    .line 397
    .local v0, centerDifference:I
    if-eqz p1, :cond_5

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result v5

    goto :goto_1

    .line 388
    .end local v0           #centerDifference:I
    :cond_4
    if-lt v2, v4, :cond_3

    goto :goto_1

    .line 397
    .restart local v0       #centerDifference:I
    :cond_5
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v5

    goto :goto_1
.end method

.method layout(IZ)V
    .locals 7
    .parameter "delta"
    .parameter "animate"

    .prologue
    const/4 v6, 0x0

    .line 568
    iget-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v0, v4, Landroid/graphics/Rect;->left:I

    .line 569
    .local v0, childrenLeft:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getRight()I

    move-result v4

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getLeft()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    sub-int v1, v4, v5

    .line 571
    .local v1, childrenWidth:I
    iget-boolean v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDataChanged:Z

    if-eqz v4, :cond_0

    .line 572
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->handleDataChanged()V

    .line 576
    :cond_0
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    if-nez v4, :cond_1

    .line 577
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->resetList()V

    .line 623
    :goto_0
    return-void

    .line 582
    :cond_1
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mNextSelectedPosition:I

    if-ltz v4, :cond_2

    .line 583
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mNextSelectedPosition:I

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setSelectedPositionInt(I)V

    .line 587
    :cond_2
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->recycleAllViews()V

    .line 590
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->detachAllViewsFromParent()V

    .line 596
    iput v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mRightMost:I

    .line 597
    iput v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mLeftMost:I

    .line 605
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    .line 606
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    const/4 v5, 0x1

    invoke-direct {p0, v4, v6, v6, v5}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->makeAndAddView(IIIZ)Landroid/view/View;

    move-result-object v2

    .line 609
    .local v2, sel:Landroid/view/View;
    div-int/lit8 v4, v1, 0x2

    add-int/2addr v4, v0

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v5

    div-int/lit8 v5, v5, 0x2

    sub-int v3, v4, v5

    .line 610
    .local v3, selectedOffset:I
    invoke-virtual {v2, v3}, Landroid/view/View;->offsetLeftAndRight(I)V

    .line 612
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->fillToGalleryRight()V

    .line 613
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->fillToGalleryLeft()V

    .line 615
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->invalidate()V

    .line 616
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->checkSelectionChanged()V

    .line 618
    iput-boolean v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDataChanged:Z

    .line 619
    iput-boolean v6, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mNeedSync:Z

    .line 620
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    invoke-virtual {p0, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setNextSelectedPositionInt(I)V

    .line 622
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->updateSelectedItemMetadata()V

    goto :goto_0
.end method

.method moveNext()Z
    .locals 2

    .prologue
    .line 1128
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    .line 1129
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollToChild(I)Z

    .line 1130
    const/4 v0, 0x1

    .line 1132
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method movePrevious()Z
    .locals 2

    .prologue
    .line 1119
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    if-lez v0, :cond_0

    .line 1120
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollToChild(I)Z

    .line 1121
    const/4 v0, 0x1

    .line 1123
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method onCancel()V
    .locals 0

    .prologue
    .line 939
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onUp()V

    .line 940
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "e"

    .prologue
    const/4 v2, 0x1

    .line 906
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->stop(Z)V

    .line 909
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p0, v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->pointToPosition(II)I

    move-result v0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    .line 911
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    if-ltz v0, :cond_0

    .line 912
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchView:Landroid/view/View;

    .line 913
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 917
    :cond_0
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mIsFirstScroll:Z

    .line 920
    return v2
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 3
    .parameter "e1"
    .parameter "e2"
    .parameter "velocityX"
    .parameter "velocityY"

    .prologue
    const/4 v2, 0x1

    .line 843
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackDuringFling:Z

    if-nez v0, :cond_0

    .line 847
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDisableSuppressSelectionChangedRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 850
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    if-nez v0, :cond_0

    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    .line 854
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    neg-float v1, p3

    float-to-int v1, v1

    invoke-virtual {v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->startUsingVelocity(I)V

    .line 856
    return v2
.end method

.method protected onFocusChanged(ZILandroid/graphics/Rect;)V
    .locals 1
    .parameter "gainFocus"
    .parameter "direction"
    .parameter "previouslyFocusedRect"

    .prologue
    .line 1221
    invoke-super {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->onFocusChanged(ZILandroid/graphics/Rect;)V

    .line 1228
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 1229
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->requestFocus(I)Z

    .line 1232
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .parameter "keyCode"
    .parameter "event"

    .prologue
    const/4 v0, 0x1

    .line 1063
    sparse-switch p1, :sswitch_data_0

    .line 1083
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    :cond_0
    :goto_1
    return v0

    .line 1066
    :sswitch_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->movePrevious()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1067
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->playSoundEffect(I)V

    goto :goto_1

    .line 1072
    :sswitch_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->moveNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1073
    const/4 v1, 0x3

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->playSoundEffect(I)V

    goto :goto_1

    .line 1079
    :sswitch_2
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mReceivedInvokeKeyDown:Z

    goto :goto_0

    .line 1063
    nop

    :sswitch_data_0
    .sparse-switch
        0x15 -> :sswitch_0
        0x16 -> :sswitch_1
        0x17 -> :sswitch_2
        0x42 -> :sswitch_2
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 5
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 1088
    sparse-switch p1, :sswitch_data_0

    .line 1115
    invoke-super {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    :goto_0
    return v1

    .line 1092
    :sswitch_0
    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mReceivedInvokeKeyDown:Z

    if-eqz v1, :cond_0

    .line 1093
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mItemCount:I

    if-lez v1, :cond_0

    .line 1095
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedChild:Landroid/view/View;

    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchPress(Landroid/view/View;)V

    .line 1096
    new-instance v1, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$2;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$2;-><init>(Lcom/cyanogenmod/trebuchet/widget/EcoGallery;)V

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {p0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1102
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int v0, v1, v2

    .line 1103
    .local v0, selectedIndex:I
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    invoke-interface {v3, v4}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v3

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->performItemClick(Landroid/view/View;IJ)Z

    .line 1109
    .end local v0           #selectedIndex:I
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mReceivedInvokeKeyDown:Z

    .line 1111
    const/4 v1, 0x1

    goto :goto_0

    .line 1088
    :sswitch_data_0
    .sparse-switch
        0x17 -> :sswitch_0
        0x42 -> :sswitch_0
    .end sparse-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 2
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    const/4 v1, 0x0

    .line 315
    invoke-super/range {p0 .. p5}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->onLayout(ZIIII)V

    .line 321
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mInLayout:Z

    .line 322
    invoke-virtual {p0, v1, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->layout(IZ)V

    .line 324
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mInLayout:Z

    .line 325
    return-void
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 4
    .parameter "e"

    .prologue
    .line 947
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    if-gez v2, :cond_0

    .line 954
    :goto_0
    return-void

    .line 951
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->performHapticFeedback(I)Z

    .line 952
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getItemIdAtPosition(I)J

    move-result-wide v0

    .line 953
    .local v0, id:J
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchView:Landroid/view/View;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    invoke-direct {p0, v2, v3, v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchLongPress(Landroid/view/View;IJ)Z

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 5
    .parameter "e1"
    .parameter "e2"
    .parameter "distanceX"
    .parameter "distanceY"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 875
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 879
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackDuringFling:Z

    if-nez v0, :cond_2

    .line 880
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mIsFirstScroll:Z

    if-eqz v0, :cond_1

    .line 886
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    if-nez v0, :cond_0

    iput-boolean v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    .line 887
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDisableSuppressSelectionChangedRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xfa

    invoke-virtual {p0, v0, v1, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 894
    :cond_1
    :goto_0
    float-to-int v0, p3

    mul-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->trackMotionScroll(I)V

    .line 896
    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mIsFirstScroll:Z

    .line 897
    return v3

    .line 890
    :cond_2
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    if-eqz v0, :cond_1

    iput-boolean v4, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    goto :goto_0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 962
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 4
    .parameter "e"

    .prologue
    .line 821
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    if-ltz v0, :cond_2

    .line 824
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollToChild(I)Z

    .line 827
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackOnUnselectedItemClick:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    if-ne v0, v1, :cond_1

    .line 828
    :cond_0
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchView:Landroid/view/View;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mDownTouchPosition:I

    invoke-interface {v2, v3}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->performItemClick(Landroid/view/View;IJ)Z

    .line 832
    :cond_1
    const/4 v0, 0x1

    .line 835
    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    .line 803
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    .line 805
    .local v1, retValue:Z
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 806
    .local v0, action:I
    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    .line 808
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onUp()V

    .line 813
    :cond_0
    :goto_0
    return v1

    .line 809
    :cond_1
    const/4 v2, 0x3

    if-ne v0, v2, :cond_0

    .line 810
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onCancel()V

    goto :goto_0
.end method

.method onUp()V
    .locals 1

    .prologue
    .line 928
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    #getter for: Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->mScroller:Landroid/widget/Scroller;
    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->access$200(Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;)Landroid/widget/Scroller;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 929
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->scrollIntoSlots()V

    .line 932
    :cond_0
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchUnpress()V

    .line 933
    return-void
.end method

.method selectionChanged()V
    .locals 1

    .prologue
    .line 504
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSuppressSelectionChanged:Z

    if-nez v0, :cond_0

    .line 505
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->selectionChanged()V

    .line 507
    :cond_0
    return-void
.end method

.method public setAnimationDuration(I)V
    .locals 0
    .parameter "animationDurationMillis"

    .prologue
    .line 237
    iput p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAnimationDuration:I

    .line 238
    return-void
.end method

.method public setCallbackDuringFling(Z)V
    .locals 0
    .parameter "shouldCallback"

    .prologue
    .line 211
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackDuringFling:Z

    .line 212
    return-void
.end method

.method public setCallbackOnUnselectedItemClick(Z)V
    .locals 0
    .parameter "shouldCallback"

    .prologue
    .line 224
    iput-boolean p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mShouldCallbackOnUnselectedItemClick:Z

    .line 225
    return-void
.end method

.method public setGravity(I)V
    .locals 1
    .parameter "gravity"

    .prologue
    .line 1194
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGravity:I

    if-eq v0, p1, :cond_0

    .line 1195
    iput p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mGravity:I

    .line 1196
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->requestLayout()V

    .line 1198
    :cond_0
    return-void
.end method

.method setSelectedPositionInt(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 1150
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setSelectedPositionInt(I)V

    .line 1153
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->updateSelectedItemMetadata()V

    .line 1154
    return-void
.end method

.method public setSpacing(I)V
    .locals 0
    .parameter "spacing"

    .prologue
    .line 248
    iput p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSpacing:I

    .line 249
    return-void
.end method

.method public setUnselectedAlpha(F)V
    .locals 0
    .parameter "unselectedAlpha"

    .prologue
    .line 259
    iput p1, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mUnselectedAlpha:F

    .line 260
    return-void
.end method

.method public showContextMenu()Z
    .locals 5

    .prologue
    .line 1022
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->isPressed()Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    if-ltz v2, :cond_0

    .line 1023
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFirstPosition:I

    sub-int v0, v2, v3

    .line 1024
    .local v0, index:I
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1025
    .local v1, v:Landroid/view/View;
    iget v2, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedPosition:I

    iget-wide v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mSelectedRowId:J

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchLongPress(Landroid/view/View;IJ)Z

    move-result v2

    .line 1028
    .end local v0           #index:I
    .end local v1           #v:Landroid/view/View;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public showContextMenuForChild(Landroid/view/View;)Z
    .locals 4
    .parameter "originalView"

    .prologue
    .line 1010
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getPositionForView(Landroid/view/View;)I

    move-result v2

    .line 1011
    .local v2, longPressPosition:I
    if-gez v2, :cond_0

    .line 1012
    const/4 v3, 0x0

    .line 1016
    :goto_0
    return v3

    .line 1015
    :cond_0
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v3, v2}, Landroid/widget/SpinnerAdapter;->getItemId(I)J

    move-result-wide v0

    .line 1016
    .local v0, longPressId:J
    invoke-direct {p0, p1, v2, v0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->dispatchLongPress(Landroid/view/View;IJ)Z

    move-result v3

    goto :goto_0
.end method

.method trackMotionScroll(I)V
    .locals 4
    .parameter "deltaX"

    .prologue
    const/4 v2, 0x0

    .line 340
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getChildCount()I

    move-result v3

    if-nez v3, :cond_0

    .line 368
    :goto_0
    return-void

    .line 344
    :cond_0
    if-gez p1, :cond_2

    const/4 v1, 0x1

    .line 346
    .local v1, toLeft:Z
    :goto_1
    invoke-virtual {p0, v1, p1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->getLimitedMotionScrollAmount(ZI)I

    move-result v0

    .line 347
    .local v0, limitedDeltaX:I
    if-eq v0, p1, :cond_1

    .line 349
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->mFlingRunnable:Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;

    #calls: Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->endFling(Z)V
    invoke-static {v3, v2}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;->access$100(Lcom/cyanogenmod/trebuchet/widget/EcoGallery$FlingRunnable;Z)V

    .line 350
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->onFinishedMovement()V

    .line 353
    :cond_1
    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->offsetChildrenLeftAndRight(I)V

    .line 355
    invoke-direct {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->detachOffScreenChildren(Z)V

    .line 357
    if-eqz v1, :cond_3

    .line 359
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->fillToGalleryRight()V

    .line 365
    :goto_2
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->setSelectionToCenterChild()V

    .line 367
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->invalidate()V

    goto :goto_0

    .end local v0           #limitedDeltaX:I
    .end local v1           #toLeft:Z
    :cond_2
    move v1, v2

    .line 344
    goto :goto_1

    .line 362
    .restart local v0       #limitedDeltaX:I
    .restart local v1       #toLeft:Z
    :cond_3
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/EcoGallery;->fillToGalleryLeft()V

    goto :goto_2
.end method
