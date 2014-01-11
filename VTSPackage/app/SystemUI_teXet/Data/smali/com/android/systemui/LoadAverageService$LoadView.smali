.class Lcom/android/systemui/LoadAverageService$LoadView;
.super Landroid/view/View;
.source "LoadAverageService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/systemui/LoadAverageService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadView"
.end annotation


# instance fields
.field private mAddedPaint:Landroid/graphics/Paint;

.field private mAscent:F

.field private mFH:I

.field private mHandler:Landroid/os/Handler;

.field private mIrqPaint:Landroid/graphics/Paint;

.field private mLoadPaint:Landroid/graphics/Paint;

.field private mNeededHeight:I

.field private mNeededWidth:I

.field private mPreTxBytes:J

.field private mPreTxTime:J

.field private mRemovedPaint:Landroid/graphics/Paint;

.field private mShadow2Paint:Landroid/graphics/Paint;

.field private mShadowPaint:Landroid/graphics/Paint;

.field private final mStats:Lcom/android/systemui/LoadAverageService$Stats;

.field private mStorageIndicatorDelay:I

.field private mStorageIndicatorMode:I

.field private mSystemPaint:Landroid/graphics/Paint;

.field private mThermalIndicatorDelay:I

.field private mThermalIndicatorMode:I

.field private mThermalText:Ljava/lang/String;

.field private mThermalTextExtra:Ljava/lang/String;

.field private mThermalTextLineThree:Ljava/lang/String;

.field private mThermalWidth:I

.field private mThermalWidthExtra:I

.field private mThermalWidthLineThree:I

.field private mUserPaint:Landroid/graphics/Paint;

.field final synthetic this$0:Lcom/android/systemui/LoadAverageService;


