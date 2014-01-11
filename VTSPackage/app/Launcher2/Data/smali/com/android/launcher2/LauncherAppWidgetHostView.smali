.class public Lcom/android/launcher2/LauncherAppWidgetHostView;
.super Landroid/appwidget/AppWidgetHostView;
.source "LauncherAppWidgetHostView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "LauncherAppWidgetHostView"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

.field private mPreviousOrientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 41
    invoke-direct {p0, p1}, Landroid/appwidget/AppWidgetHostView;-><init>(Landroid/content/Context;)V

    .line 42
    iput-object p1, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    .line 43
    new-instance v0, Lcom/android/launcher2/CheckLongPressHelper;

    invoke-direct {v0, p0}, Lcom/android/launcher2/CheckLongPressHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    .line 44
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mInflater:Landroid/view/LayoutInflater;

    .line 45
    return-void
.end method


# virtual methods
.method public cancelLongPress()V
    .locals 1

    .prologue
    .line 111
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->cancelLongPress()V

    .line 113
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    .line 114
    return-void
.end method

.method public getDescendantFocusability()I
    .locals 1

    .prologue
    .line 118
    const/high16 v0, 0x6

    return v0
.end method

.method protected getErrorView()Landroid/view/View;
    .locals 3

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f040007

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 86
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->hasPerformedLongPress()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 87
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    .line 88
    const/4 v0, 0x1

    .line 106
    :goto_0
    return v0

    .line 93
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 106
    :goto_1
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 95
    :pswitch_1
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->postCheckForLongPress()V

    goto :goto_1

    .line 101
    :pswitch_2
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    goto :goto_1

    .line 93
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "ev"

    .prologue
    .line 74
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/android/launcher2/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/android/launcher2/CheckLongPressHelper;->cancelLongPress()V

    .line 77
    :cond_1
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public orientationChangedSincedInflation()Z
    .locals 2

    .prologue
    .line 60
    iget-object v1, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v0, v1, Landroid/content/res/Configuration;->orientation:I

    .line 61
    .local v0, orientation:I
    iget v1, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mPreviousOrientation:I

    if-eq v1, v0, :cond_0

    .line 62
    const/4 v1, 0x1

    .line 64
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public updateAppWidget(Landroid/widget/RemoteViews;)V
    .locals 1
    .parameter "remoteViews"

    .prologue
    .line 55
    iget-object v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/android/launcher2/LauncherAppWidgetHostView;->mPreviousOrientation:I

    .line 56
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 57
    return-void
.end method
