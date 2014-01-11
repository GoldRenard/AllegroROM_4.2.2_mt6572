.class public Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;
.super Landroid/widget/LinearLayout;
.source "ToolBarIndicator.java"

# interfaces
.implements Lcom/android/systemui/statusbar/toolbar/ToolBarView$ScrollToScreenCallback;


# static fields
.field private static final VIEW_PADDING_HORIZONTAL:I = 0x4


# instance fields
.field private mCount:I

.field private mDensity:F

.field private mFocusedDrawable:Landroid/graphics/drawable/Drawable;

.field private mNormalDrawable:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    invoke-direct {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->init()V

    .line 30
    return-void
.end method

.method private init()V
    .locals 3

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 34
    .local v0, metrics:Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    iput v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mDensity:F

    .line 35
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020247

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mNormalDrawable:Landroid/graphics/drawable/Drawable;

    .line 36
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020248

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mFocusedDrawable:Landroid/graphics/drawable/Drawable;

    .line 37
    return-void
.end method


# virtual methods
.method public generateIndicators()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 50
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->removeAllViews()V

    .line 51
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mCount:I

    if-ge v0, v3, :cond_0

    .line 52
    new-instance v1, Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mContext:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 53
    .local v1, imageView:Landroid/widget/ImageView;
    iget v3, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mDensity:F

    const/high16 v4, 0x4080

    mul-float/2addr v3, v4

    float-to-int v2, v3

    .line 54
    .local v2, padddingHorizontal:I
    invoke-virtual {v1, v2, v5, v2, v5}, Landroid/widget/ImageView;->setPadding(IIII)V

    .line 55
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->addView(Landroid/view/View;)V

    .line 51
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 57
    .end local v1           #imageView:Landroid/widget/ImageView;
    .end local v2           #padddingHorizontal:I
    :cond_0
    return-void
.end method

.method public onScrollFinish(I)V
    .locals 0
    .parameter "currentIndex"

    .prologue
    .line 46
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->updateIndicator(I)V

    .line 47
    return-void
.end method

.method public setCount(I)V
    .locals 1
    .parameter "count"

    .prologue
    .line 40
    iput p1, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mCount:I

    .line 41
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->generateIndicators()V

    .line 42
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->updateIndicator(I)V

    .line 43
    return-void
.end method

.method public updateIndicator(I)V
    .locals 3
    .parameter "currentIndex"

    .prologue
    .line 60
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mCount:I

    if-ge v0, v2, :cond_1

    .line 61
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 62
    .local v1, imageView:Landroid/widget/ImageView;
    if-ne p1, v0, :cond_0

    .line 63
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mFocusedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 60
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    :cond_0
    iget-object v2, p0, Lcom/android/systemui/statusbar/toolbar/ToolBarIndicator;->mNormalDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    .line 68
    .end local v1           #imageView:Landroid/widget/ImageView;
    :cond_1
    return-void
.end method
