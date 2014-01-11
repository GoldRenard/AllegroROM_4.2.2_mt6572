.class public Lcom/mediatek/FMRadio/FMRadioUtils;
.super Ljava/lang/Object;
.source "FMRadioUtils.java"


# static fields
.field public static final CONVERT_RATE:I = 0xa

.field public static final DEFAULT_STATION:I = 0x3e8

#the value of this static final field might be set in the static constructor
.field public static final DEFAULT_STATION_FLOAT:F = 0.0f

.field public static final HIGHEST_STATION:I = 0x438

.field public static final LOWEST_STATION:I = 0x36b

.field public static final STEP:I = 0x1

.field private static final TAG:Ljava/lang/String; = "FmRx/Utils"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 62
    const/16 v0, 0x3e8

    invoke-static {v0}, Lcom/mediatek/FMRadio/FMRadioUtils;->computeFrequency(I)F

    move-result v0

    sput v0, Lcom/mediatek/FMRadio/FMRadioUtils;->DEFAULT_STATION_FLOAT:F

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 48
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeDecreaseStation(I)I
    .locals 2
    .parameter "station"

    .prologue
    .line 103
    add-int/lit8 v0, p0, -0x1

    .line 104
    .local v0, result:I
    const/16 v1, 0x36b

    if-ge v0, v1, :cond_0

    .line 105
    const/16 v0, 0x438

    .line 107
    :cond_0
    return v0
.end method

.method public static computeFrequency(I)F
    .locals 2
    .parameter "station"

    .prologue
    .line 125
    int-to-float v0, p0

    const/high16 v1, 0x4120

    div-float/2addr v0, v1

    return v0
.end method

.method public static computeIncreaseStation(I)I
    .locals 2
    .parameter "station"

    .prologue
    .line 90
    add-int/lit8 v0, p0, 0x1

    .line 91
    .local v0, result:I
    const/16 v1, 0x438

    if-le v0, v1, :cond_0

    .line 92
    const/16 v0, 0x36b

    .line 94
    :cond_0
    return v0
.end method

.method public static computeStation(F)I
    .locals 1
    .parameter "frequency"

    .prologue
    .line 116
    const/high16 v0, 0x4120

    mul-float/2addr v0, p0

    float-to-int v0, v0

    return v0
.end method

.method public static formatStation(I)Ljava/lang/String;
    .locals 7
    .parameter "station"

    .prologue
    .line 134
    int-to-float v2, p0

    const/high16 v3, 0x4120

    div-float v0, v2, v3

    .line 135
    .local v0, frequency:F
    const/4 v1, 0x0

    .line 139
    .local v1, result:Ljava/lang/String;
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v3, "%.1f"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 141
    return-object v1
.end method

.method public static isValidStation(I)Z
    .locals 5
    .parameter "station"

    .prologue
    .line 73
    const/4 v1, 0x0

    .line 74
    .local v1, isValid:Z
    const/4 v0, 0x5

    .line 76
    .local v0, checkNumber:I
    const/16 v2, 0x36b

    if-lt p0, v2, :cond_0

    const/16 v2, 0x438

    if-gt p0, v2, :cond_0

    const/4 v1, 0x1

    .line 80
    :goto_0
    const-string v2, "FmRx/Utils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isValidStation: freq = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", valid = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mediatek/FMRadio/LogUtils;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    return v1

    .line 76
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method
