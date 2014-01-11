.class public Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;
.super Landroid/widget/ScrollView;
.source "QuickSettingsScrollView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    return-void
.end method

.method private getScrollRange()I
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 41
    const/4 v1, 0x0

    .line 42
    .local v1, scrollRange:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_1f

    .line 43
    invoke-virtual {p0, v5}, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 44
    .local v0, child:Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->getHeight()I

    move-result v3

    iget v4, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->mPaddingBottom:I

    sub-int/2addr v3, v4

    iget v4, p0, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->mPaddingTop:I

    sub-int/2addr v3, v4

    sub-int/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 47
    .end local v0           #child:Landroid/view/View;
    :cond_1f
    return v1
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .parameter "ev"

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/android/systemui/statusbar/phone/QuickSettingsScrollView;->getScrollRange()I

    move-result v0

    .line 53
    .local v0, range:I
    if-nez v0, :cond_8

    .line 54
    const/4 v1, 0x0

    .line 57
    :goto_7
    return v1

    :cond_8
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    goto :goto_7
.end method
