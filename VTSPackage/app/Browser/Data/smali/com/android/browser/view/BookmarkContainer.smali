.class public Lcom/android/browser/view/BookmarkContainer;
.super Landroid/widget/RelativeLayout;
.source "BookmarkContainer.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mIgnoreRequestLayout:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 35
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/view/BookmarkContainer;->mIgnoreRequestLayout:Z

    .line 36
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->init()V

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 40
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/view/BookmarkContainer;->mIgnoreRequestLayout:Z

    .line 41
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->init()V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/browser/view/BookmarkContainer;->mIgnoreRequestLayout:Z

    .line 47
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->init()V

    .line 48
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 1

    .prologue
    .line 67
    invoke-super {p0}, Landroid/widget/RelativeLayout;->drawableStateChanged()V

    .line 68
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->isPressed()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkContainer;->updateTransitionDrawable(Z)V

    .line 69
    return-void
.end method

.method init()V
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkContainer;->setFocusable(Z)V

    .line 52
    invoke-super {p0, p0}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/browser/view/BookmarkContainer;->updateTransitionDrawable(Z)V

    .line 89
    iget-object v0, p0, Lcom/android/browser/view/BookmarkContainer;->mClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/android/browser/view/BookmarkContainer;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 92
    :cond_0
    return-void
.end method

.method public requestLayout()V
    .locals 1

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/android/browser/view/BookmarkContainer;->mIgnoreRequestLayout:Z

    if-nez v0, :cond_0

    .line 101
    invoke-super {p0}, Landroid/widget/RelativeLayout;->requestLayout()V

    .line 103
    :cond_0
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 58
    return-void
.end method

.method public setIgnoreRequestLayout(Z)V
    .locals 0
    .parameter "ignore"

    .prologue
    .line 95
    iput-boolean p1, p0, Lcom/android/browser/view/BookmarkContainer;->mIgnoreRequestLayout:Z

    .line 96
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0
    .parameter "l"

    .prologue
    .line 62
    iput-object p1, p0, Lcom/android/browser/view/BookmarkContainer;->mClickListener:Landroid/view/View$OnClickListener;

    .line 63
    return-void
.end method

.method updateTransitionDrawable(Z)V
    .locals 4
    .parameter "pressed"

    .prologue
    .line 72
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v1

    .line 73
    .local v1, longPressTimeout:I
    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 74
    .local v2, selector:Landroid/graphics/drawable/Drawable;
    if-eqz v2, :cond_0

    instance-of v3, v2, Landroid/graphics/drawable/StateListDrawable;

    if-eqz v3, :cond_0

    .line 75
    check-cast v2, Landroid/graphics/drawable/StateListDrawable;

    .end local v2           #selector:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 76
    .local v0, d:Landroid/graphics/drawable/Drawable;
    if-eqz v0, :cond_0

    instance-of v3, v0, Landroid/graphics/drawable/TransitionDrawable;

    if-eqz v3, :cond_0

    .line 77
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/browser/view/BookmarkContainer;->isLongClickable()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 78
    check-cast v0, Landroid/graphics/drawable/TransitionDrawable;

    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 84
    :cond_0
    :goto_0
    return-void

    .line 80
    .restart local v0       #d:Landroid/graphics/drawable/Drawable;
    :cond_1
    check-cast v0, Landroid/graphics/drawable/TransitionDrawable;

    .end local v0           #d:Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    goto :goto_0
.end method
