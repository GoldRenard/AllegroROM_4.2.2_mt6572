.class public Lcom/mediatek/oobe/utils/OOBEGesturer;
.super Ljava/lang/Object;
.source "OOBEGesturer.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# static fields
.field private static final MIN_FLING_DISTANCE:F = 100.0f

.field private static final TAG:Ljava/lang/String; = "OOBE"


# instance fields
.field private mCallBacker:Lcom/mediatek/oobe/utils/OOBEGesturerCallback;

.field private mStepIndex:I

.field private mTotalStep:I


# direct methods
.method public constructor <init>(Lcom/mediatek/oobe/utils/OOBEGesturerCallback;II)V
    .locals 0
    .parameter "callBacker"
    .parameter "totalStep"
    .parameter "stepIndex"

    .prologue
    .line 59
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mCallBacker:Lcom/mediatek/oobe/utils/OOBEGesturerCallback;

    .line 61
    iput p2, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mTotalStep:I

    .line 62
    iput p3, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mStepIndex:I

    .line 63
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 71
    const/4 v0, 0x0

    return v0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8
    .parameter "e1"
    .parameter "e2"
    .parameter "velocityX"
    .parameter "velocityY"

    .prologue
    const/high16 v7, 0x42c8

    .line 76
    const-string v4, "OOBE"

    const-string v5, "OOBEGesturer.[onFling]"

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 78
    .local v0, x0:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 79
    .local v2, y0:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 80
    .local v1, x1:F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 81
    .local v3, y1:F
    const-string v4, "OOBE"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "OOBEGesturer: (x0,y0)==("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")      (x1,y1)==("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    sub-float v4, v0, v1

    cmpl-float v4, v4, v7

    if-lez v4, :cond_0

    sub-float v4, v0, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sub-float v5, v2, v3

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    .line 87
    const-string v4, "OOBE"

    const-string v5, "Fling to left."

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEGesturer;->onLeftFling()Z

    move-result v4

    .line 93
    :goto_0
    return v4

    .line 89
    :cond_0
    sub-float v4, v1, v0

    cmpl-float v4, v4, v7

    if-lez v4, :cond_1

    sub-float v4, v0, v1

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    sub-float v5, v2, v3

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    .line 90
    const-string v4, "OOBE"

    const-string v5, "Fling to right."

    invoke-static {v4, v5}, Lcom/mediatek/xlog/Xlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-virtual {p0}, Lcom/mediatek/oobe/utils/OOBEGesturer;->onRightFling()Z

    move-result v4

    goto :goto_0

    .line 93
    :cond_1
    const/4 v4, 0x0

    goto :goto_0
.end method

.method public onLeftFling()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 137
    iget v1, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mTotalStep:I

    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mStepIndex:I

    if-le v1, v2, :cond_0

    .line 138
    iget-object v1, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mCallBacker:Lcom/mediatek/oobe/utils/OOBEGesturerCallback;

    invoke-interface {v1, v0}, Lcom/mediatek/oobe/utils/OOBEGesturerCallback;->onNextStep(Z)V

    .line 144
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 102
    return-void
.end method

.method public onRightFling()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 157
    iget v2, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mStepIndex:I

    if-le v2, v0, :cond_0

    .line 158
    iget-object v2, p0, Lcom/mediatek/oobe/utils/OOBEGesturer;->mCallBacker:Lcom/mediatek/oobe/utils/OOBEGesturerCallback;

    invoke-interface {v2, v1}, Lcom/mediatek/oobe/utils/OOBEGesturerCallback;->onNextStep(Z)V

    .line 164
    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1
    .parameter "e1"
    .parameter "e2"
    .parameter "distanceX"
    .parameter "distanceY"

    .prologue
    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0
    .parameter "e"

    .prologue
    .line 117
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method
