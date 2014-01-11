.class Lcom/android/launcher2/SymmetricalLinearTween$1;
.super Ljava/lang/Object;
.source "SymmetricalLinearTween.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher2/SymmetricalLinearTween;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/launcher2/SymmetricalLinearTween;


# direct methods
.method constructor <init>(Lcom/android/launcher2/SymmetricalLinearTween;)V
    .locals 0
    .parameter

    .prologue
    .line 88
    iput-object p1, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 15

    .prologue
    const/high16 v14, 0x3f80

    .line 90
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget-wide v0, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mBase:J

    .line 91
    .local v0, base:J
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    .line 92
    .local v8, now:J
    sub-long v2, v8, v0

    .line 93
    .local v2, diff:J
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget v4, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mDuration:I

    .line 94
    .local v4, duration:I
    long-to-float v12, v2

    int-to-float v13, v4

    div-float v11, v12, v13

    .line 95
    .local v11, val:F
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget-boolean v12, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mDirection:Z

    if-nez v12, :cond_0

    .line 96
    sub-float v11, v14, v11

    .line 98
    :cond_0
    cmpl-float v12, v11, v14

    if-lez v12, :cond_4

    .line 99
    const/high16 v11, 0x3f80

    .line 103
    :cond_1
    :goto_0
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget v10, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mValue:F

    .line 104
    .local v10, old:F
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iput v11, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mValue:F

    .line 105
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget-object v12, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mCallback:Lcom/android/launcher2/TweenCallback;

    invoke-interface {v12, v11, v10}, Lcom/android/launcher2/TweenCallback;->onTweenValueChanged(FF)V

    .line 106
    const-wide/16 v12, 0x21

    div-long v12, v2, v12

    long-to-int v5, v12

    .line 107
    .local v5, frame:I
    add-int/lit8 v12, v5, 0x1

    mul-int/lit8 v12, v12, 0x21

    int-to-long v12, v12

    add-long v6, v0, v12

    .line 108
    .local v6, next:J
    int-to-long v12, v4

    cmp-long v12, v2, v12

    if-gez v12, :cond_2

    .line 109
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget-object v12, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mHandler:Landroid/os/Handler;

    invoke-virtual {v12, p0, v6, v7}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;J)Z

    .line 111
    :cond_2
    int-to-long v12, v4

    cmp-long v12, v2, v12

    if-ltz v12, :cond_3

    .line 112
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    iget-object v12, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mCallback:Lcom/android/launcher2/TweenCallback;

    invoke-interface {v12}, Lcom/android/launcher2/TweenCallback;->onTweenFinished()V

    .line 113
    iget-object v12, p0, Lcom/android/launcher2/SymmetricalLinearTween$1;->this$0:Lcom/android/launcher2/SymmetricalLinearTween;

    const/4 v13, 0x0

    iput-boolean v13, v12, Lcom/android/launcher2/SymmetricalLinearTween;->mRunning:Z

    .line 115
    :cond_3
    return-void

    .line 100
    .end local v5           #frame:I
    .end local v6           #next:J
    .end local v10           #old:F
    :cond_4
    const/4 v12, 0x0

    cmpg-float v12, v11, v12

    if-gez v12, :cond_1

    .line 101
    const/4 v11, 0x0

    goto :goto_0
.end method
