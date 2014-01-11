.class public Lcom/android/systemui/recent/StatusBarTouchProxy;
.super Landroid/widget/FrameLayout;
.source "StatusBarTouchProxy.java"


# instance fields
.field private mStatusBar:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 38
    iget-object v0, p0, Lcom/android/systemui/recent/StatusBarTouchProxy;->mStatusBar:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setStatusBar(Landroid/view/View;)V
    .locals 0
    .parameter "statusBar"

    .prologue
    .line 34
    iput-object p1, p0, Lcom/android/systemui/recent/StatusBarTouchProxy;->mStatusBar:Landroid/view/View;

    .line 35
    return-void
.end method
