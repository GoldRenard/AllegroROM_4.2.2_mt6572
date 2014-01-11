.class public Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;
.super Landroid/appwidget/AppWidgetHostView;
.source "LauncherAppWidgetHostView.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mInflater:Landroid/view/LayoutInflater;

.field private mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

.field private mPreviousOrientation:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 39
    invoke-direct {p0, p1}, Landroid/appwidget/AppWidgetHostView;-><init>(Landroid/content/Context;)V

    .line 40
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    .line 41
    new-instance v0, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-direct {v0, p0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    .line 42
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mInflater:Landroid/view/LayoutInflater;

    .line 43
    return-void
.end method


# virtual methods
.method public cancelLongPress()V
    .locals 1

    .prologue
    .line 89
    invoke-super {p0}, Landroid/appwidget/AppWidgetHostView;->cancelLongPress()V

    .line 91
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    .line 92
    return-void
.end method

.method public getDescendantFocusability()I
    .locals 1

    .prologue
    .line 96
    const/high16 v0, 0x6

    return v0
.end method

.method protected getErrorView()Landroid/view/View;
    .locals 3

    .prologue
    .line 47
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f040008

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "ev"

    .prologue
    .line 64
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->hasPerformedLongPress()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    .line 66
    const/4 v0, 0x1

    .line 84
    :goto_0
    return v0

    .line 71
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 84
    :goto_1
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 73
    :pswitch_1
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->postCheckForLongPress()V

    goto :goto_1

    .line 79
    :pswitch_2
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mLongPressHelper:Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;

    invoke-virtual {v0}, Lcom/cyanogenmod/trebuchet/CheckLongPressHelper;->cancelLongPress()V

    goto :goto_1

    .line 71
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public orientationChangedSincedInflation()Z
    .locals 2

    .prologue
    .line 58
    iget-object v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v0, v1, Landroid/content/res/Configuration;->orientation:I

    .line 59
    .local v0, orientation:I
    iget v1, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mPreviousOrientation:I

    if-eq v1, v0, :cond_0

    const/4 v1, 0x1

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
    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iput v0, p0, Lcom/cyanogenmod/trebuchet/LauncherAppWidgetHostView;->mPreviousOrientation:I

    .line 54
    invoke-super {p0, p1}, Landroid/appwidget/AppWidgetHostView;->updateAppWidget(Landroid/widget/RemoteViews;)V

    .line 55
    return-void
.end method
