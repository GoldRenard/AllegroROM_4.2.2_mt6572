.class public Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FixedSizeDrawable.java"


# instance fields
.field mBottom:I

.field mDrawable:Landroid/graphics/drawable/Drawable;

.field mLeft:I

.field mRight:I

.field mTop:I


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .parameter "that"

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 34
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 3
    .parameter "canvas"

    .prologue
    .line 52
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 53
    return-void
.end method

.method public getOpacity()I
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public setAlpha(I)V
    .registers 3
    .parameter "alpha"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 61
    return-void
.end method

.method public setBounds(IIII)V
    .registers 10
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 48
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mLeft:I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mTop:I

    iget v3, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mRight:I

    iget v4, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 49
    return-void
.end method

.method public setBounds(Landroid/graphics/Rect;)V
    .registers 7
    .parameter "bounds"

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v1, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mLeft:I

    iget v2, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mTop:I

    iget v3, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mRight:I

    iget v4, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mBottom:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3
    .parameter "cf"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 65
    return-void
.end method

.method public setFixedBounds(IIII)V
    .registers 5
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    .line 37
    iput p1, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mLeft:I

    .line 38
    iput p2, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mTop:I

    .line 39
    iput p3, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mRight:I

    .line 40
    iput p4, p0, Lcom/android/systemui/statusbar/policy/FixedSizeDrawable;->mBottom:I

    .line 41
    return-void
.end method
