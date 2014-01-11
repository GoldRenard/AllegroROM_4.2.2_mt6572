.class public Lcom/android/systemui/statusbar/policy/CircleBattery;
.super Landroid/widget/ImageView;
.source "CircleBattery.java"

# interfaces
.implements Lcom/android/systemui/statusbar/policy/BatteryController$BatteryStateChangeCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;
    }
.end annotation


# static fields
.field private static final STATUS_BAR_BATTERY_PREF:Ljava/lang/String; = "status_bar_battery"


# instance fields
.field private mActivated:Z

.field private mAnimOffset:I

.field private mAttached:Z

.field private mBatteryStatus:I

.field private mCircleSize:I

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private final mInvalidate:Ljava/lang/Runnable;

.field private mIsAnimating:Z

.field private mLevel:I

.field private mObserver:Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;

.field private mPaintFont:Landroid/graphics/Paint;

.field private mPaintGray:Landroid/graphics/Paint;

.field private mPaintRed:Landroid/graphics/Paint;

.field private mPaintSystem:Landroid/graphics/Paint;

.field private mPercentage:Z

.field private mRectLeft:Landroid/graphics/RectF;

.field private mTextLeftX:Ljava/lang/Float;

.field private mTextY:Ljava/lang/Float;

.field private mWarningLevel:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 93
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 94
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 97
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 98
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const v4, 0x1060013

    const/4 v3, 0x1

    .line 101
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 59
    new-instance v1, Lcom/android/systemui/statusbar/policy/CircleBattery$1;

    invoke-direct {v1, p0}, Lcom/android/systemui/statusbar/policy/CircleBattery$1;-><init>(Lcom/android/systemui/statusbar/policy/CircleBattery;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mInvalidate:Ljava/lang/Runnable;

    .line 103
    iput-object p1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mContext:Landroid/content/Context;

    .line 104
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    .line 106
    new-instance v1, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2}, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;-><init>(Lcom/android/systemui/statusbar/policy/CircleBattery;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mObserver:Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;

    .line 110
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 112
    .local v0, res:Landroid/content/res/Resources;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    .line 113
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 114
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 115
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 117
    new-instance v1, Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    .line 118
    new-instance v1, Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintSystem:Landroid/graphics/Paint;

    .line 119
    new-instance v1, Landroid/graphics/Paint;

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    iput-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintRed:Landroid/graphics/Paint;

    .line 121
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 122
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintSystem:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 123
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintRed:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 125
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 126
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintSystem:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    const/high16 v2, 0x106

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintRed:Landroid/graphics/Paint;

    const v2, 0x1060016

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 133
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 134
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 136
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x10e001a

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    iput v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mWarningLevel:I

    .line 137
    return-void
.end method

.method static synthetic access$000(Lcom/android/systemui/statusbar/policy/CircleBattery;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mActivated:Z

    return v0
.end method

.method static synthetic access$100(Lcom/android/systemui/statusbar/policy/CircleBattery;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    return v0
.end method

.method static synthetic access$200(Lcom/android/systemui/statusbar/policy/CircleBattery;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    .line 28
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private initSizeBasedStuff()V
    .locals 11

    .prologue
    const/4 v10, 0x0

    const/high16 v9, 0x4000

    .line 282
    iget v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    if-nez v3, :cond_0

    .line 283
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->initSizeMeasureIconHeight()V

    .line 286
    :cond_0
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    iget v4, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v4, v4

    div-float/2addr v4, v9

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 288
    iget v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v3, v3

    const/high16 v4, 0x40d0

    div-float v2, v3, v4

    .line 289
    .local v2, strokeWidth:F
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintRed:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 290
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintSystem:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 291
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    const/high16 v4, 0x4060

    div-float v4, v2, v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 294
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getPaddingLeft()I

    move-result v1

    .line 295
    .local v1, pLeft:I
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v4, v1

    div-float v5, v2, v9

    add-float/2addr v4, v5

    const/4 v5, 0x0

    div-float v6, v2, v9

    add-float/2addr v5, v6

    iget v6, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v6, v6

    div-float v7, v2, v9

    sub-float/2addr v6, v7

    int-to-float v7, v1

    add-float/2addr v6, v7

    iget v7, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v7, v7

    div-float v8, v2, v9

    sub-float/2addr v7, v8

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mRectLeft:Landroid/graphics/RectF;

    .line 299
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 300
    .local v0, bounds:Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    const-string v4, "99"

    const-string v5, "99"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v3, v4, v10, v5, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 301
    iget v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v3, v3

    div-float/2addr v3, v9

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mTextLeftX:Ljava/lang/Float;

    .line 303
    iget v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    int-to-float v3, v3

    div-float/2addr v3, v9

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    iget v5, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v5

    int-to-float v4, v4

    div-float/2addr v4, v9

    add-float/2addr v3, v4

    div-float v4, v2, v9

    sub-float/2addr v3, v4

    const/high16 v4, 0x3f80

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mTextY:Ljava/lang/Float;

    .line 306
    invoke-virtual {p0, v10, v10}, Lcom/android/systemui/statusbar/policy/CircleBattery;->onMeasure(II)V

    .line 307
    return-void
.end method

.method private initSizeMeasureIconHeight()V
    .locals 6

    .prologue
    .line 317
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020229

    invoke-static {v4, v5}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 318
    .local v1, measure:Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    div-int/lit8 v2, v4, 0x2

    .line 320
    .local v2, x:I
    const/4 v4, 0x0

    iput v4, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    .line 321
    const/4 v3, 0x0

    .local v3, y:I
    :goto_0
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-ge v3, v4, :cond_1

    .line 322
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    invoke-static {v4}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    .line 323
    .local v0, alpha:I
    const/4 v4, 0x5

    if-le v0, v4, :cond_0

    .line 324
    iget v4, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    .line 321
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 327
    .end local v0           #alpha:I
    :cond_1
    return-void
.end method

.method private updateChargeAnim()V
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 255
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getBatteryStatus()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    .line 256
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mIsAnimating:Z

    if-eqz v0, :cond_0

    .line 257
    iput-boolean v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mIsAnimating:Z

    .line 258
    iput v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    .line 259
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mInvalidate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 274
    :cond_0
    :goto_0
    return-void

    .line 264
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mIsAnimating:Z

    .line 266
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    const/16 v1, 0x168

    if-le v0, v1, :cond_2

    .line 267
    iput v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    .line 272
    :goto_1
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mInvalidate:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 273
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mInvalidate:Ljava/lang/Runnable;

    const-wide/16 v2, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 269
    :cond_2
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    add-int/lit8 v0, v0, 0x3

    iput v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    goto :goto_1
.end method


# virtual methods
.method protected drawCircle(Landroid/graphics/Canvas;IIFLandroid/graphics/RectF;)V
    .locals 8
    .parameter "canvas"
    .parameter "level"
    .parameter "animOffset"
    .parameter "textX"
    .parameter "drawRect"

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    .line 207
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintSystem:Landroid/graphics/Paint;

    .line 208
    .local v7, usePaint:Landroid/graphics/Paint;
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getBatteryStatus()I

    move-result v0

    if-ne v0, v6, :cond_2

    .line 210
    .local v6, unknownStatus:Z
    :goto_0
    if-eqz v6, :cond_3

    .line 211
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    .line 212
    const/16 p2, 0x64

    .line 220
    :cond_0
    :goto_1
    const/high16 v2, 0x4387

    const/high16 v3, 0x43b4

    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintGray:Landroid/graphics/Paint;

    move-object v0, p1

    move-object v1, p5

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 222
    add-int/lit16 v0, p3, 0x10e

    int-to-float v2, v0

    const v0, 0x40666666

    int-to-float v1, p2

    mul-float v3, v0, v1

    move-object v0, p1

    move-object v1, p5

    move-object v5, v7

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 225
    if-eqz v6, :cond_5

    .line 226
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 227
    const-string v0, "?"

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mTextY:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p4, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 233
    :cond_1
    :goto_2
    return-void

    .end local v6           #unknownStatus:Z
    :cond_2
    move v6, v4

    .line 208
    goto :goto_0

    .line 213
    .restart local v6       #unknownStatus:Z
    :cond_3
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mWarningLevel:I

    if-ge p2, v0, :cond_4

    .line 214
    iget-object v7, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintRed:Landroid/graphics/Paint;

    goto :goto_1

    .line 215
    :cond_4
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getBatteryStatus()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    .line 216
    const/16 p2, 0x64

    goto :goto_1

    .line 228
    :cond_5
    const/16 v0, 0x64

    if-ge p2, v0, :cond_1

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPercentage:Z

    if-eqz v0, :cond_1

    .line 229
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 230
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mTextY:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    iget-object v2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPaintFont:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, p4, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_2
.end method

.method protected getBatteryLevel()I
    .locals 1

    .prologue
    .line 195
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mLevel:I

    return v0
.end method

.method protected getBatteryStatus()I
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mBatteryStatus:I

    return v0
.end method

.method protected isBatteryPresent()Z
    .locals 1

    .prologue
    .line 203
    const/4 v0, 0x1

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .prologue
    .line 141
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    .line 142
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    if-nez v0, :cond_0

    .line 143
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    .line 144
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mObserver:Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->observe()V

    .line 145
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mInvalidate:Ljava/lang/Runnable;

    const-wide/16 v2, 0xfa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 147
    :cond_0
    return-void
.end method

.method public onBatteryLevelChanged(II)V
    .locals 0
    .parameter "level"
    .parameter "status"

    .prologue
    .line 172
    iput p1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mLevel:I

    .line 173
    iput p2, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mBatteryStatus:I

    .line 174
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->updateVisibility()V

    .line 175
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 151
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    .line 152
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    if-eqz v0, :cond_0

    .line 153
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    .line 154
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mObserver:Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;

    invoke-virtual {v0}, Lcom/android/systemui/statusbar/policy/CircleBattery$SettingsObserver;->unobserve()V

    .line 155
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mRectLeft:Landroid/graphics/RectF;

    .line 157
    iput v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    .line 160
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7
    .parameter "canvas"

    .prologue
    const/4 v3, 0x0

    .line 237
    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mRectLeft:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    .line 238
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->initSizeBasedStuff()V

    .line 241
    :cond_0
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->updateChargeAnim()V

    .line 243
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getBatteryStatus()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    const/4 v6, 0x1

    .line 244
    .local v6, charging:Z
    :goto_0
    if-eqz v6, :cond_1

    iget v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAnimOffset:I

    .line 246
    .local v3, offset:I
    :cond_1
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getBatteryLevel()I

    move-result v2

    iget-object v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mTextLeftX:Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mRectLeft:Landroid/graphics/RectF;

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/android/systemui/statusbar/policy/CircleBattery;->drawCircle(Landroid/graphics/Canvas;IIFLandroid/graphics/RectF;)V

    .line 247
    return-void

    .end local v3           #offset:I
    .end local v6           #charging:Z
    :cond_2
    move v6, v3

    .line 243
    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 187
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    if-nez v0, :cond_0

    .line 188
    invoke-direct {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->initSizeMeasureIconHeight()V

    .line 191
    :cond_0
    iget v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->getPaddingLeft()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mCircleSize:I

    invoke-virtual {p0, v0, v1}, Lcom/android/systemui/statusbar/policy/CircleBattery;->setMeasuredDimension(II)V

    .line 192
    return-void
.end method

.method public updateSettings()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 163
    iget-object v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v4, "status_bar_battery"

    invoke-static {v1, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 164
    .local v0, batteryStyle:I
    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    if-ne v0, v5, :cond_1

    :cond_0
    move v1, v3

    :goto_0
    iput-boolean v1, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mActivated:Z

    .line 166
    if-ne v0, v5, :cond_2

    :goto_1
    iput-boolean v3, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mPercentage:Z

    .line 167
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->updateVisibility()V

    .line 168
    return-void

    :cond_1
    move v1, v2

    .line 164
    goto :goto_0

    :cond_2
    move v3, v2

    .line 166
    goto :goto_1
.end method

.method protected updateVisibility()V
    .locals 1

    .prologue
    .line 178
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mActivated:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->isBatteryPresent()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->setVisibility(I)V

    .line 180
    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mActivated:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/systemui/statusbar/policy/CircleBattery;->mAttached:Z

    if-eqz v0, :cond_0

    .line 181
    invoke-virtual {p0}, Lcom/android/systemui/statusbar/policy/CircleBattery;->invalidate()V

    .line 183
    :cond_0
    return-void

    .line 178
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method
