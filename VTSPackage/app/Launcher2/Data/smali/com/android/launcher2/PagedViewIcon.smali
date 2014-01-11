.class public Lcom/android/launcher2/PagedViewIcon;
.super Landroid/widget/TextView;
.source "PagedViewIcon.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher2/PagedViewIcon$PressedCallback;
    }
.end annotation


# static fields
.field private static final PRESS_ALPHA:F = 0.4f

.field private static final TAG:Ljava/lang/String; = "PagedViewIcon"


# instance fields
.field private mIcon:Landroid/graphics/Bitmap;

.field private mLockDrawableState:Z

.field private mPressedCallback:Lcom/android/launcher2/PagedViewIcon$PressedCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/launcher2/PagedViewIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/PagedViewIcon;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/PagedViewIcon;->mLockDrawableState:Z

    .line 56
    return-void
.end method


# virtual methods
.method public applyFromApplicationInfo(Lcom/android/launcher2/ApplicationInfo;ZLcom/android/launcher2/PagedViewIcon$PressedCallback;)V
    .locals 3
    .parameter "info"
    .parameter "scaleUp"
    .parameter "cb"

    .prologue
    const/4 v2, 0x0

    .line 60
    iget-object v0, p1, Lcom/android/launcher2/ApplicationInfo;->iconBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p0, Lcom/android/launcher2/PagedViewIcon;->mIcon:Landroid/graphics/Bitmap;

    .line 61
    iput-object p3, p0, Lcom/android/launcher2/PagedViewIcon;->mPressedCallback:Lcom/android/launcher2/PagedViewIcon$PressedCallback;

    .line 62
    new-instance v0, Lcom/android/launcher2/FastBitmapDrawable;

    iget-object v1, p0, Lcom/android/launcher2/PagedViewIcon;->mIcon:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Lcom/android/launcher2/FastBitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v2, v0, v2, v2}, Lcom/android/launcher2/PagedViewIcon;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 63
    iget-object v0, p1, Lcom/android/launcher2/ItemInfo;->title:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedViewIcon;->setText(Ljava/lang/CharSequence;)V

    .line 64
    invoke-virtual {p0, p1}, Lcom/android/launcher2/PagedViewIcon;->setTag(Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "canvas"

    .prologue
    .line 101
    invoke-super {p0, p1}, Landroid/widget/TextView;->draw(Landroid/graphics/Canvas;)V

    .line 102
    invoke-static {p1, p0}, Lcom/android/launcher2/MTKUnreadLoader;->drawUnreadEventIfNeed(Landroid/graphics/Canvas;Landroid/view/View;)V

    .line 103
    return-void
.end method

.method protected drawableStateChanged()V
    .locals 1

    .prologue
    .line 82
    invoke-super {p0}, Landroid/widget/TextView;->drawableStateChanged()V

    .line 86
    invoke-virtual {p0}, Lcom/android/launcher2/PagedViewIcon;->isPressed()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 87
    const v0, 0x3ecccccd

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedViewIcon;->setAlpha(F)V

    .line 88
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIcon;->mPressedCallback:Lcom/android/launcher2/PagedViewIcon$PressedCallback;

    if-eqz v0, :cond_0

    .line 89
    iget-object v0, p0, Lcom/android/launcher2/PagedViewIcon;->mPressedCallback:Lcom/android/launcher2/PagedViewIcon$PressedCallback;

    invoke-interface {v0, p0}, Lcom/android/launcher2/PagedViewIcon$PressedCallback;->iconPressed(Lcom/android/launcher2/PagedViewIcon;)V

    .line 94
    :cond_0
    :goto_0
    return-void

    .line 91
    :cond_1
    iget-boolean v0, p0, Lcom/android/launcher2/PagedViewIcon;->mLockDrawableState:Z

    if-nez v0, :cond_0

    .line 92
    const/high16 v0, 0x3f80

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedViewIcon;->setAlpha(F)V

    goto :goto_0
.end method

.method public lockDrawableState()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/launcher2/PagedViewIcon;->mLockDrawableState:Z

    .line 69
    return-void
.end method

.method public resetDrawableState()V
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/PagedViewIcon;->mLockDrawableState:Z

    .line 73
    new-instance v0, Lcom/android/launcher2/PagedViewIcon$1;

    invoke-direct {v0, p0}, Lcom/android/launcher2/PagedViewIcon$1;-><init>(Lcom/android/launcher2/PagedViewIcon;)V

    invoke-virtual {p0, v0}, Lcom/android/launcher2/PagedViewIcon;->post(Ljava/lang/Runnable;)Z

    .line 79
    return-void
.end method
