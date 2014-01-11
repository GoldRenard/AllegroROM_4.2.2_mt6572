.class public Lcom/android/launcher2/HandleView;
.super Landroid/widget/ImageView;
.source "HandleView.java"


# static fields
.field private static final ORIENTATION_HORIZONTAL:I = 0x1


# instance fields
.field private mLauncher:Lcom/android/launcher2/Launcher;

.field private mOrientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 36
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 33
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/launcher2/HandleView;->mOrientation:I

    .line 37
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 40
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher2/HandleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    iput v3, p0, Lcom/android/launcher2/HandleView;->mOrientation:I

    .line 46
    sget-object v1, Lcom/android/launcher/R$styleable;->HandleView:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 47
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/android/launcher2/HandleView;->mOrientation:I

    .line 48
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 50
    const v1, 0x7f0d002e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/launcher2/HandleView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 51
    return-void
.end method


# virtual methods
.method public focusSearch(I)Landroid/view/View;
    .locals 4
    .parameter "direction"

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/widget/ImageView;->focusSearch(I)Landroid/view/View;

    move-result-object v0

    .line 56
    .local v0, newFocus:Landroid/view/View;
    if-nez v0, :cond_1

    iget-object v2, p0, Lcom/android/launcher2/HandleView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v2

    if-nez v2, :cond_1

    .line 57
    iget-object v2, p0, Lcom/android/launcher2/HandleView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v2}, Lcom/android/launcher2/Launcher;->getWorkspace()Lcom/android/launcher2/Workspace;

    move-result-object v1

    .line 58
    .local v1, workspace:Lcom/android/launcher2/Workspace;
    const/4 v2, 0x0

    invoke-virtual {v1, v2, p1}, Lcom/android/launcher2/Workspace;->dispatchUnhandledMove(Landroid/view/View;I)Z

    .line 59
    iget v2, p0, Lcom/android/launcher2/HandleView;->mOrientation:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const/16 v2, 0x82

    if-ne p1, v2, :cond_0

    .line 62
    .end local v1           #workspace:Lcom/android/launcher2/Workspace;
    .end local p0
    :goto_0
    return-object p0

    .restart local v1       #workspace:Lcom/android/launcher2/Workspace;
    .restart local p0
    :cond_0
    move-object p0, v1

    .line 59
    goto :goto_0

    .end local v1           #workspace:Lcom/android/launcher2/Workspace;
    :cond_1
    move-object p0, v0

    .line 62
    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/launcher2/HandleView;->mLauncher:Lcom/android/launcher2/Launcher;

    invoke-virtual {v0}, Lcom/android/launcher2/Launcher;->isAllAppsVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 68
    const/4 v0, 0x0

    .line 70
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method setLauncher(Lcom/android/launcher2/Launcher;)V
    .locals 0
    .parameter "launcher"

    .prologue
    .line 74
    iput-object p1, p0, Lcom/android/launcher2/HandleView;->mLauncher:Lcom/android/launcher2/Launcher;

    .line 75
    return-void
.end method
