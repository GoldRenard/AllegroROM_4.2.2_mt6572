.class public Lcom/android/systemui/statusbar/tablet/CompatModePanel;
.super Landroid/widget/FrameLayout;
.source "CompatModePanel.java"

# interfaces
.implements Lcom/android/systemui/statusbar/tablet/StatusBarPanel;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "CompatModePanel"


# instance fields
.field private mAM:Landroid/app/ActivityManager;

.field private mAttached:Z

.field private mContext:Landroid/content/Context;

.field private mOffButton:Landroid/widget/RadioButton;

.field private mOnButton:Landroid/widget/RadioButton;

.field private mTrigger:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAttached:Z

    .line 50
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mContext:Landroid/content/Context;

    .line 51
    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAM:Landroid/app/ActivityManager;

    .line 52
    return-void
.end method

.method private refresh()V
    .locals 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 123
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAM:Landroid/app/ActivityManager;

    invoke-virtual {v4}, Landroid/app/ActivityManager;->getFrontActivityScreenCompatMode()I

    move-result v0

    .line 124
    .local v0, mode:I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_0

    const/4 v4, -0x2

    if-ne v0, v4, :cond_1

    .line 127
    :cond_0
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->closePanel()V

    .line 133
    :goto_0
    return-void

    .line 130
    :cond_1
    if-ne v0, v2, :cond_2

    move v1, v2

    .line 131
    .local v1, on:Z
    :goto_1
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOnButton:Landroid/widget/RadioButton;

    invoke-virtual {v4, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 132
    iget-object v4, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOffButton:Landroid/widget/RadioButton;

    if-nez v1, :cond_3

    :goto_2
    invoke-virtual {v4, v2}, Landroid/widget/RadioButton;->setChecked(Z)V

    goto :goto_0

    .end local v1           #on:Z
    :cond_2
    move v1, v3

    .line 130
    goto :goto_1

    .restart local v1       #on:Z
    :cond_3
    move v2, v3

    .line 132
    goto :goto_2
.end method


# virtual methods
.method public closePanel()V
    .locals 2

    .prologue
    .line 118
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->setVisibility(I)V

    .line 119
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mTrigger:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mTrigger:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 120
    :cond_0
    return-void
.end method

.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .parameter "event"

    .prologue
    .line 99
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v0, v2

    .line 100
    .local v0, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v1, v2

    .line 101
    .local v1, y:I
    if-ltz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->getWidth()I

    move-result v2

    if-ge v0, v2, :cond_0

    if-ltz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->getHeight()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 102
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 104
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isInContentArea(II)Z
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 75
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAttached:Z

    if-nez v0, :cond_0

    .line 76
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAttached:Z

    .line 78
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .parameter "v"

    .prologue
    .line 82
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOnButton:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_1

    .line 83
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAM:Landroid/app/ActivityManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->setFrontActivityScreenCompatMode(I)V

    .line 87
    :cond_0
    :goto_0
    return-void

    .line 84
    :cond_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOffButton:Landroid/widget/RadioButton;

    if-ne p1, v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAM:Landroid/app/ActivityManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ActivityManager;->setFrontActivityScreenCompatMode(I)V

    goto :goto_0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 66
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 67
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAttached:Z

    if-eqz v0, :cond_0

    .line 68
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mAttached:Z

    .line 70
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .prologue
    .line 56
    const v0, 0x7f0800db

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOnButton:Landroid/widget/RadioButton;

    .line 57
    const v0, 0x7f0800da

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RadioButton;

    iput-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOffButton:Landroid/widget/RadioButton;

    .line 58
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOnButton:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mOffButton:Landroid/widget/RadioButton;

    invoke-virtual {v0, p0}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 61
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->refresh()V

    .line 62
    return-void
.end method

.method public openPanel()V
    .locals 2

    .prologue
    .line 112
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->setVisibility(I)V

    .line 113
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mTrigger:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mTrigger:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 114
    :cond_0
    invoke-direct {p0}, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->refresh()V

    .line 115
    return-void
.end method

.method public setTrigger(Landroid/view/View;)V
    .locals 0
    .parameter "v"

    .prologue
    .line 108
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/CompatModePanel;->mTrigger:Landroid/view/View;

    .line 109
    return-void
.end method
