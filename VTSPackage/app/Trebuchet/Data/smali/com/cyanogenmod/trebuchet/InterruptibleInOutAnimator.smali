.class public Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;
.super Ljava/lang/Object;
.source "InterruptibleInOutAnimator.java"


# static fields
.field private static final IN:I = 0x1

.field private static final OUT:I = 0x2

.field private static final STOPPED:I


# instance fields
.field private mAnimator:Landroid/animation/ValueAnimator;

.field private mDirection:I

.field private mFirstRun:Z

.field private mOriginalDuration:J

.field private mOriginalFromValue:F

.field private mOriginalToValue:F

.field private mTag:Ljava/lang/Object;


# direct methods
.method public constructor <init>(JFF)V
    .locals 3
    .parameter "duration"
    .parameter "fromValue"
    .parameter "toValue"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-boolean v2, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mFirstRun:Z

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mTag:Ljava/lang/Object;

    .line 45
    iput v1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    .line 48
    const/4 v0, 0x2

    new-array v0, v0, [F

    aput p3, v0, v1

    aput p4, v0, v2

    invoke-static {v0}, Lcom/cyanogenmod/trebuchet/LauncherAnimUtils;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    .line 49
    iput-wide p1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalDuration:J

    .line 50
    iput p3, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalFromValue:F

    .line 51
    iput p4, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalToValue:F

    .line 53
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator$1;

    invoke-direct {v1, p0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator$1;-><init>(Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 59
    return-void
.end method

.method static synthetic access$002(Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 30
    iput p1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    return p1
.end method

.method private animate(I)V
    .locals 13
    .parameter "direction"

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 62
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->getCurrentPlayTime()J

    move-result-wide v0

    .line 63
    .local v0, currentPlayTime:J
    if-ne p1, v12, :cond_0

    iget v5, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalToValue:F

    .line 64
    .local v5, toValue:F
    :goto_0
    iget-boolean v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mFirstRun:Z

    if-eqz v6, :cond_1

    iget v4, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalFromValue:F

    .line 68
    .local v4, startValue:F
    :goto_1
    invoke-virtual {p0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->cancel()V

    .line 72
    iput p1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    .line 75
    iget-wide v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalDuration:J

    sub-long v2, v6, v0

    .line 76
    .local v2, duration:J
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v7, 0x0

    iget-wide v9, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalDuration:J

    invoke-static {v2, v3, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 78
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    const/4 v7, 0x2

    new-array v7, v7, [F

    aput v4, v7, v11

    aput v5, v7, v12

    invoke-virtual {v6, v7}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 79
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->start()V

    .line 80
    iput-boolean v11, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mFirstRun:Z

    .line 81
    return-void

    .line 63
    .end local v2           #duration:J
    .end local v4           #startValue:F
    .end local v5           #toValue:F
    :cond_0
    iget v5, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mOriginalFromValue:F

    goto :goto_0

    .line 64
    .restart local v5       #toValue:F
    :cond_1
    iget-object v6, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v6}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v4

    goto :goto_1
.end method


# virtual methods
.method public animateIn()V
    .locals 1

    .prologue
    .line 106
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animate(I)V

    .line 107
    return-void
.end method

.method public animateOut()V
    .locals 1

    .prologue
    .line 116
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->animate(I)V

    .line 117
    return-void
.end method

.method public cancel()V
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 85
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    .line 86
    return-void
.end method

.method public end()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    .line 90
    const/4 v0, 0x0

    iput v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    .line 91
    return-void
.end method

.method public getAnimator()Landroid/animation/ValueAnimator;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mAnimator:Landroid/animation/ValueAnimator;

    return-object v0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public isStopped()Z
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mDirection:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0
    .parameter "tag"

    .prologue
    .line 120
    iput-object p1, p0, Lcom/cyanogenmod/trebuchet/InterruptibleInOutAnimator;->mTag:Ljava/lang/Object;

    .line 121
    return-void
.end method
