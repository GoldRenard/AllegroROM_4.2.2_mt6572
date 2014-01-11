.class Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;
.super Ljava/lang/Object;
.source "PanelView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/statusbar/phone/PanelView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FlingTracker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field static sTracker:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;


# instance fields
.field final DECAY:F

.field final MAX_EVENTS:I

.field mEventBuf:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque",
            "<",
            "Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;",
            ">;"
        }
    .end annotation
.end field

.field mVX:F

.field mVY:F


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/16 v1, 0x8

    .line 102
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput v1, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->MAX_EVENTS:I

    .line 90
    const/high16 v0, 0x3f40

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->DECAY:F

    .line 91
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    .line 92
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    .line 103
    return-void
.end method

.method static obtain()Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;
    .registers 1

    .prologue
    .line 170
    sget-object v0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->sTracker:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;

    if-nez v0, :cond_b

    .line 171
    new-instance v0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;

    invoke-direct {v0}, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;-><init>()V

    sput-object v0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->sTracker:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;

    .line 173
    :cond_b
    sget-object v0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->sTracker:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;

    return-object v0
.end method


# virtual methods
.method public addMovement(Landroid/view/MotionEvent;)V
    .registers 8
    .parameter "event"

    .prologue
    .line 105
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_f

    .line 106
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->remove()Ljava/lang/Object;

    .line 108
    :cond_f
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    new-instance v1, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;-><init>(FFJ)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 109
    return-void
.end method

.method public computeCurrentVelocity(J)V
    .registers 17
    .parameter "timebase"

    .prologue
    .line 115
    const/4 v10, 0x0

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    .line 116
    const/4 v7, 0x0

    .line 117
    .local v7, last:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;
    const/4 v4, 0x0

    .line 118
    .local v4, i:I
    const/4 v6, 0x0

    .line 119
    .local v6, j:I
    const/4 v8, 0x0

    .line 120
    .local v8, totalweight:F
    const/high16 v9, 0x4120

    .line 121
    .local v9, weight:F
    iget-object v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    invoke-virtual {v10}, Ljava/util/ArrayDeque;->descendingIterator()Ljava/util/Iterator;

    move-result-object v5

    .line 122
    .local v5, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;>;"
    :goto_11
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_55

    .line 123
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;

    .line 124
    .local v3, event:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;
    if-eqz v7, :cond_51

    .line 125
    iget-wide v10, v3, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->t:J

    iget-wide v12, v7, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->t:J

    sub-long/2addr v10, v12

    long-to-float v10, v10

    long-to-float v11, p1

    div-float v0, v10, v11

    .line 126
    .local v0, dt:F
    const/4 v10, 0x0

    cmpl-float v10, v0, v10

    if-nez v10, :cond_2f

    .line 127
    move-object v7, v3

    .line 128
    goto :goto_11

    .line 130
    :cond_2f
    iget v10, v3, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->x:F

    iget v11, v7, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->x:F

    sub-float v1, v10, v11

    .line 131
    .local v1, dx:F
    iget v10, v3, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->y:F

    iget v11, v7, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;->y:F

    sub-float v2, v10, v11

    .line 140
    .local v2, dy:F
    iget v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    mul-float v11, v9, v1

    div-float/2addr v11, v0

    add-float/2addr v10, v11

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    .line 141
    iget v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    mul-float v11, v9, v2

    div-float/2addr v11, v0

    add-float/2addr v10, v11

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    .line 142
    add-float/2addr v8, v9

    .line 143
    const/high16 v10, 0x3f40

    mul-float/2addr v9, v10

    .line 144
    add-int/lit8 v6, v6, 0x1

    .line 146
    .end local v0           #dt:F
    .end local v1           #dx:F
    .end local v2           #dy:F
    :cond_51
    move-object v7, v3

    .line 147
    add-int/lit8 v4, v4, 0x1

    .line 148
    goto :goto_11

    .line 149
    .end local v3           #event:Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker$MotionEventCopy;
    :cond_55
    if-eqz v6, :cond_61

    .line 150
    iget v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    div-float/2addr v10, v8

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    .line 151
    iget v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    div-float/2addr v10, v8

    iput v10, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    .line 157
    :cond_61
    return-void
.end method

.method public getXVelocity()F
    .registers 2

    .prologue
    .line 159
    iget v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVX:F

    return v0
.end method

.method public getYVelocity()F
    .registers 2

    .prologue
    .line 162
    iget v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mVY:F

    return v0
.end method

.method public recycle()V
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/android/systemui/statusbar/phone/PanelView$FlingTracker;->mEventBuf:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 166
    return-void
.end method
