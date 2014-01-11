.class public Lcom/android/systemui/statusbar/phone/PanelHolder;
.super Landroid/widget/FrameLayout;
.source "PanelHolder.java"


# instance fields
.field private mBar:Lcom/android/systemui/statusbar/phone/PanelBar;

.field private mSelectedPanelIndex:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 26
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mSelectedPanelIndex:I

    .line 31
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/phone/PanelHolder;->setChildrenDrawingOrderEnabled(Z)V

    .line 32
    return-void
.end method


# virtual methods
.method protected getChildDrawingOrder(II)I
    .locals 2
    .parameter "childCount"
    .parameter "i"

    .prologue
    .line 55
    iget v0, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mSelectedPanelIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 63
    .end local p2
    :cond_0
    :goto_0
    return p2

    .line 58
    .restart local p2
    :cond_1
    add-int/lit8 v0, p1, -0x1

    if-ne p2, v0, :cond_2

    .line 59
    iget p2, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mSelectedPanelIndex:I

    goto :goto_0

    .line 60
    :cond_2
    iget v0, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mSelectedPanelIndex:I

    if-lt p2, v0, :cond_0

    .line 61
    add-int/lit8 p2, p2, 0x1

    goto :goto_0
.end method

.method public getPanelIndex(Lcom/android/systemui/statusbar/phone/PanelView;)I
    .locals 3
    .parameter "pv"

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelHolder;->getChildCount()I

    move-result v0

    .line 42
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 43
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/PanelHolder;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/statusbar/phone/PanelView;

    .line 44
    .local v2, v:Lcom/android/systemui/statusbar/phone/PanelView;
    if-ne p1, v2, :cond_0

    .line 46
    .end local v1           #i:I
    .end local v2           #v:Lcom/android/systemui/statusbar/phone/PanelView;
    :goto_1
    return v1

    .line 42
    .restart local v1       #i:I
    .restart local v2       #v:Lcom/android/systemui/statusbar/phone/PanelView;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 46
    .end local v2           #v:Lcom/android/systemui/statusbar/phone/PanelView;
    :cond_1
    const/4 v1, -0x1

    goto :goto_1
.end method

.method protected onFinishInflate()V
    .locals 1

    .prologue
    .line 36
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 37
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/phone/PanelHolder;->setChildrenDrawingOrderEnabled(Z)V

    .line 38
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    const/4 v2, 0x0

    .line 70
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 76
    :goto_0
    return v2

    .line 72
    :pswitch_0
    const-string v0, "PanelHolder got touch in open air, closing panels"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/android/systemui/statusbar/phone/PanelBar;->LOG(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mBar:Lcom/android/systemui/statusbar/phone/PanelBar;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/systemui/statusbar/phone/PanelBar;->collapseAllPanels(Z)V

    goto :goto_0

    .line 70
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public setBar(Lcom/android/systemui/statusbar/phone/PanelBar;)V
    .locals 0
    .parameter "panelBar"

    .prologue
    .line 80
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mBar:Lcom/android/systemui/statusbar/phone/PanelBar;

    .line 81
    return-void
.end method

.method public setSelectedPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .locals 1
    .parameter "pv"

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/phone/PanelHolder;->getPanelIndex(Lcom/android/systemui/statusbar/phone/PanelView;)I

    move-result v0

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PanelHolder;->mSelectedPanelIndex:I

    .line 51
    return-void
.end method
