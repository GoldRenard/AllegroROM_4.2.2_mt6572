.class public Lcom/android/systemui/statusbar/policy/DeadZone;
.super Landroid/view/View;
.source "DeadZone.java"


# static fields
.field private static final CHATTY:Z = true

.field public static final DEBUG:Z = false

.field public static final HORIZONTAL:I = 0x0

.field public static final TAG:Ljava/lang/String; = "DeadZone"

.field public static final VERTICAL:I = 0x1


# instance fields
.field private final mDebugFlash:Ljava/lang/Runnable;

.field private mDecay:I

.field private mFlashFrac:F

.field private mHold:I

.field private mLastPokeTime:J

.field private mShouldFlash:Z

.field private mSizeMax:I

.field private mSizeMin:I

.field private mVertical:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/policy/DeadZone;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 10
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 63
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    const/4 v4, 0x0

    iput v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    .line 51
    new-instance v4, Lcom/android/systemui/statusbar/policy/DeadZone$1;

    invoke-direct {v4, p0}, Lcom/android/systemui/statusbar/policy/DeadZone$1;-><init>(Lcom/android/systemui/statusbar/policy/DeadZone;)V

    iput-object v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mDebugFlash:Ljava/lang/Runnable;

    .line 65
    sget-object v4, Lcom/android/systemui/R$styleable;->DeadZone:[I

    invoke-virtual {p1, p2, v4, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 68
    .local v0, a:Landroid/content/res/TypedArray;
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mHold:I

    .line 69
    const/4 v4, 0x3

    invoke-virtual {v0, v4, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mDecay:I

    .line 71
    invoke-virtual {v0, v3, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMin:I

    .line 72
    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMax:I

    .line 74
    const/4 v4, 0x4

    const/4 v5, -0x1

    invoke-virtual {v0, v4, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    .line 75
    .local v1, index:I
    if-ne v1, v2, :cond_48

    :goto_37
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mVertical:Z

    .line 81
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0a0007

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/policy/DeadZone;->setFlashOnTouchCapture(Z)V

    .line 82
    return-void

    :cond_48
    move v2, v3

    .line 75
    goto :goto_37
.end method

.method private getSize(J)F
    .registers 9
    .parameter "now"

    .prologue
    .line 89
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMax:I

    if-nez v2, :cond_6

    .line 90
    const/4 v2, 0x0

    .line 96
    :goto_5
    return v2

    .line 91
    :cond_6
    iget-wide v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mLastPokeTime:J

    sub-long v0, p1, v2

    .line 92
    .local v0, dt:J
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mHold:I

    iget v3, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mDecay:I

    add-int/2addr v2, v3

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-lez v2, :cond_18

    .line 93
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMin:I

    int-to-float v2, v2

    goto :goto_5

    .line 94
    :cond_18
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mHold:I

    int-to-long v2, v2

    cmp-long v2, v0, v2

    if-gez v2, :cond_23

    .line 95
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMax:I

    int-to-float v2, v2

    goto :goto_5

    .line 96
    :cond_23
    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMax:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mSizeMin:I

    int-to-float v3, v3

    iget v4, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mHold:I

    int-to-long v4, v4

    sub-long v4, v0, v4

    long-to-float v4, v4

    iget v5, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mDecay:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v2, v3, v4}, Lcom/android/systemui/statusbar/policy/DeadZone;->lerp(FFF)F

    move-result v2

    float-to-int v2, v2

    int-to-float v2, v2

    goto :goto_5
.end method

.method static lerp(FFF)F
    .registers 4
    .parameter "a"
    .parameter "b"
    .parameter "f"

    .prologue
    .line 85
    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method


# virtual methods
.method public getFlash()F
    .registers 2

    .prologue
    .line 147
    iget v0, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .parameter "can"

    .prologue
    const/4 v4, 0x0

    .line 152
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mShouldFlash:Z

    if-eqz v2, :cond_c

    iget v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_d

    .line 164
    :cond_c
    :goto_c
    return-void

    .line 156
    :cond_d
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/android/systemui/statusbar/policy/DeadZone;->getSize(J)F

    move-result v2

    float-to-int v1, v2

    .line 157
    .local v1, size:I
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mVertical:Z

    if-eqz v2, :cond_36

    move v2, v1

    :goto_1b
    iget-boolean v3, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mVertical:Z

    if-eqz v3, :cond_23

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    .end local v1           #size:I
    :cond_23
    invoke-virtual {p1, v4, v4, v2, v1}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    .line 158
    iget v0, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    .line 159
    .local v0, frac:F
    const/high16 v2, 0x437f

    mul-float/2addr v2, v0

    float-to-int v2, v2

    const/16 v3, 0xdd

    const/16 v4, 0xee

    const/16 v5, 0xaa

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawARGB(IIII)V

    goto :goto_c

    .line 157
    .end local v0           #frac:F
    .restart local v1       #size:I
    :cond_36
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    goto :goto_1b
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 7
    .parameter "event"

    .prologue
    .line 112
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 113
    .local v0, action:I
    const/4 v2, 0x4

    if-ne v0, v2, :cond_c

    .line 114
    invoke-virtual {p0, p1}, Lcom/android/systemui/statusbar/policy/DeadZone;->poke(Landroid/view/MotionEvent;)V

    .line 131
    :cond_a
    const/4 v2, 0x0

    :goto_b
    return v2

    .line 115
    :cond_c
    if-nez v0, :cond_a

    .line 119
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-direct {p0, v2, v3}, Lcom/android/systemui/statusbar/policy/DeadZone;->getSize(J)F

    move-result v2

    float-to-int v1, v2

    .line 120
    .local v1, size:I
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mVertical:Z

    if-eqz v2, :cond_24

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    int-to-float v3, v1

    cmpg-float v2, v2, v3

    if-ltz v2, :cond_2d

    :cond_24
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    int-to-float v3, v1

    cmpg-float v2, v2, v3

    if-gez v2, :cond_a

    .line 122
    :cond_2d
    const-string v2, "DeadZone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "consuming errant click: ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    iget-boolean v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mShouldFlash:Z

    if-eqz v2, :cond_69

    .line 125
    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mDebugFlash:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/android/systemui/statusbar/policy/DeadZone;->post(Ljava/lang/Runnable;)Z

    .line 126
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/DeadZone;->postInvalidate()V

    .line 128
    :cond_69
    const/4 v2, 0x1

    goto :goto_b
.end method

.method public poke(Landroid/view/MotionEvent;)V
    .registers 4
    .parameter "event"

    .prologue
    .line 135
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mLastPokeTime:J

    .line 138
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/DeadZone;->postInvalidate()V

    .line 139
    return-void
.end method

.method public setFlash(F)V
    .registers 2
    .parameter "f"

    .prologue
    .line 142
    iput p1, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    .line 143
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/DeadZone;->postInvalidate()V

    .line 144
    return-void
.end method

.method public setFlashOnTouchCapture(Z)V
    .registers 3
    .parameter "dbg"

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mShouldFlash:Z

    .line 101
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/systemui/statusbar/policy/DeadZone;->mFlashFrac:F

    .line 102
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/DeadZone;->postInvalidate()V

    .line 103
    return-void
.end method
