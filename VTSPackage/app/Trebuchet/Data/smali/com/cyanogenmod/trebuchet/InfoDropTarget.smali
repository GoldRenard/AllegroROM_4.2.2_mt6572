.class public Lcom/cyanogenmod/trebuchet/InfoDropTarget;
.super Lcom/cyanogenmod/trebuchet/ButtonDropTarget;
.source "InfoDropTarget.java"


# instance fields
.field private mDrawable:Landroid/graphics/drawable/TransitionDrawable;

.field private mOriginalTextColor:Landroid/content/res/ColorStateList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    return-void
.end method

.method private isFromAllApps(Lcom/cyanogenmod/trebuchet/DragSource;)Z
    .locals 1
    .parameter "source"

    .prologue
    .line 65
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/AppsCustomizePagedView;

    return v0
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, 0x0

    .line 73
    const/4 v0, 0x0

    .line 74
    .local v0, componentName:Landroid/content/ComponentName;
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    if-eqz v1, :cond_2

    .line 75
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;

    iget-object v0, v1, Lcom/cyanogenmod/trebuchet/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    .line 81
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 82
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->startApplicationDetailsActivity(Landroid/content/ComponentName;)V

    .line 86
    :cond_1
    iput-boolean v2, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 87
    return v2

    .line 76
    :cond_2
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v1, :cond_3

    .line 77
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    iget-object v1, v1, Lcom/cyanogenmod/trebuchet/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    goto :goto_0

    .line 78
    :cond_3
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    if-eqz v1, :cond_0

    .line 79
    iget-object v1, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;

    iget-object v0, v1, Lcom/cyanogenmod/trebuchet/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public onDragEnd()V
    .locals 1

    .prologue
    .line 107
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnd()V

    .line 108
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mActive:Z

    .line 109
    return-void
.end method

.method public onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 112
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 114
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mTransitionDuration:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 115
    iget v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mHoverColor:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->setTextColor(I)V

    .line 116
    return-void
.end method

.method public onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 119
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 121
    iget-boolean v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 123
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 125
    :cond_0
    return-void
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 3
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 92
    const/4 v0, 0x1

    .line 95
    .local v0, isVisible:Z
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->isFromAllApps(Lcom/cyanogenmod/trebuchet/DragSource;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 96
    const/4 v0, 0x0

    .line 99
    :cond_0
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mActive:Z

    .line 100
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 101
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 102
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 103
    return-void

    .line 102
    :cond_1
    const/16 v2, 0x8

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 5

    .prologue
    .line 44
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onFinishInflate()V

    .line 46
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 49
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 50
    .local v1, r:Landroid/content/res/Resources;
    const v3, 0x7f0a0001

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mHoverColor:I

    .line 51
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 52
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 55
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v0, v3, Landroid/content/res/Configuration;->orientation:I

    .line 56
    .local v0, orientation:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b000a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 57
    .local v2, transposeLayout:Z
    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 58
    if-eqz v2, :cond_0

    .line 59
    const-string v3, ""

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/InfoDropTarget;->setText(Ljava/lang/CharSequence;)V

    .line 62
    :cond_0
    return-void
.end method
