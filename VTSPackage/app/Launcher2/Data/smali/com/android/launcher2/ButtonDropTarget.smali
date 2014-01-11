.class public Lcom/android/launcher2/ButtonDropTarget;
.super Landroid/widget/TextView;
.source "ButtonDropTarget.java"

# interfaces
.implements Lcom/android/launcher2/DropTarget;
.implements Lcom/android/launcher2/DragController$DragListener;


# instance fields
.field protected mActive:Z

.field private mBottomDragPadding:I

.field protected mHoverColor:I

.field protected mLauncher:Lcom/android/launcher2/Launcher;

.field protected mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

.field protected mText:Landroid/widget/TextView;

.field protected final mTransitionDuration:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 50
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 53
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 46
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    .line 55
    invoke-virtual {p0}, Lcom/android/launcher2/ButtonDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 56
    .local v0, r:Landroid/content/res/Resources;
    const v1, 0x7f0a0010

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mTransitionDuration:I

    .line 57
    const v1, 0x7f0b002e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mBottomDragPadding:I

    .line 58
    return-void
.end method


# virtual methods
.method public acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 1
    .parameter "d"

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method protected getCurrentDrawable()Landroid/graphics/drawable/Drawable;
    .locals 3

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/android/launcher2/ButtonDropTarget;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 74
    .local v0, drawables:[Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 75
    aget-object v2, v0, v1

    if-eqz v2, :cond_0

    .line 76
    aget-object v2, v0, v1

    .line 79
    :goto_1
    return-object v2

    .line 74
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 79
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public getDropTargetDelegate(Lcom/android/launcher2/DropTarget$DragObject;)Lcom/android/launcher2/DropTarget;
    .locals 1
    .parameter "d"

    .prologue
    .line 141
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHitRect(Landroid/graphics/Rect;)V
    .locals 2
    .parameter "outRect"

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/widget/TextView;->getHitRect(Landroid/graphics/Rect;)V

    .line 116
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mBottomDragPadding:I

    add-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 117
    return-void
.end method

.method getIconRect(IIII)Landroid/graphics/Rect;
    .locals 10
    .parameter "itemWidth"
    .parameter "itemHeight"
    .parameter "drawableWidth"
    .parameter "drawableHeight"

    .prologue
    .line 120
    iget-object v8, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v8}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    .line 123
    .local v0, dragLayer:Lcom/android/launcher2/DragLayer;
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 124
    .local v3, to:Landroid/graphics/Rect;
    invoke-virtual {v0, p0, v3}, Lcom/android/launcher2/DragLayer;->getViewRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 125
    move v5, p3

    .line 126
    .local v5, width:I
    move v1, p4

    .line 127
    .local v1, height:I
    iget v8, v3, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Lcom/android/launcher2/ButtonDropTarget;->getPaddingLeft()I

    move-result v9

    add-int v2, v8, v9

    .line 128
    .local v2, left:I
    iget v8, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/android/launcher2/ButtonDropTarget;->getMeasuredHeight()I

    move-result v9

    sub-int/2addr v9, v1

    div-int/lit8 v9, v9, 0x2

    add-int v4, v8, v9

    .line 129
    .local v4, top:I
    add-int v8, v2, v5

    add-int v9, v4, v1

    invoke-virtual {v3, v2, v4, v8, v9}, Landroid/graphics/Rect;->set(IIII)V

    .line 132
    sub-int v8, p1, v5

    neg-int v8, v8

    div-int/lit8 v6, v8, 0x2

    .line 133
    .local v6, xOffset:I
    sub-int v8, p2, v1

    neg-int v8, v8

    div-int/lit8 v7, v8, 0x2

    .line 134
    .local v7, yOffset:I
    invoke-virtual {v3, v6, v7}, Landroid/graphics/Rect;->offset(II)V

    .line 136
    return-object v3
.end method

.method public getLocationInDragLayer([I)V
    .locals 1
    .parameter "loc"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->getDragLayer()Lcom/android/launcher2/DragLayer;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/android/launcher2/DragLayer;->getLocationInDragLayer(Landroid/view/View;[I)F

    .line 146
    return-void
.end method

.method public isDropEnabled()Z
    .locals 1

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mActive:Z

    return v0
.end method

.method public onDragEnd()V
    .locals 0

    .prologue
    .line 111
    return-void
.end method

.method public onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 90
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    iget v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setColor(I)V

    .line 91
    return-void
.end method

.method public onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 98
    iget-object v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragView:Lcom/android/launcher2/DragView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/launcher2/DragView;->setColor(I)V

    .line 99
    return-void
.end method

.method public onDragOver(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 95
    return-void
.end method

.method public onDragStart(Lcom/android/launcher2/DragSource;Ljava/lang/Object;I)V
    .locals 0
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 103
    return-void
.end method

.method public onDrop(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 0
    .parameter "d"

    .prologue
    .line 83
    return-void
.end method

.method public onFlingToDelete(Lcom/android/launcher2/DropTarget$DragObject;IILandroid/graphics/PointF;)V
    .locals 0
    .parameter "d"
    .parameter "x"
    .parameter "y"
    .parameter "vec"

    .prologue
    .line 87
    return-void
.end method

.method setLauncher(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter "launcher"

    .prologue
    .line 61
    iput-object p1, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 62
    return-void
.end method

.method public setSearchDropTargetBar(Lcom/android/launcher2/SearchDropTargetBar;)V
    .locals 0
    .parameter "searchDropTargetBar"

    .prologue
    .line 69
    iput-object p1, p0, Lcom/android/launcher2/ButtonDropTarget;->mSearchDropTargetBar:Lcom/android/launcher2/SearchDropTargetBar;

    .line 70
    return-void
.end method
