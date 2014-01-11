.class public Lcom/android/internal/policy/impl/keyguard/DragView;
.super Landroid/view/View;
.source "DragView.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "DragView"


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

.field private mPaint:Landroid/graphics/Paint;

.field private mRegistrationX:I

.field private mRegistrationY:I


# direct methods
.method public constructor <init>(Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;Landroid/graphics/Bitmap;IIIIIIF)V
    .locals 5
    .parameter "lockScreenView"
    .parameter "bitmap"
    .parameter "registrationX"
    .parameter "registrationY"
    .parameter "left"
    .parameter "top"
    .parameter "width"
    .parameter "height"
    .parameter "initialScale"

    .prologue
    const/4 v4, 0x0

    .line 54
    invoke-virtual {p1}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 39
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    .line 55
    iput-object p1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    .line 57
    invoke-static {p2, p5, p6, p7, p8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    .line 60
    iput p3, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationX:I

    .line 61
    iput p4, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationY:I

    .line 64
    const-string v1, "DragView"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DragView constructor: mRegistrationX = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationX:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", mRegistrationY = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationY:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", this = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 70
    .local v0, ms:I
    invoke-virtual {p0, v0, v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->measure(II)V

    .line 71
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mPaint:Landroid/graphics/Paint;

    .line 72
    return-void
.end method


# virtual methods
.method move(FF)V
    .locals 3
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    .line 123
    const-string v0, "DragView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "move touchX="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", touchY="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationX:I

    int-to-float v0, v0

    sub-float v0, p1, v0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->setTranslationX(F)V

    .line 125
    iget v0, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationY:I

    int-to-float v0, v0

    sub-float v0, p2, v0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->setTranslationY(F)V

    .line 126
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .parameter "canvas"

    .prologue
    const/4 v3, 0x0

    .line 82
    const/4 v0, 0x0

    .line 89
    .local v0, debug:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 90
    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/policy/impl/keyguard/DragView;->setMeasuredDimension(II)V

    .line 77
    return-void
.end method

.method remove()V
    .locals 3

    .prologue
    .line 130
    const-string v0, "DragView"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remove DragView: this = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    invoke-virtual {p0}, Lcom/android/internal/policy/impl/keyguard/DragView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 137
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->setDrawingCacheEnabled(Z)V

    .line 138
    iget-object v0, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    invoke-virtual {v0, p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->removeView(Landroid/view/View;)V

    .line 140
    :cond_0
    return-void
.end method

.method public show(II)V
    .locals 4
    .parameter "touchX"
    .parameter "touchY"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 100
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mLockScreenLayout:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;

    invoke-virtual {v1, p0}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout;->addView(Landroid/view/View;)V

    .line 102
    invoke-virtual {p0, v3}, Lcom/android/internal/policy/impl/keyguard/DragView;->setDrawingCacheEnabled(Z)V

    .line 105
    new-instance v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;-><init>(II)V

    .line 106
    .local v0, lp:Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;->width:I

    .line 107
    iget-object v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;->height:I

    .line 108
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationX:I

    iput v1, v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;->x:I

    .line 109
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationY:I

    iput v1, v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;->y:I

    .line 110
    iput-boolean v3, v0, Lcom/android/internal/policy/impl/keyguard/LockScreenLayout$LayoutParams;->customPosition:Z

    .line 111
    invoke-virtual {p0, v0}, Lcom/android/internal/policy/impl/keyguard/DragView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationX:I

    sub-int v1, p1, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/DragView;->setTranslationX(F)V

    .line 113
    iget v1, p0, Lcom/android/internal/policy/impl/keyguard/DragView;->mRegistrationY:I

    sub-int v1, p2, v1

    int-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/android/internal/policy/impl/keyguard/DragView;->setTranslationY(F)V

    .line 114
    return-void
.end method