# direct methods
.method constructor <init>(Lcom/android/systemui/LoadAverageService;Landroid/content/Context;)V
    .registers 15
    .parameter
    .parameter "c"

    .prologue
    const/4 v11, 0x1

    const/16 v10, 0x80

    const/4 v9, 0x0

    const/16 v8, 0xff

    const/4 v7, 0x0

    .line 129
    iput-object p1, p0, Lcom/android/systemui/LoadAverageService$LoadView;->this$0:Lcom/android/systemui/LoadAverageService;

    .line 130
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 72
    new-instance v3, Lcom/android/systemui/LoadAverageService$LoadView$1;

    invoke-direct {v3, p0}, Lcom/android/systemui/LoadAverageService$LoadView$1;-><init>(Lcom/android/systemui/LoadAverageService$LoadView;)V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mHandler:Landroid/os/Handler;

    .line 114
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxBytes:J

    .line 115
    const-wide/16 v3, 0x0

    iput-wide v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxTime:J

    .line 123
    iput v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    .line 124
    iput v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I

    .line 126
    iput v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorMode:I

    .line 127
    iput v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorDelay:I

    .line 132
    const/4 v3, 0x4

    const/4 v4, 0x4

    const/4 v5, 0x4

    const/4 v6, 0x4

    invoke-virtual {p0, v3, v4, v5, v6}, Lcom/android/systemui/LoadAverageService$LoadView;->setPadding(IIII)V

    .line 139
    const/16 v2, 0xa

    .line 140
    .local v2, textSize:I
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v0, v3, Landroid/util/DisplayMetrics;->density:F

    .line 141
    .local v0, density:F
    const/high16 v3, 0x3f80

    cmpg-float v3, v0, v3

    if-gez v3, :cond_135

    .line 142
    const/16 v2, 0x9

    .line 149
    :cond_3e
    :goto_3e
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    .line 150
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 151
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    int-to-float v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 152
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v8, v8, v8, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 154
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAddedPaint:Landroid/graphics/Paint;

    .line 155
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAddedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 156
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAddedPaint:Landroid/graphics/Paint;

    int-to-float v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 157
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAddedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v8, v10, v8, v10}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 159
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    .line 160
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 161
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setStrikeThruText(Z)V

    .line 162
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    int-to-float v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 163
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v8, v8, v10, v10}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 165
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    .line 166
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 167
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    int-to-float v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 169
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    const/16 v4, 0xc0

    invoke-virtual {v3, v4, v7, v7, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 170
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x4080

    const/high16 v5, -0x100

    invoke-virtual {v3, v4, v9, v9, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 172
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    .line 173
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 174
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    int-to-float v4, v2

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 176
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    const/16 v4, 0xc0

    invoke-virtual {v3, v4, v7, v7, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 177
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x4000

    const/high16 v5, -0x100

    invoke-virtual {v3, v4, v9, v9, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 179
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mIrqPaint:Landroid/graphics/Paint;

    .line 180
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mIrqPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v10, v7, v7, v8}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 181
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mIrqPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x4000

    const/high16 v5, -0x100

    invoke-virtual {v3, v4, v9, v9, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 182
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    .line 183
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v10, v8, v7, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 184
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x4000

    const/high16 v5, -0x100

    invoke-virtual {v3, v4, v9, v9, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 185
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mUserPaint:Landroid/graphics/Paint;

    .line 186
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mUserPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v10, v7, v8, v7}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 187
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    const/high16 v4, 0x4000

    const/high16 v5, -0x100

    invoke-virtual {v3, v4, v9, v9, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 189
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAscent:F

    .line 190
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->descent()F

    move-result v1

    .line 191
    .local v1, descent:F
    iget v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mAscent:F

    sub-float v3, v1, v3

    const/high16 v4, 0x3f00

    add-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    .line 193
    new-instance v3, Lcom/android/systemui/LoadAverageService$Stats;

    iget-object v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    invoke-direct {v3, v4}, Lcom/android/systemui/LoadAverageService$Stats;-><init>(Landroid/graphics/Paint;)V

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;

    .line 194
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;

    invoke-virtual {v3}, Lcom/android/systemui/LoadAverageService$Stats;->init()V

    .line 195
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->updateDisplay()V

    .line 196
    return-void

    .line 144
    .end local v1           #descent:F
    :cond_135
    const/high16 v3, 0x4120

    mul-float/2addr v3, v0

    float-to-int v2, v3

    .line 145
    const/16 v3, 0xa

    if-ge v2, v3, :cond_3e

    .line 146
    const/16 v2, 0xa

    goto/16 :goto_3e
.end method

.method static synthetic access$000(Lcom/android/systemui/LoadAverageService$LoadView;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 71
    iget v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/systemui/LoadAverageService$LoadView;)Lcom/android/systemui/LoadAverageService$Stats;
    .registers 2
    .parameter "x0"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/systemui/LoadAverageService$LoadView;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 71
    iget v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I

    return v0
.end method


# virtual methods
.method getBattTemp()Ljava/lang/String;
    .registers 7

    .prologue
    .line 520
    const-string v3, ""

    .line 522
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/mtktz/mtktsbattery"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 523
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 524
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 525
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 531
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 526
    :catch_17
    move-exception v1

    .line 527
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 528
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 529
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getCpuTemp()Ljava/lang/String;
    .registers 7

    .prologue
    .line 505
    const-string v3, ""

    .line 507
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/mtktz/mtktscpu"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 508
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 509
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 510
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 516
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 511
    :catch_17
    move-exception v1

    .line 512
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 513
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 514
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getCurCpuFreq()Ljava/lang/String;
    .registers 7

    .prologue
    .line 612
    const-string v3, "N/A"

    .line 614
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 616
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 617
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 618
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 624
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 619
    :catch_17
    move-exception v1

    .line 620
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 621
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 622
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getMaxCpuFreq()Ljava/lang/String;
    .registers 7

    .prologue
    .line 580
    const-string v3, "N/A"

    .line 582
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 584
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 585
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 586
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 592
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 587
    :catch_17
    move-exception v1

    .line 588
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 589
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 590
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getMinCpuFreq()Ljava/lang/String;
    .registers 7

    .prologue
    .line 596
    const-string v3, "N/A"

    .line 598
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 600
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 601
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 602
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 608
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 603
    :catch_17
    move-exception v1

    .line 604
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 605
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 606
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getPaTemp()Ljava/lang/String;
    .registers 7

    .prologue
    .line 535
    const-string v3, ""

    .line 537
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/mtktz/mtktspa"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 538
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 539
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 540
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 546
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 541
    :catch_17
    move-exception v1

    .line 542
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 543
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 544
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getPhyRate()Ljava/lang/String;
    .registers 6

    .prologue
    .line 644
    const-string v1, ""

    .line 645
    .local v1, result:Ljava/lang/String;
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->this$0:Lcom/android/systemui/LoadAverageService;

    const-string v4, "wifi"

    invoke-virtual {v3, v4}, Lcom/android/systemui/LoadAverageService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 646
    .local v0, mgr:Landroid/net/wifi/WifiManager;
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 647
    .local v2, wifiInfo:Landroid/net/wifi/WifiInfo;
    if-eqz v2, :cond_2d

    .line 648
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getLinkSpeed()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Mbps"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 649
    :cond_2d
    return-object v1
.end method

.method getStorageIndicatorModeAndDelay()V
    .registers 8

    .prologue
    .line 454
    const-string v3, ""

    .line 456
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/driver/mtk_io_osd_config"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 457
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 458
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 459
    .local v4, text:Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorMode:I

    .line 460
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 461
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorDelay:I

    .line 463
    iget v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorMode:I

    const/4 v6, 0x1

    if-ne v5, v6, :cond_33

    .line 464
    const/16 v5, 0x63

    iput v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I
    :try_end_33
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_33} :catch_34
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_33} :catch_39

    .line 471
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :cond_33
    :goto_33
    return-void

    .line 466
    :catch_34
    move-exception v1

    .line 467
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_33

    .line 468
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_39
    move-exception v1

    .line 469
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_33
.end method

.method getThermalIndicatorModeAndDelay()V
    .registers 7

    .prologue
    .line 436
    const-string v3, ""

    .line 438
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/driver/mtk_thermal_indicator"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 439
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 440
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 441
    .local v4, text:Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    .line 442
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 443
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    iput v5, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I
    :try_end_2a
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2a} :catch_2b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2a} :catch_30

    .line 449
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_2a
    return-void

    .line 444
    :catch_2b
    move-exception v1

    .line 445
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_2a

    .line 446
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_30
    move-exception v1

    .line 447
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2a
.end method

.method getThermalLimitCpuOpp()Ljava/lang/String;
    .registers 7

    .prologue
    .line 565
    const-string v3, ""

    .line 567
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/mtktscpu/mtktscpu_opp"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 568
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 569
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 570
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 576
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 571
    :catch_17
    move-exception v1

    .line 572
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 573
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 574
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getTxBytes()Ljava/lang/String;
    .registers 16

    .prologue
    .line 653
    const-string v2, ""

    .line 654
    .local v2, result:Ljava/lang/String;
    invoke-static {}, Landroid/net/TrafficStats;->getMobileTxBytes()J

    move-result-wide v5

    .line 655
    .local v5, txMobileBytes:J
    invoke-static {}, Landroid/net/TrafficStats;->getTotalTxBytes()J

    move-result-wide v7

    .line 656
    .local v7, txTotalBytes:J
    const-wide/16 v3, 0x0

    .line 657
    .local v3, throughput:J
    sub-long v11, v7, v5

    const-wide/16 v13, 0x8

    mul-long v9, v11, v13

    .line 658
    .local v9, txWlanBits:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const-wide/16 v13, 0x3e8

    div-long v0, v11, v13

    .line 659
    .local v0, curTime:J
    const-wide/16 v11, 0x0

    cmp-long v11, v9, v11

    if-lez v11, :cond_35

    iget-wide v11, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxTime:J

    const-wide/16 v13, 0x0

    cmp-long v11, v11, v13

    if-lez v11, :cond_35

    .line 660
    iget-wide v11, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxBytes:J

    sub-long v11, v9, v11

    iget-wide v13, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxTime:J

    sub-long v13, v0, v13

    div-long v3, v11, v13

    .line 661
    const-wide/16 v11, 0x3e8

    div-long/2addr v3, v11

    .line 664
    :cond_35
    iput-wide v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxTime:J

    .line 665
    iput-wide v9, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPreTxBytes:J

    .line 667
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    .line 668
    return-object v2
.end method

.method getWiFiTemp()Ljava/lang/String;
    .registers 7

    .prologue
    .line 550
    const-string v3, ""

    .line 552
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/mtktz/mtktswmt"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 553
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 554
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 555
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 561
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 556
    :catch_17
    move-exception v1

    .line 557
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 558
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 559
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getWiFiTxUsage()Ljava/lang/String;
    .registers 7

    .prologue
    .line 628
    const-string v3, ""

    .line 630
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/wmt_tm/tx_thro"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 631
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 632
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 633
    .local v4, text:Ljava/lang/String;
    if-eqz v4, :cond_18

    .line 634
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_17
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_17} :catch_19
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_17} :catch_1e

    move-result-object v3

    .line 640
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :cond_18
    :goto_18
    return-object v3

    .line 635
    :catch_19
    move-exception v1

    .line 636
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_18

    .line 637
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1e
    move-exception v1

    .line 638
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_18
.end method

