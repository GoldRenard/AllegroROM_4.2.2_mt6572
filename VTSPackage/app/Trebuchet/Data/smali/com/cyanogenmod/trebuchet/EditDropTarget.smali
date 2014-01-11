.class public Lcom/cyanogenmod/trebuchet/EditDropTarget;
.super Lcom/cyanogenmod/trebuchet/ButtonDropTarget;
.source "EditDropTarget.java"


# instance fields
.field private mDrawable:Landroid/graphics/drawable/TransitionDrawable;

.field private mOriginalTextColor:Landroid/content/res/ColorStateList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method private isDragSourceWorkspaceOrFolder(Lcom/cyanogenmod/trebuchet/DragSource;)Z
    .locals 1
    .parameter "source"

    .prologue
    .line 67
    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/Workspace;

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/cyanogenmod/trebuchet/Folder;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z
    .locals 1
    .parameter "source"
    .parameter "info"

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->isDragSourceWorkspaceOrFolder(Lcom/cyanogenmod/trebuchet/DragSource;)Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of v0, p2, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public acceptDrop(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)Z
    .locals 3
    .parameter "d"

    .prologue
    const/4 v2, 0x0

    .line 78
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    if-eqz v0, :cond_1

    .line 79
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mLauncher:Lcom/cyanogenmod/trebuchet/Launcher;

    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v0, Lcom/cyanogenmod/trebuchet/ShortcutInfo;

    invoke-virtual {v1, v0}, Lcom/cyanogenmod/trebuchet/Launcher;->updateShortcut(Lcom/cyanogenmod/trebuchet/ShortcutInfo;)V

    .line 85
    :cond_0
    :goto_0
    iput-boolean v2, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 86
    return v2

    .line 80
    :cond_1
    iget-object v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v0, v0, Lcom/cyanogenmod/trebuchet/Folder;

    if-eqz v0, :cond_0

    goto :goto_0
.end method

.method public onDragEnd()V
    .locals 1

    .prologue
    .line 106
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnd()V

    .line 107
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mActive:Z

    .line 108
    return-void
.end method

.method public onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 2
    .parameter "d"

    .prologue
    .line 111
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragEnter(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 113
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    iget v1, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mTransitionDuration:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 114
    iget v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mHoverColor:I

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->setTextColor(I)V

    .line 115
    return-void
.end method

.method public onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 118
    invoke-super {p0, p1}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onDragExit(Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;)V

    .line 120
    iget-boolean v0, p1, Lcom/cyanogenmod/trebuchet/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 121
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 122
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 124
    :cond_0
    return-void
.end method

.method public onDragStart(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;I)V
    .locals 3
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 91
    const/4 v0, 0x1

    .line 94
    .local v0, isVisible:Z
    invoke-direct {p0, p1, p2}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->isWorkspaceOrFolderApplication(Lcom/cyanogenmod/trebuchet/DragSource;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    const/4 v0, 0x0

    .line 98
    :cond_0
    iput-boolean v0, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mActive:Z

    .line 99
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 100
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 101
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 102
    return-void

    .line 101
    :cond_1
    const/16 v2, 0x8

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 5

    .prologue
    .line 46
    invoke-super {p0}, Lcom/cyanogenmod/trebuchet/ButtonDropTarget;->onFinishInflate()V

    .line 48
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 51
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 52
    .local v1, r:Landroid/content/res/Resources;
    const v3, 0x7f0a0002

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    iput v3, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mHoverColor:I

    .line 53
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v3, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 54
    iget-object v3, p0, Lcom/cyanogenmod/trebuchet/EditDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 57
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v0, v3, Landroid/content/res/Configuration;->orientation:I

    .line 58
    .local v0, orientation:I
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0b000a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    .line 59
    .local v2, transposeLayout:Z
    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 60
    if-eqz v2, :cond_0

    .line 61
    const-string v3, ""

    invoke-virtual {p0, v3}, Lcom/cyanogenmod/trebuchet/EditDropTarget;->setText(Ljava/lang/CharSequence;)V

    .line 64
    :cond_0
    return-void
.end method
