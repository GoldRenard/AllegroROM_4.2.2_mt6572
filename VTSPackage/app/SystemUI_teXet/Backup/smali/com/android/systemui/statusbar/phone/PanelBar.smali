.class public Lcom/android/systemui/statusbar/phone/PanelBar;
.super Landroid/widget/FrameLayout;
.source "PanelBar.java"


# static fields
.field public static final DEBUG:Z = false

.field public static final STATE_CLOSED:I = 0x0

.field public static final STATE_OPEN:I = 0x2

.field public static final STATE_OPENING:I = 0x1

.field public static final TAG:Ljava/lang/String;


# instance fields
.field mPanelExpandedFractionSum:F

.field mPanelHolder:Lcom/android/systemui/statusbar/phone/PanelHolder;

.field mPanels:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/systemui/statusbar/phone/PanelView;",
            ">;"
        }
    .end annotation
.end field

.field private mState:I

.field mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

.field private mTracking:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const-class v0, Lcom/android/systemui/statusbar/phone/PanelBar;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/systemui/statusbar/phone/PanelBar;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mState:I

    .line 55
    return-void
.end method

.method public static final varargs LOG(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2
    .parameter "fmt"
    .parameter "args"

    .prologue
    .line 32
    return-void
.end method


# virtual methods
.method public addPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .registers 3
    .parameter "pv"

    .prologue
    .line 63
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    invoke-virtual {p1, p0}, Lcom/android/systemui/statusbar/phone/PanelView;->setBar(Lcom/android/systemui/statusbar/phone/PanelBar;)V

    .line 65
    return-void
.end method

.method public collapseAllPanels(Z)V
    .registers 6
    .parameter "animate"

    .prologue
    .line 179
    const/4 v2, 0x0

    .line 180
    .local v2, waiting:Z
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/phone/PanelView;

    .line 181
    .local v1, pv:Lcom/android/systemui/statusbar/phone/PanelView;
    if-eqz p1, :cond_20

    invoke-virtual {v1}, Lcom/android/systemui/statusbar/phone/PanelView;->isFullyCollapsed()Z

    move-result v3

    if-nez v3, :cond_20

    .line 182
    invoke-virtual {v1}, Lcom/android/systemui/statusbar/phone/PanelView;->collapse()V

    .line 183
    const/4 v2, 0x1

    goto :goto_7

    .line 185
    :cond_20
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lcom/android/systemui/statusbar/phone/PanelView;->setExpandedFraction(F)V

    .line 186
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Lcom/android/systemui/statusbar/phone/PanelView;->setVisibility(I)V

    goto :goto_7

    .line 190
    .end local v1           #pv:Lcom/android/systemui/statusbar/phone/PanelView;
    :cond_2a
    if-nez v2, :cond_37

    iget v3, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mState:I

    if-eqz v3, :cond_37

    .line 193
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/android/systemui/statusbar/phone/PanelBar;->go(I)V

    .line 194
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->onAllPanelsCollapsed()V

    .line 196
    :cond_37
    return-void
.end method

.method public getBarHeight()F
    .registers 2

    .prologue
    .line 84
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    return v0
.end method

.method public go(I)V
    .registers 2
    .parameter "state"

    .prologue
    .line 50
    iput p1, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mState:I

    .line 51
    return-void
.end method

.method public onAllPanelsCollapsed()V
    .registers 1

    .prologue
    .line 204
    return-void
.end method

.method protected onFinishInflate()V
    .registers 1

    .prologue
    .line 59
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 60
    return-void
.end method

.method public onPanelFullyOpened(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .registers 2
    .parameter "openPanel"

    .prologue
    .line 208
    return-void
.end method

.method public onPanelPeeked()V
    .registers 1

    .prologue
    .line 200
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .parameter "event"

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x1

    .line 99
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->panelsEnabled()Z

    move-result v3

    if-nez v3, :cond_a

    const/4 v2, 0x0

    .line 123
    :goto_9
    return v2

    .line 102
    :cond_a
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_25

    .line 103
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/phone/PanelBar;->selectPanelForTouch(Landroid/view/MotionEvent;)Lcom/android/systemui/statusbar/phone/PanelView;

    move-result-object v1

    .line 104
    .local v1, panel:Lcom/android/systemui/statusbar/phone/PanelView;
    if-nez v1, :cond_19

    .line 107
    iput-object v4, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    goto :goto_9

    .line 110
    :cond_19
    invoke-virtual {v1}, Lcom/android/systemui/statusbar/phone/PanelView;->isEnabled()Z

    move-result v0

    .line 113
    .local v0, enabled:Z
    if-nez v0, :cond_22

    .line 115
    iput-object v4, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    goto :goto_9

    .line 118
    :cond_22
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/PanelBar;->startOpeningPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V

    .line 120
    .end local v0           #enabled:Z
    .end local v1           #panel:Lcom/android/systemui/statusbar/phone/PanelView;
    :cond_25
    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    if-eqz v3, :cond_2f

    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    invoke-virtual {v3, p1}, Lcom/android/systemui/statusbar/phone/PanelView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 123
    .local v2, result:Z
    :cond_2f
    goto :goto_9
.end method

.method public onTrackingStarted(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .registers 3
    .parameter "panel"

    .prologue
    .line 211
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTracking:Z

    .line 216
    return-void
.end method

.method public onTrackingStopped(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .registers 3
    .parameter "panel"

    .prologue
    .line 219
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTracking:Z

    .line 220
    invoke-virtual {p1}, Lcom/android/systemui/statusbar/phone/PanelView;->getExpandedFraction()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/android/systemui/statusbar/phone/PanelBar;->panelExpansionChanged(Lcom/android/systemui/statusbar/phone/PanelView;F)V

    .line 221
    return-void
.end method

.method public panelExpansionChanged(Lcom/android/systemui/statusbar/phone/PanelView;F)V
    .registers 14
    .parameter "panel"
    .parameter "frac"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v9, 0x0

    .line 139
    const/4 v0, 0x1

    .line 140
    .local v0, fullyClosed:Z
    const/4 v1, 0x0

    .line 142
    .local v1, fullyOpenedPanel:Lcom/android/systemui/statusbar/phone/PanelView;
    iput v9, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelExpandedFractionSum:F

    .line 143
    iget-object v8, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_62

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/PanelView;

    .line 144
    .local v3, pv:Lcom/android/systemui/statusbar/phone/PanelView;
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/PanelView;->getVisibility()I

    move-result v8

    if-nez v8, :cond_56

    move v5, v6

    .line 146
    .local v5, visible:Z
    :goto_20
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/PanelView;->getExpandedHeight()F

    move-result v8

    cmpl-float v8, v8, v9

    if-lez v8, :cond_48

    .line 147
    iget v8, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mState:I

    if-nez v8, :cond_32

    .line 148
    invoke-virtual {p0, v6}, Lcom/android/systemui/statusbar/phone/PanelBar;->go(I)V

    .line 149
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->onPanelPeeked()V

    .line 151
    :cond_32
    const/4 v0, 0x0

    .line 152
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/PanelView;->getExpandedFraction()F

    move-result v4

    .line 153
    .local v4, thisFrac:F
    iget v10, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelExpandedFractionSum:F

    if-eqz v5, :cond_58

    move v8, v4

    :goto_3c
    add-float/2addr v8, v10

    iput v8, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelExpandedFractionSum:F

    .line 155
    if-ne p1, v3, :cond_48

    .line 156
    const/high16 v8, 0x3f80

    cmpl-float v8, v4, v8

    if-nez v8, :cond_48

    move-object v1, p1

    .line 159
    .end local v4           #thisFrac:F
    :cond_48
    invoke-virtual {v3}, Lcom/android/systemui/statusbar/phone/PanelView;->getExpandedHeight()F

    move-result v8

    cmpl-float v8, v8, v9

    if-lez v8, :cond_5a

    .line 160
    if-nez v5, :cond_d

    invoke-virtual {v3, v7}, Lcom/android/systemui/statusbar/phone/PanelView;->setVisibility(I)V

    goto :goto_d

    .end local v5           #visible:Z
    :cond_56
    move v5, v7

    .line 144
    goto :goto_20

    .restart local v4       #thisFrac:F
    .restart local v5       #visible:Z
    :cond_58
    move v8, v9

    .line 153
    goto :goto_3c

    .line 162
    .end local v4           #thisFrac:F
    :cond_5a
    if-eqz v5, :cond_d

    const/16 v8, 0x8

    invoke-virtual {v3, v8}, Lcom/android/systemui/statusbar/phone/PanelView;->setVisibility(I)V

    goto :goto_d

    .line 165
    .end local v3           #pv:Lcom/android/systemui/statusbar/phone/PanelView;
    .end local v5           #visible:Z
    :cond_62
    iget v6, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelExpandedFractionSum:F

    iget-object v8, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v6, v8

    iput v6, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelExpandedFractionSum:F

    .line 166
    if-eqz v1, :cond_7c

    iget-boolean v6, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTracking:Z

    if-nez v6, :cond_7c

    .line 167
    const/4 v6, 0x2

    invoke-virtual {p0, v6}, Lcom/android/systemui/statusbar/phone/PanelBar;->go(I)V

    .line 168
    invoke-virtual {p0, v1}, Lcom/android/systemui/statusbar/phone/PanelBar;->onPanelFullyOpened(Lcom/android/systemui/statusbar/phone/PanelView;)V

    .line 176
    :cond_7b
    :goto_7b
    return-void

    .line 169
    :cond_7c
    if-eqz v0, :cond_7b

    iget-boolean v6, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTracking:Z

    if-nez v6, :cond_7b

    iget v6, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mState:I

    if-eqz v6, :cond_7b

    .line 170
    invoke-virtual {p0, v7}, Lcom/android/systemui/statusbar/phone/PanelBar;->go(I)V

    .line 171
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->onAllPanelsCollapsed()V

    goto :goto_7b
.end method

.method public panelsEnabled()Z
    .registers 2

    .prologue
    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method public selectPanelForTouch(Landroid/view/MotionEvent;)Lcom/android/systemui/statusbar/phone/PanelView;
    .registers 6
    .parameter "touch"

    .prologue
    .line 88
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 89
    .local v0, N:I
    iget-object v1, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    int-to-float v2, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    mul-float/2addr v2, v3

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/phone/PanelBar;->getMeasuredWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/phone/PanelView;

    return-object v1
.end method

.method public setPanelHolder(Lcom/android/systemui/statusbar/phone/PanelHolder;)V
    .registers 8
    .parameter "ph"

    .prologue
    .line 68
    if-nez p1, :cond_f

    .line 69
    sget-object v3, Lcom/android/systemui/statusbar/phone/PanelBar;->TAG:Ljava/lang/String;

    const-string v4, "setPanelHolder: null PanelHolder"

    new-instance v5, Ljava/lang/Throwable;

    invoke-direct {v5}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v3, v4, v5}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    :cond_e
    return-void

    .line 72
    :cond_f
    invoke-virtual {p1, p0}, Lcom/android/systemui/statusbar/phone/PanelHolder;->setBar(Lcom/android/systemui/statusbar/phone/PanelBar;)V

    .line 73
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelHolder:Lcom/android/systemui/statusbar/phone/PanelHolder;

    .line 74
    invoke-virtual {p1}, Lcom/android/systemui/statusbar/phone/PanelHolder;->getChildCount()I

    move-result v0

    .line 75
    .local v0, N:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_19
    if-ge v1, v0, :cond_e

    .line 76
    invoke-virtual {p1, v1}, Lcom/android/systemui/statusbar/phone/PanelHolder;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 77
    .local v2, v:Landroid/view/View;
    if-eqz v2, :cond_2a

    instance-of v3, v2, Lcom/android/systemui/statusbar/phone/PanelView;

    if-eqz v3, :cond_2a

    .line 78
    check-cast v2, Lcom/android/systemui/statusbar/phone/PanelView;

    .end local v2           #v:Landroid/view/View;
    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/phone/PanelBar;->addPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V

    .line 75
    :cond_2a
    add-int/lit8 v1, v1, 0x1

    goto :goto_19
.end method

.method public startOpeningPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V
    .registers 6
    .parameter "panel"

    .prologue
    .line 129
    iput-object p1, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    .line 130
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanelHolder:Lcom/android/systemui/statusbar/phone/PanelHolder;

    iget-object v3, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mTouchingPanel:Lcom/android/systemui/statusbar/phone/PanelView;

    invoke-virtual {v2, v3}, Lcom/android/systemui/statusbar/phone/PanelHolder;->setSelectedPanel(Lcom/android/systemui/statusbar/phone/PanelView;)V

    .line 131
    iget-object v2, p0, Lcom/android/systemui/statusbar/phone/PanelBar;->mPanels:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/systemui/statusbar/phone/PanelView;

    .line 132
    .local v1, pv:Lcom/android/systemui/statusbar/phone/PanelView;
    if-eq v1, p1, :cond_f

    .line 133
    invoke-virtual {v1}, Lcom/android/systemui/statusbar/phone/PanelView;->collapse()V

    goto :goto_f

    .line 136
    .end local v1           #pv:Lcom/android/systemui/statusbar/phone/PanelView;
    :cond_21
    return-void
.end method
