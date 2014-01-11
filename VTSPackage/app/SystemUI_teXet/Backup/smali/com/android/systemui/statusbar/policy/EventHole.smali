.class public Lcom/android/systemui/statusbar/policy/EventHole;
.super Landroid/view/View;
.source "EventHole.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "StatusBar.EventHole"


# instance fields
.field private mLoc:[I

.field private mWindowVis:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/policy/EventHole;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 53
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/EventHole;->mLoc:[I

    .line 54
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 64
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 65
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 66
    return-void
.end method

.method public onComputeInternalInsets(Landroid/view/ViewTreeObserver$InternalInsetsInfo;)V
    .registers 13
    .parameter "info"

    .prologue
    const/4 v0, 0x1

    const/4 v5, 0x0

    .line 75
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->isShown()Z

    move-result v9

    if-eqz v9, :cond_3e

    iget-boolean v9, p0, Lcom/android/systemui/statusbar/policy/EventHole;->mWindowVis:Z

    if-eqz v9, :cond_3e

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getWidth()I

    move-result v9

    if-lez v9, :cond_3e

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getHeight()I

    move-result v9

    if-lez v9, :cond_3e

    move v8, v0

    .line 76
    .local v8, visible:Z
    :goto_19
    iget-object v6, p0, Lcom/android/systemui/statusbar/policy/EventHole;->mLoc:[I

    .line 77
    .local v6, loc:[I
    invoke-virtual {p0, v6}, Lcom/android/systemui/statusbar/policy/EventHole;->getLocationInWindow([I)V

    .line 78
    aget v1, v6, v5

    .line 79
    .local v1, l:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getWidth()I

    move-result v9

    add-int v3, v1, v9

    .line 80
    .local v3, r:I
    aget v2, v6, v0

    .line 81
    .local v2, t:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getHeight()I

    move-result v0

    add-int v4, v2, v0

    .line 83
    .local v4, b:I
    move-object v7, p0

    .line 84
    .local v7, top:Landroid/view/View;
    :goto_2f
    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/View;

    if-eqz v0, :cond_40

    .line 85
    invoke-virtual {v7}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v7

    .end local v7           #top:Landroid/view/View;
    check-cast v7, Landroid/view/View;

    .restart local v7       #top:Landroid/view/View;
    goto :goto_2f

    .end local v1           #l:I
    .end local v2           #t:I
    .end local v3           #r:I
    .end local v4           #b:I
    .end local v6           #loc:[I
    .end local v7           #top:Landroid/view/View;
    .end local v8           #visible:Z
    :cond_3e
    move v8, v5

    .line 75
    goto :goto_19

    .line 88
    .restart local v1       #l:I
    .restart local v2       #t:I
    .restart local v3       #r:I
    .restart local v4       #b:I
    .restart local v6       #loc:[I
    .restart local v7       #top:Landroid/view/View;
    .restart local v8       #visible:Z
    :cond_40
    if-eqz v8, :cond_5b

    .line 89
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    .line 91
    iget-object v0, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v9

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v10

    invoke-virtual {v0, v5, v5, v9, v10}, Landroid/graphics/Region;->set(IIII)Z

    .line 92
    iget-object v0, p1, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->touchableRegion:Landroid/graphics/Region;

    sget-object v5, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Region;->op(IIIILandroid/graphics/Region$Op;)Z

    .line 97
    :goto_5a
    return-void

    .line 94
    :cond_5b
    invoke-virtual {p1, v5}, Landroid/view/ViewTreeObserver$InternalInsetsInfo;->setTouchableInsets(I)V

    goto :goto_5a
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 70
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 71
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/EventHole;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnComputeInternalInsetsListener(Landroid/view/ViewTreeObserver$OnComputeInternalInsetsListener;)V

    .line 72
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .registers 3
    .parameter "visibility"

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 59
    if-nez p1, :cond_9

    const/4 v0, 0x1

    :goto_6
    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/EventHole;->mWindowVis:Z

    .line 60
    return-void

    .line 59
    :cond_9
    const/4 v0, 0x0

    goto :goto_6
.end method
