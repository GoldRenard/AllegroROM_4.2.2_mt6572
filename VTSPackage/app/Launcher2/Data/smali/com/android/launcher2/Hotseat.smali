.class public Lcom/android/launcher2/Hotseat;
.super Landroid/widget/FrameLayout;
.source "Hotseat.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Hotseat"


# instance fields
.field private mAllAppsButtonRank:I

.field private mCellCountX:I

.field private mCellCountY:I

.field private mContent:Lcom/android/launcher2/CellLayout;

.field private mIsLandscape:Z

.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mTransposeLayoutWithOrientation:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/Hotseat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/Hotseat;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x1

    const/4 v5, -0x1

    const/4 v3, 0x0

    .line 54
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    sget-object v4, Lcom/android/launcher/R$styleable;->Hotseat:[I

    invoke-virtual {p1, p2, v4, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 58
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 59
    .local v1, r:Landroid/content/res/Resources;
    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/android/launcher2/Hotseat;->mCellCountX:I

    .line 60
    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v4

    iput v4, p0, Lcom/android/launcher2/Hotseat;->mCellCountY:I

    .line 61
    const v4, 0x7f0a0020

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    iput v4, p0, Lcom/android/launcher2/Hotseat;->mAllAppsButtonRank:I

    .line 62
    const v4, 0x7f090006

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/launcher2/Hotseat;->mTransposeLayoutWithOrientation:Z

    .line 64
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_0

    :goto_0
    iput-boolean v2, p0, Lcom/android/launcher2/Hotseat;->mIsLandscape:Z

    .line 66
    return-void

    :cond_0
    move v2, v3

    .line 64
    goto :goto_0
.end method

.method static synthetic access$000(Lcom/android/launcher2/Hotseat;)Lcom/android/launcher2/Launcher;
    .locals 1
    .parameter "x0"

    .prologue
    .line 31
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mLauncher:Lcom/android/launcher2/Launcher;

    return-object v0
.end method

.method private hasVerticalHotseat()Z
    .locals 1

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/android/launcher2/Hotseat;->mIsLandscape:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/launcher2/Hotseat;->mTransposeLayoutWithOrientation:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method getCellXFromOrder(I)I
    .locals 1
    .parameter "rank"

    .prologue
    .line 87
    invoke-direct {p0}, Lcom/android/launcher2/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    .end local p1
    :cond_0
    return p1
.end method

.method getCellYFromOrder(I)I
    .locals 2
    .parameter "rank"

    .prologue
    .line 90
    invoke-direct {p0}, Lcom/android/launcher2/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v0

    add-int/lit8 v1, p1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method getLayout()Lcom/android/launcher2/CellLayout;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    return-object v0
.end method

.method getOrderInHotseat(II)I
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 83
    invoke-direct {p0}, Lcom/android/launcher2/Hotseat;->hasVerticalHotseat()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->getCountY()I

    move-result v0

    sub-int/2addr v0, p2

    add-int/lit8 p1, v0, -0x1

    .end local p1
    :cond_0
    return p1
.end method

.method public isAllAppsButtonRank(I)Z
    .locals 1
    .parameter "rank"

    .prologue
    .line 93
    iget v0, p0, Lcom/android/launcher2/Hotseat;->mAllAppsButtonRank:I

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 3

    .prologue
    .line 98
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 99
    iget v0, p0, Lcom/android/launcher2/Hotseat;->mCellCountX:I

    if-gez v0, :cond_0

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountX()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Hotseat;->mCellCountX:I

    .line 100
    :cond_0
    iget v0, p0, Lcom/android/launcher2/Hotseat;->mCellCountY:I

    if-gez v0, :cond_1

    invoke-static {}, Lcom/android/launcher2/LauncherModel;->getCellCountY()I

    move-result v0

    iput v0, p0, Lcom/android/launcher2/Hotseat;->mCellCountY:I

    .line 101
    :cond_1
    const v0, 0x7f070019

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Hotseat;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/launcher2/CellLayout;

    iput-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    .line 102
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    iget v1, p0, Lcom/android/launcher2/Hotseat;->mCellCountX:I

    iget v2, p0, Lcom/android/launcher2/Hotseat;->mCellCountY:I

    invoke-virtual {v0, v1, v2}, Lcom/android/launcher2/CellLayout;->setGridSize(II)V

    .line 103
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/launcher2/CellLayout;->setIsHotseat(Z)V

    .line 105
    invoke-virtual {p0}, Lcom/android/launcher2/Hotseat;->resetLayout()V

    .line 106
    return-void
.end method

.method resetLayout()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/4 v5, 0x1

    const/4 v3, 0x0

    .line 109
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v0}, Lcom/android/launcher2/CellLayout;->removeAllViewsInLayout()V

    .line 112
    invoke-virtual {p0}, Lcom/android/launcher2/Hotseat;->getContext()Landroid/content/Context;

    move-result-object v6

    .line 113
    .local v6, context:Landroid/content/Context;
    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    .line 114
    .local v7, inflater:Landroid/view/LayoutInflater;
    const v0, 0x7f040002

    iget-object v2, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    invoke-virtual {v7, v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/launcher2/BubbleTextView;

    .line 116
    .local v1, allAppsButton:Lcom/android/launcher2/BubbleTextView;
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v2, 0x7f02

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v10, v0, v10, v10}, Lcom/android/launcher2/BubbleTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 118
    const v0, 0x7f0d002e

    invoke-virtual {v6, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/android/launcher2/BubbleTextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 119
    new-instance v0, Lcom/android/launcher2/Hotseat$1;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Hotseat$1;-><init>(Lcom/android/launcher2/Hotseat;)V

    invoke-virtual {v1, v0}, Lcom/android/launcher2/BubbleTextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 130
    new-instance v0, Lcom/android/launcher2/Hotseat$2;

    invoke-direct {v0, p0}, Lcom/android/launcher2/Hotseat$2;-><init>(Lcom/android/launcher2/Hotseat;)V

    invoke-virtual {v1, v0}, Lcom/android/launcher2/BubbleTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    iget v0, p0, Lcom/android/launcher2/Hotseat;->mAllAppsButtonRank:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Hotseat;->getCellXFromOrder(I)I

    move-result v8

    .line 145
    .local v8, x:I
    iget v0, p0, Lcom/android/launcher2/Hotseat;->mAllAppsButtonRank:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Hotseat;->getCellYFromOrder(I)I

    move-result v9

    .line 146
    .local v9, y:I
    new-instance v4, Lcom/android/launcher2/CellLayout$LayoutParams;

    invoke-direct {v4, v8, v9, v5, v5}, Lcom/android/launcher2/CellLayout$LayoutParams;-><init>(IIII)V

    .line 147
    .local v4, lp:Lcom/android/launcher2/CellLayout$LayoutParams;
    iput-boolean v3, v4, Lcom/android/launcher2/CellLayout$LayoutParams;->canReorder:Z

    .line 148
    iget-object v0, p0, Lcom/android/launcher2/Hotseat;->mContent:Lcom/android/launcher2/CellLayout;

    const/4 v2, -0x1

    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher2/CellLayout;->addViewToCellLayout(Landroid/view/View;IILcom/android/launcher2/CellLayout$LayoutParams;Z)Z

    .line 149
    return-void
.end method

.method public setup(Lcom/android/launcher2/Launcher;)V
    .locals 1
    .parameter "launcher"

    .prologue
    .line 69
    iput-object p1, p0, Lcom/android/launcher2/Hotseat;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 70
    new-instance v0, Lcom/android/launcher2/HotseatIconKeyEventListener;

    invoke-direct {v0}, Lcom/android/launcher2/HotseatIconKeyEventListener;-><init>()V

    invoke-virtual {p0, v0}, Lcom/android/launcher2/Hotseat;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 71
    return-void
.end method