.method getmmcqd1()Ljava/lang/String;
    .registers 7

    .prologue
    .line 490
    const-string v3, ""

    .line 492
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/driver/mtk_io_osd_mmcqd1"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 493
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 494
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 495
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 501
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 496
    :catch_17
    move-exception v1

    .line 497
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 498
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 499
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method getmmcqd2()Ljava/lang/String;
    .registers 7

    .prologue
    .line 475
    const-string v3, ""

    .line 477
    .local v3, result:Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/io/FileReader;

    const-string v5, "/proc/driver/mtk_io_osd_mmcqd2"

    invoke-direct {v2, v5}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 478
    .local v2, fr:Ljava/io/FileReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 479
    .local v0, br:Ljava/io/BufferedReader;
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 480
    .local v4, text:Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_15} :catch_17
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_15} :catch_1c

    move-result-object v3

    .line 486
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v2           #fr:Ljava/io/FileReader;
    .end local v4           #text:Ljava/lang/String;
    :goto_16
    return-object v3

    .line 481
    :catch_17
    move-exception v1

    .line 482
    .local v1, e:Ljava/io/FileNotFoundException;
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_16

    .line 483
    .end local v1           #e:Ljava/io/FileNotFoundException;
    :catch_1c
    move-exception v1

    .line 484
    .local v1, e:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_16
