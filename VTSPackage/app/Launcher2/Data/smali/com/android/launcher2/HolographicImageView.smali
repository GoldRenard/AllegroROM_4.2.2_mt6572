.class public Lcom/android/launcher2/HolographicImageView;
.super Landroid/widget/ImageView;
.source "HolographicImageView.java"


# instance fields
.field private final mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/HolographicImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 33
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/HolographicImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 37
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance v0, Lcom/android/launcher2/HolographicViewHelper;

    invoke-direct {v0, p1}, Lcom/android/launcher2/HolographicViewHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/launcher2/HolographicImageView;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    .line 40
    return-void
.end method


# virtual methods
.method invalidatePressedFocusedStates()V
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/launcher2/HolographicImageView;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    invoke-virtual {v0, p0}, Lcom/android/launcher2/HolographicViewHelper;->invalidatePressedFocusedStates(Landroid/widget/ImageView;)V

    .line 44
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1
    .parameter "canvas"

    .prologue
    .line 48
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 52
    iget-object v0, p0, Lcom/android/launcher2/HolographicImageView;->mHolographicHelper:Lcom/android/launcher2/HolographicViewHelper;

    invoke-virtual {v0, p0}, Lcom/android/launcher2/HolographicViewHelper;->generatePressedFocusedStates(Landroid/widget/ImageView;)V

    .line 53
    return-void
.end method
