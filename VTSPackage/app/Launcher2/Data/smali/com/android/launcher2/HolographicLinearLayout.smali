.class public Lcom/android/launcher2/HolographicLinearLayout;
.super Landroid/widget/LinearLayout;
.source "HolographicLinearLayout.java"


# instance fields
.field private final mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

.field private mImageView:Landroid/widget/ImageView;

.field private mImageViewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/HolographicLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/HolographicLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    sget-object v1, Lcom/android/launcher/R$styleable;->HolographicLinearLayout:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 49
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v1, -0x1

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageViewId:I

    .line 50
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 52
    invoke-virtual {p0, v2}, Lcom/android/launcher2/HolographicLinearLayout;->setWillNotDraw(Z)V

    .line 53
    new-instance v1, Lcom/android/launcher2/HolographicViewHelper;

    invoke-direct {v1, p1}, Lcom/android/launcher2/HolographicViewHelper;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/launcher2/HolographicLinearLayout;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    .line 54
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 3

    .prologue
    .line 58
    invoke-super {p0}, Landroid/widget/LinearLayout;->drawableStateChanged()V

    .line 60
    iget-object v2, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 61
    iget-object v2, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 62
    .local v0, d:Landroid/graphics/drawable/Drawable;
    instance-of v2, v0, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 63
    check-cast v1, Landroid/graphics/drawable/StateListDrawable;

    .line 64
    .local v1, sld:Landroid/graphics/drawable/StateListDrawable;
    invoke-virtual {p0}, Lcom/android/launcher2/HolographicLinearLayout;->getDrawableState()[I

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    .line 67
    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    .end local v1           #sld:Landroid/graphics/drawable/StateListDrawable;
    :cond_0
    return-void
.end method

.method invalidatePressedFocusedStates()V
    .locals 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/android/launcher2/HolographicLinearLayout;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    iget-object v1, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/HolographicViewHelper;->invalidatePressedFocusedStates(Landroid/widget/ImageView;)V

    .line 71
    invoke-virtual {p0}, Lcom/android/launcher2/HolographicLinearLayout;->invalidate()V

    .line 72
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "canvas"

    .prologue
    .line 76
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 80
    iget-object v0, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    .line 81
    iget v0, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageViewId:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/HolographicLinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/HolographicLinearLayout;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    iget-object v1, p0, Lcom/android/launcher2/HolographicLinearLayout;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/android/launcher2/HolographicViewHelper;->generatePressedFocusedStates(Landroid/widget/ImageView;)V

    .line 84
    return-void
.end method