.end method

.method protected onAttachedToWindow()V
    .registers 3

    .prologue
    .line 200
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 201
    iget-object v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 202
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 206
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 207
    iget-object v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 208
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 31
    .parameter "canvas"

    .prologue
    .line 218
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 219
    move-object/from16 v0, p0

    iget v10, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededWidth:I

    .line 220
    .local v10, W:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getWidth()I

    move-result v2

    add-int/lit8 v9, v2, -0x1

    .line 222
    .local v9, RIGHT:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;

    move-object/from16 v20, v0

    .line 223
    .local v20, stats:Lcom/android/systemui/LoadAverageService$Stats;
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastUserTime()I

    move-result v25

    .line 224
    .local v25, userTime:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastSystemTime()I

    move-result v21

    .line 225
    .local v21, systemTime:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastIoWaitTime()I

    move-result v14

    .line 226
    .local v14, iowaitTime:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastIrqTime()I

    move-result v15

    .line 227
    .local v15, irqTime:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastSoftIrqTime()I

    move-result v18

    .line 228
    .local v18, softIrqTime:I
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->getLastIdleTime()I

    move-result v13

    .line 230
    .local v13, idleTime:I
    add-int v2, v25, v21

    add-int/2addr v2, v14

    add-int/2addr v2, v15

    add-int v2, v2, v18

    add-int v24, v2, v13

    .line 231
    .local v24, totalTime:I
    if-nez v24, :cond_36

    .line 366
    :cond_35
    return-void

    .line 234
    :cond_36
    mul-int v2, v25, v10

    div-int v26, v2, v24

    .line 235
    .local v26, userW:I
    mul-int v2, v21, v10

    div-int v22, v2, v24

    .line 236
    .local v22, systemW:I
    add-int v2, v14, v15

    add-int v2, v2, v18

    mul-int/2addr v2, v10

    div-int v16, v2, v24

    .line 238
    .local v16, irqW:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 239
    .local v27, x:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingTop:I

    add-int/lit8 v23, v2, 0x2

    .line 240
    .local v23, top:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingTop:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v2, v3

    add-int/lit8 v11, v2, -0x2

    .line 241
    .local v11, bottom:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingTop:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mAscent:F

    float-to-int v3, v3

    sub-int v28, v2, v3

    .line 243
    .local v28, y:I
    const/4 v2, 0x1

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-eq v2, v3, :cond_7c

    const/4 v2, 0x2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-eq v2, v3, :cond_7c

    const/4 v2, 0x3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v2, v3, :cond_af

    .line 248
    :cond_7c
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidth:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 251
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 252
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 253
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 254
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 257
    :cond_af
    const/4 v2, 0x2

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-eq v2, v3, :cond_bd

    const/4 v2, 0x3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v2, v3, :cond_f0

    .line 259
    :cond_bd
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidthExtra:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 262
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 263
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 264
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 265
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 268
    :cond_f0
    const/4 v2, 0x3

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v2, v3, :cond_12a

    .line 270
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidthLineThree:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 273
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 274
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 275
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 276
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 279
    :cond_12a
    const/16 v2, 0x63

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v2, v3, :cond_198

    .line 284
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidth:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 287
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 288
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 289
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 290
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 292
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidthExtra:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 295
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 296
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 297
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 298
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 301
    :cond_198
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-nez v2, :cond_277

    .line 303
    if-lez v16, :cond_1b5

    .line 304
    sub-int v2, v27, v16

    int-to-float v3, v2

    move/from16 v0, v23

    int-to-float v4, v0

    move/from16 v0, v27

    int-to-float v5, v0

    int-to-float v6, v11

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mIrqPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 305
    sub-int v27, v27, v16

    .line 307
    :cond_1b5
    if-lez v22, :cond_1cc

    .line 308
    sub-int v2, v27, v22

    int-to-float v3, v2

    move/from16 v0, v23

    int-to-float v4, v0

    move/from16 v0, v27

    int-to-float v5, v0

    int-to-float v6, v11

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 309
    sub-int v27, v27, v22

    .line 311
    :cond_1cc
    if-lez v26, :cond_1e3

    .line 312
    sub-int v2, v27, v26

    int-to-float v3, v2

    move/from16 v0, v23

    int-to-float v4, v0

    move/from16 v0, v27

    int-to-float v5, v0

    int-to-float v6, v11

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mUserPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 313
    sub-int v27, v27, v26

    .line 316
    :cond_1e3
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v20

    iget v4, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, -0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 318
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v20

    iget v4, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, 0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 320
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v20

    iget v4, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, -0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 322
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v20

    iget v4, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, 0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 324
    move-object/from16 v0, v20

    iget-object v2, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadText:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v20

    iget v4, v0, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 329
    :cond_277
    const/4 v8, 0x0

    .line 330
    .local v8, N:I
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-nez v2, :cond_282

    .line 332
    invoke-virtual/range {v20 .. v20}, Lcom/android/systemui/LoadAverageService$Stats;->countWorkingStats()I

    move-result v8

    .line 335
    :cond_282
    const/4 v12, 0x0

    .local v12, i:I
    :goto_283
    if-ge v12, v8, :cond_35

    .line 336
    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Lcom/android/systemui/LoadAverageService$Stats;->getWorkingStats(I)Lcom/android/internal/os/ProcessStats$Stats;

    move-result-object v19

    .line 337
    .local v19, st:Lcom/android/internal/os/ProcessStats$Stats;
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v28, v28, v2

    .line 338
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int v23, v23, v2

    .line 339
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    add-int/2addr v11, v2

    .line 341
    move-object/from16 v0, v19

    iget v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->rel_utime:I

    mul-int/2addr v2, v10

    div-int v26, v2, v24

    .line 342
    move-object/from16 v0, v19

    iget v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->rel_stime:I

    mul-int/2addr v2, v10

    div-int v22, v2, v24

    .line 343
    move-object/from16 v0, p0

    iget v2, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v27, v9, v2

    .line 344
    if-lez v22, :cond_2c7

    .line 345
    sub-int v2, v27, v22

    int-to-float v3, v2

    move/from16 v0, v23

    int-to-float v4, v0

    move/from16 v0, v27

    int-to-float v5, v0

    int-to-float v6, v11

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mSystemPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 346
    sub-int v27, v27, v22

    .line 348
    :cond_2c7
    if-lez v26, :cond_2de

    .line 349
    sub-int v2, v27, v26

    int-to-float v3, v2

    move/from16 v0, v23

    int-to-float v4, v0

    move/from16 v0, v27

    int-to-float v5, v0

    int-to-float v6, v11

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mUserPaint:Landroid/graphics/Paint;

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 350
    sub-int v27, v27, v26

    .line 353
    :cond_2de
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, -0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 355
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, 0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadowPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 357
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, -0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 359
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    int-to-float v3, v3

    add-int/lit8 v4, v28, 0x1

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mShadow2Paint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    .line 362
    .local v17, p:Landroid/graphics/Paint;
    move-object/from16 v0, v19

    iget-boolean v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->added:Z

    if-eqz v2, :cond_368

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mAddedPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    .line 363
    :cond_368
    move-object/from16 v0, v19

    iget-boolean v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->removed:Z

    if-eqz v2, :cond_374

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mRemovedPaint:Landroid/graphics/Paint;

    move-object/from16 v17, v0

    .line 364
    :cond_374
    move-object/from16 v0, v19

    iget-object v2, v0, Lcom/android/internal/os/ProcessStats$Stats;->name:Ljava/lang/String;

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    sub-int v3, v9, v3

    move-object/from16 v0, v19

    iget v4, v0, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    sub-int/2addr v3, v4

    int-to-float v3, v3

    move/from16 v0, v28

    int-to-float v4, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 335
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_283
.end method

