.class public Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;
.super Landroid/widget/RelativeLayout;
.source "NotificationPeekPanel.java"

# interfaces
.implements Lcom/android/systemui/statusbar/tablet/StatusBarPanel;


# instance fields
.field mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 28
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 33
    return-void
.end method


# virtual methods
.method public dispatchHoverEvent(Landroid/view/MotionEvent;)Z
    .registers 5
    .parameter "event"

    .prologue
    .line 60
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v0, v2

    .line 61
    .local v0, x:I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    float-to-int v1, v2

    .line 62
    .local v1, y:I
    if-ltz v0, :cond_1f

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getWidth()I

    move-result v2

    if-ge v0, v2, :cond_1f

    if-ltz v1, :cond_1f

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getHeight()I

    move-result v2

    if-ge v1, v2, :cond_1f

    .line 63
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchHoverEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 65
    :goto_1e
    return v2

    :cond_1f
    const/4 v2, 0x1

    goto :goto_1e
.end method

.method public isInContentArea(II)Z
    .registers 9
    .parameter "x"
    .parameter "y"

    .prologue
    .line 36
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getPaddingLeft()I

    move-result v1

    .line 37
    .local v1, l:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 38
    .local v2, r:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getPaddingTop()I

    move-result v3

    .line 39
    .local v3, t:I
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 40
    .local v0, b:I
    if-lt p1, v1, :cond_26

    if-ge p1, v2, :cond_26

    if-lt p2, v3, :cond_26

    if-ge p2, v0, :cond_26

    const/4 v4, 0x1

    :goto_25
    return v4

    :cond_26
    const/4 v4, 0x0

    goto :goto_25
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .parameter "ev"

    .prologue
    .line 51
    iget-object v0, p0, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/tablet/TabletStatusBar;->resetNotificationPeekFadeTimer()V

    .line 52
    const/4 v0, 0x0

    return v0
.end method

.method public setBar(Lcom/android/systemui/statusbar/tablet/TabletStatusBar;)V
    .registers 2
    .parameter "bar"

    .prologue
    .line 44
    iput-object p1, p0, Lcom/android/systemui/statusbar/tablet/NotificationPeekPanel;->mBar:Lcom/android/systemui/statusbar/tablet/TabletStatusBar;

    .line 45
    return-void
.end method
