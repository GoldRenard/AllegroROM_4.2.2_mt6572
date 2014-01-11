.class public final Lcom/google/common/math/DoubleMath;
.super Ljava/lang/Object;
.source "DoubleMath.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/math/DoubleMath$1;
    }
.end annotation


# static fields
.field static final EVERY_SIXTEENTH_FACTORIAL:[D = null
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

#the value of this static final field might be set in the static constructor
.field private static final LN_2:D = 0.0

.field static final MAX_FACTORIAL:I = 0xaa
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field

.field private static final MAX_INT_AS_DOUBLE:D = 2.147483647E9

.field private static final MAX_LONG_AS_DOUBLE_PLUS_ONE:D = 9.223372036854776E18

.field private static final MIN_INT_AS_DOUBLE:D = -2.147483648E9

.field private static final MIN_LONG_AS_DOUBLE:D = -9.223372036854776E18


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 199
    const-wide/high16 v0, 0x4000

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sput-wide v0, Lcom/google/common/math/DoubleMath;->LN_2:D

    .line 290
    const/16 v0, 0xb

    new-array v0, v0, [D

    fill-array-data v0, :array_0

    sput-object v0, Lcom/google/common/math/DoubleMath;->EVERY_SIXTEENTH_FACTORIAL:[D

    return-void

    :array_0
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0xf0t 0x3ft
        0x0t 0x0t 0x80t 0x75t 0x77t 0x7t 0xb3t 0x42t
        0xa4t 0x33t 0xaet 0xat 0xadt 0x56t 0x49t 0x47t
        0xb6t 0x2ct 0xd7t 0x78t 0x9at 0xe6t 0x9et 0x4ct
        0x4at 0x84t 0x34t 0xeet 0x78t 0xe4t 0x6ft 0x52t
        0xfft 0xabt 0xedt 0x94t 0x90t 0x61t 0x9ct 0x58t
        0x47t 0x63t 0xbdt 0xd7t 0x8dt 0x63t 0x13t 0x5ft
        0x3t 0xe5t 0xcft 0x97t 0xc1t 0xcat 0xc7t 0x65t
        0xe5t 0xe1t 0x40t 0xc1t 0xdft 0xe5t 0xb1t 0x6ct
        0x7et 0x70t 0xdbt 0xfat 0x85t 0xcet 0xc8t 0x73t
        0xdet 0x8et 0x92t 0x3dt 0x5ft 0x5dt 0x9t 0x7bt
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 93
    return-void
.end method

.method public static factorial(I)D
    .locals 5
    .parameter "n"

    .prologue
    .line 272
    const-string v3, "n"

    invoke-static {v3, p0}, Lcom/google/common/math/MathPreconditions;->checkNonNegative(Ljava/lang/String;I)I

    .line 273
    const/16 v3, 0xaa

    if-le p0, v3, :cond_0

    .line 274
    const-wide/high16 v3, 0x7ff0

    .line 282
    :goto_0
    return-wide v3

    .line 278
    :cond_0
    const-wide/high16 v0, 0x3ff0

    .line 279
    .local v0, accum:D
    and-int/lit8 v3, p0, -0x10

    add-int/lit8 v2, v3, 0x1

    .local v2, i:I
    :goto_1
    if-gt v2, p0, :cond_1

    .line 280
    int-to-double v3, v2

    mul-double/2addr v0, v3

    .line 279
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 282
    :cond_1
    sget-object v3, Lcom/google/common/math/DoubleMath;->EVERY_SIXTEENTH_FACTORIAL:[D

    shr-int/lit8 v4, p0, 0x4

    aget-wide v3, v3, v4

    mul-double/2addr v3, v0

    goto :goto_0
.end method

.method public static isMathematicalInteger(D)Z
    .locals 2
    .parameter "x"

    .prologue
    .line 257
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getSignificand(D)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v0

    rsub-int/lit8 v0, v0, 0x34

    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getExponent(D)I

    move-result v1

    if-gt v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPowerOfTwo(D)Z
    .locals 2
    .parameter "x"

    .prologue
    .line 177
    const-wide/16 v0, 0x0

    cmpl-double v0, p0, v0

    if-lez v0, :cond_0

    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getSignificand(D)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/math/LongMath;->isPowerOfTwo(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static log2(D)D
    .locals 4
    .parameter "x"

    .prologue
    .line 196
    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    sget-wide v2, Lcom/google/common/math/DoubleMath;->LN_2:D

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public static log2(DLjava/math/RoundingMode;)I
    .locals 11
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 212
    const-wide/16 v7, 0x0

    cmpl-double v4, p0, v7

    if-lez v4, :cond_1

    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v4

    if-eqz v4, :cond_1

    move v4, v5

    :goto_0
    const-string v7, "x must be positive and finite"

    invoke-static {v4, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 213
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getExponent(D)I

    move-result v0

    .line 214
    .local v0, exponent:I
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isNormal(D)Z

    move-result v4

    if-nez v4, :cond_2

    .line 215
    const-wide/high16 v4, 0x4330

    mul-double/2addr v4, p0

    invoke-static {v4, v5, p2}, Lcom/google/common/math/DoubleMath;->log2(DLjava/math/RoundingMode;)I

    move-result v4

    add-int/lit8 v0, v4, -0x34

    .line 247
    .end local v0           #exponent:I
    :cond_0
    :goto_1
    return v0

    :cond_1
    move v4, v6

    .line 212
    goto :goto_0

    .line 220
    .restart local v0       #exponent:I
    :cond_2
    sget-object v4, Lcom/google/common/math/DoubleMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v7

    aget v4, v4, v7

    packed-switch v4, :pswitch_data_0

    .line 245
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 222
    :pswitch_0
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isPowerOfTwo(D)Z

    move-result v4

    invoke-static {v4}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 225
    :pswitch_1
    const/4 v1, 0x0

    .line 247
    .local v1, increment:Z
    :goto_2
    if-eqz v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 228
    .end local v1           #increment:Z
    :pswitch_2
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isPowerOfTwo(D)Z

    move-result v4

    if-nez v4, :cond_3

    move v1, v5

    .line 229
    .restart local v1       #increment:Z
    :goto_3
    goto :goto_2

    .end local v1           #increment:Z
    :cond_3
    move v1, v6

    .line 228
    goto :goto_3

    .line 231
    :pswitch_3
    if-gez v0, :cond_4

    move v4, v5

    :goto_4
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isPowerOfTwo(D)Z

    move-result v7

    if-nez v7, :cond_5

    :goto_5
    and-int v1, v4, v5

    .line 232
    .restart local v1       #increment:Z
    goto :goto_2

    .end local v1           #increment:Z
    :cond_4
    move v4, v6

    .line 231
    goto :goto_4

    :cond_5
    move v5, v6

    goto :goto_5

    .line 234
    :pswitch_4
    if-ltz v0, :cond_6

    move v4, v5

    :goto_6
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isPowerOfTwo(D)Z

    move-result v7

    if-nez v7, :cond_7

    :goto_7
    and-int v1, v4, v5

    .line 235
    .restart local v1       #increment:Z
    goto :goto_2

    .end local v1           #increment:Z
    :cond_6
    move v4, v6

    .line 234
    goto :goto_6

    :cond_7
    move v5, v6

    goto :goto_7

    .line 239
    :pswitch_5
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->scaleNormalize(D)D

    move-result-wide v2

    .line 242
    .local v2, xScaled:D
    mul-double v7, v2, v2

    const-wide/high16 v9, 0x4000

    cmpl-double v4, v7, v9

    if-lez v4, :cond_8

    move v1, v5

    .line 243
    .restart local v1       #increment:Z
    :goto_8
    goto :goto_2

    .end local v1           #increment:Z
    :cond_8
    move v1, v6

    .line 242
    goto :goto_8

    .line 220
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method static roundIntermediate(DLjava/math/RoundingMode;)D
    .locals 8
    .parameter "x"
    .parameter "mode"

    .prologue
    const-wide/high16 v6, 0x3fe0

    const-wide/16 v4, 0x0

    .line 51
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v2

    if-nez v2, :cond_0

    .line 52
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "input is infinite or NaN"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 54
    :cond_0
    sget-object v2, Lcom/google/common/math/DoubleMath$1;->$SwitchMap$java$math$RoundingMode:[I

    invoke-virtual {p2}, Ljava/math/RoundingMode;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 93
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 56
    :pswitch_0
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isMathematicalInteger(D)Z

    move-result v2

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkRoundingUnnecessary(Z)V

    .line 89
    .end local p0
    :cond_1
    :goto_0
    :pswitch_1
    return-wide p0

    .line 60
    .restart local p0
    :pswitch_2
    cmpl-double v2, p0, v4

    if-gez v2, :cond_1

    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide p0

    goto :goto_0

    .line 63
    :pswitch_3
    cmpl-double v2, p0, v4

    if-ltz v2, :cond_1

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p0

    goto :goto_0

    .line 69
    :pswitch_4
    cmpl-double v2, p0, v4

    if-ltz v2, :cond_2

    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    :goto_1
    move-wide p0, v2

    goto :goto_0

    :cond_2
    invoke-static {p0, p1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    goto :goto_1

    .line 72
    :pswitch_5
    invoke-static {p0, p1}, Ljava/lang/Math;->rint(D)D

    move-result-wide p0

    goto :goto_0

    .line 75
    :pswitch_6
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isMathematicalInteger(D)Z

    move-result v2

    if-nez v2, :cond_1

    .line 78
    cmpl-double v2, p0, v4

    if-ltz v2, :cond_3

    add-double v2, p0, v6

    :goto_2
    move-wide p0, v2

    goto :goto_0

    :cond_3
    sub-double v2, p0, v6

    goto :goto_2

    .line 82
    :pswitch_7
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleMath;->isMathematicalInteger(D)Z

    move-result v2

    if-nez v2, :cond_1

    .line 84
    cmpl-double v2, p0, v4

    if-ltz v2, :cond_4

    .line 85
    add-double v0, p0, v6

    .line 86
    .local v0, z:D
    cmpl-double v2, v0, p0

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/google/common/math/DoubleUtils;->next(DZ)D

    move-result-wide p0

    goto :goto_0

    .line 88
    .end local v0           #z:D
    :cond_4
    sub-double v0, p0, v6

    .line 89
    .restart local v0       #z:D
    cmpl-double v2, v0, p0

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/google/common/math/DoubleUtils;->next(DZ)D

    move-result-wide p0

    goto :goto_0

    .line 54
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public static roundToBigInteger(DLjava/math/RoundingMode;)Ljava/math/BigInteger;
    .locals 10
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 159
    invoke-static {p0, p1, p2}, Lcom/google/common/math/DoubleMath;->roundIntermediate(DLjava/math/RoundingMode;)D

    move-result-wide p0

    .line 160
    const-wide/high16 v6, -0x3c20

    sub-double/2addr v6, p0

    const-wide/high16 v8, 0x3ff0

    cmpg-double v6, v6, v8

    if-gez v6, :cond_1

    move v6, v4

    :goto_0
    const-wide/high16 v7, 0x43e0

    cmpg-double v7, p0, v7

    if-gez v7, :cond_2

    :goto_1
    and-int/2addr v4, v6

    if-eqz v4, :cond_3

    .line 161
    double-to-long v4, p0

    invoke-static {v4, v5}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    .line 169
    :cond_0
    :goto_2
    return-object v1

    :cond_1
    move v6, v5

    .line 160
    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1

    .line 163
    :cond_3
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getExponent(D)I

    move-result v0

    .line 164
    .local v0, exponent:I
    if-gez v0, :cond_4

    .line 165
    sget-object v1, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    goto :goto_2

    .line 167
    :cond_4
    invoke-static {p0, p1}, Lcom/google/common/math/DoubleUtils;->getSignificand(D)J

    move-result-wide v2

    .line 168
    .local v2, significand:J
    invoke-static {v2, v3}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v4

    add-int/lit8 v5, v0, -0x34

    invoke-virtual {v4, v5}, Ljava/math/BigInteger;->shiftLeft(I)Ljava/math/BigInteger;

    move-result-object v1

    .line 169
    .local v1, result:Ljava/math/BigInteger;
    const-wide/16 v4, 0x0

    cmpg-double v4, p0, v4

    if-gez v4, :cond_0

    invoke-virtual {v1}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_2
.end method

.method public static roundToInt(DLjava/math/RoundingMode;)I
    .locals 7
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 112
    invoke-static {p0, p1, p2}, Lcom/google/common/math/DoubleMath;->roundIntermediate(DLjava/math/RoundingMode;)D

    move-result-wide v0

    .line 113
    .local v0, z:D
    const-wide v4, -0x3e1fffffffe00000L

    cmpl-double v4, v0, v4

    if-lez v4, :cond_0

    move v4, v2

    :goto_0
    const-wide/high16 v5, 0x41e0

    cmpg-double v5, v0, v5

    if-gez v5, :cond_1

    :goto_1
    and-int/2addr v2, v4

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkInRange(Z)V

    .line 114
    double-to-int v2, v0

    return v2

    :cond_0
    move v4, v3

    .line 113
    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method

.method public static roundToLong(DLjava/math/RoundingMode;)J
    .locals 8
    .parameter "x"
    .parameter "mode"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 135
    invoke-static {p0, p1, p2}, Lcom/google/common/math/DoubleMath;->roundIntermediate(DLjava/math/RoundingMode;)D

    move-result-wide v0

    .line 136
    .local v0, z:D
    const-wide/high16 v4, -0x3c20

    sub-double/2addr v4, v0

    const-wide/high16 v6, 0x3ff0

    cmpg-double v4, v4, v6

    if-gez v4, :cond_0

    move v4, v2

    :goto_0
    const-wide/high16 v5, 0x43e0

    cmpg-double v5, v0, v5

    if-gez v5, :cond_1

    :goto_1
    and-int/2addr v2, v4

    invoke-static {v2}, Lcom/google/common/math/MathPreconditions;->checkInRange(Z)V

    .line 137
    double-to-long v2, v0

    return-wide v2

    :cond_0
    move v4, v3

    .line 136
    goto :goto_0

    :cond_1
    move v2, v3

    goto :goto_1
.end method
