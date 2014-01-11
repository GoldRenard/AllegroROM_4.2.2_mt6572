.class public Landroid/widget/GestureImageView;
.super Landroid/widget/ImageView;
.source "GestureImageView.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation runtime Landroid/widget/RemoteViews$RemoteView;
.end annotation


# static fields
.field private static final ACTION_ENTER_WEATHER_SETTING:Ljava/lang/String; = "com.weather.action.ENTERSETTING"

.field private static final ACTION_SCROLL:Ljava/lang/String; = "com.weather.action.SCROLL"

.field private static final DIRECTION:Ljava/lang/String; = "Dircetion"

.field private static final DIRECTION_NEXT:Ljava/lang/String; = "direction_next"

.field private static final DIRECTION_PREVIOUS:Ljava/lang/String; = "direction_previous"

.field private static final TAG:Ljava/lang/String; = "GestureImageView"


# instance fields
.field private gestureDetector:Landroid/view/GestureDetector;

.field private mAppWidgetId:I

.field private sendTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    .line 63
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 64
    invoke-direct {p0, p1}, Landroid/widget/GestureImageView;->init(Landroid/content/Context;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 68
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 69
    invoke-direct {p0, p1}, Landroid/widget/GestureImageView;->init(Landroid/content/Context;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 73
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 74
    invoke-direct {p0, p1}, Landroid/widget/GestureImageView;->init(Landroid/content/Context;)V

    .line 75
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 83
    new-instance v0, Landroid/view/GestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Landroid/widget/GestureImageView;->gestureDetector:Landroid/view/GestureDetector;

    .line 85
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 93
    const/4 v0, 0x1

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 6
    .parameter "e1"
    .parameter "e2"
    .parameter "velocityX"
    .parameter "velocityY"

    .prologue
    const/4 v5, 0x1

    .line 98
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Landroid/widget/GestureImageView;->sendTime:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    .line 110
    :goto_0
    return v5

    .line 101
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.weather.action.SCROLL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 102
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "appWidgetId"

    iget v2, p0, Landroid/widget/GestureImageView;->mAppWidgetId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 103
    const/4 v1, 0x0

    cmpl-float v1, p4, v1

    if-lez v1, :cond_1

    .line 104
    const-string v1, "Dircetion"

    const-string v2, "direction_next"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    :goto_1
    invoke-virtual {p0}, Landroid/widget/GestureImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 109
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, p0, Landroid/widget/GestureImageView;->sendTime:J

    goto :goto_0

    .line 106
    :cond_1
    const-string v1, "Dircetion"

    const-string v2, "direction_previous"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 115
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .parameter "e1"
    .parameter "e2"
    .parameter "distanceX"
    .parameter "distanceY"

    .prologue
    const/4 v3, 0x1

    .line 120
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iget-wide v6, p0, Landroid/widget/GestureImageView;->sendTime:J

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 141
    :cond_0
    :goto_0
    return v3

    .line 123
    :cond_1
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 124
    .local v1, x:F
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    .line 125
    .local v2, y:F
    cmpl-float v4, v1, v2

    if-gtz v4, :cond_0

    .line 128
    invoke-virtual {p0}, Landroid/widget/GestureImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    invoke-interface {v4, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 129
    const/high16 v4, 0x40a0

    cmpl-float v4, v1, v4

    if-lez v4, :cond_3

    const/high16 v4, 0x40e0

    cmpl-float v4, v2, v4

    if-lez v4, :cond_3

    .line 130
    new-instance v0, Landroid/content/Intent;

    const-string v4, "com.weather.action.SCROLL"

    invoke-direct {v0, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 131
    .local v0, intent:Landroid/content/Intent;
    const-string v4, "appWidgetId"

    iget v5, p0, Landroid/widget/GestureImageView;->mAppWidgetId:I

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 132
    const/4 v4, 0x0

    cmpg-float v4, p4, v4

    if-gez v4, :cond_2

    .line 133
    const-string v4, "Dircetion"

    const-string v5, "direction_next"

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    :goto_1
    invoke-virtual {p0}, Landroid/widget/GestureImageView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 138
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    iput-wide v4, p0, Landroid/widget/GestureImageView;->sendTime:J

    goto :goto_0

    .line 135
    :cond_2
    const-string v4, "Dircetion"

    const-string v5, "direction_previous"

    invoke-virtual {v0, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 141
    .end local v0           #intent:Landroid/content/Intent;
    :cond_3
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 146
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "e"

    .prologue
    .line 150
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.weather.action.ENTERSETTING"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 151
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/widget/GestureImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 152
    const/4 v1, 0x0

    return v1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "event"

    .prologue
    .line 88
    iget-object v0, p0, Landroid/widget/GestureImageView;->gestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setWidgetId(I)V
    .locals 0
    .parameter "widgetId"
    .annotation runtime Landroid/view/RemotableViewMethod;
    .end annotation

    .prologue
    .line 79
    iput p1, p0, Landroid/widget/GestureImageView;->mAppWidgetId:I

    .line 80
    return-void
.end method