.method protected onMeasure(II)V
    .registers 5
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    .line 212
    iget v0, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededWidth:I

    invoke-static {v0, p1}, Lcom/android/systemui/LoadAverageService$LoadView;->resolveSize(II)I

    move-result v0

    iget v1, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededHeight:I

    invoke-static {v1, p2}, Lcom/android/systemui/LoadAverageService$LoadView;->resolveSize(II)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/systemui/LoadAverageService$LoadView;->setMeasuredDimension(II)V

    .line 214
    return-void
.end method

.method updateDisplay()V
    .registers 11

    .prologue
    .line 369
    iget-object v6, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStats:Lcom/android/systemui/LoadAverageService$Stats;

    .line 371
    .local v6, stats:Lcom/android/systemui/LoadAverageService$Stats;
    const/4 v0, 0x0

    .line 374
    .local v0, NW:I
    iget v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-nez v7, :cond_b

    .line 376
    invoke-virtual {v6}, Lcom/android/systemui/LoadAverageService$Stats;->countWorkingStats()I

    move-result v0

    .line 379
    :cond_b
    iget v2, v6, Lcom/android/systemui/LoadAverageService$Stats;->mLoadWidth:I

    .line 380
    .local v2, maxWidth:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_e
    if-ge v1, v0, :cond_1d

    .line 381
    invoke-virtual {v6, v1}, Lcom/android/systemui/LoadAverageService$Stats;->getWorkingStats(I)Lcom/android/internal/os/ProcessStats$Stats;

    move-result-object v5

    .line 382
    .local v5, st:Lcom/android/internal/os/ProcessStats$Stats;
    iget v7, v5, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    if-le v7, v2, :cond_1a

    .line 383
    iget v2, v5, Lcom/android/internal/os/ProcessStats$Stats;->nameWidth:I

    .line 380
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 387
    .end local v5           #st:Lcom/android/internal/os/ProcessStats$Stats;
    :cond_1d
    iget v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingLeft:I

    iget v8, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingRight:I

    add-int/2addr v7, v8

    add-int v4, v7, v2

    .line 388
    .local v4, neededWidth:I
    iget v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingTop:I

    iget v8, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mPaddingBottom:I

    add-int/2addr v7, v8

    iget v8, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mFH:I

    iget v9, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    add-int/lit8 v9, v9, 0x1

    add-int/2addr v9, v0

    mul-int/2addr v8, v9

    add-int v3, v7, v8

    .line 389
    .local v3, neededHeight:I
    iget v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededWidth:I

    if-ne v4, v7, :cond_3b

    iget v7, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededHeight:I

    if-eq v3, v7, :cond_43

    .line 390
    :cond_3b
    iput v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededWidth:I

    .line 391
    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mNeededHeight:I

    .line 392
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->requestLayout()V

    .line 396
    :goto_42
    return-void

    .line 394
    :cond_43
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->invalidate()V

    goto :goto_42
