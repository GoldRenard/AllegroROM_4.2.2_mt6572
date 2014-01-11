.class public abstract Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;
.super Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;
.source "CustomAbsSpinner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$1;,
        Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;,
        Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView",
        "<",
        "Landroid/widget/SpinnerAdapter;",
        ">;"
    }
.end annotation


# instance fields
.field mAdapter:Landroid/widget/SpinnerAdapter;

.field mBlockLayoutRequests:Z

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field mHeightMeasureSpec:I

.field mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

.field mSelectionBottomPadding:I

.field mSelectionLeftPadding:I

.field mSelectionRightPadding:I

.field mSelectionTopPadding:I

.field mSpinnerPadding:Landroid/graphics/Rect;

.field private mTouchFrame:Landroid/graphics/Rect;

.field mWidthMeasureSpec:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;-><init>(Landroid/content/Context;)V

    .line 41
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionLeftPadding:I

    .line 42
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionTopPadding:I

    .line 43
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionRightPadding:I

    .line 44
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionBottomPadding:I

    .line 45
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    .line 47
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;-><init>(Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    .line 56
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->initAbsSpinner()V

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v4, 0x0

    .line 64
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionLeftPadding:I

    .line 42
    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionTopPadding:I

    .line 43
    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionRightPadding:I

    .line 44
    iput v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionBottomPadding:I

    .line 45
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    .line 47
    new-instance v3, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-direct {v3, p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;-><init>(Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;)V

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    .line 65
    invoke-direct {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->initAbsSpinner()V

    .line 67
    sget-object v3, Lcom/cyanogenmod/trebuchet/R$styleable;->CustomAbsSpinner:[I

    invoke-virtual {p1, p2, v3, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 70
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getTextArray(I)[Ljava/lang/CharSequence;

    move-result-object v2

    .line 71
    .local v2, entries:[Ljava/lang/CharSequence;
    if-eqz v2, :cond_0

    .line 72
    new-instance v1, Landroid/widget/ArrayAdapter;

    const v3, 0x1090008

    invoke-direct {v1, p1, v3, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 75
    .local v1, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    const v3, 0x1090009

    invoke-virtual {v1, v3}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    .line 76
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 79
    .end local v1           #adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/CharSequence;>;"
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 80
    return-void
.end method

.method static synthetic access$100(Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;Landroid/view/View;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->removeDetachedView(Landroid/view/View;Z)V

    return-void
.end method

.method private initAbsSpinner()V
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setFocusable(Z)V

    .line 87
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setWillNotDraw(Z)V

    .line 88
    return-void
.end method


# virtual methods
.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .prologue
    .line 248
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/SpinnerAdapter;
    .locals 1

    .prologue
    .line 339
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    return-object v0
.end method

.method getChildHeight(Landroid/view/View;)I
    .locals 1
    .parameter "child"

    .prologue
    .line 239
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0
.end method

.method getChildWidth(Landroid/view/View;)I
    .locals 1
    .parameter "child"

    .prologue
    .line 243
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    return v0
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 344
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 2

    .prologue
    .line 315
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectedPosition:I

    if-ltz v0, :cond_0

    .line 316
    iget v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectedPosition:I

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mFirstPosition:I

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 318
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method handleDataChanged()V
    .locals 0

    .prologue
    .line 270
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->handleDataChanged()V

    .line 271
    return-void
.end method

.method abstract layout(IZ)V
.end method

.method protected onMeasure(II)V
    .locals 17
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 163
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v13

    .line 167
    .local v13, widthMode:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getPaddingLeft()I

    move-result v6

    .line 168
    .local v6, paddingLeft:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getPaddingRight()I

    move-result v7

    .line 169
    .local v7, paddingRight:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getPaddingTop()I

    move-result v8

    .line 170
    .local v8, paddingTop:I
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getPaddingBottom()I

    move-result v5

    .line 172
    .local v5, paddingBottom:I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionLeftPadding:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v6, v0, :cond_6

    .end local v6           #paddingLeft:I
    :goto_0
    iput v6, v15, Landroid/graphics/Rect;->left:I

    .line 174
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionTopPadding:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v8, v0, :cond_7

    .end local v8           #paddingTop:I
    :goto_1
    iput v8, v15, Landroid/graphics/Rect;->top:I

    .line 176
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionRightPadding:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v7, v0, :cond_8

    .end local v7           #paddingRight:I
    :goto_2
    iput v7, v15, Landroid/graphics/Rect;->right:I

    .line 178
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionBottomPadding:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-le v5, v0, :cond_9

    .end local v5           #paddingBottom:I
    :goto_3
    iput v5, v15, Landroid/graphics/Rect;->bottom:I

    .line 181
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataChanged:Z

    if-eqz v15, :cond_0

    .line 182
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->handleDataChanged()V

    .line 185
    :cond_0
    const/4 v9, 0x0

    .line 186
    .local v9, preferredHeight:I
    const/4 v10, 0x0

    .line 187
    .local v10, preferredWidth:I
    const/4 v4, 0x1

    .line 189
    .local v4, needsMeasuring:Z
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getSelectedItemPosition()I

    move-result v11

    .line 190
    .local v11, selectedPosition:I
    if-ltz v11, :cond_4

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v15, :cond_4

    .line 192
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-virtual {v15}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->get()Landroid/view/View;

    move-result-object v12

    .line 193
    .local v12, view:Landroid/view/View;
    if-nez v12, :cond_1

    .line 195
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    const/16 v16, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-interface {v15, v11, v0, v1}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v12

    .line 198
    :cond_1
    if-eqz v12, :cond_2

    .line 200
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    invoke-virtual {v15, v12}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->add(Landroid/view/View;)V

    .line 203
    :cond_2
    if-eqz v12, :cond_4

    .line 204
    invoke-virtual {v12}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    if-nez v15, :cond_3

    .line 205
    const/4 v15, 0x1

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mBlockLayoutRequests:Z

    .line 206
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v15

    invoke-virtual {v12, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput-boolean v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mBlockLayoutRequests:Z

    .line 209
    :cond_3
    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0, v12, v1, v2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->measureChild(Landroid/view/View;II)V

    .line 211
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildHeight(Landroid/view/View;)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->top:I

    move/from16 v16, v0

    add-int v15, v15, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v16, v0

    add-int v9, v15, v16

    .line 212
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildWidth(Landroid/view/View;)I

    move-result v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->left:I

    move/from16 v16, v0

    add-int v15, v15, v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v16, v0

    add-int v10, v15, v16

    .line 214
    const/4 v4, 0x0

    .line 218
    .end local v12           #view:Landroid/view/View;
    :cond_4
    if-eqz v4, :cond_5

    .line 220
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->top:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    move/from16 v16, v0

    add-int v9, v15, v16

    .line 221
    if-nez v13, :cond_5

    .line 222
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    iget v15, v15, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSpinnerPadding:Landroid/graphics/Rect;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget v0, v0, Landroid/graphics/Rect;->right:I

    move/from16 v16, v0

    add-int v10, v15, v16

    .line 226
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getSuggestedMinimumHeight()I

    move-result v15

    invoke-static {v9, v15}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 227
    invoke-virtual/range {p0 .. p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getSuggestedMinimumWidth()I

    move-result v15

    invoke-static {v10, v15}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 229
    move/from16 v0, p2

    invoke-static {v9, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->resolveSize(II)I

    move-result v3

    .line 230
    .local v3, heightSize:I
    move/from16 v0, p1

    invoke-static {v10, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->resolveSize(II)I

    move-result v14

    .line 232
    .local v14, widthSize:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v3}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setMeasuredDimension(II)V

    .line 233
    move/from16 v0, p2

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mHeightMeasureSpec:I

    .line 234
    move/from16 v0, p1

    move-object/from16 v1, p0

    iput v0, v1, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mWidthMeasureSpec:I

    .line 235
    return-void

    .line 172
    .end local v3           #heightSize:I
    .end local v4           #needsMeasuring:Z
    .end local v9           #preferredHeight:I
    .end local v10           #preferredWidth:I
    .end local v11           #selectedPosition:I
    .end local v14           #widthSize:I
    .restart local v5       #paddingBottom:I
    .restart local v6       #paddingLeft:I
    .restart local v7       #paddingRight:I
    .restart local v8       #paddingTop:I
    :cond_6
    move-object/from16 v0, p0

    iget v6, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionLeftPadding:I

    goto/16 :goto_0

    .line 174
    .end local v6           #paddingLeft:I
    :cond_7
    move-object/from16 v0, p0

    iget v8, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionTopPadding:I

    goto/16 :goto_1

    .line 176
    .end local v8           #paddingTop:I
    :cond_8
    move-object/from16 v0, p0

    iget v7, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionRightPadding:I

    goto/16 :goto_2

    .line 178
    .end local v7           #paddingRight:I
    :cond_9
    move-object/from16 v0, p0

    iget v5, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectionBottomPadding:I

    goto/16 :goto_3
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 6
    .parameter "state"

    .prologue
    const/4 v5, 0x1

    .line 437
    move-object v0, p1

    check-cast v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;

    .line 439
    .local v0, ss:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;
    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 441
    iget-wide v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->selectedId:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_0

    .line 442
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataChanged:Z

    .line 443
    iput-boolean v5, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mNeedSync:Z

    .line 444
    iget-wide v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->selectedId:J

    iput-wide v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSyncRowId:J

    .line 445
    iget v1, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->position:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSyncPosition:I

    .line 446
    const/4 v1, 0x0

    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSyncMode:I

    .line 447
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->requestLayout()V

    .line 449
    :cond_0
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 6

    .prologue
    .line 424
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 425
    .local v1, superState:Landroid/os/Parcelable;
    new-instance v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;

    invoke-direct {v0, v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 426
    .local v0, ss:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getSelectedItemId()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->selectedId:J

    .line 427
    iget-wide v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->selectedId:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    .line 428
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getSelectedItemPosition()I

    move-result v2

    iput v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->position:I

    .line 432
    :goto_0
    return-object v0

    .line 430
    :cond_0
    const/4 v2, -0x1

    iput v2, v0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$SavedState;->position:I

    goto :goto_0
.end method

.method public pointToPosition(II)I
    .locals 5
    .parameter "x"
    .parameter "y"

    .prologue
    .line 356
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 357
    .local v2, frame:Landroid/graphics/Rect;
    if-nez v2, :cond_0

    .line 358
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 359
    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mTouchFrame:Landroid/graphics/Rect;

    .line 362
    :cond_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildCount()I

    move-result v1

    .line 363
    .local v1, count:I
    add-int/lit8 v3, v1, -0x1

    .local v3, i:I
    :goto_0
    if-ltz v3, :cond_2

    .line 364
    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 365
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-nez v4, :cond_1

    .line 366
    invoke-virtual {v0, v2}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 367
    invoke-virtual {v2, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 368
    iget v4, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mFirstPosition:I

    add-int/2addr v4, v3

    .line 372
    .end local v0           #child:Landroid/view/View;
    :goto_1
    return v4

    .line 363
    .restart local v0       #child:Landroid/view/View;
    :cond_1
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    .line 372
    .end local v0           #child:Landroid/view/View;
    :cond_2
    const/4 v4, -0x1

    goto :goto_1
.end method

.method recycleAllViews()V
    .locals 6

    .prologue
    .line 254
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildCount()I

    move-result v0

    .line 255
    .local v0, childCount:I
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mRecycler:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;

    .line 258
    .local v3, recycleBin:Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 259
    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 260
    .local v4, v:Landroid/view/View;
    iget v5, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mFirstPosition:I

    add-int v2, v5, v1

    .line 261
    .local v2, index:I
    invoke-virtual {v3, v2, v4}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner$RecycleBin;->put(ILandroid/view/View;)V

    .line 258
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 263
    .end local v2           #index:I
    .end local v4           #v:Landroid/view/View;
    :cond_0
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mBlockLayoutRequests:Z

    if-nez v0, :cond_0

    .line 331
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;->requestLayout()V

    .line 333
    :cond_0
    return-void
.end method

.method resetList()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    const/4 v2, -0x1

    .line 141
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataChanged:Z

    .line 142
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mNeedSync:Z

    .line 144
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->removeAllViewsInLayout()V

    .line 145
    iput v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldSelectedPosition:I

    .line 146
    const-wide/high16 v0, -0x8000

    iput-wide v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldSelectedRowId:J

    .line 148
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setSelectedPositionInt(I)V

    .line 149
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 150
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->invalidate()V

    .line 151
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 34
    check-cast p1, Landroid/widget/SpinnerAdapter;

    .end local p1
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .locals 3
    .parameter "adapter"

    .prologue
    const/4 v0, -0x1

    .line 99
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v1, :cond_0

    .line 100
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v1, v2}, Landroid/widget/SpinnerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 101
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->resetList()V

    .line 104
    :cond_0
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    .line 106
    iput v0, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldSelectedPosition:I

    .line 107
    const-wide/high16 v1, -0x8000

    iput-wide v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldSelectedRowId:J

    .line 109
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    if-eqz v1, :cond_3

    .line 110
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldItemCount:I

    .line 111
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    invoke-interface {v1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    .line 112
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->checkFocus()V

    .line 114
    new-instance v1, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView$AdapterDataSetObserver;-><init>(Lcom/cyanogenmod/trebuchet/widget/CustomAdapterView;)V

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    .line 115
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mAdapter:Landroid/widget/SpinnerAdapter;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {v1, v2}, Landroid/widget/SpinnerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 117
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    if-lez v1, :cond_1

    const/4 v0, 0x0

    .line 119
    .local v0, position:I
    :cond_1
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setSelectedPositionInt(I)V

    .line 120
    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 122
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mItemCount:I

    if-nez v1, :cond_2

    .line 124
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->checkSelectionChanged()V

    .line 134
    .end local v0           #position:I
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->requestLayout()V

    .line 135
    return-void

    .line 128
    :cond_3
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->checkFocus()V

    .line 129
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->resetList()V

    .line 131
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->checkSelectionChanged()V

    goto :goto_0
.end method

.method public setSelection(I)V
    .locals 0
    .parameter "position"

    .prologue
    .line 288
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 289
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->requestLayout()V

    .line 290
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->invalidate()V

    .line 291
    return-void
.end method

.method public setSelection(IZ)V
    .locals 3
    .parameter "position"
    .parameter "animate"

    .prologue
    .line 280
    if-eqz p2, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mFirstPosition:I

    if-gt v1, p1, :cond_0

    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mFirstPosition:I

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->getChildCount()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v1, v1, -0x1

    if-gt p1, v1, :cond_0

    const/4 v0, 0x1

    .line 282
    .local v0, shouldAnimate:Z
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setSelectionInt(IZ)V

    .line 283
    return-void

    .line 280
    .end local v0           #shouldAnimate:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method setSelectionInt(IZ)V
    .locals 2
    .parameter "position"
    .parameter "animate"

    .prologue
    .line 302
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mOldSelectedPosition:I

    if-eq p1, v1, :cond_0

    .line 303
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mBlockLayoutRequests:Z

    .line 304
    iget v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mSelectedPosition:I

    sub-int v0, p1, v1

    .line 305
    .local v0, delta:I
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->setNextSelectedPositionInt(I)V

    .line 306
    invoke-virtual {p0, v0, p2}, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->layout(IZ)V

    .line 307
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/widget/CustomAbsSpinner;->mBlockLayoutRequests:Z

    .line 309
    .end local v0           #delta:I
    :cond_0
    return-void
.end method
