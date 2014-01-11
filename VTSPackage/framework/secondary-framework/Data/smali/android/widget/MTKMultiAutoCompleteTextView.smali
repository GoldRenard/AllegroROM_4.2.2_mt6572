.class public Landroid/widget/MTKMultiAutoCompleteTextView;
.super Landroid/widget/MultiAutoCompleteTextView;
.source "MTKMultiAutoCompleteTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 55
    invoke-direct {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 59
    invoke-direct {p0, p1, p2}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/MultiAutoCompleteTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    return-void
.end method


# virtual methods
.method public mtkGetMaxLines()I
    .locals 1

    .prologue
    .line 71
    invoke-super {p0}, Landroid/widget/MultiAutoCompleteTextView;->getMaxLines()I

    move-result v0

    return v0
.end method

.method public final mtkSetShowSoftInputOnFocus(Z)V
    .locals 0
    .parameter "show"

    .prologue
    .line 67
    invoke-super {p0, p1}, Landroid/widget/MultiAutoCompleteTextView;->setShowSoftInputOnFocus(Z)V

    .line 68
    return-void
.end method
