.class public Lcom/android/browser/view/CustomScreenLinearLayout;
.super Landroid/widget/LinearLayout;
.source "CustomScreenLinearLayout.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 29
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/view/CustomScreenLinearLayout;->setChildrenDrawingOrderEnabled(Z)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/view/CustomScreenLinearLayout;->setChildrenDrawingOrderEnabled(Z)V

    .line 35
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/browser/view/CustomScreenLinearLayout;->setChildrenDrawingOrderEnabled(Z)V

    .line 41
    return-void
.end method


# virtual methods
.method protected getChildDrawingOrder(II)I
    .locals 1
    .parameter "childCount"
    .parameter "i"

    .prologue
    .line 45
    sub-int v0, p1, p2

    add-int/lit8 v0, v0, -0x1

    return v0
.end method
