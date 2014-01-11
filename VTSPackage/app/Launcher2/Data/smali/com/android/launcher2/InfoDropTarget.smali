.class public Lcom/android/launcher2/InfoDropTarget;
.super Lcom/android/launcher2/ButtonDropTarget;
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
    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/InfoDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher2/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 42
    return-void
.end method

.method private isFromAllApps(Lcom/android/launcher2/DragSource;)Z
    .locals 1
    .parameter "source"

    .prologue
    .line 67
    instance-of v0, p1, Lcom/android/launcher2/AppsCustomizePagedView;

    return v0
.end method


# virtual methods
.method public acceptDrop(Lcom/android/launcher2/DropTarget$DragObject;)Z
    .locals 5
    .parameter "d"

    .prologue
    const/4 v4, 0x0

    .line 73
    const-string v1, "DropTarget"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "acceptDrop: d = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", d.dragInfo = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    const/4 v0, 0x0

    .line 80
    .local v0, componentName:Landroid/content/ComponentName;
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/android/launcher2/ApplicationInfo;

    if-eqz v1, :cond_2

    .line 81
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/android/launcher2/ApplicationInfo;

    iget-object v0, v1, Lcom/android/launcher2/ApplicationInfo;->componentName:Landroid/content/ComponentName;

    .line 87
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 88
    iget-object v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v1, v0}, Lcom/android/launcher2/Launcher;->startApplicationDetailsActivity(Landroid/content/ComponentName;)V

    .line 92
    :cond_1
    iput-boolean v4, p1, Lcom/android/launcher2/DropTarget$DragObject;->deferDragViewCleanupPostAnimation:Z

    .line 93
    return v4

    .line 82
    :cond_2
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/android/launcher2/ShortcutInfo;

    if-eqz v1, :cond_3

    .line 83
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/android/launcher2/ShortcutInfo;

    iget-object v1, v1, Lcom/android/launcher2/ShortcutInfo;->intent:Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    goto :goto_0

    .line 84
    :cond_3
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    instance-of v1, v1, Lcom/android/launcher2/PendingAddItemInfo;

    if-eqz v1, :cond_0

    .line 85
    iget-object v1, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragInfo:Ljava/lang/Object;

    check-cast v1, Lcom/android/launcher2/PendingAddItemInfo;

    iget-object v0, v1, Lcom/android/launcher2/PendingAddItemInfo;->componentName:Landroid/content/ComponentName;

    goto :goto_0
.end method

.method public onDragEnd()V
    .locals 2

    .prologue
    .line 118
    invoke-super {p0}, Lcom/android/launcher2/ButtonDropTarget;->onDragEnd()V

    .line 120
    const-string v0, "DropTarget"

    const-string v1, "onDragEnd."

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mActive:Z

    .line 123
    return-void
.end method

.method public onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 126
    invoke-super {p0, p1}, Lcom/android/launcher2/ButtonDropTarget;->onDragEnter(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 128
    const-string v0, "DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragEnter: d = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object v0, p0, Lcom/android/launcher2/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    iget v1, p0, Lcom/android/launcher2/ButtonDropTarget;->mTransitionDuration:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/TransitionDrawable;->startTransition(I)V

    .line 132
    iget v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    invoke-virtual {p0, v0}, Lcom/android/launcher2/InfoDropTarget;->setTextColor(I)V

    .line 133
    return-void
.end method

.method public onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V
    .locals 3
    .parameter "d"

    .prologue
    .line 136
    invoke-super {p0, p1}, Lcom/android/launcher2/ButtonDropTarget;->onDragExit(Lcom/android/launcher2/DropTarget$DragObject;)V

    .line 138
    const-string v0, "DropTarget"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDragExit: d = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", d.dragComplete = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    iget-boolean v0, p1, Lcom/android/launcher2/DropTarget$DragObject;->dragComplete:Z

    if-nez v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/android/launcher2/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 143
    iget-object v0, p0, Lcom/android/launcher2/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lcom/android/launcher2/InfoDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 145
    :cond_0
    return-void
.end method

.method public onDragStart(Lcom/android/launcher2/DragSource;Ljava/lang/Object;I)V
    .locals 4
    .parameter "source"
    .parameter "info"
    .parameter "dragAction"

    .prologue
    .line 99
    const-string v1, "DropTarget"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDratStart: source = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", info = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", dragAction = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/launcher2/LauncherLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    const/4 v0, 0x1

    .line 106
    .local v0, isVisible:Z
    invoke-direct {p0, p1}, Lcom/android/launcher2/InfoDropTarget;->isFromAllApps(Lcom/android/launcher2/DragSource;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 107
    const/4 v0, 0x0

    .line 110
    :cond_0
    iput-boolean v0, p0, Lcom/android/launcher2/ButtonDropTarget;->mActive:Z

    .line 111
    iget-object v1, p0, Lcom/android/launcher2/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/TransitionDrawable;->resetTransition()V

    .line 112
    iget-object v1, p0, Lcom/android/launcher2/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v1}, Lcom/android/launcher2/InfoDropTarget;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 113
    invoke-virtual {p0}, Lcom/android/launcher2/InfoDropTarget;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 114
    return-void

    .line 113
    :cond_1
    const/16 v2, 0x8

    goto :goto_0
.end method

.method protected onFinishInflate()V
    .locals 4

    .prologue
    .line 46
    invoke-super {p0}, Lcom/android/launcher2/ButtonDropTarget;->onFinishInflate()V

    .line 48
    invoke-virtual {p0}, Lcom/android/launcher2/InfoDropTarget;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lcom/android/launcher2/InfoDropTarget;->mOriginalTextColor:Landroid/content/res/ColorStateList;

    .line 51
    invoke-virtual {p0}, Lcom/android/launcher2/InfoDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 53
    .local v1, r:Landroid/content/res/Resources;
    const v2, 0x7f080001

    invoke-static {v1, v2}, Lcom/android/launcher2/Launcher;->getThemeColor(Landroid/content/res/Resources;I)I

    move-result v2

    iput v2, p0, Lcom/android/launcher2/ButtonDropTarget;->mHoverColor:I

    .line 54
    invoke-virtual {p0}, Lcom/android/launcher2/InfoDropTarget;->getCurrentDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/TransitionDrawable;

    iput-object v2, p0, Lcom/android/launcher2/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    .line 55
    iget-object v2, p0, Lcom/android/launcher2/InfoDropTarget;->mDrawable:Landroid/graphics/drawable/TransitionDrawable;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/TransitionDrawable;->setCrossFadeEnabled(Z)V

    .line 58
    invoke-virtual {p0}, Lcom/android/launcher2/InfoDropTarget;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v0, v2, Landroid/content/res/Configuration;->orientation:I

    .line 59
    .local v0, orientation:I
    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    .line 60
    invoke-static {}, Lcom/android/launcher2/LauncherApplication;->isScreenLarge()Z

    move-result v2

    if-nez v2, :cond_0

    .line 61
    const-string v2, ""

    invoke-virtual {p0, v2}, Lcom/android/launcher2/InfoDropTarget;->setText(Ljava/lang/CharSequence;)V

    .line 64
    :cond_0
    return-void
.end method