.end method

.method updateThermalInfo()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 400
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getThermalIndicatorModeAndDelay()V

    .line 401
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getStorageIndicatorModeAndDelay()V

    .line 402
    iget v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-nez v3, :cond_39

    .line 403
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    .line 404
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    .line 405
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    .line 429
    :cond_17
    :goto_17
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidth:I

    .line 430
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidthExtra:I

    .line 431
    iget-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mLoadPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalWidthLineThree:I

    .line 432
    return-void

    .line 406
    :cond_39
    iget v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v5, v3, :cond_6d

    .line 407
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tcpu="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getCpuTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " limit="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getThermalLimitCpuOpp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    .line 408
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    .line 409
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    goto :goto_17

    .line 410
    :cond_6d
    const/4 v3, 0x2

    iget v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v3, v4, :cond_d4

    .line 411
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tcpu="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getCpuTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " limit="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getThermalLimitCpuOpp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    .line 412
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tbat="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getBattTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Tpa="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getPaTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Twifi="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getWiFiTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    .line 413
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    goto/16 :goto_17

    .line 414
    :cond_d4
    const/4 v3, 0x3

    iget v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v3, v4, :cond_164

    .line 415
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getWiFiTxUsage()Ljava/lang/String;

    move-result-object v1

    .line 416
    .local v1, StringGetWiFiTxUsage:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getTxBytes()Ljava/lang/String;

    move-result-object v0

    .line 417
    .local v0, StringGetTxBytes:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getWiFiTemp()Ljava/lang/String;

    move-result-object v2

    .line 418
    .local v2, StringGetWifiTemp:Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tcpu="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getCpuTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " limit="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getThermalLimitCpuOpp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    .line 419
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tbat="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getBattTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Tpa="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getPaTemp()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " Twifi="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    .line 420
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Tx="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Kbps"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    goto/16 :goto_17

    .line 423
    .end local v0           #StringGetTxBytes:Ljava/lang/String;
    .end local v1           #StringGetWiFiTxUsage:Ljava/lang/String;
    .end local v2           #StringGetWifiTemp:Ljava/lang/String;
    :cond_164
    const/16 v3, 0x63

    iget v4, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorMode:I

    if-ne v3, v4, :cond_17

    iget v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorMode:I

    if-ne v5, v3, :cond_17

    .line 424
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getmmcqd1()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalText:Ljava/lang/String;

    .line 425
    invoke-virtual {p0}, Lcom/android/systemui/LoadAverageService$LoadView;->getmmcqd2()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextExtra:Ljava/lang/String;

    .line 426
    const-string v3, ""

    iput-object v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalTextLineThree:Ljava/lang/String;

    .line 427
    iget v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mStorageIndicatorDelay:I

    iput v3, p0, Lcom/android/systemui/LoadAverageService$LoadView;->mThermalIndicatorDelay:I

    goto/16 :goto_17
.end method
