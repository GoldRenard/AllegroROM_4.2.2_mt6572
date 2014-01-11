.class public abstract Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;
.super Lcom/cyanogenmod/trebuchet/PagedView;
.source "PagedViewWithDraggableItems.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field private mDragSlopeThreshold:F

.field private mIsDragEnabled:Z

.field private mIsDragging:Z

.field private mLastTouchedItem:Landroid/view/View;

.field private mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 44
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/PagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    check-cast p1, Lcom/cyanogenmod/trebuchet/Launcher;

    .end local p1
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    .line 54
    return-void
.end method

.method private handleTouchEvent(Landroid/view/MotionEvent;)V
    .locals 3
    .parameter "ev"

    .prologue
    const/4 v2, 0x1

    .line 69
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 70
    .local v0, action:I
    and-int/lit16 v1, v0, 0xff

    packed-switch v1, :pswitch_data_0

    .line 84
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 72
    :pswitch_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->cancelDragging()V

    .line 73
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragEnabled:Z

    goto :goto_0

    .line 76
    :pswitch_2
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mTouchState:I

    if-eq v1, v2, :cond_0

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragging:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragEnabled:Z

    if-eqz v1, :cond_0

    .line 78
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getLockWorkspace()Z

    move-result v1

    if-nez v1, :cond_0

    .line 79
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->determineDraggingStart(Landroid/view/MotionEvent;)V

    goto :goto_0

    .line 70
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method protected beginDragging(Landroid/view/View;)Z
    .locals 2
    .parameter "v"

    .prologue
    const/4 v1, 0x1

    .line 57
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragging:Z

    .line 58
    .local v0, wasDragging:Z
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragging:Z

    .line 59
    if-nez v0, :cond_0

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected cancelDragging()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 63
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragging:Z

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastTouchedItem:Landroid/view/View;

    .line 65
    iput-boolean v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragEnabled:Z

    .line 66
    return-void
.end method

.method protected determineDraggingStart(Landroid/view/MotionEvent;)V
    .locals 13
    .parameter "ev"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 142
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mActivePointerId:I

    invoke-virtual {p1, v11}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    .line 143
    .local v2, pointerIndex:I
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    .line 144
    .local v4, x:F
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    .line 145
    .local v6, y:F
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastMotionX:F

    sub-float v11, v4, v11

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    float-to-int v5, v11

    .line 146
    .local v5, xDiff:I
    iget v11, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastMotionY:F

    sub-float v11, v6, v11

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v11

    float-to-int v7, v11

    .line 148
    .local v7, yDiff:I
    iget v3, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mTouchSlop:I

    .line 149
    .local v3, touchSlop:I
    if-le v7, v3, :cond_1

    move v8, v9

    .line 150
    .local v8, yMoved:Z
    :goto_0
    int-to-float v11, v7

    int-to-float v12, v5

    div-float/2addr v11, v12

    iget v12, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mDragSlopeThreshold:F

    cmpl-float v11, v11, v12

    if-lez v11, :cond_2

    move v1, v9

    .line 152
    .local v1, isUpwardMotion:Z
    :goto_1
    if-eqz v1, :cond_0

    if-eqz v8, :cond_0

    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastTouchedItem:Landroid/view/View;

    if-eqz v9, :cond_0

    .line 154
    iget-object v9, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastTouchedItem:Landroid/view/View;

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->beginDragging(Landroid/view/View;)Z

    .line 157
    iget-boolean v9, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mAllowLongPress:Z

    if-eqz v9, :cond_0

    .line 158
    iput-boolean v10, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mAllowLongPress:Z

    .line 162
    iget v9, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mCurrentPage:I

    invoke-virtual {p0, v9}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->getPageAt(I)Landroid/view/View;

    move-result-object v0

    .line 163
    .local v0, currentPage:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 164
    invoke-virtual {v0}, Landroid/view/View;->cancelLongPress()V

    .line 168
    .end local v0           #currentPage:Landroid/view/View;
    :cond_0
    return-void

    .end local v1           #isUpwardMotion:Z
    .end local v8           #yMoved:Z
    :cond_1
    move v8, v10

    .line 149
    goto :goto_0

    .restart local v8       #yMoved:Z
    :cond_2
    move v1, v10

    .line 150
    goto :goto_1
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;)V
    .locals 1
    .parameter "ev"

    .prologue
    .line 130
    iget-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragging:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->determineScrollingStart(Landroid/view/MotionEvent;)V

    .line 131
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 176
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->cancelDragging()V

    .line 177
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/PagedView;->onDetachedFromWindow()V

    .line 178
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 88
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->handleTouchEvent(Landroid/view/MotionEvent;)V

    .line 89
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 4
    .parameter "v"

    .prologue
    const/4 v0, 0x0

    .line 108
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getLockWorkspace()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 109
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v2, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    const v3, 0x7f090010

    invoke-virtual {v2, v3}, Lcom/cyanogenmod/trebuchet/Launcher;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 122
    :cond_0
    :goto_0
    return v0

    .line 113
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->isInTouchMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    iget v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mNextPage:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 117
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->isAllAppsVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->getWorkspace()Lcom/cyanogenmod/trebuchet/Workspace;

    move-result-object v1

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Workspace;->isSwitchingState()Z

    move-result v1

    if-nez v1, :cond_0

    .line 120
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1}, Lcom/cyanogenmod/trebuchet/Launcher;->isDraggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 122
    invoke-virtual {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->beginDragging(Landroid/view/View;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onPageBeginMoving()V
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->showScrollingIndicator(Z)V

    .line 183
    return-void
.end method

.method protected onPageEndMoving()V
    .locals 1

    .prologue
    .line 185
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->hideScrollingIndicator(Z)V

    .line 186
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "v"
    .parameter "event"

    .prologue
    .line 100
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mLastTouchedItem:Landroid/view/View;

    .line 101
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mIsDragEnabled:Z

    .line 102
    const/4 v0, 0x0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 94
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->handleTouchEvent(Landroid/view/MotionEvent;)V

    .line 95
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/PagedView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setDragSlopeThreshold(F)V
    .locals 0
    .parameter "dragSlopeThreshold"

    .prologue
    .line 171
    iput p1, p0, Lcom/cyanogenmod/trebuchet/PagedViewWithDraggableItems;->mDragSlopeThreshold:F

    .line 172
    return-void
.end method
