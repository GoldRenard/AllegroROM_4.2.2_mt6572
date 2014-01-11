.class public Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;
.super Landroid/widget/LinearLayout;
.source "DrawableStateProxyView.java"


# instance fields
.field private mView:Landroid/view/View;

.field private mViewId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x0

    .line 43
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 45
    sget-object v1, Lcom/cyanogenmod/trebuchet/R$styleable;->DrawableStateProxyView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 47
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v1, -0x1

    invoke-virtual {v0, v2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mViewId:I

    .line 48
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    invoke-virtual {p0, v2}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->setFocusable(Z)V

    .line 51
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 3

    .prologue
    .line 55
    invoke-super {p0}, Landroid/widget/LinearLayout;->drawableStateChanged()V

    .line 57
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mView:Landroid/view/View;

    if-nez v1, :cond_0

    .line 58
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 59
    .local v0, parent:Landroid/view/View;
    iget v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mViewId:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mView:Landroid/view/View;

    .line 61
    .end local v0           #parent:Landroid/view/View;
    :cond_0
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->isPressed()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 62
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->mView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/DrawableStateProxyView;->isHovered()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setHovered(Z)V

    .line 63
    return-void
.end method

.method public onHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 67
    const/4 v0, 0x0

    return v0
.end method
